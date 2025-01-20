@interface PXUIWidgetFooterView
- (BOOL)_hasContent;
- (BOOL)_needsUpdate;
- (NSArray)_constraints;
- (NSString)disclosureTitle;
- (PXUIWidgetFooterViewDelegate)delegate;
- (UIButton)_disclosureButton;
- (UIEdgeInsets)contentInsets;
- (UIFocusGuide)_focusGuide;
- (UIFont)font;
- (UIView)_leadingSeparator;
- (UIView)_trailingSeparator;
- (id)_disclosureButtonCreateIfNeeded:(BOOL)a3;
- (id)_focusGuideCreateIfNeeded:(BOOL)a3;
- (id)_leadingSeparatorCreateIfNeeded:(BOOL)a3;
- (id)_trailingSeparatorCreateIfNeeded:(BOOL)a3;
- (int64_t)layoutStyle;
- (void)_handleDisclosureButton:(id)a3;
- (void)_invalidateDisclosure;
- (void)_invalidateFocusGuide;
- (void)_invalidateHasContent;
- (void)_invalidateSeparators;
- (void)_setConstraints:(id)a3;
- (void)_setHasContent:(BOOL)a3;
- (void)_setNeedsUpdate;
- (void)_updateDisclosureIfNeeded;
- (void)_updateFocusGuideIfNeeded;
- (void)_updateHasContentIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSeparatorsIfNeeded;
- (void)performChanges:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureTitle:(id)a3;
- (void)setFont:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation PXUIWidgetFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__focusGuide, 0);
  objc_storeStrong((id *)&self->__trailingSeparator, 0);
  objc_storeStrong((id *)&self->__leadingSeparator, 0);
  objc_storeStrong((id *)&self->__disclosureButton, 0);
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_disclosureTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIFocusGuide)_focusGuide
{
  return self->__focusGuide;
}

- (UIView)_trailingSeparator
{
  return self->__trailingSeparator;
}

- (UIView)_leadingSeparator
{
  return self->__leadingSeparator;
}

- (UIButton)_disclosureButton
{
  return self->__disclosureButton;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (BOOL)_hasContent
{
  return self->__hasContent;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)disclosureTitle
{
  return self->_disclosureTitle;
}

- (PXUIWidgetFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXUIWidgetFooterViewDelegate *)WeakRetained;
}

- (void)_updateFocusGuideIfNeeded
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.focusGuide)
  {
    self->_needsUpdateFlags.focusGuide = 0;
    if ([(PXUIWidgetFooterView *)self _hasContent])
    {
      int64_t v3 = [(PXUIWidgetFooterView *)self layoutStyle];
      v4 = [(PXUIWidgetFooterView *)self _focusGuideCreateIfNeeded:v3 == 1];
      if (v3 == 1)
      {
        uint64_t v5 = [(PXUIWidgetFooterView *)self _disclosureButton];
        if (v5)
        {
          v6 = (void *)v5;
          v8[0] = v5;
          v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
          [v4 setPreferredFocusEnvironments:v7];

LABEL_8:
          return;
        }
      }
    }
    else
    {
      v4 = [(PXUIWidgetFooterView *)self _focusGuideCreateIfNeeded:0];
    }
    [v4 setPreferredFocusEnvironments:MEMORY[0x1E4F1CBF0]];
    goto LABEL_8;
  }
}

- (void)_invalidateFocusGuide
{
  self->_needsUpdateFlags.focusGuide = 1;
  [(PXUIWidgetFooterView *)self _setNeedsUpdate];
}

- (void)_updateSeparatorsIfNeeded
{
  if (self->_needsUpdateFlags.separators)
  {
    self->_needsUpdateFlags.separators = 0;
    BOOL v3 = 0;
    if ([(PXUIWidgetFooterView *)self _hasContent]) {
      BOOL v3 = [(PXUIWidgetFooterView *)self layoutStyle] == 1;
    }
    v4 = [(PXUIWidgetFooterView *)self _leadingSeparatorCreateIfNeeded:v3];
    uint64_t v5 = [(PXUIWidgetFooterView *)self _trailingSeparatorCreateIfNeeded:v3];
    v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.349999994 alpha:0.600000024];
    v7 = [(PXUIWidgetFooterView *)self _accessibilityHigherContrastTintColorForColor:v6];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PXUIWidgetFooterView__updateSeparatorsIfNeeded__block_invoke;
    v10[3] = &unk_1E5DB1848;
    BOOL v12 = v3;
    id v11 = v7;
    id v8 = v7;
    v9 = (void (**)(void *, void *))_Block_copy(v10);
    v9[2](v9, v4);
    v9[2](v9, v5);
  }
}

