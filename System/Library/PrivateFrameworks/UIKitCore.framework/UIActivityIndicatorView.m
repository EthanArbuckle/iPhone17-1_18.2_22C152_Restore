@interface UIActivityIndicatorView
+ (CGSize)defaultSizeForStyle:(int64_t)a3;
+ (NSCopying)visualStyleRegistryIdentity;
+ (id)_imageSetNameForArtworkBasedStyle:(int64_t)a3 outImageCount:(int64_t *)a4;
+ (id)_loadResourcesForArtworkBasedStyle:(int64_t)a3;
- (BOOL)_colorRequiresDynamicTinting;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_disableUpdateColorOnTraitCollectionChange;
- (BOOL)_hasClientSetColor;
- (BOOL)_hasShadow;
- (BOOL)_isArtworkBasedStyle;
- (BOOL)_isShowingMessage;
- (BOOL)_isStatusBarStyle;
- (BOOL)_restartAnimationOnNextLayout;
- (BOOL)_shouldGoBackToBaseStyle;
- (BOOL)_shouldGoToCustomStyle;
- (BOOL)_useCustomStyleForLegacyStyles;
- (BOOL)_wantsAnimationRestoration;
- (BOOL)hasShadow;
- (BOOL)hidesWhenStopped;
- (BOOL)isAnimating;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isHighlighted;
- (BOOL)spinning;
- (CGRect)_animatingImageViewFrameForBounds:(CGRect)a3;
- (CGRect)_messageLabelFrameForBounds:(CGRect)a3;
- (CGSize)_defaultSizeConsultingCustomWidthIfApplicable;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)shadowOffset;
- (NSArray)_spokeHighlightImages;
- (NSArray)_spokeImages;
- (NSString)_message;
- (UIActivityIndicatorView)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (UIActivityIndicatorView)initWithCoder:(NSCoder *)coder;
- (UIActivityIndicatorView)initWithFrame:(CGRect)frame;
- (UIActivityIndicatorViewStyle)activityIndicatorViewStyle;
- (UIColor)color;
- (UIColor)shadowColor;
- (UIImageView)_animatingImageView;
- (_UIActivityIndicatorMessageLabel)_messageLabel;
- (_UIActivityIndicatorViewArtworkCacheKey)_lastArtCacheKey;
- (_UIActivityIndicatorViewArtworkCacheKey)_lastHighlightArtCacheKey;
- (double)_alphaValueForStep:(int64_t)a3;
- (double)_customWidth;
- (double)_effectiveCustomWidth;
- (double)_spokeLengthForGearWidth:(double)a3;
- (double)_spokeWidthForGearWidth:(double)a3;
- (double)_widthForGearWidth:(double)result;
- (double)animationDuration;
- (double)width;
- (id)_artCacheKeyWithStyle:(int64_t)a3 color:(id)a4;
- (id)_defaultColorForStyle:(int64_t)a3;
- (id)_generateImagesForColor:(id)a3 highlight:(BOOL)a4;
- (id)_generateModernImagesForImages:(id)a3 color:(id)a4;
- (id)_highlightColorForStyle:(int64_t)a3;
- (id)_imageForStep:(int64_t)a3 withColor:(id)a4;
- (id)_imagesForStyle:(int64_t)a3 color:(id)a4 highlight:(BOOL)a5;
- (int64_t)_actualActivityIndicatorViewStyle;
- (int64_t)_actualStyleByResolvingAutoUpdatingStyle:(int64_t)a3;
- (int64_t)_customStyleForStyle:(int64_t)a3;
- (int64_t)_defaultStyle;
- (int64_t)_externalStyleForStyle:(int64_t)a3;
- (int64_t)_internalStyleForStyle:(int64_t)a3;
- (int64_t)_sizeForStyle:(int64_t)a3;
- (int64_t)_spokeCount;
- (int64_t)_spokeFrameRatio;
- (unint64_t)_indexOfFirstImageForStartingAnimation;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_commonInit;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_refreshStyle;
- (void)_removeAllAnimations:(BOOL)a3;
- (void)_restoreRemovedAnimationsIncludingSubviews;
- (void)_setCustomWidth:(double)a3;
- (void)_setMessage:(id)a3;
- (void)_setUpAnimation;
- (void)_tearDownAnimation;
- (void)_updateLayoutInfo;
- (void)_updateMessageForStyle:(int64_t)a3;
- (void)_updateSubviewFramesWithBounds:(CGRect)a3;
- (void)_updateVisualStyleProperties;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setColor:(UIColor *)color;
- (void)setFrame:(CGRect)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHidesWhenStopped:(BOOL)hidesWhenStopped;
- (void)setHighlighted:(BOOL)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setSpinning:(BOOL)a3;
- (void)setWidth:(double)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIActivityIndicatorView

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityIndicatorView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self bounds];
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  objc_super v4 = (_UIActivityIndicatorViewStyleView *)a3;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
  styleView = self->_styleView;

  if (styleView == v4) {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_setUpAnimation
{
  styleView = self->_styleView;
  if (styleView)
  {
    [(_UIActivityIndicatorViewStyleView *)styleView setUpAnimation];
  }
  else
  {
    uint64_t v4 = [(UIActivityIndicatorView *)self _indexOfFirstImageForStartingAnimation];
    v5 = _reorderImagesToStartAtIndex(self->_spokeImages, v4);
    [(UIImageView *)self->_animatingImageView setAnimationImages:v5];

    spokeHighlightImages = self->_spokeHighlightImages;
    if (spokeHighlightImages)
    {
      v7 = _reorderImagesToStartAtIndex(spokeHighlightImages, v4);
      [(UIImageView *)self->_animatingImageView setHighlightedAnimationImages:v7];
    }
    else
    {
      [(UIImageView *)self->_animatingImageView setHighlightedAnimationImages:0];
    }
    if (self->_duration == 0.0)
    {
      v8 = +[_UIActivityIndicatorSettingsDomain rootSettings];
      [v8 fullLoopDuration];
      -[UIImageView setAnimationDuration:](self->_animatingImageView, "setAnimationDuration:");
    }
    else
    {
      -[UIImageView setAnimationDuration:](self->_animatingImageView, "setAnimationDuration:");
    }
    [(UIImageView *)self->_animatingImageView setAnimationRepeatCount:0];
    animatingImageView = self->_animatingImageView;
    [(UIImageView *)animatingImageView startAnimating];
  }
}

- (unint64_t)_indexOfFirstImageForStartingAnimation
{
  BOOL v3 = [(UIActivityIndicatorView *)self isHighlighted];
  animatingImageView = self->_animatingImageView;
  if (v3)
  {
    v5 = [(UIImageView *)animatingImageView highlightedImage];
    objc_super v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(UIImageView *)self->_animatingImageView image];
    }
    v8 = v7;

    if (!v8) {
      goto LABEL_22;
    }
  }
  else
  {
    v8 = [(UIImageView *)animatingImageView image];
    if (!v8)
    {
LABEL_22:
      unint64_t v11 = 0;
      goto LABEL_23;
    }
  }
  uint64_t v9 = 13;
  if (v3) {
    uint64_t v9 = 12;
  }
  v10 = (NSArray *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___UIActivityIndicatorView__shadowOffset[v9]));
  if (!v10) {
    v10 = self->_spokeImages;
  }
  unint64_t v11 = [(NSArray *)v10 indexOfObject:v8];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 12;
    if (v3) {
      uint64_t v12 = 13;
    }
    id v13 = objc_retain(*(id *)((char *)&self->super.super.super.isa
                            + OBJC_IVAR___UIActivityIndicatorView__shadowOffset[v12]));
    unint64_t v14 = [v13 indexOfObject:v8];
    if (v14) {
      BOOL v15 = v14 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15 || (unint64_t v11 = v14, v14 >= [(NSArray *)v10 count])) {
      unint64_t v11 = 0;
    }
  }
LABEL_23:

  return v11;
}

