@interface WFAccessResourcesSmartPromptsCustomModificationsStep
- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4;
- (BOOL)shortcutHasSmartPromptsData:(id)a3 context:(id)a4;
- (NSDictionary)accessResourceIdentifiersByContentDestination;
- (NSDictionary)actionIdentifiersByContentDestination;
- (NSDictionary)contentDestinationsByAccessResourceIdentifier;
- (NSDictionary)contentDestinationsByActionIdentifier;
- (id)actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:(id)a3;
- (id)bundleIdentifierForIntentBasedActionIdentifier:(id)a3 accessResourceIdentifiers:(id)a4;
- (id)contentLocationForActionIdentifier:(id)a3 statesByAccessResourceIdentifier:(id)a4;
- (id)extractBundleIdentifierFromIntentsAccessResourceIdentifier:(id)a3;
- (id)fetchMigrationEligibleActionUUIDsForWorkflow:(id)a3 context:(id)a4 workflowAccessResourceIdentifiers:(id)a5;
- (id)fetchStatesByAccessResourceIdentifierForWorkflow:(id)a3 context:(id)a4;
- (void)migrateAccessResourcesToSmartPromptsForWorkflow:(id)a3 context:(id)a4;
@end

@implementation WFAccessResourcesSmartPromptsCustomModificationsStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDestinationsByActionIdentifier, 0);
  objc_storeStrong((id *)&self->_accessResourceIdentifiersByContentDestination, 0);
  objc_storeStrong((id *)&self->_actionIdentifiersByContentDestination, 0);
  objc_storeStrong((id *)&self->_contentDestinationsByAccessResourceIdentifier, 0);
}

- (NSDictionary)contentDestinationsByActionIdentifier
{
  contentDestinationsByActionIdentifier = self->_contentDestinationsByActionIdentifier;
  if (!contentDestinationsByActionIdentifier)
  {
    v4 = objc_opt_new();
    v5 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self actionIdentifiersByContentDestination];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__WFAccessResourcesSmartPromptsCustomModificationsStep_contentDestinationsByActionIdentifier__block_invoke;
    v10[3] = &unk_1E6557BF8;
    v6 = v4;
    v11 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];

    v7 = self->_contentDestinationsByActionIdentifier;
    self->_contentDestinationsByActionIdentifier = v6;
    v8 = v6;

    contentDestinationsByActionIdentifier = self->_contentDestinationsByActionIdentifier;
  }
  return contentDestinationsByActionIdentifier;
}

void __93__WFAccessResourcesSmartPromptsCustomModificationsStep_contentDestinationsByActionIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSDictionary)accessResourceIdentifiersByContentDestination
{
  v11[1] = *MEMORY[0x1E4F143B8];
  accessResourceIdentifiersByContentDestination = self->_accessResourceIdentifiersByContentDestination;
  if (!accessResourceIdentifiersByContentDestination)
  {
    v4 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self contentDestinationsByAccessResourceIdentifier];
    uint64_t v5 = [v4 count];

    id v6 = (char *)v11 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, 8 * v5);
    bzero(v6, 8 * v5);
    uint64_t v7 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self contentDestinationsByAccessResourceIdentifier];
    [v7 getObjects:v6 andKeys:v6 count:v5];

    uint64_t v8 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v6 forKeys:v6 count:v5];
    uint64_t v9 = self->_accessResourceIdentifiersByContentDestination;
    self->_accessResourceIdentifiersByContentDestination = v8;

    accessResourceIdentifiersByContentDestination = self->_accessResourceIdentifiersByContentDestination;
  }
  return accessResourceIdentifiersByContentDestination;
}

- (NSDictionary)actionIdentifiersByContentDestination
{
  actionIdentifiersByContentDestination = self->_actionIdentifiersByContentDestination;
  if (!actionIdentifiersByContentDestination)
  {
    WFContentLocationToActionIdentifierMapping();
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_actionIdentifiersByContentDestination;
    self->_actionIdentifiersByContentDestination = v4;

    actionIdentifiersByContentDestination = self->_actionIdentifiersByContentDestination;
  }
  return actionIdentifiersByContentDestination;
}

