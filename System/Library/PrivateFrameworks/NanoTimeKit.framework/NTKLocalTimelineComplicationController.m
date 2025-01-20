@interface NTKLocalTimelineComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5;
- (BOOL)hasTapAction;
- (CLKComplicationTemplate)sharingTemplate;
- (Class)richComplicationDisplayViewClass;
- (NTKLocalTimelineComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5;
- (double)minimumIntervalBetweenTimelineEntries;
- (id)_currentEntry;
- (id)activeDisplayTemplateForDisplayWrapper:(id)a3;
- (id)alwaysOnTemplate;
- (id)complicationApplicationIdentifier;
- (id)lockedTemplate;
- (void)_activate;
- (void)_applyAnimationMode;
- (void)_applyCachingMode;
- (void)_applyUpdatingMode;
- (void)_cancelDelayedBlocks;
- (void)_completeExtendRightOperationWithBoundaryDate:(id)a3 entries:(id)a4;
- (void)_completeSetupOperationWithEndDate:(id)a3 currentEntry:(id)a4;
- (void)_deactivate;
- (void)_extendTimelineIfNecessaryAndPossible;
- (void)_queueAnimationForNextUpdate:(unint64_t)a3;
- (void)_requestDataSourceToUpdateToState:(int64_t)a3;
- (void)_resetTimelineForCachingChange;
- (void)_startExtendOperationIfNecessaryForTimeline:(id)a3 withDate:(id)a4 minBuffer:(double)a5;
- (void)_startExtendRightOperationFromDate:(id)a3;
- (void)_startSetupOperationIfPossible;
- (void)_suspendRightBoundaryDate:(id)a3;
- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3;
- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3 animation:(unint64_t)queuedAnimation;
- (void)_updateDimStateForCurrentTimeline;
- (void)_updateDisplayWrapper:(id)a3 toCurrentTemplateWithReason:(int64_t)a4 animation:(unint64_t)a5;
- (void)_updateIsComplicationActive:(BOOL)a3;
- (void)addDisplayWrapper:(id)a3;
- (void)appendEntries:(id)a3;
- (void)appendEntries:(id)a3 withTritiumUpdatePriority:(int64_t)a4;
- (void)didTouchDownInView:(id)a3;
- (void)didTouchUpInsideView:(id)a3;
- (void)entriesDidChangeInTimeline:(id)a3;
- (void)invalidateEntries;
- (void)invalidateSwitcherTemplate;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setIgnoreNewTemplates:(BOOL)a3;
- (void)setShowsLockedUI:(BOOL)a3;
- (void)setTimelineEndDate:(id)a3;
- (void)timeline:(id)a3 didChangeNowEntryFrom:(id)a4 to:(id)a5;
@end

@implementation NTKLocalTimelineComplicationController

- (NTKLocalTimelineComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKLocalTimelineComplicationController;
  v11 = [(NTKComplicationController *)&v22 initWithComplication:v8 variant:v9 device:v10];
  if (v11)
  {
    v12 = (objc_class *)objc_msgSend((id)objc_opt_class(), "complicationDataSourceClassForComplication:family:device:", v8, objc_msgSend(v9, "family"), v10);
    v13 = objc_opt_new();
    v14 = [v9 metrics];
    objc_msgSend(v13, "setShowsBackground:", objc_msgSend(v14, "opaque"));

    uint64_t v15 = objc_msgSend([v12 alloc], "initWithComplication:family:forDevice:context:", v8, objc_msgSend(v9, "family"), v10, v13);
    dataSource = v11->_dataSource;
    v11->_dataSource = (CLKCComplicationDataSource *)v15;

    [(CLKCComplicationDataSource *)v11->_dataSource setDelegate:v11];
    v11->_dataSourceState = 0;
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    suspendedRightBoundaryDates = v11->_suspendedRightBoundaryDates;
    v11->_suspendedRightBoundaryDates = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    delayedBlocks = v11->_delayedBlocks;
    v11->_delayedBlocks = v19;

    v11->_hasBeenLive = 0;
    [(NTKLocalTimelineComplicationController *)v11 invalidateSwitcherTemplate];
  }
  return v11;
}

+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5
{
  id v7 = a5;
  id v8 = +[NTKComplicationDataSource dataSourceClassForComplicationType:family:forDevice:](NTKComplicationDataSource, "dataSourceClassForComplicationType:family:forDevice:", [a3 complicationType], a4, v7);

  return (Class)v8;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return +[NTKComplicationDataSource dataSourceClassForComplicationType:a3 family:a4 forDevice:a5] != 0;
}

- (void)setIgnoreNewTemplates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(NTKTimelineComplicationController *)self ignoreNewTemplates] != a3)
  {
    v5 = _NTKLoggingObjectForDomain(40, (uint64_t)"NTKLoggingDomainTritium");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dataSource = self->_dataSource;
      *(_DWORD *)buf = 138412802;
      id v9 = self;
      __int16 v10 = 2112;
      v11 = dataSource;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ setIgnoreNewTemplates: %i", buf, 0x1Cu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)NTKLocalTimelineComplicationController;
  [(NTKTimelineComplicationController *)&v7 setIgnoreNewTemplates:v3];
  if (!v3) {
    [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:0];
  }
}

