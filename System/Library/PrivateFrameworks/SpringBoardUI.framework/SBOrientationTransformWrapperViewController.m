@interface SBOrientationTransformWrapperViewController
- (BSUIOrientationTransformWrapperView)view;
- (void)loadView;
@end

@implementation SBOrientationTransformWrapperViewController

- (BSUIOrientationTransformWrapperView)view
{
  v4.receiver = self;
  v4.super_class = (Class)SBOrientationTransformWrapperViewController;
  v2 = [(SBOrientationTransformWrapperViewController *)&v4 view];

  return (BSUIOrientationTransformWrapperView *)v2;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F29D50]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(SBOrientationTransformWrapperViewController *)self setView:v4];
}

@end