- (NSDictionary)contentDestinationsByAccessResourceIdentifier
{
  contentDestinationsByAccessResourceIdentifier = self->_contentDestinationsByAccessResourceIdentifier;
  if (!contentDestinationsByAccessResourceIdentifier)
  {
    WFContentLocationByAccessResourceIdentifier();
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_contentDestinationsByAccessResourceIdentifier;
    self->_contentDestinationsByAccessResourceIdentifier = v4;

    contentDestinationsByAccessResourceIdentifier = self->_contentDestinationsByAccessResourceIdentifier;
  }
  return contentDestinationsByAccessResourceIdentifier;
}

- (id)actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 136315394;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "hasPrefix:", @"WFIntentsAccessResource.", v20, (void)v21) & 1) == 0)
        {
          if ([v12 isEqualToString:@"WFRemoteServerAccessResource"])
          {
            long long v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F23178E0];
            long long v14 = [v13 allObjects];
            goto LABEL_11;
          }
          v15 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self contentDestinationsByAccessResourceIdentifier];
          long long v13 = [v15 objectForKeyedSubscript:v12];

          if (v13)
          {
            uint64_t v16 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self actionIdentifiersByContentDestination];
            long long v14 = [v16 objectForKeyedSubscript:v13];

            if (v14)
            {
LABEL_11:
              [v5 addObjectsFromArray:v14];
            }
            else
            {
              v17 = getWFWorkflowMigrationLogObject();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v18 = [v13 identifier];
                *(_DWORD *)buf = v20;
                v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersThatRequireMigrationForAcc"
                      "essResourceIdentifiers:]";
                __int16 v27 = 2112;
                v28 = v18;
                _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Content destination %@ doesn't map to any action identifiers", buf, 0x16u);
              }
              long long v14 = 0;
            }
          }
          else
          {
            long long v14 = getWFWorkflowMigrationLogObject();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep actionIdentifiersThatRequireMigrationForAcces"
                    "sResourceIdentifiers:]";
              __int16 v27 = 2112;
              v28 = v12;
              _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Access resource %@ doesn't map to any content destination", buf, 0x16u);
            }
            long long v13 = 0;
          }

          continue;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)shortcutHasSmartPromptsData:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[WFCoreDataSmartPromptPermission fetchRequest];
  long long v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [v6 identifier];

  uint64_t v10 = [v8 predicateWithFormat:@"%K = %@", @"shortcut.workflowID", v9];
  [v7 setPredicate:v10];

  id v16 = 0;
  uint64_t v11 = [v5 countForFetchRequest:v7 error:&v16];

  id v12 = v16;
  if (v12)
  {
    long long v13 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep shortcutHasSmartPromptsData:context:]";
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEBUG, "%s Failed to fetch smart prompts count for workflow: %@", buf, 0x16u);
    }

    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = v11 != 0;
  }

  return v14;
}

