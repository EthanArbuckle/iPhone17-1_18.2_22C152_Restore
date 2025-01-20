@interface UIPreviewActionGroup
+ (UIPreviewActionGroup)actionGroupWithTitle:(NSString *)title style:(UIPreviewActionStyle)style actions:(NSArray *)actions;
+ (id)_actionGroupWithPreviewMenuItemWithSubactions:(id)a3;
+ (id)_actionGroupWithTitle:(id)a3 style:(int64_t)a4 color:(id)a5 actions:(id)a6;
- (NSArray)_actions;
- (NSString)identifier;
- (NSString)title;
- (UIColor)_color;
- (UIImage)image;
- (id)_effectiveColor;
- (id)_effectiveImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (void)_setActions:(id)a3;
- (void)_setColor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIPreviewActionGroup

+ (UIPreviewActionGroup)actionGroupWithTitle:(NSString *)title style:(UIPreviewActionStyle)style actions:(NSArray *)actions
{
  v8 = actions;
  v9 = title;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setTitle:v9];

  [v10 setStyle:style];
  [v10 _setActions:v8];

  return (UIPreviewActionGroup *)v10;
}

+ (id)_actionGroupWithTitle:(id)a3 style:(int64_t)a4 color:(id)a5 actions:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)a1);
  [v13 setTitle:v12];

  [v13 setStyle:a4];
  [v13 _setColor:v11];

  [v13 _setActions:v10];
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UIPreviewActionGroup *)self title];
  [v4 setTitle:v5];

  objc_msgSend(v4, "setStyle:", -[UIPreviewActionGroup style](self, "style"));
  v6 = [(UIPreviewActionGroup *)self identifier];
  [v4 setIdentifier:v6];

  v7 = [(UIPreviewActionGroup *)self _color];
  [v4 _setColor:v7];

  v8 = [(UIPreviewActionGroup *)self _actions];
  [v4 _setActions:v8];

  v9 = [(UIPreviewActionGroup *)self image];
  [v4 setImage:v9];

  return v4;
}

- (id)_effectiveColor
{
  v3 = [(UIPreviewActionGroup *)self _color];
  if (!v3)
  {
    if ([(UIPreviewActionGroup *)self style] == 2)
    {
      v3 = +[UIColor systemRedColor];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_effectiveImage
{
  v3 = [(UIPreviewActionGroup *)self image];
  if (!v3)
  {
    if ([(UIPreviewActionGroup *)self style] == 1)
    {
      v3 = +[UIPreviewAction _checkmarkImage];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (id)_actionGroupWithPreviewMenuItemWithSubactions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 title];
  [v5 setTitle:v6];

  objc_msgSend(v5, "setStyle:", objc_msgSend(v4, "style"));
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v22 = v4;
  v8 = [v4 _subitems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v14 = [v13 _subitems];
        if (v14
          && (v15 = (void *)v14,
              [v13 _subitems],
              v16 = objc_claimAutoreleasedReturnValue(),
              uint64_t v17 = [v16 count],
              v16,
              v15,
              v17))
        {
          uint64_t v18 = +[UIPreviewActionGroup _actionGroupWithPreviewMenuItemWithSubactions:v13];
        }
        else
        {
          uint64_t v18 = +[UIPreviewAction _actionWithPreviewMenuItem:v13];
        }
        v19 = (void *)v18;
        [v7 addObject:v18];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  v20 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
  [v5 _setActions:v20];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIColor)_color
{
  return self->_color;
}

- (void)_setColor:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)_actions
{
  return self->_actions;
}

- (void)_setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end