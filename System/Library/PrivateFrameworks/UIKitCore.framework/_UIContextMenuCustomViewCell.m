@interface _UIContextMenuCustomViewCell
+ (Class)_contentViewClass;
- (UIView)customContentView;
- (_UIContextMenuCustomViewCell)initWithFrame:(CGRect)a3;
- (id)actionView;
- (void)setCustomContentView:(id)a3;
@end

@implementation _UIContextMenuCustomViewCell

- (_UIContextMenuCustomViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuCustomViewCell;
  v3 = -[_UIContextMenuCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UICollectionViewCell *)v3 _setFocusStyle:0];
    v5 = [(UICollectionViewCell *)v4 contentView];
    v6 = [v5 heightAnchor];
    v7 = [v6 constraintGreaterThanOrEqualToConstant:1.0];
    [v7 setActive:1];
  }
  return v4;
}

+ (Class)_contentViewClass
{
  return +[UICollectionViewCell _contentViewClass];
}

- (id)actionView
{
  return 0;
}

- (void)setCustomContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_customContentView = &self->_customContentView;
  customContentView = self->_customContentView;
  if (customContentView != v5)
  {
    v11 = v5;
    [(UIView *)customContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_customContentView, a3);
    v8 = [(UICollectionViewCell *)self contentView];
    objc_super v9 = v8;
    if (v8)
    {
      v10 = *p_customContentView;
      [v8 addSubview:v10];
      [v9 _addBoundsMatchingConstraintsForView:v10];
    }

    v5 = v11;
  }
}

- (UIView)customContentView
{
  return self->_customContentView;
}

- (void).cxx_destruct
{
}

@end