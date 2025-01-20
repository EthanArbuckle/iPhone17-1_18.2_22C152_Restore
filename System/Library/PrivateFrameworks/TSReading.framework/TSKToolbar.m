@interface TSKToolbar
- (BOOL)shadowEnabled;
- (NSString)title;
- (TSKToolbar)initWithFrame:(CGRect)a3;
- (TSKToolbarTitleView)navigationTitleView;
- (UIColor)titleColor;
- (double)leftToolbarItemsInset;
- (double)leftToolbarItemsMaximumWidth;
- (double)rightToolbarItemsInset;
- (double)rightToolbarItemsMaximumWidth;
- (id)itemWithTag:(int64_t)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setItems:(id)a3 animated:(BOOL)a4 height:(double)a5 isLeft:(BOOL)a6;
- (void)setLeftItems:(id)a3 title:(id)a4 rightItems:(id)a5 duration:(double)a6;
- (void)setLeftToolbarItemsInset:(double)a3;
- (void)setLeftToolbarItemsMaximumWidth:(double)a3;
- (void)setNavigationTitleView:(id)a3;
- (void)setRightToolbarItemsInset:(double)a3;
- (void)setRightToolbarItemsMaximumWidth:(double)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation TSKToolbar

- (TSKToolbar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKToolbar;
  v3 = -[TSKToolbar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UINavigationItem *)objc_alloc_init(MEMORY[0x263F1C800]);
    v3->_navigationItem = v4;
    [(TSKToolbar *)v3 pushNavigationItem:v4 animated:0];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKToolbar;
  [(TSKToolbar *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TSKToolbar;
  [(TSKToolbar *)&v8 layoutSubviews];
  if (self->_shadowLayer)
  {
    [(TSKToolbar *)self bounds];
    CGFloat x = v9.origin.x;
    CGFloat y = v9.origin.y;
    CGFloat width = v9.size.width;
    CGFloat height = v9.size.height;
    double v7 = CGRectGetHeight(v9);
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    -[CALayer setFrame:](self->_shadowLayer, "setFrame:", 0.0, v7, CGRectGetWidth(v10), 2.0);
  }
}

- (id)itemWithTag:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v4 = (void *)[(TSKToolbar *)self subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        CGRect v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          CGRect v10 = objc_msgSend(v9, "subviews", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
LABEL_9:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
              if ([v15 tag] == a3) {
                break;
              }
              if (v12 == ++v14)
              {
                uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
                if (v12) {
                  goto LABEL_9;
                }
                goto LABEL_17;
              }
            }
            if (v15) {
              return v15;
            }
          }
        }
LABEL_17:
        ;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  return 0;
}

- (void)setLeftItems:(id)a3 title:(id)a4 rightItems:(id)a5 duration:(double)a6
{
  [(TSKToolbar *)self setTitle:a4];
  BOOL v10 = a6 > 0.0;
  [(TSKToolbar *)self bounds];
  double v12 = v11;
  [(TSKToolbar *)self setItems:a3 animated:v10 height:1 isLeft:v11];

  [(TSKToolbar *)self setItems:a5 animated:v10 height:0 isLeft:v12];
}

- (void)setItems:(id)a3 animated:(BOOL)a4 height:(double)a5 isLeft:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  v18[2] = *MEMORY[0x263EF8340];
  if (![a3 count])
  {
    id v9 = 0;
    if (!v6) {
      goto LABEL_17;
    }
LABEL_6:
    [(UINavigationItem *)self->_navigationItem setLeftBarButtonItems:v9 animated:v8];
    return;
  }
  [v9 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6) {
      [(TSKToolbar *)self leftToolbarItemsMaximumWidth];
    }
    else {
      [(TSKToolbar *)self rightToolbarItemsMaximumWidth];
    }
    double v12 = [[TSKToolbarButtonCollectionView alloc] initWithHeight:v9 items:a5 maximumWidth:v11];
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v12];
    if (v6) {
      [(TSKToolbar *)self leftToolbarItemsInset];
    }
    else {
      [(TSKToolbar *)self rightToolbarItemsInset];
    }
    double v15 = v14;
    if (v14 == 0.0)
    {
      long long v17 = v13;
      id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    }
    else
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
      [v16 setWidth:v15];
      v18[0] = v16;
      v18[1] = v13;
      id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    }
    if (!v6) {
      goto LABEL_17;
    }
    goto LABEL_6;
  }
  if (v6) {
    goto LABEL_6;
  }
  id v9 = (id)objc_msgSend(v9, "tsu_arrayByReversingOrder");
