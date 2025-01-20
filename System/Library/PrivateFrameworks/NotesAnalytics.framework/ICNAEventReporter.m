@interface ICNAEventReporter
+ (BOOL)activityTypeHasUnknownShareFlow:(id)a3;
+ (BOOL)attachmentHasDeepLinkSafariHighlight:(id)a3;
+ (id)analyticsTypeUTIAttachment:(id)a3;
+ (id)filteredActivityType:(id)a3;
+ (id)inlineAttachmentReportForModernNote:(id)a3 faultOutInlineAttachmentsAfterDone:(BOOL)a4;
+ (id)maskString:(id)a3 withoutPrefix:(id)a4 withMask:(id)a5;
+ (void)faultOutObject:(id)a3;
+ (void)resetNoteCreateApproachEnumInAppSuiteDefaults;
+ (void)setNoteCreateApproachEnumToAppSuiteDefaults:(int64_t)a3;
- (ICNAEventReporter)initWithSubTrackerName:(id)a3;
- (ICNAEventReporter)initWithSubTrackerName:(id)a3 view:(id)a4;
- (ICNAEventReporter)initWithSubTrackerName:(id)a3 window:(id)a4;
- (ICNAEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4;
- (ICNASubTracker)subTracker;
- (NSMutableDictionary)pendingInlineDrawingInformation;
- (NSMutableSet)timedDataTrackingSet;
- (UIWindowScene)windowScene;
- (id)accountDataForHTMLAccount:(id)a3;
- (id)accountDataForModernAccount:(id)a3;
- (id)accountTypeForHTMLAccount:(id)a3;
- (id)accountTypeForModernAccount:(id)a3;
- (id)audioAttachmentDataForModernAttachment:(id)a3;
- (id)audioRecordingDataForModernAttachment:(id)a3 appBackgroundOccurred:(BOOL)a4 noteMultitaskingOccurred:(BOOL)a5;
- (id)audioTranscriptInteractionDataWithSummaryViewed:(BOOL)a3 transcriptViewed:(BOOL)a4 interactionTargets:(id)a5 interactionTypes:(id)a6;
- (id)bioAuthDataForModernNote:(id)a3;
- (id)collaborationActionDataIsInviting:(BOOL)a3 inviteStep:(int64_t)a4;
- (id)collaborationStatusForModernObject:(id)a3;
- (id)collaborationTypeForModernObject:(id)a3;
- (id)folderContentDataForNoteCollection:(id)a3;
- (id)folderContentDataForNoteContainer:(id)a3;
- (id)folderContentDataForVirtualFolder:(id)a3 context:(id)a4;
- (id)folderDataForHTMLCollection:(id)a3;
- (id)folderDataForHTMLFolder:(id)a3;
- (id)folderDataForModernAccountProxy:(id)a3;
- (id)folderDataForModernFolder:(id)a3;
- (id)folderDataForVirtualFolder:(id)a3;
- (id)folderViewEventDataObjectsForNoteCollection:(id)a3 isInGridMode:(BOOL)a4;
- (id)folderViewEventDataObjectsForNoteContainer:(id)a3 isInGridMode:(BOOL)a4;
- (id)folderViewEventDataObjectsForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5;
- (id)initForAudioWithSubTrackerName:(id)a3;
- (id)layoutDataForIsInGridMode:(BOOL)a3 isTimelineView:(BOOL)a4;
- (id)noteAccessDataForHTMLNote;
- (id)noteAccessDataForModernNote:(id)a3;
- (id)noteCollapsibleSectionDataForHTMLNote:(id)a3;
- (id)noteContentDataForHTMLNote:(id)a3;
- (id)noteContentDataForModernNote:(id)a3;
- (id)noteCreateDataFromAppSuiteDefaults;
- (id)noteDataForHTMLNote:(id)a3;
- (id)noteDataForModernNote:(id)a3;
- (id)noteEditDataForContextType:(int64_t)a3;
- (id)noteEditorCallOutBarDataForButtonTypeValue:(int64_t)a3;
- (id)noteViewEventDataObjectsForHTMLNote:(id)a3;
- (id)noteViewEventDataObjectsForModernNote:(id)a3;
- (id)objectDataForCloudSyncingObject:(id)a3;
- (id)passwordDataForModernNote:(id)a3;
- (id)passwordModeDataForContextPath:(int64_t)a3 fromMode:(signed __int16)a4 toMode:(signed __int16)a5;
- (id)searchRankingExperimentItemDataWithStrategyTypeEnum:(int64_t)a3 rank:(unint64_t)a4;
- (id)searchSuggestionDataWithSearchSuggestionType:(unint64_t)a3;
- (id)selectedResultAccountTypeForSearchResult:(id)a3;
- (id)styleDataForStyleTypeValue:(int64_t)a3;
- (id)tipDataForFeature:(id)a3;
- (id)tipImpressionEventDataObjectsForFeature:(id)a3 andModernNote:(id)a4;
- (id)tipLearnMoreClickEventDataObjectsForFeature:(id)a3 learnMoreTipName:(id)a4;
- (int64_t)addApproachEnumForAddApproach:(int64_t)a3;
- (int64_t)linkContentTypeEnumForURL:(id)a3;
- (int64_t)weeksSinceDate:(id)a3;
- (unint64_t)pencilStrokeCountForDrawing:(id)a3;
- (void)aaSessionDidEnd:(id)a3;
- (void)dealloc;
- (void)flushAllTimedData:(id)a3;
- (void)popContextPathData;
- (void)popNoteCreateData;
- (void)popSearchData;
- (void)pushContextPathDataWithContextPathEnum:(int64_t)a3;
- (void)pushDocScanDataWithID:(id)a3 actionType:(int64_t)a4 stage:(int64_t)a5;
- (void)pushInlineDrawingDataForDrawing:(id)a3 drawingID:(id)a4 tool:(int64_t)a5;
- (void)pushNoteCreateDataWithCreateApproach:(int64_t)a3;
- (void)pushSearchDataWithSearchSessionID:(id)a3;
- (void)pushStartDocScanPageCountData:(unint64_t)a3;
- (void)pushStartTableDataWithStartColumns:(unint64_t)a3 startRows:(unint64_t)a4;
- (void)reallySubmitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5 queryLength:(unint64_t)a6 searchResultCountData:(id)a7 searchSuggestionData:(id)a8;
- (void)setPendingInlineDrawingInformation:(id)a3;
- (void)setSubTracker:(id)a3;
- (void)setTimedDataTrackingSet:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)startActivityStreamSummaryEventForObject:(id)a3;
- (void)startAttributionSideBarViewEventForNote:(id)a3;
- (void)startAudioRecordingEvent;
- (void)startFindInNoteEvent;
- (void)startFolderListViewEventDurationTracking;
- (void)startFolderViewEventDurationTrackingForNoteCollection:(id)a3 isInGridMode:(BOOL)a4;
- (void)startFolderViewEventDurationTrackingForNoteContainer:(id)a3 isInGridMode:(BOOL)a4;
- (void)startFolderViewEventDurationTrackingForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5;
- (void)startNoteViewEventDurationTrackingForHTMLNote:(id)a3;
- (void)startNoteViewEventDurationTrackingForModernNote:(id)a3 reportCoreAnalytics:(BOOL)a4;
- (void)startOnboardingScreenViewEventDurationTracking;
- (void)startTimedEventOfType:(Class)a3;
- (void)startTipImpressionEventDurationTrackingForFeature:(id)a3 andModernNote:(id)a4;
- (void)submitActivityStreamSummaryEventForObject:(id)a3 halfHeightViewDuration:(double)a4 fullHeightViewDuration:(double)a5 sideBarViewDuration:(double)a6 minimizedViewDuration:(double)a7;
- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6;
- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6 noteData:(id *)a7 noteContentData:(id *)a8 noteAccessData:(id *)a9;
- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5;
- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5 noteData:(id *)a6 noteContentData:(id *)a7 noteAccessData:(id *)a8;
- (void)submitAppReviewPromptRequestEvent;
- (void)submitAppSessionResignEvent;
- (void)submitAppSessionResumeEvent;
- (void)submitAttachmentAddEventForAttachment:(id)a3;
- (void)submitAttachmentBrowserActionEventForType:(int64_t)a3;
- (void)submitAttachmentBrowserTapEvent;
- (void)submitAttributionSideBarViewEventForNote:(id)a3 contextPath:(int64_t)a4 startState:(int64_t)a5 endState:(int64_t)a6;
- (void)submitAudioRecordingEventWithAttachment:(id)a3 appBackgroundOccurred:(BOOL)a4 noteMultitaksingOccurred:(BOOL)a5;
- (void)submitAudioTranscriptInteractionEventSummaryViewed:(BOOL)a3 transcriptViewed:(BOOL)a4 interactionTargets:(id)a5 interactionTypes:(id)a6 audioAttachment:(id)a7;
- (void)submitBiometricsFailEventForModernNote:(id)a3;
- (void)submitChangePasswordEventForModernAccount:(id)a3 isReset:(BOOL)a4;
- (void)submitChangePasswordModeEventForAccount:(id)a3 contextPath:(int64_t)a4 fromMode:(signed __int16)a5 toMode:(signed __int16)a6;
- (void)submitChecklistUsageEventForModernNote:(id)a3 countOfCheckedItems:(int64_t)a4 countOfTotalItems:(int64_t)a5 checklistActionType:(int64_t)a6;
- (void)submitCollabActivityBrowseEventForObject:(id)a3 contextPath:(int64_t)a4 clickContext:(int64_t)a5 mode:(int64_t)a6 isCurrentUserMentioned:(BOOL)a7 hasRecentUpdates:(BOOL)a8;
- (void)submitCollabNotificationEventWithAction:(int64_t)a3;
- (void)submitCollabSummaryEventForObject:(id)a3 withUpdates:(BOOL)a4;
- (void)submitCollaborationActionEventForCloudSyncingObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5 inviteStep:(int64_t)a6;
- (void)submitDocScanEventForNote:(id)a3 pageCount:(unint64_t)a4;
- (void)submitEverNoteImportEventWithCount:(unint64_t)a3 isSuccessful:(BOOL)a4 intoAccount:(id)a5;
- (void)submitFastSyncSessionEndForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7 errorCode:(id)a8 numIgnoredMessages:(id)a9;
- (void)submitFastSyncSessionStartForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7;
- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 htmlNote:(id)a4;
- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 modernNote:(id)a4;
- (void)submitFindInTranscriptEventWasSearchQueryEntered:(BOOL)a3 audioAttachment:(id)a4;
- (void)submitFolderCreateEventForModernFolder:(id)a3;
- (void)submitFolderCreateEventForModernFolder:(id)a3 creationApproach:(int64_t)a4 filterSelection:(id)a5;
- (void)submitFolderDeleteEventForModernFolder:(id)a3;
- (void)submitFolderListViewEvent;
- (void)submitFolderViewEventForNoteCollection:(id)a3 isInGridMode:(BOOL)a4;
- (void)submitFolderViewEventForNoteContainer:(id)a3 isInGridMode:(BOOL)a4;
- (void)submitFolderViewEventForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5;
- (void)submitFullscreenDrawingToInlineDrawingEventForNote:(id)a3 drawing:(id)a4 drawingID:(id)a5 method:(int64_t)a6;
- (void)submitHashtagAddEventForNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5;
- (void)submitHashtagDeleteEvent:(id)a3 approachEnum:(int64_t)a4;
- (void)submitHashtagRenameEvent:(id)a3 approachEnum:(int64_t)a4;
- (void)submitInlineDrawingDataForDrawingDeletion:(id)a3 drawingID:(id)a4 forNote:(id)a5;
- (void)submitLinkedNoteAcceleratorEndEvent:(id)a3 maxCharactersTyped:(unint64_t)a4 endResultCount:(unint64_t)a5;
- (void)submitLinkedNoteAcceleratorInitiateEvent:(id)a3;
- (void)submitMentionAddEventForNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6;
- (void)submitMentionDeleteEvent:(id)a3;
- (void)submitMoveCheckedItemsToBottomSwitchEventWithNewState:(BOOL)a3 isInApp:(BOOL)a4;
- (void)submitNoteActionMenuEventForNoteBrowserWithUsageType:(int64_t)a3 layout:(int64_t)a4 activityType:(id)a5 isTimelineView:(BOOL)a6;
- (void)submitNoteActionMenuEventForNoteEditorWithUsageType:(int64_t)a3 activityType:(id)a4;
- (void)submitNoteCreateEventForHTMLNote:(id)a3;
- (void)submitNoteCreateEventForHTMLNote:(id)a3 createApproach:(int64_t)a4;
- (void)submitNoteCreateEventForModernNote:(id)a3;
- (void)submitNoteCreateEventForModernNote:(id)a3 createApproach:(int64_t)a4;
- (void)submitNoteCreateEventForSearchIndexableNote:(id)a3 createApproach:(int64_t)a4;
- (void)submitNoteDeleteEventForHTMLNote:(id)a3;
- (void)submitNoteDeleteEventForModernNote:(id)a3;
- (void)submitNoteEditEventForHTMLNote:(id)a3;
- (void)submitNoteEditEventForModernNote:(id)a3 fromQuickNote:(BOOL)a4;
- (void)submitNoteEditorCallOutBarButtonSelectionEventForHTMLNote:(id)a3 buttonTypeValue:(int64_t)a4;
- (void)submitNoteEditorCallOutBarButtonSelectionEventForModernNote:(id)a3 buttonTypeValue:(int64_t)a4;
- (void)submitNotePinEventForModernNote:(id)a3 contextPath:(int64_t)a4;
- (void)submitNoteSharrowEventForHTMLNote:(id)a3 activityType:(id)a4 contextPath:(int64_t)a5;
- (void)submitNoteSharrowEventForModernNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11;
- (void)submitNoteViewEventForHTMLNote:(id)a3;
- (void)submitNoteViewEventForModernNote:(id)a3 referringNote:(id)a4 collapsibleSectionAffordanceExposures:(int64_t)a5 collapsibleSectionAffordanceUsages:(int64_t)a6;
- (void)submitNotesToPagesEventWithContextPath:(int64_t)a3;
- (void)submitOnboardingScreenViewEventWithType:(int64_t)a3;
- (void)submitPDFWorkflowEngagementSummary:(id)a3 modernNote:(id)a4;
- (void)submitPaletteEngagementEventForNote:(id)a3 startPosition:(int64_t)a4 endPosition:(int64_t)a5;
- (void)submitPasswordFailEventForModernNote:(id)a3;
- (void)submitPasswordProtectEventForModernNote:(id)a3;
- (void)submitPasswordSuccessEventForModernNote:(id)a3;
- (void)submitPendingInlineDrawingDataForNote:(id)a3;
- (void)submitSearchAttemptEvent;
- (void)submitSearchInitiateEventWithSearchSessionID:(id)a3 searchSuggestionType:(unint64_t)a4;
- (void)submitSearchResultExposureSummaryEventWithSearchResultExposureData:(id)a3 searchSessionID:(id)a4;
- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5;
- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 queryLength:(unint64_t)a5 topHitResultCount:(unint64_t)a6 noteResultCount:(unint64_t)a7 attachmentResultCount:(unint64_t)a8 gmRank:(unint64_t)a9;
- (void)submitSnapshotCompletionEventIsSuccessful:(BOOL)a3;
- (void)submitSnapshotRegisterEventIsSuccessful:(BOOL)a3;
- (void)submitSnapshotTriggeredEvent;
- (void)submitStyleFormatEventForHTMLNote:(id)a3 styleTypeValue:(int64_t)a4;
- (void)submitStyleFormatEventForModernNote:(id)a3 styleTypeValue:(int64_t)a4;
- (void)submitTableCreateEventForAttachment:(id)a3 inNote:(id)a4;
- (void)submitTableEditEventForNote:(id)a3 endColumns:(unint64_t)a4 endRows:(unint64_t)a5;
- (void)submitTableRemoveEventForAttachment:(id)a3 inNote:(id)a4;
- (void)submitTagBrowserSelectionEventWithSelectedTagCount:(unint64_t)a3 isAllTagsSelected:(BOOL)a4;
- (void)submitTimedEventOfTypeIfPossible:(Class)a3;
- (void)submitTipImpressionEventForFeature:(id)a3 andModernNote:(id)a4;
- (void)submitTipLearnMoreClickEventForFeature:(id)a3 learnMoreTipName:(id)a4;
@end

@implementation ICNAEventReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInlineDrawingInformation, 0);
  objc_storeStrong((id *)&self->_timedDataTrackingSet, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_subTrackerName, 0);
  objc_storeStrong((id *)&self->_subTracker, 0);
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNAEventReporter;
  v5 = [(ICNAOptedInObject *)&v13 init];
  if (v5)
  {
    v6 = [[ICNASubTracker alloc] initWithName:v4];
    subTracker = v5->_subTracker;
    v5->_subTracker = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    timedDataTrackingSet = v5->_timedDataTrackingSet;
    v5->_timedDataTrackingSet = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = +[ICNAController sharedController];
    [v10 addObserver:v5 selector:sel_flushAllTimedData_ name:@"ICNASessionFlushTimedDataNotification" object:v11];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNAEventReporter;
  [(ICNAEventReporter *)&v4 dealloc];
}

- (id)initForAudioWithSubTrackerName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICNAEventReporter;
  v5 = [(ICNAOptedInObject *)&v14 init];
  if (v5)
  {
    v6 = [ICNASubTracker alloc];
    v7 = +[ICNAController sharedController];
    v8 = [v7 aaTrackerForAudio];
    uint64_t v9 = [(ICNASubTracker *)v6 initWithName:v4 parentAATracker:v8];
    subTracker = v5->_subTracker;
    v5->_subTracker = (ICNASubTracker *)v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    timedDataTrackingSet = v5->_timedDataTrackingSet;
    v5->_timedDataTrackingSet = v11;
  }
  return v5;
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICNAEventReporter;
    uint64_t v9 = [(ICNAOptedInObject *)&v24 init];
    v10 = v9;
    if (v9)
    {
      objc_storeWeak((id *)&v9->_windowScene, v8);
      objc_storeStrong((id *)&v10->_subTrackerName, a3);
      v11 = [v8 session];
      v12 = [v11 persistentIdentifier];

      objc_super v13 = +[ICNAController sharedController];
      objc_super v14 = [v13 aaTrackerForWindowSceneIdentifier:v12];

      if (v14)
      {
        v15 = [[ICNASubTracker alloc] initWithName:v7 parentAATracker:v14];
        subTracker = v10->_subTracker;
        v10->_subTracker = v15;
      }
      v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      timedDataTrackingSet = v10->_timedDataTrackingSet;
      v10->_timedDataTrackingSet = v17;

      v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v19 addObserver:v10 selector:sel_flushAllTimedData_ name:@"ICNASessionFlushTimedDataNotification" object:0];

      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v20 addObserver:v10 selector:sel_aaSessionDidEnd_ name:@"ICNASessionDidEndNotification" object:0];
    }
    self = v10;
    v21 = self;
  }
  else
  {
    v22 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ICNAEventReporter initWithSubTrackerName:windowScene:]();
    }

    v21 = 0;
  }

  return v21;
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 window:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [a4 windowScene];
    self = [(ICNAEventReporter *)self initWithSubTrackerName:v6 windowScene:v7];

    id v8 = self;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICNAEventReporter initWithSubTrackerName:window:]();
    }

    id v8 = 0;
  }

  return v8;
}

- (ICNAEventReporter)initWithSubTrackerName:(id)a3 view:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [a4 window];
    id v8 = [v7 windowScene];
    self = [(ICNAEventReporter *)self initWithSubTrackerName:v6 windowScene:v8];

    uint64_t v9 = self;
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICNAEventReporter initWithSubTrackerName:view:]();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (ICNASubTracker)subTracker
{
  subTracker = self->_subTracker;
  if (!subTracker)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v5 = [WeakRetained session];
    id v6 = [v5 persistentIdentifier];

    id v7 = +[ICNAController sharedController];
    id v8 = [v7 aaTrackerForWindowSceneIdentifier:v6];

    if (v8)
    {
      uint64_t v9 = [[ICNASubTracker alloc] initWithName:self->_subTrackerName parentAATracker:v8];
      v10 = self->_subTracker;
      self->_subTracker = v9;
    }
    subTracker = self->_subTracker;
  }
  return subTracker;
}

- (void)setSubTracker:(id)a3
{
  v5 = (ICNASubTracker *)a3;
  if (self->_subTracker != v5)
  {
    id v8 = v5;
    id v6 = NSStringFromSelector(sel_subTracker);
    [(ICNAEventReporter *)self willChangeValueForKey:v6];

    objc_storeStrong((id *)&self->_subTracker, a3);
    id v7 = NSStringFromSelector(sel_subTracker);
    [(ICNAEventReporter *)self didChangeValueForKey:v7];

    v5 = v8;
  }
}

- (void)startTimedEventOfType:(Class)a3
{
  objc_initWeak(&location, self);
  v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICNAEventReporter_startTimedEventOfType___block_invoke;
  v7[3] = &unk_1E64B9458;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  [v5 trackTimedEventType:a3 subTracker:v6 synchronousTaskBeforeStarting:v7];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __43__ICNAEventReporter_startTimedEventOfType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = NSStringFromClass(*(Class *)(a1 + 40));
    v3 = [WeakRetained timedDataTrackingSet];
    [v3 addObject:v2];
  }
}

