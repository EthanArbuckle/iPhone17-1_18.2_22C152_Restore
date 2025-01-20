@interface WFWorkflowRecord
+ (BOOL)defaultDeleted;
+ (BOOL)defaultDisabledOnLockScreen;
+ (BOOL)defaultHasOutputFallback;
+ (BOOL)defaultHasShortcutInputVariables;
+ (BOOL)defaultShouldAutoUpdateAssociatedAppBundleIdentifier;
+ (id)defaultAccessResourcePerWorkflowStates;
+ (id)defaultActions;
+ (id)defaultCreationDate;
+ (id)defaultIcon;
+ (id)defaultImportQuestions;
+ (id)defaultInputClasses;
+ (id)defaultLastMigratedClientVersion;
+ (id)defaultLastSavedOnDeviceName;
+ (id)defaultModificationDate;
+ (id)defaultOutputClasses;
+ (id)defaultQuickActionSurfacesForSharing;
+ (id)defaultSmartPromptPerWorkflowStates;
+ (id)defaultWorkflowTypes;
+ (id)workflowSubtitleForActionCount:(unint64_t)a3 savedSubtitle:(id)a4;
+ (int64_t)defaultActionCount;
- (BOOL)addWatchWorkflowTypeIfEligible;
- (BOOL)addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:(id)a3;
- (BOOL)disabledOnLockScreen;
- (BOOL)hasOutputFallback;
- (BOOL)hasShortcutInputVariables;
- (BOOL)hiddenFromLibraryAndSync;
- (BOOL)hiddenInComplication;
- (BOOL)isConflictOfOtherWorkflow;
- (BOOL)isDeleted;
- (BOOL)isEligibleForWatch;
- (BOOL)isEligibleForWatchWithIneligibleActionIdentifiers:(id)a3;
- (BOOL)isEquivalentForSyncTo:(id)a3;
- (BOOL)loadFromPeaceData:(id)a3 keyImageData:(id)a4 error:(id *)a5;
- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4;
- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier;
- (NSArray)actions;
- (NSArray)importQuestions;
- (NSArray)inputClasses;
- (NSArray)outputClasses;
- (NSArray)quickActionSurfacesForSharing;
- (NSArray)workflowTypes;
- (NSData)cloudKitRecordMetadata;
- (NSData)remoteQuarantineHash;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)noInputBehavior;
- (NSSet)accessResourcePerWorkflowStates;
- (NSSet)smartPromptPerWorkflowStates;
- (NSString)actionsDescription;
- (NSString)associatedAppBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)lastMigratedClientVersion;
- (NSString)lastSavedOnDeviceName;
- (NSString)legacyName;
- (NSString)minimumClientVersion;
- (NSString)name;
- (NSString)source;
- (NSString)workflowSubtitle;
- (WFWorkflowIcon)icon;
- (WFWorkflowQuarantine)quarantine;
- (WFWorkflowRecord)initWithPeaceCloudKitRecord:(id)a3 error:(id *)a4;
- (WFWorkflowRecord)initWithPeaceCoreDataModel:(id)a3 error:(id *)a4;
- (id)fileRepresentation;
- (int64_t)actionCount;
- (int64_t)lastSyncedEncryptedSchemaVersion;
- (int64_t)lastSyncedHash;
- (int64_t)remoteQuarantineStatus;
- (int64_t)syncHash;
- (int64_t)wantedEncryptedSchemaVersion;
- (unint64_t)estimatedSize;
- (void)addWatchWorkflowType;
- (void)setAccessResourcePerWorkflowStates:(id)a3;
- (void)setActionCount:(int64_t)a3;
- (void)setActions:(id)a3;
- (void)setActionsDescription:(id)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setCloudKitRecordMetadata:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDisabledOnLockScreen:(BOOL)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasOutputFallback:(BOOL)a3;
- (void)setHasShortcutInputVariables:(BOOL)a3;
- (void)setHiddenFromLibraryAndSync:(BOOL)a3;
- (void)setHiddenInComplication:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setImportQuestions:(id)a3;
- (void)setInputClasses:(id)a3;
- (void)setLastMigratedClientVersion:(id)a3;
- (void)setLastSavedOnDeviceName:(id)a3;
- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3;
- (void)setLastSyncedHash:(int64_t)a3;
- (void)setLegacyName:(id)a3;
- (void)setMinimumClientVersion:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNoInputBehavior:(id)a3;
- (void)setOutputClasses:(id)a3;
- (void)setQuarantine:(id)a3;
- (void)setQuickActionSurfacesForSharing:(id)a3;
- (void)setRemoteQuarantineHash:(id)a3;
- (void)setRemoteQuarantineStatus:(int64_t)a3;
- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3;
- (void)setSmartPromptPerWorkflowStates:(id)a3;
- (void)setSource:(id)a3;
- (void)setSyncHash:(int64_t)a3;
- (void)setWantedEncryptedSchemaVersion:(int64_t)a3;
- (void)setWorkflowSubtitle:(id)a3;
- (void)setWorkflowTypes:(id)a3;
@end

