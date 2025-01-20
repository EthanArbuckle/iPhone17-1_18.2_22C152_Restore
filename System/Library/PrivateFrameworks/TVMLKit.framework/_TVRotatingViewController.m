@interface _TVRotatingViewController
- (void)setView:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _TVRotatingViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_TVRotatingViewController;
  id v7 = a4;
  -[_TVRotatingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80___TVRotatingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264BA6BC0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)setView:(id)a3
{
  id v4 = a3;
  [v4 setAutoresizingMask:18];
  v5.receiver = self;
  v5.super_class = (Class)_TVRotatingViewController;
  [(_TVRotatingViewController *)&v5 setView:v4];
}

@end