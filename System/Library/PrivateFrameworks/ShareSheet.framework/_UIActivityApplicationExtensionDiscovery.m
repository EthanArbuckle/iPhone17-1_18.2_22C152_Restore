@interface _UIActivityApplicationExtensionDiscovery
+ (id)extensionBasedActivityForExtension:(id)a3;
+ (id)extensionMatchingDictionariesForExtensionItems:(id)a3;
+ (void)registerContinuousExtensionsDiscoveryOnLaunch;
- (NSArray)extensionPointIdentifiers;
- (_UIActivityApplicationExtensionDiscovery)init;
- (_UIActivityApplicationExtensionDiscovery)initWithExtensionPointIdentifiers:(id)a3;
- (id)_extensionsForMatchingContext:(id)a3 error:(id *)a4;
- (id)activitiesForMatchingContext:(id)a3 error:(id *)a4;
- (id)fetchShortcutsBlock;
- (id)reportExtensionsCacheResult;
- (void)dealloc;
- (void)primeWithDiscoveryContext:(id)a3;
- (void)setExtensionPointIdentifiers:(id)a3;
- (void)setFetchShortcutsBlock:(id)a3;
@end

@implementation _UIActivityApplicationExtensionDiscovery

+ (id)extensionBasedActivityForExtension:(id)a3
{
  return _UIActivityFromApplicationExtension(a3);
}

+ (id)extensionMatchingDictionariesForExtensionItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_matchingDictionaryRepresentation", (void)v13);
        v11 = objc_msgSend(v10, "sh_removingUnsupportedTypes");
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (_UIActivityApplicationExtensionDiscovery)initWithExtensionPointIdentifiers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityApplicationExtensionDiscovery;
  id v5 = [(_UIActivityApplicationExtensionDiscovery *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
      uint64_t v7 = [v6 allObjects];

      id v4 = (id)v7;
    }
    [(_UIActivityApplicationExtensionDiscovery *)v5 setExtensionPointIdentifiers:v4];
  }

  return v5;
}

- (_UIActivityApplicationExtensionDiscovery)init
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4F282B8];
  v6[1] = @"com.apple.services";
  v6[2] = @"com.apple.share-services";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [(_UIActivityApplicationExtensionDiscovery *)self initWithExtensionPointIdentifiers:v3];

  return v4;
}

- (void)dealloc
{
  [(_UIActivityApplicationExtensionDiscovery *)self setExtensionPointIdentifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityApplicationExtensionDiscovery;
  [(_UIActivityApplicationExtensionDiscovery *)&v3 dealloc];
}

+ (void)registerContinuousExtensionsDiscoveryOnLaunch
{
  id v2 = +[_UIActivityApplicationExtensionsCache sharedExtensionsCache];
}

- (void)primeWithDiscoveryContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [a3 activityItemValueExtensionMatchingDictionaries];
  uint64_t v6 = _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(v5, 0);
  id v9 = [v4 dictionaryWithDictionary:v6];

  uint64_t v7 = [(_UIActivityApplicationExtensionDiscovery *)self extensionPointIdentifiers];
  [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F282B0]];

  uint64_t v8 = +[_UIActivityApplicationExtensionsCache sharedExtensionsCache];
  [v8 primeExtensionsResultWithMatchingAttributes:v9];
}