void __49__PXUIWidgetFooterView__updateSeparatorsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v3 setBackgroundColor:*(void *)(a1 + 32)];
    id v3 = v5;
    BOOL v4 = *(unsigned char *)(a1 + 40) == 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  [v3 setHidden:v4];
}

- (void)_invalidateSeparators
{
  self->_needsUpdateFlags.separators = 1;
  [(PXUIWidgetFooterView *)self _setNeedsUpdate];
}

- (void)_updateDisclosureIfNeeded
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.disclosure)
  {
    self->_needsUpdateFlags.disclosure = 0;
    id v3 = [(PXUIWidgetFooterView *)self disclosureTitle];
    uint64_t v4 = [v3 length];
    id v5 = [(PXUIWidgetFooterView *)self _disclosureButtonCreateIfNeeded:v4 != 0];
    if (v4)
    {
      if ([(PXUIWidgetFooterView *)self layoutStyle] != 1)
      {
        id v8 = [(PXUIWidgetFooterView *)self font];
        v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
        }
        id v11 = v10;

        if (v3)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v14 = *MEMORY[0x1E4FB06F8];
          v15[0] = v11;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
          v7 = (void *)[v12 initWithString:v3 attributes:v13];
        }
        else
        {
          v7 = 0;
        }

        id v6 = 0;
        goto LABEL_14;
      }
      id v6 = v3;
    }
    else
    {
      id v6 = 0;
    }
    v7 = 0;
LABEL_14:
    objc_msgSend(v5, "px_setTitle:orAttributedTitle:forState:", v6, v7, 0);
    [v5 setHidden:v4 == 0];
  }
}

- (void)_invalidateDisclosure
{
  self->_needsUpdateFlags.disclosure = 1;
  [(PXUIWidgetFooterView *)self _setNeedsUpdate];
}

- (void)_updateHasContentIfNeeded
{
  if (self->_needsUpdateFlags.hasContent)
  {
    self->_needsUpdateFlags.hasContent = 0;
    id v3 = [(PXUIWidgetFooterView *)self disclosureTitle];
    BOOL v4 = [v3 length] != 0;

    [(PXUIWidgetFooterView *)self _setHasContent:v4];
  }
}

- (void)_invalidateHasContent
{
  self->_needsUpdateFlags.hasContent = 1;
  [(PXUIWidgetFooterView *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXUIWidgetFooterView.m" lineNumber:259 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.hasContent
      || self->_needsUpdateFlags.disclosure
      || self->_needsUpdateFlags.separators
      || self->_needsUpdateFlags.focusGuide;
}

- (void)_updateIfNeeded
{
  if ([(PXUIWidgetFooterView *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXUIWidgetFooterView *)self _updateHasContentIfNeeded];
    [(PXUIWidgetFooterView *)self _updateDisclosureIfNeeded];
    [(PXUIWidgetFooterView *)self _updateSeparatorsIfNeeded];
    [(PXUIWidgetFooterView *)self _updateFocusGuideIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXUIWidgetFooterView *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXUIWidgetFooterView.m" lineNumber:246 description:@"update still needed after update pass"];
    }
  }
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  id v6 = v4;
  if (v4)
  {
    v4[2](v4);
    id v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXUIWidgetFooterView *)self _updateIfNeeded];
    id v4 = v6;
  }
}

- (void)_handleDisclosureButton:(id)a3
{
  if (self->_delegateRespondsTo.didSelectDisclosure)
  {
    id v4 = a3;
    id v5 = [(PXUIWidgetFooterView *)self delegate];
    [v5 widgetFooterView:self didSelectDisclosure:v4];
  }
}