- (id)_imageForStep:(int64_t)a3 withColor:(id)a4
{
  id v6 = a4;
  [(UIActivityIndicatorView *)self _spokeWidthForGearWidth:self->_width];
  double v8 = v7;
  [(UIActivityIndicatorView *)self _spokeLengthForGearWidth:self->_width];
  double v10 = v9;
  int64_t spokeCount = self->_spokeCount;
  [(UIActivityIndicatorView *)self _widthForGearWidth:self->_width];
  double v13 = v12 * 0.5;
  double v14 = 0.0;
  BOOL v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v12 * 0.5 - v8, v10, v8 + v8, v8);
  double width = self->_width;
  [(UIActivityIndicatorView *)self _widthForGearWidth:width];
  double v18 = (width - v17) * 0.5;
  if (self->_shadowColor)
  {
    double v19 = self->_shadowOffset.width;
    double height = self->_shadowOffset.height;
    double v21 = -v19;
    if (v19 >= 0.0) {
      double v21 = 0.0;
    }
    double v22 = v18 + v21;
    double v23 = -height;
    if (height >= 0.0) {
      double v23 = 0.0;
    }
    double v24 = v18 + fmax(v19, 0.0);
    double v14 = v18 + fmax(height, 0.0);
    double v25 = self->_width;
    double v18 = v18 + v23;
    double v26 = fabs(v19) + v25;
    double v27 = v25 + fabs(height);
  }
  else
  {
    double v26 = self->_width;
    double v24 = 0.0;
    double v22 = v18;
    double v27 = v26;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v26, v27, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v29 = 0;
  }
  else {
    v29 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v30 = 6.28318531 / (double)spokeCount;
  if ((self->_shadowOffset.width > 0.0 || self->_shadowOffset.height > 0.0) && self->_shadowColor)
  {
    CGContextSaveGState(v29);
    CGContextTranslateCTM(v29, v24, v14);
    if (spokeCount >= 1)
    {
      for (uint64_t i = 0; i != spokeCount; ++i)
      {
        CGContextSaveGState(v29);
        CGContextTranslateCTM(v29, v13, v13);
        CGContextRotateCTM(v29, -v30 * (double)(int)i);
        CGContextTranslateCTM(v29, -v13, -v13);
        [(UIColor *)self->_shadowColor set];
        [v15 fill];
        CGContextRestoreGState(v29);
      }
    }
    CGContextTranslateCTM(v29, -v24, -v14);
    CGContextRestoreGState(v29);
  }
  id v32 = v6;
  size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[v32 CGColor]);
  id v34 = v32;
  Components = CGColorGetComponents((CGColorRef)[v34 CGColor]);
  if (NumberOfComponents) {
    double v36 = *(const CGFloat *)((char *)Components + ((uint64_t)((NumberOfComponents << 32) - 0x100000000) >> 29));
  }
  else {
    double v36 = 1.0;
  }
  CGContextSaveGState(v29);
  CGContextTranslateCTM(v29, v24, v14);
  int64_t v37 = [(UIActivityIndicatorView *)self _spokeFrameRatio];
  int64_t v38 = [(UIActivityIndicatorView *)self _spokeFrameRatio];
  if (spokeCount >= 1)
  {
    uint64_t v39 = 0;
    int64_t v40 = a3 % v37;
    double v41 = -v30;
    int64_t v42 = a3 / v38;
    do
    {
      int64_t v43 = v40 + [(UIActivityIndicatorView *)self _spokeFrameRatio] * (v42 + v39);
      int64_t v44 = v43 % ([(UIActivityIndicatorView *)self _spokeFrameRatio] * spokeCount);
      CGContextSaveGState(v29);
      CGContextTranslateCTM(v29, v13, v13);
      CGContextRotateCTM(v29, v41 * (double)(int)v39);
      CGContextTranslateCTM(v29, -v13, -v13);
      [(UIActivityIndicatorView *)self _alphaValueForStep:v44];
      v46 = [v34 colorWithAlphaComponent:v36 * v45];
      [v46 set];

      [v15 fillWithBlendMode:17 alpha:0.85];
      CGContextRestoreGState(v29);
      ++v39;
    }
    while (spokeCount != v39);
  }
  CGContextTranslateCTM(v29, -v22, -v18);
  CGContextRestoreGState(v29);
  v47 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v47;
}

- (int64_t)_spokeFrameRatio
{
  return self->_spokeFrameRatio;
}

- (double)_alphaValueForStep:(int64_t)a3
{
  int64_t v5 = [(UIActivityIndicatorView *)self _spokeCount];
  int64_t v6 = [(UIActivityIndicatorView *)self _spokeFrameRatio] * v5;
  double result = 1.0;
  if ((unint64_t)(v6 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    double result = -0.68 / (double)(v6 / 2) * (double)a3 + 1.0;
    if (result < 0.32) {
      return 0.32;
    }
  }
  return result;
}

- (int64_t)_spokeCount
{
  return self->_spokeCount;
}

- (double)_widthForGearWidth:(double)result
{
  if (result == 37.0) {
    return 35.0;
  }
  return result;
}

- (double)_spokeWidthForGearWidth:(double)a3
{
  int64_t actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
  BOOL v5 = a3 < 20.0 && actualActivityIndicatorViewStyle == 16;
  double v6 = 1.0;
  if (a3 == 14.0 || v5) {
    return v6;
  }
  BOOL v8 = a3 < 30.0 && actualActivityIndicatorViewStyle == 16;
  if (a3 == 20.0 || v8)
  {
    BOOL v10 = self->_spokeCount == 12;
    double v11 = 1.25;
    double v6 = 1.0;
    goto LABEL_20;
  }
  BOOL v14 = a3 < 32.0 && actualActivityIndicatorViewStyle == 16;
  double v6 = 1.75;
  if (a3 != 30.0 && !v14)
  {
    BOOL v15 = a3 < 37.0 && actualActivityIndicatorViewStyle == 16;
    BOOL v16 = v15;
    double v6 = 2.0;
    if (a3 != 32.0 && !v16)
    {
      BOOL v18 = a3 < 42.75 && actualActivityIndicatorViewStyle == 16;
      if (a3 == 37.0 || v18)
      {
        BOOL v10 = self->_spokeCount == 12;
        double v11 = 2.5;
        double v6 = 1.5;
        goto LABEL_20;
      }
      if (a3 < 60.0 && actualActivityIndicatorViewStyle == 16)
      {
        if (a3 >= 48.5)
        {
          BOOL v10 = self->_spokeCount == 12;
          if (a3 >= 54.25)
          {
            double v11 = 3.5;
            double v6 = 3.0;
          }
          else
          {
            double v11 = 3.0;
            double v6 = 2.5;
          }
        }
        else
        {
          BOOL v10 = self->_spokeCount == 12;
          double v11 = 3.0;
          double v6 = 2.0;
        }
LABEL_20:
        if (!v10) {
          return v11;
        }
        return v6;
      }
      double v6 = 3.5;
      if (a3 != 60.0)
      {
        float v19 = a3 / 7.5;
        double v20 = nearbyintf(v19) * 0.5;
        double v6 = 1.0;
        if (v20 >= 1.0) {
          return v20;
        }
      }
    }
  }
  return v6;
}

- (double)_spokeLengthForGearWidth:(double)a3
{
  int64_t actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
  if (a3 > 14.0 || actualActivityIndicatorViewStyle != 16)
  {
    double v5 = 4.0;
    if (a3 == 14.0) {
      return v5;
    }
    if (a3 > 20.0 || actualActivityIndicatorViewStyle != 16)
    {
      if (a3 == 20.0)
      {
        double v5 = 5.0;
        if (self->_spokeCount == 12) {
          return v5;
        }
      }
      else
      {
        BOOL v8 = a3 <= 24.0 && actualActivityIndicatorViewStyle == 16;
        if (!v8
          && a3 != 24.0
          && (a3 > 30.0 || actualActivityIndicatorViewStyle != 16)
          && a3 != 30.0
          && (a3 > 32.0 || actualActivityIndicatorViewStyle != 16))
        {
          double v5 = 10.0;
          if (a3 == 32.0) {
            return v5;
          }
          if (a3 > 40.0 || actualActivityIndicatorViewStyle != 16)
          {
            double v5 = 14.0;
            if (a3 == 40.0) {
              return v5;
            }
            if (a3 > 60.0 || actualActivityIndicatorViewStyle != 16)
            {
              double v5 = 19.0;
              if (a3 == 60.0) {
                return v5;
              }
              if ((a3 > 64.0 || actualActivityIndicatorViewStyle != 16)
                && a3 != 64.0
                && actualActivityIndicatorViewStyle != 16)
              {
                double v5 = 10.0;
                if (self->_spokeCount != 12) {
                  return 12.0;
                }
                return v5;
              }
            }
          }
        }
      }
    }
  }
  UIRoundToViewScale(self);
  return result;
}

- (void)tintColorDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v2 tintColorDidChange];
}

