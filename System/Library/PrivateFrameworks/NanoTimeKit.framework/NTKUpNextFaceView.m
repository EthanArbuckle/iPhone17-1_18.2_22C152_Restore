@interface NTKUpNextFaceView
+ (double)suggestedCellHeightForDevice:(id)a3;
+ (id)_reuseIdentifierForContent:(id)a3;
- (BOOL)_applyShouldUseCanonicalContent;
- (BOOL)_applyShowIdealizedContent;
- (BOOL)_dismissPresentedViewControllerIfNecessary:(BOOL)a3;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_shouldDeferUpdate;
- (BOOL)_shouldUseCanonicalContent;
- (BOOL)_snapshotHasChangesToVisibleItems:(id)a3;
- (BOOL)_wantsStatusBarHidden;
- (BOOL)allowsHomeScreenTransition;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)engineController:(id)a3 isElementAtIndexPathVisible:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3;
- (CGPoint)_defaultPointForDefaultMode;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (NTKUpNextFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_verticalPaddingForStatusBar;
- (id)_additionalPrelaunchApplicationIdentifiers;
- (id)_configureCellForItemWithElement:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5;
- (id)_configureSupplementaryViewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5;
- (id)_contentAtIndexPath:(id)a3;
- (id)_detachedComplicationDisplays;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_sectionEnumerationOrder;
- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4;
- (id)intentActionWantsBackgroundImageForAlert:(id)a3;
- (id)intentActionWantsViewToBlurForAlert:(id)a3;
- (int64_t)_numberOfItemsInCollectionViewSection:(int64_t)a3;
- (int64_t)_numberOfSectionsInCollectionView;
- (unint64_t)_distanceForIndexPathFromNow:(id)a3;
- (unint64_t)_timeLabelOptions;
- (void)_allowContentViewInteractive:(BOOL)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyCollectionViewSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_applyDataMode;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyShowsLockedUI;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyTransitionWithFraction:(double)a3 interpolatedPalette:(id)a4 onCell:(id)a5;
- (void)_availableDataSourcesDidChange;
- (void)_becameActiveFace;
- (void)_becameInactiveFace;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterSettingViewMode:(int64_t)a3 scroll:(BOOL)a4 targetOffset:(CGPoint)a5 needsLayout:(BOOL)a6;
- (void)_configureCollectionViewDataSource;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureVisibleCell:(id)a3;
- (void)_finalizeForSnapshotting:(id)a3;
- (void)_handleOrdinaryScreenWake;
- (void)_handleViewModeTapGesture:(id)a3;
- (void)_layoutTimeLabelForViewMode:(int64_t)a3;
- (void)_layoutTimeLabelPlatterViewMode:(int64_t)a3;
- (void)_loadContentViews;
- (void)_loadEngineController;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContent:(id)a3;
- (void)_loadSnapshotContentViews;
- (void)_logContent:(id)a3 withIdentifier:(id)a4;
- (void)_logDataSourceSnapshot:(id)a3 withName:(id)a4;
- (void)_performWristRaiseAnimation;
- (void)_prepareForEditing;
- (void)_prepareForSnapshotting;
- (void)_prepareWristRaiseAnimation;
- (void)_reloadCollectionViewData;
- (void)_reloadContentIfNeeded;
- (void)_replaceDataSourceElement:(id)a3 withReloadedREElement:(id)a4;
- (void)_setSiriBlurColor;
- (void)_setViewMode:(int64_t)a3 scroll:(BOOL)a4 scrollToPoint:(CGPoint)a5 secondaryPoint:(CGPoint)a6 force:(BOOL)a7 velocity:(double)a8 animated:(BOOL)a9;
- (void)_setupCell:(id)a3 withContent:(id)a4 representedIdentifier:(id)a5;
- (void)_showSiriUnavailableAlert:(id)a3;
- (void)_startPositiveDwellForTopElementsTimerIfNeeded;
- (void)_startViewResetTimer;
- (void)_stopPositiveDwellForTopElementsTimer;
- (void)_stopViewResetTimer;
- (void)_switchViewModeForCurrentMode:(int64_t)a3 animated:(BOOL)a4;
- (void)_switchViewModeToDefault;
- (void)_unloadContentViews;
- (void)_unloadSnapshotContentViews;
- (void)_updateApplicationIdentifiersAndLocationAuthorization;
- (void)_updateDisabledDataSources;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDeferralStateChanged;
- (void)dealloc;
- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4;
- (void)elementAction:(id)a3 wantsToPerformTapActionForComplicationSlot:(id)a4;
- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4;
- (void)engineController:(id)a3 didReloadContent:(id)a4 withIdentifier:(id)a5;
- (void)engineController:(id)a3 didReloadElement:(id)a4;
- (void)engineController:(id)a3 didRemoveContent:(id)a4 atIndexPath:(id)a5;
- (void)engineController:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5;
- (void)engineControllerDidFinishUpdatingRelevance:(id)a3;
- (void)layoutSubviews;
- (void)performScrollTestNamed:(id)a3 completion:(id)a4;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setViewMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCollectionViewSnapshotAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateTimeLabelBackground;
@end

@implementation NTKUpNextFaceView

+ (double)suggestedCellHeightForDevice:(id)a3
{
  _LayoutConstants_0(a3, v4);
  return v5;
}

- (NTKUpNextFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)NTKUpNextFaceView;
  v10 = [(NTKFaceView *)&v43 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:v9];
  v11 = v10;
  if (v10)
  {
    v10->_interactiveState = 0;
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    dwellIndexPathes = v11->_dwellIndexPathes;
    v11->_dwellIndexPathes = (NSSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    reloadedElements = v11->_reloadedElements;
    v11->_reloadedElements = (NSMutableSet *)v14;

    v16 = [[NTKUtilityComplicationFactory alloc] initForDevice:v8];
    utilityComplicationFactory = v11->_utilityComplicationFactory;
    v11->_utilityComplicationFactory = v16;

    [(NTKUtilityComplicationFactory *)v11->_utilityComplicationFactory setForegroundAlpha:1.0];
    [(NTKUtilityComplicationFactory *)v11->_utilityComplicationFactory setForegroundImageAlpha:1.0];
    [(NTKUpNextFaceView *)v11 setClipsToBounds:1];
    [(NTKUpNextFaceView *)v11 _setSiriBlurColor];
    objc_initWeak(&location, v11);
    v18 = (void *)MEMORY[0x1E4F949D0];
    uint64_t v19 = MEMORY[0x1E4F14428];
    id v20 = MEMORY[0x1E4F14428];
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __66__NTKUpNextFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v40 = &unk_1E62C0068;
    objc_copyWeak(&v41, &location);
    uint64_t v21 = [v18 schedulerWithQueue:v19 updateBlock:&v37];
    applicationIdentifierUpdateScheduler = v11->_applicationIdentifierUpdateScheduler;
    v11->_applicationIdentifierUpdateScheduler = (REUpNextScheduler *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKUpNextFaceView *)v11 bounds];
    double Width = CGRectGetWidth(v44);
    [(NTKUpNextFaceView *)v11 bounds];
    uint64_t v25 = objc_msgSend(v23, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v45));
    scalableView = v11->_scalableView;
    v11->_scalableView = (UIView *)v25;

    [(UIView *)v11->_scalableView setAutoresizingMask:18];
    v27 = [(NTKFaceView *)v11 contentView];
    [v27 addSubview:v11->_scalableView];

    [(UIView *)v11->_scalableView setOpaque:0];
    v28 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v11->_scalableView setBackgroundColor:v28];

    [(NTKUpNextFaceView *)v11 _updateCrownInvertedSetting];
    v29 = [MEMORY[0x1E4F19A98] sharedMonitor];
    [v29 addSensitiveUIObserver:v11];

    v30 = [(NTKFaceView *)v11 device];
    uint64_t v31 = [v30 deviceCategory];

    if (v31 != 1)
    {
      v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v32 addObserver:v11 selector:sel_updateTimeLabelBackground name:*MEMORY[0x1E4FB24A8] object:0];
    }
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v11 selector:sel__availableDataSourcesDidChange name:*MEMORY[0x1E4F949E0] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)_updateDisabledDataSources, @"com.apple.NanoTimeKit.NPS.NTKSiriDefaultsDisabledDataSourcesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v35 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v35, v11, (CFNotificationCallback)_thirdPartyDataSourcesDidChange, @"com.apple.NanoTimeKit.NPS.NTKSiriDefaultsThirdPartyDataSourcesDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __66__NTKUpNextFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateApplicationIdentifiersAndLocationAuthorization];
}

- (void)_showSiriUnavailableAlert:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(NTKFaceView *)self dataMode] == 1;
  double v5 = v8;
  if (v4)
  {
    v6 = [v8 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(NTKFaceView *)self delegate];
      [v7 faceViewWantsToPresentViewController:v6];
    }
    double v5 = v8;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F19A98] sharedMonitor];
  [v3 removeSensitiveUIObserver:self];

  BOOL v4 = [(NTKFaceView *)self device];
  uint64_t v5 = [v4 deviceCategory];

  if (v5 != 1)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4F949E0] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, 0, 0);
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextFaceView;
  [(NTKFaceView *)&v9 dealloc];
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView_screenWillTurnOnAnimated___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__NTKUpNextFaceView_screenWillTurnOnAnimated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 1;
  [*(id *)(a1 + 32) _startPositiveDwellForTopElementsTimerIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibilityForCells];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  if (!a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke_2;
    v6[3] = &unk_1E62BFF20;
    v6[4] = self;
    uint64_t v5 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1041) = 0;
  [*(id *)(a1 + 32) _resetVisibilityForCells];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateVisibilityForCells];
}

uint64_t __46__NTKUpNextFaceView_screenDidTurnOffAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissPresentedViewControllerIfNecessary:0];
  [*(id *)(a1 + 32) _switchViewModeToDefault];
  v2 = *(void **)(a1 + 32);
  return [v2 _stopPositiveDwellForTopElementsTimer];
}

- (void)_loadEngineController
{
}

void __42__NTKUpNextFaceView__loadEngineController__block_invoke()
{
  v0 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_DEFAULT, "Loaded 'engine' content", v1, 2u);
  }
}

- (void)layoutSubviews
{
  if (![(NTKFaceView *)self zooming] && !self->_isAnimating)
  {
    v20.receiver = self;
    v20.super_class = (Class)NTKUpNextFaceView;
    [(NTKDigitalFaceView *)&v20 layoutSubviews];
    [(NTKUpNextFaceView *)self _layoutTimeLabelForViewMode:[(NTKDigitalFaceView *)self viewMode]];
    [(NTKUpNextFaceView *)self _layoutTimeLabelPlatterViewMode:[(NTKDigitalFaceView *)self viewMode]];
    [(UIView *)self->_scalableView bounds];
    CGFloat x = v3;
    CGFloat y = v5;
    CGFloat width = v7;
    CGFloat height = v9;
    v11 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v11, v18);
    double v12 = v19;

    if (v12 > 0.0)
    {
      CGFloat v13 = v12 * 0.5;
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      CGRect v22 = CGRectInset(v21, 0.0, v13);
      CGRect v23 = CGRectOffset(v22, 0.0, v13);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
    }
    uint64_t v14 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v14, &v17);
    [(NTKUpNextFaceView *)self bounds];
    CGRectGetWidth(v24);
    CLKRoundForDevice();
    CGFloat v16 = v15;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v26 = CGRectInset(v25, v16, 0.0);
    -[NTKUpNextCollectionView setFrame:](self->_collectionView, "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  timeLabelDefaultStyle = self->_timeLabelDefaultStyle;
  self->_timeLabelDefaultStyle = 0;
  id v5 = a3;

  timeLabelSmallInUpperRightCornerStyle = self->_timeLabelSmallInUpperRightCornerStyle;
  self->_timeLabelSmallInUpperRightCornerStyle = 0;

  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextFaceView;
  [(NTKUpNextFaceView *)&v7 traitCollectionDidChange:v5];
}

