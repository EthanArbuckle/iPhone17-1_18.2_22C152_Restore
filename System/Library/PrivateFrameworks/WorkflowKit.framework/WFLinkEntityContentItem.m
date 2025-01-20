@interface WFLinkEntityContentItem
+ (BOOL)hasInMemoryFindAction;
+ (BOOL)hasLibrary;
+ (BOOL)isCalendarEntity;
+ (BOOL)isNoteEntity;
+ (BOOL)isNoteFolderEntityIdentifier:(id)a3;
+ (BOOL)isNotes;
+ (BOOL)isWorkflowEntity;
+ (BOOL)supportsSecureCoding;
+ (LNEntityMetadata)entityMetadata;
+ (LNQueryMetadata)queryMetadata;
+ (NSString)appBundleIdentifier;
+ (NSString)displayedAppBundleIdentifier;
+ (id)_localizedTypeDescriptionWithContext:(id)a3 pluralizationNumber:(int64_t)a4;
+ (id)allProperties;
+ (id)allowedOperatorsWithQueryParameterMetadata:(id)a3 objectClass:(Class)a4 operators:(id)a5;
+ (id)coercions;
+ (id)eventCoercionHandler;
+ (id)localizedCountDescriptionWithValue:(int64_t)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)propertyBuildersForFilteringUsingQuery:(id)a3;
+ (id)workflowCoercionHandler;
+ (void)initialize;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (LNDisplayRepresentation)displayRepresentation;
- (LNEntity)entity;
- (WFLinkEntityContentItem)initWithCoder:(id)a3;
- (id)name;
- (void)copyStateToItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)setDisplayRepresentation:(id)a3;
@end