- (void)_activate
{
  self->_hasBeenLive = 0;
}

- (void)_deactivate
{
  [(NTKTimelineDataOperation *)self->_currentOperation cancel];
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  [(NTKLocalTimelineComplicationController *)self _cancelDelayedBlocks];
}

- (void)_resetTimelineForCachingChange
{
  id v3 = [(TLTimeline *)self->_timeline nowEntry];
  [(TLTimeline *)self->_timeline resetWithEntry:v3];
  [(NSMutableSet *)self->_suspendedRightBoundaryDates removeAllObjects];
  [(NTKLocalTimelineComplicationController *)self _queueAnimationForNextUpdate:1];
}

- (void)_applyCachingMode
{
  int64_t v3 = [(NTKComplicationController *)self cachingMode];
  if (v3 == 2)
  {
    [(NTKLocalTimelineComplicationController *)self _startSetupOperationIfPossible];
  }
  else
  {
    if (v3 != 1)
    {
      if (v3) {
        return;
      }
      self->_hasBeenLive = 0;
    }
    [(NTKLocalTimelineComplicationController *)self _resetTimelineForCachingChange];
  }
}

- (void)_applyUpdatingMode
{
  if ([(NTKComplicationController *)self updatingMode] == 1)
  {
    if (!self->_hasBeenLive)
    {
      self->_hasBeenLive = 1;
      [(NTKLocalTimelineComplicationController *)self _startSetupOperationIfPossible];
    }
    [(NTKLocalTimelineComplicationController *)self _requestDataSourceToUpdateToState:1];
    timeline = self->_timeline;
    [(TLTimeline *)timeline setPaused:0];
  }
  else
  {
    [(NTKLocalTimelineComplicationController *)self _requestDataSourceToUpdateToState:0];
    [(TLTimeline *)self->_timeline setPaused:1];
    [(NTKComplicationController *)self enumerateDisplayWrappersWithBlock:&__block_literal_global_141];
  }
}

uint64_t __60__NTKLocalTimelineComplicationController__applyUpdatingMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDimmed:0];
}

- (void)_requestDataSourceToUpdateToState:(int64_t)a3
{
  int64_t dataSourceState = self->_dataSourceState;
  if (a3 != 1 || dataSourceState)
  {
    if (!a3 && dataSourceState == 1)
    {
      self->_int64_t dataSourceState = 0;
      [(CLKCComplicationDataSource *)self->_dataSource pause];
    }
  }
  else
  {
    self->_int64_t dataSourceState = 1;
    [(CLKCComplicationDataSource *)self->_dataSource resume];
  }
}

