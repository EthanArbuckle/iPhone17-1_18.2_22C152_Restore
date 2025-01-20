@interface WFLinkActionProvider
+ (BOOL)approvedForPublicDrawerToDisplayActionIdentifier:(id)a3;
+ (BOOL)isFullyQualifiedActionIdentifier:(id)a3 withMetadata:(id)a4 visibleForUse:(int64_t)a5;
+ (BOOL)shouldAllowActionWithIdentifier:(id)a3;
+ (BOOL)shouldAuditActionWithIdentifier:(id)a3;
+ (id)denyListedLinkActionIdentifiers;
+ (id)sharedProvider;
+ (id)shortcutsPublicActionIdentifierHashes;
+ (unint64_t)allowDenyStateForActionIdentifier:(id)a3;
- (BOOL)isDiscontinuedWithAvailability:(id)a3;
- (BOOL)isObservingInstalledApplicationsChanges;
- (BOOL)serializedAppIntentDescriptorIsValid:(id)a3;
- (INSystemAppMapper)systemAppMapper;
- (LNMetadataProvider)metadataProvider;
- (NSDictionary)actionMetadataByAppIdentifier;
- (NSDictionary)entityMetadataByAppIdentifier;
- (NSDictionary)enumMetadataByAppIdentifier;
- (NSDictionary)queryMetadataByAppIdentifier;
- (OS_dispatch_queue)queue;
- (WFLinkActionProvider)initWithMetadataProvider:(id)a3;
- (id)actionMetadataByAppBundleIdentifier:(id)a3;
- (id)actionMetadataByAppBundleIdentifier:(id)a3 actionIdentifier:(id)a4;
- (id)actionMetadataByUpdatingWithEnumAndEntityMetadata:(id)a3 bundleIdentifier:(id)a4;
- (id)appDescriptorForActionRequest:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 fullyQualifiedIdentifier:(id *)a6 forceLocalActionsOnly:(BOOL)a7;
- (id)appDescriptorForActionRequest:(id)a3 forceLocalActionsOnly:(BOOL)a4;
- (id)availabilityWithAvailabilityAnnotations:(id)a3;
- (id)availableActionIdentifiers;
- (id)createActionsForBundleIdentifier:(id)a3;
- (id)customIntentMigratedActionIdentifierWithLaunchId:(id)a3 className:(id)a4;
- (id)definitionForMissingActionWithSerializedParameters:(id)a3;
- (id)disabledOnPlatformsWithAvailability:(id)a3;
- (id)entityMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4;
- (id)enumMetadataByAppBundleIdentifier:(id)a3 enumIdentifier:(id)a4;
- (id)getAppSettingActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 entityMetadataByAppIdentifier:(id)a5 localActionsOnly:(BOOL)a6;
- (id)linkActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 actionMetadataByAppIdentifier:(id)a5 enumMetadataByAppIdentifier:(id)a6 entityMetadataByAppIdentifier:(id)a7 forceLocalActionsOnly:(BOOL)a8;
- (id)linkContentItemFilterActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 entityMetadata:(id)a7 queryMetadata:(id)a8;
- (id)linkCurrentPlatformName;
- (id)queryMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4;
- (id)queryMetadataByAppBundleIdentifier:(id)a3 queryIdentifier:(id)a4;
- (id)resolvedActionIdentifiersForActionRequests:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 forceLocalActionsOnly:(BOOL)a6;
- (id)settingUpdaterActionForActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7;
- (id)targetedEntityUpdaterActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7;
- (os_unfair_lock_s)actionRequestsLock;
- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4;
- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4 forceLocalActionsOnly:(BOOL)a5;
- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4;
- (void)setObservingInstalledApplicationsChanges:(BOOL)a3;
@end

@implementation WFLinkActionProvider

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_216(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_213(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (id)linkActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 actionMetadataByAppIdentifier:(id)a5 enumMetadataByAppIdentifier:(id)a6 entityMetadataByAppIdentifier:(id)a7 forceLocalActionsOnly:(BOOL)a8
{
  BOOL v99 = a8;
  v113[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a6;
  v18 = [v14 bundleIdentifier];
  v105 = v15;
  v19 = [v15 objectForKeyedSubscript:v18];
  v20 = [v14 actionIdentifier];
  v21 = [v19 objectForKeyedSubscript:v20];

  v22 = [v17 objectForKeyedSubscript:v18];

  v23 = [v16 objectForKeyedSubscript:v18];

  v103 = v23;
  v104 = v22;
  v24 = WFBuildActionMetadataWithProperties(v21, v22, v23);

  if (!v24)
  {
    v33 = 0;
    goto LABEL_46;
  }
  v25 = [v24 effectiveBundleIdentifiers];
  v101 = self;
  id v102 = v14;
  if ([v25 count] == 1)
  {
    v26 = [v24 effectiveBundleIdentifiers];
    v27 = [v26 firstObject];
    if ([v27 type] == 2)
    {
      v28 = [v24 effectiveBundleIdentifiers];
      [v28 firstObject];
      v30 = id v29 = v13;
      v31 = [v30 bundleIdentifier];
      int v32 = [v31 isEqualToString:v18];

      id v13 = v29;
      id v14 = v102;
    }
    else
    {
      int v32 = 0;
    }
  }
  else
  {
    int v32 = 0;
  }

  v34 = [v24 effectiveBundleIdentifiers];
  if ([v34 count] == 1)
  {
    v35 = [v24 effectiveBundleIdentifiers];
    v36 = [v35 firstObject];
    if ([v36 type] == 3)
    {
      v37 = [v24 effectiveBundleIdentifiers];
      [v37 firstObject];
      v38 = id v96 = v13;
      v39 = [v38 bundleIdentifier];
      int v40 = [v39 isEqualToString:v18];

      id v14 = v102;
      id v13 = v96;
    }
    else
    {
      int v40 = 0;
    }
  }
  else
  {
    int v40 = 0;
  }

  char v91 = v32 | v40;
  if ((v32 | v40))
  {
    id v41 = 0;
  }
  else
  {
    v42 = [(WFLinkActionProvider *)v101 appDescriptorForActionRequest:v13 forceLocalActionsOnly:v99];
    if (v42)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v43 = v42;
      }
      else {
        v43 = 0;
      }
    }
    else
    {
      v43 = 0;
    }
    id v41 = v43;
  }
  v44 = [v14 actionIdentifier];
  v45 = WFShortcutsActionIdentifierForClassOverrideSearch(v18, v44);

  v46 = +[WFLinkAction classForLinkActionWithIdentifier:v45 metadata:v24];
  if (!v46) {
    v46 = (objc_class *)objc_opt_class();
  }
  v47 = objc_opt_new();
  v48 = [v24 requiredCapabilities];

  if (v48)
  {
    v49 = [v24 requiredCapabilities];
    v50 = WFResourceDefinitionsForRequiredCapabilities(v49);
    [v47 setObject:v50 forKeyedSubscript:@"RequiredResources"];

    id v14 = v102;
  }
  v51 = [v14 actionIdentifier];
  v100 = v18;
  uint64_t v52 = WFShortcutsActionIdentifierFromLinkIdentifiers(v18, v51);

  v98 = (void *)v52;
  if (v52)
  {
    v94 = v45;
    v95 = v41;
    v97 = v13;
    v53 = [v24 deprecationMetadata];
    uint64_t v54 = [v53 replacedByIntentIdentifier];

    v55 = v100;
    if (v54)
    {
      v56 = [v105 objectForKeyedSubscript:v100];
      v57 = [v56 objectForKeyedSubscript:v54];
      v58 = [v57 title];

      [v47 setObject:v58 forKeyedSubscript:@"DiscontinuedReplacementTitle"];
    }
    v59 = v46;
    v112[0] = @"DisabledOnPlatforms";
    v60 = objc_msgSend(v24, "availabilityAnnotations", v55);
    v61 = [(WFLinkActionProvider *)v101 disabledOnPlatformsWithAvailability:v60];
    v112[1] = @"Discontinued";
    v113[0] = v61;
    v62 = NSNumber;
    v63 = [v24 deprecationMetadata];
    if (v63)
    {
      uint64_t v64 = 1;
    }
    else
    {
      v46 = [v24 availabilityAnnotations];
      uint64_t v64 = [(WFLinkActionProvider *)v101 isDiscontinuedWithAvailability:v46];
    }
    v66 = [v62 numberWithInt:v64];
    v113[1] = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:2];
    [v47 addEntriesFromDictionary:v67];

    if (!v63) {
    v68 = [v24 systemProtocols];
    }
    v69 = [MEMORY[0x1E4F72DD8] audioRecordingProtocol];
    int v70 = [v68 containsObject:v69];

    if (v70) {
      [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"MightStartAudioRecording"];
    }
    v71 = v98;
    uint64_t v72 = WFLinkActionBundleIdentifierOverrides(v98);
    v73 = v59;
    if (v72 || ([v24 attributionBundleIdentifier], (uint64_t v72 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v110 = *MEMORY[0x1E4FB4508];
      v93 = (void *)v72;
      uint64_t v111 = v72;
      unint64_t v74 = 0x1E4F1C000uLL;
      v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
      [v47 setObject:v75 forKeyedSubscript:@"LinkActionDisplayedAppDescriptor"];

      v76 = v101;
    }
    else
    {
      v93 = 0;
      v76 = v101;
      unint64_t v74 = 0x1E4F1C000;
    }
    v77 = [v24 shortcutsActionMetadata];
    v92 = v77;
    if (v77)
    {
      v78 = [v77 dictionaryRepresentation];
      [v47 addEntriesFromDictionary:v78];
    }
    else
    {
      if (v91) {
        goto LABEL_44;
      }
      if (v95)
      {
        v78 = [v95 serializedRepresentation];
        uint64_t v87 = *MEMORY[0x1E4FB4508];
      }
      else
      {
        uint64_t v87 = *MEMORY[0x1E4FB4508];
        uint64_t v108 = *MEMORY[0x1E4FB4508];
        v109 = v100;
        v78 = [*(id *)(v74 + 2536) dictionaryWithObjects:&v109 forKeys:&v108 count:1];
      }
      v88 = [v78 objectForKeyedSubscript:v87];

      if (v88)
      {
        v106 = @"ActionRequiresAppInstallation";
        uint64_t v107 = MEMORY[0x1E4F1CC38];
        v89 = [*(id *)(v74 + 2536) dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        uint64_t v90 = objc_msgSend(v78, "if_dictionaryByAddingEntriesFromDictionary:", v89);

        [v47 setObject:v90 forKeyedSubscript:@"AppDefinition"];
        v78 = (void *)v90;
        v71 = v98;
      }
    }

LABEL_44:
    v79 = [(WFActionProvider *)v76 defaultActionDefinition];
    v80 = [v79 definitionByAddingEntriesInDictionary:v47];

    id v81 = [v73 alloc];
    [v97 serializedParameters];
    v83 = v82 = v47;
    v84 = v71;
    id v41 = v95;
    v85 = (void *)v54;
    v65 = v71;
    id v14 = v102;
    v33 = (void *)[v81 initWithIdentifier:v84 metadata:v24 definition:v80 serializedParameters:v83 appIntentDescriptor:v95 fullyQualifiedActionIdentifier:v102];

    v47 = v82;
    id v13 = v97;
    v45 = v94;
    goto LABEL_45;
  }
  v33 = 0;
  v65 = 0;
LABEL_45:

  v18 = v100;
LABEL_46:

  return v33;
}

- (id)appDescriptorForActionRequest:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 fullyQualifiedIdentifier:(id *)a6 forceLocalActionsOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  if (!v7)
  {
    p_actionRequestsLock = &self->_actionRequestsLock;
    id v19 = a3;
    os_unfair_lock_lock(&self->_actionRequestsLock);
    v20 = [v19 actionIdentifier];
    id v16 = WFLinkActionIdentifierFromShortcutsActionIdentifier(v20);

    v21 = [v19 serializedParameters];

    v22 = [v21 objectForKey:@"AppIntentDescriptor"];

    if (v22
      && [(WFLinkActionProvider *)self serializedAppIntentDescriptorIsValid:v22])
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F302C8]) initWithSerializedRepresentation:v22];
    }
    else
    {
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F302C8]) initWithFullyQualifiedActionIdentifier:v16];
    }
    v24 = (void *)v23;
    v25 = [MEMORY[0x1E4F302D0] sharedResolver];
    v26 = [v25 resolvedAppIntentMatchingDescriptor:v24 availableActions:v12 availableEntities:v13];

    if (v26
      && ([v26 intentIdentifier], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v28 = (void *)v27,
          [v26 bundleIdentifier],
          id v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v28,
          v29))
    {
      id v30 = objc_alloc(MEMORY[0x1E4F72C98]);
      v31 = [v26 intentIdentifier];
      [v26 bundleIdentifier];
      int v32 = v36 = p_actionRequestsLock;
      id v33 = (id)[v30 initWithActionIdentifier:v31 bundleIdentifier:v32];

      p_actionRequestsLock = v36;
      if (!a6) {
        goto LABEL_16;
      }
    }
    else
    {
      id v33 = v16;
      if (!a6)
      {
LABEL_16:
        os_unfair_lock_unlock(p_actionRequestsLock);
        if (v26) {
          v34 = v26;
        }
        else {
          v34 = v24;
        }
        id v17 = v34;

        goto LABEL_20;
      }
    }
    *a6 = v33;
    goto LABEL_16;
  }
  id v14 = a3;
  id v15 = [v14 actionIdentifier];

  id v16 = WFLinkActionIdentifierFromShortcutsActionIdentifier(v15);

  if (a6) {
    *a6 = v16;
  }
  id v17 = (id)[objc_alloc(MEMORY[0x1E4F302C8]) initWithFullyQualifiedActionIdentifier:v16];