- (void)_removeAllAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  self->_wasAnimatingWhenAnimationsRemoved = [(UIActivityIndicatorView *)self isAnimating];
  [(UIActivityIndicatorView *)self stopAnimating];
  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v5 _removeAllAnimations:v3];
}

- (void)stopAnimating
{
  [(UIActivityIndicatorView *)self _tearDownAnimation];
  self->_animating = 0;
  [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
  if (!self->_styleView && [(UIActivityIndicatorView *)self hidesWhenStopped])
  {
    [(UIView *)self setHidden:1];
  }
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v37 layoutSubviews];
  [(UIView *)self bounds];
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
  if (self->_styleView)
  {
    if (self->_restartAnimationOnNextLayout && self->_animating)
    {
      BOOL v3 = [(UIView *)self window];

      if (v3)
      {
        [(UIActivityIndicatorView *)self _setUpAnimation];
        self->_restartAnimationOnNextLayout = 0;
      }
    }
    return;
  }
  if (!layoutSubviews___AIVArtCache)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    objc_super v5 = (void *)layoutSubviews___AIVArtCache;
    layoutSubviews___AIVArtCache = (uint64_t)v4;

    [(id)layoutSubviews___AIVArtCache setName:@"com.apple.UIKit.UIActivityIndicatorViewGearImagesCache"];
  }
  if (!self->_lastArtCacheKey) {
    [(UIActivityIndicatorView *)self _updateLayoutInfo];
  }
  if (self->_activityIndicatorViewStyle == 16)
  {
    int64_t actualActivityIndicatorViewStyle = 16;
    self->_int64_t actualActivityIndicatorViewStyle = 16;
    goto LABEL_18;
  }
  if ([(UIActivityIndicatorView *)self _shouldGoToCustomStyle])
  {
    int64_t activityIndicatorViewStyle = [(UIActivityIndicatorView *)self _customStyleForStyle:self->_activityIndicatorViewStyle];
LABEL_16:
    int64_t actualActivityIndicatorViewStyle = [(UIActivityIndicatorView *)self _actualStyleByResolvingAutoUpdatingStyle:activityIndicatorViewStyle];
    self->_int64_t actualActivityIndicatorViewStyle = actualActivityIndicatorViewStyle;
    goto LABEL_18;
  }
  if ([(UIActivityIndicatorView *)self _shouldGoBackToBaseStyle])
  {
    int64_t activityIndicatorViewStyle = self->_activityIndicatorViewStyle;
    goto LABEL_16;
  }
  int64_t actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle;
LABEL_18:
  BOOL v8 = [(UIActivityIndicatorView *)self color];
  double v9 = [(UIActivityIndicatorView *)self _artCacheKeyWithStyle:actualActivityIndicatorViewStyle color:v8];
  BOOL v10 = self->_lastArtCacheKey;
  double v11 = v9;
  double v12 = v11;
  lastArtCacheKey = v11;
  BOOL v14 = (NSArray *)v11;
  BOOL v15 = v10 != v11;
  if (v10 != v11)
  {
    if (v11 && v10)
    {
      BOOL v16 = [(_UIActivityIndicatorViewArtworkCacheKey *)v10 isEqual:v11];

      if (v16)
      {
        BOOL v15 = 0;
        goto LABEL_28;
      }
    }
    else
    {
    }
    double v17 = [(id)layoutSubviews___AIVArtCache objectForKey:v12];
    if (!v17)
    {
      double v17 = [(UIActivityIndicatorView *)self _imagesForStyle:actualActivityIndicatorViewStyle color:v8 highlight:0];
      [(id)layoutSubviews___AIVArtCache setObject:v17 forKey:v12];
    }
    spokeImages = self->_spokeImages;
    self->_spokeImages = v17;
    BOOL v14 = v17;

    float v19 = v12;
    lastArtCacheKey = self->_lastArtCacheKey;
    self->_lastArtCacheKey = v19;
  }

LABEL_28:
  double v20 = [(UIActivityIndicatorView *)self _highlightColorForStyle:actualActivityIndicatorViewStyle];
  if (v20)
  {
    double v21 = [(UIActivityIndicatorView *)self _artCacheKeyWithStyle:actualActivityIndicatorViewStyle color:v20];
    double v22 = self->_lastHighlightArtCacheKey;
    double v23 = v21;
    double v24 = v23;
    lastHighlightArtCacheKey = v23;
    double v26 = (NSArray *)v23;
    BOOL v27 = v22 != v23;
    if (v22 != v23)
    {
      if (v23 && v22)
      {
        BOOL v28 = [(_UIActivityIndicatorViewArtworkCacheKey *)v22 isEqual:v23];

        if (v28)
        {
          BOOL v27 = 0;
          goto LABEL_40;
        }
      }
      else
      {
      }
      double v30 = [(id)layoutSubviews___AIVArtCache objectForKey:v24];
      if (!v30)
      {
        double v30 = [(UIActivityIndicatorView *)self _imagesForStyle:actualActivityIndicatorViewStyle color:v20 highlight:1];
        [(id)layoutSubviews___AIVArtCache setObject:v30 forKey:v24];
      }
      spokeHighlightImages = self->_spokeHighlightImages;
      self->_spokeHighlightImages = v30;
      double v26 = v30;

      id v32 = v24;
      lastHighlightArtCacheKey = self->_lastHighlightArtCacheKey;
      self->_lastHighlightArtCacheKey = v32;
    }
  }
  else
  {
    v29 = self->_spokeHighlightImages;
    self->_spokeHighlightImages = 0;

    double v24 = self->_lastHighlightArtCacheKey;
    BOOL v27 = v24 != 0;
    self->_lastHighlightArtCacheKey = 0;
  }