- (id)_detachedComplicationDisplays
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(REUIRelevanceEngineController *)self->_engineController engine];
  id v5 = [v4 dataSourceCatalog];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__NTKUpNextFaceView__detachedComplicationDisplays__block_invoke;
  v8[3] = &unk_1E62C0540;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateDataSources:v8];

  return v6;
}

void __50__NTKUpNextFaceView__detachedComplicationDisplays__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 complicationDescriptor];
  if (v3)
  {
    BOOL v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    double v3 = v4;
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if ([v8 isEqualToString:@"top-right"])
  {
    id v10 = [(NTKUtilityComplicationFactory *)self->_utilityComplicationFactory newViewForComplication:v9 family:a4 forSlot:13];

    [(NTKUpNextFaceView *)self _configureComplicationView:v10 forSlot:v8];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKUpNextFaceView;
    id v10 = [(NTKFaceView *)&v12 _newLegacyViewForComplication:v9 family:a4 slot:v8];
  }
  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  objc_super v7 = [(NTKFaceView *)self faceColorPalette];
  id v8 = +[NTKPigmentEditOption pigmentNamed:@"special.multicolor"];
  id v9 = (void *)[v7 copyWithOption:v8];

  LODWORD(v7) = [v6 isEqualToString:@"top-right"];
  if (v7)
  {
    double v10 = *MEMORY[0x1E4FB09B8];
    id v11 = v18;
    [v11 setFontWeight:v10];
    objc_super v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [v11 setForegroundColor:v12];

    [v11 setShadowColor:0];
    [v11 setForegroundAlpha:1.0];
    [v11 setForegroundImageAlpha:1.0];
    [v11 setUsesLegibility:0];
    objc_msgSend(v11, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", 5));
    [v11 setSuppressesInternalColorOverrides:1];
    [v11 setHidden:0];
    CGFloat v13 = [MEMORY[0x1E4FB1618] clearColor];
    [v11 setBackgroundColor:v13];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4FB1618];
    id v15 = v18;
    CGFloat v16 = [v14 clearColor];
    [v15 setBackgroundColor:v16];

    uint64_t v17 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v17, v19);
    [v15 setContentHeight:v20];

    CGFloat v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [v15 setForegroundColor:v13];
  }

  [v18 applyFaceColorPalette:v9 units:1095];
LABEL_6:
}

- (void)_reloadContentIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_engineInitiallyLoaded
    && (!NTKIsDaemonOrFaceSnapshotService() || self->_engineInitiallyLoaded))
  {
    double v3 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL needsReloadedContent = self->_needsReloadedContent;
      *(_DWORD *)buf = 67109120;
      BOOL v9 = needsReloadedContent;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "[datasource] requested full reload with (_needsReloadedContent=%d)", buf, 8u);
    }

    if (self->_isApplyingSnapshot)
    {
      id v5 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "[datasource] deferring full reload to completion block of current reload", buf, 2u);
      }
    }
    else if (self->_needsReloadedContent)
    {
      id v6 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "[datasource] non-animated reload being performed", buf, 2u);
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __43__NTKUpNextFaceView__reloadContentIfNeeded__block_invoke;
      v7[3] = &unk_1E62BFF20;
      v7[4] = self;
      [(NTKUpNextFaceView *)self updateCollectionViewSnapshotAnimated:0 completion:v7];
    }
  }
}

uint64_t __43__NTKUpNextFaceView__reloadContentIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 888) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 1064) schedule];
  uint64_t result = [*(id *)(a1 + 32) viewMode];
  if (!result) {
    uint64_t result = [*(id *)(a1 + 32) _switchViewModeToDefault];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1032) = 0;
  return result;
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_loadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextFaceView;
  [(NTKDigitalFaceView *)&v4 _loadSnapshotContentViews];
  [(NTKUpNextFaceView *)self _loadEngineController];
  [(NTKUpNextFaceView *)self _loadContentViews];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NTKUpNextFaceView__loadSnapshotContentViews__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__NTKUpNextFaceView__loadSnapshotContentViews__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) viewMode];
  if (!result)
  {
    [*(id *)(*(void *)(a1 + 32) + 888) layoutIfNeeded];
    double v3 = *(void **)(a1 + 32);
    return [v3 _switchViewModeToDefault];
  }
  return result;
}

- (void)_loadContentViews
{
  if (!self->_collectionView)
  {
    uint64_t v55 = 0;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    memset(v40, 0, sizeof(v40));
    double v3 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v3, v40);

    objc_super v4 = objc_alloc_init(NTKUpNextCollectionViewFlowLayout);
    layout = self->_layout;
    self->_layout = v4;

    [(UICollectionViewFlowLayout *)self->_layout setScrollDirection:0];
    [(UICollectionViewFlowLayout *)self->_layout setMinimumLineSpacing:*((double *)&v41 + 1)];
    id v6 = self->_layout;
    if (NTKUpNextDemoPrerenderAllCells_onceToken != -1) {
      dispatch_once(&NTKUpNextDemoPrerenderAllCells_onceToken, &__block_literal_global_12);
    }
    [(NTKUpNextCollectionViewFlowLayout *)v6 setShowingAllAttributes:NTKUpNextDemoPrerenderAllCells_prerenderAllCells != 0];
    objc_super v7 = self->_layout;
    id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:2];
    [(NTKUpNextCollectionViewFlowLayout *)v7 setTopElementIndexPath:v8];

    BOOL v9 = self->_layout;
    uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:1 inSection:2];
    [(NTKUpNextCollectionViewFlowLayout *)v9 setBottomElementIndexPath:v10];

    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopOffsetForSnapping:*((double *)&v45 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopOffsetForScrolling:*((double *)&v43 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setStatusBarDecorationHeight:*((double *)&v48 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setLowTransitionScale:*((double *)&v49 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setHighTransitionScale:*((double *)&v50 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setHighTransitionShift:*((double *)&v51 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setLowTransitionShift:*((double *)&v52 + 1)];
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopOffsetForScrolling:*(double *)&v44];
    [(NTKUpNextFaceView *)self bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(NTKUpNextFaceView *)self bounds];
    CGFloat v19 = (CGRectGetWidth(v56) - *(double *)&v48) * 0.5;
    v57.origin.CGFloat x = v12;
    v57.origin.CGFloat y = v14;
    v57.size.CGFloat width = v16;
    v57.size.CGFloat height = v18;
    CGRect v58 = CGRectInset(v57, v19, 0.0);
    double v20 = -[NTKUpNextCollectionView initWithFrame:collectionViewLayout:]([NTKUpNextCollectionView alloc], "initWithFrame:collectionViewLayout:", self->_layout, v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    collectionView = self->_collectionView;
    self->_collectionView = v20;

    CGRect v22 = self->_collectionView;
    CGRect v23 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKUpNextCollectionView *)v22 setBackgroundColor:v23];

    [(NTKUpNextCollectionView *)self->_collectionView _setAutomaticContentOffsetAdjustmentEnabled:0];
    CGRect v24 = [(NTKUpNextCollectionView *)self->_collectionView layer];
    [v24 setAllowsGroupOpacity:1];

    [(NTKUpNextCollectionView *)self->_collectionView setDelegate:self];
    [(NTKUpNextCollectionView *)self->_collectionView setPrefetchingEnabled:0];
    [(NTKUpNextCollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
    [(NTKUpNextCollectionView *)self->_collectionView setClipsToBounds:0];
    [(NTKUpNextCollectionView *)self->_collectionView _setResetsBoundingPathForSubtree:0];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextLargeTextCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextMultilineCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextMatchupCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextPhotoCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextThumbnailCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextLargeWithDetailTextCellReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"NTKUpNextHeaderReuseIdentifier"];
    [(NTKUpNextCollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTKUpNextGaugeCellReuseIdentifier"];
    CGRect v25 = [(NTKFaceView *)self device];
    [v25 deviceCategory];

    [(NTKUpNextCollectionViewFlowLayout *)self->_layout registerClass:objc_opt_class() forDecorationViewOfKind:@"NTKUpNextCollectionViewFlowLayoutStatusBarDecorationKind"];
    CGRect v26 = self->_layout;
    [(NTKUpNextCollectionView *)self->_collectionView bounds];
    -[UICollectionViewFlowLayout setItemSize:](v26, "setItemSize:", CGRectGetWidth(v59), *((double *)&v47 + 1));
    [(NTKUpNextCollectionView *)self->_collectionView setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [(UIView *)self->_scalableView addSubview:self->_collectionView];
    [(NTKUpNextCollectionView *)self->_collectionView setAlwaysBounceVertical:1];
    [(NTKUpNextFaceView *)self _configureCollectionViewDataSource];
    [(NTKUpNextFaceView *)self _reloadCollectionViewData];
    id v27 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v28 = (UIView *)objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    timeLabelPlatter = self->_timeLabelPlatter;
    self->_timeLabelPlatter = v28;

    v30 = [(UIView *)self->_timeLabelPlatter layer];
    [v30 setCornerRadius:*(double *)v40];

    uint64_t v31 = [(UIView *)self->_timeLabelPlatter layer];
    [v31 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v32 = [(UIView *)self->_timeLabelPlatter layer];
    [v32 setMasksToBounds:1];

    v33 = [(NTKFaceView *)self device];
    uint64_t v34 = [v33 deviceCategory];

    if (v34 == 1)
    {
      v35 = [(UIView *)self->_timeLabelPlatter layer];
      id v36 = [MEMORY[0x1E4FB1618] _externalSystemDarkGrayColor];
      objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v36, "CGColor"));
    }
    else
    {
      [(NTKUpNextFaceView *)self updateTimeLabelBackground];
    }
    [(UIView *)self->_scalableView addSubview:self->_timeLabelPlatter];
    uint64_t v37 = [(NTKFaceView *)self timeView];
    [(NTKUpNextFaceView *)self addSubview:v37];

    uint64_t v38 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleViewModeTapGesture_];
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = v38;

    [(UITapGestureRecognizer *)self->_viewModeTapGesture setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:1];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)self->_viewModeTapGesture setDelegate:self];
    [(NTKUpNextFaceView *)self addGestureRecognizer:self->_viewModeTapGesture];
  }
}

- (void)_unloadSnapshotContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextFaceView;
  [(NTKDigitalFaceView *)&v3 _unloadSnapshotContentViews];
  [(NTKUpNextFaceView *)self _unloadContentViews];
}