@implementation WFLinkEntityContentItem

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setDisplayRepresentation:(id)a3
{
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [(id)objc_opt_class() entityMetadata];
  v10 = [v9 systemProtocolMetadata];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F72928]];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  v14 = [v9 transferableContentTypes];
  v15 = [v14 exportableTypes];
  v16 = objc_msgSend(v15, "if_map:", &__block_literal_global_345);

  v17 = [v8 string];
  v18 = WFBestFileTypeForSupportedContentTypes(v16, v17);

  if (v18) {
    goto LABEL_8;
  }
  v19 = [v13 supportedContentTypes];
  v20 = objc_msgSend(v19, "if_map:", &__block_literal_global_348);

  v21 = [v8 string];
  v18 = WFBestFileTypeForSupportedContentTypes(v20, v21);

  if (v18)
  {
LABEL_8:
    v40 = v16;
    v22 = [MEMORY[0x1E4F72BC8] policyWithEntityMetadata:v9];
    id v46 = 0;
    v23 = [v22 connectionWithError:&v46];
    id v24 = v46;
    v25 = v24;
    if (v23)
    {
      id v37 = v24;
      id v38 = v13;
      id v39 = v8;
      v26 = [(WFLinkEntityContentItem *)self entity];
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F72BE0]) initWithContentType:v18];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F72C88]) initWithContentType:v27 preferredExtractionType:0];
      v29 = [MEMORY[0x1E4F28F80] processInfo];
      v30 = v29;
      if (v29) {
        objc_msgSend(v29, "if_auditToken");
      }
      else {
        memset(v45, 0, sizeof(v45));
      }
      v32 = [v28 configurationWithAuditToken:v45];

      v47 = v26;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_352;
      v41[3] = &unk_1E654C868;
      id v42 = v26;
      id v44 = v7;
      id v43 = v9;
      id v34 = v26;
      [v23 exportEntities:v33 metadata:v43 withConfiguration:v32 completionHandler:v41];

      id v13 = v38;
      id v8 = v39;
      v25 = v37;
    }
    else
    {
      v31 = getWFGeneralLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]";
        __int16 v50 = 2112;
        v51 = v25;
        _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v25);
    }

    v16 = v40;
  }
  else
  {
    v35 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = [v8 string];
      *(_DWORD *)buf = 136315394;
      v49 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]";
      __int16 v50 = 2112;
      v51 = v36;
      _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_ERROR, "%s Failed to find a best file type for %@ returning nil!", buf, 0x16u);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_352(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = [a2 value];
    id v7 = [v6 firstObject];
    id v8 = [v7 exportedContent];

    v9 = [v8 content];
    v10 = objc_msgSend(v9, "wf_fileRepresentation");

    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB47A8]) initWithEntity:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40)];
    [v10 setMetadata:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 32) identifier];
      int v14 = 136315650;
      v15 = "-[WFLinkEntityContentItem generateFileRepresentation:options:forType:]_block_invoke";
      __int16 v16 = 2112;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Unable to fetch coerced value for entity with identifier: %@ - %@", (uint8_t *)&v14, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __70__WFLinkEntityContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType];
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(WFLinkEntityContentItem *)self entity];
  if ((Class)objc_opt_class() == a5)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F72C58]);
    v17 = [v10 identifier];
    __int16 v18 = [v17 typeIdentifier];
    v12 = (void *)[v16 initWithIdentifier:v18];

    id v19 = (id)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v10 valueType:v12];
    (*((void (**)(id, id, void, void))v8 + 2))(v8, v19, 0, 0);
    goto LABEL_26;
  }
  if ((Class)objc_opt_class() == a5 || (Class)objc_opt_class() == a5)
  {
    if (![(id)objc_opt_class() isNoteEntity])
    {
      uint64_t v20 = [(id)objc_opt_class() entityMetadata];
      v21 = [v20 transferableContentTypes];
      v22 = [v21 exportableTypes];
      v12 = objc_msgSend(v22, "if_firstObjectPassingTest:", &__block_literal_global_339);

      if (v12)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        id v36 = v8;
        v23 = objc_msgSend(v12, "wf_fileType", v35, 3221225472, __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke_2, &unk_1E6557448);
        [(WFLinkEntityContentItem *)self generateFileRepresentation:&v35 options:v9 forType:v23];
      }
      else
      {
        (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
      }
      goto LABEL_27;
    }
    v11 = [v10 properties];
    v12 = objc_msgSend(v11, "if_firstObjectWithValue:forKey:", @"contents", @"identifier");

    id v13 = [v12 value];
    int v14 = [v13 value];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v19 = v15;

    id v24 = [(WFLinkEntityContentItem *)self name];
    v25 = v24;
    if (v19 && v24)
    {
      v26 = [v24 stringByAppendingString:@"\n"];
      if ((Class)objc_opt_class() == a5)
      {
        v33 = [v19 string];
        id v34 = [v26 stringByAppendingString:v33];

        (*((void (**)(id, void *, void *, void))v8 + 2))(v8, v34, v25, 0);
      }
      else if ((Class)objc_opt_class() == a5)
      {
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v26];
        uint64_t v38 = 0;
        id v39 = &v38;
        uint64_t v40 = 0x2050000000;
        v28 = (void *)getICTextStyleClass_softClass;
        uint64_t v41 = getICTextStyleClass_softClass;
        if (!getICTextStyleClass_softClass)
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __getICTextStyleClass_block_invoke;
          v37[3] = &unk_1E6558B78;
          v37[4] = &v38;
          __getICTextStyleClass_block_invoke((uint64_t)v37);
          v28 = (void *)v39[3];
        }
        id v29 = v28;
        _Block_object_dispose(&v38, 8);
        v30 = [v29 titleStyle];
        v31 = [v30 attributes];
        objc_msgSend(v27, "setAttributes:range:", v31, 0, objc_msgSend(v27, "length"));

        [v27 appendAttributedString:v19];
        v32 = (void *)[v27 copy];
        (*((void (**)(id, void *, void *, void))v8 + 2))(v8, v32, v25, 0);
      }
    }
    else
    {
      (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    }

LABEL_26:
LABEL_27:

    goto LABEL_28;
  }
  (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
LABEL_28:
}

void __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = NSString;
  v4 = [a2 data];
  objc_msgSend(v3, "wf_stringWithData:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__WFLinkEntityContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F442D8];
  v3 = [a2 contentType];
  v4 = [v2 typeWithIdentifier:v3];

  uint64_t v5 = [v4 conformsToType:*MEMORY[0x1E4F44470]];
  return v5;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a3;
  v6 = [(WFLinkEntityContentItem *)self displayRepresentation];
  id v7 = [v6 image];
  id v8 = objc_msgSend(v7, "wf_image");

  if (v5 && v8) {
    v5[2](v5, v8, 0);
  }

  return v8 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(WFLinkEntityContentItem *)self displayRepresentation];
  v6 = [v5 subtitle];
  id v7 = objc_msgSend(v6, "wf_localizedString");

  if (v4 && v7) {
    v4[2](v4, v7);
  }

  return v7 != 0;
}

