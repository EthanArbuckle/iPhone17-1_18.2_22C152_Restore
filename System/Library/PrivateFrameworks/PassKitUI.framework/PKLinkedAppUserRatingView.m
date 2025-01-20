@interface PKLinkedAppUserRatingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKLinkedAppUserRatingView)initWithFrame:(CGRect)a3;
- (float)userRating;
- (id)_starImageViewWithImage:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setUserRating:(float)a3;
@end

@implementation PKLinkedAppUserRatingView

- (PKLinkedAppUserRatingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKLinkedAppUserRatingView;
  v3 = -[PKLinkedAppUserRatingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    starViews = v3->_starViews;
    v3->_starViews = v4;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKLinkedAppUserRatingView;
  [(PKLinkedAppUserRatingView *)&v2 dealloc];
}

- (void)setUserRating:(float)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  float v5 = 5.0;
  if (a3 <= 5.0) {
    float v5 = a3;
  }
  self->_float userRating = v5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v6 = self->_starViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "removeFromSuperview", (void)v30);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_starViews removeAllObjects];
  float userRating = self->_userRating;
  int v12 = vcvtms_s32_f32(userRating);
  int v13 = vcvtps_s32_f32(a3 - (float)(int)floorf(userRating));
  v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:10.0];
  if (v12)
  {
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
    v16 = [v15 imageWithSymbolConfiguration:v14];

    if (v12 < 1)
    {
      int v12 = 0;
    }
    else
    {
      int v17 = v12;
      do
      {
        starViews = self->_starViews;
        v19 = -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v16, (void)v30);
        [(NSMutableArray *)starViews addObject:v19];

        --v17;
      }
      while (v17);
    }
  }
  if (v13)
  {
    v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.leadinghalf.fill"];
    v21 = [v20 imageWithSymbolConfiguration:v14];

    if (v13 >= 1)
    {
      int v22 = v13;
      do
      {
        v23 = self->_starViews;
        v24 = -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v21, (void)v30);
        [(NSMutableArray *)v23 addObject:v24];

        --v22;
      }
      while (v22);
      v12 += v13;
    }
  }
  if (v12 != 5)
  {
    v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
    v26 = [v25 imageWithSymbolConfiguration:v14];

    if (v12 <= 4)
    {
      if (5 - v12 <= 1) {
        int v27 = 1;
      }
      else {
        int v27 = 5 - v12;
      }
      do
      {
        v28 = self->_starViews;
        v29 = -[PKLinkedAppUserRatingView _starImageViewWithImage:](self, "_starImageViewWithImage:", v26, (void)v30);
        [(NSMutableArray *)v28 addObject:v29];

        --v27;
      }
      while (v27);
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = self->_starViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        -[PKLinkedAppUserRatingView addSubview:](self, "addSubview:", v9, (void)v24);
        [v9 sizeToFit];
        [v9 frame];
        CGFloat v11 = v10;
        [v9 frame];
        v30.origin.y = 0.0;
        v30.origin.x = v7;
        v30.size.width = v11;
        double MaxX = CGRectGetMaxX(v30);
        [(PKLinkedAppUserRatingView *)self bounds];
        UIRectCenteredYInRect();
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        if ([(PKLinkedAppUserRatingView *)self _shouldReverseLayoutDirection])
        {
          [(PKLinkedAppUserRatingView *)self bounds];
          double v22 = v21 - v18;
          [(PKLinkedAppUserRatingView *)self bounds];
          double v14 = v22 - (v14 - v23);
        }
        double v7 = MaxX + 1.0;
        objc_msgSend(v9, "setFrame:", v14, v16, v18, v20);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(NSMutableArray *)self->_starViews lastObject];
  uint64_t v4 = v3;
  if (v3) {
    [v3 frame];
  }
  else {
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  double v6 = v5 * 5.0;

  double v7 = 15.0;
  double v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (id)_starImageViewWithImage:(id)a3
{
  v3 = [a3 imageWithRenderingMode:2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
  double v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v4 setTintColor:v5];

  return v4;
}

- (float)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
}

@end