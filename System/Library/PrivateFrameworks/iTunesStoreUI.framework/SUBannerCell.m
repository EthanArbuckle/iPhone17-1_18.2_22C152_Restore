@interface SUBannerCell
- (SUBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_newButton;
- (void)_buttonAction:(id)a3;
- (void)_reloadButtons;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SUBannerCell

- (SUBannerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUBannerCell;
  v4 = [(SUTableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(SUTableCellContentView *)v4->super._configurationView removeFromSuperview];
  }
  return v5;
}

- (void)dealloc
{
  if ((SUBannerCell *)[(SUCellConfiguration *)[(SUTableCell *)self configuration] view] == self) {
    [(SUCellConfiguration *)[(SUTableCell *)self configuration] setView:0];
  }
  [(UIButton *)self->_leftButton removeTarget:self action:sel__buttonAction_ forControlEvents:64];
  [(UIButton *)self->_leftButton removeFromSuperview];

  self->_leftButton = 0;
  [(UIButton *)self->_rightButton removeTarget:self action:sel__buttonAction_ forControlEvents:64];
  [(UIButton *)self->_rightButton removeFromSuperview];

  self->_rightButton = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUBannerCell;
  [(SUTableCell *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUBannerCell;
  [(SUTableCell *)&v9 layoutSubviews];
  objc_super v3 = [(SUTableCell *)self configuration];
  if (v3)
  {
    v4 = v3;
    objc_msgSend((id)-[SUBannerCell contentView](self, "contentView"), "bounds");
    -[SUCellConfiguration setLayoutSize:](v4, "setLayoutSize:", v5, v6);
    if (![(UIButton *)self->_leftButton backgroundImageForState:0]
      || ![(UIButton *)self->_rightButton backgroundImageForState:0])
    {
      [(SUCellConfiguration *)v4 reloadImages];
    }
    [(SUCellConfiguration *)v4 reloadLayoutInformation];
    [(UIButton *)self->_leftButton setBackgroundImage:[(SUCellConfiguration *)v4 imageAtIndex:0 withModifiers:0] forState:0];
    leftButton = self->_leftButton;
    [(SUCellConfiguration *)v4 frameForImageAtIndex:0];
    -[UIButton setFrame:](leftButton, "setFrame:");
    [(UIButton *)self->_rightButton setBackgroundImage:[(SUCellConfiguration *)v4 imageAtIndex:1 withModifiers:0] forState:0];
    rightButton = self->_rightButton;
    [(SUCellConfiguration *)v4 frameForImageAtIndex:1];
    -[UIButton setFrame:](rightButton, "setFrame:");
  }
}

- (void)setConfiguration:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUBannerCell.m", 69, @"Configuration for banner cell must be banner configuration");
  }
  double v6 = [(SUTableCell *)self configuration];
  if ((SUBannerCell *)[(SUCellConfiguration *)v6 view] == self) {
    [(SUCellConfiguration *)v6 setView:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)SUBannerCell;
  [(SUTableCell *)&v7 setConfiguration:a3];
  [a3 setView:self];
  [(SUBannerCell *)self _reloadButtons];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUBannerCell;
  [(SUTableCell *)&v4 setHighlighted:0 animated:0];
}

- (void)_buttonAction:(id)a3
{
  BOOL v4 = self->_leftButton != a3;
  uint64_t v5 = [(SUBannerCell *)self nextResponder];
  if (v5)
  {
    double v6 = (void *)v5;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      double v6 = (void *)[v6 nextResponder];
      if (!v6) {
        return;
      }
    }
    [v6 bannerCell:self tappedButtonAtIndex:v4];
  }
}

- (id)_newButton
{
  return objc_alloc_init(MEMORY[0x263F1C488]);
}

- (void)_reloadButtons
{
  if ([(SUTableCell *)self configuration])
  {
    objc_super v3 = (void *)[(SUBannerCell *)self contentView];
    leftButton = self->_leftButton;
    if (!leftButton)
    {
      uint64_t v5 = [(SUBannerCell *)self _newButton];
      self->_leftButton = v5;
      [(UIButton *)v5 addTarget:self action:sel__buttonAction_ forControlEvents:64];
      [v3 addSubview:self->_leftButton];
      leftButton = self->_leftButton;
    }
    [(UIButton *)leftButton setBackgroundImage:0 forState:0];
    rightButton = self->_rightButton;
    if (!rightButton)
    {
      objc_super v7 = [(SUBannerCell *)self _newButton];
      self->_rightButton = v7;
      [(UIButton *)v7 addTarget:self action:sel__buttonAction_ forControlEvents:64];
      [v3 addSubview:self->_rightButton];
      rightButton = self->_rightButton;
    }
    [(UIButton *)rightButton setBackgroundImage:0 forState:0];
  }
  else
  {
    [(UIButton *)self->_leftButton removeTarget:self action:sel__buttonAction_ forControlEvents:64];
    [(UIButton *)self->_leftButton removeFromSuperview];

    self->_leftButton = 0;
    [(UIButton *)self->_rightButton removeTarget:self action:sel__buttonAction_ forControlEvents:64];
    [(UIButton *)self->_rightButton removeFromSuperview];

    self->_rightButton = 0;
  }

  [(SUBannerCell *)self setNeedsLayout];
}

@end