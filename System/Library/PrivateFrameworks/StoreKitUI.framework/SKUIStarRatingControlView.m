@interface SKUIStarRatingControlView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIStarRatingControl)control;
- (SKUIStarRatingControlView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)dealloc;
- (void)didRating:(id)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setControl:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SKUIStarRatingControlView

- (SKUIStarRatingControlView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIStarRatingControlView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIStarRatingControlView;
  v16 = -[SKUIStarRatingControlView initWithFrame:](&v29, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    [(SKUIStarRatingControlView *)v16 setContentMode:3];
    v18 = objc_alloc_init(SKUIStarRatingControl);
    control = v17->_control;
    v17->_control = v18;

    [(SKUIStarRatingControlView *)v17 addSubview:v17->_control];
    v20 = (void *)MEMORY[0x1E4FB1818];
    v21 = SKUIBundle();
    uint64_t v22 = [v20 imageNamed:@"LightRateControl" inBundle:v21];
    emptyStars = v17->_emptyStars;
    v17->_emptyStars = (UIImage *)v22;

    [(SKUIStarRatingControl *)v17->_control setEmptyStarsImage:v17->_emptyStars];
    v24 = v17->_control;
    v25 = (void *)MEMORY[0x1E4FB1818];
    v26 = SKUIBundle();
    v27 = [v25 imageNamed:@"RateControlFilled" inBundle:v26];
    [(SKUIStarRatingControl *)v24 setFilledStarsImage:v27];

    [(SKUIStarRatingControl *)v17->_control sizeToFit];
    [(SKUIStarRatingControl *)v17->_control addTarget:v17 action:sel_didRating_ forControlEvents:64];
  }
  return v17;
}

- (void)dealloc
{
  [(SKUIStarRatingControl *)self->_control removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIStarRatingControlView;
  [(SKUIStarRatingControlView *)&v3 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIStarRatingControlView prefetchResourcesForViewElement:reason:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIStarRatingControlView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v5) {
      +[SKUIStarRatingControlView requestLayoutForViewElement:width:context:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIStarRatingControlView sizeThatFitsWidth:viewElement:context:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  double v13 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v14 = SKUIBundle();
  uint64_t v15 = [v13 imageNamed:@"StarRatingControlEmpty" inBundle:v14];

  [v15 size];
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  [v10 ratingValue];
  if (v7 <= 0.0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v10 ratingValue];
    uint64_t v9 = (uint64_t)(v8 * 5.0);
  }
  [(SKUIStarRatingControl *)self->_control setUserRating:v9];
  [(SKUIStarRatingControl *)self->_control setNeedsDisplay];
  [(SKUIStarRatingControlView *)self setNeedsDisplay];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIStarRatingControlView *)self setNeedsDisplay];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIStarRatingControlView;
  -[SKUIStarRatingControlView setEnabled:](&v5, sel_setEnabled_);
  [(SKUIStarRatingControl *)self->_control setEnabled:v3];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SKUIStarRatingControlView *)self bounds];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImage *)self->_emptyStars size];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)didRating:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  viewElement = self->_viewElement;
  if (viewElement)
  {
    CGFloat v6 = @"value";
    double v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKUIStarRatingControl userRating](self->_control, "userRating", a3));
    v7[0] = v4;
    objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(SKUIStarRatingViewElement *)viewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v5 completionBlock:0];
  }
}

- (SKUIStarRatingControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);

  objc_storeStrong((id *)&self->_emptyStars, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end