- (void)_unloadContentViews
{
  collectionView = self->_collectionView;
  if (collectionView)
  {
    [(NTKUpNextCollectionView *)collectionView removeFromSuperview];
    objc_super v4 = self->_collectionView;
    self->_collectionView = 0;

    collectionViewDataSource = self->_collectionViewDataSource;
    self->_collectionViewDataSource = 0;

    layout = self->_layout;
    self->_layout = 0;

    [(UIView *)self->_timeLabelPlatter removeFromSuperview];
    timeLabelPlatter = self->_timeLabelPlatter;
    self->_timeLabelPlatter = 0;

    [(NTKUpNextFaceView *)self removeGestureRecognizer:self->_viewModeTapGesture];
    viewModeTapGesture = self->_viewModeTapGesture;
    self->_viewModeTapGesture = 0;
  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextFaceView;
  -[NTKDigitalFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v9, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  CLKInterpolateBetweenFloatsClipped();
  double v7 = v6;
  -[NTKUpNextCollectionView setAlpha:](self->_collectionView, "setAlpha:");
  id v8 = [(NTKFaceView *)self timeView];
  [v8 setAlpha:v7];
}

- (void)_switchViewModeToDefault
{
  [(NTKUpNextFaceView *)self _defaultPointForDefaultMode];
  -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 1, 0, 0);
}

- (void)performScrollTestNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 2, 0, 1, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.0);
  [(NTKUpNextFaceView *)self setNeedsLayout];
  [(NTKUpNextFaceView *)self layoutIfNeeded];
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke;
  v11[3] = &unk_1E62C0590;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_after(v8, MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 111);
    uint64_t v6 = *(void *)(a1 + 32);
    [v5 contentSize];
    uint64_t v8 = (int)v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke_2;
    v10[3] = &unk_1E62C0568;
    objc_copyWeak(&v12, v2);
    id v11 = *(id *)(a1 + 40);
    [v5 _performScrollTest:v6 iterations:2 delta:16 length:v8 scrollAxis:2 extraResultsBlock:0 completionBlock:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
}

void __55__NTKUpNextFaceView_performScrollTestNamed_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _defaultPointForDefaultMode];
    objc_msgSend(v4, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 0, 1, 0);
    [v4 setNeedsLayout];
    [v4 layoutIfNeeded];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

- (void)collectionViewDeferralStateChanged
{
  [(NTKUpNextFaceView *)self _shouldDeferUpdate];
  if (self->_needsReloadedContent)
  {
    uint64_t v3 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "[datasource] applying a deferred reload", v4, 2u);
    }

    [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
  }
  else if (self->_hasDeferredUpdate)
  {
    self->_hasDeferredUpdate = 0;
    self->_BOOL needsReloadedContent = 1;
    [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
  }
}

- (void)_applyCollectionViewSnapshot:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (self->_collectionView)
  {
    if (![(NTKDigitalFaceView *)self viewMode])
    {
      layout = self->_layout;
      id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:2];
      [(NTKUpNextCollectionViewFlowLayout *)layout setIndexPathToSnapTo:v12];

      id v13 = self->_layout;
      id v14 = [(NTKFaceView *)self device];
      _LayoutConstants_0(v14, v24);
      [(NTKUpNextCollectionViewFlowLayout *)v13 setSnappingOffset:-v25];
    }
    [(NTKUpNextFaceView *)self _allowContentViewInteractive:[(NTKDigitalFaceView *)self viewMode] != 0];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke;
    aBlock[3] = &unk_1E62C05B8;
    BOOL v22 = v6;
    objc_copyWeak(&v21, &location);
    id v20 = v10;
    double v15 = _Block_copy(aBlock);
    CGFloat v16 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v18 = 0;
      _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "[datasource] snapshot reload", v18, 2u);
    }

    double v17 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource snapshot];
    [(NTKUpNextFaceView *)self _logDataSourceSnapshot:v17 withName:@"(old_snapshot)"];

    [(NTKUpNextFaceView *)self _logDataSourceSnapshot:v8 withName:@"(new_snapshot)"];
    self->_isApplyingSnapshot = 1;
    [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource applySnapshot:v8 animatingDifferences:v6 completion:v15];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

void __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    int v10 = v3;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "[datasource] reloaded collection view data (animated=%d)", buf, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 133) schedule];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    v5[1034] = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke_124;
    block[3] = &unk_1E62BFF20;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __70__NTKUpNextFaceView__applyCollectionViewSnapshot_animated_completion___block_invoke_124(uint64_t a1)
{
  return [*(id *)(a1 + 32) collectionViewDeferralStateChanged];
}

- (BOOL)_snapshotHasChangesToVisibleItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource snapshot];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NTKUpNextCollectionView *)self->_collectionView indexPathsForVisibleItems];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource itemIdentifierForIndexPath:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        uint64_t v11 = [v5 indexOfItemIdentifier:v10];
        uint64_t v12 = [v4 indexOfItemIdentifier:v10];

        if (v11 != v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)updateCollectionViewSnapshotAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    int v10 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[NTKUpNextFaceView updateCollectionViewSnapshotAnimated:completion:](v10);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__NTKUpNextFaceView_updateCollectionViewSnapshotAnimated_completion___block_invoke;
    block[3] = &unk_1E62C05E0;
    block[4] = self;
    BOOL v55 = v4;
    id v54 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v11 = v54;
    goto LABEL_37;
  }
  snapshotSnapshot = self->_snapshotSnapshot;
  uint64_t v8 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!snapshotSnapshot)
  {
    id v35 = v6;
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      BOOL v62 = v4;
      _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "[datasource] performing a reload of collection view data (animated=%d)", buf, 8u);
    }
    BOOL v34 = v4;

    uint64_t v37 = [(REUIRelevanceEngineController *)self->_engineController generateDiffableSnapshot];
    uint64_t v12 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    BOOL v13 = self->_reloadedElements;
    uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v19 = [v18 element];
          [v12 setObject:v19 forKey:v18];
        }
        uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v15);
    }

    [(NSMutableSet *)self->_reloadedElements removeAllObjects];
    id v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v12, "count"));
    id v21 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = [v37 sectionIdentifiers];
    uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(obj);
          }
          CGRect v23 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          if (NTKSectionForSectionIdentifier(v23) != -1)
          {
            uint64_t v40 = j;
            CGRect v58 = v23;
            CGRect v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
            [v21 appendSectionsWithIdentifiers:v24];

            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            double v25 = [v37 itemIdentifiersInSectionWithIdentifier:v23];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v57 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v42;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v42 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = +[NTKUpNextElement elementWithREElement:*(void *)(*((void *)&v41 + 1) + 8 * k)];
                  CGRect v56 = v30;
                  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
                  [v21 appendItemsWithIdentifiers:v31];

                  v32 = [v12 objectForKey:v30];
                  if (v32)
                  {
                    [(NTKUpNextFaceView *)self _replaceDataSourceElement:v30 withReloadedREElement:v32];
                    [v20 addObject:v30];
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v57 count:16];
              }
              while (v27);
            }

            uint64_t j = v40;
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v39);
    }

    v33 = [v20 allObjects];
    [v21 reloadItemsWithIdentifiers:v33];

    id v6 = v35;
    [(NTKUpNextFaceView *)self _applyCollectionViewSnapshot:v21 animated:v34 completion:v35];

    uint64_t v11 = v37;
LABEL_37:

    goto LABEL_38;
  }
  if (v9)
  {
    *(_DWORD *)buf = 67109120;
    BOOL v62 = v4;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "[datasource] performing override of collection view data (animated=%d)", buf, 8u);
  }

  [(NTKUpNextFaceView *)self _applyCollectionViewSnapshot:self->_snapshotSnapshot animated:v4 completion:v6];
LABEL_38:
}

uint64_t __69__NTKUpNextFaceView_updateCollectionViewSnapshotAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCollectionViewSnapshotAnimated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_replaceDataSourceElement:(id)a3 withReloadedREElement:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource indexPathForItemIdentifier:v6];
  BOOL v9 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource itemIdentifierForIndexPath:v8];
  int v10 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Replacing element %@ with element %@ for index path %@", (uint8_t *)&v11, 0x20u);
  }

  [v9 setElement:v7];
}

- (void)_availableDataSourcesDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKUpNextFaceView__availableDataSourcesDidChange__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__NTKUpNextFaceView__availableDataSourcesDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1064) schedule];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateDisabledDataSources];
}

- (id)_sectionEnumerationOrder
{
  v2 = [(REUIRelevanceEngineController *)self->_engineController sectionOrder];
  int v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v4 = *MEMORY[0x1E4F94A10];
  if ([v2 containsObject:*MEMORY[0x1E4F94A10]])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "indexOfObject:", v4));
    [v3 addObject:v5];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__NTKUpNextFaceView__sectionEnumerationOrder__block_invoke;
  v9[3] = &unk_1E62C0188;
  id v10 = v3;
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v9];
  id v7 = (void *)[v6 copy];

  return v7;
}

void __45__NTKUpNextFaceView__sectionEnumerationOrder__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (([a2 isEqualToString:*MEMORY[0x1E4F94A10]] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 addObject:v6];
  }
}

