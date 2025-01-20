@interface CACOverlayContainerView
+ (id)badgeViewContainerWithFrame:(CGRect)a3 usingContrast:(BOOL)a4;
@end

@implementation CACOverlayContainerView

+ (id)badgeViewContainerWithFrame:(CGRect)a3 usingContrast:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    +[CACAdaptiveBackdropView contrastAdaptiveBackdropViewWithFrame:](CACAdaptiveBackdropView, "contrastAdaptiveBackdropViewWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v8 = (CACAdaptiveBackdropView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[CACAdaptiveBackdropView initWithFrame:]([CACAdaptiveBackdropView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  v9 = v8;
  v10 = [(CACAdaptiveBackdropView *)v8 layer];
  [v10 setCaptureOnly:1];

  v11 = [(CACAdaptiveBackdropView *)v9 layer];
  [v11 setCreatesCompositingGroup:1];

  [(CACAdaptiveBackdropView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", x, y, width, height);
  v13 = [MEMORY[0x263F825C8] clearColor];
  [v12 setBackgroundColor:v13];

  v14 = [v12 layer];
  [v14 setCreatesCompositingGroup:1];

  [v12 addSubview:v9];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v12;
}

@end