@interface VKCImageSubjectHighlightView
+ (BOOL)visualLookUpYear3InvocationEnabled;
- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange;
- (BOOL)analysisDelayTimerActive;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)glowLayerWasActiveOnLift;
- (BOOL)isHidingMenuController;
- (BOOL)isLiftingEmptyItemArray;
- (BOOL)isLivePhoto;
- (BOOL)isLivePhotoCheckCompleted;
- (BOOL)isSelectAllActive;
- (BOOL)shouldShowCalloutOnDragCancel;
- (BOOL)subjectAnalysisCompleteWhenTouchesBegan;
- (BOOL)subjectInteractionInProgress;
- (BOOL)subjectViewUserInteractionDisabled;
- (BOOL)tapToSelectModeEnabled;
- (CALayer)colorMaskLayer;
- (CGImage)colorMaskImage;
- (CGPoint)dragInteractionStartLocation;
- (CGRect)subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:(BOOL)a3;
- (CGRect)videoPreviewNormalizedCropRect;
- (NSDate)calloutStartTime;
- (NSDate)livePhotoStartTime;
- (UIDragInteraction)dragInteraction;
- (UIImageView)currentLiftImageView;
- (UILongPressGestureRecognizer)livePhotoPlayGR;
- (UIPanGestureRecognizer)coyotePanGR;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (UITapGestureRecognizer)tapGR;
- (UITraitChangeRegistration)traitChangeRegistration;
- (VKCImageSubjectHighlightView)initWithFrame:(CGRect)a3;
- (VKCImageSubjectHighlightViewDelegate)delegate;
- (VKCRemoveBackgroundVideoPreviewResult)videoPreview;
- (VKCSubjectLiftView)currentLiftView;
- (_UIStickerPickerViewController)stickerPickerViewController;
- (double)dragInteractionStartTime;
- (id)animationWithDuration:(double)a3 fromValue:(id)a4 toValue:(id)a5 key:(id)a6;
- (id)createItemProvider;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)springAnimationWithFromValue:(id)a3 toValue:(id)a4 key:(id)a5;
- (id)stringForHighlightState:(unint64_t)a3;
- (id)targetedPreviewForCurrentSubject;
- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3;
- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4;
- (unint64_t)subjectHighlightState;
- (void)_addSticker;
- (void)_addSticker:(id)a3;
- (void)_configureGlowWithShowBurst:(BOOL)a3 burstPoint:(CGPoint)a4;
- (void)_define:(id)a3;
- (void)_dismissCard;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_presentStickerPickerViewController;
- (void)_selectAllSubjects:(id)a3;
- (void)_share;
- (void)_share:(id)a3;
- (void)_shareHeics:(id)a3;
- (void)_tempGenerateStickerFromLivePhotoIfNecessaryWithProgress:(id)a3;
- (void)addSticker;
- (void)beginImageSubjectAnalysisWithDelayIfNecessary;
- (void)buildMenuWithBuilder:(id)a3;
- (void)copy:(id)a3;
- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didTap:(id)a3;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)handleCancelForUndraggedLiftForInteraction:(id)a3;
- (void)hideCalloutMenuIfNecessary;
- (void)hideCalloutMenuIfNecessaryWithClearSelectAll:(BOOL)a3;
- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7;
- (void)livePhotoCoyotePan:(id)a3;
- (void)livePhotoLongPress:(id)a3;
- (void)menuControllerWillHide:(id)a3;
- (void)selectAndShowCalloutForTapToSelectModeAtPoint:(CGPoint)a3;
- (void)setAnalysisDelayTimerActive:(BOOL)a3;
- (void)setCalloutStartTime:(id)a3;
- (void)setColorMaskImage:(CGImage *)a3;
- (void)setColorMaskLayer:(id)a3;
- (void)setCoyotePanGR:(id)a3;
- (void)setCurrentLiftImageView:(id)a3;
- (void)setCurrentLiftView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragInteraction:(id)a3;
- (void)setDragInteractionStartLocation:(CGPoint)a3;
- (void)setDragInteractionStartTime:(double)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setGlowLayerActive:(BOOL)a3;
- (void)setGlowLayerWasActiveOnLift:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsHidingMenuController:(BOOL)a3;
- (void)setIsLiftingEmptyItemArray:(BOOL)a3;
- (void)setIsLivePhoto:(BOOL)a3;
- (void)setIsLivePhotoCheckCompleted:(BOOL)a3;
- (void)setIsSelectAllActive:(BOOL)a3;
- (void)setLivePhotoPlayGR:(id)a3;
- (void)setLivePhotoStartTime:(id)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)setRecognitionResult:(id)a3;
- (void)setShouldShowCalloutOnDragCancel:(BOOL)a3;
- (void)setStickerPickerViewController:(id)a3;
- (void)setSubjectAnalysisCompleteWhenTouchesBegan:(BOOL)a3;
- (void)setSubjectContext:(id)a3;
- (void)setSubjectHighlightState:(unint64_t)a3;
- (void)setSubjectHighlightState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setSubjectInteractionInProgress:(BOOL)a3;
- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3;
- (void)setTapGR:(id)a3;
- (void)setTapToSelectModeEnabled:(BOOL)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setVideoPreview:(id)a3;
- (void)showCalloutMenuAtLocation:(CGPoint)a3 checkDelegate:(BOOL)a4 showPulse:(BOOL)a5;
- (void)showSharingPaneForURL:(id)a3 sourceRect:(CGRect)a4;
- (void)stickerPickerViewControllerDidDismiss;
- (void)stickerPickerViewControllerDidLoad;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)traitStyleDidChange;
- (void)updateSubjectInteractionInProgressIfNecessary;
@end

@implementation VKCImageSubjectHighlightView

+ (BOOL)visualLookUpYear3InvocationEnabled
{
  if (visualLookUpYear3InvocationEnabled_onceToken != -1) {
    dispatch_once(&visualLookUpYear3InvocationEnabled_onceToken, &__block_literal_global_9);
  }
  return visualLookUpYear3InvocationEnabled_visualLookUpYear3InvocationEnabled;
}

uint64_t __66__VKCImageSubjectHighlightView_visualLookUpYear3InvocationEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  visualLookUpYear3InvocationEnabled_visualLookUpYear3InvocationEnabled = result;
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  CGImageRelease(self->_colorMaskImage);
  if (self->_traitChangeRegistration) {
    -[VKCImageSubjectHighlightView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
  }
  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectHighlightView;
  [(VKCImageSubjectHighlightView *)&v4 dealloc];
}

- (VKCImageSubjectHighlightView)initWithFrame:(CGRect)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VKCImageSubjectHighlightView;
  v3 = -[VKCImageSubjectBaseView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v3 action:sel_livePhotoLongPress_];
    livePhotoPlayGR = v3->_livePhotoPlayGR;
    v3->_livePhotoPlayGR = (UILongPressGestureRecognizer *)v4;

    [(UILongPressGestureRecognizer *)v3->_livePhotoPlayGR setMinimumPressDuration:0.325];
    [(UILongPressGestureRecognizer *)v3->_livePhotoPlayGR setEnabled:0];
    [(VKCImageSubjectHighlightView *)v3 addGestureRecognizer:v3->_livePhotoPlayGR];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v3 action:sel_livePhotoCoyotePan_];
    coyotePanGR = v3->_coyotePanGR;
    v3->_coyotePanGR = (UIPanGestureRecognizer *)v6;

    [(UIPanGestureRecognizer *)v3->_coyotePanGR setDelegate:v3];
    [(UIPanGestureRecognizer *)v3->_coyotePanGR setEnabled:0];
    [(UIPanGestureRecognizer *)v3->_coyotePanGR setDelaysTouchesBegan:0];
    [(UIPanGestureRecognizer *)v3->_coyotePanGR setDelaysTouchesEnded:0];
    [(VKCImageSubjectHighlightView *)v3 addGestureRecognizer:v3->_coyotePanGR];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:v3];
    dragInteraction = v3->_dragInteraction;
    v3->_dragInteraction = (UIDragInteraction *)v8;

    [(VKCImageSubjectHighlightView *)v3 addInteraction:v3->_dragInteraction];
    +[VKCInternalSettings subjectDragLiftDelay];
    -[UIDragInteraction _setLiftDelay:](v3->_dragInteraction, "_setLiftDelay:");
    +[VKCInternalSettings subjectDragCancellationDelay];
    -[UIDragInteraction _setCancellationDelay:](v3->_dragInteraction, "_setCancellationDelay:");
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_didTap_];
    tapGR = v3->_tapGR;
    v3->_tapGR = (UITapGestureRecognizer *)v10;

    [(UITapGestureRecognizer *)v3->_tapGR setEnabled:0];
    [(VKCImageSubjectHighlightView *)v3 addGestureRecognizer:v3->_tapGR];
    v25[0] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v13 = [(VKCImageSubjectHighlightView *)v3 registerForTraitChanges:v12 withAction:sel_traitStyleDidChange];
    traitChangeRegistration = v3->_traitChangeRegistration;
    v3->_traitChangeRegistration = (UITraitChangeRegistration *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v3 selector:sel_menuControllerWillHide_ name:*MEMORY[0x1E4F43BA8] object:0];

    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    colorMaskLayer = v3->_colorMaskLayer;
    v3->_colorMaskLayer = v16;

    v18 = [(VKCImageSubjectBaseView *)v3 colorLayer];
    [v18 setInvertsMask:1];

    v19 = v3->_colorMaskLayer;
    v20 = [(VKCImageSubjectBaseView *)v3 colorLayer];
    [v20 setMask:v19];

    [(VKCImageSubjectHighlightView *)v3 setSubjectHighlightState:0];
    [(VKCImageSubjectHighlightView *)v3 setUserInteractionEnabled:1];
    v21 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4F42DD8]);
    feedbackGenerator = v3->_feedbackGenerator;
    v3->_feedbackGenerator = v21;
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitStyleDidChange
{
  id v5 = [(VKCImageSubjectHighlightView *)self traitCollection];
  uint64_t v3 = [v5 userInterfaceStyle];
  uint64_t v4 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v4 setOverrideUserInterfaceStyle:v3];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageSubjectHighlightView;
  [(VKCImageSubjectBaseView *)&v4 setHidden:a3];
  if ([(VKCImageSubjectHighlightView *)self isHidden]) {
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
  }
  [(VKCImageSubjectHighlightView *)self beginImageSubjectAnalysisWithDelayIfNecessary];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectHighlightView;
  [(VKCImageSubjectHighlightView *)&v3 didMoveToWindow];
  [(VKCImageSubjectHighlightView *)self beginImageSubjectAnalysisWithDelayIfNecessary];
}