@implementation WFWorkflowRecord

+ (id)workflowSubtitleForActionCount:(unint64_t)a3 savedSubtitle:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 1 && v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[WFWorkflow localizedSubtitleWithActionCount:a3];
  }
  v8 = v7;

  return v8;
}

- (BOOL)loadFromPeaceData:(id)a3 keyImageData:(id)a4 error:(id *)a5
{
  v32[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1C87CA430]();
  v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:1 format:0 error:a5];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  if (v13)
  {
    v31[0] = @"WFLWorkflowActions";
    v31[1] = @"WFLWorkflowActionIdentifier";
    v32[0] = @"WFWorkflowActions";
    v32[1] = @"WFWorkflowActionIdentifier";
    v31[2] = @"WFLWorkflowActionParameters";
    v31[3] = @"com.apple.WorkflowKit.actions.handle-intent";
    v32[2] = @"WFWorkflowActionParameters";
    v32[3] = @"is.workflow.actions.sirikit.donation.handle";
    v31[4] = @"com.apple.WorkflowKit.actions.open-user-activity";
    v32[4] = @"is.workflow.actions.useractivity.open";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:5];
    id v15 = WFMapPropertyListStrings(v13, v14);
    v16 = [v13 objectForKeyedSubscript:@"WFWorkflowActions"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v18 objectMatchingKey:@"WFWorkflowActionIdentifier" value:@"is.workflow.actions.useractivity.open"];

    [v19 setValue:v9 forKey:@"UserActivityImageData"];
    v20 = [v13 objectForKeyedSubscript:@"WFLWorkflowDescription"];
    uint64_t v21 = objc_opt_class();
    v22 = WFEnforceClass(v20, v21);
    [(WFWorkflowRecord *)self setWorkflowSubtitle:v22];

    v23 = [v13 objectForKeyedSubscript:@"WFLWorkflowAssociatedAppBundleIdentifier"];
    uint64_t v24 = objc_opt_class();
    v25 = WFEnforceClass(v23, v24);
    [(WFWorkflowRecord *)self setAssociatedAppBundleIdentifier:v25];

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"name", @"actions", 0);
    v27 = [WFWorkflowFile alloc];
    v28 = [v13 objectForKeyedSubscript:@"WFLWorkflowName"];
    v29 = [(WFWorkflowFile *)v27 initWithDictionary:v13 name:v28];

    [(WFRecord *)self loadFromStorage:v29 properties:v26];
  }

  return v13 != 0;
}