- (id)extractBundleIdentifierFromIntentsAccessResourceIdentifier:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = [v3 firstObject];
  int v5 = [v4 isEqualToString:@"WFIntentsAccessResource"];

  if (v5)
  {
    id v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    uint64_t v7 = [v6 componentsJoinedByString:@"."];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)fetchMigrationEligibleActionUUIDsForWorkflow:(id)a3 context:(id)a4 workflowAccessResourceIdentifiers:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v62 = a5;
  uint64_t v10 = +[WFCoreDataWorkflowActions fetchRequest];
  uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
  id v12 = [v8 identifier];
  long long v13 = [v11 predicateWithFormat:@"%K = %@", @"shortcut.workflowID", v12];
  [v10 setPredicate:v13];

  [v10 setFetchLimit:1];
  id v75 = 0;
  BOOL v14 = [v9 executeFetchRequest:v10 error:&v75];
  id v15 = v75;
  id v16 = [v14 firstObject];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 data];
    if (v18)
    {
      id v74 = 0;
      __int16 v19 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:1 format:0 error:&v74];
      id v20 = v74;
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v52 = v20;
        v53 = v18;
        v54 = v17;
        id v55 = v15;
        v56 = v14;
        v57 = v10;
        id v58 = v9;
        id v59 = v8;
        uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        obuint64_t j = v19;
        uint64_t v22 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
        long long v23 = v62;
        id v61 = v21;
        if (v22)
        {
          uint64_t v24 = v22;
          uint64_t v63 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v71 != v63) {
                objc_enumerationMutation(obj);
              }
              v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              __int16 v27 = [v26 objectForKey:@"WFWorkflowActionIdentifier"];
              v28 = (void *)MEMORY[0x1E4F1CAD0];
              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __143__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchMigrationEligibleActionUUIDsForWorkflow_context_workflowAccessResourceIdentifiers___block_invoke;
              v69[3] = &unk_1E6557BC8;
              v69[4] = self;
              v29 = objc_msgSend(v23, "if_compactMap:", v69);
              uint64_t v30 = [v28 setWithArray:v29];

              long long v67 = 0u;
              long long v68 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v31 = v30;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v76 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                int v34 = 0;
                uint64_t v35 = *(void *)v66;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v66 != v35) {
                      objc_enumerationMutation(v31);
                    }
                    v34 |= [v27 hasPrefix:*(void *)(*((void *)&v65 + 1) + 8 * j)];
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v76 count:16];
                }
                while (v33);

                uint64_t v21 = v61;
                long long v23 = v62;
                if (v34)
                {
LABEL_21:
                  v39 = [v26 objectForKey:@"WFWorkflowActionParameters"];
                  if (!v39)
                  {
                    v40 = getWFWorkflowMigrationLogObject();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForW"
                            "orkflow:context:workflowAccessResourceIdentifiers:]";
                      __int16 v80 = 2114;
                      id v81 = v27;
                      _os_log_impl(&dword_1C7F0A000, v40, OS_LOG_TYPE_DEBUG, "%s Action %{public}@ does not have WFWorkflowActionParameters, creating dictionary", buf, 0x16u);
                    }

                    v39 = [MEMORY[0x1E4F1CA60] dictionary];
                    [v26 setObject:v39 forKey:@"WFWorkflowActionParameters"];
                  }
                  v41 = [v39 objectForKey:@"UUID"];
                  if (!v41)
                  {
                    v42 = getWFWorkflowMigrationLogObject();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136315394;
                      v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForW"
                            "orkflow:context:workflowAccessResourceIdentifiers:]";
                      __int16 v80 = 2112;
                      id v81 = v27;
                      _os_log_impl(&dword_1C7F0A000, v42, OS_LOG_TYPE_DEBUG, "%s Creating UUID for action with identifier %@", buf, 0x16u);
                    }

                    v43 = [MEMORY[0x1E4F29128] UUID];
                    v41 = [v43 UUIDString];

                    [v39 setObject:v41 forKey:@"UUID"];
                  }
                  v44 = [v21 objectForKey:v27];

                  if (v44)
                  {
                    v45 = [v21 objectForKey:v27];
                    [v45 addObject:v41];
                  }
                  else
                  {
                    v45 = [MEMORY[0x1E4F1CA48] arrayWithObject:v41];
                    [v21 setObject:v45 forKey:v27];
                  }

                  goto LABEL_35;
                }
              }
              else
              {
              }
              v37 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self actionIdentifiersThatRequireMigrationForAccessResourceIdentifiers:v23];
              char v38 = [v37 containsObject:v27];

              if (v38) {
                goto LABEL_21;
              }
              v39 = getWFWorkflowMigrationLogObject();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflo"
                      "w:context:workflowAccessResourceIdentifiers:]";
                __int16 v80 = 2112;
                id v81 = v27;
                _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_DEBUG, "%s Action with identifier %@ does not require migration.", buf, 0x16u);
              }