- (id)name
{
  v3 = [(WFLinkEntityContentItem *)self objectForClass:objc_opt_class()];
  v4 = [v3 wfName];

  if (v4)
  {
    uint64_t v5 = [v3 wfName];
  }
  else
  {
    v6 = [(WFLinkEntityContentItem *)self displayRepresentation];
    id v7 = [v6 title];
    id v8 = objc_msgSend(v7, "wf_localizedString");
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(id)objc_opt_class() localizedTypeDescription];
    }
    uint64_t v5 = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFLinkEntityContentItem *)self entity];
  [v4 encodeObject:v5 forKey:@"entity"];

  v6 = [(id)objc_opt_class() entityMetadata];
  [v4 encodeObject:v6 forKey:@"entityMetadata"];

  id v7 = [(id)objc_opt_class() queryMetadata];
  [v4 encodeObject:v7 forKey:@"queryMetadata"];

  id v8 = [(id)objc_opt_class() appBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"appBundleIdentifier"];

  id v9 = [(id)objc_opt_class() appBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"entityNamespace"];

  id v10 = [(WFLinkEntityContentItem *)self displayRepresentation];
  [v4 encodeObject:v10 forKey:@"displayRepresentation"];
}

- (WFLinkEntityContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFLinkEntityContentItem;
  uint64_t v5 = [(WFLinkEntityContentItem *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityMetadata"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryMetadata"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
    if (!v8)
    {
      id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityNamespace"];
    }
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayedAppBundleIdentifier"];
    id v10 = objc_msgSend(v6, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v7, v8, v9);
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];
    id v13 = [v10 itemWithObject:v11];
    [(WFLinkEntityContentItem *)v13 setDisplayRepresentation:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (void)copyStateToItem:(id)a3
{
}

- (LNEntity)entity
{
  uint64_t v3 = objc_opt_class();
  return (LNEntity *)[(WFLinkEntityContentItem *)self objectForClass:v3];
}

+ (id)outputTypes
{
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___WFLinkEntityContentItem;
  uint64_t v3 = objc_msgSendSuper2(&v26, sel_outputTypes);
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  [v4 addObject:v5];

  if ([a1 isNoteEntity])
  {
    v6 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
    [v4 insertObject:v6 atIndex:0];
  }
  id v7 = [a1 entityMetadata];
  id v8 = [v7 transferableContentTypes];
  id v9 = [v8 exportableTypes];
  uint64_t v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_359);
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    id v13 = (void *)v10;
  }
  else {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  [v4 addObjectsFromArray:v14];
  objc_super v15 = [a1 entityMetadata];
  id v16 = [v15 systemProtocolMetadata];
  v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F72928]];

  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v18 = v17;
    }
    else {
      __int16 v18 = 0;
    }
  }
  else
  {
    __int16 v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = [v19 supportedContentTypes];

  uint64_t v21 = objc_msgSend(v20, "if_map:", &__block_literal_global_362);
  v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = v12;
  }
  id v24 = v23;

  [v4 addObjectsFromArray:v24];
  return v4;
}

uint64_t __38__WFLinkEntityContentItem_outputTypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB4718] typeWithUTType:a2];
}

uint64_t __38__WFLinkEntityContentItem_outputTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_fileType");
}

+ (id)workflowCoercionHandler
{
  return (id)[MEMORY[0x1E4F5A7D0] block:&__block_literal_global_327];
}

