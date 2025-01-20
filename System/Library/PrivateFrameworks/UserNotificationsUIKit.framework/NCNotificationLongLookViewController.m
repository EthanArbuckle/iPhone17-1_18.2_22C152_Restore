@interface NCNotificationLongLookViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldPadScrollViewContentSizeHeight;
- (BOOL)associatedViewControllerDidAppearForExpandedPlatterView:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)expandedPlatterPresentationControllerShouldAllowKeyboardOnAppearance:(id)a3;
- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3;
- (BOOL)isContentExtensionVisible:(id)a3;
- (BOOL)isLookStyleLongLook;
- (BOOL)notificationLongLookView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)restoreInputViews;
- (CGRect)expandedPlatterPresentationController:(id)a3 frameForTransitionViewInPresentationSuperview:(id)a4;
- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (PLClickPresentationInteractionPresenting)presenter;
- (PLExpandedPlatterDismissing)dismisser;
- (id)_expandedPlatterPresentationViewLoadingIfNecessary:(BOOL)a3;
- (id)_expandedPlatterPresentationViewScrollView;
- (id)_extensionIdentifier;
- (id)_initWithNotificationRequest:(id)a3 andPresentingNotificationViewController:(id)a4 revealingAdditionalContentOnPresentation:(BOOL)a5;
- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4;
- (id)_longLookViewIfLoaded;
- (id)_longLookViewLoadingIfNecessary;
- (id)_longLookViewScrollView;
- (id)_notificationTapBlock;
- (id)_presentedLongLookViewController;
- (id)_presentingNotificationViewController;
- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3;
- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4;
- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3;
- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3;
- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3;
- (int64_t)viewControllerTransitionTypeForTransitionDelegate:(id)a3;
- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent;
- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent;
- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5;
- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3;
- (void)_handleIconButton:(id)a3;
- (void)_handleNotificationTap:(id)a3;
- (void)_loadLookView;
- (void)_notificationViewControllerViewDidLoad;
- (void)_setNotificationTapBlock:(id)a3;
- (void)_setPreferredCustomContentSize:(CGSize)a3;
- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4;
- (void)_updateTitleWithProvidedCustomContent;
- (void)_updateWithProvidedCustomContent;
- (void)_updateWithProvidedStaticContent;
- (void)contentProviderDismissCustomContent:(id)a3 animated:(BOOL)a4;
- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4;
- (void)customContentDidLoadExtension:(id)a3;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4;
- (void)loadView;
- (void)notificationLongLookView:(id)a3 willInteractWithURL:(id)a4;
- (void)playMedia;
- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5;
- (void)preserveInputViews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3;
- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3;
- (void)setDismisser:(id)a3;
- (void)setNotificationRequest:(id)a3;
- (void)setPresenter:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NCNotificationLongLookViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [&__block_literal_global_42 copy];
    v3 = (void *)__willInteractWithLinkSentinelBlock;
    __willInteractWithLinkSentinelBlock = v2;
  }
}

- (id)_initWithNotificationRequest:(id)a3 andPresentingNotificationViewController:(id)a4 revealingAdditionalContentOnPresentation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationLongLookViewController;
  v9 = [(NCNotificationViewController *)&v15 _initWithNotificationRequest:a3 revealingAdditionalContentOnPresentation:v5];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(v9 + 146, v8);
    v11 = objc_alloc_init(NCLongLookTransitioningDelegate);
    id v12 = v10[144];
    v10[144] = v11;

    [v10 setTransitioningDelegate:v10[144]];
    [v10 setModalPresentationStyle:4];
    [v10 _setupCustomContentProvider];
    v13 = [v10 _customContentProvidingViewControllerCreateIfNecessary];
    [v10 _setCustomContentProvidingViewController:v13];

    [v10 _setShouldRestorePresentingShortLookOnDismiss:1];
  }

  return v10;
}

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  return [(NCNotificationLongLookViewController *)self _initWithNotificationRequest:a3 andPresentingNotificationViewController:0 revealingAdditionalContentOnPresentation:a4];
}

