@interface UIPreviewMenuItem
+ (id)_itemWithTitle:(id)a3 color:(id)a4 image:(id)a5 handler:(id)a6;
+ (id)_itemWithTitle:(id)a3 style:(int64_t)a4 image:(id)a5 handler:(id)a6;
+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 items:(id)a5;
+ (id)itemWithViewControllerPreviewAction:(id)a3;
- (NSArray)_subitems;
- (NSString)identifier;
- (NSString)title;
- (UIColor)_color;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (int64_t)style;
- (void)_setColor:(id)a3;
- (void)_setSubitems:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIPreviewMenuItem

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setStyle:a4];
  [v10 setTitle:v9];

  [v10 setHandler:v8];
  return v10;
}

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4 items:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setStyle:a4];
  [v10 setTitle:v9];

  [v10 _setSubitems:v8];
  return v10;
}

+ (id)_itemWithTitle:(id)a3 style:(int64_t)a4 image:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  [v13 setStyle:a4];
  [v13 setTitle:v12];

  [v13 setHandler:v10];
  [v13 setImage:v11];

  return v13;
}

+ (id)_itemWithTitle:(id)a3 color:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)a1);
  [v14 setTitle:v13];

  [v14 setStyle:0];
  [v14 setHandler:v10];

  [v14 _setColor:v12];
  [v14 setImage:v11];

  return v14;
}

+ (id)itemWithViewControllerPreviewAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__UIPreviewMenuItem_itemWithViewControllerPreviewAction___block_invoke;
  v9[3] = &unk_1E52E9370;
  id v10 = v4;
  id v6 = v4;
  v7 = [a1 itemWithTitle:v5 style:0 handler:v9];

  return v7;
}

void __57__UIPreviewMenuItem_itemWithViewControllerPreviewAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [*(id *)(a1 + 32) handler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) handler];
    ((void (**)(void, void, id))v5)[2](v5, *(void *)(a1 + 32), v6);
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (a3 == 2)
    {
      id v5 = +[UIColor systemRedColor];
      -[UIPreviewMenuItem _setColor:](self, "_setColor:");
    }
    else
    {
      [(UIPreviewMenuItem *)self _setColor:0];
      if (a3 != 1) {
        return;
      }
      _UIImageWithName(@"UIPreviewMenuItemCheckmark.png");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPreviewMenuItem setImage:](self, "setImage:");
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(UIPreviewMenuItem *)self title];
  [v4 setTitle:v5];

  objc_msgSend(v4, "setStyle:", -[UIPreviewMenuItem style](self, "style"));
  id v6 = [(UIPreviewMenuItem *)self handler];
  [v4 setHandler:v6];

  v7 = [(UIPreviewMenuItem *)self identifier];
  [v4 setIdentifier:v7];

  id v8 = [(UIPreviewMenuItem *)self _color];
  [v4 _setColor:v8];

  id v9 = [(UIPreviewMenuItem *)self _subitems];
  [v4 _setSubitems:v9];

  return v4;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)_subitems
{
  return self->__subitems;
}

- (void)_setSubitems:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)_color
{
  return self->_color;
}

- (void)_setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->__subitems, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end