- (WFWorkflowRecord)initWithPeaceCoreDataModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 valueForKey:@"serializedWorkflowData"];
  uint64_t v8 = objc_opt_class();
  id v9 = WFEnforceClass(v7, v8);

  v10 = [v6 valueForKey:@"keyImageData"];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = WFEnforceClass(v10, v11);

  v13 = [v6 valueForKey:@"phrase"];
  uint64_t v14 = objc_opt_class();
  id v15 = WFEnforceClass(v13, v14);

  v16 = [v6 valueForKey:@"dateCreated"];
  uint64_t v17 = objc_opt_class();
  id v18 = WFEnforceClass(v16, v17);

  v19 = [v6 valueForKey:@"dateLastModified"];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = WFEnforceClass(v19, v20);

  v22 = [(WFRecord *)self initWithStorage:0];
  v23 = v22;
  if (v22
    && [(WFWorkflowRecord *)v22 loadFromPeaceData:v9 keyImageData:v12 error:a4])
  {
    uint64_t v24 = [(WFWorkflowRecord *)v23 name];
    [(WFWorkflowRecord *)v23 setWorkflowSubtitle:v24];

    [(WFWorkflowRecord *)v23 setName:v15];
    [(WFWorkflowRecord *)v23 setCreationDate:v18];
    [(WFWorkflowRecord *)v23 setModificationDate:v21];
    v25 = v23;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (WFWorkflowRecord)initWithPeaceCloudKitRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WFRecord *)self initWithStorage:0];
  if (v7)
  {
    uint64_t v8 = [v6 encryptedValuesByKey];
    id v9 = [v8 objectForKeyedSubscript:@"serializedWorkflowData"];

    if (v9)
    {
      v10 = [v6 encryptedValuesByKey];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"keyImageData"];

      if ([(WFWorkflowRecord *)v7 loadFromPeaceData:v9 keyImageData:v11 error:a4])
      {
        uint64_t v12 = [(WFWorkflowRecord *)v7 name];
        [(WFWorkflowRecord *)v7 setWorkflowSubtitle:v12];

        v13 = objc_msgSend(v6, "wf_decryptedStringForKey:", @"phrase");
        [(WFWorkflowRecord *)v7 setName:v13];

        uint64_t v14 = [v6 creationDate];
        [(WFWorkflowRecord *)v7 setCreationDate:v14];

        id v15 = [v6 modificationDate];
        [(WFWorkflowRecord *)v7 setModificationDate:v15];

        v16 = v7;
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_remoteQuarantineHash, 0);
  objc_storeStrong((id *)&self->_smartPromptPerWorkflowStates, 0);
  objc_storeStrong((id *)&self->_accessResourcePerWorkflowStates, 0);
  objc_storeStrong((id *)&self->_lastSavedOnDeviceName, 0);
  objc_storeStrong((id *)&self->_lastMigratedClientVersion, 0);
  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
  objc_storeStrong((id *)&self->_importQuestions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_outputClasses, 0);
  objc_storeStrong((id *)&self->_noInputBehavior, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_quickActionSurfacesForSharing, 0);
  objc_storeStrong((id *)&self->_workflowTypes, 0);
  objc_storeStrong((id *)&self->_quarantine, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsDescription, 0);
  objc_storeStrong((id *)&self->_workflowSubtitle, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_legacyName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSyncHash:(int64_t)a3
{
  self->_syncHash = a3;
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (void)setCloudKitRecordMetadata:(id)a3
{
}

- (NSData)cloudKitRecordMetadata
{
  return self->_cloudKitRecordMetadata;
}

- (BOOL)isConflictOfOtherWorkflow
{
  return self->_conflictOfOtherWorkflow;
}

- (void)setRemoteQuarantineHash:(id)a3
{
}

- (NSData)remoteQuarantineHash
{
  return self->_remoteQuarantineHash;
}

- (void)setRemoteQuarantineStatus:(int64_t)a3
{
  self->_remoteQuarantineStatus = a3;
}

- (int64_t)remoteQuarantineStatus
{
  return self->_remoteQuarantineStatus;
}

- (void)setSmartPromptPerWorkflowStates:(id)a3
{
}

- (NSSet)smartPromptPerWorkflowStates
{
  return self->_smartPromptPerWorkflowStates;
}

- (void)setAccessResourcePerWorkflowStates:(id)a3
{
}

- (NSSet)accessResourcePerWorkflowStates
{
  return self->_accessResourcePerWorkflowStates;
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (void)setWantedEncryptedSchemaVersion:(int64_t)a3
{
  self->_wantedEncryptedSchemaVersion = a3;
}

- (int64_t)wantedEncryptedSchemaVersion
{
  return self->_wantedEncryptedSchemaVersion;
}

- (void)setLastSyncedEncryptedSchemaVersion:(int64_t)a3
{
  self->_lastSyncedEncryptedSchemaVersion = a3;
}

- (int64_t)lastSyncedEncryptedSchemaVersion
{
  return self->_lastSyncedEncryptedSchemaVersion;
}

- (void)setLastSavedOnDeviceName:(id)a3
{
}

- (NSString)lastSavedOnDeviceName
{
  return self->_lastSavedOnDeviceName;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setLastMigratedClientVersion:(id)a3
{
}

- (NSString)lastMigratedClientVersion
{
  return self->_lastMigratedClientVersion;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void)setHiddenFromLibraryAndSync:(BOOL)a3
{
  self->_hiddenFromLibraryAndSync = a3;
}

- (BOOL)hiddenFromLibraryAndSync
{
  return self->_hiddenFromLibraryAndSync;
}

- (void)setHiddenInComplication:(BOOL)a3
{
  self->_hiddenInComplication = a3;
}

- (BOOL)hiddenInComplication
{
  return self->_hiddenInComplication;
}

- (void)setMinimumClientVersion:(id)a3
{
}

- (NSString)minimumClientVersion
{
  return self->_minimumClientVersion;
}

- (void)setImportQuestions:(id)a3
{
}

- (NSArray)importQuestions
{
  return self->_importQuestions;
}

- (void)setActionCount:(int64_t)a3
{
  self->_actionCount = a3;
}

- (int64_t)actionCount
{
  return self->_actionCount;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  self->_disabledOnLockScreen = a3;
}

- (BOOL)disabledOnLockScreen
{
  return self->_disabledOnLockScreen;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  self->_hasOutputFallback = a3;
}

- (BOOL)hasOutputFallback
{
  return self->_hasOutputFallback;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  self->_hasShortcutInputVariables = a3;
}

- (BOOL)hasShortcutInputVariables
{
  return self->_hasShortcutInputVariables;
}

- (void)setOutputClasses:(id)a3
{
}

- (NSArray)outputClasses
{
  return self->_outputClasses;
}

- (void)setNoInputBehavior:(id)a3
{
}

- (NSDictionary)noInputBehavior
{
  return self->_noInputBehavior;
}

- (void)setInputClasses:(id)a3
{
}

- (NSArray)inputClasses
{
  return self->_inputClasses;
}

- (void)setQuickActionSurfacesForSharing:(id)a3
{
}

- (NSArray)quickActionSurfacesForSharing
{
  return self->_quickActionSurfacesForSharing;
}

- (void)setWorkflowTypes:(id)a3
{
}

- (NSArray)workflowTypes
{
  return self->_workflowTypes;
}

- (void)setQuarantine:(id)a3
{
}

- (WFWorkflowQuarantine)quarantine
{
  return self->_quarantine;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3
{
  self->_shouldAutoUpdateAssociatedAppBundleIdentifier = a3;
}

- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier
{
  return self->_shouldAutoUpdateAssociatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setActionsDescription:(id)a3
{
}

- (NSString)actionsDescription
{
  return self->_actionsDescription;
}

- (void)setWorkflowSubtitle:(id)a3
{
}

- (NSString)workflowSubtitle
{
  return self->_workflowSubtitle;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setIcon:(id)a3
{
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (void)setLegacyName:(id)a3
{
}

- (NSString)legacyName
{
  return self->_legacyName;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEquivalentForSyncTo:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowRecord *)self name];
  id v6 = [v4 name];
  uint64_t v101 = [v5 localizedStandardCompare:v6];

  id v7 = [(WFWorkflowRecord *)self icon];
  uint64_t v8 = [v4 icon];
  char v100 = [v7 isEqual:v8];

  id v9 = [(WFWorkflowRecord *)self associatedAppBundleIdentifier];
  v10 = [v4 associatedAppBundleIdentifier];
  id v11 = v9;
  id v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    LOBYTE(v14) = 0;
  }
  else
  {
    LOBYTE(v14) = 1;
    if (v11 && v12) {
      int v14 = [v11 isEqualToString:v12] ^ 1;
    }
  }
  char v99 = v14;

  id v15 = (void *)MEMORY[0x1E4F1CA80];
  v16 = [(WFWorkflowRecord *)self workflowTypes];
  uint64_t v17 = [v15 setWithArray:v16];

  uint64_t v18 = *MEMORY[0x1E4FB4FD0];
  [v17 removeObject:*MEMORY[0x1E4FB4FD0]];
  v19 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v20 = [v4 workflowTypes];
  uint64_t v21 = [v19 setWithArray:v20];

  [v21 removeObject:v18];
  v97 = v21;
  v98 = v17;
  char v96 = [v17 isEqualToSet:v21];
  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v23 = [(WFWorkflowRecord *)self inputClasses];
  uint64_t v24 = [v22 setWithArray:v23];
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v26 = [v4 inputClasses];
  v27 = [v25 setWithArray:v26];
  char v95 = [v24 isEqualToSet:v27];

  v28 = [(WFWorkflowRecord *)self noInputBehavior];
  v29 = [v4 noInputBehavior];
  if (v28 == v29)
  {
    char v94 = 0;
  }
  else
  {
    v30 = [(WFWorkflowRecord *)self noInputBehavior];
    v31 = [v4 noInputBehavior];
    char v32 = [v30 isEqualToDictionary:v31];

    char v94 = v32 ^ 1;
  }

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  v34 = [(WFWorkflowRecord *)self outputClasses];
  v35 = [v33 setWithArray:v34];
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  v37 = [v4 outputClasses];
  v38 = [v36 setWithArray:v37];
  char v93 = [v35 isEqualToSet:v38];

  BOOL v92 = [(WFWorkflowRecord *)self hasShortcutInputVariables];
  char v91 = [v4 hasShortcutInputVariables];
  BOOL v39 = [(WFWorkflowRecord *)self hasOutputFallback];
  char v90 = [v4 hasOutputFallback];
  BOOL v89 = [(WFWorkflowRecord *)self disabledOnLockScreen];
  char v88 = [v4 disabledOnLockScreen];
  v40 = [(WFWorkflowRecord *)self actions];
  v41 = [v4 actions];
  if (v40 == v41)
  {
    char v87 = 0;
  }
  else
  {
    v42 = [(WFWorkflowRecord *)self actions];
    v43 = [v4 actions];
    char v44 = [v42 isEqualToArray:v43];

    char v87 = v44 ^ 1;
  }

  v45 = [(WFWorkflowRecord *)self importQuestions];
  v46 = [v4 importQuestions];
  if (v45 == v46)
  {
    char v86 = 0;
  }
  else
  {
    v47 = [(WFWorkflowRecord *)self importQuestions];
    v48 = [v4 importQuestions];
    char v49 = [v47 isEqualToArray:v48];

    char v86 = v49 ^ 1;
  }

  v50 = [(WFWorkflowRecord *)self quarantine];
  v51 = [v4 quarantine];
  if (v50 == v51)
  {
    char v85 = 0;
  }
  else
  {
    v52 = [(WFWorkflowRecord *)self quarantine];
    v53 = [v4 quarantine];
    char v54 = [v52 isEqual:v53];

    char v85 = v54 ^ 1;
  }

  BOOL v55 = [(WFWorkflowRecord *)self hiddenFromLibraryAndSync];
  char v84 = [v4 hiddenFromLibraryAndSync];
  BOOL v83 = [(WFWorkflowRecord *)self hiddenInComplication];
  char v82 = [v4 hiddenInComplication];
  BOOL v81 = [(WFWorkflowRecord *)self isDeleted];
  char v56 = [v4 isDeleted];
  v57 = [(WFWorkflowRecord *)self accessResourcePerWorkflowStates];
  v58 = [v4 accessResourcePerWorkflowStates];
  if (v57 == v58)
  {
    char v80 = 0;
  }
  else
  {
    v59 = [(WFWorkflowRecord *)self accessResourcePerWorkflowStates];
    v60 = [v4 accessResourcePerWorkflowStates];
    char v61 = [v59 isEqualToSet:v60];

    char v80 = v61 ^ 1;
  }

  v62 = [(WFWorkflowRecord *)self smartPromptPerWorkflowStates];
  v63 = [v4 smartPromptPerWorkflowStates];
  if (v62 == v63)
  {
    char v79 = 0;
  }
  else
  {
    v64 = [(WFWorkflowRecord *)self smartPromptPerWorkflowStates];
    v65 = [v4 smartPromptPerWorkflowStates];
    char v66 = [v64 isEqualToSet:v65];

    char v79 = v66 ^ 1;
  }

  int64_t v67 = [(WFWorkflowRecord *)self remoteQuarantineStatus];
  uint64_t v68 = [v4 remoteQuarantineStatus];
  v69 = [(WFWorkflowRecord *)self source];
  v70 = [v4 source];
  id v71 = v69;
  id v72 = v70;
  v73 = v72;
  if (v71 == v72)
  {
    char v74 = 1;
  }
  else
  {
    char v74 = 0;
    if (v71 && v72) {
      char v74 = [v71 isEqualToString:v72];
    }
  }
  char v75 = v39 ^ v90;

  char v76 = v100 ^ 1;
  if (v101) {
    char v76 = 1;
  }
  BOOL v77 = (v67 == v68) & ~(v76 | v99 | v96 ^ 1 | v95 ^ 1 | v94 | v93 ^ 1 | v92 ^ v91 | v75 | v87 | v86 | v85 | v55 ^ v84 | v83 ^ v82 | v81 ^ v56 | v80 | v79) & ~(v89 ^ v88) & v74;

  return v77;
}

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFWorkflowRecord *)self name];
  int v8 = objc_msgSend(v7, "wf_isEmpty");

  if (v8)
  {
    id v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[WFWorkflowRecord saveChangesToStorage:error:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Could not save workflow record because name was empty", buf, 0xCu);
    }

    v10 = (void *)MEMORY[0x1E4F28C58];
    v35[0] = *MEMORY[0x1E4F28588];
    id v11 = WFLocalizedString(@"Invalid Name");
    v36[0] = v11;
    v35[1] = *MEMORY[0x1E4F28568];
    id v12 = WFLocalizedString(@"Please enter a name for this shortcut.");
    v36[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    *a4 = [v10 errorWithDomain:@"WFWorkflowErrorDomain" code:0 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    int64_t v15 = [(WFWorkflowRecord *)self wantedEncryptedSchemaVersion];
    int64_t v16 = +[WFCloudKitWorkflow latestEncryptedSchemaVersion];
    if (v15 != v16)
    {
      int64_t v17 = v16;
      uint64_t v18 = getWFWalrusLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(WFWorkflowRecord *)self name];
        *(_DWORD *)buf = 136315906;
        v28 = "-[WFWorkflowRecord saveChangesToStorage:error:]";
        __int16 v29 = 2112;
        v30 = v19;
        __int16 v31 = 2048;
        int64_t v32 = v15;
        __int16 v33 = 2048;
        int64_t v34 = v17;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_DEFAULT, "%s Saving %@ to storage, but Walrus version is wrong; fixing <old: %lld, new: %lld>",
          buf,
          0x2Au);
      }
      [(WFWorkflowRecord *)self setWantedEncryptedSchemaVersion:v17];
    }
    uint64_t v20 = [(WFRecord *)self modifiedPropertiesSinceLastSave];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [MEMORY[0x1E4F1C9C8] date];
      [(WFWorkflowRecord *)self setModificationDate:v22];

      v23 = [MEMORY[0x1E4FB46B8] currentDevice];
      uint64_t v24 = [v23 name];
      [(WFWorkflowRecord *)self setLastSavedOnDeviceName:v24];
    }
    v26.receiver = self;
    v26.super_class = (Class)WFWorkflowRecord;
    BOOL v14 = [(WFRecord *)&v26 saveChangesToStorage:v6 error:a4];
  }

  return v14;
}

- (id)fileRepresentation
{
  v3 = [WFWorkflowFile alloc];
  id v4 = objc_opt_new();
  id v5 = [(WFWorkflowRecord *)self name];
  id v6 = [(WFWorkflowFile *)v3 initWithDictionary:v4 name:v5 performMigration:0];

  [(WFRecord *)self writeToStorage:v6 error:0];
  return v6;
}

- (void)setActions:(id)a3
{
  id v4 = a3;
  id v5 = (NSArray *)[v4 copy];
  actions = self->_actions;
  self->_actions = v5;

  [(WFWorkflowRecord *)self willChangeValueForKey:@"actionCount"];
  int64_t v7 = [v4 count];

  self->_actionCount = v7;
  [(WFWorkflowRecord *)self didChangeValueForKey:@"actionCount"];
  [(WFRecord *)self markPropertyModifiedIfNecessary:@"actionCount"];
}

+ (BOOL)defaultShouldAutoUpdateAssociatedAppBundleIdentifier
{
  return 1;
}

+ (BOOL)defaultHasOutputFallback
{
  return 1;
}

+ (id)defaultSmartPromptPerWorkflowStates
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)defaultAccessResourcePerWorkflowStates
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)defaultLastMigratedClientVersion
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  return v3;
}

