@interface ICNASnapshotReporter
+ (id)sharedReporter;
- (BOOL)isPerformingSnapshot;
- (BOOL)killMiniSnapshotBackgroundTaskIfNecessary;
- (BOOL)shouldRunSnapshotManually;
- (BOOL)shouldScheduleSnapshot;
- (BOOL)shouldSnapshot;
- (ICLegacyContext)htmlContext;
- (ICNAHistogramManager)accountHistogramManager;
- (NSManagedObjectContext)modernContext;
- (NSNumber)miniSnapshotBackgroundTaskIdentifier;
- (double)timeStampOfDate:(id)a3;
- (id)accountPurposeForHTMLAccount;
- (id)accountPurposeForModernAccount:(id)a3;
- (id)backgroundAppRefreshData;
- (id)deviceSnapshotSummaryForDataType:(Class)a3;
- (id)drawingSnapshotItemDataForDrawingAttachment:(id)a3;
- (id)lastSnapshotRunningTimeStamp;
- (id)lastSnapshotScheduleTimeStamp;
- (id)snapshotItemDataForHTMLAccount:(id)a3;
- (id)snapshotItemDataForModernAccount:(id)a3;
- (id)sortedFoldersForAccount:(id)a3;
- (id)tableSnapshotItemDataForTableAttachment:(id)a3;
- (id)userSnapshotSummaryForDataType:(Class)a3;
- (int64_t)contextHolderCount;
- (unint64_t)pageCountForDocScanAttachment:(id)a3;
- (void)beginMiniSnapshotBackgroundTask;
- (void)checkIfSnapshotNotFiredForALongTime;
- (void)performBlockForHTMLManagedObjectContext:(id)a3;
- (void)performBlockForModernManagedObjectContext:(id)a3;
- (void)reallyPerformSnapshotWithCompletionHandler:(id)a3;
- (void)scheduleSnapshotIfNecessary;
- (void)setAccountHistogramManager:(id)a3;
- (void)setContextHolderCount:(int64_t)a3;
- (void)setHtmlContext:(id)a3;
- (void)setIsPerformingSnapshot:(BOOL)a3;
- (void)setMiniSnapshotBackgroundTaskIdentifier:(id)a3;
- (void)setModernContext:(id)a3;
- (void)setupContextsIfNecessary;
- (void)snapshotAttachment:(id)a3 reportedDataToNote:(id)a4 reportedDataToAccount:(id)a5;
- (void)snapshotDevice;
- (void)snapshotHTMLAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6;
- (void)snapshotHTMLFolder:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5 noteReportToAccount:(id)a6 reportedDataFromNoteToDevice:(id)a7;
- (void)snapshotHTMLNote:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5;
- (void)snapshotModernAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6;
- (void)snapshotModernFolder:(id)a3 reportedDataToParentFolder:(id)a4 reportedDataToAccount:(id)a5 reportedDataToDevice:(id)a6 reportedDataFromNotesToAccount:(id)a7 reportedDataFromAttachmentToAccount:(id)a8 reportedDataFromNoteToDevice:(id)a9;
- (void)snapshotModernNote:(id)a3 reportedDataToAccount:(id)a4 reportToDevice:(id)a5 reportedDataFromAttachmentToAccount:(id)a6;
- (void)submitMiniSnapshot;
- (void)submitSnapshotScheduleEventWithResult:(int64_t)a3 error:(id)a4 lastScheduledTime:(id)a5;
- (void)tearDownContextsIfNecessary;
@end

@implementation ICNASnapshotReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniSnapshotBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_modernContext, 0);
  objc_storeStrong((id *)&self->_htmlContext, 0);
  objc_storeStrong((id *)&self->_accountHistogramManager, 0);
}

+ (id)sharedReporter
{
  if (s_onceToken != -1) {
    dispatch_once(&s_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedReporter_s_instance;
  return v2;
}

uint64_t __38__ICNASnapshotReporter_sharedReporter__block_invoke()
{
  sharedReporter_s_instance = [(ICNAEventReporter *)[ICNASnapshotReporter alloc] initWithSubTrackerName:@"snapshot_reporter"];
  return MEMORY[0x1F41817F8]();
}

- (void)setupContextsIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(ICNASnapshotReporter *)obj modernContext];

  if (!v2)
  {
    v3 = [MEMORY[0x1E4F83428] sharedContext];
    v4 = [v3 workerManagedObjectContext];
    [(ICNASnapshotReporter *)obj setModernContext:v4];
  }
  v5 = [(ICNASnapshotReporter *)obj htmlContext];

  if (!v5)
  {
    v6 = ICNewLegacyContext();
    [(ICNASnapshotReporter *)obj setHtmlContext:v6];
  }
  [(ICNASnapshotReporter *)obj setContextHolderCount:[(ICNASnapshotReporter *)obj contextHolderCount] + 1];
  objc_sync_exit(obj);
}

- (void)tearDownContextsIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [(ICNASnapshotReporter *)obj contextHolderCount];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }
  [(ICNASnapshotReporter *)obj setContextHolderCount:v3 - 1];
  if (![(ICNASnapshotReporter *)obj contextHolderCount])
  {
    [(ICNASnapshotReporter *)obj setModernContext:0];
    [(ICNASnapshotReporter *)obj setHtmlContext:0];
  }
  objc_sync_exit(obj);
}

- (void)checkIfSnapshotNotFiredForALongTime
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3EAD000, log, OS_LOG_TYPE_ERROR, "Snapshot scheduled at %@ not run. Last snapshot was ran at %@", (uint8_t *)&v3, 0x16u);
}

- (void)scheduleSnapshotIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Did not schedule snapshot", v2, v3, v4, v5, v6);
}

void __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke_cold_1((uint64_t)v5, v7);
    }

    uint64_t v6 = 2;
  }
  [*(id *)(a1 + 32) submitSnapshotScheduleEventWithResult:v6 error:v5 lastScheduledTime:*(void *)(a1 + 40)];
}

- (void)submitSnapshotScheduleEventWithResult:(int64_t)a3 error:(id)a4 lastScheduledTime:(id)a5
{
  id v27 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  v11 = [[ICASResultType alloc] initWithResultType:a3];
  v12 = [[ICASResultData alloc] initWithResultType:v11];
  [v10 addObject:v12];
  if (v27)
  {
    v13 = [ICASSnapshotErrorData alloc];
    v14 = [v27 domain];
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v27, "code"));
    v16 = [(ICASSnapshotErrorData *)v13 initWithErrorDomain:v14 errorCode:v15];

    [v10 addObject:v16];
  }
  v17 = [ICASSnapshotTimeData alloc];
  v18 = NSNumber;
  [v9 timeIntervalSince1970];
  double v20 = v19;

  v21 = [v18 numberWithDouble:v20];
  v22 = [(ICASSnapshotTimeData *)v17 initWithLastTimeOfAttemptedSchedule:v21];

  [v10 addObject:v22];
  v23 = [(ICNASnapshotReporter *)self backgroundAppRefreshData];
  [v10 addObject:v23];
  v24 = +[ICNAController sharedController];
  uint64_t v25 = objc_opt_class();
  v26 = [(ICNAEventReporter *)self subTracker];
  [v24 submitEventOfType:v25 pushThenPopDataObjects:v10 subTracker:v26];
}

- (void)submitMiniSnapshot
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Running mini snapshot", v2, v3, v4, v5, v6);
}

void __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F83278] allAccountsInContext:a2];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint8_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v6 didChooseToMigrate])
        {
          uint64_t v7 = [v6 visibleNotesIncludingTrashCount];
          uint64_t v8 = [v6 visibleCustomFoldersCount];
          uint64_t v9 = [v6 visibleAttachmentsIncludingTrashCount];
          id v10 = +[ICNAIdentityManager sharedManager];
          v11 = [v6 identifier];
          v12 = [v10 saltedID:v11 forClass:objc_opt_class()];

          v13 = [ICASMiniSnapshotAccountItemData alloc];
          v14 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v7)];
          v15 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v8)];
          v16 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v9)];
          v17 = [(ICASMiniSnapshotAccountItemData *)v13 initWithCountofNotes:v14 counfOfFolders:v15 countOfAttachments:v16 privateAccountID:v12];

          [*(id *)(a1 + 32) addObject:v17];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
}

void __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 allAccounts];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v8 isDeleted] & 1) == 0 && (objc_msgSend(v8, "didChooseToMigrate") & 1) == 0)
        {
          uint64_t v9 = [v2 countOfVisibleNotesForAccount:v8];
          id v10 = +[ICNAIdentityManager sharedManager];
          v11 = [v8 accountIdentifier];
          v12 = [v10 saltedID:v11 forClass:objc_opt_class()];

          v13 = [ICASMiniSnapshotAccountItemData alloc];
          v14 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v9)];
          v15 = [(ICASMiniSnapshotAccountItemData *)v13 initWithCountofNotes:v14 counfOfFolders:&unk_1F1F8D638 countOfAttachments:&unk_1F1F8D638 privateAccountID:v12];

          [*(id *)(a1 + 32) addObject:v15];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

uint64_t __42__ICNASnapshotReporter_submitMiniSnapshot__block_invoke_579(uint64_t a1)
{
  return [*(id *)(a1 + 32) killMiniSnapshotBackgroundTaskIfNecessary];
}

- (void)reallyPerformSnapshotWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(ICNASnapshotReporter *)v5 isPerformingSnapshot])
  {
    if (v4) {
      v4[2](v4);
    }
    objc_sync_exit(v5);
  }
  else
  {
    [(ICNASnapshotReporter *)v5 setIsPerformingSnapshot:1];
    objc_sync_exit(v5);

    uint64_t v6 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v7 forKey:@"analytics_last_snapshot_running_timestamp"];

    uint64_t v8 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICNASnapshotReporter reallyPerformSnapshotWithCompletionHandler:]();
    }

    if (objc_opt_respondsToSelector())
    {
      id v9 = (id)[MEMORY[0x1E4F83428] performSelector:sel_beginBackgroundTaskNamed_ withObject:@"Perform Snapshot"];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F29238] value:MEMORY[0x1E4F43740] withObjCType:"Q"];
    }
    id v10 = v9;
    [(ICNASnapshotReporter *)v5 setupContextsIfNecessary];
    [(ICNASnapshotReporter *)v5 snapshotDevice];
    [(ICNASnapshotReporter *)v5 tearDownContextsIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [MEMORY[0x1E4F83428] performSelector:sel_endBackgroundTask_ withObject:v10];
    }
    if (v4) {
      v4[2](v4);
    }
    v11 = v5;
    objc_sync_enter(v11);
    [(ICNASnapshotReporter *)v11 setIsPerformingSnapshot:0];
    objc_sync_exit(v11);
  }
}

