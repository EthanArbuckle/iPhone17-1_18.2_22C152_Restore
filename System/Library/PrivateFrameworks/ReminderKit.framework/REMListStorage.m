@interface REMListStorage
+ (BOOL)_forceDisableFullRemindersSorting;
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:(id)a3 error:(id *)a4;
+ (id)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:(id)a3 error:(id *)a4;
+ (void)set_forceDisableFullRemindersSorting:(BOOL)a3;
- (BOOL)daIsEventOnlyContainer;
- (BOOL)daIsImmutable;
- (BOOL)daIsNotificationsCollection;
- (BOOL)daIsReadOnly;
- (BOOL)hasDeserializedReminderIDsMergeableOrdering;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isPlaceholder;
- (BOOL)isUnsupported;
- (BOOL)remindersICSDisplayOrderChanged;
- (BOOL)shouldCategorizeGroceryItems;
- (BOOL)shouldSuggestConversionToGroceryList;
- (BOOL)shouldUpdateSectionsOrdering;
- (BOOL)showingLargeAttachments;
- (NSArray)calDAVNotifications;
- (NSArray)sharees;
- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems;
- (NSArray)unsavedSectionIDsOrdering;
- (NSData)reminderIDsMergeableOrderingData;
- (NSData)resolutionTokenMapData;
- (NSDate)lastUserAccessDate;
- (NSDate)pinnedDate;
- (NSDictionary)daBulkRequests;
- (NSDictionary)reminderIDsOrderingHints;
- (NSOrderedSet)reminderIDsMergeableOrdering;
- (NSSet)childListIDsToUndelete;
- (NSSet)childSmartListIDsToUndelete;
- (NSSet)reminderIDsToUndelete;
- (NSSet)sectionIDsToUndelete;
- (NSString)badgeEmblem;
- (NSString)currentUserShareParticipantID;
- (NSString)daExternalIdentificationTag;
- (NSString)daPushKey;
- (NSString)daSyncToken;
- (NSString)displayName;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)groceryLocaleID;
- (NSString)name;
- (NSString)sharedOwnerAddress;
- (NSString)sharedOwnerName;
- (NSString)sortingStyle;
- (NSUUID)mostRecentTargetTemplateIdentifier;
- (REMColor)color;
- (REMListStorage)initWithCoder:(id)a3;
- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5;
- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrdering:(id)a7;
- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrderingData:(id)a7;
- (REMMemberships)unsavedMembershipsOfRemindersInSections;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)parentAccountID;
- (REMObjectID)parentListID;
- (REMObjectID)sharedOwnerID;
- (REMObjectID)templateID;
- (REMResolutionTokenMap)resolutionTokenMap;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)ekColor;
- (id)optionalObjectID;
- (int64_t)daDisplayOrder;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (int64_t)sharingStatus;
- (unint64_t)hash;
- (unint64_t)storeGeneration;
- (void)encodeWithCoder:(id)a3;
- (void)reminderIDsMergeableOrdering;
- (void)resolutionTokenMap;
- (void)setAccountID:(id)a3;
- (void)setBadgeEmblem:(id)a3;
- (void)setCalDAVNotifications:(id)a3;
- (void)setChildListIDsToUndelete:(id)a3;
- (void)setChildSmartListIDsToUndelete:(id)a3;
- (void)setColor:(id)a3;
- (void)setCurrentUserShareParticipantID:(id)a3;
- (void)setDaBulkRequests:(id)a3;
- (void)setDaDisplayOrder:(int64_t)a3;
- (void)setDaExternalIdentificationTag:(id)a3;
- (void)setDaIsEventOnlyContainer:(BOOL)a3;
- (void)setDaIsImmutable:(BOOL)a3;
- (void)setDaIsNotificationsCollection:(BOOL)a3;
- (void)setDaIsReadOnly:(BOOL)a3;
- (void)setDaPushKey:(id)a3;
- (void)setDaSyncToken:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setGroceryLocaleID:(id)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setLastUserAccessDate:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setMostRecentTargetTemplateIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setParentAccountID:(id)a3;
- (void)setParentListID:(id)a3;
- (void)setPinnedDate:(id)a3;
- (void)setReminderIDsMergeableOrdering:(id)a3;
- (void)setReminderIDsMergeableOrderingData:(id)a3;
- (void)setReminderIDsOrderingHints:(id)a3;
- (void)setReminderIDsToUndelete:(id)a3;
- (void)setRemindersICSDisplayOrderChanged:(BOOL)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setSectionIDsToUndelete:(id)a3;
- (void)setSharedOwnerAddress:(id)a3;
- (void)setSharedOwnerID:(id)a3;
- (void)setSharedOwnerName:(id)a3;
- (void)setSharees:(id)a3;
- (void)setSharingStatus:(int64_t)a3;
- (void)setShouldCategorizeGroceryItems:(BOOL)a3;
- (void)setShouldSuggestConversionToGroceryList:(BOOL)a3;
- (void)setShouldUpdateSectionsOrdering:(BOOL)a3;
- (void)setShowingLargeAttachments:(BOOL)a3;
- (void)setSortingStyle:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
- (void)setTemplateID:(id)a3;
- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3;
- (void)setUnsavedReminderIDsToCategorizeAsGroceryItems:(id)a3;
- (void)setUnsavedSectionIDsOrdering:(id)a3;
@end

@implementation REMListStorage

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (void)setShouldSuggestConversionToGroceryList:(BOOL)a3
{
  self->_shouldSuggestConversionToGroceryList = a3;
}

- (void)setShouldCategorizeGroceryItems:(BOOL)a3
{
  self->_shouldCategorizeGroceryItems = a3;
}

- (void)setUnsavedReminderIDsToCategorizeAsGroceryItems:(id)a3
{
}

- (void)setResolutionTokenMapData:(id)a3
{
}

- (void)setResolutionTokenMap:(id)a3
{
}

- (void)setParentListID:(id)a3
{
}

- (void)setParentAccountID:(id)a3
{
}

- (void)setGroceryLocaleID:(id)a3
{
}

- (void)setColor:(id)a3
{
}