- (void)submitTimedEventOfTypeIfPossible:(Class)a3
{
  objc_initWeak(&location, self);
  v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICNAEventReporter_submitTimedEventOfTypeIfPossible___block_invoke;
  v7[3] = &unk_1E64B9480;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  [v5 submitEventOfType:a3 subTracker:v6 synchronousTaskBeforeSubmitting:v7];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

uint64_t __54__ICNAEventReporter_submitTimedEventOfTypeIfPossible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = NSStringFromClass(*(Class *)(a1 + 40));
    id v4 = [WeakRetained timedDataTrackingSet];
    uint64_t v5 = [v4 containsObject:v3];

    id v6 = [WeakRetained timedDataTrackingSet];
    [v6 removeObject:v3];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)flushAllTimedData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 object];
  id v6 = ICDynamicCast();

  id v7 = [v6 session];
  id v8 = [v7 persistentIdentifier];

  uint64_t v9 = [(ICNAEventReporter *)self windowScene];
  v10 = v9;
  if (v8)
  {
    v11 = [v9 session];
    v12 = [v11 persistentIdentifier];
    char v13 = [v8 isEqual:v12];

    if ((v13 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (!v10)
  {
LABEL_5:
    objc_initWeak(&location, self);
    objc_super v14 = +[ICNAController sharedController];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__ICNAEventReporter_flushAllTimedData___block_invoke;
    v15[3] = &unk_1E64B8D48;
    objc_copyWeak(&v16, &location);
    [v14 performOnInstrumentationQueueWaitUntilDone:0 block:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
LABEL_6:
}

void __39__ICNAEventReporter_flushAllTimedData___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = objc_msgSend(WeakRetained, "timedDataTrackingSet", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(NSString **)(*((void *)&v13 + 1) + 8 * v7);
          uint64_t v9 = +[ICNAController sharedController];
          Class v10 = NSClassFromString(v8);
          v11 = [v2 subTracker];
          [v9 _immediatelySubmitEventOfType:v10 subTracker:v11];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }

    v12 = [v2 timedDataTrackingSet];
    [v12 removeAllObjects];
  }
}

- (void)aaSessionDidEnd:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"ICNAEventReporterLostSessionNotification" object:self];
}

- (void)submitAppSessionResignEvent
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 subTracker:v4];
}

- (void)submitAppSessionResumeEvent
{
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 subTracker:v4];
}

- (void)startOnboardingScreenViewEventDurationTracking
{
  Class v10 = [[ICASOnboardingScreenType alloc] initWithOnboardingScreenType:0];
  uint64_t v3 = [[ICASOnboardingUserAction alloc] initWithOnboardingUserAction:0];
  id v4 = [[ICASOnboardingScreenData alloc] initWithOnboardingScreenType:v10 onboardingUserAction:v3];
  id v5 = +[ICNAController sharedController];
  uint64_t v6 = [(ICNAEventReporter *)self subTracker];
  [v5 pushDataObject:v4 unique:1 onlyOnce:0 subTracker:v6];

  uint64_t v7 = +[ICNAController sharedController];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(ICNAEventReporter *)self subTracker];
  [v7 trackTimedEventType:v8 subTracker:v9];
}

- (void)submitOnboardingScreenViewEventWithType:(int64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [[ICASOnboardingScreenType alloc] initWithOnboardingScreenType:a3];
  id v5 = [ICASOnboardingScreenData alloc];
  uint64_t v6 = [[ICASOnboardingUserAction alloc] initWithOnboardingUserAction:1];
  uint64_t v7 = [(ICASOnboardingScreenData *)v5 initWithOnboardingScreenType:v4 onboardingUserAction:v6];

  uint64_t v8 = +[ICNAController sharedController];
  uint64_t v9 = objc_opt_class();
  v12[0] = v7;
  Class v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v11 = [(ICNAEventReporter *)self subTracker];
  [v8 submitEventOfType:v9 pushThenPopDataObjects:v10 subTracker:v11];
}

- (void)submitNoteCreateEventForModernNote:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v6 = [v4 folder];
  uint64_t v7 = [(ICNAEventReporter *)self folderDataForModernFolder:v6];

  uint64_t v8 = [v4 account];

  uint64_t v9 = [(ICNAEventReporter *)self accountDataForModernAccount:v8];

  Class v10 = [(ICNAEventReporter *)self noteCreateDataFromAppSuiteDefaults];
  if (v10)
  {
    v11 = +[ICNAController sharedController];
    v12 = [(ICNAEventReporter *)self subTracker];
    [v11 pushDataObject:v10 unique:0 onlyOnce:1 subTracker:v12];
  }
  long long v13 = +[ICNAController sharedController];
  uint64_t v14 = objc_opt_class();
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v9;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  long long v16 = [(ICNAEventReporter *)self subTracker];
  [v13 submitEventOfType:v14 pushThenPopDataObjects:v15 subTracker:v16];
}

- (void)submitNoteCreateEventForModernNote:(id)a3 createApproach:(int64_t)a4
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  uint64_t v8 = [ICASNoteCreateData alloc];
  uint64_t v9 = [[ICASNoteCreateApproach alloc] initWithNoteCreateApproach:a4];
  Class v10 = [(ICASNoteCreateData *)v8 initWithNoteCreateApproach:v9];

  v11 = [v6 folder];
  v12 = [(ICNAEventReporter *)self folderDataForModernFolder:v11];

  long long v13 = [v6 account];

  uint64_t v14 = [(ICNAEventReporter *)self accountDataForModernAccount:v13];

  long long v15 = +[ICNAController sharedController];
  uint64_t v16 = objc_opt_class();
  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v12;
  v19[3] = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v15 submitEventOfType:v16 pushThenPopDataObjects:v17 subTracker:v18];
}

- (void)submitNoteCreateEventForHTMLNote:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICNAEventReporter *)self noteDataForHTMLNote:v4];
  id v6 = [v4 folder];
  uint64_t v7 = [(ICNAEventReporter *)self folderDataForHTMLFolder:v6];

  uint64_t v8 = [v4 account];

  uint64_t v9 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v8];

  Class v10 = [(ICNAEventReporter *)self noteCreateDataFromAppSuiteDefaults];
  if (v10)
  {
    v11 = +[ICNAController sharedController];
    v12 = [(ICNAEventReporter *)self subTracker];
    [v11 pushDataObject:v10 unique:0 onlyOnce:1 subTracker:v12];
  }
  long long v13 = +[ICNAController sharedController];
  uint64_t v14 = objc_opt_class();
  v17[0] = v5;
  v17[1] = v7;
  v17[2] = v9;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  uint64_t v16 = [(ICNAEventReporter *)self subTracker];
  [v13 submitEventOfType:v14 pushThenPopDataObjects:v15 subTracker:v16];
}

- (void)submitNoteCreateEventForHTMLNote:(id)a3 createApproach:(int64_t)a4
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ICNAEventReporter *)self noteDataForHTMLNote:v6];
  uint64_t v8 = [ICASNoteCreateData alloc];
  uint64_t v9 = [[ICASNoteCreateApproach alloc] initWithNoteCreateApproach:a4];
  Class v10 = [(ICASNoteCreateData *)v8 initWithNoteCreateApproach:v9];

  v11 = [v6 folder];
  v12 = [(ICNAEventReporter *)self folderDataForHTMLFolder:v11];

  long long v13 = [v6 account];

  uint64_t v14 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v13];

  long long v15 = +[ICNAController sharedController];
  uint64_t v16 = objc_opt_class();
  v19[0] = v7;
  v19[1] = v10;
  v19[2] = v12;
  v19[3] = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v15 submitEventOfType:v16 pushThenPopDataObjects:v17 subTracker:v18];
}

- (void)submitNoteCreateEventForSearchIndexableNote:(id)a3 createApproach:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = ICProtocolCast();

  if (v8)
  {
    [(ICNAEventReporter *)self submitNoteCreateEventForModernNote:v8 createApproach:a4];
  }
  else if (v7)
  {
    [(ICNAEventReporter *)self submitNoteCreateEventForHTMLNote:v7 createApproach:a4];
  }
}

- (void)submitNoteDeleteEventForModernNote:(id)a3
{
  id v4 = a3;
  id v13 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  id v5 = [(ICNAEventReporter *)self noteContentDataForModernNote:v4];
  id v6 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  uint64_t v7 = [v4 account];

  id v8 = [(ICNAEventReporter *)self accountDataForModernAccount:v7];

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, v5, v6, v8, 0);
  Class v10 = +[ICNAController sharedController];
  uint64_t v11 = objc_opt_class();
  v12 = [(ICNAEventReporter *)self subTracker];
  [v10 submitEventOfType:v11 pushThenPopDataObjects:v9 subTracker:v12];
}

- (void)submitNoteDeleteEventForHTMLNote:(id)a3
{
  id v4 = a3;
  id v13 = [(ICNAEventReporter *)self noteDataForHTMLNote:v4];
  id v5 = [(ICNAEventReporter *)self noteContentDataForHTMLNote:v4];
  id v6 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  uint64_t v7 = [v4 account];

  id v8 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v7];

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, v5, v6, v8, 0);
  Class v10 = +[ICNAController sharedController];
  uint64_t v11 = objc_opt_class();
  v12 = [(ICNAEventReporter *)self subTracker];
  [v10 submitEventOfType:v11 pushThenPopDataObjects:v9 subTracker:v12];
}

- (void)submitNoteSharrowEventForModernNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11
{
  BOOL v14 = a5;
  id v52 = a4;
  id v17 = a3;
  v50 = [(ICNAEventReporter *)self noteDataForModernNote:v17];
  uint64_t v18 = [(ICNAEventReporter *)self noteContentDataForModernNote:v17];
  v19 = [v17 folder];
  v51 = [(ICNAEventReporter *)self folderDataForModernFolder:v19];

  v20 = [v17 account];
  v49 = [(ICNAEventReporter *)self accountDataForModernAccount:v20];

  v48 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v17];

  v47 = [(id)objc_opt_class() filteredActivityType:v52];
  v21 = [[ICASSharrowContextData alloc] initWithSharrowSelectedItem:v47];
  if ([v52 isEqualToString:@"com.apple.notes.sharing.initiate"])
  {
    uint64_t v22 = 0;
  }
  else if ([v52 isEqualToString:@"com.apple.notes.sharing.cancel"])
  {
    uint64_t v22 = 3;
  }
  else
  {
    int v23 = [(id)objc_opt_class() activityTypeHasUnknownShareFlow:v52];
    uint64_t v24 = 1;
    if (v14) {
      uint64_t v24 = 2;
    }
    if (v23) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = v24;
    }
  }
  v46 = [[ICASShareFlowType alloc] initWithShareFlowType:v22];
  v44 = [[ICASShareFlowData alloc] initWithShareFlowType:v46];
  v25 = [ICASCollaboratorData alloc];
  v26 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a6)];
  v27 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a7)];
  v43 = [(ICASCollaboratorData *)v25 initWithCountOfCollaboratorAdded:v26 countOfCollaboratorRemoved:v27];

  v28 = [ICASStartCollaborationCollaboratorData alloc];
  v29 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a8)];
  v30 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a9)];
  v45 = [(ICASStartCollaborationCollaboratorData *)v28 initWithStartInvitedCount:v29 startAcceptedCount:v30];

  v31 = [ICASEndCollaborationCollaboratorData alloc];
  v32 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a10)];
  v33 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a11)];
  v34 = [(ICASEndCollaborationCollaboratorData *)v31 initWithEndInvitedCount:v32 endAcceptedCount:v33];

  v35 = v21;
  v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v50, v18, v51, v21, v49, v48, v44, v43, v45, v34, 0);
  v37 = [ICASContextPathData alloc];
  v38 = [[ICASContextPath alloc] initWithContextPath:1];
  v39 = [(ICASContextPathData *)v37 initWithContextPath:v38];

  [v36 addObject:v39];
  uint64_t v40 = objc_opt_class();
  v41 = +[ICNAController sharedController];
  v42 = [(ICNAEventReporter *)self subTracker];
  [v41 submitEventOfType:v40 pushThenPopDataObjects:v36 subTracker:v42];
}

- (void)submitNoteSharrowEventForHTMLNote:(id)a3 activityType:(id)a4 contextPath:(int64_t)a5
{
  id v37 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICNAEventReporter *)self noteDataForHTMLNote:v7];
  uint64_t v9 = [(ICNAEventReporter *)self noteContentDataForHTMLNote:v7];
  Class v10 = [v7 folder];

  uint64_t v11 = [(ICNAEventReporter *)self folderDataForHTMLFolder:v10];
  v12 = [ICASSharrowContextData alloc];
  id v13 = [(id)objc_opt_class() filteredActivityType:v37];
  v36 = [(ICASSharrowContextData *)v12 initWithSharrowSelectedItem:v13];

  v32 = v10;
  BOOL v14 = [v10 account];
  v35 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v14];

  v34 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  if ([v37 isEqualToString:@"com.apple.notes.sharing.initiate"])
  {
    uint64_t v15 = 0;
  }
  else if ([(id)objc_opt_class() activityTypeHasUnknownShareFlow:v37])
  {
    uint64_t v15 = 3;
  }
  else
  {
    uint64_t v15 = 1;
  }
  uint64_t v16 = [[ICASShareFlowType alloc] initWithShareFlowType:v15];
  id v17 = [[ICASShareFlowData alloc] initWithShareFlowType:v16];
  uint64_t v18 = [[ICASCollaboratorData alloc] initWithCountOfCollaboratorAdded:&unk_1F1F91058 countOfCollaboratorRemoved:&unk_1F1F91058];
  v19 = [[ICASStartCollaborationCollaboratorData alloc] initWithStartInvitedCount:&unk_1F1F91058 startAcceptedCount:&unk_1F1F91058];
  v20 = [[ICASEndCollaborationCollaboratorData alloc] initWithEndInvitedCount:&unk_1F1F91058 endAcceptedCount:&unk_1F1F91058];
  v31 = (void *)v11;
  v33 = (void *)v9;
  uint64_t v29 = v9;
  v21 = (void *)v8;
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, v29, v11, v36, v35, v34, v17, v18, v19, v20, 0);
  if (a5)
  {
    int v23 = [ICASContextPathData alloc];
    uint64_t v24 = [[ICASContextPath alloc] initWithContextPath:a5];
    v25 = [(ICASContextPathData *)v23 initWithContextPath:v24];

    [v22 addObject:v25];
  }
  uint64_t v26 = objc_opt_class();
  v27 = +[ICNAController sharedController];
  v28 = [(ICNAEventReporter *)self subTracker];
  [v27 submitEventOfType:v26 pushThenPopDataObjects:v22 subTracker:v28];
}

- (void)pushContextPathDataWithContextPathEnum:(int64_t)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = [ICASContextPathData alloc];
  id v6 = [[ICASContextPath alloc] initWithContextPath:a3];
  id v7 = [(ICASContextPathData *)v5 initWithContextPath:v6];

  uint64_t v8 = +[ICNAController sharedController];
  v11[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  Class v10 = [(ICNAEventReporter *)self subTracker];
  [v8 pushDataObjects:v9 unique:0 onlyOnce:0 subTracker:v10];
}

- (void)popContextPathData
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICNAEventReporter *)self subTracker];
  [v5 popDataObjectWithType:v3 subTracker:v4];
}

- (void)submitCollaborationActionEventForCloudSyncingObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5 inviteStep:(int64_t)a6
{
  BOOL v7 = a5;
  id v38 = a4;
  id v10 = a3;
  objc_opt_class();
  uint64_t v11 = ICDynamicCast();
  objc_opt_class();
  uint64_t v12 = ICDynamicCast();

  if (v11 | v12)
  {
    uint64_t v36 = objc_opt_class();
    if (v11)
    {
      uint64_t v13 = [(id)v11 account];
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v13 = [(id)v12 account];
      uint64_t v14 = 2;
    }
    id v37 = (void *)v13;
    uint64_t v15 = [(ICNAEventReporter *)self accountDataForModernAccount:v13];
    v34 = [[ICASCollaborationItemType alloc] initWithCollaborationItemType:v14];
    uint64_t v16 = [[ICASCollaborationItemData alloc] initWithCollaborationItemType:v34];
    id v17 = [(ICNAEventReporter *)self collaborationActionDataIsInviting:v7 inviteStep:a6];
    v35 = (void *)v15;
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, v16, v17, 0);
    if (v11)
    {
      v19 = [(ICNAEventReporter *)self noteDataForModernNote:v11];
      objc_msgSend(v18, "ic_addNonNilObject:", v19);
      v20 = [(ICNAEventReporter *)self noteContentDataForModernNote:v11];
      objc_msgSend(v18, "ic_addNonNilObject:", v20);
    }
    v21 = +[ICNAController sharedController];
    int v22 = objc_msgSend(v38, "ic_isOwnedByCurrentUser");
    if (v38 && !v22) {
      goto LABEL_14;
    }
    uint64_t v23 = objc_msgSend(v38, "ic_nonOwnerInvitedParticipantsCount");
    uint64_t v24 = objc_msgSend(v38, "ic_nonOwnerAcceptedParticipantsCount");
    if (a6 == 3)
    {
      v33 = [ICASEndCollaborationCollaboratorData alloc];
      uint64_t v29 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v23)];
      v30 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v24)];
      v27 = [(ICASEndCollaborationCollaboratorData *)v33 initWithEndInvitedCount:v29 endAcceptedCount:v30];

      [v18 addObject:v27];
    }
    else
    {
      if (a6 != 1)
      {
LABEL_14:
        v31 = [(ICNAEventReporter *)self subTracker];
        [v21 submitEventOfType:v36 pushThenPopDataObjects:v18 subTracker:v31];

        goto LABEL_15;
      }
      v32 = [ICASStartCollaborationCollaboratorData alloc];
      v25 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v23)];
      uint64_t v26 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v24)];
      v27 = [(ICASStartCollaborationCollaboratorData *)v32 initWithStartInvitedCount:v25 startAcceptedCount:v26];

      v28 = [(ICNAEventReporter *)self subTracker];
      [v21 pushDataObject:v27 unique:1 onlyOnce:0 subTracker:v28];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)submitCollabNotificationEventWithAction:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [[ICASCollabNotificationAction alloc] initWithCollabNotificationAction:a3];
  id v5 = [[ICASCollabNotificationData alloc] initWithCollabNotificationAction:v4];
  id v6 = +[ICNAController sharedController];
  uint64_t v7 = objc_opt_class();
  v10[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = [(ICNAEventReporter *)self subTracker];
  [v6 submitEventOfType:v7 pushThenPopDataObjects:v8 subTracker:v9];
}

- (void)submitEverNoteImportEventWithCount:(unint64_t)a3 isSuccessful:(BOOL)a4 intoAccount:(id)a5
{
  BOOL v5 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [[ICASImportFileType alloc] initWithImportFileType:5];
  id v10 = [ICASImportItemData alloc];
  uint64_t v11 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a3)];
  uint64_t v12 = [(ICASImportItemData *)v10 initWithImportFileType:v9 importItemCount:v11];

  uint64_t v13 = [ICASImportData alloc];
  v41[0] = v12;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  uint64_t v15 = [(ICASImportData *)v13 initWithImportSummary:v14];

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__3;
  id v38 = __Block_byref_object_dispose__3;
  id v39 = 0;
  uint64_t v16 = [v8 managedObjectContext];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __81__ICNAEventReporter_submitEverNoteImportEventWithCount_isSuccessful_intoAccount___block_invoke;
  v30 = &unk_1E64B94A8;
  v33 = &v34;
  v31 = self;
  id v17 = v8;
  id v32 = v17;
  [v16 performBlockAndWait:&v27];

  uint64_t v18 = [ICASResultType alloc];
  if (v5) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 2;
  }
  v20 = -[ICASResultType initWithResultType:](v18, "initWithResultType:", v19, v27, v28, v29, v30, v31);
  v21 = [[ICASResultData alloc] initWithResultType:v20];
  int v22 = +[ICNAController sharedController];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = v35[5];
  v40[0] = v15;
  v40[1] = v24;
  v40[2] = v21;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  uint64_t v26 = [(ICNAEventReporter *)self subTracker];
  [v22 submitEventOfType:v23 pushThenPopDataObjects:v25 subTracker:v26];

  _Block_object_dispose(&v34, 8);
}

uint64_t __81__ICNAEventReporter_submitEverNoteImportEventWithCount_isSuccessful_intoAccount___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accountDataForModernAccount:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)noteViewEventDataObjectsForModernNote:(id)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  id v6 = -[ICNAEventReporter noteContentDataForModernNote:](self, "noteContentDataForModernNote:", v4, v5);
  v14[1] = v6;
  uint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  v14[2] = v7;
  id v8 = [v4 folder];
  uint64_t v9 = [(ICNAEventReporter *)self folderDataForModernFolder:v8];
  v14[3] = v9;
  id v10 = [v4 account];

  uint64_t v11 = [(ICNAEventReporter *)self accountDataForModernAccount:v10];
  v14[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];

  return v12;
}

- (id)noteViewEventDataObjectsForHTMLNote:(id)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICNAEventReporter *)self noteDataForHTMLNote:v4];
  v15[0] = v5;
  id v6 = [(ICNAEventReporter *)self noteContentDataForHTMLNote:v4];
  v15[1] = v6;
  uint64_t v7 = [(ICNAEventReporter *)self noteCollapsibleSectionDataForHTMLNote:v4];
  v15[2] = v7;
  id v8 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  v15[3] = v8;
  uint64_t v9 = [v4 folder];
  id v10 = [(ICNAEventReporter *)self folderDataForHTMLFolder:v9];
  void v15[4] = v10;
  uint64_t v11 = [v4 account];

  uint64_t v12 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v11];
  v15[5] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:6];

  return v13;
}

