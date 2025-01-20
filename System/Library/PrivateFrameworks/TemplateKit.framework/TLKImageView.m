@interface TLKImageView
+ (BOOL)checkTransparencyForImageAtCorners:(CGImage *)a3 shouldCropToCircle:(BOOL)a4;
+ (BOOL)hasTransparencyAtPoint:(CGPoint)a3 forCGImage:(CGImage *)a4;
+ (BOOL)imageIsProbablyOpaque:(id)a3 tlkImage:(id)a4;
+ (unint64_t)defaultCornerMask;
- (BOOL)alignmentIsAspectFill;
- (BOOL)animateNextImageTransition;
- (BOOL)disableCornerRounding;
- (BOOL)ignoreImageAlignmentRectInsets;
- (BOOL)shadowDisabled;
- (BOOL)useButtonColoring;
- (CGRect)aspectRatioPreservedFrameForSize:(CGSize)a3;
- (CGSize)constrainedSizeForImageSize:(CGSize)a3 fittingSize:(CGSize)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)naturalSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TLKImage)lastTlkImage;
- (TLKImage)tlkImage;
- (TLKImageView)badgeImageView;
- (TLKImageView)init;
- (TLKImageViewDelegate)delegate;
- (TLKProminenceView)placeholderView;
- (UIColor)overrideColor;
- (UIEdgeInsets)effectiveAlignmentRectInsets;
- (UIFont)symbolFont;
- (UIImageView)imageView;
- (UIView)shadowContainer;
- (double)cornerRadiusForSize:(CGSize)a3 roundingStyle:(unint64_t)a4;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (double)lastBaselineOffset;
- (double)sizeScale;
- (int64_t)symbolScale;
- (int64_t)symbolWeight;
- (unint64_t)alignment;
- (unint64_t)placeholderVisibility;
- (unint64_t)prominence;
- (void)animateTransitionToImage:(id)a3;
- (void)applyCornerRoundingStyle:(unint64_t)a3 toView:(id)a4;
- (void)didMoveToWindow;
- (void)invalidateIntrinsicContentSizeIfNecessary;
- (void)layoutSubviews;
- (void)setAlignment:(unint64_t)a3;
- (void)setAnimateNextImageTransition:(BOOL)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCornerRounding:(BOOL)a3;
- (void)setIgnoreImageAlignmentRectInsets:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setLastBaselineOffset:(double)a3;
- (void)setLastTlkImage:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setPlaceholderVisibility:(unint64_t)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setShadowContainer:(id)a3;
- (void)setShadowDisabled:(BOOL)a3;
- (void)setSymbolFont:(id)a3;
- (void)setSymbolScale:(int64_t)a3;
- (void)setSymbolWeight:(int64_t)a3;
- (void)setTlkImage:(id)a3;
- (void)setUseButtonColoring:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateShadow;
- (void)updateSizeAndLayout;
- (void)updateSymbolConfiguration;
- (void)updateWithUIImage:(id)a3 animateFadeIn:(BOOL)a4 appearance:(id)a5 isTemplate:(BOOL)a6;
@end

@implementation TLKImageView

- (TLKImageView)init
{
  v15.receiver = self;
  v15.super_class = (Class)TLKImageView;
  v2 = [(TLKView *)&v15 init];
  if (v2)
  {
    v3 = [[TLKProminenceView alloc] initWithProminence:3];
    [(TLKImageView *)v2 setPlaceholderView:v3];

    v4 = [(TLKImageView *)v2 placeholderView];
    [(TLKImageView *)v2 addSubview:v4];

    v5 = objc_opt_new();
    [(TLKImageView *)v2 setShadowContainer:v5];

    v6 = [(TLKImageView *)v2 shadowContainer];
    v7 = [v6 layer];
    [v7 setAllowsGroupOpacity:0];

    v8 = [(TLKImageView *)v2 shadowContainer];
    [(TLKImageView *)v2 addSubview:v8];

    +[TLKView makeContainerShadowCompatible:v2];
    v9 = objc_opt_new();
    [(TLKImageView *)v2 setImageView:v9];

    v10 = [(TLKImageView *)v2 imageView];
    [v10 setAccessibilityIgnoresInvertColors:1];

    v11 = [(TLKImageView *)v2 imageView];
    +[TLKLayoutUtilities requireIntrinsicSizeForView:v11];

    v12 = [(TLKImageView *)v2 shadowContainer];
    v13 = [(TLKImageView *)v2 imageView];
    [v12 addSubview:v13];

    [(TLKImageView *)v2 setProminence:1];
    v2->_symbolWeight = 4;
    v2->_symbolScale = 0;
  }
  return v2;
}

