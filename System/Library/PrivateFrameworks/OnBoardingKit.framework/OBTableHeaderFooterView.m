@interface OBTableHeaderFooterView
- (CGSize)intrinsicContentSize;
- (NSArray)hostedConstraints;
- (NSArray)internalContentConstraints;
- (OBTableHeaderFooterView)initWithLayout:(unint64_t)a3;
- (UIEdgeInsets)hostedViewPadding;
- (UIEdgeInsets)internalContentPadding;
- (UIView)hostedView;
- (UIView)internalContentView;
- (unint64_t)layout;
- (void)_applyLayout;
- (void)_layoutContainerForTableFooter;
- (void)_layoutContainerForTableHeader;
- (void)setHostedConstraints:(id)a3;
- (void)setHostedView:(id)a3;
- (void)setHostedViewPadding:(UIEdgeInsets)a3;
- (void)setInternalContentConstraints:(id)a3;
- (void)setInternalContentPadding:(UIEdgeInsets)a3;
- (void)setInternalContentView:(id)a3;
- (void)setLayout:(unint64_t)a3;
@end

@implementation OBTableHeaderFooterView

- (OBTableHeaderFooterView)initWithLayout:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBTableHeaderFooterView;
  result = -[OBTableHeaderFooterView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    result->_layout = a3;
  }
  return result;
}

- (void)setInternalContentPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_internalContentPadding.left
    || a3.top != self->_internalContentPadding.top
    || a3.right != self->_internalContentPadding.right
    || a3.bottom != self->_internalContentPadding.bottom)
  {
    self->_internalContentPadding = a3;
    [(OBTableHeaderFooterView *)self _applyLayout];
  }
}

- (void)setHostedViewPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_internalContentPadding.left
    || a3.top != self->_internalContentPadding.top
    || a3.right != self->_internalContentPadding.right
    || a3.bottom != self->_internalContentPadding.bottom)
  {
    self->_hostedViewPadding = a3;
    [(OBTableHeaderFooterView *)self _applyLayout];
  }
}

- (void)setInternalContentView:(id)a3
{
  p_internalContentView = &self->_internalContentView;
  v8 = (UIView *)a3;
  if (*p_internalContentView != v8
    || ([(OBTableHeaderFooterView *)self subviews],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:v8],
        v6,
        (v7 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_internalContentView, a3);
    [(OBTableHeaderFooterView *)self addSubview:*p_internalContentView];
    [(OBTableHeaderFooterView *)self _applyLayout];
  }
}

