@interface TUICandidateBaseCell
- (TUICandidateBaseCell)initWithFrame:(CGRect)a3;
- (TUICandidateViewStyle)style;
- (UIImageView)backgroundImageView;
- (id)cellBackgroundColor;
- (id)cellBackgroundImage;
- (void)layoutSubviews;
- (void)setBackgroundImageView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)updateBackground:(id)a3 color:(id)a4;
- (void)updateColors;
@end

@implementation TUICandidateBaseCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setStyle:(id)a3
{
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUICandidateBaseCell;
  -[TUICandidateBaseCell setHighlighted:](&v19, sel_setHighlighted_);
  v5 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(TUICandidateBaseCell *)self style];
    int v7 = [v6 performScalingAnimationOnCellHighlight];

    if (v7)
    {
      if (v3)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        v16 = __39__TUICandidateBaseCell_setHighlighted___block_invoke;
        v17 = &unk_1E55941A8;
        v18 = self;
        v8 = &v14;
      }
      else
      {
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        v11 = __39__TUICandidateBaseCell_setHighlighted___block_invoke_2;
        v12 = &unk_1E55941A8;
        v13 = self;
        v8 = &v9;
      }
      objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:", v8, 0.1, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else
  {
  }
  [(TUICandidateBaseCell *)self updateColors];
}

uint64_t __39__TUICandidateBaseCell_setHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.95, 0.95);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __39__TUICandidateBaseCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUICandidateBaseCell;
  [(TUICandidateBaseCell *)&v4 setSelected:a3];
  [(TUICandidateBaseCell *)self updateColors];
}

- (void)updateBackground:(id)a3 color:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    int v7 = [(TUICandidateBaseCell *)self backgroundImageView];

    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
      [(TUICandidateBaseCell *)self bounds];
      uint64_t v9 = objc_msgSend(v8, "initWithFrame:");
      [(TUICandidateBaseCell *)self setBackgroundImageView:v9];
    }
    uint64_t v10 = [(TUICandidateBaseCell *)self backgroundImageView];
    [v10 setImage:v13];

    v11 = [(TUICandidateBaseCell *)self backgroundImageView];
    [(TUICandidateBaseCell *)self setBackgroundView:v11];

    id v12 = 0;
  }
  else
  {
    [(TUICandidateBaseCell *)self setBackgroundView:0];
    id v12 = v6;
  }
  [(TUICandidateBaseCell *)self setBackgroundColor:v12];
}

- (id)cellBackgroundImage
{
  if (([(TUICandidateBaseCell *)self isSelected] & 1) != 0
    || [(TUICandidateBaseCell *)self isHighlighted])
  {
    BOOL v3 = [(TUICandidateBaseCell *)self style];
    uint64_t v4 = [v3 highlightedCellBackgroundImage];
  }
  else
  {
    BOOL v3 = [(TUICandidateBaseCell *)self style];
    uint64_t v4 = [v3 cellBackgroundImage];
  }
  CGAffineTransform v5 = (void *)v4;

  return v5;
}

- (id)cellBackgroundColor
{
  BOOL v3 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(TUICandidateBaseCell *)self style];
    CGAffineTransform v5 = [v4 spaceConfirmationCandidateCellBackgroundColor];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  if (([(TUICandidateBaseCell *)self isHighlighted] & 1) != 0
    || (([(TUICandidateBaseCell *)self isSelected] ^ 1 | v6) & 1) != 0)
  {
    if (([(TUICandidateBaseCell *)self isSelected] & 1) != 0
      || [(TUICandidateBaseCell *)self isHighlighted])
    {
      int v7 = [(TUICandidateBaseCell *)self style];
      uint64_t v8 = [v7 highlightedBackgroundColor];
    }
    else
    {
      int v7 = [(TUICandidateBaseCell *)self style];
      uint64_t v8 = [v7 cellBackgroundColor];
    }
  }
  else
  {
    int v7 = [(TUICandidateBaseCell *)self style];
    uint64_t v8 = [v7 spaceConfirmationCandidateCellBackgroundColor];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (void)updateColors
{
  id v4 = [(TUICandidateBaseCell *)self cellBackgroundImage];
  BOOL v3 = [(TUICandidateBaseCell *)self cellBackgroundColor];
  [(TUICandidateBaseCell *)self updateBackground:v4 color:v3];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)TUICandidateBaseCell;
  [(TUICandidateBaseCell *)&v9 layoutSubviews];
  [(TUICandidateBaseCell *)self updateColors];
  BOOL v3 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(TUICandidateBaseCell *)self style];
    int v5 = [v4 applyCornerRadiusToAllCandidates];

    if (!v5) {
      return;
    }
    BOOL v3 = [(TUICandidateBaseCell *)self style];
    [v3 cellCornerRadius];
    double v7 = v6;
    uint64_t v8 = [(TUICandidateBaseCell *)self layer];
    [v8 setCornerRadius:v7];
  }
}

- (TUICandidateBaseCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUICandidateBaseCell;
  return -[TUICandidateBaseCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end