- (void)_applyAnimationMode
{
  int64_t v3 = [(NTKComplicationController *)self animationMode];
  dataSource = self->_dataSource;
  if (v3 == 1)
  {
    [(CLKCComplicationDataSource *)dataSource resumeAnimations];
  }
  else
  {
    [(CLKCComplicationDataSource *)dataSource pauseAnimations];
  }
}

- (void)_updateIsComplicationActive:(BOOL)a3
{
  dataSource = self->_dataSource;
  if (a3) {
    [(CLKCComplicationDataSource *)dataSource becomeActive];
  }
  else {
    [(CLKCComplicationDataSource *)dataSource becomeInactive];
  }
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(NTKComplicationController *)self effectiveFaceDataMode];
  v24.receiver = self;
  v24.super_class = (Class)NTKLocalTimelineComplicationController;
  [(NTKComplicationController *)&v24 setDisplayProperties:v6 forDisplayWrapper:v7];
  uint64_t v9 = [(NTKComplicationController *)self effectiveFaceDataMode];
  uint64_t v10 = [v6 faceDataMode];
  if (v9 != v8)
  {
    uint64_t v11 = v10;
    __int16 v12 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[NTKLocalTimelineComplicationController setDisplayProperties:forDisplayWrapper:]((uint64_t)self, v9, v12);
    }

    if (v9 == 1)
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      dataSource = self->_dataSource;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke;
      v19[3] = &unk_1E62C85F8;
      v19[4] = &v20;
      [(CLKCComplicationDataSource *)dataSource getTimelineEndDateWithHandler:v19];
      if (self->_hasBeenLive && (unint64_t)(v8 - 3) <= 2 && *((unsigned char *)v21 + 24))
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke_2;
        v18[3] = &unk_1E62BFF20;
        v18[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v18);
      }
      else
      {
        [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:0];
      }
      _Block_object_dispose(&v20, 8);
    }
    else if ([(CLKCComplicationDataSource *)self->_dataSource alwaysShowIdealizedTemplateInSwitcher]|| v9 == 3 && !self->_hasBeenLive && !self->_switcherTemplate)
    {
      uint64_t v14 = [(CLKCComplicationDataSource *)self->_dataSource currentSwitcherTemplate];
      switcherTemplate = self->_switcherTemplate;
      self->_switcherTemplate = v14;

      [(CLKComplicationTemplate *)self->_switcherTemplate finalize];
      if (v11 == 3 && v8 == 1)
      {
        v16 = self;
        uint64_t v17 = 2;
      }
      else
      {
        v16 = self;
        uint64_t v17 = 0;
      }
      [(NTKLocalTimelineComplicationController *)v16 _updateAllDisplayWrappersToCurrentTemplateWithReason:v17];
    }
  }
}

uint64_t __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

uint64_t __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extendTimelineIfNecessaryAndPossible];
}

- (void)setShowsLockedUI:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NTKComplicationController *)self showsLockedUI];
  v7.receiver = self;
  v7.super_class = (Class)NTKLocalTimelineComplicationController;
  [(NTKComplicationController *)&v7 setShowsLockedUI:v3];
  if (v5 != v3)
  {
    if (v3) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:v6];
  }
}

- (void)addDisplayWrapper:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKLocalTimelineComplicationController;
  id v4 = a3;
  [(NTKComplicationController *)&v6 addDisplayWrapper:v4];
  BOOL v5 = -[NTKLocalTimelineComplicationController activeDisplayTemplateForDisplayWrapper:](self, "activeDisplayTemplateForDisplayWrapper:", v4, v6.receiver, v6.super_class);
  [v4 setComplicationTemplate:v5 reason:0 animation:0];

  [v4 setDimmed:0];
}

- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3
{
}