LABEL_20:

  return v17;
}

- (id)disabledOnPlatformsWithAvailability:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  BOOL v7 = [(WFLinkActionProvider *)self availabilityWithAvailabilityAnnotations:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__WFLinkActionProvider_disabledOnPlatformsWithAvailability___block_invoke;
  v11[3] = &unk_1E6559428;
  id v8 = v6;
  id v13 = self;
  SEL v14 = a2;
  id v12 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  id v9 = v8;
  return v9;
}

- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4 forceLocalActionsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v82 = v5;
  id v8 = [(WFLinkActionProvider *)self resolvedActionIdentifiersForActionRequests:v7 availableActions:self->_actionMetadataByAppIdentifier availableEntities:self->_entityMetadataByAppIdentifier forceLocalActionsOnly:v5];
  BOOL v99 = self;
  v83 = self->_actionMetadataByAppIdentifier;
  if (v83) {
    goto LABEL_4;
  }
  id v9 = [(WFLinkActionProvider *)self metadataProvider];
  id v139 = 0;
  uint64_t v10 = [v9 actionsWithFullyQualifiedIdentifiers:v8 error:&v139];
  v11 = (NSDictionary *)v139;

  if (v10)
  {
    v83 = (NSDictionary *)v10;

    self = v99;
LABEL_4:
    id v12 = self->_enumMetadataByAppIdentifier;
    if (!v12)
    {
      uint64_t v90 = objc_opt_new();
      id v13 = (void *)MEMORY[0x1E4F1CAD0];
      SEL v14 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_212_74453);
      id v15 = [v13 setWithArray:v14];

      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      obuint64_t j = v15;
      uint64_t v96 = [obj countByEnumeratingWithState:&v135 objects:v151 count:16];
      if (v96)
      {
        v75 = v8;
        id v77 = v7;
        id v16 = 0;
        uint64_t v93 = *(void *)v136;
        id v17 = v99;
        do
        {
          for (uint64_t i = 0; i != v96; ++i)
          {
            id v19 = v16;
            if (*(void *)v136 != v93) {
              objc_enumerationMutation(obj);
            }
            v20 = *(NSDictionary **)(*((void *)&v135 + 1) + 8 * i);
            v21 = [(WFLinkActionProvider *)v17 metadataProvider];
            v134 = v16;
            v22 = [v21 enumsForBundleIdentifier:v20 error:&v134];
            id v16 = v134;

            if (v22)
            {
              v100 = v16;
              uint64_t v23 = objc_opt_new();
              long long v130 = 0u;
              long long v131 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              id v24 = v22;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v130 objects:v144 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v131;
                do
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v131 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    id v29 = *(void **)(*((void *)&v130 + 1) + 8 * j);
                    id v30 = [v29 identifier];
                    [v23 setObject:v29 forKey:v30];
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v130 objects:v144 count:16];
                }
                while (v26);
              }

              [v90 setObject:v23 forKey:v20];
              id v17 = v99;
              id v16 = v100;
            }
            else
            {
              uint64_t v23 = getWFActionsLogObject();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                __int16 v147 = 2114;
                v148 = v20;
                __int16 v149 = 2114;
                v150 = v16;
                _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Unable to get enum for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }
          }
          uint64_t v96 = [obj countByEnumeratingWithState:&v135 objects:v151 count:16];
        }
        while (v96);

        id v8 = v75;
        id v7 = v77;
      }

      id v12 = (NSDictionary *)[v90 copy];
      self = v99;
    }
    v31 = self->_entityMetadataByAppIdentifier;
    if (!v31)
    {
      v80 = v12;
      char v91 = objc_opt_new();
      int v32 = (void *)MEMORY[0x1E4F1CAD0];
      id v33 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_215_74455);
      v34 = [v32 setWithArray:v33];

      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      id obja = v34;
      uint64_t v97 = [obja countByEnumeratingWithState:&v126 objects:v143 count:16];
      if (v97)
      {
        v76 = v8;
        id v78 = v7;
        v35 = 0;
        uint64_t v94 = *(void *)v127;
        v36 = v99;
        do
        {
          for (uint64_t k = 0; k != v97; ++k)
          {
            v38 = v35;
            if (*(void *)v127 != v94) {
              objc_enumerationMutation(obja);
            }
            v39 = *(NSDictionary **)(*((void *)&v126 + 1) + 8 * k);
            int v40 = [(WFLinkActionProvider *)v36 metadataProvider];
            v125 = v35;
            id v41 = [v40 entitiesForBundleIdentifier:v39 error:&v125];
            v35 = v125;

            if (v41)
            {
              v101 = v35;
              v42 = objc_opt_new();
              long long v121 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              id v43 = v41;
              uint64_t v44 = [v43 countByEnumeratingWithState:&v121 objects:v142 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v122;
                do
                {
                  for (uint64_t m = 0; m != v45; ++m)
                  {
                    if (*(void *)v122 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    v48 = *(void **)(*((void *)&v121 + 1) + 8 * m);
                    v49 = [v48 typeName];
                    [v42 setObject:v48 forKey:v49];
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v121 objects:v142 count:16];
                }
                while (v45);
              }

              [v91 setObject:v42 forKey:v39];
              v36 = v99;
              v35 = v101;
            }
            else
            {
              v42 = getWFActionsLogObject();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                __int16 v147 = 2114;
                v148 = v39;
                __int16 v149 = 2114;
                v150 = v35;
                _os_log_impl(&dword_1C7F0A000, v42, OS_LOG_TYPE_ERROR, "%s Unable to get entities for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }
          }
          uint64_t v97 = [obja countByEnumeratingWithState:&v126 objects:v143 count:16];
        }
        while (v97);

        id v8 = v76;
        id v7 = v78;
      }

      v31 = (NSDictionary *)[v91 copy];
      self = v99;
      id v12 = v80;
    }
    v50 = self->_queryMetadataByAppIdentifier;
    if (!v50)
    {
      id v81 = v12;
      v85 = objc_opt_new();
      v51 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v52 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_218);
      v53 = [v51 setWithArray:v52];

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v84 = v53;
      id objb = (id)[v84 countByEnumeratingWithState:&v117 objects:v141 count:16];
      if (objb)
      {
        unint64_t v74 = v31;
        id v79 = v7;
        uint64_t v54 = 0;
        uint64_t v86 = *(void *)v118;
        v55 = v99;
        do
        {
          for (n = 0; n != objb; n = (char *)n + 1)
          {
            v57 = v54;
            if (*(void *)v118 != v86) {
              objc_enumerationMutation(v84);
            }
            v58 = *(NSDictionary **)(*((void *)&v117 + 1) + 8 * (void)n);
            v59 = [(WFLinkActionProvider *)v55 metadataProvider];
            v116 = v54;
            v60 = [v59 queriesForBundleIdentifier:v58 ofType:0 error:&v116];
            uint64_t v54 = v116;

            if (v60)
            {
              v95 = n;
              v98 = v54;
              v61 = objc_opt_new();
              long long v112 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              v92 = v60;
              id v62 = v60;
              uint64_t v63 = [v62 countByEnumeratingWithState:&v112 objects:v140 count:16];
              if (v63)
              {
                uint64_t v64 = v63;
                uint64_t v65 = *(void *)v113;
                do
                {
                  for (iuint64_t i = 0; ii != v64; ++ii)
                  {
                    if (*(void *)v113 != v65) {
                      objc_enumerationMutation(v62);
                    }
                    v67 = *(void **)(*((void *)&v112 + 1) + 8 * ii);
                    if (WFQueryMetadataIsEligibleForAction(v67, v58))
                    {
                      v68 = [v67 entityType];
                      [v61 setObject:v67 forKey:v68];
                    }
                    else
                    {
                      v68 = getWFActionsLogObject();
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                      {
                        v69 = [v67 identifier];
                        *(_DWORD *)buf = 136315650;
                        v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                        __int16 v147 = 2112;
                        v148 = v69;
                        __int16 v149 = 2112;
                        v150 = v58;
                        _os_log_impl(&dword_1C7F0A000, v68, OS_LOG_TYPE_DEFAULT, "%s Skipping query (%@) for bundle (%@) because it is not eligible for an action", buf, 0x20u);
                      }
                    }
                  }
                  uint64_t v64 = [v62 countByEnumeratingWithState:&v112 objects:v140 count:16];
                }
                while (v64);
              }

              [v85 setObject:v61 forKey:v58];
              uint64_t v54 = v98;
              v55 = v99;
              v60 = v92;
              n = v95;
            }
            else
            {
              v61 = getWFActionsLogObject();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                __int16 v147 = 2114;
                v148 = v58;
                __int16 v149 = 2114;
                v150 = v54;
                _os_log_impl(&dword_1C7F0A000, v61, OS_LOG_TYPE_ERROR, "%s Unable to get queries for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }
          }
          id objb = (id)[v84 countByEnumeratingWithState:&v117 objects:v141 count:16];
        }
        while (objb);

        id v7 = v79;
        v31 = v74;
      }

      v50 = (NSDictionary *)[v85 copy];
      self = v99;
      id v12 = v81;
    }
    [(NSDictionary *)v12 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_222];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_3;
    v110[3] = &unk_1E6559120;
    int v70 = v50;
    uint64_t v111 = v70;
    [(NSDictionary *)v31 enumerateKeysAndObjectsUsingBlock:v110];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_5;
    v102[3] = &unk_1E6559148;
    id v103 = v8;
    v104 = v83;
    v105 = self;
    v106 = v12;
    BOOL v109 = v82;
    uint64_t v107 = v31;
    uint64_t v108 = v70;
    v71 = v70;
    uint64_t v72 = v31;
    v73 = v12;
    v11 = v83;
    [v7 enumerateObjectsUsingBlock:v102];

    goto LABEL_72;
  }
  v73 = getWFActionsLogObject();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
    __int16 v147 = 2114;
    v148 = v11;
    _os_log_impl(&dword_1C7F0A000, v73, OS_LOG_TYPE_ERROR, "%s Unable to get actions from metadata provider %{public}@", buf, 0x16u);
  }
LABEL_72:
}

+ (BOOL)shouldAllowActionWithIdentifier:(id)a3
{
  return [a1 allowDenyStateForActionIdentifier:a3] != 2;
}

+ (unint64_t)allowDenyStateForActionIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 denyListedLinkActionIdentifiers];
  int v6 = [v5 containsObject:v4];

  if (v6) {
    return 2;
  }
  else {
    return 0;
  }
}

