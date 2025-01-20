@interface WFWorkflowContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (WFWorkflowReference)workflowReference;
- (id)actionCount;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)folderName;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)workflowIcon;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
@end

@implementation WFWorkflowContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Shortcuts");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Shortcuts (plural)", @"Shortcuts");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Shortcut (singular)", @"Shortcut");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F5AA98];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v5 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcut"];
  v6 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
  v7 = [MEMORY[0x1E4FB4718] typeWithString:*MEMORY[0x1E4F5ABE0]];
  v8 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v9 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x1E4F5A860];
  id v3 = [a1 propertyForName:@"Name"];
  v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5A880];
  v19 = WFLocalizedContentPropertyNameMarker(@"Folder");
  v18 = [v2 keyPath:@"folderName" name:v19 class:objc_opt_class()];
  v20[0] = v18;
  id v3 = (void *)MEMORY[0x1E4F5A880];
  v17 = WFLocalizedContentPropertyNameMarker(@"Icon");
  v4 = [v3 keyPath:@"workflowIcon" name:v17 class:objc_opt_class()];
  v5 = [v4 filterable:0];
  v20[1] = v5;
  v6 = (void *)MEMORY[0x1E4F5A880];
  v7 = WFLocalizedContentPropertyNameMarker(@"Action Count");
  v8 = [v6 keyPath:@"actionCount" name:v7 class:objc_opt_class()];
  v20[2] = v8;
  v9 = (void *)MEMORY[0x1E4F5A880];
  v10 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  v11 = [v9 keyPath:@"workflowReference.modificationDate" name:v10 class:objc_opt_class()];
  v12 = [v11 userInfo:*MEMORY[0x1E4F5AB40]];
  v13 = [v12 tense:1];
  v14 = [v13 timeUnits:8444];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];

  return v15;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  return (id)[MEMORY[0x1E4F5A828] shortcutsAppAttributionSetWithDisclosureLevel:1];
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    v8 = (void *)MEMORY[0x1E4FB4A58];
    id v9 = a3;
    v10 = [(WFWorkflowContentItem *)self workflowReference];
    v11 = [v10 icon];
    v12 = objc_msgSend(v8, "imageWithIcon:size:", v11, width, height);
    (*((void (**)(id, void *, void))a3 + 2))(v9, v12, 0);
  }
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(WFWorkflowContentItem *)self workflowReference];
    v7 = [v6 subtitle];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  v7 = (void (**)(id, void, id))a3;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  id v26 = 0;
  v10 = [(WFWorkflowContentItem *)self getRepresentationsForType:v9 error:&v26];
  id v11 = v26;
  v12 = [v10 firstObject];
  v13 = [v12 object];

  if (!v13)
  {
    v7[2](v7, 0, v11);
    goto LABEL_15;
  }
  if (![v8 conformsToString:@"com.apple.shortcut"])
  {
    if ([v8 conformsToString:@"com.apple.shortcuts.workflow-file"])
    {
      v15 = [v13 fileRepresentation];
      id v22 = 0;
      id v16 = [v15 writeToDiskWithFormat:100 error:&v22];
      id v17 = v22;

      ((void (**)(id, id, id))v7)[2](v7, v16, v17);
    }
    else
    {
      if (![v8 conformsToString:*MEMORY[0x1E4F5ABE0]])
      {
        v14 = [(id)objc_opt_class() badCoercionErrorForType:v8];
        v7[2](v7, 0, v14);
        goto LABEL_4;
      }
      v18 = [v13 fileRepresentation];
      id v21 = 0;
      v19 = [v18 fileDataWithFormat:100 error:&v21];
      id v16 = v21;

      if (v19)
      {
        v20 = [MEMORY[0x1E4F5A900] fileWithData:v19 ofType:v8 proposedFilename:0];
        ((void (**)(id, void *, id))v7)[2](v7, v20, v16);
      }
      else
      {
        v7[2](v7, 0, v16);
      }
    }
    goto LABEL_15;
  }
  v14 = [(WFShortcutExporter *)[WFP2PSignedShortcutFileExporter alloc] initWithWorkflowRecord:v13];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__WFWorkflowContentItem_generateFileRepresentation_options_forType___block_invoke;
  v23[3] = &unk_1E6556E20;
  v25 = v7;
  id v24 = v13;
  [(WFP2PSignedShortcutFileExporter *)v14 exportWorkflowWithCompletion:v23];

LABEL_4:
LABEL_15:
}