- (void)_queueAnimationForNextUpdate:(unint64_t)a3
{
  if ([(CLKCComplicationDataSource *)self->_dataSource timelineAnimationBehavior])
  {
    self->_hasQueuedAnimation = 1;
    self->_queuedAnimation = a3;
  }
}

- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3 animation:(unint64_t)queuedAnimation
{
  if (![(NTKTimelineComplicationController *)self ignoreNewTemplates])
  {
    if (![(NTKComplicationController *)self showsLockedUI])
    {
      if (!self->_timeTravelDate
        && self->_hasQueuedAnimation
        && [(NTKComplicationController *)self updatingMode] == 1)
      {
        queuedAnimation = self->_queuedAnimation;
      }
      if ([(NTKComplicationController *)self updatingMode] == 1) {
        self->_hasQueuedAnimation = 0;
      }
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __105__NTKLocalTimelineComplicationController__updateAllDisplayWrappersToCurrentTemplateWithReason_animation___block_invoke;
    v7[3] = &unk_1E62C8620;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = queuedAnimation;
    [(NTKComplicationController *)self enumerateDisplayWrappersWithBlock:v7];
  }
}

uint64_t __105__NTKLocalTimelineComplicationController__updateAllDisplayWrappersToCurrentTemplateWithReason_animation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateDisplayWrapper:a2 toCurrentTemplateWithReason:*(void *)(a1 + 40) animation:*(void *)(a1 + 48)];
}

- (void)_updateDisplayWrapper:(id)a3 toCurrentTemplateWithReason:(int64_t)a4 animation:(unint64_t)a5
{
  id v11 = a3;
  int64_t v8 = -[NTKLocalTimelineComplicationController activeDisplayTemplateForDisplayWrapper:](self, "activeDisplayTemplateForDisplayWrapper:");
  if ([(NTKComplicationController *)self showsLockedUI])
  {
    uint64_t v9 = [(NTKLocalTimelineComplicationController *)self lockedTemplate];
    BOOL v10 = v8 == v9;

    if (v10) {
      a5 = 0;
    }
  }
  [v11 setComplicationTemplate:v8 reason:a4 animation:a5];
}

- (double)minimumIntervalBetweenTimelineEntries
{
  return 60.0;
}

- (void)invalidateEntries
{
  [(NTKTimelineDataOperation *)self->_currentOperation cancel];
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  [(NTKLocalTimelineComplicationController *)self _cancelDelayedBlocks];
  [(NSMutableSet *)self->_suspendedRightBoundaryDates removeAllObjects];

  [(NTKLocalTimelineComplicationController *)self _startSetupOperationIfPossible];
}

- (void)setTimelineEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_timelineEndDate, a3);

  [(NTKLocalTimelineComplicationController *)self _updateDimStateForCurrentTimeline];
}

- (void)appendEntries:(id)a3
{
}

- (void)appendEntries:(id)a3 withTritiumUpdatePriority:(int64_t)a4
{
  timeline = self->_timeline;
  id v6 = a3;
  id v7 = [(TLTimeline *)timeline _rightmostDate];
  [(TLTimeline *)self->_timeline extendTimelineFromDate:v7 withEntries:v6];
}

- (void)invalidateSwitcherTemplate
{
  switcherTemplate = self->_switcherTemplate;
  self->_switcherTemplate = 0;

  if (!self->_hasBeenLive)
  {
    id v4 = [(CLKCComplicationDataSource *)self->_dataSource currentSwitcherTemplate];
    BOOL v5 = self->_switcherTemplate;
    self->_switcherTemplate = v4;

    [(CLKComplicationTemplate *)self->_switcherTemplate finalize];
    [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:0];
  }
}