- (void)setRecognitionResult:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageBaseOverlayView *)self recognitionResult];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)VKCImageSubjectHighlightView;
    [(VKCImageSubjectBaseView *)&v8 setRecognitionResult:v4];
    char v7 = 0;
    uint64_t v6 = [(VKCImageSubjectHighlightView *)self delegate];
    -[VKCImageSubjectHighlightView setIsLivePhoto:](self, "setIsLivePhoto:", [v6 isSubjectHighlightShowingLivePhoto:self delegateHasImplementation:&v7]);

    [(VKCImageSubjectHighlightView *)self setAnalysisDelayTimerActive:0];
    [(VKCImageSubjectHighlightView *)self setCalloutStartTime:0];
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0];
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
    [(VKCImageSubjectHighlightView *)self beginImageSubjectAnalysisWithDelayIfNecessary];
  }
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKCImageSubjectHighlightView;
  [(VKCImageSubjectHighlightView *)&v18 buildMenuWithBuilder:v4];
  id v5 = [v4 system];
  uint64_t v6 = [MEMORY[0x1E4F42BA0] contextSystem];

  if (v5 == v6)
  {
    char v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    if (vk_deviceSupportsAddingSystemStickers())
    {
      objc_super v8 = (void *)MEMORY[0x1E4F428D0];
      v9 = VKBundle();
      uint64_t v10 = [v9 localizedStringForKey:@"VK_SUBJECT_LIFT_ADDSTICKER_MENU_TITLE" value:@"VK_SUBJECT_LIFT_ADDSTICKER_MENU_TITLE" table:@"Localizable"];
      v11 = [v8 commandWithTitle:v10 image:0 action:sel__addSticker_ propertyList:0 alternates:MEMORY[0x1E4F1CBF0]];

      [v7 addObject:v11];
      if ([(VKCImageSubjectHighlightView *)self isLivePhoto]
        && vk_isInternalBuild()
        && +[VKCInternalSettings shareHeicsCalloutEnabled])
      {
        v12 = [MEMORY[0x1E4F428D0] commandWithTitle:@"shareHeics(internal)" image:0 action:sel__shareHeics_ propertyList:0 alternates:MEMORY[0x1E4F1CBF0]];
        [v7 addObject:v12];
      }
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F428D0];
    v14 = VKBundle();
    v15 = [v14 localizedStringForKey:@"VK_SUBJECT_LIFT_SELECT_ALL_MENU_TITLE" value:@"VK_SUBJECT_LIFT_SELECT_ALL_MENU_TITLE" table:@"Localizable"];
    v16 = [v13 commandWithTitle:v15 image:0 action:sel__selectAllSubjects_ propertyList:0 alternates:MEMORY[0x1E4F1CBF0]];

    [v7 addObject:v16];
    v17 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F35566F8 image:0 identifier:0 options:1 children:v7];
    [v4 insertSiblingMenu:v17 beforeMenuForIdentifier:*MEMORY[0x1E4F43BD8]];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5 = self;
  uint64_t v6 = [(VKCImageSubjectBaseView *)self subjectContext];
  char v7 = v6;
  if (sel_copy_ == a3 || sel__shareHeics_ == a3) {
    goto LABEL_12;
  }
  if (sel__share_ == a3 || sel__addSticker_ == a3)
  {
    if (vk_isDeviceLocked())
    {
      LOBYTE(v5) = vk_processHasUnlockEntitlement();
      goto LABEL_13;
    }
LABEL_12:
    LOBYTE(v5) = 1;
    goto LABEL_13;
  }
  if (sel__selectAllSubjects_ == a3)
  {
    LODWORD(v5) = [v6 allSubjectsSelected] ^ 1;
  }
  else if (sel__define_ == a3 {
         && +[VKCImageSubjectHighlightView visualLookUpYear3InvocationEnabled])
  }
  {
    v11 = [(VKCImageSubjectHighlightView *)v5 delegate];
    v12 = [(VKCImageSubjectBaseView *)v5 normalizedSubjectPath];
    LOBYTE(v5) = [v11 subjectHighlightView:v5 containsVSItemForNormalizedPath:v12];
  }
  else
  {
    LOBYTE(v5) = 0;
  }
LABEL_13:

  return (char)v5;
}

- (void)setSubjectHighlightState:(unint64_t)a3
{
}

- (void)setColorMaskImage:(CGImage *)a3
{
  objc_super v3 = a3;
  colorMaskImage = self->_colorMaskImage;
  if (colorMaskImage != a3)
  {
    CGImageRelease(colorMaskImage);
    self->_colorMaskImage = v3;
    CGImageRetain(v3);
    objc_super v3 = self->_colorMaskImage;
  }
  id v6 = [(VKCImageSubjectHighlightView *)self colorMaskLayer];
  [v6 setContents:v3];
}

- (void)setIsLivePhoto:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isLivePhoto = a3;
  BOOL v5 = [(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled];
  id v6 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  [v6 _setCancellationTimerEnabled:v3];

  uint64_t v7 = v3 & !v5;
  objc_super v8 = [(VKCImageSubjectHighlightView *)self livePhotoPlayGR];
  [v8 setEnabled:v7];

  id v9 = [(VKCImageSubjectHighlightView *)self coyotePanGR];
  [v9 setEnabled:v7];
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v17, sel_setNormalizedVisibleRect_);
  [(VKCImageSubjectHighlightView *)self beginImageSubjectAnalysisWithDelayIfNecessary];
  BOOL HasArea = VKMRectHasArea(x, y, width, height);
  uint64_t v9 = [(VKCImageSubjectHighlightView *)self calloutStartTime];
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = (void *)v9;
  v11 = [MEMORY[0x1E4F1C9C8] now];
  v12 = [(VKCImageSubjectHighlightView *)self calloutStartTime];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v14 > 0.8)
  {
LABEL_5:
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
    if (HasArea) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v15 = [(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled] ^ 1;
    goto LABEL_7;
  }
  if (!HasArea) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v15 = 1;
LABEL_7:
  v16 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  [v16 setEnabled:v15];
}

- (void)updateSubjectInteractionInProgressIfNecessary
{
  BOOL v3 = [(VKCImageSubjectHighlightView *)self subjectHighlightActive];
  id v4 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  unsigned int v5 = v3 | [v4 _isActive];

  if ([(VKCImageSubjectHighlightView *)self subjectHighlightState]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  [(VKCImageSubjectHighlightView *)self setSubjectInteractionInProgress:v6];
}

- (void)setSubjectInteractionInProgress:(BOOL)a3
{
  if (self->_subjectInteractionInProgress != a3)
  {
    self->_subjectInteractionInProgress = a3;
    id v4 = [(VKCImageSubjectHighlightView *)self delegate];
    [v4 subjectHighlightViewSubjectInteractionInProgressDidChange:self];
  }
}

- (void)beginImageSubjectAnalysisWithDelayIfNecessary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VKCImageBaseOverlayView *)self recognitionResult];
  BOOL v4 = v3 == 0;

  unsigned int v5 = [(VKCImageSubjectHighlightView *)self window];

  uint64_t v6 = [(VKCImageSubjectBaseView *)self subjectContext];

  unint64_t v7 = [(VKCImageSubjectBaseView *)self loadMaskRequestStatus];
  BOOL v8 = [(VKCImageSubjectHighlightView *)self analysisDelayTimerActive];
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  BOOL HasArea = VKMRectHasArea(v9, v10, v11, v12);
  char v14 = [(VKCImageSubjectHighlightView *)self isHidden];
  if (v5) {
    char v15 = v4;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0 && (v14 & 1) == 0 && !v6 && !v7 && !v8 && HasArea && (vk_isSeedBuild() & 1) == 0)
  {
    [(VKCImageSubjectHighlightView *)self setAnalysisDelayTimerActive:1];
    v16 = [(VKCImageSubjectBaseView *)self analysisResult];
    objc_initWeak(&location, self);
    objc_super v17 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      _os_log_impl(&dword_1DB266000, v17, OS_LOG_TYPE_DEFAULT, "Beginning subject analyze delay: %@", buf, 0xCu);
    }

    +[VKCInternalSettings subjectAutomaticAnalysisDelay];
    double v19 = v18;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__VKCImageSubjectHighlightView_beginImageSubjectAnalysisWithDelayIfNecessary__block_invoke;
    v21[3] = &unk_1E6BF1C88;
    v21[4] = self;
    objc_copyWeak(&v23, &location);
    id v20 = v16;
    id v22 = v20;
    vk_dispatchMainAfterDelay(v21, v19);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

void __77__VKCImageSubjectHighlightView_beginImageSubjectAnalysisWithDelayIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DB266000, v2, OS_LOG_TYPE_DEFAULT, "Subject analyze delay complete: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v5 = [WeakRetained analysisResult];
  uint64_t v6 = *(void **)(a1 + 40);

  if (v5 == v6)
  {
    [WeakRetained setAnalysisDelayTimerActive:0];
    if (![WeakRetained loadMaskRequestStatus]) {
      [WeakRetained loadSubjectMaskIfNecessary];
    }
  }
  else
  {
    unint64_t v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1DB266000, v7, OS_LOG_TYPE_DEFAULT, "Subject analysis cancelled because the analysis was changed from: %@, %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)setSubjectContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectBaseView setSubjectContext:](&v9, sel_setSubjectContext_);
  +[VKCInternalSettings subjectDragLiftDelay];
  double v6 = 0.55;
  if (a3) {
    double v6 = 0.0;
  }
  double v7 = v6 + v5;
  uint64_t v8 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  [v8 _setLiftDelay:v7];

  [(VKCImageSubjectHighlightView *)self setLivePhotoStartTime:0];
  if ([(VKCImageSubjectHighlightView *)self tapToSelectModeEnabled])
  {
    [(VKCImageSubjectHighlightView *)self setTapToSelectModeEnabled:0];
    [(VKCImageSubjectHighlightView *)self setTapToSelectModeEnabled:1];
  }
}

- (id)stringForHighlightState:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    BOOL v4 = [&stru_1F35566F8 stringByAppendingString:@"container,"];
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v4 = &stru_1F35566F8;
  if ((a3 & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = [(__CFString *)v4 stringByAppendingString:@"image,"];

    BOOL v4 = (__CFString *)v5;
  }
LABEL_6:
  if ((v3 & 2) == 0)
  {
    if ((v3 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v8 = [(__CFString *)v4 stringByAppendingString:@"color,"];

  BOOL v4 = (__CFString *)v8;
  if ((v3 & 8) != 0)
  {
LABEL_8:
    uint64_t v6 = [(__CFString *)v4 stringByAppendingString:@"colorMask,"];

    BOOL v4 = (__CFString *)v6;
  }
LABEL_9:
  return v4;
}

- (void)setSubjectHighlightState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_subjectHighlightState != a3)
  {
    BOOL v4 = a4;
    char v5 = a3;
    self->_subjectHighlightState = a3;
    [(VKCImageSubjectHighlightView *)self updateSubjectInteractionInProgressIfNecessary];
    BOOL v7 = [(VKCImageSubjectBaseView *)self inhibitDimmingAndLiftView];
    BOOL v8 = v7;
    int v9 = (v5 & 2) == 0 || v7;
    int v10 = (v5 & 4) == 0 || v7;
    int v11 = (v5 & 1) == 0 || v7;
    id v38 = [(VKCImageSubjectBaseView *)self colorLayer];
    __int16 v12 = [(VKCImageSubjectHighlightView *)self colorMaskLayer];
    uint64_t v13 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
    uint64_t v14 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainer];
    [v38 opacity];
    float v16 = v15;
    [v13 opacity];
    float v18 = v17;
    [v14 opacity];
    float v20 = v19;
    if (v9) {
      double v21 = 0.0;
    }
    else {
      double v21 = 1.0;
    }
    if (v10) {
      double v22 = 0.0;
    }
    else {
      double v22 = 1.0;
    }
    if (v11) {
      double v23 = 0.0;
    }
    else {
      double v23 = 1.0;
    }
    [v38 removeAllAnimations];
    [v13 removeAllAnimations];
    [v14 removeAllAnimations];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    *(float *)&double v24 = v21;
    [v38 setOpacity:v24];
    *(float *)&double v25 = v22;
    [v13 setOpacity:v25];
    *(float *)&double v26 = v23;
    [v14 setOpacity:v26];
    uint64_t v27 = 0;
    if ((v5 & 8) == 0
      || v8
      || (objc_msgSend(v38, "mask", 0),
          v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          uint64_t v27 = v12,
          v28 != v12))
    {
      [v38 setMask:v27];
    }
    if (v4)
    {
      v29 = objc_msgSend(NSNumber, "numberWithDouble:", v27, v16);
      v30 = [NSNumber numberWithDouble:v21];
      v31 = [(VKCImageSubjectHighlightView *)self animationWithDuration:v29 fromValue:v30 toValue:@"opacity" key:0.25];
      [v38 addAnimation:v31 forKey:0];

      v32 = [NSNumber numberWithDouble:v18];
      v33 = [NSNumber numberWithDouble:v22];
      v34 = [(VKCImageSubjectHighlightView *)self animationWithDuration:v32 fromValue:v33 toValue:@"opacity" key:0.25];
      [v13 addAnimation:v34 forKey:0];

      v35 = [NSNumber numberWithDouble:v20];
      v36 = [NSNumber numberWithDouble:v23];
      v37 = [(VKCImageSubjectHighlightView *)self animationWithDuration:v35 fromValue:v36 toValue:@"opacity" key:0.25];
      [v14 addAnimation:v37 forKey:0];
    }
    objc_msgSend(MEMORY[0x1E4F39CF8], "commit", v27);
  }
}

