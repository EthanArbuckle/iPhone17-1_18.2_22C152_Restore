@interface SFTabOverviewSearchBar
- (BOOL)embeddedInToolbar;
- (SFTabOverviewSearchBar)initWithFrame:(CGRect)a3;
- (UIMenu)cancelButtonMenu;
- (double)minimumWidth;
- (double)searchFieldHorizontalMargin;
- (void)setCancelButtonMenu:(id)a3;
- (void)setEmbeddedInToolbar:(BOOL)a3;
@end

@implementation SFTabOverviewSearchBar

- (SFTabOverviewSearchBar)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFTabOverviewSearchBar;
  v3 = -[SFTabOverviewSearchBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFTabOverviewSearchBar *)v3 searchField];
    [v5 setAccessibilityIdentifier:@"TabOverviewSearchField"];

    [(SFTabOverviewSearchBar *)v4 setDrawsBackground:0];
    [(SFTabOverviewSearchBar *)v4 setExclusiveTouch:1];
    v6 = _WBSLocalizedString();
    [(SFTabOverviewSearchBar *)v4 setPlaceholder:v6];

    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(SFTabOverviewSearchBar *)v4 setTintColor:v7];

    [(SFTabOverviewSearchBar *)v4 _setAutoDisableCancelButton:0];
    v8 = v4;
  }

  return v4;
}

- (double)minimumWidth
{
  v3 = [(SFTabOverviewSearchBar *)self text];
  [(SFTabOverviewSearchBar *)self setText:&stru_1F3C268E8];
  v4 = [(SFTabOverviewSearchBar *)self searchField];
  objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v6 = v5;

  [(SFTabOverviewSearchBar *)self setText:v3];
  return v6;
}

- (double)searchFieldHorizontalMargin
{
  if ([(SFTabOverviewSearchBar *)self _sf_usesLeftToRightLayout])
  {
    v3 = [(SFTabOverviewSearchBar *)self searchField];
    [v3 frame];
    double MinX = CGRectGetMinX(v7);
  }
  else
  {
    [(SFTabOverviewSearchBar *)self bounds];
    double Width = CGRectGetWidth(v8);
    v3 = [(SFTabOverviewSearchBar *)self searchField];
    [v3 frame];
    double MinX = Width - CGRectGetMaxX(v9);
  }

  return MinX;
}

- (void)setCancelButtonMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(SFTabOverviewSearchBar *)self cancelButton];
  [v5 setMenu:v4];
}

- (UIMenu)cancelButtonMenu
{
  v2 = [(SFTabOverviewSearchBar *)self cancelButton];
  v3 = [v2 menu];

  return (UIMenu *)v3;
}

- (void)setEmbeddedInToolbar:(BOOL)a3
{
  if (self->_embeddedInToolbar != a3)
  {
    self->_embeddedInToolbar = a3;
    if (a3) {
      uint64_t v3 = 10;
    }
    else {
      uint64_t v3 = 0;
    }
    -[SFTabOverviewSearchBar _setOverrideContentInsets:forRectEdges:](self, "_setOverrideContentInsets:forRectEdges:", v3, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
}

- (BOOL)embeddedInToolbar
{
  return self->_embeddedInToolbar;
}

@end