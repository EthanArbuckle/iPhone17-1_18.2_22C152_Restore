@interface _UINavigationBarAppearanceStorage
+ (int64_t)typicalBarPosition;
- (BOOL)deferShadowToSearchBar;
- (BOOL)hidesShadow;
- (BOOL)reversesShadowOffset;
- (NSDictionary)textAttributes;
- (NSNumber)backIndicatorLeftMargin;
- (NSString)backdropViewGroupName;
- (UIImage)backIndicatorImage;
- (UIImage)backIndicatorTransitionMaskImage;
- (UIImage)backgroundImage;
- (UIImage)miniBackgroundImage;
- (UIImage)miniPromptBackgroundImage;
- (UIImage)promptBackgroundImage;
- (UIImage)shadowImage;
- (_UIBarButtonItemAppearanceStorage)_barButtonAppearanceStorage;
- (_UIBarButtonItemAppearanceStorage)barButtonAppearanceStorage;
- (double)titleVerticalAdjustmentForBarMetrics:(int64_t)a3;
- (id)representativeImageForIdiom:(int64_t)a3;
- (int64_t)activeBarMetrics;
- (int64_t)defaultBarMetrics;
- (void)setActiveBarMetrics:(int64_t)a3;
- (void)setBackIndicatorImage:(id)a3;
- (void)setBackIndicatorLeftMargin:(id)a3;
- (void)setBackIndicatorTransitionMaskImage:(id)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setDefaultBarMetrics:(int64_t)a3;
- (void)setDeferShadowToSearchBar:(BOOL)a3;
- (void)setHidesShadow:(BOOL)a3;
- (void)setReversesShadowOffset:(BOOL)a3;
- (void)setShadowImage:(id)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTitleVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4;
@end

@implementation _UINavigationBarAppearanceStorage

- (int64_t)activeBarMetrics
{
  return self->activeBarMetrics;
}

- (double)titleVerticalAdjustmentForBarMetrics:(int64_t)a3
{
  titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)titleVerticalAdjustmentsForBarMetrics objectForKey:v6];

  if (!v7)
  {
    if (a3 == 101)
    {
      v8 = &unk_1ED3F3390;
    }
    else
    {
      if (a3 != 102)
      {
        v7 = 0;
        goto LABEL_8;
      }
      v8 = &unk_1ED3F33A8;
    }
    v7 = [(NSMutableDictionary *)self->titleVerticalAdjustmentsForBarMetrics objectForKeyedSubscript:v8];
  }
LABEL_8:
  [v7 floatValue];
  double v10 = v9;

  return v10;
}

- (UIImage)backIndicatorImage
{
  return self->backIndicatorImage;
}

+ (int64_t)typicalBarPosition
{
  return 2;
}

- (void)setShadowImage:(id)a3
{
}

- (void)setHidesShadow:(BOOL)a3
{
  self->hidesShadow = a3;
}

- (BOOL)hidesShadow
{
  return self->hidesShadow;
}

- (UIImage)shadowImage
{
  return self->shadowImage;
}

- (UIImage)backIndicatorTransitionMaskImage
{
  return self->backIndicatorTransitionMaskImage;
}

- (NSDictionary)textAttributes
{
  return self->textAttributes;
}

- (void)setTextAttributes:(id)a3
{
}

- (UIImage)backgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:0];
}

- (UIImage)miniBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:1];
}

- (UIImage)promptBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:101];
}

- (UIImage)miniPromptBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:102];
}

- (void)setTitleVerticalAdjustment:(double)a3 forBarMetrics:(int64_t)a4
{
  id v14 = [NSNumber numberWithInteger:a4];
  v6 = -[NSMutableDictionary objectForKey:](self->titleVerticalAdjustmentsForBarMetrics, "objectForKey:");
  [v6 floatValue];
  double v8 = v7;

  if (v8 != a3)
  {
    titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
    if (!titleVerticalAdjustmentsForBarMetrics)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v12 = self->titleVerticalAdjustmentsForBarMetrics;
      self->titleVerticalAdjustmentsForBarMetrics = v11;

      titleVerticalAdjustmentsForBarMetrics = self->titleVerticalAdjustmentsForBarMetrics;
    }
    *(float *)&double v9 = a3;
    v13 = [NSNumber numberWithFloat:v9];
    [(NSMutableDictionary *)titleVerticalAdjustmentsForBarMetrics setObject:v13 forKey:v14];
  }
}

- (_UIBarButtonItemAppearanceStorage)_barButtonAppearanceStorage
{
  return self->buttonAppearanceStorage;
}

- (_UIBarButtonItemAppearanceStorage)barButtonAppearanceStorage
{
  buttonAppearanceStorage = self->buttonAppearanceStorage;
  if (!buttonAppearanceStorage)
  {
    v4 = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    v5 = self->buttonAppearanceStorage;
    self->buttonAppearanceStorage = v4;

    buttonAppearanceStorage = self->buttonAppearanceStorage;
  }
  return buttonAppearanceStorage;
}

- (id)representativeImageForIdiom:(int64_t)a3
{
  v4 = [(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:0];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:3 barMetrics:0];
  }
  float v7 = v6;

  return v7;
}

- (BOOL)reversesShadowOffset
{
  return self->reversesShadowOffset;
}

- (void)setReversesShadowOffset:(BOOL)a3
{
  self->reversesShadowOffset = a3;
}

- (int64_t)defaultBarMetrics
{
  return self->defaultBarMetrics;
}

- (void)setDefaultBarMetrics:(int64_t)a3
{
  self->defaultBarMetrics = a3;
}

- (void)setActiveBarMetrics:(int64_t)a3
{
  self->activeBarMetrics = a3;
}

- (void)setBackIndicatorImage:(id)a3
{
}

- (void)setBackIndicatorTransitionMaskImage:(id)a3
{
}

- (NSNumber)backIndicatorLeftMargin
{
  return self->backIndicatorLeftMargin;
}

- (void)setBackIndicatorLeftMargin:(id)a3
{
}

- (BOOL)deferShadowToSearchBar
{
  return self->_deferShadowToSearchBar;
}

- (void)setDeferShadowToSearchBar:(BOOL)a3
{
  self->_deferShadowToSearchBar = a3;
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (void)setBackdropViewGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
  objc_storeStrong((id *)&self->buttonAppearanceStorage, 0);
  objc_storeStrong((id *)&self->backIndicatorLeftMargin, 0);
  objc_storeStrong((id *)&self->backIndicatorTransitionMaskImage, 0);
  objc_storeStrong((id *)&self->backIndicatorImage, 0);
  objc_storeStrong((id *)&self->shadowImage, 0);
  objc_storeStrong((id *)&self->titleVerticalAdjustmentsForBarMetrics, 0);
  objc_storeStrong((id *)&self->textAttributes, 0);
}

@end