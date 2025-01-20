@interface VUIBaseCollectionViewCell
- (BOOL)isBeingDisplayed;
- (BOOL)shouldAppearSelected;
- (BOOL)vui_addSubview:(id)a3 oldView:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (UIColor)backgroundColor;
- (UIColor)highlightedBackgroundColor;
- (UIView)preview;
- (VUIBaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (VUICollectionViewCellInteractor)vuiCollectionViewCellInteractor;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)didEndDisplaying;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
- (void)setBeingDisplayed:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setPreview:(id)a3;
- (void)setShouldAppearSelected:(BOOL)a3;
- (void)setVuiCollectionViewCellInteractor:(id)a3;
- (void)setupPreview;
- (void)vui_prepareForReuse;
- (void)vui_setHighlighted:(BOOL)a3;
- (void)vui_setSelected:(BOOL)a3;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)willBeDisplayed;
@end

@implementation VUIBaseCollectionViewCell

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setVuiCollectionViewCellInteractor:(id)a3
{
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (VUIBaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIBaseCollectionViewCell;
  double v3 = -[VUIBaseCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(VUIBaseCollectionViewCell *)v3 setupPreview];
  }
  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VUIBaseCollectionViewCell;
  [(VUIBaseCollectionViewCell *)&v6 layoutSubviews];
  [(VUIBaseCollectionViewCell *)self bounds];
  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
  v5 = [(VUIBaseCollectionViewCell *)self preview];
  [(VUIBaseCollectionViewCell *)self bounds];
  objc_msgSend(v5, "setFrame:");
}

- (void)setupPreview
{
  double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  preview = self->_preview;
  self->_preview = v3;

  [(UIView *)self->_preview setAlpha:0.0];
  id v5 = [(VUIBaseCollectionViewCell *)self preview];
  [(VUIBaseCollectionViewCell *)self addSubview:v5];
}

- (UIView)preview
{
  return self->_preview;
}

- (void)willBeDisplayed
{
  [(VUIBaseCollectionViewCell *)self setBeingDisplayed:1];
  [(VUIBaseCollectionViewCell *)self vui_cellWillBeDisplayed];
}

- (void)setBeingDisplayed:(BOOL)a3
{
  self->_beingDisplayed = a3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 forcedSize])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIBaseCollectionViewCell;
    id v5 = [(VUIBaseCollectionViewCell *)&v8 preferredLayoutAttributesFittingAttributes:v4];
  }
  objc_super v6 = v5;

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIBaseCollectionViewCell vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseCollectionViewCell;
  -[VUIBaseCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  [(VUIBaseCollectionViewCell *)self vui_setHighlighted:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUIBaseCollectionViewCell;
  [(VUIBaseCollectionViewCell *)&v3 prepareForReuse];
  [(VUIBaseCollectionViewCell *)self vui_prepareForReuse];
}

- (void)setShouldAppearSelected:(BOOL)a3
{
  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    -[VUIBaseCollectionViewCell vui_setSelected:](self, "vui_setSelected:");
  }
}

- (BOOL)vui_addSubview:(id)a3 oldView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(VUIBaseCollectionViewCell *)self vuiContentView];
  char v9 = objc_msgSend(v8, "vui_addSubview:oldView:", v7, v6);

  return v9;
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [(VUIBaseCollectionViewCell *)self highlightedBackgroundColor];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(VUIBaseCollectionViewCell *)self backgroundColor];

    if (v11)
    {
      v12 = [(VUIBaseCollectionViewCell *)self vuiContentView];
      if (v6) {
        [(VUIBaseCollectionViewCell *)self highlightedBackgroundColor];
      }
      else {
      v13 = [(VUIBaseCollectionViewCell *)self backgroundColor];
      }
      [v12 setVuiBackgroundColor:v13];
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = [(VUIBaseCollectionViewCell *)self vuiContentView];
  v15 = [v14 subviews];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "vui_setSelected:animated:withAnimationCoordinator:", v6, v5, v8);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

- (void)vui_setSelected:(BOOL)a3
{
}

- (void)vui_setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(VUIBaseCollectionViewCell *)self shouldAppearSelected]) {
    BOOL v3 = [(VUIBaseCollectionViewCell *)self shouldAppearSelected];
  }
  uint64_t v5 = [(VUIBaseCollectionViewCell *)self highlightedBackgroundColor];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    id v7 = [(VUIBaseCollectionViewCell *)self backgroundColor];

    if (v7)
    {
      id v8 = [(VUIBaseCollectionViewCell *)self vuiContentView];
      if ([(VUIBaseCollectionViewCell *)self isSelected] | v3) {
        [(VUIBaseCollectionViewCell *)self highlightedBackgroundColor];
      }
      else {
      uint64_t v9 = [(VUIBaseCollectionViewCell *)self backgroundColor];
      }
      [v8 setVuiBackgroundColor:v9];
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = [(VUIBaseCollectionViewCell *)self vuiContentView];
  v11 = [v10 subviews];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "vui_setHighlighted:", v3);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)vui_prepareForReuse
{
  [(VUIBaseCollectionViewCell *)self setBeingDisplayed:0];
  [(VUIBaseCollectionViewCell *)self setShouldAppearSelected:0];
  if ([(VUIBaseCollectionViewCell *)self vui_highlighted]) {
    [(VUIBaseCollectionViewCell *)self vui_setHighlighted:0];
  }
  if ([(VUIBaseCollectionViewCell *)self vui_selected])
  {
    [(VUIBaseCollectionViewCell *)self vui_setSelected:0];
  }
}

- (void)didEndDisplaying
{
  [(VUIBaseCollectionViewCell *)self setBeingDisplayed:0];
  [(VUIBaseCollectionViewCell *)self vui_cellDidEndDisplaying];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (BOOL)isBeingDisplayed
{
  return self->_beingDisplayed;
}

- (void)setPreview:(id)a3
{
}

- (VUICollectionViewCellInteractor)vuiCollectionViewCellInteractor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vuiCollectionViewCellInteractor);
  return (VUICollectionViewCellInteractor *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vuiCollectionViewCellInteractor);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end