+ (id)denyListedLinkActionIdentifiers
{
  if (denyListedLinkActionIdentifiers_onceToken != -1) {
    dispatch_once(&denyListedLinkActionIdentifiers_onceToken, &__block_literal_global_305);
  }
  v2 = (void *)denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers;
  return v2;
}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (id)resolvedActionIdentifiersForActionRequests:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 forceLocalActionsOnly:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __124__WFLinkActionProvider_resolvedActionIdentifiersForActionRequests_availableActions_availableEntities_forceLocalActionsOnly___block_invoke;
  v16[3] = &unk_1E6559060;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  BOOL v19 = a6;
  id v12 = v11;
  id v13 = v10;
  SEL v14 = objc_msgSend(a3, "if_compactMap:", v16);

  return v14;
}

- (id)appDescriptorForActionRequest:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  return [(WFLinkActionProvider *)self appDescriptorForActionRequest:a3 availableActions:self->_actionMetadataByAppIdentifier availableEntities:self->_entityMetadataByAppIdentifier fullyQualifiedIdentifier:0 forceLocalActionsOnly:a4];
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  id v4 = [v13 attributionBundleIdentifier];
  BOOL v5 = [v13 shortcutsActionMetadata];

  if (v5)
  {
    int v6 = [v13 shortcutsActionMetadata];
    uint64_t v7 = [v6 attributionBundleIdentifierWithDefaultValue:v4];

    id v4 = (void *)v7;
  }
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v9 = [v13 identifier];
  id v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = objc_msgSend(v13, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v10, *(void *)(a1 + 40), v4);

  id v12 = [MEMORY[0x1E4F5A858] sharedRegistry];
  [v12 registerContentItemClass:v11];
}

void __60__WFLinkActionProvider_disabledOnPlatformsWithAvailability___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ((id)*MEMORY[0x1E4F72840] == v5)
  {
    if ((id)*MEMORY[0x1E4F728E0] == v9)
    {
      [*(id *)(a1 + 32) addObject:@"Pad"];
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = @"Phone";
    }
    else if ((id)*MEMORY[0x1E4F728E8] == v9)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = @"Desktop";
    }
    else if ((id)*MEMORY[0x1E4F72900] == v9)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = @"Watch";
    }
    else
    {
      if ((id)*MEMORY[0x1E4F728F0] == v9) {
        goto LABEL_13;
      }
      if ((id)*MEMORY[0x1E4F728F8] != v9)
      {
        int v6 = [MEMORY[0x1E4F28B00] currentHandler];
        [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"WFLinkActionProvider.m", 1388, @"Unknown OS Execution Platform: %@", v9 object file lineNumber description];

        goto LABEL_13;
      }
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = @"XR";
    }
    [v7 addObject:v8];
  }
LABEL_13:
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v7 = [v6 bundleIdentifier];
  id v8 = [v6 actionIdentifier];
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
  id v10 = [v9 objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v12 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];
    id v13 = [v12 objectForKeyedSubscript:v8];

    SEL v14 = [*(id *)(a1 + 64) objectForKeyedSubscript:v7];
    uint64_t v23 = [v14 objectForKeyedSubscript:v8];

    if (v13 && WFQueryMetadataIsEligibleForAction(v13, v7))
    {
      id v15 = [*(id *)(a1 + 48) linkContentItemFilterActionWithActionRequest:v5 fullyQualifiedActionIdentifier:v6 enumMetadataByAppIdentifier:*(void *)(a1 + 56) entityMetadataByAppIdentifier:*(void *)(a1 + 64) entityMetadata:v23 queryMetadata:v13];
      id v16 = getWFActionsLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v25 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]_block_invoke";
        __int16 v26 = 2112;
        uint64_t v27 = v15;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_DEFAULT, "%s Created WFLinkContentItemFilterAction: %@", buf, 0x16u);
      }

      if (v15) {
        [v5 setResult:v15];
      }
    }
    if ([v8 isEqualToString:@"WFAppSettingEntityUpdaterAction"])
    {
      uint64_t v17 = [*(id *)(a1 + 48) settingUpdaterActionForActionRequest:v5 fullyQualifiedActionIdentifier:v6 enumMetadataByAppIdentifier:*(void *)(a1 + 56) entityMetadataByAppIdentifier:*(void *)(a1 + 64) localActionsOnly:*(unsigned __int8 *)(a1 + 80)];
    }
    else if ([v8 isEqualToString:@"WFGetAppSettingAction"])
    {
      uint64_t v17 = [*(id *)(a1 + 48) getAppSettingActionForRequest:v5 fullyQualifiedActionIdentifier:v6 entityMetadataByAppIdentifier:*(void *)(a1 + 64) localActionsOnly:*(unsigned __int8 *)(a1 + 80)];
    }
    else
    {
      v22 = [v5 actionIdentifier];
      id v18 = [v22 componentsSeparatedByString:@"-"];
      BOOL v19 = [v18 lastObject];
      int v21 = [v19 isEqualToString:@"UpdatableEntity"];

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v17 = [*(id *)(a1 + 48) targetedEntityUpdaterActionForRequest:v5 fullyQualifiedActionIdentifier:v6 enumMetadataByAppIdentifier:*(void *)(a1 + 56) entityMetadataByAppIdentifier:*(void *)(a1 + 64) localActionsOnly:*(unsigned __int8 *)(a1 + 80)];
    }
    v20 = (void *)v17;
    if (v17) {
      [v5 setResult:v17];
    }

    goto LABEL_20;
  }
  uint64_t v11 = [*(id *)(a1 + 48) linkActionWithActionRequest:v5 fullyQualifiedActionIdentifier:v6 actionMetadataByAppIdentifier:*(void *)(a1 + 40) enumMetadataByAppIdentifier:*(void *)(a1 + 56) entityMetadataByAppIdentifier:*(void *)(a1 + 64) forceLocalActionsOnly:*(unsigned __int8 *)(a1 + 80)];
  if (v11)
  {
    [v5 setResult:v11];
  }
LABEL_21:
}

- (BOOL)isDiscontinuedWithAvailability:(id)a3
{
  id v4 = [(WFLinkActionProvider *)self availabilityWithAvailabilityAnnotations:a3];
  id v5 = [(WFLinkActionProvider *)self linkCurrentPlatformName];
  int v6 = [v4 objectForKeyedSubscript:v5];

  LOBYTE(v5) = v6 == (void *)*MEMORY[0x1E4F72838];
  return (char)v5;
}

- (id)availabilityWithAvailabilityAnnotations:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F72B60];
  id v5 = a3;
  int v6 = (void *)[[v4 alloc] initWithAvailabilityAnnotations:v5];

  uint64_t v7 = [(WFLinkActionProvider *)self linkCurrentPlatformName];
  id v8 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v9 = [v8 systemVersion];
  id v10 = [v6 availabilityWithPlatform:v7 platformVersion:v9];

  return v10;
}

- (id)linkCurrentPlatformName
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  unint64_t v3 = [v2 platform];

  if (v3 <= 2) {
    id v4 = **((id **)&unk_1E6559988 + v3);
  }
  return v4;
}

uint64_t __76__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_entityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 entityType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __77__WFLinkActionProvider_entityMetadataByAppBundleIdentifier_entityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __124__WFLinkActionProvider_resolvedActionIdentifiersForActionRequests_availableActions_availableEntities_forceLocalActionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  id v5 = (id)[v3 appDescriptorForActionRequest:a2 availableActions:v2 availableEntities:v4 fullyQualifiedIdentifier:&v8 forceLocalActionsOnly:*(unsigned __int8 *)(a1 + 56)];
  id v6 = v8;
  return v6;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_202);
  }
  uint64_t v2 = (void *)sharedProvider_sharedProvider;
  return v2;
}

- (id)queryMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 700, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 701, @"Invalid parameter not satisfying: %@", @"entityIdentifier" object file lineNumber description];

LABEL_3:
  id v10 = [(NSDictionary *)self->_queryMetadataByAppIdentifier objectForKeyedSubscript:v7];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    id v12 = [(WFLinkActionProvider *)self queryMetadataByAppIdentifier];
    id v13 = [v12 objectForKeyedSubscript:v7];
    SEL v14 = [v13 objectForKeyedSubscript:v9];
  }
  else
  {
    id v15 = [(WFLinkActionProvider *)self metadataProvider];
    id v12 = [v15 queriesForBundleIdentifier:v7 ofType:0 error:0];

    if ((unint64_t)[v12 count] >= 2)
    {
      id v16 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "-[WFLinkActionProvider queryMetadataByAppBundleIdentifier:entityIdentifier:]";
        __int16 v24 = 2048;
        uint64_t v25 = [v12 count];
        __int16 v26 = 2112;
        uint64_t v27 = v9;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_DEFAULT, "%s %lu queries returned for %@ in %@", buf, 0x2Au);
      }
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __76__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_entityIdentifier___block_invoke;
    v20[3] = &unk_1E6559288;
    id v21 = v9;
    SEL v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v20);
  }
  return v14;
}

- (id)entityMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 674, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 675, @"Invalid parameter not satisfying: %@", @"entityIdentifier" object file lineNumber description];

LABEL_3:
  id v10 = [(NSDictionary *)self->_entityMetadataByAppIdentifier objectForKeyedSubscript:v7];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    id v12 = [(WFLinkActionProvider *)self entityMetadataByAppIdentifier];
    id v13 = [v12 objectForKeyedSubscript:v7];
    SEL v14 = [v13 objectForKeyedSubscript:v9];
  }
  else
  {
    id v15 = [(WFLinkActionProvider *)self metadataProvider];
    id v12 = [v15 entitiesForBundleIdentifier:v7 error:0];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__WFLinkActionProvider_entityMetadataByAppBundleIdentifier_entityIdentifier___block_invoke;
    v19[3] = &unk_1E6559238;
    id v20 = v9;
    SEL v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
  }
  return v14;
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_2;
  v6[3] = &unk_1E65590D0;
  id v7 = v4;
  id v5 = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = objc_msgSend(a3, "wf_contentItemClassWithAppBundleIdentifier:", *(void *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F5A858] sharedRegistry];
  [v4 registerContentItemClass:v3];
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_4;
  v7[3] = &unk_1E65590F8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
}

- (WFLinkActionProvider)initWithMetadataProvider:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFLinkActionProvider;
  id v6 = [(WFLinkActionProvider *)&v27 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metadataProvider, a3);
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v9 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFLinkActionProvider", v8, v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    systemAppMapper = v7->_systemAppMapper;
    v7->_systemAppMapper = (INSystemAppMapper *)v12;

    v7->_actionRequestsLock._os_unfair_lock_opaque = 0;
    Class v14 = NSClassFromString(&cfstr_Wfactionkitsta.isa);
    id v15 = (uint64_t *)MEMORY[0x1E4FB4BE8];
    if (v14)
    {
      id v16 = [MEMORY[0x1E4F28B50] bundleForClass:v14];
      uint64_t v17 = *v15;
      uint64_t v26 = 0;
      +[WFLinkMetadataRegistrationHelper registerWithBundle:v16 forBundleIdentifier:v17 error:&v26];
      if (v26)
      {
        id v18 = getWFActionsLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[WFLinkActionProvider initWithMetadataProvider:]";
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s Failed to register ActionKit metadata for built-in actions", buf, 0xCu);
        }
      }
    }
    Class v19 = NSClassFromString(&cfstr_Vcvoiceshortcu_10.isa);
    if (v19)
    {
      id v20 = [MEMORY[0x1E4F28B50] bundleForClass:v19];
      uint64_t v21 = *v15;
      uint64_t v25 = 0;
      +[WFLinkMetadataRegistrationHelper registerWithBundle:v20 forBundleIdentifier:v21 error:&v25];
      if (v25)
      {
        v22 = getWFActionsLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v29 = "-[WFLinkActionProvider initWithMetadataProvider:]";
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to register VoiceShortcutClient metadata for built-in actions", buf, 0xCu);
        }
      }
    }
    uint64_t v23 = v7;
  }
  return v7;
}

void __38__WFLinkActionProvider_sharedProvider__block_invoke()
{
  v0 = [WFLinkActionProvider alloc];
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F72CD8]) initWithOptions:2];
  uint64_t v1 = [(WFLinkActionProvider *)v0 initWithMetadataProvider:v3];
  uint64_t v2 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = v1;
}

+ (id)shortcutsPublicActionIdentifierHashes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WFLinkActionProvider_Hiding__shortcutsPublicActionIdentifierHashes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shortcutsPublicActionIdentifierHashes_onceToken != -1) {
    dispatch_once(&shortcutsPublicActionIdentifierHashes_onceToken, block);
  }
  uint64_t v2 = (void *)shortcutsPublicActionIdentifierHashes_shortcutsPublicActionIdentifiers;
  return v2;
}