- (void)_updateApplicationIdentifiersAndLocationAuthorization
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(REUIRelevanceEngineController *)self->_engineController numberOfSections];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    for (uint64_t i = 0; i != v4; ++i)
      v5 += [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:i];
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v58 = v5;
  CGRect v56 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = [(NTKUpNextFaceView *)self _sectionEnumerationOrder];
  uint64_t v55 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v68;
    float v7 = (float)v5;
    uint64_t v60 = *MEMORY[0x1E4F94A40];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v68 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v8;
        uint64_t v62 = [*(id *)(*((void *)&v67 + 1) + 8 * v8) unsignedIntegerValue];
        uint64_t v9 = -[REUIRelevanceEngineController numberOfItemsInSectionAtIndex:](self->_engineController, "numberOfItemsInSectionAtIndex:");
        CGRect v59 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v61 = v9;
        if (v9)
        {
          uint64_t v10 = 0;
          do
          {
            int v11 = [MEMORY[0x1E4F28D58] indexPathWithElement:v10 inUpNextSection:v62];
            id v12 = [(REUIRelevanceEngineController *)self->_engineController identifierForElementAtIndexPath:v11];
            __int16 v13 = [(REUIRelevanceEngineController *)self->_engineController metadataForElementWithIdentifier:v12];
            id v14 = [v13 objectForKeyedSubscript:v60];

            __int16 v15 = [(REUIRelevanceEngineController *)self->_engineController engine];
            uint64_t v16 = [v15 dataSourceCatalog];
            uint64_t v17 = [v16 applicationIdentifierForDataSourceWithIdentifier:v14];

            long long v18 = [(REUIRelevanceEngineController *)self->_engineController engine];
            long long v19 = [v18 dataSourceCatalog];
            int v20 = [v19 wantsApplicationPrewarmForDataSourceWithIdentifier:v14];

            if (v17) {
              BOOL v21 = v20 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21)
            {
              unint64_t v22 = [(NTKUpNextFaceView *)self _distanceForIndexPathFromNow:v11];
              float v23 = (float)((float)(v58 - v22) / v7) * (float)((float)(v58 - v22) / v7);
              CGRect v24 = [v59 objectForKeyedSubscript:v17];
              [v24 floatValue];
              float v26 = v25 + v23;

              *(float *)&double v27 = v26;
              uint64_t v28 = [NSNumber numberWithFloat:v27];
              [v59 setObject:v28 forKeyedSubscript:v17];
            }
            ++v10;
          }
          while (v61 != v10);
        }
        v29 = [v59 keysSortedByValueUsingComparator:&__block_literal_global_141];
        [v56 addObjectsFromArray:v29];

        uint64_t v8 = v57 + 1;
      }
      while (v57 + 1 != v55);
      uint64_t v55 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v55);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v30 = [(REUIRelevanceEngineController *)self->_engineController engine];
  uint64_t v31 = [v30 dataSourceCatalog];
  v32 = [v31 dataSourceIdentifiers];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v64 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v63 + 1) + 8 * j);
        uint64_t v38 = [(REUIRelevanceEngineController *)self->_engineController disabledDataSources];
        char v39 = [v38 containsObject:v37];

        if ((v39 & 1) == 0)
        {
          uint64_t v40 = [(REUIRelevanceEngineController *)self->_engineController engine];
          long long v41 = [v40 dataSourceCatalog];
          int v42 = [v41 requiresLocationInUseAssertonForDataSourceWithIdentifier:v37];

          if (v42)
          {
            long long v43 = [(REUIRelevanceEngineController *)self->_engineController engine];
            long long v44 = [v43 dataSourceCatalog];
            long long v45 = [v44 applicationIdentifierForDataSourceWithIdentifier:v37];

            [v56 addObject:v45];
          }
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v34);
  }

  long long v46 = [v56 set];
  long long v47 = [(NSOrderedSet *)self->_currentApplicationIdentifiers set];
  int v48 = [v46 isEqualToSet:v47];

  BOOL v49 = [(NTKFaceView *)self dataMode] != 1 && [(NTKFaceView *)self dataMode] != 2;
  long long v50 = (NSOrderedSet *)[v56 copy];
  currentApplicationIdentifiers = self->_currentApplicationIdentifiers;
  self->_currentApplicationIdentifiers = v50;

  if (((v48 | v49) & 1) == 0)
  {
    long long v52 = [MEMORY[0x1E4F196D0] sharedObserver];
    [v52 complicationListDidChange];
  }
}

uint64_t __74__NTKUpNextFaceView__updateApplicationIdentifiersAndLocationAuthorization__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (unint64_t)_distanceForIndexPathFromNow:(id)a3
{
  id v4 = a3;
  switch([v4 upNextSection])
  {
    case 0:
      uint64_t v5 = [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:0];
      uint64_t v6 = v5 - [v4 element];
      unint64_t v7 = v6
         + [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:1];
      break;
    case 1:
      uint64_t v8 = [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:1];
      unint64_t v7 = v8 - [v4 element];
      break;
    case 2:
      unint64_t v7 = [v4 element];
      break;
    case 3:
      uint64_t v9 = [v4 element];
      unint64_t v7 = [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:2]+ v9;
      break;
    case 4:
      uint64_t v10 = [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:4];
      uint64_t v11 = v10 - [v4 element];
      uint64_t v12 = [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:2];
      unint64_t v7 = v11
         + v12
         + [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:3];
      break;
    default:
      unint64_t v7 = 0;
      break;
  }

  return v7;
}

- (void)_startViewResetTimer
{
  viewResetTimer = self->_viewResetTimer;
  if (viewResetTimer) {
    [(NSTimer *)viewResetTimer invalidate];
  }
  if (NTKUpNextDemoTimeoutDuration_onceToken != -1) {
    dispatch_once(&NTKUpNextDemoTimeoutDuration_onceToken, &__block_literal_global_3);
  }
  if (NTKUpNextDemoTimeoutDuration_defaultTimeout <= 0) {
    double v4 = 30.0;
  }
  else {
    double v4 = (double)NTKUpNextDemoTimeoutDuration_defaultTimeout;
  }
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__NTKUpNextFaceView__startViewResetTimer__block_invoke;
  v8[3] = &unk_1E62C0628;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:v4];
  unint64_t v7 = self->_viewResetTimer;
  self->_viewResetTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__NTKUpNextFaceView__startViewResetTimer__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _dismissPresentedViewControllerIfNecessary:0];
    if ([v4 viewMode] == 2 && objc_msgSend(v4, "dataMode") == 2)
    {
      [v4 _switchViewModeForCurrentMode:2 animated:0];
      [v5 invalidate];
    }
  }
}

- (void)_stopViewResetTimer
{
  [(NSTimer *)self->_viewResetTimer invalidate];
  viewResetTimer = self->_viewResetTimer;
  self->_viewResetTimer = 0;
}

- (BOOL)_dismissPresentedViewControllerIfNecessary:(BOOL)a3
{
  return 0;
}

- (void)_configureCollectionViewDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  collectionView = self->_collectionView;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke;
  v9[3] = &unk_1E62C0650;
  objc_copyWeak(&v10, &location);
  id v5 = (UICollectionViewDiffableDataSource *)[v3 initWithCollectionView:collectionView cellProvider:v9];
  collectionViewDataSource = self->_collectionViewDataSource;
  self->_collectionViewDataSource = v5;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke_2;
  v7[3] = &unk_1E62C0678;
  objc_copyWeak(&v8, &location);
  [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource setSupplementaryViewProvider:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = [v7 element];

  uint64_t v12 = [WeakRetained _configureCellForItemWithElement:v11 atIndexPath:v8 inCollectionView:v9];

  return v12;
}

id __55__NTKUpNextFaceView__configureCollectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = [WeakRetained _configureSupplementaryViewForSupplementaryElementOfKind:v8 atIndexPath:v9 inCollectionView:v7];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_reloadCollectionViewData
{
  self->_BOOL needsReloadedContent = 1;
  [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
}

- (void)_logDataSourceSnapshot:(id)a3 withName:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v6;
    __int16 v35 = 2112;
    id v36 = v5;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "[datasource] (%@):(%@)", buf, 0x16u);
  }
  uint64_t v17 = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [v5 sectionIdentifiers];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v28;
    id v20 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v8;
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = objc_msgSend(v5, "itemIdentifiersInSectionWithIdentifier:", v9, v17);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              __int16 v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v16 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v34 = v9;
                __int16 v35 = 2112;
                id v36 = v15;
                _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "[datasource] %@:%@", buf, 0x16u);
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v22 + 1;
        id v5 = v20;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
}

- (void)_logContent:(id)a3 withIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 headerTextProvider];
  uint64_t v8 = [v7 attributedString];
  id v9 = [v8 string];

  id v10 = [v5 description1TextProvider];
  uint64_t v11 = [v10 attributedString];
  uint64_t v12 = [v11 string];

  uint64_t v13 = [v5 description2TextProvider];
  id v14 = [v13 attributedString];
  __int16 v15 = [v14 string];

  uint64_t v16 = [v5 description3TextProvider];
  uint64_t v17 = [v16 attributedString];
  long long v18 = [v17 string];

  uint64_t v19 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413570;
    id v21 = v6;
    __int16 v22 = 1024;
    int v23 = [v5 style];
    __int16 v24 = 2112;
    long long v25 = v9;
    __int16 v26 = 2112;
    long long v27 = v12;
    __int16 v28 = 2112;
    long long v29 = v15;
    __int16 v30 = 2112;
    uint64_t v31 = v18;
    _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "[datasource] %@ content=(style=%d, headerText=%@, description1=%@, description2=%@, description3=%@)", (uint8_t *)&v20, 0x3Au);
  }
}

- (id)_configureCellForItemWithElement:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NTKUpNextFaceView *)self _contentAtIndexPath:v9];
  uint64_t v12 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v8 identifier];
    int v19 = 138412546;
    int v20 = v13;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "[datasource] loaded identifier (%@) into cell at index path: (%@)", (uint8_t *)&v19, 0x16u);
  }
  id v14 = [v8 identifier];
  [(NTKUpNextFaceView *)self _logContent:v11 withIdentifier:v14];

  __int16 v15 = +[NTKUpNextFaceView _reuseIdentifierForContent:v11];
  uint64_t v16 = [v10 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v9];

  uint64_t v17 = [v8 identifier];
  [(NTKUpNextFaceView *)self _setupCell:v16 withContent:v11 representedIdentifier:v17];

  return v16;
}

- (id)_configureSupplementaryViewForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4 inCollectionView:(id)a5
{
  uint64_t v6 = *MEMORY[0x1E4FB2770];
  id v7 = a4;
  id v8 = [a5 dequeueReusableSupplementaryViewOfKind:v6 withReuseIdentifier:@"NTKUpNextHeaderReuseIdentifier" forIndexPath:v7];
  uint64_t v9 = [v7 upNextSection];

  switch(v9)
  {
    case -1:
      id v10 = &stru_1F1635E90;
      break;
    case 0:
      uint64_t v11 = @"UP_NEXT_ALL_DAY_HEADER";
      uint64_t v12 = @"All-Day";
      goto LABEL_9;
    case 1:
      uint64_t v11 = @"UP_NEXT_RECENT_HEADER";
      uint64_t v12 = @"Recent";
      goto LABEL_9;
    case 2:
      uint64_t v11 = @"UP_NEXT_HEADER";
      uint64_t v12 = @"Up Next";
      goto LABEL_9;
    case 3:
      uint64_t v11 = @"UP_NEXT_TOMORROW_HEADER";
      uint64_t v12 = @"Tomorrow";
      goto LABEL_9;
    case 4:
      uint64_t v11 = @"UP_NEXT_UPCOMING_HEADER";
      uint64_t v12 = @"Upcoming";
LABEL_9:
      NTKClockFaceLocalizedString(v11, v12);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      id v10 = 0;
      break;
  }
  uint64_t v13 = [MEMORY[0x1E4F19AB0] textProviderWithText:v10];
  [v13 finalize];
  [v8 setTextProvider:v13];

  return v8;
}

- (void)_configureVisibleCell:(id)a3
{
  cellContentBackground = self->_cellContentBackground;
  id v5 = a3;
  [v5 setContentImage:cellContentBackground animated:0];
  [v5 setFilterProvider:self];
}

- (int64_t)_numberOfSectionsInCollectionView
{
  return [(REUIRelevanceEngineController *)self->_engineController numberOfSections];
}

