@interface _UIContextMenuActionsOnlyViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations;
- (CGSize)preferredContentSize;
- (UITargetedPreview)sourcePreview;
- (_UIContextMenuActionsOnlyViewController)initWithTargetedPreview:(id)a3;
- (void)setSourcePreview:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIContextMenuActionsOnlyViewController

- (_UIContextMenuActionsOnlyViewController)initWithTargetedPreview:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuActionsOnlyViewController;
  v5 = [(UIViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(_UIContextMenuActionsOnlyViewController *)v5 setSourcePreview:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuActionsOnlyViewController;
  [(UIViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  id v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (CGSize)preferredContentSize
{
  v3 = [(_UIContextMenuActionsOnlyViewController *)self sourcePreview];
  id v4 = [v3 target];

  memset(&v17[1], 0, sizeof(CGAffineTransform));
  if (v4) {
    [v4 transform];
  }
  memset(v17, 0, 48);
  objc_super v5 = [v4 container];
  v6 = [v4 container];
  v7 = [v6 window];
  _UIGetTransformBetweenViews(v5, v7, 1, (uint64_t)v17);

  CGAffineTransform t1 = v17[1];
  memset(&v16, 0, sizeof(v16));
  CGAffineTransform t2 = v17[0];
  CGAffineTransformConcat(&v16, &t1, &t2);
  CGAffineTransform t2 = v16;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformDecompose((CGAffineTransformComponents *)&t1, &t2);
  CGAffineTransformMakeScale(&t2, t1.a, t1.b);
  CGAffineTransform v16 = t2;
  objc_super v8 = [(_UIContextMenuActionsOnlyViewController *)self sourcePreview];
  [v8 size];
  float64x2_t v13 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v16.a, v9), vmulq_n_f64(*(float64x2_t *)&v16.c, v10));

  double v12 = v13.f64[1];
  double v11 = v13.f64[0];
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (void).cxx_destruct
{
}

@end