LABEL_35:
            }
            uint64_t v24 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
          }
          while (v24);
        }
        v46 = obj;

        uint64_t v64 = 0;
        uint64_t v47 = [MEMORY[0x1E4F28F98] dataWithPropertyList:obj format:200 options:0 error:&v64];
        v48 = (void *)v47;
        if (v64 || !v47)
        {
          v50 = getWFWorkflowMigrationLogObject();
          id v9 = v58;
          id v8 = v59;
          BOOL v14 = v56;
          uint64_t v10 = v57;
          id v15 = v55;
          v18 = v53;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:co"
                  "ntext:workflowAccessResourceIdentifiers:]";
            _os_log_impl(&dword_1C7F0A000, v50, OS_LOG_TYPE_ERROR, "%s Failed to serialize mutated actions for save.", buf, 0xCu);
          }

          v17 = v54;
        }
        else
        {
          v17 = v54;
          [v54 setData:v47];
          id v9 = v58;
          id v8 = v59;
          BOOL v14 = v56;
          uint64_t v10 = v57;
          id v15 = v55;
          v18 = v53;
        }
        id v20 = v52;
      }
      else
      {

        v46 = getWFWorkflowMigrationLogObject();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:cont"
                "ext:workflowAccessResourceIdentifiers:]";
          __int16 v80 = 2114;
          id v81 = v15;
          _os_log_impl(&dword_1C7F0A000, v46, OS_LOG_TYPE_ERROR, "%s Could not deserialize actions from plist: %{public}@", buf, 0x16u);
        }
        id v61 = (id)MEMORY[0x1E4F1CC08];
      }
      v49 = v62;
    }
    else
    {
      id v20 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:contex"
              "t:workflowAccessResourceIdentifiers:]";
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataWorkflowActions object.", buf, 0xCu);
      }
      id v61 = (id)MEMORY[0x1E4F1CC08];
      v49 = v62;
    }
  }
  else
  {
    v18 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchMigrationEligibleActionUUIDsForWorkflow:context:"
            "workflowAccessResourceIdentifiers:]";
      __int16 v80 = 2112;
      id v81 = v8;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s No WFCoreDataWorkflowActions object found for workflow: %@.", buf, 0x16u);
    }
    id v61 = (id)MEMORY[0x1E4F1CC08];
    v49 = v62;
  }

  return v61;
}

uint64_t __143__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchMigrationEligibleActionUUIDsForWorkflow_context_workflowAccessResourceIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) extractBundleIdentifierFromIntentsAccessResourceIdentifier:a2];
}

- (id)fetchStatesByAccessResourceIdentifierForWorkflow:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[WFCoreDataAccessResourcePermission fetchRequest];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [v6 identifier];

  uint64_t v10 = [v8 predicateWithFormat:@"%K = %@", @"shortcut.workflowID", v9];
  [v7 setPredicate:v10];

  id v19 = 0;
  uint64_t v11 = [v5 executeFetchRequest:v7 error:&v19];

  id v12 = v19;
  if (v12)
  {
    long long v13 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:context:]";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to fetch access resources for workflow: %@", buf, 0x16u);
    }
    BOOL v14 = MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __113__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchStatesByAccessResourceIdentifierForWorkflow_context___block_invoke;
    v17[3] = &unk_1E6557BA0;
    BOOL v14 = v15;
    v18 = v14;
    [v11 enumerateObjectsUsingBlock:v17];
    long long v13 = v18;
  }

  return v14;
}