void __69__WFLinkActionProvider_Hiding__shortcutsPublicActionIdentifierHashes__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 URLForResource:@"AssistantIntents-iOS" withExtension:@"metadata"];

  id v9 = 0;
  uint64_t v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v9];
  id v3 = v9;
  if (v3)
  {
    id v4 = getWFActionsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "+[WFLinkActionProvider(Hiding) shortcutsPublicActionIdentifierHashes]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s Failed to open file. %@", buf, 0x16u);
    }
  }
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v2 componentsSeparatedByString:@"\n"];
  uint64_t v7 = [v5 setWithArray:v6];
  id v8 = (void *)shortcutsPublicActionIdentifierHashes_shortcutsPublicActionIdentifiers;
  shortcutsPublicActionIdentifierHashes_shortcutsPublicActionIdentifiers = v7;
}

+ (BOOL)shouldAuditActionWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F302A8]);
  id v5 = [v3 bundleIdentifier];
  id v6 = (void *)[v4 initWithBundleIdentifier:v5];

  if (![v6 isThirdParty])
  {
    if (![v6 isProbablySecondParty])
    {
      BOOL v12 = 1;
      goto LABEL_12;
    }
    id v9 = getWFAppIntentsLogObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    dispatch_queue_t v10 = [v3 actionIdentifier];
    int v14 = 136315394;
    id v15 = "+[WFLinkActionProvider(Hiding) shouldAuditActionWithIdentifier:]";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    uint64_t v11 = "%s %@ is probably second party, allowing.";
    goto LABEL_8;
  }
  uint64_t v7 = [v3 bundleIdentifier];
  int v8 = [v7 hasPrefix:@"com.apple."];

  if (v8)
  {
    id v9 = getWFAppIntentsLogObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      goto LABEL_10;
    }
    dispatch_queue_t v10 = [v3 actionIdentifier];
    int v14 = 136315394;
    id v15 = "+[WFLinkActionProvider(Hiding) shouldAuditActionWithIdentifier:]";
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    uint64_t v11 = "%s %@ seems to be third party but uses 'com.apple'.";
LABEL_8:
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v14, 0x16u);

    goto LABEL_9;
  }
LABEL_10:
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

+ (BOOL)approvedForPublicDrawerToDisplayActionIdentifier:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 shouldAuditActionWithIdentifier:v4])
  {
    id v29 = @"com.apple.SafariTechnologyPreview";
    v30[0] = *MEMORY[0x1E4FB4B58];
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v6 = [v4 bundleIdentifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    int v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 bundleIdentifier];
    }
    uint64_t v11 = v9;

    BOOL v12 = [v4 actionIdentifier];
    id v13 = WFShortcutsActionIdentifierFromLinkIdentifiers(v11, v12);

    uint64_t v14 = [v13 dataUsingEncoding:4];
    id v15 = (id) MEMORY[0x1F4188790](v14);
    CC_MD5((const void *)[v15 bytes], objc_msgSend(v15, "length"), v22);
    __int16 v16 = objc_opt_new();
    for (uint64_t i = 0; i != 16; ++i)
      objc_msgSend(v16, "appendFormat:", @"%02x", v22[i]);
    uint64_t v18 = +[WFLinkActionProvider shortcutsPublicActionIdentifierHashes];
    int v10 = [v18 containsObject:v16];

    Class v19 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = @"Unreviewed";
      *(_DWORD *)buf = 136315650;
      __int16 v24 = "+[WFLinkActionProvider(Hiding) approvedForPublicDrawerToDisplayActionIdentifier:]";
      __int16 v25 = 2112;
      if (v10) {
        id v20 = @"Approved";
      }
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = v16;
      _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_DEBUG, "%s %@: %@", buf, 0x20u);
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppMapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_queryMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_enumMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadataByAppIdentifier, 0);
}

- (os_unfair_lock_s)actionRequestsLock
{
  return self->_actionRequestsLock;
}

- (INSystemAppMapper)systemAppMapper
{
  return self->_systemAppMapper;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setObservingInstalledApplicationsChanges:(BOOL)a3
{
  self->_observingInstalledApplicationsChanges = a3;
}

- (BOOL)isObservingInstalledApplicationsChanges
{
  return self->_observingInstalledApplicationsChanges;
}

- (id)customIntentMigratedActionIdentifierWithLaunchId:(id)a3 className:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v33 = 0;
  int v8 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v33];
  id v9 = v33;
  if (v8)
  {
    int v10 = v8;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = 0;
    }
    id v13 = v12;

    if (isKindOfClass)
    {
      uint64_t v14 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
        __int16 v36 = 2114;
        id v37 = v6;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%s The provided launchId (%{public}@) is an extension, getting its container", buf, 0x16u);
      }

      id v15 = [v10 containingBundleRecord];
      if (v15)
      {
        __int16 v16 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v15 bundleIdentifier];
          *(_DWORD *)buf = 136315650;
          v35 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
          __int16 v36 = 2114;
          id v37 = v6;
          __int16 v38 = 2114;
          id v39 = v17;
          _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_DEFAULT, "%s The container for %{public}@ is %{public}@; Using it",
            buf,
            0x20u);
        }
        uint64_t v18 = [v10 containingBundleRecord];

        int v10 = v18;
      }
    }
    Class v19 = [v10 bundleIdentifier];
    id v20 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
      __int16 v36 = 2114;
      id v37 = v19;
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Getting metadata for app intents from %{public}@)", buf, 0x16u);
    }

    uint64_t v21 = [(WFLinkActionProvider *)self metadataProvider];
    id v32 = v9;
    v22 = [v21 actionsForBundleIdentifier:v19 error:&v32];
    id v23 = v32;

    if (v22)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __83__WFLinkActionProvider_customIntentMigratedActionIdentifierWithLaunchId_className___block_invoke;
      v30[3] = &unk_1E6559210;
      v31 = v7;
      __int16 v24 = objc_msgSend(v22, "if_firstObjectPassingTest:", v30);
      __int16 v25 = v24;
      if (v24)
      {
        uint64_t v26 = [v24 identifier];
        __int16 v27 = WFShortcutsActionIdentifierFromLinkIdentifiers(v19, v26);
      }
      else
      {
        __int16 v27 = 0;
      }

      __int16 v28 = v31;
    }
    else
    {
      __int16 v28 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
        __int16 v36 = 2114;
        id v37 = v19;
        __int16 v38 = 2114;
        id v39 = v23;
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Unable to get actions for %{public}@: %{public}@", buf, 0x20u);
      }
      __int16 v27 = 0;
    }
  }
  else
  {
    int v10 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
      __int16 v36 = 2114;
      id v37 = v6;
      __int16 v38 = 2114;
      id v39 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Unable to get bundle record for %{public}@: %{public}@", buf, 0x20u);
    }
    __int16 v27 = 0;
    id v23 = v9;
  }

  return v27;
}

uint64_t __83__WFLinkActionProvider_customIntentMigratedActionIdentifierWithLaunchId_className___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 customIntentClassName];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (NSDictionary)queryMetadataByAppIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  queryMetadataByAppIdentifier = self->_queryMetadataByAppIdentifier;
  if (!queryMetadataByAppIdentifier)
  {
    uint64_t v4 = [(WFLinkActionProvider *)self metadataProvider];
    id v11 = 0;
    id v5 = [v4 queriesWithError:&v11];
    id v6 = v11;
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_298_74346);
    id v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    int v8 = self->_queryMetadataByAppIdentifier;
    self->_queryMetadataByAppIdentifier = v7;

    if (!self->_queryMetadataByAppIdentifier)
    {
      id v9 = getWFActionsLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = "-[WFLinkActionProvider queryMetadataByAppIdentifier]";
        __int16 v14 = 2114;
        id v15 = v6;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get queries from metadata provider %{public}@", buf, 0x16u);
      }
    }
    queryMetadataByAppIdentifier = self->_queryMetadataByAppIdentifier;
  }
  return queryMetadataByAppIdentifier;
}

id __52__WFLinkActionProvider_queryMetadataByAppIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  objc_msgSend(a3, "if_compactMap:", &__block_literal_global_301);
  id result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

id __52__WFLinkActionProvider_queryMetadataByAppIdentifier__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id result = [a3 entityType];
  *a4 = result;
  return result;
}

- (NSDictionary)entityMetadataByAppIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  entityMetadataByAppIdentifier = self->_entityMetadataByAppIdentifier;
  if (!entityMetadataByAppIdentifier)
  {
    uint64_t v4 = [(WFLinkActionProvider *)self metadataProvider];
    id v10 = 0;
    id v5 = [v4 entitiesWithError:&v10];
    id v6 = v10;
    id v7 = self->_entityMetadataByAppIdentifier;
    self->_entityMetadataByAppIdentifier = v5;

    if (!self->_entityMetadataByAppIdentifier)
    {
      int v8 = getWFActionsLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v12 = "-[WFLinkActionProvider entityMetadataByAppIdentifier]";
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get entities from metadata provider %{public}@", buf, 0x16u);
      }
    }
    entityMetadataByAppIdentifier = self->_entityMetadataByAppIdentifier;
  }
  return entityMetadataByAppIdentifier;
}

- (NSDictionary)enumMetadataByAppIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  enumMetadataByAppIdentifier = self->_enumMetadataByAppIdentifier;
  if (!enumMetadataByAppIdentifier)
  {
    uint64_t v4 = [(WFLinkActionProvider *)self metadataProvider];
    id v10 = 0;
    id v5 = [v4 enumsWithError:&v10];
    id v6 = v10;
    id v7 = self->_enumMetadataByAppIdentifier;
    self->_enumMetadataByAppIdentifier = v5;

    if (!self->_enumMetadataByAppIdentifier)
    {
      int v8 = getWFActionsLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v12 = "-[WFLinkActionProvider enumMetadataByAppIdentifier]";
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get enums from metadata provider %{public}@", buf, 0x16u);
      }
    }
    enumMetadataByAppIdentifier = self->_enumMetadataByAppIdentifier;
  }
  return enumMetadataByAppIdentifier;
}

- (NSDictionary)actionMetadataByAppIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  actionMetadataByAppIdentifier = self->_actionMetadataByAppIdentifier;
  if (!actionMetadataByAppIdentifier)
  {
    uint64_t v4 = [(WFLinkActionProvider *)self metadataProvider];
    id v10 = 0;
    id v5 = [v4 actionsWithError:&v10];
    id v6 = v10;
    id v7 = self->_actionMetadataByAppIdentifier;
    self->_actionMetadataByAppIdentifier = v5;

    if (!self->_actionMetadataByAppIdentifier)
    {
      int v8 = getWFActionsLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v12 = "-[WFLinkActionProvider actionMetadataByAppIdentifier]";
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get actions from metadata provider %{public}@", buf, 0x16u);
      }
    }
    actionMetadataByAppIdentifier = self->_actionMetadataByAppIdentifier;
  }
  return actionMetadataByAppIdentifier;
}