- (void)snapshotDevice
{
  v52[1] = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = objc_alloc_init(_ICNAAccountReportToDevice);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = objc_alloc_init(_ICNAFolderReportToDevice);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = objc_alloc_init(ICNANoteReportToDevice);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __38__ICNASnapshotReporter_snapshotDevice__block_invoke;
  v32[3] = &unk_1E64B8C58;
  v32[4] = self;
  v32[5] = &v45;
  v32[6] = &v39;
  v32[7] = &v33;
  [(ICNASnapshotReporter *)self performBlockForModernManagedObjectContext:v32];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __38__ICNASnapshotReporter_snapshotDevice__block_invoke_2;
  v31[3] = &unk_1E64B8C80;
  v31[4] = self;
  v31[5] = &v45;
  v31[6] = &v39;
  v31[7] = &v33;
  [(ICNASnapshotReporter *)self performBlockForHTMLManagedObjectContext:v31];
  uint64_t v3 = [ICASCollabFoldersItemData alloc];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 1)));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 2)));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 1)));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 2)));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 0)));
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 1)));
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v40[5], "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 2)));
  v30 = [(ICASCollabFoldersItemData *)v3 initWithTotalFoldersCollabRootReadOnlyCount:v4 totalFoldersCollabSubfolderReadOnlyCount:v5 totalFoldersCollabRootReadWriteJoinedCount:v6 totalFoldersCollabSubfolderReadWriteJoinedCount:v7 totalFoldersNotCollabCount:v8 totalFoldersCollabRootOwnedCount:v9 totalFoldersCollabSubfolderOwnedCount:v10];

  v29 = [ICASDeviceSnapshotData alloc];
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
  v13 = +[ICNAController saltVersion];
  v14 = [(id)v46[5] accountTypeSummary];
  v52[0] = v30;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend((id)v34[5], "countOfPinnedNotes")));
  long long v17 = [(ICNASnapshotReporter *)self deviceSnapshotSummaryForDataType:objc_opt_class()];
  long long v18 = [(ICNASnapshotReporter *)self userSnapshotSummaryForDataType:objc_opt_class()];
  long long v19 = [(ICASDeviceSnapshotData *)v29 initWithUserStartMonth:v11 userStartYear:v12 saltVersion:v13 accountTypeSummary:v14 collabFoldersSummary:v15 totalCountOfPinnedNotes:v16 deviceSnapshotSummary:v17 userSnapshotSummary:v18];

  long long v20 = +[ICNAController sharedController];
  long long v21 = [(ICNAEventReporter *)self subTracker];
  [v20 enterGroupWithSubtracker:v21];

  uint64_t v22 = +[ICNAController sharedController];
  uint64_t v23 = objc_opt_class();
  v51 = v19;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  uint64_t v25 = [(ICNAEventReporter *)self subTracker];
  [v22 submitEventOfType:v23 pushThenPopDataObjects:v24 subTracker:v25];

  v26 = +[ICNAController sharedController];
  id v27 = [(ICNAEventReporter *)self subTracker];
  [v26 leaveGroupWithSubtracker:v27];

  v28 = +[ICNACoreAnalyticsReporter sharedReporter];
  [v28 fireSnapshotWithNoteReportToDevice:v34[5]];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void __38__ICNASnapshotReporter_snapshotDevice__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F83278] allAccountsInContext:a2];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 didChooseToMigrate]) {
          [*(id *)(a1 + 32) snapshotModernAccount:v8 reportedDataToDevice:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reportedDataFromFolderToDevice:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) reportedDataFromNoteToDevice:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __38__ICNASnapshotReporter_snapshotDevice__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 allAccounts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isDeleted] & 1) == 0 && (objc_msgSend(v8, "didChooseToMigrate") & 1) == 0) {
          [*(id *)(a1 + 32) snapshotHTMLAccount:v8 reportedDataToDevice:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) reportedDataFromFolderToDevice:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) reportedDataFromNoteToDevice:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)snapshotModernAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6
{
  uint64_t v328 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v10;
  if ([v10 isUnsupported])
  {
    [(id)objc_opt_class() faultOutObject:v10];
  }
  else
  {
    id v312 = v13;
    id v313 = v12;
    v176 = v11;
    v15 = objc_alloc_init(ICNAHistogramManager);
    [(ICNASnapshotReporter *)self setAccountHistogramManager:v15];

    uint64_t v16 = [(ICNAEventReporter *)self accountTypeForModernAccount:v10];
    long long v17 = v14;
    long long v18 = self;
    uint64_t v19 = [(ICNASnapshotReporter *)self accountPurposeForModernAccount:v17];
    long long v20 = +[ICNAIdentityManager sharedManager];
    long long v21 = [v17 identifier];
    uint64_t v22 = [v20 saltedID:v21 forClass:objc_opt_class()];

    v173 = (void *)v22;
    v175 = (void *)v16;
    v174 = (void *)v19;
    v308 = [[ICASAccountSnapshotItemData alloc] initWithAccountID:v22 accountType:v16 accountPurpose:v19];
    uint64_t v23 = objc_alloc_init(_ICNANoteReportToAccount);
    v24 = objc_alloc_init(_ICNAFolderReportToAccount);
    uint64_t v25 = objc_alloc_init(_ICNAAttachmentReportToAccount);
    v309 = v17;
    [v17 customRootLevelFolders];
    long long v314 = 0u;
    long long v315 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obj countByEnumeratingWithState:&v314 objects:v327 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v315;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v315 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v314 + 1) + 8 * v29);
          v31 = objc_alloc_init(_ICNAFolderReportToParentFolder);
          [(ICNASnapshotReporter *)v18 snapshotModernFolder:v30 reportedDataToParentFolder:v31 reportedDataToAccount:v24 reportedDataToDevice:v313 reportedDataFromNotesToAccount:v23 reportedDataFromAttachmentToAccount:v25 reportedDataFromNoteToDevice:v312];
          v32 = [(ICNASnapshotReporter *)v18 accountHistogramManager];
          uint64_t v33 = [v32 topLevelFolderTotalNoteCountHistogram];
          objc_msgSend(v33, "reportValue:", (double)-[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v31, "totalNoteCountIncludingSubFolders"));

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [obj countByEnumeratingWithState:&v314 objects:v327 count:16];
      }
      while (v27);
    }
    v34 = [v309 defaultFolder];
    v147 = v18;
    v310 = v24;
    v307 = v25;
    [(ICNASnapshotReporter *)v18 snapshotModernFolder:v34 reportedDataToParentFolder:0 reportedDataToAccount:v24 reportedDataToDevice:v313 reportedDataFromNotesToAccount:v23 reportedDataFromAttachmentToAccount:v25 reportedDataFromNoteToDevice:v312];

    uint64_t v35 = [v309 trashFolder];
    [(ICNASnapshotReporter *)v18 snapshotModernFolder:v35 reportedDataToParentFolder:0 reportedDataToAccount:v24 reportedDataToDevice:v313 reportedDataFromNotesToAccount:v23 reportedDataFromAttachmentToAccount:v25 reportedDataFromNoteToDevice:v312];

    v305 = [ICASAccountNotesTwoFactorItemData alloc];
    v303 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 1)));
    v300 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 2)));
    v297 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 3)));
    v293 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 4)));
    v283 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 5)));
    v279 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 6)));
    v288 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 7)));
    v275 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 0, 8)));
    v271 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 2)));
    v267 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 3)));
    v263 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 4)));
    v260 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 5)));
    v254 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 6)));
    v257 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 7)));
    v248 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 8)));
    v251 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 1, 9)));
    v242 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 3)));
    v245 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 4)));
    v238 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 5)));
    v240 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 6)));
    v232 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 7)));
    v236 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 8)));
    v230 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 2, 9)));
    v234 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 4)));
    v228 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 5)));
    v214 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 6)));
    v226 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 7)));
    v212 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 8)));
    v224 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 3, 9)));
    v210 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 5)));
    v208 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 6)));
    v222 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 7)));
    v220 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 8)));
    v218 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 4, 9)));
    v216 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 6)));
    v206 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 7)));
    v204 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 8)));
    v202 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 5, 9)));
    v36 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 7)));
    v37 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 8)));
    v38 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 6, 9)));
    uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 7, 8)));
    v40 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFactor:andFactor:](v23, "countOfNotesWithFactor:andFactor:", 8, 9)));
    v306 = -[ICASAccountNotesTwoFactorItemData initWithTotalCountOfNotesWithCollabAndDocScan:totalCountOfNotesWithCollabAndInlineDrawingV1:totalCountOfNotesWithCollabAndInlineDrawingV2:totalCountOfNotesWithCollabAndFullscreenDrawing:totalCountOfNotesWithCollabAndTables:totalCountOfNotesWithCollabAndOtherAttachments:totalCountOfNotesWithCollabAndChecklist:totalCountOfNotesWithCollabAndIsPinned:totalCountOfNotesWithDocScanAndInlineDrawingV1:totalCountOfNotesWithDocScanAndInlineDrawingV2:totalCountOfNotesWithDocScanAndFullscreenDrawing:totalCountOfNotesWithDocScanAndTables:totalCountOfNotesWithDocScanAndOtherAttachments:totalCountOfNotesWithDocScanAndChecklist:totalCountOfNotesWithDocScanAndIsPinned:totalCountOfNotesWithDocScanAndIsLocked:totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV1AndTables:totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:totalCountOfNotesWithInlineDrawingV1AndChecklist:totalCountOfNotesWithInlineDrawingV1AndIsPinned:totalCountOfNotesWithInlineDrawingV1AndIsLocked:totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV2AndTables:totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:totalCountOfNotesWithInlineDrawingV2AndChecklist:totalCountOfNotesWithInlineDrawingV2AndIsPinned:totalCountOfNotesWithInlineDrawingV2AndIsLocked:totalCountOfNotesWithFullscreenDrawingAndTables:totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:totalCountOfNotesWithFullscreenDrawingAndChecklist:totalCountOfNotesWithFullscreenDrawingAndIsPinned:totalCountOfNotesWithFullscreenDrawingAndIsLocked:totalCountOfNotesWithTablesAndOtherAttachments:totalCountOfNotesWithTablesAndChecklist:totalCountOfNotesWithTablesAndIsPinned:totalCountOfNotesWithTablesAndIsLocked:totalCountOfNotesWithOtherAttachmentsAndChecklist:totalCountOfNotesWithOtherAttachmentsAndIsPinned:totalCountOfNotesWithOtherAttachmentsAndIsLocked:totalCountOfNotesWithChecklistAndIsPinned:totalCountOfNotesIsPinnedAndIsLocked:](v305, "initWithTotalCountOfNotesWithCollabAndDocScan:totalCountOfNotesWithCollabAndInlineDrawingV1:totalCountOfNotesWithCollabAndInlineDrawingV2:totalCountOfNotesWithCollabAndFullscreenDrawing:totalCountOfNotesWithCollabAndTables:totalCountOfNotesWithCollabAndOtherAttachments:totalCountOfNotesWithCollabAndChecklist:totalCountOfNotesWithCollabAndIsPinned:totalCountOfNotesWithDocScanAndInlineDrawingV1:totalCountOfNotesWithDocScanAndInlineDrawingV2:totalCountOfNotesWithDocScanAndFullscreenDrawing:totalCountOfNotesWithDocScanAndTables:totalCountOfNotesWithDocScanAndOtherAttachments:totalCountOfNotesWithDocScanAndChecklist:totalCountOfNotesWithDocScanAndIsPinned:totalCountOfNotesWithDocScanAndIsLocked:totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV1AndTables:totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:totalCountOfNotesWithInlineDrawingV1AndChecklist:totalCountOfNotesWithInlineDrawingV1AndIsPinned:totalCountOfNotesWithInlineDrawingV1AndIsLocked:totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:totalCountOfNotesWithInlineDrawingV2AndTables:totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:totalCountOfNotesWithInlineDrawingV2AndChecklist:totalCountOfNotesWithInlineDrawingV2AndIsPinned:totalCountOfNotesWithInlineDrawingV2AndIsLocked:totalCountOfNotesWithFullscreenDrawingAndTables:totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:totalCountOfNotesWithFullscreenDrawingAndChecklist:totalCountOfNotesWithFullscreenDrawingAndIsPinned:totalCountOfNotesWithFullscreenDrawingAndIsLocked:totalCountOfNotesWithTablesAndOtherAttachments:totalCountOfNotesWithTablesAndChecklist:totalCountOfNotesWithTablesAndIsPinned:totalCountOfNotesWithTablesAndIsLocked:totalCountOfNotesWithOtherAttachmentsAndChecklist:totalCountOfNotesWithOtherAttachmentsAndIsPinned:totalCountOfNotesWithOtherAttachmentsAndIsL"
             "ocked:totalCountOfNotesWithChecklistAndIsPinned:totalCountOfNotesIsPinnedAndIsLocked:",
             v303,
             v300,
             v297,
             v293,
             v283,
             v279,
             v288,
             v275,
             v271,
             v267,
             v263,
             v260,
             v254,
             v257,
             v248,
             v251,
             v242,
             v245,
             v238,
             v240,
             v232,
             v236,
             v230,
             v234,
             v228,
             v214,
             v226,
             v212,
             v224,
             v210,
             v208,
             v222,
             v220,
             v218,
             v216,
             v206,
             v204,
             v202,
             v36,
             v37,
             v38,
             v39,
             v40);

    uint64_t v41 = [ICASCollabNotesItemData alloc];
    v42 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 2, 1)));
    v43 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 2, 2)));
    v44 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 1, 1)));
    uint64_t v45 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 1, 2)));
    v46 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 0)));
    uint64_t v47 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 1)));
    v48 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollaborationStatus:collaborationType:](v23, "countOfNotesWithCollaborationStatus:collaborationType:", 0, 2)));
    v304 = [(ICASCollabNotesItemData *)v41 initWithTotalNotesCollabRootReadOnlyCount:v42 totalNotesCollabThruFolderReadOnlyCount:v43 totalNotesCollabRootReadWriteJoinedCount:v44 totalNotesCollabThruFolderReadWriteJoinedCount:v45 totalNotesNotCollabCount:v46 totalNotesCollabRootOwnedCount:v47 totalNotesCollabThruFolderOwnedCount:v48];

    v301 = [ICASCollabFoldersItemData alloc];
    v49 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 1)));
    v50 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 2, 2)));
    v51 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 1)));
    v52 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 1, 2)));
    v53 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 0)));
    v54 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 1)));
    v55 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFoldersWithCollaborationStatus:collaborationType:](v310, "countOfFoldersWithCollaborationStatus:collaborationType:", 0, 2)));
    v302 = [(ICASCollabFoldersItemData *)v301 initWithTotalFoldersCollabRootReadOnlyCount:v49 totalFoldersCollabSubfolderReadOnlyCount:v50 totalFoldersCollabRootReadWriteJoinedCount:v51 totalFoldersCollabSubfolderReadWriteJoinedCount:v52 totalFoldersNotCollabCount:v53 totalFoldersCollabRootOwnedCount:v54 totalFoldersCollabSubfolderOwnedCount:v55];

    v298 = [ICASNoteAttachmentItemData alloc];
    v289 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithDocScan](v23, "countOfNotesWithDocScan")));
    v284 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithInlineDrawingV1](v23, "countOfNotesWithInlineDrawingV1")));
    v280 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithInlineDrawingV2](v23, "countOfNotesWithInlineDrawingV2")));
    v294 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPaperKit](v23, "countOfNotesWithPaperKit")));
    v261 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFullscreenDrawing](v23, "countOfNotesWithFullscreenDrawing")));
    v258 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithTable](v23, "countOfNotesWithTable")));
    v276 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithOtherAttachments](v23, "countOfNotesWithOtherAttachments")));
    v272 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithRichURL](v23, "countOfNotesWithRichURL")));
    v268 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMapLink](v23, "countOfNotesWithMapLink")));
    v264 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithDeepLink](v23, "countOfNotesWithDeepLink")));
    v255 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPaperDocument](v23, "countOfNotesWithPaperDocument")));
    v249 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithPDF](v23, "countOfNotesWithPDF")));
    v252 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithNoteLink](v23, "countOfNotesWithNoteLink")));
    v56 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithFolderLink](v23, "countOfNotesWithFolderLink")));
    v246 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithAttachmentAudio](v23, "countOfNotesWithAttachmentAudio")));
    v243 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfAudioAttachments](v23, "countOfAudioAttachments")));
    v57 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(-1)];
    v58 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfAudioAttachmentsWithAppendedAudio](v23, "countOfAudioAttachmentsWithAppendedAudio")));
    v59 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithAttachmentAudioTranscript](v23, "countOfNotesWithAttachmentAudioTranscript")));
    v60 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithAttachmentAudioSummary](v23, "countOfNotesWithAttachmentAudioSummary")));
    v299 = -[ICASNoteAttachmentItemData initWithTotalCountOfNotesWithAttachmentDocScan:totalCountOfNotesWithAttachmentInlineDrawingV1:totalCountOfNotesWithAttachmentInlineDrawingV2:totalCountOfNotesWithAttachmentPaperKit:totalCountOfNotesWithAttachmentFullscreenDrawing:totalCountOfNotesWithAttachmentTables:totalCountOfNotesWithAttachmentOther:totalCountOfNotesWithAttachmentRichUrl:totalCountOfNotesWithAttachmentMapLink:totalCountOfNotesWithAttachmentDeepLink:totalCountOfNotesWithPaperDocument:totalCountOfNotesWithPdfDocument:totalCountOfNotesWithNoteLinks:totalCountOfNotesWithFolderLinks:totalCountOfNotesWithAttachmentAudio:totalCountOfAudioAttachments:totalCountOfAudioAttachmentsRecordedInNotes:totalCountOfAudioAttachmentsWithAppendedAudio:totalCountOfNotesWithAttachmentAudioTranscript:totalCountOfNotesWithAttachmentAudioSummary:](v298, "initWithTotalCountOfNotesWithAttachmentDocScan:totalCountOfNotesWithAttachmentInlineDrawingV1:totalCountOfNotesWithAttachmentInlineDrawingV2:totalCountOfNotesWithAttachmentPaperKit:totalCountOfNotesWithAttachmentFullscreenDrawing:totalCountOfNotesWithAttachmentTables:totalCountOfNotesWithAttachmentOther:totalCountOfNotesWithAttachmentRichUrl:totalCountOfNotesWithAttachmentMapLink:totalCountOfNotesWithAttachmentDeepLink:totalCountOfNotesWithPaperDocument:totalCountOfNotesWithPdfDocument:totalCountOfNotesWithNoteLinks:totalCountOfNotesWithFolderLinks:totalCountOfNotesWithAttachmentAudio:totalCountOfAudioAttachments:totalCountOfAudioAttachmentsRecordedInNotes:totalCountOfAudioAttachmentsWithAppendedAudio:totalCountOfNotesWithAttachmentAudioTranscript:totalCountOfNotesWithAttachmentAudioSummary:", v289, v284, v280, v294, v261, v258, v276, v272, v268, v264,
             v255,
             v249,
             v252,
             v56,
             v246,
             v243,
             v57,
             v58,
             v59,
             v60);

    v295 = [ICASScrapPaperAttachmentItemData alloc];
    v290 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithDocScan](v23, "countOfScrapPapersWithDocScan")));
    v61 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithInlineDrawingV1](v23, "countOfScrapPapersWithInlineDrawingV1")));
    v285 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithInlineDrawingV2](v23, "countOfScrapPapersWithInlineDrawingV2")));
    v62 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithPaperKit](v23, "countOfScrapPapersWithPaperKit")));
    v63 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithFullscreenDrawing](v23, "countOfScrapPapersWithFullscreenDrawing")));
    v64 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithTables](v23, "countOfScrapPapersWithTables")));
    v65 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithOtherAttachments](v23, "countOfScrapPapersWithOtherAttachments")));
    v66 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithRichUrl](v23, "countOfScrapPapersWithRichUrl")));
    v185 = v23;
    v67 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithMapLink](v23, "countOfScrapPapersWithMapLink")));
    v68 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithDeepLink](v23, "countOfScrapPapersWithDeepLink")));
    v296 = [(ICASScrapPaperAttachmentItemData *)v295 initWithTotalCountOfScrapPapersWithAttachmentDocScan:v290 totalCountOfScrapPapersWithAttachmentInlineDrawingV1:v61 totalCountOfScrapPapersWithAttachmentInlineDrawingV2:v285 totalCountOfScrapPapersWithAttachmentPaperKit:v62 totalCountOfScrapPapersWithAttachmentFullscreenDrawing:v63 totalCountOfScrapPapersWithAttachmentTables:v64 totalCountOfScrapPapersWithAttachmentOther:v65 totalCountOfScrapPapersWithAttachmentRichUrl:v66 totalCountOfScrapPapersWithAttachmentMapLink:v67 totalCountOfScrapPapersWithAttachmentDeepLink:v68];

    v291 = [ICASSmartFoldersItemData alloc];
    v286 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithTagsFilter](v310, "countOfSmartFoldersWithTagsFilter")));
    v281 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithDateCreatedFilter](v310, "countOfSmartFoldersWithDateCreatedFilter")));
    v273 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithDateModifiedFilter](v310, "countOfSmartFoldersWithDateModifiedFilter")));
    v269 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithSharedFilter](v310, "countOfSmartFoldersWithSharedFilter")));
    v69 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithMentionsFilter](v310, "countOfSmartFoldersWithMentionsFilter")));
    v277 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithChecklistsFilter](v310, "countOfSmartFoldersWithChecklistsFilter")));
    v70 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithAttachmentsFilter](v310, "countOfSmartFoldersWithAttachmentsFilter")));
    v265 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithFoldersFilter](v310, "countOfSmartFoldersWithFoldersFilter")));
    v71 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithQuickNotesFilter](v310, "countOfSmartFoldersWithQuickNotesFilter")));
    v72 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithPinnedNotesFilter](v310, "countOfSmartFoldersWithPinnedNotesFilter")));
    v73 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithLockedNotesFilter](v310, "countOfSmartFoldersWithLockedNotesFilter")));
    v74 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfSmartFoldersWithUnknownFilter](v310, "countOfSmartFoldersWithUnknownFilter")));
    v292 = [(ICASSmartFoldersItemData *)v291 initWithTotalCountOfSmartFoldersWithTagsFilter:v286 totalCountOfSmartFoldersWithDateCreatedFilter:v281 totalCountOfSmartFoldersWithDateModifiedFilter:v273 totalCountOfSmartFoldersWithSharedFilter:v269 totalCountOfSmartFoldersWithMentionsFilter:v69 totalCountOfSmartFoldersWithChecklistsFilter:v277 totalCountOfSmartFoldersWithAttachmentsFilter:v70 totalCountOfSmartFoldersWithFoldersFilter:v265 totalCountOfSmartFoldersWithQuickNotesFilter:v71 totalCountOfSmartFoldersWithPinnedNotesFilter:v72 totalCountOfSmartFoldersWithLockedNotesFilter:v73 totalCountOfSmartFoldersWithUnknownFilter:v74];

    v75 = [ICASLockedNotesItemData alloc];
    v76 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfV1LockedNotes](v185, "countOfV1LockedNotes")));
    v77 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfV2LockedNotes](v185, "countOfV2LockedNotes")));
    v78 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotesWithDivergedMode](v185, "countOfLockedNotesWithDivergedMode")));
    v79 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotesWithDivergedPassword](v185, "countOfLockedNotesWithDivergedPassword")));
    v172 = [(ICASLockedNotesItemData *)v75 initWithTotalCountOfV1LockedNotes:v76 totalCountOfV2LockedNotes:v77 totalCountOfLockedNotesWithDivergedMode:v78 totalCountOfLockedNotesWithDivergedPassword:v79];

    v154 = [ICASAccountSnapshotData alloc];
    v287 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
    v282 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
    v274 = +[ICNAController saltVersion];
    v326 = v308;
    v262 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v326 count:1];
    v325 = v306;
    v253 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v325 count:1];
    v324 = v304;
    v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v324 count:1];
    v323 = v302;
    v270 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v323 count:1];
    v322 = v299;
    v278 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v322 count:1];
    v321 = v296;
    v235 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v321 count:1];
    v320 = v172;
    v266 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v320 count:1];
    v319 = v292;
    v259 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v319 count:1];
    v256 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotes](v185, "countOfNotes")));
    v231 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFolders](v310, "countOfFolders")));
    v250 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfCustomSmartFolders](v310, "countOfCustomSmartFolders")));
    v247 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfChecklists](v185, "countOfChecklists")));
    v244 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithChecklists](v185, "countOfNotesWithChecklists")));
    v229 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfPinnedNotes](v185, "countOfPinnedNotes")));
    v239 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedNotes](v185, "countOfLockedNotes")));
    v237 = [(ICNASnapshotReporter *)v147 deviceSnapshotSummaryForDataType:objc_opt_class()];
    v225 = [(ICNASnapshotReporter *)v147 userSnapshotSummaryForDataType:objc_opt_class()];
    v233 = [(_ICNAAttachmentReportToAccount *)v307 attachmentUTISummary];
    v171 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v170 = [v171 folderDirectNoteCountHistogram];
    v227 = [v170 icasHistogram];
    v169 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v168 = [v169 collabRootFolderTotalNoteCountHistogram];
    v219 = [v168 icasHistogram];
    v167 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v166 = [v167 docScanPageCountHistogram];
    v223 = [v166 icasHistogram];
    v165 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v164 = [v165 collabOwnedRootFolderInviteeCountHistogram];
    v215 = [v164 icasHistogram];
    v163 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v162 = [v163 collabOwnedRootFolderAcceptanceCountHistogram];
    v221 = [v162 icasHistogram];
    v161 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v160 = [v161 collabOwnedRootFolderNoReplyCountHistogram];
    v213 = [v160 icasHistogram];
    v159 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v158 = [v159 collabOwnedRootFolderAcceptanceRatioHistogram];
    v203 = [v158 icasHistogram];
    v157 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v156 = [v157 collabOwnedSingleNoteInviteeCountHistogram];
    v217 = [v156 icasHistogram];
    v153 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v152 = [v153 collabOwnedSingleNoteAcceptanceCountHistogram];
    v200 = [v152 icasHistogram];
    v151 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v150 = [v151 collabOwnedSingleNoteNoReplyCountHistogram];
    v211 = [v150 icasHistogram];
    v149 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v148 = [v149 collabOwnedSingleNoteAcceptanceRatioHistogram];
    v209 = [v148 icasHistogram];
    v146 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v145 = [v146 noteCharCountHistogram];
    v198 = [v145 icasHistogram];
    v144 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v143 = [v144 inlineDrawingV1TotalStrokeCountHistogram];
    v207 = [v143 icasHistogram];
    v142 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v141 = [v142 inlineDrawingV1PencilStrokeCountHistogram];
    v196 = [v141 icasHistogram];
    v140 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v139 = [v140 inlineDrawingV1FingerStrokeCountHistogram];
    v205 = [v139 icasHistogram];
    v138 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v137 = [v138 inlineDrawingV1FingerStrokeRatioHistogram];
    v195 = [v137 icasHistogram];
    v136 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v135 = [v136 inlineDrawingV2TotalStrokeCountHistogram];
    v201 = [v135 icasHistogram];
    v134 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v133 = [v134 inlineDrawingV2PencilStrokeCountHistogram];
    v199 = [v133 icasHistogram];
    v132 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v131 = [v132 inlineDrawingV2FingerStrokeCountHistogram];
    v197 = [v131 icasHistogram];
    v130 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v129 = [v130 inlineDrawingV2FingerStrokeRatioHistogram];
    v191 = [v129 icasHistogram];
    v128 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v127 = [v128 fullscreenDrawingStrokeCountHistogram];
    v194 = [v127 icasHistogram];
    v126 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v125 = [v126 tableRowCountHistogram];
    v190 = [v125 icasHistogram];
    v124 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v123 = [v124 tableColumnCountHistogram];
    v193 = [v123 icasHistogram];
    v122 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v121 = [v122 tableCellCountHistogram];
    v188 = [v121 icasHistogram];
    v120 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v119 = [v120 passwordProtectedNoteWeeklyAgeHistogram];
    v192 = [v119 icasHistogram];
    v118 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v117 = [v118 topLevelFolderTotalNoteCountHistogram];
    v186 = [v117 icasHistogram];
    v116 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v115 = [v116 attachmentCountPerNoteHistogram];
    v189 = [v115 icasHistogram];
    v114 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v113 = [v114 drawingCountPerNoteHistogram];
    v183 = [v113 icasHistogram];
    v112 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v111 = [v112 inlineDrawingFingerStrokesCountPerNoteHistogram];
    v187 = [v111 icasHistogram];
    v110 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v109 = [v110 inlineDrawingPencilStrokesCountPerNoteHistogram];
    v184 = [v109 icasHistogram];
    v108 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v107 = [v108 fullScreenDrawingStrokesCountPerNoteHistogram];
    v182 = [v107 icasHistogram];
    v106 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v105 = [v106 totalStrokesCountPerNoteHistogram];
    v181 = [v105 icasHistogram];
    v104 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v103 = [v104 tagCountPerNoteHistogram];
    v180 = [v103 icasHistogram];
    v102 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v101 = [v102 distinctTagCountPerNoteHistogram];
    v179 = [v101 icasHistogram];
    v100 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithTags](v185, "countOfNotesWithTags")));
    v178 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithCollapsedSections](v185, "countOfNotesWithCollapsedSections")));
    v99 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMentions](v185, "countOfNotesWithMentions")));
    v98 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount scrapPaperCount](v185, "scrapPaperCount")));
    v177 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithTags](v185, "countOfScrapPapersWithTags")));
    v80 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfScrapPapersWithMentions](v185, "countOfScrapPapersWithMentions")));
    v81 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfPinnedScrapPapers](v185, "countOfPinnedScrapPapers")));
    v94 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfLockedScrapPapers](v185, "countOfLockedScrapPapers")));
    v93 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfCollaboratedScrapPapers](v185, "countOfCollaboratedScrapPapers")));
    v97 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v96 = [v97 mentionCountPerNoteHistogram];
    v82 = [v96 icasHistogram];
    v95 = [(ICNASnapshotReporter *)v147 accountHistogramManager];
    v83 = [v95 distinctMentionCountPerNoteHistogram];
    v84 = [v83 icasHistogram];
    v92 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotesWithMathUsage](v185, "countOfNotesWithMathUsage")));
    v155 = -[ICASAccountSnapshotData initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:](v154, "initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:tota"
             "lCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPer"
             "NoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:",
             v287,
             v282,
             v274,
             v262,
             v253,
             v241,
             v270,
             v278,
             v235,
             v266,
             v259,
             v256,
             v231,
             v250,
             v247,
             v244,
             v229,
             v239,
             v237,
             v225,
             v233,
             v227,
             v219,
             v223,
             v215,
             v221,
             v213,
             v203,
             v217,
             v200,
             v211,
             v209,
             v198,
             v207,
             v196,
             v205,
             v195,
             v201,
             v199,
             v197,
             v191,
             v194,
             v190,
             v193,
             v188,
             v192,
             v186,
             v189,
             v183,
             v187,
             v184,
             v182,
             v181,
             v180,
             v179,
             v100,
             v178,
             v99,
             v98,
             v177,
             v80);

    v85 = +[ICNAController sharedController];
    uint64_t v86 = objc_opt_class();
    v318 = v155;
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v318 count:1];
    v88 = [(ICNAEventReporter *)v147 subTracker];
    [v85 submitEventOfType:v86 pushThenPopDataObjects:v87 subTracker:v88];

    uint64_t v89 = [v175 accountType];
    uint64_t v90 = [(_ICNANoteReportToAccount *)v185 countOfNotes];
    id v11 = v176;
    uint64_t v91 = v89;
    id v13 = v312;
    [v176 reportAccountType:v91 noteCount:v90];
    uint64_t v14 = v309;
    objc_msgSend((id)objc_opt_class(), "faultOutObject:");
    [(ICNASnapshotReporter *)v147 setAccountHistogramManager:0];

    id v12 = v313;
  }
}