void __113__WFAccessResourcesSmartPromptsCustomModificationsStep_fetchStatesByAccessResourceIdentifierForWorkflow_context___block_invoke(uint64_t a1, void *a2)
{
  v21[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v3 data];

  if (v5)
  {
    id v14 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v14];
    uint64_t v7 = v14;
    [v6 setClass:objc_opt_class() forClassName:@"WFHealthKitAccessResourcePerWorkflowState"];
    [v6 setClass:objc_opt_class() forClassName:@"WFRemoteServerAccessResourcePerWorkflowState"];
    [v6 setClass:objc_opt_class() forClassName:@"WFRemoteServerAccessResourcePerWorkflowStateEntry"];
    [v6 setClass:objc_opt_class() forClassName:@"WFHealthKitAccessResourcePerWorkflowStateEntry"];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    v21[4] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    uint64_t v10 = [v6 decodeObjectOfClasses:v9 forKey:*MEMORY[0x1E4F284E8]];

    if (v7)
    {
      uint64_t v11 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:co"
              "ntext:]_block_invoke";
        __int16 v17 = 2114;
        v18 = v4;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to unarchive access resource state data with identifier %{public}@: %@", buf, 0x20u);
      }
    }
    else
    {
      [v6 finishDecoding];
      id v12 = getWFWorkflowMigrationLogObject();
      long long v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          id v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:"
                "context:]_block_invoke";
          __int16 v17 = 2112;
          v18 = v4;
          __int16 v19 = 2112;
          id v20 = v10;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEBUG, "%s Got an access resource to migrate: %@, state = %@", buf, 0x20u);
        }

        [*(id *)(a1 + 32) setObject:v10 forKey:v4];
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:"
                "context:]_block_invoke";
          __int16 v17 = 2114;
          v18 = v4;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Failed to unarchive access resource state data with identifier %{public}@: access resource was nil", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v7 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep fetchStatesByAccessResourceIdentifierForWorkflow:cont"
            "ext:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s No NSData found on WFCoreDataAccessResourcePermission.", buf, 0xCu);
    }
  }
}

- (id)bundleIdentifierForIntentBasedActionIdentifier:(id)a3 accessResourceIdentifiers:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = -[WFAccessResourcesSmartPromptsCustomModificationsStep extractBundleIdentifierFromIntentsAccessResourceIdentifier:](self, "extractBundleIdentifierFromIntentsAccessResourceIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
      if (v12)
      {
        if ([v6 hasPrefix:v12]) {
          break;
        }
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v12 = 0;
  }

  return v12;
}

- (id)contentLocationForActionIdentifier:(id)a3 statesByAccessResourceIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F5A788] locationWithSystemAppBundleIdentifier:*MEMORY[0x1E4FB4AD8]];
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F23178E0];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"WFRemoteServerAccessResource"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v43 = 1;
        id v12 = [MEMORY[0x1E4F1CA48] array];
        long long v13 = (void *)v11[1];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke;
        v39[3] = &unk_1E6557B50;
        v41 = buf;
        id v14 = v12;
        id v40 = v14;
        [v13 enumerateObjectsUsingBlock:v39];
        if (*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          long long v15 = (void *)MEMORY[0x1E4F5AA48];
          long long v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
          id v17 = [v15 locationWithHostnames:v16];
        }
        else
        {
          id v17 = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_31;
      }
    }
    goto LABEL_11;
  }
  v18 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self contentDestinationsByActionIdentifier];
  uint64_t v19 = [v18 objectForKey:v6];
  int v20 = [v19 isEqual:v8];

  if (v20)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"WFHealthKitAccessResource"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v43 = 1;
        uint64_t v21 = (void *)v11[1];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke_2;
        v38[3] = &unk_1E6557B78;
        v38[4] = buf;
        [v21 enumerateObjectsUsingBlock:v38];
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          id v17 = v8;
        }
        else {
          id v17 = 0;
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_31;
      }
    }
