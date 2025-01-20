@interface WFCoreDataWorkflow
+ (id)descriptorFetchRequest;
+ (id)fetchRequest;
+ (id)recordPropertyMap;
- (BOOL)isConflictOfOtherWorkflow;
- (NSArray)deserializedActions;
- (NSArray)deserializedImportQuestions;
- (NSArray)deserializedInputClasses;
- (NSArray)deserializedOutputClasses;
- (NSArray)workflowTypes;
- (NSDictionary)deserializedNoInputBehavior;
- (NSSet)accessResourcePerWorkflowStates;
- (NSSet)smartPromptPerWorkflowStates;
- (NSString)subtitle;
- (WFWorkflowIcon)workflowIcon;
- (WFWorkflowQuarantine)workflowQuarantine;
- (id)descriptor;
- (int64_t)computedSyncHash;
- (int64_t)remoteQuarantineStatus;
- (unint64_t)estimatedSize;
- (void)didUpdateProperties:(id)a3;
- (void)setAccessResourcePerWorkflowStates:(id)a3;
- (void)setDeserializedActions:(id)a3;
- (void)setDeserializedImportQuestions:(id)a3;
- (void)setDeserializedInputClasses:(id)a3;
- (void)setDeserializedNoInputBehavior:(id)a3;
- (void)setDeserializedOutputClasses:(id)a3;
- (void)setSmartPromptPerWorkflowStates:(id)a3;
- (void)setWorkflowIcon:(id)a3;
- (void)setWorkflowQuarantine:(id)a3;
- (void)setWorkflowTypes:(id)a3;
@end

@implementation WFCoreDataWorkflow

- (NSArray)deserializedActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(WFCoreDataWorkflow *)self actions];
  v3 = [v2 data];

  if (v3)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v8];
    id v5 = v8;
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v6 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[WFCoreDataWorkflow(RecordStorage) deserializedActions]";
        __int16 v11 = 2114;
        id v12 = v5;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Failed to deserialize actions from plist data: %{public}@", buf, 0x16u);
      }

      v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (id)descriptor
{
  v23 = [WFWorkflowReference alloc];
  v26 = [(WFCoreDataWorkflow *)self workflowID];
  v25 = [(WFCoreDataWorkflow *)self name];
  v28 = [(WFCoreDataWorkflow *)self icon];
  uint64_t v20 = [v28 backgroundColorValue];
  v27 = [(WFCoreDataWorkflow *)self icon];
  unsigned __int16 v19 = [v27 glyphNumber];
  v22 = [(WFCoreDataWorkflow *)self associatedAppBundleIdentifier];
  v21 = [(WFCoreDataWorkflow *)self subtitle];
  v3 = [(WFCoreDataWorkflow *)self actionsDescription];
  uint64_t v18 = [(WFCoreDataWorkflow *)self actionCount];
  uint64_t v17 = [(WFCoreDataWorkflow *)self syncHash];
  char v16 = [(WFCoreDataWorkflow *)self tombstoned];
  char v15 = [(WFCoreDataWorkflow *)self hiddenFromLibraryAndSync];
  v30 = [(WFCoreDataWorkflow *)self creationDate];
  v4 = [(WFCoreDataWorkflow *)self modificationDate];
  v29 = v4;
  if (!v4)
  {
    v29 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v5 = [(WFCoreDataWorkflow *)self lastRunEventDate];
  int64_t v6 = [(WFCoreDataWorkflow *)self remoteQuarantineStatus];
  v7 = [(WFCoreDataWorkflow *)self remoteQuarantineHash];
  char v8 = [(WFCoreDataWorkflow *)self hasShortcutInputVariables];
  char v9 = [(WFCoreDataWorkflow *)self disabledOnLockScreen];
  v10 = [(WFCoreDataWorkflow *)self source];
  __int16 v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[WFCoreDataWorkflow runEventsCount](self, "runEventsCount"));
  BYTE1(v14) = v9;
  LOBYTE(v14) = v8;
  BYTE1(v13) = v15;
  LOBYTE(v13) = v16;
  v24 = -[WFWorkflowReference initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:](v23, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:subtitle:actionsDescription:actionCount:syncHash:isDeleted:hiddenFromLibraryAndSync:creationDate:modificationDate:lastRunDate:remoteQuarantineStatus:remoteQuarantineHash:hasShortcutInputVariables:disabledOnLockScreen:source:runEventsCount:", v26, v25, v20, v19, v22, v21, v3, v18, v17, v13, v30, v29, v5, v6, v7,
          v14,
          v10,
          v11);

  if (!v4) {
  return v24;
  }
}