- (void)snapshotHTMLAccount:(id)a3 reportedDataToDevice:(id)a4 reportedDataFromFolderToDevice:(id)a5 reportedDataFromNoteToDevice:(id)a6
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v101 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(ICNAHistogramManager);
  [(ICNASnapshotReporter *)self setAccountHistogramManager:v13];

  uint64_t v14 = v10;
  v15 = [(ICNASnapshotReporter *)self sortedFoldersForAccount:v10];
  uint64_t v16 = objc_alloc_init(_ICNAFolderReportToAccount);
  long long v17 = objc_alloc_init(_ICNANoteReportToAccount);
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v142 objects:v148 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v143;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v143 != v21) {
          objc_enumerationMutation(v18);
        }
        [(ICNASnapshotReporter *)self snapshotHTMLFolder:*(void *)(*((void *)&v142 + 1) + 8 * v22++) reportedDataToAccount:v16 reportedDataToDevice:v11 noteReportToAccount:v17 reportedDataFromNoteToDevice:v12];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v142 objects:v148 count:16];
    }
    while (v20);
  }

  v75 = v14;
  v141 = [(ICNAEventReporter *)self accountTypeForHTMLAccount:v14];
  v100 = [(ICNASnapshotReporter *)self accountPurposeForHTMLAccount];
  uint64_t v23 = +[ICNAIdentityManager sharedManager];
  v24 = [v14 accountIdentifier];
  v99 = [v23 saltedID:v24 forClass:objc_opt_class()];

  v98 = [[ICASAccountSnapshotItemData alloc] initWithAccountID:v99 accountType:v141 accountPurpose:v100];
  v114 = [ICASAccountSnapshotData alloc];
  v140 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startMonth](ICNAController, "startMonth"));
  v139 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[ICNAController startYear](ICNAController, "startYear"));
  v138 = +[ICNAController saltVersion];
  v147 = v98;
  v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
  v136 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNANoteReportToAccount countOfNotes](v17, "countOfNotes")));
  v135 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfFolders](v16, "countOfFolders")));
  v134 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[_ICNAFolderReportToAccount countOfCustomSmartFolders](v16, "countOfCustomSmartFolders")));
  v133 = [(ICNASnapshotReporter *)self deviceSnapshotSummaryForDataType:objc_opt_class()];
  v132 = [(ICNASnapshotReporter *)self userSnapshotSummaryForDataType:objc_opt_class()];
  v97 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v96 = [v97 folderDirectNoteCountHistogram];
  v131 = [v96 icasHistogram];
  v95 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v94 = [v95 collabRootFolderTotalNoteCountHistogram];
  v130 = [v94 icasHistogram];
  v93 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v92 = [v93 docScanPageCountHistogram];
  v129 = [v92 icasHistogram];
  uint64_t v91 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v90 = [v91 collabOwnedRootFolderInviteeCountHistogram];
  v128 = [v90 icasHistogram];
  uint64_t v89 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v88 = [v89 collabOwnedRootFolderAcceptanceCountHistogram];
  v127 = [v88 icasHistogram];
  v87 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v86 = [v87 collabOwnedRootFolderNoReplyCountHistogram];
  v126 = [v86 icasHistogram];
  v85 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v84 = [v85 collabOwnedRootFolderAcceptanceRatioHistogram];
  v125 = [v84 icasHistogram];
  v83 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v82 = [v83 collabOwnedSingleNoteInviteeCountHistogram];
  v124 = [v82 icasHistogram];
  v81 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v80 = [v81 collabOwnedSingleNoteAcceptanceCountHistogram];
  v123 = [v80 icasHistogram];
  v79 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v78 = [v79 collabOwnedSingleNoteNoReplyCountHistogram];
  v122 = [v78 icasHistogram];
  v77 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v76 = [v77 collabOwnedSingleNoteAcceptanceRatioHistogram];
  v121 = [v76 icasHistogram];
  v74 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v73 = [v74 noteCharCountHistogram];
  v120 = [v73 icasHistogram];
  v72 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v71 = [v72 inlineDrawingV1TotalStrokeCountHistogram];
  v119 = [v71 icasHistogram];
  v70 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v69 = [v70 inlineDrawingV1PencilStrokeCountHistogram];
  v118 = [v69 icasHistogram];
  v68 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v67 = [v68 inlineDrawingV1FingerStrokeCountHistogram];
  v117 = [v67 icasHistogram];
  v66 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v65 = [v66 inlineDrawingV1FingerStrokeRatioHistogram];
  v116 = [v65 icasHistogram];
  v64 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v63 = [v64 inlineDrawingV2TotalStrokeCountHistogram];
  v113 = [v63 icasHistogram];
  v62 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v61 = [v62 inlineDrawingV2PencilStrokeCountHistogram];
  v112 = [v61 icasHistogram];
  v60 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v59 = [v60 inlineDrawingV2FingerStrokeCountHistogram];
  v111 = [v59 icasHistogram];
  v58 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v57 = [v58 inlineDrawingV2FingerStrokeRatioHistogram];
  v110 = [v57 icasHistogram];
  v56 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v55 = [v56 fullscreenDrawingStrokeCountHistogram];
  v109 = [v55 icasHistogram];
  v54 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v53 = [v54 tableRowCountHistogram];
  v108 = [v53 icasHistogram];
  v52 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v51 = [v52 tableColumnCountHistogram];
  v107 = [v51 icasHistogram];
  v50 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v49 = [v50 tableCellCountHistogram];
  v106 = [v49 icasHistogram];
  v48 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v47 = [v48 passwordProtectedNoteWeeklyAgeHistogram];
  v105 = [v47 icasHistogram];
  v46 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v45 = [v46 topLevelFolderTotalNoteCountHistogram];
  v104 = [v45 icasHistogram];
  v44 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v43 = [v44 attachmentCountPerNoteHistogram];
  v103 = [v43 icasHistogram];
  v42 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v41 = [v42 drawingCountPerNoteHistogram];
  v102 = [v41 icasHistogram];
  v40 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v39 = [v40 inlineDrawingFingerStrokesCountPerNoteHistogram];
  uint64_t v25 = [v39 icasHistogram];
  v38 = [(ICNASnapshotReporter *)self accountHistogramManager];
  v37 = [v38 inlineDrawingPencilStrokesCountPerNoteHistogram];
  uint64_t v26 = [v37 icasHistogram];
  v36 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v35 = [v36 fullScreenDrawingStrokesCountPerNoteHistogram];
  uint64_t v27 = [v35 icasHistogram];
  v34 = [(ICNASnapshotReporter *)self accountHistogramManager];
  uint64_t v33 = [v34 totalStrokesCountPerNoteHistogram];
  uint64_t v28 = [v33 icasHistogram];
  v115 = -[ICASAccountSnapshotData initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:](v114, "initWithUserStartMonth:userStartYear:saltVersion:accountSnapshotSummary:accountNotesTwoFactorSummary:collabNotesSummary:collabFoldersSummary:noteAttachmentSummary:scrapPaperAttachmentSummary:lockedNotesSummary:smartFoldersSummary:totalNoteCount:totalFolderCount:totalSmartFolderCount:totalChecklistCount:totalNotesWithChecklistCount:totalCountOfPinnedNotes:totalCountOfLockedNotes:deviceSnapshotSummary:userSnapshotSummary:attachmentUTISummary:folderDirectNoteCountHistogram:collabRootFolderTotalNoteCountHistogram:docScanPageCountHistogram:collabOwnedRootFolderInviteeCountHistogram:collabOwnedRootFolderAcceptanceCountHistogram:collabOwnedRootFolderNoReplyCountHistogram:collabOwnedRootFolderAcceptanceRatioHistogram:collabOwnedSingleNoteInviteeCountHistogram:collabOwnedSingleNoteAcceptanceCountHistogram:collabOwnedSingleNoteNoReplyCountHistogram:collabOwnedSingleNoteAcceptanceRatioHistogram:noteCharCountHistogram:inlineDrawingV1TotalStrokeCountHistogram:inlineDrawingV1PencilStrokeCountHistogram:inlineDrawingV1FingerStrokeCountHistogram:inlineDrawingV1FingerStrokeRatioHistogram:inlineDrawingV2TotalStrokeCountHistogram:inlineDrawingV2PencilStrokeCountHistogram:inlineDrawingV2FingerStrokeCountHistogram:inlineDrawingV2FingerStrokeRatioHistogram:fullscreenDrawingStrokeCountHistogram:tableRowCountHistogram:tableColumnCountHistogram:tableCellCountHistogram:passwordProtectedNoteWeeklyAgeHistogram:topLevelFolderTotalNoteCountHistogram:attachmentCountPerNoteHistogram:drawingCountPerNoteHistogram:inlineDrawingFingerStrokesCountPerNoteHistogram:inlineDrawingPencilStrokesCountPerNoteHistogram:fullScreenDrawingStrokesCountPerNoteHistogram:totalStrokesCountPerNoteHistogram:tagCountPerNoteHistogram:distinctTagCountPerNoteHistogram:totalCountOfNotesWithTags:totalCountOfNotesWithCollapsedSections:totalCountOfNotesWithMentions:totalScrapPaperCount:totalCountOfScrapPapersWithTags:totalCountOfScrapPapersWithMentions:totalCountOfPinnedScrapPapers:totalCount"
           "OfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerN"
           "oteHistogram:totalCountOfNotesWithMathUsage:",
           v140,
           v139,
           v138,
           v137,
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           v136,
           v135,
           v134,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           v133,
           v132,
           MEMORY[0x1E4F1CBF0],
           v131,
           v130,
           v129,
           v128,
           v127,
           v126,
           v125,
           v124,
           v123,
           v122,
           v121,
           v120,
           v119,
           v118,
           v117,
           v116,
           v113,
           v112,
           v111,
           v110,
           v109,
           v108,
           v107,
           v106,
           v105,
           v104,
           v103,
           v102,
           v25,
           v26,
           v27,
           v28,
           MEMORY[0x1E4F1CBF0],
           MEMORY[0x1E4F1CBF0],
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638,
           &unk_1F1F8D638);

  uint64_t v29 = +[ICNAController sharedController];
  uint64_t v30 = objc_opt_class();
  v146 = v115;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
  v32 = [(ICNAEventReporter *)self subTracker];
  [v29 submitEventOfType:v30 pushThenPopDataObjects:v31 subTracker:v32];

  objc_msgSend(v101, "reportAccountType:noteCount:", objc_msgSend(v141, "accountType"), -[_ICNANoteReportToAccount countOfNotes](v17, "countOfNotes"));
  [(id)objc_opt_class() faultOutObject:v75];
  [(ICNASnapshotReporter *)self setAccountHistogramManager:0];
}