LABEL_11:

    id v17 = 0;
    goto LABEL_31;
  }
  __int16 v22 = [v7 allKeys];
  id v23 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self bundleIdentifierForIntentBasedActionIdentifier:v6 accessResourceIdentifiers:v22];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F302A8]);
    v25 = [v7 allKeys];
    v26 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self bundleIdentifierForIntentBasedActionIdentifier:v6 accessResourceIdentifiers:v25];
    __int16 v27 = (void *)[v24 initWithBundleIdentifier:v26];

    v28 = [MEMORY[0x1E4F302D0] sharedResolver];
    v29 = [v28 resolvedAppMatchingDescriptor:v27];

    id v17 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v29];

    goto LABEL_31;
  }
  uint64_t v30 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self contentDestinationsByActionIdentifier];
  id v31 = [v30 objectForKey:v6];

  if (v31)
  {
    uint64_t v32 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self accessResourceIdentifiersByContentDestination];
    uint64_t v33 = [v32 objectForKey:v31];

    if (v33)
    {
      int v34 = [v7 objectForKeyedSubscript:v33];
      if (v34)
      {
        id v17 = v31;
LABEL_29:

        goto LABEL_30;
      }
      v36 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFAccessResourcesSmartPromptsCustomModificationsStep contentLocationForActionIdentifier:s"
                             "tatesByAccessResourceIdentifier:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_DEBUG, "%s Current state for %{public}@ is disabled; won't be migrated.",
          buf,
          0x16u);
      }

      int v34 = 0;
    }
    else
    {
      int v34 = getWFWorkflowMigrationLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = [v31 identifier];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFAccessResourcesSmartPromptsCustomModificationsStep contentLocationForActionIdentifier:s"
                             "tatesByAccessResourceIdentifier:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_ERROR, "%s Missing mapping for content destination: what access resource does %{public}@ map to?", buf, 0x16u);
      }
    }
    id v17 = 0;
    goto LABEL_29;
  }
  id v17 = 0;
LABEL_30:

LABEL_31:
  return v17;
}

void __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([*((id *)v5 + 1) isEqual:MEMORY[0x1E4F1CC28]])
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:*((void *)v5 + 2)];
  }
}

uint64_t __124__WFAccessResourcesSmartPromptsCustomModificationsStep_contentLocationForActionIdentifier_statesByAccessResourceIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a2 + 8) isEqual:MEMORY[0x1E4F1CC28]];
  if (result)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (void)migrateAccessResourcesToSmartPromptsForWorkflow:(id)a3 context:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(WFAccessResourcesSmartPromptsCustomModificationsStep *)self shortcutHasSmartPromptsData:v6 context:v7])
  {
    uint64_t v8 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v6 name];
      *(_DWORD *)buf = 136315394;
      char v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v9;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEBUG, "%s Skipping migration of shortcut '%@' as it already has smart prompts data.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    int v10 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self fetchStatesByAccessResourceIdentifierForWorkflow:v6 context:v7];
    uint64_t v11 = [v10 count];
    id v12 = getWFWorkflowMigrationLogObject();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        char v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
        __int16 v44 = 2048;
        uint64_t v45 = [v10 count];
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEBUG, "%s Found %lu access resources for migration.", buf, 0x16u);
      }

      id v14 = [v10 allKeys];
      id v15 = v6;
      id v16 = v7;
      id v17 = [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self fetchMigrationEligibleActionUUIDsForWorkflow:v6 context:v7 workflowAccessResourceIdentifiers:v14];

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __112__WFAccessResourcesSmartPromptsCustomModificationsStep_migrateAccessResourcesToSmartPromptsForWorkflow_context___block_invoke;
      v38[3] = &unk_1E6557B28;
      v38[4] = self;
      id v31 = v10;
      id v39 = v10;
      uint64_t v32 = v8;
      v18 = v8;
      id v40 = v18;
      uint64_t v30 = v17;
      [v17 enumerateKeysAndObjectsUsingBlock:v38];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v33 = 0;
            v25 = [v24 databaseDataWithError:&v33];
            id v26 = v33;
            if (v26)
            {
              __int16 v27 = getWFWorkflowMigrationLogObject();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                char v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
                __int16 v44 = 2114;
                uint64_t v45 = (uint64_t)v26;
                _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s Could not serialize migrated state: %{public}@", buf, 0x16u);
              }
            }
            else
            {
              __int16 v27 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"SmartPromptPermission" inManagedObjectContext:v16];
              [v27 setShortcut:v15];
              v28 = [v24 actionUUID];
              [v27 setActionUUID:v28];

              [v27 setData:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v41 count:16];
        }
        while (v21);
      }

      id v6 = v15;
      id v7 = v16;
      int v10 = v31;
      uint64_t v8 = v32;
      id v12 = v30;
    }
    else if (v13)
    {
      v29 = [v6 name];
      *(_DWORD *)buf = 136315394;
      char v43 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:context:]";
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v29;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEBUG, "%s Skipping migration of shortcut '%@' as it doesn't have access resources.", buf, 0x16u);
    }
  }
}

