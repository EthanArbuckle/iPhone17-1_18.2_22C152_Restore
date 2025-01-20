@interface TLKView
+ (Class)layerClass;
+ (UIEdgeInsets)defaultLayoutMargins;
+ (void)enableLightKeylineStroke:(BOOL)a3 forView:(id)a4;
+ (void)enableShadow:(BOOL)a3 forView:(id)a4;
+ (void)makeContainerShadowCompatible:(id)a3;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (BOOL)usesDefaultLayoutMargins;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TLKAppearance)tlkAppearance;
- (TLKObserver)observer;
- (TLKView)init;
- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins;
- (UIEdgeInsets)effectiveLayoutMargins;
- (UIView)contentView;
- (UIView)leadingTextView;
- (id)setupContentView;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)batchUpdateCount;
- (void)disableUnbatchedUpdates;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3;
- (void)propertiesDidChange;
- (void)setBatchUpdateCount:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setObserver:(id)a3;
- (void)setTlkAppearance:(id)a3;
@end

@implementation TLKView

+ (void)enableShadow:(BOOL)a3 forView:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  v6 = [v11 layer];
  double v7 = 0.0;
  if (v4)
  {
    objc_msgSend(a1, "makeContainerShadowCompatible:", v11, 0.0);
    int v8 = [v6 isGeometryFlipped];
    double v9 = -2.0;
    if (!v8) {
      double v9 = 2.0;
    }
    objc_msgSend(v6, "setShadowOffset:", 0.0, v9);
    [v6 setShadowRadius:8.0];
    id v10 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v10, "CGColor"));

    LODWORD(v7) = 1039516303;
  }
  [v6 setShadowOpacity:v7];
}

+ (void)makeContainerShadowCompatible:(id)a3
{
  id v3 = [a3 layer];
  [v3 setMasksToBounds:0];
}