- (int64_t)_numberOfItemsInCollectionViewSection:(int64_t)a3
{
  return [(REUIRelevanceEngineController *)self->_engineController numberOfItemsInSectionAtIndex:a3];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  if ([v7 numberOfItemsInSection:a5])
  {
    [v7 bounds];
    CGFloat Width = CGRectGetWidth(v16);
    uint64_t v9 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v9, v13);
    double v10 = v14;
  }
  else
  {
    CGFloat Width = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v11 = Width;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NTKUpNextFaceView *)self _configureVisibleCell:v6];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(NTKUpNextFaceView *)self _updateVisibilityForCells];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v9 = a3;
  [(NTKUpNextFaceView *)self _updateVisibilityForCells];
  if (self->_isInflightScroll
    && !self->_isProgramaticScrollEvent
    && self->_modeTransitionApplier
    && self->_modeTransitionCompletion)
  {
    self->_cancelInflightScroll = 1;
    [v9 contentOffset];
    CLKReverseInterpolateFromFloats();
    double v5 = v4;
    [v9 contentOffset];
    CLKReverseInterpolateFromFloats();
    if (v5 < v6) {
      double v5 = v6;
    }
    (*((void (**)(double))self->_modeTransitionApplier + 2))(v5);
    int v7 = CLKFloatEqualsFloat();
    if (v5 > 1.0 || v7 != 0)
    {
      (*((void (**)(void))self->_modeTransitionCompletion + 2))();
      self->_scrollingStoppedTransition = 1;
    }
  }
}

- (void)_startPositiveDwellForTopElementsTimerIfNeeded
{
  [(NTKUpNextFaceView *)self _stopPositiveDwellForTopElementsTimer];
  [(NTKFaceView *)self dataMode];
}

- (void)_stopPositiveDwellForTopElementsTimer
{
  [(NSTimer *)self->_positiveDwellForTopElementsTimer invalidate];
  positiveDwellForTopElementsTimer = self->_positiveDwellForTopElementsTimer;
  self->_positiveDwellForTopElementsTimer = 0;
}

+ (id)_reuseIdentifierForContent:(id)a3
{
  unint64_t v3 = [a3 style];
  if (v3 > 6) {
    return @"NTKUpNextMultilineCellReuseIdentifier";
  }
  else {
    return off_1E62C07D0[v3];
  }
}

- (id)_contentAtIndexPath:(id)a3
{
  double v4 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource itemIdentifierForIndexPath:a3];
  double v5 = [v4 element];
  if ([(REUIRelevanceEngineController *)self->_engineController wantsIdealizedContent])
  {
    double v6 = [v5 idealizedContent];
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v5 content];
    }
    id v9 = v8;
  }
  else
  {
    id v9 = [v5 content];
  }

  return v9;
}

- (void)_setupCell:(id)a3 withContent:(id)a4 representedIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [v9 configureWithContent:a4];
  [v9 setRepresentedElementIdentifier:v8];

  [v9 setContentImage:self->_cellContentBackground animated:0];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  double v4 = [(REUIRelevanceEngineController *)self->_engineController actionAtIndexPath:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  int v7 = [(NTKUpNextCollectionView *)collectionView cellForItemAtIndexPath:v6];
  id v8 = [(NTKUpNextCollectionViewFlowLayout *)self->_layout layoutAttributesForItemAtIndexPath:v6];

  memset(&v16, 0, sizeof(v16));
  if (v8) {
    [v8 transform3D];
  }
  CATransform3D v14 = v16;
  CATransform3DScale(&v15, &v14, 0.95, 0.95, 1.0);
  CATransform3D v16 = v15;
  id v9 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  CATransform3D v13 = v15;
  v11[2] = __64__NTKUpNextFaceView_collectionView_didHighlightItemAtIndexPath___block_invoke;
  v11[3] = &unk_1E62C06A0;
  id v12 = v7;
  id v10 = v7;
  [v9 animateWithDuration:v11 animations:0.1];
}

void __64__NTKUpNextFaceView_collectionView_didHighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  long long v3 = *(_OWORD *)(a1 + 120);
  void v7[4] = *(_OWORD *)(a1 + 104);
  void v7[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v6;
  [v2 setTransform:v7];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  int v7 = [(NTKUpNextCollectionView *)collectionView cellForItemAtIndexPath:v6];
  id v8 = [(NTKUpNextCollectionViewFlowLayout *)self->_layout layoutAttributesForItemAtIndexPath:v6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  if (v8) {
    [v8 transform3D];
  }
  id v9 = (void *)MEMORY[0x1E4FB1EB0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  long long v17 = v25;
  long long v18 = v26;
  long long v19 = v27;
  long long v20 = v28;
  long long v13 = v21;
  long long v14 = v22;
  long long v15 = v23;
  long long v16 = v24;
  v11[2] = __66__NTKUpNextFaceView_collectionView_didUnhighlightItemAtIndexPath___block_invoke;
  v11[3] = &unk_1E62C06A0;
  id v12 = v7;
  id v10 = v7;
  [v9 animateWithDuration:v11 animations:0.2];
}

void __66__NTKUpNextFaceView_collectionView_didUnhighlightItemAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  long long v3 = *(_OWORD *)(a1 + 120);
  void v7[4] = *(_OWORD *)(a1 + 104);
  void v7[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v6;
  [v2 setTransform:v7];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  double v8 = 0.0;
  if ([v7 numberOfItemsInSection:a5] >= 1 && objc_msgSend(v7, "numberOfSections") - 1 != a5)
  {
    id v9 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v9, v17);
    double v10 = v18;
    double v11 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v11, v16);
    double v8 = v10 + v16[5];
  }
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v8;
  result.right = v14;
  result.bottom = v15;
  result.left = v13;
  result.top = v12;
  return result;
}

- (id)_additionalPrelaunchApplicationIdentifiers
{
  return self->_currentApplicationIdentifiers;
}

- (void)_loadLayoutRules
{
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  memset(v13, 0, sizeof(v13));
  long long v3 = [(NTKFaceView *)self device];
  _LayoutConstants_0(v3, v13);

  long long v4 = [(NTKFaceView *)self complicationLayoutforSlot:@"top-right"];
  utilityComplicationFactorCGFloat y = self->_utilityComplicationFactory;
  [(NTKUpNextFaceView *)self bounds];
  -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](utilityComplicationFactory, "configureComplicationLayout:forSlot:withBounds:", v4, 13);
  id v12 = [(NTKFaceView *)self complicationLayoutforSlot:@"top-left"];

  double v6 = *((double *)&v25 + 1);
  double v8 = *((double *)&v14 + 1);
  double v7 = *(double *)&v15;
  double v9 = *(double *)&v14;
  double v10 = [(NTKFaceView *)self device];
  double v11 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v10, 3, 3, v6, v7, v8, v9, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  [v12 setDefaultLayoutRule:v11 forState:0];
}

- (BOOL)_wantsStatusBarHidden
{
  return [(NTKDigitalFaceView *)self viewMode] == 2;
}