- (id)animationWithDuration:(double)a3 fromValue:(id)a4 toValue:(id)a5 key:(id)a6
{
  int v9 = (void *)MEMORY[0x1E4F39B48];
  id v10 = a5;
  id v11 = a4;
  __int16 v12 = [v9 animationWithKeyPath:a6];
  [v12 setToValue:v10];

  [v12 setFromValue:v11];
  [v12 setDuration:a3];
  [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
  return v12;
}

- (id)springAnimationWithFromValue:(id)a3 toValue:(id)a4 key:(id)a5
{
  BOOL v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 animationWithKeyPath:a5];
  [v10 setToValue:v8];

  [v10 setFromValue:v9];
  [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v10 setStiffness:195.0];
  [v10 setDamping:19.75];
  [v10 settlingDuration];
  objc_msgSend(v10, "setDuration:");
  return v10;
}

- (id)targetedPreviewForCurrentSubject
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  [v3 setContentScaleFactor:0.0];
  BOOL v4 = [(VKCImageSubjectBaseView *)self customImageForRemoveBackground];

  if (v4)
  {
    char v5 = [(VKCImageSubjectBaseView *)self customImageForRemoveBackground];
    [v3 setImage:v5];
  }
  else
  {
    uint64_t v6 = [(VKCImageSubjectBaseView *)self subjectContext];

    if (!v6) {
      goto LABEL_6;
    }
    BOOL v7 = (void *)MEMORY[0x1E4F42A80];
    id v8 = [(VKCImageSubjectBaseView *)self subjectContext];
    id v9 = [v8 request];
    id v10 = objc_msgSend(v7, "imageWithCGImage:", objc_msgSend(v9, "CGImage"));
    [v3 setImage:v10];

    char v5 = [(VKCImageSubjectBaseView *)self subjectContext];
    vk_transformToImageOrientation((CGAffineTransform *)[v5 imageOrientation], (uint64_t)v61);
    v60[0] = v61[0];
    v60[1] = v61[1];
    v60[2] = v61[2];
    [v3 setTransform:v60];
  }

LABEL_6:
  [(VKCImageSubjectBaseView *)self imageBounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v3, "setFrame:");
  float v19 = -[VKCSubjectLiftView initWithFrame:]([VKCSubjectLiftView alloc], "initWithFrame:", v12, v14, v16, v18);
  id v20 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(VKCSubjectLiftView *)v19 bounds];
  double v21 = objc_msgSend(v20, "initWithFrame:");
  [(VKCSubjectLiftView *)v19 bounds];
  objc_msgSend(v3, "setFrame:");
  [(VKCSubjectLiftView *)v19 addSubview:v21];
  [v21 addSubview:v3];
  [(UIView *)self vk_viewPointRatioFromWindow];
  double v23 = v22;
  double v24 = v22 * 20.0;
  double v25 = VKMMultiplyPointScalar(0.0, 0.0, v22);
  double v27 = v26;
  double v28 = v23 * 3.0;
  double v29 = VKMMultiplyPointScalar(0.0, 1.0, v23);
  double v31 = v30;
  v32 = [(VKCSubjectLiftView *)v19 layer];
  v33 = [v21 layer];
  id v34 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v32, "setShadowColor:", objc_msgSend(v34, "CGColor"));

  [v32 setShadowRadius:v28];
  [v32 setShadowOpacity:0.0];
  objc_msgSend(v32, "setShadowOffset:", v29, v31);
  [v32 setAllowsGroupBlending:1];
  id v35 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v33, "setShadowColor:", objc_msgSend(v35, "CGColor"));

  [v33 setShadowRadius:v24];
  [v33 setShadowOpacity:0.0];
  objc_msgSend(v33, "setShadowOffset:", v25, v27);
  [v33 setAllowsGroupBlending:1];
  [(VKCSubjectLiftView *)v19 setDiffuseShadowLayer:v33];
  [(VKCSubjectLiftView *)v19 setRimShadowLayer:v32];
  if (v24 + v25 >= v28 + v29) {
    double v36 = v24 + v25;
  }
  else {
    double v36 = v28 + v29;
  }
  v37 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
  [v37 bounds];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;

  v63.origin.double x = v39;
  v63.origin.double y = v41;
  v63.size.CGFloat width = v43;
  v63.size.CGFloat height = v45;
  CGRect v64 = CGRectInset(v63, -v36, -v36);
  double x = v64.origin.x;
  double y = v64.origin.y;
  CGFloat width = v64.size.width;
  CGFloat height = v64.size.height;
  id v50 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [(VKCImageSubjectBaseView *)self configureMaskForCurrentSubjectContextWithLayer:v50 animated:0];
  v51 = [v3 layer];
  [v51 setMask:v50];

  [(VKCImageSubjectHighlightView *)self setCurrentLiftView:v19];
  [(VKCImageSubjectHighlightView *)self setCurrentLiftImageView:v3];
  id v52 = objc_alloc_init(MEMORY[0x1E4F429B0]);
  v53 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v52 setShadowPath:v53];

  v54 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", VKMSubtractPoints(x, y, v12));
  [v52 setVisiblePath:v54];

  v55 = [MEMORY[0x1E4F428B8] clearColor];
  [v52 setBackgroundColor:v55];

  id v56 = objc_alloc(MEMORY[0x1E4F42ED0]);
  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42D00]), "initWithContainer:center:", self, VKMCenterOfRect(x, y, width, height));
  v58 = (void *)[v56 initWithView:v19 parameters:v52 target:v57];

  return v58;
}

- (void)setTapToSelectModeEnabled:(BOOL)a3
{
  self->_tapToSelectModeEnabled = a3;
  if (a3)
  {
    BOOL v4 = [(VKCImageSubjectBaseView *)self subjectContext];
    uint64_t v5 = [v4 subjectCount];

    if (v5)
    {
      uint64_t v6 = [(VKCImageSubjectHighlightView *)self tapGR];
      [v6 setEnabled:1];

      id v7 = [MEMORY[0x1E4F28D60] indexSet];
      -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v7, 0, 0, 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
  else
  {
    -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", 0, 0, 0, 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
  }
}

- (void)setSubjectViewUserInteractionDisabled:(BOOL)a3
{
  self->_subjectViewUserInteractionDisabled = a3;
  if (a3)
  {
    BOOL v4 = [(VKCImageSubjectHighlightView *)self tapGR];
    [v4 setEnabled:0];

    uint64_t v5 = [(VKCImageSubjectHighlightView *)self dragInteraction];
    id v7 = v5;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [(VKCImageSubjectHighlightView *)self dragInteraction];
    id v7 = v5;
    uint64_t v6 = 1;
  }
  [v5 setEnabled:v6];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  objc_msgSend(a5, "locationInView:", self, a4);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:");
  [(VKCImageSubjectBaseView *)self setBurstPoint:v6];

  return [(VKCImageSubjectHighlightView *)self targetedPreviewForCurrentSubject];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  id v7 = [(VKCImageSubjectHighlightView *)self window];

  if (v7)
  {
    id v8 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
    id v9 = objc_alloc(MEMORY[0x1E4F429B8]);
    [v8 bounds];
    double v14 = objc_msgSend(v9, "initWithContainer:center:", self, VKMCenterOfRect(v10, v11, v12, v13));
    double v15 = [v6 retargetedPreviewWithTarget:v14];
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4 = a3;
  if (![(VKCImageSubjectHighlightView *)self isLiftingEmptyItemArray]) {
    [(VKCImageSubjectHighlightView *)self handleCancelForUndraggedLiftForInteraction:v4];
  }
}

- (void)handleCancelForUndraggedLiftForInteraction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VKCImageSubjectHighlightView *)self currentLiftView];
  id v6 = (void *)MEMORY[0x1E4F42FF0];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __75__VKCImageSubjectHighlightView_handleCancelForUndraggedLiftForInteraction___block_invoke;
  v63[3] = &unk_1E6BF0D18;
  id v7 = v5;
  id v64 = v7;
  [v6 performWithoutAnimation:v63];
  double v8 = CACurrentMediaTime();
  [(VKCImageSubjectHighlightView *)self dragInteractionStartTime];
  double v10 = v9;
  [v4 _cancellationDelay];
  double v12 = v11;
  LODWORD(v6) = [v4 _isCancellationTimerEnabled];

  if (v6
    && (double v13 = v12 + -0.01, v14 = v8 - v10, v8 - v10 >= v12 + -0.01)
    && ![(VKCImageSubjectHighlightView *)self glowLayerWasActiveOnLift])
  {
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0 animated:0];
    double v17 = [MEMORY[0x1E4F42B88] sharedMenuController];
    [v17 hideMenu];
  }
  else
  {
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:[(VKCImageSubjectHighlightView *)self subjectHighlightState] | 5 animated:0];
    [(VKCImageSubjectHighlightView *)self dragInteractionStartLocation];
    -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, [(VKCImageSubjectHighlightView *)self isLivePhoto], v15, v16);
    double v17 = [(VKCImageSubjectBaseView *)self pulseLayer];
    double v18 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainer];
    float v19 = [(VKCImageSubjectBaseView *)self imageHighlightLayerContainerShadow];
    id v20 = [v7 rimShadowLayer];
    id v53 = v7;
    double v21 = [v7 diffuseShadowLayer];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [v17 timeOffset];
    double v23 = v22;
    [v17 beginTime];
    double v25 = v24;
    double v26 = [v17 superlayer];
    double v27 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];

    if (v26 != v27)
    {
      double v28 = [v17 superlayer];
      [v17 position];
      double v30 = v29;
      double v32 = v31;
      v33 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
      objc_msgSend(v28, "convertPoint:toLayer:", v33, v30, v32);
      objc_msgSend(v17, "setPosition:");

      id v34 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
      [v34 addSublayer:v17];
    }
    [v17 setTimeOffset:v23];
    [v17 setBeginTime:v25];
    objc_msgSend(v18, "setShadowColor:", objc_msgSend(v20, "shadowColor"));
    [v18 setShadowRadius:0.0];
    [v20 shadowOffset];
    objc_msgSend(v18, "setShadowOffset:");
    [v20 shadowOpacity];
    objc_msgSend(v18, "setShadowOpacity:");
    objc_msgSend(v19, "setShadowColor:", objc_msgSend(v21, "shadowColor"));
    [v19 setShadowRadius:0.0];
    [v21 shadowOffset];
    objc_msgSend(v19, "setShadowOffset:");
    [v21 shadowOpacity];
    objc_msgSend(v19, "setShadowOpacity:");
    memset(&v62, 0, sizeof(v62));
    CATransform3DMakeScale(&v62, 1.02, 1.02, 1.0);
    long long v52 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v51 = v58;
    long long v59 = v52;
    long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v60 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v49 = v60;
    long long v61 = v50;
    long long v48 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v55[0] = *MEMORY[0x1E4F39B10];
    long long v47 = v55[0];
    v55[1] = v48;
    long long v46 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v56 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v45 = v56;
    long long v57 = v46;
    [v18 setTransform:v55];
    CATransform3D v54 = v62;
    id v35 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v54];
    *(_OWORD *)&v54.m31 = v51;
    *(_OWORD *)&v54.m33 = v52;
    *(_OWORD *)&v54.m41 = v49;
    *(_OWORD *)&v54.m43 = v50;
    *(_OWORD *)&v54.m11 = v47;
    *(_OWORD *)&v54.m13 = v48;
    *(_OWORD *)&v54.m21 = v45;
    *(_OWORD *)&v54.m23 = v46;
    double v36 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v54];
    v37 = [(VKCImageSubjectHighlightView *)self springAnimationWithFromValue:v35 toValue:v36 key:@"transform"];

    double v38 = NSNumber;
    [v20 shadowRadius];
    CGFloat v39 = objc_msgSend(v38, "numberWithDouble:");
    double v40 = [(VKCImageSubjectHighlightView *)self springAnimationWithFromValue:v39 toValue:&unk_1F357DB48 key:@"shadowRadius"];

    CGFloat v41 = NSNumber;
    double v42 = v21;
    [v21 shadowRadius];
    CGFloat v43 = objc_msgSend(v41, "numberWithDouble:");
    double v44 = [(VKCImageSubjectHighlightView *)self springAnimationWithFromValue:v43 toValue:&unk_1F357DB48 key:@"shadowRadius"];

    [v18 addAnimation:v37 forKey:0];
    [v18 addAnimation:v40 forKey:0];
    [v19 addAnimation:v44 forKey:0];
    [MEMORY[0x1E4F39CF8] commit];

    id v7 = v53;
  }
}

