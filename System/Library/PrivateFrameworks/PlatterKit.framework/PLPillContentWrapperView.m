@interface PLPillContentWrapperView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isTopConstraintBreakable;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (PLPillContentItem)contentItem;
- (PLPillContentWrapperView)initWithFrame:(CGRect)a3;
- (id)_contentLabel;
- (int64_t)appearState;
- (void)_makeBottomConstraintBreakable;
- (void)_makeTopConstraintBreakable;
- (void)_setContentView:(id)a3 transitionCoordinator:(id)a4;
- (void)_updateConstraintsPriority;
- (void)beginAppearanceTransition:(BOOL)a3;
- (void)endAppearanceTransition:(BOOL)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setContentItem:(id)a3;
- (void)setContentItem:(id)a3 transitionCoordinator:(id)a4;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setTopConstraintBreakable:(BOOL)a3;
- (void)updateWithContentItem:(id)a3;
@end

@implementation PLPillContentWrapperView

- (PLPillContentWrapperView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLPillContentWrapperView;
  v3 = -[PLPillContentWrapperView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_preferredContentSizeCategory, (id)*MEMORY[0x1E4F437D0]);
    [(PLPillContentWrapperView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1132068864;
    [(PLPillContentWrapperView *)v4 setContentCompressionResistancePriority:0 forAxis:v5];
  }
  return v4;
}

- (void)setTopConstraintBreakable:(BOOL)a3
{
  if (self->_topConstraintBreakable != a3)
  {
    self->_topConstraintBreakable = a3;
    [(PLPillContentWrapperView *)self _updateConstraintsPriority];
  }
}

- (void)setContentItem:(id)a3
{
}

- (void)setContentItem:(id)a3 transitionCoordinator:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (([v12 isEqual:self->_contentItem] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentItem, a3);
    if (self->_adjustsFontForContentSizeCategory)
    {
      v8 = [(PLPillContentWrapperView *)self traitCollection];
      v9 = [v8 preferredContentSizeCategory];
      preferredContentSizeCategory = self->_preferredContentSizeCategory;
      self->_preferredContentSizeCategory = v9;
    }
    v11 = UIViewForPLPillContentItem(v12, self->_preferredContentSizeCategory);
    [(PLPillContentWrapperView *)self _setContentView:v11 transitionCoordinator:v7];
  }
}

- (void)beginAppearanceTransition:(BOOL)a3
{
  int64_t appearState = self->_appearState;
  if (a3)
  {
    if (appearState) {
      BOOL v5 = appearState == 3;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      return;
    }
    int64_t v6 = 1;
  }
  else
  {
    if ((unint64_t)(appearState - 1) > 1) {
      return;
    }
    int64_t v6 = 3;
  }
  self->_int64_t appearState = v6;
  if (![(PLPillContentItem *)self->_contentItem isSolo] && self->_appearState == 3)
  {
    id v7 = [(PLPillContentWrapperView *)self _contentLabel];
    [v7 setMarqueeRunning:0];
    [v7 _setMarqueeUpdatable:0];
  }
}

- (void)endAppearanceTransition:(BOOL)a3
{
  int64_t appearState = self->_appearState;
  if (a3)
  {
    if (appearState != 1) {
      return;
    }
    int64_t v5 = 2;
  }
  else
  {
    if (appearState != 3) {
      return;
    }
    int64_t v5 = 0;
  }
  self->_int64_t appearState = v5;
  if (![(PLPillContentItem *)self->_contentItem isSolo] && self->_appearState == 2)
  {
    id v6 = [(PLPillContentWrapperView *)self _contentLabel];
    [v6 setMarqueeRunning:1];
  }
}

- (void)updateWithContentItem:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = v4;
  if (self->_contentView)
  {
    id v6 = [v4 text];

    if (v6)
    {
      id v7 = [(PLPillContentWrapperView *)self _contentLabel];
      if (!v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v8 = [(UIView *)self->_contentView arrangedSubviews];
          id v7 = (id)[v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v7)
          {
            uint64_t v9 = *(void *)v35;
            while (2)
            {
              for (i = 0; i != v7; i = (char *)i + 1)
              {
                if (*(void *)v35 != v9) {
                  objc_enumerationMutation(v8);
                }
                v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  id v7 = v11;
                  goto LABEL_16;
                }
              }
              id v7 = (id)[v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
              if (v7) {
                continue;
              }
              break;
            }
          }
LABEL_16:
        }
        else
        {
          id v7 = 0;
        }
      }
      [v7 _setMarqueeUpdatable:1];
      id v12 = [v5 text];
      [v7 setText:v12];
    }
    v13 = [v5 accessoryView];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x3032000000;
      v28[3] = __Block_byref_object_copy_;
      v28[4] = __Block_byref_object_dispose_;
      id v29 = 0;
      contentView = self->_contentView;
      uint64_t v16 = objc_opt_class();
      v17 = contentView;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          v18 = v17;
        }
        else {
          v18 = 0;
        }
      }
      else
      {
        v18 = 0;
      }
      v19 = v18;

      if (v19)
      {
        v20 = [(UIView *)v19 arrangedSubviews];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __50__PLPillContentWrapperView_updateWithContentItem___block_invoke;
        v27[3] = &unk_1E6B5FB18;
        v27[4] = &v30;
        v27[5] = v28;
        [v20 enumerateObjectsUsingBlock:v27];

        if (v31[3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = (void *)MEMORY[0x1E4F42FF0];
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __50__PLPillContentWrapperView_updateWithContentItem___block_invoke_2;
          v22[3] = &unk_1E6B5FB40;
          v23 = v19;
          id v24 = v5;
          v25 = &v30;
          v26 = v28;
          [v21 performWithoutAnimation:v22];
        }
      }

      _Block_object_dispose(v28, 8);
      _Block_object_dispose(&v30, 8);
    }
  }
}