LABEL_17:
  [(UINavigationItem *)self->_navigationItem setRightBarButtonItems:v9 animated:v8];
}

- (NSString)title
{
  if (self->_navigationTitleView) {
    navigationTitleView = self->_navigationTitleView;
  }
  else {
    navigationTitleView = self->_navigationItem;
  }
  return (NSString *)[navigationTitleView title];
}

- (void)setTitle:(id)a3
{
  navigationTitleView = self->_navigationTitleView;
  if (navigationTitleView) {
    [(TSKToolbarTitleView *)navigationTitleView setTitle:a3];
  }
  else {
    [(UINavigationItem *)self->_navigationItem setTitle:a3];
  }
  uint64_t v5 = self->_navigationTitleView;
  navigationItem = self->_navigationItem;

  [(UINavigationItem *)navigationItem setTitleView:v5];
}

- (UIColor)titleColor
{
  v2 = (void *)[(TSKToolbar *)self titleTextAttributes];
  uint64_t v3 = *MEMORY[0x263F1C240];

  return (UIColor *)[v2 objectForKey:v3];
}

- (void)setTitleColor:(id)a3
{
  id v3 = a3;
  v6[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x263F1C240];
    v6[0] = a3;
    a3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  [(TSKToolbar *)self setTitleTextAttributes:a3];
  [(TSKToolbarTitleView *)self->_navigationTitleView setTitleColor:v3];
}

- (void)setNavigationTitleView:(id)a3
{
  if (self->_navigationTitleView != a3)
  {
    id v6 = (id)[(NSString *)[(TSKToolbar *)self title] copy];

    uint64_t v5 = (TSKToolbarTitleView *)a3;
    self->_navigationTitleView = v5;
    [(TSKToolbarTitleView *)v5 setTitle:v6];
    [(TSKToolbarTitleView *)self->_navigationTitleView setTitleColor:[(TSKToolbar *)self titleColor]];
  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    shadowLayer = self->_shadowLayer;
    if (a3)
    {
      if (!shadowLayer)
      {
        self->_shadowLayer = (CALayer *)+[TSKToolbarShadowLayer layer];
        objc_msgSend((id)-[TSKToolbar layer](self, "layer"), "addSublayer:", self->_shadowLayer);
        uint64_t v5 = self->_shadowLayer;
        [(CALayer *)v5 setNeedsDisplay];
      }
    }
    else
    {
      [(CALayer *)shadowLayer removeFromSuperlayer];
      self->_shadowLayer = 0;
    }
  }
}

- (TSKToolbarTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (BOOL)shadowEnabled
{
  return self->_shadowEnabled;
}

- (double)leftToolbarItemsInset
{
  return self->_leftToolbarItemsInset;
}

- (void)setLeftToolbarItemsInset:(double)a3
{
  self->_leftToolbarItemsInset = a3;
}

- (double)rightToolbarItemsInset
{
  return self->_rightToolbarItemsInset;
}

- (void)setRightToolbarItemsInset:(double)a3
{
  self->_rightToolbarItemsInset = a3;
}

- (double)leftToolbarItemsMaximumWidth
{
  return self->_leftToolbarItemsMaximumWidth;
}

- (void)setLeftToolbarItemsMaximumWidth:(double)a3
{
  self->_leftToolbarItemsMaximumWidth = a3;
}

- (double)rightToolbarItemsMaximumWidth
{
  return self->_rightToolbarItemsMaximumWidth;
}

- (void)setRightToolbarItemsMaximumWidth:(double)a3
{
  self->_rightToolbarItemsMaximumWidth = a3;
}

@end