- (NSString)subtitle
{
  uint64_t v3 = [(WFCoreDataWorkflow *)self actionCount];
  v4 = [(WFCoreDataWorkflow *)self workflowSubtitle];
  id v5 = +[WFWorkflowRecord workflowSubtitleForActionCount:v3 savedSubtitle:v4];

  return (NSString *)v5;
}

- (int64_t)remoteQuarantineStatus
{
  return (int)[(WFCoreDataWorkflow *)self remoteQuarantineStatusValue];
}

+ (id)descriptorFetchRequest
{
  v7[17] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fetchRequest];
  [v2 setReturnsObjectsAsFaults:0];
  v7[0] = @"workflowID";
  v7[1] = @"name";
  v7[2] = @"workflowSubtitle";
  v7[3] = @"actionsDescription";
  v7[4] = @"actionCount";
  v7[5] = @"associatedAppBundleIdentifier";
  v7[6] = @"icon";
  v7[7] = @"tombstoned";
  v7[8] = @"triggerCount";
  v7[9] = @"modificationDate";
  v7[10] = @"lastRunEventDate";
  v7[11] = @"remoteQuarantineStatusValue";
  v7[12] = @"hasShortcutInputVariables";
  v7[13] = @"disabledOnLockScreen";
  v7[14] = @"hiddenFromLibraryAndSync";
  v7[15] = @"wantedEncryptedSchemaVersion";
  v7[16] = @"lastSyncedEncryptedSchemaVersion";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:17];
  [v2 setPropertiesToFetch:v3];

  v6[0] = @"icon";
  v6[1] = @"triggers";
  v6[2] = @"runEvents";
  v6[3] = @"parents";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Shortcut"];
}