LABEL_40:

  if (v15 || v27 || self->_restartAnimationOnNextLayout)
  {
    BOOL animating = self->_animating;
    if (self->_animating) {
      [(UIActivityIndicatorView *)self _tearDownAnimation];
    }
    id v34 = [(NSArray *)self->_spokeImages firstObject];
    [(UIImageView *)self->_animatingImageView setImage:v34];

    v35 = [(NSArray *)self->_spokeHighlightImages firstObject];
    [(UIImageView *)self->_animatingImageView setHighlightedImage:v35];

    if (animating)
    {
      double v36 = [(UIView *)self window];

      if (v36)
      {
        [(UIActivityIndicatorView *)self _setUpAnimation];
        self->_restartAnimationOnNextLayout = 0;
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityIndicatorView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self bounds];
  -[UIActivityIndicatorView _updateSubviewFramesWithBounds:](self, "_updateSubviewFramesWithBounds:");
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  styleView = self->_styleView;
  if (styleView)
  {
    -[_UIActivityIndicatorViewStyleView sizeThatFits:](styleView, "sizeThatFits:", a3.width, a3.height);
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    [(UIActivityIndicatorView *)self _defaultSizeConsultingCustomWidthIfApplicable];
    double v6 = v10;
    double v8 = v9;
    double width = self->_shadowOffset.width;
    if ((width > 0.0 || self->_shadowOffset.height > 0.0) && self->_shadowColor)
    {
      double v12 = fabs(width);
      double v6 = v6 + v12 + v12;
      double v13 = fabs(self->_shadowOffset.height);
      double v8 = v9 + v13 + v13;
    }
    if ([(UIActivityIndicatorView *)self _isShowingMessage])
    {
      [(UILabel *)self->_messageLabel intrinsicContentSize];
      double v15 = v14;
      double v17 = v16;
      [(_UIActivityIndicatorMessageLabel *)self->_messageLabel verticalSpacingToSpinner];
      double v8 = v8 + v17 + v18;
      if (v6 < v15) {
        double v6 = v15;
      }
    }
  }
  double v19 = v6;
  double v20 = v8;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)_updateSubviewFramesWithBounds:(CGRect)a3
{
  styleView = self->_styleView;
  if (styleView)
  {
    [(UIView *)self bounds];
    messageLabel = (_UIActivityIndicatorMessageLabel *)styleView;
LABEL_7:
    -[UILabel setFrame:](messageLabel, "setFrame:");
    return;
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!self->_animatingImageView)
  {
    double v10 = [UIImageView alloc];
    double v11 = -[UIImageView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    animatingImageView = self->_animatingImageView;
    self->_animatingImageView = v11;

    [(UIView *)self addSubview:self->_animatingImageView];
  }
  -[UIActivityIndicatorView _animatingImageViewFrameForBounds:](self, "_animatingImageViewFrameForBounds:", x, y, width, height);
  -[UIImageView setFrame:](self->_animatingImageView, "setFrame:");
  if ([(UIActivityIndicatorView *)self _isShowingMessage])
  {
    -[UIActivityIndicatorView _messageLabelFrameForBounds:](self, "_messageLabelFrameForBounds:", x, y, width, height);
    messageLabel = self->_messageLabel;
    goto LABEL_7;
  }
  [(UIView *)self->_messageLabel removeFromSuperview];
  double v13 = self->_messageLabel;
  self->_messageLabel = 0;
}

- (BOOL)_isShowingMessage
{
  return [(NSString *)self->_message length] != 0;
}

- (CGRect)_animatingImageViewFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(UIActivityIndicatorView *)self _defaultSizeConsultingCustomWidthIfApplicable];
  double v7 = v6;
  double v9 = self->_shadowOffset.width;
  double v8 = self->_shadowOffset.height;
  double v10 = fabs(v8);
  double v12 = v11 + v10;
  messageLabel = self->_messageLabel;
  double v14 = v9;
  double v15 = v11 + v10;
  if (messageLabel)
  {
    [(_UIActivityIndicatorMessageLabel *)messageLabel verticalSpacingToSpinner];
    double v17 = v12 + v16;
    [(UILabel *)self->_messageLabel intrinsicContentSize];
    double v15 = v17 + v18;
    double v14 = self->_shadowOffset.width;
    double v8 = self->_shadowOffset.height;
    double v10 = fabs(v8);
  }
  double v19 = v7 + fabs(v9);
  double v20 = floor((width - v19) * 0.5) + v14;
  double v21 = v8 + floor((height - v15) * 0.5);
  double v22 = v19 + fabs(v14);
  double v23 = v12 + v10;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (UIColor)color
{
  BOOL v3 = self->_color;
  if (!v3)
  {
    BOOL v3 = [(UIActivityIndicatorView *)self _defaultColorForStyle:self->_activityIndicatorViewStyle];
  }
  return v3;
}

- (void)_updateLayoutInfo
{
  switch([(UIActivityIndicatorView *)self _sizeForStyle:self->_activityIndicatorViewStyle])
  {
    case 1:
    case 7:
      double v3 = 14.0;
      goto LABEL_12;
    case 2:
    case 3:
      double v3 = 20.0;
      goto LABEL_12;
    case 4:
    case 5:
      int64_t v4 = 8;
      int64_t v5 = 2;
      double v3 = 37.0;
      break;
    case 6:
      [(UIActivityIndicatorView *)self _effectiveCustomWidth];
      goto LABEL_12;
    case 8:
      int64_t v4 = 8;
      int64_t v5 = 2;
      uint64_t v6 = 0x4040000000000000;
      goto LABEL_10;
    case 9:
      int64_t v4 = 8;
      int64_t v5 = 2;
      uint64_t v6 = 0x4044000000000000;
      goto LABEL_10;
    case 10:
      int64_t v4 = 8;
      int64_t v5 = 2;
      uint64_t v6 = 0x4050000000000000;
LABEL_10:
      double v3 = *(double *)&v6;
      break;
    case 11:
      double v3 = 24.0;
LABEL_12:
      int64_t v4 = 8;
      int64_t v5 = 2;
      break;
    default:
      int64_t v5 = 0;
      int64_t v4 = 0;
      double v3 = *MEMORY[0x1E4F1DB30];
      break;
  }
  self->_int64_t spokeCount = v4;
  self->_spokeFrameRatio = v5;
  self->_double width = v3;
}

- (CGSize)_defaultSizeConsultingCustomWidthIfApplicable
{
  if (self->_actualActivityIndicatorViewStyle == 16)
  {
    [(UIActivityIndicatorView *)self _effectiveCustomWidth];
    double v3 = v2;
  }
  else
  {
    [(id)objc_opt_class() defaultSizeForStyle:self->_actualActivityIndicatorViewStyle];
  }
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)_effectiveCustomWidth
{
  if (self->_activityIndicatorViewStyle != 16)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIActivityIndicatorView.m" lineNumber:667 description:@"_effectiveCustomWidth only valid for UIActivityIndicatorViewStyleCustom"];
  }
  double result = self->_customWidth;
  if (result == 0.0) {
    [(id)objc_opt_class() defaultSizeForStyle:16];
  }
  return result;
}

+ (CGSize)defaultSizeForStyle:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v4 = 37.0;
  double v5 = 37.0;
  switch(a3)
  {
    case 0:
    case 10:
    case 16:
      break;
    case 1:
    case 2:
    case 9:
      goto LABEL_5;
    case 3:
    case 5:
    case 8:
      double v4 = 14.0;
      double v5 = 14.0;
      break;
    case 4:
      double v5 = 15.0;
      double v4 = 14.0;
      break;
    case 6:
      double v7 = +[UIScreen mainScreen];
      [v7 scale];
      if (v8 <= 1.0) {
        double v4 = 12.0;
      }
      else {
        double v4 = 10.0;
      }
      double v5 = 20.0;

      break;
    case 7:
      double v9 = +[UIScreen mainScreen];
      [v9 scale];
      if (v10 <= 1.0) {
        double v4 = 13.0;
      }
      else {
        double v4 = 13.5;
      }
      goto LABEL_23;
    case 11:
      double v5 = 24.0;
      double v4 = 12.0;
      break;
    case 12:
      double v9 = +[UIScreen mainScreen];
      [v9 scale];
      if (v11 <= 1.0) {
        double v4 = 17.0;
      }
      else {
        double v4 = 17.5;
      }
LABEL_23:

      goto LABEL_29;
    case 13:
    case 21:
      double v4 = 24.0;
      double v5 = 24.0;
      break;
    case 14:
    case 15:
      goto LABEL_7;
    case 17:
      double v4 = 20.0;
      double v5 = 40.0;
      break;
    case 18:
      double v4 = 27.0;
      double v5 = 27.0;
      break;
    case 19:
      *(double *)&uint64_t v12 = 40.0;
      goto LABEL_28;
    case 20:
      *(double *)&uint64_t v12 = 64.0;
LABEL_28:
      double v4 = *(double *)&v12;
LABEL_29:
      double v5 = v4;
      break;
    default:
      if (a3 != 101)
      {
        if (a3 == 100)
        {
LABEL_5:
          double v4 = 20.0;
          double v5 = 20.0;
        }
        else
        {
LABEL_7:
          if (os_variant_has_internal_diagnostics())
          {
            double v15 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              int v16 = 134217984;
              int64_t v17 = a3;
              _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v16, 0xCu);
            }
          }
          else
          {
            uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &defaultSizeForStyle____s_category) + 8);
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
            {
              int v16 = 134217984;
              int64_t v17 = a3;
              _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v16, 0xCu);
            }
          }
          double v4 = *MEMORY[0x1E4F1DB30];
          double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        }
      }
      break;
  }
  double v13 = v4;
  double v14 = v5;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (int64_t)_sizeForStyle:(int64_t)a3
{
  int64_t v3 = 4;
  switch(a3)
  {
    case 0:
      return 5;
    case 1:
    case 2:
      return 3;
    case 3:
    case 8:
      return 1;
    case 4:
    case 5:
      return 7;
    case 6:
    case 7:
    case 11:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
      return 0;
    case 9:
      return 2;
    case 10:
      return v3;
    case 13:
      return 8;
    case 16:
      return 6;
    case 19:
      return 9;
    case 20:
      return 10;
    case 21:
      return 11;
    case 22:
      double v4 = [(UIView *)self traitCollection];
      double v5 = [v4 preferredContentSizeCategory];
      if (UIContentSizeCategoryIsAccessibilityCategory(v5)) {
        int64_t v3 = 4;
      }
      else {
        int64_t v3 = 2;
      }

      return v3;
    default:
      if (a3 == 100) {
        return 2;
      }
      if (a3 != 101) {
        return 0;
      }
      return v3;
  }
}