id __50__WFLinkEntityContentItem_workflowCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([(id)objc_opt_class() isWorkflowEntity])
  {
    uint64_t v3 = [v2 entity];
    id v4 = [v3 identifier];
    uint64_t v5 = [v4 instanceIdentifier];

    v6 = +[WFDatabaseProxy defaultDatabase];
    id v7 = [v6 referenceForWorkflowID:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)eventCoercionHandler
{
  return (id)[MEMORY[0x1E4F5A7D0] block:&__block_literal_global_325];
}

id __47__WFLinkEntityContentItem_eventCoercionHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([(id)objc_opt_class() isCalendarEntity])
  {
    uint64_t v3 = [v2 entity];
    id v4 = [v3 identifier];
    uint64_t v5 = [v4 instanceIdentifier];

    v6 = WFGetWorkflowEventStore();
    id v7 = [v6 eventWithIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)coercions
{
  uint64_t v3 = objc_opt_new();
  if ([a1 isCalendarEntity])
  {
    id v4 = (void *)MEMORY[0x1E4F5A7C8];
    uint64_t v5 = [MEMORY[0x1E4F5A9A8] typeWithClassName:@"EKEvent" frameworkName:@"EventKit" location:0];
    v6 = [a1 eventCoercionHandler];
    id v7 = [v4 coercionToType:v5 handler:v6];
    [v3 addObject:v7];
  }
  if ([a1 isWorkflowEntity])
  {
    id v8 = (void *)MEMORY[0x1E4F5A7C8];
    id v9 = [MEMORY[0x1E4F5A9A8] typeWithClassName:@"WFWorkflowReference" frameworkName:@"WorkflowKit" location:1];
    uint64_t v10 = [a1 workflowCoercionHandler];
    v11 = [v8 coercionToType:v9 handler:v10];
    [v3 addObject:v11];
  }
  v12 = (void *)[v3 copy];

  return v12;
}

+ (BOOL)isWorkflowEntity
{
  uint64_t v3 = [a1 appBundleIdentifier];
  int v4 = VCIsShortcutsAppBundleIdentifier();

  if (v4)
  {
    uint64_t v5 = [a1 entityMetadata];
    v6 = [v5 identifier];
    id v7 = (void *)*MEMORY[0x1E4F5AB98];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
      if (v8 && v9) {
        LOBYTE(v4) = [v8 isEqualToString:v9];
      }
    }
  }
  return v4;
}

+ (BOOL)isCalendarEntity
{
  uint64_t v3 = [a1 appBundleIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4FB4AA8]];

  if (v4)
  {
    uint64_t v5 = [a1 entityMetadata];
    v6 = [v5 identifier];
    id v7 = v6;
    if (v6 == @"EventEntity")
    {
      LOBYTE(v4) = 1;
    }
    else if (v6)
    {
      LOBYTE(v4) = [(__CFString *)v6 isEqualToString:@"EventEntity"];
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasLibrary
{
  uint64_t v3 = [a1 queryMetadata];
  if (v3) {
    char v4 = 1;
  }
  else {
    char v4 = [a1 hasInMemoryFindAction];
  }

  return v4;
}

+ (id)localizedCountDescriptionWithValue:(int64_t)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 entityMetadata];
  v6 = [v5 displayRepresentation];
  id v7 = [v6 numericFormat];

  if (v7)
  {
    id v8 = [NSNumber numberWithInteger:a3];
    v16[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    uint64_t v10 = [v7 localizedStringWithReplacements:v9 forLocaleIdentifier:0];
  }
  else
  {
    v11 = NSString;
    v12 = [NSNumber numberWithInteger:a3];
    id v13 = [a1 localizedPluralTypeDescription];
    id v14 = [v13 localizedLowercaseString];
    uint64_t v10 = [v11 stringWithFormat:@"%@ %@", v12, v14];
  }
  return v10;
}

+ (id)_localizedTypeDescriptionWithContext:(id)a3 pluralizationNumber:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 entityMetadata];
  id v8 = [v7 displayRepresentation];
  id v9 = [v8 name];
  uint64_t v10 = [v9 localizedStringResource];

  if (v10)
  {
    v11 = [NSNumber numberWithInteger:a4];
    v12 = [v6 localize:v10 pluralizationNumber:v11];

    if ([v12 length]) {
      goto LABEL_5;
    }
  }
  id v13 = [a1 entityMetadata];
  v12 = [v13 identifier];

LABEL_5:
  return v12;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  return (id)[a1 _localizedTypeDescriptionWithContext:a3 pluralizationNumber:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  return (id)[a1 _localizedTypeDescriptionWithContext:a3 pluralizationNumber:1];
}

+ (id)allowedOperatorsWithQueryParameterMetadata:(id)a3 objectClass:(Class)a4 operators:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)[a5 copy];
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v9];
    if ([v10 containsObject:&unk_1F2316530])
    {
      [v10 addObject:&unk_1F2316548];
      [v10 addObject:&unk_1F2316560];
      [v10 addObject:&unk_1F2316578];
    }
    uint64_t v11 = [v10 array];

    id v9 = (__CFString *)v11;
  }
  if ([a1 isNotes])
  {
    v12 = [v8 propertyIdentifier];
    id v13 = v12;
    if (v12 == @"creationDate"
      || v12
      && (char v14 = [(__CFString *)v12 isEqualToString:@"creationDate"],
          v13,
          (v14 & 1) != 0)
      || ([v8 propertyIdentifier],
          objc_super v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
          v15 == @"modificationDate"))
    {
    }
    else
    {
      id v16 = v15;
      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      char v17 = [(__CFString *)v15 isEqualToString:@"modificationDate"];

      if ((v17 & 1) == 0) {
        goto LABEL_16;
      }
    }
    [(__CFString *)v9 if_arrayByRemovingObjectsInArray:&unk_1F23173B8];
    id v13 = v9;
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

+ (id)allProperties
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFLinkEntityContentItem;
  uint64_t v3 = objc_msgSendSuper2(&v7, sel_allProperties);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__WFLinkEntityContentItem_allProperties__block_invoke;
  v6[3] = &__block_descriptor_40_e30__24__0__WFContentProperty_8Q16l;
  v6[4] = a1;
  char v4 = objc_msgSend(v3, "if_compactMap:", v6);

  return v4;
}