- (int64_t)computedSyncHash
{
  context = (void *)MEMORY[0x1C87CA430](self, a2);
  uint64_t v3 = objc_opt_new();
  v4 = [(WFCoreDataWorkflow *)self name];

  if (v4)
  {
    id v5 = [(WFCoreDataWorkflow *)self name];
    id v6 = (id)[v3 combineContentsOfPropertyListObject:v5];
  }
  v7 = [(WFCoreDataWorkflow *)self workflowIcon];
  __int16 v68 = [v7 glyphCharacter];
  id v8 = (id)[v3 combineBytes:&v68 size:2];
  v66 = v7;
  id v9 = (id)objc_msgSend(v3, "combineInteger:", objc_msgSend(v7, "backgroundColorValue"));
  v10 = [(WFCoreDataWorkflow *)self associatedAppBundleIdentifier];

  if (v10)
  {
    __int16 v11 = [(WFCoreDataWorkflow *)self associatedAppBundleIdentifier];
    id v12 = (id)[v3 combineContentsOfPropertyListObject:v11];
  }
  uint64_t v13 = [(WFCoreDataWorkflow *)self workflowTypes];

  if (v13)
  {
    uint64_t v14 = [(WFCoreDataWorkflow *)self workflowTypes];
    char v15 = [v14 sortedArrayUsingSelector:sel_compare_];
    id v16 = (id)[v3 combineContentsOfPropertyListObject:v15];
  }
  uint64_t v17 = [(WFCoreDataWorkflow *)self deserializedInputClasses];
  uint64_t v18 = v17;
  if (v17)
  {
    unsigned __int16 v19 = [v17 sortedArrayUsingSelector:sel_compare_];
    id v20 = (id)[v3 combineContentsOfPropertyListObject:v19];
  }
  v21 = [(WFCoreDataWorkflow *)self deserializedOutputClasses];
  v22 = v21;
  if (v21)
  {
    v23 = [v21 sortedArrayUsingSelector:sel_compare_];
    id v24 = (id)[v3 combineContentsOfPropertyListObject:v23];
  }
  v64 = v22;
  v25 = [(WFCoreDataWorkflow *)self deserializedNoInputBehavior];
  if (v25) {
    id v26 = (id)[v3 combineContentsOfPropertyListObject:v25];
  }
  v27 = [(WFCoreDataWorkflow *)self deserializedActions];
  if (v27) {
    id v28 = (id)[v3 combineContentsOfPropertyListObject:v27];
  }
  v65 = v18;
  v29 = [(WFCoreDataWorkflow *)self deserializedImportQuestions];
  if (v29) {
    id v30 = (id)[v3 combineContentsOfPropertyListObject:v29];
  }
  id v31 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"));
  id v32 = (id)[v3 combineBool:0];
  id v33 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow tombstoned](self, "tombstoned"));
  id v34 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hasShortcutInputVariables](self, "hasShortcutInputVariables"));
  id v35 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow hasOutputFallback](self, "hasOutputFallback"));
  id v36 = (id)objc_msgSend(v3, "combineBool:", -[WFCoreDataWorkflow disabledOnLockScreen](self, "disabledOnLockScreen"));
  v37 = [(WFCoreDataWorkflow *)self quarantine];

  if (v37)
  {
    v38 = [(WFCoreDataWorkflow *)self quarantine];
    v39 = [v38 sourceAppIdentifier];
    id v40 = (id)[v3 combineContentsOfPropertyListObject:v39];

    v41 = [(WFCoreDataWorkflow *)self quarantine];
    v42 = [v41 importDate];
    id v43 = (id)[v3 combineContentsOfPropertyListObject:v42];
  }
  v44 = [(WFCoreDataWorkflow *)self accessResourcePerWorkflowStates];

  if (v44)
  {
    v45 = [(WFCoreDataWorkflow *)self accessResourcePerWorkflowStates];
    v46 = [v45 allObjects];
    v47 = [v46 sortedArrayUsingSelector:sel_compare_];
    v48 = [v47 valueForKey:@"dictionaryRepresentation"];
    id v49 = (id)[v3 combineContentsOfPropertyListObject:v48];
  }
  v50 = [(WFCoreDataWorkflow *)self smartPromptPerWorkflowStates];

  if (v50)
  {
    v51 = [(WFCoreDataWorkflow *)self smartPromptPerWorkflowStates];
    v52 = [v51 allObjects];
    v53 = objc_msgSend(v52, "if_map:", &__block_literal_global_14503);

    v54 = objc_msgSend(v53, "if_map:", &__block_literal_global_312);
    v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53];
    v56 = [v55 keysSortedByValueUsingSelector:&selRef_attributionWithAppBundleIdentifier_];
    id v57 = (id)[v3 combineContentsOfPropertyListObject:v56];
  }
  id v58 = (id)objc_msgSend(v3, "combineInteger:", -[WFCoreDataWorkflow remoteQuarantineStatus](self, "remoteQuarantineStatus"));
  id v59 = [(WFCoreDataWorkflow *)self source];
  if (([v59 isEqualToString:@"ShortcutSourceUnknown"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceOnDevice"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceGallery"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceAddToSiri"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceCloudLink"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceDefaultShortcut"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceSiriTopLevelShortcut"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceAutomatorMigration"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceFilePublic"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceFileKnownContacts"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceFilePersonal"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceEditorDocumentMenu"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceAppShortcut"] & 1) != 0
    || ([v59 isEqualToString:@"ShortcutSourceActiveStarterShortcut"] & 1) == 0)
  {
  }
  else
  {

    id v59 = [(WFCoreDataWorkflow *)self source];
    id v60 = (id)[v3 combine:v59];
  }

  if ([(WFCoreDataWorkflow *)self wantedEncryptedSchemaVersion] >= 1) {
    id v61 = (id)objc_msgSend(v3, "combineInteger:", -[WFCoreDataWorkflow wantedEncryptedSchemaVersion](self, "wantedEncryptedSchemaVersion"));
  }
  int64_t v62 = [v3 finalize];

  return v62;
}

id __53__WFCoreDataWorkflow_RecordStorage__computedSyncHash__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)[v3 combineContentsOfPropertyListObject:v2];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "finalize"));

  return v5;
}

id __53__WFCoreDataWorkflow_RecordStorage__computedSyncHash__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 data];
  uint64_t v3 = +[WFSmartPromptState stateFromDatabaseData:v2];
  id v4 = [v3 wfSerializedRepresentation];

  return v4;
}

- (unint64_t)estimatedSize
{
  return 0;
}

- (BOOL)isConflictOfOtherWorkflow
{
  id v2 = [(WFCoreDataWorkflow *)self conflictOf];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setSmartPromptPerWorkflowStates:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__WFCoreDataWorkflow_RecordStorage__setSmartPromptPerWorkflowStates___block_invoke;
  v5[3] = &unk_1E654F2C0;
  v5[4] = self;
  id v4 = objc_msgSend(a3, "if_map:", v5);
  [(WFCoreDataWorkflow *)self setSmartPromptPermissions:v4];
}

