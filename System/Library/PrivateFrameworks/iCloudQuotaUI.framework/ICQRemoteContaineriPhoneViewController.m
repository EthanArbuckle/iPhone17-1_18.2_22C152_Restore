@interface ICQRemoteContaineriPhoneViewController
- (CGRect)_dismissalFrameForContentSize:(CGSize)a3;
- (CGRect)_layoutFrameForContentSize:(CGSize)a3;
- (CGSize)containerContentSize;
- (ICQRemoteContaineriPhoneViewController)init;
- (ICQRemoteContaineriPhoneViewController)initWithRootViewController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)_layoutContainerView:(BOOL)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setContainerContentSize:(CGSize)a3;
- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICQRemoteContaineriPhoneViewController

- (ICQRemoteContaineriPhoneViewController)init
{
  return [(ICQRemoteContaineriPhoneViewController *)self initWithRootViewController:0];
}

- (ICQRemoteContaineriPhoneViewController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  v3 = [(ICQRemoteContainerViewController *)&v6 initWithRootViewController:a3];
  v4 = v3;
  if (v3)
  {
    [(ICQRemoteContaineriPhoneViewController *)v3 setModalPresentationStyle:4];
    [(ICQRemoteContaineriPhoneViewController *)v4 setTransitioningDelegate:v4];
  }
  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  [(ICQRemoteContaineriPhoneViewController *)&v4 viewDidLoad];
  v3 = [(ICQRemoteContaineriPhoneViewController *)self view];
  [v3 setOpaque:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  [(ICQRemoteContaineriPhoneViewController *)&v25 viewWillAppear:a3];
  if ([(ICQRemoteContaineriPhoneViewController *)self isBeingPresented])
  {
    objc_super v4 = [(ICQRemoteContainerViewController *)self rootViewController];
    [v4 preferredContentSize];
    double v6 = v5;
    double v8 = v7;

    -[ICQRemoteContaineriPhoneViewController _dismissalFrameForContentSize:](self, "_dismissalFrameForContentSize:", v6, v8);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(ICQRemoteContainerViewController *)self rootViewController];
    v18 = [v17 viewIfLoaded];
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    v19 = [(ICQRemoteContainerViewController *)self rootViewController];
    v20 = [v19 viewIfLoaded];
    [v20 layoutIfNeeded];

    v21 = [(ICQRemoteContaineriPhoneViewController *)self view];
    v22 = [MEMORY[0x263F825C8] clearColor];
    [v21 setBackgroundColor:v22];

    v23 = [(ICQRemoteContaineriPhoneViewController *)self transitionCoordinator];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __57__ICQRemoteContaineriPhoneViewController_viewWillAppear___block_invoke;
    v24[3] = &unk_264922870;
    v24[4] = self;
    *(double *)&v24[5] = v6;
    *(double *)&v24[6] = v8;
    [v23 animateAlongsideTransition:v24 completion:0];
  }
}

void __57__ICQRemoteContaineriPhoneViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setContainerContentSize:animated:", objc_msgSend(a2, "isAnimated"), *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) view];
  v3 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.800000012];
  [v4 setBackgroundColor:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  [(ICQRemoteContaineriPhoneViewController *)&v6 viewWillDisappear:a3];
  if ([(ICQRemoteContaineriPhoneViewController *)self isBeingDismissed])
  {
    id v4 = [(ICQRemoteContaineriPhoneViewController *)self transitionCoordinator];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__ICQRemoteContaineriPhoneViewController_viewWillDisappear___block_invoke;
    v5[3] = &unk_264922898;
    v5[4] = self;
    [v4 animateAlongsideTransition:v5 completion:0];
  }
}

void __60__ICQRemoteContaineriPhoneViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 containerContentSize];
  objc_msgSend(v2, "_dismissalFrameForContentSize:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [*(id *)(a1 + 32) rootViewController];
  double v12 = [v11 viewIfLoaded];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  double v13 = [*(id *)(a1 + 32) rootViewController];
  double v14 = [v13 viewIfLoaded];
  [v14 layoutIfNeeded];

  id v16 = [*(id *)(a1 + 32) view];
  double v15 = [MEMORY[0x263F825C8] clearColor];
  [v16 setBackgroundColor:v15];
}

- (void)setContainerContentSize:(CGSize)a3
{
}

- (void)setContainerContentSize:(CGSize)a3 animated:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  p_containerContentSize = &self->_containerContentSize;
  if (self->_containerContentSize.width != a3.width || self->_containerContentSize.height != a3.height)
  {
    BOOL v8 = a4;
    double v10 = [(ICQRemoteContaineriPhoneViewController *)self view];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v22.origin.x = v12;
    v22.origin.y = v14;
    v22.size.double width = v16;
    v22.size.double height = v18;
    double v19 = CGRectGetWidth(v22);
    if (v19 < width) {
      double width = v19;
    }
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.double width = v16;
    v23.size.double height = v18;
    double v20 = CGRectGetHeight(v23);
    if (v20 >= height) {
      double v20 = height;
    }
    p_containerContentSize->double width = width;
    p_containerContentSize->double height = v20;
    [(ICQRemoteContaineriPhoneViewController *)self _layoutContainerView:v8];
  }
}