uint64_t __75__VKCImageSubjectHighlightView_handleCancelForUndraggedLiftForInteraction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

- (void)setGlowLayerActive:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKCImageSubjectHighlightView;
  -[VKCImageSubjectBaseView setGlowLayerActive:](&v7, sel_setGlowLayerActive_);
  uint64_t v5 = [(VKCImageSubjectHighlightView *)self isLivePhoto] & !v3;
  id v6 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  [v6 _setCancellationTimerEnabled:v5];

  [(VKCImageSubjectHighlightView *)self updateSubjectInteractionInProgressIfNecessary];
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v6 = a4;
  objc_super v7 = [(VKCImageSubjectHighlightView *)self feedbackGenerator];
  [v7 selectionChanged];

  [(VKCImageSubjectHighlightView *)self setGlowLayerWasActiveOnLift:[(VKCImageSubjectBaseView *)self glowLayerActive]];
  [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessaryWithClearSelectAll:0];
  [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__VKCImageSubjectHighlightView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v8[3] = &unk_1E6BF0D18;
  v8[4] = self;
  [v6 addAnimations:v8];
}

void __84__VKCImageSubjectHighlightView_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isLivePhoto] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "vk_viewPointRatioFromWindow");
    double v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "configurePulseAnimationWithViewScale:");
    id v4 = [*(id *)(a1 + 32) currentLiftImageView];
    uint64_t v5 = [v4 layer];
    id v6 = [*(id *)(a1 + 32) pulseLayer];
    [v5 addSublayer:v6];

    [*(id *)(a1 + 32) showPulseAnimationWithViewScale:v3];
  }
  id v7 = [*(id *)(a1 + 32) currentLiftView];
  [v7 setShadowsVisible:1];
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  [a4 locationInView:self];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [(VKCImageSubjectHighlightView *)self bounds];
  v12.double x = v7;
  v12.double y = v9;
  BOOL v10 = CGRectContainsPoint(v13, v12);
  [(VKCImageSubjectHighlightView *)self setShouldShowCalloutOnDragCancel:v10];
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__VKCImageSubjectHighlightView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E6BF1CB0;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __83__VKCImageSubjectHighlightView_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSubjectHighlightState:animated:", objc_msgSend(*(id *)(a1 + 32), "subjectHighlightState") | 0xD, 0);
  uint64_t result = [*(id *)(a1 + 32) shouldShowCalloutOnDragCancel];
  if (result)
  {
    double v3 = *(void **)(a1 + 32);
    [v3 dragInteractionStartLocation];
    return objc_msgSend(v3, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, 0);
  }
  return result;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(VKCImageSubjectBaseView *)self subjectContext];

  if (!v6)
  {
    [(VKCImageSubjectBaseView *)self loadSubjectMaskIfNecessary];
LABEL_7:
    CGRect v13 = 0;
    BOOL v14 = 1;
    goto LABEL_23;
  }
  if ([(VKCImageSubjectHighlightView *)self isLivePhoto]
    && ![(VKCImageSubjectHighlightView *)self subjectAnalysisCompleteWhenTouchesBegan])
  {
    goto LABEL_7;
  }
  [(VKCImageSubjectHighlightView *)self setDragInteractionStartTime:CACurrentMediaTime()];
  [v5 locationInView:self];
  -[VKCImageSubjectHighlightView setDragInteractionStartLocation:](self, "setDragInteractionStartLocation:");
  [v5 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(VKCImageSubjectBaseView *)self subjectContext];
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", v8, v10);
  CGPoint v12 = objc_msgSend(v11, "indexOfSubjectAtNormalizedPoint:");

  if (v12) {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v12, "unsignedIntValue"));
  }
  else {
  double v15 = [MEMORY[0x1E4F28D60] indexSet];
  }
  if (![(VKCImageSubjectHighlightView *)self isSelectAllActive]) {
    [(VKCImageSubjectBaseView *)self setActiveSubjectIndexSet:v15];
  }
  BOOL v16 = -[VKCImageSubjectBaseView subjectExistsAtPoint:](self, "subjectExistsAtPoint:", v8, v10);
  [(VKCImageSubjectHighlightView *)self bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  VKMRectFromNormalizedSubrect(v18, v20, v22, v24, v25, v26, v27, v28);
  double v30 = v29;
  double v32 = v31;
  v33 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
  [v33 bounds];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;

  double v42 = VKMCenterOfRect(v35, v37, v39, v41);
  double v44 = v43;
  double v45 = VKMMultiplyPointScalar(v39, v41, 0.72);
  double v46 = VKMRectWithCenterAndSize(v42, v44, v45);
  if (v30 < v48 || v32 < v47)
  {
    id v53 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v65 = self;
      _os_log_impl(&dword_1DB266000, v53, OS_LOG_TYPE_DEFAULT, "Subject image is zoomed in and no longer fits the view properly to lift: %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
  [(UIView *)self vk_windowPointRatioFromView];
  double v51 = VKMMultiplyPointScalar(v39, v41, v49);
  if (v51 < 64.0)
  {
    double v52 = v50;
    if (v50 < 64.0)
    {
      id v53 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        VKMUIStringForSize(v51, v52);
        CATransform3D v54 = (VKCImageSubjectHighlightView *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v65 = v54;
        __int16 v66 = 2048;
        uint64_t v67 = 0x4050000000000000;
        __int16 v68 = 2112;
        v69 = self;
        _os_log_impl(&dword_1DB266000, v53, OS_LOG_TYPE_DEFAULT, "Subject image is too small. Image in window coordinates: %@,  Max edge length %f: %@", buf, 0x20u);
      }
LABEL_20:
      CGRect v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
  }
  if (!v16)
  {
    CGRect v13 = 0;
    goto LABEL_22;
  }
  long long v58 = [(VKCImageSubjectHighlightView *)self delegate];
  int v59 = objc_msgSend(v58, "subjectHighlightView:shouldBeginInteractionAtPoint:withType:", self, 0, v8, v10);

  CGRect v13 = 0;
  if (v59)
  {
    long long v60 = [(VKCImageSubjectHighlightView *)self delegate];
    objc_msgSend(v60, "subjectHighlightView:willBeginInteractionAtPoint:withType:", self, 1, v8, v10);

    id v61 = objc_alloc(MEMORY[0x1E4F429A0]);
    CATransform3D v62 = [(VKCImageSubjectHighlightView *)self createItemProvider];
    id v53 = [v61 initWithItemProvider:v62];

    CGRect v63 = v53;
    CGRect v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    goto LABEL_21;
  }
LABEL_22:
  BOOL v14 = [v13 count] == 0;

LABEL_23:
  [(VKCImageSubjectHighlightView *)self setIsLiftingEmptyItemArray:v14];
  if (v13) {
    v55 = v13;
  }
  else {
    v55 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v56 = v55;

  return v56;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  -[VKCImageSubjectHighlightView setShouldShowCalloutOnDragCancel:](self, "setShouldShowCalloutOnDragCancel:", 0, a4);
  [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:3];
  id v5 = [MEMORY[0x1E4F42B88] sharedMenuController];
  int v6 = [v5 isMenuVisible];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F42B88] sharedMenuController];
    [v7 hideMenuFromView:self];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  if (![(VKCImageSubjectHighlightView *)self shouldShowCalloutOnDragCancel])
  {
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0];
    [(VKCImageSubjectHighlightView *)self setIsSelectAllActive:0];
  }
  if (a5 == 2)
  {
    [(VKCImageSubjectBaseView *)self sendSubjectAnalyticsEventWithEventType:2 interactionType:3 subjectFound:1 processingDuration:0.0];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)livePhotoCoyotePan:(id)a3
{
  id v17 = a3;
  if ([v17 state] != 4
    && ![(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled])
  {
    [v17 translationInView:self];
    double v6 = VKMDistance(v4, v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(UIView *)self vk_viewPointRatioFromWindow];
    double v8 = v7;
    double v9 = [(VKCImageSubjectHighlightView *)self livePhotoStartTime];

    if (v9)
    {
      if (v6 * v8 > 20.0)
      {
        double v10 = objc_msgSend(v17, "_activeEventOfType:", 0, v6 * v8);
        double v11 = [v10 allTouches];
        CGPoint v12 = [v11 anyObject];

        if (v12)
        {
          CGRect v13 = [(VKCImageSubjectHighlightView *)self dragInteraction];
          char v14 = [v13 _isActive];

          if ((v14 & 1) == 0)
          {
            double v15 = [(VKCImageSubjectHighlightView *)self dragInteraction];
            [v15 setEnabled:1];

            [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
            [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
            BOOL v16 = [(VKCImageSubjectHighlightView *)self dragInteraction];
            [v16 _immediatelyBeginDragWithTouch:v12 completion:&__block_literal_global_172];
          }
        }
      }
    }
  }
}

- (void)livePhotoLongPress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  if (!-[VKCImageSubjectBaseView subjectExistsAtPoint:](self, "subjectExistsAtPoint:", v7, v9)
    && [(VKCImageSubjectHighlightView *)self subjectAnalysisCompleteWhenTouchesBegan]&& ([(VKCImageSubjectBaseView *)self subjectContext], (double v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (v5 == 1)
  {
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0];
    double v11 = [(VKCImageSubjectHighlightView *)self delegate];
    [v11 subjectHighlightView:self livePhotoShouldPlay:1];

    id v31 = [MEMORY[0x1E4F1C9C8] now];
    [(VKCImageSubjectHighlightView *)self setLivePhotoStartTime:v31];
LABEL_7:
    CGPoint v12 = v31;
    goto LABEL_8;
  }
  if ((unint64_t)(v5 - 3) > 1) {
    return;
  }
  CGRect v13 = [(VKCImageSubjectHighlightView *)self delegate];
  [v13 subjectHighlightView:self livePhotoShouldPlay:0];

  id v31 = [(VKCImageSubjectHighlightView *)self livePhotoStartTime];
  [(VKCImageSubjectHighlightView *)self setLivePhotoStartTime:0];
  CGPoint v12 = v31;
  if (v31)
  {
    char v14 = [(VKCImageSubjectBaseView *)self subjectContext];

    if (v14)
    {
      double v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:v31];
      double v17 = v16;

      if (v17 < 0.8)
      {
        CGFloat v18 = [(VKCImageSubjectBaseView *)self imageHighlightLayer];
        double v19 = [(VKCImageSubjectBaseView *)self pulseLayer];
        CGFloat v20 = [v19 superlayer];

        if (v20 != v18)
        {
          double v21 = [v19 superlayer];
          [v19 position];
          double v23 = v22;
          double v25 = v24;
          CGFloat v26 = [v18 superlayer];
          objc_msgSend(v21, "convertPoint:toLayer:", v26, v23, v25);
          objc_msgSend(v19, "setPosition:");

          [v18 addSublayer:v19];
        }
        CGFloat v27 = -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:", v7, v9);
        CGFloat v28 = v27;
        if (v27) {
          objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v27, "integerValue"));
        }
        else {
        double v29 = [MEMORY[0x1E4F28D60] indexSet];
        }
        double v30 = [(VKCImageSubjectBaseView *)self subjectContext];
        [v30 setActiveSubjectIndexes:v29];

        [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:7 animated:1];
        -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, 1, v7, v9);
      }
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VKCImageSubjectHighlightView;
  [(VKCImageSubjectHighlightView *)&v6 touchesBegan:a3 withEvent:a4];
  if ([(VKCImageSubjectBaseView *)self glowLayerActive]) {
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
  }
  uint64_t v5 = [(VKCImageSubjectBaseView *)self subjectContext];
  [(VKCImageSubjectHighlightView *)self setSubjectAnalysisCompleteWhenTouchesBegan:v5 != 0];
}

- (void)hideCalloutMenuIfNecessary
{
  if (![(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled])
  {
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessaryWithClearSelectAll:1];
  }
}

- (void)hideCalloutMenuIfNecessaryWithClearSelectAll:(BOOL)a3
{
  id v9 = [MEMORY[0x1E4F42B88] sharedMenuController];
  uint64_t v5 = [v9 _targetView];
  [(VKCImageSubjectHighlightView *)self setCalloutStartTime:0];
  BOOL v6 = [(VKCImageSubjectHighlightView *)self isSelectAllActive];
  if ([v9 isMenuVisible]) {
    BOOL v7 = v5 == self;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    double v8 = [MEMORY[0x1E4F42B88] sharedMenuController];
    [v8 hideMenuFromView:self];
  }
  if (!a3) {
    [(VKCImageSubjectHighlightView *)self setIsSelectAllActive:v6];
  }
}

- (void)highlightSubjectAtIndexSet:(id)a3 showCallout:(BOOL)a4 showBurst:(BOOL)a5 burstPoint:(CGPoint)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v18 = a3;
  if (v18)
  {
    CGRect v13 = [(VKCImageSubjectBaseView *)self subjectContext];
    char v14 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
    int v15 = [v13 subjectIndexes:v18 equivalentToIndexes:v14];

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if ((v15 & 1) == 0) {
      [(VKCImageSubjectBaseView *)self setActiveSubjectIndexSet:v18 animated:v7];
    }
    [MEMORY[0x1E4F39CF8] commit];
    if (v11)
    {
      if (v10
        || ![(VKCImageSubjectBaseView *)self glowLayerActive]
        || ([MEMORY[0x1E4F42B88] sharedMenuController],
            double v16 = objc_claimAutoreleasedReturnValue(),
            int v17 = [v16 isMenuVisible],
            v16,
            (v15 & v17 & 1) == 0))
      {
        -[VKCImageSubjectHighlightView showCalloutMenuAtLocation:checkDelegate:showPulse:](self, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 1, v10, x, y);
      }
    }
    else
    {
      -[VKCImageSubjectHighlightView _configureGlowWithShowBurst:burstPoint:](self, "_configureGlowWithShowBurst:burstPoint:", v10, x, y);
    }
  }
  else
  {
    [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
    [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0 animated:v7];
  }
}

- (void)showCalloutMenuAtLocation:(CGPoint)a3 checkDelegate:(BOOL)a4 showPulse:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  if (!a4) {
    goto LABEL_4;
  }
  id v9 = [(VKCImageSubjectHighlightView *)self delegate];
  int v10 = objc_msgSend(v9, "subjectHighlightView:shouldBeginInteractionAtPoint:withType:", self, 1, x, y);

  if (v10)
  {
    BOOL v11 = [(VKCImageSubjectHighlightView *)self delegate];
    objc_msgSend(v11, "subjectHighlightView:willBeginInteractionAtPoint:withType:", self, 1, x, y);

LABEL_4:
    [(VKCImageSubjectHighlightView *)self becomeFirstResponder];
    [(VKCImageSubjectHighlightView *)self subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:1];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    id v21 = [MEMORY[0x1E4F42B88] sharedMenuController];
    -[VKCImageSubjectHighlightView _configureGlowWithShowBurst:burstPoint:](self, "_configureGlowWithShowBurst:burstPoint:", v5, x, y);
    objc_msgSend(v21, "showMenuFromView:rect:", self, v13, v15, v17, v19);
    CGFloat v20 = [MEMORY[0x1E4F1C9C8] now];
    [(VKCImageSubjectHighlightView *)self setCalloutStartTime:v20];

    goto LABEL_6;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F42C10]);
  [v21 notificationOccurred:1];
  [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0];
  [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
  [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
LABEL_6:
}

- (void)_configureGlowWithShowBurst:(BOOL)a3 burstPoint:(CGPoint)a4
{
  BOOL v4 = a3;
  if (a3)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F29238], "vk_valueWithPoint:", a4.x, a4.y);
    [(VKCImageSubjectBaseView *)self setBurstPoint:v6];
  }
  else
  {
    -[VKCImageSubjectBaseView setBurstPoint:](self, "setBurstPoint:", 0, a4.x, a4.y);
  }
  uint64_t v7 = [(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled] ^ 1;
  double v8 = [(VKCImageSubjectHighlightView *)self tapGR];
  [v8 setEnabled:v7];

  id v9 = [(VKCImageSubjectHighlightView *)self dragInteraction];
  [v9 _cancelLift];

  int v10 = [(VKCImageSubjectHighlightView *)self livePhotoPlayGR];
  [v10 setEnabled:0];

  BOOL v11 = [(VKCImageSubjectBaseView *)self subjectContext];
  double v12 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  double v13 = [(VKCImageSubjectBaseView *)self activeGlowLayerIndexSet];
  char v14 = [v11 subjectIndexes:v12 equivalentToIndexes:v13];

  if ((v14 & 1) == 0)
  {
    if ([(VKCImageSubjectBaseView *)self glowLayerActive])
    {
      double v15 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
      if (v15)
      {

LABEL_11:
        [(VKCImageSubjectBaseView *)self updateGlowLayerForActiveSubjectIndexSet];
        goto LABEL_12;
      }
      if ([(VKCImageSubjectHighlightView *)self isSelectAllActive]) {
        goto LABEL_11;
      }
      double v16 = self;
      uint64_t v17 = 0;
    }
    else
    {
      double v16 = self;
      uint64_t v17 = 1;
    }
    [(VKCImageSubjectHighlightView *)v16 setGlowLayerActive:v17];
  }
LABEL_12:
  if (![(VKCImageSubjectHighlightView *)self subjectHighlightState]) {
    [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:4 animated:0];
  }
  [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:15 animated:1];
  if (v4)
  {
    [(UIView *)self vk_viewPointRatioFromWindow];
    -[VKCImageSubjectBaseView showPulseAnimationWithViewScale:](self, "showPulseAnimationWithViewScale:");
  }
}

- (void)_shareHeics:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__VKCImageSubjectHighlightView__shareHeics___block_invoke;
  v5[3] = &unk_1E6BF1CF8;
  objc_copyWeak(&v6, &location);
  [(VKCImageSubjectBaseView *)self loadImageSubjectIfNecessaryWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__VKCImageSubjectHighlightView__shareHeics___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tempGenerateStickerFromLivePhotoIfNecessaryWithProgress:0];
}

- (void)_addSticker:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke;
  v5[3] = &unk_1E6BF0CF0;
  objc_copyWeak(&v6, &location);
  vk_requestDeviceUnlockIfNecessaryWithCompletion(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke_2;
    v2[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    vk_dispatchMainAfterDelay(v2, 0.0);
    objc_destroyWeak(&v3);
  }
}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained delegate];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__VKCImageSubjectHighlightView__addSticker___block_invoke_3;
    v5[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v6, v1);
    [v4 subjectHighlightView:v3 prepareForCalloutAction:sel__addSticker_ completion:v5];

    objc_destroyWeak(&v6);
  }
}

