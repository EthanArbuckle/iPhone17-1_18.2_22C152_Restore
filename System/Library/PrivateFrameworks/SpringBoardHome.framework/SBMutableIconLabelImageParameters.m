@interface SBMutableIconLabelImageParameters
- (id)copy;
- (void)setAccessibilityReduceTransparencyEnabled:(BOOL)a3;
- (void)setCanTighten:(BOOL)a3;
- (void)setCanTruncate:(BOOL)a3;
- (void)setColorspaceGrayscale:(BOOL)a3;
- (void)setContainsEmoji:(BOOL)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setFocusHighlightColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontLanguageInsets:(UIEdgeInsets)a3;
- (void)setLegibilityStyle:(int64_t)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setScale:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextInsets:(UIEdgeInsets)a3;
@end

@implementation SBMutableIconLabelImageParameters

- (void)setTextInsets:(UIEdgeInsets)a3
{
  if (self->super._textInsets.left != a3.left
    || self->super._textInsets.top != a3.top
    || self->super._textInsets.right != a3.right
    || self->super._textInsets.bottom != a3.bottom)
  {
    self->super._textInsets = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->super._textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._textColor, a3);
    v5 = v6;
    self->super._recalculateHash = 1;
  }
}

- (void)setText:(id)a3
{
  if (self->super._text != a3)
  {
    v4 = (NSString *)[a3 copy];
    text = self->super._text;
    self->super._text = v4;

    self->super._recalculateHash = 1;
  }
}

- (void)setScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->super._scale = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setMaxSize:(CGSize)a3
{
  if (self->super._maxSize.width != a3.width || self->super._maxSize.height != a3.height)
  {
    self->super._maxSize = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setLegibilityStyle:(int64_t)a3
{
  if (self->super._legibilityStyle != a3)
  {
    self->super._legibilityStyle = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setFontLanguageInsets:(UIEdgeInsets)a3
{
  if (self->super._fontLanguageInsets.left != a3.left
    || self->super._fontLanguageInsets.top != a3.top
    || self->super._fontLanguageInsets.right != a3.right
    || self->super._fontLanguageInsets.bottom != a3.bottom)
  {
    self->super._fontLanguageInsets = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (self->super._font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._font, a3);
    v5 = v6;
    self->super._recalculateHash = 1;
  }
}

- (void)setFocusHighlightColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->super._focusHighlightColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->super._focusHighlightColor, a3);
    self->super._recalculateHash = 1;
  }
}

- (void)setContentSizeCategory:(id)a3
{
  if (self->super._contentSizeCategory != a3)
  {
    v4 = (NSString *)[a3 copy];
    contentSizeCategory = self->super._contentSizeCategory;
    self->super._contentSizeCategory = v4;

    self->super._recalculateHash = 1;
  }
}

- (void)setContainsEmoji:(BOOL)a3
{
  if (self->super._containsEmoji != a3)
  {
    self->super._containsEmoji = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setCanTruncate:(BOOL)a3
{
  if (self->super._canTruncate != a3)
  {
    self->super._canTruncate = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setCanTighten:(BOOL)a3
{
  if (self->super._canTighten != a3)
  {
    self->super._canTighten = a3;
    self->super._recalculateHash = 1;
  }
}

- (void)setAccessibilityReduceTransparencyEnabled:(BOOL)a3
{
  if (self->super._accessibilityReduceTransparencyEnabled != a3)
  {
    self->super._accessibilityReduceTransparencyEnabled = a3;
    self->super._recalculateHash = 1;
  }
}

- (id)copy
{
  v3 = [SBIconLabelImageParameters alloc];
  return [(SBIconLabelImageParameters *)v3 initWithParameters:self];
}

- (void)setColorspaceGrayscale:(BOOL)a3
{
  self->super._colorspaceGrayscale = a3;
  self->super._colorspaceGrayscaleSet = 1;
  self->super._recalculateHash = 1;
}

@end