- (void)setBadgeEmblem:(id)a3
{
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration) {
    self->_storeGeneration = a3;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMListStorage *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  v6 = [(REMListStorage *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage isGroup](self, "isGroup"), @"isGroup");
  v7 = [(REMListStorage *)self externalIdentifier];
  [v4 encodeObject:v7 forKey:@"externalIdentifier"];

  v8 = [(REMListStorage *)self externalModificationTag];
  [v4 encodeObject:v8 forKey:@"externalModificationTag"];

  v9 = [(REMListStorage *)self daSyncToken];
  [v4 encodeObject:v9 forKey:@"daSyncToken"];

  v10 = [(REMListStorage *)self daPushKey];
  [v4 encodeObject:v10 forKey:@"daPushKey"];

  v11 = [(REMListStorage *)self daExternalIdentificationTag];
  [v4 encodeObject:v11 forKey:@"daExternalIdentificationTag"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage daDisplayOrder](self, "daDisplayOrder"), @"daDisplayOrder");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsEventOnlyContainer](self, "daIsEventOnlyContainer"), @"daIsEventOnlyContainer");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsReadOnly](self, "daIsReadOnly"), @"daIsReadOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsImmutable](self, "daIsImmutable"), @"daIsImmutable");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage daIsNotificationsCollection](self, "daIsNotificationsCollection"), @"daIsNotificationsCollection");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage minimumSupportedVersion](self, "minimumSupportedVersion"), @"minimumSupportedVersion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), @"effectiveMinimumSupportedVersion");
  v12 = [(REMListStorage *)self lastUserAccessDate];
  [v4 encodeObject:v12 forKey:@"lastUserAccessDate"];

  v13 = [(REMListStorage *)self name];
  [v4 encodeObject:v13 forKey:@"name"];

  v14 = [(REMListStorage *)self color];
  [v4 encodeObject:v14 forKey:@"color"];

  v15 = [(REMListStorage *)self badgeEmblem];
  [v4 encodeObject:v15 forKey:@"badgeEmblem"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldCategorizeGroceryItems](self, "shouldCategorizeGroceryItems"), @"shouldCategorizeGroceryItems");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldSuggestConversionToGroceryList](self, "shouldSuggestConversionToGroceryList"), @"shouldSuggestConversionToGroceryList");
  v16 = [(REMListStorage *)self groceryLocaleID];
  [v4 encodeObject:v16 forKey:@"groceryLocaleID"];

  v17 = [(REMListStorage *)self unsavedReminderIDsToCategorizeAsGroceryItems];
  [v4 encodeObject:v17 forKey:@"unsavedReminderIDsToCategorizeAsGroceryItems"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage showingLargeAttachments](self, "showingLargeAttachments"), @"showingLargeAttachments");
  v18 = [(REMListStorage *)self parentAccountID];
  [v4 encodeObject:v18 forKey:@"parentAccountID"];

  v19 = [(REMListStorage *)self parentListID];
  [v4 encodeObject:v19 forKey:@"parentListID"];

  reminderIDsMergeableOrdering = self->_reminderIDsMergeableOrdering;
  if (reminderIDsMergeableOrdering)
  {
    v21 = [(NSOrderedSet *)reminderIDsMergeableOrdering array];
    [v4 encodeObject:v21 forKey:@"reminderIDsMergeableOrdering"];

    [v4 encodeObject:0 forKey:@"reminderIDsMergeableOrderingData"];
  }
  else
  {
    v22 = [(REMListStorage *)self reminderIDsMergeableOrderingData];

    if (!v22)
    {
      v51 = +[REMLogStore read];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        -[REMListStorage encodeWithCoder:](self, v51);
      }
    }
    [v4 encodeObject:0 forKey:@"reminderIDsMergeableOrdering"];
    v23 = [(REMListStorage *)self reminderIDsMergeableOrderingData];
    [v4 encodeObject:v23 forKey:@"reminderIDsMergeableOrderingData"];
  }
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v4 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v4 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v4 encodeObject:0 forKey:@"resolutionTokenMap"];
    v25 = [(REMListStorage *)self resolutionTokenMapData];
    [v4 encodeObject:v25 forKey:@"resolutionTokenMapData"];
  }
  v26 = [(REMListStorage *)self reminderIDsOrderingHints];
  [v4 encodeObject:v26 forKey:@"reminderIDsOrderingHints"];

  v27 = [(REMListStorage *)self reminderIDsToUndelete];
  v28 = [v27 allObjects];
  [v4 encodeObject:v28 forKey:@"reminderIDsToUndelete"];

  v29 = [(REMListStorage *)self childListIDsToUndelete];
  v30 = [v29 allObjects];
  [v4 encodeObject:v30 forKey:@"childListIDsToUndelete"];

  v31 = [(REMListStorage *)self childSmartListIDsToUndelete];
  v32 = [v31 allObjects];
  [v4 encodeObject:v32 forKey:@"childSmartListIDsToUndelete"];

  v33 = [(REMListStorage *)self sectionIDsToUndelete];
  v34 = [v33 allObjects];
  [v4 encodeObject:v34 forKey:@"sectionIDsToUndelete"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage remindersICSDisplayOrderChanged](self, "remindersICSDisplayOrderChanged"), @"remindersICSDisplayOrderChanged");
  v35 = [(REMListStorage *)self templateID];
  [v4 encodeObject:v35 forKey:@"templateID"];

  v36 = [(REMListStorage *)self sharedOwnerName];
  [v4 encodeObject:v36 forKey:@"sharedOwnerName"];

  v37 = [(REMListStorage *)self sharedOwnerAddress];
  [v4 encodeObject:v37 forKey:@"sharedOwnerAddress"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListStorage sharingStatus](self, "sharingStatus"), @"sharingStatus");
  v38 = [(REMListStorage *)self sharees];
  [v4 encodeObject:v38 forKey:@"sharees"];

  v39 = [(REMListStorage *)self sharedOwnerID];
  [v4 encodeObject:v39 forKey:@"sharedOwnerID"];

  v40 = [(REMListStorage *)self calDAVNotifications];
  [v4 encodeObject:v40 forKey:@"calDAVNotifications"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage isPlaceholder](self, "isPlaceholder"), @"isPlaceholder");
  v41 = [(REMListStorage *)self currentUserShareParticipantID];
  [v4 encodeObject:v41 forKey:@"currentUserShareParticipantID"];

  v42 = [(REMListStorage *)self sortingStyle];
  [v4 encodeObject:v42 forKey:@"sortingStyle"];

  v43 = [(REMListStorage *)self pinnedDate];
  [v4 encodeObject:v43 forKey:@"pinnedDate"];

  v44 = [(REMListStorage *)self mostRecentTargetTemplateIdentifier];
  [v4 encodeObject:v44 forKey:@"mostRecentTargetTemplateIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), @"shouldUpdateSectionsOrdering");
  v45 = [(REMListStorage *)self unsavedSectionIDsOrdering];
  [v4 encodeObject:v45 forKey:@"unsavedSectionIDsOrdering"];

  v46 = [(REMListStorage *)self unsavedMembershipsOfRemindersInSections];
  [v4 encodeObject:v46 forKey:@"unsavedMembershipsOfRemindersInSections"];

  v47 = [(REMListStorage *)self daBulkRequests];

  if (v47)
  {
    v48 = (void *)MEMORY[0x1E4F28F98];
    v49 = [(REMListStorage *)self daBulkRequests];
    v50 = [v48 dataWithPropertyList:v49 format:100 options:0 error:0];
  }
  else
  {
    v50 = 0;
  }
  [v4 encodeObject:v50 forKey:@"daBulkRequests"];
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (NSData)reminderIDsMergeableOrderingData
{
  return self->_reminderIDsMergeableOrderingData;
}

- (int64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (NSArray)sharees
{
  return self->_sharees;
}

- (NSDate)pinnedDate
{
  return self->_pinnedDate;
}

- (BOOL)shouldCategorizeGroceryItems
{
  return self->_shouldCategorizeGroceryItems;
}

- (REMObjectID)sharedOwnerID
{
  return self->_sharedOwnerID;
}

- (REMColor)color
{
  return self->_color;
}

- (NSString)badgeEmblem
{
  return self->_badgeEmblem;
}

- (NSArray)unsavedSectionIDsOrdering
{
  return self->_unsavedSectionIDsOrdering;
}

- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems
{
  return self->_unsavedReminderIDsToCategorizeAsGroceryItems;
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  return self->_unsavedMembershipsOfRemindersInSections;
}

- (REMObjectID)templateID
{
  return self->_templateID;
}

- (NSString)sortingStyle
{
  return self->sortingStyle;
}

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (BOOL)shouldUpdateSectionsOrdering
{
  return self->_shouldUpdateSectionsOrdering;
}

- (BOOL)shouldSuggestConversionToGroceryList
{
  return self->_shouldSuggestConversionToGroceryList;
}

- (NSString)sharedOwnerName
{
  return self->_sharedOwnerName;
}

- (NSString)sharedOwnerAddress
{
  return self->_sharedOwnerAddress;
}

- (NSSet)sectionIDsToUndelete
{
  return self->_sectionIDsToUndelete;
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (BOOL)remindersICSDisplayOrderChanged
{
  return self->_remindersICSDisplayOrderChanged;
}

- (NSSet)reminderIDsToUndelete
{
  return self->_reminderIDsToUndelete;
}

- (NSDictionary)reminderIDsOrderingHints
{
  return self->_reminderIDsOrderingHints;
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (NSUUID)mostRecentTargetTemplateIdentifier
{
  return self->_mostRecentTargetTemplateIdentifier;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (NSDate)lastUserAccessDate
{
  return self->_lastUserAccessDate;
}

- (NSString)groceryLocaleID
{
  return self->_groceryLocaleID;
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (BOOL)daIsReadOnly
{
  return self->_daIsReadOnly;
}

- (BOOL)daIsNotificationsCollection
{
  return self->_daIsNotificationsCollection;
}

- (BOOL)daIsImmutable
{
  return self->_daIsImmutable;
}

- (BOOL)daIsEventOnlyContainer
{
  return self->_daIsEventOnlyContainer;
}

- (NSString)daExternalIdentificationTag
{
  return self->_daExternalIdentificationTag;
}

- (int64_t)daDisplayOrder
{
  return self->_daDisplayOrder;
}

- (NSDictionary)daBulkRequests
{
  return self->_daBulkRequests;
}

- (NSString)currentUserShareParticipantID
{
  return self->_currentUserShareParticipantID;
}

- (NSSet)childSmartListIDsToUndelete
{
  return self->_childSmartListIDsToUndelete;
}

- (NSSet)childListIDsToUndelete
{
  return self->_childListIDsToUndelete;
}

- (NSArray)calDAVNotifications
{
  return self->_calDAVNotifications;
}

- (NSString)displayName
{
  v3 = [(REMListStorage *)self name];
  id v4 = +[REMDisplayNameUtils displayNameFromListName:v3 isPlaceholder:[(REMListStorage *)self isPlaceholder]];

  return (NSString *)v4;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setReminderIDsMergeableOrdering:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrdering, a3);
  if (v6)
  {
    reminderIDsMergeableOrderingData = self->_reminderIDsMergeableOrderingData;
    self->_reminderIDsMergeableOrderingData = 0;
  }
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  id v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDList";
}

- (REMListStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  v118 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isGroup"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v117 = [v4 decodeObjectOfClasses:v10 forKey:@"reminderIDsToUndelete"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = v12;
  v15 = (void *)v5;
  v16 = objc_msgSend(v11, "setWithObjects:", v14, v13, 0);
  v116 = [v4 decodeObjectOfClasses:v16 forKey:@"childListIDsToUndelete"];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = v18;
  v21 = (void *)v6;
  v22 = objc_msgSend(v17, "setWithObjects:", v20, v19, 0);
  v115 = [v4 decodeObjectOfClasses:v22 forKey:@"childSmartListIDsToUndelete"];

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  v26 = [v4 decodeObjectOfClasses:v25 forKey:@"sectionIDsToUndelete"];

  if (v15 && v21)
  {
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderIDsMergeableOrderingData"];
    v28 = [(REMListStorage *)self initWithObjectID:v15 accountID:v118 name:v21 isGroup:v7 reminderIDsMergeableOrderingData:v27];
    if (v28)
    {
      v112 = v27;
      v29 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = objc_opt_class();
      v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"reminderIDsMergeableOrdering"];

      if (v32)
      {
        uint64_t v33 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v32];
        reminderIDsMergeableOrdering = v28->_reminderIDsMergeableOrdering;
        v28->_reminderIDsMergeableOrdering = (NSOrderedSet *)v33;

        uint64_t v35 = 208;
      }
      else
      {
        uint64_t v35 = 8;
      }
      v111 = (void *)v32;
      v38 = *(Class *)((char *)&v28->super.isa + v35);
      *(Class *)((char *)&v28->super.isa + v35) = 0;

      v113 = v26;
      if (!v28->_reminderIDsMergeableOrdering && !v28->_reminderIDsMergeableOrderingData)
      {
        v107 = +[REMLogStore read];
        if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT)) {
          -[REMListStorage initWithCoder:]();
        }
      }
      uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
      color = v28->_color;
      v28->_color = (REMColor *)v39;

      uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badgeEmblem"];
      badgeEmblem = v28->_badgeEmblem;
      v28->_badgeEmblem = (NSString *)v41;

      v28->_shouldCategorizeGroceryItems = [v4 decodeBoolForKey:@"shouldCategorizeGroceryItems"];
      v28->_shouldSuggestConversionToGroceryList = [v4 decodeBoolForKey:@"shouldSuggestConversionToGroceryList"];
      uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groceryLocaleID"];
      groceryLocaleID = v28->_groceryLocaleID;
      v28->_groceryLocaleID = (NSString *)v43;

      v45 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v46 = objc_opt_class();
      v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
      v48 = [v4 decodeObjectOfClasses:v47 forKey:@"unsavedReminderIDsToCategorizeAsGroceryItems"];

      v110 = v48;
      objc_storeStrong((id *)&v28->_unsavedReminderIDsToCategorizeAsGroceryItems, v48);
      v28->_showingLargeAttachments = [v4 decodeBoolForKey:@"showingLargeAttachments"];
      uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentAccountID"];
      parentAccountID = v28->_parentAccountID;
      v28->_parentAccountID = (REMObjectID *)v49;

      uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentListID"];
      parentListID = v28->_parentListID;
      v28->_parentListID = (REMObjectID *)v51;

      v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
      v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
      v114 = v15;
      v108 = v54;
      v109 = v53;
      if (v54)
      {
        objc_storeStrong((id *)&v28->_resolutionTokenMap, v54);
        resolutionTokenMapData = v28->_resolutionTokenMapData;
        v28->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v28->_resolutionTokenMap;
        v28->_resolutionTokenMap = 0;

        v57 = v53;
        resolutionTokenMapData = v28->_resolutionTokenMapData;
        v28->_resolutionTokenMapData = v57;
      }

      v58 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v59 = objc_opt_class();
      uint64_t v60 = objc_opt_class();
      v61 = objc_msgSend(v58, "setWithObjects:", v59, v60, objc_opt_class(), 0);
      v62 = [v4 decodeObjectOfClasses:v61 forKey:@"reminderIDsOrderingHints"];
      v63 = v62;
      if (v62)
      {
        v64 = v62;
      }
      else
      {
        v64 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
      reminderIDsOrderingHints = v28->_reminderIDsOrderingHints;
      v28->_reminderIDsOrderingHints = v64;

      uint64_t v66 = [MEMORY[0x1E4F1CAD0] setWithArray:v117];
      reminderIDsToUndelete = v28->_reminderIDsToUndelete;
      v28->_reminderIDsToUndelete = (NSSet *)v66;

      uint64_t v68 = [MEMORY[0x1E4F1CAD0] setWithArray:v116];
      childListIDsToUndelete = v28->_childListIDsToUndelete;
      v28->_childListIDsToUndelete = (NSSet *)v68;

      uint64_t v70 = [MEMORY[0x1E4F1CAD0] setWithArray:v115];
      childSmartListIDsToUndelete = v28->_childSmartListIDsToUndelete;
      v28->_childSmartListIDsToUndelete = (NSSet *)v70;

      v26 = v113;
      uint64_t v72 = [MEMORY[0x1E4F1CAD0] setWithArray:v113];
      sectionIDsToUndelete = v28->_sectionIDsToUndelete;
      v28->_sectionIDsToUndelete = (NSSet *)v72;

      v28->_remindersICSDisplayOrderChanged = [v4 decodeBoolForKey:@"remindersICSDisplayOrderChanged"];
      v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
      [(REMListStorage *)v28 setExternalIdentifier:v74];

      v75 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
      [(REMListStorage *)v28 setExternalModificationTag:v75];

      v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daSyncToken"];
      [(REMListStorage *)v28 setDaSyncToken:v76];

      v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daPushKey"];
      [(REMListStorage *)v28 setDaPushKey:v77];

      v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daExternalIdentificationTag"];
      [(REMListStorage *)v28 setDaExternalIdentificationTag:v78];

      -[REMListStorage setDaDisplayOrder:](v28, "setDaDisplayOrder:", [v4 decodeIntegerForKey:@"daDisplayOrder"]);
      -[REMListStorage setDaIsEventOnlyContainer:](v28, "setDaIsEventOnlyContainer:", [v4 decodeBoolForKey:@"daIsEventOnlyContainer"]);
      -[REMListStorage setDaIsReadOnly:](v28, "setDaIsReadOnly:", [v4 decodeBoolForKey:@"daIsReadOnly"]);
      -[REMListStorage setDaIsImmutable:](v28, "setDaIsImmutable:", [v4 decodeBoolForKey:@"daIsImmutable"]);
      -[REMListStorage setDaIsNotificationsCollection:](v28, "setDaIsNotificationsCollection:", [v4 decodeBoolForKey:@"daIsNotificationsCollection"]);
      -[REMListStorage setMinimumSupportedVersion:](v28, "setMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"minimumSupportedVersion"]);
      -[REMListStorage setEffectiveMinimumSupportedVersion:](v28, "setEffectiveMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"effectiveMinimumSupportedVersion"]);
      v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUserAccessDate"];
      [(REMListStorage *)v28 setLastUserAccessDate:v79];

      v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateID"];
      [(REMListStorage *)v28 setTemplateID:v80];

      v81 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedOwnerName"];
      [(REMListStorage *)v28 setSharedOwnerName:v81];

      v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedOwnerAddress"];
      [(REMListStorage *)v28 setSharedOwnerAddress:v82];

      unint64_t v83 = [v4 decodeIntegerForKey:@"sharingStatus"];
      if (v83 >= 5)
      {
        v84 = os_log_create("com.apple.reminderkit", "default");
        if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
          -[REMListStorage initWithCoder:]();
        }

        unint64_t v83 = 0;
      }
      [(REMListStorage *)v28 setSharingStatus:v83];
      v85 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v86 = objc_opt_class();
      v87 = objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
      v88 = [v4 decodeObjectOfClasses:v87 forKey:@"sharees"];
      [(REMListStorage *)v28 setSharees:v88];

      v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedOwnerID"];
      [(REMListStorage *)v28 setSharedOwnerID:v89];

      v90 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v91 = objc_opt_class();
      v92 = objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
      v93 = [v4 decodeObjectOfClasses:v92 forKey:@"calDAVNotifications"];
      [(REMListStorage *)v28 setCalDAVNotifications:v93];

      -[REMListStorage setIsPlaceholder:](v28, "setIsPlaceholder:", [v4 decodeBoolForKey:@"isPlaceholder"]);
      v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentUserShareParticipantID"];
      [(REMListStorage *)v28 setCurrentUserShareParticipantID:v94];

      v95 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortingStyle"];
      [(REMListStorage *)v28 setSortingStyle:v95];

      v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedDate"];
      [(REMListStorage *)v28 setPinnedDate:v96];

      v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentTargetTemplateIdentifier"];
      [(REMListStorage *)v28 setMostRecentTargetTemplateIdentifier:v97];

      -[REMListStorage setShouldUpdateSectionsOrdering:](v28, "setShouldUpdateSectionsOrdering:", [v4 decodeBoolForKey:@"shouldUpdateSectionsOrdering"]);
      v98 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v99 = objc_opt_class();
      v100 = objc_msgSend(v98, "setWithObjects:", v99, objc_opt_class(), 0);
      v101 = [v4 decodeObjectOfClasses:v100 forKey:@"unsavedSectionIDsOrdering"];
      [(REMListStorage *)v28 setUnsavedSectionIDsOrdering:v101];

      v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unsavedMembershipsOfRemindersInSections"];
      [(REMListStorage *)v28 setUnsavedMembershipsOfRemindersInSections:v102];

      v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daBulkRequests"];
      if (v103)
      {
        uint64_t v104 = [MEMORY[0x1E4F28F98] propertyListWithData:v103 options:0 format:0 error:0];
        daBulkRequests = v28->_daBulkRequests;
        v28->_daBulkRequests = (NSDictionary *)v104;
      }
      v15 = v114;
      v27 = v112;
    }

    self = v28;
    v37 = self;
  }
  else
  {
    v36 = +[REMLogStore read];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[REMListStorage initWithCoder:]();
    }

    v37 = 0;
  }

  return v37;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  self->_shouldUpdateSectionsOrdering = a3;
}

- (void)setSharingStatus:(int64_t)a3
{
  self->_sharingStatus = a3;
}

- (void)setSharedOwnerName:(id)a3
{
}

- (void)setSharedOwnerID:(id)a3
{
}

- (void)setSharedOwnerAddress:(id)a3
{
}

- (void)setMostRecentTargetTemplateIdentifier:(id)a3
{
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (void)setLastUserAccessDate:(id)a3
{
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (void)setExternalIdentifier:(id)a3
{
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (void)setDaSyncToken:(id)a3
{
}

- (void)setDaIsReadOnly:(BOOL)a3
{
  self->_daIsReadOnly = a3;
}

- (void)setDaIsNotificationsCollection:(BOOL)a3
{
  self->_daIsNotificationsCollection = a3;
}

- (void)setDaIsImmutable:(BOOL)a3
{
  self->_daIsImmutable = a3;
}

- (void)setDaIsEventOnlyContainer:(BOOL)a3
{
  self->_daIsEventOnlyContainer = a3;
}

- (void)setDaExternalIdentificationTag:(id)a3
{
}

- (void)setDaDisplayOrder:(int64_t)a3
{
  self->_daDisplayOrder = a3;
}

- (void)setCurrentUserShareParticipantID:(id)a3
{
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrderingData:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)REMListStorage;
  v17 = [(REMListStorage *)&v42 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_objectID, a3);
    objc_storeStrong((id *)&v18->_accountID, a4);
    v18->_isGroup = a6;
    objc_storeStrong((id *)&v18->_name, a5);
    pinnedDate = v18->_pinnedDate;
    v18->_pinnedDate = 0;

    *(_WORD *)&v18->_shouldCategorizeGroceryItems = 0;
    groceryLocaleID = v18->_groceryLocaleID;
    v18->_groceryLocaleID = 0;

    unsavedReminderIDsToCategorizeAsGroceryItems = v18->_unsavedReminderIDsToCategorizeAsGroceryItems;
    v18->_unsavedReminderIDsToCategorizeAsGroceryItems = 0;

    mostRecentTargetTemplateIdentifier = v18->_mostRecentTargetTemplateIdentifier;
    v18->_mostRecentTargetTemplateIdentifier = 0;

    v18->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v18->_unsavedSectionIDsOrdering;
    v18->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v18->_unsavedMembershipsOfRemindersInSections;
    v18->_unsavedMembershipsOfRemindersInSections = 0;

    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionary];
    reminderIDsOrderingHints = v18->_reminderIDsOrderingHints;
    v18->_reminderIDsOrderingHints = (NSDictionary *)v25;

    if (v16)
    {
      v27 = (NSData *)v16;
    }
    else
    {
      v27 = [MEMORY[0x1E4F1C9B8] data];
    }
    reminderIDsMergeableOrderingData = v18->_reminderIDsMergeableOrderingData;
    v18->_reminderIDsMergeableOrderingData = v27;

    v29 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v18->_resolutionTokenMap;
    v18->_resolutionTokenMap = v29;

    uint64_t v31 = [MEMORY[0x1E4F1C9B8] data];
    resolutionTokenMapData = v18->_resolutionTokenMapData;
    v18->_resolutionTokenMapData = (NSData *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CAD0] set];
    reminderIDsToUndelete = v18->_reminderIDsToUndelete;
    v18->_reminderIDsToUndelete = (NSSet *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CAD0] set];
    childListIDsToUndelete = v18->_childListIDsToUndelete;
    v18->_childListIDsToUndelete = (NSSet *)v35;

    uint64_t v37 = [MEMORY[0x1E4F1CAD0] set];
    childSmartListIDsToUndelete = v18->_childSmartListIDsToUndelete;
    v18->_childSmartListIDsToUndelete = (NSSet *)v37;

    uint64_t v39 = [MEMORY[0x1E4F1CAD0] set];
    sectionIDsToUndelete = v18->_sectionIDsToUndelete;
    v18->_sectionIDsToUndelete = (NSSet *)v39;

    v18->_sharingStatus = 0;
    v18->_storeGeneration = 0;
    *(_DWORD *)&v18->_remindersICSDisplayOrderChanged = 0;
    v18->_daIsNotificationsCollection = 0;
    [(REMListStorage *)v18 setSortingStyle:@"manual"];
  }

  return v18;
}