- (void)setNotificationRequest:(id)a3
{
  p_presenter = &self->_presenter;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_presenter);
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v7 setNotificationRequest:v5];
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationLongLookViewController *)self _extensionIdentifier];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (void)preserveInputViews
{
  id v2 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 preserveInputViews];
  }
}

- (BOOL)restoreInputViews
{
  id v2 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 restoreInputViews];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController setCustomContentHomeAffordanceVisible:](&v6, sel_setCustomContentHomeAffordanceVisible_);
  id v5 = [(NCNotificationLongLookViewController *)self expandedPlatterPresentationController];
  [v5 setHomeAffordanceVisible:v3];
}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  id v4 = a3;
  [(NCNotificationViewController *)&v6 setCustomContentHomeAffordanceGestureRecognizer:v4];
  id v5 = [(NCNotificationLongLookViewController *)self expandedPlatterPresentationController];
  [v5 setHomeAffordancePanGesture:v4];
}

- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4
{
  id v8 = a4;
  id v5 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  objc_super v6 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  if ([v5 overridesDefaultTitle])
  {
    objc_super v7 = [v5 title];
    [v6 setTitle:v7];
  }
  else
  {
    [v6 setTitle:v8];
  }
}

- (void)playMedia
{
  id v2 = [(NCNotificationViewController *)self _customContentProvidingViewControllerCreateIfNecessary];
  if (objc_opt_respondsToSelector()) {
    [v2 playMedia];
  }
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F91428]);
  [(NCNotificationLongLookViewController *)self setView:v3];
  [v3 setPresentableViewController:self];
  [v3 setDelegate:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  if (v3)
  {
    id v4 = [(NCNotificationLongLookViewController *)self _expandedPlatterPresentationViewScrollView];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v6 viewWillAppear:a3];
  id v4 = [(NCNotificationLongLookViewController *)self view];
  objc_super v5 = [v4 window];
  [v5 makeKeyAndVisible];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v6 viewDidDisappear:a3];
  id v4 = [(NCNotificationLongLookViewController *)self view];
  objc_super v5 = [v4 window];
  [v5 resignKeyWindow];
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_super v7 = [(NCNotificationLongLookViewController *)self presenter];
  id v8 = [v7 clickPresentationInteractionManager];

  if (([v8 dismissIfPossible:v6] & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    [(NCNotificationViewController *)&v9 dismissViewControllerWithTransition:v4 completion:v6];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationLongLookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v26, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id v8 = [(UIViewController *)self nc_presentationControllerIfPresented];
  if (v8)
  {
    double v9 = NCRectWithSize();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v16 = [v7 containerView];
    [v16 bounds];
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  v21 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.double width = v13;
  v27.size.double height = v15;
  double v22 = CGRectGetWidth(v27);
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.double width = v13;
  v28.size.double height = v15;
  [v21 setDismissControlPosition:v22 > CGRectGetHeight(v28)];

  -[NCNotificationLongLookViewController _preferredCustomContentSizeForSize:parentContentContainerBounds:](self, "_preferredCustomContentSizeForSize:parentContentContainerBounds:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v9, v11, v13, v15);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__NCNotificationLongLookViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_1E6A93C28;
  v25[4] = self;
  v25[5] = v23;
  v25[6] = v24;
  [v7 animateAlongsideTransition:v25 completion:0];
}

uint64_t __91__NCNotificationLongLookViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPreferredCustomContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v8 == v7)
  {
    objc_msgSend(v7, "sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationLongLookViewController;
    -[NCNotificationLongLookViewController sizeForChildContentContainer:withParentContainerSize:](&v15, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)contentProviderDismissCustomContent:(id)a3 animated:(BOOL)a4
{
}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v8;
    double v10 = [(NCNotificationViewController *)self notificationRequest];
    double v11 = [v10 notificationIdentifier];
    double v12 = objc_msgSend(v11, "un_logDigest");
    *(_DWORD *)buf = 138543362;
    double v22 = v12;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Custom content extension is updating long look actions for notification request %{public}@", buf, 0xCu);
  }
  double v13 = [(NCNotificationViewController *)self staticContentProvider];
  [v13 setOverriddenActions:v7];

  [(NCNotificationLongLookViewController *)self _updateWithProvidedStaticContent];
  [(NCNotificationLongLookViewController *)self preferredContentSize];
  double v15 = v14;
  double v17 = v16;
  [(NCNotificationViewController *)self _updatePreferredContentSize];
  [(NCNotificationLongLookViewController *)self preferredContentSize];
  if (v15 == v19 && v17 == v18)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__NCNotificationLongLookViewController_customContent_didUpdateUserNotificationActions___block_invoke;
    v20[3] = &unk_1E6A91BB0;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v20 options:0 animations:0.25 completion:0.0];
  }
}