void __44__VKCImageSubjectHighlightView__addSticker___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _addSticker];
}

- (void)_addSticker
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VKCImageSubjectHighlightView__addSticker__block_invoke;
  v3[3] = &unk_1E6BF1CF8;
  objc_copyWeak(&v4, &location);
  [(VKCImageSubjectBaseView *)self loadImageSubjectIfNecessaryWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__VKCImageSubjectHighlightView__addSticker__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__VKCImageSubjectHighlightView__addSticker__block_invoke_2;
  v4[3] = &unk_1E6BF0D90;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  vk_dispatchMainAfterDelay(v4, 0.0);
  objc_destroyWeak(&v5);
}

void __43__VKCImageSubjectHighlightView__addSticker__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentStickerPickerViewController];
    [v2 sendSubjectAnalyticsEventWithEventType:2 interactionType:4 subjectFound:1 processingDuration:0.0];
    id WeakRetained = v2;
  }
}

- (void)_selectAllSubjects:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28D60] indexSet];
  [(VKCImageSubjectBaseView *)self setActiveSubjectIndexSet:v5];

  [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
  [(VKCImageSubjectHighlightView *)self setIsSelectAllActive:1];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VKCImageSubjectHighlightView__selectAllSubjects___block_invoke;
  v6[3] = &unk_1E6BF0D90;
  objc_copyWeak(&v7, &location);
  vk_dispatchMainAfterDelay(v6, 0.0);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__VKCImageSubjectHighlightView__selectAllSubjects___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showCalloutMenuAtLocation:checkDelegate:showPulse:", 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)_presentStickerPickerViewController
{
  [(VKCImageSubjectHighlightView *)self subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:1];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double v7 = CGRectGetMidX(v31) + -20.0;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v8 = CGRectGetMidY(v32) + -20.0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F43330]);
  [(VKCImageSubjectHighlightView *)self setStickerPickerViewController:v9];

  int v10 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v10 setSourceView:self];

  double v12 = VKMRectWithOriginAndSize(v11, v7, v8, 40.0, 40.0);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  objc_msgSend(v19, "setSourceRect:", v12, v14, v16, v18);

  CGFloat v20 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v20 setDelegate:self];

  id v21 = [(VKCImageSubjectHighlightView *)self traitCollection];
  uint64_t v22 = [v21 userInterfaceStyle];
  double v23 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v23 setOverrideUserInterfaceStyle:v22];

  double v24 = [(VKCImageSubjectHighlightView *)self delegate];
  double v25 = [v24 presentingViewControllerForSubjectHighlightView:self];
  CGFloat v26 = v25;
  if (v25)
  {
    id v29 = v25;
  }
  else
  {
    CGFloat v27 = [(VKCImageSubjectHighlightView *)self window];
    id v29 = [v27 rootViewController];
  }
  CGFloat v28 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v29 presentViewController:v28 animated:0 completion:0];
}

- (void)_dismissCard
{
  id v2 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  [v2 dismissCard];
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  if ([(VKCImageSubjectHighlightView *)self tapToSelectModeEnabled])
  {
    [v4 locationInView:self];
    double v6 = v5;
    double v8 = v7;

    -[VKCImageSubjectHighlightView selectAndShowCalloutForTapToSelectModeAtPoint:](self, "selectAndShowCalloutForTapToSelectModeAtPoint:", v6, v8);
  }
  else
  {
    uint64_t v9 = [v4 state];

    if (v9 == 3)
    {
      [(VKCImageSubjectHighlightView *)self hideCalloutMenuIfNecessary];
    }
  }
}