- (void)_applyDataMode
{
  int64_t v3 = [(NTKFaceView *)self dataMode];
  if (v3 != self->_previousDataMode)
  {
    int64_t v4 = v3;
    switch(v3)
    {
      case 1:
        [(REUIRelevanceEngineController *)self->_engineController setWantsLiveDataSources:1];
        [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:1];
        [(NTKUpNextCollectionView *)self->_collectionView setUserInteractionEnabled:1];
        if ([(NTKDigitalFaceView *)self viewMode] == 2)
        {
          [(NTKUpNextFaceView *)self _allowContentViewInteractive:1];
        }
        else
        {
          [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
          [(NTKUpNextFaceView *)self _switchViewModeToDefault];
        }
        [(NTKUpNextFaceView *)self _stopViewResetTimer];
        [(REUIRelevanceEngineController *)self->_engineController makeCurrent];
        goto LABEL_13;
      case 2:
        [(REUIRelevanceEngineController *)self->_engineController setWantsLiveDataSources:0];
        [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:0];
        [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
        [(NTKUpNextCollectionView *)self->_collectionView setUserInteractionEnabled:0];
        [(NTKUpNextFaceView *)self _startViewResetTimer];
        goto LABEL_10;
      case 3:
        [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:0];
        [(NTKUpNextCollectionView *)self->_collectionView setUserInteractionEnabled:0];
        [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
        [(NTKUpNextFaceView *)self _switchViewModeToDefault];
        [(REUIRelevanceEngineController *)self->_engineController setWantsLiveDataSources:0];
        [(NTKUpNextFaceView *)self _stopPositiveDwellForTopElementsTimer];
        goto LABEL_6;
      case 4:
        [(REUIRelevanceEngineController *)self->_engineController setWantsLiveDataSources:0];
        [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:0];
        [(NTKUpNextCollectionView *)self->_collectionView setUserInteractionEnabled:0];
        [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
        [(NTKUpNextFaceView *)self _switchViewModeToDefault];
LABEL_10:
        [(REUIRelevanceEngineController *)self->_engineController resignCurrent];
        [(NTKUpNextFaceView *)self _stopPositiveDwellForTopElementsTimer];
LABEL_13:
        char v5 = 0;
        break;
      case 5:
        char v5 = 1;
        [(REUIRelevanceEngineController *)self->_engineController setWantsLiveDataSources:1];
        [(UITapGestureRecognizer *)self->_viewModeTapGesture setEnabled:0];
        [(NTKUpNextCollectionView *)self->_collectionView setUserInteractionEnabled:0];
        [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
        [(NTKUpNextFaceView *)self _switchViewModeToDefault];
        break;
      default:
LABEL_6:
        char v5 = 1;
        break;
    }
    [(NTKUpNextFaceView *)self _updateVisibilityForCells];
    BOOL v6 = [(NTKUpNextFaceView *)self _applyShouldUseCanonicalContent];
    BOOL v7 = [(NTKUpNextFaceView *)self _applyShowIdealizedContent];
    if ((v5 & 1) != 0 || v6 || v7) {
      [(NTKUpNextFaceView *)self collectionViewDeferralStateChanged];
    }
    else {
      [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
    }
    self->_previousDataMode = v4;
  }
}

- (BOOL)presentedViewControllerShouldBecomeFirstResponder:(id)a3
{
  return a3 != 0;
}

- (void)_handleOrdinaryScreenWake
{
  [(NTKUpNextFaceView *)self _prepareWristRaiseAnimation];
  [(NTKUpNextFaceView *)self _performWristRaiseAnimation];
}

- (void)_prepareWristRaiseAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(NTKUpNextCollectionView *)self->_collectionView visibleCells];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setContentBrightness:0 animated:0.25];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performWristRaiseAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(NTKUpNextCollectionView *)self->_collectionView visibleCells];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setContentBrightness:1 animated:1.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_loadSnapshotContent:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if (self->_snapshotSnapshot)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView reload data and immediatly call completion", buf, 2u);
    }

    self->_BOOL needsReloadedContent = 1;
    [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
    [(NTKUpNextFaceView *)self setNeedsLayout];
    [(NTKUpNextFaceView *)self layoutIfNeeded];
    [(NTKUpNextCollectionView *)self->_collectionView setNeedsLayout];
    [(NTKUpNextCollectionView *)self->_collectionView layoutIfNeeded];
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    uint64_t v6 = +[NTKRelevanceEngineCache sharedCache];
    long long v7 = [v6 canonicalRelevanceEngineIgnoringAppInstallations];

    *(void *)buf = 0;
    long long v25 = buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__0;
    long long v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__0;
    v22[4] = __Block_byref_object_dispose__0;
    id v23 = 0;
    dispatch_group_t v8 = dispatch_group_create();
    long long v9 = [v7 configuration];
    long long v10 = [v9 dataSourceLoader];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke;
    v16[3] = &unk_1E62C06F0;
    long long v17 = @"com.apple.weather.relevance-engine";
    double v11 = v8;
    long long v18 = v11;
    long long v19 = @"com.apple.NanoCalendar";
    long long v20 = v22;
    long long v21 = buf;
    [v10 enumerateDataSourceClassesWithBlock:v16];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_4;
    block[3] = &unk_1E62C0740;
    long long v14 = v22;
    long long v15 = buf;
    block[4] = self;
    double v13 = v4;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke(uint64_t a1, objc_class *a2)
{
  uint64_t v4 = [(id)objc_opt_class() bundleIdentifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__0;
    long long v21 = __Block_byref_object_dispose__0;
    id v22 = objc_alloc_init(a2);
    uint64_t v5 = (void *)v18[5];
    uint64_t v6 = *MEMORY[0x1E4F94A10];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_2;
    _OWORD v13[3] = &unk_1E62C06C8;
    uint64_t v15 = *(void *)(a1 + 56);
    long long v16 = &v17;
    id v14 = *(id *)(a1 + 40);
    [v5 getElementsInSection:v6 withHandler:v13];

    _Block_object_dispose(&v17, 8);
  }
  if ([v4 isEqualToString:*(void *)(a1 + 48)])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__0;
    long long v21 = __Block_byref_object_dispose__0;
    id v22 = objc_alloc_init(a2);
    long long v7 = (void *)v18[5];
    uint64_t v8 = *MEMORY[0x1E4F94A10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_3;
    v9[3] = &unk_1E62C06C8;
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = &v17;
    id v10 = *(id *)(a1 + 40);
    [v7 getElementsInSection:v8 withHandler:v9];

    _Block_object_dispose(&v17, 8);
  }
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = [a2 firstObject];
  if (v8)
  {
    uint64_t v3 = [[NTKUpNextElement alloc] initWithREElement:v8];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = [a2 firstObject];
  if (v8)
  {
    uint64_t v3 = [[NTKUpNextElement alloc] initWithREElement:v8];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_4(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  uint64_t v3 = NTKOrderedUpNextSections();
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = NTKIdentifierForUpNextSection([*(id *)(*((void *)&v21 + 1) + 8 * v9) unsignedIntegerValue]);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];
  [v2 appendSectionsWithIdentifiers:v11];

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  double v13 = v12;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_msgSend(v12, "addObject:");
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    objc_msgSend(v13, "addObject:");
  }
  id v14 = NTKIdentifierForUpNextSection(2);
  if (v14)
  {
    uint64_t v15 = (void *)[v13 copy];
    [v2 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v14];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1168) = 1;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 1176);
  *(void *)(v16 + 1176) = v2;
  id v18 = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 1032) = 1;
  [*(id *)(a1 + 32) _reloadContentIfNeeded];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_5;
  block[3] = &unk_1E62C0718;
  id v20 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __42__NTKUpNextFaceView__loadSnapshotContent___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_prepareForSnapshotting
{
}

- (void)_finalizeForSnapshotting:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView _finalizeForSnapshotting", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NTKUpNextFaceView__finalizeForSnapshotting___block_invoke;
  v7[3] = &unk_1E62C0718;
  id v8 = v4;
  id v6 = v4;
  [(NTKUpNextFaceView *)self _loadSnapshotContent:v7];
}

uint64_t __46__NTKUpNextFaceView__finalizeForSnapshotting___block_invoke(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView generated snapshot snapshot", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4 == 10)
  {
    [(NTKUpNextFaceView *)self _setSiriBlurColor];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(NTKUpNextCollectionView *)self->_collectionView visibleCells];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 setContentImage:self->_cellContentBackground animated:0];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateDisabledDataSources
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = +[NTKSiriDefaults sharedInstance];
  id v5 = [v4 disabledDataSources];
  id v6 = [v3 setWithSet:v5];

  uint64_t v7 = [(REUIRelevanceEngineController *)self->_engineController disabledDataSources];
  uint64_t v8 = (void *)[v6 mutableCopy];
  [v8 minusSet:v7];
  uint64_t v9 = (void *)[v7 mutableCopy];
  [v9 minusSet:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(REUIRelevanceEngineController *)self->_engineController setDataSource:*(void *)(*((void *)&v24 + 1) + 8 * v14++) enabled:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[REUIRelevanceEngineController setDataSource:enabled:](self->_engineController, "setDataSource:enabled:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), 1, (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }

  self->_BOOL needsReloadedContent = 1;
  [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
}

- (BOOL)_shouldUseCanonicalContent
{
  if (self->_collectionView)
  {
    BOOL v3 = [(NTKFaceView *)self showsCanonicalContent];
    if (v3) {
      LOBYTE(v3) = [(NTKFaceView *)self dataMode] == 3;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)_applyShouldUseCanonicalContent
{
  return 0;
}

- (BOOL)_applyShowIdealizedContent
{
  int64_t v3 = [(NTKFaceView *)self dataMode];
  unsigned int v4 = (v3 == 3) ^ [(REUIRelevanceEngineController *)self->_engineController wantsIdealizedContent];
  if (v4 == 1)
  {
    [(REUIRelevanceEngineController *)self->_engineController setWantsIdealizedContent:v3 == 3];
    self->_BOOL needsReloadedContent = 1;
    [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
  }
  return v4;
}

- (void)_applyShowsLockedUI
{
  if ([(NTKFaceView *)self showsLockedUI] && [(NTKDigitalFaceView *)self viewMode] == 2) {
    [(NTKUpNextFaceView *)self _switchViewModeForCurrentMode:2 animated:0];
  }
  [(NTKUpNextFaceView *)self _dismissPresentedViewControllerIfNecessary:0];
}

- (void)_becameActiveFace
{
  [(REUIRelevanceEngineController *)self->_engineController setAllowsLocationUse:1];
  engineController = self->_engineController;
  [(REUIRelevanceEngineController *)engineController makeCurrent];
}

- (void)_becameInactiveFace
{
  [(REUIRelevanceEngineController *)self->_engineController setAllowsLocationUse:0];
  engineController = self->_engineController;
  [(REUIRelevanceEngineController *)engineController resignCurrent];
}

- (BOOL)allowsHomeScreenTransition
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([(NTKDigitalFaceView *)self viewMode] == 2)
  {
    id v6 = [(NTKFaceView *)self timeView];
    [v6 bounds];
    CGRect v18 = CGRectInset(v17, -6.0, -6.0);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
    uint64_t v11 = [(NTKFaceView *)self timeView];
    [v5 locationInView:v11];
    v16.CGFloat x = v12;
    v16.CGFloat y = v13;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    BOOL v14 = CGRectContainsPoint(v19, v16);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setViewMode:(int64_t)a3
{
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v2 = [(NTKFaceView *)self timeView];
  [v2 setHidden:0];
}

- (BOOL)_shouldDeferUpdate
{
  unint64_t v3 = [(NTKFaceView *)self dataMode];
  if (v3 <= 4 && ((1 << v3) & 0x16) != 0)
  {
    [(NTKFaceView *)self isFrozen];
  }
  else if ([(NTKFaceView *)self isFrozen])
  {
    return 1;
  }
  if (self->_collectionView && !self->_isInflightScroll) {
    return self->_isApplyingSnapshot;
  }
  return 1;
}

- (void)engineController:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = (void (**)(void))a5;
  uint64_t v9 = _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "[datasource] engine requested batch update", v10, 2u);
  }

  if (v7)
  {
    self->_isApplyingBatchUpdate = 1;
    v7[2](v7);
    self->_isApplyingBatchUpdate = 0;
  }
  if (v8) {
    v8[2](v8);
  }
  self->_hasDeferredUpdate = 1;
  [(NTKUpNextFaceView *)self collectionViewDeferralStateChanged];
}

- (BOOL)engineController:(id)a3 isElementAtIndexPathVisible:(id)a4
{
  if (self->_needsReloadedContent) {
    return 0;
  }
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  collectionView = self->_collectionView;
  id v7 = a4;
  uint64_t v8 = [(NTKUpNextCollectionView *)collectionView indexPathsForVisibleItems];
  uint64_t v9 = [v5 setWithArray:v8];

  LOBYTE(v8) = [v9 containsObject:v7];
  return (char)v8;
}

- (void)engineController:(id)a3 didReloadContent:(id)a4 withIdentifier:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v17 indexPathForElementWithIdentifier:v9];
  uint64_t v11 = [v17 _elementAtIndexPath:v10];
  if (v11)
  {
    CGFloat v12 = +[NTKUpNextElement elementWithREElement:v11];
    if (self->_isApplyingBatchUpdate)
    {
      [(NSMutableSet *)self->_reloadedElements addObject:v12];
    }
    else
    {
      CGFloat v13 = [(UICollectionViewDiffableDataSource *)self->_collectionViewDataSource indexPathForItemIdentifier:v12];
      BOOL v14 = [(NTKUpNextCollectionView *)self->_collectionView cellForItemAtIndexPath:v13];
      [v14 configureWithContent:v8];
      id v15 = [v17 indexPathForElementWithIdentifier:v9];
      CGPoint v16 = [v17 elementAtIndexPath:v15];
      [(NTKUpNextFaceView *)self _replaceDataSourceElement:v12 withReloadedREElement:v16];
    }
  }
}

- (void)engineController:(id)a3 didReloadElement:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6)
  {
    if (self->_isApplyingBatchUpdate)
    {
      id v7 = +[NTKUpNextElement elementWithREElement:v6];
      [(NSMutableSet *)self->_reloadedElements addObject:v7];
    }
    else
    {
      self->_hasDeferredUpdate = 1;
      [(NTKUpNextFaceView *)self collectionViewDeferralStateChanged];
    }
  }
}

- (void)engineController:(id)a3 didRemoveContent:(id)a4 atIndexPath:(id)a5
{
  id v6 = objc_msgSend(a3, "_elementAtIndexPath:", a5, a4);
  if (v6)
  {
    id v8 = v6;
    id v7 = +[NTKUpNextElement elementWithREElement:v6];
    [(NSMutableSet *)self->_reloadedElements removeObject:v7];

    id v6 = v8;
  }
}

- (void)engineControllerDidFinishUpdatingRelevance:(id)a3
{
  if (!self->_engineInitiallyLoaded)
  {
    self->_engineInitiallyLoaded = 1;
    unsigned int v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKUpNextFaceView engine loaded, can snapshot now", v5, 2u);
    }

    self->_BOOL needsReloadedContent = 1;
    [(NTKUpNextFaceView *)self _reloadContentIfNeeded];
  }
}