void __112__WFAccessResourcesSmartPromptsCustomModificationsStep_migrateAccessResourcesToSmartPromptsForWorkflow_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v20 = v5;
  id v7 = [*(id *)(a1 + 32) contentLocationForActionIdentifier:v5 statesByAccessResourceIdentifier:*(void *)(a1 + 40)];
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v18 = v6;
      uint64_t v11 = *(void *)v22;
      obuint64_t j = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v14 = getWFWorkflowMigrationLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            id v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow"
                  ":context:]_block_invoke";
            __int16 v27 = 2112;
            v28 = v20;
            __int16 v29 = 2112;
            uint64_t v30 = v13;
            _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEBUG, "%s Ready to create smart prompt state for %@, UUID: %@", buf, 0x20u);
          }

          id v15 = [[WFSmartPromptState alloc] initWithMode:@"UserWildcard" sourceContentAttribution:0 actionUUID:v13 contentDestination:v7 status:@"Allow"];
          [*(id *)(a1 + 48) addObject:v15];
          if ([v7 promptingBehaviour])
          {
            id v16 = getWFWorkflowMigrationLogObject();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315907;
              id v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkfl"
                    "ow:context:]_block_invoke";
              __int16 v27 = 2113;
              v28 = v7;
              __int16 v29 = 2114;
              uint64_t v30 = v13;
              __int16 v31 = 2114;
              uint64_t v32 = v20;
              _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Creating action wildcard for %{private}@, actionUUID: %{public}@, actionIdentifier: %{public}@", buf, 0x2Au);
            }

            id v17 = [[WFSmartPromptState alloc] initWithMode:@"ActionWildcard" sourceContentAttribution:0 actionUUID:v13 contentDestination:v7 status:@"Allow"];
            [*(id *)(a1 + 48) addObject:v17];
          }
        }
        uint64_t v8 = obj;
        uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v10);
      id v6 = v18;
    }
  }
  else
  {
    uint64_t v8 = getWFWorkflowMigrationLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep migrateAccessResourcesToSmartPromptsForWorkflow:conte"
            "xt:]_block_invoke";
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Skipping migration of %@ because no content destination was found, or permission was previously denied", buf, 0x16u);
    }
  }
}

- (BOOL)performModificationsWithContext:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = getWFWorkflowMigrationLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "-[WFAccessResourcesSmartPromptsCustomModificationsStep performModificationsWithContext:error:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Starting migration of access resources into smart prompts.", buf, 0xCu);
  }
  long long v21 = a4;

  uint64_t v20 = (void *)MEMORY[0x1C87CA430]();
  uint64_t v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Shortcut"];
  [v8 setFetchLimit:5];
  id v29 = 0;
  uint64_t v9 = [v6 executeFetchRequest:v8 error:&v29];
  id v10 = v29;
  while ([v9 count])
  {
    context = (void *)MEMORY[0x1C87CA430]();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v17 = (void *)MEMORY[0x1C87CA430]();
          [(WFAccessResourcesSmartPromptsCustomModificationsStep *)self migrateAccessResourcesToSmartPromptsForWorkflow:v16 context:v6];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }

    id v24 = v10;
    [v6 save:&v24];
    id v18 = v24;

    [v6 reset];
    objc_msgSend(v8, "setFetchOffset:", objc_msgSend(v8, "fetchOffset") + objc_msgSend(v8, "fetchLimit"));
    id v23 = v18;
    uint64_t v9 = [v6 executeFetchRequest:v8 error:&v23];
    id v10 = v23;
  }

  if (v21) {
    *long long v21 = v10;
  }

  return v10 == 0;
}

@end