- (void)_setConstraints:(id)a3
{
  id v8 = (NSArray *)a3;
  id v4 = self->__constraints;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (self->__constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      id v6 = (NSArray *)[(NSArray *)v8 copy];
      constraints = self->__constraints;
      self->__constraints = v6;

      if (self->__constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:");
      }
    }
  }
}

- (void)_setHasContent:(BOOL)a3
{
  if (self->__hasContent != a3)
  {
    self->__hasContent = a3;
    [(PXUIWidgetFooterView *)self setNeedsUpdateConstraints];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__PXUIWidgetFooterView__setHasContent___block_invoke;
    v4[3] = &unk_1E5DD36F8;
    v4[4] = self;
    [(PXUIWidgetFooterView *)self performChanges:v4];
  }
}

uint64_t __39__PXUIWidgetFooterView__setHasContent___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateSeparators];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateFocusGuide];
}

- (id)_focusGuideCreateIfNeeded:(BOOL)a3
{
  focusGuide = self->__focusGuide;
  if (focusGuide) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E4FB1780]);
    v7 = self->__focusGuide;
    self->__focusGuide = v6;

    [(PXUIWidgetFooterView *)self addLayoutGuide:self->__focusGuide];
    id v8 = [(UIFocusGuide *)self->__focusGuide leftAnchor];
    v9 = [(PXUIWidgetFooterView *)self leftAnchor];
    id v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    id v11 = [(UIFocusGuide *)self->__focusGuide topAnchor];
    id v12 = [(PXUIWidgetFooterView *)self topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    uint64_t v14 = [(UIFocusGuide *)self->__focusGuide bottomAnchor];
    v15 = [(PXUIWidgetFooterView *)self bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UIFocusGuide *)self->__focusGuide rightAnchor];
    v18 = [(PXUIWidgetFooterView *)self rightAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    focusGuide = self->__focusGuide;
  }
  return focusGuide;
}

- (id)_trailingSeparatorCreateIfNeeded:(BOOL)a3
{
  trailingSeparator = self->__trailingSeparator;
  if (trailingSeparator) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v7 = self->__trailingSeparator;
    self->__trailingSeparator = v6;

    [(UIView *)self->__trailingSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXUIWidgetFooterView *)self addSubview:self->__trailingSeparator];
    trailingSeparator = self->__trailingSeparator;
  }
  return trailingSeparator;
}

- (id)_leadingSeparatorCreateIfNeeded:(BOOL)a3
{
  leadingSeparator = self->__leadingSeparator;
  if (leadingSeparator) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v7 = self->__leadingSeparator;
    self->__leadingSeparator = v6;

    [(UIView *)self->__leadingSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXUIWidgetFooterView *)self addSubview:self->__leadingSeparator];
    leadingSeparator = self->__leadingSeparator;
  }
  return leadingSeparator;
}

- (id)_disclosureButtonCreateIfNeeded:(BOOL)a3
{
  disclosureButton = self->__disclosureButton;
  if (disclosureButton) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    v7 = self->__disclosureButton;
    self->__disclosureButton = v6;

    [(UIButton *)self->__disclosureButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->__disclosureButton addTarget:self action:sel__handleDisclosureButton_ forControlEvents:0x2000];
    [(PXUIWidgetFooterView *)self addSubview:self->__disclosureButton];
    disclosureButton = self->__disclosureButton;
  }
  return disclosureButton;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXUIWidgetFooterView;
  [(PXUIWidgetFooterView *)&v4 tintColorDidChange];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXUIWidgetFooterView_tintColorDidChange__block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXUIWidgetFooterView *)self performChanges:v3];
}

uint64_t __42__PXUIWidgetFooterView_tintColorDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSeparators];
}

