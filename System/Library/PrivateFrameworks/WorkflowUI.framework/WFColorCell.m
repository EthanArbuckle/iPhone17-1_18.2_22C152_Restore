@interface WFColorCell
- (BOOL)isAccessibilityElement;
- (NSString)colorName;
- (UIView)selectedRingView;
- (WFColorCell)initWithFrame:(CGRect)a3;
- (WFFloatingView)floatingView;
- (WFGradient)gradient;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setColorName:(id)a3;
- (void)setGradient:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedRingView:(id)a3;
@end

@implementation WFColorCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedRingView);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

- (void)setSelectedRingView:(id)a3
{
}

- (UIView)selectedRingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedRingView);
  return (UIView *)WeakRetained;
}

- (WFFloatingView)floatingView
{
  return self->_floatingView;
}

- (void)setColorName:(id)a3
{
}

- (NSString)colorName
{
  return self->_colorName;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F83260];
  int v3 = [(WFColorCell *)self isSelected];
  uint64_t v4 = *MEMORY[0x263F832A8];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFColorCell;
  -[WFColorCell setHighlighted:](&v6, sel_setHighlighted_);
  v5 = [(WFColorCell *)self floatingView];
  [v5 setPressed:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFColorCell;
  -[WFColorCell setSelected:](&v6, sel_setSelected_);
  v5 = [(WFColorCell *)self selectedRingView];
  [v5 setHidden:!v3];
}

- (void)setGradient:(id)a3
{
  id v4 = a3;
  id v5 = [(WFColorCell *)self floatingView];
  [v5 setGradient:v4];
}

- (WFGradient)gradient
{
  uint64_t v2 = [(WFColorCell *)self floatingView];
  BOOL v3 = [v2 gradient];

  return (WFGradient *)v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)WFColorCell;
  [(WFColorCell *)&v9 layoutSubviews];
  [(WFColorCell *)self frame];
  double v4 = (v3 + -4.0) * 0.5;
  id v5 = [(WFColorCell *)self selectedRingView];
  objc_super v6 = [v5 layer];
  [v6 setCornerRadius:v4];

  v7 = [(WFColorCell *)self selectedRingView];
  v8 = [v7 layer];
  [v8 setMasksToBounds:1];
}

- (WFColorCell)initWithFrame:(CGRect)a3
{
  v47[8] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)WFColorCell;
  double v3 = -[WFColorCell initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    id v5 = [(WFColorCell *)v3 contentView];
    id v6 = objc_alloc(MEMORY[0x263F87B40]);
    v7 = [MEMORY[0x263F87B48] paletteColorConfiguration];
    v8 = (void *)[v6 initWithConfiguration:v7];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = v4;
    floatingView = v4->_floatingView;
    v45->_floatingView = (WFFloatingView *)v8;
    id v10 = v8;

    [v5 addSubview:v10];
    id v11 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v11 setHidden:1];
    v12 = [v11 layer];
    [v12 setBorderWidth:1.0];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = [MEMORY[0x263F825C8] systemBackgroundColor];
    uint64_t v14 = [v13 CGColor];
    v15 = [v11 layer];
    [v15 setBorderColor:v14];

    [v10 addSubview:v11];
    objc_storeWeak((id *)&v45->_selectedRingView, v11);
    v32 = (void *)MEMORY[0x263F08938];
    v44 = [v10 topAnchor];
    v43 = [v5 topAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v47[0] = v42;
    v41 = [v10 leadingAnchor];
    v39 = [v5 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v39];
    v47[1] = v38;
    v37 = [v10 bottomAnchor];
    v40 = v5;
    v36 = [v5 bottomAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v47[2] = v35;
    v34 = [v10 trailingAnchor];
    v33 = [v5 trailingAnchor];
    v31 = [v34 constraintEqualToAnchor:v33];
    v47[3] = v31;
    v30 = [v11 topAnchor];
    v29 = [v10 topAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:2.0];
    v47[4] = v28;
    v27 = [v11 leadingAnchor];
    v26 = [v10 leadingAnchor];
    v16 = [v27 constraintEqualToAnchor:v26 constant:2.0];
    v47[5] = v16;
    v17 = [v11 bottomAnchor];
    v18 = [v10 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:-2.0];
    v47[6] = v19;
    v20 = [v11 trailingAnchor];
    v21 = [v10 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:-2.0];
    v47[7] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:8];
    [v32 activateConstraints:v23];

    double v4 = v45;
    v24 = v45;
  }
  return v4;
}

@end