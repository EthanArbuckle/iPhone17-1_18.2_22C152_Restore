@interface SBFluidSwitcherContentView
- (BOOL)passesTouchesThrough;
- (CGPoint)contentOffset;
- (CGSize)contentSize;
- (CGSize)visibleSize;
- (SBFluidSwitcherContentViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)preferredFocusEnvironments;
- (unint64_t)switcherLayoutElementType;
- (void)setDelegate:(id)a3;
- (void)setPassesTouchesThrough:(BOOL)a3;
@end

@implementation SBFluidSwitcherContentView

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherContentView;
  -[SBFluidSwitcherContentView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBFluidSwitcherContentView *)objc_claimAutoreleasedReturnValue();
  if ([(SBFluidSwitcherContentView *)self passesTouchesThrough] && v5 == self) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }

  return v6;
}

- (unint64_t)switcherLayoutElementType
{
  return 5;
}

- (CGPoint)contentOffset
{
  v2 = [(SBFluidSwitcherContentView *)self delegate];
  v3 = [v2 switcherScrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)contentSize
{
  v2 = [(SBFluidSwitcherContentView *)self delegate];
  v3 = [v2 switcherScrollView];
  [v3 contentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)visibleSize
{
  [(SBFluidSwitcherContentView *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)preferredFocusEnvironments
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SBFluidSwitcherContentView *)self delegate];
  double v4 = [v3 defaultFocusItem];

  if (v4)
  {
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentView;
    uint64_t v5 = [(SBFluidSwitcherContentView *)&v8 preferredFocusEnvironments];
  }
  double v6 = (void *)v5;

  return v6;
}

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (SBFluidSwitcherContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end