- (void)_tearDownAnimation
{
  styleView = self->_styleView;
  if (styleView)
  {
    [(_UIActivityIndicatorViewStyleView *)styleView tearDownAnimation];
  }
  else
  {
    spokeHighlightImages = self->_spokeHighlightImages;
    if (!spokeHighlightImages) {
      spokeHighlightImages = self->_spokeImages;
    }
    double v5 = spokeHighlightImages;
    BOOL v6 = [(UIActivityIndicatorView *)self isHighlighted];
    double v7 = [(UIImageView *)self->_animatingImageView _currentAnimationKeyframeImage];
    double v8 = v7;
    if (v6)
    {
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [(NSArray *)v5 firstObject];
      }
      double v11 = v9;

      unint64_t v12 = [(NSArray *)v5 indexOfObject:v11];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v13 = v12, v12 >= [(NSArray *)self->_spokeImages count]))
      {
        uint64_t v14 = [(NSArray *)self->_spokeImages firstObject];
      }
      else
      {
        uint64_t v14 = [(NSArray *)self->_spokeImages objectAtIndexedSubscript:v13];
      }
      id v19 = (id)v14;
    }
    else
    {
      if (v7)
      {
        id v10 = v7;
      }
      else
      {
        id v10 = [(NSArray *)self->_spokeImages firstObject];
      }
      id v19 = v10;

      unint64_t v15 = [(NSArray *)self->_spokeImages indexOfObject:v19];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v16 = v15, v15 >= [(NSArray *)v5 count]))
      {
        uint64_t v17 = [(NSArray *)v5 firstObject];
      }
      else
      {
        uint64_t v17 = [(NSArray *)v5 objectAtIndexedSubscript:v16];
      }
      double v11 = (void *)v17;
    }
    [(UIImageView *)self->_animatingImageView stopAnimating];
    if (v19) {
      [(UIImageView *)self->_animatingImageView setImage:v19];
    }
    if (self->_spokeHighlightImages) {
      uint64_t v18 = v11;
    }
    else {
      uint64_t v18 = 0;
    }
    [(UIImageView *)self->_animatingImageView setHighlightedImage:v18];
  }
}

- (BOOL)isHighlighted
{
  return [(UIImageView *)self->_animatingImageView isHighlighted];
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL animating = self->_animating;
  if (self->_animating) {
    [(UIActivityIndicatorView *)self _tearDownAnimation];
  }
  v9.receiver = self;
  v9.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v9 _didMoveFromWindow:v6 toWindow:v7];
  if (v7 && animating)
  {
    self->_restartAnimationOnNextLayout = 1;
    [(UIView *)self setNeedsLayout];
  }
}

- (id)_highlightColorForStyle:(int64_t)a3
{
  if (a3 == 21)
  {
    double v5 = +[UIColor _externalSystemExtraDarkGrayColor];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)_artCacheKeyWithStyle:(int64_t)a3 color:(id)a4
{
  uint64_t v4 = -[_UIActivityIndicatorViewArtworkCacheKey initWithStyle:width:spokeCount:spokeFrameRatio:shadowOffset:color:shadowColor:]([_UIActivityIndicatorViewArtworkCacheKey alloc], "initWithStyle:width:spokeCount:spokeFrameRatio:shadowOffset:color:shadowColor:", a3, self->_spokeCount, self->_spokeFrameRatio, [a4 CGColor], -[UIColor CGColor](self->_shadowColor, "CGColor"), self->_width, self->_shadowOffset.width, self->_shadowOffset.height);
  return v4;
}

- (id)_defaultColorForStyle:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
    case 5:
    case 21:
      goto LABEL_9;
    case 2:
    case 4:
    case 8:
    case 9:
    case 10:
    case 13:
    case 16:
    case 22:
      goto LABEL_2;
    case 6:
    case 7:
    case 11:
    case 12:
    case 17:
    case 18:
      goto LABEL_3;
    case 14:
    case 15:
      goto LABEL_14;
    case 19:
    case 20:
      if (dyld_program_sdk_at_least()
        && ([(UIView *)self traitCollection],
            double v21 = objc_claimAutoreleasedReturnValue(),
            uint64_t v22 = [v21 userInterfaceStyle],
            v21,
            v22 != 2))
      {
LABEL_3:
        uint64_t v4 = +[UIColor blackColor];
      }
      else
      {
LABEL_9:
        uint64_t v4 = +[UIColor whiteColor];
      }
      goto LABEL_10;
    default:
      if ((unint64_t)(a3 - 100) >= 2)
      {
LABEL_14:
        if (os_variant_has_internal_diagnostics())
        {
          double v25 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            int v26 = 134217984;
            int64_t v27 = a3;
            _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v26, 0xCu);
          }
        }
        else
        {
          double v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_defaultColorForStyle____s_category) + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            int v26 = 134217984;
            int64_t v27 = a3;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v26, 0xCu);
          }
        }
LABEL_2:
        uint64_t v4 = +[UIColor colorWithWhite:0.0 alpha:0.45];
      }
      else
      {
        double v5 = +[_UIActivityIndicatorSettingsDomain rootSettings];
        int v6 = [v5 customColor];

        if (v6)
        {
          id v7 = [UIColor alloc];
          double v8 = +[_UIActivityIndicatorSettingsDomain rootSettings];
          [v8 redValue];
          double v10 = v9 / 255.0;
          double v11 = +[_UIActivityIndicatorSettingsDomain rootSettings];
          [v11 greenValue];
          double v13 = v12 / 255.0;
          uint64_t v14 = +[_UIActivityIndicatorSettingsDomain rootSettings];
          [v14 blueValue];
          double v16 = v15 / 255.0;
          uint64_t v17 = +[_UIActivityIndicatorSettingsDomain rootSettings];
          [v17 alphaValue];
          id v19 = [(UIColor *)v7 initWithRed:v10 green:v13 blue:v16 alpha:v18];

          goto LABEL_11;
        }
        uint64_t v4 = +[UIColor secondaryLabelColor];
      }
LABEL_10:
      id v19 = (UIColor *)v4;
LABEL_11:
      return v19;
  }
}