+ (id)defaultLastSavedOnDeviceName
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  v3 = [v2 name];

  return v3;
}

+ (BOOL)defaultDeleted
{
  return 0;
}

+ (id)defaultImportQuestions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (int64_t)defaultActionCount
{
  return 0;
}

+ (id)defaultActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)defaultDisabledOnLockScreen
{
  return 0;
}

+ (BOOL)defaultHasShortcutInputVariables
{
  return 0;
}

+ (id)defaultOutputClasses
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)defaultInputClasses
{
  v2 = +[WFWorkflow supportedInputClassNames];
  v3 = [v2 array];

  return v3;
}

+ (id)defaultQuickActionSurfacesForSharing
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)defaultWorkflowTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)defaultModificationDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

+ (id)defaultCreationDate
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

+ (id)defaultIcon
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB4A50]);
  return v2;
}

- (BOOL)isEligibleForWatchWithIneligibleActionIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowRecord *)self actions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__WFWorkflowRecord_WatchEligibility__isEligibleForWatchWithIneligibleActionIdentifiers___block_invoke;
  v10[3] = &unk_1E6558A98;
  id v11 = v4;
  id v6 = v4;
  int64_t v7 = objc_msgSend(v5, "if_firstObjectPassingTest:", v10);
  BOOL v8 = v7 == 0;

  return v8;
}

