@interface _UIKeyShortcutHUDToolbarSearchCell
- (UIColor)searchIconColor;
- (UIImageView)searchIconImageView;
- (_UIKeyShortcutHUDToolbarSearchCell)initWithFrame:(CGRect)a3;
- (id)defaultContentConfiguration;
- (void)setSearchIconColor:(id)a3;
- (void)setSearchIconImageView:(id)a3;
@end

@implementation _UIKeyShortcutHUDToolbarSearchCell

- (_UIKeyShortcutHUDToolbarSearchCell)initWithFrame:(CGRect)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCell;
  v3 = -[_UIKeyShortcutHUDCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    searchIconImageView = v3->_searchIconImageView;
    v3->_searchIconImageView = (UIImageView *)v4;

    v6 = +[_UIKeyShortcutHUDUtilities searchIcon]();
    [(UIImageView *)v3->_searchIconImageView setImage:v6];

    [(UIImageView *)v3->_searchIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3 addSubview:v3->_searchIconImageView];
    v7 = (void *)MEMORY[0x1E4F5B268];
    v8 = [(UIView *)v3->_searchIconImageView centerXAnchor];
    v9 = [(UIView *)v3 centerXAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v18[0] = v10;
    v11 = [(UIView *)v3->_searchIconImageView centerYAnchor];
    v12 = [(UIView *)v3 centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v18[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v7 activateConstraints:v14];

    v15 = [(_UIKeyShortcutHUDToolbarSearchCell *)v3 defaultContentConfiguration];
    [(UICollectionViewCell *)v3 setContentConfiguration:v15];
  }
  return v3;
}

- (UIColor)searchIconColor
{
  return [(UIView *)self->_searchIconImageView tintColor];
}

- (void)setSearchIconColor:(id)a3
{
}

- (id)defaultContentConfiguration
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCell;
  v2 = [(_UIKeyShortcutHUDCell *)&v7 defaultContentConfiguration];
  v3 = +[_UIKeyShortcutHUDUtilities searchIconAttributedString]();
  [v2 setAttributedText:v3];

  uint64_t v4 = +[UIColor clearColor];
  v5 = [v2 textProperties];
  [v5 setColor:v4];

  objc_msgSend(v2, "setDirectionalLayoutMargins:", 0.0, 7.0, 0.0, 7.0);
  return v2;
}

- (UIImageView)searchIconImageView
{
  return self->_searchIconImageView;
}

- (void)setSearchIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end