- (CGPoint)_defaultPointForDefaultMode
{
  if (self->_engineInitiallyLoaded
    && (!NTKIsDaemonOrFaceSnapshotService() || self->_engineInitiallyLoaded)
    && [(NTKUpNextCollectionView *)self->_collectionView numberOfItemsInSection:2])
  {
    unint64_t v3 = [(NTKFaceView *)self device];
    _LayoutConstants_0(v3, v14);
    double v4 = v15;

    layout = self->_layout;
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:2];
    id v7 = [(NTKUpNextCollectionViewFlowLayout *)layout flowLayoutAttributesForItemAtIndexPath:v6];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    double v12 = v11 - v4;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v13 = v9;
  result.CGFloat y = v12;
  result.CGFloat x = v13;
  return result;
}

- (void)_setViewMode:(int64_t)a3 scroll:(BOOL)a4 scrollToPoint:(CGPoint)a5 secondaryPoint:(CGPoint)a6 force:(BOOL)a7 velocity:(double)a8 animated:(BOOL)a9
{
  double y = a5.y;
  double x = a5.x;
  BOOL v11 = a4;
  if (!a3 || a7 || [(NTKDigitalFaceView *)self viewMode] != a3)
  {
    self->_previousViewMode = [(NTKDigitalFaceView *)self viewMode];
    [(NTKDigitalFaceView *)self setViewMode:a3 updateTimeViewStyle:0];
    if (self->_collectionView)
    {
      [(NTKUpNextCollectionViewFlowLayout *)self->_layout setSnappingEnabled:a3 == 2];
      if (a3 == 2)
      {
        [(NTKUpNextCollectionViewFlowLayout *)self->_layout setIndexPathToSnapTo:0];
        [(NTKUpNextFaceView *)self _stopPositiveDwellForTopElementsTimer];
      }
      else
      {
        [(NTKUpNextFaceView *)self _resetVisibilityForCells];
      }
      id modeTransitionCompletion = self->_modeTransitionCompletion;
      if (modeTransitionCompletion)
      {
        double v15 = (void (*)(void))*((void *)modeTransitionCompletion + 2);
        v15();
      }
      else
      {
        -[NTKUpNextFaceView _cleanupAfterSettingViewMode:scroll:targetOffset:needsLayout:](self, "_cleanupAfterSettingViewMode:scroll:targetOffset:needsLayout:", a3, v11, 1, x, y);
      }
    }
  }
}

- (void)_cleanupAfterSettingViewMode:(int64_t)a3 scroll:(BOOL)a4 targetOffset:(CGPoint)a5 needsLayout:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  double y = a5.y;
  double x = a5.x;
  self->_cancelInflightScroll = 0;
  BOOL isInflightScroll = self->_isInflightScroll;
  self->_BOOL isInflightScroll = 0;
  self->_isAnimating = 0;
  id modeTransitionCompletion = self->_modeTransitionCompletion;
  self->_id modeTransitionCompletion = 0;

  id modeTransitionApplier = self->_modeTransitionApplier;
  self->_id modeTransitionApplier = 0;

  [(NTKUpNextFaceView *)self _allowContentViewInteractive:a3 == 2];
  uint64_t v49 = 0;
  memset(v48, 0, sizeof(v48));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  memset(v41, 0, sizeof(v41));
  memset(v39, 0, sizeof(v39));
  double v15 = [(NTKFaceView *)self device];
  _LayoutConstants_0(v15, v39);

  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setUseFixedLowTransitionLayout:0];
  if (!v6) {
    goto LABEL_26;
  }
  CGPoint v16 = (double *)&v44 + 1;
  if (a3)
  {
    CGPoint v16 = (double *)&v45;
    id v17 = (double *)&v46;
  }
  else
  {
    id v17 = (double *)&v45 + 1;
  }
  if (a3) {
    CGRect v18 = (double *)&v47;
  }
  else {
    CGRect v18 = (double *)&v46 + 1;
  }
  if (a3) {
    CGRect v19 = (double *)v48;
  }
  else {
    CGRect v19 = (double *)&v47 + 1;
  }
  double v20 = 1.0;
  if (a3) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.0;
  }
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setLowTransitionScale:*v16];
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setHighTransitionScale:*v17];
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setHighTransitionShift:*v18];
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setLowTransitionShift:*v19];
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopItemsAlpha:v21];
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setHeaderAlpha:v21];
  layout = self->_layout;
  if (a3)
  {
    id v23 = [(NTKFaceView *)self device];
    os_unfair_lock_lock((os_unfair_lock_t)&InteractiveModeTopItemShift___lock);
    id WeakRetained = objc_loadWeakRetained(&InteractiveModeTopItemShift___cachedDevice);
    long long v25 = (void *)&unk_1E9FA6000;
    if (WeakRetained)
    {
      long long v26 = WeakRetained;
      id v27 = objc_loadWeakRetained(&InteractiveModeTopItemShift___cachedDevice);
      if (v27 == v23)
      {
        uint64_t v28 = [v23 version];
        uint64_t v29 = InteractiveModeTopItemShift___previousCLKDeviceVersion;

        BOOL v30 = v28 == v29;
        long long v25 = &unk_1E9FA6000;
        if (v30)
        {
LABEL_21:
          os_unfair_lock_unlock((os_unfair_lock_t)&InteractiveModeTopItemShift___lock);
          double v33 = *(double *)&InteractiveModeTopItemShift_interactiveModeShiftValue;

          [(NTKUpNextCollectionViewFlowLayout *)layout setTopItemsShift:v33];
          double v20 = 0.0;
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    id v31 = objc_storeWeak(&InteractiveModeTopItemShift___cachedDevice, v23);
    v25[194] = [v23 version];

    __InteractiveModeTopItemShift_block_invoke(v32, v23);
    goto LABEL_21;
  }
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopItemsShift:*((double *)&v42 + 1)];
LABEL_22:
  id v34 = [(NTKFaceView *)self complicationContainerView];
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v38[0] = *MEMORY[0x1E4F1DAB8];
  v38[1] = v35;
  v38[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v34 setTransform:v38];

  [(NTKUpNextFaceView *)self _layoutTimeLabelForViewMode:a3];
  [(NTKUpNextFaceView *)self _layoutTimeLabelPlatterViewMode:a3];
  id v36 = (double *)v41;
  if (!a3) {
    id v36 = (double *)&v40 + 1;
  }
  [(NTKUpNextCollectionViewFlowLayout *)self->_layout setTopOffsetForScrolling:*v36];
  uint64_t v37 = [(NTKFaceView *)self complicationContainerView];
  [v37 setAlpha:v20];

  if (v7) {
    -[NTKUpNextCollectionView setContentOffset:animated:](self->_collectionView, "setContentOffset:animated:", 0, x, y);
  }
LABEL_26:
  [(NTKUpNextFaceView *)self _updateVisibilityForCells];
  if (isInflightScroll) {
    [(NTKUpNextFaceView *)self collectionViewDeferralStateChanged];
  }
}

- (void)_allowContentViewInteractive:(BOOL)a3
{
}

- (void)_layoutTimeLabelPlatterViewMode:(int64_t)a3
{
  [(NTKUpNextFaceView *)self bounds];
  -[NTKUpNextFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(NTKFaceView *)self timeView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = [(NTKFaceView *)self device];
  _LayoutConstants_0(v14, v35);
  double v15 = v7 + v37;
  double v16 = v9 + v36;
  double v17 = v11 - (v37 + v39);
  double v18 = v13 - (v36 + v38);

  -[UIView setFrame:](self->_timeLabelPlatter, "setFrame:", v15, v16, v17, v18);
  CGRect v19 = [(UIView *)self->_timeLabelPlatter layer];
  [(UIView *)self->_timeLabelPlatter frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [(NTKUpNextFaceView *)self bounds];
  objc_msgSend(v19, "setContentsRect:", NTKUpNextUnitRectForFrameInBounds(v21, v23, v25, v27, v28, v29, v30, v31));

  int v32 = [v34 isEqual:self->_timeLabelSmallInUpperRightCornerStyle];
  double v33 = 0.0;
  if (v32) {
    double v33 = 1.0;
  }
  [(UIView *)self->_timeLabelPlatter setAlpha:v33];
}

- (void)_layoutTimeLabelForViewMode:(int64_t)a3
{
  [(NTKUpNextFaceView *)self bounds];
  -[NTKUpNextFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(NTKFaceView *)self timeView];
  [v5 setStyle:v11];

  double v6 = [(NTKFaceView *)self timeView];
  double v7 = [v11 layoutRule];
  double v8 = [(NTKFaceView *)self timeView];
  [v8 bounds];
  objc_msgSend(v7, "calculateLayoutFrameForBoundsSize:", v9, v10);
  objc_msgSend(v6, "ntk_setBoundsAndPositionFromFrame:");
}

- (void)updateTimeLabelBackground
{
  id v2 = self->_timeLabelPlatter;
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  id v5 = [(UIView *)v2 layer];

  if (IsReduceTransparencyEnabled) {
    [MEMORY[0x1E4FB1618] _externalSystemDarkGrayColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.333 alpha:0.75];
  }
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

- (void)_handleViewModeTapGesture:(id)a3
{
  if ([a3 state] == 3 && !self->_isAnimating)
  {
    int64_t v4 = [(NTKDigitalFaceView *)self viewMode];
    [(NTKUpNextFaceView *)self _switchViewModeForCurrentMode:v4 animated:1];
  }
}

- (void)_switchViewModeForCurrentMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 2)
  {
    [(NTKUpNextFaceView *)self _defaultPointForDefaultMode];
    -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 0, 1, 0, v4);
    [(NTKUpNextFaceView *)self _allowContentViewInteractive:0];
  }
  else if (!a3)
  {
    [(NTKUpNextCollectionViewFlowLayout *)self->_layout setSnappingEnabled:1];
    [(NTKUpNextFaceView *)self _allowContentViewInteractive:1];
    if ([(NTKUpNextCollectionView *)self->_collectionView numberOfSections] < 1)
    {
      id v30 = 0;
    }
    else
    {
      id v30 = 0;
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = [(NTKUpNextCollectionView *)self->_collectionView numberOfItemsInSection:v6];
        double v8 = [(NTKUpNextCollectionViewFlowLayout *)self->_layout topElementIndexPath];
        uint64_t v9 = [v8 section];

        if (v6 < v9 && v7 >= 1)
        {
          uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 - 1 inSection:v6];

          id v30 = (id)v11;
        }
        ++v6;
      }
      while (v6 < [(NTKUpNextCollectionView *)self->_collectionView numberOfSections]);
    }
    layout = self->_layout;
    [(NTKUpNextCollectionView *)self->_collectionView contentOffset];
    -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](layout, "targetContentOffsetForProposedContentOffset:");
    double v15 = v13;
    double v16 = v14;
    id v17 = v30;
    if (v30)
    {
      double v18 = [(NTKUpNextCollectionViewFlowLayout *)self->_layout flowLayoutAttributesForItemAtIndexPath:v30];
      CGRect v19 = self->_layout;
      [v18 frame];
      -[NTKUpNextCollectionViewFlowLayout targetContentOffsetForProposedContentOffset:](v19, "targetContentOffsetForProposedContentOffset:");
      double v21 = v20;
      double v23 = v22;

      id v17 = v30;
    }
    else
    {
      double v23 = v14;
      double v21 = v13;
    }
    id v31 = v17;
    BOOL v24 = v17 != 0;
    BOOL v25 = self->_lastCrownVelocity < 0.0;
    if (v24 && v25) {
      double v26 = v15;
    }
    else {
      double v26 = v21;
    }
    if (v24 && v25) {
      double v27 = v16;
    }
    else {
      double v27 = v23;
    }
    if (v24 && v25) {
      double v28 = v23;
    }
    else {
      double v28 = v16;
    }
    if (v24 && v25) {
      double v29 = v21;
    }
    else {
      double v29 = v15;
    }
    -[NTKUpNextFaceView _setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:](self, "_setViewMode:scroll:scrollToPoint:secondaryPoint:force:velocity:animated:", 2, 1, 0, v4, v29, v28, v26, v27);
  }
}