- (void)startAnimating
{
  if (![(UIActivityIndicatorView *)self isAnimating])
  {
    [(UIActivityIndicatorView *)self _setUpAnimation];
    self->_BOOL animating = 1;
    [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
    if ([(UIActivityIndicatorView *)self hidesWhenStopped])
    {
      [(UIView *)self setHidden:0];
    }
  }
}

- (BOOL)hidesWhenStopped
{
  return self->_hidesWhenStopped;
}

- (int64_t)_customStyleForStyle:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v4 = 10;
  switch(a3)
  {
    case 0:
      return v4;
    case 1:
    case 2:
      return 9;
    case 3:
    case 4:
    case 5:
      return 8;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      return a3;
    case 14:
    case 15:
      goto LABEL_8;
    default:
      if (a3 == 101) {
        return v4;
      }
      if (a3 == 100) {
        return 9;
      }
LABEL_8:
      if (os_variant_has_internal_diagnostics())
      {
        id v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          int v8 = 134217984;
          int64_t v9 = a3;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v8, 0xCu);
        }

        return 16;
      }
      else
      {
        int v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_customStyleForStyle____s_category) + 8);
        int64_t v4 = 16;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v8 = 134217984;
          int64_t v9 = a3;
          int64_t v4 = 16;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unknown UIActivityIndicatorViewStyle: %ld", (uint8_t *)&v8, 0xCu);
        }
      }
      return v4;
  }
}

- (BOOL)_shouldGoToCustomStyle
{
  if ([(UIActivityIndicatorView *)self _colorRequiresDynamicTinting]
    || [(UIActivityIndicatorView *)self _hasShadow])
  {
    return 1;
  }
  return [(UIActivityIndicatorView *)self _useCustomStyleForLegacyStyles];
}

- (BOOL)_colorRequiresDynamicTinting
{
  if ([(UIActivityIndicatorView *)self _hasClientSetColor]) {
    return 1;
  }
  int64_t v4 = [(UIActivityIndicatorView *)self color];
  char v5 = [v4 _isDynamic];

  return v5;
}

- (BOOL)_hasClientSetColor
{
  color = self->_color;
  if (color)
  {
    uint64_t v3 = [(UIActivityIndicatorView *)self _defaultColorForStyle:self->_activityIndicatorViewStyle];
    LODWORD(color) = ![(UIColor *)color isEqual:v3];
  }
  return (char)color;
}

- (id)_imagesForStyle:(int64_t)a3 color:(id)a4 highlight:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if ([(UIActivityIndicatorView *)self _isStatusBarStyle]
    && [(UIActivityIndicatorView *)self _colorRequiresDynamicTinting])
  {
    int64_t v9 = [(id)objc_opt_class() _loadResourcesForArtworkBasedStyle:a3];
    uint64_t v10 = [(UIActivityIndicatorView *)self _generateModernImagesForImages:v9 color:v8];
  }
  else
  {
    if ([(UIActivityIndicatorView *)self _isArtworkBasedStyle]) {
      [(id)objc_opt_class() _loadResourcesForArtworkBasedStyle:a3];
    }
    else {
    uint64_t v10 = [(UIActivityIndicatorView *)self _generateImagesForColor:v8 highlight:v5];
    }
  }

  return v10;
}

- (BOOL)_isStatusBarStyle
{
  return (self->_activityIndicatorViewStyle < 0x13uLL) & (0x618C0u >> self->_activityIndicatorViewStyle);
}

- (BOOL)_isArtworkBasedStyle
{
  if ([(UIActivityIndicatorView *)self _isStatusBarStyle]
    || (unint64_t actualActivityIndicatorViewStyle = self->_actualActivityIndicatorViewStyle,
        actualActivityIndicatorViewStyle > 0x16))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    return (0x6D8FFu >> actualActivityIndicatorViewStyle) & 1;
  }
  return v4;
}

- (id)_generateImagesForColor:(id)a3 highlight:(BOOL)a4
{
  id v5 = a3;
  int64_t v6 = self->_spokeCount * self->_spokeFrameRatio;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      int64_t v9 = [(UIActivityIndicatorView *)self _imageForStep:i withColor:v5];
      [v7 addObject:v9];
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_lastHighlightArtCacheKey, 0);
  objc_storeStrong((id *)&self->_lastArtCacheKey, 0);
  objc_storeStrong((id *)&self->_spokeHighlightImages, 0);
  objc_storeStrong((id *)&self->_spokeImages, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_animatingImageView, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_styleView, 0);
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIActivityIndicatorView";
}

- (UIActivityIndicatorView)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
  int64_t v4 = [(UIActivityIndicatorView *)self _internalStyleForStyle:style];
  [(id)objc_opt_class() defaultSizeForStyle:v4];
  v10.receiver = self;
  v10.super_class = (Class)UIActivityIndicatorView;
  id v7 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, v5, v6);
  id v8 = v7;
  if (v7)
  {
    [(UIActivityIndicatorView *)v7 _commonInit];
    v8->_int64_t activityIndicatorViewStyle = v4;
    v8->_unint64_t actualActivityIndicatorViewStyle = [(UIActivityIndicatorView *)v8 _actualStyleByResolvingAutoUpdatingStyle:v4];
    [(UIActivityIndicatorView *)v8 _updateMessageForStyle:v4];
    [(UIActivityIndicatorView *)v8 _refreshStyle];
  }
  return v8;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  int64_t v4 = [(UIActivityIndicatorView *)self _internalStyleForStyle:activityIndicatorViewStyle];
  if (self->_actualActivityIndicatorViewStyle != v4)
  {
    int64_t v5 = v4;
    self->_int64_t activityIndicatorViewStyle = v4;
    self->_unint64_t actualActivityIndicatorViewStyle = [(UIActivityIndicatorView *)self _actualStyleByResolvingAutoUpdatingStyle:v4];
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      double v6 = [(UIActivityIndicatorView *)self _defaultColorForStyle:v5];
      color = self->_color;
      self->_color = v6;
    }
    [(UIActivityIndicatorView *)self _updateMessageForStyle:v5];
    [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
    [(UIActivityIndicatorView *)self _updateLayoutInfo];
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_updateMessageForStyle:(int64_t)a3
{
  if (a3 == 22)
  {
    _UINSLocalizedStringWithDefaultValue(@"Loading", @"Loading");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIActivityIndicatorView *)self _setMessage:v4];
  }
  else
  {
    [(UIActivityIndicatorView *)self _setMessage:0];
  }
}

- (void)_setMessage:(id)a3
{
  id v5 = a3;
  double v6 = self->_message;
  id v7 = (NSString *)v5;
  double v15 = v7;
  if (v6 == v7)
  {

LABEL_13:
    int64_t v9 = v15;
    goto LABEL_14;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  int64_t v9 = v15;
  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_message, a3);
    if ([(NSString *)v15 length])
    {
      if (!self->_messageLabel)
      {
        objc_super v10 = [_UIActivityIndicatorMessageLabel alloc];
        double v11 = +[_UIActivityIndicatorMessageLabel defaultRegularContentSizeTextAttributes];
        double v12 = [(_UIActivityIndicatorMessageLabel *)v10 initWithRegularTextAttributes:v11];
        messageLabel = self->_messageLabel;
        self->_messageLabel = v12;

        [(UIView *)self addSubview:self->_messageLabel];
      }
      uint64_t v14 = [(NSString *)v15 localizedUppercaseString];
      [(_UIActivityIndicatorMessageLabel *)self->_messageLabel setText:v14];
    }
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_commonInit
{
  [(UIActivityIndicatorView *)self setHidesWhenStopped:1];
  self->_shadowOffset = (CGSize)*MEMORY[0x1E4F1DB30];
  int64_t v3 = [(UIActivityIndicatorView *)self _internalStyleForStyle:[(UIActivityIndicatorView *)self _defaultStyle]];
  self->_int64_t activityIndicatorViewStyle = v3;
  self->_unint64_t actualActivityIndicatorViewStyle = [(UIActivityIndicatorView *)self _actualStyleByResolvingAutoUpdatingStyle:v3];
  [(UIView *)self setNeedsLayout];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v4 addObserver:self selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
}

- (int64_t)_internalStyleForStyle:(int64_t)a3
{
  return a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v6 traitCollectionDidChange:v4];
  int64_t v5 = [(UIActivityIndicatorView *)self _actualStyleByResolvingAutoUpdatingStyle:self->_activityIndicatorViewStyle];
  if (v5 != self->_actualActivityIndicatorViewStyle)
  {
    self->_unint64_t actualActivityIndicatorViewStyle = v5;
    [(UIActivityIndicatorView *)self _updateLayoutInfo];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self traitCollection];
  }
}

