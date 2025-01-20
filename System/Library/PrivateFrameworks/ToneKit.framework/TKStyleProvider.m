@interface TKStyleProvider
- (TKStyleProvider)init;
- (UIColor)vibrationRecorderBarsBackgroundColor;
- (UIColor)vibrationRecorderInstructionsLabelBackgroundColor;
- (UIColor)vibrationRecorderInstructionsLabelTextColor;
- (UIColor)vibrationRecorderProgressViewDotTintColor;
- (UIColor)vibrationRecorderProgressViewTrackColor;
- (UIColor)vibrationRecorderRippleViewBackgroundColor;
- (UIEdgeInsets)vibrationRecorderInstructionsLabelEdgeInsets;
- (UIFont)vibrationRecorderInstructionsLabelFont;
- (UIImage)vibrationRecorderProgressViewResizableDotImage;
- (UIOffset)vibrationRecorderInstructionsLabelPositionOffset;
- (UIScreen)screen;
- (double)defaultAnimationDuration;
- (double)vibrationRecorderControlsToolbarAdditionalHeight;
- (double)vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge;
- (double)vibrationRecorderControlsToolbarVerticalOffset;
- (double)vibrationRecorderInstructionsLabelFadeAnimationDuration;
- (double)vibrationRecorderProgressToolbarAdditionalHeight;
- (double)vibrationRecorderProgressToolbarVerticalOffset;
- (double)vibrationRecorderProgressViewAccessibilityAdditionalHeight;
- (double)vibrationRecorderProgressViewDotHorizontalInset;
- (double)vibrationRecorderProgressViewHeight;
- (double)vibrationRecorderProgressViewHorizontalOffsetFromEdge;
- (double)vibrationRecorderRippleFinalRadius;
- (double)vibrationRecorderRippleFingerMovingSpeed;
- (double)vibrationRecorderRippleFingerStillSpeed;
- (double)vibrationRecorderRippleInitialRadius;
- (double)vibrationRecorderRippleRingLineWidth;
- (id)_bundle;
- (id)_cachedImageWithName:(id)a3 forPropertyWithSelector:(SEL)a4;
- (id)_cachedResizableImageForPropertyWithSelector:(SEL)a3 capInsets:(UIEdgeInsets)a4 size:(CGSize)a5 imageRenderingMode:(int64_t)a6 withDrawingActions:(id)a7;
- (id)_cachedStyleObjectForPropertyWithSelector:(SEL)a3;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_setCachedStyleObject:(id)a3 forPropertyWithSelector:(SEL)a4;
- (void)dealloc;
- (void)setScreen:(id)a3;
@end

@implementation TKStyleProvider

- (TKStyleProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)TKStyleProvider;
  v2 = [(TKStyleProvider *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [(TKStyleProvider *)v2 setScreen:v3];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x263F1D060] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v4.receiver = self;
  v4.super_class = (Class)TKStyleProvider;
  [(TKStyleProvider *)&v4 dealloc];
}

- (id)_bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = self->_bundle;
    self->_bundle = v4;

    bundle = self->_bundle;
  }

  return bundle;
}

- (id)_cachedStyleObjectForPropertyWithSelector:(SEL)a3
{
  if (a3)
  {
    objc_super v4 = NSStringFromSelector(a3);
    if (v4)
    {
      v5 = [(NSMutableDictionary *)self->_cachedStyleProperties objectForKey:v4];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setCachedStyleObject:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6 = a3;
  if (v6 && a4)
  {
    id v11 = v6;
    v7 = NSStringFromSelector(a4);
    if (v7)
    {
      cachedStyleProperties = self->_cachedStyleProperties;
      if (!cachedStyleProperties)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        v10 = self->_cachedStyleProperties;
        self->_cachedStyleProperties = v9;

        cachedStyleProperties = self->_cachedStyleProperties;
      }
      [(NSMutableDictionary *)cachedStyleProperties setObject:v11 forKey:v7];
    }

    id v6 = v11;
  }
}

- (id)_cachedImageWithName:(id)a3 forPropertyWithSelector:(SEL)a4
{
  id v6 = a3;
  v7 = [(TKStyleProvider *)self _cachedStyleObjectForPropertyWithSelector:a4];
  if (!v7)
  {
    if ([v6 length])
    {
      v8 = (void *)MEMORY[0x263F1C6B0];
      v9 = [(TKStyleProvider *)self _bundle];
      v7 = [v8 imageNamed:v6 inBundle:v9];

      [(TKStyleProvider *)self _setCachedStyleObject:v7 forPropertyWithSelector:a4];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_cachedResizableImageForPropertyWithSelector:(SEL)a3 capInsets:(UIEdgeInsets)a4 size:(CGSize)a5 imageRenderingMode:(int64_t)a6 withDrawingActions:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v16 = a7;
  v17 = [(TKStyleProvider *)self _cachedStyleObjectForPropertyWithSelector:a3];
  if (!v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:", width, height);
    v19 = [v18 imageWithActions:v16];
    v20 = v19;
    if (a6)
    {
      uint64_t v21 = [v19 imageWithRenderingMode:a6];

      v20 = (void *)v21;
    }
    if (left == *(double *)(MEMORY[0x263F1D1C0] + 8)
      && top == *MEMORY[0x263F1D1C0]
      && right == *(double *)(MEMORY[0x263F1D1C0] + 24)
      && bottom == *(double *)(MEMORY[0x263F1D1C0] + 16))
    {
      id v25 = v20;
    }
    else
    {
      objc_msgSend(v20, "resizableImageWithCapInsets:", top, left, bottom, right);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v25;
    [(TKStyleProvider *)self _setCachedStyleObject:v25 forPropertyWithSelector:a3];
  }

  return v17;
}

- (void)_didReceiveMemoryWarning:(id)a3
{
  cachedStyleProperties = self->_cachedStyleProperties;
  self->_cachedStyleProperties = 0;

  bundle = self->_bundle;
  self->_bundle = 0;
}

- (double)defaultAnimationDuration
{
  return 0.3;
}

- (UIColor)vibrationRecorderBarsBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global];
}

id __55__TKStyleProvider_vibrationRecorderBarsBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] whiteColor];
  }

  return v2;
}