- (void)updateConstraints
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PXUIWidgetFooterView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E5DB1820;
  id v4 = v3;
  id v42 = v4;
  BOOL v5 = (void (**)(void *, void *, void *, double))_Block_copy(aBlock);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__PXUIWidgetFooterView_updateConstraints__block_invoke_2;
  v39[3] = &unk_1E5DB1820;
  id v6 = v4;
  id v40 = v6;
  v7 = (void (**)(void *, void *, void *, double))_Block_copy(v39);
  if ([(PXUIWidgetFooterView *)self _hasContent])
  {
    id v8 = [(PXUIWidgetFooterView *)self _disclosureButton];
    v9 = [(PXUIWidgetFooterView *)self _leadingSeparator];
    v35 = [(PXUIWidgetFooterView *)self _trailingSeparator];
    [(PXUIWidgetFooterView *)self contentInsets];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v37 = _NSDictionaryOfVariableBindings(&cfstr_Leadingseparat.isa, v9, v8, v35, 0);
    v43[0] = @"leadingMargin";
    v18 = [NSNumber numberWithDouble:v13];
    v44[0] = v18;
    v43[1] = @"trailingMargin";
    v19 = [NSNumber numberWithDouble:v17];
    v43[2] = @"padding";
    v44[1] = v19;
    v44[2] = &unk_1F02DBA18;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

    v20 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-leadingMargin-[leadingSeparator(trailingSeparator)]-padding-[button(>=200)]-padding-[trailingSeparator(<=885@249)]-trailingMargin-|" options:1024 metrics:v36 views:v37];
    [v6 addObjectsFromArray:v20];

    v21 = [v8 topAnchor];
    v22 = [(PXUIWidgetFooterView *)self topAnchor];
    v7[2](v7, v21, v22, v11);

    v23 = [v9 centerYAnchor];
    v24 = [(PXUIWidgetFooterView *)self centerYAnchor];
    v5[2](v5, v23, v24, 0.0);

    v25 = [v8 centerYAnchor];
    v26 = [(PXUIWidgetFooterView *)self centerYAnchor];
    v5[2](v5, v25, v26, 0.0);

    v27 = [v35 centerYAnchor];
    v28 = [(PXUIWidgetFooterView *)self centerYAnchor];
    v5[2](v5, v27, v28, 0.0);

    v29 = [v9 heightAnchor];
    v30 = [v29 constraintEqualToConstant:2.0];
    [v30 setActive:1];

    v31 = [v35 heightAnchor];
    v32 = [v31 constraintEqualToConstant:2.0];
    [v32 setActive:1];

    v33 = [(PXUIWidgetFooterView *)self bottomAnchor];
    v34 = [v8 bottomAnchor];
    v7[2](v7, v33, v34, v15);
  }
  [(PXUIWidgetFooterView *)self _setConstraints:v6];
  v38.receiver = self;
  v38.super_class = (Class)PXUIWidgetFooterView;
  [(PXUIWidgetFooterView *)&v38 updateConstraints];
}

void __41__PXUIWidgetFooterView_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && a3)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "constraintEqualToAnchor:constant:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }
}

void __41__PXUIWidgetFooterView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && a3)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "constraintGreaterThanOrEqualToAnchor:constant:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    [(PXUIWidgetFooterView *)self setNeedsUpdateConstraints];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(PXUIWidgetFooterView *)self setNeedsUpdateConstraints];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__PXUIWidgetFooterView_setLayoutStyle___block_invoke;
    v4[3] = &unk_1E5DD36F8;
    v4[4] = self;
    [(PXUIWidgetFooterView *)self performChanges:v4];
  }
}

uint64_t __39__PXUIWidgetFooterView_setLayoutStyle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateSeparators];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateFocusGuide];
}

- (void)setFont:(id)a3
{
  BOOL v5 = (UIFont *)a3;
  id v6 = self->_font;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(UIFont *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __32__PXUIWidgetFooterView_setFont___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [(PXUIWidgetFooterView *)self performChanges:v9];
    }
  }
}

uint64_t __32__PXUIWidgetFooterView_setFont___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateDisclosure];
}

- (void)setDisclosureTitle:(id)a3
{
  id v4 = (NSString *)a3;
  BOOL v5 = self->_disclosureTitle;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSString *)v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      char v8 = (NSString *)[(NSString *)v4 copy];
      disclosureTitle = self->_disclosureTitle;
      self->_disclosureTitle = v8;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __43__PXUIWidgetFooterView_setDisclosureTitle___block_invoke;
      v10[3] = &unk_1E5DD36F8;
      void v10[4] = self;
      [(PXUIWidgetFooterView *)self performChanges:v10];
    }
  }
}

uint64_t __43__PXUIWidgetFooterView_setDisclosureTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateHasContent];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateDisclosure];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectDisclosure = objc_opt_respondsToSelector() & 1;
  }
}

@end