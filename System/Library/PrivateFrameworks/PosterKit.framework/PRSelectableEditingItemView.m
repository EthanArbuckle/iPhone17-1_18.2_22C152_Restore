@interface PRSelectableEditingItemView
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (PRSelectableEditingItemView)initWithFrame:(CGRect)a3;
- (PUIShapeView)selectionView;
- (void)setSelected:(BOOL)a3;
@end

@implementation PRSelectableEditingItemView

- (PRSelectableEditingItemView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PRSelectableEditingItemView;
  v3 = -[PRSelectableEditingItemView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    Mutable = CGPathCreateMutable();
    [(PRSelectableEditingItemView *)v3 intrinsicContentSize];
    v38.size.width = v5;
    v38.size.height = v6;
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    CGRect v39 = CGRectInset(v38, 1.0, 1.0);
    CGPathAddEllipseInRect(Mutable, 0, v39);
    id v7 = objc_alloc_init(MEMORY[0x1E4F92828]);
    v8 = [v7 shapeLayer];
    [v8 setPath:Mutable];
    [v8 setLineWidth:3.0];
    id v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v32 = v8;
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    id v10 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    [v7 setHidden:1];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRSelectableEditingItemView *)v3 addSubview:v7];
    selectionView = v3->_selectionView;
    v3->_selectionView = (PUIShapeView *)v7;
    id v12 = v7;

    CGPathRelease(Mutable);
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v31 = [v12 topAnchor];
    v30 = [(PRSelectableEditingItemView *)v3 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v37[0] = v29;
    v28 = [v12 leadingAnchor];
    v27 = [(PRSelectableEditingItemView *)v3 leadingAnchor];
    v13 = [v28 constraintEqualToAnchor:v27];
    v37[1] = v13;
    v14 = [v12 trailingAnchor];
    v15 = [(PRSelectableEditingItemView *)v3 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v37[2] = v16;
    v17 = [v12 bottomAnchor];
    v18 = [(PRSelectableEditingItemView *)v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v37[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v26 activateConstraints:v20];

    v21 = self;
    v36 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__PRSelectableEditingItemView_initWithFrame___block_invoke;
    v33[3] = &unk_1E54DACE8;
    id v34 = v32;
    id v23 = v32;
    id v24 = (id)[(PRSelectableEditingItemView *)v3 registerForTraitChanges:v22 withHandler:v33];
  }
  return v3;
}

void __45__PRSelectableEditingItemView_initWithFrame___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v4, "setFillColor:", objc_msgSend(v5, "CGColor"));
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    id v4 = [(PRSelectableEditingItemView *)self selectionView];
    [v4 setHidden:!v3];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (PUIShapeView)selectionView
{
  return self->_selectionView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
}

@end