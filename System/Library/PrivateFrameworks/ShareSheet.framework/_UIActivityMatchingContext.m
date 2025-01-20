@interface _UIActivityMatchingContext
- (BOOL)allowMatchingBuiltInActivities;
- (BOOL)allowMatchingExtensionActivities;
- (BOOL)canExcludeExtensionActivities;
- (BOOL)isCollaborative;
- (BOOL)isContentManaged;
- (BOOL)shouldExcludeActivity:(id)a3;
- (BOOL)shouldExcludeiCloudAddToDriveActivity;
- (BOOL)shouldExcludeiCloudSharingActivity;
- (BOOL)shouldMatchOnlyUserElectedExtensions;
- (BOOL)showSharePlayProminently;
- (BOOL)whitelistActionActivitiesOnly;
- (NSArray)activityItemValueClasses;
- (NSArray)activityItemValueExtensionMatchingDictionaries;
- (NSArray)activityItemValues;
- (NSArray)activityItems;
- (NSArray)activityTypeOrder;
- (NSArray)activityTypesGeneratedByDelegate;
- (NSArray)applicationActivities;
- (NSArray)collaborationItems;
- (NSArray)excludedActivityTypes;
- (NSArray)externalMatchBuiltinOrderedActivities;
- (NSArray)includedActivityTypes;
- (NSArray)prematchedExtensionActivities;
- (NSData)hostAuditTokenData;
- (NSString)sourceApplicationIdentifier;
- (UIActivity)currentlySelectedActivity;
- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4;
- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4 collaborationItems:(id)a5;
- (const)hostAuditToken;
- (id)activitiesByFilteringExcludedActivities:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)excludedActivityCategories;
- (int64_t)sharingStyle;
- (void)setActivityItemValueClasses:(id)a3;
- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3;
- (void)setActivityTypeOrder:(id)a3;
- (void)setActivityTypesGeneratedByDelegate:(id)a3;
- (void)setAllowMatchingBuiltInActivities:(BOOL)a3;
- (void)setAllowMatchingExtensionActivities:(BOOL)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setCanExcludeExtensionActivities:(BOOL)a3;
- (void)setCurrentlySelectedActivity:(id)a3;
- (void)setExcludedActivityCategories:(int64_t)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setExternalMatchBuiltinOrderedActivities:(id)a3;
- (void)setHostAuditToken:(id *)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setPrematchedExtensionActivities:(id)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3;
- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3;
- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3;
- (void)setShowSharePlayProminently:(BOOL)a3;
- (void)setWhitelistActionActivitiesOnly:(BOOL)a3;
@end

@implementation _UIActivityMatchingContext

- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4 collaborationItems:(id)a5
{
  id v8 = a5;
  v9 = [(_UIActivityMatchingContext *)self initWithActivityItems:a3 itemValues:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    collaborationItems = v9->_collaborationItems;
    v9->_collaborationItems = (NSArray *)v10;
  }
  return v9;
}