WFCoreDataSmartPromptPermission *__69__WFCoreDataWorkflow_RecordStorage__setSmartPromptPerWorkflowStates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFCoreDataSmartPromptPermission alloc];
  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = [(WFCoreDataSmartPromptPermission *)v4 initWithContext:v5];

  v7 = [v3 actionUUID];
  [(WFCoreDataSmartPromptPermission *)v6 setActionUUID:v7];

  id v8 = [v3 data];

  [(WFCoreDataSmartPromptPermission *)v6 setData:v8];
  return v6;
}

- (NSSet)smartPromptPerWorkflowStates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(WFCoreDataWorkflow *)self smartPromptPermissions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 data];
        uint64_t v11 = [v10 length];

        if (v11)
        {
          id v12 = [WFSerializedSmartPromptPerWorkflowState alloc];
          uint64_t v13 = [v9 data];
          uint64_t v14 = [v9 actionUUID];
          char v15 = [(WFSerializedSmartPromptPerWorkflowState *)v12 initWithData:v13 actionUUID:v14];
          [v3 addObject:v15];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setAccessResourcePerWorkflowStates:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__WFCoreDataWorkflow_RecordStorage__setAccessResourcePerWorkflowStates___block_invoke;
  v5[3] = &unk_1E654F298;
  v5[4] = self;
  id v4 = objc_msgSend(a3, "if_map:", v5);
  [(WFCoreDataWorkflow *)self setAccessResourcePermissions:v4];
}

WFCoreDataAccessResourcePermission *__72__WFCoreDataWorkflow_RecordStorage__setAccessResourcePerWorkflowStates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFCoreDataAccessResourcePermission alloc];
  uint64_t v5 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v6 = [(WFCoreDataAccessResourcePermission *)v4 initWithContext:v5];

  uint64_t v7 = [v3 identifier];
  [(WFCoreDataAccessResourcePermission *)v6 setIdentifier:v7];

  id v8 = [v3 data];

  [(WFCoreDataAccessResourcePermission *)v6 setData:v8];
  return v6;
}

- (NSSet)accessResourcePerWorkflowStates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(WFCoreDataWorkflow *)self accessResourcePermissions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [WFSerializedAccessResourcePerWorkflowState alloc];
        uint64_t v11 = [v9 identifier];
        id v12 = [v9 data];
        uint64_t v13 = [(WFSerializedAccessResourcePerWorkflowState *)v10 initWithIdentifier:v11 data:v12];
        [v3 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setDeserializedImportQuestions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = self;
    uint64_t v7 = v4;
  }
  else
  {
    id v8 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedImportQuestions:]";
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize import questions into plist data: %{public}@", buf, 0x16u);
    }

    uint64_t v6 = self;
    uint64_t v7 = 0;
  }
  [(WFCoreDataWorkflow *)v6 setImportQuestionsData:v7];
}

- (NSArray)deserializedImportQuestions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFCoreDataWorkflow *)self importQuestionsData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(WFCoreDataWorkflow *)self importQuestionsData];
    id v10 = 0;
    uint64_t v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v8 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedImportQuestions]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize import questions from plist data: %{public}@", buf, 0x16u);
      }

      uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedOutputClasses:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = self;
    id v7 = v4;
  }
  else
  {
    id v8 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedOutputClasses:]";
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize output classes into plist data: %{public}@", buf, 0x16u);
    }

    uint64_t v6 = self;
    id v7 = 0;
  }
  [(WFCoreDataWorkflow *)v6 setOutputClassesData:v7];
}

- (NSArray)deserializedOutputClasses
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFCoreDataWorkflow *)self outputClassesData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(WFCoreDataWorkflow *)self outputClassesData];
    id v10 = 0;
    uint64_t v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v8 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedOutputClasses]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize output classes from plist data: %{public}@", buf, 0x16u);
      }

      uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedNoInputBehavior:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    id v6 = 0;
    goto LABEL_7;
  }
  id v8 = 0;
  id v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v8];
  id v6 = v8;
  if (v5)
  {
LABEL_7:
    [(WFCoreDataWorkflow *)self setNoInputBehaviorData:v5];

    goto LABEL_8;
  }
  id v7 = getWFDatabaseLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedNoInputBehavior:]";
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Failed to serialize no input behavior into plist data: %{public}@", buf, 0x16u);
  }

  [(WFCoreDataWorkflow *)self setNoInputBehaviorData:0];
