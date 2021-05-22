//
//  ManagedFeedCache.swift
//  FeedStoreChallenge
//
//  Created by Hitender Kumar on 22/05/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(FeedCache)
internal class ManagedFeedCache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var feed: NSOrderedSet
}
