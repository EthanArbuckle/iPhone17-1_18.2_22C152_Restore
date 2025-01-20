@interface PREditingColorItemView
- (NSString)localizedName;
- (PREditingColorItem)colorItem;
- (PREditingColorItemView)initWithColorItem:(id)a3;
- (UIView)itemView;
- (void)setColorItem:(id)a3;
- (void)setItemView:(id)a3;
- (void)updateForChangedColor;
@end

@implementation PREditingColorItemView

- (PREditingColorItemView)initWithColorItem:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PREditingColorItemView;
  v6 = -[PRSelectableEditingItemView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colorItem, a3);
    v8 = [v5 itemView];
    if (!v8)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v9 = [v5 displayColor];
      v10 = [v9 color];
      [(UIView *)v8 setBackgroundColor:v10];
    }
    v11 = [(UIView *)v8 layer];
    [v11 setCornerRadius:17.0];

    v12 = [(UIView *)v8 layer];
    id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    v14 = [(UIView *)v8 layer];
    [v14 setBorderWidth:2.0];

    [(UIView *)v8 setUserInteractionEnabled:0];
    [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1112014848;
    [(UIView *)v8 setContentCompressionResistancePriority:0 forAxis:v15];
    LODWORD(v16) = 1112014848;
    [(UIView *)v8 setContentCompressionResistancePriority:1 forAxis:v16];
    v17 = [(PRSelectableEditingItemView *)v7 selectionView];
    [(PREditingColorItemView *)v7 insertSubview:v8 aboveSubview:v17];

    itemView = v7->_itemView;
    v7->_itemView = v8;
    v19 = v8;

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UIView *)v19 topAnchor];
    v33 = [(PREditingColorItemView *)v7 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:5.0];
    v36[0] = v32;
    v31 = [(UIView *)v19 leadingAnchor];
    v30 = [(PREditingColorItemView *)v7 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:5.0];
    v36[1] = v29;
    v20 = [(UIView *)v19 trailingAnchor];
    v21 = [(PREditingColorItemView *)v7 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:-5.0];
    v36[2] = v22;
    v23 = [(UIView *)v19 bottomAnchor];
    v24 = [(PREditingColorItemView *)v7 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-5.0];
    v36[3] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v28 activateConstraints:v26];
  }
  return v7;
}

- (void)updateForChangedColor
{
  v3 = [(PREditingColorItem *)self->_colorItem itemView];

  if (!v3)
  {
    itemView = self->_itemView;
    id v6 = [(PREditingColorItem *)self->_colorItem displayColor];
    id v5 = [v6 color];
    [(UIView *)itemView setBackgroundColor:v5];
  }
}

- (NSString)localizedName
{
  return [(PREditingColorItem *)self->_colorItem localizedName];
}

- (PREditingColorItem)colorItem
{
  return self->_colorItem;
}

- (void)setColorItem:(id)a3
{
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_colorItem, 0);
}

@end