- (TLKView)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLKView;
  v2 = [(TLKView *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    [(TLKView *)v2 setObserver:v2];
    BOOL v4 = [(TLKView *)v3 setupContentView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [v5 setLayoutMarginsRelativeArrangement:1];
      if ([(TLKView *)v3 usesDefaultLayoutMargins])
      {
        [(id)objc_opt_class() defaultLayoutMargins];
        objc_msgSend(v5, "setLayoutMargins:");
      }
    }
    [(TLKView *)v3 setContentView:v4];
    v6 = [(TLKView *)v3 contentView];
    [v6 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

    [(TLKView *)v3 addSubview:v4];
  }
  return v3;
}

- (id)setupContentView
{
  return 0;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 1;
}

- (void)propertiesDidChange
{
  [(TLKView *)self observedPropertiesChanged];
  if ([(TLKView *)self usesDefaultLayoutMargins])
  {
    id v3 = [(TLKView *)self contentView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v5 = [(TLKView *)self contentView];
      if ([v5 hasBaselineRelativeLayoutMarginsForArrangement])
      {
        [(TLKView *)self defaultBaselineRelativeLayoutMargins];
        objc_msgSend(v5, "setLayoutMargins:");
      }
    }
  }
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_0;
  double v3 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_1;
  double v4 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_2;
  double v5 = *(double *)&defaultLayoutMargins_defaultLayoutMargins_3;
  if (*(double *)&defaultLayoutMargins_defaultLayoutMargins_1 == *(double *)(MEMORY[0x1E4FB2848] + 8)
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_0 == *MEMORY[0x1E4FB2848]
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_3 == *(double *)(MEMORY[0x1E4FB2848] + 24)
    && *(double *)&defaultLayoutMargins_defaultLayoutMargins_2 == *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    +[TLKUtilities standardTableCellContentInset];
    double v5 = *(double *)&v9;
    defaultLayoutMargins_defaultLayoutMargins_0 = 0x4030000000000000;
    defaultLayoutMargins_defaultLayoutMargins_1 = v9;
    defaultLayoutMargins_defaultLayoutMargins_2 = 0x4030000000000000;
    defaultLayoutMargins_defaultLayoutMargins_3 = v9;
    double v4 = 16.0;
    double v3 = *(double *)&v9;
    double v2 = 16.0;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)defaultBaselineRelativeLayoutMargins
{
  [(id)objc_opt_class() defaultLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TLKView *)self viewForFirstBaselineLayout];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(TLKView *)self viewForFirstBaselineLayout];
    v14 = [v13 performSelector:sel_font];

    [v14 capHeight];
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
    double v4 = v4 + v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)effectiveLayoutMargins
{
  [(TLKView *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TLKView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [(TLKView *)self contentView];
    [v13 layoutMargins];
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutMarginsDidChange
{
  double v3 = [(TLKView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(TLKView *)self layoutMargins];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [(TLKView *)self contentView];
    objc_msgSend(v13, "setLayoutMargins:", v6, v8, v10, v12);
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)viewForFirstBaselineLayout
{
  double v3 = [(TLKView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(TLKView *)self contentView];
    double v6 = [v5 viewForFirstBaselineLayout];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKView;
    double v6 = [(TLKView *)&v8 viewForFirstBaselineLayout];
  }
  return v6;
}

- (id)viewForLastBaselineLayout
{
  double v3 = [(TLKView *)self contentView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v5 = [(TLKView *)self contentView];
    double v6 = [v5 viewForLastBaselineLayout];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TLKView;
    double v6 = [(TLKView *)&v8 viewForLastBaselineLayout];
  }
  return v6;
}

- (void)performBatchUpdates:(id)a3
{
  double v4 = (void (**)(void))a3;
  double v5 = [(TLKView *)self observer];
  objc_msgSend(v5, "setBatchUpdateCount:", objc_msgSend(v5, "batchUpdateCount") + 1);

  if (v4)
  {
    double v6 = [(TLKView *)self contentView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v8 = [(TLKView *)self contentView];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __31__TLKView_performBatchUpdates___block_invoke;
      v12[3] = &unk_1E5FD3328;
      id v13 = v4;
      [v8 performBatchUpdates:v12];
    }
    else
    {
      v4[2](v4);
    }
  }
  double v9 = [(TLKView *)self observer];
  objc_msgSend(v9, "setBatchUpdateCount:", objc_msgSend(v9, "batchUpdateCount") - 1);

  double v10 = [(TLKView *)self observer];
  uint64_t v11 = [v10 batchUpdateCount];

  if (!v11) {
    [(TLKView *)self propertiesDidChange];
  }
}

uint64_t __31__TLKView_performBatchUpdates___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableUnbatchedUpdates
{
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  double v2 = [(TLKView *)self contentView];
  char v3 = [v2 isLayoutSizeDependentOnPerpendicularAxis];

  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TLKView;
  [(TLKView *)&v12 layoutSubviews];
  [(TLKView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(TLKView *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(TLKView *)self contentView];
  objc_msgSend(v5, "effectiveLayoutSizeFittingSize:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = [(TLKView *)self contentView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

+ (void)enableLightKeylineStroke:(BOOL)a3 forView:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  double v6 = [v11 layer];
  double v7 = 0.0;
  if (v4)
  {
    objc_msgSend(a1, "makeContainerShadowCompatible:", v11, 0.0);
    +[TLKUtilities pixelWidthForView:v11];
    double v9 = v8 * 1.5;
    if (v9 > 1.0) {
      double v9 = 1.0;
    }
    [v6 setShadowRadius:v9];
    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    id v10 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v10, "CGColor"));

    [v6 setShadowPath:0];
    LODWORD(v7) = 1058642330;
  }
  [v6 setShadowOpacity:v7];
}

- (TLKObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->observer);
  return (TLKObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (int64_t)batchUpdateCount
{
  return self->batchUpdateCount;
}

- (void)setBatchUpdateCount:(int64_t)a3
{
  self->batchUpdateCount = a3;
}

- (UIView)leadingTextView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (TLKAppearance)tlkAppearance
{
  return self->_tlkAppearance;
}

- (void)setTlkAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkAppearance, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_leadingTextView, 0);
  objc_destroyWeak((id *)&self->observer);
}

@end