- (id)getAppSettingActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 entityMetadataByAppIdentifier:(id)a5 localActionsOnly:(BOOL)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 bundleIdentifier];
  BOOL v12 = [v10 objectForKeyedSubscript:v11];
  if (!v12)
  {
    id v76 = v10;
    id v13 = v9;
    BOOL v12 = objc_opt_new();
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v14 = self;
    uint64_t v15 = [(WFLinkActionProvider *)self metadataProvider];
    uint64_t v16 = [v15 entitiesForBundleIdentifier:v11 error:0];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v83 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v84 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          v22 = [v21 identifier];
          [v12 setObject:v21 forKey:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v83 objects:v93 count:16];
      }
      while (v18);
    }

    id v9 = v13;
    id v10 = v76;
    self = v14;
  }
  id v23 = objc_opt_new();
  __int16 v24 = [v12 allKeys];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __132__WFLinkActionProvider_getAppSettingActionForRequest_fullyQualifiedActionIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke;
  v79[3] = &unk_1E65593D8;
  id v25 = v12;
  id v80 = v25;
  id v26 = v11;
  id v81 = v26;
  id v27 = v23;
  id v82 = v27;
  [v24 enumerateObjectsUsingBlock:v79];

  if ([v27 count])
  {
    __int16 v28 = [v9 actionIdentifier];
    id v29 = WFShortcutsActionIdentifierFromLinkIdentifiers(v26, v28);

    uint64_t v30 = v78;
    if ([v29 length])
    {
      v31 = objc_opt_new();
      WFLinkActionBundleIdentifierOverrides(v29);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = (uint64_t *)MEMORY[0x1E4FB4508];
      id v70 = v26;
      if (v32 || (id v32 = v26, v33 = (uint64_t *)MEMORY[0x1E4FB4508], v32))
      {
        uint64_t v91 = *v33;
        v71 = v32;
        id v92 = v32;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        [v31 setObject:v34 forKeyedSubscript:@"LinkActionDisplayedAppDescriptor"];
      }
      else
      {
        v71 = 0;
      }
      v35 = [v25 allValues];
      __int16 v36 = [v35 firstObject];

      id v37 = [v36 effectiveBundleIdentifiers];
      uint64_t v72 = v29;
      id v73 = v25;
      unint64_t v74 = v31;
      v75 = v36;
      id v77 = v10;
      if ([v37 count] == 1)
      {
        __int16 v38 = [v36 effectiveBundleIdentifiers];
        id v39 = [v38 firstObject];
        if ([v39 type] == 2)
        {
          uint64_t v40 = [v36 effectiveBundleIdentifiers];
          [v40 firstObject];
          v67 = self;
          v42 = id v41 = v9;
          id v43 = [v42 bundleIdentifier];
          id v26 = v70;
          int v69 = [v43 isEqualToString:v70];

          id v9 = v41;
          self = v67;
        }
        else
        {
          int v69 = 0;
          id v26 = v70;
        }

        id v10 = v77;
        uint64_t v30 = v78;
      }
      else
      {
        int v69 = 0;
        id v26 = v70;
      }

      uint64_t v45 = [v75 effectiveBundleIdentifiers];
      if ([v45 count] == 1)
      {
        uint64_t v46 = [v75 effectiveBundleIdentifiers];
        v47 = [v46 firstObject];
        if ([v47 type] == 3)
        {
          v48 = [v75 effectiveBundleIdentifiers];
          [v48 firstObject];
          v49 = id v68 = v9;
          [v49 bundleIdentifier];
          v51 = v50 = self;
          int v52 = [v51 isEqualToString:v26];

          self = v50;
          id v9 = v68;
        }
        else
        {
          int v52 = 0;
        }

        id v10 = v77;
        uint64_t v30 = v78;
      }
      else
      {
        int v52 = 0;
      }

      if (((v69 | v52) & 1) == 0)
      {
        v53 = self;
        uint64_t v54 = [(WFLinkActionProvider *)self appDescriptorForActionRequest:v30 forceLocalActionsOnly:0];
        if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v55 = v54;

          v56 = [v55 serializedRepresentation];
          uint64_t v57 = *MEMORY[0x1E4FB4508];
        }
        else
        {

          uint64_t v57 = *MEMORY[0x1E4FB4508];
          uint64_t v89 = *MEMORY[0x1E4FB4508];
          id v90 = v26;
          v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          id v55 = 0;
        }
        v58 = [v56 objectForKeyedSubscript:v57];

        if (v58)
        {
          uint64_t v87 = @"ActionRequiresAppInstallation";
          uint64_t v88 = MEMORY[0x1E4F1CC38];
          v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          uint64_t v60 = objc_msgSend(v56, "if_dictionaryByAddingEntriesFromDictionary:", v59);

          [v74 setObject:v60 forKeyedSubscript:@"AppDefinition"];
          v56 = (void *)v60;
        }

        self = v53;
      }
      v61 = [(WFActionProvider *)self defaultActionDefinition];
      id v62 = [v61 definitionByAddingEntriesInDictionary:v74];

      uint64_t v63 = (objc_class *)objc_opt_class();
      if ([v26 isEqualToString:@"com.apple.AccessibilityUIServer"]) {
        uint64_t v63 = (objc_class *)objc_opt_class();
      }
      id v29 = v72;
      id v64 = [v63 alloc];
      uint64_t v65 = [v30 serializedParameters];
      uint64_t v44 = (void *)[v64 initWithIdentifier:v72 definition:v62 entityByEntityIdentifier:v27 serializedParameters:v65 fullyQualifiedActionIdentifier:v9];

      id v25 = v73;
    }
    else
    {
      uint64_t v44 = 0;
    }
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v30 = v78;
  }

  return v44;
}

void __132__WFLinkActionProvider_getAppSettingActionForRequest_fullyQualifiedActionIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(a1[4], "objectForKeyedSubscript:");
  uint64_t v4 = v3;
  if (v3 && WFISEligibleForSettingsUpdaterAction(v3, a1[5]))
  {
    id v5 = a1[5];
    id v6 = [v4 identifier];
    id v7 = WFShortcutsActionIdentifierFromLinkIdentifiers(v5, v6);

    int v8 = WFLinkActionIdentifierFromShortcutsActionIdentifier(v7);
    if (+[WFLinkActionProvider isFullyQualifiedActionIdentifier:v8 withMetadata:v4 visibleForUse:0])
    {
      [a1[6] setObject:v4 forKey:v9];
    }
  }
}

- (id)settingUpdaterActionForActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7
{
  BOOL v92 = a7;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v97 = a5;
  v95 = v12;
  id v96 = a6;
  uint64_t v13 = [v12 bundleIdentifier];
  id v102 = objc_opt_new();
  id v14 = [(WFLinkActionProvider *)self metadataProvider];
  uint64_t v15 = [v14 entitiesWithError:0];
  v105 = [v15 objectForKeyedSubscript:v13];

  uint64_t v91 = self;
  id v103 = (void *)v13;
  [(WFLinkActionProvider *)self actionMetadataByAppBundleIdentifier:v13];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v104 = long long v115 = 0u;
  uint64_t v16 = [v104 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v112 objects:v119 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v113 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [v104 objectForKeyedSubscript:*(void *)(*((void *)&v112 + 1) + 8 * i)];
        v22 = WFUpdatableEntityValueTypeFromEntityUpdaterAction(v21);
        id v23 = [v22 identifier];
        if (v23)
        {
          __int16 v24 = [v105 objectForKeyedSubscript:v23];
          int v25 = WFISEligibleForSettingsUpdaterAction(v24, v103);

          if (v25)
          {
            id v26 = [v21 identifier];
            id v27 = WFShortcutsActionIdentifierFromLinkIdentifiers(v103, v26);

            __int16 v28 = WFLinkActionIdentifierFromShortcutsActionIdentifier(v27);
            if (+[WFLinkActionProvider isFullyQualifiedActionIdentifier:v28 withMetadata:v21 visibleForUse:0])
            {
              [v102 setObject:v21 forKey:v23];
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v112 objects:v119 count:16];
    }
    while (v18);
  }

  id v29 = v102;
  if ([v102 count])
  {
    uint64_t v94 = v11;
    v101 = objc_opt_new();
    uint64_t v30 = objc_opt_new();
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    obuint64_t j = [v102 allKeys];
    uint64_t v31 = [obj countByEnumeratingWithState:&v108 objects:v118 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v109 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v108 + 1) + 8 * j);
          __int16 v36 = [v105 objectForKeyedSubscript:v35];
          id v37 = [v29 objectForKeyedSubscript:v35];
          [v101 setObject:v36 forKey:v35];
          __int16 v38 = [v37 parameters];
          id v39 = objc_msgSend(v38, "if_firstObjectPassingTest:", &__block_literal_global_282);

          [v30 setObject:v39 forKey:v35];
          id v29 = v102;
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v108 objects:v118 count:16];
      }
      while (v32);
    }

    uint64_t v40 = [v30 allKeys];
    id v41 = [v40 sortedArrayUsingSelector:sel_compare_];

    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke_2;
    v106[3] = &unk_1E65593B0;
    id v89 = v30;
    id v90 = v41;
    id v107 = v89;
    uint64_t v42 = objc_msgSend(v41, "if_compactMap:", v106);
    id v43 = [v97 objectForKeyedSubscript:v103];
    uint64_t v44 = [v96 objectForKeyedSubscript:v103];
    uint64_t v45 = [v29 allValues];
    uint64_t v46 = [v45 firstObject];
    uint64_t v88 = (void *)v42;
    v47 = [v46 actionMetadataWithParameters:v42];

    long long v86 = v44;
    uint64_t v87 = v43;
    v48 = WFBuildActionMetadataWithProperties(v47, v43, v44);

    v49 = v95;
    v50 = [v95 actionIdentifier];
    v51 = WFShortcutsActionIdentifierFromLinkIdentifiers(v103, v50);

    int v52 = (objc_class *)objc_opt_class();
    if ([v103 isEqualToString:@"com.apple.AccessibilityUIServer"]) {
      int v52 = (objc_class *)objc_opt_class();
    }
    v53 = objc_opt_new();
    WFLinkActionBundleIdentifierOverrides(v51);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v55 = 0x1E4F1C000uLL;
    long long v85 = v51;
    if (v54 || (id v54 = v103) != 0)
    {
      uint64_t v116 = *MEMORY[0x1E4FB4508];
      id v117 = v54;
      long long v84 = v54;
      v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      [v53 setObject:v56 forKeyedSubscript:@"LinkActionDisplayedAppDescriptor"];
    }
    else
    {
      long long v84 = 0;
    }
    uint64_t v57 = [v48 effectiveBundleIdentifiers];
    if ([v57 count] == 1)
    {
      v58 = [v48 effectiveBundleIdentifiers];
      v59 = [v58 firstObject];
      if ([v59 type] == 2)
      {
        uint64_t v60 = [v48 effectiveBundleIdentifiers];
        [v60 firstObject];
        id v62 = v61 = v53;
        [v62 bundleIdentifier];
        id v64 = v63 = v52;
        int v65 = [v64 isEqualToString:v103];

        int v52 = v63;
        unint64_t v55 = 0x1E4F1C000;

        v53 = v61;
        v49 = v95;
      }
      else
      {
        int v65 = 0;
      }
    }
    else
    {
      int v65 = 0;
    }

    v67 = [v48 effectiveBundleIdentifiers];
    uint64_t v93 = v53;
    if ([v67 count] == 1)
    {
      id v68 = [v48 effectiveBundleIdentifiers];
      int v69 = [v68 firstObject];
      if ([v69 type] == 3)
      {
        id v70 = [v48 effectiveBundleIdentifiers];
        [v70 firstObject];
        int objb = v65;
        unint64_t v71 = v55;
        v73 = uint64_t v72 = v52;
        unint64_t v74 = [v73 bundleIdentifier];
        int v75 = [v74 isEqualToString:v103];

        int v52 = v72;
        unint64_t v55 = v71;
        v49 = v95;
        int v65 = objb;

        v53 = v93;
      }
      else
      {
        int v75 = 0;
      }
    }
    else
    {
      int v75 = 0;
    }

    if ((v65 | v75))
    {
      v66 = v49;
      id v76 = 0;
    }
    else
    {
      id v77 = [(WFLinkActionProvider *)v91 appDescriptorForActionRequest:v94 forceLocalActionsOnly:v92];
      if (v77)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v78 = v77;
        }
        else {
          id v78 = 0;
        }
      }
      else
      {
        id v78 = 0;
      }
      v66 = v49;
      id v76 = v78;
    }
    id v79 = [v52 alloc];
    id v29 = v102;
    id v80 = (void *)[objc_alloc(*(Class *)(v55 + 2536)) initWithDictionary:v102];
    id v81 = [[WFActionDefinition alloc] initWithDictionary:v53];
    id v82 = [v94 serializedParameters];
    id obja = (id)[v79 initWithIdentifier:v85 actionMetadata:v48 entityMetadataForParameterIdentifier:v101 metadataForParameterIdentifier:v80 definition:v81 serializedParameters:v82 appIntentDescriptor:v76 fullyQualifiedActionIdentifier:v66];

    id v11 = v94;
  }
  else
  {
    id obja = 0;
    v66 = v95;
  }

  return obja;
}

