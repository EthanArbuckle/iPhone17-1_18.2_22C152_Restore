@interface PREditorSlidingTitleTransition
- (PREditorSlidingTitleTransition)initWithSourceTitleViewController:(id)a3 destinationTitleViewController:(id)a4;
- (UIViewController)destinationTitleViewController;
- (UIViewController)sourceTitleViewController;
- (id)animationKey;
- (void)cleanUp;
- (void)setDestinationTitleViewController:(id)a3;
- (void)setSourceTitleViewController:(id)a3;
@end

@implementation PREditorSlidingTitleTransition

- (PREditorSlidingTitleTransition)initWithSourceTitleViewController:(id)a3 destinationTitleViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditorSlidingTitleTransition;
  v9 = [(PREditorSlidingTitleTransition *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceTitleViewController, a3);
    objc_storeStrong((id *)&v10->_destinationTitleViewController, a4);
    v11 = [v8 view];
    [v11 setHidden:0];

    v12 = [v7 view];
    [v12 setHidden:0];
  }
  return v10;
}

- (id)animationKey
{
  return 0;
}

- (void)cleanUp
{
  id v9 = [(PREditorSlidingTitleTransition *)self sourceTitleViewController];
  id v3 = [(PREditorSlidingTitleTransition *)self destinationTitleViewController];
  v4 = [v9 view];
  v5 = [v4 layer];
  v6 = [(PREditorSlidingTitleTransition *)self animationKey];
  [v5 removeAnimationForKey:v6];

  id v7 = [v3 view];
  [v7 setHidden:0];

  if (v9 != v3)
  {
    id v8 = [v9 view];
    [v8 setHidden:1];
  }
}

- (UIViewController)destinationTitleViewController
{
  return self->_destinationTitleViewController;
}

- (void)setDestinationTitleViewController:(id)a3
{
}

- (UIViewController)sourceTitleViewController
{
  return self->_sourceTitleViewController;
}

- (void)setSourceTitleViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTitleViewController, 0);
  objc_storeStrong((id *)&self->_destinationTitleViewController, 0);
}

@end