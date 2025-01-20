@interface TUIFeedLayoutController
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)_lq_shouldInstantiateEntry:(id)a3 sectionIndex:(unint64_t)a4 transactionGroup:(id)a5;
- (BOOL)_lq_shouldSubmitRenderModelUpdate:(BOOL)a3 transactionGroup:(id)a4;
- (BOOL)environmentChanged;
- (BOOL)inLiveResize;
- (BOOL)lq_updateHostingGeometryMap:(id)a3;
- (BOOL)needsLayoutAfterLiveResize;
- (BOOL)suspended;
- (NSArray)dataRequests;
- (NSHashTable)layoutConditionsSuspendingLayout;
- (NSHashTable)layoutConditionsSuspendingUpdates;
- (NSMutableDictionary)sections;
- (NSString)previousStackName;
- (NSUUID)layoutUntilEntryWithUUID;
- (OS_dispatch_queue)dataRequestsSync;
- (OS_dispatch_queue)sync;
- (TUIActionHandlerDelegate)actionHandlerDelegate;
- (TUIAnchorSet)anchorSet;
- (TUIEnvironment)environment;
- (TUIEnvironment)prevEnvironment;
- (TUIFeedCaptureController)captureController;
- (TUIFeedContent)content;
- (TUIFeedLayoutController)initWithFeedId:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 renderMode:(unint64_t)a7;
- (TUIFeedLayoutControllerDelegate)delegate;
- (TUIFeedViewState)layoutViewState;
- (TUIFeedViewState)restoreViewState;
- (TUIHostingGeometryMap)hostingGeometryMap;
- (TUIHostingMap)currentHostingMap;
- (TUIManager)manager;
- (TUIRenderModelAuxiliary)currentAuxiliaryModel;
- (TUIRenderModelCollection)currentRenderModel;
- (TUIRenderModelLayer)currentLayerRenderModel;
- (TUIRenderUpdateAuxiliaryController)auxiliaryUpdateController;
- (TUIRenderUpdateCollectionController)updateController;
- (TUIRenderUpdateLayerController)layerUpdateController;
- (TUIStatsCollector)statsCollector;
- (TUIStatsDatesCollector)datesCollector;
- (TUIStatsLiveResize)statsLiveResize;
- (TUIStatsTimingCollector)timingCollector;
- (TUITemplateFactory)templateFactory;
- (TUITransactionCoordinating)transactionCoordinator;
- (TUITransactionDependencyToken)lastContentTransactionToken;
- (TUITransactionDependencyToken)lastEnvironmentTransactionToken;
- (TUIWPService)wpService;
- (TUIWorkQueueContext)queueContext;
- (double)loadingFooterHeight;
- (double)loadingFooterMinY;
- (float)priority;
- (id)_infoForFinal:(BOOL)a3;
- (id)instantiateContext:(id)a3 serviceConformingToProtocol:(id)a4;
- (id)lq_createRenderModelForFeedEntry:(id)a3 section:(int64_t)a4;
- (id)lq_loadFeedEntry:(id)a3 data:(id)a4 section:(int64_t)a5 transactionGroup:(id)a6;
- (os_unfair_lock_s)layoutConditionsLock;
- (unint64_t)frameSignpost;
- (unint64_t)layoutFlags;
- (unint64_t)layoutGenerationId;
- (unint64_t)layoutNextSection;
- (unint64_t)layoutNumberOfSections;
- (unint64_t)layoutState;
- (unint64_t)liveResizeLayoutCount;
- (unint64_t)liveResizeSignpost;
- (unint64_t)lq_statsMode;
- (unint64_t)renderModelMode;
- (unint64_t)statsMode;
- (void)_cancelDataRequests;
- (void)_lq_scheduleLayoutRemainder;
- (void)_updateAfterLayoutConditionSuspendingUpdatesInvalidated;
- (void)beginLiveResize;
- (void)captureWithController:(id)a3 completion:(id)a4;
- (void)collectStatsWithCompletion:(id)a3;
- (void)debugDumpEnvironmentContainerStructure;
- (void)dumpLayoutTreeForEntry:(id)a3 completion:(id)a4;
- (void)dumpModelTreeForEntry:(id)a3 completion:(id)a4;
- (void)endLiveResize;
- (void)layoutIfNeededWithTransaction:(id)a3;
- (void)lq_updateAXModelTreeWithTransactionGroup:(id)a3;
- (void)lq_updateContent:(id)a3 contentUpdateDate:(id)a4 transaction:(id)a5 transactionGroup:(id)a6;
- (void)lq_updateRenderModelsWithTransactionGroup:(id)a3;
- (void)resumeAndRebuildWithEnvironment:(id)a3 state:(id)a4 transaction:(id)a5;
- (void)setActionHandlerDelegate:(id)a3;
- (void)setCurrentAuxiliaryModel:(id)a3;
- (void)setCurrentHostingMap:(id)a3;
- (void)setCurrentLayerRenderModel:(id)a3;
- (void)setCurrentRenderModel:(id)a3;
- (void)setDataRequests:(id)a3;
- (void)setDataRequestsSync:(id)a3;
- (void)setDatesCollector:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvironmentChanged:(BOOL)a3;
- (void)setLastContentTransactionToken:(id)a3;
- (void)setLastEnvironmentTransactionToken:(id)a3;
- (void)setLayoutFlags:(unint64_t)a3;
- (void)setLayoutGenerationId:(unint64_t)a3;
- (void)setLayoutNextSection:(unint64_t)a3;
- (void)setLayoutNumberOfSections:(unint64_t)a3;
- (void)setLayoutState:(unint64_t)a3;
- (void)setLayoutUntilEntryWithUUID:(id)a3;
- (void)setLayoutViewState:(id)a3;
- (void)setLoadingFooterMinY:(double)a3;
- (void)setLq_statsMode:(unint64_t)a3;
- (void)setManager:(id)a3;
- (void)setPreviousStackName:(id)a3;
- (void)setPriority:(float)a3;
- (void)setQueueContext:(id)a3;
- (void)setRestoreViewState:(id)a3;
- (void)setSections:(id)a3;
- (void)setStatsCollector:(id)a3;
- (void)setStatsMode:(unint64_t)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSync:(id)a3;
- (void)setTemplateFactory:(id)a3;
- (void)setWpService:(id)a3;
- (void)statRecordInitialResourcesRenderedDate;
- (void)statRecordResourcesLoadedDate;
- (void)statRecordResourcesStartLoadingDate;
- (void)statRecordViewWillAppear;
- (void)suspendAndTeardownWithTransaction:(id)a3;
- (void)suspendLayoutsUntilMeetingLayoutCondition:(id)a3;
- (void)suspendUpdatesUntilMeetingLayoutCondition:(id)a3;
- (void)transactionCoordinator:(id)a3 applyUpdatesFromTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 timeoutForSynchronousTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4;
- (void)updateDatesCollectorWithBlock:(id)a3;
- (void)updateHostingGeometryMap:(id)a3 withTransaction:(id)a4;
- (void)updateWithContent:(id)a3 layoutUpToEntry:(id)a4 environment:(id)a5 transaction:(id)a6;
- (void)updateWithContent:(id)a3 transaction:(id)a4;
- (void)updateWithEnvironment:(id)a3 state:(id)a4 withTransaction:(id)a5;
@end

@implementation TUIFeedLayoutController

- (TUIFeedLayoutController)initWithFeedId:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 renderMode:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v47.receiver = self;
  v47.super_class = (Class)TUIFeedLayoutController;
  v16 = [(TUIFeedLayoutController *)&v47 init];
  v17 = v16;
  if (v16)
  {
    v16->_feedId.uniqueIdentifier = a3.var0;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    v17->_priority = 0.5;
    v20 = objc_alloc_init(TUIWorkQueueContext);
    queueContext = v17->_queueContext;
    v17->_queueContext = v20;

    dispatch_queue_t v22 = dispatch_queue_create("TUIFeedLayoutController.dataRequestsSync", v19);
    dataRequestsSync = v17->_dataRequestsSync;
    v17->_dataRequestsSync = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v17->_environment, a4);
    objc_storeStrong((id *)&v17->_manager, a6);
    objc_storeStrong((id *)&v17->_templateFactory, a5);
    uint64_t v24 = objc_opt_new();
    sections = v17->_sections;
    v17->_sections = (NSMutableDictionary *)v24;

    v26 = [[TUITransactionCoordinator alloc] initWithFeedId:v17->_feedId.uniqueIdentifier layoutQueueContext:v17->_queueContext delegate:v17];
    transactionCoordinator = v17->_transactionCoordinator;
    v17->_transactionCoordinator = (TUITransactionCoordinating *)v26;

    v17->_loadingFooterHeight = 60.0;
    v28 = objc_alloc_init(TUIWPService);
    wpService = v17->_wpService;
    v17->_wpService = v28;

    v30 = objc_alloc_init(TUIStatsDatesCollector);
    datesCollector = v17->_datesCollector;
    v17->_datesCollector = v30;

    v32 = +[NSDate date];
    [(TUIStatsDatesCollector *)v17->_datesCollector setCreationDate:v32];

    v17->_layoutState = 0;
    v17->_layoutConditionsLock._os_unfair_lock_opaque = 0;
    uint64_t v33 = +[NSHashTable hashTableWithOptions:517];
    layoutConditionsSuspendingUpdates = v17->_layoutConditionsSuspendingUpdates;
    v17->_layoutConditionsSuspendingUpdates = (NSHashTable *)v33;

    uint64_t v35 = +[NSHashTable hashTableWithOptions:517];
    layoutConditionsSuspendingLayout = v17->_layoutConditionsSuspendingLayout;
    v17->_layoutConditionsSuspendingLayout = (NSHashTable *)v35;

    v17->_unint64_t renderModelMode = a7;
    v17->_environmentLock._os_unfair_lock_opaque = 0;
    environmentPendingUpdate = v17->_environmentPendingUpdate;
    v17->_environmentPendingUpdate = 0;

    *(unsigned char *)&v17->_flags = 1;
    unint64_t renderModelMode = v17->_renderModelMode;
    if (renderModelMode == 1)
    {
      v45 = objc_alloc_init(TUIRenderUpdateLayerController);
      layerUpdateController = v17->_layerUpdateController;
      v17->_layerUpdateController = v45;
    }
    else
    {
      if (renderModelMode)
      {
LABEL_7:

        goto LABEL_8;
      }
      v39 = [TUIRenderUpdateCollectionController alloc];
      v40 = [(TUIWorkQueueContext *)v17->_queueContext workQueue];
      v41 = [(TUIRenderUpdateCollectionController *)v39 initWithLayoutQueue:v40 renderModel:0];
      updateController = v17->_updateController;
      v17->_updateController = v41;

      v43 = objc_alloc_init(TUIRenderUpdateAuxiliaryController);
      layerUpdateController = v17->_auxiliaryUpdateController;
      v17->_auxiliaryUpdateController = v43;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v17;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xEF | v8;
  }
}