LABEL_8:
}

- (NSDictionary)deserializedNoInputBehavior
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFCoreDataWorkflow *)self noInputBehaviorData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(WFCoreDataWorkflow *)self noInputBehaviorData];
    id v9 = 0;
    id v3 = [v4 propertyListWithData:v5 options:0 format:0 error:&v9];
    id v6 = v9;

    if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v7 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v11 = "-[WFCoreDataWorkflow(RecordStorage) deserializedNoInputBehavior]";
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Failed to deserialize no input behavior from plist data: %{public}@", buf, 0x16u);
      }

      id v3 = 0;
    }
  }
  return (NSDictionary *)v3;
}

- (void)setDeserializedInputClasses:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = self;
    id v7 = v4;
  }
  else
  {
    id v8 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v11 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedInputClasses:]";
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to serialize input classes into plist data: %{public}@", buf, 0x16u);
    }

    id v6 = self;
    id v7 = 0;
  }
  [(WFCoreDataWorkflow *)v6 setInputClassesData:v7];
}

- (NSArray)deserializedInputClasses
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFCoreDataWorkflow *)self inputClassesData];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    id v5 = [(WFCoreDataWorkflow *)self inputClassesData];
    id v10 = 0;
    id v6 = [v4 propertyListWithData:v5 options:0 format:0 error:&v10];
    id v7 = v10;

    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v8 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v12 = "-[WFCoreDataWorkflow(RecordStorage) deserializedInputClasses]";
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to deserialize input classes from plist data: %{public}@", buf, 0x16u);
      }

      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v6;
}

- (void)setDeserializedActions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v10];
  id v5 = v10;
  if (v4)
  {
    id v6 = [(WFCoreDataWorkflow *)self actions];
    id v7 = v6;
    id v8 = v4;
  }
  else
  {
    id v9 = getWFDatabaseLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "-[WFCoreDataWorkflow(RecordStorage) setDeserializedActions:]";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Failed to serialize actions into plist data: %{public}@", buf, 0x16u);
    }

    id v6 = [(WFCoreDataWorkflow *)self actions];
    id v7 = v6;
    id v8 = 0;
  }
  [v6 setData:v8];
}

- (void)setWorkflowTypes:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[WFCoreDataWorkflow setHiddenFromWidget:](self, "setHiddenFromWidget:", [v4 containsObject:@"NCWidget"] ^ 1);
  -[WFCoreDataWorkflow setReceivesOnScreenContent:](self, "setReceivesOnScreenContent:", [v4 containsObject:*MEMORY[0x1E4FB4FB0]]);
  id v49 = v4;
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    id v5 = [(WFCoreDataWorkflow *)self managedObjectContext];
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

    id v8 = [v7 database];

    id v9 = [(WFCoreDataWorkflow *)self workflowTypes];
    id v10 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    __int16 v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    [v10 minusSet:v11];

    __int16 v12 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
    __int16 v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    [v12 minusSet:v13];

    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke;
    v65[3] = &unk_1E654F270;
    id v14 = v8;
    id v66 = v14;
    v67 = self;
    [v10 enumerateObjectsUsingBlock:v65];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke_294;
    v62[3] = &unk_1E654F270;
    id v63 = v14;
    v64 = self;
    id v15 = v14;
    [v12 enumerateObjectsUsingBlock:v62];
  }
  long long v16 = (void *)MEMORY[0x1E4F1CAD0];
  long long v17 = [(WFCoreDataWorkflow *)self workflowTypes];
  uint64_t v18 = [v16 setWithArray:v17];

  long long v19 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  uint64_t v20 = [(WFCoreDataWorkflow *)self parents];
  v21 = (void *)[v20 mutableCopy];
  uint64_t v22 = v21;
  v48 = (void *)v18;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_opt_new();
  }
  id v24 = v23;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v25 = [(WFCoreDataWorkflow *)self parents];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v59 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v31 = objc_msgSend(v30, "identifier", v48);
        id v32 = WFWorkflowTypeForCollectionIdentifier(v31);

        if (v32 && ([v19 containsObject:v32] & 1) == 0) {
          [v24 removeObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v27);
  }

  [(WFCoreDataWorkflow *)self setParents:v24];
  id v33 = v48;
  [v19 minusSet:v48];
  id v34 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v35 = v19;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v69 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = WFWorkflowCollectionIdentifierForWorkflowType(*(void **)(*((void *)&v54 + 1) + 8 * j));
        if (v40) {
          [v34 addObject:v40];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v69 count:16];
    }
    while (v37);
  }

  v41 = [(WFCoreDataWorkflow *)self managedObjectContext];
  v42 = WFCoreDataCollectionsWithIdentifiers(v34, 1, v41);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v43 = v42;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(v43);
        }
        objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * k), "insertObject:inShortcutsAtIndex:", self, 0, v48);
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v50 objects:v68 count:16];
    }
    while (v45);
  }
}