void __68__WFWorkflowContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = (void *)MEMORY[0x1E4F5A900];
    v6 = *(void **)(a1 + 32);
    id v7 = a3;
    id v8 = [v6 name];
    id v9 = [v5 fileWithURL:v12 options:3 ofType:0 proposedFilename:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void (**)(uint64_t, void, id))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    id v26 = (void *)MEMORY[0x1E4F5A9A0];
    v27 = [(WFWorkflowContentItem *)self workflowIcon];
    v28 = [(WFWorkflowContentItem *)self name];
    uint64_t v29 = [v26 object:v27 named:v28];
    goto LABEL_9;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v30 = [(WFWorkflowContentItem *)self workflowReference];
    v31 = +[WFDatabaseProxy defaultDatabase];
    v32 = [v31 workflowRecordForDescriptor:v30 error:a5];

    v25 = [MEMORY[0x1E4F5A9A0] object:v32];

    goto LABEL_14;
  }
  if ((Class)objc_opt_class() == a3)
  {
    v33 = [(WFWorkflowContentItem *)self internalRepresentation];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_13;
    }
    v35 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
    v36 = [(WFWorkflowContentItem *)self getRepresentationsForType:v35 error:0];
    v37 = [v36 firstObject];
    v27 = [v37 object];

    v53 = [WFWorkflowReference alloc];
    v54 = [v27 name];
    v57 = [v27 icon];
    uint64_t v52 = [v57 backgroundColorValue];
    v56 = [v27 icon];
    uint64_t v38 = [v56 glyphCharacter];
    v51 = [v27 associatedAppBundleIdentifier];
    v50 = [v27 workflowSubtitle];
    v39 = [v27 actionsDescription];
    v55 = [v27 actions];
    uint64_t v49 = [v55 count];
    uint64_t v40 = [v27 syncHash];
    v41 = [v27 creationDate];
    v42 = [v27 modificationDate];
    v43 = [v27 remoteQuarantineHash];
    char v44 = [v27 disabledOnLockScreen];
    v45 = [v27 source];
    BYTE1(v48) = v44;
    LOBYTE(v48) = 0;
    LOWORD(v47) = 0;
    v28 = -[WFWorkflowReference initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:](v53, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:", @"soup", v54, v52, v38, v51, v50, v39, v49, v40, v47, v41, v42, 0, 0, v43,
            v48,
            v45,
            0);

    uint64_t v29 = [MEMORY[0x1E4F5A9A0] object:v28];
LABEL_9:
    v25 = (void *)v29;

    goto LABEL_14;
  }
  if ((Class)objc_opt_class() != a3)
  {
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  id v9 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(WFWorkflowContentItem *)self workflowReference];
    id v11 = [v10 identifier];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFWorkflowContentItem generateObjectRepresentationForClass:options:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Creating LNEntity for asset: %@", buf, 0x16u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F72BB0]);
  v13 = (void *)[v12 initWithBundleIdentifier:*MEMORY[0x1E4FB4BB8]];
  id v14 = objc_alloc(MEMORY[0x1E4F72C30]);
  v15 = [(WFWorkflowContentItem *)self workflowReference];
  id v16 = [v15 identifier];
  uint64_t v17 = *MEMORY[0x1E4F5AB98];
  v18 = (void *)[v14 initWithValue:v16 typeName:*MEMORY[0x1E4F5AB98]];

  id v19 = objc_alloc(MEMORY[0x1E4F72D50]);
  v72[0] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
  id v21 = (void *)[v19 initWithIdentifiers:v20 entityType:v17];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v69 = __Block_byref_object_copy__62864;
  v70 = __Block_byref_object_dispose__62865;
  id v71 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__62864;
  v66 = __Block_byref_object_dispose__62865;
  id v67 = 0;
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __76__WFWorkflowContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
  v58[3] = &unk_1E6556DF0;
  v60 = buf;
  v61 = &v62;
  v23 = v22;
  v59 = v23;
  [v13 performQuery:v21 completionHandler:v58];
  dispatch_time_t v24 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v23, v24);
  v25 = [MEMORY[0x1E4F5A9A0] object:*(void *)(*(void *)&buf[8] + 40) named:v63[5]];

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

LABEL_14:
  return v25;
}

void __76__WFWorkflowContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 value];
    id v9 = [v8 value];
    int v25 = 136315650;
    id v26 = "-[WFWorkflowContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    __int16 v27 = 2112;
    v28 = v9;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v25, 0x20u);
  }
  uint64_t v10 = [v5 value];
  id v11 = [v10 value];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 firstObject];

  v15 = [v14 value];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  v20 = [v14 displayRepresentation];
  id v21 = [v20 title];
  uint64_t v22 = objc_msgSend(v21, "wf_localizedString");
  uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)folderName
{
  id v3 = +[WFDatabaseProxy defaultDatabase];
  v4 = [(WFWorkflowContentItem *)self workflowReference];
  id v5 = [v3 folderForWorkflowReference:v4 error:0];

  id v6 = [v5 name];

  return v6;
}

- (id)actionCount
{
  v2 = NSNumber;
  id v3 = [(WFWorkflowContentItem *)self workflowReference];
  v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "actionCount"));

  return v4;
}

- (id)workflowIcon
{
  v2 = (void *)MEMORY[0x1E4FB4A58];
  id v3 = [(WFWorkflowContentItem *)self workflowReference];
  v4 = [v3 icon];
  id v5 = objc_msgSend(v2, "imageWithIcon:size:", v4, 512.0, 512.0);

  return v5;
}

- (WFWorkflowReference)workflowReference
{
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [(WFWorkflowContentItem *)self getRepresentationsForType:v3 error:0];
  id v5 = [v4 firstObject];
  id v6 = [v5 object];

  return (WFWorkflowReference *)v6;
}

@end