void __87__NCNotificationLongLookViewController_customContent_didUpdateUserNotificationActions___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _longLookViewIfLoaded];
  [v1 layoutIfNeeded];
}

- (void)expandedPlatterPresentable:(id)a3 requestsDismissalWithTrigger:(int64_t)a4
{
  id v6 = a3;
  id v19 = v6;
  switch(a4)
  {
    case 1:
      id v7 = +[NCNotificationEventTracker sharedInstance];
      id v8 = [(NCNotificationViewController *)self notificationRequest];
      double v9 = [(NCNotificationViewController *)self notificationUsageTrackingState];
      [v7 longLookDismissInvokedWithTrigger:0 forNotificationRequest:v8 withState:v9];

      [(NCNotificationViewController *)self _executeClearAction:1];
      double v10 = [(NCNotificationViewController *)self _customContentProvidingViewController];
      [v10 beginAppearanceTransition:0 animated:1];
      [v10 endAppearanceTransition];

      goto LABEL_7;
    case 2:
      double v11 = +[NCNotificationEventTracker sharedInstance];
      double v12 = [(NCNotificationViewController *)self notificationRequest];
      double v13 = [(NCNotificationViewController *)self notificationUsageTrackingState];
      double v14 = v11;
      uint64_t v15 = 0;
      goto LABEL_5;
    case 3:
      double v11 = +[NCNotificationEventTracker sharedInstance];
      double v12 = [(NCNotificationViewController *)self notificationRequest];
      double v13 = [(NCNotificationViewController *)self notificationUsageTrackingState];
      double v14 = v11;
      uint64_t v15 = 1;
LABEL_5:
      [v14 longLookReparkInvokedWithTrigger:v15 forNotificationRequest:v12 withState:v13];

      [(NCNotificationViewController *)self _executeCancelAction:1];
      goto LABEL_7;
    case 4:
      double v16 = +[NCNotificationEventTracker sharedInstance];
      double v17 = [(NCNotificationViewController *)self notificationRequest];
      double v18 = [(NCNotificationViewController *)self notificationUsageTrackingState];
      [v16 longLookDismissInvokedWithTrigger:1 forNotificationRequest:v17 withState:v18];

      [(NCNotificationViewController *)self _executeCloseAction:1];
LABEL_7:
      id v6 = v19;
      break;
    default:
      break;
  }
}

- (void)_updateWithProvidedStaticContent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v16 _updateWithProvidedStaticContent];
  id v3 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  uint64_t v4 = [v3 lookViewTapGestureRecognizer];
  [v4 addTarget:self action:sel__handleNotificationTap_];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v5 = objc_msgSend(v3, "iconButtons", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) addTarget:self action:sel__handleIconButton_ forControlEvents:64];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  double v10 = [(NCNotificationViewController *)self staticContentProvider];
  double v11 = [v10 interfaceActions];
  [v3 setInterfaceActions:v11];
}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookViewController;
  return [(NCNotificationLongLookViewController *)self _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:[(NCNotificationViewController *)&v3 _maximumNumberOfPrimaryTextLinesForProvidedStaticContent] isPrimary:1 isLarge:0];
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookViewController;
  return [(NCNotificationLongLookViewController *)self _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:[(NCNotificationViewController *)&v3 _maximumNumberOfSecondaryTextLinesForProvidedStaticContent] isPrimary:0 isLarge:0];
}

- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v7 = [(NCNotificationViewController *)self staticContentProvider];
  int v8 = [v7 isNumberOfLinesInfinite];

  if (!v5 | v8) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)_updateWithProvidedCustomContent
{
  objc_super v3 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  if (v3)
  {
    id v9 = v3;
    uint64_t v4 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    BOOL v5 = [v4 view];
    uint64_t v6 = [v9 customContentView];
    objc_msgSend(v9, "setCustomContentLocation:", objc_msgSend(v4, "customContentLocation"));
    objc_msgSend(v9, "setHidesNotificationContent:", objc_msgSend(v4, "defaultContentHidden"));
    uint64_t v7 = [v5 superview];

    if (v7 != v6)
    {
      [v6 addSubview:v5];
      [v6 bounds];
      objc_msgSend(v5, "setFrame:");
      [v5 setAutoresizingMask:18];
    }
    int v8 = [(NCNotificationLongLookViewController *)self view];
    [v8 setNeedsLayout];

    objc_super v3 = v9;
  }
}

- (void)_updateTitleWithProvidedCustomContent
{
  objc_super v3 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  if (v3)
  {
    uint64_t v4 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    BOOL v5 = [v4 title];
    uint64_t v6 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__NCNotificationLongLookViewController__updateTitleWithProvidedCustomContent__block_invoke;
    v8[3] = &unk_1E6A91A68;
    id v9 = v3;
    id v10 = v5;
    id v7 = v5;
    [v6 animateWithDuration:v8 animations:0.3];
  }
}

uint64_t __77__NCNotificationLongLookViewController__updateTitleWithProvidedCustomContent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
}

- (BOOL)_shouldPadScrollViewContentSizeHeight
{
  return 0;
}

- (void)_loadLookView
{
  if (!self->super._lookView)
  {
    objc_super v3 = objc_alloc_init(NCNotificationLongLookView);
    [(PLExpandedPlatterView *)v3 setDelegate:self];
    lookView = self->super._lookView;
    self->super._lookView = (NCNotificationLookView *)v3;
  }
}

- (id)_longLookViewScrollView
{
  id v2 = [(NCNotificationLongLookViewController *)self _longLookViewLoadingIfNecessary];
  objc_super v3 = [v2 scrollView];

  return v3;
}

- (id)_expandedPlatterPresentationViewScrollView
{
  id v2 = [(NCNotificationLongLookViewController *)self _expandedPlatterPresentationViewLoadingIfNecessary:1];
  objc_super v3 = [v2 scrollView];

  return v3;
}

- (void)_notificationViewControllerViewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookViewController;
  [(NCNotificationViewController *)&v4 _notificationViewControllerViewDidLoad];
  objc_super v3 = [(NCNotificationLongLookViewController *)self _expandedPlatterPresentationViewScrollView];
  [v3 addSubview:self->super._lookView];
}

- (CGSize)_preferredCustomContentSizeForSize:(CGSize)a3 parentContentContainerBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double v10 = CGRectGetWidth(v25);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  [v9 setDismissControlPosition:v10 > CGRectGetHeight(v26)];

  double v11 = objc_opt_class();
  long long v12 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  objc_msgSend(v11, "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  -[NCNotificationLongLookViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v17, fmin(v14, 556.0), v16);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)_setPreferredCustomContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(NCNotificationLongLookViewController *)self _longLookViewIfLoaded];
  objc_msgSend(v6, "setCustomContentSize:", width, height);

  v7.receiver = self;
  v7.super_class = (Class)NCNotificationLongLookViewController;
  -[NCNotificationViewController _setPreferredCustomContentSize:](&v7, sel__setPreferredCustomContentSize_, width, height);
}

- (id)_extensionIdentifier
{
  id v2 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [v2 contentExtensionIdentifier];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
}

- (void)_handleIconButton:(id)a3
{
  objc_super v4 = +[NCNotificationEventTracker sharedInstance];
  BOOL v5 = [(NCNotificationViewController *)self notificationRequest];
  uint64_t v6 = [(NCNotificationViewController *)self notificationUsageTrackingState];
  [v4 longLookDefaultActionInvokedWithTrigger:0 forNotificationRequest:v5 withState:v6];

  [(NCNotificationViewController *)self _executeDefaultAction:1];
}

