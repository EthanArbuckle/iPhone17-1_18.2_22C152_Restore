@interface _UICollectionViewListDetailAccessoryButton
- (UIColor)accessoryBackgroundColor;
- (UIColor)accessoryTintColor;
- (UITableConstants)constants;
- (_UICollectionViewListDetailAccessoryButton)initWithConstants:(id)a3;
- (id)_renderedImage;
- (id)actionHandler;
- (int64_t)type;
- (void)_executeActionHandler;
- (void)setAccessoryBackgroundColor:(id)a3;
- (void)setAccessoryTintColor:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setConstants:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateConfiguration;
@end

@implementation _UICollectionViewListDetailAccessoryButton

- (_UICollectionViewListDetailAccessoryButton)initWithConstants:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
  v6 = -[UIButton initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_constants, a3);
    v8 = +[UIButtonConfiguration filledButtonConfiguration];
    [v8 setButtonSize:1];
    v9 = [v5 defaultDetailAccessoryImage];
    [v8 setImage:v9];

    [(UIButton *)v7 setConfiguration:v8];
  }

  return v7;
}

- (void)setActionHandler:(id)a3
{
  id actionHandler = self->_actionHandler;
  v6 = (void *)[a3 copy];
  id v7 = self->_actionHandler;
  self->_id actionHandler = v6;

  if (!a3 || actionHandler)
  {
    if (!a3 && actionHandler)
    {
      [(UIControl *)self removeTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
    }
  }
  else
  {
    [(UIControl *)self addTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
  }
}

- (void)_executeActionHandler
{
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_accessoryTintColor != v5)
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
    [(UIButton *)&v6 setTintColor:v5];
  }
}

- (void)setAccessoryBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_accessoryBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_accessoryBackgroundColor, a3);
    v6.receiver = self;
    v6.super_class = (Class)_UICollectionViewListDetailAccessoryButton;
    [(UIView *)&v6 setBackgroundColor:v5];
  }
}

- (id)_renderedImage
{
  v2 = [(UIButton *)self configuration];
  v3 = [v2 image];

  return v3;
}

- (void)setConstants:(id)a3
{
  id v5 = (UITableConstants *)a3;
  if (self->_constants != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_constants, a3);
    [(UIButton *)self setNeedsUpdateConfiguration];
    id v5 = v6;
  }
}

- (void)updateConfiguration
{
  id v4 = [(UIButton *)self configuration];
  v3 = [(UITableConstants *)self->_constants defaultDetailAccessoryImage];
  [v4 setImage:v3];

  [(UIButton *)self setConfiguration:v4];
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_constants, 0);
}

@end