- (void)startNoteViewEventDurationTrackingForModernNote:(id)a3 reportCoreAnalytics:(BOOL)a4
{
  BOOL v4 = a4;
  v18[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  uint64_t v7 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  id v8 = [(ICNAEventReporter *)self noteContentDataForModernNote:v6];
  uint64_t v9 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  id v10 = [v6 folder];
  uint64_t v11 = [(ICNAEventReporter *)self folderDataForModernFolder:v10];

  uint64_t v12 = [v6 account];
  uint64_t v13 = [(ICNAEventReporter *)self accountDataForModernAccount:v12];

  uint64_t v14 = +[ICNAController sharedController];
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = v9;
  v18[3] = v11;
  v18[4] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  uint64_t v16 = [(ICNAEventReporter *)self subTracker];
  [v14 pushDataObjects:v15 unique:1 onlyOnce:0 subTracker:v16];

  if (v4)
  {
    id v17 = +[ICNACoreAnalyticsReporter sharedReporter];
    [v17 fireNoteViewEventWithNote:v6 noteData:v7 noteContentData:v8];
  }
}

- (void)submitNoteViewEventForModernNote:(id)a3 referringNote:(id)a4 collapsibleSectionAffordanceExposures:(int64_t)a5 collapsibleSectionAffordanceUsages:(int64_t)a6
{
  id v22 = a4;
  id v10 = [(ICNAEventReporter *)self noteViewEventDataObjectsForModernNote:a3];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [ICASCollapsibleSectionData alloc];
  uint64_t v13 = [NSNumber numberWithInteger:a5];
  uint64_t v14 = [NSNumber numberWithInteger:a6];
  uint64_t v15 = [(ICASCollapsibleSectionData *)v12 initWithSectionAffordanceExposures:v13 sectionAffordanceUsages:v14];

  [v11 addObject:v15];
  if (v22)
  {
    uint64_t v16 = +[ICNAIdentityManager sharedManager];
    id v17 = [v22 identifier];
    uint64_t v18 = [v16 saltedID:v17 forClass:objc_opt_class()];

    uint64_t v19 = [[ICASViewRefData alloc] initWithLinkedNoteId:v18];
    [v11 addObject:v19];
  }
  v20 = +[ICNAController sharedController];
  v21 = [(ICNAEventReporter *)self subTracker];
  [v20 pushDataObjects:v11 unique:1 onlyOnce:1 subTracker:v21];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)startNoteViewEventDurationTrackingForHTMLNote:(id)a3
{
  id v4 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v7 = [(ICNAEventReporter *)self noteViewEventDataObjectsForHTMLNote:v4];

  BOOL v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  [v5 pushDataObjects:v7 unique:1 onlyOnce:0 subTracker:v6];
}

- (void)submitNoteViewEventForHTMLNote:(id)a3
{
  id v6 = [(ICNAEventReporter *)self noteViewEventDataObjectsForHTMLNote:a3];
  id v4 = +[ICNAController sharedController];
  BOOL v5 = [(ICNAEventReporter *)self subTracker];
  [v4 pushDataObjects:v6 unique:1 onlyOnce:1 subTracker:v5];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)pushSearchDataWithSearchSessionID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [ICASSearchData alloc];
  id v6 = (void *)[v4 copy];

  uint64_t v9 = [(ICASSearchData *)v5 initWithSearchSessionID:v6];
  id v7 = +[ICNAController sharedController];
  id v8 = [(ICNAEventReporter *)self subTracker];
  [v7 pushDataObject:v9 unique:1 onlyOnce:0 subTracker:v8];
}

- (void)popSearchData
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICNAEventReporter *)self subTracker];
  [v5 popDataObjectWithType:v3 subTracker:v4];
}

- (void)submitTableCreateEventForAttachment:(id)a3 inNote:(id)a4
{
  v22[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v19 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  v21 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  id v8 = [v6 account];

  v20 = [(ICNAEventReporter *)self accountDataForModernAccount:v8];

  uint64_t v9 = [v7 tableModel];

  id v10 = [v9 table];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v10, "rowCount")));
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v10, "columnCount")));
  uint64_t v13 = [[ICASStartTableData alloc] initWithStartingRowCount:v11 startingColumnCount:v12];
  uint64_t v14 = [[ICASEndTableData alloc] initWithEndingRowCount:v11 endingColumnCount:v12];
  uint64_t v15 = +[ICNAController sharedController];
  uint64_t v16 = objc_opt_class();
  v22[0] = v19;
  v22[1] = v21;
  v22[2] = v20;
  v22[3] = v13;
  v22[4] = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v15 submitEventOfType:v16 pushThenPopDataObjects:v17 subTracker:v18];
}

- (void)pushStartTableDataWithStartColumns:(unint64_t)a3 startRows:(unint64_t)a4
{
  id v7 = [ICASStartTableData alloc];
  id v8 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  uint64_t v9 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a3)];
  uint64_t v12 = [(ICASStartTableData *)v7 initWithStartingRowCount:v8 startingColumnCount:v9];

  id v10 = +[ICNAController sharedController];
  uint64_t v11 = [(ICNAEventReporter *)self subTracker];
  [v10 pushDataObject:v12 unique:1 onlyOnce:1 subTracker:v11];
}

- (void)submitTableEditEventForNote:(id)a3 endColumns:(unint64_t)a4 endRows:(unint64_t)a5
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(ICNAEventReporter *)self noteDataForModernNote:v8];
  id v10 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v8];
  uint64_t v11 = [v8 account];

  uint64_t v12 = [(ICNAEventReporter *)self accountDataForModernAccount:v11];

  uint64_t v13 = [ICASEndTableData alloc];
  uint64_t v14 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a5)];
  uint64_t v15 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  uint64_t v16 = [(ICASEndTableData *)v13 initWithEndingRowCount:v14 endingColumnCount:v15];

  id v17 = +[ICNAController sharedController];
  uint64_t v18 = objc_opt_class();
  v21[0] = v9;
  v21[1] = v10;
  v21[2] = v12;
  v21[3] = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  v20 = [(ICNAEventReporter *)self subTracker];
  [v17 submitEventOfType:v18 pushThenPopDataObjects:v19 subTracker:v20];
}

- (void)submitTableRemoveEventForAttachment:(id)a3 inNote:(id)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  v20 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  uint64_t v9 = [v6 account];

  uint64_t v19 = [(ICNAEventReporter *)self accountDataForModernAccount:v9];

  id v10 = [v7 tableModel];

  uint64_t v11 = [v10 table];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v11, "rowCount")));
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v11, "columnCount")));
  uint64_t v13 = [[ICASStartTableData alloc] initWithStartingRowCount:v18 startingColumnCount:v12];
  uint64_t v14 = +[ICNAController sharedController];
  uint64_t v15 = objc_opt_class();
  v21[0] = v8;
  v21[1] = v20;
  v21[2] = v19;
  v21[3] = v13;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  id v17 = [(ICNAEventReporter *)self subTracker];
  [v14 submitEventOfType:v15 pushThenPopDataObjects:v16 subTracker:v17];
}

- (void)submitNotePinEventForModernNote:(id)a3 contextPath:(int64_t)a4
{
  id v18 = a3;
  id v6 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v18];
  id v7 = [v18 account];
  id v8 = [(ICNAEventReporter *)self accountDataForModernAccount:v7];

  uint64_t v9 = [(ICNAEventReporter *)self noteContentDataForModernNote:v18];
  id v10 = [(ICNAEventReporter *)self noteDataForModernNote:v18];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, v8, v9, v10, 0);
  if (a4)
  {
    uint64_t v12 = [ICASContextPathData alloc];
    uint64_t v13 = [[ICASContextPath alloc] initWithContextPath:a4];
    uint64_t v14 = [(ICASContextPathData *)v12 initWithContextPath:v13];

    [v11 addObject:v14];
  }
  [v18 isPinned];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = +[ICNAController sharedController];
  id v17 = [(ICNAEventReporter *)self subTracker];
  [v16 submitEventOfType:v15 pushThenPopDataObjects:v11 subTracker:v17];
}

- (void)submitFolderCreateEventForModernFolder:(id)a3
{
}

- (void)submitFolderCreateEventForModernFolder:(id)a3 creationApproach:(int64_t)a4 filterSelection:(id)a5
{
  id v29 = a5;
  id v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = [v8 array];
  uint64_t v11 = [(ICNAEventReporter *)self folderDataForModernFolder:v9];
  [v10 addObject:v11];
  uint64_t v12 = [v9 account];
  uint64_t v13 = [(ICNAEventReporter *)self accountDataForModernAccount:v12];

  [v10 addObject:v13];
  LODWORD(v12) = [v9 isSmartFolder];

  if (v12)
  {
    uint64_t v14 = [[ICASFolderCreationApproach alloc] initWithFolderCreationApproach:a4];
    objc_opt_class();
    uint64_t v15 = [v29 filterTypeSelectionForFilterType:0];
    uint64_t v16 = ICDynamicCast();

    if (v29)
    {
      id v17 = [v29 filterTypeSelections];
      id v18 = objc_msgSend(v17, "ic_compactMap:", &__block_literal_global_4);

      uint64_t v19 = [v29 joinOperator];
      if (v19 == 1) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = v19 == 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
      id v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v21 = [ICASSmartFolderCreationData alloc];
    id v22 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v16, "selectedTagCount")));
    uint64_t v23 = [[ICASFilterCondition alloc] initWithFilterCondition:v20];
    uint64_t v24 = [(ICASSmartFolderCreationData *)v21 initWithFolderCreationApproach:v14 countOfTags:v22 filterCondition:v23 enabledFiltersArray:v18];

    [v10 addObject:v24];
  }
  v25 = +[ICNAController sharedController];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = (void *)[v10 copy];
  uint64_t v28 = [(ICNAEventReporter *)self subTracker];
  [v25 submitEventOfType:v26 pushThenPopDataObjects:v27 subTracker:v28];
}

ICASEnabledFiltersArrayData *__93__ICNAEventReporter_submitFolderCreateEventForModernFolder_creationApproach_filterSelection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [ICASEnabledFiltersArrayData alloc];
  [v2 filterType];
  id v4 = NSStringFromICFilterType();
  id v5 = [v2 rawFilterValue];

  id v6 = [(ICASEnabledFiltersArrayData *)v3 initWithFilterType:v4 filterValue:v5];
  return v6;
}

- (id)folderViewEventDataObjectsForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  id v7 = [v6 managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __77__ICNAEventReporter_folderViewEventDataObjectsForNoteContainer_isInGridMode___block_invoke;
  v12[3] = &unk_1E64B94F0;
  id v8 = v6;
  id v13 = v8;
  uint64_t v14 = self;
  BOOL v16 = a4;
  uint64_t v15 = &v17;
  [v7 performBlockAndWait:v12];

  id v9 = (void *)v18[5];
  if (!v9) {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __77__ICNAEventReporter_folderViewEventDataObjectsForNoteContainer_isInGridMode___block_invoke(uint64_t a1)
{
  void v15[4] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  id v2 = ICDynamicCast();
  uint64_t v3 = [*(id *)(a1 + 32) noteContainerAccount];
  id v4 = [v3 accountProxy];

  id v5 = *(void **)(a1 + 40);
  if (v2) {
    [v5 folderDataForModernFolder:v2];
  }
  else {
  id v6 = [v5 folderDataForModernAccountProxy:v4];
  }
  id v7 = [*(id *)(a1 + 40) folderContentDataForNoteContainer:*(void *)(a1 + 32)];
  id v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) noteContainerAccount];
  id v10 = [v8 accountDataForModernAccount:v9];

  uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "layoutDataForIsInGridMode:isTimelineView:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "isShowingDateHeaders"));
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v10;
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)folderViewEventDataObjectsForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ICNAEventReporter_folderViewEventDataObjectsForVirtualFolder_isInGridMode_context___block_invoke;
  v15[3] = &unk_1E64B9518;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v18 = self;
  uint64_t v19 = &v21;
  id v17 = v11;
  BOOL v20 = a4;
  [v11 performBlockAndWait:v15];
  uint64_t v12 = (void *)v22[5];
  if (!v12) {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = v12;

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __85__ICNAEventReporter_folderViewEventDataObjectsForVirtualFolder_isInGridMode_context___block_invoke(uint64_t a1)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) accountObjectID];
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) accountObjectID];
    id v5 = [v3 objectWithID:v4];
  }
  else
  {
    id v5 = 0;
  }

  id v6 = [ICASAccountData alloc];
  id v7 = [[ICASAccountType alloc] initWithAccountType:0];
  id v8 = [(ICASAccountData *)v6 initWithAccountType:v7 accountID:&stru_1F1F66380];

  id v9 = [*(id *)(a1 + 48) folderDataForVirtualFolder:*(void *)(a1 + 32)];
  v16[0] = v9;
  id v10 = [*(id *)(a1 + 48) folderContentDataForVirtualFolder:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  v16[1] = v10;
  if (v5)
  {
    id v11 = [*(id *)(a1 + 48) accountDataForModernAccount:v5];
  }
  else
  {
    id v11 = v8;
  }
  v16[2] = v11;
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 48), "layoutDataForIsInGridMode:isTimelineView:", *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "isShowingDateHeaders"));
  v16[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (v5) {
}
  }

- (id)folderViewEventDataObjectsForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  BOOL v4 = a4;
  void v15[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = ICProtocolCast();
  id v8 = [(ICNAEventReporter *)self folderDataForHTMLCollection:v6];
  id v9 = [(ICNAEventReporter *)self folderContentDataForNoteCollection:v6];
  if (v7) {
    [v7 account];
  }
  else {
  id v10 = ICCheckedProtocolCast();
  }
  id v11 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v10];

  uint64_t v12 = [(ICNAEventReporter *)self layoutDataForIsInGridMode:v4 isTimelineView:0];
  v15[0] = v8;
  v15[1] = v9;
  v15[2] = v11;
  v15[3] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];

  return v13;
}

- (void)startFolderViewEventDurationTrackingForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v9 = [(ICNAEventReporter *)self folderViewEventDataObjectsForNoteContainer:v6 isInGridMode:v4];

  id v7 = +[ICNAController sharedController];
  id v8 = [(ICNAEventReporter *)self subTracker];
  [v7 pushDataObjects:v9 unique:1 onlyOnce:0 subTracker:v8];
}

- (void)submitFolderViewEventForNoteContainer:(id)a3 isInGridMode:(BOOL)a4
{
  id v7 = [(ICNAEventReporter *)self folderViewEventDataObjectsForNoteContainer:a3 isInGridMode:a4];
  id v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  [v5 pushDataObjects:v7 unique:1 onlyOnce:1 subTracker:v6];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)startFolderViewEventDurationTrackingForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v12 = [(ICNAEventReporter *)self folderViewEventDataObjectsForVirtualFolder:v9 isInGridMode:v5 context:v8];

  id v10 = +[ICNAController sharedController];
  id v11 = [(ICNAEventReporter *)self subTracker];
  [v10 pushDataObjects:v12 unique:1 onlyOnce:0 subTracker:v11];
}

- (void)submitFolderViewEventForVirtualFolder:(id)a3 isInGridMode:(BOOL)a4 context:(id)a5
{
  id v8 = [(ICNAEventReporter *)self folderViewEventDataObjectsForVirtualFolder:a3 isInGridMode:a4 context:a5];
  id v6 = +[ICNAController sharedController];
  id v7 = [(ICNAEventReporter *)self subTracker];
  [v6 pushDataObjects:v8 unique:1 onlyOnce:1 subTracker:v7];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)startFolderViewEventDurationTrackingForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v9 = [(ICNAEventReporter *)self folderViewEventDataObjectsForNoteCollection:v6 isInGridMode:v4];

  id v7 = +[ICNAController sharedController];
  id v8 = [(ICNAEventReporter *)self subTracker];
  [v7 pushDataObjects:v9 unique:1 onlyOnce:0 subTracker:v8];
}

- (void)submitFolderViewEventForNoteCollection:(id)a3 isInGridMode:(BOOL)a4
{
  id v7 = [(ICNAEventReporter *)self folderViewEventDataObjectsForNoteCollection:a3 isInGridMode:a4];
  BOOL v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  [v5 pushDataObjects:v7 unique:1 onlyOnce:1 subTracker:v6];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)startFolderListViewEventDurationTracking
{
  uint64_t v3 = objc_opt_class();
  [(ICNAEventReporter *)self startTimedEventOfType:v3];
}

- (void)submitFolderListViewEvent
{
  uint64_t v3 = objc_opt_class();
  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:v3];
}

- (void)submitFolderDeleteEventForModernFolder:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ICNAEventReporter *)self folderDataForModernFolder:v4];
  id v6 = [v4 account];
  id v7 = [(ICNAEventReporter *)self accountDataForModernAccount:v6];

  id v8 = [(ICNAEventReporter *)self folderContentDataForNoteContainer:v4];

  id v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v5;
  v13[1] = v8;
  v13[2] = v7;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  id v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (void)pushInlineDrawingDataForDrawing:(id)a3 drawingID:(id)a4 tool:(int64_t)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = [(ICNAEventReporter *)self pendingInlineDrawingInformation];

  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [(ICNAEventReporter *)self setPendingInlineDrawingInformation:v10];
  }
  id v11 = [(ICNAEventReporter *)self pendingInlineDrawingInformation];
  id v12 = [v11 objectForKeyedSubscript:v8];

  if (!v12)
  {
    id v12 = objc_alloc_init(ICInlineDrawingAnalyticsInformation);
    unint64_t v13 = [(ICNAEventReporter *)self pencilStrokeCountForDrawing:v17];
    uint64_t v14 = [v17 strokes];
    unint64_t v15 = [v14 count] - v13;

    [(ICInlineDrawingAnalyticsInformation *)v12 setStartFingerStrokeCount:v15];
    [(ICInlineDrawingAnalyticsInformation *)v12 setStartPencilStrokeCount:v13];
    [(ICInlineDrawingAnalyticsInformation *)v12 setEndFingerStrokeCount:v15];
    [(ICInlineDrawingAnalyticsInformation *)v12 setEndPencilStrokeCount:v13];
    id v16 = [(ICNAEventReporter *)self pendingInlineDrawingInformation];
    [v16 setObject:v12 forKey:v8];
  }
  if (a5 == 1) {
    [(ICInlineDrawingAnalyticsInformation *)v12 setEndPencilStrokeCount:[(ICInlineDrawingAnalyticsInformation *)v12 endPencilStrokeCount] + 1];
  }
  else {
    [(ICInlineDrawingAnalyticsInformation *)v12 setEndFingerStrokeCount:[(ICInlineDrawingAnalyticsInformation *)v12 endFingerStrokeCount] + 1];
  }
  [(ICInlineDrawingAnalyticsInformation *)v12 setLastUsedTool:a5];
}

- (void)submitPendingInlineDrawingDataForNote:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  if (v41)
  {
    id v4 = [(ICNAEventReporter *)self pendingInlineDrawingInformation];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id obj = [(ICNAEventReporter *)self pendingInlineDrawingInformation];
      uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v51)
      {
        unint64_t v6 = 0x1E4F83000uLL;
        unint64_t v7 = 0x1E4F83000uLL;
        uint64_t v50 = *(void *)v53;
        uint64_t v40 = self;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v53 != v50) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v52 + 1) + 8 * v8);
            uint64_t v10 = *(void **)(v6 + 672);
            id v11 = objc_msgSend(*(id *)(v7 + 1064), "sharedContext", v40);
            id v12 = [v11 managedObjectContext];
            unint64_t v13 = [v10 attachmentWithIdentifier:v9 context:v12];

            if (v13 && ([v13 markedForDeletion] & 1) == 0)
            {
              [(ICNAEventReporter *)self pendingInlineDrawingInformation];
              uint64_t v14 = v46 = v13;
              unint64_t v15 = [v14 objectForKeyedSubscript:v9];

              uint64_t v16 = [v15 startPencilStrokeCount];
              if (v16 + [v15 startFingerStrokeCount]) {
                uint64_t v17 = 2;
              }
              else {
                uint64_t v17 = 1;
              }
              id v18 = +[ICNAIdentityManager sharedManager];
              v48 = [v18 saltedID:v9 forClass:objc_opt_class()];

              uint64_t v19 = [ICASDrawingData alloc];
              BOOL v20 = [[ICASDrawingActionType alloc] initWithDrawingActionType:v17];
              uint64_t v21 = -[ICASDrawingTool initWithDrawingTool:]([ICASDrawingTool alloc], "initWithDrawingTool:", [v15 lastUsedTool]);
              v49 = [(ICASDrawingData *)v19 initWithDrawingActionType:v20 drawingTool:v21 drawingID:v48];

              id v22 = [ICASStartDrawingStrokeData alloc];
              uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "startPencilStrokeCount")));
              uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "startFingerStrokeCount")));
              v47 = [(ICASStartDrawingStrokeData *)v22 initWithStartPencilStrokeCount:v23 startFingerStrokeCount:v24];

              v25 = [ICASEndDrawingStrokeData alloc];
              id v26 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "endPencilStrokeCount")));
              uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v15, "endFingerStrokeCount")));
              v45 = [(ICASEndDrawingStrokeData *)v25 initWithEndPencilStrokeCount:v26 endFingerStrokeCount:v27];

              v43 = [(ICNAEventReporter *)v40 noteDataForModernNote:v41];
              v44 = [(ICNAEventReporter *)v40 noteContentDataForModernNote:v41];
              uint64_t v28 = [(ICNAEventReporter *)v40 noteAccessDataForModernNote:v41];
              id v29 = [v41 account];
              v30 = [(ICNAEventReporter *)v40 accountDataForModernAccount:v29];

              v31 = +[ICNAController sharedController];
              uint64_t v32 = objc_opt_class();
              v56[0] = v43;
              v56[1] = v44;
              v56[2] = v28;
              v56[3] = v30;
              v56[4] = v49;
              v56[5] = v47;
              v56[6] = v45;
              v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:7];
              uint64_t v34 = [(ICNAEventReporter *)v40 subTracker];
              [v31 submitEventOfType:v32 pushThenPopDataObjects:v33 subTracker:v34];

              self = v40;
              unint64_t v35 = [v15 endPencilStrokeCount];
              BOOL v36 = v35 > [v15 startPencilStrokeCount];
              id v37 = +[ICNACoreAnalyticsReporter sharedReporter];
              BOOL v38 = v36;
              unint64_t v6 = 0x1E4F83000;
              [v37 fireUpdateHandWritingContentEventWithNoteData:v43 pencilIsUsed:v38];

              unint64_t v7 = 0x1E4F83000;
              unint64_t v13 = v46;
            }
            ++v8;
          }
          while (v51 != v8);
          uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v51);
      }

      id v39 = [(ICNAEventReporter *)self pendingInlineDrawingInformation];
      [v39 removeAllObjects];
    }
  }
}