void __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = WFWorkflowCollectionIdentifierForWorkflowType(a2);
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[15];
  }
  id v5 = v4;
  id v6 = [*(id *)(a1 + 40) identifier];
  id v13 = 0;
  [v5 insertShortcutWithIdentifier:v6 atIndex:0 toCollection:v3 error:&v13];
  id v7 = v13;

  if (v7)
  {
    id v8 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[WFCoreDataWorkflow(RecordStorage) setWorkflowTypes:]_block_invoke";
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to add workflow to a collection. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v10 = (void *)v9[15];
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    [v9 saveLibraryToDatabase:v11];

    __int16 v12 = *(void **)(a1 + 32);
    id v8 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v3 objectType:2];
    [v12 addPendingUpdatedDescriptor:v8];
  }
}

void __54__WFCoreDataWorkflow_RecordStorage__setWorkflowTypes___block_invoke_294(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = WFWorkflowCollectionIdentifierForWorkflowType(a2);
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[15];
  }
  id v5 = v4;
  id v6 = [*(id *)(a1 + 40) identifier];
  id v13 = 0;
  [v5 removeShortcutWithIdentifier:v6 fromCollectionWithIdentifier:v3 error:&v13];
  id v7 = v13;

  if (v7)
  {
    id v8 = getWFCoherenceLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "-[WFCoreDataWorkflow(RecordStorage) setWorkflowTypes:]_block_invoke";
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to remove workflow from a collection. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    if (v9) {
      id v10 = (void *)v9[15];
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    [v9 saveLibraryToDatabase:v11];

    __int16 v12 = *(void **)(a1 + 32);
    id v8 = [objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v3 objectType:2];
    [v12 addPendingUpdatedDescriptor:v8];
  }
}

- (NSArray)workflowTypes
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled])
  {
    id v4 = [(WFCoreDataWorkflow *)self managedObjectContext];
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
    id v13 = v5;

    id v6 = [v13 database];

    if (v6) {
      id v14 = (void *)v6[15];
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
    __int16 v16 = [(WFCoreDataWorkflow *)self identifier];
    id v35 = 0;
    id v17 = [v15 collectionAndFolderIdentifiersContainingShortcut:v16 error:&v35];
    id v18 = v35;

    if (v18)
    {
      long long v19 = getWFCoherenceLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFCoreDataWorkflow(RecordStorage) workflowTypes]";
        __int16 v40 = 2114;
        id v41 = v18;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to get collection and folder identifiers: %{public}@", buf, 0x16u);
      }
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v20 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = WFWorkflowTypeForCollectionIdentifier(*(void **)(*((void *)&v31 + 1) + 8 * i));
          if (v25) {
            [v3 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v22);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = [(WFCoreDataWorkflow *)self parents];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v27 + 1) + 8 * j) identifier];
          __int16 v12 = WFWorkflowTypeForCollectionIdentifier(v11);

          if (v12) {
            [v3 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v8);
    }
  }

  if (([(WFCoreDataWorkflow *)self hiddenFromWidget] & 1) == 0) {
    [v3 addObject:@"NCWidget"];
  }
  if ([(WFCoreDataWorkflow *)self receivesOnScreenContent]) {
    [v3 addObject:*MEMORY[0x1E4FB4FB0]];
  }
  return (NSArray *)v3;
}