- (id)lq_createRenderModelForFeedEntry:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  char v7 = [[_TUIFeedLayoutSection alloc] initWithFeedId:self->_feedId.uniqueIdentifier section:a4 controller:self entry:v6];

  [(_TUIFeedLayoutSection *)v7 setStatsMode:self->_lq_statsMode];
  sections = self->_sections;
  v9 = +[NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)sections setObject:v7 forKey:v9];

  v10 = [(_TUIFeedLayoutSection *)v7 renderModel];

  return v10;
}

- (id)lq_loadFeedEntry:(id)a3 data:(id)a4 section:(int64_t)a5 transactionGroup:(id)a6
{
  sections = self->_sections;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[NSNumber numberWithInteger:a5];
  id v15 = [(NSMutableDictionary *)sections objectForKeyedSubscript:v14];

  [v15 lq_loadOrUpdateEntry:v13 data:v12 controller:self transactionGroup:v11];
  v16 = [v15 renderModel];

  return v16;
}

- (id)_infoForFinal:(BOOL)a3
{
  if (a3)
  {
    CFStringRef v5 = @"TUIRenderInfoKeyIsFinal";
    id v6 = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)lq_updateRenderModelsWithTransactionGroup:(id)a3
{
  id v353 = a3;
  kdebug_trace();
  v3 = TUILayoutLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = uniqueIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v353;
    _os_log_impl(&def_141F14, v3, OS_LOG_TYPE_INFO, "[fid:%lu] Ariadne FeedLayoutStart group=%@", buf, 0x16u);
  }

  v329 = +[NSDate date];
  if (self->_inLiveResize) {
    ++self->_liveResizeLayoutCount;
  }
  CFStringRef v5 = TUIInstantiationLog();
  self->_os_signpost_id_t frameSignpost = os_signpost_id_generate(v5);

  id v6 = TUIInstantiationLog();
  char v7 = v6;
  os_signpost_id_t frameSignpost = self->_frameSignpost;
  if (frameSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    unint64_t v9 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v9;
    _os_signpost_emit_with_name_impl(&def_141F14, v7, OS_SIGNPOST_INTERVAL_BEGIN, frameSignpost, "Instantiation", "[fid:%lu] ", buf, 0xCu);
  }

  v10 = self;
  statsLiveResize = self->_statsLiveResize;
  if (statsLiveResize)
  {
    [(TUIStatsLiveResize *)statsLiveResize beginFrame];
    [(NSMutableDictionary *)self->_sections enumerateKeysAndObjectsUsingBlock:&stru_254A98];
    v10 = self;
  }
  [(TUIStatsTimingCollector *)v10->_timingCollector startPhase:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v414 = sub_C1EB8;
  v415 = sub_C1EC8;
  v416 = self->_currentRenderModel;
  uint64_t v398 = 0;
  v399 = &v398;
  uint64_t v400 = 0x3032000000;
  v401 = sub_C1EB8;
  v402 = sub_C1EC8;
  uint64_t v12 = [*(id *)(*(void *)&buf[8] + 40) sections];
  id v13 = (void *)v12;
  id v14 = &__NSArray0__struct;
  if (v12) {
    id v14 = (void *)v12;
  }
  id v403 = v14;

  unint64_t layoutNextSection = self->_layoutNextSection;
  if (layoutNextSection < (unint64_t)[(id)v399[5] count])
  {
    uint64_t v16 = [v399[5] subarrayWithRange:0, self->_layoutNextSection];
    v17 = (void *)v399[5];
    v399[5] = v16;
  }
  if (self->_layoutUntilEntryWithUUID)
  {
    v18 = [(TUIFeedContent *)self->_content entries];
    v397[0] = _NSConcreteStackBlock;
    v397[1] = 3221225472;
    v397[2] = sub_C1ED0;
    v397[3] = &unk_254AC0;
    v397[4] = self;
    v19 = (char *)[v18 indexOfObjectPassingTest:v397];

    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    if (v19 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = [(TUIFeedContent *)self->_content entries];
      BOOL v22 = v19 + 1 == [v21 count];

      if (v22) {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = (unint64_t)v19;
      }
    }
  }
  else
  {
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v24 = self->_layoutNextSection;
  unint64_t layoutNumberOfSections = self->_layoutNumberOfSections;
  BOOL v338 = v24 < layoutNumberOfSections;
  if (v24 >= layoutNumberOfSections)
  {
LABEL_35:
    char v331 = 0;
  }
  else
  {
    char v25 = 0;
    v26 = self;
    while (1)
    {
      sections = v26->_sections;
      v28 = +[NSNumber numberWithUnsignedInteger:v24];
      v29 = [(NSMutableDictionary *)sections objectForKeyedSubscript:v28];

      if (([v29 needsInstantiation] & 1) == 0
        || (v24 > v20 ? (BOOL v30 = v20 != 0x7FFFFFFFFFFFFFFFLL) : (BOOL v30 = 0),
            v30
         || (v20 == 0x7FFFFFFFFFFFFFFFLL || v24 > v20)
         && ([v29 entry],
             v31 = objc_claimAutoreleasedReturnValue(),
             unsigned int v32 = [(TUIFeedLayoutController *)self _lq_shouldInstantiateEntry:v31 sectionIndex:v24 transactionGroup:v353], v31, !v32)))
      {
        char v331 = 0;
        goto LABEL_38;
      }
      [v29 lq_instantiateWithController:self transactionGroup:v353];
      if (v20 == v24) {
        break;
      }
      v34 = [v29 renderModel];
      if (v34)
      {

        uint64_t v35 = 1;
      }
      else
      {
        v36 = [v29 layerRenderModel];
        uint64_t v35 = v36 != 0;

        if (!v35) {
          goto LABEL_35;
        }
      }
      v24 += v35;
      v26 = self;
      char v25 = 1;
      if (v24 >= self->_layoutNumberOfSections) {
        goto LABEL_35;
      }
    }
    char v331 = 1;
    char v25 = 1;
LABEL_38:

    BOOL v338 = v25;
  }
  v37 = TUIInstantiationLog();
  v38 = v37;
  os_signpost_id_t v39 = self->_frameSignpost;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    unint64_t v40 = self->_feedId.uniqueIdentifier;
    LODWORD(v408) = 134217984;
    *(void *)((char *)&v408 + 4) = v40;
    _os_signpost_emit_with_name_impl(&def_141F14, v38, OS_SIGNPOST_INTERVAL_END, v39, "Instantiation", "[fid:%lu] ", (uint8_t *)&v408, 0xCu);
  }

  v41 = TUIInstantiationLog();
  v42 = v41;
  os_signpost_id_t v43 = self->_frameSignpost;
  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    unint64_t v44 = self->_feedId.uniqueIdentifier;
    LODWORD(v408) = 134217984;
    *(void *)((char *)&v408 + 4) = v44;
    _os_signpost_emit_with_name_impl(&def_141F14, v42, OS_SIGNPOST_INTERVAL_BEGIN, v43, "Layout", "[fid:%lu] ", (uint8_t *)&v408, 0xCu);
  }

  v336 = [(id)v399[5] lastObject];
  *(void *)&long long v408 = 0;
  *((void *)&v408 + 1) = &v408;
  uint64_t v409 = 0x3010000000;
  uint64_t v411 = 0;
  double v412 = 0.0;
  v410 = "";
  [(TUIEnvironment *)self->_environment viewSize];
  uint64_t v46 = v45;
  if (v336)
  {
    [v336 frame];
    double MaxY = CGRectGetMaxY(v417);
  }
  else
  {
    double MaxY = 0.0;
  }
  uint64_t v411 = v46;
  double v412 = MaxY;
  uint64_t v391 = 0;
  v392 = &v391;
  uint64_t v393 = 0x3032000000;
  v394 = sub_C1EB8;
  v395 = sub_C1EC8;
  id v396 = 0;
  uint64_t v387 = 0;
  v388 = &v387;
  uint64_t v389 = 0x2020000000;
  char v390 = 0;
  uint64_t v48 = objc_opt_class();
  v49 = [(TUIFeedContent *)self->_content currentStackName];
  v50 = [v49 value];
  TUIDynamicCast(v48, v50);
  id v335 = (id)objc_claimAutoreleasedReturnValue();

  v51 = self;
  if (!self->_environmentChanged || (layoutViewState = self->_layoutViewState) == 0 || !self->_prevEnvironment)
  {
    unint64_t v344 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t obj = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_75;
  }
  v53 = [(TUIFeedViewState *)layoutViewState feedScrollAnchor];
  v54 = [v53 anchor];
  v55 = [v54 identifier];

  if (!v55)
  {
LABEL_58:
    unint64_t v344 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t obj = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_74;
  }
  v56 = [(TUIFeedContent *)self->_content entries];
  v57 = [v56 valueForKey:@"uuid"];
  v58 = (char *)[v57 indexOfObject:v55];

  unint64_t obj = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v344 = 0x7FFFFFFFFFFFFFFFLL;
  if (v58 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((unint64_t)v58 < self->_layoutNextSection)
    {
      v59 = self->_sections;
      v60 = +[NSNumber numberWithUnsignedInteger:v58];
      v61 = [(NSMutableDictionary *)v59 objectForKeyedSubscript:v60];

      v62 = [v61 renderModel];
      [v62 size];
      double v64 = v63;

      [(TUIEnvironment *)self->_prevEnvironment viewSize];
      double v66 = v65;
      v67 = [v53 anchor];
      v68 = (char *)[v67 position];

      if (v68 == (unsigned char *)&def_141F14 + 1)
      {
        double v69 = v66 - v64;
        v70 = self;
      }
      else
      {
        double v69 = 0.0;
        v70 = self;
        if (v68 == (unsigned char *)&def_141F14 + 2) {
          double v69 = (v66 - v64) * 0.5;
        }
      }
      [v53 relativeDistance];
      double v72 = v69 + v66 * 0.5 * v71;
      if (v58)
      {
        unint64_t obj = (unint64_t)v58;
        if (v72 > 0.0)
        {
          v73 = v58 - 1;
          double v74 = v69 + v66 * 0.5 * v71;
          do
          {
            v75 = v70->_sections;
            v76 = +[NSNumber numberWithUnsignedInteger:v73];
            v77 = [(NSMutableDictionary *)v75 objectForKeyedSubscript:v76];
            v78 = [v77 renderModel];
            [v78 size];
            double v80 = v79;

            BOOL v219 = v73-- != 0;
            v70 = self;
            if (!v219) {
              break;
            }
            double v74 = v74 - v80;
          }
          while (v74 > 0.0);
          unint64_t obj = (unint64_t)(v73 + 1);
        }
      }
      else
      {
        unint64_t obj = 0;
      }
      v81 = v58 + 1;
      if ((unint64_t)(v58 + 1) < v70->_layoutNextSection)
      {
        for (double i = v66 - (v64 + v72); i > 0.0; v70 = self)
        {
          if ((unint64_t)v81 >= v70->_layoutNextSection) {
            break;
          }
          v83 = v70->_sections;
          v84 = +[NSNumber numberWithUnsignedInteger:v81];
          v85 = [(NSMutableDictionary *)v83 objectForKeyedSubscript:v84];
          v86 = [v85 renderModel];
          [v86 size];
          double v88 = v87;

          double i = i - v88;
          ++v81;
        }
        v58 = v81 - 1;
      }

      unint64_t v344 = (unint64_t)v58;
      goto LABEL_74;
    }
    goto LABEL_58;
  }
LABEL_74:

  v51 = self;
LABEL_75:
  prevEnvironment = v51->_prevEnvironment;
  v51->_prevEnvironment = 0;

  v90 = self;
  if (self->_environmentChanged)
  {
    [(TUIEnvironment *)self->_environment viewSize];
    uint64_t v91 = *((void *)&v408 + 1);
    *(void *)(*((void *)&v408 + 1) + 32) = v92;
    *(void *)(v91 + 40) = 0;
    [(TUIEnvironment *)self->_environment viewSize];
    self->_loadingFooterMinY = v93 * 0.5;
    if (self->_currentRenderModel)
    {
      id v94 = 0;
    }
    else
    {
      id v94 = (id)objc_opt_new();

      v90 = self;
    }
    if (v90->_layoutNextSection)
    {
      v95 = v90;
      unint64_t v96 = 0;
      do
      {
        v97 = v95->_sections;
        v98 = +[NSNumber numberWithUnsignedInteger:v96];
        v99 = [(NSMutableDictionary *)v97 objectForKeyedSubscript:v98];

        [v99 setEnvironmentNeedsUpdate:1];
        [(TUIEnvironment *)self->_environment viewSize];
        double v101 = v100;
        v102 = [v99 renderModel];
        [v102 size];
        [v99 lq_createEmptyRenderModelWithSize:v101];

        v103 = (void *)v392[5];
        if (!v103)
        {
          uint64_t v104 = objc_opt_new();
          v105 = (void *)v392[5];
          v392[5] = v104;

          v103 = (void *)v392[5];
        }
        [v103 addIndex:v96];
        v106 = [v99 renderModel];
        [v94 addObject:v106];

        ++v96;
        v95 = self;
      }
      while (v96 < self->_layoutNextSection);
    }
    if (v94)
    {
      id v107 = [v94 copy];
      v108 = (void *)v399[5];
      v399[5] = (uint64_t)v107;
    }
    v90 = self;
  }
  v382[0] = _NSConcreteStackBlock;
  v382[1] = 3221225472;
  v382[2] = sub_C1F18;
  v382[3] = &unk_254AE8;
  v382[4] = v90;
  id v348 = v353;
  id v383 = v348;
  id v354 = v335;
  id v384 = v354;
  v385 = &v387;
  v386 = &v391;
  v340 = objc_retainBlock(v382);
  v109 = self;
  unint64_t layoutFlags = self->_layoutFlags;
  self->_unint64_t layoutFlags = 0;
  v110 = self->_layoutViewState;
  if (!v110) {
    goto LABEL_99;
  }
  v111 = [(TUIFeedViewState *)v110 feedScrollAnchor];
  v112 = [v111 anchor];
  v113 = [v112 identifier];

  if (v113)
  {
    v114 = [(TUIFeedContent *)self->_content entries];
    v115 = [v114 valueForKey:@"uuid"];
    v116 = (char *)[v115 indexOfObject:v113];

    if (v116 != (char *)0x7FFFFFFFFFFFFFFFLL && (unint64_t)v116 < self->_layoutNextSection)
    {
      ((void (*)(void *, char *))v340[2])(v340, v116);
      v117 = self->_sections;
      v118 = +[NSNumber numberWithUnsignedInteger:v116];
      v342 = [(NSMutableDictionary *)v117 objectForKeyedSubscript:v118];

      v119 = [v342 renderModel];
      [v119 size];
      double v121 = v120;

      [(TUIEnvironment *)self->_environment viewSize];
      double v123 = v122;
      v124 = [v111 anchor];
      v125 = (char *)[v124 position];

      if (v125 == (unsigned char *)&def_141F14 + 1)
      {
        double v126 = v123 - v121;
      }
      else
      {
        double v126 = 0.0;
        if (v125 == (unsigned char *)&def_141F14 + 2) {
          double v126 = (v123 - v121) * 0.5;
        }
      }
      [v111 relativeDistance];
      double v202 = v201;
      v203 = [v348 options];
      v204 = [v203 timingProvider];

      double v205 = v126 + v123 * 0.5 * v202;
      if (v204) {
        double v206 = v123 - (v121 + v205) + v123 * 0.5;
      }
      else {
        double v206 = v123 - (v121 + v205);
      }
      if (v116)
      {
        if (v204) {
          double v207 = v205 + v123 * 0.5;
        }
        else {
          double v207 = v205;
        }
        v208 = v116;
        do
        {
          BOOL v210 = obj != 0x7FFFFFFFFFFFFFFFLL && obj <= (unint64_t)v208 || v207 > 0.0;
          if (!v210) {
            break;
          }
          ((void (*)(void *, char *))v340[2])(v340, --v208);
          v211 = self->_sections;
          v212 = +[NSNumber numberWithUnsignedInteger:v208];
          v213 = [(NSMutableDictionary *)v211 objectForKeyedSubscript:v212];
          v214 = [v213 renderModel];
          [v214 size];
          double v216 = v215;

          double v207 = v207 - v216;
        }
        while (v208);
        int v217 = !v210;
      }
      else
      {
        int v217 = 0;
      }
      unint64_t v218 = (unint64_t)(v116 + 1);
      if (v218 < self->_layoutNextSection)
      {
        do
        {
          BOOL v219 = v344 != 0x7FFFFFFFFFFFFFFFLL && v344 >= v218;
          BOOL v220 = v219 || v206 > 0.0;
          if (!v220) {
            break;
          }
          ((void (*)(void *, unint64_t))v340[2])(v340, v218);
          v221 = self->_sections;
          v222 = +[NSNumber numberWithUnsignedInteger:v218];
          v223 = [(NSMutableDictionary *)v221 objectForKeyedSubscript:v222];
          v224 = [v223 renderModel];
          [v224 size];
          double v226 = v225;

          double v206 = v206 - v226;
          ++v218;
        }
        while (v218 < self->_layoutNextSection);
        if (v217) {
          goto LABEL_186;
        }
        int v217 = !v220;
      }
      if (!v217)
      {
LABEL_251:

        int v127 = 0;
        goto LABEL_95;
      }
LABEL_186:
      if (self->_inLiveResize)
      {
        self->_needsLayoutAfterLiveResize = 1;
      }
      else
      {
        v381[0] = _NSConcreteStackBlock;
        v381[1] = 3221225472;
        v381[2] = sub_C20BC;
        v381[3] = &unk_251990;
        v381[4] = self;
        [v348 addCompletion:v381];
      }
      goto LABEL_251;
    }
  }
  int v127 = 1;
LABEL_95:
  if (!self->_needsLayoutAfterLiveResize)
  {
    v128 = self->_layoutViewState;
    self->_layoutViewState = 0;
  }
  layoutFlags |= 1uLL;
  if (!v127)
  {
    int v345 = 0;
    BOOL v330 = 0;
    goto LABEL_115;
  }
  v109 = self;
LABEL_99:
  if (v109->_layoutNumberOfSections)
  {
    unint64_t v129 = 0;
    double v130 = 0.0;
    v131 = self;
    while (1)
    {
      v132 = v131->_sections;
      uint64_t v133 = +[NSNumber numberWithUnsignedInteger:v129];
      v134 = [(NSMutableDictionary *)v132 objectForKeyedSubscript:v133];

      v135 = [v134 renderModel];
      LOBYTE(v133) = v135 == 0;

      if (v133)
      {
        int v143 = 0;
        goto LABEL_113;
      }
      if (!self->_layoutUntilEntryWithUUID && (*(unsigned char *)&self->_flags & 1) != 0)
      {
        [(TUIEnvironment *)self->_environment viewSize];
        if (v130 > v136
          || v129 > [(TUIFeedContent *)self->_content initialContentReadyEntryIndex])
        {
          break;
        }
      }
      ((void (*)(void *, unint64_t))v340[2])(v340, v129);
      v137 = [v134 renderModel];
      [v137 size];
      double v139 = v138;

      v140 = [v134 entry];
      v141 = [v140 stackNames];
      unsigned int v142 = [v141 containsObject:v354];

      if (!v142) {
        double v139 = 0.0;
      }

      double v130 = v130 + v139;
      ++v129;
      v131 = self;
      if (v129 >= self->_layoutNumberOfSections) {
        goto LABEL_109;
      }
    }
    int v143 = 1;
LABEL_113:
  }
  else
  {
LABEL_109:
    int v143 = 0;
  }
  BOOL v330 = v143 != 0;
  int v345 = 1;
LABEL_115:
  v144 = self;
  if (*((unsigned char *)v388 + 24))
  {
    v145 = [v348 date];
    [(TUIStatsDatesCollector *)self->_datesCollector setDynamicUpdateDate:v145];

    v144 = self;
  }
  if (v392[5])
  {
    v146 = objc_opt_new();
    long long v379 = 0u;
    long long v380 = 0u;
    long long v377 = 0u;
    long long v378 = 0u;
    id obja = (id)v399[5];
    id v147 = [obja countByEnumeratingWithState:&v377 objects:v407 count:16];
    if (v147)
    {
      uint64_t v148 = *(void *)v378;
      double v149 = 0.0;
      do
      {
        for (j = 0; j != v147; j = (char *)j + 1)
        {
          if (*(void *)v378 != v148) {
            objc_enumerationMutation(obja);
          }
          v151 = *(void **)(*((void *)&v377 + 1) + 8 * (void)j);
          id v152 = [v151 section];
          v153 = self->_sections;
          v154 = +[NSNumber numberWithUnsignedInteger:v152];
          v155 = [(NSMutableDictionary *)v153 objectForKeyedSubscript:v154];

          if ([(id)v392[5] containsIndex:v152])
          {
            id v156 = [v155 renderModel];
          }
          else
          {
            id v156 = v151;
          }
          [v156 size];
          double v158 = v157;
          double v160 = v159;
          v161 = [v155 entry];
          v162 = [v161 stackNames];
          unsigned int v163 = [v162 containsObject:v354];

          if (!v163) {
            double v160 = 0.0;
          }
          id v164 = [v156 section];
          v165 = [v151 UUID];
          id v166 = [v156 copyWithSection:v164 offset:v165 size:0.0 uuid:v149];

          [v166 frame];
          double Height = CGRectGetHeight(v418);
          [v146 addObject:v166];

          double v149 = v149 + Height;
        }
        id v147 = [obja countByEnumeratingWithState:&v377 objects:v407 count:16];
      }
      while (v147);
    }
    else
    {
      double v149 = 0.0;
    }

    *(double *)(*((void *)&v408 + 1) + 40) = v149;
    id v168 = [v146 copy];
    v169 = (void *)v399[5];
    v399[5] = (uint64_t)v168;

    v144 = self;
  }
  if (!v345) {
    goto LABEL_152;
  }
  unint64_t v170 = v144->_layoutNextSection;
  if (!v144->_layoutUntilEntryWithUUID || !v170)
  {
LABEL_139:
    if (v170 < v144->_layoutNumberOfSections)
    {
      id v178 = 0;
      while (1)
      {
        v179 = v144->_sections;
        v180 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
        v177 = [(NSMutableDictionary *)v179 objectForKeyedSubscript:v180];

        v343 = [v177 renderModel];

        if (!v343)
        {
          v343 = 0;
          goto LABEL_189;
        }
        v181 = self;
        if (!self->_layoutUntilEntryWithUUID && (*(unsigned char *)&self->_flags & 1) != 0)
        {
          double v182 = *(double *)(*((void *)&v408 + 1) + 40);
          [(TUIEnvironment *)self->_environment viewSize];
          if (v182 > v183) {
            break;
          }
          unint64_t v184 = self->_layoutNextSection;
          unint64_t v185 = [(TUIFeedContent *)self->_content initialContentReadyEntryIndex];
          v181 = self;
          if (v184 > v185) {
            break;
          }
        }
        ++v181->_layoutNextSection;
        [v343 size];
        double v187 = v186;
        double v189 = v188;
        v190 = [v177 entry];
        v191 = [v190 stackNames];
        unsigned int v192 = [v191 containsObject:v354];

        if (!v192) {
          double v189 = 0.0;
        }
        id v193 = [v343 section];
        double v194 = *(double *)(*((void *)&v408 + 1) + 40);
        v195 = [v343 UUID];
        id v178 = [v343 copyWithSection:v193 offset:v195 size:0.0 uuid:v194];

        [v178 frame];
        *(CGFloat *)(*((void *)&v408 + 1) + 40) = CGRectGetHeight(v419) + *(double *)(*((void *)&v408 + 1) + 40);
        uint64_t v196 = [(id)v399[5] arrayByAddingObject:v178];
        v197 = (void *)v399[5];
        v399[5] = v196;

        if (self->_layoutUntilEntryWithUUID)
        {
          v198 = [v178 UUID];
          unsigned int v199 = [v198 isEqual:self->_layoutUntilEntryWithUUID];

          if (v199)
          {
            layoutUntilEntryWithUUID = self->_layoutUntilEntryWithUUID;
            self->_layoutUntilEntryWithUUID = 0;

            char v331 = 1;
            BOOL v338 = 1;
            v343 = v178;
            goto LABEL_189;
          }
        }

        v144 = self;
        BOOL v338 = 1;
        if (self->_layoutNextSection >= self->_layoutNumberOfSections)
        {
          v343 = v178;
          goto LABEL_190;
        }
      }
      BOOL v330 = 1;
      goto LABEL_189;
    }
LABEL_152:
    v343 = 0;
    goto LABEL_190;
  }
  v171 = v144->_sections;
  v172 = +[NSNumber numberWithUnsignedInteger:v170 - 1];
  v173 = [(NSMutableDictionary *)v171 objectForKeyedSubscript:v172];
  v174 = [v173 renderModel];
  v175 = [v174 UUID];
  unsigned __int8 v176 = [v175 isEqual:v144->_layoutUntilEntryWithUUID];

  if ((v176 & 1) == 0)
  {
    v144 = self;
    unint64_t v170 = self->_layoutNextSection;
    goto LABEL_139;
  }
  v343 = 0;
  v177 = self->_layoutUntilEntryWithUUID;
  self->_layoutUntilEntryWithUUID = 0;
  char v331 = 1;
LABEL_189:

  v144 = self;
LABEL_190:
  id v341 = objc_alloc_init((Class)NSMutableArray);
  id v339 = objc_alloc_init((Class)NSMutableArray);
  v227 = [(TUIAnchorSet *)[TUIMutableAnchorSet alloc] initWithAxis:2];
  v346 = objc_opt_new();
  objb = objc_alloc_init(TUILayoutRenderModelCollector);
  if (v144->_layoutNextSection)
  {
    unint64_t v228 = 0;
    do
    {
      v229 = v144->_sections;
      v230 = +[NSNumber numberWithUnsignedInteger:v228];
      v231 = [(NSMutableDictionary *)v229 objectForKeyedSubscript:v230];

      v232 = [v231 renderModel];
      v233 = [v232 UUID];

      [v231 lq_appendAnchorsToSet:v227];
      v234 = [v231 renderModel];
      [v234 size];
      double v236 = v235;

      if (!v228)
      {
        v237 = [[TUILogicalScrollAnchor alloc] initWithPosition:0 identifier:v233];
        [(TUIMutableAnchorSet *)v227 appendLogicalScrollAnchor:v237 withOffset:0.0];
      }
      v238 = [[TUILogicalScrollAnchor alloc] initWithPosition:2 identifier:v233];
      [(TUIMutableAnchorSet *)v227 appendLogicalScrollAnchor:v238 withOffset:v236 * 0.5];

      if (++v228 == self->_layoutNextSection)
      {
        v239 = [[TUILogicalScrollAnchor alloc] initWithPosition:1 identifier:v233];
        [(TUIMutableAnchorSet *)v227 appendLogicalScrollAnchor:v239 withOffset:v236];
      }
      [(TUIMutableAnchorSet *)v227 translationOffset];
      [(TUIMutableAnchorSet *)v227 setTranslationOffset:v236 + v240];
      [v231 lq_updateAuxiliaryLayoutWithTransactionGroup:v348];
      v241 = [v231 auxRenderModel];

      if (v241)
      {
        v242 = [v231 auxRenderModel];
        [v341 addObject:v242];
      }
      v243 = [v231 layoutController];
      v244 = [v243 rootLayout];
      v245 = [v231 renderModel];
      [v245 offset];
      [v244 appendVisibleBoundsObservers:v346 axis:2 offset:v246];

      v247 = [v231 layoutController];
      v248 = [v247 rootLayout];
      v249 = [v231 entry];
      v250 = [v249 uuid];
      [(TUILayoutRenderModelCollector *)objb collectWithRoot:v248 options:1 entryUUID:v250];

      v144 = self;
    }
    while (v228 < self->_layoutNextSection);
  }
  v251 = [(TUILayoutRenderModelCollector *)objb hostingCollectorFinalizeMap];
  unsigned int v252 = [v251 isEqualToMap:v144->_currentHostingMap];
  v253 = v251;
  p_currentHostingMap = (id *)&v144->_currentHostingMap;
  if (v252)
  {
    v255 = v253;
    id v256 = *p_currentHostingMap;

    v253 = v256;
  }
  v328 = v253;
  objc_storeStrong(p_currentHostingMap, v253);
  v257 = self;
  v334 = [[TUIRenderModelAuxiliary alloc] initWithModels:v341];
  if (!self->_currentAuxiliaryModel
    || [v341 count]
    && ![(TUIRenderModelAuxiliary *)v334 isEqualToRenderModel:self->_currentAuxiliaryModel])
  {
    objc_storeStrong((id *)&self->_currentAuxiliaryModel, v334);
    v257 = self;
  }
  if (v257->_renderModelMode == 1)
  {
    if (v257->_layoutNumberOfSections)
    {
      unint64_t v259 = 0;
      char v332 = 0;
      double v260 = 0.0;
      *(void *)&long long v258 = 134218240;
      long long v327 = v258;
      while (1)
      {
        v261 = v257->_sections;
        v262 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v259, v327, v328, v329);
        v263 = [(NSMutableDictionary *)v261 objectForKeyedSubscript:v262];

        v264 = [v263 layerRenderModel];
        BOOL v265 = v264 == 0;

        if (v265) {
          break;
        }
        [v263 lq_updateLayerLayoutWithTransactionGroup:v348];
        v266 = [v263 layerRenderModel];
        v267 = [v266 identifier];
        BOOL v268 = v267 == 0;

        if (v268)
        {
          v269 = [v263 layerRenderModel];
          [v269 setIdentifier:&off_267B68];

          v270 = TUILayoutLog();
          if (os_log_type_enabled(v270, OS_LOG_TYPE_ERROR))
          {
            unint64_t v280 = self->_feedId.uniqueIdentifier;
            *(_DWORD *)v404 = v327;
            *(void *)&v404[4] = v280;
            __int16 v405 = 2048;
            unint64_t v406 = v259;
            _os_log_error_impl(&def_141F14, v270, OS_LOG_TYPE_ERROR, "[fid:%lu] invalid layout for render model in section: %lu during layout for feed capture!! Check <template> for multiple root elements!!", v404, 0x16u);
          }

          char v332 = 1;
        }
        v271 = [v263 layerRenderModel];
        v272 = [[TUIRenderModelTransform alloc] initWithSubmodel:v271];
        [v271 size];
        CGFloat v274 = v273;
        [v271 size];
        CGFloat v276 = v275;
        v420.origin.x = 0.0;
        v420.origin.y = v260;
        v420.size.width = v274;
        v420.size.height = v276;
        double MidX = CGRectGetMidX(v420);
        v421.origin.x = 0.0;
        v421.origin.y = v260;
        v421.size.width = v274;
        v421.size.height = v276;
        -[TUIRenderModelTransform setCenter:](v272, "setCenter:", MidX, CGRectGetMidY(v421));
        [v271 size];
        double v279 = v278;
        [v339 addObject:v272];

        double v260 = v260 + v279;
        ++v259;
        v257 = self;
        if (v259 >= self->_layoutNumberOfSections) {
          goto LABEL_218;
        }
      }

      v257 = self;
    }
    else
    {
      char v332 = 0;
    }
LABEL_218:
    v282 = [v339 lastObject];
    [(TUIEnvironment *)v257->_environment viewSize];
    double v284 = v283;
    if (v282)
    {
      [v282 frame];
      double v285 = CGRectGetMaxY(v422);
    }
    else
    {
      double v285 = 0.0;
    }
    v286 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", v284, v285);
    v287 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v339, v286, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v287, "setSize:", v284, v285);
    if (!v257->_currentLayerRenderModel
      || [v339 count]
      && ![(TUIRenderModelLayer *)v287 isEqualToRenderModel:v257->_currentLayerRenderModel])
    {
      objc_storeStrong((id *)&v257->_currentLayerRenderModel, v287);
    }

    char v281 = v332 & 1;
    v257 = self;
  }
  else
  {
    char v281 = 0;
  }
  [(TUIEnvironment *)v257->_environment contentsScale];
  -[TUIMutableAnchorSet finalizeWithContentsScale:](v227, "finalizeWithContentsScale:");
  v288 = (TUIAnchorSet *)[(TUIMutableAnchorSet *)v227 copy];
  anchorSet = v257->_anchorSet;
  v257->_anchorSet = v288;

  v290 = [v348 categories];
  unsigned __int8 v291 = [v290 containsObject:@"content-load"];

  v292 = self->_restoreViewState;
  restoreViewState = self->_restoreViewState;
  self->_restoreViewState = 0;

  kdebug_trace();
  v294 = TUILayoutLog();
  if (os_log_type_enabled(v294, OS_LOG_TYPE_INFO))
  {
    unint64_t v295 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v404 = 134218242;
    *(void *)&v404[4] = v295;
    __int16 v405 = 2112;
    unint64_t v406 = (unint64_t)v348;
    _os_log_impl(&def_141F14, v294, OS_LOG_TYPE_INFO, "[fid:%lu] Ariadne FeedLayoutEnd group=%@", v404, 0x16u);
  }

  v296 = TUIInstantiationLog();
  v297 = v296;
  os_signpost_id_t v298 = self->_frameSignpost;
  if (v298 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v296))
  {
    unint64_t v299 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v404 = 134217984;
    *(void *)&v404[4] = v299;
    _os_signpost_emit_with_name_impl(&def_141F14, v297, OS_SIGNPOST_INTERVAL_END, v298, "Layout", "[fid:%lu] ", v404, 0xCu);
  }

  v300 = TUIInstantiationLog();
  v301 = v300;
  os_signpost_id_t v302 = self->_frameSignpost;
  if (v302 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v300))
  {
    unint64_t v303 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v404 = 134217984;
    *(void *)&v404[4] = v303;
    _os_signpost_emit_with_name_impl(&def_141F14, v301, OS_SIGNPOST_INTERVAL_BEGIN, v302, "UpdateRenderModels", "[fid:%lu] ", v404, 0xCu);
  }

  v362[0] = _NSConcreteStackBlock;
  v362[1] = 3221225472;
  v362[2] = sub_C20C4;
  v362[3] = &unk_254BA0;
  unsigned __int8 v373 = v291;
  v362[4] = self;
  v368 = buf;
  v369 = &v398;
  v370 = &v408;
  id v347 = v346;
  id v363 = v347;
  v333 = v227;
  v364 = v333;
  char v374 = v331;
  id v304 = v348;
  id v365 = v304;
  v305 = v292;
  char v375 = v281;
  BOOL v376 = v338;
  v366 = v305;
  v371 = &v391;
  unint64_t v372 = layoutFlags;
  id v349 = v329;
  id v367 = v349;
  [v304 computeFinalUpdatesWithBlock:v362];
  [(TUIStatsTimingCollector *)self->_timingCollector endPhase:0];
  v306 = TUIInstantiationLog();
  v307 = v306;
  os_signpost_id_t v308 = self->_frameSignpost;
  if (v308 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v306))
  {
    unint64_t v309 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v404 = 134217984;
    *(void *)&v404[4] = v309;
    _os_signpost_emit_with_name_impl(&def_141F14, v307, OS_SIGNPOST_INTERVAL_END, v308, "UpdateRenderModels", "[fid:%lu] ", v404, 0xCu);
  }

  v310 = self;
  if (self->_statsLiveResize)
  {
    v311 = self->_sections;
    v361[0] = _NSConcreteStackBlock;
    v361[1] = 3221225472;
    v361[2] = sub_C2A4C;
    v361[3] = &unk_254BC8;
    v361[4] = self;
    [(NSMutableDictionary *)v311 enumerateKeysAndObjectsUsingBlock:v361];
    [(TUIStatsLiveResize *)self->_statsLiveResize endFrame];
  }
  if (self->_statsCollector)
  {
    *(void *)v404 = 0;
    mach_timebase_info((mach_timebase_info_t)v404);
    v312 = objc_opt_new();
    v313 = self->_sections;
    v358[0] = _NSConcreteStackBlock;
    v358[1] = 3221225472;
    v358[2] = sub_C2AD8;
    v358[3] = &unk_254BF0;
    uint64_t v360 = *(void *)v404;
    v358[4] = self;
    id v314 = v312;
    id v359 = v314;
    [(NSMutableDictionary *)v313 enumerateKeysAndObjectsUsingBlock:v358];
    v315 = objc_opt_new();
    v316 = self;
    if (self->_layoutNextSection)
    {
      unint64_t v317 = 0;
      do
      {
        v318 = v316->_sections;
        v319 = +[NSNumber numberWithUnsignedInteger:v317];
        v320 = [(NSMutableDictionary *)v318 objectForKeyedSubscript:v319];
        v321 = [v320 entry];
        v322 = [v321 uid];
        [v315 addObject:v322];

        ++v317;
        v316 = self;
      }
      while (v317 < self->_layoutNextSection);
    }
    [(TUIStatsTimingCollector *)v316->_timingCollector finalizeWithTimebase:*(void *)v404];
    v323 = v316;
    v324 = [[TUIStatsFeedPass alloc] initWithMode:v316->_lq_statsMode timingCollector:v316->_timingCollector passes:v314];
    [(TUIStatsCollector *)v323->_statsCollector updateWithPass:v324 currentEntriesUID:v315];

    v310 = self;
  }
  [(TUIStatsTimingCollector *)v310->_timingCollector reset];
  [(NSMutableDictionary *)v310->_sections enumerateKeysAndObjectsUsingBlock:&stru_254C10];
  if (v310->_lq_statsMode & 0x10) != 0 && (*(unsigned char *)&v310->_delegateFlags)
  {
    v325 = [[TUIStatsFeed alloc] initWithDates:v310->_datesCollector collector:v310->_statsCollector];
    v356[0] = _NSConcreteStackBlock;
    v356[1] = 3221225472;
    v356[2] = sub_C2CE0;
    v356[3] = &unk_254C38;
    v356[4] = v310;
    v326 = v325;
    v357 = v326;
    [v304 appendUpdateBlock:v356];

    v310 = self;
  }
  v310->_environmentChanged = 0;
  objc_storeStrong((id *)&v310->_previousStackName, v335);
  if (v330)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(TUIFeedLayoutController *)self layoutIfNeededWithTransaction:0];
  }

  _Block_object_dispose(&v387, 8);
  _Block_object_dispose(&v391, 8);

  _Block_object_dispose(&v408, 8);
  _Block_object_dispose(&v398, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_lq_scheduleLayoutRemainder
{
  id v3 = +[TUITransaction noAnimationTransaction];
  transactionCoordinator = self->_transactionCoordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_C2DC8;
  v5[3] = &unk_2526E0;
  v5[4] = self;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v3 block:v5];
}

