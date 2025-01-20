@interface SBFButton
- (BOOL)_drawingAsSelected;
- (SBFButton)initWithFrame:(CGRect)a3;
- (void)_touchUpInside;
- (void)_updateSelected:(BOOL)a3 highlighted:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SBFButton

- (SBFButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFButton;
  v3 = -[SBFButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBFButton *)v3 addTarget:v3 action:sel__touchUpInside forControlEvents:64];
  }
  return v4;
}

- (void)_touchUpInside
{
  uint64_t v3 = [(SBFButton *)self isSelected] ^ 1;
  [(SBFButton *)self _updateSelected:v3 highlighted:0];
}

- (BOOL)_drawingAsSelected
{
  if ([(SBFButton *)self isSelected]
    && ![(SBFButton *)self isHighlighted])
  {
    return 1;
  }
  if ([(SBFButton *)self isSelected]) {
    return 0;
  }
  return [(SBFButton *)self isHighlighted];
}

- (void)_updateSelected:(BOOL)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(SBFButton *)self _drawingAsSelected];
  v9.receiver = self;
  v9.super_class = (Class)SBFButton;
  [(SBFButton *)&v9 setSelected:v5];
  v8.receiver = self;
  v8.super_class = (Class)SBFButton;
  [(SBFButton *)&v8 setHighlighted:v4];
  if (v7 != [(SBFButton *)self _drawingAsSelected]) {
    [(SBFButton *)self _updateForStateChange];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBFButton *)self isHighlighted];
  [(SBFButton *)self _updateSelected:v3 highlighted:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBFButton *)self isSelected];
  [(SBFButton *)self _updateSelected:v5 highlighted:v3];
}

@end