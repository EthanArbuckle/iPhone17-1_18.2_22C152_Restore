@interface PXImageUIView
- (BOOL)allowsFocus;
- (BOOL)drawsFocusRing;
- (BOOL)floatingViewEnabled;
- (BOOL)isAnimating;
- (BOOL)isFloatingRotationEnabled;
- (CGRect)contentsRect;
- (NSArray)_overlaySpecs;
- (PXFocusableUIImageView)_imageView;
- (PXImageUIView)initWithCoder:(id)a3;
- (PXImageUIView)initWithFrame:(CGRect)a3;
- (PXImageViewSpec)spec;
- (PXRoundedCornerOverlayView)_cornerView;
- (UIImage)image;
- (UIView)contentView;
- (id)focusEffect;
- (int64_t)contentMode;
- (void)_PXImageUIViewInitialization;
- (void)_setCornerView:(id)a3;
- (void)_setOverlaySpecs:(id)a3;
- (void)_updateCorners;
- (void)_updateFloatingOverlay;
- (void)_updateSubviewsOrdering;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimating:(BOOL)a3 withFlags:(unint64_t)a4;
- (void)setContentMode:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setDrawsFocusRing:(BOOL)a3;
- (void)setFloatingOverlay:(id)a3 withInsets:(UIEdgeInsets)a4 parallax:(BOOL)a5;
- (void)setFloatingRotationEnabled:(BOOL)a3;
- (void)setFloatingViewEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setSpec:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXImageUIView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__overlaySpecs, 0);
  objc_storeStrong((id *)&self->__cornerView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_floatingOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayViews, 0);
}

- (NSArray)_overlaySpecs
{
  return self->__overlaySpecs;
}

- (void)_setCornerView:(id)a3
{
}

- (PXRoundedCornerOverlayView)_cornerView
{
  return self->__cornerView;
}

- (PXFocusableUIImageView)_imageView
{
  return self->__imageView;
}

- (BOOL)isFloatingRotationEnabled
{
  return self->_floatingRotationEnabled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentView:(id)a3
{
}

- (BOOL)floatingViewEnabled
{
  return self->_floatingViewEnabled;
}

- (PXImageViewSpec)spec
{
  return self->_spec;
}

- (UIImage)image
{
  return self->_image;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXImageUIView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9)
  {
    [(PXImageUIView *)self _updateCorners];
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.CGFloat x = x;
    p_contentsRect->origin.CGFloat y = y;
    p_contentsRect->size.CGFloat width = width;
    p_contentsRect->size.CGFloat height = height;
    id v10 = [(PXImageUIView *)self _imageView];
    double v9 = [v10 layer];
    objc_msgSend(v9, "setContentsRect:", p_contentsRect->origin.x, p_contentsRect->origin.y, p_contentsRect->size.width, p_contentsRect->size.height);
  }
}

- (void)setAnimating:(BOOL)a3 withFlags:(unint64_t)a4
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    uint64_t v5 = a3 & (a4 >> 1);
    snapshotView = self->_snapshotView;
    if (snapshotView)
    {
      [(UIView *)snapshotView removeFromSuperview];
      double v7 = self->_snapshotView;
      self->_snapshotView = 0;
    }
    id v8 = [(PXImageUIView *)self _imageView];
    [v8 setHidden:v5];
  }
}

- (void)setAnimating:(BOOL)a3
{
}

- (void)_updateSubviewsOrdering
{
  overlayViews = self->_overlayViews;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PXImageUIView__updateSubviewsOrdering__block_invoke;
  v5[3] = &unk_1E5DC5450;
  v5[4] = self;
  [(NSMutableArray *)overlayViews enumerateObjectsUsingBlock:v5];
  id v4 = [(PXImageUIView *)self _cornerView];
  [(PXImageUIView *)self bringSubviewToFront:v4];
}

uint64_t __40__PXImageUIView__updateSubviewsOrdering__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) bringSubviewToFront:a2];
}