- (void)selectAndShowCalloutForTapToSelectModeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = -[VKCImageSubjectBaseView indexOfSubjectAtPoint:](self, "indexOfSubjectAtPoint:");
  id v14 = v6;
  if (v6) {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v6, "integerValue"));
  }
  else {
  double v7 = [MEMORY[0x1E4F28D60] indexSet];
  }
  double v8 = [(VKCImageSubjectBaseView *)self subjectContext];
  uint64_t v9 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  char v10 = [v8 subjectIndexes:v7 equivalentToIndexes:v9];

  -[VKCImageSubjectHighlightView highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:](self, "highlightSubjectAtIndexSet:showCallout:showBurst:burstPoint:animated:", v7, v14 != 0, 0, 1, x, y);
  if (v14)
  {
    uint64_t v11 = [MEMORY[0x1E4F42B88] sharedMenuController];
    [v11 update];
LABEL_6:

    goto LABEL_10;
  }
  if ((v10 & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F42B88] sharedMenuController];
    int v13 = [v12 isMenuVisible];

    if (v13)
    {
      uint64_t v11 = [MEMORY[0x1E4F42B88] sharedMenuController];
      [v11 hideMenu];
      goto LABEL_6;
    }
  }
LABEL_10:
}

- (void)menuControllerWillHide:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = [v4 object];

  VKDynamicCast(v5, (uint64_t)v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v7 = [(VKCImageSubjectHighlightView *)self subjectViewUserInteractionDisabled];
  double v8 = [v18 _targetView];
  if (v8 == self)
  {
    BOOL v9 = [(VKCImageSubjectHighlightView *)self tapToSelectModeEnabled];

    if (!v9)
    {
      char v10 = [(VKCImageSubjectHighlightView *)self dragInteraction];
      int v11 = [v10 _isActive];

      if (v11)
      {
        double v12 = [(VKCImageSubjectHighlightView *)self dragInteraction];
        [v12 _cancelLift];
      }
      else if (![(VKCImageSubjectHighlightView *)self isHidingMenuController])
      {
        [(VKCImageSubjectHighlightView *)self setIsHidingMenuController:1];
        [(VKCImageSubjectHighlightView *)self setSubjectHighlightState:0 animated:1];
        [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
        [(VKCImageSubjectHighlightView *)self setIsHidingMenuController:0];
      }
      int v13 = [(VKCImageSubjectHighlightView *)self tapGR];
      [v13 setEnabled:0];

      BOOL v14 = !v7;
      double v15 = [(VKCImageSubjectHighlightView *)self dragInteraction];
      [v15 setEnabled:v14];

      uint64_t v16 = [(VKCImageSubjectHighlightView *)self isLivePhoto] & v14;
      double v17 = [(VKCImageSubjectHighlightView *)self livePhotoPlayGR];
      [v17 setEnabled:v16];

      [(VKCImageSubjectHighlightView *)self setGlowLayerActive:0];
      [(VKCImageSubjectHighlightView *)self setIsSelectAllActive:0];
    }
  }
  else
  {
  }
}

- (void)_tempGenerateStickerFromLivePhotoIfNecessaryWithProgress:(id)a3
{
  id v4 = a3;
  if ([(VKCImageSubjectHighlightView *)self isLivePhoto])
  {
    uint64_t v5 = [VKCRemoveBackgroundVideoRequest alloc];
    double v6 = [(VKCImageSubjectBaseView *)self analysisResult];
    BOOL v7 = [v6 request];
    double v8 = [(VKCRemoveBackgroundVideoRequest *)v5 initWithPhotosAnalyzerRequest:v7];

    BOOL v9 = +[VKImageDataRequirements stickerRequirements];
    char v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maxLength"));
    [(VKCRemoveBackgroundVideoRequest *)v8 setMaxDimension:v10];

    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "minLength"));
    [(VKCRemoveBackgroundVideoRequest *)v8 setMinDimension:v11];

    double v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maxDataLength"));
    [(VKCRemoveBackgroundVideoRequest *)v8 setMaxFileSize:v12];

    int v13 = [(VKCImageSubjectBaseView *)self burstPoint];
    BOOL v14 = v13;
    if (v13)
    {
      [v13 pointValue];
      -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
      VKMFlipPoint();
      v22[0] = v15;
      v22[1] = v16;
      double v17 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGPoint=dd}"];
      [(VKCRemoveBackgroundVideoRequest *)v8 setInstancePoint:v17];
    }
    id v18 = objc_alloc_init(VKCRemoveBackgroundVideoRequestHandler);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke;
    v19[3] = &unk_1E6BF1D70;
    objc_copyWeak(&v20, &location);
    v19[4] = self;
    [(VKCRemoveBackgroundVideoRequestHandler *)v18 performRequest:v8 previewResultAvailable:0 progress:v4 completion:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_2;
  v10[3] = &unk_1E6BF1D48;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = v5;
  id v11 = v7;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  vk_dispatchMainAfterDelay(v10, 0.0);

  objc_destroyWeak(&v14);
}

void __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = [a1[4] data];
    uint64_t v4 = [a1[4] utType];
    id v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F42728];
      id v8 = VKBundle();
      uint64_t v9 = [v8 localizedStringForKey:@"Error Extracting Heics" value:@"Error Extracting Heics" table:@"Localizable"];
      char v10 = [a1[5] localizedDescription];
      id v11 = [v7 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

      id v12 = (void *)MEMORY[0x1E4F42720];
      uint64_t v13 = VKBundle();
      id v14 = [v13 localizedStringForKey:@"OK" value:@"OK" table:@"Localizable"];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_3;
      v32[3] = &unk_1E6BF1D20;
      id v15 = v11;
      id v33 = v15;
      uint64_t v16 = [v12 actionWithTitle:v14 style:0 handler:v32];

      [v15 addAction:v16];
      double v17 = [a1[6] delegate];
      id v18 = [v17 presentingViewControllerForSubjectHighlightView:WeakRetained];
      double v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        CGRect v31 = [WeakRetained window];
        id v20 = [v31 rootViewController];
      }
      [v20 presentViewController:v15 animated:1 completion:&__block_literal_global_192];
    }
    else
    {
      id v21 = [WeakRetained delegate];
      uint64_t v22 = [v21 tempPNGURLForSubjectHighlightView:WeakRetained];

      double v23 = [v22 URLByDeletingPathExtension];
      double v24 = [v23 URLByAppendingPathExtensionForType:v5];

      [v3 writeToURL:v24 atomically:1];
      [WeakRetained bounds];
      double v29 = VKMCenterOfRect(v25, v26, v27, v28);
      objc_msgSend(WeakRetained, "showSharingPaneForURL:sourceRect:", v24, VKMRectWithCenterAndSize(v29, v30, 1.0));
    }
  }
}

uint64_t __89__VKCImageSubjectHighlightView__tempGenerateStickerFromLivePhotoIfNecessaryWithProgress___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)showSharingPaneForURL:(id)a3 sourceRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__VKCImageSubjectHighlightView_showSharingPaneForURL_sourceRect___block_invoke;
  v11[3] = &unk_1E6BF1D98;
  objc_copyWeak(v13, &location);
  v11[4] = self;
  id v10 = v9;
  id v12 = v10;
  v13[1] = *(id *)&x;
  v13[2] = *(id *)&y;
  v13[3] = *(id *)&width;
  v13[4] = *(id *)&height;
  vk_performBlockOnMainThread(v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __65__VKCImageSubjectHighlightView_showSharingPaneForURL_sourceRect___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = [v3 presentingViewControllerForSubjectHighlightView:WeakRetained];
    if (v4)
    {
      id v5 = (void *)v4;

LABEL_5:
      id v7 = objc_alloc(MEMORY[0x1E4F42718]);
      v18[0] = *(void *)(a1 + 40);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      id v9 = (void *)[v7 initWithActivityItems:v8 applicationActivities:MEMORY[0x1E4F1CBF0]];

      uint64_t v17 = *MEMORY[0x1E4F43620];
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      [v9 setExcludedActivityTypes:v10];

      double v11 = *(double *)(a1 + 56);
      double v12 = *(double *)(a1 + 64);
      double v13 = *(double *)(a1 + 72);
      double v14 = *(double *)(a1 + 80);
      id v15 = [v9 popoverPresentationController];
      objc_msgSend(v15, "setSourceRect:", v11, v12, v13, v14);

      uint64_t v16 = [v9 popoverPresentationController];
      [v16 setSourceView:WeakRetained];

      [v5 presentViewController:v9 animated:1 completion:0];
      goto LABEL_6;
    }
    BOOL v6 = [WeakRetained window];
    id v5 = [v6 rootViewController];

    if (v5) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)_share
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v11 = self;
    _os_log_impl(&dword_1DB266000, v3, OS_LOG_TYPE_DEFAULT, "Activating Subject share from callout menu: %@", buf, 0xCu);
  }

  uint64_t v4 = [(VKCImageBaseOverlayView *)self recognitionResult];
  objc_initWeak((id *)buf, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__VKCImageSubjectHighlightView__share__block_invoke;
  v6[3] = &unk_1E6BF1DC0;
  objc_copyWeak(&v9, (id *)buf);
  id v5 = v4;
  id v7 = v5;
  id v8 = self;
  [(VKCImageSubjectBaseView *)self loadImageSubjectIfNecessaryWithCompletion:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __38__VKCImageSubjectHighlightView__share__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    BOOL v6 = objc_msgSend(v3, "vk_PNGData");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__VKCImageSubjectHighlightView__share__block_invoke_2;
    v10[3] = &unk_1E6BF1D48;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    id v7 = v6;
    id v11 = v7;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v12 = v8;
    uint64_t v13 = v9;
    vk_performBlockOnMainThread(v10);

    objc_destroyWeak(&v14);
  }
}

void __38__VKCImageSubjectHighlightView__share__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(void *)(a1 + 32))
  {
    id v21 = WeakRetained;
    id v3 = [WeakRetained recognitionResult];
    uint64_t v4 = *(void **)(a1 + 40);

    id WeakRetained = v21;
    if (v3 == v4)
    {
      id v5 = [v21 delegate];
      BOOL v6 = [v5 tempPNGURLForSubjectHighlightView:v21];

      [*(id *)(a1 + 32) writeToURL:v6 atomically:1];
      id v7 = [*(id *)(a1 + 48) subjectPathInBoundsCoordinates];
      [v7 bounds];
      double v12 = VKMCenterOfRect(v8, v9, v10, v11);
      double v14 = VKMRectWithCenterAndSize(v12, v13, 1.0);
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      objc_msgSend(*(id *)(a1 + 48), "showSharingPaneForURL:sourceRect:", v6, v14, v16, v18, v20);
      [v21 sendSubjectAnalyticsEventWithEventType:2 interactionType:2 subjectFound:1 processingDuration:0.0];

      id WeakRetained = v21;
    }
  }
}

- (void)_define:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CGFloat v10 = self;
    _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_DEFAULT, "Activating Subject LookUp from callout menu: %@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = [(VKCImageSubjectBaseView *)self subjectContext];
  BOOL v6 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  [(VKCImageBaseOverlayView *)self contentsRect];
  id v7 = objc_msgSend(v5, "normalizedPathForSubjectWithIndexSet:contentsRect:topLevelOnly:", v6, 1);

  CGFloat v8 = [(VKCImageSubjectHighlightView *)self delegate];
  [v8 subjectHighlightView:self activateVSItemForNormalizedPath:v7];
}

