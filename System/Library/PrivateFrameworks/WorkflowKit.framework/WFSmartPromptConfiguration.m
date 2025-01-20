@interface WFSmartPromptConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)containsPrivatePreviews;
- (BOOL)isSpecialRequest;
- (NSArray)smartPromptStates;
- (NSData)archivedSourceContentCollection;
- (NSString)actionUUID;
- (NSString)localizedPrompt;
- (NSString)localizedSubtitle;
- (NSString)requestSource;
- (NSString)requestType;
- (NSString)workflowName;
- (WFContentCollection)cachedSourceContentCollection;
- (WFDeletionAuthorizationState)deletionAuthorizationState;
- (WFSmartPromptConfiguration)initWithCoder:(id)a3;
- (WFSmartPromptConfiguration)initWithDeletionAuthorizationState:(id)a3 contentCollection:(id)a4 action:(id)a5 reference:(id)a6 source:(id)a7;
- (WFSmartPromptConfiguration)initWithOutputContentCollection:(id)a3 reference:(id)a4 source:(id)a5;
- (WFSmartPromptConfiguration)initWithSmartPromptStates:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 action:(id)a7 contentDestination:(id)a8 reference:(id)a9 workflowName:(id)a10 source:(id)a11 isWebpageCoercion:(BOOL)a12;
- (WFWorkflowReference)workflowReference;
- (id)authorizationDialogRequestWithAttribution:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSmartPromptConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_archivedSourceContentCollection, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_workflowName, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_deletionAuthorizationState, 0);
  objc_storeStrong((id *)&self->_smartPromptStates, 0);
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_requestSource, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
}

- (WFContentCollection)cachedSourceContentCollection
{
  return self->_cachedSourceContentCollection;
}

- (NSData)archivedSourceContentCollection
{
  return self->_archivedSourceContentCollection;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (BOOL)isSpecialRequest
{
  return self->_isSpecialRequest;
}

- (NSString)workflowName
{
  return self->_workflowName;
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (WFDeletionAuthorizationState)deletionAuthorizationState
{
  return self->_deletionAuthorizationState;
}

- (NSArray)smartPromptStates
{
  return self->_smartPromptStates;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (NSString)requestSource
{
  return self->_requestSource;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (void)encodeWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WFSmartPromptConfiguration;
  id v4 = a3;
  [(WFWorkflowAuthorizationConfiguration *)&v14 encodeWithCoder:v4];
  v5 = [(WFSmartPromptConfiguration *)self requestType];
  [v4 encodeObject:v5 forKey:@"requestType"];

  v6 = [(WFSmartPromptConfiguration *)self requestSource];
  [v4 encodeObject:v6 forKey:@"requestSource"];

  v7 = [(WFSmartPromptConfiguration *)self smartPromptStates];
  [v4 encodeObject:v7 forKey:@"smartPromptStates"];

  v8 = [(WFSmartPromptConfiguration *)self deletionAuthorizationState];
  [v4 encodeObject:v8 forKey:@"deletionAuthorizationState"];

  v9 = [(WFSmartPromptConfiguration *)self workflowReference];
  [v4 encodeObject:v9 forKey:@"workflowReference"];

  v10 = [(WFSmartPromptConfiguration *)self workflowName];
  [v4 encodeObject:v10 forKey:@"workflowName"];

  v11 = [(WFSmartPromptConfiguration *)self actionUUID];
  [v4 encodeObject:v11 forKey:@"actionUUID"];

  v12 = [(WFSmartPromptConfiguration *)self archivedSourceContentCollection];
  [v4 encodeObject:v12 forKey:@"archivedSourceContentCollection"];

  v13 = [(WFSmartPromptConfiguration *)self localizedPrompt];
  [v4 encodeObject:v13 forKey:@"localizedPrompt"];
}

- (WFSmartPromptConfiguration)initWithCoder:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFSmartPromptConfiguration;
  v5 = [(WFWorkflowAuthorizationConfiguration *)&v29 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestType"];
    requestType = v5->_requestType;
    v5->_requestType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestSource"];
    requestSource = v5->_requestSource;
    v5->_requestSource = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedSourceContentCollection"];
    archivedSourceContentCollection = v5->_archivedSourceContentCollection;
    v5->_archivedSourceContentCollection = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedPrompt"];
    localizedPrompt = v5->_localizedPrompt;
    v5->_localizedPrompt = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deletionAuthorizationState"];
    deletionAuthorizationState = v5->_deletionAuthorizationState;
    v5->_deletionAuthorizationState = (WFDeletionAuthorizationState *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"smartPromptStates"];
    smartPromptStates = v5->_smartPromptStates;
    v5->_smartPromptStates = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowReference"];
    workflowReference = v5->_workflowReference;
    v5->_workflowReference = (WFWorkflowReference *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowName"];
    workflowName = v5->_workflowName;
    v5->_workflowName = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
    actionUUID = v5->_actionUUID;
    v5->_actionUUID = (NSString *)v25;

    v27 = v5;
  }

  return v5;
}

- (BOOL)containsPrivatePreviews
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(WFSmartPromptConfiguration *)self cachedSourceContentCollection];
  v3 = v2;
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(v2, "items", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) attributionSet];
          uint64_t v9 = [v8 derivedDisclosureLevel];

          if (v9 == 1)
          {
            LOBYTE(v5) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v4 = getWFSecurityLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFSmartPromptConfiguration containsPrivatePreviews]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s Programming error: the cached content collection is not available at this time.", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
LABEL_15:

  return v5;
}

- (id)authorizationDialogRequestWithAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WFSmartPromptDialogRequest alloc] initWithConfiguration:self attribution:v4];

  return v5;
}

- (WFSmartPromptConfiguration)initWithOutputContentCollection:(id)a3 reference:(id)a4 source:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)WFSmartPromptConfiguration;
  long long v11 = [(WFWorkflowAuthorizationConfiguration *)&v30 init];
  long long v12 = v11;
  if (v11)
  {
    requestType = v11->_requestType;
    v11->_requestType = (NSString *)@"SmartPrompt";

    objc_storeStrong((id *)&v12->_requestSource, a5);
    deletionAuthorizationState = v12->_deletionAuthorizationState;
    v12->_deletionAuthorizationState = 0;

    objc_storeStrong((id *)&v12->_workflowReference, a4);
    smartPromptStates = v12->_smartPromptStates;
    v12->_smartPromptStates = 0;

    v16 = +[WFSmartPromptStringGenerator localizedOutputContentDescriptionWithContentCollection:v8];
    v17 = NSString;
    uint64_t v18 = WFLocalizedString(@"Allow “%1$@” to output %2$@?");
    uint64_t v19 = [v9 name];
    v20 = [v16 localizedLowercaseString];
    uint64_t v21 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v19, v20);
    localizedPrompt = v12->_localizedPrompt;
    v12->_localizedPrompt = (NSString *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:", v8);
    archivedSourceContentCollection = v12->_archivedSourceContentCollection;
    v12->_archivedSourceContentCollection = (NSData *)v23;

    if (v12->_archivedSourceContentCollection)
    {
      uint64_t v25 = [v8 copy];
      cachedSourceContentCollection = v12->_cachedSourceContentCollection;
      v12->_cachedSourceContentCollection = (WFContentCollection *)v25;

      v12->_isSpecialRequest = 0;
      v27 = v12;
    }
    else
    {
      v28 = getWFGeneralLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[WFSmartPromptConfiguration initWithOutputContentCollection:reference:source:]";
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Unable to archive output smart prompt content collection", buf, 0xCu);
      }

      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (WFSmartPromptConfiguration)initWithDeletionAuthorizationState:(id)a3 contentCollection:(id)a4 action:(id)a5 reference:(id)a6 source:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v46.receiver = self;
  v46.super_class = (Class)WFSmartPromptConfiguration;
  uint64_t v18 = [(WFWorkflowAuthorizationConfiguration *)&v46 init];
  uint64_t v19 = v18;
  if (v18)
  {
    requestType = v18->_requestType;
    v18->_requestType = (NSString *)@"DeletionAuthorization";

    objc_storeStrong((id *)&v19->_requestSource, a7);
    uint64_t v21 = [v15 UUID];
    actionUUID = v19->_actionUUID;
    v19->_actionUUID = (NSString *)v21;

    objc_storeStrong((id *)&v19->_deletionAuthorizationState, a3);
    objc_storeStrong((id *)&v19->_workflowReference, a6);
    smartPromptStates = v19->_smartPromptStates;
    v19->_smartPromptStates = 0;

    v24 = [v13 contentItemClassName];
    if ([(NSString *)v24 length])
    {
      Class v25 = NSClassFromString(v24);
      if (v25)
      {
        Class v26 = v25;
        id v44 = v17;
        if (objc_opt_respondsToSelector())
        {
          v27 = -[objc_class localizedCountDescriptionWithValue:](v26, "localizedCountDescriptionWithValue:", [v14 numberOfItems]);
        }
        else
        {
          objc_super v30 = NSString;
          v31 = [(objc_class *)v26 countDescription];
          v27 = objc_msgSend(v30, "localizedStringWithFormat:", v31, objc_msgSend(v14, "numberOfItems"));
        }
        v32 = NSString;
        uint64_t v33 = WFLocalizedString(@"Allow “%1$@” to delete %2$@?");
        id v45 = v16;
        v34 = [v16 name];
        v35 = [v27 localizedLowercaseString];
        uint64_t v36 = objc_msgSend(v32, "localizedStringWithFormat:", v33, v34, v35);
        localizedPrompt = v19->_localizedPrompt;
        v19->_localizedPrompt = (NSString *)v36;

        uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:", v14);
        archivedSourceContentCollection = v19->_archivedSourceContentCollection;
        v19->_archivedSourceContentCollection = (NSData *)v38;

        if (v19->_archivedSourceContentCollection)
        {
          uint64_t v40 = [v14 copy];
          cachedSourceContentCollection = v19->_cachedSourceContentCollection;
          v19->_cachedSourceContentCollection = (WFContentCollection *)v40;

          v19->_isSpecialRequest = 0;
          v28 = v19;
          id v17 = v44;
          id v16 = v45;
        }
        else
        {
          v42 = getWFGeneralLogObject();
          id v17 = v44;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
            _os_log_impl(&dword_1C7F0A000, v42, OS_LOG_TYPE_FAULT, "%s Unable to archive deletion prompt content collection", buf, 0xCu);
          }

          v28 = 0;
          id v16 = v45;
        }
        goto LABEL_19;
      }
      v27 = getWFSecurityLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
        objc_super v29 = "%s Failed to init contentItemClass from name";
        goto LABEL_11;
      }
    }
    else
    {
      v27 = getWFSecurityLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[WFSmartPromptConfiguration initWithDeletionAuthorizationState:contentCollection:action:reference:source:]";
        objc_super v29 = "%s No contentItemClassName in WFDeletionAuthorizationState";
LABEL_11:
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, v29, buf, 0xCu);
      }
    }
    v28 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v28 = 0;
