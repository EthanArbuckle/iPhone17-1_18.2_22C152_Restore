@interface WFColorPicker
- (CGSize)intrinsicContentSize;
- (NSArray)colorNames;
- (NSArray)colors;
- (UICollectionView)colorCollectionView;
- (WFColor)selectedColor;
- (WFColorPicker)initWithFrame:(CGRect)a3;
- (WFColorPickerDelegate)delegate;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setColorCollectionView:(id)a3;
- (void)setColorNames:(id)a3;
- (void)setColors:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedColor:(id)a3;
@end

@implementation WFColorPicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCollectionView, 0);
  objc_storeStrong((id *)&self->_colorNames, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

- (void)setColorCollectionView:(id)a3
{
}

- (UICollectionView)colorCollectionView
{
  return self->_colorCollectionView;
}

- (void)setColorNames:(id)a3
{
}

- (NSArray)colorNames
{
  return self->_colorNames;
}

- (void)setColors:(id)a3
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setDelegate:(id)a3
{
}

- (WFColorPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFColorPickerDelegate *)WeakRetained;
}

- (WFColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
  id v5 = a3;
  id v9 = [(WFColorPicker *)self colorCollectionView];
  v6 = (void *)MEMORY[0x263F088C8];
  v7 = [(WFColorPicker *)self colors];
  v8 = objc_msgSend(v6, "indexPathForItem:inSection:", objc_msgSend(v7, "indexOfObject:", v5), 0);

  [v9 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(WFColorPicker *)self colors];
  uint64_t v7 = [v5 item];

  v8 = [(id)v6 objectAtIndexedSubscript:v7];
  selectedColor = self->_selectedColor;
  self->_selectedColor = v8;

  v10 = [(WFColorPicker *)self delegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v11 = [(WFColorPicker *)self delegate];
    [v11 colorPicker:self didSelectColor:self->_selectedColor];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:v6];
  v8 = [(WFColorPicker *)self colors];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = [v9 paletteGradient];
  [v7 setGradient:v10];

  id v11 = [(WFColorPicker *)self colorNames];
  uint64_t v12 = [v6 item];

  v13 = [v11 objectAtIndexedSubscript:v12];
  [v7 setColorName:v13];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(WFColorPicker *)self colors];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFColorPicker;
  [(WFColorPicker *)&v3 safeAreaInsetsDidChange];
  [(WFColorPicker *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 205.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)WFColorPicker;
  [(WFColorPicker *)&v11 layoutSubviews];
  [(WFColorPicker *)self bounds];
  double Height = CGRectGetHeight(v12);
  [(WFColorPicker *)self safeAreaInsets];
  double v5 = Height - v4;
  double v6 = Height - v4 + -195.000007;
  double v7 = floor(v6 * 0.230769232) + 45.0;
  if (v6 >= 0.0) {
    double v8 = 45.0;
  }
  else {
    double v8 = v7;
  }
  id v9 = [(WFColorPicker *)self colorCollectionView];
  v10 = [v9 collectionViewLayout];

  objc_msgSend(v10, "setItemSize:", v8, v8);
  [v10 setMinimumLineSpacing:v8 / 3.0];
  [v10 setMinimumInteritemSpacing:v8 / 3.0];
  objc_msgSend(v10, "setSectionInset:", v5 + v8 * -4.0, v8 / 3.0, v8 / 3.0, v8 / 3.0);
}

- (WFColorPicker)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)WFColorPicker;
  double v3 = -[WFColorPicker initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x263F825C8] clearColor];
    [(WFColorPicker *)v3 setBackgroundColor:v4];

    double v5 = [MEMORY[0x263F851A8] workflowPalette];
    [(WFColorPicker *)v3 setColors:v5];

    double v6 = [MEMORY[0x263F851A8] workflowPaletteNames];
    [(WFColorPicker *)v3 setColorNames:v6];

    id v29 = objc_alloc_init(MEMORY[0x263F82570]);
    id v7 = objc_alloc(MEMORY[0x263F82528]);
    double v8 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v29, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v9 = [MEMORY[0x263F825C8] clearColor];
    [v8 setBackgroundColor:v9];

    [v8 setScrollEnabled:0];
    [v8 setDelaysContentTouches:0];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setDelegate:v3];
    [v8 setDataSource:v3];
    [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CellIdentifier"];
    [(WFColorPicker *)v3 addSubview:v8];
    [(WFColorPicker *)v3 setColorCollectionView:v8];
    v22 = (void *)MEMORY[0x263F08938];
    v28 = [v8 topAnchor];
    v27 = [(WFColorPicker *)v3 topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [v8 leadingAnchor];
    v24 = [(WFColorPicker *)v3 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v31[1] = v23;
    v10 = [v8 trailingAnchor];
    objc_super v11 = [(WFColorPicker *)v3 trailingAnchor];
    CGRect v12 = [v10 constraintEqualToAnchor:v11];
    v31[2] = v12;
    v13 = [v8 bottomAnchor];
    v14 = [(WFColorPicker *)v3 safeAreaLayoutGuide];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v31[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    [v22 activateConstraints:v17];

    LODWORD(v18) = 1144750080;
    [(WFColorPicker *)v3 setContentCompressionResistancePriority:1 forAxis:v18];
    LODWORD(v19) = 1144750080;
    [(WFColorPicker *)v3 setContentHuggingPriority:1 forAxis:v19];
    v20 = v3;
  }
  return v3;
}

@end