- (void)elementAction:(id)a3 didFinishTask:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 setDelegate:0];
  if (NTKInternalBuild(v5, v6, v7, v8))
  {
    if (CFPreferencesGetAppBooleanValue(@"EnableDemoMode", @"com.apple.NanoTimeKit.face", 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = REUpNextDemoUserDefaults();
        uint64_t v10 = [v9 arrayForKey:@"IntentsPerformed"];
        uint64_t v11 = (void *)v10;
        double v12 = (void *)MEMORY[0x1E4F1CBF0];
        if (v10) {
          double v12 = (void *)v10;
        }
        id v13 = v12;

        double v14 = [v4 bundleIdentifier];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v23;
          while (2)
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              double v20 = *(void **)(*((void *)&v22 + 1) + 8 * v19);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v20, "isEqualToString:", v14, (void)v22) & 1) != 0)
              {
                double v21 = v15;
                goto LABEL_17;
              }
              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        double v21 = [v15 arrayByAddingObject:v14];
        [v9 willChangeValueForKey:@"IntentsPerformed"];
        [v9 setObject:v21 forKey:@"IntentsPerformed"];
        [v9 didChangeValueForKey:@"IntentsPerformed"];
LABEL_17:
      }
    }
  }
}

- (void)elementAction:(id)a3 wantsViewControllerDisplayed:(id)a4
{
  id v5 = a4;
  id v6 = [(NTKFaceView *)self delegate];
  [v6 faceViewWantsToPresentViewController:v5];
}

- (void)elementAction:(id)a3 wantsToPerformTapActionForComplicationSlot:(id)a4
{
  id v4 = [(NTKFaceView *)self detachedComplicationDisplayWrapperForSlot:a4];
  [v4 performTap];
}

- (id)intentActionWantsBackgroundImageForAlert:(id)a3
{
  return self->_cellContentBackground;
}

- (id)intentActionWantsViewToBlurForAlert:(id)a3
{
  return 0;
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _applyBreathingFraction:forCustomEditMode:slot:](&v13, sel__applyBreathingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4 != 10)
  {
    double v8 = NTKLargeElementScaleForBreathingFraction(a3);
    memset(&v12, 0, sizeof(v12));
    CGAffineTransformMakeScale(&v12, v8, v8);
    uint64_t v9 = [(NTKFaceView *)self foregroundContainerView];
    CGAffineTransform v11 = v12;
    [v9 setTransform:&v11];

    scalableView = self->_scalableView;
    CGAffineTransform v11 = v12;
    [(UIView *)scalableView setTransform:&v11];
  }
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKUpNextFaceView;
  -[NTKFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v15, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4)
  {
    double v8 = NTKScaleForRubberBandingFraction(a3);
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v8, v8);
    uint64_t v9 = [(NTKFaceView *)self foregroundContainerView];
    CGAffineTransform v13 = v14;
    [v9 setTransform:&v13];

    scalableView = self->_scalableView;
    CGAffineTransform v13 = v14;
    [(UIView *)scalableView setTransform:&v13];
    double v11 = NTKAlphaForRubberBandingFraction(a3);
    CGAffineTransform v12 = [(NTKFaceView *)self foregroundContainerView];
    [v12 setAlpha:v11];

    [(UIView *)self->_scalableView setAlpha:v11];
  }
}

- (void)_setSiriBlurColor
{
  id v2 = [(NTKFaceView *)self faceColorPalette];
  SiriBlurImageForColor(v2);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a6 == 10)
  {
    CLKCompressFraction();
    double v9 = v8;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [(NTKUpNextCollectionView *)self->_collectionView visibleCells];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v15;
            uint64_t v17 = [(NTKFaceView *)self interpolatedColorPalette];
            [(NTKUpNextFaceView *)self _applyTransitionWithFraction:v17 interpolatedPalette:v16 onCell:v9];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void)_prepareForEditing
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUpNextFaceView;
  [(NTKFaceView *)&v5 _prepareForEditing];
  scalableView = self->_scalableView;
  id v4 = [(NTKFaceView *)self timeView];
  [(UIView *)scalableView addSubview:v4];
}

- (void)_cleanupAfterEditing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NTKUpNextFaceView;
  [(NTKFaceView *)&v14 _cleanupAfterEditing];
  unint64_t v3 = [(NTKFaceView *)self timeView];
  [(NTKUpNextFaceView *)self addSubview:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NTKUpNextCollectionView *)self->_collectionView visibleCells];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 enumerateContentsLayersWithBlock:&__block_literal_global_214];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

uint64_t __41__NTKUpNextFaceView__cleanupAfterEditing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAnimationForKey:@"colorTransition"];
}

- (void)_applyTransitionWithFraction:(double)a3 interpolatedPalette:(id)a4 onCell:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [a4 fromPalette];
  SiriBlurImageForColor(v7);
}

uint64_t __77__NTKUpNextFaceView__applyTransitionWithFraction_interpolatedPalette_onCell___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAnimationForKey:@"colorTransition"];
}

uint64_t __77__NTKUpNextFaceView__applyTransitionWithFraction_interpolatedPalette_onCell___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addAnimation:*(void *)(a1 + 32) forKey:@"colorTransition"];
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v10 = [(NTKFaceView *)self device];
  _LayoutConstants_0(v10, &v24);

  if ((unint64_t)(a3 - 2) < 2)
  {
    p_timeLabelSmallInUpperRightCornerStyle = &self->_timeLabelSmallInUpperRightCornerStyle;
    timeLabelSmallInUpperRightCornerStyle = self->_timeLabelSmallInUpperRightCornerStyle;
    if (!timeLabelSmallInUpperRightCornerStyle)
    {
      objc_super v14 = [MEMORY[0x1E4F19A50] compactSoftFontOfSize:*(double *)&v26 weight:*MEMORY[0x1E4FB09E0]];
      if (*((double *)&v35 + 1) > 0.0)
      {
        v38.origin.double x = x;
        v38.origin.double y = y;
        v38.size.double width = width;
        v38.size.double height = height;
        CGRect v39 = CGRectInset(v38, *((double *)&v35 + 1) * 0.5, 0.0);
        double x = v39.origin.x;
        double y = v39.origin.y;
        double width = v39.size.width;
        double height = v39.size.height;
      }
      double v21 = *(double *)&v28;
      objc_super v15 = [(NTKFaceView *)self device];
      uint64_t v22 = +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:withBaselineY:withFont:forDevice:", v14, v15, x, y, width, height, v21);
      long long v18 = *p_timeLabelSmallInUpperRightCornerStyle;
      *p_timeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v22;
      goto LABEL_9;
    }
LABEL_10:
    long long v11 = timeLabelSmallInUpperRightCornerStyle;
    goto LABEL_11;
  }
  if ((unint64_t)a3 <= 1)
  {
    p_timeLabelSmallInUpperRightCornerStyle = &self->_timeLabelDefaultStyle;
    timeLabelSmallInUpperRightCornerStyle = self->_timeLabelDefaultStyle;
    if (!timeLabelSmallInUpperRightCornerStyle)
    {
      objc_super v14 = [MEMORY[0x1E4F19A50] compactSoftFontOfSize:*((double *)&v25 + 1) weight:*MEMORY[0x1E4FB09D0]];
      objc_super v15 = [(NTKFaceView *)self device];
      double v16 = NTKDigitalTimeLabelStyleWideRightSideMargin(v15);
      double v17 = *((double *)&v27 + 1);
      long long v18 = [(NTKFaceView *)self device];
      uint64_t v19 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 1, v14, v18, x, y, width, height, v16, v17);
      long long v20 = *p_timeLabelSmallInUpperRightCornerStyle;
      *p_timeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v19;

LABEL_9:
      timeLabelSmallInUpperRightCornerStyle = *p_timeLabelSmallInUpperRightCornerStyle;
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  return v11;
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = [v7 pigmentEditOption];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__0;
  double v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  double v9 = [(NTKFaceView *)self faceColorPalette];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__NTKUpNextFaceView__swatchImageForColorOption_size___block_invoke;
  v16[3] = &unk_1E62C07B0;
  void v16[4] = &v17;
  [v9 executeWithOption:v8 block:v16];

  long long v10 = (void *)v18[5];
  if (!v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKUpNextFaceView;
    uint64_t v11 = -[NTKFaceView _swatchImageForColorOption:size:](&v15, sel__swatchImageForColorOption_size_, v8, width, height);
    long long v12 = (void *)v18[5];
    v18[5] = v11;

    long long v10 = (void *)v18[5];
  }
  id v13 = v10;
  _Block_object_dispose(&v17, 8);

  return v13;
}

uint64_t __53__NTKUpNextFaceView__swatchImageForColorOption_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isSiriColor];
  if (result) {
    NTKImageNamed(@"SiriColorSwatch");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotSnapshot, 0);
  objc_storeStrong(&self->_modeTransitionCompletion, 0);
  objc_storeStrong(&self->_modeTransitionApplier, 0);
  objc_storeStrong((id *)&self->_dwellIndexPathes, 0);
  objc_storeStrong((id *)&self->_applicationIdentifierUpdateScheduler, 0);
  objc_storeStrong((id *)&self->_currentApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_reloadedElements, 0);
  objc_storeStrong((id *)&self->_scalableView, 0);
  objc_storeStrong((id *)&self->_timeLabelPlatter, 0);
  objc_storeStrong((id *)&self->_cellContentBackground, 0);
  objc_storeStrong((id *)&self->_complicationDisplays, 0);
  objc_storeStrong((id *)&self->_buttonPressTimer, 0);
  objc_storeStrong((id *)&self->_wheelDelayTimer, 0);
  objc_storeStrong((id *)&self->_wakeWheelTimer, 0);
  objc_storeStrong((id *)&self->_positiveDwellForTopElementsTimer, 0);
  objc_storeStrong((id *)&self->_viewResetTimer, 0);
  objc_storeStrong((id *)&self->_viewModeTapGesture, 0);
  objc_storeStrong((id *)&self->_engineController, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_utilityComplicationFactory, 0);
  objc_storeStrong((id *)&self->_timeLabelSmallInUpperRightCornerStyle, 0);
  objc_storeStrong((id *)&self->_timeLabelDefaultStyle, 0);
}

- (void)updateCollectionViewSnapshotAnimated:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_FAULT, "NTKUpNextUpdateOffMainThread: UpNext updates need to occur on the main queue", v1, 2u);
}

@end