@interface VUIConfirmationTransitioningDelegate
+ (id)sharedInstance;
- (VUIConfirmationTransitioningDelegate)init;
- (id)_init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)dismissedHandlerBlock;
- (id)presentedHandlerBlock;
- (void)confirmationAnimatedTransitioningAnimationDidEnd:(id)a3;
- (void)setDismissedHandlerBlock:(id)a3;
- (void)setPresentedHandlerBlock:(id)a3;
@end

@implementation VUIConfirmationTransitioningDelegate

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VUIConfirmationTransitioningDelegate_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_24 != -1) {
    dispatch_once(&sharedInstance_onceToken_24, block);
  }
  v2 = (void *)sharedInstance__sharedInstance_0;
  return v2;
}

void __54__VUIConfirmationTransitioningDelegate_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)sharedInstance__sharedInstance_0;
  sharedInstance__sharedInstance_0 = v1;
}

- (VUIConfirmationTransitioningDelegate)init
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self->_presentTransition;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self->_dismissTransition;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)VUIConfirmationTransitioningDelegate;
  v2 = [(VUIConfirmationTransitioningDelegate *)&v8 init];
  if (v2)
  {
    v3 = [[VUIConfirmationAnimatedTransitioning alloc] initWithPresenting:1];
    presentTransition = v2->_presentTransition;
    v2->_presentTransition = v3;

    [(VUIConfirmationAnimatedTransitioning *)v2->_presentTransition setDelegate:v2];
    v5 = [[VUIConfirmationAnimatedTransitioning alloc] initWithPresenting:0];
    dismissTransition = v2->_dismissTransition;
    v2->_dismissTransition = v5;

    [(VUIConfirmationAnimatedTransitioning *)v2->_dismissTransition setDelegate:v2];
  }
  return v2;
}

- (void)confirmationAnimatedTransitioningAnimationDidEnd:(id)a3
{
  v4 = (VUIConfirmationAnimatedTransitioning *)a3;
  if (self->_presentTransition == v4)
  {
    v9 = v4;
    v7 = [(VUIConfirmationTransitioningDelegate *)self presentedHandlerBlock];

    v4 = v9;
    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v6 = [(VUIConfirmationTransitioningDelegate *)self presentedHandlerBlock];
    goto LABEL_7;
  }
  if (self->_dismissTransition == v4)
  {
    v9 = v4;
    v5 = [(VUIConfirmationTransitioningDelegate *)self dismissedHandlerBlock];

    v4 = v9;
    if (v5)
    {
      uint64_t v6 = [(VUIConfirmationTransitioningDelegate *)self dismissedHandlerBlock];
LABEL_7:
      objc_super v8 = (void *)v6;
      (*(void (**)(void))(v6 + 16))();

      v4 = v9;
    }
  }
LABEL_8:
}

- (id)presentedHandlerBlock
{
  return self->_presentedHandlerBlock;
}

- (void)setPresentedHandlerBlock:(id)a3
{
}

- (id)dismissedHandlerBlock
{
  return self->_dismissedHandlerBlock;
}

- (void)setDismissedHandlerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissedHandlerBlock, 0);
  objc_storeStrong(&self->_presentedHandlerBlock, 0);
  objc_storeStrong((id *)&self->_dismissTransition, 0);
  objc_storeStrong((id *)&self->_presentTransition, 0);
}

@end