- (void)_share:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__VKCImageSubjectHighlightView__share___block_invoke;
  v5[3] = &unk_1E6BF0CF0;
  objc_copyWeak(&v6, &location);
  vk_requestDeviceUnlockIfNecessaryWithCompletion(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__VKCImageSubjectHighlightView__share___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __39__VKCImageSubjectHighlightView__share___block_invoke_2;
    v2[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    vk_dispatchMainAfterDelay(v2, 0.0);
    objc_destroyWeak(&v3);
  }
}

void __39__VKCImageSubjectHighlightView__share___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained delegate];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__VKCImageSubjectHighlightView__share___block_invoke_3;
    v5[3] = &unk_1E6BF0D90;
    objc_copyWeak(&v6, v1);
    [v4 subjectHighlightView:v3 prepareForCalloutAction:sel__share_ completion:v5];

    objc_destroyWeak(&v6);
  }
}

void __39__VKCImageSubjectHighlightView__share___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _share];
}

- (void)copy:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v10 = self;
    _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_DEFAULT, "Subject copy: %@", buf, 0xCu);
  }

  id v5 = [(VKCImageSubjectHighlightView *)self createItemProvider];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F42C50] generalPasteboard];
    CGFloat v8 = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    [v6 setItemProviders:v7];

    [(VKCImageSubjectBaseView *)self sendSubjectAnalyticsEventWithEventType:2 interactionType:1 subjectFound:1 processingDuration:0.0];
  }
}

- (id)createItemProvider
{
  objc_initWeak(&location, self);
  id v3 = [(VKCImageSubjectBaseView *)self analysisResult];
  BOOL v4 = +[VKCInternalSettings addSubjectCropRectToPasteboard];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  id v6 = [(VKCImageSubjectBaseView *)self subjectContext];
  uint64_t v7 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke;
  v24[3] = &unk_1E6BF1E38;
  objc_copyWeak(&v27, &location);
  id v8 = v3;
  id v25 = v8;
  id v9 = v6;
  id v26 = v9;
  [v5 registerObjectOfClass:v7 visibility:0 loadHandler:v24];
  if (v4)
  {
    CGFloat v10 = [(VKCImageSubjectBaseView *)self subjectContext];
    [(VKCImageBaseOverlayView *)self contentsRect];
    uint64_t v11 = objc_msgSend(v10, "normalizedPathForActiveSubjectsWithContentsRect:topLevelOnly:", 0);
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    uint64_t v20 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_4;
    v22[3] = &unk_1E6BF1E88;
    objc_copyWeak(v23, &location);
    v23[1] = v13;
    v23[2] = v15;
    v23[3] = v17;
    v23[4] = v19;
    [v5 registerObjectOfClass:v20 visibility:0 loadHandler:v22];
    objc_destroyWeak(v23);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  return v5;
}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained analysisResult],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = *(void **)(a1 + 32),
        v6,
        v6 == v7))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_2;
    v16[3] = &unk_1E6BF1DE8;
    id v17 = v3;
    id v8 = (VKCRemoveBackgroundRequestHandler *)v3;
    [v5 loadImageSubjectIfNecessaryWithCompletion:v16];
    id v11 = v17;
  }
  else
  {
    id v8 = objc_alloc_init(VKCRemoveBackgroundRequestHandler);
    id v9 = [*(id *)(a1 + 40) request];
    [v9 setMaskOnly:0];
    [v9 setCropToFit:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_3;
    v13[3] = &unk_1E6BF1E10;
    id v14 = v9;
    id v15 = v3;
    id v10 = v3;
    id v11 = v9;
    [(VKCRemoveBackgroundRequestHandler *)v8 performRequest:v11 completion:v13];
  }
  return 0;
}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = vk_cgImageFromPixelBuffer((__CVBuffer *)[a2 pixelBuffer]);
  objc_msgSend(MEMORY[0x1E4F42A80], "vk_imageWithCGImage:", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v6);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_orientedImageFromImage:toOrientation:", v8, objc_msgSend(*(id *)(a1 + 32), "imageOrientation"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_5;
    v7[3] = &unk_1E6BF1E60;
    id v8 = v3;
    long long v5 = *(_OWORD *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 40);
    long long v10 = v5;
    [WeakRetained loadImageSubjectIfNecessaryWithCompletion:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }

  return 0;
}

void __50__VKCImageSubjectHighlightView_createItemProvider__block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  NSStringFromCGRect(*(CGRect *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (CGRect)subjectBoundsClippedToVisibleRectWithShouldInsetForCallout:(BOOL)a3
{
  BOOL v3 = a3;
  [(VKCImageBaseOverlayView *)self normalizedVisibleRect];
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:");
  CGFloat v9 = v8;
  BOOL v10 = v7 > 88.0;
  if (v10 && v3) {
    double v11 = v7 + -44.0;
  }
  else {
    double v11 = v7;
  }
  if (v10 && v3) {
    double v12 = v6 + 0.0;
  }
  else {
    double v12 = v6;
  }
  if (v10 && v3) {
    double v13 = v5 + 0.0;
  }
  else {
    double v13 = v5;
  }
  id v14 = [(VKCImageSubjectBaseView *)self subjectPathInBoundsCoordinates];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.CGFloat x = v13;
  v31.origin.CGFloat y = v12;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v11;
  v35.origin.CGFloat x = v16;
  v35.origin.CGFloat y = v18;
  v35.size.CGFloat width = v20;
  v35.size.CGFloat height = v22;
  CGRect v32 = CGRectIntersection(v31, v35);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  if (VKMRectHasArea(v32.origin.x, v32.origin.y, v32.size.width, v32.size.height))
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    if (!CGRectIsNull(v33))
    {
      CGFloat v22 = height;
      CGFloat v20 = width;
      CGFloat v18 = y;
      CGFloat v16 = x;
    }
  }
  double v27 = v16;
  double v28 = v18;
  double v29 = v20;
  double v30 = v22;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)createStickerRepresentationsAtIndexSet:(id)a3 type:(unint64_t)a4 stickerIDs:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke;
  v18[3] = &unk_1E6BF1F50;
  id v21 = v14;
  unint64_t v22 = a4;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  [(VKCImageSubjectBaseView *)self loadImageSubjectWithIndexes:a3 completion:v18];
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__6;
  v52[4] = __Block_byref_object_dispose__6;
  id v53 = [MEMORY[0x1E4F1CA48] array];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2810000000;
  v50[3] = &unk_1DB350762;
  int v51 = 0;
  unint64_t v4 = *(void *)(a1 + 64);
  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = VKMUIStringForStickerRepresentationType(*(void *)(a1 + 64));
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Beginning sticker rep creation with types: %@, %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v55 = __Block_byref_object_copy__6;
  id v56 = __Block_byref_object_dispose__6;
  id v57 = 0;
  double v8 = dispatch_group_create();
  CGFloat v9 = +[VKImageDataRequirements stickerRequirements];
  if (v4)
  {
    dispatch_group_enter(v8);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_204;
    v45[3] = &unk_1E6BF0DE0;
    id v46 = v9;
    double v48 = v50;
    double v49 = v52;
    double v47 = v8;
    objc_msgSend(v3, "vk_imageDataWithRequirements:completion:", v46, v45);
  }
  if ((v4 & 4) != 0)
  {
    dispatch_group_enter(v8);
    BOOL v10 = +[VKImageDataRequirements stickerThumbnailRequirements];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_2;
    v41[3] = &unk_1E6BF0E08;
    double v43 = v50;
    double v44 = v52;
    double v42 = v8;
    objc_msgSend(v3, "vk_imageDataWithRequirements:completion:", v10, v41);
  }
  if (([*(id *)(a1 + 32) isLivePhoto] & (v4 >> 1) & 1) == 1)
  {
    double v11 = [VKCRemoveBackgroundVideoRequest alloc];
    id v12 = [*(id *)(a1 + 32) analysisResult];
    id v13 = [v12 request];
    id v14 = [(VKCRemoveBackgroundVideoRequest *)v11 initWithPhotosAnalyzerRequest:v13];

    [(VKCRemoveBackgroundVideoRequest *)v14 setStickerIDs:*(void *)(a1 + 40)];
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maxLength"));
    [(VKCRemoveBackgroundVideoRequest *)v14 setMaxDimension:v15];

    id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "minLength"));
    [(VKCRemoveBackgroundVideoRequest *)v14 setMinDimension:v16];

    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "maxDataLength"));
    [(VKCRemoveBackgroundVideoRequest *)v14 setMaxFileSize:v17];

    CGFloat v18 = [*(id *)(a1 + 32) burstPoint];
    id v19 = v18;
    if (v18)
    {
      id v20 = *(void **)(a1 + 32);
      [v18 pointValue];
      objc_msgSend(v20, "normalizedPointFromViewPoint:");
      VKMFlipPoint();
      v40[0] = v21;
      v40[1] = v22;
      double v23 = [MEMORY[0x1E4F29238] valueWithBytes:v40 objCType:"{CGPoint=dd}"];
      [(VKCRemoveBackgroundVideoRequest *)v14 setInstancePoint:v23];
    }
    double v24 = objc_alloc_init(VKCRemoveBackgroundVideoRequestHandler);
    dispatch_group_enter(v8);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_3;
    v39[3] = &unk_1E6BF1EB0;
    v39[4] = *(void *)(a1 + 32);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_5;
    v36[3] = &unk_1E6BF1ED8;
    id v38 = *(id *)(a1 + 48);
    id v37 = *(id *)(a1 + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_6;
    v33[3] = &unk_1E6BF1F00;
    CGRect v35 = buf;
    double v34 = v8;
    [(VKCRemoveBackgroundVideoRequestHandler *)v24 performRequest:v14 previewResultAvailable:v39 progress:v36 completion:v33];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_7;
  v27[3] = &unk_1E6BF1F28;
  uint64_t v25 = *(void *)(a1 + 32);
  id v28 = v3;
  uint64_t v29 = v25;
  id v30 = *(id *)(a1 + 56);
  CGRect v31 = v52;
  CGRect v32 = buf;
  id v26 = v3;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v27);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_204(uint64_t a1, void *a2, double a3, double a4)
{
  if (a2)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F43338];
    id v8 = a2;
    id v9 = objc_alloc_init(v7);
    [v9 setData:v8];

    [v9 setRole:@"com.apple.stickers.role.still"];
    BOOL v10 = [*(id *)(a1 + 32) uti];
    [v9 setType:v10];

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) insertObject:v9 atIndex:0];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  }
  double v11 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v11);
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_2(void *a1, void *a2, double a3, double a4)
{
  if (a2)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F43338];
    id v8 = a2;
    id v9 = objc_alloc_init(v7);
    [v9 setData:v8];

    [v9 setRole:@"com.apple.stickers.role.keyboard"];
    BOOL v10 = +[VKImageDataRequirements stickerThumbnailRequirements];
    double v11 = [v10 uti];
    [v9 setType:v11];

    objc_msgSend(v9, "setSize:", a3, a4);
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1[5] + 8) + 32));
  }
  id v12 = a1[4];
  dispatch_group_leave(v12);
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_4;
  v5[3] = &unk_1E6BF12B8;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  vk_performBlockOnMainThread(v5);
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setVideoPreview:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 videoPreviewAvailableForSubjectHighlightView:*(void *)(a1 + 32)];
}

uint64_t __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_6(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __107__VKCImageSubjectHighlightView_createStickerRepresentationsAtIndexSet_type_stickerIDs_progress_completion___block_invoke_7(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) subjectPathInBoundsCoordinates];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)videoPreviewSubjectMatteAtCompositionTime:(id *)a3
{
  id v4 = [(VKCImageSubjectHighlightView *)self videoPreview];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  id v5 = [v4 subjectMatteAtCompositionTime:&v7];

  return v5;
}