- (BOOL)_lq_shouldInstantiateEntry:(id)a3 sectionIndex:(unint64_t)a4 transactionGroup:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_lock(&self->_layoutConditionsLock);
  v10 = [(NSHashTable *)self->_layoutConditionsSuspendingLayout allObjects];
  os_unfair_lock_unlock(&self->_layoutConditionsLock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    os_unfair_lock_t lock = &self->_layoutConditionsLock;
    v28 = v9;
    id v14 = 0;
    uint64_t v15 = *(void *)v36;
    char v16 = 1;
    do
    {
      for (double i = 0; i != v13; double i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(id *)(*((void *)&v35 + 1) + 8 * i);
        if ([v18 evaluateWithEntry:v8 index:a4])
        {
          if (!v14) {
            id v14 = objc_opt_new();
          }
          [v14 addObject:v18];
        }
        else
        {
          char v16 = 0;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);

    if (!v14)
    {
      id v24 = 0;
      id v9 = v28;
      goto LABEL_25;
    }
    os_unfair_lock_lock(lock);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v14;
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          [(NSHashTable *)self->_layoutConditionsSuspendingLayout removeObject:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v21);
    }

    os_unfair_lock_unlock(lock);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_C30A4;
    v29[3] = &unk_251990;
    id v24 = v19;
    id v30 = v24;
    id v9 = v28;
    [v28 addCompletion:v29];
    char v25 = v30;
  }
  else
  {
    id v24 = 0;
    char v16 = 1;
    char v25 = v11;
  }

LABEL_25:
  return v16 & 1;
}

