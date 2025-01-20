@interface SBSystemApertureSceneElementPlaceholderWrapperView
- (BOOL)allowsReparentingByLayoutHost;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBSystemApertureSceneElementPlaceholderWrapperView)initWithContentView:(id)a3;
- (SBSystemApertureSceneElementPlaceholderWrapperViewDelegate)delegate;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSystemApertureSceneElementPlaceholderWrapperView

- (SBSystemApertureSceneElementPlaceholderWrapperView)initWithContentView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureSceneElementPlaceholderWrapperView;
  v6 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    p_contentView = &v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    if (*p_contentView) {
      -[SBSystemApertureSceneElementPlaceholderWrapperView addSubview:](v7, "addSubview:");
    }
  }

  return v7;
}

- (void)setContentView:(id)a3
{
  id v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
    {
      -[SBSystemApertureSceneElementPlaceholderWrapperView addSubview:](self, "addSubview:");
      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self invalidateIntrinsicContentSize];
      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self setNeedsLayout];
      [(SBSystemApertureSceneElementPlaceholderWrapperView *)self layoutIfNeeded];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained placeholderWrapperViewDidChangeContentView:self];

    id v5 = v8;
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureSceneElementPlaceholderWrapperView;
  [(SBSystemApertureSceneElementPlaceholderWrapperView *)&v5 layoutSubviews];
  contentView = self->_contentView;
  [(SBSystemApertureSceneElementPlaceholderWrapperView *)self bounds];
  -[UIView setFrame:](contentView, "setFrame:");
  [(SBSystemApertureSceneElementPlaceholderWrapperView *)self setUserInteractionEnabled:0];
  v4 = [(SBSystemApertureSceneElementPlaceholderWrapperView *)self layer];
  [v4 setAllowsHitTesting:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_contentView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)allowsReparentingByLayoutHost
{
  return 1;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SBSystemApertureSceneElementPlaceholderWrapperViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemApertureSceneElementPlaceholderWrapperViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end