- (id)videoPreviewSubjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = [(VKCImageSubjectHighlightView *)self videoPreview];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  id v8 = [v7 subjectMatteForImage:v6 atCompositionTime:&v10];

  return v8;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)videoPreviewTimeRange
{
  id v4 = [(VKCImageSubjectHighlightView *)self videoPreview];
  if (v4)
  {
    id v6 = v4;
    [v4 timeRange];
    id v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGRect)videoPreviewNormalizedCropRect
{
  id v2 = [(VKCImageSubjectHighlightView *)self videoPreview];
  [v2 normalizedCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)stickerPickerViewControllerDidLoad
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__VKCImageSubjectHighlightView_stickerPickerViewControllerDidLoad__block_invoke;
  v2[3] = &unk_1E6BF0D18;
  void v2[4] = self;
  vk_dispatchMainAfterDelay(v2, 0.5);
}

uint64_t __66__VKCImageSubjectHighlightView_stickerPickerViewControllerDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSticker];
}

- (void)addSticker
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  BOOL v3 = [(VKCImageSubjectHighlightView *)self isLivePhoto];
  double v4 = [(VKCImageSubjectBaseView *)self activeSubjectIndexSet];
  double v5 = (void *)[v4 copy];

  double v6 = [(VKCImageSubjectHighlightView *)self stickerPickerViewController];
  char v7 = objc_opt_respondsToSelector();

  char v8 = v7 & 1;
  if (v7) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 7;
  }
  double v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = self;
    _os_log_impl(&dword_1DB266000, v10, OS_LOG_TYPE_DEFAULT, "StickerPickerDidLoad: %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke;
  v12[3] = &unk_1E6BF2010;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  char v15 = v8;
  BOOL v16 = v3;
  id v11 = v5;
  id v13 = v11;
  [(VKCImageSubjectHighlightView *)self createStickerRepresentationsAtIndexSet:v11 type:v9 stickerIDs:MEMORY[0x1E4F1CBF0] progress:0 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (v9)
  {
    double v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_cold_1();
    }
  }
  else
  {
    if (!WeakRetained) {
      goto LABEL_5;
    }
    if (*(unsigned char *)(a1 + 56))
    {
      id v13 = [WeakRetained stickerPickerViewController];
      uint64_t v14 = *(void *)(a1 + 32);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_217;
      v16[3] = &unk_1E6BF1FE8;
      objc_copyWeak(&v18, (id *)(a1 + 48));
      char v15 = *(void **)(a1 + 40);
      void v16[4] = *(void *)(a1 + 32);
      char v19 = *(unsigned char *)(a1 + 57);
      id v17 = v15;
      [v13 addStickerWithRepresentations:v7 previewView:v8 originatingView:v14 completion:v16];

      objc_destroyWeak(&v18);
      goto LABEL_5;
    }
    double v12 = [*(id *)(a1 + 32) stickerPickerViewController];
    [v12 addStickerWithRepresentations:v7 previewView:v8 originatingView:*(void *)(a1 + 32)];
  }

LABEL_5:
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_217_cold_1();
    }
LABEL_4:

    goto LABEL_5;
  }
  if (WeakRetained && *(unsigned char *)(a1 + 56))
  {
    double v10 = [*(id *)(a1 + 32) subjectContext];
    id v11 = [v10 request];
    uint64_t v12 = [v11 animatedStickerScore];
    id v13 = (void *)v12;
    uint64_t v14 = &unk_1F357DB60;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    id v9 = v14;

    char v15 = [v8 stickerPickerViewController];
    BOOL v16 = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_218(0.0, (uint64_t)v15, @"begin", v5, v9);
    [v15 animatedStickerCreationProgressChanged:v16 progress:0.0];

    uint64_t v17 = *(void *)(a1 + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_228;
    v25[3] = &unk_1E6BF1F98;
    objc_copyWeak(&v27, (id *)(a1 + 48));
    id v26 = &__block_literal_global_221;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2;
    v19[3] = &unk_1E6BF1FC0;
    uint64_t v18 = *(void *)(a1 + 32);
    id v20 = 0;
    uint64_t v21 = v18;
    objc_copyWeak(&v24, (id *)(a1 + 48));
    id v23 = &__block_literal_global_221;
    id v22 = v5;
    [v8 createStickerRepresentationsAtIndexSet:v17 type:2 stickerIDs:v22 progress:v25 completion:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    goto LABEL_4;
  }
LABEL_5:
}

id __42__VKCImageSubjectHighlightView_addSticker__block_invoke_218(double a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v18[0] = a3;
  v17[0] = @"type";
  v17[1] = @"progress";
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 numberWithDouble:a1];
  id v13 = (void *)v12;
  id v14 = (id)MEMORY[0x1E4F1CBF0];
  if (v10) {
    id v14 = v10;
  }
  v18[1] = v12;
  void v18[2] = v14;
  v17[2] = @"stickerIDs";
  v17[3] = @"stickerScore";
  v18[3] = v9;
  char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_228(uint64_t a1, void *a2, double a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained subjectContext];
  id v8 = [v7 request];
  uint64_t v9 = [v8 animatedStickerScore];
  id v10 = (void *)v9;
  id v11 = &unk_1F357DB60;
  if (v9) {
    id v11 = (void *)v9;
  }
  id v12 = v11;

  id v13 = [WeakRetained stickerPickerViewController];
  id v14 = (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);

  [v13 animatedStickerCreationProgressChanged:v14 progress:a3];
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    BOOL v3 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.Stickers");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2_cold_1(v2, a1, v3);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      id v14 = WeakRetained;
      id v5 = [WeakRetained subjectContext];
      id v6 = [v5 request];
      uint64_t v7 = [v6 animatedStickerScore];
      id v8 = (void *)v7;
      uint64_t v9 = &unk_1F357DB60;
      if (v7) {
        uint64_t v9 = (void *)v7;
      }
      id v10 = v9;

      id v11 = objc_loadWeakRetained((id *)(a1 + 64));
      id v12 = [v11 stickerPickerViewController];
      id v13 = (*(void (**)(double))(*(void *)(a1 + 56) + 16))(100.0);

      [v12 animatedStickerCreationProgressChanged:v13 progress:100.0];
      id WeakRetained = v14;
    }
  }
}

- (void)stickerPickerViewControllerDidDismiss
{
}

- (BOOL)isLivePhoto
{
  return self->_isLivePhoto;
}

- (VKCImageSubjectHighlightViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCImageSubjectHighlightViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)subjectInteractionInProgress
{
  return self->_subjectInteractionInProgress;
}

- (BOOL)tapToSelectModeEnabled
{
  return self->_tapToSelectModeEnabled;
}

- (BOOL)subjectViewUserInteractionDisabled
{
  return self->_subjectViewUserInteractionDisabled;
}

- (unint64_t)subjectHighlightState
{
  return self->_subjectHighlightState;
}

- (UILongPressGestureRecognizer)livePhotoPlayGR
{
  return self->_livePhotoPlayGR;
}

- (void)setLivePhotoPlayGR:(id)a3
{
}

- (UITapGestureRecognizer)tapGR
{
  return self->_tapGR;
}

- (void)setTapGR:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (UIPanGestureRecognizer)coyotePanGR
{
  return self->_coyotePanGR;
}

- (void)setCoyotePanGR:(id)a3
{
}

- (BOOL)shouldShowCalloutOnDragCancel
{
  return self->_shouldShowCalloutOnDragCancel;
}

- (void)setShouldShowCalloutOnDragCancel:(BOOL)a3
{
  self->_shouldShowCalloutOnDragCancel = a3;
}

- (BOOL)glowLayerWasActiveOnLift
{
  return self->_glowLayerWasActiveOnLift;
}

- (void)setGlowLayerWasActiveOnLift:(BOOL)a3
{
  self->_glowLayerWasActiveOnLift = a3;
}

- (BOOL)isHidingMenuController
{
  return self->_isHidingMenuController;
}

- (void)setIsHidingMenuController:(BOOL)a3
{
  self->_isHidingMenuController = a3;
}

- (CALayer)colorMaskLayer
{
  return self->_colorMaskLayer;
}

- (void)setColorMaskLayer:(id)a3
{
}

- (CGImage)colorMaskImage
{
  return self->_colorMaskImage;
}

- (VKCSubjectLiftView)currentLiftView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLiftView);
  return (VKCSubjectLiftView *)WeakRetained;
}

- (void)setCurrentLiftView:(id)a3
{
}

- (UIImageView)currentLiftImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentLiftImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setCurrentLiftImageView:(id)a3
{
}

- (double)dragInteractionStartTime
{
  return self->_dragInteractionStartTime;
}

- (void)setDragInteractionStartTime:(double)a3
{
  self->_dragInteractionStartTime = a3;
}

- (CGPoint)dragInteractionStartLocation
{
  double x = self->_dragInteractionStartLocation.x;
  double y = self->_dragInteractionStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragInteractionStartLocation:(CGPoint)a3
{
  self->_dragInteractionStartLocation = a3;
}

- (NSDate)livePhotoStartTime
{
  return self->_livePhotoStartTime;
}

- (void)setLivePhotoStartTime:(id)a3
{
}

- (NSDate)calloutStartTime
{
  return self->_calloutStartTime;
}

- (void)setCalloutStartTime:(id)a3
{
}

- (BOOL)isSelectAllActive
{
  return self->_isSelectAllActive;
}

- (void)setIsSelectAllActive:(BOOL)a3
{
  self->_isSelectAllActive = a3;
}

- (BOOL)isLiftingEmptyItemArray
{
  return self->_isLiftingEmptyItemArray;
}

- (void)setIsLiftingEmptyItemArray:(BOOL)a3
{
  self->_isLiftingEmptyItemArradouble y = a3;
}

- (BOOL)isLivePhotoCheckCompleted
{
  return self->_isLivePhotoCheckCompleted;
}

- (void)setIsLivePhotoCheckCompleted:(BOOL)a3
{
  self->_isLivePhotoCheckCompleted = a3;
}

- (BOOL)subjectAnalysisCompleteWhenTouchesBegan
{
  return self->_subjectAnalysisCompleteWhenTouchesBegan;
}

- (void)setSubjectAnalysisCompleteWhenTouchesBegan:(BOOL)a3
{
  self->_subjectAnalysisCompleteWhenTouchesBegan = a3;
}

- (BOOL)analysisDelayTimerActive
{
  return self->_analysisDelayTimerActive;
}

- (void)setAnalysisDelayTimerActive:(BOOL)a3
{
  self->_analysisDelayTimerActive = a3;
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (_UIStickerPickerViewController)stickerPickerViewController
{
  return self->_stickerPickerViewController;
}

- (void)setStickerPickerViewController:(id)a3
{
}

- (VKCRemoveBackgroundVideoPreviewResult)videoPreview
{
  return self->_videoPreview;
}

- (void)setVideoPreview:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_videoPreview, 0);
  objc_storeStrong((id *)&self->_stickerPickerViewController, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_calloutStartTime, 0);
  objc_storeStrong((id *)&self->_livePhotoStartTime, 0);
  objc_destroyWeak((id *)&self->_currentLiftImageView);
  objc_destroyWeak((id *)&self->_currentLiftView);
  objc_storeStrong((id *)&self->_colorMaskLayer, 0);
  objc_storeStrong((id *)&self->_coyotePanGR, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_livePhotoPlayGR, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_1DB266000, v0, v1, "Error createStickerRepresentationsAtIndexSet: %@, %@");
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_217_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_1DB266000, v0, v1, "Error adding stickers with representation: %@, %@");
}

void __42__VKCImageSubjectHighlightView_addSticker__block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)BOOL v3 = 138412546;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 40);
  OUTLINED_FUNCTION_1_0(&dword_1DB266000, a2, a3, "Error creating StickerRepresentationsAtIndexSet for animated sticker: %@, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end