- (BOOL)_lq_shouldSubmitRenderModelUpdate:(BOOL)a3 transactionGroup:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_layoutConditionsLock);
  char v7 = [(NSHashTable *)self->_layoutConditionsSuspendingUpdates allObjects];
  os_unfair_lock_t lock = &self->_layoutConditionsLock;
  os_unfair_lock_unlock(&self->_layoutConditionsLock);
  if (a3) {
    unsigned int v8 = 1;
  }
  else {
    unsigned int v8 = [v6 flags] & 1;
  }
  unint64_t renderModelMode = self->_renderModelMode;
  if (!renderModelMode)
  {
    uint64_t v10 = 256;
    goto LABEL_8;
  }
  if (renderModelMode == 1)
  {
    uint64_t v10 = 280;
LABEL_8:
    id v11 = *(id *)((char *)&self->super.isa + v10);
    goto LABEL_10;
  }
  id v11 = 0;
LABEL_10:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (!v13)
  {

    id v25 = v12;
    uint64_t v15 = 0;
    char v27 = 1;
    goto LABEL_41;
  }
  id v14 = v13;
  unsigned int v32 = v8;
  long long v33 = v6;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)v42;
  char v17 = 1;
  do
  {
    for (double i = 0; i != v14; double i = (char *)i + 1)
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(v12);
      }
      id v19 = *(id *)(*((void *)&v41 + 1) + 8 * i);
      if ([v19 evaluateWithRenderModel:v11])
      {
        if (!v15) {
          uint64_t v15 = objc_opt_new();
        }
        [v15 addObject:v19];
      }
      else
      {
        char v17 = 0;
      }
    }
    id v14 = [v12 countByEnumeratingWithState:&v41 objects:v52 count:16];
  }
  while (v14);

  if (v15)
  {
    os_unfair_lock_lock(lock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = v15;
    id v21 = [v20 countByEnumeratingWithState:&v37 objects:v51 count:16];
    unsigned int v8 = v32;
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          [(NSHashTable *)self->_layoutConditionsSuspendingUpdates removeObject:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
        }
        id v22 = [v20 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v22);
    }

    id v25 = [(NSHashTable *)self->_layoutConditionsSuspendingUpdates allObjects];
    os_unfair_lock_unlock(lock);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_C3560;
    v35[3] = &unk_251990;
    id v26 = v20;
    id v36 = v26;
    id v6 = v33;
    [v33 addCompletion:v35];

    if (v17)
    {
      char v27 = 1;
      uint64_t v15 = v26;
      goto LABEL_41;
    }
  }
  else
  {
    id v25 = v12;
    unsigned int v8 = v32;
    if (v17)
    {
      uint64_t v15 = 0;
      char v27 = 1;
      id v6 = v33;
      goto LABEL_41;
    }
    id v6 = v33;
  }
  v28 = TUITransactionLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    CFStringRef v30 = @"NO";
    *(_DWORD *)buf = 134218498;
    if (v8) {
      CFStringRef v30 = @"YES";
    }
    unint64_t v46 = uniqueIdentifier;
    __int16 v47 = 2112;
    CFStringRef v48 = v30;
    __int16 v49 = 2112;
    id v50 = v25;
    _os_log_impl(&def_141F14, v28, OS_LOG_TYPE_INFO, "[fid:%lu] layout conditions not meet; forcing=%@; remaining conditions: %@",
      buf,
      0x20u);
  }

  char v27 = 0;