- (void)setTlkImage:(id)a3
{
  v10 = (TLKImage *)a3;
  if (self->_tlkImage != v10)
  {
    objc_storeStrong((id *)&self->_tlkImage, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setUseButtonColoring:(BOOL)a3
{
  if (self->_useButtonColoring != a3)
  {
    self->_useButtonColoring = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setDisableCornerRounding:(BOOL)a3
{
  if (self->_disableCornerRounding != a3)
  {
    self->_disableCornerRounding = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setAlignment:(unint64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    id v5 = [(TLKImageView *)self imageView];
    if ([(TLKImageView *)self alignmentIsAspectFill]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    [v5 setContentMode:v4];
    [(TLKImageView *)self updateSizeAndLayout];
  }
}

- (BOOL)alignmentIsAspectFill
{
  return ([(TLKImageView *)self alignment] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)animateTransitionToImage:(id)a3
{
  id v4 = a3;
  [(TLKImageView *)self setAnimateNextImageTransition:1];
  [(TLKImageView *)self setTlkImage:v4];
}

- (void)updateWithUIImage:(id)a3 animateFadeIn:(BOOL)a4 appearance:(id)a5 isTemplate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (v6
    && ([(TLKImageView *)self overrideColor],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    v13 = [(TLKImageView *)self imageView];
    [v11 enableAppearanceForView:v13];
  }
  else
  {
    v13 = [(TLKImageView *)self imageView];
    [v11 disableAppearanceForView:v13];
  }

  if ([(TLKImageView *)self animateNextImageTransition])
  {
    if (v10)
    {
      v14 = [(TLKImageView *)self imageView];
      objc_super v15 = [MEMORY[0x1E4F41A28] transition];
      [v14 setSymbolImage:v10 withContentTransition:v15];

      [(TLKImageView *)self setAnimateNextImageTransition:0];
    }
  }
  else
  {
    v16 = [(TLKImageView *)self imageView];
    [v16 setImage:v10];
  }
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __70__TLKImageView_updateWithUIImage_animateFadeIn_appearance_isTemplate___block_invoke;
  v28 = &unk_1E5FD3020;
  v29 = self;
  id v17 = v10;
  id v30 = v17;
  +[TLKUtilities performAnimatableChanges:&v25 animated:v8];
  v18 = [(TLKImageView *)self tlkImage];
  if ([v18 isTemplate])
  {
    int v19 = 0;
    v20 = 0;
    BOOL v21 = v17 == 0;
  }
  else
  {
    uint64_t v22 = [v18 cornerRoundingStyle];
    v20 = 0;
    int v19 = 0;
    BOOL v21 = v17 == 0;
    if (v17 && v22 == 3)
    {
      if ([v18 supportsFastPathShadow])
      {
        BOOL v21 = 0;
        int v19 = 0;
        v20 = 0;
      }
      else
      {
        v20 = [MEMORY[0x1E4FB1618] whiteColor];
        BOOL v21 = 0;
        int v19 = 1;
      }
    }
  }
  v23 = [(TLKImageView *)self imageView];
  [v23 setBackgroundColor:v20];

  if (v19) {
  [(TLKImageView *)self updateSizeAndLayout];
  }
  if (!v21)
  {
    v24 = [(TLKImageView *)self delegate];
    [v24 didUpdateWithImage:v17];
  }
}

void __70__TLKImageView_updateWithUIImage_animateFadeIn_appearance_isTemplate___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  double v4 = 1.0;
  if (*(void *)(v3 + 8)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  BOOL v6 = [v2 placeholderView];
  [v6 setAlpha:v5];

  if (*(void *)(a1 + 40)) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  BOOL v8 = [*(id *)(a1 + 32) shadowContainer];
  [v8 setAlpha:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  if (!v9)
  {
    id v11 = [*(id *)(a1 + 32) placeholderView];
    double v4 = (double)([v11 isHidden] ^ 1);
  }
  id v10 = [*(id *)(a1 + 32) badgeImageView];
  [v10 setAlpha:v4];

  if (!v9)
  {
  }
}

- (void)updateSizeAndLayout
{
  [(TLKImageView *)self invalidateIntrinsicContentSizeIfNecessary];
  [(TLKImageView *)self setNeedsLayout];
}

- (void)invalidateIntrinsicContentSizeIfNecessary
{
  [(TLKImageView *)self effectiveBaselineOffsetFromBottom];
  double v4 = v3;
  [(TLKImageView *)self frame];
  double v6 = v5;
  double v8 = v7;
  [(TLKImageView *)self intrinsicContentSize];
  BOOL v11 = v6 == v10 && v8 == v9;
  if (!v11 || ([(TLKImageView *)self lastBaselineOffset], v4 != v12))
  {
    [(TLKImageView *)self invalidateIntrinsicContentSize];
    [(TLKImageView *)self setLastBaselineOffset:v4];
  }
}

- (CGSize)constrainedSizeForImageSize:(CGSize)a3 fittingSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  [(TLKImageView *)self minimumLayoutSize];
  double v9 = v7;
  if (v7 < v10)
  {
    [(TLKImageView *)self minimumLayoutSize];
    double v9 = v11;
  }
  [(TLKImageView *)self minimumLayoutSize];
  double v12 = v6;
  if (v6 < v13)
  {
    [(TLKImageView *)self minimumLayoutSize];
    double v12 = v14;
  }
  [(TLKImageView *)self maximumLayoutSize];
  if (v15 < width) {
    double width = v15;
  }
  [(TLKImageView *)self maximumLayoutSize];
  if (v16 < height) {
    double height = v16;
  }
  double v17 = v7 / v6;
  if (v9 > width)
  {
    [(TLKImageView *)self minimumLayoutSize];
    if (width / v17 >= v18) {
      double v12 = width / v17;
    }
    else {
      double v12 = v18;
    }
    double v9 = width;
  }
  if (v12 > height)
  {
    double v9 = v17 * height;
    [(TLKImageView *)self minimumLayoutSize];
    if (v17 * height < v19) {
      double v9 = v19;
    }
    double v12 = height;
  }
  double v20 = v9;
  double v21 = v12;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKImageView;
  [(TLKImageView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(TLKImageView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(TLKImageView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKImageView;
  [(TLKImageView *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)TLKImageView;
  [(UIView *)&v47 tlk_updateForAppearance:v4];
  double v5 = [(TLKImageView *)self tlkImage];
  double v6 = [(TLKImageView *)self lastTlkImage];

  [(TLKImageView *)self setLastTlkImage:v5];
  uint64_t v7 = [v5 badgeImage];
  if (v7)
  {
    uint64_t v8 = [(TLKImageView *)self badgeImageView];

    if (!v8)
    {
      objc_opt_class();
      objc_super v9 = objc_opt_new();
      [(TLKImageView *)self setBadgeImageView:v9];

      double v10 = [(TLKImageView *)self badgeImageView];
      [v10 setPlaceholderVisibility:2];

      double v11 = [(TLKImageView *)self badgeImageView];
      [(TLKImageView *)self addSubview:v11];
    }
  }
  double v12 = [(TLKImageView *)self badgeImageView];
  [v12 setHidden:v7 == 0];

  [v7 setBadgeImage:0];
  double v13 = [(TLKImageView *)self badgeImageView];
  [v13 setTlkImage:v7];

  [(TLKImageView *)self effectiveScreenScale];
  double v15 = v14;
  uint64_t v16 = [v4 isDark];
  double v17 = [v5 cachedImageForScale:v16 isDarkStyle:v15];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  if (v17)
  {
    -[TLKImageView updateWithUIImage:animateFadeIn:appearance:isTemplate:](self, "updateWithUIImage:animateFadeIn:appearance:isTemplate:", v17, 0, v4, [v5 isTemplate]);
  }
  else
  {
    if (v5 != v6)
    {
      unint64_t v18 = [(TLKImageView *)self placeholderVisibility];
      BOOL v22 = v5
         && ((unint64_t v19 = v18, [v5 cornerRoundingStyle])
          || ((BOOL v20 = [(TLKImageView *)self disableCornerRounding], v19 == 1)
            ? (int v21 = 1)
            : (int v21 = v20),
              v21 == 1))
         && v19 != 2;
      v23 = [(TLKImageView *)self placeholderView];
      [v23 setHidden:!v22];

      -[TLKImageView updateWithUIImage:animateFadeIn:appearance:isTemplate:](self, "updateWithUIImage:animateFadeIn:appearance:isTemplate:", 0, 0, v4, [v5 isTemplate]);
    }
    char v24 = [v5 supportsFastPathShadow];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __40__TLKImageView_tlk_updateForAppearance___block_invoke;
    v35 = &unk_1E5FD3098;
    char v41 = v24;
    id v36 = v5;
    v37 = self;
    double v40 = v15;
    char v42 = v16;
    v39 = &v43;
    id v38 = v4;
    [v36 loadImageWithScale:v16 isDarkStyle:&v32 completionHandler:v15];
  }
  *((unsigned char *)v44 + 24) = 1;
  if (!v5)
  {
    uint64_t v25 = [(TLKImageView *)self placeholderView];
    [v25 setHidden:1];
  }
  uint64_t v26 = [(TLKImageView *)self overrideColor];
  v27 = (void *)v26;
  if (v26)
  {
    BOOL v28 = 0;
    int v29 = 0;
    id v30 = (void *)v26;
  }
  else
  {
    BOOL v28 = [(TLKImageView *)self useButtonColoring];
    if (v28) {
      objc_msgSend(v4, "buttonColorForProminence:", -[TLKImageView prominence](self, "prominence"));
    }
    else {
    id v30 = objc_msgSend(v4, "colorForProminence:", -[TLKImageView prominence](self, "prominence"));
    }
    int v29 = !v28;
  }
  v31 = [(TLKImageView *)self imageView];
  [v31 setTintColor:v30];

  if (v29) {
  if (v28)
  }

  [(TLKImageView *)self updateShadow];
  _Block_object_dispose(&v43, 8);
}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  double v6 = v5;
  if (v5)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy_;
    v32[4] = __Block_byref_object_dispose_;
    id v7 = v5;
    id v33 = v7;
    char v8 = [*(id *)(a1 + 32) isTemplate];
    char v9 = v8;
    if (*(unsigned char *)(a1 + 72)) {
      char v10 = 1;
    }
    else {
      char v10 = v8;
    }
    if (v10) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = +[TLKImage imageIsSymbol:v7] ^ 1;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_15;
    v21[3] = &unk_1E5FD3070;
    char v27 = v9;
    char v24 = v32;
    char v28 = v11;
    int8x16_t v17 = *(int8x16_t *)(a1 + 32);
    id v15 = (id)v17.i64[0];
    int8x16_t v22 = vextq_s8(v17, v17, 8uLL);
    char v29 = a3;
    uint64_t v26 = *(void *)(a1 + 64);
    char v30 = *(unsigned char *)(a1 + 73);
    char v31 = *(unsigned char *)(a1 + 72);
    uint64_t v16 = *(void **)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    id v23 = v16;
    +[TLKUtilities executeBlock:v21 async:v11];

    _Block_object_dispose(v32, 8);
    double v14 = v33;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_3;
    v18[3] = &unk_1E5FD3020;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v19 = v12;
    uint64_t v20 = v13;
    +[TLKUtilities dispatchMainIfNecessary:v18];
    double v14 = v19;
  }
}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_15(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = +[TLKImage templateImageForImage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  if (*(unsigned char *)(a1 + 81)) {
    char v5 = [(id)objc_opt_class() imageIsProbablyOpaque:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) tlkImage:*(void *)(a1 + 40)];
  }
  else {
    char v5 = 0;
  }
  if (*(unsigned char *)(a1 + 82)) {
    [*(id *)(a1 + 40) cacheImage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forScale:*(unsigned __int8 *)(a1 + 83) isDarkStyle:*(double *)(a1 + 72)];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__TLKImageView_tlk_updateForAppearance___block_invoke_2;
  v10[3] = &unk_1E5FD3048;
  id v6 = *(id *)(a1 + 40);
  char v16 = v5;
  char v17 = *(unsigned char *)(a1 + 84);
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  uint64_t v15 = *(void *)(a1 + 72);
  char v18 = *(unsigned char *)(a1 + 83);
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 64);
  id v8 = (id)v9;
  long long v13 = v9;
  char v19 = *(unsigned char *)(a1 + 80);
  +[TLKUtilities dispatchMainIfNecessary:v10];
}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(unsigned char *)(a1 + 81) != 0;
  }
  [*(id *)(a1 + 32) setSupportsFastPathShadow:v2];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) tlkImage];
  if (v3 == v4
    && (v5 = *(double *)(a1 + 72), uint64_t v15 = v4, [*(id *)(a1 + 40) effectiveScreenScale], v4 = v15, v5 == v6))
  {
    int v7 = *(unsigned __int8 *)(a1 + 82);
    id v8 = +[TLKAppearance bestAppearanceForView:*(void *)(a1 + 40)];
    int v9 = [v8 isDark];

    if (v7 == v9)
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v12 = *(void **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(unsigned __int8 *)(a1 + 83);
      [v12 updateWithUIImage:v10 animateFadeIn:v11 appearance:v13 isTemplate:v14];
    }
  }
  else
  {
  }
}

void __40__TLKImageView_tlk_updateForAppearance___block_invoke_3(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) tlkImage];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 40) delegate];
    [v4 didFailToLoadImage];
  }
}

- (void)setOverrideColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_overrideColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideColor, a3);
    [(UIView *)self tlk_updateWithCurrentAppearance];
  }
}

