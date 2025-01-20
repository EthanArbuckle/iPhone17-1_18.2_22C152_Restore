@interface WFGlyphPickerTabBar
- (UITabBar)tabBar;
- (WFGlyphPickerTabBar)initWithTabNames:(id)a3 tabCharacters:(id)a4;
- (WFGlyphPickerTabBarDelegate)delegate;
- (unint64_t)selectedTabIndex;
- (void)setDelegate:(id)a3;
- (void)setSelectedTabIndex:(unint64_t)a3;
- (void)setTabBar:(id)a3;
- (void)tabBar:(id)a3 didSelectItem:(id)a4;
@end

@implementation WFGlyphPickerTabBar

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTabBar:(id)a3
{
}

- (UITabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (UITabBar *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFGlyphPickerTabBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFGlyphPickerTabBarDelegate *)WeakRetained;
}

- (unint64_t)selectedTabIndex
{
  return self->_selectedTabIndex;
}

- (void)tabBar:(id)a3 didSelectItem:(id)a4
{
  id v5 = a4;
  self->_selectedTabIndex = [v5 tag];
  id v7 = [(WFGlyphPickerTabBar *)self delegate];
  uint64_t v6 = [v5 tag];

  [v7 glyphPickerTabBar:self didSelectTabAtIndex:v6];
}

- (void)setSelectedTabIndex:(unint64_t)a3
{
  self->_selectedTabIndex = a3;
  id v8 = [(WFGlyphPickerTabBar *)self tabBar];
  id v5 = [v8 items];
  uint64_t v6 = [v5 objectAtIndex:a3];
  id v7 = [(WFGlyphPickerTabBar *)self tabBar];
  [v7 setSelectedItem:v6];
}

- (WFGlyphPickerTabBar)initWithTabNames:(id)a3 tabCharacters:(id)a4
{
  v43[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFGlyphPickerTabBar.m", 26, @"Invalid parameter not satisfying: %@", @"tabNames.count == tabCharacters.count" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)WFGlyphPickerTabBar;
  v10 = -[WFGlyphPickerTabBar initWithFrame:](&v42, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v10)
  {
    v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.09];
    [(WFGlyphPickerTabBar *)v10 setBackgroundColor:v11];

    v12 = objc_opt_new();
    [v12 setDrawBackground:0];
    id v13 = objc_alloc_init(MEMORY[0x263F82C58]);
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setDelegate:v10];
    [v13 setItemPositioning:2];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __54__WFGlyphPickerTabBar_initWithTabNames_tabCharacters___block_invoke;
    v39[3] = &unk_2649CAF70;
    id v40 = v12;
    id v41 = v7;
    id v38 = v12;
    v14 = objc_msgSend(v8, "if_map:", v39);
    [v13 setItems:v14];

    v15 = [v13 items];
    v16 = [v15 firstObject];
    [v13 setSelectedItem:v16];

    [(WFGlyphPickerTabBar *)v10 addSubview:v13];
    objc_storeWeak((id *)&v10->_tabBar, v13);
    v17 = [(WFGlyphPickerTabBar *)v10 safeAreaLayoutGuide];
    v31 = (void *)MEMORY[0x263F08938];
    v37 = [v13 leadingAnchor];
    v36 = [v17 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v43[0] = v35;
    v33 = [v13 trailingAnchor];
    v34 = v17;
    v32 = [v17 trailingAnchor];
    v30 = [v33 constraintEqualToAnchor:v32];
    v43[1] = v30;
    v29 = [v13 bottomAnchor];
    v18 = [v17 bottomAnchor];
    v19 = [v29 constraintEqualToAnchor:v18];
    v43[2] = v19;
    v20 = [(WFGlyphPickerTabBar *)v10 heightAnchor];
    v21 = [v13 heightAnchor];
    [v20 constraintEqualToAnchor:v21];
    id v22 = v8;
    v24 = id v23 = v7;
    v43[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
    [v31 activateConstraints:v25];

    id v7 = v23;
    id v8 = v22;

    v26 = v10;
  }

  return v10;
}

id __54__WFGlyphPickerTabBar_initWithTabNames_tabCharacters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setGlyphCharacter:", (unsigned __int16)objc_msgSend(a2, "unsignedIntegerValue"));
  id v5 = objc_alloc(MEMORY[0x263F82C70]);
  uint64_t v6 = [*(id *)(a1 + 40) objectAtIndex:a3];
  id v7 = objc_msgSend(*(id *)(a1 + 32), "imageWithSize:", 17.0, 17.0);
  id v8 = [v7 UIImage];
  uint64_t v9 = (void *)[v5 initWithTitle:v6 image:v8 tag:a3];

  return v9;
}

@end