LABEL_41:

  return v8 | v27;
}

- (void)setPriority:(float)a3
{
  float v4 = TUIPriorityClamp(a3);
  if (self->_priority != v4)
  {
    CFStringRef v5 = TUILayoutLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      double priority = self->_priority;
      *(_DWORD *)buf = 134218496;
      unint64_t v13 = uniqueIdentifier;
      __int16 v14 = 2048;
      double v15 = priority;
      __int16 v16 = 2048;
      double v17 = v4;
      _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_INFO, "[fid:%lu] changing priority %f -> %f", buf, 0x20u);
    }

    *(float *)&double v8 = v4;
    [(TUIWorkQueueContext *)self->_queueContext setPriority:v8];
    self->_double priority = v4;
    dataRequestsSync = self->_dataRequestsSync;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_C3798;
    v10[3] = &unk_254C80;
    v10[4] = self;
    float v11 = v4;
    dispatch_sync(dataRequestsSync, v10);
  }
}

- (void)setStatsMode:(unint64_t)a3
{
  if (self->_statsMode != a3)
  {
    CFStringRef v5 = TUILayoutLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      unint64_t statsMode = self->_statsMode;
      *(_DWORD *)buf = 134218496;
      unint64_t v11 = uniqueIdentifier;
      __int16 v12 = 2048;
      unint64_t v13 = statsMode;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_INFO, "[fid:%lu] changing stats mode %04lx -> %04lx", buf, 0x20u);
    }

    self->_unint64_t statsMode = a3;
    double v8 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_C3960;
    v9[3] = &unk_251A30;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(v8, v9);
  }
}