- (void)submitInlineDrawingDataForDrawingDeletion:(id)a3 drawingID:(id)a4 forNote:(id)a5
{
  v38[7] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[ICNAIdentityManager sharedManager];
  id v37 = [v11 saltedID:v9 forClass:objc_opt_class()];

  id v12 = [ICASDrawingData alloc];
  unint64_t v13 = [[ICASDrawingActionType alloc] initWithDrawingActionType:3];
  uint64_t v14 = [[ICASDrawingTool alloc] initWithDrawingTool:0];
  BOOL v36 = [(ICASDrawingData *)v12 initWithDrawingActionType:v13 drawingTool:v14 drawingID:v37];

  uint64_t v15 = [(ICNAEventReporter *)self pencilStrokeCountForDrawing:v10];
  uint64_t v16 = [v10 strokes];

  uint64_t v17 = [v16 count] - v15;
  id v18 = [ICASStartDrawingStrokeData alloc];
  uint64_t v19 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v15)];
  BOOL v20 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v17)];
  unint64_t v35 = [(ICASStartDrawingStrokeData *)v18 initWithStartPencilStrokeCount:v19 startFingerStrokeCount:v20];

  uint64_t v21 = [ICASEndDrawingStrokeData alloc];
  id v22 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v15)];
  uint64_t v23 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v17)];
  uint64_t v24 = [(ICASEndDrawingStrokeData *)v21 initWithEndPencilStrokeCount:v22 endFingerStrokeCount:v23];

  uint64_t v34 = [(ICNAEventReporter *)self noteDataForModernNote:v8];
  v25 = [(ICNAEventReporter *)self noteContentDataForModernNote:v8];
  id v26 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v8];
  uint64_t v27 = [v8 account];

  uint64_t v28 = [(ICNAEventReporter *)self accountDataForModernAccount:v27];

  id v29 = +[ICNAController sharedController];
  uint64_t v30 = objc_opt_class();
  v38[0] = v34;
  v38[1] = v25;
  v38[2] = v26;
  v38[3] = v28;
  v38[4] = v36;
  v38[5] = v35;
  v38[6] = v24;
  v31 = (void *)v24;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:7];
  v33 = [(ICNAEventReporter *)self subTracker];
  [v29 submitEventOfType:v30 pushThenPopDataObjects:v32 subTracker:v33];
}

- (void)submitFullscreenDrawingToInlineDrawingEventForNote:(id)a3 drawing:(id)a4 drawingID:(id)a5 method:(int64_t)a6
{
  v37[6] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unint64_t v13 = +[ICNAIdentityManager sharedManager];
  BOOL v36 = [v13 saltedID:v10 forClass:objc_opt_class()];

  uint64_t v14 = [ICASDrawingData alloc];
  uint64_t v15 = [[ICASDrawingActionType alloc] initWithDrawingActionType:1];
  uint64_t v16 = [[ICASDrawingTool alloc] initWithDrawingTool:0];
  uint64_t v17 = [(ICASDrawingData *)v14 initWithDrawingActionType:v15 drawingTool:v16 drawingID:v36];

  uint64_t v18 = [(ICNAEventReporter *)self pencilStrokeCountForDrawing:v11];
  uint64_t v19 = [v11 strokes];

  uint64_t v20 = [v19 count] - v18;
  uint64_t v21 = [ICASStartDrawingStrokeData alloc];
  id v22 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v18)];
  uint64_t v23 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v20)];
  uint64_t v24 = [(ICASStartDrawingStrokeData *)v21 initWithStartPencilStrokeCount:v22 startFingerStrokeCount:v23];

  v25 = [ICASDrawingConversionData alloc];
  id v26 = [[ICASConversionMethod alloc] initWithConversionMethod:a6];
  uint64_t v27 = [(ICASDrawingConversionData *)v25 initWithConversionMethod:v26];

  uint64_t v28 = [(ICNAEventReporter *)self noteDataForModernNote:v12];
  id v29 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v12];
  uint64_t v30 = [v12 account];

  v31 = [(ICNAEventReporter *)self accountDataForModernAccount:v30];

  uint64_t v32 = +[ICNAController sharedController];
  uint64_t v33 = objc_opt_class();
  v37[0] = v28;
  v37[1] = v29;
  v37[2] = v31;
  v37[3] = v17;
  v37[4] = v24;
  v37[5] = v27;
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
  unint64_t v35 = [(ICNAEventReporter *)self subTracker];
  [v32 submitEventOfType:v33 pushThenPopDataObjects:v34 subTracker:v35];
}

- (void)submitPaletteEngagementEventForNote:(id)a3 startPosition:(int64_t)a4 endPosition:(int64_t)a5
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(ICNAEventReporter *)self noteDataForModernNote:v8];
  id v10 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v8];
  id v11 = [v8 account];

  id v12 = [(ICNAEventReporter *)self accountDataForModernAccount:v11];

  unint64_t v13 = [ICASPaletteEngagementData alloc];
  uint64_t v14 = [[ICASPaletteEngagementType alloc] initWithPaletteEngagementType:1];
  uint64_t v15 = [(ICASPaletteEngagementData *)v13 initWithPaletteEngagementType:v14];

  uint64_t v16 = [ICASPalettePositionData alloc];
  uint64_t v17 = [[ICASPalettePosition alloc] initWithPalettePosition:a4];
  uint64_t v18 = [[ICASPalettePosition alloc] initWithPalettePosition:a5];
  uint64_t v19 = [(ICASPalettePositionData *)v16 initWithPaletteStartPosition:v17 paletteEndPosition:v18];

  uint64_t v20 = +[ICNAController sharedController];
  uint64_t v21 = objc_opt_class();
  v24[0] = v9;
  v24[1] = v10;
  v24[2] = v12;
  v24[3] = v15;
  v24[4] = v19;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
  uint64_t v23 = [(ICNAEventReporter *)self subTracker];
  [v20 submitEventOfType:v21 pushThenPopDataObjects:v22 subTracker:v23];
}

- (void)submitAttachmentAddEventForAttachment:(id)a3
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__3;
  v59 = __Block_byref_object_dispose__3;
  id v60 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  long long v52 = __Block_byref_object_copy__3;
  long long v53 = __Block_byref_object_dispose__3;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  uint64_t v37 = 0;
  BOOL v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__3;
  id v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__3;
  unint64_t v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 managedObjectContext];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __59__ICNAEventReporter_submitAttachmentAddEventForAttachment___block_invoke;
  id v22 = &unk_1E64B9540;
  uint64_t v24 = &v55;
  id v6 = v4;
  id v23 = v6;
  v25 = &v49;
  id v26 = &v43;
  objc_copyWeak(&v29, &location);
  uint64_t v27 = &v37;
  uint64_t v28 = &v31;
  [v5 performBlockAndWait:&v19];

  unint64_t v7 = +[ICNAIdentityManager sharedManager];
  id v8 = [v7 saltedID:v56[5] forClass:objc_opt_class()];

  id v9 = [ICASAttachmentItemTypeData alloc];
  id v10 = [(ICASAttachmentItemTypeData *)v9 initWithAttachmentID:v8 attachmentUTI:v50[5]];
  id v11 = [ICASAttachmentData alloc];
  v62[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  unint64_t v13 = [(ICASAttachmentData *)v11 initWithAttachmentSummary:v12];

  uint64_t v14 = +[ICNAController sharedController];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = v38[5];
  v61[0] = v44[5];
  v61[1] = v16;
  v61[2] = v32[5];
  v61[3] = v13;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v14 submitEventOfType:v15 pushThenPopDataObjects:v17 subTracker:v18];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);
}

void __59__ICNAEventReporter_submitAttachmentAddEventForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = +[ICNAEventReporter analyticsTypeUTIAttachment:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v21 = [*(id *)(a1 + 32) note];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v9 = [WeakRetained noteDataForModernNote:v21];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id v12 = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v13 = [v12 noteContentDataForModernNote:v21];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  id v16 = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v17 = [v21 account];
  uint64_t v18 = [v16 accountDataForModernAccount:v17];
  uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

- (void)pushStartDocScanPageCountData:(unint64_t)a3
{
  uint64_t v5 = [ICASStartDocScanPageData alloc];
  uint64_t v6 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a3)];
  uint64_t v9 = [(ICASStartDocScanPageData *)v5 initWithStartPageCount:v6];

  unint64_t v7 = +[ICNAController sharedController];
  id v8 = [(ICNAEventReporter *)self subTracker];
  [v7 pushDataObject:v9 unique:1 onlyOnce:0 subTracker:v8];
}

- (void)pushDocScanDataWithID:(id)a3 actionType:(int64_t)a4 stage:(int64_t)a5
{
  id v8 = a3;
  uint64_t v15 = [[ICASDocScanActionType alloc] initWithDocScanActionType:a4];
  uint64_t v9 = [[ICASDocScanStage alloc] initWithDocScanStage:a5];
  uint64_t v10 = +[ICNAIdentityManager sharedManager];
  id v11 = [v10 saltedID:v8 forClass:objc_opt_class()];

  id v12 = [[ICASDocScanData alloc] initWithDocScanID:v11 docScanActionType:v15 docScanStage:v9];
  uint64_t v13 = +[ICNAController sharedController];
  uint64_t v14 = [(ICNAEventReporter *)self subTracker];
  [v13 pushDataObject:v12 unique:0 onlyOnce:1 subTracker:v14];
}

- (void)submitDocScanEventForNote:(id)a3 pageCount:(unint64_t)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  id v8 = [v6 account];

  uint64_t v9 = [(ICNAEventReporter *)self accountDataForModernAccount:v8];

  uint64_t v10 = [ICASEndDocScanPageData alloc];
  id v11 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  id v12 = [(ICASEndDocScanPageData *)v10 initWithEndPageCount:v11];

  uint64_t v13 = +[ICNAController sharedController];
  uint64_t v14 = objc_opt_class();
  v17[0] = v7;
  v17[1] = v9;
  v17[2] = v12;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  id v16 = [(ICNAEventReporter *)self subTracker];
  [v13 submitEventOfType:v14 pushThenPopDataObjects:v15 subTracker:v16];
}

- (void)submitPasswordProtectEventForModernNote:(id)a3
{
  void v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  id v6 = [v4 account];
  unint64_t v7 = [(ICNAEventReporter *)self accountDataForModernAccount:v6];

  id v8 = [(ICNAEventReporter *)self noteContentDataForModernNote:v4];
  uint64_t v9 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v10 = [(ICNAEventReporter *)self passwordDataForModernNote:v4];

  id v11 = +[ICNAController sharedController];
  uint64_t v12 = objc_opt_class();
  v15[0] = v5;
  v15[1] = v7;
  v15[2] = v8;
  v15[3] = v9;
  void v15[4] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  uint64_t v14 = [(ICNAEventReporter *)self subTracker];
  [v11 submitEventOfType:v12 pushThenPopDataObjects:v13 subTracker:v14];
}

- (void)submitChangePasswordEventForModernAccount:(id)a3 isReset:(BOOL)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(ICNAEventReporter *)self accountDataForModernAccount:a3];
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = +[ICNAController sharedController];
  v10[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = [(ICNAEventReporter *)self subTracker];
  [v7 submitEventOfType:v6 pushThenPopDataObjects:v8 subTracker:v9];
}

- (void)submitPasswordFailEventForModernNote:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  uint64_t v6 = [v4 account];
  unint64_t v7 = [(ICNAEventReporter *)self accountDataForModernAccount:v6];

  id v8 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v9 = [(ICNAEventReporter *)self passwordDataForModernNote:v4];

  uint64_t v10 = +[ICNAController sharedController];
  uint64_t v11 = objc_opt_class();
  v14[0] = v5;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v13 = [(ICNAEventReporter *)self subTracker];
  [v10 submitEventOfType:v11 pushThenPopDataObjects:v12 subTracker:v13];
}

- (void)submitPasswordSuccessEventForModernNote:(id)a3
{
  void v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  uint64_t v6 = [v4 account];
  unint64_t v7 = [(ICNAEventReporter *)self accountDataForModernAccount:v6];

  id v8 = [(ICNAEventReporter *)self noteContentDataForModernNote:v4];
  uint64_t v9 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v10 = [(ICNAEventReporter *)self passwordDataForModernNote:v4];

  uint64_t v11 = +[ICNAController sharedController];
  uint64_t v12 = objc_opt_class();
  v15[0] = v5;
  v15[1] = v7;
  v15[2] = v8;
  v15[3] = v9;
  void v15[4] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  uint64_t v14 = [(ICNAEventReporter *)self subTracker];
  [v11 submitEventOfType:v12 pushThenPopDataObjects:v13 subTracker:v14];
}

- (void)submitBiometricsFailEventForModernNote:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];
  uint64_t v6 = [v4 account];
  unint64_t v7 = [(ICNAEventReporter *)self accountDataForModernAccount:v6];

  id v8 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v9 = [(ICNAEventReporter *)self bioAuthDataForModernNote:v4];

  uint64_t v10 = +[ICNAController sharedController];
  uint64_t v11 = objc_opt_class();
  v14[0] = v5;
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  uint64_t v13 = [(ICNAEventReporter *)self subTracker];
  [v10 submitEventOfType:v11 pushThenPopDataObjects:v12 subTracker:v13];
}

- (void)submitChangePasswordModeEventForAccount:(id)a3 contextPath:(int64_t)a4 fromMode:(signed __int16)a5 toMode:(signed __int16)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(ICNAEventReporter *)self passwordModeDataForContextPath:a4 fromMode:a5 toMode:a6];
  id v8 = +[ICNAController sharedController];
  uint64_t v9 = objc_opt_class();
  v12[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v11 = [(ICNAEventReporter *)self subTracker];
  [v8 submitEventOfType:v9 pushThenPopDataObjects:v10 subTracker:v11];
}

- (void)submitFastSyncSessionStartForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7
{
  v28[5] = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = +[ICNAIdentityManager sharedManager];
  uint64_t v18 = [v17 saltedID:v15 forClass:objc_opt_class()];

  uint64_t v19 = [[ICASFastSyncData alloc] initWithFastSyncSessionId:v18 participantVersions:v14];
  uint64_t v20 = [[ICASFastSyncParticipantData alloc] initWithCountOfUniqueAccounts:v13 countOfUniqueDevices:v12];

  id v21 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v16];
  id v22 = [(ICNAEventReporter *)self noteContentDataForModernNote:v16];
  id v23 = [(ICNAEventReporter *)self noteDataForModernNote:v16];

  uint64_t v24 = +[ICNAController sharedController];
  uint64_t v25 = objc_opt_class();
  v28[0] = v19;
  v28[1] = v20;
  v28[2] = v21;
  v28[3] = v22;
  v28[4] = v23;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
  uint64_t v27 = [(ICNAEventReporter *)self subTracker];
  [v24 submitEventOfType:v25 pushThenPopDataObjects:v26 subTracker:v27];
}

- (void)submitFastSyncSessionEndForNote:(id)a3 sessionID:(id)a4 participantVersions:(id)a5 numUniqueAccounts:(id)a6 numUniqueDevices:(id)a7 errorCode:(id)a8 numIgnoredMessages:(id)a9
{
  v40[6] = *MEMORY[0x1E4F143B8];
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = +[ICNAIdentityManager sharedManager];
  uint64_t v39 = [v22 saltedID:v20 forClass:objc_opt_class()];

  BOOL v38 = objc_msgSend(v19, "ic_map:", &__block_literal_global_405);

  id v23 = [[ICASFastSyncData alloc] initWithFastSyncSessionId:v39 participantVersions:v38];
  uint64_t v24 = [[ICASFastSyncParticipantData alloc] initWithCountOfUniqueAccounts:v18 countOfUniqueDevices:v17];

  uint64_t v25 = [ICASFastSyncErrorData alloc];
  if (v16) {
    id v26 = v16;
  }
  else {
    id v26 = &unk_1F1F91058;
  }
  if (v15) {
    uint64_t v27 = v15;
  }
  else {
    uint64_t v27 = &unk_1F1F91058;
  }
  uint64_t v28 = -[ICASFastSyncErrorData initWithErrorCode:countOfIgnoredMessages:](v25, "initWithErrorCode:countOfIgnoredMessages:", v26, v27, self);

  id v29 = [v37 noteAccessDataForModernNote:v21];
  uint64_t v30 = [v37 noteContentDataForModernNote:v21];
  uint64_t v31 = [v37 noteDataForModernNote:v21];

  uint64_t v32 = +[ICNAController sharedController];
  uint64_t v33 = objc_opt_class();
  v40[0] = v23;
  v40[1] = v24;
  v40[2] = v28;
  void v40[3] = v29;
  v40[4] = v30;
  v40[5] = v31;
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:6];
  unint64_t v35 = [v37 subTracker];
  [v32 submitEventOfType:v33 pushThenPopDataObjects:v34 subTracker:v35];
}

uint64_t __147__ICNAEventReporter_submitFastSyncSessionEndForNote_sessionID_participantVersions_numUniqueAccounts_numUniqueDevices_errorCode_numIgnoredMessages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)submitNoteEditEventForModernNote:(id)a3 fromQuickNote:(BOOL)a4
{
  v17[5] = *MEMORY[0x1E4F143B8];
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteEditDataForContextType:v5];
  id v8 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  uint64_t v9 = [v6 account];
  uint64_t v10 = [(ICNAEventReporter *)self accountDataForModernAccount:v9];

  uint64_t v11 = [(ICNAEventReporter *)self noteContentDataForModernNote:v6];
  id v12 = [(ICNAEventReporter *)self noteDataForModernNote:v6];

  id v13 = +[ICNAController sharedController];
  uint64_t v14 = objc_opt_class();
  v17[0] = v8;
  v17[1] = v10;
  v17[2] = v11;
  v17[3] = v7;
  void v17[4] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  id v16 = [(ICNAEventReporter *)self subTracker];
  [v13 submitEventOfType:v14 pushThenPopDataObjects:v15 subTracker:v16];
}

- (void)submitNoteEditEventForHTMLNote:(id)a3
{
  void v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICNAEventReporter *)self noteEditDataForContextType:1];
  id v6 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  unint64_t v7 = [v4 account];
  id v8 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v7];

  uint64_t v9 = [(ICNAEventReporter *)self noteContentDataForHTMLNote:v4];
  uint64_t v10 = [(ICNAEventReporter *)self noteDataForHTMLNote:v4];

  uint64_t v11 = +[ICNAController sharedController];
  uint64_t v12 = objc_opt_class();
  v15[0] = v6;
  v15[1] = v8;
  v15[2] = v9;
  v15[3] = v5;
  void v15[4] = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
  uint64_t v14 = [(ICNAEventReporter *)self subTracker];
  [v11 submitEventOfType:v12 pushThenPopDataObjects:v13 subTracker:v14];
}

- (void)submitChecklistUsageEventForModernNote:(id)a3 countOfCheckedItems:(int64_t)a4 countOfTotalItems:(int64_t)a5 checklistActionType:(int64_t)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [ICASChecklistItemsData alloc];
  uint64_t v12 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  id v13 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a5)];
  uint64_t v14 = [(ICASChecklistItemsData *)v11 initWithCountOfCheckedItems:v12 countOfTotalItems:v13];

  id v15 = [[ICASChecklistAction alloc] initWithChecklistAction:a6];
  if ([MEMORY[0x1E4F83900] checklistAutoSortEnabled]) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  id v17 = [[ICASMoveCheckedItemsToBottomSwitchSetting alloc] initWithMoveCheckedItemsToBottomSwitchSetting:v16];
  id v18 = [[ICASChecklistUsageData alloc] initWithChecklistAction:v15 moveCheckedItemsToBottomSwitchSetting:v17];
  id v19 = [(ICNAEventReporter *)self noteDataForModernNote:v10];

  id v20 = +[ICNAController sharedController];
  uint64_t v21 = objc_opt_class();
  v24[0] = v14;
  v24[1] = v18;
  v24[2] = v19;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  id v23 = [(ICNAEventReporter *)self subTracker];
  [v20 submitEventOfType:v21 pushThenPopDataObjects:v22 subTracker:v23];
}

- (void)submitStyleFormatEventForHTMLNote:(id)a3 styleTypeValue:(int64_t)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  id v8 = [v6 account];
  uint64_t v9 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v8];

  id v10 = [(ICNAEventReporter *)self noteDataForHTMLNote:v6];

  uint64_t v11 = [(ICNAEventReporter *)self styleDataForStyleTypeValue:a4];
  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitStyleFormatEventForModernNote:(id)a3 styleTypeValue:(int64_t)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  id v8 = [v6 account];
  uint64_t v9 = [(ICNAEventReporter *)self accountDataForModernAccount:v8];

  id v10 = [(ICNAEventReporter *)self noteDataForModernNote:v6];

  uint64_t v11 = [(ICNAEventReporter *)self styleDataForStyleTypeValue:a4];
  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitNoteEditorCallOutBarButtonSelectionEventForModernNote:(id)a3 buttonTypeValue:(int64_t)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v6];
  id v8 = [v6 account];
  uint64_t v9 = [(ICNAEventReporter *)self accountDataForModernAccount:v8];

  id v10 = [(ICNAEventReporter *)self noteEditorCallOutBarDataForButtonTypeValue:a4];
  uint64_t v11 = [(ICNAEventReporter *)self noteContentDataForModernNote:v6];

  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitNoteEditorCallOutBarButtonSelectionEventForHTMLNote:(id)a3 buttonTypeValue:(int64_t)a4
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  id v8 = [v6 account];
  uint64_t v9 = [(ICNAEventReporter *)self accountDataForHTMLAccount:v8];

  id v10 = [(ICNAEventReporter *)self noteEditorCallOutBarDataForButtonTypeValue:a4];
  uint64_t v11 = [(ICNAEventReporter *)self noteContentDataForHTMLNote:v6];

  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v7;
  v16[1] = v9;
  v16[2] = v10;
  v16[3] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitMoveCheckedItemsToBottomSwitchEventWithNewState:(BOOL)a3 isInApp:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  unint64_t v7 = [[ICASSwitchSelectionType alloc] initWithSwitchSelectionType:v6];
  id v8 = [[ICASSwitchSelectionData alloc] initWithSwitchSelectionType:v7];
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = [[ICASSwitchSelectionContext alloc] initWithSwitchSelectionContext:v9];
  uint64_t v11 = [[ICASSwitchSelectionContextData alloc] initWithSwitchSelectionContext:v10];
  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v8;
  v16[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitAttachmentBrowserTapEvent
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 pushThenPopDataObjects:MEMORY[0x1E4F1CBF0] subTracker:v4];
}