LABEL_20:

  return v28;
}

- (WFSmartPromptConfiguration)initWithSmartPromptStates:(id)a3 attributionSet:(id)a4 previousAttributions:(id)a5 contentItemCache:(id)a6 action:(id)a7 contentDestination:(id)a8 reference:(id)a9 workflowName:(id)a10 source:(id)a11 isWebpageCoercion:(BOOL)a12
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v54 = a4;
  id v53 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v52 = a9;
  id v22 = a10;
  id v50 = a11;
  v58.receiver = self;
  v58.super_class = (Class)WFSmartPromptConfiguration;
  uint64_t v23 = [(WFWorkflowAuthorizationConfiguration *)&v58 init];
  v24 = v23;
  if (v23)
  {
    requestType = v23->_requestType;
    v23->_requestType = (NSString *)@"SmartPrompt";

    objc_storeStrong((id *)&v24->_requestSource, a11);
    uint64_t v26 = [v20 UUID];
    actionUUID = v24->_actionUUID;
    v24->_actionUUID = (NSString *)v26;

    objc_storeStrong((id *)&v24->_smartPromptStates, a3);
    deletionAuthorizationState = v24->_deletionAuthorizationState;
    v24->_deletionAuthorizationState = 0;

    objc_storeStrong((id *)&v24->_workflowReference, a9);
    objc_super v29 = v22;
    if (!v22)
    {
      objc_super v29 = [v52 name];
    }
    objc_storeStrong((id *)&v24->_workflowName, v29);
    if (!v22) {

    }
    if ([v21 promptingBehaviour] == 2)
    {
      objc_super v30 = [MEMORY[0x1E4F1C978] array];
    }
    else
    {
      v32 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v33 = [v54 attributions];
      v34 = objc_msgSend(v33, "if_flatMap:", &__block_literal_global_40109);
      v35 = [v32 orderedSetWithArray:v34];

      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_2;
      v56[3] = &unk_1E6552FB0;
      id v57 = v19;
      uint64_t v36 = objc_msgSend(v35, "if_compactMap:", v56);
      objc_super v30 = [v36 array];
    }
    v37 = [MEMORY[0x1E4F5A830] collectionWithItems:v30];
    uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:", v37);
    archivedSourceContentCollection = v24->_archivedSourceContentCollection;
    v24->_archivedSourceContentCollection = (NSData *)v38;

    if (v24->_archivedSourceContentCollection)
    {
      uint64_t v40 = [v37 copy];
      cachedSourceContentCollection = v24->_cachedSourceContentCollection;
      v24->_cachedSourceContentCollection = (WFContentCollection *)v40;

      LOBYTE(v48) = a12;
      uint64_t v42 = +[WFSmartPromptStringGenerator localizedPromptForWorkflowName:v22 attributionSet:v54 contentCollection:v24->_cachedSourceContentCollection contentItemCache:v19 contentDestination:v21 action:v20 isWebpageCoercion:v48];
      localizedPrompt = v24->_localizedPrompt;
      v24->_localizedPrompt = (NSString *)v42;

      LOBYTE(v49) = a12;
      uint64_t v44 = +[WFSmartPromptStringGenerator localizedSubtitleForWorkflowName:v22 attributionSet:v54 previousAttributions:v53 contentItemCache:v19 contentDestination:v21 action:v20 isWebpageCoercion:v49];
      localizedSubtitle = v24->_localizedSubtitle;
      v24->_localizedSubtitle = (NSString *)v44;

      if ([v37 numberOfItems] < 1)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v60 = 0x2020000000;
        char v61 = 1;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_199;
        v55[3] = &unk_1E6552FD8;
        v55[4] = &buf;
        [v51 enumerateObjectsUsingBlock:v55];
        v24->_isSpecialRequest = *(unsigned char *)(*((void *)&buf + 1) + 24);
        _Block_object_dispose(&buf, 8);
      }
      else
      {
        v24->_isSpecialRequest = 0;
      }
      v31 = v24;
    }
    else
    {
      objc_super v46 = getWFGeneralLogObject();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[WFSmartPromptConfiguration initWithSmartPromptStates:attributionSet:previousAt"
                                        "tributions:contentItemCache:action:contentDestination:reference:workflowName:sou"
                                        "rce:isWebpageCoercion:]";
        _os_log_impl(&dword_1C7F0A000, v46, OS_LOG_TYPE_FAULT, "%s Unable to archive smart prompt source content collection", (uint8_t *)&buf, 0xCu);
      }

      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

uint64_t __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) contentItemForUUID:a2];
}

void __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke_199(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 mode];
  if ([v6 isEqualToString:@"UserWildcard"])
  {
  }
  else
  {
    v7 = [v9 mode];
    char v8 = [v7 isEqualToString:@"ActionWildcard"];

    if ((v8 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

id __183__WFSmartPromptConfiguration_initWithSmartPromptStates_attributionSet_previousAttributions_contentItemCache_action_contentDestination_reference_workflowName_source_isWebpageCoercion___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 privateItemIdentifiers];
  v3 = [v2 array];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end