- (void)setSortingStyle:(id)a3
{
}

- (void)setDaPushKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserShareParticipantID, 0);
  objc_storeStrong((id *)&self->_daBulkRequests, 0);
  objc_storeStrong((id *)&self->_daExternalIdentificationTag, 0);
  objc_storeStrong((id *)&self->_calDAVNotifications, 0);
  objc_storeStrong((id *)&self->_lastUserAccessDate, 0);
  objc_storeStrong((id *)&self->_sharedOwnerID, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
  objc_storeStrong((id *)&self->_sharedOwnerAddress, 0);
  objc_storeStrong((id *)&self->_sharedOwnerName, 0);
  objc_storeStrong((id *)&self->_templateID, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_childSmartListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_childListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_reminderIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_reminderIDsOrderingHints, 0);
  objc_storeStrong((id *)&self->_reminderIDsMergeableOrderingData, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_unsavedReminderIDsToCategorizeAsGroceryItems, 0);
  objc_storeStrong((id *)&self->_groceryLocaleID, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedDate, 0);
  objc_storeStrong((id *)&self->sortingStyle, 0);

  objc_storeStrong((id *)&self->_reminderIDsMergeableOrdering, 0);
}

- (void)setTemplateID:(id)a3
{
}

- (void)setSharees:(id)a3
{
}