- (void)_handleNotificationTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    id notificationTapBlock = self->_notificationTapBlock;
    if (notificationTapBlock == (id)__willInteractWithLinkSentinelBlock)
    {
      self->_id notificationTapBlock = 0;
    }
    else
    {
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke;
      v8[3] = &unk_1E6A919A0;
      objc_copyWeak(&v9, &location);
      [(NCNotificationLongLookViewController *)self _setNotificationTapBlock:v8];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke_2;
      block[3] = &unk_1E6A919A0;
      objc_copyWeak(&v7, &location);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = +[NCNotificationEventTracker sharedInstance];
  id v2 = [WeakRetained notificationRequest];
  objc_super v3 = [WeakRetained notificationUsageTrackingState];
  [v1 longLookDefaultActionInvokedWithTrigger:1 forNotificationRequest:v2 withState:v3];

  [WeakRetained _executeDefaultAction:1];
}

void __63__NCNotificationLongLookViewController__handleNotificationTap___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _notificationTapBlock];
  [WeakRetained _setNotificationTapBlock:0];
  if (v1 && v1 != (void (**)(void))__willInteractWithLinkSentinelBlock) {
    v1[2](v1);
  }
}

- (int64_t)viewControllerTransitionTypeForTransitionDelegate:(id)a3
{
  return [(NCNotificationViewController *)self _shouldRestorePresentingShortLookOnDismiss] ^ 1;
}

- (BOOL)expandedPlatterPresentationControllerShouldAllowKeyboardOnAppearance:(id)a3
{
  objc_super v3 = [(NCNotificationViewController *)self staticContentProvider];
  char v4 = [v3 showsTextInputOnAppearance];

  return v4;
}

- (id)expandedPlatterPresentationController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 expandedPlatterPresentationController:v7 keyboardAssertionForGestureWindow:v6];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NCNotificationLongLookViewController;
    uint64_t v9 = [(NCNotificationViewController *)&v12 expandedPlatterPresentationController:v7 keyboardAssertionForGestureWindow:v6];
  }
  double v10 = (void *)v9;

  return v10;
}

- (id)hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    uint64_t v6 = [(NCNotificationViewController *)&v9 hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    uint64_t v6 = [(NCNotificationViewController *)&v9 unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NCNotificationLongLookViewController;
    uint64_t v6 = [(NCNotificationViewController *)&v9 settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (CGRect)expandedPlatterPresentationController:(id)a3 frameForTransitionViewInPresentationSuperview:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    [v8 expandedPlatterPresentationController:v6 frameForTransitionViewInPresentationSuperview:v7];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 expandedPlatterPresentationControllerShouldProvideBackground:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCNotificationLongLookViewController *)self _presentingNotificationViewController];
  if (objc_opt_respondsToSelector())
  {
    char v6 = [v5 customBackgroundContainerViewForExpandedPlatterPresentationController:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationLongLookViewController *)self _longLookViewScrollView];

  if (v5 == v4)
  {
    id v8 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    if (objc_opt_respondsToSelector())
    {
      char v6 = [v8 cancelTouches];
      id cancelTouchesToken = self->_cancelTouchesToken;
      self->_id cancelTouchesToken = v6;
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v8 = a3;
  id v6 = [(NCNotificationLongLookViewController *)self _longLookViewScrollView];

  if (v6 == v8 && !a4 && ([v8 isDecelerating] & 1) == 0)
  {
    id cancelTouchesToken = self->_cancelTouchesToken;
    self->_id cancelTouchesToken = 0;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationLongLookViewController *)self _longLookViewScrollView];

  if (v5 == v4)
  {
    id cancelTouchesToken = self->_cancelTouchesToken;
    self->_id cancelTouchesToken = 0;
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationLongLookViewController *)self _longLookViewScrollView];

  if (v5 == v4)
  {
    id cancelTouchesToken = self->_cancelTouchesToken;
    self->_id cancelTouchesToken = 0;
  }
}

- (BOOL)associatedViewControllerDidAppearForExpandedPlatterView:(id)a3
{
  return [(NCNotificationLongLookViewController *)self _appearState] == 2;
}