id __40__WFLinkEntityContentItem_allProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 userInfo];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  objc_super v7 = [v6 objectForKey:@"WFLinkEntityContentPropertyUserInfoPropertyIdentifier"];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  int v10 = [v9 isEqual:*MEMORY[0x1E4F5AB90]];
  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) namePropertyBuilder];
    v12 = [v11 filterable:0];
    id v13 = [v12 sortable:0];
    id v14 = [v13 build];
  }
  else
  {
    objc_super v15 = [v3 displayName];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      id v14 = v3;
    }
    else
    {
      char v17 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = [v3 name];
        int v20 = 136315394;
        uint64_t v21 = "+[WFLinkEntityContentItem allProperties]_block_invoke";
        __int16 v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Ignoring entity property '%@' because it doesn't have a title.", (uint8_t *)&v20, 0x16u);
      }
      id v14 = 0;
    }
  }

  return v14;
}

+ (id)propertyBuildersForFilteringUsingQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 entityMetadata];
  id v6 = [v5 properties];
  objc_super v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke;
  v12[3] = &unk_1E654C7C0;
  id v14 = v4;
  id v15 = a1;
  id v13 = v7;
  id v8 = v4;
  id v9 = v7;
  int v10 = objc_msgSend(v6, "if_compactMap:", v12);

  return v10;
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke(id *a1, void *a2)
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1[4];
  uint64_t v5 = [v3 identifier];
  [v4 setObject:v5 forKey:@"WFLinkEntityContentPropertyUserInfoPropertyIdentifier"];

  id v6 = [v3 valueType];
  uint64_t v7 = objc_msgSend(v6, "wf_objectClass");

  if (v7 == objc_opt_class())
  {
    id v13 = [v3 valueType];
    id v14 = objc_msgSend(v13, "wf_entityValueType");

    id v15 = +[WFLinkActionProvider sharedProvider];
    uint64_t v16 = [(id)objc_opt_class() appBundleIdentifier];
    char v17 = [v14 identifier];
    id v18 = [v15 entityMetadataByAppBundleIdentifier:v16 entityIdentifier:v17];

    id v19 = [a1[6] queryMetadata];
    int v20 = [a1[6] appBundleIdentifier];
    uint64_t v21 = [a1[6] displayedAppBundleIdentifier];
    uint64_t v7 = objc_msgSend(v18, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v19, v20, v21);

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = [v3 valueType];
  int v10 = v9;
  if (v7 == v8)
  {
    id v14 = objc_msgSend(v9, "wf_enumValueType");

    uint64_t v35 = +[WFLinkActionProvider sharedProvider];
    id v36 = [(id)objc_opt_class() appBundleIdentifier];
    id v37 = [v14 enumerationIdentifier];
    id v18 = [v35 enumMetadataByAppBundleIdentifier:v36 enumIdentifier:v37];

    uint64_t v38 = [a1[6] appBundleIdentifier];
    uint64_t v7 = objc_msgSend(v18, "wf_contentItemClassWithAppBundleIdentifier:", v38);

    id v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
    [a1[4] setObject:v19 forKey:@"WFLinkEntityContentPropertyUserInfoEnumMetadata"];
    goto LABEL_20;
  }
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      uint64_t v11 = [v3 valueType];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v18 = v12;

      id v14 = [a1[6] appBundleIdentifier];
      uint64_t v7 = objc_msgSend(v18, "wf_contentItemClassWithAppBundleIdentifier:", v14);
LABEL_21:

      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_12;
    }
  }

  __int16 v22 = [MEMORY[0x1E4F5A858] sharedRegistry];
  v23 = [MEMORY[0x1E4F5A9A8] typeWithClass:v7];
  uint64_t v24 = [v22 contentItemClassForType:v23];

  if (!v24)
  {
    objc_super v26 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v39 = [v3 identifier];
      *(_DWORD *)buf = 136315650;
      v123 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke";
      __int16 v124 = 2112;
      v125 = v39;
      __int16 v126 = 2112;
      uint64_t v127 = v7;
      _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s Not making content property (%@) because objectClass (%@) does not have a content item", buf, 0x20u);
      goto LABEL_45;
    }
LABEL_46:
    v69 = 0;
    goto LABEL_52;
  }
  if (!v7)
  {
LABEL_22:
    objc_super v26 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      id v39 = [v3 identifier];
      uint64_t v40 = [v3 valueType];
      *(_DWORD *)buf = 136315650;
      v123 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke";
      __int16 v124 = 2112;
      v125 = v39;
      __int16 v126 = 2112;
      uint64_t v127 = (uint64_t)v40;
      _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_FAULT, "%s Unable to get object class for entity with property metadata: %@, valueType: %@", buf, 0x20u);

