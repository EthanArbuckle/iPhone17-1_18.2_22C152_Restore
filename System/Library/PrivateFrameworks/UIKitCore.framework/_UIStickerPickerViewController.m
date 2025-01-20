@interface _UIStickerPickerViewController
+ (id)requestCardViewControllerWithConnectionHandler:(id)a3;
- (BOOL)isLaunchedFromKeyboard;
- (BOOL)keyWindowChangedDuringInsert;
- (BOOL)supportsReturningStickerIdentifiersDuringAddition;
- (BOOL)supportsReturningStickerIdentifiersDuringAdditionV2;
- (CGRect)_sourceRectInWindowCoordinates;
- (CGRect)sourceRect;
- (UIView)sourceView;
- (_UIStickerPickerServiceRemoteViewController)card;
- (_UIStickerPickerViewController)init;
- (_UIStickerPickerViewControllerDelegate)delegate;
- (id)_viewServiceProxy;
- (id)dismissCompletionHandler;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_addStickerWithRepresentations:(id)a3 previewView:(id)a4 animatingTo:(CGRect)a5;
- (void)_insertStickerFromItemProvider:(id)a3;
- (void)_remoteViewDidLoad:(id)a3;
- (void)_updatePopoverWindowLocation;
- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5;
- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5 completion:(id)a6;
- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)dismissCard;
- (void)dismissCardAnimated:(BOOL)a3;
- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3;
- (void)setCard:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissCompletionHandler:(id)a3;
- (void)setIsLaunchedFromKeyboard:(BOOL)a3;
- (void)setKeyWindowChangedDuringInsert:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)stageSticker:(id)a3;
- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7 metadata:(id)a8;
- (void)stickerPickerCardDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIStickerPickerViewController

- (void)setDismissCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  objc_setAssociatedObject(self, &kDismissCompletionHandlerKey, v4, (void *)3);
}

- (id)dismissCompletionHandler
{
  return objc_getAssociatedObject(self, &kDismissCompletionHandlerKey);
}

- (_UIStickerPickerViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStickerPickerViewController;
  v2 = [(UIViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UIViewController *)v2 setModalPresentationStyle:4];
    [(UIViewController *)v3 setTransitioningDelegate:v3];
    id v4 = [(UIViewController *)v3 presentationController];
    [v4 setDelegate:v3];
  }
  return v3;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)_UIStickerPickerViewController;
  [(UIViewController *)&v8 loadView];
  v3 = [(UIViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___UIStickerPickerViewController_loadView__block_invoke;
  v5[3] = &unk_1E5307DD8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v4 = +[_UIStickerPickerServiceRemoteViewController requestCardViewControllerWithConnectionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  return +[_UIRemoteViewController requestViewController:@"AppCardViewController" fromServiceWithBundleIdentifier:@"com.apple.iMessageAppsViewService" connectionHandler:a3];
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
  uint64_t v4 = [(_UIStickerPickerViewController *)self card];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(_UIStickerPickerViewController *)self card];
    v7 = [v6 view];
    objc_super v8 = [v7 superview];

    if (v8)
    {
      [(_UIStickerPickerViewController *)self _updatePopoverWindowLocation];
    }
  }
}