- (_UIActivityMatchingContext)initWithActivityItems:(id)a3 itemValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityMatchingContext;
  v9 = [(_UIActivityMatchingContext *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityItems, a3);
    objc_storeStrong((id *)&v10->_activityItemValues, a4);
    v10->_allowMatchingBuiltInActivities = 1;
    v10->_canExcludeExtensionActivities = 0;
    memset(v12, 0, sizeof(v12));
    _SharingUIAuditTokenForCurrentProcess((uint64_t)v12);
    [(_UIActivityMatchingContext *)v10 setHostAuditToken:v12];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [_UIActivityMatchingContext alloc];
  v6 = [(_UIActivityMatchingContext *)self activityItems];
  id v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(_UIActivityMatchingContext *)self activityItemValues];
  v9 = (void *)[v8 copyWithZone:a3];
  uint64_t v10 = [(_UIActivityMatchingContext *)v5 initWithActivityItems:v7 itemValues:v9];

  v11 = [(_UIActivityMatchingContext *)self activityItemValueClasses];
  v12 = (void *)[v11 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setActivityItemValueClasses:v12];

  objc_super v13 = [(_UIActivityMatchingContext *)self activityItemValueExtensionMatchingDictionaries];
  v14 = (void *)[v13 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setActivityItemValueExtensionMatchingDictionaries:v14];

  [(_UIActivityMatchingContext *)v10 setAllowMatchingBuiltInActivities:[(_UIActivityMatchingContext *)self allowMatchingBuiltInActivities]];
  [(_UIActivityMatchingContext *)v10 setAllowMatchingExtensionActivities:[(_UIActivityMatchingContext *)self allowMatchingExtensionActivities]];
  v15 = [(_UIActivityMatchingContext *)self externalMatchBuiltinOrderedActivities];
  [(_UIActivityMatchingContext *)v10 setExternalMatchBuiltinOrderedActivities:v15];

  v16 = [(_UIActivityMatchingContext *)self activityTypesGeneratedByDelegate];
  [(_UIActivityMatchingContext *)v10 setActivityTypesGeneratedByDelegate:v16];

  [(_UIActivityMatchingContext *)v10 setIsContentManaged:[(_UIActivityMatchingContext *)self isContentManaged]];
  [(_UIActivityMatchingContext *)v10 setIsCollaborative:[(_UIActivityMatchingContext *)self isCollaborative]];
  [(_UIActivityMatchingContext *)v10 setShouldMatchOnlyUserElectedExtensions:[(_UIActivityMatchingContext *)self shouldMatchOnlyUserElectedExtensions]];
  [(_UIActivityMatchingContext *)v10 setShouldExcludeiCloudAddToDriveActivity:[(_UIActivityMatchingContext *)self shouldExcludeiCloudAddToDriveActivity]];
  [(_UIActivityMatchingContext *)v10 setShouldExcludeiCloudSharingActivity:[(_UIActivityMatchingContext *)self shouldExcludeiCloudSharingActivity]];
  [(_UIActivityMatchingContext *)v10 setCanExcludeExtensionActivities:[(_UIActivityMatchingContext *)self canExcludeExtensionActivities]];
  [(_UIActivityMatchingContext *)v10 setWhitelistActionActivitiesOnly:[(_UIActivityMatchingContext *)self whitelistActionActivitiesOnly]];
  v17 = [(_UIActivityMatchingContext *)self activityTypeOrder];
  v18 = (void *)[v17 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setActivityTypeOrder:v18];

  v19 = [(_UIActivityMatchingContext *)self includedActivityTypes];
  v20 = (void *)[v19 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setIncludedActivityTypes:v20];

  v21 = [(_UIActivityMatchingContext *)self excludedActivityTypes];
  v22 = (void *)[v21 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setExcludedActivityTypes:v22];

  [(_UIActivityMatchingContext *)v10 setExcludedActivityCategories:[(_UIActivityMatchingContext *)self excludedActivityCategories]];
  [(_UIActivityMatchingContext *)v10 setSharingStyle:[(_UIActivityMatchingContext *)self sharingStyle]];
  v23 = [(_UIActivityMatchingContext *)self currentlySelectedActivity];
  [(_UIActivityMatchingContext *)v10 setCurrentlySelectedActivity:v23];

  v24 = [(_UIActivityMatchingContext *)self applicationActivities];
  v25 = (void *)[v24 copyWithZone:a3];
  [(_UIActivityMatchingContext *)v10 setApplicationActivities:v25];

  uint64_t v26 = [(_UIActivityMatchingContext *)self hostAuditTokenData];
  hostAuditTokenData = v10->_hostAuditTokenData;
  v10->_hostAuditTokenData = (NSData *)v26;

  v28 = [(_UIActivityMatchingContext *)self prematchedExtensionActivities];
  [(_UIActivityMatchingContext *)v10 setPrematchedExtensionActivities:v28];

  return v10;
}

