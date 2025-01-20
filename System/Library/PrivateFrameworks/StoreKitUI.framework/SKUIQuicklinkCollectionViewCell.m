@interface SKUIQuicklinkCollectionViewCell
- (id)_linkButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_linkButtonAction:(id)a3;
- (void)configureForLink:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setColoringWithColorScheme:(id)a3;
@end

@implementation SKUIQuicklinkCollectionViewCell

- (void)dealloc
{
  [(UIButton *)self->_linkButton removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIQuicklinkCollectionViewCell;
  [(SKUIQuicklinkCollectionViewCell *)&v3 dealloc];
}

- (void)configureForLink:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIQuicklinkCollectionViewCell configureForLink:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 title];
  if ([v13 length])
  {
    v14 = [(SKUIQuicklinkCollectionViewCell *)self _linkButton];
    [v14 setHidden:0];
    v15 = [v4 title];
    [v14 setTitle:v15 forState:0];

    [(SKUIQuicklinkCollectionViewCell *)self setNeedsLayout];
  }
  else
  {
    [(UIButton *)self->_linkButton setHidden:1];
  }
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIQuicklinkCollectionViewCell setColoringWithColorScheme:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 secondaryTextColor];
  if (!v13)
  {
    v13 = [v4 primaryTextColor];
  }
  v14 = [(SKUIQuicklinkCollectionViewCell *)self _linkButton];
  [v14 setTintColor:v13];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIQuicklinkCollectionViewCell;
  BOOL v5 = -[SKUIQuicklinkCollectionViewCell hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  if ([v5 isDescendantOfView:self])
  {
    uint64_t v6 = self->_linkButton;

    BOOL v5 = v6;
  }

  return v5;
}

- (void)layoutSubviews
{
}

- (void)_linkButtonAction:(id)a3
{
  SKUICollectionViewForView(self);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v6 indexPathForCell:self];
    [v4 collectionView:v6 didSelectItemAtIndexPath:v5];
  }
}

- (id)_linkButton
{
  linkButton = self->_linkButton;
  if (!linkButton)
  {
    id v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    BOOL v5 = self->_linkButton;
    self->_linkButton = v4;

    [(UIButton *)self->_linkButton addTarget:self action:sel__linkButtonAction_ forControlEvents:64];
    id v6 = [(UIButton *)self->_linkButton titleLabel];
    uint64_t v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [v6 setFont:v7];

    objc_super v8 = [(SKUIQuicklinkCollectionViewCell *)self contentView];
    [v8 addSubview:self->_linkButton];

    linkButton = self->_linkButton;
  }

  return linkButton;
}

- (void).cxx_destruct
{
}

- (void)configureForLink:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end