- (CGRect)_sourceRectInWindowCoordinates
{
  v3 = [(_UIStickerPickerViewController *)self sourceView];
  [(_UIStickerPickerViewController *)self sourceRect];
  objc_msgSend(v3, "convertRect:toView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updatePopoverWindowLocation
{
  v3 = [(UIViewController *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  double v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v4 != 1)
  {
    id v8 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
    [(_UIStickerPickerViewController *)self _sourceRectInWindowCoordinates];
    objc_msgSend(v8, "updatePopoverWindowLocation:completion:", &__block_literal_global_509);
  }
}

- (void)_remoteViewDidLoad:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:self];
  [(UIViewController *)self addChildViewController:v4];
  [v4 setDelegate:self];
  double v5 = [(UIViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v4 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  double v15 = [v4 view];
  [v15 setAutoresizingMask:18];

  v16 = [(UIViewController *)self view];
  v17 = [v4 view];
  [v16 addSubview:v17];

  [v4 didMoveToParentViewController:self];
  [(_UIStickerPickerViewController *)self setCard:v4];

  v18 = [(UIViewController *)self traitCollection];
  uint64_t v19 = [v18 horizontalSizeClass];

  v20 = +[UIDevice currentDevice];
  uint64_t v21 = [v20 userInterfaceIdiom];

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v19 != 1)
  {
    id v22 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
    [(_UIStickerPickerViewController *)self _sourceRectInWindowCoordinates];
    objc_msgSend(v22, "presentPopoverAtWindowLocation:completion:", &__block_literal_global_40_2);
  }
}

- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5
{
}

- (BOOL)supportsReturningStickerIdentifiersDuringAdditionV2
{
  id CKBrowserViewControllerClass = getCKBrowserViewControllerClass();
  return [CKBrowserViewControllerClass instancesRespondToSelector:sel__addStickerToStoreWithRepresentations_sourceRect_completion_];
}

- (BOOL)supportsReturningStickerIdentifiersDuringAddition
{
  id CKBrowserViewControllerClass = getCKBrowserViewControllerClass();
  return [CKBrowserViewControllerClass instancesRespondToSelector:sel__addStickerToStoreWithRepresentations_completionWithStickerIDs_];
}

- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  double v14 = [(_UIStickerPickerViewController *)self card];
  double v15 = [v14 view];
  v16 = [v15 window];

  [v11 frame];
  objc_msgSend(v13, "convertRect:toView:", 0);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [v13 window];

  objc_msgSend(v16, "convertRect:fromWindow:", v25, v18, v20, v22, v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  if ([(_UIStickerPickerViewController *)self supportsReturningStickerIdentifiersDuringAdditionV2])
  {
    v34 = _stickersLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEFAULT, "Calling out to the stickers view service to add the sticker to the store with stickerIDs", buf, 2u);
    }

    v35 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke;
    v50[3] = &unk_1E5307E00;
    id v51 = v12;
    objc_msgSend(v35, "addStickerToStoreWithRepresentations:sourceRect:completion:", v10, v50, v27, v29, v31, v33);

    v36 = v51;
  }
  else
  {
    objc_msgSend(v11, "setFrame:", v27, v29, v31, v33);
    v37 = [(_UIStickerPickerViewController *)self card];
    uint64_t v38 = [v37 view];
    [(id)v38 addSubview:v11];

    LOBYTE(v38) = [(_UIStickerPickerViewController *)self supportsReturningStickerIdentifiersDuringAddition];
    v39 = _stickersLog();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_DEFAULT, "Calling out to the stickers view service to add the sticker to the store with stickerIDs", buf, 2u);
      }

      v41 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_48;
      v46[3] = &unk_1E5307E50;
      v46[4] = self;
      id v47 = v10;
      id v48 = v11;
      id v49 = v12;
      [v41 addStickerToStoreWithRepresentations:v47 completionWithStickerIDs:v46];

      v36 = v47;
    }
    else
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_DEFAULT, "Using older addStickerToStoreWithRepresentations:completionHandler SPI", buf, 2u);
      }

      v42 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_50;
      v43[3] = &unk_1E5307EA0;
      v43[4] = self;
      id v44 = v10;
      id v45 = v11;
      [v42 addStickerToStoreWithRepresentations:v44 completionHandler:v43];

      v36 = v44;
    }
  }
}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v7 = a3;
  if ([(_UIStickerPickerViewController *)self supportsReturningStickerIdentifiersDuringAddition])
  {
    double v6 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
    [v6 animatedStickerCreationProgressChanged:v7 progress:a4];
  }
}