- (void)_updateCorners
{
  v3 = [(PXImageUIView *)self spec];
  [v3 cornerRadius];
  double v5 = v4;
  uint64_t v6 = [v3 roundedCornersMode];
  double v7 = [(PXImageUIView *)self _imageView];
  if (![(PXImageUIView *)self floatingViewEnabled])
  {
    [v7 setClipsToBounds:1];
    if (v5 > 0.0 && v6 == 1)
    {
      v15 = +[PXMemoriesFeedSettings sharedInstance];
      char v16 = [v15 disableRoundedOverlays];

      uint64_t v17 = [(PXImageUIView *)self _cornerView];
      id v8 = (PXRoundedCornerOverlayView *)v17;
      if ((v16 & 1) == 0)
      {
        if (!v17)
        {
          id v8 = objc_alloc_init(PXRoundedCornerOverlayView);
          [(PXRoundedCornerOverlayView *)v8 setTranslatesAutoresizingMaskIntoConstraints:1];
          [(PXRoundedCornerOverlayView *)v8 setAutoresizingMask:18];
          [(PXImageUIView *)self _setCornerView:v8];
          [(PXImageUIView *)self addSubview:v8];
          [(PXImageUIView *)self _updateSubviewsOrdering];
        }
        [(PXImageUIView *)self bounds];
        -[PXRoundedCornerOverlayView setFrame:](v8, "setFrame:");
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __31__PXImageUIView__updateCorners__block_invoke;
        v25 = &unk_1E5DC5428;
        double v27 = v5;
        id v26 = v3;
        [(PXRoundedCornerOverlayView *)v8 performChanges:&v22];

        uint64_t v18 = 0;
        double v5 = 0.0;
        goto LABEL_22;
      }
    }
    else
    {
      id v8 = [(PXImageUIView *)self _cornerView];
    }
    uint64_t v18 = 1;
LABEL_22:
    -[PXRoundedCornerOverlayView setHidden:](v8, "setHidden:", v18, v22, v23, v24, v25);
    v21 = [v7 layer];
    [v21 setCornerRadius:v5];

    goto LABEL_23;
  }
  id v8 = [v7 _layeredImageContainer];
  double v9 = [(PXRoundedCornerOverlayView *)v8 config];
  [v7 _setLayeredImageCornerRadius:v5];
  [v9 defaultFocusedShadowRadius];
  objc_msgSend(v9, "setDefaultUnfocusedShadowRadius:");
  double v10 = 0.0;
  if (self->_hasParallax) {
    objc_msgSend(v9, "maximumParallaxDepth", 0.0);
  }
  [v9 setOverlayDepth:v10];
  double v11 = 0.0799999982;
  if (!self->_floatingRotationEnabled) {
    double v11 = 0.0;
  }
  [v9 setRotationAmount:v11];
  if (self->_floatingRotationEnabled)
  {
    [v9 translationOffset];
  }
  else
  {
    double v12 = 8.0;
    double v13 = 8.0;
  }
  objc_msgSend(v9, "setTranslationOffset:", v12, v13);
  double v19 = 0.200000003;
  if (!self->_floatingRotationEnabled) {
    double v19 = 0.0;
  }
  [v9 setSpecularOpacity:v19];
  [v9 setBoostBrightness:self->_floatingRotationEnabled];
  [v9 setAllowsNonOpaqueShadow:0];
  v20 = [(PXImageUIView *)self _cornerView];
  [v20 removeFromSuperview];

  [(PXImageUIView *)self _setCornerView:0];
  [v7 setClipsToBounds:0];

LABEL_23:
}

void __31__PXImageUIView__updateCorners__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 setCornerRadius:v3];
  double v5 = [*(id *)(a1 + 32) backgroundColor];
  [v4 setOverlayColor:v5];

  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 scale];
  objc_msgSend(v4, "setDisplayScale:");
}

- (void)_updateFloatingOverlay
{
  if (self->_floatingOverlayView)
  {
    id v2 = [(PXImageUIView *)self _imageView];
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:0];
    [v2 bounds];
    PXEdgeInsetsInsetRect();
  }
}

- (void)setFloatingOverlay:(id)a3 withInsets:(UIEdgeInsets)a4 parallax:(BOOL)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  double v12 = (UIView *)a3;
  if (self->_floatingOverlayView != v12)
  {
    double v13 = v12;
    objc_storeStrong((id *)&self->_floatingOverlayView, a3);
    self->_floatingInsets.CGFloat top = top;
    self->_floatingInsets.CGFloat left = left;
    self->_floatingInsets.CGFloat bottom = bottom;
    self->_floatingInsets.CGFloat right = right;
    self->_hasParallaCGFloat x = a5;
    [(PXImageUIView *)self _updateFloatingOverlay];
    double v12 = v13;
  }
}

- (void)setFloatingRotationEnabled:(BOOL)a3
{
  if (self->_floatingRotationEnabled != a3)
  {
    self->_floatingRotationEnabled = a3;
    [(PXImageUIView *)self _updateCorners];
  }
}