- (id)_extensionsForMatchingContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 activityItemValueExtensionMatchingDictionaries];
  uint64_t v8 = [v7 count];

  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8)
  {
    v41 = a4;
    v10 = (void *)MEMORY[0x1E4F1CA60];
    v11 = [v6 activityItemValueExtensionMatchingDictionaries];
    v12 = _UIApplicationExtensionDiscoveryGetAttributesForExtensionMatchingDictionaries(v11, [v6 shouldMatchOnlyUserElectedExtensions]);
    long long v13 = [v10 dictionaryWithDictionary:v12];

    long long v14 = [(_UIActivityApplicationExtensionDiscovery *)self extensionPointIdentifiers];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F282B0]];

    long long v15 = +[_UIActivityApplicationExtensionsCache sharedExtensionsCache];
    long long v16 = [v15 extensionsResultWithMatchingAttributes:v13];

    v17 = [v16 extensions];
    id v18 = v6;
    if (v17) {
      v19 = v17;
    }
    else {
      v19 = v9;
    }
    id v20 = v18;
    v21 = (void *)MEMORY[0x1E4F1CA48];
    id v22 = v19;
    id v40 = v17;
    v23 = [v21 arrayWithArray:v22];
    v24 = [v23 valueForKeyPath:@"identifier"];
    v25 = [(objc_class *)getMCProfileConnectionClass_2() sharedConnection];
    if ([v25 isOpenInRestrictionInEffect])
    {
      uint64_t v26 = [v20 isContentManaged];
      v27 = [v20 sourceApplicationIdentifier];
      v28 = [v25 allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v24 originatingAppBundleID:v27 originatingAccountIsManaged:v26];

      if (([v20 shouldExcludeiCloudAddToDriveActivity] & 1) == 0)
      {
        v29 = [MEMORY[0x1E4F1CA48] arrayWithArray:v28];
        [v29 addObject:@"com.apple.DocumentManagerUICore.SaveToFiles"];

        v28 = v29;
      }

      v24 = v28;
    }
    if (v24)
    {
      if ([v20 shouldExcludeiCloudAddToDriveActivity])
      {
        v30 = [MEMORY[0x1E4F1CA48] arrayWithArray:v24];
        [v30 removeObject:@"com.apple.DocumentManagerUICore.SaveToFiles"];

        v24 = v30;
      }
      if ([v20 shouldExcludeiCloudSharingActivity])
      {
        v31 = [MEMORY[0x1E4F1CA48] arrayWithArray:v24];
        [v31 removeObject:@"com.apple.UIKit.activity.CloudSharing"];

        v24 = v31;
      }
      v32 = [MEMORY[0x1E4F1CA48] arrayWithArray:v24];
      [v32 removeObject:@"com.apple.shortcuts.Run-Workflow"];
    }
    else
    {
      v32 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v33 = v32;
    uint64_t v34 = [v33 indexOfObject:@"com.ios.uikit.TestingHarness.TestingActionExtension"];
    v35 = v33;
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v36 = v34;
      v35 = [MEMORY[0x1E4F1CA48] arrayWithArray:v33];
      [v35 removeObjectAtIndex:v36];
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = ___UIApplicationExtensionDiscoveryGetAllowedExtensions_block_invoke;
    v42[3] = &unk_1E5A22CC8;
    id v43 = v35;
    id v37 = v35;
    v38 = [v22 indexesOfObjectsWithOptions:0 passingTest:v42];

    [v23 removeObjectsAtIndexes:v38];
    id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v23];
    [v9 sortUsingComparator:&__block_literal_global_26];

    if (v41)
    {
      id *v41 = [v16 error];
    }
  }
  return v9;
}

- (id)activitiesForMatchingContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 activityItemValueExtensionMatchingDictionaries];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [(_UIActivityApplicationExtensionDiscovery *)self _extensionsForMatchingContext:v6 error:a4];
    v10 = [(_UIActivityApplicationExtensionDiscovery *)self fetchShortcutsBlock];
    if (v10)
    {
      v11 = [v6 activityItemValueExtensionMatchingDictionaries];
      v12 = [v6 sourceApplicationIdentifier];
      long long v13 = ((void (**)(void, void *, void *))v10)[2](v10, v11, v12);
    }
    else
    {
      long long v13 = 0;
    }
    long long v15 = (void *)MEMORY[0x1E4F1CA48];
    id v16 = v9;
    id v17 = v13;
    id v18 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v17, "count") + objc_msgSend(v16, "count"));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke;
    v25[3] = &unk_1E5A22CF0;
    id v19 = v18;
    id v26 = v19;
    [v16 enumerateObjectsUsingBlock:v25];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = ___UIActivitiesFromApplicationExtensionsAndWorkflows_block_invoke_2;
    v23[3] = &unk_1E5A22D18;
    id v20 = v19;
    id v24 = v20;
    [v17 enumerateObjectsUsingBlock:v23];

    v21 = v24;
    id v14 = v20;
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (id)reportExtensionsCacheResult
{
  id v2 = +[_UIActivityApplicationExtensionsCache sharedExtensionsCache];
  objc_super v3 = [v2 reportExtensionsCacheResult];

  return v3;
}

- (NSArray)extensionPointIdentifiers
{
  return self->_extensionPointIdentifiers;
}

- (void)setExtensionPointIdentifiers:(id)a3
{
}

- (id)fetchShortcutsBlock
{
  return self->_fetchShortcutsBlock;
}

- (void)setFetchShortcutsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShortcutsBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifiers, 0);
}

@end