- (void)snapshotModernFolder:(id)a3 reportedDataToParentFolder:(id)a4 reportedDataToAccount:(id)a5 reportedDataToDevice:(id)a6 reportedDataFromNotesToAccount:(id)a7 reportedDataFromAttachmentToAccount:(id)a8 reportedDataFromNoteToDevice:(id)a9
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v16 = (_ICNAFolderReportToParentFolder *)a4;
  id v17 = a5;
  id v68 = a6;
  id v72 = a7;
  id v71 = a8;
  id v70 = a9;
  if ([v15 isUnsupported])
  {
    [(id)objc_opt_class() faultOutObject:v15];
    id v18 = v17;
  }
  else
  {
    v69 = self;
    if (!v16) {
      uint64_t v16 = objc_alloc_init(_ICNAFolderReportToParentFolder);
    }
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    uint64_t v19 = [v15 foldersInFolder];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v82 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v81 + 1) + 8 * i);
          uint64_t v25 = objc_alloc_init(_ICNAFolderReportToParentFolder);
          [(ICNASnapshotReporter *)v69 snapshotModernFolder:v24 reportedDataToParentFolder:v25 reportedDataToAccount:v17 reportedDataToDevice:v68 reportedDataFromNotesToAccount:v72 reportedDataFromAttachmentToAccount:v71 reportedDataFromNoteToDevice:v70];
          [(_ICNAFolderReportToParentFolder *)v16 setTotalNoteCountIncludingSubFolders:[(_ICNAFolderReportToParentFolder *)v16 totalNoteCountIncludingSubFolders]+ [(_ICNAFolderReportToParentFolder *)v25 totalNoteCountIncludingSubFolders]];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v21);
    }

    char v26 = [v15 isSmartFolder];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v27 = [v15 visibleNotesInFolder];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v65 = v15;
      unint64_t v30 = 0;
      uint64_t v31 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v78 != v31) {
            objc_enumerationMutation(v27);
          }
          if ((v26 & 1) == 0)
          {
            uint64_t v33 = *(void *)(*((void *)&v77 + 1) + 8 * j);
            v34 = (void *)MEMORY[0x1C877EAC0]();
            [(ICNASnapshotReporter *)v69 snapshotModernNote:v33 reportedDataToAccount:v72 reportToDevice:v70 reportedDataFromAttachmentToAccount:v71];
          }
          [(_ICNAFolderReportToParentFolder *)v16 setTotalNoteCountIncludingSubFolders:[(_ICNAFolderReportToParentFolder *)v16 totalNoteCountIncludingSubFolders]+ 1];
        }
        v30 += v29;
        uint64_t v29 = [v27 countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v29);
      double v35 = (double)v30;
      id v15 = v65;
    }
    else
    {
      double v35 = 0.0;
    }

    id v18 = v17;
    v36 = v69;
    if (([v15 isDefaultFolderForAccount] & 1) == 0 && (objc_msgSend(v15, "isTrashFolder") & 1) == 0)
    {
      v37 = [(ICNAEventReporter *)v69 collaborationStatusForModernObject:v15];
      v38 = [(ICNAEventReporter *)v69 collaborationTypeForModernObject:v15];
      if ([v38 collaborationType] == 2)
      {
        uint64_t v39 = [(ICNASnapshotReporter *)v69 accountHistogramManager];
        v40 = [v39 collabRootFolderTotalNoteCountHistogram];
        objc_msgSend(v40, "reportValue:", (double)-[_ICNAFolderReportToParentFolder totalNoteCountIncludingSubFolders](v16, "totalNoteCountIncludingSubFolders"));
      }
      if ([v37 collaborationStatus] == 1 && objc_msgSend(v38, "collaborationType") == 2)
      {
        uint64_t v41 = [v15 serverShare];
        unint64_t v42 = objc_msgSend(v41, "ic_nonOwnerInvitedParticipantsCount");
        unint64_t v43 = objc_msgSend(v41, "ic_nonOwnerAcceptedParticipantsCount");
        v44 = [(ICNASnapshotReporter *)v69 accountHistogramManager];
        [v44 collabOwnedRootFolderInviteeCountHistogram];
        uint64_t v45 = v66 = v38;
        double v46 = (double)v42;
        [v45 reportValue:(double)v42];

        uint64_t v47 = [(ICNASnapshotReporter *)v69 accountHistogramManager];
        v48 = [v47 collabOwnedRootFolderAcceptanceCountHistogram];
        [v48 reportValue:(double)v43];

        v49 = [(ICNASnapshotReporter *)v69 accountHistogramManager];
        v50 = [v49 collabOwnedRootFolderNoReplyCountHistogram];
        v36 = v69;
        [v50 reportValue:(double)(v42 - v43)];

        v38 = v66;
        v51 = [(ICNASnapshotReporter *)v69 accountHistogramManager];
        v52 = [v51 collabOwnedRootFolderAcceptanceRatioHistogram];
        [v52 reportValue:(double)v43 / v46];
      }
      v53 = [(ICNASnapshotReporter *)v36 accountHistogramManager];
      v54 = [v53 folderDirectNoteCountHistogram];
      [v54 reportValue:v35];

      objc_msgSend(v18, "setCountOfFolders:", objc_msgSend(v18, "countOfFolders") + 1);
      if ([v15 folderType] == 2)
      {
        v67 = v38;
        objc_msgSend(v18, "setCountOfCustomSmartFolders:", objc_msgSend(v18, "countOfCustomSmartFolders") + 1);
        v55 = [v15 smartFolderQuery];
        v56 = [v15 managedObjectContext];
        v57 = [v15 account];
        v58 = [v57 objectID];
        v59 = [v55 filterSelectionWithManagedObjectContext:v56 account:v58];

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v60 = [v59 filterTypeSelections];
        uint64_t v61 = [v60 countByEnumeratingWithState:&v73 objects:v85 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v62; ++k)
            {
              if (*(void *)v74 != v63) {
                objc_enumerationMutation(v60);
              }
              switch([*(id *)(*((void *)&v73 + 1) + 8 * k) filterType])
              {
                case -1:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithUnknownFilter:", objc_msgSend(v18, "countOfSmartFoldersWithUnknownFilter") + 1);
                  break;
                case 0:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithTagsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithTagsFilter") + 1);
                  break;
                case 1:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithDateCreatedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithDateCreatedFilter") + 1);
                  break;
                case 2:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithDateModifiedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithDateModifiedFilter") + 1);
                  break;
                case 3:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithSharedFilter:", objc_msgSend(v18, "countOfSmartFoldersWithSharedFilter") + 1);
                  break;
                case 4:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithMentionsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithMentionsFilter") + 1);
                  break;
                case 5:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithChecklistsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithChecklistsFilter") + 1);
                  break;
                case 6:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithAttachmentsFilter:", objc_msgSend(v18, "countOfSmartFoldersWithAttachmentsFilter") + 1);
                  break;
                case 7:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithFoldersFilter:", objc_msgSend(v18, "countOfSmartFoldersWithFoldersFilter") + 1);
                  break;
                case 8:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithQuickNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithQuickNotesFilter") + 1);
                  break;
                case 9:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithPinnedNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithPinnedNotesFilter") + 1);
                  break;
                case 10:
                  objc_msgSend(v18, "setCountOfSmartFoldersWithLockedNotesFilter:", objc_msgSend(v18, "countOfSmartFoldersWithLockedNotesFilter") + 1);
                  break;
                default:
                  continue;
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v73 objects:v85 count:16];
          }
          while (v62);
        }

        v38 = v67;
      }
      [v18 updateFolderCollaborationMatrixWithCollaborationStatus:v37 collaborationType:v38];
      [v68 updateFolderCollaborationMatrixWithCollaborationStatus:v37 collaborationType:v38];
    }
    [(id)objc_opt_class() faultOutObject:v15];
  }
}