- (void)setPinnedDate:(id)a3
{
}

- (void)setCalDAVNotifications:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CAA0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 orderedSet];
  id v13 = [(REMListStorage *)self initWithObjectID:v11 accountID:v10 name:v9 isGroup:0 reminderIDsMergeableOrdering:v12];

  return v13;
}

- (REMListStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5 isGroup:(BOOL)a6 reminderIDsMergeableOrdering:(id)a7
{
  BOOL v8 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v22 = 0;
  id v16 = [(id)objc_opt_class() reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:v13 error:&v22];

  id v17 = v22;
  uint64_t v18 = +[REMLogStore read];
  uint64_t v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_INFO, "Serialized input reminderIDsMergeableOrdering into data when init REMListStorage. {objectID: %@}", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[REMListStorage initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:]();
    }

    id v16 = [MEMORY[0x1E4F1C9B8] data];
  }
  uint64_t v20 = [(REMListStorage *)self initWithObjectID:v12 accountID:v15 name:v14 isGroup:v8 reminderIDsMergeableOrderingData:v16];

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMListStorage alloc];
  uint64_t v5 = [(REMListStorage *)self objectID];
  uint64_t v6 = [(REMListStorage *)self accountID];
  uint64_t v7 = [(REMListStorage *)self name];
  BOOL v8 = [(REMListStorage *)self isGroup];
  id v9 = [(REMListStorage *)self reminderIDsMergeableOrderingData];
  id v10 = [(REMListStorage *)v4 initWithObjectID:v5 accountID:v6 name:v7 isGroup:v8 reminderIDsMergeableOrderingData:v9];

  id v11 = (void *)[(NSOrderedSet *)self->_reminderIDsMergeableOrdering copy];
  [(REMListStorage *)v10 setReminderIDsMergeableOrdering:v11];

  [(REMListStorage *)v10 setIsGroup:[(REMListStorage *)self isGroup]];
  id v12 = [(REMListStorage *)self externalIdentifier];
  [(REMListStorage *)v10 setExternalIdentifier:v12];

  id v13 = [(REMListStorage *)self externalModificationTag];
  [(REMListStorage *)v10 setExternalModificationTag:v13];

  id v14 = [(REMListStorage *)self daSyncToken];
  [(REMListStorage *)v10 setDaSyncToken:v14];

  id v15 = [(REMListStorage *)self daPushKey];
  [(REMListStorage *)v10 setDaPushKey:v15];

  id v16 = [(REMListStorage *)self daExternalIdentificationTag];
  [(REMListStorage *)v10 setDaExternalIdentificationTag:v16];

  id v17 = [(REMListStorage *)self daBulkRequests];
  [(REMListStorage *)v10 setDaBulkRequests:v17];

  [(REMListStorage *)v10 setDaDisplayOrder:[(REMListStorage *)self daDisplayOrder]];
  [(REMListStorage *)v10 setDaIsEventOnlyContainer:[(REMListStorage *)self daIsEventOnlyContainer]];
  [(REMListStorage *)v10 setDaIsReadOnly:[(REMListStorage *)self daIsReadOnly]];
  [(REMListStorage *)v10 setDaIsImmutable:[(REMListStorage *)self daIsImmutable]];
  [(REMListStorage *)v10 setDaIsNotificationsCollection:[(REMListStorage *)self daIsNotificationsCollection]];
  [(REMListStorage *)v10 setMinimumSupportedVersion:[(REMListStorage *)self minimumSupportedVersion]];
  [(REMListStorage *)v10 setEffectiveMinimumSupportedVersion:[(REMListStorage *)self effectiveMinimumSupportedVersion]];
  uint64_t v18 = [(REMListStorage *)self color];
  [(REMListStorage *)v10 setColor:v18];

  uint64_t v19 = [(REMListStorage *)self badgeEmblem];
  [(REMListStorage *)v10 setBadgeEmblem:v19];

  [(REMListStorage *)v10 setShouldCategorizeGroceryItems:[(REMListStorage *)self shouldCategorizeGroceryItems]];
  [(REMListStorage *)v10 setShouldSuggestConversionToGroceryList:[(REMListStorage *)self shouldSuggestConversionToGroceryList]];
  uint64_t v20 = [(REMListStorage *)self groceryLocaleID];
  [(REMListStorage *)v10 setGroceryLocaleID:v20];

  v21 = [(REMListStorage *)self unsavedReminderIDsToCategorizeAsGroceryItems];
  id v22 = (void *)[v21 copy];
  [(REMListStorage *)v10 setUnsavedReminderIDsToCategorizeAsGroceryItems:v22];

  v23 = [(REMListStorage *)self lastUserAccessDate];
  [(REMListStorage *)v10 setLastUserAccessDate:v23];

  [(REMListStorage *)v10 setShowingLargeAttachments:[(REMListStorage *)self showingLargeAttachments]];
  id v24 = [(REMListStorage *)self parentAccountID];
  [(REMListStorage *)v10 setParentAccountID:v24];

  uint64_t v25 = [(REMListStorage *)self parentListID];
  [(REMListStorage *)v10 setParentListID:v25];

  uint64_t v26 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  resolutionTokenMap = v10->_resolutionTokenMap;
  v10->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  v28 = [(REMListStorage *)self resolutionTokenMapData];
  [(REMListStorage *)v10 setResolutionTokenMapData:v28];

  v29 = [(REMListStorage *)self reminderIDsOrderingHints];
  uint64_t v30 = (void *)[v29 copy];
  [(REMListStorage *)v10 setReminderIDsOrderingHints:v30];

  uint64_t v31 = [(REMListStorage *)self reminderIDsToUndelete];
  uint64_t v32 = (void *)[v31 copy];
  [(REMListStorage *)v10 setReminderIDsToUndelete:v32];

  uint64_t v33 = [(REMListStorage *)self childListIDsToUndelete];
  v34 = (void *)[v33 copy];
  [(REMListStorage *)v10 setChildListIDsToUndelete:v34];

  uint64_t v35 = [(REMListStorage *)self childSmartListIDsToUndelete];
  v36 = (void *)[v35 copy];
  [(REMListStorage *)v10 setChildSmartListIDsToUndelete:v36];

  uint64_t v37 = [(REMListStorage *)self sectionIDsToUndelete];
  v38 = (void *)[v37 copy];
  [(REMListStorage *)v10 setSectionIDsToUndelete:v38];

  [(REMListStorage *)v10 setRemindersICSDisplayOrderChanged:[(REMListStorage *)self remindersICSDisplayOrderChanged]];
  uint64_t v39 = [(REMListStorage *)self templateID];
  [(REMListStorage *)v10 setTemplateID:v39];

  v40 = [(REMListStorage *)self sharedOwnerName];
  [(REMListStorage *)v10 setSharedOwnerName:v40];

  uint64_t v41 = [(REMListStorage *)self sharedOwnerAddress];
  [(REMListStorage *)v10 setSharedOwnerAddress:v41];

  [(REMListStorage *)v10 setSharingStatus:[(REMListStorage *)self sharingStatus]];
  objc_super v42 = [(REMListStorage *)self sharees];
  [(REMListStorage *)v10 setSharees:v42];

  uint64_t v43 = [(REMListStorage *)self sharedOwnerID];
  [(REMListStorage *)v10 setSharedOwnerID:v43];

  v44 = [(REMListStorage *)self calDAVNotifications];
  [(REMListStorage *)v10 setCalDAVNotifications:v44];

  [(REMListStorage *)v10 setIsPlaceholder:[(REMListStorage *)self isPlaceholder]];
  v45 = [(REMListStorage *)self currentUserShareParticipantID];
  [(REMListStorage *)v10 setCurrentUserShareParticipantID:v45];

  uint64_t v46 = [(REMListStorage *)self sortingStyle];
  [(REMListStorage *)v10 setSortingStyle:v46];

  v47 = [(REMListStorage *)self pinnedDate];
  [(REMListStorage *)v10 setPinnedDate:v47];

  v48 = [(REMListStorage *)self mostRecentTargetTemplateIdentifier];
  [(REMListStorage *)v10 setMostRecentTargetTemplateIdentifier:v48];

  [(REMListStorage *)v10 setShouldUpdateSectionsOrdering:[(REMListStorage *)self shouldUpdateSectionsOrdering]];
  uint64_t v49 = [(REMListStorage *)self unsavedSectionIDsOrdering];
  v50 = (void *)[v49 copy];
  [(REMListStorage *)v10 setUnsavedSectionIDsOrdering:v50];

  uint64_t v51 = [(REMListStorage *)self unsavedMembershipsOfRemindersInSections];
  v52 = (void *)[v51 copy];
  [(REMListStorage *)v10 setUnsavedMembershipsOfRemindersInSections:v52];

  v10->_storeGeneration = self->_storeGeneration;
  v10->_copyGeneration = self->_copyGeneration + 1;
  return v10;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v243 = *MEMORY[0x1E4F143B8];
  id v4 = (REMListStorage *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(REMListStorage *)self objectID];
      uint64_t v8 = [(REMListStorage *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        id v10 = [(REMListStorage *)self objectID];
        id v11 = [(REMListStorage *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_159;
        }
      }
      BOOL v14 = [(REMListStorage *)self isGroup];
      if (v14 == [(REMListStorage *)v6 isGroup])
      {
        id v15 = [(REMListStorage *)self accountID];
        uint64_t v16 = [(REMListStorage *)v6 accountID];
        if (v15 == (void *)v16)
        {
        }
        else
        {
          id v17 = (void *)v16;
          uint64_t v18 = [(REMListStorage *)self accountID];
          uint64_t v19 = [(REMListStorage *)v6 accountID];
          int v20 = [v18 isEqual:v19];

          if (!v20) {
            goto LABEL_159;
          }
        }
        v21 = [(REMListStorage *)self externalIdentifier];
        uint64_t v22 = [(REMListStorage *)v6 externalIdentifier];
        if (v21 == (void *)v22)
        {
        }
        else
        {
          v23 = (void *)v22;
          id v24 = [(REMListStorage *)self externalIdentifier];
          uint64_t v25 = [(REMListStorage *)v6 externalIdentifier];
          int v26 = [v24 isEqual:v25];

          if (!v26) {
            goto LABEL_159;
          }
        }
        v27 = [(REMListStorage *)self externalModificationTag];
        uint64_t v28 = [(REMListStorage *)v6 externalModificationTag];
        if (v27 == (void *)v28)
        {
        }
        else
        {
          v29 = (void *)v28;
          uint64_t v30 = [(REMListStorage *)self externalModificationTag];
          uint64_t v31 = [(REMListStorage *)v6 externalModificationTag];
          int v32 = [v30 isEqual:v31];

          if (!v32) {
            goto LABEL_159;
          }
        }
        uint64_t v33 = [(REMListStorage *)self daSyncToken];
        uint64_t v34 = [(REMListStorage *)v6 daSyncToken];
        if (v33 == (void *)v34)
        {
        }
        else
        {
          uint64_t v35 = (void *)v34;
          v36 = [(REMListStorage *)self daSyncToken];
          uint64_t v37 = [(REMListStorage *)v6 daSyncToken];
          int v38 = [v36 isEqual:v37];

          if (!v38) {
            goto LABEL_159;
          }
        }
        uint64_t v39 = [(REMListStorage *)self daPushKey];
        uint64_t v40 = [(REMListStorage *)v6 daPushKey];
        if (v39 == (void *)v40)
        {
        }
        else
        {
          uint64_t v41 = (void *)v40;
          objc_super v42 = [(REMListStorage *)self daPushKey];
          uint64_t v43 = [(REMListStorage *)v6 daPushKey];
          int v44 = [v42 isEqual:v43];

          if (!v44) {
            goto LABEL_159;
          }
        }
        v45 = [(REMListStorage *)self daExternalIdentificationTag];
        uint64_t v46 = [(REMListStorage *)v6 daExternalIdentificationTag];
        if (v45 == (void *)v46)
        {
        }
        else
        {
          v47 = (void *)v46;
          v48 = [(REMListStorage *)self daExternalIdentificationTag];
          uint64_t v49 = [(REMListStorage *)v6 daExternalIdentificationTag];
          int v50 = [v48 isEqual:v49];

          if (!v50) {
            goto LABEL_159;
          }
        }
        uint64_t v51 = [(REMListStorage *)self daBulkRequests];
        uint64_t v52 = [(REMListStorage *)v6 daBulkRequests];
        if (v51 == (void *)v52)
        {
        }
        else
        {
          v53 = (void *)v52;
          v54 = [(REMListStorage *)self daBulkRequests];
          v55 = [(REMListStorage *)v6 daBulkRequests];
          int v56 = [v54 isEqual:v55];

          if (!v56) {
            goto LABEL_159;
          }
        }
        int64_t v57 = [(REMListStorage *)self daDisplayOrder];
        if (v57 != [(REMListStorage *)v6 daDisplayOrder]) {
          goto LABEL_159;
        }
        BOOL v58 = [(REMListStorage *)self daIsEventOnlyContainer];
        if (v58 != [(REMListStorage *)v6 daIsEventOnlyContainer]) {
          goto LABEL_159;
        }
        BOOL v59 = [(REMListStorage *)self daIsReadOnly];
        if (v59 != [(REMListStorage *)v6 daIsReadOnly]) {
          goto LABEL_159;
        }
        BOOL v60 = [(REMListStorage *)self daIsImmutable];
        if (v60 != [(REMListStorage *)v6 daIsImmutable]) {
          goto LABEL_159;
        }
        BOOL v61 = [(REMListStorage *)self daIsNotificationsCollection];
        if (v61 != [(REMListStorage *)v6 daIsNotificationsCollection]) {
          goto LABEL_159;
        }
        int64_t v62 = [(REMListStorage *)self minimumSupportedVersion];
        if (v62 != [(REMListStorage *)v6 minimumSupportedVersion]) {
          goto LABEL_159;
        }
        int64_t v63 = [(REMListStorage *)self effectiveMinimumSupportedVersion];
        if (v63 != [(REMListStorage *)v6 effectiveMinimumSupportedVersion]) {
          goto LABEL_159;
        }
        v64 = [(REMListStorage *)self lastUserAccessDate];
        uint64_t v65 = [(REMListStorage *)v6 lastUserAccessDate];
        if (v64 == (void *)v65)
        {
        }
        else
        {
          uint64_t v66 = (void *)v65;
          v67 = [(REMListStorage *)self lastUserAccessDate];
          uint64_t v68 = [(REMListStorage *)v6 lastUserAccessDate];
          int v69 = [v67 isEqual:v68];

          if (!v69) {
            goto LABEL_159;
          }
        }
        uint64_t v70 = [(REMListStorage *)self name];
        uint64_t v71 = [(REMListStorage *)v6 name];
        if (v70 == (void *)v71)
        {
        }
        else
        {
          uint64_t v72 = (void *)v71;
          v73 = [(REMListStorage *)self name];
          v74 = [(REMListStorage *)v6 name];
          int v75 = [v73 isEqual:v74];

          if (!v75) {
            goto LABEL_159;
          }
        }
        v76 = [(REMListStorage *)self color];
        uint64_t v77 = [(REMListStorage *)v6 color];
        if (v76 == (void *)v77)
        {
        }
        else
        {
          v78 = (void *)v77;
          v79 = [(REMListStorage *)self color];
          v80 = [(REMListStorage *)v6 color];
          int v81 = [v79 isEqual:v80];

          if (!v81) {
            goto LABEL_159;
          }
        }
        v82 = [(REMListStorage *)self badgeEmblem];
        uint64_t v83 = [(REMListStorage *)v6 badgeEmblem];
        if (v82 == (void *)v83)
        {
        }
        else
        {
          v84 = (void *)v83;
          v85 = [(REMListStorage *)self badgeEmblem];
          uint64_t v86 = [(REMListStorage *)v6 badgeEmblem];
          int v87 = [v85 isEqual:v86];

          if (!v87) {
            goto LABEL_159;
          }
        }
        BOOL v88 = [(REMListStorage *)self shouldCategorizeGroceryItems];
        if (v88 != [(REMListStorage *)v6 shouldCategorizeGroceryItems]) {
          goto LABEL_159;
        }
        BOOL v89 = [(REMListStorage *)self shouldSuggestConversionToGroceryList];
        if (v89 != [(REMListStorage *)v6 shouldSuggestConversionToGroceryList]) {
          goto LABEL_159;
        }
        v90 = [(REMListStorage *)self groceryLocaleID];
        uint64_t v91 = [(REMListStorage *)v6 groceryLocaleID];
        if (v90 == (void *)v91)
        {
        }
        else
        {
          v92 = (void *)v91;
          v93 = [(REMListStorage *)self groceryLocaleID];
          v94 = [(REMListStorage *)v6 groceryLocaleID];
          int v95 = [v93 isEqual:v94];

          if (!v95) {
            goto LABEL_159;
          }
        }
        v96 = [(REMListStorage *)self unsavedReminderIDsToCategorizeAsGroceryItems];
        uint64_t v97 = [(REMListStorage *)v6 unsavedReminderIDsToCategorizeAsGroceryItems];
        if (v96 == (void *)v97)
        {
        }
        else
        {
          v98 = (void *)v97;
          uint64_t v99 = [(REMListStorage *)self unsavedReminderIDsToCategorizeAsGroceryItems];
          v100 = [(REMListStorage *)v6 unsavedReminderIDsToCategorizeAsGroceryItems];
          int v101 = [v99 isEqual:v100];

          if (!v101) {
            goto LABEL_159;
          }
        }
        BOOL v102 = [(REMListStorage *)self showingLargeAttachments];
        if (v102 == [(REMListStorage *)v6 showingLargeAttachments])
        {
          v103 = [(REMListStorage *)self parentAccountID];
          uint64_t v104 = [(REMListStorage *)v6 parentAccountID];
          if (v103 == (void *)v104)
          {
          }
          else
          {
            v105 = (void *)v104;
            v106 = [(REMListStorage *)self parentAccountID];
            v107 = [(REMListStorage *)v6 parentAccountID];
            int v108 = [v106 isEqual:v107];

            if (!v108) {
              goto LABEL_159;
            }
          }
          v109 = [(REMListStorage *)self parentListID];
          uint64_t v110 = [(REMListStorage *)v6 parentListID];
          if (v109 == (void *)v110)
          {
          }
          else
          {
            v111 = (void *)v110;
            v112 = [(REMListStorage *)self parentListID];
            v113 = [(REMListStorage *)v6 parentListID];
            int v114 = [v112 isEqual:v113];

            if (!v114) {
              goto LABEL_159;
            }
          }
          if (!self->_reminderIDsMergeableOrdering || v6->_reminderIDsMergeableOrdering)
          {
            v115 = +[REMLogStore read];
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              v160 = (objc_class *)objc_opt_class();
              NSStringFromClass(v160);
              id v161 = (id)objc_claimAutoreleasedReturnValue();
              reminderIDsMergeableOrdering = self->_reminderIDsMergeableOrdering;
              v163 = v6->_reminderIDsMergeableOrdering;
              int v237 = 138543874;
              id v238 = v161;
              __int16 v239 = 2112;
              v240 = reminderIDsMergeableOrdering;
              __int16 v241 = 2112;
              v242 = v163;
              _os_log_error_impl(&dword_1B9AA2000, v115, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the reminderIDsMergeableordering. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-idsOrdering: %@, other-idsOrdering: %@}", (uint8_t *)&v237, 0x20u);
            }
          }
          v116 = [(REMListStorage *)self reminderIDsMergeableOrdering];
          uint64_t v117 = [(REMListStorage *)v6 reminderIDsMergeableOrdering];
          if (v116 == (void *)v117)
          {
          }
          else
          {
            v118 = (void *)v117;
            v119 = [(REMListStorage *)self reminderIDsMergeableOrdering];
            v120 = [(REMListStorage *)v6 reminderIDsMergeableOrdering];
            int v121 = [v119 isEqual:v120];

            if (!v121) {
              goto LABEL_159;
            }
          }
          if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
          {
            v122 = +[REMLogStore read];
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v164 = (objc_class *)objc_opt_class();
              NSStringFromClass(v164);
              id v165 = (id)objc_claimAutoreleasedReturnValue();
              resolutionTokenMap = self->_resolutionTokenMap;
              v167 = v6->_resolutionTokenMap;
              int v237 = 138543874;
              id v238 = v165;
              __int16 v239 = 2112;
              v240 = resolutionTokenMap;
              __int16 v241 = 2112;
              v242 = v167;
              _os_log_error_impl(&dword_1B9AA2000, v122, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v237, 0x20u);
            }
          }
          v123 = [(REMListStorage *)self resolutionTokenMap];
          uint64_t v124 = [(REMListStorage *)v6 resolutionTokenMap];
          if (v123 == (void *)v124)
          {
          }
          else
          {
            v125 = (void *)v124;
            v126 = [(REMListStorage *)self resolutionTokenMap];
            v127 = [(REMListStorage *)v6 resolutionTokenMap];
            int v128 = [v126 isEqual:v127];

            if (!v128) {
              goto LABEL_159;
            }
          }
          v129 = [(REMListStorage *)self reminderIDsToUndelete];
          uint64_t v130 = [(REMListStorage *)v6 reminderIDsToUndelete];
          if (v129 == (void *)v130)
          {
          }
          else
          {
            v131 = (void *)v130;
            v132 = [(REMListStorage *)self reminderIDsToUndelete];
            v133 = [(REMListStorage *)v6 reminderIDsToUndelete];
            int v134 = [v132 isEqual:v133];

            if (!v134) {
              goto LABEL_159;
            }
          }
          v135 = [(REMListStorage *)self childListIDsToUndelete];
          uint64_t v136 = [(REMListStorage *)v6 childListIDsToUndelete];
          if (v135 == (void *)v136)
          {
          }
          else
          {
            v137 = (void *)v136;
            v138 = [(REMListStorage *)self childListIDsToUndelete];
            v139 = [(REMListStorage *)v6 childListIDsToUndelete];
            int v140 = [v138 isEqual:v139];

            if (!v140) {
              goto LABEL_159;
            }
          }
          v141 = [(REMListStorage *)self childSmartListIDsToUndelete];
          uint64_t v142 = [(REMListStorage *)v6 childSmartListIDsToUndelete];
          if (v141 == (void *)v142)
          {
          }
          else
          {
            v143 = (void *)v142;
            v144 = [(REMListStorage *)self childSmartListIDsToUndelete];
            v145 = [(REMListStorage *)v6 childSmartListIDsToUndelete];
            int v146 = [v144 isEqual:v145];

            if (!v146) {
              goto LABEL_159;
            }
          }
          v147 = [(REMListStorage *)self sectionIDsToUndelete];
          uint64_t v148 = [(REMListStorage *)v6 sectionIDsToUndelete];
          if (v147 == (void *)v148)
          {
          }
          else
          {
            v149 = (void *)v148;
            v150 = [(REMListStorage *)self sectionIDsToUndelete];
            v151 = [(REMListStorage *)v6 sectionIDsToUndelete];
            int v152 = [v150 isEqual:v151];

            if (!v152) {
              goto LABEL_159;
            }
          }
          BOOL v153 = [(REMListStorage *)self remindersICSDisplayOrderChanged];
          if (v153 == [(REMListStorage *)v6 remindersICSDisplayOrderChanged])
          {
            v154 = [(REMListStorage *)self templateID];
            uint64_t v155 = [(REMListStorage *)v6 templateID];
            if (v154 == (void *)v155)
            {
            }
            else
            {
              v156 = (void *)v155;
              v157 = [(REMListStorage *)self templateID];
              v158 = [(REMListStorage *)v6 templateID];
              int v159 = [v157 isEqual:v158];

              if (!v159) {
                goto LABEL_159;
              }
            }
            v168 = [(REMListStorage *)self sharedOwnerName];
            uint64_t v169 = [(REMListStorage *)v6 sharedOwnerName];
            if (v168 == (void *)v169)
            {
            }
            else
            {
              v170 = (void *)v169;
              v171 = [(REMListStorage *)self sharedOwnerName];
              v172 = [(REMListStorage *)v6 sharedOwnerName];
              int v173 = [v171 isEqual:v172];

              if (!v173) {
                goto LABEL_159;
              }
            }
            v174 = [(REMListStorage *)self sharedOwnerAddress];
            uint64_t v175 = [(REMListStorage *)v6 sharedOwnerAddress];
            if (v174 == (void *)v175)
            {
            }
            else
            {
              v176 = (void *)v175;
              v177 = [(REMListStorage *)self sharedOwnerAddress];
              v178 = [(REMListStorage *)v6 sharedOwnerAddress];
              int v179 = [v177 isEqual:v178];

              if (!v179) {
                goto LABEL_159;
              }
            }
            int64_t v180 = [(REMListStorage *)self sharingStatus];
            if (v180 == [(REMListStorage *)v6 sharingStatus])
            {
              v181 = [(REMListStorage *)self sharees];
              uint64_t v182 = [(REMListStorage *)v6 sharees];
              if (v181 == (void *)v182)
              {
              }
              else
              {
                v183 = (void *)v182;
                v184 = [(REMListStorage *)self sharees];
                v185 = [(REMListStorage *)v6 sharees];
                int v186 = [v184 isEqual:v185];

                if (!v186) {
                  goto LABEL_159;
                }
              }
              v187 = [(REMListStorage *)self sharedOwnerID];
              uint64_t v188 = [(REMListStorage *)v6 sharedOwnerID];
              if (v187 == (void *)v188)
              {
              }
              else
              {
                v189 = (void *)v188;
                v190 = [(REMListStorage *)self sharedOwnerID];
                v191 = [(REMListStorage *)v6 sharedOwnerID];
                int v192 = [v190 isEqual:v191];

                if (!v192) {
                  goto LABEL_159;
                }
              }
              v193 = [(REMListStorage *)self calDAVNotifications];
              uint64_t v194 = [(REMListStorage *)v6 calDAVNotifications];
              if (v193 == (void *)v194)
              {
              }
              else
              {
                v195 = (void *)v194;
                v196 = [(REMListStorage *)self calDAVNotifications];
                v197 = [(REMListStorage *)v6 calDAVNotifications];
                int v198 = [v196 isEqual:v197];

                if (!v198) {
                  goto LABEL_159;
                }
              }
              BOOL v199 = [(REMListStorage *)self isPlaceholder];
              if (v199 == [(REMListStorage *)v6 isPlaceholder])
              {
                v200 = [(REMListStorage *)self currentUserShareParticipantID];
                uint64_t v201 = [(REMListStorage *)v6 currentUserShareParticipantID];
                if (v200 == (void *)v201)
                {
                }
                else
                {
                  v202 = (void *)v201;
                  v203 = [(REMListStorage *)self currentUserShareParticipantID];
                  v204 = [(REMListStorage *)v6 currentUserShareParticipantID];
                  int v205 = [v203 isEqual:v204];

                  if (!v205) {
                    goto LABEL_159;
                  }
                }
                v206 = [(REMListStorage *)self sortingStyle];
                uint64_t v207 = [(REMListStorage *)v6 sortingStyle];
                if (v206 == (void *)v207)
                {
                }
                else
                {
                  v208 = (void *)v207;
                  v209 = [(REMListStorage *)self sortingStyle];
                  v210 = [(REMListStorage *)v6 sortingStyle];
                  int v211 = [v209 isEqual:v210];

                  if (!v211) {
                    goto LABEL_159;
                  }
                }
                v212 = [(REMListStorage *)self pinnedDate];
                uint64_t v213 = [(REMListStorage *)v6 pinnedDate];
                if (v212 == (void *)v213)
                {
                }
                else
                {
                  v214 = (void *)v213;
                  v215 = [(REMListStorage *)self pinnedDate];
                  v216 = [(REMListStorage *)v6 pinnedDate];
                  int v217 = [v215 isEqual:v216];

                  if (!v217) {
                    goto LABEL_159;
                  }
                }
                v218 = [(REMListStorage *)self mostRecentTargetTemplateIdentifier];
                uint64_t v219 = [(REMListStorage *)v6 mostRecentTargetTemplateIdentifier];
                if (v218 == (void *)v219)
                {
                }
                else
                {
                  v220 = (void *)v219;
                  v221 = [(REMListStorage *)self mostRecentTargetTemplateIdentifier];
                  v222 = [(REMListStorage *)v6 mostRecentTargetTemplateIdentifier];
                  int v223 = [v221 isEqual:v222];

                  if (!v223) {
                    goto LABEL_159;
                  }
                }
                BOOL v224 = [(REMListStorage *)self shouldUpdateSectionsOrdering];
                if (v224 == [(REMListStorage *)v6 shouldUpdateSectionsOrdering])
                {
                  v225 = [(REMListStorage *)self unsavedSectionIDsOrdering];
                  uint64_t v226 = [(REMListStorage *)v6 unsavedSectionIDsOrdering];
                  if (v225 == (void *)v226)
                  {
                  }
                  else
                  {
                    v227 = (void *)v226;
                    v228 = [(REMListStorage *)self unsavedSectionIDsOrdering];
                    v229 = [(REMListStorage *)v6 unsavedSectionIDsOrdering];
                    int v230 = [v228 isEqual:v229];

                    if (!v230) {
                      goto LABEL_159;
                    }
                  }
                  v232 = [(REMListStorage *)self unsavedMembershipsOfRemindersInSections];
                  uint64_t v233 = [(REMListStorage *)v6 unsavedMembershipsOfRemindersInSections];
                  if (v232 == (void *)v233)
                  {
                    char v13 = 1;
                    v234 = v232;
                  }
                  else
                  {
                    v234 = (void *)v233;
                    v235 = [(REMListStorage *)self unsavedMembershipsOfRemindersInSections];
                    v236 = [(REMListStorage *)v6 unsavedMembershipsOfRemindersInSections];
                    char v13 = [v235 isEqual:v236];
                  }
                  goto LABEL_160;
                }
              }
            }
          }
        }
      }
    }