- (CGSize)intrinsicContentSize
{
  -[TLKImageView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F4BED0], *(double *)(MEMORY[0x1E4F4BED0] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setSymbolFont:(id)a3
{
  id v5 = (UIFont *)a3;
  p_symbolFont = &self->_symbolFont;
  if (self->_symbolFont != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_symbolFont, a3);
    p_symbolFont = (UIFont **)[(TLKImageView *)self updateSymbolConfiguration];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_symbolFont, v5);
}

- (void)setSymbolScale:(int64_t)a3
{
  if (self->_symbolScale != a3)
  {
    self->_symbolScale = a3;
    [(TLKImageView *)self updateSymbolConfiguration];
  }
}

- (void)setSymbolWeight:(int64_t)a3
{
  if (self->_symbolWeight != a3)
  {
    self->_symbolWeight = a3;
    [(TLKImageView *)self updateSymbolConfiguration];
  }
}

- (void)updateSymbolConfiguration
{
  double v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = [(TLKImageView *)self symbolFont];
  [v4 pointSize];
  objc_msgSend(v3, "configurationWithPointSize:weight:scale:", -[TLKImageView symbolWeight](self, "symbolWeight"), -[TLKImageView symbolScale](self, "symbolScale"), v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [(TLKImageView *)self imageView];
  [v6 setPreferredSymbolConfiguration:v7];

  [(TLKImageView *)self invalidateIntrinsicContentSize];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[TLKImageView naturalSizeForSize:](self, "naturalSizeForSize:");
  -[TLKImageView constrainedSizeForImageSize:fittingSize:](self, "constrainedSizeForImageSize:fittingSize:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)naturalSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(TLKImageView *)self tlkImage];
  [v6 size];
  double v8 = v7;
  double v10 = v9;

  BOOL v11 = v8 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v11
    && ([(TLKImageView *)self imageView],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v12 image],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = +[TLKImage imageIsSymbol:v13],
        v13,
        v12,
        v14))
  {
    uint64_t v15 = [(TLKImageView *)self imageView];
    objc_msgSend(v15, "sizeThatFits:", width, height);
    double v17 = v16;
    double v19 = v18;

    double v20 = v17;
    double v21 = v19;
  }
  else
  {
    double v20 = v8;
    double v21 = v10;
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)updateShadow
{
  id v18 = +[TLKAppearance bestAppearanceForView:self];
  double v3 = [(TLKImageView *)self shadowContainer];
  double v4 = self->_imageView;
  if ([(TLKImageView *)self shadowDisabled]
    || ([(TLKImageView *)self tlkImage],
        double v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isTemplate],
        v5,
        (v6 & 1) != 0))
  {
    +[TLKView enableShadow:0 forView:v3];
    int v7 = 0;
    BOOL v8 = 0;
  }
  else
  {
    if ([v18 style] == 1) {
      +[TLKView enableLightKeylineStroke:1 forView:v3];
    }
    else {
      +[TLKView enableShadow:1 forView:v3];
    }
    double v9 = [(TLKImageView *)self tlkImage];
    if ([v9 supportsFastPathShadow])
    {
      BOOL v8 = 1;
    }
    else
    {
      double v10 = [(TLKImageView *)self imageView];
      BOOL v11 = [v10 backgroundColor];
      BOOL v8 = v11 != 0;
    }
    int v7 = 1;
  }
  [(TLKImageView *)self effectiveScreenScale];
  double v13 = v12;
  BOOL v14 = [v3 layer];
  uint64_t v15 = v14;
  if (v7)
  {
    [v14 setShadowPathIsBounds:v8];
    if (v8)
    {
      double v16 = [(UIImageView *)v4 layer];
      [v16 cornerRadius];
      objc_msgSend(v15, "setCornerRadius:");
      double v17 = [v16 cornerCurve];
      [v15 setCornerCurve:v17];

      objc_msgSend(v15, "setMaskedCorners:", objc_msgSend(v16, "maskedCorners"));
      [v15 setContentsScale:v13];
    }
  }
  [v15 setShouldRasterize:v7 & (v8 ^ 1)];
  [v15 setRasterizationScale:v13];
}

- (CGRect)aspectRatioPreservedFrameForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(TLKImageView *)self bounds];
  double v6 = CGRectGetWidth(v33);
  [(TLKImageView *)self bounds];
  double v8 = CGRectGetHeight(v34);
  if (height == INFINITY) {
    double v9 = v8;
  }
  else {
    double v9 = height;
  }
  if (width == INFINITY) {
    double v10 = v6;
  }
  else {
    double v10 = width;
  }
  if (height == 0.0) {
    goto LABEL_31;
  }
  BOOL v11 = v10 < v6 && v9 < v8;
  double v12 = width / height;
  if (v11)
  {
    BOOL v14 = [(TLKImageView *)self tlkImage];
    [v14 size];
    if (v16 == *MEMORY[0x1E4F1DB30] && v15 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      char v18 = TLKSnippetModernizationEnabled();

      double v13 = v6 / v12;
      if (v18) {
        goto LABEL_20;
      }
    }
    else
    {

      double v13 = v6 / v12;
    }
    double v10 = v6;
    double v9 = v13;
    goto LABEL_20;
  }
  double v13 = v6 / v12;