- (void)_setOverlaySpecs:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  double v5 = self->__overlaySpecs;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSArray *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      id v8 = (NSArray *)[(NSArray *)v4 copy];
      overlaySpecs = self->__overlaySpecs;
      self->__overlaySpecs = v8;

      [(NSMutableArray *)self->_overlayViews makeObjectsPerformSelector:sel_removeFromSuperview];
      [(NSMutableArray *)self->_overlayViews removeAllObjects];
      v31 = [(PXImageUIView *)self _imageView];
      [v31 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obj = self->__overlaySpecs;
      uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v30 = v4;
        char v20 = 0;
        uint64_t v21 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v11, v13, v15, v17);
            [v24 setAutoresizingMask:18];
            v25 = [v24 layer];
            id v26 = objc_msgSend(MEMORY[0x1E4F39BC0], "px_filterWithPXCompositingFilterType:", objc_msgSend(v23, "compositingFilterType"));
            [v25 setCompositingFilter:v26];
            id v27 = [v23 backgroundColor];
            objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

            [(NSMutableArray *)self->_overlayViews addObject:v24];
            if (self->_floatingViewEnabled) {
              [(PXImageUIView *)self _updateFloatingOverlay];
            }
            else {
              [v31 addSubview:v24];
            }
            v20 |= v26 != 0;
          }
          uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v19);
        char v28 = v20 ^ 1;
        id v4 = v30;
      }
      else
      {
        char v28 = 1;
      }

      v29 = [v31 layer];
      [v29 setAllowsGroupBlending:v28 & 1];

      [(PXImageUIView *)self _updateSubviewsOrdering];
    }
  }
}

- (void)setFloatingViewEnabled:(BOOL)a3
{
  if (self->_floatingViewEnabled != a3)
  {
    self->_floatingViewEnabled = a3;
    [(PXImageUIView *)self _updateCorners];
  }
}

- (UIView)contentView
{
  return (UIView *)self->__imageView;
}

- (void)_PXImageUIViewInitialization
{
  double v3 = [(PXImageUIView *)self layer];
  [v3 setAllowsGroupOpacity:0];

  id v4 = objc_alloc_init(PXFocusableUIImageView);
  imageView = self->__imageView;
  self->__imageView = v4;

  id v6 = self->__imageView;
  [(PXImageUIView *)self bounds];
  -[PXFocusableUIImageView setFrame:](v6, "setFrame:");
  [(PXFocusableUIImageView *)self->__imageView setUserInteractionEnabled:1];
  [(PXFocusableUIImageView *)self->__imageView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(PXFocusableUIImageView *)self->__imageView setClipsToBounds:1];
  [(PXFocusableUIImageView *)self->__imageView setAutoresizingMask:18];
  char v7 = self->__imageView;
  id v8 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  [(PXFocusableUIImageView *)v7 setBackgroundColor:v8];

  [(PXImageUIView *)self addSubview:self->__imageView];
  double v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  overlayViews = self->_overlayViews;
  self->_overlayViews = v9;

  [(PXImageUIView *)self setTranslatesAutoresizingMaskIntoConstraints:1];
  [(PXImageUIView *)self setFloatingRotationEnabled:1];
}

- (void)setDrawsFocusRing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXImageUIView *)self _imageView];
  [v4 setDrawsFocusRing:v3];
}

- (BOOL)drawsFocusRing
{
  id v2 = [(PXImageUIView *)self _imageView];
  char v3 = [v2 drawsFocusRing];

  return v3;
}

- (void)setAllowsFocus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXImageUIView *)self _imageView];
  [v4 setAllowsFocus:v3];
}

- (BOOL)allowsFocus
{
  id v2 = [(PXImageUIView *)self _imageView];
  char v3 = [v2 allowsFocus];

  return v3;
}

- (id)focusEffect
{
  char v3 = [(PXImageUIView *)self _cornerView];
  if ([v3 isHidden])
  {
    id v4 = 0;
  }
  else
  {
    double v5 = [v3 focusInfo];
    id v4 = [v5 makeHaloEffectForSourceView:self];
  }
  return v4;
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  -[PXImageUIView setContentMode:](&v6, sel_setContentMode_);
  double v5 = [(PXImageUIView *)self _imageView];
  [v5 setContentMode:a3];
}

- (void)setImage:(id)a3
{
  objc_super v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    double v5 = [(PXImageUIView *)self _imageView];
    [v5 setImage:v6];

    [(PXImageUIView *)self _updateFloatingOverlay];
    [(PXImageUIView *)self _updateCorners];
  }
}

- (void)setSpec:(id)a3
{
  double v5 = (PXImageViewSpec *)a3;
  p_spec = &self->_spec;
  if (self->_spec != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXImageUIView *)self setFloatingViewEnabled:[(PXImageViewSpec *)*p_spec shouldEnableFocus]];
    [(PXImageUIView *)self _updateFloatingOverlay];
    [(PXImageUIView *)self _updateCorners];
    char v7 = [(PXImageViewSpec *)*p_spec overlaySpecs];
    [(PXImageUIView *)self _setOverlaySpecs:v7];

    double v5 = v8;
  }
}

- (PXImageUIView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  char v3 = [(PXImageUIView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(PXImageUIView *)v3 _PXImageUIViewInitialization];
  }
  return v4;
}

- (PXImageUIView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXImageUIView;
  char v3 = -[PXImageUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXImageUIView *)v3 _PXImageUIViewInitialization];
  }
  return v4;
}

@end