- (void)notificationLongLookView:(id)a3 willInteractWithURL:(id)a4
{
  id v5 = a3;
  id v6 = [(NCNotificationViewController *)self _lookView];

  if (v6 == v5)
  {
    id v7 = _Block_copy((const void *)__willInteractWithLinkSentinelBlock);
    id notificationTapBlock = self->_notificationTapBlock;
    self->_id notificationTapBlock = v7;
  }
}

- (BOOL)notificationLongLookView:(id)a3 tapGestureRecognizerShouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if ([v6 userInteractionEnabled])
  {
    id v7 = [v5 view];
    id v8 = [(NCNotificationViewController *)self _lookViewIfLoaded];
    double v9 = [v8 customContentView];
    int v10 = [v7 isDescendantOfView:v9] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v3 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v3)
  {
    id v4 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    unsigned __int8 v5 = [v4 canBecomeFirstResponder];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    unsigned __int8 v5 = [(NCNotificationLongLookViewController *)&v7 canBecomeFirstResponder];
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  objc_super v3 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v4 = [v3 restoreInputViews];
    }
    else {
      unsigned __int8 v4 = [v3 becomeFirstResponder];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    unsigned __int8 v4 = [(NCNotificationLongLookViewController *)&v7 becomeFirstResponder];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)canResignFirstResponder
{
  objc_super v3 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v3)
  {
    unsigned __int8 v4 = [(NCNotificationViewController *)self _customContentProvidingViewController];
    unsigned __int8 v5 = [v4 canResignFirstResponder];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    unsigned __int8 v5 = [(NCNotificationLongLookViewController *)&v7 canResignFirstResponder];
  }

  return v5;
}

- (BOOL)resignFirstResponder
{
  objc_super v3 = [(NCNotificationViewController *)self _customContentProvidingViewController];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [v3 preserveInputViews];
    }
    unsigned __int8 v4 = [v3 resignFirstResponder];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    unsigned __int8 v4 = [(NCNotificationLongLookViewController *)&v7 resignFirstResponder];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)customContentDidLoadExtension:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationLongLookViewController *)self bs_isAppearingOrAppeared])
  {
    BOOL v5 = [(NCNotificationLongLookViewController *)self view];
    id v6 = [v5 window];
    [v6 makeKeyAndVisible];
  }
  if (objc_msgSend((id)+[NCNotificationLongLookViewController superclass](NCNotificationLongLookViewController, "superclass"), "instancesRespondToSelector:", sel_customContentDidLoadExtension_))
  {
    v7.receiver = self;
    v7.super_class = (Class)NCNotificationLongLookViewController;
    [(NCNotificationLongLookViewController *)&v7 customContentDidLoadExtension:v4];
  }
}

- (BOOL)isLookStyleLongLook
{
  return 1;
}

- (id)_presentedLongLookViewController
{
  return 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (id)_presentingNotificationViewController
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  id v4 = UNSafeCast();

  return v4;
}

- (id)_expandedPlatterPresentationViewLoadingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(NCNotificationLongLookViewController *)self isViewLoaded] & 1) != 0 || v3)
  {
    objc_opt_class();
    id v6 = [(NCNotificationLongLookViewController *)self view];
    BOOL v5 = UNSafeCast();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_longLookViewIfLoaded
{
  objc_opt_class();
  BOOL v3 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  id v4 = UNSafeCast();

  return v4;
}

- (id)_longLookViewLoadingIfNecessary
{
  objc_opt_class();
  BOOL v3 = [(NCNotificationViewController *)self _lookViewLoadingIfNecessary:1];
  id v4 = UNSafeCast();

  return v4;
}

- (PLClickPresentationInteractionPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (PLClickPresentationInteractionPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (PLExpandedPlatterDismissing)dismisser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismisser);

  return (PLExpandedPlatterDismissing *)WeakRetained;
}

- (void)setDismisser:(id)a3
{
}

- (id)_notificationTapBlock
{
  return self->_notificationTapBlock;
}

- (void)_setNotificationTapBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationTapBlock, 0);
  objc_destroyWeak((id *)&self->_dismisser);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong(&self->_cancelTouchesToken, 0);

  objc_storeStrong((id *)&self->_longLookTransitionDelegate, 0);
}

@end