LABEL_20:
  if (v10 <= v6) {
    double v7 = v10;
  }
  else {
    double v7 = v6;
  }
  if (v10 <= v6) {
    double v13 = v9;
  }
  if (v13 <= v8) {
    double v10 = v7;
  }
  else {
    double v10 = v12 * v8;
  }
  if (v13 <= v8) {
    double v9 = v13;
  }
  else {
    double v9 = v8;
  }
LABEL_31:
  +[TLKLayoutUtilities ceilingValue:inView:](TLKLayoutUtilities, "ceilingValue:inView:", self, v10, v7);
  double v20 = v19;
  +[TLKLayoutUtilities ceilingValue:self inView:v9];
  double v22 = v21;
  double v23 = v6 - v20;
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:(v6 - v20) * 0.5];
  double v25 = v24;
  double v26 = v8 - v22;
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:v26 * 0.5];
  double v28 = v27;
  if ([(TLKImageView *)self alignment] == 1)
  {
    if (+[TLKLayoutUtilities isLTR]) {
      double v25 = v23;
    }
    else {
      double v25 = 0.0;
    }
  }
  else if ([(TLKImageView *)self alignment] == 4)
  {
    double v28 = v26;
  }
  double v29 = v25;
  double v30 = v28;
  double v31 = v20;
  double v32 = v22;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)layoutSubviews
{
  v73.receiver = self;
  v73.super_class = (Class)TLKImageView;
  [(TLKView *)&v73 layoutSubviews];
  double v3 = [(TLKImageView *)self tlkImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v10 = v7 == v9 && v5 == *MEMORY[0x1E4F1DB30];
  if (v10)
  {
    [(TLKImageView *)self bounds];
    double v5 = v11;
    double v7 = v12;
  }
  double v13 = [(TLKImageView *)self imageView];
  BOOL v14 = [v13 image];

  [v14 size];
  double v16 = v15;
  double v18 = v17;
  if (v10 && +[TLKImage imageIsSymbol:v14])
  {
    [(TLKImageView *)self bounds];
    -[TLKImageView naturalSizeForSize:](self, "naturalSizeForSize:", v19, v20);
    double v16 = v21;
    double v18 = v22;
  }
  else if (v16 == v8 && v18 == v9)
  {
    double v24 = [(TLKImageView *)self tlkImage];
    [v24 size];
    double v16 = v25;
    double v18 = v26;
  }
  BOOL v27 = [(TLKImageView *)self alignmentIsAspectFill];
  if (v27) {
    [(TLKImageView *)self bounds];
  }
  else {
    -[TLKImageView aspectRatioPreservedFrameForSize:](self, "aspectRatioPreservedFrameForSize:", v5, v7);
  }
  double v32 = v28;
  double v33 = v29;
  double v34 = v30;
  double v35 = v31;
  id v36 = [(TLKImageView *)self placeholderView];
  objc_msgSend(v36, "setFrame:", v32, v33, v34, v35);

  if (v27) {
    [(TLKImageView *)self bounds];
  }
  else {
    -[TLKImageView aspectRatioPreservedFrameForSize:](self, "aspectRatioPreservedFrameForSize:", v16, v18);
  }
  double v41 = v37;
  double v42 = v38;
  double v43 = v39;
  double v44 = v40;
  if ([(TLKImageView *)self alignment] == 3)
  {
    if (v16 == 0.0)
    {
      double v45 = 0.0;
    }
    else
    {
      v74.origin.x = v41;
      v74.origin.y = v42;
      v74.size.double width = v43;
      v74.size.double height = v44;
      double v45 = v18 / v16 * CGRectGetWidth(v74);
    }
    v75.origin.x = v41;
    v75.origin.y = v42;
    v75.size.double width = v43;
    v75.size.double height = v44;
    double Height = CGRectGetHeight(v75);
    if (v45 >= Height) {
      double v44 = v45;
    }
    else {
      double v44 = Height;
    }
  }
  objc_super v47 = [(TLKImageView *)self shadowContainer];
  objc_msgSend(v47, "setFrame:", v41, v42, v43, v44);

  v48 = [(TLKImageView *)self shadowContainer];
  [v48 bounds];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [(TLKImageView *)self imageView];
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  v58 = [(TLKImageView *)self tlkImage];
  uint64_t v59 = [v58 cornerRoundingStyle];

  if (![(TLKImageView *)self disableCornerRounding])
  {
    v60 = [(TLKImageView *)self placeholderView];
    [(TLKImageView *)self applyCornerRoundingStyle:v59 toView:v60];

    v61 = [(TLKImageView *)self imageView];
    [(TLKImageView *)self applyCornerRoundingStyle:v59 toView:v61];
  }
  [(TLKImageView *)self updateShadow];
  if (+[TLKUtilities isMacOS]) {
    double v62 = 16.0;
  }
  else {
    double v62 = 20.0;
  }
  BOOL v63 = +[TLKLayoutUtilities isLTR];
  double v64 = v41;
  double v65 = v42;
  double v66 = v43;
  double v67 = v44;
  if (v63)
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v64) - v62;
    double v69 = 2.0;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v64);
    double v69 = -2.0;
  }
  double v70 = MinX + v69;
  v76.origin.x = v41;
  v76.origin.y = v42;
  v76.size.double width = v43;
  v76.size.double height = v44;
  CGFloat v71 = CGRectGetMaxY(v76) - v62 + 2.0;
  v72 = [(TLKImageView *)self badgeImageView];
  objc_msgSend(v72, "setFrame:", v70, v71, v62, v62);
}