LABEL_45:
      goto LABEL_46;
    }
    goto LABEL_46;
  }
LABEL_12:
  v25 = [v3 valueType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  objc_super v26 = [v3 valueType];
  if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v27 = objc_msgSend(MEMORY[0x1E4FB47F0], "unitTypeFromLinkMeasurementUnitType:", -[NSObject unitType](v26, "unitType"));
  }
  else
  {

    v27 = 0;
    objc_super v26 = 0;
  }
  v28 = [a1[5] parameters];
  id v29 = [v3 identifier];
  uint64_t v30 = objc_msgSend(v28, "if_firstObjectWithValue:forKey:", v29, @"propertyIdentifier");

  v31 = [a1[5] sortingOptions];
  v32 = [v3 identifier];
  uint64_t v33 = objc_msgSend(v31, "if_firstObjectWithValue:forKey:", v32, @"propertyIdentifier");

  v112 = (void *)v30;
  if (v30)
  {
    int v34 = 1;
    if (v33)
    {
LABEL_18:
      unsigned int v105 = 1;
      goto LABEL_26;
    }
  }
  else
  {
    int v34 = [a1[6] hasInMemoryFindAction];
    if (v33) {
      goto LABEL_18;
    }
  }
  unsigned int v105 = [a1[6] hasInMemoryFindAction];
