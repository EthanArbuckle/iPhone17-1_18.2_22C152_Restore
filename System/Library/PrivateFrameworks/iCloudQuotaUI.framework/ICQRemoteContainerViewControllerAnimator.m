@interface ICQRemoteContainerViewControllerAnimator
- (BOOL)isPresenting;
- (ICQRemoteContainerViewControllerAnimator)init;
- (ICQRemoteContainerViewControllerAnimator)initWithPresenting:(BOOL)a3;
- (double)transitionDuration:(id)a3;
- (id)_viewControllerForTransitionContext:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation ICQRemoteContainerViewControllerAnimator

- (ICQRemoteContainerViewControllerAnimator)init
{
  return [(ICQRemoteContainerViewControllerAnimator *)self initWithPresenting:1];
}

- (ICQRemoteContainerViewControllerAnimator)initWithPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQRemoteContainerViewControllerAnimator;
  result = [(ICQRemoteContainerViewControllerAnimator *)&v5 init];
  if (result) {
    result->_presenting = a3;
  }
  return result;
}

- (id)_viewControllerForTransitionContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICQRemoteContainerViewControllerAnimator *)self isPresenting];
  v6 = (void *)MEMORY[0x263F83C10];
  if (!v5) {
    v6 = (void *)MEMORY[0x263F83C00];
  }
  v7 = [v4 viewControllerForKey:*v6];

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICQRemoteContainerViewControllerAnimator *)self _viewControllerForTransitionContext:v4];
  v6 = [v5 view];
  v7 = [v4 containerView];
  [v7 addSubview:v6];
  v8 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke;
  v15[3] = &unk_264921B68;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performWithoutAnimation:v15];
  v11 = (void *)MEMORY[0x263F82E00];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke_3;
  v13[3] = &unk_264921BB0;
  id v14 = v4;
  id v12 = v4;
  [v11 _animateUsingDefaultTimingWithOptions:134 animations:&__block_literal_global completion:v13];
}

uint64_t __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setFrame:");
  v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

uint64_t __62__ICQRemoteContainerViewControllerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (double)transitionDuration:(id)a3
{
  return 0.35;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end