- (void)snapshotHTMLFolder:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5 noteReportToAccount:(id)a6 reportedDataFromNoteToDevice:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ICNASnapshotReporter *)self htmlContext];
  id v18 = [v17 allVisibleNotesInFolder:v12];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
  v36 = v14;
  if (v20)
  {
    uint64_t v21 = v20;
    id v34 = v13;
    id v35 = v12;
    unint64_t v22 = 0;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        char v26 = (void *)MEMORY[0x1C877EAC0]();
        [(ICNASnapshotReporter *)self snapshotHTMLNote:v25 reportedDataToAccount:v15 reportedDataToDevice:v16];
      }
      v22 += v21;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v21);
    double v27 = (double)v22;
    id v13 = v34;
    id v12 = v35;
    id v14 = v36;
  }
  else
  {
    double v27 = 0.0;
  }

  if ([v12 isCustomFolder])
  {
    uint64_t v28 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
    uint64_t v29 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
    unint64_t v30 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v31 = [v30 topLevelFolderTotalNoteCountHistogram];
    [v31 reportValue:v27];

    v32 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v33 = [v32 folderDirectNoteCountHistogram];
    [v33 reportValue:v27];

    id v14 = v36;
    objc_msgSend(v13, "setCountOfFolders:", objc_msgSend(v13, "countOfFolders") + 1);
    [v13 updateFolderCollaborationMatrixWithCollaborationStatus:v28 collaborationType:v29];
    [v36 updateFolderCollaborationMatrixWithCollaborationStatus:v28 collaborationType:v29];
  }
  [(id)objc_opt_class() faultOutObject:v12];
}