- (void)setLayoutState:(unint64_t)a3
{
  if (self->_layoutState != a3)
  {
    char delegateFlags = (char)self->_delegateFlags;
    if ((delegateFlags & 2) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained feedLayoutController:self willTransitionToLayoutState:a3];

      char delegateFlags = (char)self->_delegateFlags;
    }
    self->_layoutState = a3;
    if ((delegateFlags & 4) != 0)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 feedLayoutController:self didTransitionToLayoutState:a3];
    }
  }
}

- (unint64_t)layoutState
{
  return self->_layoutState;
}

- (void)collectStatsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFStringRef v5 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_C3BE4;
    v6[3] = &unk_2525D8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)statRecordInitialResourcesRenderedDate
{
  id v3 = +[NSDate date];
  id v4 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C3D10;
  v6[3] = &unk_251828;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)statRecordResourcesStartLoadingDate
{
  id v3 = +[NSDate date];
  id v4 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C3E30;
  v6[3] = &unk_251828;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)statRecordResourcesLoadedDate
{
  id v3 = +[NSDate date];
  id v4 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C3F50;
  v6[3] = &unk_251828;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)statRecordViewWillAppear
{
  id v3 = +[NSDate date];
  id v4 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C4070;
  v6[3] = &unk_251828;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)_cancelDataRequests
{
  dataRequestsSync = self->_dataRequestsSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C4144;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_sync(dataRequestsSync, block);
}

- (void)updateWithContent:(id)a3 layoutUpToEntry:(id)a4 environment:(id)a5 transaction:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  __int16 v14 = +[NSDate date];
  unint64_t v15 = [v13 uuid];

  if (!v12)
  {
    id v12 = +[TUITransaction currentOrImplicitTransaction];
  }
  [(TUIFeedLayoutController *)self _cancelDataRequests];
  __int16 v16 = TUITransactionLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    id v19 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
    *(_DWORD *)buf = 134218754;
    unint64_t v35 = uniqueIdentifier;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 2112;
    id v39 = WeakRetained;
    __int16 v40 = 2112;
    id v41 = v19;
    _os_log_impl(&def_141F14, v16, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithContent:layoutUpToEntry:environment:transaction: - tx=%@, lastEnvironmentToken=%@, lastContentToken=%@", buf, 0x2Au);
  }
  id v20 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  [v12 dependentOn:v20];

  id v21 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
  [v12 dependentOn:v21];

  id v22 = [v12 dependencyToken];
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v22);

  uint64_t v23 = [v12 dependencyToken];
  objc_storeWeak((id *)&self->_lastContentTransactionToken, v23);

  transactionCoordinator = self->_transactionCoordinator;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_C4454;
  v29[3] = &unk_254D08;
  void v29[4] = self;
  id v30 = v11;
  id v31 = v15;
  id v32 = v10;
  id v33 = v14;
  id v25 = v14;
  id v26 = v10;
  id v27 = v15;
  id v28 = v11;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v12 block:v29];
}

- (void)layoutIfNeededWithTransaction:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[TUITransaction currentOrImplicitTransaction];
  }
  id v5 = v4;
  [(TUITransactionCoordinating *)self->_transactionCoordinator scheduleLayoutUpdateWithTransaction:v4 block:&stru_254D28];
}

- (void)updateWithContent:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[NSDate date];
  if (!v7)
  {
    id v7 = +[TUITransaction currentOrImplicitTransaction];
  }
  [(TUIFeedLayoutController *)self _cancelDataRequests];
  id v9 = TUITransactionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    id v12 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
    *(_DWORD *)buf = 134218754;
    unint64_t v22 = uniqueIdentifier;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = WeakRetained;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithContent: - tx=%@, lastEnvironmentToken=%@, lastContentToken=%@", buf, 0x2Au);
  }
  id v13 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
  [v7 dependentOn:v13];

  __int16 v14 = [v7 dependencyToken];
  objc_storeWeak((id *)&self->_lastContentTransactionToken, v14);

  transactionCoordinator = self->_transactionCoordinator;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_C475C;
  v18[3] = &unk_254D50;
  v18[4] = self;
  id v19 = v6;
  id v20 = v8;
  id v16 = v8;
  id v17 = v6;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v7 block:v18];
}

