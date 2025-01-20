@interface PREditorTitleViewControllerCSTransitionWrapper
- (CSProminentDisplayTransitioning)csTransitioning;
- (PREditorTitleViewControllerCSTransitionWrapper)initWithCSTransitioning:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)setCsTransitioning:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation PREditorTitleViewControllerCSTransitionWrapper

- (PREditorTitleViewControllerCSTransitionWrapper)initWithCSTransitioning:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditorTitleViewControllerCSTransitionWrapper;
  v6 = [(PREditorTitleViewControllerCSTransitionWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_csTransitioning, a3);
  }

  return v7;
}

- (void)updateInteractiveTransition:(double)a3
{
}

- (void)finishInteractiveTransition
{
}

- (void)cancelInteractiveTransition
{
}

- (CSProminentDisplayTransitioning)csTransitioning
{
  return self->_csTransitioning;
}

- (void)setCsTransitioning:(id)a3
{
}

- (void).cxx_destruct
{
}

@end