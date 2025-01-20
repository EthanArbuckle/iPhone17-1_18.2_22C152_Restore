@interface TUISeparatedFlickSelectorView
+ (int64_t)hitTestingMode;
- (BOOL)drawsBackground;
- (BOOL)drawsShadows;
- (BOOL)shouldProvideDefaultSelection;
- (BOOL)wantsUserInteractionEnabled;
- (UIEdgeInsets)stackLayoutMargins;
- (double)flickPopupOffset;
- (double)itemSpacing;
- (id)variantCellWithString:(id)a3 annotation:(id)a4;
- (void)decorateVariantView;
- (void)layoutSubviews;
- (void)setInitialHighlight;
@end

@implementation TUISeparatedFlickSelectorView

- (void)setInitialHighlight
{
  v3 = [(TUIKeyPopupView *)self associatedTree];
  if ([v3 flickDirection] == -1)
  {

    goto LABEL_7;
  }
  v4 = [(TUIKeyPopupView *)self arrangedVariantCells];
  uint64_t v5 = [v4 count];

  if (v5 != 1)
  {
LABEL_7:
    v8.receiver = self;
    v8.super_class = (Class)TUISeparatedFlickSelectorView;
    [(TUIKeyPopupView *)&v8 setInitialHighlight];
    return;
  }
  id v7 = [(TUIKeyPopupView *)self arrangedVariantCells];
  v6 = [v7 firstObject];
  [v6 setHighlighted:1];
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [TUISeparatedFlickVariantCell alloc];
  v9 = [(TUIKeyPopupView *)self renderTraits];
  v10 = -[TUISeparatedFlickVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  v11 = [(TUIKeyPopupView *)self touchesForwardingView];
  v12 = [v11 superview];
  [(TUISeparatedFlickVariantCell *)v10 setTouchesForwardingView:v12];

  return v10;
}

- (BOOL)wantsUserInteractionEnabled
{
  v2 = [(TUIKeyPopupView *)self associatedTree];
  BOOL v3 = [v2 flickDirection] == -1;

  return v3;
}

- (BOOL)shouldProvideDefaultSelection
{
  return 0;
}

- (BOOL)drawsShadows
{
  return 0;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (double)itemSpacing
{
  return 8.0;
}

- (double)flickPopupOffset
{
  return 4.0;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2 = 8.0;
  double v3 = 8.0;
  double v4 = 8.0;
  double v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)decorateVariantView
{
  double v2 = [(TUIKeyPopupView *)self variantView];
  double v3 = [v2 layer];
  if (v2) {
    [v2 transform3D];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CATransform3DTranslate(&v9, &v8, 0.0, 0.0, 6.0);
  CATransform3D v7 = v9;
  [v2 setTransform3D:&v7];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.acceptsUpstreamHitTesting"];
  [v3 setValue:v4 forKeyPath:@"separatedOptions.platter.enabled"];
  [v3 setValue:&unk_1EDC79C20 forKeyPath:@"separatedOptions.platter.frontDepthForNormals"];
  [v3 setValue:&unk_1EDC79C30 forKeyPath:@"separatedOptions.platter.mainSpecularStrength"];
  [v3 setValue:&unk_1EDC79C40 forKeyPath:@"separatedOptions.platter.fillSpecularStrength"];
  [v3 setValue:&unk_1EDC79C50 forKeyPath:@"separatedOptions.platter.mainSpecularExponent"];
  [v3 setValue:&unk_1EDC79C60 forKeyPath:@"separatedOptions.platter.fillSpecularExponent"];
  [v3 setValue:&unk_1EDC79C70 forKeyPath:@"separatedOptions.platter.fakeFresnelMaxDist"];
  [v3 setValue:&unk_1EDC79C40 forKeyPath:@"separatedOptions.platter.fakeFresnelStrength"];
  [v3 setValue:&unk_1EDC79C20 forKeyPath:@"separatedOptions.platter.fakeFresnelFalloff"];
  [v3 setValue:&unk_1EDC79C40 forKeyPath:@"separatedOptions.geometry.frontBevel"];
  [v3 setValue:&unk_1EDC79C80 forKeyPath:@"separatedOptions.geometry.flatDepth"];
  [v3 setValue:&unk_1EDC79C80 forKeyPath:@"separatedOptions.geometry.backBevel"];
  [v3 setValue:&unk_1EDC79C90 forKeyPath:@"separatedOptions.shadows.expansionOpacity"];
  [v3 setValue:&unk_1EDC79CA0 forKeyPath:@"separatedOptions.shadows.expansionRadius"];
  [v3 setValue:&unk_1EDC79CA0 forKeyPath:@"separatedOptions.shadows.expansionSize"];
  [v3 setValue:&unk_1EDC79CA0 forKeyPath:@"separatedOptions.shadows.maxDynamicOffset"];
  [v3 setValue:&unk_1EDC79CB0 forKeyPath:@"separatedOptions.shadows.expansionTargetZ"];
  LODWORD(v5) = 1017370378;
  [v3 setShadowOpacity:v5];
  [v3 setShadowRadius:1.0];
  id v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  objc_msgSend(v3, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v3, "setShadowOffset:", 0.5, 2.0);
  [v3 setShadowPathIsBounds:1];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)TUISeparatedFlickSelectorView;
  [(TUIKeyPopupView *)&v10 layoutSubviews];
  [(TUISeparatedFlickSelectorView *)self stackLayoutMargins];
  double v5 = v3 + v4;
  id v6 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v6 layoutFrame];
  double v7 = (v5 + CGRectGetHeight(v11)) * 0.5;
  CATransform3D v8 = [(TUIKeyPopupView *)self variantView];
  CATransform3D v9 = [v8 layer];
  [v9 setCornerRadius:v7];
}

+ (int64_t)hitTestingMode
{
  return 1;
}

@end