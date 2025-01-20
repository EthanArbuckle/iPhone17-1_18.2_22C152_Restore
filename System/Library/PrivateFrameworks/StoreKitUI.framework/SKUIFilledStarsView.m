@interface SKUIFilledStarsView
- (SKUIFilledStarsView)initWithFrame:(CGRect)a3;
- (id)_starImageViewWithImage:(id)a3;
- (void)_setupStars;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SKUIFilledStarsView

- (SKUIFilledStarsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIFilledStarsView;
  v3 = -[SKUIFilledStarsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    starViews = v3->_starViews;
    v3->_starViews = v4;

    [(SKUIFilledStarsView *)v3 _setupStars];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SKUIFilledStarsView;
  [(SKUIFilledStarsView *)&v2 dealloc];
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
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        -[SKUIFilledStarsView addSubview:](self, "addSubview:", v9, (void)v24);
        [v9 sizeToFit];
        [v9 frame];
        CGFloat v11 = v10;
        [v9 frame];
        v30.origin.y = 0.0;
        v30.origin.x = v7;
        v30.size.width = v11;
        double MaxX = CGRectGetMaxX(v30);
        [(SKUIFilledStarsView *)self bounds];
        UIRectCenteredYInRect();
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        if ([(SKUIFilledStarsView *)self _shouldReverseLayoutDirection])
        {
          [(SKUIFilledStarsView *)self bounds];
          double v22 = v21 - v18;
          [(SKUIFilledStarsView *)self bounds];
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

- (void)_setupStars
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:10.0 newValue:14.0];
  objc_msgSend(v3, "configurationWithPointSize:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
  uint64_t v5 = [v4 imageWithSymbolConfiguration:v9];

  int v6 = 5;
  do
  {
    starViews = self->_starViews;
    v8 = [(SKUIFilledStarsView *)self _starImageViewWithImage:v5];
    [(NSMutableArray *)starViews addObject:v8];

    --v6;
  }
  while (v6);
}

- (id)_starImageViewWithImage:(id)a3
{
  v3 = [a3 imageWithRenderingMode:2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v4 setTintColor:v5];

  return v4;
}

- (void).cxx_destruct
{
}

@end