- (void)timeline:(id)a3 didChangeNowEntryFrom:(id)a4 to:(id)a5
{
  if (!self->_timeTravelDate)
  {
    dataSource = self->_dataSource;
    id v8 = a5;
    id v9 = a4;
    unint64_t v10 = [(NTKTimelineComplicationController *)self _animationForTimelineEntryTransitionFrom:v9 to:v8 withAnimationBehavior:[(CLKCComplicationDataSource *)dataSource timelineAnimationBehavior]];

    [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:1 animation:v10];
    [(NTKLocalTimelineComplicationController *)self _extendTimelineIfNecessaryAndPossible];
  }
}

- (void)entriesDidChangeInTimeline:(id)a3
{
  uint64_t v4 = [(id)objc_opt_class() tritiumUpdatePriority];

  [(NTKComplicationController *)self notifyDelegateOnTimelineChangeWithTritiumUpdatePriority:v4];
}

- (void)_completeSetupOperationWithEndDate:(id)a3 currentEntry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentOperation = self->_currentOperation;
    dataSource = self->_dataSource;
    int v17 = 138412546;
    v18 = currentOperation;
    __int16 v19 = 2112;
    uint64_t v20 = dataSource;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Timeline setup operation %@ completed for %@", (uint8_t *)&v17, 0x16u);
  }

  [v7 finalize];
  id v11 = self->_currentOperation;
  self->_currentOperation = 0;

  self->_supportsTimeTravelForward = v6 != 0;
  [(NTKLocalTimelineComplicationController *)self setTimelineEndDate:v6];
  if (v7)
  {
    timeline = self->_timeline;
    if (timeline)
    {
      [(TLTimeline *)timeline resetWithEntry:v7];
    }
    else
    {
      uint64_t v15 = (TLTimeline *)[objc_alloc(MEMORY[0x1E4FAF2F8]) initWithEntry:v7];
      v16 = self->_timeline;
      self->_timeline = v15;

      [(TLTimeline *)self->_timeline setDelegate:self];
    }
    [(NTKLocalTimelineComplicationController *)self _updateAllDisplayWrappersToCurrentTemplateWithReason:1];
    [(NTKLocalTimelineComplicationController *)self _extendTimelineIfNecessaryAndPossible];
  }
  else
  {
    BOOL v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_dataSource;
      int v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "**** First-party complication data source gave us a nil timeline entry; this will result in a blank complication: %@",
        (uint8_t *)&v17,
        0xCu);
    }
  }
}

- (void)_startSetupOperationIfPossible
{
  p_currentOperation = &self->_currentOperation;
  if (!self->_currentOperation && self->_hasBeenLive)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = +[NTKTimelineDataOperation operationWithLocalDataSource:self->_dataSource];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __72__NTKLocalTimelineComplicationController__startSetupOperationIfPossible__block_invoke;
    id v8 = &unk_1E62C8648;
    objc_copyWeak(&v9, &location);
    [v4 setHandler:&v5];
    objc_storeStrong((id *)p_currentOperation, v4);
    objc_msgSend(v4, "start", v5, v6, v7, v8);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
}

void __72__NTKLocalTimelineComplicationController__startSetupOperationIfPossible__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a5;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _completeSetupOperationWithEndDate:v8 currentEntry:v7];
}

- (id)alwaysOnTemplate
{
  v2 = [(CLKCComplicationDataSource *)self->_dataSource alwaysOnTemplate];
  [v2 finalize];

  return v2;
}

- (void)_extendTimelineIfNecessaryAndPossible
{
  if (!self->_currentOperation
    && self->_timeline
    && [(NTKComplicationController *)self effectiveFaceDataMode] != 3
    && [(NTKComplicationController *)self effectiveFaceDataMode] != 4
    && [(NTKComplicationController *)self effectiveFaceDataMode] != 5)
  {
    timeline = self->_timeline;
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [(NTKLocalTimelineComplicationController *)self _startExtendOperationIfNecessaryForTimeline:timeline withDate:v4 minBuffer:300.0];
  }
}