- (void)setWorkflowQuarantine:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = [(WFCoreDataWorkflow *)self quarantine];
    if (v4)
    {
      [(WFCoreDataWorkflow *)self setQuarantine:v4];
    }
    else
    {
      id v5 = (void *)MEMORY[0x1E4F1C0A8];
      id v6 = [(WFCoreDataWorkflow *)self managedObjectContext];
      uint64_t v7 = [v5 insertNewObjectForEntityForName:@"ShortcutQuarantine" inManagedObjectContext:v6];
      [(WFCoreDataWorkflow *)self setQuarantine:v7];
    }
    uint64_t v8 = [v12 sourceAppIdentifier];
    uint64_t v9 = [(WFCoreDataWorkflow *)self quarantine];
    [v9 setSourceAppIdentifier:v8];

    id v10 = [v12 importDate];
    id v11 = [(WFCoreDataWorkflow *)self quarantine];
    [v11 setImportDate:v10];
  }
  else
  {
    [(WFCoreDataWorkflow *)self setQuarantine:0];
  }
}

- (WFWorkflowQuarantine)workflowQuarantine
{
  id v2 = [(WFCoreDataWorkflow *)self quarantine];
  id v3 = [v2 sourceAppIdentifier];
  uint64_t v4 = [v2 importDate];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v2 && v3 && v4) {
    id v6 = [[WFWorkflowQuarantine alloc] initWithSourceAppIdentifier:v3 importDate:v4];
  }

  return v6;
}

- (void)setWorkflowIcon:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(WFCoreDataWorkflow *)self icon];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C0A8];
    uint64_t v8 = [(WFCoreDataWorkflow *)self managedObjectContext];
    id v6 = [v7 insertNewObjectForEntityForName:@"ShortcutIcon" inManagedObjectContext:v8];
  }
  if (v9)
  {
    objc_msgSend(v6, "setBackgroundColorValue:", objc_msgSend(v9, "backgroundColorValue"));
    objc_msgSend(v6, "setGlyphNumber:", objc_msgSend(v9, "glyphCharacter"));
  }
  [(WFCoreDataWorkflow *)self setIcon:v6];
}

- (WFWorkflowIcon)workflowIcon
{
  id v2 = [(WFCoreDataWorkflow *)self icon];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB4A50]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v2, "backgroundColorValue"), (unsigned __int16)objc_msgSend(v2, "glyphNumber"), 0);

  return (WFWorkflowIcon *)v3;
}

- (void)didUpdateProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(WFCoreDataWorkflow *)self syncHash];
    int64_t v6 = [(WFCoreDataWorkflow *)self computedSyncHash];
    uint64_t v7 = getWFDatabaseLogObject();
    uint64_t v8 = v7;
    if (v6 == v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v9 = [(WFCoreDataWorkflow *)self workflowID];
        int v11 = 136315906;
        id v12 = "-[WFCoreDataWorkflow(RecordStorage) didUpdateProperties:]";
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2112;
        uint64_t v16 = (uint64_t)v9;
        __int16 v17 = 2048;
        uint64_t v18 = v5;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Properties %@ changed of workflow %@, but sync hash %lld stayed stable", (uint8_t *)&v11, 0x2Au);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [(WFCoreDataWorkflow *)self workflowID];
        int v11 = 136316162;
        id v12 = "-[WFCoreDataWorkflow(RecordStorage) didUpdateProperties:]";
        __int16 v13 = 2112;
        id v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating syncHash of workflow: %@ from %lld -> %lld. (Because %@ updated)", (uint8_t *)&v11, 0x34u);
      }
      [(WFCoreDataWorkflow *)self setSyncHash:v6];
    }
  }
}

+ (id)recordPropertyMap
{
  v5[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"icon";
  v4[1] = @"quarantine";
  v5[0] = @"workflowIcon";
  v5[1] = @"workflowQuarantine";
  v4[2] = @"deleted";
  v4[3] = @"workflowSubtitle";
  v5[2] = @"tombstoned";
  v5[3] = @"subtitle";
  v4[4] = @"actions";
  v4[5] = @"importQuestions";
  v5[4] = @"deserializedActions";
  void v5[5] = @"deserializedImportQuestions";
  v4[6] = @"inputClasses";
  v4[7] = @"noInputBehavior";
  v5[6] = @"deserializedInputClasses";
  v5[7] = @"deserializedNoInputBehavior";
  v4[8] = @"outputClasses";
  v4[9] = @"wantedEncryptedSchemaVersion";
  v5[8] = @"deserializedOutputClasses";
  v5[9] = @"wantedEncryptedSchemaVersion";
  v4[10] = @"lastSyncedEncryptedSchemaVersion";
  v5[10] = @"lastSyncedEncryptedSchemaVersion";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

@end