- (void)snapshotModernNote:(id)a3 reportedDataToAccount:(id)a4 reportToDevice:(id)a5 reportedDataFromAttachmentToAccount:(id)a6
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v128 = a4;
  id v127 = a5;
  id v11 = a6;
  v126 = v10;
  if ([v10 isUnsupported])
  {
    [(id)objc_opt_class() faultOutObject:v10];
  }
  else
  {
    v116 = [(ICNAEventReporter *)self collaborationTypeForModernObject:v10];
    v115 = [(ICNAEventReporter *)self collaborationStatusForModernObject:v10];
    [v128 updateNoteCollaborationMatrixWithCollaborationStatus:v115 collaborationType:v116];
    if ([v115 collaborationStatus] == 1 && objc_msgSend(v116, "collaborationType") == 2)
    {
      id v12 = [v10 serverShare];
      unint64_t v13 = objc_msgSend(v12, "ic_nonOwnerInvitedParticipantsCount");
      unint64_t v14 = objc_msgSend(v12, "ic_nonOwnerAcceptedParticipantsCount");
      id v15 = [(ICNASnapshotReporter *)self accountHistogramManager];
      id v16 = [v15 collabOwnedSingleNoteInviteeCountHistogram];
      [v16 reportValue:(double)v13];

      id v17 = [(ICNASnapshotReporter *)self accountHistogramManager];
      id v18 = [v17 collabOwnedSingleNoteAcceptanceCountHistogram];
      [v18 reportValue:(double)v14];

      id v19 = [(ICNASnapshotReporter *)self accountHistogramManager];
      uint64_t v20 = [v19 collabOwnedSingleNoteNoReplyCountHistogram];
      [v20 reportValue:(double)(v13 - v14)];

      uint64_t v21 = [(ICNASnapshotReporter *)self accountHistogramManager];
      unint64_t v22 = [v21 collabOwnedSingleNoteAcceptanceRatioHistogram];
      [v22 reportValue:(double)v14 / (double)v13];
    }
    uint64_t v23 = [v126 textStorage];
    v125 = v23;
    uint64_t v151 = 0;
    v152 = &v151;
    uint64_t v153 = 0x2020000000;
    char v154 = 0;
    uint64_t v147 = 0;
    v148 = &v147;
    uint64_t v149 = 0x2020000000;
    uint64_t v150 = 0;
    uint64_t v24 = v23;
    if (v23)
    {
      unint64_t v110 = [v23 length];
      uint64_t v143 = 0;
      long long v144 = &v143;
      uint64_t v145 = 0x2020000000;
      char v146 = 0;
      uint64_t v25 = [v24 length];
      v138[0] = MEMORY[0x1E4F143A8];
      v138[1] = 3221225472;
      v138[2] = __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke;
      v138[3] = &unk_1E64B8CA8;
      v140 = &v151;
      id v139 = v128;
      v141 = &v143;
      long long v142 = &v147;
      objc_msgSend(v24, "enumerateAttributesInRange:options:usingBlock:", 0, v25, 0, v138);

      _Block_object_dispose(&v143, 8);
    }
    else
    {
      unint64_t v110 = 0;
    }
    char v26 = objc_alloc_init(_ICNAAttachmentReportToNote);
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    double v27 = [v126 visibleAttachments];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v134 objects:v155 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v135;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v135 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void **)(*((void *)&v134 + 1) + 8 * i);
          v32 = (void *)MEMORY[0x1C877EAC0]();
          uint64_t v33 = [v31 parentAttachment];
          BOOL v34 = v33 == 0;

          if (v34) {
            [(ICNASnapshotReporter *)self snapshotAttachment:v31 reportedDataToNote:v26 reportedDataToAccount:v11];
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v134 objects:v155 count:16];
      }
      while (v28);
    }

    uint64_t v109 = [(_ICNAAttachmentReportToNote *)v26 countOfAudioAttachments];
    id v35 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F83058]];
    uint64_t v114 = [v36 unsignedIntegerValue];

    long long v37 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    long long v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F83068]];
    uint64_t v123 = [v38 unsignedIntegerValue];

    long long v39 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    long long v40 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F83060]];
    uint64_t v122 = [v40 unsignedIntegerValue];

    uint64_t v41 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    uint64_t v42 = [v41 objectForKeyedSubscript:*MEMORY[0x1E4F83050]];
    uint64_t v124 = [v42 unsignedIntegerValue];

    unint64_t v43 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v44 = [v43 objectForKeyedSubscript:*MEMORY[0x1E4F83098]];
    uint64_t v113 = [v44 unsignedIntegerValue];

    uint64_t v45 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    double v46 = [(id)*MEMORY[0x1E4F444F8] identifier];
    uint64_t v47 = [v45 objectForKeyedSubscript:v46];
    uint64_t v121 = [v47 unsignedIntegerValue];

    v48 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v49 = [v48 objectForKeyedSubscript:@"com.apple.notes.analytics.appleMaps"];
    uint64_t v120 = [v49 unsignedIntegerValue];

    v50 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v51 = [v50 objectForKeyedSubscript:*MEMORY[0x1E4F83090]];
    uint64_t v119 = [v51 unsignedIntegerValue];

    v52 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v53 = [v52 objectForKeyedSubscript:*MEMORY[0x1E4F83078]];
    uint64_t v112 = [v53 unsignedIntegerValue];

    v54 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v55 = [v54 objectForKeyedSubscript:*MEMORY[0x1E4F83080]];
    uint64_t v118 = [v55 unsignedIntegerValue];

    v56 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v57 = [v56 objectForKeyedSubscript:*MEMORY[0x1E4F83088]];
    uint64_t v117 = [v57 unsignedIntegerValue];

    v58 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachmentByUTI];
    v59 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F83070]];
    uint64_t v111 = [v59 unsignedIntegerValue];

    uint64_t v108 = [(_ICNAAttachmentReportToNote *)v26 countOfAttachments];
    v60 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v61 = [v60 noteCharCountHistogram];
    [v61 reportValue:(double)v110];

    uint64_t v62 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v63 = [v62 attachmentCountPerNoteHistogram];
    objc_msgSend(v63, "reportValue:", (double)-[_ICNAAttachmentReportToNote countOfAttachments](v26, "countOfAttachments"));

    v64 = [(ICNASnapshotReporter *)self accountHistogramManager];
    id v65 = [v64 drawingCountPerNoteHistogram];
    [v65 reportValue:(double)(unint64_t)(v122 + v123 + v124)];

    uint64_t v66 = [(_ICNAAttachmentReportToNote *)v26 countOfInlineDrawingV1FingerStrokes];
    uint64_t v67 = [(_ICNAAttachmentReportToNote *)v26 countOfInlineDrawingV2FingerStrokes];
    uint64_t v68 = [(_ICNAAttachmentReportToNote *)v26 countOfInlineDrawingV1PencilStrokes];
    uint64_t v69 = [(_ICNAAttachmentReportToNote *)v26 countOfInlineDrawingV2PencilStrokes];
    unint64_t v70 = [(_ICNAAttachmentReportToNote *)v26 countOfFullscreenDrawingStrokes];
    id v71 = [(ICNASnapshotReporter *)self accountHistogramManager];
    id v72 = [v71 inlineDrawingFingerStrokesCountPerNoteHistogram];
    unint64_t v73 = v67 + v66;
    [v72 reportValue:(double)v73];

    long long v74 = [(ICNASnapshotReporter *)self accountHistogramManager];
    long long v75 = [v74 inlineDrawingPencilStrokesCountPerNoteHistogram];
    unint64_t v76 = v69 + v68;
    [v75 reportValue:(double)v76];

    long long v77 = [(ICNASnapshotReporter *)self accountHistogramManager];
    long long v78 = [v77 fullScreenDrawingStrokesCountPerNoteHistogram];
    [v78 reportValue:(double)v70];

    long long v79 = [(ICNASnapshotReporter *)self accountHistogramManager];
    long long v80 = [v79 totalStrokesCountPerNoteHistogram];
    [v80 reportValue:(double)(v76 + v73 + v70)];

    long long v81 = v126;
    int v82 = [v126 isSystemPaper];
    objc_msgSend(v128, "setCountOfNotes:", objc_msgSend(v128, "countOfNotes") + 1);
    objc_msgSend(v128, "setCountOfChecklists:", v148[3] + objc_msgSend(v128, "countOfChecklists"));
    objc_msgSend(v127, "setCountOfModernNotes:", objc_msgSend(v127, "countOfModernNotes") + 1);
    if (v82) {
      objc_msgSend(v127, "setCountOfScrapPapers:", objc_msgSend(v127, "countOfScrapPapers") + 1);
    }
    if ([v126 isPinned])
    {
      objc_msgSend(v128, "setCountOfPinnedNotes:", objc_msgSend(v128, "countOfPinnedNotes") + 1);
      objc_msgSend(v127, "setCountOfPinnedNotes:", objc_msgSend(v127, "countOfPinnedNotes") + 1);
      [v128 updateNoteTwoFactorMatrixWithIndex:8];
      if (v82) {
        objc_msgSend(v128, "setCountOfPinnedScrapPapers:", objc_msgSend(v128, "countOfPinnedScrapPapers") + 1);
      }
    }
    if ([v126 isPasswordProtected])
    {
      objc_msgSend(v128, "setCountOfLockedNotes:", objc_msgSend(v128, "countOfLockedNotes") + 1);
      [v128 updateNoteTwoFactorMatrixWithIndex:9];
      long long v83 = [(ICNASnapshotReporter *)self accountHistogramManager];
      long long v84 = [v83 passwordProtectedNoteWeeklyAgeHistogram];
      v85 = [v126 creationDate];
      objc_msgSend(v84, "reportValue:", (double)-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v85));

      long long v81 = v126;
      if (v82) {
        objc_msgSend(v128, "setCountOfLockedScrapPapers:", objc_msgSend(v128, "countOfLockedScrapPapers") + 1);
      }
      if ([MEMORY[0x1E4F83348] shouldAuthenticateWithCustomPasswordForObject:v126])
      {
        objc_msgSend(v128, "setCountOfV1LockedNotes:", objc_msgSend(v128, "countOfV1LockedNotes") + 1);
        uint64_t v86 = [v126 account];
        BOOL v87 = [v86 resolvedLockedNotesMode] == 2;

        if (v87) {
          objc_msgSend(v128, "setCountOfLockedNotesWithDivergedMode:", objc_msgSend(v128, "countOfLockedNotesWithDivergedMode") + 1);
        }
        uint64_t v88 = [v126 account];
        uint64_t v89 = [v88 cryptoStrategy];
        char v90 = [v89 hasSameKeyAsObject:v126];

        long long v81 = v126;
        if ((v90 & 1) == 0) {
          objc_msgSend(v128, "setCountOfLockedNotesWithDivergedPassword:", objc_msgSend(v128, "countOfLockedNotesWithDivergedPassword") + 1);
        }
      }
      else if ([MEMORY[0x1E4F83348] shouldAuthenticateWithDevicePasswordForObject:v126])
      {
        objc_msgSend(v128, "setCountOfV2LockedNotes:", objc_msgSend(v128, "countOfV2LockedNotes") + 1);
        uint64_t v91 = [v126 account];
        BOOL v92 = [v91 resolvedLockedNotesMode] == 1;

        long long v81 = v126;
        if (v92) {
          objc_msgSend(v128, "setCountOfLockedNotesWithDivergedMode:", objc_msgSend(v128, "countOfLockedNotesWithDivergedMode") + 1);
        }
      }
    }
    if ([v81 isSharedViaICloud])
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:0];
      if (v82) {
        objc_msgSend(v128, "setCountOfCollaboratedScrapPapers:", objc_msgSend(v128, "countOfCollaboratedScrapPapers") + 1);
      }
    }
    v93 = [v81 outlineState];
    v94 = [v93 collapsedUUIDs];
    BOOL v95 = [v94 count] == 0;

    if (!v95) {
      objc_msgSend(v128, "setCountOfNotesWithCollapsedSections:", objc_msgSend(v128, "countOfNotesWithCollapsedSections") + 1);
    }
    if (*((unsigned char *)v152 + 24)) {
      objc_msgSend(v128, "setCountOfNotesWithChecklists:", objc_msgSend(v128, "countOfNotesWithChecklists") + 1);
    }
    if (v114 | v117)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:1];
      objc_msgSend(v128, "setCountOfNotesWithDocScan:", objc_msgSend(v128, "countOfNotesWithDocScan") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithDocScan:", objc_msgSend(v128, "countOfScrapPapersWithDocScan") + 1);
      }
    }
    if (v123)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:2];
      objc_msgSend(v128, "setCountOfNotesWithInlineDrawingV1:", objc_msgSend(v128, "countOfNotesWithInlineDrawingV1") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithInlineDrawingV1:", objc_msgSend(v128, "countOfScrapPapersWithInlineDrawingV1") + 1);
      }
    }
    if (v122)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:3];
      objc_msgSend(v128, "setCountOfNotesWithInlineDrawingV2:", objc_msgSend(v128, "countOfNotesWithInlineDrawingV2") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithInlineDrawingV2:", objc_msgSend(v128, "countOfScrapPapersWithInlineDrawingV2") + 1);
      }
    }
    if (v124)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:4];
      objc_msgSend(v128, "setCountOfNotesWithFullscreenDrawing:", objc_msgSend(v128, "countOfNotesWithFullscreenDrawing") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithFullscreenDrawing:", objc_msgSend(v128, "countOfScrapPapersWithFullscreenDrawing") + 1);
      }
    }
    if (v113)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:5];
      objc_msgSend(v128, "setCountOfNotesWithTable:", objc_msgSend(v128, "countOfNotesWithTable") + 1);
      objc_msgSend(v127, "setCountOfModernNotesWithTable:", objc_msgSend(v127, "countOfModernNotesWithTable") + 1);
      if (v82)
      {
        objc_msgSend(v128, "setCountOfScrapPapersWithTables:", objc_msgSend(v128, "countOfScrapPapersWithTables") + 1);
        objc_msgSend(v127, "setCountOfScrapPapersWithTables:", objc_msgSend(v127, "countOfScrapPapersWithTables") + 1);
      }
    }
    if (v108 - (v117 + v111) - (v114 + v109 + v123 + v122 + v124 + v113 + v121 + v120 + v119 + v112 + v118) >= 1)
    {
      [v128 updateNoteTwoFactorMatrixWithIndex:6];
      objc_msgSend(v128, "setCountOfNotesWithOtherAttachments:", objc_msgSend(v128, "countOfNotesWithOtherAttachments") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithOtherAttachments:", objc_msgSend(v128, "countOfScrapPapersWithOtherAttachments") + 1);
      }
    }
    if (v121)
    {
      objc_msgSend(v128, "setCountOfNotesWithRichURL:", objc_msgSend(v128, "countOfNotesWithRichURL") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithRichUrl:", objc_msgSend(v128, "countOfScrapPapersWithRichUrl") + 1);
      }
    }
    if (v120)
    {
      objc_msgSend(v128, "setCountOfNotesWithMapLink:", objc_msgSend(v128, "countOfNotesWithMapLink") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithMapLink:", objc_msgSend(v128, "countOfScrapPapersWithMapLink") + 1);
      }
    }
    if (v119)
    {
      objc_msgSend(v128, "setCountOfNotesWithPaperKit:", objc_msgSend(v128, "countOfNotesWithPaperKit") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithPaperKit:", objc_msgSend(v128, "countOfScrapPapersWithPaperKit") + 1);
      }
    }
    if (v112 || v118 || v117) {
      objc_msgSend(v128, "setCountOfNotesWithPaperDocument:", objc_msgSend(v128, "countOfNotesWithPaperDocument") + 1);
    }
    if (v111 | v118) {
      objc_msgSend(v128, "setCountOfNotesWithPDF:", objc_msgSend(v128, "countOfNotesWithPDF") + 1);
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasDeepLink])
    {
      objc_msgSend(v128, "setCountOfNotesWithDeepLink:", objc_msgSend(v128, "countOfNotesWithDeepLink") + 1);
      objc_msgSend(v127, "setCountOfModernNotesWithDeeplink:", objc_msgSend(v127, "countOfModernNotesWithDeeplink") + 1);
      if (v82)
      {
        objc_msgSend(v128, "setCountOfScrapPapersWithDeepLink:", objc_msgSend(v128, "countOfScrapPapersWithDeepLink") + 1);
        objc_msgSend(v127, "setCountOfScrapPapersWithDeepLink:", objc_msgSend(v127, "countOfScrapPapersWithDeepLink") + 1);
      }
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasSafariHighlight])
    {
      objc_msgSend(v127, "setCountOfModernNotesWithWebHighlights:", objc_msgSend(v127, "countOfModernNotesWithWebHighlights") + 1);
      if (v82) {
        objc_msgSend(v127, "setCountOfScrapPapersWithWebHighlights:", objc_msgSend(v127, "countOfScrapPapersWithWebHighlights") + 1);
      }
    }
    if (v122 + v123 + v119 != -v124)
    {
      objc_msgSend(v127, "setCountOfModernNotesWithDrawing:", objc_msgSend(v127, "countOfModernNotesWithDrawing") + 1);
      if (v82) {
        objc_msgSend(v127, "setCountOfScrapPapersWithDrawing:", objc_msgSend(v127, "countOfScrapPapersWithDrawing") + 1);
      }
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasImages])
    {
      objc_msgSend(v127, "setCountOfModernNotesWithImage:", objc_msgSend(v127, "countOfModernNotesWithImage") + 1);
      if (v82) {
        objc_msgSend(v127, "setCountOfScrapPapersWithImage:", objc_msgSend(v127, "countOfScrapPapersWithImage") + 1);
      }
    }
    if (v120 != -v121)
    {
      objc_msgSend(v127, "setCountOfModernNotesWithLinks:", objc_msgSend(v127, "countOfModernNotesWithLinks") + 1);
      if (v82) {
        objc_msgSend(v127, "setCountOfScrapPapersWithLinks:", objc_msgSend(v127, "countOfScrapPapersWithLinks") + 1);
      }
    }
    if ([(_ICNAAttachmentReportToNote *)v26 countOfAudioAttachments]) {
      objc_msgSend(v128, "setCountOfNotesWithAttachmentAudio:", objc_msgSend(v128, "countOfNotesWithAttachmentAudio") + 1);
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasAudioTranscript]) {
      objc_msgSend(v128, "setCountOfNotesWithAttachmentAudioTranscript:", objc_msgSend(v128, "countOfNotesWithAttachmentAudioTranscript") + 1);
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasAudioSummary]) {
      objc_msgSend(v128, "setCountOfNotesWithAttachmentAudioSummary:", objc_msgSend(v128, "countOfNotesWithAttachmentAudioSummary") + 1);
    }
    objc_msgSend(v128, "setCountOfAudioAttachments:", objc_msgSend(v128, "countOfAudioAttachments")+ -[_ICNAAttachmentReportToNote countOfAudioAttachments](v26, "countOfAudioAttachments"));
    objc_msgSend(v128, "setCountOfAudioAttachmentsRecordedInNotes:", objc_msgSend(v128, "countOfAudioAttachmentsRecordedInNotes")+ -[_ICNAAttachmentReportToNote countOfAudioAttachmentsRecordedInNotes](v26, "countOfAudioAttachmentsRecordedInNotes"));
    objc_msgSend(v128, "setCountOfAudioAttachmentsWithAppendedAudio:", objc_msgSend(v128, "countOfAudioAttachmentsWithAppendedAudio")+ -[_ICNAAttachmentReportToNote countOfAudioAttachmentsWithAppendedAudio](v26, "countOfAudioAttachmentsWithAppendedAudio"));
    v96 = [(id)objc_opt_class() inlineAttachmentReportForModernNote:v126 faultOutInlineAttachmentsAfterDone:1];
    uint64_t v143 = 0;
    long long v144 = &v143;
    uint64_t v145 = 0x2020000000;
    char v146 = 0;
    uint64_t v130 = 0;
    v131 = &v130;
    uint64_t v132 = 0x2020000000;
    char v133 = 0;
    if ([v96 countOfTags])
    {
      objc_msgSend(v128, "setCountOfNotesWithTags:", objc_msgSend(v128, "countOfNotesWithTags") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithTags:", objc_msgSend(v128, "countOfScrapPapersWithTags") + 1);
      }
      v97 = [(ICNASnapshotReporter *)self accountHistogramManager];
      v98 = [v97 tagCountPerNoteHistogram];
      objc_msgSend(v98, "reportValue:", (double)(unint64_t)objc_msgSend(v96, "countOfTags"));

      v99 = [(ICNASnapshotReporter *)self accountHistogramManager];
      v100 = [v99 distinctTagCountPerNoteHistogram];
      objc_msgSend(v100, "reportValue:", (double)(unint64_t)objc_msgSend(v96, "countOfDistinctTags"));
    }
    if ([v96 countOfMentions])
    {
      objc_msgSend(v128, "setCountOfNotesWithMentions:", objc_msgSend(v128, "countOfNotesWithMentions") + 1);
      if (v82) {
        objc_msgSend(v128, "setCountOfScrapPapersWithMentions:", objc_msgSend(v128, "countOfScrapPapersWithMentions") + 1);
      }
      id v101 = [(ICNASnapshotReporter *)self accountHistogramManager];
      v102 = [v101 mentionCountPerNoteHistogram];
      objc_msgSend(v102, "reportValue:", (double)(unint64_t)objc_msgSend(v96, "countOfMentions"));

      v103 = [(ICNASnapshotReporter *)self accountHistogramManager];
      v104 = [v103 distinctMentionCountPerNoteHistogram];
      objc_msgSend(v104, "reportValue:", (double)(unint64_t)objc_msgSend(v96, "countOfDistinctMentions"));
    }
    if ([v96 countOfNoteLinks]) {
      *((unsigned char *)v144 + 24) = 1;
    }
    if ([v96 countOfFolderLinks]) {
      *((unsigned char *)v131 + 24) = 1;
    }
    if ([v96 countOfCalculateResults] || objc_msgSend(v96, "countOfCalculateGraphExpressions")) {
      [(_ICNAAttachmentReportToNote *)v26 setHasMathUsage:1];
    }
    if (v125)
    {
      uint64_t v105 = objc_msgSend(v125, "ic_range");
      uint64_t v106 = *MEMORY[0x1E4F42530];
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke_2;
      v129[3] = &unk_1E64B8CD0;
      v129[4] = self;
      v129[5] = &v143;
      v129[6] = &v130;
      objc_msgSend(v125, "enumerateAttribute:inRange:options:usingBlock:", v106, v105, v107, 0, v129);
    }
    if (*((unsigned char *)v144 + 24)) {
      objc_msgSend(v128, "setCountOfNotesWithNoteLink:", objc_msgSend(v128, "countOfNotesWithNoteLink") + 1);
    }
    if (*((unsigned char *)v131 + 24)) {
      objc_msgSend(v128, "setCountOfNotesWithFolderLink:", objc_msgSend(v128, "countOfNotesWithFolderLink") + 1);
    }
    if ([(_ICNAAttachmentReportToNote *)v26 hasMathUsage]) {
      objc_msgSend(v128, "setCountOfNotesWithMathUsage:", objc_msgSend(v128, "countOfNotesWithMathUsage") + 1);
    }
    if (v82) {
      objc_msgSend(v128, "setScrapPaperCount:", objc_msgSend(v128, "scrapPaperCount") + 1);
    }
    [v128 completeTwoFactorMatrixReportingForCurrentNote];
    [(id)objc_opt_class() faultOutObject:v126];
    _Block_object_dispose(&v130, 8);
    _Block_object_dispose(&v143, 8);

    _Block_object_dispose(&v147, 8);
    _Block_object_dispose(&v151, 8);
  }
}