id __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = objc_alloc(MEMORY[0x1E4F72AF0]);
  id v6 = [v4 valueType];
  uint64_t v7 = [v4 isOptional];
  int v8 = [v4 title];
  id v9 = [v4 parameterDescription];
  id v10 = [v4 resolvableInputTypes];
  id v11 = [v4 typeSpecificMetadata];
  id v12 = objc_msgSend(v5, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:", v3, v6, v7, v8, v9, v10, v11, objc_msgSend(v4, "dynamicOptionsSupport"), objc_msgSend(v4, "inputConnectionBehavior"));

  return v12;
}

uint64_t __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"property"];

  return v3;
}

- (id)targetedEntityUpdaterActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v110 = a6;
  uint64_t v15 = [v13 bundleIdentifier];
  uint64_t v16 = [v12 actionIdentifier];
  uint64_t v17 = [v16 componentsSeparatedByString:@"-"];
  uint64_t v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = [v18 lastObject];
  LODWORD(v17) = [v19 isEqualToString:@"UpdatableEntity"];

  if (v17)
  {
    [v18 removeLastObject];
    id v20 = [v18 componentsJoinedByString:@"-"];
    uint64_t v21 = [v20 componentsSeparatedByString:@"."];
    uint64_t v22 = [v21 lastObject];

    long long v111 = (void *)v22;
    [(WFLinkActionProvider *)self entityMetadataByAppBundleIdentifier:v15 entityIdentifier:v22];
    v109 = id v23 = (void *)v15;
    if (v109)
    {
      BOOL v98 = v7;
      id v103 = v18;
      long long v108 = v14;
      v105 = v13;
      v106 = v12;
      long long v118 = objc_opt_new();
      v104 = self;
      id v107 = (void *)v15;
      [(WFLinkActionProvider *)self actionMetadataByAppBundleIdentifier:v15];
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v102 = v143 = 0u;
      obuint64_t j = [v102 allValues];
      uint64_t v24 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v141;
        uint64_t v27 = *MEMORY[0x1E4F72980];
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v141 != v26) {
              objc_enumerationMutation(obj);
            }
            id v29 = *(void **)(*((void *)&v140 + 1) + 8 * i);
            uint64_t v30 = [v29 systemProtocolMetadata];
            uint64_t v31 = [v30 objectForKeyedSubscript:v27];

            if (v31)
            {
              id v32 = v31;
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass) {
                v34 = v32;
              }
              else {
                v34 = 0;
              }
              id v35 = v34;

              if (isKindOfClass)
              {
                __int16 v36 = [v32 entityIdentifier];
                int v37 = [v36 isEqualToString:v111];

                if (v37)
                {
                  __int16 v38 = [v32 entityProperty];
                  [v118 setObject:v29 forKey:v38];
                }
              }
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v140 objects:v153 count:16];
        }
        while (v25);
      }

      id v39 = objc_opt_new();
      uint64_t v40 = objc_opt_new();
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v112 = [v109 properties];
      long long v121 = v39;
      uint64_t v116 = [v112 countByEnumeratingWithState:&v136 objects:v152 count:16];
      if (v116)
      {
        uint64_t v114 = *(void *)v137;
        do
        {
          for (uint64_t j = 0; j != v116; ++j)
          {
            if (*(void *)v137 != v114) {
              objc_enumerationMutation(v112);
            }
            uint64_t v42 = *(void **)(*((void *)&v136 + 1) + 8 * j);
            id v43 = [v42 identifier];
            uint64_t v44 = [v118 objectForKeyedSubscript:v43];

            if (v44)
            {
              uint64_t v119 = j;
              long long v134 = 0u;
              long long v135 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              id obja = v44;
              uint64_t v45 = [v44 parameters];
              uint64_t v46 = [v45 countByEnumeratingWithState:&v132 objects:v151 count:16];
              if (v46)
              {
                uint64_t v47 = v46;
                uint64_t v48 = *(void *)v133;
                do
                {
                  for (uint64_t k = 0; k != v47; ++k)
                  {
                    if (*(void *)v133 != v48) {
                      objc_enumerationMutation(v45);
                    }
                    v50 = *(void **)(*((void *)&v132 + 1) + 8 * k);
                    v51 = [v50 name];
                    int v52 = +[WFEntityUpdatingAction entityParameterName];
                    int v53 = [v51 isEqualToString:v52];

                    if (v53)
                    {
                      [v50 name];
                    }
                    else
                    {
                      id v54 = [v42 identifier];
                      [v121 setObject:obja forKey:v54];

                      [v42 identifier];
                    unint64_t v55 = };
                    [v40 setObject:v50 forKey:v55];
                  }
                  uint64_t v47 = [v45 countByEnumeratingWithState:&v132 objects:v151 count:16];
                }
                while (v47);
              }

              uint64_t j = v119;
              id v39 = v121;
              uint64_t v44 = obja;
            }
          }
          uint64_t v116 = [v112 countByEnumeratingWithState:&v136 objects:v152 count:16];
        }
        while (v116);
      }

      v56 = [v40 allKeys];
      uint64_t v57 = [v56 sortedArrayUsingSelector:sel_compare_];

      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __168__WFLinkActionProvider_targetedEntityUpdaterActionForRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke;
      v129[3] = &unk_1E6559388;
      id objb = v40;
      id v130 = objb;
      id v131 = v109;
      v58 = objc_msgSend(v57, "if_compactMap:", v129);
      id v23 = v107;
      id v14 = v108;
      v59 = [v108 objectForKeyedSubscript:v107];
      uint64_t v60 = [v110 objectForKeyedSubscript:v107];
      uint64_t v120 = v59;
      if (!v60)
      {
        v61 = v58;
        id v62 = objc_opt_new();
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        uint64_t v63 = [(WFLinkActionProvider *)v104 metadataProvider];
        id v64 = [v63 entitiesForBundleIdentifier:v107 error:0];

        uint64_t v65 = [v64 countByEnumeratingWithState:&v125 objects:v150 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v126;
          do
          {
            for (uint64_t m = 0; m != v66; ++m)
            {
              if (*(void *)v126 != v67) {
                objc_enumerationMutation(v64);
              }
              int v69 = *(void **)(*((void *)&v125 + 1) + 8 * m);
              id v70 = [v69 identifier];
              [v62 setObject:v69 forKey:v70];
            }
            uint64_t v66 = [v64 countByEnumeratingWithState:&v125 objects:v150 count:16];
          }
          while (v66);
        }

        uint64_t v71 = [v62 copy];
        id v23 = v107;
        id v14 = v108;
        v58 = v61;
        uint64_t v60 = (void *)v71;
        v59 = v120;
      }
      uint64_t v72 = [v60 objectForKeyedSubscript:v111];
      id v117 = v60;
      if (v72)
      {
        v100 = (void *)v72;
        long long v115 = v57;
        id v73 = [v39 allValues];
        [v73 firstObject];
        v75 = unint64_t v74 = v23;
        id v76 = [v75 actionMetadataWithParameters:v58];

        id v77 = WFBuildActionMetadataWithProperties(v76, v59, v60);

        v101 = WFUpdatableEntityValueTypeFromEntityUpdaterAction(v77);
        id v78 = objc_msgSend(v77, "wf_actionMetadataWithOutputType:");

        id v79 = [v105 actionIdentifier];
        id v80 = WFShortcutsActionIdentifierFromLinkIdentifiers(v74, v79);

        id v81 = objc_opt_new();
        id v82 = v80;
        uint64_t v83 = WFLinkActionBundleIdentifierOverrides(v80);
        if (v83
          || ([v78 attributionBundleIdentifier],
              (uint64_t v83 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v144 = *MEMORY[0x1E4FB4508];
          uint64_t v145 = v83;
          BOOL v99 = (void *)v83;
          long long v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
          long long v85 = v81;
          [v81 setObject:v84 forKeyedSubscript:@"LinkActionDisplayedAppDescriptor"];
        }
        else
        {
          long long v85 = v81;
          BOOL v99 = 0;
        }
        long long v86 = [v78 systemProtocolMetadata];
        uint64_t v87 = [v86 objectForKeyedSubscript:*MEMORY[0x1E4F72998]];

        id v113 = v58;
        if (v87)
        {
          id v88 = 0;
        }
        else
        {
          uint64_t v91 = [(WFLinkActionProvider *)v104 appDescriptorForActionRequest:v106 forceLocalActionsOnly:v98];
          if (v91)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              BOOL v92 = v91;
            }
            else {
              BOOL v92 = 0;
            }
          }
          else
          {
            BOOL v92 = 0;
          }
          id v88 = v92;
        }
        uint64_t v93 = [_TtC11WorkflowKit29WFTargetedEntityUpdaterAction alloc];
        uint64_t v94 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v39];
        v95 = [[WFActionDefinition alloc] initWithDictionary:v85];
        id v96 = [v106 serializedParameters];
        id v13 = v105;
        id v90 = v100;
        id v89 = [(WFTargetedEntityUpdaterAction *)v93 initWithIdentifier:v82 actionMetadata:v78 entityMetadata:v100 metadataForParameterIdentifier:v94 definition:v95 serializedParameters:v96 appIntentDescriptor:v88 fullyQualifiedActionIdentifier:v105];

        id v39 = v121;
        id v23 = v107;
        id v14 = v108;
        v58 = v113;
        uint64_t v57 = v115;
        v59 = v120;
      }
      else
      {
        id v90 = 0;
        id v78 = getWFGeneralLogObject();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v147 = "-[WFLinkActionProvider targetedEntityUpdaterActionForRequest:fullyQualifiedActionIdentifier:enumMetadat"
                 "aByAppIdentifier:entityMetadataByAppIdentifier:localActionsOnly:]";
          __int16 v148 = 2112;
          __int16 v149 = v111;
          _os_log_impl(&dword_1C7F0A000, v78, OS_LOG_TYPE_FAULT, "%s Entity Updater action is missing entity metadata for identifier: %@ which is required.", buf, 0x16u);
        }
        id v89 = 0;
        id v13 = v105;
      }

      id v12 = v106;
      uint64_t v18 = v103;
    }
    else
    {
      id v89 = 0;
    }
  }
  else
  {
    id v89 = 0;
    id v23 = (void *)v15;
  }

  return v89;
}

id __168__WFLinkActionProvider_targetedEntityUpdaterActionForRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 dynamicOptionsSupport];
  id v6 = +[WFEntityUpdatingAction entityParameterName];
  if ([v3 isEqualToString:v6])
  {
    BOOL v7 = [*(id *)(a1 + 40) systemProtocolMetadata];
    int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F72930]];

    if (v8) {
      uint64_t v5 = 0;
    }
  }
  else
  {
  }
  id v9 = objc_alloc(MEMORY[0x1E4F72AF0]);
  id v10 = [v4 valueType];
  uint64_t v11 = [v4 isOptional];
  id v12 = [v4 title];
  id v13 = [v4 parameterDescription];
  id v14 = [v4 resolvableInputTypes];
  uint64_t v15 = [v4 typeSpecificMetadata];
  uint64_t v16 = objc_msgSend(v9, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:", v3, v10, v11, v12, v13, v14, v15, v5, objc_msgSend(v4, "inputConnectionBehavior"), objc_msgSend(v4, "capabilities"));

  return v16;
}