LABEL_159:
    char v13 = 0;
LABEL_160:

    goto LABEL_161;
  }
  char v13 = 1;
LABEL_161:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMListStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMListStorage *)self objectID];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMListStorage *)self name];
  uint64_t v6 = [(REMListStorage *)self objectID];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p %@ %@ [%ld.%ld]>", v4, self, v5, v6, self->_storeGeneration, self->_copyGeneration];

  return v7;
}

- (id)ekColor
{
  v2 = [(REMListStorage *)self color];
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[REMColor colorWithHexString:@"#007AFF"];
  }
  uint64_t v5 = v4;

  return v5;
}

- (NSOrderedSet)reminderIDsMergeableOrdering
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_reminderIDsMergeableOrdering = &self->_reminderIDsMergeableOrdering;
  id v4 = self->_reminderIDsMergeableOrdering;
  if (v4)
  {
    uint64_t v5 = v4;
    goto LABEL_15;
  }
  uint64_t v6 = [(REMListStorage *)self reminderIDsMergeableOrderingData];
  if (!v6)
  {
    char v13 = +[REMLogStore read];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(REMListStorage *)self reminderIDsMergeableOrdering];
    }

    id v8 = +[REMError internalErrorWithDebugDescription:@"reminderIDsMergeableOrderingData is nil when trying to deserialize from list storage"];
    goto LABEL_11;
  }
  id v16 = 0;
  id v7 = [(id)objc_opt_class() reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:v6 error:&v16];
  id v8 = v16;
  id v9 = +[REMLogStore read];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(REMListStorage *)self objectID];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    int v20 = self;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_INFO, "REMListStorage reminderIDsMergeableOrdering deserialized {objectID: %{public}@, self: %p, orderedSet.count: %@}", buf, 0x20u);
  }
  if (!v7)
  {
LABEL_11:
    BOOL v14 = +[REMLogStore read];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[REMListStorage reminderIDsMergeableOrdering]();
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    goto LABEL_14;
  }
  reminderIDsMergeableOrderingData = self->_reminderIDsMergeableOrderingData;
  self->_reminderIDsMergeableOrderingData = 0;

