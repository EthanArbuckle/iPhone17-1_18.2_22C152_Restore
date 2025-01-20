@interface _UITableCellAccessoryButton
- (UIColor)accessoryTintColor;
- (_UITableCellAccessoryButton)initWithFrame:(CGRect)a3 backgroundImageProvider:(id)a4 accessoryType:(int64_t)a5;
- (id)_backgroundImageView;
- (id)backgroundImageProvider;
- (int64_t)accessoryType;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_reloadBackgroundImage;
- (void)setAccessoryTintColor:(id)a3;
- (void)setBackgroundImageProvider:(id)a3;
@end

@implementation _UITableCellAccessoryButton

- (void)setAccessoryTintColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(_UITableCellAccessoryButton *)self _reloadBackgroundImage];
  }
}

- (void)_reloadBackgroundImage
{
  v3 = [(_UITableCellAccessoryButton *)self backgroundImageProvider];
  ((void (**)(void, UIColor *))v3)[2](v3, self->_accessoryTintColor);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(UIButton *)self setBackgroundImage:v4 forStates:0];
}

- (id)backgroundImageProvider
{
  return self->_backgroundImageProvider;
}

- (_UITableCellAccessoryButton)initWithFrame:(CGRect)a3 backgroundImageProvider:(id)a4 accessoryType:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UITableCellAccessoryButton;
  v13 = -[UIButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    if (!v12)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v13, @"UICollectionTableSharedSupport.m", 467, @"Invalid parameter not satisfying: %@", @"backgroundImageProvider != NULL" object file lineNumber description];
    }
    [(_UITableCellAccessoryButton *)v13 setBackgroundImageProvider:v12];
    [(UIView *)v13 setOpaque:0];
    [(UIView *)v13 setUserInteractionEnabled:0];
    v13->_accessoryType = a5;
    [(_UITableCellAccessoryButton *)v13 _reloadBackgroundImage];
  }

  return v13;
}

- (void)setBackgroundImageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundImageProvider, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UITableCellAccessoryButton;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(_UITableCellAccessoryButton *)self _reloadBackgroundImage];
}

- (id)_backgroundImageView
{
  v2 = [(UIButton *)self _backgroundView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

@end