- (id)linkContentItemFilterActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 entityMetadata:(id)a7 queryMetadata:(id)a8
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a8;
  id v90 = v13;
  uint64_t v16 = [v13 bundleIdentifier];
  if (v14)
  {
    id v89 = v15;
    uint64_t v17 = [v13 actionIdentifier];
    uint64_t v18 = WFShortcutsActionIdentifierForClassOverrideSearch(v16, v17);

    uint64_t v19 = +[WFLinkAction classForLinkActionWithIdentifier:v18 metadata:0];
    if (!v19) {
      uint64_t v19 = (objc_class *)objc_opt_class();
    }
    id v81 = v19;
    id v20 = [v14 effectiveBundleIdentifiers];
    long long v86 = v18;
    uint64_t v87 = v16;
    if ([v20 count] == 1)
    {
      uint64_t v21 = [v14 effectiveBundleIdentifiers];
      uint64_t v22 = [v21 firstObject];
      if ([v22 type] == 2)
      {
        id v23 = [v14 effectiveBundleIdentifiers];
        uint64_t v24 = [v23 firstObject];
        [v24 bundleIdentifier];
        v26 = uint64_t v25 = self;
        char v27 = [v26 isEqualToString:v87];

        self = v25;
        uint64_t v16 = v87;
      }
      else
      {
        char v27 = 0;
      }
    }
    else
    {
      char v27 = 0;
    }

    uint64_t v31 = [v14 effectiveBundleIdentifiers];
    id v82 = self;
    if ([v31 count] == 1)
    {
      id v32 = [v14 effectiveBundleIdentifiers];
      uint64_t v33 = [v32 firstObject];
      if ([v33 type] == 3)
      {
        v34 = [v14 effectiveBundleIdentifiers];
        id v35 = [v34 firstObject];
        [v35 bundleIdentifier];
        char v36 = v27;
        v38 = id v37 = v12;
        char v39 = [v38 isEqualToString:v16];

        id v12 = v37;
        char v27 = v36;

        self = v82;
      }
      else
      {
        char v39 = 0;
      }
    }
    else
    {
      char v39 = 0;
    }

    char v40 = v27 | v39;
    if (v40)
    {
      id v83 = 0;
    }
    else
    {
      id v41 = [(WFLinkActionProvider *)self appDescriptorForActionRequest:v12 forceLocalActionsOnly:0];
      if (v41)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v42 = v41;
        }
        else {
          uint64_t v42 = 0;
        }
      }
      else
      {
        uint64_t v42 = 0;
      }
      id v83 = v42;
    }
    id v88 = v12;
    id v43 = objc_opt_new();
    uint64_t v44 = [v14 requiredCapabilities];

    if (v44)
    {
      uint64_t v45 = [v14 requiredCapabilities];
      uint64_t v46 = WFResourceDefinitionsForRequiredCapabilities(v45);
      [v43 setObject:v46 forKeyedSubscript:@"RequiredResources"];
    }
    v97[0] = @"DisabledOnPlatforms";
    uint64_t v47 = [v14 availabilityAnnotations];
    uint64_t v48 = [(WFLinkActionProvider *)self disabledOnPlatformsWithAvailability:v47];
    v98[0] = v48;
    v97[1] = @"Discontinued";
    v49 = NSNumber;
    uint64_t v50 = [v14 availabilityAnnotations];
    v51 = self;
    int v52 = (void *)v50;
    int v53 = objc_msgSend(v49, "numberWithBool:", -[WFLinkActionProvider isDiscontinuedWithAvailability:](v51, "isDiscontinuedWithAvailability:", v50));
    v98[1] = v53;
    id v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
    [v43 addEntriesFromDictionary:v54];

    uint64_t v55 = [v14 attributionBundleIdentifier];
    v56 = (void *)v55;
    if (v55)
    {
      uint64_t v95 = *MEMORY[0x1E4FB4508];
      uint64_t v96 = v55;
      uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      [v43 setObject:v57 forKeyedSubscript:@"LinkActionDisplayedAppDescriptor"];
    }
    long long v85 = v56;
    v58 = [v14 shortcutsActionMetadata];
    long long v84 = v58;
    if (v58)
    {
      v59 = [v58 dictionaryRepresentation];
      [v43 addEntriesFromDictionary:v59];
      uint64_t v60 = v83;
    }
    else
    {
      uint64_t v60 = v83;
      if (v40) {
        goto LABEL_34;
      }
      if (v83)
      {
        v59 = [v83 serializedRepresentation];
        uint64_t v75 = *MEMORY[0x1E4FB4508];
      }
      else
      {
        uint64_t v75 = *MEMORY[0x1E4FB4508];
        uint64_t v93 = *MEMORY[0x1E4FB4508];
        uint64_t v94 = v87;
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      }
      id v78 = [v59 objectForKeyedSubscript:v75];

      if (v78)
      {
        uint64_t v91 = @"ActionRequiresAppInstallation";
        uint64_t v92 = MEMORY[0x1E4F1CC38];
        id v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        uint64_t v80 = objc_msgSend(v59, "if_dictionaryByAddingEntriesFromDictionary:", v79);

        [v43 setObject:v80 forKeyedSubscript:@"AppDefinition"];
        v59 = (void *)v80;
      }
    }

LABEL_34:
    v61 = [v14 attributionBundleIdentifier];
    id v62 = [v14 shortcutsActionMetadata];

    if (v62)
    {
      uint64_t v63 = [v14 shortcutsActionMetadata];
      uint64_t v64 = [v63 attributionBundleIdentifierWithDefaultValue:v61];

      v61 = (void *)v64;
    }
    uint64_t v65 = [v90 bundleIdentifier];
    uint64_t v66 = (objc_class *)objc_msgSend(v14, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v89, v65, v61);

    uint64_t v67 = NSStringFromClass(v66);
    [v43 setObject:v67 forKeyedSubscript:@"WFContentItemClass"];

    id v68 = [v90 bundleIdentifier];
    int v69 = [v90 actionIdentifier];
    id v70 = WFShortcutsActionIdentifierFromLinkIdentifiers(v68, v69);

    if ([v70 length])
    {
      uint64_t v71 = [(WFActionProvider *)v82 defaultActionDefinition];
      uint64_t v72 = [v71 definitionByAddingEntriesInDictionary:v43];

      id v73 = [v81 alloc];
      unint64_t v74 = [v88 serializedParameters];
      uint64_t v30 = (void *)[v73 initWithIdentifier:v70 queryMetadata:v89 entityMetadata:v14 definition:v72 serializedParameters:v74 appIntentDescriptor:v60 fullyQualifiedActionIdentifier:v90];
    }
    else
    {
      uint64_t v72 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        id v76 = [v90 actionIdentifier];
        *(_DWORD *)buf = 136315394;
        v100 = "-[WFLinkActionProvider linkContentItemFilterActionWithActionRequest:fullyQualifiedActionIdentifier:enumMe"
               "tadataByAppIdentifier:entityMetadataByAppIdentifier:entityMetadata:queryMetadata:]";
        __int16 v101 = 2112;
        id v102 = v76;
        _os_log_impl(&dword_1C7F0A000, v72, OS_LOG_TYPE_DEFAULT, "%s Couldn't create a filter action from Link ID %@", buf, 0x16u);
      }
      uint64_t v30 = 0;
    }
    __int16 v28 = v86;

    id v12 = v88;
    id v15 = v89;
    uint64_t v16 = v87;
    goto LABEL_45;
  }
  __int16 v28 = getWFGeneralLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = [v13 actionIdentifier];
    *(_DWORD *)buf = 136315394;
    v100 = "-[WFLinkActionProvider linkContentItemFilterActionWithActionRequest:fullyQualifiedActionIdentifier:enumMetada"
           "taByAppIdentifier:entityMetadataByAppIdentifier:entityMetadata:queryMetadata:]";
    __int16 v101 = 2112;
    id v102 = v29;
    _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Could not find entity metadata for query: %@", buf, 0x16u);
  }
  uint64_t v30 = 0;
LABEL_45:

  return v30;
}

- (id)availableActionIdentifiers
{
  id v3 = [(WFLinkActionProvider *)self enumMetadataByAppIdentifier];
  uint64_t v4 = [(WFLinkActionProvider *)self entityMetadataByAppIdentifier];
  uint64_t v5 = objc_opt_new();
  id v6 = [(WFLinkActionProvider *)self actionMetadataByAppIdentifier];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke;
  v17[3] = &unk_1E6559300;
  v17[4] = self;
  id v18 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v17];

  int v8 = objc_opt_new();
  id v9 = [(WFLinkActionProvider *)self queryMetadataByAppIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_4;
  v15[3] = &unk_1E6559120;
  id v16 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];

  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v12 = [v7 arrayByAddingObjectsFromArray:v10];
  id v13 = (void *)[v11 initWithArray:v12];

  return v13;
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_2;
  v8[3] = &unk_1E65592D8;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_5;
  v7[3] = &unk_1E6559328;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = WFShortcutsActionIdentifierFromLinkIdentifiers(*(void **)(a1 + 32), v5);
  if ([v7 length])
  {
    if (WFQueryMetadataIsEligibleForAction(v6, *(void **)(a1 + 32))) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
  else
  {
    id v8 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 136315650;
      id v11 = "-[WFLinkActionProvider availableActionIdentifiers]_block_invoke_5";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Couldn't create a find action for %@ %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 entityMetadataByAppIdentifier];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v8 = WFEffectiveActionIdentifiersForActionMetadata(v5, v7, *(void **)(a1 + 40));

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_3;
  v9[3] = &unk_1E65592B0;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v8 enumerateObjectsUsingBlock:v9];
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  WFShortcutsActionIdentifierFromLinkIdentifiers(*(void **)(a1 + 32), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if ([v3 length]) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)queryMetadataByAppBundleIdentifier:(id)a3 queryIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 716, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 717, @"Invalid parameter not satisfying: %@", @"queryIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  id v10 = [(NSDictionary *)self->_queryMetadataByAppIdentifier objectForKeyedSubscript:v7];

  if (!v10) {
    goto LABEL_5;
  }
  id v11 = [(WFLinkActionProvider *)self queryMetadataByAppIdentifier];
  __int16 v12 = [v11 objectForKeyedSubscript:v7];
  uint64_t v13 = [v12 allValues];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke;
  v22[3] = &unk_1E6559288;
  id v23 = v9;
  __int16 v14 = objc_msgSend(v13, "if_firstObjectPassingTest:", v22);

  if (!v14)
  {
LABEL_5:
    id v15 = [(WFLinkActionProvider *)self metadataProvider];
    uint64_t v16 = [v15 queriesForBundleIdentifier:v7 ofType:0 error:0];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke_2;
    v20[3] = &unk_1E6559288;
    id v21 = v9;
    __int16 v14 = objc_msgSend(v16, "if_firstObjectPassingTest:", v20);
  }
  return v14;
}

uint64_t __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)enumMetadataByAppBundleIdentifier:(id)a3 enumIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 687, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 688, @"Invalid parameter not satisfying: %@", @"enumIdentifier" object file lineNumber description];

LABEL_3:
  id v10 = [(NSDictionary *)self->_enumMetadataByAppIdentifier objectForKeyedSubscript:v7];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    __int16 v12 = [(WFLinkActionProvider *)self enumMetadataByAppIdentifier];
    uint64_t v13 = [v12 objectForKeyedSubscript:v7];
    __int16 v14 = [v13 objectForKeyedSubscript:v9];
  }
  else
  {
    id v15 = [(WFLinkActionProvider *)self metadataProvider];
    __int16 v12 = [v15 enumsForBundleIdentifier:v7 error:0];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__WFLinkActionProvider_enumMetadataByAppBundleIdentifier_enumIdentifier___block_invoke;
    v19[3] = &unk_1E6559260;
    id v20 = v9;
    __int16 v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
  }
  return v14;
}

uint64_t __73__WFLinkActionProvider_enumMetadataByAppBundleIdentifier_enumIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)actionMetadataByAppBundleIdentifier:(id)a3 actionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 660, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 661, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

LABEL_3:
  id v10 = [(NSDictionary *)self->_actionMetadataByAppIdentifier objectForKeyedSubscript:v7];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    __int16 v12 = [(WFLinkActionProvider *)self actionMetadataByAppIdentifier];
    id v13 = [v12 objectForKeyedSubscript:v7];
    __int16 v14 = [v13 objectForKeyedSubscript:v9];
  }
  else
  {
    id v15 = [(WFLinkActionProvider *)self metadataProvider];
    id v21 = 0;
    __int16 v12 = [v15 actionsForBundleIdentifier:v7 error:&v21];
    id v13 = v21;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__WFLinkActionProvider_actionMetadataByAppBundleIdentifier_actionIdentifier___block_invoke;
    v19[3] = &unk_1E6559210;
    id v20 = v9;
    __int16 v14 = objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
  }
  return v14;
}