void __50__PLPillContentWrapperView_updateWithContentItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __50__PLPillContentWrapperView_updateWithContentItem___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) accessoryView];
  [v2 insertArrangedSubview:v3 atIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return [v4 removeArrangedSubview:v5];
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_contentView intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(PLPillContentWrapperView *)self _contentLabel];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 font];
    [v9 capHeight];
    double v11 = v10;
    [v9 descender];
    double v13 = v11 - v12;
    [v9 _scaledValueForValue:2.0];
    double v6 = ceil(v13 + v14);
  }
  double v15 = v4;
  double v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  if (!self->_adjustsFontForContentSizeCategory) {
    return 0;
  }
  v2 = [(PLPillContentWrapperView *)self _contentLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(PLPillContentWrapperView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  if (self->_adjustsFontForContentSizeCategory && (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    double v6 = [(PLPillContentWrapperView *)self _contentLabel];
    if (v6) {
      PLConfigureUILabelWithPLPillContentItemStyle(v6, [(PLPillContentItem *)self->_contentItem style], [(PLPillContentItem *)self->_contentItem isSolo] ^ 1, self->_preferredContentSizeCategory);
    }
    [(PLPillContentWrapperView *)self invalidateIntrinsicContentSize];
    [(PLPillContentWrapperView *)self setNeedsLayout];

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateConstraintsPriority
{
  if (self->_topConstraintBreakable) {
    [(PLPillContentWrapperView *)self _makeTopConstraintBreakable];
  }
  else {
    [(PLPillContentWrapperView *)self _makeBottomConstraintBreakable];
  }
}

- (void)_makeTopConstraintBreakable
{
  LODWORD(v2) = 1132068864;
  [(NSLayoutConstraint *)self->_topConstraint setPriority:v2];
  bottomConstraint = self->_bottomConstraint;
  LODWORD(v5) = 1148846080;
  [(NSLayoutConstraint *)bottomConstraint setPriority:v5];
}

- (void)_makeBottomConstraintBreakable
{
  LODWORD(v2) = 1132068864;
  [(NSLayoutConstraint *)self->_bottomConstraint setPriority:v2];
  topConstraint = self->_topConstraint;
  LODWORD(v5) = 1148846080;
  [(NSLayoutConstraint *)topConstraint setPriority:v5];
}

- (void)_setContentView:(id)a3 transitionCoordinator:(id)a4
{
  id v7 = (UIView *)a3;
  id v8 = a4;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    double v10 = contentView;
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PLPillContentWrapperView *)self addSubview:v7];
    double v11 = [(PLPillContentWrapperView *)self leftAnchor];
    double v12 = [(UIView *)v7 leftAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];

    double v14 = [(PLPillContentWrapperView *)self rightAnchor];
    double v15 = [(UIView *)v7 rightAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];

    LODWORD(v17) = 1144750080;
    [(PLPillContentWrapperView *)self setContentHuggingPriority:1 forAxis:v17];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, v16, 0);
    v19 = [(PLPillContentWrapperView *)self _contentLabel];

    if (v19)
    {
      v20 = [(PLPillContentWrapperView *)self centerYAnchor];
      v21 = [(UIView *)v7 centerYAnchor];
      id v22 = [v20 constraintEqualToAnchor:v21];

      LODWORD(v23) = 1148846080;
      [v22 setPriority:v23];
    }
    else
    {
      id v24 = [(PLPillContentWrapperView *)self topAnchor];
      v25 = [(UIView *)v7 topAnchor];
      v26 = [v24 constraintEqualToAnchor:v25];

      long long v36 = v16;
      v27 = v13;
      v28 = v10;
      topConstraint = self->_topConstraint;
      self->_topConstraint = v26;
      uint64_t v30 = v26;

      v31 = [(PLPillContentWrapperView *)self bottomAnchor];
      uint64_t v32 = [(UIView *)v7 bottomAnchor];
      uint64_t v33 = [v31 constraintEqualToAnchor:v32];

      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v33;
      long long v35 = v33;
      double v10 = v28;
      double v13 = v27;
      double v16 = v36;
      id v22 = v35;

      [v18 addObject:v30];
    }
    [v18 addObject:v22];

    [MEMORY[0x1E4F28DC8] activateConstraints:v18];
    [(PLPillContentWrapperView *)self _updateConstraintsPriority];
    [(PLPillContentWrapperView *)self invalidateIntrinsicContentSize];
    if (v8)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke;
      v42[3] = &unk_1E6B5F800;
      v42[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v42];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_2;
      v39[3] = &unk_1E6B5FB68;
      v40 = v10;
      v41 = self;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_3;
      v37[3] = &unk_1E6B5F8F0;
      v38 = v40;
      [v8 animateAlongsideTransition:v39 completion:v37];
    }
    else
    {
      [(UIView *)v10 removeFromSuperview];
      [(UIView *)self pl_performCrossFadeIfNecessary];
    }
  }
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  double v2 = *(void **)(*(void *)(a1 + 40) + 408);
  return [v2 setAlpha:1.0];
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)_contentLabel
{
  contentView = self->_contentView;
  uint64_t v3 = objc_opt_class();
  double v4 = contentView;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  double v6 = v5;

  return v6;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (BOOL)isTopConstraintBreakable
{
  return self->_topConstraintBreakable;
}

- (PLPillContentItem)contentItem
{
  return self->_contentItem;
}

- (int64_t)appearState
{
  return self->_appearState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end