- (void)submitAttachmentBrowserActionEventForType:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [[ICASActionType alloc] initWithActionType:a3];
  id v5 = [[ICASAttachmentActionData alloc] initWithActionType:v4];
  uint64_t v6 = +[ICNAController sharedController];
  uint64_t v7 = objc_opt_class();
  v10[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = [(ICNAEventReporter *)self subTracker];
  [v6 submitEventOfType:v7 pushThenPopDataObjects:v8 subTracker:v9];
}

- (void)submitSearchAttemptEvent
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 subTracker:v4];
}

- (void)startFindInNoteEvent
{
  uint64_t v3 = objc_opt_class();
  [(ICNAEventReporter *)self startTimedEventOfType:v3];
}

- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 modernNote:(id)a4
{
  BOOL v4 = a3;
  v60[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [ICASFindInNoteData alloc];
  id v8 = [NSNumber numberWithBool:v4];
  uint64_t v9 = [(ICASFindInNoteData *)v7 initWithWasSearchQueryEntered:v8];

  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = __Block_byref_object_copy__3;
  uint64_t v58 = __Block_byref_object_dispose__3;
  id v59 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__3;
  long long v52 = __Block_byref_object_dispose__3;
  id v53 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  uint64_t v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__3;
  uint64_t v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  id v10 = [v6 managedObjectContext];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __75__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_modernNote___block_invoke;
  id v22 = &unk_1E64B9588;
  uint64_t v25 = &v54;
  id v23 = self;
  id v11 = v6;
  id v24 = v11;
  id v26 = &v48;
  uint64_t v27 = &v42;
  uint64_t v28 = &v36;
  id v29 = &v30;
  [v10 performBlockAndWait:&v19];

  uint64_t v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = v55[5];
  v60[0] = v9;
  v60[1] = v14;
  uint64_t v15 = v43[5];
  v60[2] = v49[5];
  v60[3] = v15;
  uint64_t v16 = v31[5];
  v60[4] = v37[5];
  v60[5] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
  id v18 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v17 subTracker:v18];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __75__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_modernNote___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) noteAccessDataForModernNote:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) noteContentDataForModernNote:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) noteDataForModernNote:*(void *)(a1 + 40)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [*(id *)(a1 + 40) folder];
  uint64_t v13 = [v11 folderDataForModernFolder:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void **)(a1 + 32);
  id v20 = [*(id *)(a1 + 40) account];
  uint64_t v17 = [v16 accountDataForModernAccount:v20];
  uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

- (void)submitFindInNoteEventWasSearchQueryEntered:(BOOL)a3 htmlNote:(id)a4
{
  BOOL v4 = a3;
  v49[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [ICASFindInNoteData alloc];
  uint64_t v8 = [NSNumber numberWithBool:v4];
  uint64_t v9 = [(ICASFindInNoteData *)v7 initWithWasSearchQueryEntered:v8];

  id v10 = [(ICNAEventReporter *)self noteAccessDataForHTMLNote];
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  id v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__3;
  id v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__3;
  id v35 = __Block_byref_object_dispose__3;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__3;
  id v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  id v11 = [v6 managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_htmlNote___block_invoke;
  v19[3] = &unk_1E64B95B0;
  uint64_t v21 = &v43;
  v19[4] = self;
  id v12 = v6;
  id v20 = v12;
  id v22 = &v37;
  id v23 = &v31;
  id v24 = &v25;
  [v11 performBlockAndWait:v19];

  uint64_t v13 = +[ICNAController sharedController];
  uint64_t v14 = objc_opt_class();
  v49[0] = v9;
  v49[1] = v10;
  uint64_t v15 = v38[5];
  v49[2] = v44[5];
  v49[3] = v15;
  uint64_t v16 = v26[5];
  v49[4] = v32[5];
  v49[5] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:6];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v13 submitEventOfType:v14 pushThenPopDataObjects:v17 subTracker:v18];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
}

void __73__ICNAEventReporter_submitFindInNoteEventWasSearchQueryEntered_htmlNote___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) noteContentDataForHTMLNote:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) noteDataForHTMLNote:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) folder];
  uint64_t v10 = [v8 folderDataForHTMLFolder:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void **)(a1 + 32);
  id v17 = [*(id *)(a1 + 40) account];
  uint64_t v14 = [v13 accountDataForHTMLAccount:v17];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (void)submitSearchInitiateEventWithSearchSessionID:(id)a3 searchSuggestionType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [ICASSearchData alloc];
  uint64_t v8 = (void *)[v6 copy];

  uint64_t v9 = [(ICASSearchData *)v7 initWithSearchSessionID:v8];
  uint64_t v10 = [(ICNAEventReporter *)self searchSuggestionDataWithSearchSuggestionType:a4];
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    id v20 = v9;
    uint64_t v21 = v10;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v13 = &v20;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v19 = v9;
    id v12 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v13 = &v19;
    uint64_t v14 = 1;
  }
  uint64_t v15 = objc_msgSend(v12, "arrayWithObjects:count:", v13, v14, v19, v20, v21, v22);
  uint64_t v16 = +[ICNAController sharedController];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v16 submitEventOfType:v17 pushThenPopDataObjects:v15 subTracker:v18];
}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[ICASSearchResultCountData alloc] initWithTopHitCount:&unk_1F1F91058 notesCount:&unk_1F1F91058 attachmentsCount:&unk_1F1F91058];
  [(ICNAEventReporter *)self reallySubmitSearchResultSelectEventWithSearchResult:v9 searchSessionID:v8 gmRank:a5 queryLength:0 searchResultCountData:v10 searchSuggestionData:0];
}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 queryLength:(unint64_t)a5 topHitResultCount:(unint64_t)a6 noteResultCount:(unint64_t)a7 attachmentResultCount:(unint64_t)a8 gmRank:(unint64_t)a9
{
  id v25 = a3;
  id v15 = a4;
  uint64_t v16 = [ICASSearchResultCountData alloc];
  uint64_t v17 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a6)];
  uint64_t v18 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a7)];
  uint64_t v19 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a8)];
  id v20 = [(ICASSearchResultCountData *)v16 initWithTopHitCount:v17 notesCount:v18 attachmentsCount:v19];

  uint64_t v21 = [v25 configuration];
  uint64_t v22 = [v21 searchSuggestionType];

  if (v22)
  {
    id v23 = [v25 configuration];
    id v24 = -[ICNAEventReporter searchSuggestionDataWithSearchSuggestionType:](self, "searchSuggestionDataWithSearchSuggestionType:", [v23 searchSuggestionType]);
  }
  else
  {
    id v24 = 0;
  }
  [(ICNAEventReporter *)self reallySubmitSearchResultSelectEventWithSearchResult:v25 searchSessionID:v15 gmRank:a9 queryLength:a5 searchResultCountData:v20 searchSuggestionData:v24];
}

- (void)reallySubmitSearchResultSelectEventWithSearchResult:(id)a3 searchSessionID:(id)a4 gmRank:(unint64_t)a5 queryLength:(unint64_t)a6 searchResultCountData:(id)a7 searchSuggestionData:(id)a8
{
  v49[3] = *MEMORY[0x1E4F143B8];
  id v45 = a7;
  id v44 = a8;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [ICASSearchData alloc];
  uint64_t v17 = (void *)[v14 copy];

  uint64_t v43 = [(ICASSearchData *)v16 initWithSearchSessionID:v17];
  v46 = self;
  id v48 = [(ICNAEventReporter *)self selectedResultAccountTypeForSearchResult:v15];
  uint64_t v18 = [v15 object];
  uint64_t v19 = [v18 searchResultType];

  if (v19) {
    uint64_t v20 = 2 * (v19 == 1);
  }
  else {
    uint64_t v20 = 1;
  }
  id v42 = [[ICASSelectedResultType alloc] initWithSelectedResultType:v20];
  id v47 = [[ICASGmRankingStrategyType alloc] initWithGmRankingStrategyType:2];
  uint64_t v21 = +[ICNAIdentityManager sharedManager];
  uint64_t v22 = [v15 object];
  id v23 = [v22 contentIdentifier];
  id v24 = [v21 saltedID:v23 forClass:objc_opt_class()];

  id v25 = [ICASSearchSelectionData alloc];
  id v26 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a5)];
  uint64_t v27 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a6)];
  uint64_t v28 = NSNumber;
  id v29 = [v15 configuration];
  id v30 = [v29 foundAttachmentObjectID];
  uint64_t v31 = [v28 numberWithInt:v30 != 0];
  uint64_t v32 = NSNumber;
  uint64_t v33 = [v15 configuration];

  uint64_t v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "isTopHit"));
  id v35 = [(ICASSearchSelectionData *)v25 initWithSelectedResultID:v24 selectedResultAccountType:v48 selectedResultType:v42 gmRankingStrategyType:v47 gmRank:v26 searchRankingExperimentSummary:0 gmRankIOS13:0 charLengthOfQueryString:v27 isNoteFoundByAttachment:v31 isTopHit:v34];

  v49[0] = v43;
  v49[1] = v35;
  v49[2] = v45;
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  uint64_t v37 = v36;
  if (v44)
  {
    uint64_t v38 = [v36 arrayByAddingObject:v44];

    uint64_t v37 = (void *)v38;
  }
  uint64_t v39 = +[ICNAController sharedController];
  uint64_t v40 = objc_opt_class();
  id v41 = [(ICNAEventReporter *)v46 subTracker];
  [v39 submitEventOfType:v40 pushThenPopDataObjects:v37 subTracker:v41];
}

- (void)submitSearchResultExposureSummaryEventWithSearchResultExposureData:(id)a3 searchSessionID:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ICASSearchData alloc] initWithSearchSessionID:v6];

  id v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v8;
  v13[1] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  id v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (id)tipImpressionEventDataObjectsForFeature:(id)a3 andModernNote:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = [(ICNAEventReporter *)self tipDataForFeature:v8];

  uint64_t v11 = objc_msgSend(v9, "initWithObjects:", v10, 0);
  if (v6)
  {
    id v12 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
    [v11 addObject:v12];
  }
  uint64_t v13 = (void *)[v11 copy];

  return v13;
}

- (void)startTipImpressionEventDurationTrackingForFeature:(id)a3 andModernNote:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  id v10 = [(ICNAEventReporter *)self tipImpressionEventDataObjectsForFeature:v7 andModernNote:v6];

  id v8 = +[ICNAController sharedController];
  id v9 = [(ICNAEventReporter *)self subTracker];
  [v8 pushDataObjects:v10 unique:1 onlyOnce:0 subTracker:v9];
}

- (void)submitTipImpressionEventForFeature:(id)a3 andModernNote:(id)a4
{
  id v7 = [(ICNAEventReporter *)self tipImpressionEventDataObjectsForFeature:a3 andModernNote:a4];
  uint64_t v5 = +[ICNAController sharedController];
  id v6 = [(ICNAEventReporter *)self subTracker];
  [v5 pushDataObjects:v7 unique:1 onlyOnce:1 subTracker:v6];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (id)tipLearnMoreClickEventDataObjectsForFeature:(id)a3 learnMoreTipName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ICASTipLearnMoreData alloc] initWithLearnMoreTipName:v5 tipFeature:v6];

  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);
  id v9 = (void *)[v8 copy];

  return v9;
}

- (void)submitTipLearnMoreClickEventForFeature:(id)a3 learnMoreTipName:(id)a4
{
  id v8 = [(ICNAEventReporter *)self tipLearnMoreClickEventDataObjectsForFeature:a3 learnMoreTipName:a4];
  id v5 = +[ICNAController sharedController];
  uint64_t v6 = objc_opt_class();
  id v7 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v6 pushThenPopDataObjects:v8 subTracker:v7];
}

- (void)submitSnapshotRegisterEventIsSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = [ICASResultType alloc];
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(ICASResultType *)v5 initWithResultType:v6];
  id v8 = [[ICASResultData alloc] initWithResultType:v7];
  id v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (void)submitSnapshotTriggeredEvent
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 subTracker:v4];
}

- (void)submitSnapshotCompletionEventIsSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = [ICASResultType alloc];
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(ICASResultType *)v5 initWithResultType:v6];
  id v8 = [[ICASResultData alloc] initWithResultType:v7];
  id v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v8;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (void)submitNoteActionMenuEventForNoteEditorWithUsageType:(int64_t)a3 activityType:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [[ICASActionMenuUsageType alloc] initWithActionMenuUsageType:a3];
  id v8 = [[ICASActionMenuContextType alloc] initWithActionMenuContextType:1];
  id v9 = [ICASActionMenuData alloc];
  uint64_t v10 = [(id)objc_opt_class() filteredActivityType:v6];

  uint64_t v11 = [(ICASActionMenuData *)v9 initWithActionMenuUsageType:v7 actionMenuContextType:v8 actionMenuSelection:v10];
  id v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  v16[0] = v11;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v14 subTracker:v15];
}

- (void)submitNoteActionMenuEventForNoteBrowserWithUsageType:(int64_t)a3 layout:(int64_t)a4 activityType:(id)a5 isTimelineView:(BOOL)a6
{
  BOOL v6 = a6;
  v24[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = [[ICASActionMenuUsageType alloc] initWithActionMenuUsageType:a3];
  id v12 = [[ICASActionMenuContextType alloc] initWithActionMenuContextType:2];
  uint64_t v13 = [ICASActionMenuData alloc];
  id v14 = [(id)objc_opt_class() filteredActivityType:v10];

  id v15 = [(ICASActionMenuData *)v13 initWithActionMenuUsageType:v11 actionMenuContextType:v12 actionMenuSelection:v14];
  uint64_t v16 = [ICASLayoutData alloc];
  uint64_t v17 = [[ICASLayoutType alloc] initWithLayoutType:a4];
  uint64_t v18 = [NSNumber numberWithBool:v6];
  uint64_t v19 = [(ICASLayoutData *)v16 initWithLayoutType:v17 isTimelineView:v18];

  uint64_t v20 = +[ICNAController sharedController];
  uint64_t v21 = objc_opt_class();
  v24[0] = v15;
  v24[1] = v19;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v23 = [(ICNAEventReporter *)self subTracker];
  [v20 submitEventOfType:v21 pushThenPopDataObjects:v22 subTracker:v23];
}

- (void)submitTagBrowserSelectionEventWithSelectedTagCount:(unint64_t)a3 isAllTagsSelected:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = [ICASTagBrowserSelectionData alloc];
  id v8 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a3)];
  id v9 = [NSNumber numberWithBool:v4];
  id v10 = [(ICASTagBrowserSelectionData *)v7 initWithCountOfSelectedTags:v8 isAllTagsSelected:v9];

  uint64_t v11 = +[ICNAController sharedController];
  uint64_t v12 = objc_opt_class();
  v15[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v14 = [(ICNAEventReporter *)self subTracker];
  [v11 submitEventOfType:v12 pushThenPopDataObjects:v13 subTracker:v14];
}

- (void)submitMentionAddEventForNote:(id)a3 mentionID:(id)a4 participantID:(id)a5 viaAutoComplete:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [a3 objectID];
  uint64_t v13 = [MEMORY[0x1E4F83428] sharedContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__ICNAEventReporter_submitMentionAddEventForNote_mentionID_participantID_viaAutoComplete___block_invoke;
  v17[3] = &unk_1E64B95D8;
  id v18 = v12;
  id v19 = v11;
  BOOL v22 = a6;
  id v20 = v10;
  uint64_t v21 = self;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [v13 performBackgroundTask:v17];
}

void __90__ICNAEventReporter_submitMentionAddEventForNote_mentionID_participantID_viaAutoComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F83418], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), a2);
  BOOL v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = objc_msgSend(v3, "inlineAttachments", 0);
    BOOL v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v10 isMentionAttachment])
          {
            id v11 = *(void **)(a1 + 40);
            uint64_t v12 = [v10 tokenContentIdentifier];
            if ([v11 isEqualToString:v12])
            {
              uint64_t v13 = [v10 identifier];
              int v14 = [v13 isEqualToString:*(void *)(a1 + 48)];

              if (!v14)
              {
                uint64_t v7 = 1;
                goto LABEL_14;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }
LABEL_14:

    id v15 = [ICASMentionAddApproach alloc];
    if (*(unsigned char *)(a1 + 64)) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 1;
    }
    uint64_t v17 = [(ICASMentionAddApproach *)v15 initWithMentionAddApproach:v16];
    id v18 = [ICASMentionAddData alloc];
    id v19 = [NSNumber numberWithBool:v7];
    id v20 = [(ICASMentionAddData *)v18 initWithIsExistingMention:v19 mentionAddApproach:v17];

    uint64_t v21 = [*(id *)(a1 + 56) noteDataForModernNote:v4];
    BOOL v22 = +[ICNAController sharedController];
    uint64_t v23 = objc_opt_class();
    v30[0] = v21;
    v30[1] = v20;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    id v25 = [*(id *)(a1 + 56) subTracker];
    [v22 submitEventOfType:v23 pushThenPopDataObjects:v24 subTracker:v25];
  }
}

- (void)submitMentionDeleteEvent:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(ICNAEventReporter *)self noteDataForModernNote:a3];
  id v5 = +[ICNAController sharedController];
  uint64_t v6 = objc_opt_class();
  v9[0] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  uint64_t v8 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v6 pushThenPopDataObjects:v7 subTracker:v8];
}

- (void)submitCollabSummaryEventForObject:(id)a3 withUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(ICNAEventReporter *)self objectDataForCloudSyncingObject:a3];
  uint64_t v7 = [ICASStreamUpdateData alloc];
  uint64_t v8 = [NSNumber numberWithBool:v4];
  id v9 = [(ICASStreamUpdateData *)v7 initWithHasUpdates:v8];

  id v10 = +[ICNAController sharedController];
  uint64_t v11 = objc_opt_class();
  v14[0] = v6;
  v14[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v13 = [(ICNAEventReporter *)self subTracker];
  [v10 submitEventOfType:v11 pushThenPopDataObjects:v12 subTracker:v13];
}

- (void)submitCollabActivityBrowseEventForObject:(id)a3 contextPath:(int64_t)a4 clickContext:(int64_t)a5 mode:(int64_t)a6 isCurrentUserMentioned:(BOOL)a7 hasRecentUpdates:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  v26[2] = *MEMORY[0x1E4F143B8];
  int v14 = [(ICNAEventReporter *)self objectDataForCloudSyncingObject:a3];
  id v15 = [ICASCollabActivityData alloc];
  uint64_t v16 = [[ICASCollabActivityContextPath alloc] initWithCollabActivityContextPath:a4];
  uint64_t v17 = [[ICASClickContext alloc] initWithClickContext:a5];
  id v18 = [[ICASMode alloc] initWithMode:a6];
  id v19 = [NSNumber numberWithBool:v9];
  id v20 = [NSNumber numberWithBool:v8];
  uint64_t v21 = [(ICASCollabActivityData *)v15 initWithCollabActivityContextPath:v16 clickContext:v17 mode:v18 isUserMentioned:v19 hasRecentUpdates:v20];

  BOOL v22 = +[ICNAController sharedController];
  uint64_t v23 = objc_opt_class();
  v26[0] = v14;
  v26[1] = v21;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v25 = [(ICNAEventReporter *)self subTracker];
  [v22 submitEventOfType:v23 pushThenPopDataObjects:v24 subTracker:v25];
}

- (void)startAttributionSideBarViewEventForNote:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [[ICASCollabActivityContextPath alloc] initWithCollabActivityContextPath:0];
    uint64_t v6 = [ICASEditorCallOutData alloc];
    uint64_t v7 = [[ICASStartState alloc] initWithStartState:0];
    BOOL v8 = [[ICASEndState alloc] initWithEndState:0];
    BOOL v9 = [(ICASEditorCallOutData *)v6 initWithCollabActivityContextPath:v5 startState:v7 endState:v8];

    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    long long v26 = __Block_byref_object_copy__3;
    long long v27 = __Block_byref_object_dispose__3;
    id v28 = 0;
    id v10 = [v4 managedObjectContext];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __61__ICNAEventReporter_startAttributionSideBarViewEventForNote___block_invoke;
    id v19 = &unk_1E64B94A8;
    BOOL v22 = &v23;
    id v20 = self;
    id v21 = v4;
    [v10 performBlockAndWait:&v16];

    if (v24[5])
    {
      uint64_t v11 = +[ICNAController sharedController];
      uint64_t v12 = v24[5];
      v29[0] = v9;
      v29[1] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      int v14 = [(ICNAEventReporter *)self subTracker];
      [v11 pushDataObjects:v13 unique:1 onlyOnce:0 subTracker:v14];

      [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
    }
    else
    {
      id v15 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICNAEventReporter startAttributionSideBarViewEventForNote:]();
      }
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v5 = (ICASCollabActivityContextPath *)os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
      -[ICNAEventReporter startAttributionSideBarViewEventForNote:]();
    }
  }
}

uint64_t __61__ICNAEventReporter_startAttributionSideBarViewEventForNote___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) noteDataForModernNote:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (void)submitAttributionSideBarViewEventForNote:(id)a3 contextPath:(int64_t)a4 startState:(int64_t)a5 endState:(int64_t)a6
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    uint64_t v11 = [[ICASCollabActivityContextPath alloc] initWithCollabActivityContextPath:a4];
    uint64_t v12 = [ICASEditorCallOutData alloc];
    uint64_t v13 = [[ICASStartState alloc] initWithStartState:a5];
    int v14 = [[ICASEndState alloc] initWithEndState:a6];
    id v15 = [(ICASEditorCallOutData *)v12 initWithCollabActivityContextPath:v11 startState:v13 endState:v14];

    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__3;
    uint64_t v33 = __Block_byref_object_dispose__3;
    id v34 = 0;
    uint64_t v16 = [v10 managedObjectContext];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __94__ICNAEventReporter_submitAttributionSideBarViewEventForNote_contextPath_startState_endState___block_invoke;
    uint64_t v25 = &unk_1E64B94A8;
    id v28 = &v29;
    long long v26 = self;
    id v27 = v10;
    [v16 performBlockAndWait:&v22];

    if (v15)
    {
      if (v30[5])
      {
        uint64_t v17 = +[ICNAController sharedController];
        uint64_t v18 = v30[5];
        v35[0] = v15;
        v35[1] = v18;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        id v20 = [(ICNAEventReporter *)self subTracker];
        [v17 pushDataObjects:v19 unique:1 onlyOnce:0 subTracker:v20];

        [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
LABEL_12:

        _Block_object_dispose(&v29, 8);
        goto LABEL_13;
      }
      id v21 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:]();
      }
    }
    else
    {
      id v21 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:]();
      }
    }

    goto LABEL_12;
  }
  uint64_t v11 = (ICASCollabActivityContextPath *)os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
    -[ICNAEventReporter submitAttributionSideBarViewEventForNote:contextPath:startState:endState:]();
  }