- (void)lq_updateContent:(id)a3 contentUpdateDate:(id)a4 transaction:(id)a5 transactionGroup:(id)a6
{
  id v35 = a3;
  id v37 = a4;
  id v36 = a5;
  id v34 = a6;
  id v11 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = TUILayoutLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = uniqueIdentifier;
    _os_log_impl(&def_141F14, v12, OS_LOG_TYPE_INFO, "[fid:%lu] lq_updateContent", (uint8_t *)&buf, 0xCu);
  }

  [(TUIStatsDatesCollector *)self->_datesCollector setContentUpdateDate:v37];
  [(TUIStatsDatesCollector *)self->_datesCollector setInitialContentReadyDate:0];
  [(TUIStatsDatesCollector *)self->_datesCollector setDynamicUpdateDate:0];
  [(TUIStatsDatesCollector *)self->_datesCollector setResourcesLoadedDate:0];
  objc_storeStrong((id *)&self->_content, a3);
  id v41 = (void *)(self->_layoutGenerationId + 1);
  self->_layoutGenerationId = (unint64_t)v41;
  *(_OWORD *)&self->_unint64_t layoutNextSection = xmmword_243380;
  id v39 = objc_opt_new();
  long long v42 = [v36 tx];
  layoutUntilEntryWithUUID = self->_layoutUntilEntryWithUUID;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = [(TUIFeedContent *)self->_content entries];
  id v15 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = 0;
    char v17 = layoutUntilEntryWithUUID != 0;
    uint64_t v40 = *(void *)v53;
    do
    {
      for (double i = 0; i != v15; double i = (char *)i + 1)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v57 = 0x3032000000;
        v58 = sub_C1EB8;
        v59 = sub_C1EC8;
        if (v17)
        {
          id v20 = [v42 options];
          id v60 = +[TUITransaction transactionWithOptions:v20];
        }
        else
        {
          id v60 = +[TUITransaction currentOrImplicitTransaction];
        }
        id v21 = [*(id *)(*((void *)&buf + 1) + 40) tx];
        [*(id *)(*((void *)&buf + 1) + 40) addCategory:@"content-load"];
        [v21 addCompletionDeferral];
        [v21 addSubTransactionCompletionDeferral];
        if (v17)
        {
          unint64_t v22 = [(TUIWorkQueueContext *)self->_queueContext activeCallbackQueue];
          [v42 addSubTransaction:v21 completionQueue:v22];

          __int16 v23 = [v19 uuid];
          unsigned __int8 v24 = [v23 isEqual:self->_layoutUntilEntryWithUUID];

          char v17 = v24 ^ 1;
        }
        else
        {
          char v17 = 0;
        }
        id v25 = [(TUIFeedLayoutController *)self lq_createRenderModelForFeedEntry:v19 section:(char *)i + v16];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v19);
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2020000000;
        v49[3] = -1;
        float priority = self->_priority;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_C4D58;
        v43[3] = &unk_254DA0;
        objc_copyWeak(&v47, &location);
        objc_copyWeak(v48, &from);
        uint64_t v45 = v49;
        p_long long buf = &buf;
        v48[1] = (char *)i + v16;
        v48[2] = v41;
        id v27 = v21;
        id v44 = v27;
        *(float *)&double v28 = priority;
        v29 = [v19 requestDataWithPriority:v43 block:v28];
        if (v29) {
          [v39 addObject:v29];
        }

        objc_destroyWeak(v48);
        objc_destroyWeak(&v47);
        _Block_object_dispose(v49, 8);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

        _Block_object_dispose(&buf, 8);
      }
      id v15 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
      v16 += (uint64_t)i;
    }
    while (v15);
  }

  id v30 = (NSArray *)[v39 copy];
  dataRequests = self->_dataRequests;
  self->_dataRequests = v30;

  id v32 = [v35 entries];
  self->_unint64_t layoutNumberOfSections = (unint64_t)[v32 count];

  if (!self->_layoutUntilEntryWithUUID)
  {
    unint64_t layoutNumberOfSections = self->_layoutNumberOfSections;
    if (layoutNumberOfSections != 0x7FFFFFFFFFFFFFFFLL && self->_layoutNextSection < layoutNumberOfSections) {
      [(TUIFeedLayoutController *)self setLayoutState:1];
    }
  }
}

- (void)updateDatesCollectorWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C52F0;
  v7[3] = &unk_252600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateWithEnvironment:(id)a3 state:(id)a4 withTransaction:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = TUIInstantiationLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TUIFeedLayoutController.updateWithEnvironment", (const char *)&unk_243F7A, buf, 2u);
  }

  os_unfair_lock_lock(&self->_environmentLock);
  objc_storeStrong((id *)&self->_environmentPendingUpdate, a3);
  os_unfair_lock_unlock(&self->_environmentLock);
  if (!v10)
  {
    id v10 = +[TUITransaction currentOrImplicitTransaction];
  }
  id v13 = TUITransactionLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)long long buf = 134218498;
    unint64_t v26 = uniqueIdentifier;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = WeakRetained;
    _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithEnvironment:state:withTransaction: - tx=%@, lastEnvironmentToken=%@", buf, 0x20u);
  }
  id v16 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  [v10 dependentOn:v16];

  char v17 = [v10 dependencyToken];
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v17);

  id v18 = [v11 copy];
  transactionCoordinator = self->_transactionCoordinator;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_C5578;
  v22[3] = &unk_254D50;
  v22[4] = self;
  id v23 = v9;
  id v24 = v18;
  id v20 = v18;
  id v21 = v9;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v10 block:v22];
}

- (void)updateHostingGeometryMap:(id)a3 withTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = TUITransactionLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)long long buf = 134218498;
    unint64_t v18 = uniqueIdentifier;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = WeakRetained;
    _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateHostingGeometryMap:withTransaction - tx=%@, lastEnvironmentTx=%@", buf, 0x20u);
  }
  if (!v7)
  {
    id v7 = +[TUITransaction currentOrImplicitTransaction];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  [v7 dependentOn:v11];

  id v12 = [v7 dependencyToken];
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v12);

  transactionCoordinator = self->_transactionCoordinator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_C57F4;
  v15[3] = &unk_254DC8;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v7 block:v15];
}

- (BOOL)lq_updateHostingGeometryMap:(id)a3
{
  id v5 = (TUIHostingGeometryMap *)a3;
  if (self->_hostingGeometryMap == v5)
  {
    BOOL v16 = 0;
  }
  else
  {
    id v6 = [_TUIHostingGeometryMapUpdate alloc];
    hostingGeometryMap = self->_hostingGeometryMap;
    id v8 = [(TUIManager *)self->_manager viewRegistry];
    id v9 = [v8 hostedViewFactoryTypesWithGeometryReuse];
    id v10 = [(_TUIHostingGeometryMapUpdate *)v6 initWithFrom:hostingGeometryMap to:v5 reuseTypes:v9];

    objc_storeStrong((id *)&self->_hostingGeometryMap, a3);
    if (self->_layoutNumberOfSections)
    {
      char v11 = 0;
      unint64_t v12 = 0;
      do
      {
        sections = self->_sections;
        id v14 = +[NSNumber numberWithUnsignedInteger:v12];
        id v15 = [(NSMutableDictionary *)sections objectForKeyedSubscript:v14];

        if (objc_msgSend(v15, "lq_updateHostingGeometryMap:", v10)) {
          char v11 = 1;
        }

        ++v12;
      }
      while (v12 < self->_layoutNumberOfSections);
      BOOL v16 = v11 & 1;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  return v16;
}

- (void)transactionCoordinator:(id)a3 applyUpdatesFromTransactionGroup:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained feedLayoutController:self applyUpdatesFromTransactionGroup:v6];
  }
  else {
    [v6 applyUpdates];
  }
}

- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4
{
  id v5 = a4;
  id v6 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_suspended)
  {
    currentRenderModel = self->_currentRenderModel;
    self->_currentRenderModel = 0;

    currentHostingMap = self->_currentHostingMap;
    self->_currentHostingMap = 0;

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_C5B00;
    v13[3] = &unk_251828;
    v13[4] = self;
    id v14 = v5;
    [v14 computeFinalUpdatesWithBlock:v13];
  }
  else
  {
    id v9 = +[UITraitCollection _currentTraitCollection];
    id v10 = [(TUIEnvironment *)self->_environment traitCollection];
    +[UITraitCollection _setCurrentTraitCollection:v10];

    [(TUIFeedLayoutController *)self lq_updateRenderModelsWithTransactionGroup:v5];
    +[UITraitCollection _setCurrentTraitCollection:v9];
    captureController = self->_captureController;
    if (captureController)
    {
      [(TUIFeedCaptureController *)captureController endCapture];
      unint64_t v12 = self->_captureController;
      self->_captureController = 0;
    }
  }
}

- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4
{
}

- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4
{
}

- (void)transactionCoordinator:(id)a3 timeoutForSynchronousTransactionGroup:(id)a4
{
  if (!self->_renderModelMode)
  {
    id v5 = a4;
    id v6 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:]([TUIRenderModelCollection alloc], "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", self->_content, 0, 0, 0, 0, [(TUIEnvironment *)self->_environment layoutDirection], CGSizeZero.width, CGSizeZero.height, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, 0);
    [(TUIRenderUpdateCollectionController *)self->_updateController updateWithHostingMap:0 transactionGroup:v5];
    [(TUIRenderUpdateCollectionController *)self->_updateController updateWithRenderModel:v6 viewState:0 flags:0 transactionGroup:v5];
  }
}

- (id)instantiateContext:(id)a3 serviceConformingToProtocol:(id)a4
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___TUIWPService)) {
    id v5 = self->_wpService;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)lq_updateAXModelTreeWithTransactionGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(TUIEnvironment *)self->_environment accessibilityElementsNeeded])
  {
    id v24 = v4;
    uint64_t v6 = objc_opt_class();
    id v7 = [(TUIFeedContent *)self->_content currentStackName];
    id v8 = [v7 value];
    id v9 = TUIDynamicCast(v6, v8);

    id v10 = objc_opt_new();
    id v25 = objc_opt_new();
    if ([(NSMutableDictionary *)self->_sections count])
    {
      unint64_t v11 = 0;
      do
      {
        sections = self->_sections;
        id v13 = +[NSNumber numberWithUnsignedInteger:v11];
        id v14 = [(NSMutableDictionary *)sections objectForKey:v13];

        id v15 = [v14 axModelTree];
        if (v15)
        {
          [v10 addObject:v15];
        }
        else
        {
          BOOL v16 = objc_opt_new();
          [v10 addObject:v16];
        }
        char v17 = [v14 entry];
        unint64_t v18 = [v17 stackNames];
        unsigned __int8 v19 = [v18 containsObject:v9];

        if ((v19 & 1) == 0) {
          [v15 setHidden:1];
        }
        id v20 = [v14 renderModel];
        if (v20)
        {
          __int16 v21 = +[NSNumber numberWithUnsignedInteger:v11];
          [v25 setObject:v20 forKeyedSubscript:v21];
        }
        ++v11;
      }
      while (v11 < (unint64_t)[(NSMutableDictionary *)self->_sections count]);
    }
    objc_initWeak(&location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_C5FA8;
    v26[3] = &unk_254DF0;
    objc_copyWeak(&v30, &location);
    id v22 = v10;
    id v27 = v22;
    id v28 = self;
    id v23 = v25;
    id v29 = v23;
    id v4 = v24;
    [v24 appendUpdateBlock:v26];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

- (void)suspendAndTeardownWithTransaction:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[TUITransaction currentOrImplicitTransaction];
  }
  transactionCoordinator = self->_transactionCoordinator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C60B8;
  v6[3] = &unk_2526E0;
  v6[4] = self;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v4 block:v6];
}