- (void)applyCornerRoundingStyle:(unint64_t)a3 toView:(id)a4
{
  id v13 = a4;
  double v6 = [v13 layer];
  BOOL v7 = [(TLKImageView *)self disableCornerRounding];
  double v8 = 0.0;
  if (!v7)
  {
    objc_msgSend(v13, "bounds", 0.0);
    -[TLKImageView cornerRadiusForSize:roundingStyle:](self, "cornerRadiusForSize:roundingStyle:", a3, v9, v10);
  }
  [v6 setCornerRadius:v8];
  double v11 = (void *)MEMORY[0x1E4F39EA0];
  if (a3 != 3) {
    double v11 = (void *)MEMORY[0x1E4F39EA8];
  }
  [v6 setCornerCurve:*v11];
  objc_msgSend(v6, "setMaskedCorners:", objc_msgSend((id)objc_opt_class(), "defaultCornerMask"));
  [v6 cornerRadius];
  [v6 setMasksToBounds:v12 > 0.0];
}

- (double)cornerRadiusForSize:(CGSize)a3 roundingStyle:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a4 == 3)
  {
    double v8 = 0.5;
  }
  else if (a4 == 2)
  {
    +[TLKUtilities appIconCornerRadiusRatio];
  }
  else
  {
    double v8 = 0.0;
    if (a4 == 1) {
      +[TLKUtilities standardRoundedCornerRadiusRatio];
    }
  }
  if (width >= height) {
    double v9 = height;
  }
  else {
    double v9 = width;
  }
  double v10 = v9 * v8;
  BOOL v11 = +[TLKUtilities isMacOS];
  double v12 = fmin(v10, 10.0);
  if (a4 == 1 && v11) {
    double v13 = v12;
  }
  else {
    double v13 = v10;
  }
  if (a4 == 1 || (BOOL v14 = +[TLKUtilities isMacOS], a4 == 2) && v14)
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:1.5];
    double v16 = fmin(v13, 15.0);
    if (v15 >= v16) {
      return v15;
    }
    else {
      return v16;
    }
  }
  return v10;
}