- (void)_startExtendOperationIfNecessaryForTimeline:(id)a3 withDate:(id)a4 minBuffer:(double)a5
{
  id v8 = a4;
  id v9 = [a3 _rightmostDate];
  [v9 timeIntervalSinceDate:v8];
  double v11 = v10;

  if (self->_supportsTimeTravelForward)
  {
    if (v11 >= a5)
    {
      int v12 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v12 = 0;
  if (([v9 isEqualToDate:v9] & 1) == 0 && v11 < a5) {
LABEL_6:
  }
    int v12 = [(NSMutableSet *)self->_suspendedRightBoundaryDates containsObject:v9] ^ 1;
LABEL_7:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__NTKLocalTimelineComplicationController__startExtendOperationIfNecessaryForTimeline_withDate_minBuffer___block_invoke;
  v16[3] = &unk_1E62C09C0;
  v16[4] = self;
  id v17 = v9;
  id v13 = v9;
  uint64_t v14 = _Block_copy(v16);
  uint64_t v15 = v14;
  if (v12) {
    (*((void (**)(void *))v14 + 2))(v14);
  }
}

uint64_t __105__NTKLocalTimelineComplicationController__startExtendOperationIfNecessaryForTimeline_withDate_minBuffer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startExtendRightOperationFromDate:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _suspendRightBoundaryDate:v3];
}

- (void)_suspendRightBoundaryDate:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_suspendedRightBoundaryDates addObject:v4];
  uint64_t v5 = [NTKDelayedBlock alloc];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __68__NTKLocalTimelineComplicationController__suspendRightBoundaryDate___block_invoke;
  double v11 = &unk_1E62C8670;
  int v12 = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = [(NTKDelayedBlock *)v5 initWithDelay:&v8 action:120.0];
  -[NSMutableSet addObject:](self->_delayedBlocks, "addObject:", v7, v8, v9, v10, v11, v12);
}

uint64_t __68__NTKLocalTimelineComplicationController__suspendRightBoundaryDate___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 232) removeObject:a2];
  [*(id *)(*(void *)(a1 + 32) + 224) removeObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _extendTimelineIfNecessaryAndPossible];
}

- (void)_cancelDelayedBlocks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_delayedBlocks;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_delayedBlocks removeAllObjects];
}

- (void)_completeExtendRightOperationWithBoundaryDate:(id)a3 entries:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentOperation = self->_currentOperation;
    dataSource = self->_dataSource;
    *(_DWORD *)buf = 138412802;
    char v23 = currentOperation;
    __int16 v24 = 2112;
    v25 = dataSource;
    __int16 v26 = 2048;
    uint64_t v27 = [v7 count];
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Timeline extend right operation %@ completed for %@ with %lu entries", buf, 0x20u);
  }

  long long v11 = self->_currentOperation;
  self->_currentOperation = 0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "finalize", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  [(TLTimeline *)self->_timeline extendTimelineFromDate:v6 withEntries:v12];
  [(NTKLocalTimelineComplicationController *)self _extendTimelineIfNecessaryAndPossible];
}

- (void)_startExtendRightOperationFromDate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = +[NTKTimelineDataOperation operationWithLocalDataSource:self->_dataSource];
  [v5 setExtendsRightFromDate:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NTKLocalTimelineComplicationController__startExtendRightOperationFromDate___block_invoke;
  v7[3] = &unk_1E62C8698;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 setHandler:v7];
  objc_storeStrong((id *)&self->_currentOperation, v5);
  [v5 start];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __77__NTKLocalTimelineComplicationController__startExtendRightOperationFromDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _completeExtendRightOperationWithBoundaryDate:*(void *)(a1 + 32) entries:v4];
}

- (BOOL)hasTapAction
{
  return [(CLKCComplicationDataSource *)self->_dataSource supportsTapAction];
}

- (void)didTouchDownInView:(id)a3
{
}

- (void)didTouchUpInsideView:(id)a3
{
}

- (id)complicationApplicationIdentifier
{
  return [(CLKCComplicationDataSource *)self->_dataSource complicationApplicationIdentifier];
}