- (id)description
{
  uint64_t v23 = objc_opt_class();
  NSAppendPrintF();
  id v29 = 0;
  v24 = [(_UIActivityMatchingContext *)self activityItemValueClasses];
  NSAppendPrintF();
  id v3 = v29;

  if ([(_UIActivityMatchingContext *)self allowMatchingBuiltInActivities])
  {
    NSAppendPrintF();
    id v4 = v3;

    id v3 = v4;
  }
  if ([(_UIActivityMatchingContext *)self allowMatchingExtensionActivities])
  {
    NSAppendPrintF();
    id v5 = v3;

    id v3 = v5;
  }
  if ([(_UIActivityMatchingContext *)self isContentManaged])
  {
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  if ([(_UIActivityMatchingContext *)self isCollaborative])
  {
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }
  if ([(_UIActivityMatchingContext *)self shouldMatchOnlyUserElectedExtensions])
  {
    NSAppendPrintF();
    id v8 = v3;

    id v3 = v8;
  }
  if ([(_UIActivityMatchingContext *)self shouldExcludeiCloudAddToDriveActivity])
  {
    NSAppendPrintF();
    id v9 = v3;

    id v3 = v9;
  }
  if ([(_UIActivityMatchingContext *)self shouldExcludeiCloudSharingActivity])
  {
    NSAppendPrintF();
    id v10 = v3;

    id v3 = v10;
  }
  if ([(_UIActivityMatchingContext *)self canExcludeExtensionActivities])
  {
    NSAppendPrintF();
    id v11 = v3;

    id v3 = v11;
  }
  if ([(_UIActivityMatchingContext *)self whitelistActionActivitiesOnly])
  {
    NSAppendPrintF();
    id v12 = v3;

    id v3 = v12;
  }
  objc_super v13 = [(_UIActivityMatchingContext *)self includedActivityTypes];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v25 = [(_UIActivityMatchingContext *)self includedActivityTypes];
    NSAppendPrintF();
    id v15 = v3;

    id v3 = v15;
  }
  v16 = [(_UIActivityMatchingContext *)self excludedActivityTypes];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    uint64_t v26 = [(_UIActivityMatchingContext *)self excludedActivityTypes];
    NSAppendPrintF();
    id v18 = v3;

    id v3 = v18;
  }
  if ([(_UIActivityMatchingContext *)self excludedActivityCategories])
  {
    int64_t v27 = [(_UIActivityMatchingContext *)self excludedActivityCategories];
    NSAppendPrintF();
    id v19 = v3;

    id v3 = v19;
  }
  v28 = [(_UIActivityMatchingContext *)self activityItemValueExtensionMatchingDictionaries];
  NSAppendPrintF();
  id v20 = v3;

  NSAppendPrintF();
  id v21 = v20;

  return v21;
}

- (BOOL)shouldExcludeActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityType];
  if ([v5 isEqualToString:@"com.apple.UIKit.activity.Share"])
  {
    int64_t v6 = [(_UIActivityMatchingContext *)self sharingStyle];

    if (v6 != 1) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v7 = [v4 activityType];
  if ([v7 isEqualToString:@"com.apple.UIKit.activity.CloudSharing"])
  {
    BOOL v8 = [(_UIActivityMatchingContext *)self shouldExcludeiCloudSharingActivity];

    if (v8)
    {
LABEL_7:
      char v9 = 1;
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v10 = [(_UIActivityMatchingContext *)self excludedActivityTypes];
  id v11 = [v4 activityType];
  if (([v10 containsObject:v11] & 1) != 0
    || (uint64_t v12 = 1 << [(id)objc_opt_class() activityCategory],
        ([(_UIActivityMatchingContext *)self excludedActivityCategories] & v12) != 0))
  {
    char v9 = [v4 _canBeExcludeWhenMatchingWithContext:self];
  }
  else
  {
    char v9 = 0;
  }

LABEL_14:
  return v9;
}

- (id)activitiesByFilteringExcludedActivities:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70___UIActivityMatchingContext_activitiesByFilteringExcludedActivities___block_invoke;
  v7[3] = &unk_1E5A23048;
  v7[4] = self;
  id v3 = a3;
  id v4 = [v3 indexesOfObjectsPassingTest:v7];
  id v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

- (void)setHostAuditToken:(id *)a3
{
  id v3 = self;
  if (a3)
  {
    self = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:32];
    hostAuditTokenData = v3->_hostAuditTokenData;
    v3->_hostAuditTokenData = (NSData *)self;
  }
  else
  {
    hostAuditTokenData = self->_hostAuditTokenData;
    self->_hostAuditTokenData = 0;
  }
  MEMORY[0x1F41817F8](self, hostAuditTokenData);
}

- (const)hostAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)[(NSData *)self->_hostAuditTokenData bytes];
}

