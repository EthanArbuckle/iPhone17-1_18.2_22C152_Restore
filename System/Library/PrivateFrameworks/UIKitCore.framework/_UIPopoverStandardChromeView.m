@interface _UIPopoverStandardChromeView
+ (Class)legacyChromeViewClass;
+ (Class)standardChromeViewClass;
+ (UIEdgeInsets)contentViewInsets;
+ (double)arrowHeight;
- (BOOL)_shouldUseEqualContentInsetsOnAllSides;
- (BOOL)isDebugModeEnabled;
- (BOOL)isPinned;
- (BOOL)isRightArrowPinnedToBottom;
- (BOOL)isRightArrowPinnedToTop;
- (BOOL)useShortMode;
- (BOOL)usesImagesForShapeMasking;
- (BOOL)wouldPinForOffset:(double)a3;
- (CGRect)_contentViewFrame;
- (UIColor)arrowBackgroundColor;
- (UIColor)contentBlendingColor;
- (UIColor)popoverBackgroundColor;
- (UIEdgeInsets)safeAreaInsetsForContentView;
- (UIView)viewToMaskWhenContentExtendsOverArrow;
- (_UIPopoverStandardChromeView)initWithFrame:(CGRect)a3;
- (double)arrowOffset;
- (double)maxNonPinnedOffset;
- (double)minNonPinnedOffset;
- (int64_t)_resolvedBackgroundStyle;
- (int64_t)backgroundStyle;
- (unint64_t)arrowDirection;
- (void)setArrowBackgroundColor:(id)a3;
- (void)setArrowDirection:(unint64_t)a3;
- (void)setArrowOffset:(double)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setDebugModeEnabled:(BOOL)a3;
- (void)setPopoverBackgroundColor:(id)a3;
- (void)setUseShortMode:(BOOL)a3;
- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3;
@end

@implementation _UIPopoverStandardChromeView

- (void)setArrowOffset:(double)a3
{
  self->_arrowOffset = a3;
}

- (CGRect)_contentViewFrame
{
  v3 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];

  if (v3)
  {
    v24.receiver = self;
    v24.super_class = (Class)_UIPopoverStandardChromeView;
    [(UIPopoverBackgroundView *)&v24 _contentViewFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(_UIPopoverStandardChromeView *)self safeAreaInsetsForContentView];
    double v13 = v12;
    double v15 = v14;
    double v17 = -v16;
    double v19 = v5 - v14;
    double v20 = v7 - v13;
    double v21 = v9 - (-v18 - v15);
    double v22 = v11 - (v17 - v13);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)_UIPopoverStandardChromeView;
    [(UIPopoverBackgroundView *)&v23 _contentViewFrame];
  }
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

+ (UIEdgeInsets)contentViewInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)arrowOffset
{
  return self->_arrowOffset;
}

- (UIEdgeInsets)safeAreaInsetsForContentView
{
  double v3 = [(_UIPopoverStandardChromeView *)self viewToMaskWhenContentExtendsOverArrow];

  double v4 = 0.0;
  if (v3)
  {
    [(id)objc_opt_class() arrowHeight];
    double v6 = v5;
    if ([(_UIPopoverStandardChromeView *)self _shouldUseEqualContentInsetsOnAllSides])
    {
      double v7 = v6;
      double v8 = v6;
      double v9 = v6;
LABEL_4:
      double v4 = v6;
    }
    else
    {
      unint64_t v10 = [(_UIPopoverStandardChromeView *)self arrowDirection];
      double v7 = 0.0;
      double v8 = 0.0;
      double v9 = 0.0;
      switch(v10)
      {
        case 1uLL:
          goto LABEL_4;
        case 2uLL:
          double v8 = v6;
          break;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 4uLL:
          double v9 = v6;
          break;
        case 8uLL:
          double v7 = v6;
          break;
        default:
          goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  double v11 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v9;
  result.top = v11;
  return result;
}

- (unint64_t)arrowDirection
{
  return self->_arrowDirection;
}

- (UIView)viewToMaskWhenContentExtendsOverArrow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->viewToMaskWhenContentExtendsOverArrow);
  return (UIView *)WeakRetained;
}

- (BOOL)_shouldUseEqualContentInsetsOnAllSides
{
  return (byte_1E8FD563C != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_EqualPopoverContentInsetsOnAllSides, @"EqualPopoverContentInsetsOnAllSides");
}

- (BOOL)wouldPinForOffset:(double)a3
{
  if (a3 >= 0.0)
  {
    [(_UIPopoverStandardChromeView *)self maxNonPinnedOffset];
    return v6 < a3;
  }
  else
  {
    [(_UIPopoverStandardChromeView *)self minNonPinnedOffset];
    return v4 > a3;
  }
}

- (UIColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

+ (Class)standardChromeViewClass
{
  _UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ShapeLayerPopoverChromeView, @"ShapeLayerPopoverChromeView");
  id v2 = (id)objc_opt_class();
  return (Class)v2;
}

- (void)setViewToMaskWhenContentExtendsOverArrow:(id)a3
{
}

- (void)setPopoverBackgroundColor:(id)a3
{
}

- (void)setArrowDirection:(unint64_t)a3
{
  self->_arrowDirection = a3;
}

- (void)setArrowBackgroundColor:(id)a3
{
}

- (_UIPopoverStandardChromeView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverStandardChromeView;
  UIEdgeInsets result = -[UIPopoverBackgroundView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_arrowDirection = -1;
  }
  return result;
}

+ (Class)legacyChromeViewClass
{
  return (Class)objc_opt_class();
}

+ (double)arrowHeight
{
  return 0.0;
}

- (BOOL)isPinned
{
  return [(_UIPopoverStandardChromeView *)self wouldPinForOffset:self->_arrowOffset];
}

- (BOOL)usesImagesForShapeMasking
{
  return 1;
}

- (double)minNonPinnedOffset
{
  return 0.0;
}

- (double)maxNonPinnedOffset
{
  return 0.0;
}

- (BOOL)isRightArrowPinnedToTop
{
  BOOL v3 = [(_UIPopoverStandardChromeView *)self isPinned];
  if (v3) {
    LOBYTE(v3) = self->_arrowOffset < 0.0;
  }
  return v3;
}

- (BOOL)isRightArrowPinnedToBottom
{
  BOOL v3 = [(_UIPopoverStandardChromeView *)self isPinned];
  if (v3) {
    LOBYTE(v3) = self->_arrowOffset > 0.0;
  }
  return v3;
}

- (int64_t)_resolvedBackgroundStyle
{
  return 100;
}

- (BOOL)useShortMode
{
  return self->useShortMode;
}

- (void)setUseShortMode:(BOOL)a3
{
  self->useShortMode = a3;
}

- (BOOL)isDebugModeEnabled
{
  return self->_debugMode;
}

- (void)setDebugModeEnabled:(BOOL)a3
{
  self->_debugMode = a3;
}

- (UIColor)arrowBackgroundColor
{
  return self->_arrowBackgroundColor;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (UIColor)contentBlendingColor
{
  return self->_contentBlendingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlendingColor, 0);
  objc_storeStrong((id *)&self->_popoverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundColor, 0);
  objc_destroyWeak((id *)&self->viewToMaskWhenContentExtendsOverArrow);
}

@end