- (int64_t)_actualStyleByResolvingAutoUpdatingStyle:(int64_t)a3
{
  if (a3 == 22)
  {
    int64_t v3 = [(UIView *)self traitCollection];
    id v4 = [v3 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory) {
      return 10;
    }
    else {
      return 9;
    }
  }
  return a3;
}

- (void)setHidesWhenStopped:(BOOL)hidesWhenStopped
{
  self->_hidesWhenStopped = hidesWhenStopped;
  if (![(UIActivityIndicatorView *)self isAnimating] && !self->_styleView) {
    [(UIView *)self setHidden:self->_hidesWhenStopped];
  }
  [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (int64_t)_defaultStyle
{
  if (dyld_program_sdk_at_least()) {
    return 100;
  }
  else {
    return 1;
  }
}

- (void)_refreshStyle
{
  [(UIView *)self->_styleView removeFromSuperview];
  styleView = self->_styleView;
  self->_styleView = 0;

  id v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  objc_super v6 = +[_UIVisualStyleRegistry registryForIdiom:v5];
  id v7 = (objc_class *)[v6 visualStyleClassForStylableClass:objc_opt_class()];

  if (v7)
  {
    char v8 = (_UIActivityIndicatorViewStyleView *)[[v7 alloc] initWithProvider:self];
    int64_t v9 = self->_styleView;
    self->_styleView = v8;
    objc_super v10 = v8;

    [(UIView *)self addSubview:self->_styleView];
    [(UIView *)self->_animatingImageView removeFromSuperview];

    [(UIView *)self setHidden:0];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
  [(UIView *)self setNeedsLayout];
}

- (UIActivityIndicatorView)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityIndicatorView;
  int64_t v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  id v4 = v3;
  if (v3)
  {
    [(UIActivityIndicatorView *)v3 _commonInit];
    [(UIActivityIndicatorView *)v4 _refreshStyle];
  }
  return v4;
}

- (void)_updateVisualStyleProperties
{
  [(_UIActivityIndicatorViewStyleView *)self->_styleView setAnimating:self->_animating];
  [(_UIActivityIndicatorViewStyleView *)self->_styleView setActivityIndicatorViewStyle:self->_activityIndicatorViewStyle];
  [(_UIActivityIndicatorViewStyleView *)self->_styleView setColor:self->_color];
  styleView = self->_styleView;
  BOOL hidesWhenStopped = self->_hidesWhenStopped;
  [(_UIActivityIndicatorViewStyleView *)styleView setHidesWhenStopped:hidesWhenStopped];
}

- (void)_setCustomWidth:(double)a3
{
  if (self->_activityIndicatorViewStyle != 16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"_customWidth property only modifiable for UIActivityIndicatorViewStyleCustom"];
  }
  double v5 = fmax(a3, 0.0);
  if (v5 != self->_customWidth)
  {
    self->_customWidth = v5;
    [(UIActivityIndicatorView *)self _updateLayoutInfo];
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setColor:(UIColor *)color
{
  double v5 = color;
  if (self->_color != v5)
  {
    objc_storeStrong((id *)&self->_color, color);
    self->_disableUpdateColorOnTraitCollectionChange = v5 != 0;
    [(UIView *)self setNeedsLayout];
    [(UIActivityIndicatorView *)self _updateVisualStyleProperties];
  }
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationDidEnterBackgroundNotification";
  v6[1] = @"UIApplicationWillEnterForegroundNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v5 dealloc];
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_animating) {
    [(UIActivityIndicatorView *)self _setUpAnimation];
  }
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

- (UIActivityIndicatorView)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v13.receiver = self;
  v13.super_class = (Class)UIActivityIndicatorView;
  objc_super v5 = [(UIView *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = @"UIActivityIndicatorViewStyle-Modern";
    if ([(NSCoder *)v4 containsValueForKey:@"UIActivityIndicatorViewStyle-Modern"]
      || (objc_super v6 = @"UIActivityIndicatorViewStyle",
          [(NSCoder *)v4 containsValueForKey:@"UIActivityIndicatorViewStyle"]))
    {
      uint64_t v7 = [(NSCoder *)v4 decodeIntegerForKey:v6];
    }
    else
    {
      uint64_t v7 = 1;
    }
    v5->_int64_t activityIndicatorViewStyle = v7;
    v5->_unint64_t actualActivityIndicatorViewStyle = -[UIActivityIndicatorView _actualStyleByResolvingAutoUpdatingStyle:](v5, "_actualStyleByResolvingAutoUpdatingStyle:");
    v5->_BOOL hidesWhenStopped = 1;
    if ([(NSCoder *)v4 containsValueForKey:@"UIHidesWhenStopped"]) {
      v5->_BOOL hidesWhenStopped = [(NSCoder *)v4 decodeBoolForKey:@"UIHidesWhenStopped"];
    }
    char v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v8 addObserver:v5 selector:sel__applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    v5->_BOOL animating = [(NSCoder *)v4 decodeBoolForKey:@"UIAnimating"];
    if ([(NSCoder *)v4 containsValueForKey:@"UIColor"]) {
      int64_t v9 = @"UIColor";
    }
    else {
      int64_t v9 = @"UITintColor";
    }
    uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:v9];
    color = v5->_color;
    v5->_color = (UIColor *)v10;

    v5->_disableUpdateColorOnTraitCollectionChange = [(NSCoder *)v4 decodeBoolForKey:@"UIDisableUpdateColorOnTraitCollectionChange"];
    [(UIActivityIndicatorView *)v5 _refreshStyle];
    [(UIView *)v5 setNeedsLayout];
  }
  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIActivityIndicatorView;
  id v4 = a3;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  objc_msgSend(v4, "removeObject:", self->_animatingImageView, v5.receiver, v5.super_class);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v9 encodeWithCoder:v4];
  int64_t activityIndicatorViewStyle = self->_activityIndicatorViewStyle;
  [v4 encodeInteger:activityIndicatorViewStyle forKey:@"UIActivityIndicatorViewStyle-Modern"];
  objc_super v6 = self->_color;
  if (activityIndicatorViewStyle == 101)
  {
    [v4 encodeInteger:0 forKey:@"UIActivityIndicatorViewStyle"];
    if (v6) {
      goto LABEL_9;
    }
    uint64_t v7 = self;
    uint64_t v8 = 101;
    goto LABEL_7;
  }
  if (activityIndicatorViewStyle == 100)
  {
    [v4 encodeInteger:1 forKey:@"UIActivityIndicatorViewStyle"];
    if (v6) {
      goto LABEL_9;
    }
    uint64_t v7 = self;
    uint64_t v8 = 100;
LABEL_7:
    objc_super v6 = [(UIActivityIndicatorView *)v7 _defaultColorForStyle:v8];
    goto LABEL_9;
  }
  [v4 encodeInteger:activityIndicatorViewStyle forKey:@"UIActivityIndicatorViewStyle"];
LABEL_9:
  if (!self->_hidesWhenStopped) {
    [v4 encodeBool:0 forKey:@"UIHidesWhenStopped"];
  }
  if (self->_animating) {
    [v4 encodeBool:1 forKey:@"UIAnimating"];
  }
  [v4 encodeObject:self->_color forKey:@"UIColor"];
  if (v6) {
    [v4 encodeObject:v6 forKey:@"UITintColor"];
  }
  if (self->_disableUpdateColorOnTraitCollectionChange) {
    [v4 encodeBool:1 forKey:@"UIDisableUpdateColorOnTraitCollectionChange"];
  }
}

- (UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
  return [(UIActivityIndicatorView *)self _externalStyleForStyle:self->_activityIndicatorViewStyle];
}

- (void)setAnimationDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    if (self->_animating)
    {
      [(UIActivityIndicatorView *)self stopAnimating];
      [(UIActivityIndicatorView *)self startAnimating];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIImageView *)self->_animatingImageView isAnimating])
  {
    [(UIActivityIndicatorView *)self _tearDownAnimation];
    [(UIImageView *)self->_animatingImageView setHighlighted:v3];
    [(UIActivityIndicatorView *)self _setUpAnimation];
  }
  else
  {
    animatingImageView = self->_animatingImageView;
    [(UIImageView *)animatingImageView setHighlighted:v3];
  }
}

