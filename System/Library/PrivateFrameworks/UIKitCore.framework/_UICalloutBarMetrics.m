@interface _UICalloutBarMetrics
- (BOOL)displaySeparators;
- (BOOL)isVerticallyAligned;
- (NSArray)blurViewBackgroundEffects;
- (UIColor)backgroundColor;
- (UIColor)separatorColor;
- (_UICalloutBarMetrics)init;
- (double)cornerRadius;
- (double)horizontalPadding;
- (double)interitemPadding;
- (double)verticalPadding;
- (void)setIsVerticallyAligned:(BOOL)a3;
@end

@implementation _UICalloutBarMetrics

- (_UICalloutBarMetrics)init
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UICalloutBarMetrics;
  v2 = [(_UICalloutBarMetrics *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_isVerticallyAligned = 0;
    backgroundColor = v2->_backgroundColor;
    v2->_cornerRadius = 8.0;
    v2->_backgroundColor = 0;

    v5 = +[UIBlurEffect _effectWithInfiniteRadius];
    v13[0] = v5;
    v6 = +[UIColorEffect colorEffectLuminanceCurveMap:&unk_1ED3EFB00 blendingAmount:1.0];
    v13[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    blurViewBackgroundEffects = v3->_blurViewBackgroundEffects;
    v3->_blurViewBackgroundEffects = (NSArray *)v7;

    v3->_interitemPadding = 0.0;
    v3->_verticalPadding = 0.0;
    v3->_horizontalPadding = 0.0;
    v3->_displaySeparators = 1;
    uint64_t v9 = +[UIColor whiteColor];
    separatorColor = v3->_separatorColor;
    v3->_separatorColor = (UIColor *)v9;
  }
  return v3;
}

- (BOOL)isVerticallyAligned
{
  return self->_isVerticallyAligned;
}

- (void)setIsVerticallyAligned:(BOOL)a3
{
  self->_isVerticallyAligned = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)blurViewBackgroundEffects
{
  return self->_blurViewBackgroundEffects;
}

- (double)interitemPadding
{
  return self->_interitemPadding;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)displaySeparators
{
  return self->_displaySeparators;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_blurViewBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end