uint64_t __88__WFWorkflowRecord_WatchEligibility__isEligibleForWatchWithIneligibleActionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1C87CA430]();
  id v5 = [v3 objectForKeyedSubscript:@"WFWorkflowActionIdentifier"];
  if (v5) {
    uint64_t v6 = [*(id *)(a1 + 32) containsObject:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isEligibleForWatch
{
  id v3 = +[WFActionRegistry sharedRegistry];
  id v4 = [v3 identifiersOfActionsDisabledOnWatch];

  LOBYTE(self) = [(WFWorkflowRecord *)self isEligibleForWatchWithIneligibleActionIdentifiers:v4];
  return (char)self;
}

- (BOOL)addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[WFWorkflowRecord(WatchEligibility) addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Adding watch workflow type to record %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v6 = [(WFWorkflowRecord *)self workflowTypes];
  char v7 = [v6 containsObject:*MEMORY[0x1E4FB4FC8]];

  if ((v7 & 1) == 0)
  {
    if (![(WFWorkflowRecord *)self isEligibleForWatchWithIneligibleActionIdentifiers:v4])
    {
      BOOL v8 = 0;
      goto LABEL_8;
    }
    [(WFWorkflowRecord *)self addWatchWorkflowType];
  }
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)addWatchWorkflowTypeIfEligible
{
  if ([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled]) {
    return 0;
  }
  id v4 = +[WFActionRegistry sharedRegistry];
  id v5 = [v4 identifiersOfActionsDisabledOnWatch];

  BOOL v6 = [(WFWorkflowRecord *)self addWatchWorkflowTypeIfEligibleWithIneligibleActionIdentifiers:v5];
  return v6;
}

- (void)addWatchWorkflowType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFWorkflowRecord *)self workflowTypes];
  id v4 = [v3 arrayByAddingObject:*MEMORY[0x1E4FB4FC8]];
  [(WFWorkflowRecord *)self setWorkflowTypes:v4];

  id v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    char v7 = "-[WFWorkflowRecord(WatchEligibility) addWatchWorkflowType]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Added watch workflow type to workflow %@", (uint8_t *)&v6, 0x16u);
  }
}

@end