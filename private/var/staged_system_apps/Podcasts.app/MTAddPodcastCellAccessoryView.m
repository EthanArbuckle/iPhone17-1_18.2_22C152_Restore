@interface MTAddPodcastCellAccessoryView
- (BOOL)isAdded;
- (BOOL)isEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAddPodcastCellAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAdded:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MTAddPodcastCellAccessoryView

- (MTAddPodcastCellAccessoryView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MTAddPodcastCellAccessoryView;
  v3 = -[MTAddPodcastCellAccessoryView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(UIButton *)v3->_button setAdjustsImageWhenDisabled:1];
    [(UIButton *)v3->_button setAdjustsImageWhenHighlighted:0];
    [(UIButton *)v3->_button setShowsTouchWhenHighlighted:0];
    [(UIButton *)v3->_button setUserInteractionEnabled:0];
    v6 = v3->_button;
    v7 = +[UIImage multiUncheckIcon];
    [(UIButton *)v6 setImage:v7 forState:0];

    [(MTAddPodcastCellAccessoryView *)v3 addSubview:v3->_button];
    v8 = v3;
  }

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTAddPodcastCellAccessoryView;
  [(MTAddPodcastCellAccessoryView *)&v4 layoutSubviews];
  button = self->_button;
  [(MTAddPodcastCellAccessoryView *)self bounds];
  -[UIButton setFrame:](button, "setFrame:");
}

- (void)setAdded:(BOOL)a3
{
  if (self->_added != a3)
  {
    self->_added = a3;
    button = self->_button;
    if (a3) {
      +[UIImage multiCheckIcon];
    }
    else {
    id v4 = +[UIImage multiUncheckIcon];
    }
    [(UIButton *)button setImage:v4 forState:0];
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[UIButton setEnabled:](self->_button, "setEnabled:");
}

- (BOOL)isAdded
{
  return self->_added;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end