- (void)setHostedView:(id)a3
{
  p_hostedView = &self->_hostedView;
  v8 = (UIView *)a3;
  if (*p_hostedView != v8
    || ([(OBTableHeaderFooterView *)self subviews],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:v8],
        v6,
        (v7 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_hostedView, a3);
    [(OBTableHeaderFooterView *)self addSubview:*p_hostedView];
    [(OBTableHeaderFooterView *)self _applyLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(OBTableHeaderFooterView *)self internalContentView];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  if (v5 == -1.0 && v7 == -1.0)
  {
    v9 = [(OBTableHeaderFooterView *)self internalContentView];
    [v9 bounds];
    double v7 = v10;
  }
  v11 = [(OBTableHeaderFooterView *)self hostedView];
  [v11 intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;

  if (v13 == -1.0 && v15 == -1.0)
  {
    v17 = [(OBTableHeaderFooterView *)self hostedView];
    [v17 bounds];
    double v15 = v18;
  }
  unint64_t v19 = [(OBTableHeaderFooterView *)self layout];
  [(OBTableHeaderFooterView *)self hostedViewPadding];
  if (v19)
  {
    double v22 = v20;
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v24 = v23;
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v26 = v25;
    v27 = [(OBTableHeaderFooterView *)self hostedView];

    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (!v27)
    {
      double v22 = 0.0;
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    v29 = [(OBTableHeaderFooterView *)self internalContentView];

    if (v29) {
      double v30 = v26;
    }
    else {
      double v30 = 0.0;
    }
    if (v29) {
      double v31 = v24;
    }
    else {
      double v31 = 0.0;
    }
    if (v29) {
      double v32 = v7;
    }
    else {
      double v32 = v28;
    }
    double v33 = v30 + v32 + v22 + v15 + v31;
  }
  else
  {
    double v34 = v21;
    v35 = [(OBTableHeaderFooterView *)self hostedView];

    if (v35) {
      double v36 = v34;
    }
    else {
      double v36 = 0.0;
    }
    if (!v35) {
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v38 = v7 + v37;
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v33 = v36 + v15 + v38 + v39;
  }
  [(OBTableHeaderFooterView *)self bounds];
  double v41 = v40;
  float v42 = v33;
  double v43 = floorf(v42);
  result.height = v43;
  result.width = v41;
  return result;
}

- (void)_applyLayout
{
  if ([(OBTableHeaderFooterView *)self layout])
  {
    [(OBTableHeaderFooterView *)self _layoutContainerForTableFooter];
  }
  else
  {
    [(OBTableHeaderFooterView *)self _layoutContainerForTableHeader];
  }
}

- (void)_layoutContainerForTableHeader
{
  v45[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(OBTableHeaderFooterView *)self internalContentConstraints];
  [v3 deactivateConstraints:v4];

  double v5 = (void *)MEMORY[0x1E4F28DC8];
  double v6 = [(OBTableHeaderFooterView *)self hostedConstraints];
  [v5 deactivateConstraints:v6];

  double v7 = [(OBTableHeaderFooterView *)self internalContentView];

  if (v7)
  {
    double v41 = [(OBTableHeaderFooterView *)self internalContentView];
    double v39 = [v41 topAnchor];
    double v37 = [(OBTableHeaderFooterView *)self topAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    v8 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37);
    v45[0] = v8;
    v9 = [(OBTableHeaderFooterView *)self internalContentView];
    double v10 = [v9 leadingAnchor];
    v11 = [(OBTableHeaderFooterView *)self leadingAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v13 = [v10 constraintEqualToAnchor:v11 constant:v12];
    v45[1] = v13;
    double v14 = [(OBTableHeaderFooterView *)self internalContentView];
    double v15 = [v14 trailingAnchor];
    v16 = [(OBTableHeaderFooterView *)self trailingAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v18 = [v15 constraintEqualToAnchor:v16 constant:-v17];
    v45[2] = v18;
    double v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  }
  else
  {
    unint64_t v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Header should never be nil" reason:@"Inconsistent layout" userInfo:0];
    [v19 raise];

    double v43 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v20 = [(OBTableHeaderFooterView *)self hostedView];

  if (v20)
  {
    float v42 = [(OBTableHeaderFooterView *)self hostedView];
    double v38 = [v42 topAnchor];
    double v40 = [(OBTableHeaderFooterView *)self internalContentView];
    double v36 = [v40 bottomAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    v35 = [v38 constraintEqualToAnchor:v36 constant:v21];
    v44[0] = v35;
    double v22 = [(OBTableHeaderFooterView *)self hostedView];
    double v23 = [v22 leadingAnchor];
    double v24 = [(OBTableHeaderFooterView *)self leadingAnchor];
    [(OBTableHeaderFooterView *)self hostedViewPadding];
    double v26 = [v23 constraintEqualToAnchor:v24 constant:v25];
    v44[1] = v26;
    v27 = [(OBTableHeaderFooterView *)self hostedView];
    double v28 = [v27 trailingAnchor];
    v29 = [(OBTableHeaderFooterView *)self trailingAnchor];
    [(OBTableHeaderFooterView *)self hostedViewPadding];
    double v31 = [v28 constraintEqualToAnchor:v29 constant:-v30];
    v44[2] = v31;
    double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];

    double v33 = v43;
    id v34 = [v43 arrayByAddingObjectsFromArray:v32];
  }
  else
  {
    double v33 = v43;
    id v34 = v43;
    double v32 = 0;
  }
  [v34 enumerateObjectsUsingBlock:&__block_literal_global];
  [MEMORY[0x1E4F28DC8] activateConstraints:v34];
  [(OBTableHeaderFooterView *)self setHostedConstraints:v32];
  [(OBTableHeaderFooterView *)self setInternalContentConstraints:v33];
}

uint64_t __57__OBTableHeaderFooterView__layoutContainerForTableHeader__block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 1148829696;
  return [a3 setPriority:a1];
}

- (void)_layoutContainerForTableFooter
{
  v49[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(OBTableHeaderFooterView *)self internalContentConstraints];
  [v3 deactivateConstraints:v4];

  double v5 = (void *)MEMORY[0x1E4F28DC8];
  double v6 = [(OBTableHeaderFooterView *)self hostedConstraints];
  [v5 deactivateConstraints:v6];

  double v7 = [(OBTableHeaderFooterView *)self hostedView];

  if (v7)
  {
    v45 = [(OBTableHeaderFooterView *)self hostedView];
    double v43 = [v45 topAnchor];
    double v41 = [(OBTableHeaderFooterView *)self topAnchor];
    [(OBTableHeaderFooterView *)self hostedViewPadding];
    v8 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v41);
    v49[0] = v8;
    v9 = [(OBTableHeaderFooterView *)self hostedView];
    double v10 = [v9 leadingAnchor];
    v11 = [(OBTableHeaderFooterView *)self leadingAnchor];
    [(OBTableHeaderFooterView *)self hostedViewPadding];
    double v13 = [v10 constraintEqualToAnchor:v11 constant:v12];
    v49[1] = v13;
    double v14 = [(OBTableHeaderFooterView *)self hostedView];
    double v15 = [v14 trailingAnchor];
    v16 = [(OBTableHeaderFooterView *)self trailingAnchor];
    [(OBTableHeaderFooterView *)self hostedViewPadding];
    double v18 = [v15 constraintEqualToAnchor:v16 constant:-v17];
    v49[2] = v18;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  }
  else
  {
    v47 = (void *)MEMORY[0x1E4F1CBF0];
  }
  unint64_t v19 = [(OBTableHeaderFooterView *)self internalContentView];

  if (v19)
  {
    double v20 = [(OBTableHeaderFooterView *)self hostedView];
    uint64_t v21 = [v20 bottomAnchor];

    if (!v21)
    {
      uint64_t v21 = [(OBTableHeaderFooterView *)self topAnchor];
    }
    double v37 = (void *)v21;
    v46 = [(OBTableHeaderFooterView *)self internalContentView];
    v44 = [v46 topAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    float v42 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v21);
    v48[0] = v42;
    double v40 = [(OBTableHeaderFooterView *)self internalContentView];
    double v39 = [v40 leadingAnchor];
    double v38 = [(OBTableHeaderFooterView *)self leadingAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v36 = [v39 constraintEqualToAnchor:v38 constant:v22];
    v48[1] = v36;
    double v23 = [(OBTableHeaderFooterView *)self internalContentView];
    double v24 = [v23 trailingAnchor];
    double v25 = [(OBTableHeaderFooterView *)self trailingAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    v27 = [v24 constraintEqualToAnchor:v25 constant:-v26];
    v48[2] = v27;
    double v28 = [(OBTableHeaderFooterView *)self internalContentView];
    v29 = [v28 bottomAnchor];
    double v30 = [(OBTableHeaderFooterView *)self bottomAnchor];
    [(OBTableHeaderFooterView *)self internalContentPadding];
    double v32 = [v29 constraintEqualToAnchor:v30 constant:-v31];
    v48[3] = v32;
    double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];

    id v34 = v47;
    id v35 = [v33 arrayByAddingObjectsFromArray:v47];
  }
  else
  {
    id v34 = v47;
    id v35 = v47;
    double v33 = 0;
  }
  [v35 enumerateObjectsUsingBlock:&__block_literal_global_8];
  [MEMORY[0x1E4F28DC8] activateConstraints:v35];
  [(OBTableHeaderFooterView *)self setHostedConstraints:v34];
  [(OBTableHeaderFooterView *)self setInternalContentConstraints:v33];
}

uint64_t __57__OBTableHeaderFooterView__layoutContainerForTableFooter__block_invoke(double a1, uint64_t a2, void *a3)
{
  LODWORD(a1) = 1144750080;
  return [a3 setPriority:a1];
}

- (UIView)internalContentView
{
  return self->_internalContentView;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (UIEdgeInsets)internalContentPadding
{
  double top = self->_internalContentPadding.top;
  double left = self->_internalContentPadding.left;
  double bottom = self->_internalContentPadding.bottom;
  double right = self->_internalContentPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)hostedViewPadding
{
  double top = self->_hostedViewPadding.top;
  double left = self->_hostedViewPadding.left;
  double bottom = self->_hostedViewPadding.bottom;
  double right = self->_hostedViewPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)hostedConstraints
{
  return self->_hostedConstraints;
}

- (void)setHostedConstraints:(id)a3
{
}

- (NSArray)internalContentConstraints
{
  return self->_internalContentConstraints;
}

- (void)setInternalContentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalContentConstraints, 0);
  objc_storeStrong((id *)&self->_hostedConstraints, 0);
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_internalContentView, 0);
}

@end