- (void)_addStickerWithRepresentations:(id)a3 previewView:(id)a4 animatingTo:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = dispatch_group_create();
  id v12 = [(_UIStickerPickerViewController *)self card];
  id v13 = [v12 view];
  double v32 = [v13 window];

  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  CGFloat MidX = CGRectGetMidX(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = width;
  v59.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v59);
  [v10 bounds];
  double v17 = v16;
  [v10 bounds];
  double v19 = v18;
  [v10 bounds];
  if (v17 > v19) {
    double v22 = height / v21;
  }
  else {
    double v22 = width / v20;
  }
  dispatch_group_enter(v11);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke;
  v54[3] = &unk_1E52DD178;
  id v23 = v10;
  id v55 = v23;
  CGFloat v56 = MidX;
  CGFloat v57 = MidY;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_3;
  v52[3] = &unk_1E52DC3A0;
  double v24 = v11;
  v53 = v24;
  +[UIView animateWithDuration:0 delay:v54 usingSpringWithDamping:v52 initialSpringVelocity:1.0 options:0.0 animations:1.0 completion:0.0];
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeScale(&v51, v22 * 1.4, v22 * 1.4);
  dispatch_group_enter(v24);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_4;
  v48[3] = &unk_1E52E7948;
  id v25 = v23;
  CGAffineTransform v50 = v51;
  id v49 = v25;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_6;
  v46[3] = &unk_1E52DC3A0;
  double v26 = v24;
  id v47 = v26;
  +[UIView animateWithDuration:0 delay:v48 usingSpringWithDamping:v46 initialSpringVelocity:0.7 options:0.0 animations:1.0 completion:0.0];
  CGAffineTransformMakeScale(&v45, v22 * 0.8, v22 * 0.8);
  CGAffineTransform v51 = v45;
  dispatch_group_enter(v26);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_7;
  v42[3] = &unk_1E52E7948;
  id v27 = v25;
  CGAffineTransform v44 = v51;
  id v43 = v27;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_9;
  v40[3] = &unk_1E52DC3A0;
  double v28 = v26;
  v41 = v28;
  +[UIView animateWithDuration:0 delay:v42 usingSpringWithDamping:v40 initialSpringVelocity:0.8 options:0.3 animations:1.0 completion:0.0];
  CGAffineTransformMakeScale(&v45, v22, v22);
  CGAffineTransform v51 = v45;
  dispatch_group_enter(v28);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_10;
  v37[3] = &unk_1E52E7948;
  id v29 = v27;
  CGAffineTransform v39 = v51;
  id v38 = v29;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_12;
  v35[3] = &unk_1E52DC3A0;
  v36 = v28;
  double v30 = v28;
  +[UIView animateWithDuration:0 delay:v37 usingSpringWithDamping:v35 initialSpringVelocity:0.8 options:0.6 animations:0.8 completion:0.0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_13;
  block[3] = &unk_1E52D9F98;
  block[4] = self;
  id v34 = v29;
  id v31 = v29;
  dispatch_group_notify(v30, MEMORY[0x1E4F14428], block);
}

- (void)_insertStickerFromItemProvider:(id)a3
{
  id v4 = a3;
  double v5 = +[UIWindow _applicationKeyWindow];
  objc_initWeak(&location, v5);

  double v6 = [(_UIStickerPickerViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(_UIStickerPickerViewController *)self delegate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke;
    v9[3] = &unk_1E5307EC8;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    [v8 insertStickerFromItemProvider:v4 completionHandler:v9];

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = _stickersLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v5 = 0;
    _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unexpected dismissal", v5, 2u);
  }

  [(_UIStickerPickerViewController *)self dismissCard];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UIPresentationController *)[UIStickerPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = _stickersLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Stickers view service did terminate with error: %@", (uint8_t *)&v6, 0xCu);
  }

  [(_UIStickerPickerViewController *)self dismissCard];
}

- (void)stickerPickerCardDidLoad
{
  v3 = [(_UIStickerPickerViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIStickerPickerViewController *)self delegate];
    [v5 stickerPickerViewControllerDidLoad];
  }
}