- (NSString)sourceApplicationIdentifier
{
  if ([(_UIActivityMatchingContext *)self hostAuditToken])
  {
    v2 = _ShareSheetBundleIDFromAuditToken();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v3 bundleIdentifier];
  }
  return (NSString *)v2;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)activityItemValues
{
  return self->_activityItemValues;
}

- (NSArray)collaborationItems
{
  return self->_collaborationItems;
}

- (NSArray)activityItemValueClasses
{
  return self->_activityItemValueClasses;
}

- (void)setActivityItemValueClasses:(id)a3
{
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)shouldMatchOnlyUserElectedExtensions
{
  return self->_shouldMatchOnlyUserElectedExtensions;
}

- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3
{
  self->_shouldMatchOnlyUserElectedExtensions = a3;
}

- (BOOL)shouldExcludeiCloudAddToDriveActivity
{
  return self->_shouldExcludeiCloudAddToDriveActivity;
}

- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudAddToDriveActivity = a3;
}

- (BOOL)shouldExcludeiCloudSharingActivity
{
  return self->_shouldExcludeiCloudSharingActivity;
}

- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudSharingActivity = a3;
}

- (BOOL)canExcludeExtensionActivities
{
  return self->_canExcludeExtensionActivities;
}

- (void)setCanExcludeExtensionActivities:(BOOL)a3
{
  self->_canExcludeExtensionActivities = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)showSharePlayProminently
{
  return self->_showSharePlayProminently;
}

- (void)setShowSharePlayProminently:(BOOL)a3
{
  self->_showSharePlayProminently = a3;
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (UIActivity)currentlySelectedActivity
{
  return self->_currentlySelectedActivity;
}

- (void)setCurrentlySelectedActivity:(id)a3
{
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (NSArray)prematchedExtensionActivities
{
  return self->_prematchedExtensionActivities;
}

- (void)setPrematchedExtensionActivities:(id)a3
{
}

- (NSData)hostAuditTokenData
{
  return self->_hostAuditTokenData;
}

- (BOOL)allowMatchingBuiltInActivities
{
  return self->_allowMatchingBuiltInActivities;
}

- (void)setAllowMatchingBuiltInActivities:(BOOL)a3
{
  self->_allowMatchingBuiltInActivities = a3;
}

- (BOOL)allowMatchingExtensionActivities
{
  return self->_allowMatchingExtensionActivities;
}

- (void)setAllowMatchingExtensionActivities:(BOOL)a3
{
  self->_allowMatchingExtensionActivities = a3;
}

- (NSArray)externalMatchBuiltinOrderedActivities
{
  return self->_externalMatchBuiltinOrderedActivities;
}

- (void)setExternalMatchBuiltinOrderedActivities:(id)a3
{
}

- (NSArray)activityTypesGeneratedByDelegate
{
  return self->_activityTypesGeneratedByDelegate;
}

- (void)setActivityTypesGeneratedByDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypesGeneratedByDelegate, 0);
  objc_storeStrong((id *)&self->_externalMatchBuiltinOrderedActivities, 0);
  objc_storeStrong((id *)&self->_prematchedExtensionActivities, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_currentlySelectedActivity, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, 0);
  objc_storeStrong((id *)&self->_activityItemValueClasses, 0);
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_activityItemValues, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_hostAuditTokenData, 0);
}

@end