void __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  if ([v6 style] == 103)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(unsigned char *)(v3 + 24))
    {
      *(unsigned char *)(v3 + 24) = 1;
      [*(id *)(a1 + 32) updateNoteTwoFactorMatrixWithIndex:7];
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v4 + 24))
    {
      *(unsigned char *)(v4 + 24) = 1;
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v5 + 24)) {
      *(unsigned char *)(v5 + 24) = 0;
    }
  }
}

void __116__ICNASnapshotReporter_snapshotModernNote_reportedDataToAccount_reportToDevice_reportedDataFromAttachmentToAccount___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = 0;
      goto LABEL_16;
    }
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  }
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v9 = [*(id *)(a1 + 32) linkContentTypeEnumForURL:v7];
  if (v9 == 2)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    goto LABEL_11;
  }
  if (v9 == 1)
  {
    uint64_t v10 = *(void *)(a1 + 40);
LABEL_11:
    *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && a5
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
LABEL_16:
}

- (void)snapshotHTMLNote:(id)a3 reportedDataToAccount:(id)a4 reportedDataToDevice:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v7, "setCountOfNotes:", objc_msgSend(v7, "countOfNotes") + 1);
  unint64_t v13 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
  uint64_t v9 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
  [v7 updateNoteCollaborationMatrixWithCollaborationStatus:v13 collaborationType:v9];

  uint64_t v10 = [(ICNASnapshotReporter *)self accountHistogramManager];
  id v11 = [v10 noteCharCountHistogram];
  id v12 = [v8 contentAsPlainText];
  objc_msgSend(v11, "reportValue:", (double)(unint64_t)objc_msgSend(v12, "length"));

  [(id)objc_opt_class() faultOutObject:v8];
}

- (void)snapshotAttachment:(id)a3 reportedDataToNote:(id)a4 reportedDataToAccount:(id)a5
{
  id v65 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[ICNAEventReporter analyticsTypeUTIAttachment:v65];
  if ([v65 isUnsupported]) {
    goto LABEL_38;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F83058]])
  {
    unint64_t v11 = [(ICNASnapshotReporter *)self pageCountForDocScanAttachment:v65];
    id v12 = [(ICNASnapshotReporter *)self accountHistogramManager];
    unint64_t v13 = [v12 docScanPageCountHistogram];
    [v13 reportValue:(double)v11];
LABEL_6:

    goto LABEL_7;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F83098]])
  {
    id v12 = [(ICNASnapshotReporter *)self tableSnapshotItemDataForTableAttachment:v65];
    unint64_t v14 = [v12 tableRowCount];
    unint64_t v15 = [v14 unsignedIntegerValue];

    id v16 = [v12 tableColumnCount];
    unint64_t v17 = [v16 unsignedIntegerValue];

    id v18 = [(ICNASnapshotReporter *)self accountHistogramManager];
    id v19 = [v18 tableRowCountHistogram];
    [v19 reportValue:(double)v15];

    uint64_t v20 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v21 = [v20 tableColumnCountHistogram];
    [v21 reportValue:(double)v17];

    unint64_t v13 = [(ICNASnapshotReporter *)self accountHistogramManager];
    unint64_t v22 = [v13 tableCellCountHistogram];
    [v22 reportValue:(double)(v17 * v15)];

    goto LABEL_6;
  }
LABEL_7:
  uint64_t v23 = *MEMORY[0x1E4F83068];
  if (([v10 isEqualToString:*MEMORY[0x1E4F83068]] & 1) == 0
    && ([v10 isEqualToString:*MEMORY[0x1E4F83060]] & 1) == 0
    && ![v10 isEqualToString:*MEMORY[0x1E4F83050]])
  {
    goto LABEL_17;
  }
  uint64_t v24 = [(ICNASnapshotReporter *)self drawingSnapshotItemDataForDrawingAttachment:v65];
  [v8 reportDrawingWithSnapshotData:v24];
  if ([v10 isEqualToString:v23])
  {
    uint64_t v25 = [v24 countOfInlineDrawingV1FingerStrokes];
    unint64_t v26 = [v25 unsignedIntegerValue];

    double v27 = [v24 countOfInlineDrawingV1PencilStrokes];
    unint64_t v28 = [v27 unsignedIntegerValue];

    uint64_t v29 = [(ICNASnapshotReporter *)self accountHistogramManager];
    unint64_t v30 = [v29 inlineDrawingV1TotalStrokeCountHistogram];
    double v31 = (double)(v28 + v26);
    [v30 reportValue:v31];

    v32 = [(ICNASnapshotReporter *)self accountHistogramManager];
    uint64_t v33 = [v32 inlineDrawingV1PencilStrokeCountHistogram];
    [v33 reportValue:(double)v28];

    BOOL v34 = [(ICNASnapshotReporter *)self accountHistogramManager];
    id v35 = [v34 inlineDrawingV1FingerStrokeCountHistogram];
    double v36 = (double)v26;
    [v35 reportValue:(double)v26];

    long long v37 = [(ICNASnapshotReporter *)self accountHistogramManager];
    long long v38 = [v37 inlineDrawingV1FingerStrokeRatioHistogram];
LABEL_14:
    v49 = v38;
    double v50 = v36 / v31;
    goto LABEL_15;
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F83060]])
  {
    long long v39 = [v24 countOfInlineDrawingV2FingerStrokes];
    unint64_t v40 = [v39 unsignedIntegerValue];

    uint64_t v41 = [v24 countOfInlineDrawingV2PencilStrokes];
    unint64_t v42 = [v41 unsignedIntegerValue];

    unint64_t v43 = [(ICNASnapshotReporter *)self accountHistogramManager];
    v44 = [v43 inlineDrawingV2TotalStrokeCountHistogram];
    double v31 = (double)(v42 + v40);
    [v44 reportValue:v31];

    uint64_t v45 = [(ICNASnapshotReporter *)self accountHistogramManager];
    double v46 = [v45 inlineDrawingV2PencilStrokeCountHistogram];
    [v46 reportValue:(double)v42];

    uint64_t v47 = [(ICNASnapshotReporter *)self accountHistogramManager];
    v48 = [v47 inlineDrawingV2FingerStrokeCountHistogram];
    double v36 = (double)v40;
    [v48 reportValue:(double)v40];

    long long v37 = [(ICNASnapshotReporter *)self accountHistogramManager];
    long long v38 = [v37 inlineDrawingV2FingerStrokeRatioHistogram];
    goto LABEL_14;
  }
  if (![v10 isEqualToString:*MEMORY[0x1E4F83050]]) {
    goto LABEL_16;
  }
  uint64_t v63 = [v24 countOfFullscreenDrawingStrokes];
  unint64_t v64 = [v63 unsignedIntegerValue];

  long long v37 = [(ICNASnapshotReporter *)self accountHistogramManager];
  long long v38 = [v37 fullscreenDrawingStrokeCountHistogram];
  v49 = v38;
  double v50 = (double)v64;
LABEL_15:
  [v38 reportValue:v50];

LABEL_16:
LABEL_17:
  v51 = [v65 synapseData];

  if (v51)
  {
    [v8 setHasDeepLink:1];
    if ([(id)objc_opt_class() attachmentHasDeepLinkSafariHighlight:v65]) {
      [v8 setHasSafariHighlight:1];
    }
  }
  if ([v65 attachmentType] == 3) {
    [v8 setHasImages:1];
  }
  if ([v65 attachmentType] == 13)
  {
    objc_opt_class();
    v52 = [v65 attachmentModel];
    v53 = ICDynamicCast();

    if ([v53 paperHasMath]) {
      [v8 setHasMathUsage:1];
    }
  }
  if ([v65 attachmentType] == 4)
  {
    v54 = [v65 parentAttachment];

    if (!v54)
    {
      objc_msgSend(v8, "setCountOfAudioAttachments:", objc_msgSend(v8, "countOfAudioAttachments") + 1);
      v55 = [v65 audioModel];
      v56 = [v55 audioDocument];
      if ([v55 recordedInNotes]) {
        objc_msgSend(v8, "setCountOfAudioAttachmentsRecordedInNotes:", objc_msgSend(v8, "countOfAudioAttachmentsRecordedInNotes") + 1);
      }
      v57 = [v56 transcriptAsPlainText];
      uint64_t v58 = [v57 length];

      if (v58) {
        [v8 setHasAudioTranscript:1];
      }
      v59 = [v56 recordingSummaryAsPlainText];
      uint64_t v60 = [v59 length];

      if (v60) {
        [v8 setHasAudioSummary:1];
      }
      uint64_t v61 = [v56 orderedFragmentUUIDs];
      unint64_t v62 = [v61 count];

      if (v62 >= 2) {
        objc_msgSend(v8, "setCountOfAudioAttachmentsWithAppendedAudio:", objc_msgSend(v8, "countOfAudioAttachmentsWithAppendedAudio") + 1);
      }
    }
  }
  [v8 reportAttachmentTypeUTI:v10];
  [v9 reportAttachmentTypeUTI:v10];
LABEL_38:
  [(id)objc_opt_class() faultOutObject:v65];
}

- (id)deviceSnapshotSummaryForDataType:(Class)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[ICNAIdentityManager sharedManager];
  uint64_t v5 = +[ICNAController deviceID];
  id v19 = [v4 saltedID:v5 forClass:a3];

  id v6 = [ICASDeviceSnapshotItemData alloc];
  unint64_t v15 = +[ICNAController deviceModel];
  id v7 = +[ICNAController devicePlatform];
  id v18 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController bioAuthEnabled](ICNAController, "bioAuthEnabled"));
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController localNotesEnabled](ICNAController, "localNotesEnabled"));
  id v16 = +[ICNAController osVersion];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController audioTranscriptEnabled](ICNAController, "audioTranscriptEnabled"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController audioSummaryEnabled](ICNAController, "audioSummaryEnabled"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController mathTextEnabled](ICNAController, "mathTextEnabled"));
  unint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController mathHandwritingEnabled](ICNAController, "mathHandwritingEnabled"));
  id v12 = [(ICASDeviceSnapshotItemData *)v6 initWithDeviceModel:v15 devicePlatform:v7 bioAuthEnabled:v18 localNotesEnabled:v17 osVersion:v16 deviceID:v19 audioTranscriptEnabled:v8 audioSummaryEnabled:v9 mathTextEnabled:v10 mathHandwritingEnabled:v11];

  v20[0] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v13;
}