LABEL_14:
  objc_storeStrong((id *)p_reminderIDsMergeableOrdering, v7);
  uint64_t v5 = (NSOrderedSet *)v7;

LABEL_15:

  return v5;
}

- (BOOL)hasDeserializedReminderIDsMergeableOrdering
{
  return self->_reminderIDsMergeableOrdering != 0;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMListStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_1 != -1) {
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_1, &__block_literal_global_35);
  }
  uint64_t v2 = (void *)cdKeyToStorageKeyMap_mapping_1;

  return v2;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  id v4 = self->_resolutionTokenMap;
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v6 = [(REMListStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      id v7 = +[REMLogStore read];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[REMListStorage resolutionTokenMap]();
      }
    }
    id v8 = [(REMListStorage *)self cdKeyToStorageKeyMap];
    id v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    uint64_t v5 = v9;
  }

  return v5;
}

+ (id)reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) uuid];
        char v13 = [v12 UUIDString];

        if (v13) {
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v18 = 0;
  BOOL v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:&v18];
  id v15 = v18;
  if (!v14)
  {
    id v16 = +[REMLogStore read];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[REMListStorage reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:]();
    }
  }
  if (a4) {
    *a4 = v15;
  }

  return v14;
}

+ (id)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 length])
    {
      id v21 = [MEMORY[0x1E4F1CA70] orderedSet];
      goto LABEL_29;
    }
    id v7 = (void *)MEMORY[0x1BA9DB950]();
    id v31 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v31];
    id v9 = v31;
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v9;
        uint64_t v25 = v7;
        int v26 = a4;
        uint64_t v23 = v8;
        id v10 = v8;
        id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v10, "count"));
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        int v12 = v10;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
              if (v18)
              {
                long long v19 = +[REMReminderStorage objectIDWithUUID:v18];
                [v11 addObject:v19];
              }
              else
              {
                long long v19 = +[REMLogStore read];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v33 = v17;
                  _os_log_fault_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_FAULT, "Failed to create uuid from string. Skipping objectID from list {uuidString: %@}", buf, 0xCu);
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
          }
          while (v14);
        }

        a4 = v26;
        id v9 = v24;
        id v7 = v25;
        uint64_t v8 = v23;
        goto LABEL_26;
      }
      int v12 = +[REMLogStore read];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:]((uint64_t)v8, v12);
      }
    }
    else
    {
      int v12 = +[REMLogStore read];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:]();
      }
    }
    id v11 = 0;