uint64_t __77__WFLinkActionProvider_actionMetadataByAppBundleIdentifier_actionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)actionMetadataByAppBundleIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFLinkActionProvider.m", 642, @"Invalid parameter not satisfying: %@", @"appBundleIdentifier" object file lineNumber description];
  }
  id v6 = [(NSDictionary *)self->_actionMetadataByAppIdentifier objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [(WFLinkActionProvider *)self actionMetadataByAppIdentifier];
    id v8 = [v7 objectForKeyedSubscript:v5];
  }
  else
  {
    SEL v24 = a2;
    uint64_t v9 = [(WFLinkActionProvider *)self metadataProvider];
    id v30 = 0;
    id v10 = [v9 actionsForBundleIdentifier:v5 error:&v30];
    id v25 = v30;

    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v18 = [v17 identifier];
          uint64_t v19 = [v11 objectForKeyedSubscript:v18];

          if (v19)
          {
            id v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:v24 object:self file:@"WFLinkActionProvider.m" lineNumber:651 description:@"link gave us two actions with the same id"];
          }
          id v20 = [v17 identifier];
          [v11 setObject:v17 forKeyedSubscript:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v14);
    }

    id v8 = (void *)[v11 copy];
  }

  return v8;
}

- (id)actionMetadataByUpdatingWithEnumAndEntityMetadata:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  id v7 = [(WFLinkActionProvider *)self metadataProvider];
  id v41 = 0;
  id v8 = [v7 enumsForBundleIdentifier:v6 error:&v41];
  id v9 = v41;

  id v10 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v17 = [v16 identifier];
        [v10 setObject:v16 forKey:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v13);
  }

  id v18 = [(WFLinkActionProvider *)self metadataProvider];
  id v36 = v9;
  uint64_t v19 = [v18 entitiesForBundleIdentifier:v6 error:&v36];
  id v30 = v36;

  id v20 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        long long v27 = objc_msgSend(v26, "identifier", v30);
        [v20 setObject:v26 forKey:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v23);
  }

  long long v28 = WFBuildActionMetadataWithProperties(v31, v10, v20);

  return v28;
}

- (id)createActionsForBundleIdentifier:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  int v53 = self->_entityMetadataByAppIdentifier;
  if (v53)
  {
    id v6 = [(NSDictionary *)self->_entityMetadataByAppIdentifier objectForKeyedSubscript:v4];
    id v7 = 0;
  }
  else
  {
    id v8 = [(WFLinkActionProvider *)self metadataProvider];
    id v71 = 0;
    id v9 = [v8 entitiesForBundleIdentifier:v4 error:&v71];
    id v7 = v71;

    id v10 = objc_opt_new();
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke;
    v69[3] = &unk_1E6559178;
    id v6 = v10;
    id v70 = v6;
    [v9 enumerateObjectsUsingBlock:v69];
  }
  id v11 = self->_actionMetadataByAppIdentifier;
  uint64_t v50 = v11;
  if (v11)
  {
    uint64_t v12 = [(NSDictionary *)v11 objectForKeyedSubscript:v4];
    uint64_t v13 = [v12 allValues];
  }
  else
  {
    uint64_t v12 = [(WFLinkActionProvider *)self metadataProvider];
    id v68 = v7;
    uint64_t v13 = [v12 actionsForBundleIdentifier:v4 error:&v68];
    id v14 = v68;

    id v7 = v14;
  }

  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_2;
  v64[3] = &unk_1E65591C8;
  id v48 = v6;
  id v65 = v48;
  id v15 = v4;
  id v66 = v15;
  id v16 = v5;
  id v67 = v16;
  [v13 enumerateObjectsUsingBlock:v64];
  uint64_t v17 = self->_queryMetadataByAppIdentifier;
  uint64_t v46 = v17;
  if (v17)
  {
    int v52 = v7;
    id v18 = [(NSDictionary *)v17 objectForKeyedSubscript:v15];
    uint64_t v19 = [v18 allValues];
  }
  else
  {
    id v18 = [(WFLinkActionProvider *)self metadataProvider];
    id v63 = v7;
    uint64_t v19 = [v18 queriesForBundleIdentifier:v15 ofType:0 error:&v63];
    id v20 = v63;

    int v52 = v20;
  }
  v51 = self;

  id v54 = v19;
  if ([v19 count])
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if (WFQueryMetadataIsEligibleForAction(v26, v15))
          {
            long long v27 = [v26 entityType];
            [v16 addObject:v27];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v23);
    }
  }
  v49 = v13;
  long long v28 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v47 = v16;
  long long v29 = (void *)[v16 copy];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = WFShortcutsActionIdentifierFromLinkIdentifiers(v15, *(void **)(*((void *)&v55 + 1) + 8 * j));
        if (v34)
        {
          long long v35 = [v28 objectForKeyedSubscript:v34];

          if (!v35)
          {
            id v36 = [[WFActionRequest alloc] initWithActionIdentifier:v34 serializedParameters:0];
            long long v37 = [(WFActionRequest *)v36 actionIdentifier];
            [v28 setObject:v36 forKeyedSubscript:v37];
          }
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v31);
  }

  long long v38 = [v28 allValues];
  [(WFLinkActionProvider *)v51 createActionsForRequests:v38 forceLocalActionsOnly:0];

  long long v39 = [v28 allValues];
  long long v40 = objc_msgSend(v39, "if_compactMap:", &__block_literal_global_240);

  id v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v40];
  uint64_t v42 = v41;
  if (v41) {
    id v43 = v41;
  }
  else {
    id v43 = (id)objc_opt_new();
  }
  uint64_t v44 = v43;

  return v44;
}

void __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];
}

void __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_2(void **a1, void *a2)
{
  id v3 = WFEffectiveActionIdentifiersForActionMetadata(a2, a1[4], a1[5]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_3;
  v4[3] = &unk_1E65591A0;
  id v5 = a1[6];
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 result];
}

uint64_t __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)definitionForMissingActionWithSerializedParameters:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKey:@"AppIntentDescriptor"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [WFActionDefinition alloc];
    id v8 = @"AppDefinition";
    v9[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v6 = [(WFActionDefinition *)v4 initWithDictionary:v5];
  }
  else
  {

    id v6 = 0;
  }
  return v6;
}

- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4
{
}

- (BOOL)serializedAppIntentDescriptorIsValid:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4FB4508];
  id v4 = a3;
  id v5 = [v4 objectForKey:v3];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKey:*MEMORY[0x1E4FB44F8]];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  LOBYTE(v8) = 0;
  if (v7 && v10)
  {
    id v11 = [&unk_1F23180C0 objectForKeyedSubscript:v7];
    LODWORD(v8) = [v11 containsObject:v10] ^ 1;
  }
  return (char)v8;
}

void __55__WFLinkActionProvider_denyListedLinkActionIdentifiers__block_invoke()
{
  v4[67] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.VoiceMemos.OpenUIElement";
  v4[1] = @"com.apple.VoiceMemos.CloseUIElement";
  v4[2] = @"com.apple.VoiceMemos.System.SynthesizedCopyEntityAction<RCRecordingEntity>";
  v4[3] = @"com.apple.mobilemail.CreateMessageAction";
  void v4[4] = @"com.apple.mobilemail.OpenMessageEntityAction";
  v4[5] = @"com.apple.mobilemail.OpenDisplayableEntityAction";
  v4[6] = @"com.apple.mobilemail.NavigateMessagesAction";
  v4[7] = @"com.apple.mobilemail.DeleteMessageEntityAction";
  v4[8] = @"com.apple.mobilemail.ChangeFilterStateAction";
  v4[9] = @"com.apple.mobilemail.MailMessageEntity";
  v4[10] = @"com.apple.mobilemail.SendMail";
  v4[11] = @"com.apple.mobilemail.SetMailMessageIsRead";
  v4[12] = @"com.apple.Music.PausePlaybackAppIntent";
  v4[13] = @"com.apple.Music.StartPlaybackAppIntent";
  v4[14] = @"com.apple.Music.SkipItemPlaybackAppIntent";
  v4[15] = @"com.apple.Music.TogglePlaybackAppIntent";
  v4[16] = @"com.apple.podcasts.PlayPauseWidgetIntent";
  v4[17] = @"com.apple.tv.StartSportsActivityIntent";
  v4[18] = @"com.apple.tv.DestroySportsActivityIntent";
  v4[19] = @"com.apple.PeopleViewService.URLAppIntent";
  v4[20] = @"com.apple.mobileslideshow.Delete";
  v4[21] = @"com.apple.mobileslideshow.Open";
  v4[22] = @"com.apple.mobileslideshow.Favorite";
  v4[23] = @"com.apple.mobileslideshow.SearchGlobal";
  v4[24] = @"com.apple.mobileslideshow.CreateUserAlbum";
  v4[25] = @"com.apple.mobileslideshow.NavigateSequentiallyOneUp";
  v4[26] = @"com.apple.mobileslideshow.OpenSystemAlbum";
  v4[27] = @"com.apple.mobileslideshow.OpenUserAlbum";
  v4[28] = @"com.apple.mobileslideshow.OpenDestination";
  v4[29] = @"com.apple.mobilecal.Close";
  v4[30] = @"com.apple.mobilecal.Cancel";
  v4[31] = @"com.apple.mobilecal.NavigateScreenSequentiallyAction";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[32] = @"com.apple.mobilecal.OpenScreen";
  v4[33] = @"com.apple.mobilecal.ChangeCalendarBinarySetting";
  v4[34] = @"com.apple.mobilecal.Cancel";
  v4[35] = @"com.apple.mobilecal.DeleteCalendar";
  v4[36] = @"com.apple.mobilecal.CreateCalendar";
  v4[37] = @"com.apple.news.OpenSplitViewIntent";
  v4[38] = @"com.apple.news.CloseSplitViewIntent";
  v4[39] = @"com.apple.news.ArticleNavigateIntent";
  v4[40] = @"com.apple.news.FeedArticleOpenIntent";
  v4[41] = @"com.apple.news.FollowingAppEntityOpenIntent";
  v4[42] = @"com.apple.news.TabBarItemOpenIntent";
  v4[43] = @"com.apple.news.SearchAppIntent";
  v4[44] = @"com.apple.stocks.SymbolAppOpenIntent";
  v4[45] = @"com.apple.stocks.OpenTodayAppIntent";
  v4[46] = @"com.apple.stocks.FeedArticleOpenIntent";
  v4[47] = @"com.apple.stocks.AddSymbolAppIntent";
  v4[48] = @"com.apple.stocks.OpenSplitViewSiriLinkAction";
  v4[49] = @"com.apple.stocks.CloseSplitViewSiriLinkAction";
  v4[50] = @"com.apple.stocks.ArticleNavigateIntent";
  v4[51] = @"com.apple.stocks.SearchSiriLinkAction";
  v4[52] = @"com.apple.mobilesafari.CreateNewBookmark";
  v4[53] = @"com.apple.weather.OpenSearchResultAction";
  v4[54] = @"com.apple.weather.OpenSidebarAction";
  v4[55] = @"com.apple.weather.CloseSidebarAction";
  v4[56] = @"com.apple.weather.CloseLocationL2ViewAction";
  v4[57] = @"com.apple.weather.CancelAction";
  v4[58] = @"com.apple.weather.DeleteLocationAction";
  v4[59] = @"com.apple.weather.NavigateLocationsAction";
  v4[60] = @"com.apple.weather.OpenLocationAction";
  v4[61] = @"com.apple.weather.OpenLocationL2ViewAction";
  v4[62] = @"com.apple.weather.OpenMyLocationAction";
  v4[63] = @"com.apple.weather.OpenListAction";
  v4[64] = @"com.apple.weather.SearchLocationAction";
  v4[65] = @"com.apple.tips.NavigateTipsAction";
  v4[66] = @"com.apple.mobiletimer.OpenAlarmIntent";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:67];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers;
  denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers = v2;
}

+ (BOOL)isFullyQualifiedActionIdentifier:(id)a3 withMetadata:(id)a4 visibleForUse:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 bundleIdentifier];
  id v10 = [v8 actionIdentifier];

  id v11 = WFShortcutsActionIdentifierFromLinkIdentifiers(v9, v10);

  if (+[WFLinkActionProvider shouldAllowActionWithIdentifier:v11])
  {
    if (v7)
    {
      uint64_t v12 = getWFActionsLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 136315394;
        uint64_t v17 = "+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:]";
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEBUG, "%s visibleForUse using metadata %@", (uint8_t *)&v16, 0x16u);
      }

      char v13 = [v7 visibleForUse:a5];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    id v14 = getWFActionsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315394;
      uint64_t v17 = "+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:]";
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEBUG, "%s visibleForUse always denied %@", (uint8_t *)&v16, 0x16u);
    }

    char v13 = 0;
  }

  return v13;
}

@end