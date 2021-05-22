//
//  ManagedFeedCache.swift
//  FeedStoreChallenge
//
//  Created by Hitender Kumar on 22/05/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(ManagedFeedCache)
internal class ManagedFeedCache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var feed: NSOrderedSet
}

extension ManagedFeedCache {
	internal static func find(in context: NSManagedObjectContext) throws -> ManagedFeedCache? {
		let request = NSFetchRequest<ManagedFeedCache>(entityName: entity().name!)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	internal static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedFeedCache {
		try find(in: context).map(context.delete)
		return ManagedFeedCache(context: context)
	}

	internal var localFeed: [LocalFeedImage] {
		return feed.compactMap { ($0 as? ManagedFeedImage)?.local }
	}
}