- (Class)richComplicationDisplayViewClass
{
  if (objc_opt_respondsToSelector())
  {
    dataSource = self->_dataSource;
    id v4 = [(NTKComplicationController *)self device];
    uint64_t v5 = (void *)[(CLKCComplicationDataSource *)dataSource richComplicationDisplayViewClassForDevice:v4];

    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (Class)v6;
}

- (id)_currentEntry
{
  return [(TLTimeline *)self->_timeline nowEntry];
}

- (id)activeDisplayTemplateForDisplayWrapper:(id)a3
{
  id v4 = [(NTKComplicationController *)self displayPropertiesForDisplayWrapper:a3];
  int v5 = [v4 showPreview];

  if (v5
    && ([(CLKCComplicationDataSource *)self->_dataSource sampleTemplate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [(CLKCComplicationDataSource *)self->_dataSource sampleTemplate];
  }
  else if (![(NTKComplicationController *)self showsLockedUI] {
         || ([(NTKLocalTimelineComplicationController *)self lockedTemplate],
  }
             (id v7 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (![(CLKCComplicationDataSource *)self->_dataSource alwaysShowIdealizedTemplateInSwitcher]|| [(NTKComplicationController *)self effectiveFaceDataMode] != 3|| (id v7 = self->_switcherTemplate) == 0)
    {
      id v8 = [(NTKLocalTimelineComplicationController *)self _currentEntry];
      id v9 = [v8 complicationTemplate];
      switcherTemplate = v9;
      if (!v9) {
        switcherTemplate = self->_switcherTemplate;
      }
      id v7 = switcherTemplate;
    }
  }

  return v7;
}

- (id)lockedTemplate
{
  v2 = [(CLKCComplicationDataSource *)self->_dataSource lockedTemplate];
  [v2 finalize];

  return v2;
}

- (void)_updateDimStateForCurrentTimeline
{
  if (self->_timeTravelDate)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    if (self->_supportsTimeTravelForward)
    {
      timelineEndDate = self->_timelineEndDate;
      if (timelineEndDate)
      {
        int v5 = timelineEndDate;
      }
      else
      {
        int v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
      }
    }
    else
    {
      int v5 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v7 = v5;
    BOOL v6 = [(NSDate *)self->_timeTravelDate compare:v3] != NSOrderedDescending
      || [(NSDate *)self->_timeTravelDate compare:v7] != NSOrderedAscending;
  }
  else
  {
    BOOL v6 = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__NTKLocalTimelineComplicationController__updateDimStateForCurrentTimeline__block_invoke;
  v8[3] = &__block_descriptor_33_e43_v16__0__NTKComplicationDisplayWrapperView_8l;
  BOOL v9 = v6;
  [(NTKComplicationController *)self enumerateDisplayWrappersWithBlock:v8];
}

uint64_t __75__NTKLocalTimelineComplicationController__updateDimStateForCurrentTimeline__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDimmed:*(unsigned __int8 *)(a1 + 32)];
}

- (CLKComplicationTemplate)sharingTemplate
{
  uint64_t v3 = [(CLKCComplicationDataSource *)self->_dataSource sampleTemplate];
  id v4 = v3;
  if (v3)
  {
    [(CLKComplicationTemplate *)v3 finalize];
    switcherTemplate = v4;
  }
  else
  {
    switcherTemplate = self->_switcherTemplate;
  }
  BOOL v6 = switcherTemplate;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherTemplate, 0);
  objc_storeStrong((id *)&self->_delayedBlocks, 0);
  objc_storeStrong((id *)&self->_suspendedRightBoundaryDates, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_timelineEndDate, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setDisplayProperties:(NSObject *)a3 forDisplayWrapper:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = NTKFaceDataModeDescription(a2);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_debug_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_DEBUG, "Updating %@ to data mode to \"%@\"", (uint8_t *)&v6, 0x16u);
}

@end