@interface TTRICustomRecurrenceTableViewCell
+ (BOOL)vibrant;
+ (double)rowSeparatorThickness;
+ (id)reuseIdentifier;
- (BOOL)drawsOwnRowSeparators;
- (BOOL)usesInsetMargin;
- (UIColor)rowSeparatorColor;
- (UIVisualEffect)rowSeparatorVisualEffect;
- (void)_layoutSeparator;
- (void)_setMarginExtendsToFullWidth:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDrawsOwnRowSeparators:(BOOL)a3;
- (void)setRowSeparatorColor:(id)a3;
- (void)setRowSeparatorVisualEffect:(id)a3;
- (void)setUsesInsetMargin:(BOOL)a3;
@end

@implementation TTRICustomRecurrenceTableViewCell

+ (id)reuseIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__TTRICustomRecurrenceTableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_0 != -1) {
    dispatch_once(&reuseIdentifier_onceToken_0, block);
  }
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;

  return v2;
}

void __52__TTRICustomRecurrenceTableViewCell_reuseIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  v2 = (void *)reuseIdentifier_reuseIdentifier_0;
  reuseIdentifier_reuseIdentifier_0 = v1;
}

+ (double)rowSeparatorThickness
{
  EKUIScaleFactor();
  return 1.0 / v2;
}

+ (BOOL)vibrant
{
  return 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TTRICustomRecurrenceTableViewCell;
  [(TTRICustomRecurrenceTableViewCell *)&v3 layoutSubviews];
  [(TTRICustomRecurrenceTableViewCell *)self _layoutSeparator];
}

- (void)_layoutSeparator
{
  if (self->_separatorViewForNonOpaqueTables)
  {
    [(id)objc_opt_class() rowSeparatorThickness];
    double v4 = v3;
    [(TTRICustomRecurrenceTableViewCell *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    BOOL v11 = [(TTRICustomRecurrenceTableViewCell *)self usesInsetMargin];
    double v12 = 15.0;
    if (!v11) {
      double v12 = v6;
    }
    separatorViewForNonOpaqueTables = self->_separatorViewForNonOpaqueTables;
    -[TTRICustomRecurrenceCellRowSeparatorView setFrame:](separatorViewForNonOpaqueTables, "setFrame:", v12, v10 - v4, v8, v4);
  }
}

- (void)setUsesInsetMargin:(BOOL)a3
{
  self->_usesInsetMargin = a3;
  [(TTRICustomRecurrenceTableViewCell *)self _setMarginExtendsToFullWidth:!a3];
}

- (void)setRowSeparatorColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_rowSeparatorColor, a3);
  separatorViewForNonOpaqueTables = self->_separatorViewForNonOpaqueTables;
  if (separatorViewForNonOpaqueTables) {
    [(TTRICustomRecurrenceCellRowSeparatorView *)separatorViewForNonOpaqueTables setBackgroundColor:self->_rowSeparatorColor];
  }
}

- (void)setRowSeparatorVisualEffect:(id)a3
{
  p_rowSeparatorVisualEffect = &self->_rowSeparatorVisualEffect;
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, a3);
  id v6 = a3;
  [(UIVisualEffectView *)self->_rowSeparatorParentView setEffect:*p_rowSeparatorVisualEffect];
}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = self;
  id v20 = v4;
  if ([(id)objc_opt_class() vibrant])
  {
    if (v3 && !v4->_rowSeparatorParentView)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1F00]);
      [(TTRICustomRecurrenceTableViewCell *)v4 bounds];
      uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
      rowSeparatorParentView = v4->_rowSeparatorParentView;
      v4->_rowSeparatorParentView = (UIVisualEffectView *)v6;

      uint64_t v8 = [(TTRICustomRecurrenceTableViewCell *)v4 rowSeparatorVisualEffect];
      rowSeparatorVisualEffect = v4->_rowSeparatorVisualEffect;
      v4->_rowSeparatorVisualEffect = (UIVisualEffect *)v8;

      [(UIVisualEffectView *)v4->_rowSeparatorParentView setAutoresizingMask:18];
      double v10 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIVisualEffectView *)v4->_rowSeparatorParentView setBackgroundColor:v10];

      [(TTRICustomRecurrenceTableViewCell *)v4 addSubview:v4->_rowSeparatorParentView];
    }
    id v20 = [(UIVisualEffectView *)v4->_rowSeparatorParentView contentView];
  }
  v4->_drawsOwnRowSeparators = v3;
  separatorViewForNonOpaqueTables = v4->_separatorViewForNonOpaqueTables;
  if (v3)
  {
    if (!separatorViewForNonOpaqueTables)
    {
      double v12 = objc_alloc_init(TTRICustomRecurrenceCellRowSeparatorView);
      v13 = v4->_separatorViewForNonOpaqueTables;
      v4->_separatorViewForNonOpaqueTables = v12;

      -[TTRICustomRecurrenceCellRowSeparatorView setVibrant:](v4->_separatorViewForNonOpaqueTables, "setVibrant:", [(id)objc_opt_class() vibrant]);
      if ([(id)objc_opt_class() vibrant])
      {
        v14 = [(UIVisualEffectView *)v4->_rowSeparatorParentView contentView];
        uint64_t v15 = [v14 tintColor];
      }
      else
      {
        v14 = [(TTRICustomRecurrenceTableViewCell *)v4 rowSeparatorColor];
        if (v14) {
          [(TTRICustomRecurrenceTableViewCell *)v4 rowSeparatorColor];
        }
        else {
        uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.78 alpha:1.0];
        }
      }
      v17 = (void *)v15;
      [(TTRICustomRecurrenceCellRowSeparatorView *)v4->_separatorViewForNonOpaqueTables setBackgroundColor:v15];

      [v20 addSubview:v4->_separatorViewForNonOpaqueTables];
    }
  }
  else if (separatorViewForNonOpaqueTables)
  {
    [(TTRICustomRecurrenceCellRowSeparatorView *)separatorViewForNonOpaqueTables removeFromSuperview];
    v16 = v4->_separatorViewForNonOpaqueTables;
    v4->_separatorViewForNonOpaqueTables = 0;
  }
  if ([(id)objc_opt_class() vibrant])
  {
    if (!v4->_drawsOwnRowSeparators)
    {
      v18 = v4->_rowSeparatorParentView;
      if (v18)
      {
        [(UIVisualEffectView *)v18 removeFromSuperview];
        v19 = v4->_rowSeparatorParentView;
        v4->_rowSeparatorParentView = 0;
      }
    }
  }
}

- (void)_setMarginExtendsToFullWidth:(BOOL)a3
{
  double v3 = 15.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(TTRICustomRecurrenceTableViewCell *)self _setMarginWidth:v3];
}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (UIColor)rowSeparatorColor
{
  return self->_rowSeparatorColor;
}

- (UIVisualEffect)rowSeparatorVisualEffect
{
  return self->_rowSeparatorVisualEffect;
}

- (BOOL)usesInsetMargin
{
  return self->_usesInsetMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_rowSeparatorColor, 0);
  objc_storeStrong((id *)&self->_separatorViewForNonOpaqueTables, 0);

  objc_storeStrong((id *)&self->_rowSeparatorParentView, 0);
}

@end