- (void)_layoutContainerView:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(ICQRemoteContainerViewController *)self rootViewController];
  double v6 = [v5 viewIfLoaded];

  if (v6)
  {
    [(ICQRemoteContaineriPhoneViewController *)self containerContentSize];
    [(ICQRemoteContaineriPhoneViewController *)self _layoutFrameForContentSize:"_layoutFrameForContentSize:"];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 frame];
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.double width = v12;
    v26.size.double height = v14;
    if (!CGRectEqualToRect(v25, v26))
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__ICQRemoteContaineriPhoneViewController__layoutContainerView___block_invoke;
      aBlock[3] = &unk_2649228C0;
      id v20 = v6;
      CGFloat v21 = v8;
      CGFloat v22 = v10;
      CGFloat v23 = v12;
      CGFloat v24 = v14;
      double v15 = _Block_copy(aBlock);
      CGFloat v16 = v15;
      if (v3)
      {
        id v17 = objc_alloc_init(MEMORY[0x263F82BF0]);
        CGFloat v18 = (void *)[objc_alloc(MEMORY[0x263F82E30]) initWithDuration:v17 timingParameters:0.35];
        [v18 addAnimations:v16];
        [v18 startAnimation];
      }
      else
      {
        (*((void (**)(void *))v15 + 2))(v15);
      }
    }
  }
}

uint64_t __63__ICQRemoteContaineriPhoneViewController__layoutContainerView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_layoutFrameForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(ICQRemoteContaineriPhoneViewController *)self viewIfLoaded];
  double v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat v9 = v17.size.width;
    CGFloat v10 = v17.size.height;
    double v11 = (CGRectGetWidth(v17) - width) * 0.5;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.double width = v9;
    v18.size.double height = v10;
    double v12 = CGRectGetHeight(v18) - height;
  }
  else
  {
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double height = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v13 = v11;
  double v14 = v12;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_dismissalFrameForContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(ICQRemoteContaineriPhoneViewController *)self viewIfLoaded];
  double v6 = v5;
  if (v5)
  {
    [v5 bounds];
    CGFloat v7 = CGRectGetHeight(v13);
    double v8 = 0.0;
  }
  else
  {
    double v8 = *MEMORY[0x263F001A8];
    CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v9 = v8;
  double v10 = v7;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  [(ICQRemoteContaineriPhoneViewController *)&v10 preferredContentSizeDidChangeForChildContentContainer:v4];
  if (([(ICQRemoteContaineriPhoneViewController *)self isBeingPresented] & 1) == 0)
  {
    id v5 = [(ICQRemoteContainerViewController *)self rootViewController];
    if (v5 == v4)
    {
      double v6 = [v4 transitionCoordinator];
      if (v6)
      {
        v7[0] = MEMORY[0x263EF8330];
        v7[1] = 3221225472;
        v7[2] = __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
        v7[3] = &unk_264922908;
        v7[4] = self;
        id v8 = v4;
        id v9 = &__block_literal_global_11;
        objc_msgSend(v6, "animateAlongsideTransition:completion:", v7);
      }
      else
      {
        [v4 preferredContentSize];
        -[ICQRemoteContaineriPhoneViewController setContainerContentSize:animated:](self, "setContainerContentSize:animated:", 1);
      }
    }
  }
}

void __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [v2 containerView];
  BOOL v3 = [v2 viewForKey:*MEMORY[0x263F83C08]];
  id v4 = [v2 viewForKey:*MEMORY[0x263F83C18]];

  [v5 bounds];
  objc_msgSend(v3, "setFrame:");
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

void __96__ICQRemoteContaineriPhoneViewController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(void *a1, void *a2)
{
  BOOL v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v7 = a2;
  [v4 preferredContentSize];
  objc_msgSend(v3, "setContainerContentSize:animated:", objc_msgSend(v7, "isAnimated"), v5, v6);
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ICQRemoteContaineriPhoneViewController;
  id v7 = a4;
  -[ICQRemoteContaineriPhoneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __93__ICQRemoteContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264922898;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __93__ICQRemoteContaineriPhoneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 isAnimated];
  return [v2 _layoutContainerView:v3];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  double v5 = [[ICQRemoteContainerViewControllerAnimator alloc] initWithPresenting:1];
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  uint64_t v3 = [[ICQRemoteContainerViewControllerAnimator alloc] initWithPresenting:0];
  return v3;
}

- (CGSize)containerContentSize
{
  double width = self->_containerContentSize.width;
  double height = self->_containerContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end