- (void)resumeAndRebuildWithEnvironment:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    id v10 = v9;
    id v11 = a4;
  }
  else
  {
    id v12 = a4;
    id v10 = +[TUITransaction currentOrImplicitTransaction];
  }
  id v13 = [a4 copy];

  id v14 = TUITransactionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)long long buf = 134218498;
    unint64_t v26 = uniqueIdentifier;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = WeakRetained;
    _os_log_impl(&def_141F14, v14, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: resumeAndRebuildWithEnvironment - tx=%@, lastEnvironmentToken=%@", buf, 0x20u);
  }
  id v17 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  [v10 dependentOn:v17];

  unint64_t v18 = [v10 dependencyToken];
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v18);

  transactionCoordinator = self->_transactionCoordinator;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_C6374;
  v22[3] = &unk_254D50;
  v22[4] = self;
  id v23 = v8;
  id v24 = v13;
  id v20 = v13;
  id v21 = v8;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v10 block:v22];
}

- (void)suspendUpdatesUntilMeetingLayoutCondition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_C6574;
    id v8 = &unk_251DA0;
    objc_copyWeak(&v9, &location);
    [v4 onInvalidate:&v5];
    os_unfair_lock_lock(&self->_layoutConditionsLock);
    -[NSHashTable addObject:](self->_layoutConditionsSuspendingUpdates, "addObject:", v4, v5, v6, v7, v8);
    os_unfair_lock_unlock(&self->_layoutConditionsLock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)suspendLayoutsUntilMeetingLayoutCondition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_C66B0;
    id v8 = &unk_251DA0;
    objc_copyWeak(&v9, &location);
    [v4 onInvalidate:&v5];
    os_unfair_lock_lock(&self->_layoutConditionsLock);
    -[NSHashTable addObject:](self->_layoutConditionsSuspendingLayout, "addObject:", v4, v5, v6, v7, v8);
    os_unfair_lock_unlock(&self->_layoutConditionsLock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_updateAfterLayoutConditionSuspendingUpdatesInvalidated
{
  id v3 = +[TUITransaction implicitTransaction];
  [(TUITransactionCoordinating *)self->_transactionCoordinator scheduleLayoutUpdateWithTransaction:v3 block:&stru_254E10];
}

- (void)beginLiveResize
{
  id v3 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C67E4;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)endLiveResize
{
  id v3 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C69C8;
  block[3] = &unk_251990;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)debugDumpEnvironmentContainerStructure
{
}

- (void)captureWithController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TUITransaction implicitTransaction];
  transactionCoordinator = self->_transactionCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_C6BE4;
  v12[3] = &unk_254E58;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(TUITransactionCoordinating *)transactionCoordinator scheduleLayoutUpdateWithTransaction:v8 block:v12];
}

- (void)dumpModelTreeForEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C6E14;
  block[3] = &unk_254EA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)dumpLayoutTreeForEntry:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C7110;
  block[3] = &unk_254EA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIFeedLayoutControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIFeedLayoutControllerDelegate *)WeakRetained;
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (TUITransactionCoordinating)transactionCoordinator
{
  return self->_transactionCoordinator;
}

- (TUIAnchorSet)anchorSet
{
  return self->_anchorSet;
}

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (TUIRenderUpdateAuxiliaryController)auxiliaryUpdateController
{
  return self->_auxiliaryUpdateController;
}

- (TUIRenderUpdateLayerController)layerUpdateController
{
  return self->_layerUpdateController;
}

- (TUIActionHandlerDelegate)actionHandlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandlerDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (void)setActionHandlerDelegate:(id)a3
{
}

- (float)priority
{
  return self->_priority;
}

- (unint64_t)statsMode
{
  return self->_statsMode;
}

- (double)loadingFooterHeight
{
  return self->_loadingFooterHeight;
}

- (double)loadingFooterMinY
{
  return self->_loadingFooterMinY;
}

- (void)setLoadingFooterMinY:(double)a3
{
  self->_loadingFooterMinY = a3;
}

- (NSArray)dataRequests
{
  return self->_dataRequests;
}

- (void)setDataRequests:(id)a3
{
}

- (OS_dispatch_queue)dataRequestsSync
{
  return self->_dataRequestsSync;
}

- (void)setDataRequestsSync:(id)a3
{
}

- (TUIWPService)wpService
{
  return self->_wpService;
}

- (void)setWpService:(id)a3
{
}

- (TUIStatsDatesCollector)datesCollector
{
  return self->_datesCollector;
}

- (void)setDatesCollector:(id)a3
{
}

- (TUIStatsCollector)statsCollector
{
  return self->_statsCollector;
}

- (void)setStatsCollector:(id)a3
{
}

- (TUITransactionDependencyToken)lastEnvironmentTransactionToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);

  return (TUITransactionDependencyToken *)WeakRetained;
}

- (void)setLastEnvironmentTransactionToken:(id)a3
{
}

- (TUITransactionDependencyToken)lastContentTransactionToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);

  return (TUITransactionDependencyToken *)WeakRetained;
}

- (void)setLastContentTransactionToken:(id)a3
{
}

- (NSString)previousStackName
{
  return self->_previousStackName;
}

- (void)setPreviousStackName:(id)a3
{
}

- (TUIFeedCaptureController)captureController
{
  return self->_captureController;
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (TUIWorkQueueContext)queueContext
{
  return self->_queueContext;
}

- (void)setQueueContext:(id)a3
{
}

- (unint64_t)lq_statsMode
{
  return self->_lq_statsMode;
}

- (void)setLq_statsMode:(unint64_t)a3
{
  self->_lq_unint64_t statsMode = a3;
}

- (TUIRenderModelCollection)currentRenderModel
{
  return self->_currentRenderModel;
}

- (void)setCurrentRenderModel:(id)a3
{
}

- (TUIHostingMap)currentHostingMap
{
  return self->_currentHostingMap;
}

- (void)setCurrentHostingMap:(id)a3
{
}

- (TUIRenderModelAuxiliary)currentAuxiliaryModel
{
  return self->_currentAuxiliaryModel;
}

- (void)setCurrentAuxiliaryModel:(id)a3
{
}

- (TUIRenderModelLayer)currentLayerRenderModel
{
  return self->_currentLayerRenderModel;
}

- (void)setCurrentLayerRenderModel:(id)a3
{
}

- (unint64_t)layoutGenerationId
{
  return self->_layoutGenerationId;
}

- (void)setLayoutGenerationId:(unint64_t)a3
{
  self->_layoutGenerationId = a3;
}

- (unint64_t)layoutNextSection
{
  return self->_layoutNextSection;
}

- (void)setLayoutNextSection:(unint64_t)a3
{
  self->_unint64_t layoutNextSection = a3;
}

- (unint64_t)layoutNumberOfSections
{
  return self->_layoutNumberOfSections;
}

- (void)setLayoutNumberOfSections:(unint64_t)a3
{
  self->_unint64_t layoutNumberOfSections = a3;
}

- (unint64_t)layoutFlags
{
  return self->_layoutFlags;
}

- (void)setLayoutFlags:(unint64_t)a3
{
  self->_unint64_t layoutFlags = a3;
}

- (NSMutableDictionary)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (TUITemplateFactory)templateFactory
{
  return self->_templateFactory;
}

- (void)setTemplateFactory:(id)a3
{
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (BOOL)environmentChanged
{
  return self->_environmentChanged;
}

- (void)setEnvironmentChanged:(BOOL)a3
{
  self->_environmentChanged = a3;
}

- (unint64_t)renderModelMode
{
  return self->_renderModelMode;
}

- (TUIFeedViewState)layoutViewState
{
  return self->_layoutViewState;
}

- (void)setLayoutViewState:(id)a3
{
}

- (TUIFeedViewState)restoreViewState
{
  return self->_restoreViewState;
}

- (void)setRestoreViewState:(id)a3
{
}

- (NSUUID)layoutUntilEntryWithUUID
{
  return self->_layoutUntilEntryWithUUID;
}

- (void)setLayoutUntilEntryWithUUID:(id)a3
{
}

- (TUIStatsTimingCollector)timingCollector
{
  return self->_timingCollector;
}

- (TUIEnvironment)prevEnvironment
{
  return self->_prevEnvironment;
}

- (TUIHostingGeometryMap)hostingGeometryMap
{
  return self->_hostingGeometryMap;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (os_unfair_lock_s)layoutConditionsLock
{
  return self->_layoutConditionsLock;
}

- (NSHashTable)layoutConditionsSuspendingUpdates
{
  return self->_layoutConditionsSuspendingUpdates;
}

- (NSHashTable)layoutConditionsSuspendingLayout
{
  return self->_layoutConditionsSuspendingLayout;
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (unint64_t)liveResizeLayoutCount
{
  return self->_liveResizeLayoutCount;
}

- (BOOL)needsLayoutAfterLiveResize
{
  return self->_needsLayoutAfterLiveResize;
}

- (unint64_t)liveResizeSignpost
{
  return self->_liveResizeSignpost;
}

- (unint64_t)frameSignpost
{
  return self->_frameSignpost;
}

- (TUIStatsLiveResize)statsLiveResize
{
  return self->_statsLiveResize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsLiveResize, 0);
  objc_storeStrong((id *)&self->_layoutConditionsSuspendingLayout, 0);
  objc_storeStrong((id *)&self->_layoutConditionsSuspendingUpdates, 0);
  objc_storeStrong((id *)&self->_hostingGeometryMap, 0);
  objc_storeStrong((id *)&self->_prevEnvironment, 0);
  objc_storeStrong((id *)&self->_timingCollector, 0);
  objc_storeStrong((id *)&self->_layoutUntilEntryWithUUID, 0);
  objc_storeStrong((id *)&self->_restoreViewState, 0);
  objc_storeStrong((id *)&self->_layoutViewState, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentLayerRenderModel, 0);
  objc_storeStrong((id *)&self->_currentAuxiliaryModel, 0);
  objc_storeStrong((id *)&self->_currentHostingMap, 0);
  objc_storeStrong((id *)&self->_currentRenderModel, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_previousStackName, 0);
  objc_destroyWeak((id *)&self->_lastContentTransactionToken);
  objc_destroyWeak((id *)&self->_lastEnvironmentTransactionToken);
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_datesCollector, 0);
  objc_storeStrong((id *)&self->_wpService, 0);
  objc_storeStrong((id *)&self->_dataRequestsSync, 0);
  objc_storeStrong((id *)&self->_dataRequests, 0);
  objc_destroyWeak((id *)&self->_actionHandlerDelegate);
  objc_storeStrong((id *)&self->_layerUpdateController, 0);
  objc_storeStrong((id *)&self->_auxiliaryUpdateController, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_environmentPendingUpdate, 0);
}

@end