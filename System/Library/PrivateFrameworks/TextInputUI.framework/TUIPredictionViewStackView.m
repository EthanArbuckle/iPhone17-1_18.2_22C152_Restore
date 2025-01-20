@interface TUIPredictionViewStackView
- (BOOL)cellsHaveBackgroundColor;
- (TUIPredictionViewStackContentView)contentView;
- (TUIPredictionViewStackView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentMargin;
- (id)allVisibleCells;
- (id)arrangedSubviews;
- (id)subStackViews;
- (id)visibleCells;
- (int64_t)_layoutTypeForSubview:(id)a3;
- (int64_t)layoutDirection;
- (void)addArrangedSubview:(id)a3 beforeLastSubview:(BOOL)a4;
- (void)layoutSubviews;
- (void)setCellsHaveBackgroundColor:(BOOL)a3;
- (void)setContentMargin:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
- (void)setLayoutDirection:(int64_t)a3;
@end

@implementation TUIPredictionViewStackView

- (void).cxx_destruct
{
}

- (void)setContentView:(id)a3
{
}

- (TUIPredictionViewStackContentView)contentView
{
  return self->_contentView;
}

- (void)setCellsHaveBackgroundColor:(BOOL)a3
{
  self->_cellsHaveBackgroundColor = a3;
}

- (BOOL)cellsHaveBackgroundColor
{
  return self->_cellsHaveBackgroundColor;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setContentMargin:(UIEdgeInsets)a3
{
  self->_contentMargin = a3;
}

- (UIEdgeInsets)contentMargin
{
  double top = self->_contentMargin.top;
  double left = self->_contentMargin.left;
  double bottom = self->_contentMargin.bottom;
  double right = self->_contentMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  [(TUIPredictionViewStackView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TUIPredictionViewStackView *)self contentMargin];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  v19 = [(TUIPredictionViewStackView *)self contentView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = [(TUIPredictionViewStackView *)self contentView];
  [v20 bounds];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  double v26 = v25;
  uint64_t v28 = v27;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v29 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    unint64_t v32 = 0;
    uint64_t v33 = *(void *)v47;
    double v34 = v26;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v29);
        }
        v36 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        int64_t v37 = [(TUIPredictionViewStackView *)self _layoutTypeForSubview:v36];
        if (v37 == 1)
        {
          [v36 intrinsicContentSize];
          double v34 = v34 - v38;
        }
        else if (!v37)
        {
          ++v32;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v31);
  }
  else
  {
    unint64_t v32 = 0;
    double v34 = v26;
  }

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  if ([(TUIPredictionViewStackView *)self cellsHaveBackgroundColor]) {
    double v39 = 16.0;
  }
  else {
    double v39 = 0.0;
  }
  v40 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  double v41 = round(v34 - (double)(unint64_t)([v40 count] - 1) * v39) / (double)v32;

  v42 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  int64_t v43 = [(TUIPredictionViewStackView *)self layoutDirection];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __44__TUIPredictionViewStackView_layoutSubviews__block_invoke;
  v44[3] = &unk_1E5593CE0;
  v44[4] = self;
  v44[5] = v45;
  *(double *)&v44[6] = v41;
  v44[7] = v22;
  v44[8] = v24;
  *(double *)&v44[9] = v26;
  v44[10] = v28;
  *(double *)&v44[11] = v39;
  [v42 enumerateObjectsWithOptions:2 * (v43 == 1) usingBlock:v44];

  _Block_object_dispose(v45, 8);
}

void __44__TUIPredictionViewStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (objc_opt_respondsToSelector()) {
    [v11 setPredictionPosition:a3];
  }
  uint64_t v5 = [*(id *)(a1 + 32) _layoutTypeForSubview:v11];
  if (v5 == 1)
  {
    [v11 intrinsicContentSize];
    double v6 = v9;
    double v10 = v8;
    if (v9 == *MEMORY[0x1E4FB30D8]) {
      double v6 = *(double *)(a1 + 48);
    }
    double v7 = v11;
    if (v8 != *MEMORY[0x1E4FB30D8]) {
      goto LABEL_10;
    }
  }
  else
  {
    if (v5) {
      goto LABEL_11;
    }
    double v6 = *(double *)(a1 + 48);
    double v7 = v11;
  }
  double v10 = *(double *)(a1 + 80);
LABEL_10:
  objc_msgSend(v7, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, v6, v10);
LABEL_11:
  [v11 frame];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetWidth(v13)
                                                               + *(double *)(a1 + 88)
                                                               + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 24);
}

- (id)arrangedSubviews
{
  v2 = [(TUIPredictionViewStackView *)self contentView];
  double v3 = [v2 subviews];

  return v3;
}

- (void)addArrangedSubview:(id)a3 beforeLastSubview:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  double v6 = [(TUIPredictionViewStackView *)self contentView];
  double v7 = [v6 subviews];
  uint64_t v8 = [v7 count];

  double v9 = [(TUIPredictionViewStackView *)self contentView];
  double v10 = v9;
  if (v4 && v8)
  {
    id v11 = [v9 subviews];
    char v12 = [v11 containsObject:v13];

    if (v12) {
      goto LABEL_7;
    }
    double v10 = [(TUIPredictionViewStackView *)self contentView];
    [v10 insertSubview:v13 atIndex:v8 - 1];
  }
  else
  {
    [v9 addSubview:v13];
  }

LABEL_7:
  [(TUIPredictionViewStackView *)self setNeedsLayout];
}

- (int64_t)_layoutTypeForSubview:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 layoutType];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)subStackViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v4 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allVisibleCells
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v4 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v10 = [v9 allVisibleCells];
          [v3 addObjectsFromArray:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v3 addObject:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)visibleCells
{
  id v3 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  int64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_5514];

  uint64_t v5 = [(TUIPredictionViewStackView *)self arrangedSubviews];
  uint64_t v6 = [v5 objectsAtIndexes:v4];

  return v6;
}

uint64_t __42__TUIPredictionViewStackView_visibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (TUIPredictionViewStackView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUIPredictionViewStackView;
  id v3 = -[TUIPredictionViewStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    int64_t v4 = [TUIPredictionViewStackContentView alloc];
    uint64_t v5 = -[TUIPredictionViewStackContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIPredictionViewStackView *)v3 setContentView:v5];

    uint64_t v6 = [(TUIPredictionViewStackView *)v3 contentView];
    [(TUIPredictionViewStackView *)v3 addSubview:v6];
  }
  return v3;
}

@end