LABEL_26:
  if ([a1[6] isNotes])
  {
    uint64_t v41 = [v3 title];
    id v42 = [v41 key];
  }
  else
  {
    id v42 = [v3 identifier];
  }
  v109 = (void *)v33;
  if (!v42)
  {
    v77 = getWFAppIntentsLogObject();
    v111 = v77;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT))
    {
      v78 = [v3 identifier];
      v79 = [v3 valueType];
      *(_DWORD *)buf = 136315650;
      v123 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke";
      __int16 v124 = 2112;
      v125 = v78;
      __int16 v126 = 2112;
      uint64_t v127 = (uint64_t)v79;
      _os_log_impl(&dword_1C7F0A000, v77, OS_LOG_TYPE_FAULT, "%s Unable to get property name for entity with property metadata: %@, valueType: %@", buf, 0x20u);

      id v42 = 0;
    }
    v69 = 0;
    goto LABEL_51;
  }
  v108 = (void *)v7;
  v97 = v26;
  id v43 = [v3 title];
  id v44 = objc_msgSend(v43, "wf_localizedString");

  v45 = [v3 valueType];
  objc_opt_class();
  v95 = a1;
  unsigned int v103 = v34;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v46 = [v44 length];

  if (!v46)
  {
    v47 = [v3 valueType];
    v45 = objc_msgSend(v47, "wf_enumValueType");

    [v45 enumerationIdentifier];
    v48 = v110 = v44;
    v49 = +[WFLinkActionProvider sharedProvider];
    __int16 v50 = [(id)objc_opt_class() appBundleIdentifier];
    [v49 enumMetadataByAppBundleIdentifier:v50 enumIdentifier:v48];
    uint64_t v52 = v51 = v27;

    v53 = [v52 displayRepresentation];
    v54 = [v53 name];
    uint64_t v55 = objc_msgSend(v54, "wf_localizedString");

    v27 = v51;
    id v44 = v55;
    a1 = v95;
LABEL_33:
  }
  v56 = NSString;
  v57 = WFLocalizedString(@"Not %@");
  uint64_t v58 = objc_msgSend(v56, "stringWithFormat:", v57, v44);

  v59 = (void *)MEMORY[0x1E4F5A880];
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_230;
  v119[3] = &unk_1E654C6D8;
  id v98 = v3;
  id v99 = v3;
  id v60 = a1[6];
  id v120 = v99;
  id v121 = v60;
  v104 = v42;
  v102 = [v59 block:v119 name:v42 class:v108];
  v101 = [v102 multipleValues:isKindOfClass & 1];
  v107 = v27;
  v100 = [v101 measurementUnitType:v27];
  v111 = v44;
  v61 = [v100 displayName:v44];
  v96 = (void *)v58;
  v62 = [v61 negativeName:v58];
  id v63 = a1[6];
  v64 = objc_msgSend(v112, "wf_supportedContentOperators");
  v65 = [v63 allowedOperatorsWithQueryParameterMetadata:v112 objectClass:v108 operators:v64];
  v66 = [v62 allowedOperators:v65];
  v67 = [v66 filterable:v103];
  v68 = [v67 sortable:v105];
  v69 = [v68 userInfo:a1[4]];

  v70 = [v99 valueType];
  uint64_t v71 = objc_msgSend(v70, "wf_objectClass");
  uint64_t v72 = objc_opt_class();

  if (v112 && v71 == v72)
  {
    v116[0] = MEMORY[0x1E4F143A8];
    v116[1] = 3221225472;
    v116[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3;
    v116[3] = &unk_1E654C748;
    id v73 = v99;
    id v74 = v95[6];
    id v117 = v73;
    id v118 = v74;
    uint64_t v75 = [v69 possibleValuesAsynchronousGetter:v116];

    v76 = v117;
    v69 = (void *)v75;
    objc_super v26 = v97;
    id v3 = v98;
  }
  else
  {
    v80 = [v99 valueType];
    objc_opt_class();
    char v81 = objc_opt_isKindOfClass();

    objc_super v26 = v97;
    if ((v81 & 1) == 0)
    {
      id v3 = v98;
      v91 = v108;
      goto LABEL_48;
    }
    v82 = [v99 valueType];
    v83 = objc_msgSend(v82, "wf_enumValueType");

    v76 = [v83 enumerationIdentifier];
    v84 = +[WFLinkActionProvider sharedProvider];
    v85 = [(id)objc_opt_class() appBundleIdentifier];
    v86 = [v84 enumMetadataByAppBundleIdentifier:v85 enumIdentifier:v76];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3_247;
    aBlock[3] = &unk_1E654C798;
    id v114 = v86;
    id v115 = v83;
    id v87 = v83;
    id v88 = v86;
    v89 = _Block_copy(aBlock);
    uint64_t v90 = [v69 possibleValuesGetter:v89];

    v69 = (void *)v90;
    id v3 = v98;
  }
  v91 = v108;

LABEL_48:
  v27 = v107;
  if ([v91 isSubclassOfClass:objc_opt_class()])
  {
    v92 = [v69 comparableUnits:8444];
    uint64_t v93 = [v92 timeUnits:8444];

    v69 = (void *)v93;
  }
  id v42 = v104;

LABEL_51:
LABEL_52:

  return v69;
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_230(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  int v10 = [v9 entity];
  uint64_t v11 = [v10 properties];
  v12 = [*(id *)(a1 + 32) identifier];
  id v13 = objc_msgSend(v11, "if_firstObjectWithValue:forKey:", v12, @"identifier");

  id v14 = [v9 entity];
  id v15 = objc_opt_class();

  uint64_t v16 = [v15 entityMetadata];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2;
  v19[3] = &unk_1E654C6B0;
  uint64_t v17 = *(void *)(a1 + 40);
  id v20 = v7;
  uint64_t v21 = v17;
  id v18 = v7;
  objc_msgSend(v13, "wf_getValueForEntity:entityMetadata:completionHandler:", v14, v16, v19);
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueType];
  uint64_t v5 = objc_msgSend(v4, "wf_entityValueType");

  id v6 = +[WFLinkActionProvider sharedProvider];
  id v7 = [(id)objc_opt_class() appBundleIdentifier];
  uint64_t v8 = [v5 identifier];
  id v9 = [v6 entityMetadataByAppBundleIdentifier:v7 entityIdentifier:v8];

  int v10 = [MEMORY[0x1E4F72BC8] policyWithEntityMetadata:v9];
  id v18 = 0;
  uint64_t v11 = [v10 connectionWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    id v13 = [v10 appEntityMangledTypeName];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_242;
    v15[3] = &unk_1E654C720;
    uint64_t v17 = *(void *)(a1 + 40);
    id v16 = v3;
    [v11 performSuggestedEntitiesQueryWithEntityMangledTypeName:v13 completionHandler:v15];
  }
  else
  {
    id v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "+[WFLinkEntityContentItem propertyBuildersForFilteringUsingQuery:]_block_invoke_3";
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
    }

    (*((void (**)(id, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0]);
  }
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_3_247(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cases];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_4;
  v5[3] = &unk_1E654C770;
  id v6 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "if_map:", v5);

  return v3;
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F72E10];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 identifier];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v4 displayRepresentation];

  id v9 = (void *)[v5 initWithValue:v6 valueType:v7 displayRepresentation:v8];
  return v9;
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_242(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = [v16 value];
  id v4 = [v3 value];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v7 = v6;
  }
  id v8 = v7;

  if (![(id)objc_opt_class() isNotes]) {
    goto LABEL_11;
  }
  id v9 = *(void **)(a1 + 40);
  int v10 = [v16 value];
  uint64_t v11 = [v10 valueType];
  id v12 = objc_msgSend(v11, "wf_entityValueType");
  id v13 = [v12 identifier];
  LODWORD(v9) = [v9 isNoteFolderEntityIdentifier:v13];

  if (v9)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = objc_msgSend(v8, "if_map:", &__block_literal_global);
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
  else
  {
LABEL_11:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2_243(uint64_t a1, void *a2)
{
  return WFNotesFolderIntentsValueFromLinkValue(a2);
}

void __66__WFLinkEntityContentItem_propertyBuildersForFilteringUsingQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = [v23 valueType];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 memberValueType];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  if (v5)
  {
    uint64_t v7 = [v23 value];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v22 = v8;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v22 valueForKeyPath:@"value"];
  }
  else
  {
    id v9 = [v23 valueType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v13 = [v23 valueType];
      uint64_t v14 = [(id)objc_opt_class() appBundleIdentifier];
      id v15 = [(id)objc_opt_class() displayedAppBundleIdentifier];
      id v12 = objc_msgSend(v13, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v23, v14, v15);

      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [v12 items];
      uint64_t v18 = [v17 count];
      id v19 = [v12 items];
      id v20 = v19;
      if (v18 == 1)
      {
        __int16 v21 = [v19 firstObject];
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v21);
      }
      else
      {
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v19);
      }

      goto LABEL_20;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v23 value];
  }
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_20:
}