LABEL_13:
}

uint64_t __94__ICNAEventReporter_submitAttributionSideBarViewEventForNote_contextPath_startState_endState___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) noteDataForModernNote:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (void)startActivityStreamSummaryEventForObject:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [v5 serverShareCheckingParent];
  objc_msgSend(v4, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v6, "ic_nonOwnerInvitedParticipantsCount")));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = NSNumber;
  BOOL v8 = [v5 serverShareCheckingParent];

  BOOL v9 = objc_msgSend(v7, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v8, "ic_nonOwnerAcceptedParticipantsCount")));

  id v10 = [[ICASStartCollaborationCollaboratorData alloc] initWithStartInvitedCount:v13 startAcceptedCount:v9];
  uint64_t v11 = +[ICNAController sharedController];
  uint64_t v12 = [(ICNAEventReporter *)self subTracker];
  [v11 pushDataObject:v10 unique:1 onlyOnce:0 subTracker:v12];
}

- (void)submitActivityStreamSummaryEventForObject:(id)a3 halfHeightViewDuration:(double)a4 fullHeightViewDuration:(double)a5 sideBarViewDuration:(double)a6 minimizedViewDuration:(double)a7
{
  id v12 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = __Block_byref_object_copy__3;
  id v48 = __Block_byref_object_dispose__3;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__3;
  id v42 = __Block_byref_object_dispose__3;
  id v43 = 0;
  id v13 = [v12 managedObjectContext];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __151__ICNAEventReporter_submitActivityStreamSummaryEventForObject_halfHeightViewDuration_fullHeightViewDuration_sideBarViewDuration_minimizedViewDuration___block_invoke;
  uint64_t v33 = &unk_1E64B9600;
  id v14 = v12;
  id v36 = &v44;
  uint64_t v37 = &v38;
  id v34 = v14;
  id v35 = self;
  [v13 performBlockAndWait:&v30];

  id v15 = [ICASActivityStreamDurationSummaryData alloc];
  uint64_t v16 = NSNumber;
  ICNARoundTo2SigFigs(a4 * 1000.0);
  uint64_t v17 = objc_msgSend(v16, "numberWithDouble:", v30, v31, v32, v33);
  uint64_t v18 = NSNumber;
  ICNARoundTo2SigFigs(a5 * 1000.0);
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  id v20 = NSNumber;
  ICNARoundTo2SigFigs(a6 * 1000.0);
  id v21 = objc_msgSend(v20, "numberWithDouble:");
  uint64_t v22 = NSNumber;
  ICNARoundTo2SigFigs(a7 * 1000.0);
  uint64_t v23 = objc_msgSend(v22, "numberWithDouble:");
  id v24 = [(ICASActivityStreamDurationSummaryData *)v15 initWithHalfHeightViewDuration:v17 fullHeightViewDuration:v19 sideBarViewDuration:v21 minimizedViewDuration:v23];

  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "ic_arrayFromNonNilObject:", v45[5]);
  objc_msgSend(v25, "ic_addNonNilObject:", v39[5]);
  objc_msgSend(v25, "ic_addNonNilObject:", v24);
  long long v26 = +[ICNAController sharedController];
  uint64_t v27 = objc_opt_class();
  id v28 = (void *)[v25 copy];
  uint64_t v29 = [(ICNAEventReporter *)self subTracker];
  [v26 submitEventOfType:v27 pushThenPopDataObjects:v28 subTracker:v29];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

void __151__ICNAEventReporter_submitActivityStreamSummaryEventForObject_halfHeightViewDuration_fullHeightViewDuration_sideBarViewDuration_minimizedViewDuration___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSNumber;
  BOOL v3 = [*(id *)(a1 + 32) serverShareCheckingParent];
  objc_msgSend(v2, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v3, "ic_nonOwnerInvitedParticipantsCount")));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = NSNumber;
  id v5 = [*(id *)(a1 + 32) serverShareCheckingParent];
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "ic_nonOwnerAcceptedParticipantsCount")));

  uint64_t v7 = [[ICASEndCollaborationCollaboratorData alloc] initWithEndInvitedCount:v13 endAcceptedCount:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*(id *)(a1 + 40) objectDataForCloudSyncingObject:*(void *)(a1 + 32)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (void)submitHashtagAddEventForNote:(id)a3 tokenContentIdentifier:(id)a4 viaAutoComplete:(BOOL)a5
{
  id v8 = a4;
  BOOL v9 = [a3 objectID];
  uint64_t v10 = [MEMORY[0x1E4F83428] sharedContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __89__ICNAEventReporter_submitHashtagAddEventForNote_tokenContentIdentifier_viaAutoComplete___block_invoke;
  void v13[3] = &unk_1E64B9628;
  id v14 = v9;
  id v15 = v8;
  BOOL v17 = a5;
  uint64_t v16 = self;
  id v11 = v8;
  id v12 = v9;
  [v10 performBackgroundTask:v13];
}

void __89__ICNAEventReporter_submitHashtagAddEventForNote_tokenContentIdentifier_viaAutoComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F83418], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), a2);
  id v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = objc_msgSend(v3, "inlineAttachments", 0);
    uint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v10 isHashtagAttachment])
          {
            id v11 = [v10 tokenContentIdentifier];
            char v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

            if (v12)
            {
              uint64_t v7 = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v13 = [ICASTagAddApproach alloc];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
    id v15 = [(ICASTagAddApproach *)v13 initWithTagAddApproach:v14];
    uint64_t v16 = [MEMORY[0x1E4F83390] shouldAutoConvertToTag];
    BOOL v17 = [ICASTagAddData alloc];
    uint64_t v18 = [NSNumber numberWithBool:v7];
    id v19 = [NSNumber numberWithBool:v16];
    id v20 = [(ICASTagAddData *)v17 initWithIsExistingTag:v18 tagAddApproach:v15 isAutoConversionEnabled:v19];

    id v21 = [*(id *)(a1 + 48) noteDataForModernNote:v4];
    uint64_t v22 = +[ICNAController sharedController];
    uint64_t v23 = objc_opt_class();
    v30[0] = v20;
    v30[1] = v21;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    uint64_t v25 = [*(id *)(a1 + 48) subTracker];
    [v22 submitEventOfType:v23 pushThenPopDataObjects:v24 subTracker:v25];
  }
}

- (void)submitHashtagDeleteEvent:(id)a3 approachEnum:(int64_t)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(ICNAEventReporter *)self noteDataForModernNote:a3];
  uint64_t v7 = [[ICASTagDeleteApproach alloc] initWithTagDeleteApproach:a4];
  uint64_t v8 = [[ICASTagDeleteData alloc] initWithTagDeleteApproach:v7];
  BOOL v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v6;
  v13[1] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  char v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (void)submitHashtagRenameEvent:(id)a3 approachEnum:(int64_t)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(ICNAEventReporter *)self noteDataForModernNote:a3];
  uint64_t v7 = [[ICASTagRenameApproach alloc] initWithTagRenameApproach:a4];
  uint64_t v8 = [[ICASTagRenameData alloc] initWithTagRenameApproach:v7];
  BOOL v9 = +[ICNAController sharedController];
  uint64_t v10 = objc_opt_class();
  v13[0] = v6;
  v13[1] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  char v12 = [(ICNAEventReporter *)self subTracker];
  [v9 submitEventOfType:v10 pushThenPopDataObjects:v11 subTracker:v12];
}

- (void)submitAppReviewPromptRequestEvent
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  id v4 = [(ICNAEventReporter *)self subTracker];
  [v5 submitEventOfType:v3 subTracker:v4];
}

- (void)submitNotesToPagesEventWithContextPath:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [[ICASNotesToPagesContextPath alloc] initWithNotesToPagesContextPath:a3];
  id v5 = [[ICASNotesToPagesContextPathData alloc] initWithNotesToPagesContextPath:v4];
  uint64_t v6 = +[ICNAController sharedController];
  uint64_t v7 = objc_opt_class();
  v10[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  BOOL v9 = [(ICNAEventReporter *)self subTracker];
  [v6 submitEventOfType:v7 pushThenPopDataObjects:v8 subTracker:v9];
}

- (int64_t)addApproachEnumForAddApproach:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1C3F18350[a3 - 1];
  }
}

- (int64_t)linkContentTypeEnumForURL:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F83290] isShowNoteURL:v3] & 1) != 0
    || ([MEMORY[0x1E4F83290] isShowHTMLNoteURL:v3] & 1) != 0
    || ([MEMORY[0x1E4F83290] isShowLegacyNoteURL:v3] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if (([MEMORY[0x1E4F83290] isShowFolderURL:v3] & 1) != 0 {
         || ([MEMORY[0x1E4F83290] isShowHTMLFolderURL:v3] & 1) != 0)
  }
  {
    int64_t v4 = 2;
  }
  else if (objc_msgSend(v3, "ic_isWebURL"))
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 4 * (v3 != 0);
  }

  return v4;
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6
{
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 contentType:(int64_t)a5 isTokenized:(BOOL)a6 noteData:(id *)a7 noteContentData:(id *)a8 noteAccessData:(id *)a9
{
  BOOL v11 = a6;
  v31[4] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v16 = [[ICASLinkAddApproach alloc] initWithLinkAddApproach:[(ICNAEventReporter *)self addApproachEnumForAddApproach:a4]];
  BOOL v17 = [[ICASLinkContentType alloc] initWithLinkContentType:a5];
  uint64_t v18 = [ICASLinkAddData alloc];
  id v19 = [NSNumber numberWithBool:v11];
  long long v28 = v17;
  long long v29 = v16;
  uint64_t v30 = [(ICASLinkAddData *)v18 initWithLinkAddApproach:v16 linkContentType:v17 isTokenizedLink:v19];

  if (a7 && (id v20 = *a7) != 0)
  {
    if (!a8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v20 = [(ICNAEventReporter *)self noteDataForModernNote:v15];
    if (!a8)
    {
LABEL_7:
      id v21 = [(ICNAEventReporter *)self noteContentDataForModernNote:v15];
      goto LABEL_8;
    }
  }
  id v21 = *a8;
  if (!v21) {
    goto LABEL_7;
  }
LABEL_8:
  if (!a9 || (id v22 = *a9) == 0)
  {
    id v22 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v15];
  }
  uint64_t v23 = v15;
  id v24 = +[ICNAController sharedController];
  uint64_t v25 = objc_opt_class();
  v31[0] = v30;
  v31[1] = v20;
  v31[2] = v21;
  v31[3] = v22;
  long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  long long v27 = [(ICNAEventReporter *)self subTracker];
  [v24 submitEventOfType:v25 pushThenPopDataObjects:v26 subTracker:v27];

  if (a7) {
    *a7 = v20;
  }
  if (a8) {
    *a8 = v21;
  }
  if (a9) {
    *a9 = v22;
  }
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5
{
  id v8 = a3;
  [(ICNAEventReporter *)self submitAddLinkEvent:v8 addApproach:a4 contentType:[(ICNAEventReporter *)self linkContentTypeEnumForURL:a5] isTokenized:0];
}

- (void)submitAddLinkEvent:(id)a3 addApproach:(int64_t)a4 url:(id)a5 noteData:(id *)a6 noteContentData:(id *)a7 noteAccessData:(id *)a8
{
  id v14 = a3;
  [(ICNAEventReporter *)self submitAddLinkEvent:v14 addApproach:a4 contentType:[(ICNAEventReporter *)self linkContentTypeEnumForURL:a5] isTokenized:0 noteData:a6 noteContentData:a7 noteAccessData:a8];
}

- (void)submitLinkedNoteAcceleratorInitiateEvent:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
  uint64_t v6 = [(ICNAEventReporter *)self noteContentDataForModernNote:v4];
  uint64_t v7 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v4];

  id v8 = +[ICNAController sharedController];
  uint64_t v9 = objc_opt_class();
  v12[0] = v5;
  v12[1] = v6;
  void v12[2] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  BOOL v11 = [(ICNAEventReporter *)self subTracker];
  [v8 submitEventOfType:v9 pushThenPopDataObjects:v10 subTracker:v11];
}

- (void)submitLinkedNoteAcceleratorEndEvent:(id)a3 maxCharactersTyped:(unint64_t)a4 endResultCount:(unint64_t)a5
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [ICASAcceleratorUsageData alloc];
  uint64_t v10 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  BOOL v11 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a5)];
  char v12 = [(ICASAcceleratorUsageData *)v9 initWithMaxNumCharTyped:v10 endResultCount:v11];

  id v13 = [(ICNAEventReporter *)self noteDataForModernNote:v8];
  id v14 = [(ICNAEventReporter *)self noteContentDataForModernNote:v8];
  id v15 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v8];

  uint64_t v16 = +[ICNAController sharedController];
  uint64_t v17 = objc_opt_class();
  v20[0] = v12;
  v20[1] = v13;
  v20[2] = v14;
  v20[3] = v15;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  id v19 = [(ICNAEventReporter *)self subTracker];
  [v16 submitEventOfType:v17 pushThenPopDataObjects:v18 subTracker:v19];
}

- (void)submitPDFWorkflowEngagementSummary:(id)a3 modernNote:(id)a4
{
  v44[7] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v43 = [(ICNAEventReporter *)self noteDataForModernNote:v6];
  id v41 = [(ICNAEventReporter *)self noteContentDataForModernNote:v6];

  uint64_t v40 = -[ICASPdfState initWithPdfState:]([ICASPdfState alloc], "initWithPdfState:", [v7 startState]);
  uint64_t v39 = -[ICASPdfState initWithPdfState:]([ICASPdfState alloc], "initWithPdfState:", [v7 endState]);
  id v8 = [ICASPdfStateData alloc];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasSmallStateUsage"));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasMediumStateUsage"));
  BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasLargeStateUsage"));
  char v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasFullscreenStateUsage"));
  uint64_t v38 = [(ICASPdfStateData *)v8 initWithPdfStartState:v40 pdfEndState:v39 hasSmallStateUsage:v9 hasMediumStateUsage:v10 hasLargeStateUsage:v11 hasFullScreenStateUsage:v12];

  id v13 = [ICASPdfPageData alloc];
  id v14 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "startPageCount")));
  id v15 = objc_msgSend(NSNumber, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "endPageCount")));
  uint64_t v16 = [(ICASPdfPageData *)v13 initWithStartPageCount:v14 endPageCount:v15];

  uint64_t v17 = [ICASPdfAttachmentData alloc];
  uint64_t v18 = [v7 attachmentIdentifier];
  id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasActivity"));
  id v20 = [(ICASPdfAttachmentData *)v17 initWithAttachmentID:v18 hasActivity:v19];

  id v21 = [ICASPdfCollabIxData alloc];
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasCollabView"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasCollabEdit"));
  uint64_t v37 = [(ICASPdfCollabIxData *)v21 initWithHasCollabView:v22 hasCollabEdit:v23];

  id v24 = [ICASPdfNavIxData alloc];
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasGestures"));
  long long v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasScroll"));
  long long v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasPagination"));
  long long v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasPinchZoom"));
  long long v29 = NSNumber;
  uint64_t v30 = [v7 hasPinchToExpandState];

  uint64_t v31 = [v29 numberWithBool:v30];
  id v36 = [(ICASPdfNavIxData *)v24 initWithHasGestures:v25 hasScroll:v26 hasPagination:v27 hasPinchZoom:v28 hasPinchToExpandState:v31];

  uint64_t v32 = +[ICNAController sharedController];
  uint64_t v33 = objc_opt_class();
  v44[0] = v43;
  v44[1] = v41;
  v44[2] = v38;
  v44[3] = v16;
  v44[4] = v20;
  v44[5] = v37;
  v44[6] = v36;
  id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:7];
  id v35 = [(ICNAEventReporter *)self subTracker];
  [v32 submitEventOfType:v33 pushThenPopDataObjects:v34 subTracker:v35];
}

- (void)startAudioRecordingEvent
{
  uint64_t v3 = objc_opt_class();
  [(ICNAEventReporter *)self startTimedEventOfType:v3];
}

- (void)submitAudioRecordingEventWithAttachment:(id)a3 appBackgroundOccurred:(BOOL)a4 noteMultitaksingOccurred:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v28 = [(ICNAEventReporter *)self audioAttachmentDataForModernAttachment:v8];
  long long v27 = [(ICNAEventReporter *)self audioRecordingDataForModernAttachment:v8 appBackgroundOccurred:v6 noteMultitaskingOccurred:v5];
  uint64_t v9 = [v8 note];
  uint64_t v10 = [(ICNAEventReporter *)self noteContentDataForModernNote:v9];

  BOOL v11 = [v8 note];
  char v12 = [(ICNAEventReporter *)self noteDataForModernNote:v11];

  id v13 = [v8 note];
  id v14 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v13];

  id v15 = [v8 note];
  uint64_t v16 = [v15 folder];
  uint64_t v17 = [(ICNAEventReporter *)self folderDataForModernFolder:v16];

  uint64_t v18 = [v8 account];

  id v19 = [(ICNAEventReporter *)self accountDataForModernAccount:v18];

  id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v28, v27, v10, v12, v14, v17, v19, 0);
  id v21 = +[ICNAController sharedController];
  id v22 = [(ICNAEventReporter *)self subTracker];
  [v21 pushDataObjects:v20 unique:1 onlyOnce:1 subTracker:v22];

  uint64_t v23 = +[ICNAController sharedController];
  id v24 = [(ICNAEventReporter *)self subTracker];
  [v23 enterGroupWithSubtracker:v24];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
  uint64_t v25 = +[ICNAController sharedController];
  long long v26 = [(ICNAEventReporter *)self subTracker];
  [v25 leaveGroupWithSubtracker:v26];
}

- (void)submitAudioTranscriptInteractionEventSummaryViewed:(BOOL)a3 transcriptViewed:(BOOL)a4 interactionTargets:(id)a5 interactionTypes:(id)a6 audioAttachment:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a7;
  id v29 = [(ICNAEventReporter *)self audioTranscriptInteractionDataWithSummaryViewed:v10 transcriptViewed:v9 interactionTargets:a5 interactionTypes:a6];
  id v13 = [(ICNAEventReporter *)self audioAttachmentDataForModernAttachment:v12];
  id v14 = [v12 note];
  id v15 = [(ICNAEventReporter *)self noteContentDataForModernNote:v14];

  uint64_t v16 = [v12 note];
  uint64_t v17 = [(ICNAEventReporter *)self noteDataForModernNote:v16];

  uint64_t v18 = [v12 note];
  id v19 = [(ICNAEventReporter *)self noteAccessDataForModernNote:v18];

  id v20 = [v12 note];
  id v21 = [v20 folder];
  id v22 = [(ICNAEventReporter *)self folderDataForModernFolder:v21];

  uint64_t v23 = [v12 account];

  id v24 = [(ICNAEventReporter *)self accountDataForModernAccount:v23];

  uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v29, v13, v15, v17, v19, v22, v24, 0);
  long long v26 = +[ICNAController sharedController];
  uint64_t v27 = objc_opt_class();
  id v28 = [(ICNAEventReporter *)self subTracker];
  [v26 submitEventOfType:v27 pushThenPopDataObjects:v25 subTracker:v28];
}

- (void)submitFindInTranscriptEventWasSearchQueryEntered:(BOOL)a3 audioAttachment:(id)a4
{
  BOOL v4 = a3;
  v60[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [ICASFindInTranscriptData alloc];
  id v8 = [NSNumber numberWithBool:v4];
  BOOL v9 = [(ICASFindInTranscriptData *)v7 initWithWasSearchQueryEntered:v8];

  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = __Block_byref_object_copy__3;
  uint64_t v58 = __Block_byref_object_dispose__3;
  id v59 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__3;
  long long v52 = __Block_byref_object_dispose__3;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__3;
  uint64_t v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  uint64_t v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__3;
  id v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  BOOL v10 = [v6 managedObjectContext];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __86__ICNAEventReporter_submitFindInTranscriptEventWasSearchQueryEntered_audioAttachment___block_invoke;
  id v22 = &unk_1E64B9650;
  id v11 = v6;
  id v23 = v11;
  id v24 = self;
  uint64_t v25 = &v54;
  long long v26 = &v48;
  uint64_t v27 = &v42;
  id v28 = &v36;
  id v29 = &v30;
  [v10 performBlockAndWait:&v19];

  id v12 = +[ICNAController sharedController];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = v55[5];
  v60[0] = v9;
  v60[1] = v14;
  uint64_t v15 = v43[5];
  v60[2] = v49[5];
  v60[3] = v15;
  uint64_t v16 = v31[5];
  v60[4] = v37[5];
  v60[5] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
  uint64_t v18 = [(ICNAEventReporter *)self subTracker];
  [v12 submitEventOfType:v13 pushThenPopDataObjects:v17 subTracker:v18];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __86__ICNAEventReporter_submitFindInTranscriptEventWasSearchQueryEntered_audioAttachment___block_invoke(uint64_t a1)
{
  id v21 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [*(id *)(a1 + 40) noteAccessDataForModernNote:v21];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 40) noteContentDataForModernNote:v21];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 40) noteDataForModernNote:v21];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(a1 + 40);
  id v12 = [v21 folder];
  uint64_t v13 = [v11 folderDataForModernFolder:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void **)(a1 + 40);
  uint64_t v17 = [v21 account];
  uint64_t v18 = [v16 accountDataForModernAccount:v17];
  uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

