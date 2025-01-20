@interface SUReviewsButton
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (NSString)userRatingCountString;
- (SUReviewsButton)initWithFrame:(CGRect)a3;
- (float)userRating;
- (int64_t)userRatingCount;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadView;
- (void)setUserRating:(float)a3;
- (void)setUserRatingCount:(int64_t)a3;
- (void)setUserRatingCountString:(id)a3;
@end

@implementation SUReviewsButton

- (SUReviewsButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUReviewsButton;
  v3 = -[SUGradientButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SUReviewsButton *)v3 setAdjustsImageWhenDisabled:0];
    [(SUReviewsButton *)v4 setAdjustsImageWhenHighlighted:0];
    [(SUReviewsButton *)v4 setContentHorizontalAlignment:1];
    objc_msgSend((id)-[SUReviewsButton titleLabel](v4, "titleLabel"), "setLineBreakMode:", 4);
    [(SUReviewsButton *)v4 contentEdgeInsets];
    -[SUReviewsButton setContentEdgeInsets:](v4, "setContentEdgeInsets:");
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    uint64_t TableNext = UIImageGetTableNext();
    uint64_t v7 = [v5 initWithImage:TableNext highlightedImage:UIImageGetTableNextSelected()];
    v4->_disclosureView = (UIImageView *)v7;
    [(SUReviewsButton *)v4 addSubview:v7];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUReviewsButton;
  [(SUReviewsButton *)&v3 dealloc];
}

- (void)reloadView
{
  objc_super v3 = [(SUReviewsButton *)self userRatingCountString];
  if (![(NSString *)v3 length])
  {

    objc_super v3 = (NSString *)SUCopyLocalizedReviewsStringForCount(self->_userRatingCount, 1);
  }
  [(SUReviewsButton *)self setTitle:v3 forState:0];

  if (self->_userRatingCount)
  {
    float userRating = self->_userRating;
    uint64_t v5 = [MEMORY[0x263F1C550] clearColor];
    *(float *)&double v6 = userRating;
    id v7 = +[SUUserRatingView copyImageForRating:v5 backgroundColor:1 style:v6];
    [(SUReviewsButton *)self setImage:v7 forState:0];
  }
  else
  {
    [(SUReviewsButton *)self setImage:0 forState:0];
  }
}

- (void)setUserRating:(float)a3
{
  self->_float userRating = a3;
  [(SUReviewsButton *)self reloadView];
}

- (void)setUserRatingCount:(int64_t)a3
{
  self->_userRatingCount = a3;
  [(SUReviewsButton *)self reloadView];
}

- (void)setUserRatingCountString:(id)a3
{
  userRatingCountString = self->_userRatingCountString;
  if (userRatingCountString != a3)
  {

    self->_userRatingCountString = (NSString *)a3;
    [(SUReviewsButton *)self reloadView];
  }
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton contentRectForBounds:](&v24, sel_contentRectForBounds_);
  double v9 = v8;
  double v23 = v10;
  double v12 = v11;
  double v14 = v13;
  [(SUReviewsButton *)self contentEdgeInsets];
  double v16 = v15;
  if ([(SUReviewsButton *)self titleForState:0]
    && [(SUReviewsButton *)self imageForState:0])
  {
    double v12 = v12 + 10.0;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v17 = CGRectGetMaxX(v25) - v16;
  [(UIImageView *)self->_disclosureView frame];
  if (v12 >= v17 - v18 + -10.0 - v9) {
    double v19 = v17 - v18 + -10.0 - v9;
  }
  else {
    double v19 = v12;
  }
  double v20 = v9;
  double v21 = v23;
  double v22 = v14;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)layoutSubviews
{
  if (self->_disclosureView)
  {
    [(SUReviewsButton *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(SUReviewsButton *)self contentEdgeInsets];
    double v12 = v11;
    [(UIImageView *)self->_disclosureView frame];
    double v14 = v13;
    double v16 = v15;
    v20.origin.CGFloat x = v4;
    v20.origin.CGFloat y = v6;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v10;
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", CGRectGetMaxX(v20) - v12 - v14, 17.0, v14, v16);
    disclosureView = self->_disclosureView;
    if ([(SUReviewsButton *)self isHighlighted]) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = [(SUReviewsButton *)self isSelected];
    }
    [(UIImageView *)disclosureView setHighlighted:v18];
  }
  v19.receiver = self;
  v19.super_class = (Class)SUReviewsButton;
  [(SUReviewsButton *)&v19 layoutSubviews];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton imageRectForContentRect:](&v24, sel_imageRectForContentRect_);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v23.receiver = self;
  v23.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton titleRectForContentRect:](&v23, sel_titleRectForContentRect_, x, y, width, height);
  double v15 = x + v14 + 10.0;
  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double v16 = CGRectGetMaxX(v25) - v11;
  if (v15 >= v16) {
    double v17 = v16;
  }
  else {
    double v17 = v15;
  }
  +[SUUserRatingView reflectionHeight];
  *(float *)&double v18 = v18 * 0.5;
  double v19 = v9 + floorf(*(float *)&v18);
  double v20 = v17;
  double v21 = v11;
  double v22 = v13;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v19;
  result.origin.double x = v20;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)SUReviewsButton;
  -[SUReviewsButton titleRectForContentRect:](&v8, sel_titleRectForContentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = x;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.CGFloat x = v7;
  return result;
}

- (float)userRating
{
  return self->_userRating;
}

- (int64_t)userRatingCount
{
  return self->_userRatingCount;
}

- (NSString)userRatingCountString
{
  return self->_userRatingCountString;
}

@end