- (BOOL)_wantsAnimationRestoration
{
  return 1;
}

- (void)_restoreRemovedAnimationsIncludingSubviews
{
  if (self->_wasAnimatingWhenAnimationsRemoved)
  {
    [(UIActivityIndicatorView *)self startAnimating];
    self->_wasAnimatingWhenAnimationsRemoved = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIActivityIndicatorView;
  [(UIView *)&v3 _restoreRemovedAnimationsIncludingSubviews];
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (self->_animating) {
    [(UIActivityIndicatorView *)self _tearDownAnimation];
  }
}

- (void)setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_double width = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setShadowColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (self->_shadowColor != v4)
  {
    uint64_t v7 = v4;
    if (v4)
    {
      objc_super v5 = v4;
    }
    else
    {
      objc_super v5 = +[UIColor blackColor];
    }
    shadowColor = self->_shadowColor;
    self->_shadowColor = v5;

    [(UIView *)self setNeedsLayout];
    id v4 = v7;
  }
}

- (void)setShadowOffset:(CGSize)a3
{
  if (self->_shadowOffset.width != a3.width || self->_shadowOffset.height != a3.height)
  {
    self->_shadowOffset = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (id)_generateModernImagesForImages:(id)a3 color:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_flatImageWithColor:", v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)_imageSetNameForArtworkBasedStyle:(int64_t)a3 outImageCount:(int64_t *)a4
{
  int64_t v4 = 0;
  id result = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      goto LABEL_6;
    case 2:
      id result = @"UIActivityIndicatorViewStyleGray";
      goto LABEL_21;
    case 3:
      id result = @"UIActivityIndicatorViewStyleWhiteSmall";
      goto LABEL_10;
    case 4:
      id result = @"UIActivityIndicatorViewStyleGraySmall";
      goto LABEL_10;
    case 5:
      id result = @"UIActivityIndicatorViewStyleForBlueBackgroundSmall";
LABEL_10:
      int64_t v4 = 16;
      goto LABEL_22;
    case 6:
      id result = @"UIActivityIndicatorViewStyleStatusBar";
      goto LABEL_16;
    case 7:
      id result = @"UIActivityIndicatorViewStyleStatusBarSync";
      goto LABEL_18;
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
      goto LABEL_22;
    case 11:
      id result = @"UIActivityIndicatorViewStyleStatusBarLockScreen";
      goto LABEL_16;
    case 12:
      id result = @"UIActivityIndicatorViewStyleStatusBarLockScreenSync";
      goto LABEL_18;
    case 17:
      id result = @"UIActivityIndicatorViewStyleStatusBarExternal";
LABEL_16:
      int64_t v4 = 8;
      goto LABEL_22;
    case 18:
      id result = @"UIActivityIndicatorViewStyleStatusBarSyncExternal";
LABEL_18:
      int64_t v4 = 24;
      goto LABEL_22;
    case 19:
      id result = @"UIActivityIndicatorViewStyleWhiteATV";
      goto LABEL_21;
    case 20:
      id result = @"UIActivityIndicatorViewStyleWhiteLargeATV";
      goto LABEL_21;
    default:
      if (a3 == 100)
      {
LABEL_6:
        id result = @"UIActivityIndicatorViewStyleWhite";
      }
      else
      {
        id result = 0;
        if (a3 != 101) {
          goto LABEL_22;
        }
LABEL_5:
        id result = @"UIActivityIndicatorViewStyleWhiteLarge";
      }
LABEL_21:
      int64_t v4 = 12;
LABEL_22:
      if (a4) {
        *a4 = v4;
      }
      return result;
  }
}

+ (id)_loadResourcesForArtworkBasedStyle:(int64_t)a3
{
  uint64_t v9 = 0;
  objc_super v3 = [a1 _imageSetNameForArtworkBasedStyle:a3 outImageCount:&v9];
  int64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  if (v9 >= 1)
  {
    for (uint64_t i = 0; i < v9; ++i)
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"%@.%ld.png", v3, i];
      uint64_t v7 = _UIImageWithName(v6);
      if (v7) {
        [v4 addObject:v7];
      }
    }
  }

  return v4;
}

- (CGRect)_messageLabelFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UIActivityIndicatorView *)self _isShowingMessage])
  {
    -[UIActivityIndicatorView _animatingImageViewFrameForBounds:](self, "_animatingImageViewFrameForBounds:", x, y, width, height);
    CGRectGetMaxY(v15);
    [(_UIActivityIndicatorMessageLabel *)self->_messageLabel verticalSpacingToSpinner];
    UIRoundToViewScale(self);
    double v9 = v8;
    [(UILabel *)self->_messageLabel intrinsicContentSize];
    double v11 = v10;
    double v12 = 0.0;
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v13 = v9;
  double v14 = width;
  result.size.double height = v11;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_useCustomStyleForLegacyStyles
{
  return (unint64_t)[(UIActivityIndicatorView *)self activityIndicatorViewStyle] < (UIActivityIndicatorViewStyleGray|UIActivityIndicatorViewStyleWhite);
}

- (BOOL)_hasShadow
{
  if (!self->_shadowColor) {
    return 0;
  }
  if (self->_shadowOffset.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    return self->_shadowOffset.width != *MEMORY[0x1E4F1DB30];
  }
  return 1;
}

- (BOOL)_shouldGoBackToBaseStyle
{
  BOOL v3 = [(UIActivityIndicatorView *)self _isArtworkBasedStyle];
  if (v3) {
    LOBYTE(v3) = ![(UIActivityIndicatorView *)self _shouldGoToCustomStyle];
  }
  return v3;
}

- (int64_t)_externalStyleForStyle:(int64_t)a3
{
  if (a3 == 20)
  {
    if (dyld_program_sdk_at_least()) {
      return 101;
    }
    else {
      return 0;
    }
  }
  else
  {
    int64_t result = a3;
    if (a3 == 19)
    {
      if (dyld_program_sdk_at_least()) {
        return 100;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

- (void)setAnimating:(BOOL)a3
{
  if (a3) {
    [(UIActivityIndicatorView *)self startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)self stopAnimating];
  }
}

- (double)animationDuration
{
  return self->_duration;
}

- (double)_customWidth
{
  return self->_customWidth;
}

- (UIImageView)_animatingImageView
{
  return self->_animatingImageView;
}

- (_UIActivityIndicatorMessageLabel)_messageLabel
{
  return self->_messageLabel;
}

- (NSString)_message
{
  return self->_message;
}

- (int64_t)_actualActivityIndicatorViewStyle
{
  return self->_actualActivityIndicatorViewStyle;
}

- (BOOL)_restartAnimationOnNextLayout
{
  return self->_restartAnimationOnNextLayout;
}

- (NSArray)_spokeImages
{
  return self->_spokeImages;
}

- (NSArray)_spokeHighlightImages
{
  return self->_spokeHighlightImages;
}

- (BOOL)_disableUpdateColorOnTraitCollectionChange
{
  return self->_disableUpdateColorOnTraitCollectionChange;
}

- (_UIActivityIndicatorViewArtworkCacheKey)_lastArtCacheKey
{
  return self->_lastArtCacheKey;
}

- (_UIActivityIndicatorViewArtworkCacheKey)_lastHighlightArtCacheKey
{
  return self->_lastHighlightArtCacheKey;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (double)width
{
  return self->_width;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)spinning
{
  return self->_spinning;
}

- (void)setSpinning:(BOOL)a3
{
  self->_spinning = a3;
}

@end