+ (id)propertyBuilders
{
  id v3 = [a1 queryMetadata];
  id v4 = [a1 propertyBuildersForFilteringUsingQuery:v3];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37__WFLinkEntityContentItem_initialize__block_invoke;
    v3[3] = &__block_descriptor_40_e30__24__0__WFContentProperty_8_16l;
    v3[4] = a1;
    [MEMORY[0x1E4F5A838] registerValueMapping:v3];
  }
}

id __37__WFLinkEntityContentItem_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)[a2 propertyClass];
  if (![v6 isSubclassOfClass:*(void *)(a1 + 32)]) {
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    id v7 = [v5 value];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v19 = v7;
      }
      else {
        id v19 = 0;
      }
    }
    else
    {
      id v19 = 0;
    }
    id v8 = v19;
LABEL_14:

    if (v8)
    {
      if ([v8 isTransient])
      {
        id v20 = v8;
        id v8 = v20;
      }
      else
      {
        id v20 = [v8 identifier];
      }
      id v18 = v20;
      goto LABEL_20;
    }
LABEL_17:
    id v18 = v5;
    goto LABEL_21;
  }
  id v7 = v5;
  id v8 = [v7 entity];
  id v9 = [v6 entityMetadata];
  if (![v6 isNotes]
    || ([v9 identifier],
        int v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v6 isNoteFolderEntityIdentifier:v10],
        v10,
        (v11 & 1) == 0))
  {

    goto LABEL_14;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F72E10]);
  id v13 = objc_alloc(MEMORY[0x1E4F72C58]);
  uint64_t v14 = [v9 identifier];
  id v15 = (void *)[v13 initWithIdentifier:v14];
  uint64_t v16 = [v7 displayRepresentation];
  uint64_t v17 = (void *)[v12 initWithValue:v8 valueType:v15 displayRepresentation:v16];

  WFNotesFolderIntentsValueFromLinkValue(v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
LABEL_21:

  return v18;
}

+ (BOOL)hasInMemoryFindAction
{
  id v3 = NSString;
  id v4 = [a1 appBundleIdentifier];
  id v5 = [a1 entityMetadata];
  id v6 = [v5 identifier];
  id v7 = [v3 stringWithFormat:@"%@.%@", v4, v6];

  id v8 = WFForcedLinkEntityFindActionIdentifiers();
  if ([v8 containsObject:v7])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    int v10 = [a1 queryMetadata];
    BOOL v9 = [v10 capabilities] & 1;
  }
  return v9;
}

+ (NSString)displayedAppBundleIdentifier
{
  return (NSString *)&stru_1F229A4D8;
}

+ (NSString)appBundleIdentifier
{
  return (NSString *)&stru_1F229A4D8;
}

+ (LNQueryMetadata)queryMetadata
{
  return 0;
}

+ (LNEntityMetadata)entityMetadata
{
  return 0;
}

+ (BOOL)isNoteFolderEntityIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3 == @"FolderEntity")
  {
    char v5 = 1;
  }
  else if (v3)
  {
    char v5 = [(__CFString *)v3 isEqualToString:@"FolderEntity"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isNoteEntity
{
  if (![a1 isNotes]) {
    return 0;
  }
  id v3 = [a1 entityMetadata];
  id v4 = [v3 identifier];
  char v5 = v4;
  if (v4 == @"NoteEntity")
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"NoteEntity"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isNotes
{
  id v2 = [a1 appBundleIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4FB4B30]];

  return v3;
}

@end