+ (void)setNoteCreateApproachEnumToAppSuiteDefaults:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  BOOL v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forKey:@"analyticsNoteCreateApproachEnumValue"];
}

+ (void)resetNoteCreateApproachEnumInAppSuiteDefaults
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v2 removeObjectForKey:@"analyticsNoteCreateApproachEnumValue"];
}

- (id)noteCreateDataFromAppSuiteDefaults
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  uint64_t v3 = [v2 objectForKey:@"analyticsNoteCreateApproachEnumValue"];

  if (v3)
  {
    BOOL v4 = [ICASNoteCreateData alloc];
    id v5 = -[ICASNoteCreateApproach initWithNoteCreateApproach:]([ICASNoteCreateApproach alloc], "initWithNoteCreateApproach:", [v3 integerValue]);
    uint64_t v6 = [(ICASNoteCreateData *)v4 initWithNoteCreateApproach:v5];

    +[ICNAEventReporter resetNoteCreateApproachEnumInAppSuiteDefaults];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)pushNoteCreateDataWithCreateApproach:(int64_t)a3
{
  id v5 = [ICASNoteCreateData alloc];
  uint64_t v6 = [[ICASNoteCreateApproach alloc] initWithNoteCreateApproach:a3];
  uint64_t v9 = [(ICASNoteCreateData *)v5 initWithNoteCreateApproach:v6];

  id v7 = +[ICNAController sharedController];
  uint64_t v8 = [(ICNAEventReporter *)self subTracker];
  [v7 pushDataObject:v9 unique:0 onlyOnce:1 subTracker:v8];
}

- (void)popNoteCreateData
{
  id v5 = +[ICNAController sharedController];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(ICNAEventReporter *)self subTracker];
  [v5 popDataObjectWithType:v3 subTracker:v4];
}

- (id)collaborationActionDataIsInviting:(BOOL)a3 inviteStep:(int64_t)a4
{
  if (a3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = [[ICASCollaborationActionType alloc] initWithCollaborationActionType:v5];
  id v7 = [[ICASCollaborationInviteStep alloc] initWithCollaborationInviteStep:a4];
  uint64_t v8 = [[ICASCollaborationActionData alloc] initWithCollaborationActionType:v6 collaborationInviteStep:v7 collaborationMethod:0];

  return v8;
}

- (id)objectDataForCloudSyncingObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICNAEventReporter *)self noteDataForModernNote:v4];
LABEL_5:
    uint64_t v6 = (void *)v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICNAEventReporter *)self folderDataForModernFolder:v4];
    goto LABEL_5;
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

- (id)noteDataForModernNote:(id)a3
{
  id v3 = a3;
  id v4 = [[ICASNoteType alloc] initWithNoteType:1];
  uint64_t v5 = +[ICNAIdentityManager sharedManager];
  uint64_t v6 = [v3 identifier];
  id v7 = [v5 saltedID:v6 forClass:objc_opt_class()];

  uint64_t v8 = [v3 isSystemPaper];
  uint64_t v9 = [ICASNoteData alloc];
  BOOL v10 = [NSNumber numberWithBool:v8];
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController handwritingAutoRefineEnabled](ICNAController, "handwritingAutoRefineEnabled"));
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController audioTranscriptEnabled](ICNAController, "audioTranscriptEnabled"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", +[ICNAController audioSummaryEnabled](ICNAController, "audioSummaryEnabled"));
  uint64_t v14 = [(ICASNoteData *)v9 initWithNoteID:v7 noteType:v4 isScrapPaper:v10 isHandwritingAutoRefineEnabled:v11 isAudioTranscriptEnabled:v12 isAudioSummaryEnabled:v13];

  return v14;
}

- (id)noteDataForHTMLNote:(id)a3
{
  id v3 = a3;
  id v4 = [[ICASNoteType alloc] initWithNoteType:2];
  uint64_t v5 = +[ICNAIdentityManager sharedManager];
  uint64_t v6 = [v3 identifier];

  id v7 = [v5 saltedID:v6 forClass:objc_opt_class()];

  uint64_t v8 = [ICASNoteData alloc];
  uint64_t v9 = [(ICASNoteData *)v8 initWithNoteID:v7 noteType:v4 isScrapPaper:MEMORY[0x1E4F1CC28] isHandwritingAutoRefineEnabled:MEMORY[0x1E4F1CC28] isAudioTranscriptEnabled:MEMORY[0x1E4F1CC28] isAudioSummaryEnabled:MEMORY[0x1E4F1CC28]];

  return v9;
}

- (id)passwordDataForModernNote:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F83348] shouldAuthenticateWithCustomPasswordForObject:v3])
  {
    uint64_t v4 = 1;
  }
  else if ([MEMORY[0x1E4F83348] shouldAuthenticateWithDevicePasswordForObject:v3])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [[ICASPasswordType alloc] initWithPasswordType:v4];
  uint64_t v6 = [v3 passwordHint];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 account];
    uint64_t v9 = [v8 passwordHint];
    BOOL v7 = v9 != 0;
  }
  BOOL v10 = [ICASPasswordData alloc];
  id v11 = [NSNumber numberWithBool:v7];
  id v12 = [(ICASPasswordData *)v10 initWithPasswordType:v5 hasHint:v11];

  return v12;
}

- (id)bioAuthDataForModernNote:(id)a3
{
  id v3 = [MEMORY[0x1E4F838F8] promptForIntent:0 object:a3];
  if ([v3 allowsBiometricAuthentication]
    && [MEMORY[0x1E4F833F0] biometricsType] == 2)
  {
    uint64_t v4 = 1;
  }
  else if ([v3 allowsBiometricAuthentication])
  {
    uint64_t v4 = 2 * ([MEMORY[0x1E4F833F0] biometricsType] == 1);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [[ICASBioAuthType alloc] initWithBioAuthType:v4];
  uint64_t v6 = [[ICASBioAuthData alloc] initWithBioAuthType:v5];

  return v6;
}

- (id)passwordModeDataForContextPath:(int64_t)a3 fromMode:(signed __int16)a4 toMode:(signed __int16)a5
{
  int v5 = a5;
  int v6 = a4;
  BOOL v7 = a5 == 2;
  BOOL v8 = a4 == 2;
  uint64_t v9 = [[ICASPwdModeChangeContextPath alloc] initWithPwdModeChangeContextPath:a3];
  if (v6 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * v8;
  }
  id v11 = [[ICASStartMode alloc] initWithStartMode:v10];
  if (v5 == 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2 * v7;
  }
  uint64_t v13 = [[ICASEndMode alloc] initWithEndMode:v12];
  uint64_t v14 = [[ICASPasswordModeData alloc] initWithPwdModeChangeContextPath:v9 startMode:v11 endMode:v13];

  return v14;
}

- (id)collaborationStatusForModernObject:(id)a3
{
  id v3 = a3;
  if ([v3 isOwnedByCurrentUser])
  {
    uint64_t v4 = 1;
  }
  else if ([v3 isSharedReadOnly])
  {
    uint64_t v4 = 3;
  }
  else if ([v3 isSharedViaICloud])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }
  int v5 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:v4];

  return v5;
}

- (id)collaborationTypeForModernObject:(id)a3
{
  id v3 = a3;
  if ([v3 isSharedViaICloud])
  {
    if ([v3 isSharedRootObject]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
  int v5 = [[ICASCollaborationType alloc] initWithCollaborationType:v4];

  return v5;
}

- (id)folderDataForModernFolder:(id)a3
{
  id v4 = a3;
  long long v26 = [[ICASFolderType alloc] initWithFolderType:1];
  if ([v4 isDefaultFolderForAccount])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isTrashFolder])
  {
    uint64_t v5 = 3;
  }
  else if ([v4 isSmartFolder])
  {
    uint64_t v5 = 5;
  }
  else
  {
    uint64_t v5 = 4;
  }
  int v6 = [[ICASFolderLabelType alloc] initWithFolderLabelType:v5];
  id v7 = v4;
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7;
    while (1)
    {
      id v11 = [v8 account];
      uint64_t v12 = [v11 defaultFolder];
      if (v10 == (void *)v12) {
        break;
      }
      uint64_t v13 = (void *)v12;
      uint64_t v14 = [v8 account];
      uint64_t v15 = [v14 trashFolder];

      if (v10 != v15)
      {
        ++v9;
        uint64_t v16 = [v10 parent];

        uint64_t v10 = (void *)v16;
        if (v16) {
          continue;
        }
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
LABEL_16:
  uint64_t v17 = [(ICNAEventReporter *)self collaborationStatusForModernObject:v8];
  uint64_t v18 = [(ICNAEventReporter *)self collaborationTypeForModernObject:v8];
  uint64_t v19 = +[ICNAIdentityManager sharedManager];
  uint64_t v20 = [v8 identifier];
  id v21 = [v19 saltedID:v20 forClass:objc_opt_class()];

  id v22 = [ICASFolderData alloc];
  id v23 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v9)];
  id v24 = [(ICASFolderData *)v22 initWithFolderID:v21 folderType:v26 folderLabelType:v6 subFolderLevel:v23 collaborationStatus:v17 collaborationType:v18];

  return v24;
}

- (id)folderDataForModernAccountProxy:(id)a3
{
  id v3 = a3;
  id v4 = +[ICNAIdentityManager sharedManager];
  uint64_t v5 = [v3 account];

  int v6 = [v5 identifier];
  id v7 = [v4 saltedID:v6 forClass:objc_opt_class()];

  BOOL v8 = [ICASFolderData alloc];
  uint64_t v9 = [[ICASFolderType alloc] initWithFolderType:1];
  uint64_t v10 = [[ICASFolderLabelType alloc] initWithFolderLabelType:1];
  id v11 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
  uint64_t v12 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
  uint64_t v13 = [(ICASFolderData *)v8 initWithFolderID:v7 folderType:v9 folderLabelType:v10 subFolderLevel:&unk_1F1F91058 collaborationStatus:v11 collaborationType:v12];

  return v13;
}

- (id)folderDataForVirtualFolder:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:*MEMORY[0x1E4F838F0]])
  {
    uint64_t v4 = 6;
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F838E8]])
  {
    uint64_t v4 = 7;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [ICASFolderData alloc];
  int v6 = +[ICNAIdentityManager sharedManager];
  id v7 = [v3 identifier];
  BOOL v8 = [v6 saltedID:v7 forClass:objc_opt_class()];
  uint64_t v9 = [[ICASFolderType alloc] initWithFolderType:1];
  uint64_t v10 = [[ICASFolderLabelType alloc] initWithFolderLabelType:v4];
  id v11 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:0];
  uint64_t v12 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
  uint64_t v13 = [(ICASFolderData *)v5 initWithFolderID:v8 folderType:v9 folderLabelType:v10 subFolderLevel:&unk_1F1F91058 collaborationStatus:v11 collaborationType:v12];

  return v13;
}

- (id)folderDataForHTMLFolder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[ICASFolderType alloc] initWithFolderType:2];
  uint64_t v5 = [v3 account];
  id v6 = [v5 defaultFolder];

  if (v6 == v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 4;
  }
  BOOL v8 = [[ICASFolderLabelType alloc] initWithFolderLabelType:v7];
  id v9 = v3;
  uint64_t v10 = v9;
  long long v26 = v8;
  if (v9)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v9;
    do
    {
      uint64_t v13 = [v10 account];
      uint64_t v14 = [v13 defaultFolder];

      if (v12 == v14) {
        break;
      }
      ++v11;
      uint64_t v15 = [v12 parentFolder];

      uint64_t v12 = (void *)v15;
    }
    while (v15);
    uint64_t v16 = v4;
  }
  else
  {
    uint64_t v16 = v4;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v17 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
  uint64_t v18 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
  uint64_t v19 = +[ICNAIdentityManager sharedManager];
  uint64_t v20 = [v10 externalIdentifier];
  id v21 = [v19 saltedID:v20 forClass:objc_opt_class()];

  id v22 = [ICASFolderData alloc];
  id v23 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v11)];
  id v24 = [(ICASFolderData *)v22 initWithFolderID:v21 folderType:v16 folderLabelType:v26 subFolderLevel:v23 collaborationStatus:v17 collaborationType:v18];

  return v24;
}

- (id)folderDataForHTMLCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ICProtocolCast();
  if (v5)
  {
    id v6 = [(ICNAEventReporter *)self folderDataForHTMLFolder:v5];
  }
  else
  {
    uint64_t v7 = [[ICASFolderType alloc] initWithFolderType:2];
    BOOL v8 = [[ICASFolderLabelType alloc] initWithFolderLabelType:1];
    id v9 = +[ICNAIdentityManager sharedManager];
    uint64_t v10 = [v4 basicAccountIdentifier];
    uint64_t v11 = [v9 saltedID:v10 forClass:objc_opt_class()];

    uint64_t v12 = [ICASFolderData alloc];
    uint64_t v13 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
    uint64_t v14 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
    id v6 = [(ICASFolderData *)v12 initWithFolderID:v11 folderType:v7 folderLabelType:v8 subFolderLevel:&unk_1F1F91058 collaborationStatus:v13 collaborationType:v14];
  }
  return v6;
}

- (id)folderContentDataForNoteContainer:(id)a3
{
  id v3 = a3;
  id v4 = [ICASFolderContentData alloc];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v3 visibleNotesCount];

  uint64_t v7 = [v5 numberWithInteger:ICNARoundTo2SigFigsInt(v6)];
  BOOL v8 = [(ICASFolderContentData *)v4 initWithNoteCount:v7];

  return v8;
}

- (id)folderContentDataForVirtualFolder:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [ICASFolderContentData alloc];
  BOOL v8 = NSNumber;
  uint64_t v9 = [v6 visibleNoteCountInContext:v5];

  uint64_t v10 = [v8 numberWithInteger:ICNARoundTo2SigFigsInt(v9)];
  uint64_t v11 = [(ICASFolderContentData *)v7 initWithNoteCount:v10];

  return v11;
}

- (id)folderContentDataForNoteCollection:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F82D78] countOfVisibleNotesInCollection:a3];
  id v4 = [ICASFolderContentData alloc];
  id v5 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v3)];
  id v6 = [(ICASFolderContentData *)v4 initWithNoteCount:v5];

  return v6;
}

- (id)layoutDataForIsInGridMode:(BOOL)a3 isTimelineView:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [ICASLayoutType alloc];
  if (v5) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  BOOL v8 = [(ICASLayoutType *)v6 initWithLayoutType:v7];
  uint64_t v9 = [ICASLayoutData alloc];
  uint64_t v10 = [NSNumber numberWithBool:v4];
  uint64_t v11 = [(ICASLayoutData *)v9 initWithLayoutType:v8 isTimelineView:v10];

  return v11;
}

- (id)accountDataForModernAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ICNAIdentityManager sharedManager];
  id v6 = [v4 identifier];
  uint64_t v7 = [v5 saltedID:v6 forClass:objc_opt_class()];

  BOOL v8 = [(ICNAEventReporter *)self accountTypeForModernAccount:v4];

  uint64_t v9 = [[ICASAccountData alloc] initWithAccountType:v8 accountID:v7];
  return v9;
}

- (id)accountDataForHTMLAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ICNAIdentityManager sharedManager];
  id v6 = [v4 accountIdentifier];
  uint64_t v7 = [v5 saltedID:v6 forClass:objc_opt_class()];

  BOOL v8 = [(ICNAEventReporter *)self accountTypeForHTMLAccount:v4];

  uint64_t v9 = [[ICASAccountData alloc] initWithAccountType:v8 accountID:v7];
  return v9;
}

- (id)noteAccessDataForModernNote:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICNAEventReporter *)self collaborationStatusForModernObject:v4];
  id v6 = [(ICNAEventReporter *)self collaborationTypeForModernObject:v4];
  uint64_t v7 = [ICASNoteAccessData alloc];
  BOOL v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isPasswordProtected"));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [v4 isPinned];

  uint64_t v11 = [v9 numberWithBool:v10];
  uint64_t v12 = [(ICASNoteAccessData *)v7 initWithIsPasswordProtected:v8 isPinned:v11 collaborationStatus:v5 collaborationType:v6];

  return v12;
}

- (id)noteAccessDataForHTMLNote
{
  id v2 = [[ICASCollaborationStatus alloc] initWithCollaborationStatus:1];
  uint64_t v3 = [[ICASCollaborationType alloc] initWithCollaborationType:1];
  id v4 = [ICASNoteAccessData alloc];
  BOOL v5 = [(ICASNoteAccessData *)v4 initWithIsPasswordProtected:MEMORY[0x1E4F1CC28] isPinned:MEMORY[0x1E4F1CC28] collaborationStatus:v2 collaborationType:v3];

  return v5;
}

- (id)noteContentDataForModernNote:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 textStorageWithoutCreating];
  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x2020000000;
  char v144 = 0;
  uint64_t v137 = 0;
  v138 = &v137;
  uint64_t v139 = 0x2020000000;
  char v140 = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  char v136 = 0;
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 0;
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x2020000000;
  char v130 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  char v126 = 0;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  char v122 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 0;
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 0;
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x2020000000;
  char v110 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  char v106 = 0;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  char v94 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x2020000000;
  char v90 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  uint64_t v86 = 0;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__3;
  v77 = __Block_byref_object_dispose__3;
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__3;
  v67 = __Block_byref_object_dispose__3;
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v5)
  {
    uint64_t v6 = [v5 length];
    uint64_t v7 = objc_msgSend(v5, "ic_range");
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    void v62[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke;
    v62[3] = &unk_1E64B9678;
    v62[4] = &v137;
    v62[5] = &v141;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", v7, v8, 0, v62);
    uint64_t v9 = objc_msgSend(v5, "ic_range");
    uint64_t v10 = *MEMORY[0x1E4F42530];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_2;
    v61[3] = &unk_1E64B96A0;
    void v61[4] = self;
    v61[5] = &v79;
    v61[6] = &v73;
    v61[7] = &v69;
    v61[8] = &v63;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v10, v9, v11, 0, v61);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v12 = [v4 visibleAttachments];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_3;
  v60[3] = &unk_1E64B96C8;
  v60[4] = &v127;
  v60[5] = v135;
  v60[6] = &v123;
  void v60[7] = &v119;
  v60[8] = &v131;
  v60[9] = &v103;
  v60[10] = &v115;
  v60[11] = &v111;
  v60[12] = &v99;
  v60[13] = &v95;
  v60[14] = &v87;
  v60[15] = &v91;
  v60[16] = &v83;
  v60[17] = &v107;
  [v12 enumerateObjectsUsingBlock:v60];
  uint64_t v37 = v5;

  uint64_t v13 = [(id)objc_opt_class() inlineAttachmentReportForModernNote:v4 faultOutInlineAttachmentsAfterDone:0];
  uint64_t v14 = [v13 countOfTags];
  uint64_t v15 = [v13 countOfTags];
  uint64_t v41 = [v13 countOfDistinctTags];
  uint64_t v16 = [v13 countOfMentions];
  uint64_t v17 = [v13 countOfMentions];
  uint64_t v18 = [v13 countOfDistinctMentions];
  uint64_t v19 = [v13 countOfNoteLinks];
  v80[3] += v19;
  uint64_t v36 = [(id)v74[5] count];
  uint64_t v35 = [v13 countOfDistinctNoteLinks];
  uint64_t v20 = [v13 countOfFolderLinks];
  v70[3] += v20;
  uint64_t v34 = [(id)v64[5] count];
  uint64_t v33 = [v13 countOfDistinctFolderLinks];
  id v59 = v4;
  uint64_t v32 = [ICASNoteContentData alloc];
  uint64_t v57 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v6)];
  uint64_t v56 = [NSNumber numberWithBool:*((unsigned __int8 *)v142 + 24)];
  uint64_t v55 = [NSNumber numberWithBool:*((unsigned __int8 *)v138 + 24)];
  uint64_t v54 = [NSNumber numberWithBool:*((unsigned __int8 *)v132 + 24)];
  id v53 = [NSNumber numberWithBool:*((unsigned __int8 *)v128 + 24)];
  long long v52 = [NSNumber numberWithBool:*((unsigned __int8 *)v124 + 24)];
  uint64_t v51 = [NSNumber numberWithBool:*((unsigned __int8 *)v120 + 24)];
  uint64_t v50 = [NSNumber numberWithBool:*((unsigned __int8 *)v108 + 24)];
  id v49 = [NSNumber numberWithBool:*((unsigned __int8 *)v104 + 24)];
  id v21 = NSNumber;
  uint64_t v58 = [v4 creationDate];
  uint64_t v48 = objc_msgSend(v21, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v58)));
  id v47 = [NSNumber numberWithBool:*((unsigned __int8 *)v116 + 24)];
  uint64_t v46 = [NSNumber numberWithBool:*((unsigned __int8 *)v112 + 24)];
  id v45 = [NSNumber numberWithBool:v14 != 0];
  uint64_t v44 = [NSNumber numberWithBool:*((unsigned __int8 *)v100 + 24)];
  id v43 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v15)];
  uint64_t v42 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v41)];
  uint64_t v40 = [NSNumber numberWithBool:v16 != 0];
  uint64_t v39 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v17)];
  uint64_t v38 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v18)];
  id v22 = [NSNumber numberWithBool:*((unsigned __int8 *)v96 + 24)];
  id v23 = [NSNumber numberWithBool:*((unsigned __int8 *)v92 + 24)];
  id v24 = [NSNumber numberWithBool:*((unsigned __int8 *)v88 + 24)];
  uint64_t v25 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v80[3])];
  long long v26 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v35 + v36)];
  uint64_t v27 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v70[3])];
  id v28 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v33 + v34)];
  id v29 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v84[3])];
  uint64_t v30 = -[ICASNoteContentData initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:countOfAudioAttachments:](v32, "initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:countOfAudioAttachments:", v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45,
          v44,
          v43,
          v42,
          v40,
          v39,
          v38,
          v22,
          v23,
          v24,
          v25,
          v26,
          v27,
          v28,
          v29);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(v135, 8);
  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v141, 8);

  return v30;
}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
  if ([v7 style] != 3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  if ([v7 style] == 103) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *a5 = 1;
  }
}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = 0;
      goto LABEL_12;
    }
    id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  id v4 = v3;
  if (!v3) {
    goto LABEL_12;
  }
  uint64_t v5 = [*(id *)(a1 + 32) linkContentTypeEnumForURL:v3];
  if (v5 == 2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v6 = *(void *)(a1 + 64);
  }
  else
  {
    if (v5 != 1) {
      goto LABEL_12;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = *(void *)(a1 + 48);
  }
  objc_msgSend(*(id *)(*(void *)(v6 + 8) + 40), "ic_addNonNilObject:", v4);
LABEL_12:
}