- (id)userSnapshotSummaryForDataType:(Class)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[ICNAIdentityManager sharedManager];
  uint64_t v5 = +[ICNAController userID];
  id v6 = [v4 saltedID:v5 forClass:a3];

  id v7 = [ICASUserSnapshotItemData alloc];
  id v8 = +[ICNAController storeFrontID];
  id v9 = [(ICASUserSnapshotItemData *)v7 initWithUserID:v6 userStorefrontID:v8];

  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (unint64_t)pageCountForDocScanAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 attachmentModel];

  uint64_t v5 = ICDynamicCast();

  unint64_t v6 = [v5 subAttachmentCount];
  return v6;
}

- (id)drawingSnapshotItemDataForDrawingAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICNAEventReporter analyticsTypeUTIAttachment:v4];
  uint64_t v6 = *MEMORY[0x1E4F83068];
  if (([v5 isEqualToString:*MEMORY[0x1E4F83068]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x1E4F83060]])
  {
    id v7 = [v4 attachmentModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [v8 handwritingRecognitionDrawing];
      uint64_t v10 = v9;
      if (v9) {
        id v11 = v9;
      }
      else {
        id v11 = (id)[v8 newDrawingFromMergeableData];
      }
      id v12 = v11;

      unint64_t v18 = [(ICNAEventReporter *)self pencilStrokeCountForDrawing:v12];
      id v19 = [v12 strokes];
      unint64_t v16 = [v19 count] - v18;

      int v20 = [v5 isEqualToString:v6];
      uint64_t v13 = 0;
      if (v20) {
        unint64_t v14 = 0;
      }
      else {
        unint64_t v14 = v16;
      }
      if (v20) {
        unint64_t v15 = 0;
      }
      else {
        unint64_t v15 = v18;
      }
      if (v20)
      {
        unint64_t v17 = v18;
      }
      else
      {
        unint64_t v16 = 0;
        unint64_t v17 = 0;
      }
      id v7 = v8;
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F83050]])
  {
    id v7 = [v4 attachmentModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 drawing];
      id v12 = [v8 commands];
      uint64_t v13 = [v12 count];
      unint64_t v14 = 0;
      unint64_t v15 = 0;
      unint64_t v16 = 0;
      unint64_t v17 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_9:
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
LABEL_23:
  uint64_t v21 = [ICASDrawingSnapshotItemData alloc];
  unint64_t v22 = [NSNumber numberWithUnsignedInteger:v17];
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v16];
  uint64_t v24 = [NSNumber numberWithUnsignedInteger:v15];
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:v14];
  unint64_t v26 = [NSNumber numberWithUnsignedInteger:v13];
  double v27 = [(ICASDrawingSnapshotItemData *)v21 initWithCountOfInlineDrawingV1PencilStrokes:v22 countOfInlineDrawingV1FingerStrokes:v23 countOfInlineDrawingV2PencilStrokes:v24 countOfInlineDrawingV2FingerStrokes:v25 countOfFullscreenDrawingStrokes:v26];

  return v27;
}

- (id)tableSnapshotItemDataForTableAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 attachmentModel];

  uint64_t v5 = ICDynamicCast();

  uint64_t v6 = [v5 table];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 rowCount];
    uint64_t v9 = [v7 columnCount];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = [ICASTableSnapshotItemData alloc];
  id v11 = [NSNumber numberWithInteger:v8];
  id v12 = [NSNumber numberWithInteger:v9];
  uint64_t v13 = [(ICASTableSnapshotItemData *)v10 initWithTableRowCount:v11 tableColumnCount:v12];

  return v13;
}

- (id)snapshotItemDataForModernAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self accountTypeForModernAccount:v4];
  uint64_t v6 = [(ICNASnapshotReporter *)self accountPurposeForModernAccount:v4];
  id v7 = +[ICNAIdentityManager sharedManager];
  uint64_t v8 = [v4 identifier];

  uint64_t v9 = [v7 saltedID:v8 forClass:objc_opt_class()];

  uint64_t v10 = [[ICASAccountSnapshotItemData alloc] initWithAccountID:v9 accountType:v5 accountPurpose:v6];
  return v10;
}

- (id)snapshotItemDataForHTMLAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self accountTypeForHTMLAccount:v4];
  uint64_t v6 = [(ICNASnapshotReporter *)self accountPurposeForHTMLAccount];
  id v7 = +[ICNAIdentityManager sharedManager];
  uint64_t v8 = [v4 accountIdentifier];

  uint64_t v9 = [v7 saltedID:v8 forClass:objc_opt_class()];

  uint64_t v10 = [[ICASAccountSnapshotItemData alloc] initWithAccountID:v9 accountType:v5 accountPurpose:v6];
  return v10;
}

- (id)accountPurposeForModernAccount:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v5 = [v4 currentUser];

  if ([v5 userType] == 1)
  {
    v11[3] = 3;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__ICNASnapshotReporter_accountPurposeForModernAccount___block_invoke;
    v9[3] = &unk_1E64B8CF8;
    v9[4] = &v10;
    [v3 performBlockInPersonaContext:v9];
  }
  uint64_t v6 = [ICASAccountPurpose alloc];
  id v7 = [(ICASAccountPurpose *)v6 initWithAccountPurpose:v11[3]];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __55__ICNASnapshotReporter_accountPurposeForModernAccount___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentPersona];
  int v4 = [v3 isEnterprisePersona];

  uint64_t v5 = 1;
  if (v4) {
    uint64_t v5 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

- (id)accountPurposeForHTMLAccount
{
  id v2 = [[ICASAccountPurpose alloc] initWithAccountPurpose:1];
  return v2;
}

- (id)backgroundAppRefreshData
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2050000000;
  int v4 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v22 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getMCProfileConnectionClass_block_invoke;
    v18[3] = &unk_1E64B8CF8;
    v18[4] = &v19;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v18);
    int v4 = (void *)v20[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v19, 8);
  uint64_t v6 = [v5 sharedConnection];
  int v7 = [v6 isAutomaticAppUpdatesAllowed];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mt"];
  uint64_t v9 = [v8 objectForKey:@"KeepAppsUpToDateAppList"];
  uint64_t v10 = ICNotesAppBundleIdentifier();
  id v11 = [v9 objectForKey:v10];

  if (v11) {
    int v12 = [v11 BOOLValue];
  }
  else {
    int v12 = 1;
  }
  if (v3) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v7 & v12;
  }
  unint64_t v14 = [ICASBackgroundAppRefreshData alloc];
  unint64_t v15 = [NSNumber numberWithBool:v13];
  unint64_t v16 = [(ICASBackgroundAppRefreshData *)v14 initWithAutomaticAppUpdatesAllowed:v15];

  return v16;
}

- (void)performBlockForHTMLManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNASnapshotReporter *)self htmlContext];
  uint64_t v6 = [v5 managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ICNASnapshotReporter_performBlockForHTMLManagedObjectContext___block_invoke;
  v8[3] = &unk_1E64B8D20;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __64__ICNASnapshotReporter_performBlockForHTMLManagedObjectContext___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C877EAC0]();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) htmlContext];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)performBlockForModernManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNASnapshotReporter *)self modernContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__ICNASnapshotReporter_performBlockForModernManagedObjectContext___block_invoke;
  v7[3] = &unk_1E64B8D20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __66__ICNASnapshotReporter_performBlockForModernManagedObjectContext___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1C877EAC0]();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) modernContext];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (double)timeStampOfDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  return floor(v3 / 60.0) * 60.0;
}

- (id)lastSnapshotScheduleTimeStamp
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  double v3 = [v2 objectForKey:@"analytics_last_snapshot_timestamp"];

  if (!v3)
  {
    double v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    [v4 setObject:v3 forKey:@"analytics_last_snapshot_timestamp"];
  }
  return v3;
}

- (id)lastSnapshotRunningTimeStamp
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  double v3 = [v2 objectForKey:@"analytics_last_snapshot_running_timestamp"];

  if (!v3)
  {
    double v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    id v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    [v4 setObject:v3 forKey:@"analytics_last_snapshot_running_timestamp"];
  }
  return v3;
}

- (BOOL)shouldRunSnapshotManually
{
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"forbid_analytics_snapshot"];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(ICNASnapshotReporter *)self lastSnapshotRunningTimeStamp];
  [v5 timeIntervalSinceDate:v6];
  BOOL v8 = v7 > 1814400.0;

  return v8 & ~v4;
}

- (BOOL)shouldScheduleSnapshot
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"forbid_analytics_snapshot"];

  return v3 ^ 1;
}

- (BOOL)shouldSnapshot
{
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"forbid_analytics_snapshot"];

  if (v4) {
    return 0;
  }
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v7 = [v6 BOOLForKey:@"allow_analytics_snapshot_every_launch"];

  if (v7) {
    return 1;
  }
  BOOL v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(ICNASnapshotReporter *)self lastSnapshotRunningTimeStamp];
  [v8 timeIntervalSinceDate:v9];
  BOOL v5 = v10 > 604800.0;

  return v5;
}

- (id)sortedFoldersForAccount:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  BOOL v5 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = ICLegacyEntityNameFolder();
  char v7 = [v3 managedObjectContext];
  BOOL v8 = [v5 entityForName:v6 inManagedObjectContext:v7];
  [v4 setEntity:v8];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(account == %@)", v3];
  [v4 setPredicate:v9];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"externalIdentifier" ascending:1];
  v18[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 setSortDescriptors:v11];

  int v12 = [v3 managedObjectContext];
  id v17 = 0;
  uint64_t v13 = [v12 executeFetchRequest:v4 error:&v17];
  id v14 = v17;

  if (v14)
  {
    unint64_t v15 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ICNASnapshotReporter sortedFoldersForAccount:]((uint64_t)v3, v15);
    }
  }
  return v13;
}

- (void)beginMiniSnapshotBackgroundTask
{
  id v3 = +[ICNAController sharedController];
  id v4 = [v3 appDelegate];

  if (v4)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v5, &location);
    performBlockOnMainThreadAndWait();
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained miniSnapshotBackgroundTaskIdentifier];
    objc_sync_enter(v3);
    id v4 = +[ICNAController sharedController];
    id v5 = [v4 appDelegate];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2;
    v8[3] = &unk_1E64B8A48;
    v8[4] = v2;
    uint64_t v6 = [v5 beginBackgroundTaskWithName:@"Analytics mini snapshot" expirationHandler:v8];

    char v7 = [NSNumber numberWithUnsignedInteger:v6];
    [v2 setMiniSnapshotBackgroundTaskIdentifier:v7];

    objc_sync_exit(v3);
  }
}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) killMiniSnapshotBackgroundTaskIfNecessary])
  {
    uint64_t v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2_cold_1();
    }
  }
}

- (BOOL)killMiniSnapshotBackgroundTaskIfNecessary
{
  id v3 = +[ICNAController sharedController];
  id v4 = [v3 appDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(ICNASnapshotReporter *)self miniSnapshotBackgroundTaskIdentifier];
  objc_sync_enter(v5);
  uint64_t v6 = [(ICNASnapshotReporter *)self miniSnapshotBackgroundTaskIdentifier];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = *MEMORY[0x1E4F43740];
  id v9 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F43740]];
  [(ICNASnapshotReporter *)self setMiniSnapshotBackgroundTaskIdentifier:v9];

  objc_sync_exit(v5);
  if (v7 == v8) {
    return 0;
  }
  id v11 = +[ICNAController sharedController];
  int v12 = [v11 appDelegate];
  [v12 endBackgroundTask:v7];

  return 1;
}

- (ICNAHistogramManager)accountHistogramManager
{
  return self->_accountHistogramManager;
}

- (void)setAccountHistogramManager:(id)a3
{
}

- (BOOL)isPerformingSnapshot
{
  return self->_isPerformingSnapshot;
}

- (void)setIsPerformingSnapshot:(BOOL)a3
{
  self->_isPerformingSnapshot = a3;
}

- (ICLegacyContext)htmlContext
{
  return self->_htmlContext;
}

- (void)setHtmlContext:(id)a3
{
}

- (NSManagedObjectContext)modernContext
{
  return self->_modernContext;
}

- (void)setModernContext:(id)a3
{
}

- (NSNumber)miniSnapshotBackgroundTaskIdentifier
{
  return self->_miniSnapshotBackgroundTaskIdentifier;
}

- (void)setMiniSnapshotBackgroundTaskIdentifier:(id)a3
{
}

- (int64_t)contextHolderCount
{
  return self->_contextHolderCount;
}

- (void)setContextHolderCount:(int64_t)a3
{
  self->_contextHolderCount = a3;
}

void __51__ICNASnapshotReporter_scheduleSnapshotIfNecessary__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_ERROR, "Error scheduling snapshot: %@", (uint8_t *)&v2, 0xCu);
}

- (void)reallyPerformSnapshotWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Running snapshot instrumentation", v2, v3, v4, v5, v6);
}

- (void)sortedFoldersForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3EAD000, a2, OS_LOG_TYPE_ERROR, "Error getting sorted folders for account %@", (uint8_t *)&v2, 0xCu);
}

void __55__ICNASnapshotReporter_beginMiniSnapshotBackgroundTask__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C3EAD000, v0, OS_LOG_TYPE_ERROR, "Background task expired before mini snapshot completed.", v1, 2u);
}

@end