LABEL_26:

    if (a4) {
      *a4 = v9;
    }
    id v21 = v11;

    goto LABEL_29;
  }
  long long v20 = +[REMLogStore read];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    +[REMListStorage reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:]();
  }

  id v21 = 0;
LABEL_29:

  return v21;
}

+ (BOOL)_forceDisableFullRemindersSorting
{
  return __forceDisableFullRemindersSorting;
}

+ (void)set_forceDisableFullRemindersSorting:(BOOL)a3
{
  __forceDisableFullRemindersSorting = a3;
}

- (void)setAccountID:(id)a3
{
}

- (void)setObjectID:(id)a3
{
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (void)setName:(id)a3
{
}

- (void)setReminderIDsMergeableOrderingData:(id)a3
{
}

- (void)setReminderIDsOrderingHints:(id)a3
{
}

- (void)setReminderIDsToUndelete:(id)a3
{
}

- (void)setChildListIDsToUndelete:(id)a3
{
}

- (void)setChildSmartListIDsToUndelete:(id)a3
{
}

- (void)setSectionIDsToUndelete:(id)a3
{
}

- (void)setRemindersICSDisplayOrderChanged:(BOOL)a3
{
  self->_remindersICSDisplayOrderChanged = a3;
}

- (void)setDaBulkRequests:(id)a3
{
}

- (void)initWithObjectID:accountID:name:isGroup:reminderIDsMergeableOrdering:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, v0, v1, "Failed to serialize provided reminderIDsMergeableOrdering. Using emptyArray {error: %@}", v2);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, v0, v1, "Unknown REMListSharingStatus %ld", v2);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (_reminderIDsMergeableOrdering == nil && _reminderIDsMergeableOrderingData == nil) -- Attempted to decode REMListStorage with both _reminderIDsMergeableOrdering and _reminderIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}");
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "Attempted to decode REMListStorage missing objectID, name, reminderIDs {objectID: %{public}@, name: %{sensitive}@}");
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, a2, v4, "rem_log_fault_if (self.reminderIDsMergeableOrderingData == nil) -- Attempted to encode REMListStorage with both _reminderIDsMergeableOrdering and _reminderIDsMergeableOrderingData missing {%{public}@}", v5);
}

- (void)reminderIDsMergeableOrdering
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil reminderIDsMergeableOrderingData when reading reminderIDsMergeableOrdering from list storage. Initialize an empty set {objectID: %{public}@}", v4, 0xCu);
}

- (void)resolutionTokenMap
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from list storage. Initialize an empty map {list: %@}", v1, 0xCu);
}

+ (void)reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:error:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "Failed to serialize uuidStrings {error: %@, uuidStrings: %@}");
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, v0, v1, "Missing reminderIDsMergeableOrderingData. Returning nil {list: %@}", v2);
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:error:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "Failed to deserialize reminderIDsMergeableOrdering data. Returning nil {error: %@, list: %@}");
}

+ (void)reminderIDsMergeableOrderingFromReminderIDUUIDStringsJSONData:(uint64_t)a1 error:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_2();
  id v4 = v3;
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, a2, v5, "unexpected class for deserialized reminderIDsMergeableOrdering. Returning nil {class: %@}", v6);
}

@end