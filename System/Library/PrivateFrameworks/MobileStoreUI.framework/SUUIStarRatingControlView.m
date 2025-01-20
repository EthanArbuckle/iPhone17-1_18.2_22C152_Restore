@interface SUUIStarRatingControlView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIStarRatingControl)control;
- (SUUIStarRatingControlView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)dealloc;
- (void)didRating:(id)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setControl:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SUUIStarRatingControlView

- (SUUIStarRatingControlView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIStarRatingControlView;
  v3 = -[SUUIStarRatingControlView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUUIStarRatingControlView *)v3 setContentMode:3];
    v5 = objc_alloc_init(SUUIStarRatingControl);
    control = v4->_control;
    v4->_control = v5;

    [(SUUIStarRatingControlView *)v4 addSubview:v4->_control];
    v7 = (void *)MEMORY[0x263F827E8];
    v8 = SUUIBundle();
    uint64_t v9 = [v7 imageNamed:@"LightRateControl" inBundle:v8];
    emptyStars = v4->_emptyStars;
    v4->_emptyStars = (UIImage *)v9;

    [(SUUIStarRatingControl *)v4->_control setEmptyStarsImage:v4->_emptyStars];
    v11 = v4->_control;
    v12 = (void *)MEMORY[0x263F827E8];
    v13 = SUUIBundle();
    v14 = [v12 imageNamed:@"RateControlFilled" inBundle:v13];
    [(SUUIStarRatingControl *)v11 setFilledStarsImage:v14];

    [(SUUIStarRatingControl *)v4->_control sizeToFit];
    [(SUUIStarRatingControl *)v4->_control addTarget:v4 action:sel_didRating_ forControlEvents:64];
  }
  return v4;
}

- (void)dealloc
{
  [(SUUIStarRatingControl *)self->_control removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIStarRatingControlView;
  [(SUUIStarRatingControlView *)&v3 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = (void *)MEMORY[0x263F827E8];
  v6 = SUUIBundle();
  v7 = [v5 imageNamed:@"StarRatingControlEmpty" inBundle:v6];

  [v7 size];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
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
  [(SUUIStarRatingControl *)self->_control setUserRating:v9];
  [(SUUIStarRatingControl *)self->_control setNeedsDisplay];
  [(SUUIStarRatingControlView *)self setNeedsDisplay];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIStarRatingControlView *)self setNeedsDisplay];
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
  v5.super_class = (Class)SUUIStarRatingControlView;
  -[SUUIStarRatingControlView setEnabled:](&v5, sel_setEnabled_);
  [(SUUIStarRatingControl *)self->_control setEnabled:v3];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SUUIStarRatingControlView *)self bounds];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIImage *)self->_emptyStars size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didRating:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  viewElement = self->_viewElement;
  if (viewElement)
  {
    CGFloat v6 = @"value";
    double v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SUUIStarRatingControl userRating](self->_control, "userRating", a3));
    v7[0] = v4;
    objc_super v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(SUUIStarRatingViewElement *)viewElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v5 completionBlock:0];
  }
}

- (SUUIStarRatingControl)control
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

@end