+ (unint64_t)defaultCornerMask
{
  return 15;
}

+ (BOOL)imageIsProbablyOpaque:(id)a3 tlkImage:(id)a4
{
  id v6 = a4;
  BOOL v7 = (CGImage *)[a3 CGImage];
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v7);
  LOBYTE(v9) = 1;
  if (AlphaInfo && AlphaInfo != kCGImageAlphaNoneSkipLast)
  {
    if (AlphaInfo == kCGImageAlphaOnly) {
      LOBYTE(v9) = 0;
    }
    else {
      int v9 = objc_msgSend(a1, "checkTransparencyForImageAtCorners:shouldCropToCircle:", v7, objc_msgSend(v6, "cornerRoundingStyle") == 3) ^ 1;
    }
  }

  return v9;
}

+ (BOOL)checkTransparencyForImageAtCorners:(CGImage *)a3 shouldCropToCircle:(BOOL)a4
{
  BOOL v4 = a4;
  double Width = (double)CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  double v9 = (double)Height * 0.05;
  double v10 = (double)Height + -1.0 - v9;
  if (v4)
  {
    double v11 = (double)Height * 0.5;
    if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v11) & 1) == 0)
    {
      double v12 = Width * 0.5;
      if ((objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.5, v9) & 1) == 0
        && (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width + -1.0 - Width * 0.05, v11) & 1) == 0)
      {
        goto LABEL_10;
      }
    }
    return 1;
  }
  if (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v9)) {
    return 1;
  }
  if (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, Width * 0.05, v10)) {
    return 1;
  }
  double v12 = Width + -1.0 - Width * 0.05;
  if (objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, v12, v9)) {
    return 1;
  }