void __50__ICNAEventReporter_noteContentDataForModernNote___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  uint64_t v5 = +[ICNAEventReporter analyticsTypeUTIAttachment:](ICNAEventReporter, "analyticsTypeUTIAttachment:");
  if ([v5 isEqualToString:*MEMORY[0x1E4F83068]])
  {
    uint64_t v6 = a1[4];
LABEL_5:
    *(unsigned char *)(*(void *)(v6 + 8) + 24) = 1;
    uint64_t v7 = a1[5];
LABEL_6:
    uint64_t v8 = *(void *)(v7 + 8);
LABEL_24:
    *(unsigned char *)(v8 + 24) = 1;
    goto LABEL_25;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F83060]])
  {
    uint64_t v6 = a1[6];
    goto LABEL_5;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F83050]])
  {
    uint64_t v9 = a1[7];
LABEL_23:
    uint64_t v8 = *(void *)(v9 + 8);
    goto LABEL_24;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F83098]])
  {
    uint64_t v9 = a1[8];
    goto LABEL_23;
  }
  if ([v14 attachmentType] == 3)
  {
    uint64_t v9 = a1[9];
    goto LABEL_23;
  }
  uint64_t v10 = [(id)*MEMORY[0x1E4F444F8] identifier];
  int v11 = [v5 isEqualToString:v10];

  if (v11)
  {
    uint64_t v9 = a1[10];
    goto LABEL_23;
  }
  if ([v5 isEqualToString:@"com.apple.notes.analytics.appleMaps"])
  {
    uint64_t v9 = a1[11];
    goto LABEL_23;
  }
  if ([v14 attachmentType] == 11)
  {
    uint64_t v9 = a1[12];
    goto LABEL_23;
  }
  if ([v14 attachmentType] == 13)
  {
    uint64_t v9 = a1[13];
    goto LABEL_23;
  }
  if ([v14 attachmentType] == 6)
  {
    uint64_t v9 = a1[14];
    goto LABEL_23;
  }
  if ([v14 attachmentType] == 14)
  {
    uint64_t v12 = a1[14];
LABEL_34:
    *(unsigned char *)(*(void *)(v12 + 8) + 24) = 1;
    uint64_t v7 = a1[15];
    goto LABEL_6;
  }
  if ([v14 attachmentType] == 15)
  {
    uint64_t v12 = a1[12];
    goto LABEL_34;
  }
  if ([v14 attachmentType] != 4)
  {
    uint64_t v9 = a1[17];
    goto LABEL_23;
  }
  uint64_t v13 = [v14 parentAttachment];

  if (!v13) {
    ++*(void *)(*(void *)(a1[16] + 8) + 24);
  }
LABEL_25:
  if (((*(unsigned char *)(*(void *)(a1[6] + 8) + 24) & *(unsigned char *)(*(void *)(a1[4] + 8) + 24) & *(unsigned char *)(*(void *)(a1[7] + 8) + 24) & *(unsigned char *)(*(void *)(a1[8] + 8) + 24) & *(unsigned char *)(*(void *)(a1[9] + 8) + 24) & *(unsigned char *)(*(void *)(a1[10] + 8) + 24) & *(unsigned char *)(*(void *)(a1[11] + 8) + 24)) & (*(unsigned char *)(*(void *)(a1[12] + 8) + 24) & *(unsigned char *)(*(void *)(a1[13] + 8) + 24) & *(unsigned char *)(*(void *)(a1[17] + 8) + 24))) != 0) {
    *a3 = 1;
  }
}

+ (id)inlineAttachmentReportForModernNote:(id)a3 faultOutInlineAttachmentsAfterDone:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v6 = objc_alloc_init(ICNANoteInlineAttachmentReport);
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__3;
  id v43 = __Block_byref_object_dispose__3;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__3;
  uint64_t v37 = __Block_byref_object_dispose__3;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3;
  uint64_t v31 = __Block_byref_object_dispose__3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__3;
  uint64_t v25 = __Block_byref_object_dispose__3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v7 = [v5 visibleInlineAttachments];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__ICNAEventReporter_inlineAttachmentReportForModernNote_faultOutInlineAttachmentsAfterDone___block_invoke;
  v20[3] = &unk_1E64B96F0;
  v20[4] = &v61;
  void v20[5] = &v33;
  v20[6] = &v57;
  v20[7] = &v27;
  v20[8] = &v53;
  v20[9] = &v21;
  v20[10] = &v49;
  v20[11] = &v45;
  v20[12] = &v39;
  [v7 enumerateObjectsUsingBlock:v20];

  uint64_t v8 = [(id)v34[5] count];
  uint64_t v9 = [(id)v28[5] count];
  uint64_t v10 = [(id)v22[5] count];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfTags:v62[3]];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfDistinctTags:v8];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfMentions:v58[3]];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfDistinctMentions:v9];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfNoteLinks:v54[3]];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfDistinctNoteLinks:v10];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfFolderLinks:0];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfDistinctFolderLinks:0];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfCalculateResults:v50[3]];
  [(ICNANoteInlineAttachmentReport *)v6 setCountOfCalculateGraphExpressions:v46[3]];
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = (id)v40[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v65 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend((id)objc_opt_class(), "faultOutObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v65 count:16];
      }
      while (v12);
    }
  }
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v6;
}

void __92__ICNAEventReporter_inlineAttachmentReportForModernNote_faultOutInlineAttachmentsAfterDone___block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  if ([v10 isHashtagAttachment])
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v3 = a1[5];
LABEL_7:
    BOOL v4 = *(void **)(*(void *)(v3 + 8) + 40);
    uint64_t v5 = [v10 tokenContentIdentifier];
    uint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    else {
      uint64_t v7 = @"???";
    }
    objc_msgSend(v4, "ic_addNonNilObject:", v7);

    goto LABEL_11;
  }
  if ([v10 isMentionAttachment])
  {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    uint64_t v3 = a1[7];
    goto LABEL_7;
  }
  if ([v10 isLinkAttachment])
  {
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
    uint64_t v3 = a1[9];
    goto LABEL_7;
  }
  if ([v10 isCalculateResultAttachment])
  {
    ++*(void *)(*(void *)(a1[10] + 8) + 24);
LABEL_11:
    id v8 = v10;
    goto LABEL_12;
  }
  int v9 = [v10 isCalculateGraphExpressionAttachment];
  id v8 = v10;
  if (v9) {
    ++*(void *)(*(void *)(a1[11] + 8) + 24);
  }
LABEL_12:
  objc_msgSend(*(id *)(*(void *)(a1[12] + 8) + 40), "ic_addNonNilObject:", v8);
}

- (int64_t)weeksSinceDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  uint64_t v5 = [v3 date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  return llround(v7 / 60.0 / 60.0 / 24.0 / 7.0);
}

- (id)noteCollapsibleSectionDataForHTMLNote:(id)a3
{
  uint64_t v3 = [[ICASCollapsibleSectionData alloc] initWithSectionAffordanceExposures:&unk_1F1F91058 sectionAffordanceUsages:&unk_1F1F91058];
  return v3;
}

- (id)noteContentDataForHTMLNote:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ICASNoteContentData alloc];
  double v6 = NSNumber;
  double v7 = [v4 contentAsPlainText];
  id v8 = objc_msgSend(v6, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v7, "length")));
  int v9 = NSNumber;
  id v10 = [v4 creationDate];

  id v11 = objc_msgSend(v9, "numberWithInteger:", ICNARoundTo2SigFigsInt(-[ICNAEventReporter weeksSinceDate:](self, "weeksSinceDate:", v10)));
  uint64_t v12 = -[ICASNoteContentData initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:countOfAudioAttachments:](v5, "initWithCharacterCount:hasChecklist:hasStyleFormatting:hasTable:hasAttachmentInlineDrawingV1:hasAttachmentInlineDrawingV2:hasAttachmentFullscreenDrawing:hasAttachmentOther:hasAttachedPhoto:weeksSinceCreation:hasAttachmentRichUrl:hasAttachmentMapLink:hasTags:hasScannedDoc:countOfTags:countOfDistinctTags:hasMentions:countOfMentions:countOfDistinctMentions:hasPaperKitDrawing:hasPaperDocument:hasPdf:countOfNoteLinks:countOfDistinctNoteLinks:countOfFolderLinks:countOfDistinctFolderLinks:countOfAudioAttachments:", v8, MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], v11, MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28],
          MEMORY[0x1E4F1CC28],
          &unk_1F1F91058,
          &unk_1F1F91058,
          MEMORY[0x1E4F1CC28],
          &unk_1F1F91058,
          &unk_1F1F91058,
          MEMORY[0x1E4F1CC28],
          MEMORY[0x1E4F1CC28],
          MEMORY[0x1E4F1CC28],
          &unk_1F1F91058,
          &unk_1F1F91058,
          &unk_1F1F91058,
          &unk_1F1F91058,
          &unk_1F1F91058);

  return v12;
}

- (id)selectedResultAccountTypeForSearchResult:(id)a3
{
  uint64_t v3 = [a3 object];
  id v4 = ICProtocolCast();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 account];
    if (v5)
    {
LABEL_3:
      int64_t v6 = +[ICNAController accountTypeEnumForModernAccount:v5];
      double v7 = 0;
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v3 note];
    uint64_t v5 = [v8 account];

    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    double v7 = 0;
LABEL_14:
    int64_t v6 = 0;
    goto LABEL_15;
  }
  if (!v4)
  {
    double v7 = 0;
    goto LABEL_13;
  }
  double v7 = [v4 account];
  if (!v7)
  {
LABEL_13:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  int64_t v6 = +[ICNAController accountTypeEnumForHTMLAccount:v7];
  uint64_t v5 = 0;
LABEL_4:
  switch(v6)
  {
    case 1:
    case 2:
    case 3:
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      int64_t v6 = 4;
      break;
    case 9:
      int64_t v6 = 5;
      break;
    case 10:
      int64_t v6 = 6;
      break;
    default:
      goto LABEL_14;
  }
LABEL_15:
  int v9 = [[ICASSelectedResultAccountType alloc] initWithSelectedResultAccountType:v6];

  return v9;
}

- (id)searchSuggestionDataWithSearchSuggestionType:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1C3F18388[a3 - 1];
  }
  id v4 = [ICASSearchSuggestionData alloc];
  uint64_t v5 = [[ICASSearchSuggestionType alloc] initWithSearchSuggestionType:v3];
  int64_t v6 = [(ICASSearchSuggestionData *)v4 initWithSearchSuggestionType:v5];

  return v6;
}

- (id)tipDataForFeature:(id)a3
{
  id v3 = a3;
  id v4 = [[ICASTipData alloc] initWithTipFeature:v3];

  return v4;
}

- (id)audioAttachmentDataForModernAttachment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 parentAttachment];
  uint64_t v5 = (void *)v4;
  if (v4) {
    int64_t v6 = (void *)v4;
  }
  else {
    int64_t v6 = v3;
  }
  id v7 = v6;

  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__3;
  id v32 = __Block_byref_object_dispose__3;
  id v33 = 0;
  id v8 = [v7 managedObjectContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__ICNAEventReporter_audioAttachmentDataForModernAttachment___block_invoke;
  v25[3] = &unk_1E64B8A98;
  uint64_t v27 = &v28;
  id v9 = v7;
  id v26 = v9;
  [v8 performBlockAndWait:v25];

  id v10 = +[ICNAIdentityManager sharedManager];
  id v11 = [v10 saltedID:v29[5] forClass:objc_opt_class()];
  id v24 = v3;

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F832A8]) initWithAttachment:v9];
  uint64_t v13 = [ICASAudioAttachmentData alloc];
  id v14 = NSNumber;
  uint64_t v15 = [v12 audioDocument];
  long long v16 = [v15 transcriptAsPlainText];
  long long v17 = objc_msgSend(v14, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v16, "length")));
  long long v18 = NSNumber;
  long long v19 = [v12 audioDocument];
  uint64_t v20 = [v19 recordingSummaryAsPlainText];
  uint64_t v21 = objc_msgSend(v18, "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v20, "length")));
  id v22 = [(ICASAudioAttachmentData *)v13 initWithAudioAttachmentID:v11 transcriptCharacterCount:v17 summaryCharacterCount:v21];

  _Block_object_dispose(&v28, 8);
  return v22;
}

uint64_t __60__ICNAEventReporter_audioAttachmentDataForModernAttachment___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) identifier];
  return MEMORY[0x1F41817F8]();
}

- (id)audioRecordingDataForModernAttachment:(id)a3 appBackgroundOccurred:(BOOL)a4 noteMultitaskingOccurred:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 parentAttachment];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v7;
  }
  id v11 = v10;

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F832A8]) initWithAttachment:v11];
  uint64_t v13 = [v12 audioDocument];
  id v14 = [v13 orderedFragmentUUIDs];
  unint64_t v15 = [v14 count];

  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  long long v17 = [[ICASRecordingActionType alloc] initWithRecordingActionType:v16];
  long long v18 = [ICASAudioRecordingData alloc];
  long long v19 = NSNumber;
  [v11 duration];
  double v21 = v20;

  id v22 = [v19 numberWithInteger:ICNARoundTo2SigFigsInt((uint64_t)v21)];
  uint64_t v23 = [NSNumber numberWithBool:v6];
  id v24 = [NSNumber numberWithBool:v5];
  uint64_t v25 = [(ICASAudioRecordingData *)v18 initWithTotalRecordingTime:v22 recordingActionType:v17 didAppBackgroundOccur:v23 didNoteMultitaskingOccur:v24];

  return v25;
}

- (id)audioTranscriptInteractionDataWithSummaryViewed:(BOOL)a3 transcriptViewed:(BOOL)a4 interactionTargets:(id)a5 interactionTypes:(id)a6
{
  BOOL v23 = a4;
  BOOL v24 = a3;
  id v7 = a5;
  id v8 = a6;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v7 count])
  {
    unint64_t v10 = 0;
    do
    {
      if (v10 >= [v8 count]) {
        break;
      }
      id v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v8 objectAtIndexedSubscript:v10];
      if ([v11 isEqual:@"audioTranscript"]) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = [v11 isEqual:@"audioSummary"] ? 2 : 0;
      }
      if ([v12 isEqual:@"fullInsertToNote"])
      {
        uint64_t v14 = 1;
      }
      else if ([v12 isEqual:@"partialInsertToNote"])
      {
        uint64_t v14 = 2;
      }
      else
      {
        uint64_t v14 = [v12 isEqual:@"copy"] ? 3 : 0;
      }
      unint64_t v15 = [[ICASTranscriptInteractionTarget alloc] initWithTranscriptInteractionTarget:v13];
      uint64_t v16 = [[ICASTranscriptActionType alloc] initWithTranscriptActionType:v14];
      long long v17 = [[ICASTranscriptInteractionItemData alloc] initWithTranscriptInteractionTarget:v15 transcriptActionType:v16];
      [v9 addObject:v17];

      ++v10;
    }
    while (v10 < [v7 count]);
  }
  long long v18 = [ICASAudioTranscriptInteractionData alloc];
  long long v19 = [NSNumber numberWithBool:v23];
  double v20 = [NSNumber numberWithBool:v24];
  double v21 = [(ICASAudioTranscriptInteractionData *)v18 initWithWasTranscriptViewed:v19 wasSummaryViewed:v20 transcriptInteractionSummaryArray:v9];

  return v21;
}

- (id)accountTypeForModernAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [ICASAccountType alloc];
  int64_t v5 = +[ICNAController accountTypeEnumForModernAccount:v3];

  BOOL v6 = [(ICASAccountType *)v4 initWithAccountType:v5];
  return v6;
}

- (id)accountTypeForHTMLAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [ICASAccountType alloc];
  int64_t v5 = +[ICNAController accountTypeEnumForHTMLAccount:v3];

  BOOL v6 = [(ICASAccountType *)v4 initWithAccountType:v5];
  return v6;
}

- (id)noteEditDataForContextType:(int64_t)a3
{
  id v3 = [[ICASNoteEditContext alloc] initWithNoteEditContext:a3];
  uint64_t v4 = [[ICASNoteEditData alloc] initWithNoteEditContext:v3];

  return v4;
}

- (id)styleDataForStyleTypeValue:(int64_t)a3
{
  id v3 = [[ICASStyleType alloc] initWithStyleType:a3];
  uint64_t v4 = [[ICASStyleData alloc] initWithStyleType:v3];

  return v4;
}

- (id)noteEditorCallOutBarDataForButtonTypeValue:(int64_t)a3
{
  id v3 = [[ICASNoteEditorCallOutBarButtonType alloc] initWithNoteEditorCallOutBarButtonType:a3];
  uint64_t v4 = [[ICASNoteEditorCallOutBarData alloc] initWithNoteEditorCallOutBarButtonType:v3];

  return v4;
}

- (unint64_t)pencilStrokeCountForDrawing:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "strokes", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) _inputType] == 1) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)searchRankingExperimentItemDataWithStrategyTypeEnum:(int64_t)a3 rank:(unint64_t)a4
{
  uint64_t v5 = [[ICASRankingStrategyType alloc] initWithRankingStrategyType:a3];
  unint64_t v6 = [ICASSearchRankingExperimentItemData alloc];
  uint64_t v7 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(a4)];
  id v8 = [(ICASSearchRankingExperimentItemData *)v6 initWithRankingStrategyType:v5 rank:v7];

  return v8;
}

+ (id)analyticsTypeUTIAttachment:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 typeUTI];
  uint64_t v5 = (__CFString *)[v4 copy];

  if ([v3 isMap])
  {
    unint64_t v6 = @"com.apple.notes.analytics.appleMaps";
  }
  else
  {
    if ([v3 attachmentType] != 6) {
      goto LABEL_6;
    }
    unint64_t v6 = (__CFString *)(id)*MEMORY[0x1E4F83070];
  }

  uint64_t v5 = v6;
LABEL_6:

  return v5;
}

+ (id)filteredActivityType:(id)a3
{
  id v3 = [a1 maskString:a3 withoutPrefix:@"com.apple." withMask:@"other"];
  if ([(__CFString *)v3 hasPrefix:@"com.apple.UIKit.activity.PostTo"])
  {

    id v3 = @"other";
  }
  return v3;
}

+ (id)maskString:(id)a3 withoutPrefix:(id)a4 withMask:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7
    && ((unint64_t v10 = [v7 length], v10 < objc_msgSend(v8, "length"))
     || ([v7 hasPrefix:v8] & 1) == 0))
  {
    id v11 = (id)[v9 copy];
  }
  else
  {
    id v11 = v7;
  }
  long long v12 = v11;

  return v12;
}

+ (BOOL)activityTypeHasUnknownShareFlow:(id)a3
{
  uint64_t v3 = activityTypeHasUnknownShareFlow__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&activityTypeHasUnknownShareFlow__onceToken, &__block_literal_global_582);
  }
  char v5 = [(id)activityTypeHasUnknownShareFlow__unknownActivityTypes containsObject:v4];

  return v5;
}

uint64_t __53__ICNAEventReporter_activityTypeHasUnknownShareFlow___block_invoke()
{
  activityTypeHasUnknownShareFlow__unknownActivityTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F43600], *MEMORY[0x1E4F435B8], *MEMORY[0x1E4F435A0], *MEMORY[0x1E4F43608], *MEMORY[0x1E4F43598], @"com.apple.DocumentManagerUICore.SaveToFiles", @"com.apple.mobilenotes.PagesHandoff", @"com.apple.mobilenotes.findInNote", 0);
  return MEMORY[0x1F41817F8]();
}

+ (void)faultOutObject:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 managedObjectContext];
    [v4 refreshObject:v3 mergeChanges:0];
  }
}

+ (BOOL)attachmentHasDeepLinkSafariHighlight:(id)a3
{
  id v3 = a3;
  id v4 = [v3 synapseData];

  if (v4)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA9238]);
    char v5 = [v3 synapseData];
    unint64_t v6 = (void *)[v4 initWithData:v5 error:0];

    id v7 = [v6 userActivity];
    id v8 = [v7 _linkContextInfo];
    LOBYTE(v4) = v8 != 0;
  }
  return (char)v4;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (NSMutableSet)timedDataTrackingSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimedDataTrackingSet:(id)a3
{
}

- (NSMutableDictionary)pendingInlineDrawingInformation
{
  return self->_pendingInlineDrawingInformation;
}

- (void)setPendingInlineDrawingInformation:(id)a3
{
}

- (void)initWithSubTrackerName:windowScene:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to init event reporter for a nil window scene.", v2, v3, v4, v5, v6);
}

- (void)initWithSubTrackerName:window:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to init event reporter for a nil window.", v2, v3, v4, v5, v6);
}

- (void)initWithSubTrackerName:view:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to init event reporter for a nil view.", v2, v3, v4, v5, v6);
}

- (void)startAttributionSideBarViewEventForNote:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to start attribution sidebar view event for a nil note.", v2, v3, v4, v5, v6);
}

- (void)startAttributionSideBarViewEventForNote:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to start attribution sidebar view event with nil noteData.", v2, v3, v4, v5, v6);
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to submit attribution sidebar view event for a nil note.", v2, v3, v4, v5, v6);
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to submit attribution sidebar view event with nil calloutData.", v2, v3, v4, v5, v6);
}

- (void)submitAttributionSideBarViewEventForNote:contextPath:startState:endState:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1C3EAD000, v0, v1, "Tried to submit attribution sidebar view event with nil noteData.", v2, v3, v4, v5, v6);
}

@end