- (void)dismissCardAnimated:(BOOL)a3
{
}

- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int v6 = (void (**)(void))a4;
  if (v4)
  {
    id v7 = [(_UIStickerPickerViewController *)self _viewServiceProxy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65___UIStickerPickerViewController_dismissCardAnimated_completion___block_invoke;
    v8[3] = &unk_1E52DA160;
    v8[4] = self;
    double v9 = v6;
    [v7 animateCardHiddenWithCompletion:v8];
  }
  else
  {
    [(_UIStickerPickerViewController *)self dismissCard];
    v6[2](v6);
  }
}

- (void)dismissCard
{
  if ([(UIViewController *)self isBeingDismissed])
  {
    v3 = _stickersLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring call to dismissCard. Card is already being dismissed.", buf, 2u);
    }
  }
  else
  {
    BOOL v4 = [(UIViewController *)self presentingViewController];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45___UIStickerPickerViewController_dismissCard__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [v4 dismissViewControllerAnimated:0 completion:v5];
  }
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7 metadata:(id)a8
{
  id v19 = a4;
  id v10 = a8;
  id v11 = [(_UIStickerPickerViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    int v13 = [(_UIStickerPickerViewController *)self isLaunchedFromKeyboard];
    double v14 = [(UIViewController *)self view];
    double v15 = [v14 window];
    double v16 = [v15 screen];
    [v16 scale];
    double v18 = _UIStickerItemProviderWithMetadata(0, v19, 0, v13, v10, v17);

    [(_UIStickerPickerViewController *)self _insertStickerFromItemProvider:v18];
  }
}

- (void)stageSticker:(id)a3
{
  id v20 = a3;
  BOOL v4 = +[UITextInputPayloadController sharedInstance];
  int v5 = [v4 supportsStickerTapbackPayload];

  if (v5)
  {
    int v6 = +[UIKeyboardImpl activeInstance];
    [v6 insertSticker:v20];

    [(_UIStickerPickerViewController *)self dismissCardAnimated:1];
  }
  else
  {
    id v7 = [(_UIStickerPickerViewController *)self delegate];
    int v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      int v9 = [(_UIStickerPickerViewController *)self isLaunchedFromKeyboard];
      id v10 = [v20 externalURI];
      id v11 = [v20 representations];
      char v12 = [v20 bakedInRep];
      int v13 = [(UIViewController *)self view];
      double v14 = [v13 window];
      double v15 = [v14 screen];
      [v15 scale];
      double v17 = v16;
      double v18 = [v20 metadata];
      id v19 = _UIStickerItemProviderWithMetadata(v10, v11, v12, v9, v18, v17);

      [(_UIStickerPickerViewController *)self _insertStickerFromItemProvider:v19];
    }
  }
}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    int v9 = v4;
    int v5 = [(_UIStickerPickerViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(_UIStickerPickerViewController *)self delegate];
      uint64_t v8 = [v7 remoteHandlesRecentsStickerDonation];
    }
    else
    {
      uint64_t v8 = 1;
    }
    v9[2](v9, v8);
    BOOL v4 = v9;
  }
}

- (id)_viewServiceProxy
{
  v2 = [(_UIStickerPickerViewController *)self card];
  v3 = [v2 serviceViewControllerProxy];

  return v3;
}

- (_UIStickerPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIStickerPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)sourceView
{
  return (UIView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isLaunchedFromKeyboard
{
  return self->_isLaunchedFromKeyboard;
}

- (void)setIsLaunchedFromKeyboard:(BOOL)a3
{
  self->_isLaunchedFromKeyboard = a3;
}

- (_UIStickerPickerServiceRemoteViewController)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
}

- (BOOL)keyWindowChangedDuringInsert
{
  return self->_keyWindowChangedDuringInsert;
}

- (void)setKeyWindowChangedDuringInsert:(BOOL)a3
{
  self->_keyWindowChangedDuringInsert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end