- (UIFont)vibrationRecorderInstructionsLabelFont
{
  return (UIFont *)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D268]];
}

- (UIColor)vibrationRecorderInstructionsLabelTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_14];
}

id __62__TKStyleProvider_vibrationRecorderInstructionsLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] blackColor];
  }
  v3 = [v2 colorWithAlphaComponent:0.5];

  return v3;
}

- (UIColor)vibrationRecorderInstructionsLabelBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] clearColor];
}

- (UIOffset)vibrationRecorderInstructionsLabelPositionOffset
{
  double v2 = 0.0;
  double v3 = -6.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)vibrationRecorderInstructionsLabelEdgeInsets
{
  double v2 = 20.0;
  double v3 = 20.0;
  double v4 = 20.0;
  double v5 = 20.0;
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (double)vibrationRecorderInstructionsLabelFadeAnimationDuration
{
  [(TKStyleProvider *)self defaultAnimationDuration];
  return v2 / 3.0;
}

- (double)vibrationRecorderControlsToolbarVerticalOffset
{
  double v2 = [(TKStyleProvider *)self screen];
  [v2 scale];
  double v4 = -1.0 / v3;

  return v4;
}

- (double)vibrationRecorderControlsToolbarAdditionalHeight
{
  return 4.0;
}

- (double)vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge
{
  return -2.0;
}

- (double)vibrationRecorderProgressToolbarVerticalOffset
{
  double v2 = [(TKStyleProvider *)self screen];
  [v2 scale];
  double v4 = -1.0 / v3;

  return v4;
}

- (double)vibrationRecorderProgressToolbarAdditionalHeight
{
  double v2 = [(TKStyleProvider *)self screen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (double)vibrationRecorderProgressViewHorizontalOffsetFromEdge
{
  return 15.0;
}

- (double)vibrationRecorderProgressViewHeight
{
  double v2 = [(TKStyleProvider *)self vibrationRecorderProgressViewResizableDotImage];
  [v2 size];
  double v4 = v3 + 2.0;

  return v4;
}

- (UIColor)vibrationRecorderProgressViewTrackColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_16];
}

uint64_t __58__TKStyleProvider_vibrationRecorderProgressViewTrackColor__block_invoke(uint64_t a1, void *a2)
{
  double v2 = dbl_2210A6950[[a2 userInterfaceStyle] == 2];
  double v3 = (void *)MEMORY[0x263F1C550];

  return [v3 colorWithWhite:v2 alpha:1.0];
}

- (double)vibrationRecorderProgressViewDotHorizontalInset
{
  double v2 = [(TKStyleProvider *)self screen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (UIColor)vibrationRecorderProgressViewDotTintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_18];
}

id __60__TKStyleProvider_vibrationRecorderProgressViewDotTintColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  double v2 = [MEMORY[0x263F1C550] blackColor];
  }

  return v2;
}

- (UIImage)vibrationRecorderProgressViewResizableDotImage
{
  double v4 = [(TKStyleProvider *)self _cachedStyleObjectForPropertyWithSelector:a2];
  if (!v4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__TKStyleProvider_vibrationRecorderProgressViewResizableDotImage__block_invoke;
    v11[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    __asm { FMOV            V0.2D, #5.0 }
    long long v12 = _Q0;
    double v4 = -[TKStyleProvider _cachedResizableImageForPropertyWithSelector:capInsets:size:imageRenderingMode:withDrawingActions:](self, "_cachedResizableImageForPropertyWithSelector:capInsets:size:imageRenderingMode:withDrawingActions:", a2, 2, v11, 0.0, 2.0, 0.0, 2.0, 5.0, 5.0);
  }

  return (UIImage *)v4;
}

void __65__TKStyleProvider_vibrationRecorderProgressViewResizableDotImage__block_invoke(uint64_t a1)
{
  double v1 = *MEMORY[0x263F00148];
  double v2 = *(double *)(MEMORY[0x263F00148] + 8);
  double v3 = *(double *)(a1 + 32);
  double v4 = *(double *)(a1 + 40);
  double v5 = [MEMORY[0x263F1C550] blackColor];
  id v6 = [v5 colorWithAlphaComponent:0.3];
  [v6 set];

  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v1, v2, v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 fill];
}

- (double)vibrationRecorderProgressViewAccessibilityAdditionalHeight
{
  return 20.0;
}

- (UIColor)vibrationRecorderRippleViewBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_22];
}

uint64_t __61__TKStyleProvider_vibrationRecorderRippleViewBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  double v2 = dbl_2210A6960[[a2 userInterfaceStyle] == 2];
  double v3 = (void *)MEMORY[0x263F1C550];

  return [v3 colorWithWhite:v2 alpha:1.0];
}

- (double)vibrationRecorderRippleRingLineWidth
{
  double v2 = [(TKStyleProvider *)self screen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (double)vibrationRecorderRippleInitialRadius
{
  return 25.0;
}

- (double)vibrationRecorderRippleFinalRadius
{
  return 75.0;
}

- (double)vibrationRecorderRippleFingerStillSpeed
{
  return 12.36;
}

- (double)vibrationRecorderRippleFingerMovingSpeed
{
  return 25.0;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_cachedStyleProperties, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end