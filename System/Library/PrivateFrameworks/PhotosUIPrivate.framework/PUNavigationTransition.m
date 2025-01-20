@interface PUNavigationTransition
+ (BOOL)shouldCrossFadeBottomBarsForNavigationController:(id)a3;
+ (id)animationControllerForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5 inNavigationController:(id)a6;
- (BOOL)wasStatusBarHiddenBeforeTransition;
- (PUNavigationTransition)initWithDuration:(double)a3;
- (PUNavigationTransition)initWithPushDuration:(double)a3 popDuration:(double)a4;
- (UINavigationController)navigationController;
- (UIViewController)expectedDestinationOnPop;
- (double)popDuration;
- (double)pushDuration;
- (double)transitionDuration:(id)a3;
- (int64_t)_operation;
- (void)_setOperation:(int64_t)a3;
- (void)animateTransition:(id)a3;
- (void)cancelInteractiveTransition;
- (void)completeTransition:(BOOL)a3;
- (void)didCompleteTransitionAnimation;
- (void)finishInteractiveTransition;
- (void)imageModulationIntensityDidChange;
- (void)setExpectedDestinationOnPop:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setWasStatusBarHiddenBeforeTransition:(BOOL)a3;
- (void)transitionWillStartOperation:(int64_t)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
@end

@implementation PUNavigationTransition

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expectedDestinationOnPop);
  objc_destroyWeak((id *)&self->_navigationController);
}

- (void)setExpectedDestinationOnPop:(id)a3
{
}

- (UIViewController)expectedDestinationOnPop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expectedDestinationOnPop);
  return (UIViewController *)WeakRetained;
}

- (void)_setOperation:(int64_t)a3
{
  self->__operation = a3;
}

- (int64_t)_operation
{
  return self->__operation;
}

- (void)setWasStatusBarHiddenBeforeTransition:(BOOL)a3
{
  self->_wasStatusBarHiddenBeforeTransition = a3;
}

- (BOOL)wasStatusBarHiddenBeforeTransition
{
  return self->_wasStatusBarHiddenBeforeTransition;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (double)popDuration
{
  return self->_popDuration;
}

- (double)pushDuration
{
  return self->_pushDuration;
}

- (void)transitionWillStartOperation:(int64_t)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  v6 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3, a4, a5);
  uint64_t v7 = [v6 isStatusBarHidden];

  [(PUNavigationTransition *)self setWasStatusBarHiddenBeforeTransition:v7];
}

- (void)animateTransition:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v5 animateTransition:a3];
  int64_t operation = self->__operation;
  if (operation == 2)
  {
    [(PUNavigationTransition *)self animatePopTransition];
  }
  else if (operation == 1)
  {
    [(PUNavigationTransition *)self animatePushTransition];
  }
}

- (double)transitionDuration:(id)a3
{
  unint64_t v4 = [(PUNavigationTransition *)self _operation];
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      [(PUNavigationTransition *)self popDuration];
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    [(PUViewControllerTransition *)self duration];
  }
  return result;
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PUNavigationTransition *)self navigationController];
  objc_msgSend(v5, "pu_navigationTransitionWillEnd:", self);
  [(PUNavigationTransition *)self _setOperation:0];
  v6.receiver = self;
  v6.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v6 completeTransition:v3];
  objc_msgSend(v5, "pu_navigationTransitionDidEnd:", self);
}

- (void)didCompleteTransitionAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v4 didCompleteTransitionAnimation];
  BOOL v3 = [(PUNavigationTransition *)self navigationController];
  objc_msgSend(v3, "ppt_notifyTransitionAnimationDidComplete");
}

- (void)cancelInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive]) {
    [(PUNavigationTransition *)self completeInteractiveOperation:[(PUNavigationTransition *)self _operation] finished:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v3 cancelInteractiveTransition];
}

- (void)finishInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive]) {
    [(PUNavigationTransition *)self completeInteractiveOperation:[(PUNavigationTransition *)self _operation] finished:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v3 finishInteractiveTransition];
}

- (void)imageModulationIntensityDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUNavigationTransition;
  [(PUViewControllerTransition *)&v4 imageModulationIntensityDidChange];
  objc_super v3 = [(PUNavigationTransition *)self navigationController];
  objc_msgSend(v3, "px_setNeedsImageModulationIntensityUpdate");
}

- (PUNavigationTransition)initWithPushDuration:(double)a3 popDuration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUNavigationTransition;
  double result = -[PUViewControllerTransition initWithDuration:](&v7, sel_initWithDuration_);
  if (result)
  {
    result->_pushDuration = a3;
    result->_popDuration = a4;
  }
  return result;
}

- (PUNavigationTransition)initWithDuration:(double)a3
{
  return [(PUNavigationTransition *)self initWithPushDuration:a3 popDuration:a3];
}

+ (BOOL)shouldCrossFadeBottomBarsForNavigationController:(id)a3
{
  objc_super v3 = [a3 topViewController];
  objc_super v4 = objc_msgSend(v3, "pu_navigationTransition");
  BOOL v5 = [v4 _operation] != 0;

  return v5;
}

+ (id)animationControllerForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5 inNavigationController:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3 == 1)
  {
    v12 = objc_msgSend(v10, "pu_navigationTransition");
    v15 = [v12 expectedDestinationOnPop];

    if (!v15) {
      [v12 setExpectedDestinationOnPop:v9];
    }
  }
  else if (a3 == 2)
  {
    v12 = objc_msgSend(v9, "pu_navigationTransition");
    uint64_t v13 = [v12 expectedDestinationOnPop];
    v14 = (void *)v13;
    if (v13 && (id)v13 != v10)
    {

      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  [v12 setNavigationController:v11];
  objc_msgSend(v12, "transitionWillAnimateOperation:interactive:", a3, objc_msgSend(v12, "isInteractive"));
  [v12 _setOperation:a3];
  objc_msgSend(v11, "pu_navigationTransitionWillStart:", v12);

  return v12;
}

@end