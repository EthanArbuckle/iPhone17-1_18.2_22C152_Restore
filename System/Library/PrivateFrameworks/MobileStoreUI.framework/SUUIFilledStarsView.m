@interface SUUIFilledStarsView
- (SUUIFilledStarsView)initWithFrame:(CGRect)a3;
- (id)_starImageViewWithImage:(id)a3;
- (void)_setupStars;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation SUUIFilledStarsView

- (SUUIFilledStarsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIFilledStarsView;
  v3 = -[SUUIFilledStarsView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    starViews = v3->_starViews;
    v3->_starViews = v4;

    [(SUUIFilledStarsView *)v3 _setupStars];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SUUIFilledStarsView;
  [(SUUIFilledStarsView *)&v2 dealloc];
}

- (void)layoutSubviews
{
  uint64_t v29 = *MEMORY[0x263EF8340];
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
        -[SUUIFilledStarsView addSubview:](self, "addSubview:", v9, (void)v24);
        [v9 sizeToFit];
        [v9 frame];
        CGFloat v11 = v10;
        [v9 frame];
        v30.origin.y = 0.0;
        v30.origin.x = v7;
        v30.size.width = v11;
        double MaxX = CGRectGetMaxX(v30);
        [(SUUIFilledStarsView *)self bounds];
        UIRectCenteredYInRect();
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        if ([(SUUIFilledStarsView *)self _shouldReverseLayoutDirection])
        {
          [(SUUIFilledStarsView *)self bounds];
          double v22 = v21 - v18;
          [(SUUIFilledStarsView *)self bounds];
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
  id v8 = [MEMORY[0x263F82818] configurationWithPointSize:10.0];
  v3 = [MEMORY[0x263F827E8] systemImageNamed:@"star.fill"];
  uint64_t v4 = [v3 imageWithSymbolConfiguration:v8];

  int v5 = 5;
  do
  {
    starViews = self->_starViews;
    double v7 = [(SUUIFilledStarsView *)self _starImageViewWithImage:v4];
    [(NSMutableArray *)starViews addObject:v7];

    --v5;
  }
  while (v5);
}

- (id)_starImageViewWithImage:(id)a3
{
  v3 = [a3 imageWithRenderingMode:2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v3];
  int v5 = [MEMORY[0x263F825C8] systemOrangeColor];
  [v4 setTintColor:v5];

  return v4;
}

- (void).cxx_destruct
{
}

@end