LABEL_10:
  return objc_msgSend(a1, "hasTransparencyAtPoint:forCGImage:", a3, v12, v10);
}

+ (BOOL)hasTransparencyAtPoint:(CGPoint)a3 forCGImage:(CGImage *)a4
{
  float x = a3.x;
  v11.origin.float x = floorf(x);
  float y = a3.y;
  v11.origin.float y = floorf(y);
  v11.size.double width = 1.0;
  v11.size.double height = 1.0;
  id v6 = CGImageCreateWithImageInRect(a4, v11);
  char data = 0;
  BOOL v7 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 1uLL, 0, 7u);
  v12.origin.float x = 0.0;
  v12.origin.float y = 0.0;
  v12.size.double width = 1.0;
  v12.size.double height = 1.0;
  CGContextDrawImage(v7, v12, v6);
  CGContextRelease(v7);
  CGImageRelease(v6);
  LOBYTE(v8) = data;
  return (double)v8 / 255.0 < 0.25;
}

- (double)sizeScale
{
  double v3 = [(TLKImageView *)self imageView];
  [v3 intrinsicContentSize];
  double v5 = v4;

  if (v5 == 0.0) {
    return 1.0;
  }
  [(TLKImageView *)self intrinsicContentSize];
  return v6 / v5;
}

