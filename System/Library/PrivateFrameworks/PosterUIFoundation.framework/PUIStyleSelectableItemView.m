@interface PUIStyleSelectableItemView
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (PUIShapeView)selectionView;
- (PUIStyleSelectableItemView)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PUIStyleSelectableItemView

- (PUIStyleSelectableItemView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)PUIStyleSelectableItemView;
  v3 = -[PUIStyleSelectableItemView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    Mutable = CGPathCreateMutable();
    [(PUIStyleSelectableItemView *)v3 intrinsicContentSize];
    v38.size.width = v5;
    v38.size.height = v6;
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    CGRect v39 = CGRectInset(v38, 1.0, 1.0);
    CGPathAddEllipseInRect(Mutable, 0, v39);
    v7 = objc_alloc_init(PUIShapeView);
    v8 = [(PUIShapeView *)v7 shapeLayer];
    [v8 setPath:Mutable];
    [v8 setLineWidth:3.0];
    id v9 = [MEMORY[0x263F1C550] systemBlueColor];
    v32 = v8;
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    id v10 = [MEMORY[0x263F1C550] clearColor];
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v10, "CGColor"));

    [(PUIShapeView *)v7 setHidden:1];
    [(PUIShapeView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStyleSelectableItemView *)v3 addSubview:v7];
    selectionView = v3->_selectionView;
    v3->_selectionView = v7;
    v12 = v7;

    CGPathRelease(Mutable);
    v26 = (void *)MEMORY[0x263F08938];
    v31 = [(PUIShapeView *)v12 topAnchor];
    v30 = [(PUIStyleSelectableItemView *)v3 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v37[0] = v29;
    v28 = [(PUIShapeView *)v12 leadingAnchor];
    v27 = [(PUIStyleSelectableItemView *)v3 leadingAnchor];
    v13 = [v28 constraintEqualToAnchor:v27];
    v37[1] = v13;
    v14 = [(PUIShapeView *)v12 trailingAnchor];
    v15 = [(PUIStyleSelectableItemView *)v3 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v37[2] = v16;
    v17 = [(PUIShapeView *)v12 bottomAnchor];
    v18 = [(PUIStyleSelectableItemView *)v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v37[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v26 activateConstraints:v20];

    v21 = self;
    v36 = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __44__PUIStyleSelectableItemView_initWithFrame___block_invoke;
    v33[3] = &unk_265470F88;
    id v34 = v32;
    id v23 = v32;
    id v24 = (id)[(PUIStyleSelectableItemView *)v3 registerForTraitChanges:v22 withHandler:v33];
  }
  return v3;
}

void __44__PUIStyleSelectableItemView_initWithFrame___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F1C550] systemBlueColor];
  objc_msgSend(v2, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

  v4 = *(void **)(a1 + 32);
  id v5 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v4, "setFillColor:", objc_msgSend(v5, "CGColor"));
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    id v4 = [(PUIStyleSelectableItemView *)self selectionView];
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