- (UIEdgeInsets)effectiveAlignmentRectInsets
{
  if ([(TLKImageView *)self ignoreImageAlignmentRectInsets])
  {
    v21.receiver = self;
    v21.super_class = (Class)TLKImageView;
    [(TLKImageView *)&v21 effectiveAlignmentRectInsets];
  }
  else
  {
    BOOL v7 = [(TLKImageView *)self imageView];
    [v7 alignmentRectInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    v20.receiver = self;
    v20.super_class = (Class)TLKImageView;
    [(TLKImageView *)&v20 effectiveAlignmentRectInsets];
    double v3 = v9 + v16;
    double v4 = v11 + v17;
    double v5 = v13 + v18;
    double v6 = v15 + v19;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)effectiveBaselineOffsetFromBottom
{
  [(TLKImageView *)self sizeScale];
  double v4 = v3;
  double v5 = [(TLKImageView *)self imageView];
  [v5 effectiveBaselineOffsetFromBottom];
  double v7 = v6;
  double v8 = [(TLKImageView *)self imageView];
  [v8 effectiveAlignmentRectInsets];
  double v10 = v4 * (v7 - v9);

  return v10;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  [(TLKImageView *)self sizeScale];
  double v4 = v3;
  double v5 = [(TLKImageView *)self imageView];
  [v5 effectiveFirstBaselineOffsetFromTop];
  double v7 = v6;
  double v8 = [(TLKImageView *)self imageView];
  [v8 effectiveAlignmentRectInsets];
  double v10 = v4 * (v7 - v9);

  return v10;
}

- (TLKImage)tlkImage
{
  return self->_tlkImage;
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (BOOL)useButtonColoring
{
  return self->_useButtonColoring;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (unint64_t)placeholderVisibility
{
  return self->_placeholderVisibility;
}

- (void)setPlaceholderVisibility:(unint64_t)a3
{
  self->_placeholderVisibilitfloat y = a3;
}

- (UIFont)symbolFont
{
  return self->_symbolFont;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TLKProminenceView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (TLKImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKImageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disableCornerRounding
{
  return self->_disableCornerRounding;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (BOOL)shadowDisabled
{
  return self->_shadowDisabled;
}

- (void)setShadowDisabled:(BOOL)a3
{
  self->_shadowDisabled = a3;
}

- (BOOL)ignoreImageAlignmentRectInsets
{
  return self->_ignoreImageAlignmentRectInsets;
}

- (void)setIgnoreImageAlignmentRectInsets:(BOOL)a3
{
  self->_ignoreImageAlignmentRectInsets = a3;
}

- (UIView)shadowContainer
{
  return self->_shadowContainer;
}

- (void)setShadowContainer:(id)a3
{
}

- (TLKImage)lastTlkImage
{
  return self->_lastTlkImage;
}

- (void)setLastTlkImage:(id)a3
{
}

- (TLKImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (double)lastBaselineOffset
{
  return self->_lastBaselineOffset;
}

- (void)setLastBaselineOffset:(double)a3
{
  self->_lastBaselineOffset = a3;
}

- (BOOL)animateNextImageTransition
{
  return self->_animateNextImageTransition;
}

- (void)setAnimateNextImageTransition:(BOOL)a3
{
  self->_animateNextImageTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_lastTlkImage, 0);
  objc_storeStrong((id *)&self->_shadowContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_tlkImage, 0);
}

@end