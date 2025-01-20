@interface WFGlyphPicker
+ (unint64_t)numberOfSections;
- (BOOL)useOutlineGlyphsOnly;
- (NSArray)glyphSections;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIEdgeInsets)sectionInset;
- (UISegmentedControl)segmentedControl;
- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5;
- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5 useSystemGlyphsOnly:(BOOL)a6 useOutlineGlyphsOnly:(BOOL)a7;
- (WFGlyphPickerDelegate)delegate;
- (WFGlyphPickerTabBar)tabBar;
- (double)glyphDimension;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)indexPathForGlyphCharacter:(unsigned __int16)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)control;
- (int64_t)lastEvent;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unsigned)glyphCharacterAtIndexPath:(id)a3;
- (unsigned)selectedGlyphCharacter;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)glyphPickerTabBar:(id)a3 didSelectTabAtIndex:(unint64_t)a4;
- (void)layoutSubviews;
- (void)pickedSegment:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)scrollToSection:(int64_t)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setControl:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setGlyphDimension:(double)a3;
- (void)setGlyphSections:(id)a3;
- (void)setLastEvent:(int64_t)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSelectedGlyphCharacter:(unsigned __int16)a3;
- (void)setTabBar:(id)a3;
- (void)setUseOutlineGlyphsOnly:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFGlyphPicker

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_glyphSections, 0);
  objc_destroyWeak((id *)&self->_collectionViewLayout);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastEvent:(int64_t)a3
{
  self->_lastEvent = a3;
}

- (int64_t)lastEvent
{
  return self->_lastEvent;
}

- (void)setUseOutlineGlyphsOnly:(BOOL)a3
{
  self->_useOutlineGlyphsOnly = a3;
}

- (BOOL)useOutlineGlyphsOnly
{
  return self->_useOutlineGlyphsOnly;
}

- (void)setTabBar:(id)a3
{
}

- (WFGlyphPickerTabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (WFGlyphPickerTabBar *)WeakRetained;
}

- (void)setControl:(int64_t)a3
{
  self->_control = a3;
}

- (int64_t)control
{
  return self->_control;
}

- (void)setGlyphSections:(id)a3
{
}

- (NSArray)glyphSections
{
  return self->_glyphSections;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewLayout);
  return (UICollectionViewFlowLayout *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setGlyphDimension:(double)a3
{
  self->_glyphDimension = a3;
}

- (double)glyphDimension
{
  return self->_glyphDimension;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (unsigned)selectedGlyphCharacter
{
  return self->_selectedGlyphCharacter;
}

- (void)setDelegate:(id)a3
{
}

- (WFGlyphPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFGlyphPickerDelegate *)WeakRetained;
}

- (void)scrollToSection:(int64_t)a3
{
  v5 = [MEMORY[0x263F33718] sharedContext];
  if ([v5 shouldReverseLayoutDirection]) {
    uint64_t v6 = 32;
  }
  else {
    uint64_t v6 = 8;
  }

  id v8 = [(WFGlyphPicker *)self collectionView];
  v7 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:a3];
  [v8 scrollToItemAtIndexPath:v7 atScrollPosition:v6 animated:0];
}

- (void)glyphPickerTabBar:(id)a3 didSelectTabAtIndex:(unint64_t)a4
{
  [(WFGlyphPicker *)self scrollToSection:a4];
  [(WFGlyphPicker *)self setLastEvent:2];
}

- (void)pickedSegment:(id)a3
{
  -[WFGlyphPicker scrollToSection:](self, "scrollToSection:", [a3 selectedSegmentIndex]);
  [(WFGlyphPicker *)self setLastEvent:1];
}

- (id)indexPathForGlyphCharacter:(unsigned __int16)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v4 = [(WFGlyphPicker *)self glyphSections];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__WFGlyphPicker_indexPathForGlyphCharacter___block_invoke;
  v7[3] = &unk_2649CABD0;
  unsigned __int16 v8 = a3;
  v7[4] = &v9;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __44__WFGlyphPicker_indexPathForGlyphCharacter___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = NSNumber;
  uint64_t v8 = *(unsigned __int16 *)(a1 + 40);
  id v9 = a2;
  v10 = [v7 numberWithUnsignedShort:v8];
  uint64_t v11 = [v9 indexOfObject:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [MEMORY[0x263F088C8] indexPathForItem:v11 inSection:a3];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

- (unsigned)glyphCharacterAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGlyphPicker *)self glyphSections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));

  uint64_t v7 = [v4 item];
  uint64_t v8 = [v6 objectAtIndex:v7];
  LOWORD(v4) = [v8 unsignedIntegerValue];

  return (unsigned __int16)v4;
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![(WFGlyphPicker *)self lastEvent])
  {
    uint64_t v7 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [v6 indexPathsForVisibleItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v12), "section"));
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    id v14 = [v7 allObjects];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__WFGlyphPicker_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v21[3] = &unk_2649CABA8;
    id v22 = v7;
    id v15 = v7;
    v16 = [v14 sortedArrayUsingComparator:v21];

    v17 = [v16 lastObject];
    uint64_t v18 = [v17 unsignedIntegerValue];

    int64_t v19 = [(WFGlyphPicker *)self control];
    if (v19 == 1)
    {
      v20 = [(WFGlyphPicker *)self segmentedControl];
      [v20 setSelectedSegmentIndex:v18];
    }
    else
    {
      if (v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      v20 = [(WFGlyphPicker *)self tabBar];
      [v20 setSelectedTabIndex:v18];
    }

    goto LABEL_14;
  }
LABEL_15:
}

uint64_t __67__WFGlyphPicker_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 countForObject:a2];
  uint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  return v7 - v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  self->_selectedGlyphCharacter = [(WFGlyphPicker *)self glyphCharacterAtIndexPath:a4];
  id v5 = [(WFGlyphPicker *)self delegate];
  [v5 glyphPicker:self didSelectGlyphWithCharacter:self->_selectedGlyphCharacter];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:v6];
  uint64_t v8 = [(WFGlyphPicker *)self glyphCharacterAtIndexPath:v6];

  [v7 setGlyphCharacter:v8];
  objc_msgSend(v7, "setOutline:", -[WFGlyphPicker useOutlineGlyphsOnly](self, "useOutlineGlyphsOnly"));
  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(WFGlyphPicker *)self glyphSections];
  id v6 = [v5 objectAtIndex:a4];
  int64_t v7 = [v6 count];

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = [(WFGlyphPicker *)self glyphSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)setSelectedGlyphCharacter:(unsigned __int16)a3
{
  self->_selectedGlyphCharacter = a3;
  -[WFGlyphPicker indexPathForGlyphCharacter:](self, "indexPathForGlyphCharacter:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    int64_t v4 = [(WFGlyphPicker *)self collectionView];
    [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:16];
  }
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFGlyphPicker;
  [(WFGlyphPicker *)&v3 safeAreaInsetsDidChange];
  [(WFGlyphPicker *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFGlyphPicker;
  id v4 = a3;
  [(WFGlyphPicker *)&v9 traitCollectionDidChange:v4];
  id v5 = [(WFGlyphPicker *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__WFGlyphPicker_traitCollectionDidChange___block_invoke;
    v8[3] = &unk_2649CBF20;
    v8[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v8];
  }
}

void __42__WFGlyphPicker_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)WFGlyphPicker;
  [(WFGlyphPicker *)&v7 layoutSubviews];
  objc_super v3 = [(WFGlyphPicker *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  id v5 = [v4 firstObject];

  if (v5)
  {
    uint64_t v6 = [(WFGlyphPicker *)self collectionView];
    [v6 selectItemAtIndexPath:v5 animated:0 scrollPosition:16];
  }
}

- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5 useSystemGlyphsOnly:(BOOL)a6 useOutlineGlyphsOnly:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  v97[3] = *MEMORY[0x263EF8340];
  v93.receiver = self;
  v93.super_class = (Class)WFGlyphPicker;
  id v15 = [(WFGlyphPicker *)&v93 init];
  v16 = v15;
  if (v15)
  {
    v15->_control = a3;
    v15->_glyphDimension = a4;
    v15->_sectionInset.CGFloat top = top;
    v15->_sectionInset.CGFloat left = left;
    v15->_sectionInset.CGFloat bottom = bottom;
    v15->_sectionInset.CGFloat right = right;
    v15->_useOutlineGlyphsOnly = v7;
    v17 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WFGlyphPicker *)v16 setBackgroundColor:v17];

    uint64_t v18 = objc_opt_new();
    unint64_t v19 = 0;
    int v20 = v8 && v7;
    while (v19 < [(id)objc_opt_class() numberOfSections])
    {
      if (v20)
      {
        uint64_t v21 = WFSystemOutlineGlyphCharactersInSection();
      }
      else
      {
        if (v8) {
          WFSystemGlyphCharactersInSection();
        }
        else {
        uint64_t v21 = WFGlyphCharactersInSection();
        }
      }
      id v22 = (void *)v21;
      [v18 addObject:v21];

      ++v19;
    }
    objc_storeStrong((id *)&v16->_glyphSections, v18);
    id v23 = objc_alloc_init(MEMORY[0x263F82570]);
    [(WFGlyphPicker *)v16 glyphDimension];
    double v25 = v24;
    [(WFGlyphPicker *)v16 glyphDimension];
    objc_msgSend(v23, "setItemSize:", v25, v26);
    [v23 setMinimumLineSpacing:4.0];
    [v23 setMinimumInteritemSpacing:4.0];
    [v23 setScrollDirection:1];
    [(WFGlyphPicker *)v16 sectionInset];
    objc_msgSend(v23, "setSectionInset:");
    objc_storeWeak((id *)&v16->_collectionViewLayout, v23);
    v27 = [WFGlyphPickerCollectionView alloc];
    uint64_t v28 = -[WFGlyphPickerCollectionView initWithFrame:collectionViewLayout:](v27, "initWithFrame:collectionViewLayout:", v23, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(WFGlyphPickerCollectionView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFGlyphPickerCollectionView *)v28 setDelegate:v16];
    [(WFGlyphPickerCollectionView *)v28 setDataSource:v16];
    v29 = [MEMORY[0x263F825C8] clearColor];
    [(WFGlyphPickerCollectionView *)v28 setBackgroundColor:v29];

    [(WFGlyphPickerCollectionView *)v28 setShowsHorizontalScrollIndicator:0];
    [(WFGlyphPickerCollectionView *)v28 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"Cell"];
    [(WFGlyphPicker *)v16 addSubview:v28];
    objc_storeWeak((id *)&v16->_collectionView, v28);
    v30 = [(WFGlyphPicker *)v16 safeAreaLayoutGuide];
    uint64_t v31 = [(WFGlyphPicker *)v16 control];
    if (v31)
    {
      if (v31 != 1)
      {
LABEL_16:
        v68 = v16;

        goto LABEL_17;
      }
      id v92 = v23;
      id v32 = objc_alloc(MEMORY[0x263F82BB0]);
      v33 = WFNameForGlyphSection();
      v95[0] = v33;
      WFNameForGlyphSection();
      v35 = v34 = v30;
      v95[1] = v35;
      v36 = WFNameForGlyphSection();
      v95[2] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:3];
      v38 = (UISegmentedControl *)[v32 initWithItems:v37];

      v30 = v34;
      [(UISegmentedControl *)v38 addTarget:v16 action:sel_pickedSegment_ forControlEvents:4096];
      [(UISegmentedControl *)v38 setSelectedSegmentIndex:0];
      [(UISegmentedControl *)v38 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(WFGlyphPicker *)v16 addSubview:v38];
      segmentedControl = v16->_segmentedControl;
      v16->_segmentedControl = v38;
      v40 = v38;

      v72 = (void *)MEMORY[0x263F08938];
      v41 = [(UISegmentedControl *)v40 topAnchor];
      v42 = [v30 topAnchor];
      v43 = [(WFGlyphPickerTabBar *)v41 constraintEqualToAnchor:v42];
      v94[0] = v43;
      v44 = [(UISegmentedControl *)v40 leadingAnchor];
      v90 = [v30 leadingAnchor];
      v91 = v44;
      v89 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", 16.0);
      v94[1] = v89;
      v45 = [(UISegmentedControl *)v40 trailingAnchor];
      v87 = [v30 trailingAnchor];
      v88 = v45;
      v86 = objc_msgSend(v45, "constraintEqualToAnchor:constant:", -16.0);
      v94[2] = v86;
      v46 = [(WFGlyphPickerCollectionView *)v28 topAnchor];
      v81 = v40;
      v84 = [(UISegmentedControl *)v40 bottomAnchor];
      v85 = v46;
      v83 = objc_msgSend(v46, "constraintEqualToAnchor:");
      v94[3] = v83;
      v47 = [(WFGlyphPickerCollectionView *)v28 leadingAnchor];
      [v30 leadingAnchor];
      v80 = v82 = v47;
      v79 = objc_msgSend(v47, "constraintEqualToAnchor:");
      v94[4] = v79;
      v48 = [(WFGlyphPickerCollectionView *)v28 trailingAnchor];
      v77 = [v30 trailingAnchor];
      v78 = v48;
      v76 = objc_msgSend(v48, "constraintEqualToAnchor:");
      v94[5] = v76;
      v49 = [(WFGlyphPickerCollectionView *)v28 bottomAnchor];
      v74 = [v30 bottomAnchor];
      v75 = v49;
      v50 = objc_msgSend(v49, "constraintEqualToAnchor:");
      v94[6] = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:7];
      [v72 activateConstraints:v51];
    }
    else
    {
      id v92 = v23;
      v52 = [WFGlyphPickerTabBar alloc];
      v53 = WFNameForGlyphSection();
      v97[0] = v53;
      WFNameForGlyphSection();
      v55 = v54 = v30;
      v97[1] = v55;
      v56 = WFNameForGlyphSection();
      v97[2] = v56;
      v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:3];
      v41 = [(WFGlyphPickerTabBar *)v52 initWithTabNames:v57 tabCharacters:&unk_26E1CA840];

      [(WFGlyphPickerTabBar *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(WFGlyphPickerTabBar *)v41 setDelegate:v16];
      [(WFGlyphPicker *)v16 addSubview:v41];
      objc_storeWeak((id *)&v16->_tabBar, v41);
      v73 = (void *)MEMORY[0x263F08938];
      v70 = [(WFGlyphPickerCollectionView *)v28 topAnchor];
      uint64_t v71 = [v54 topAnchor];
      v91 = [v70 constraintEqualToAnchor:v71];
      v96[0] = v91;
      v58 = [(WFGlyphPickerCollectionView *)v28 leadingAnchor];
      v89 = [v54 leadingAnchor];
      v90 = v58;
      v88 = objc_msgSend(v58, "constraintEqualToAnchor:");
      v96[1] = v88;
      v59 = [(WFGlyphPickerCollectionView *)v28 trailingAnchor];
      v86 = [v54 trailingAnchor];
      v87 = v59;
      v85 = objc_msgSend(v59, "constraintEqualToAnchor:");
      v96[2] = v85;
      v60 = [(WFGlyphPickerCollectionView *)v28 bottomAnchor];
      v83 = [(WFGlyphPickerTabBar *)v41 topAnchor];
      v84 = v60;
      v82 = objc_msgSend(v60, "constraintEqualToAnchor:");
      v96[3] = v82;
      v61 = [(WFGlyphPickerTabBar *)v41 leadingAnchor];
      v79 = [v54 leadingAnchor];
      v80 = v61;
      v78 = objc_msgSend(v61, "constraintEqualToAnchor:");
      v96[4] = v78;
      v62 = [(WFGlyphPickerTabBar *)v41 trailingAnchor];
      v76 = [v54 trailingAnchor];
      v77 = v62;
      v75 = objc_msgSend(v62, "constraintEqualToAnchor:");
      v96[5] = v75;
      v63 = [(WFGlyphPickerTabBar *)v41 bottomAnchor];
      v50 = [v54 bottomAnchor];
      v74 = v63;
      v51 = [v63 constraintEqualToAnchor:v50];
      v96[6] = v51;
      v64 = [(WFGlyphPickerCollectionView *)v28 trailingAnchor];
      v65 = [v54 trailingAnchor];
      v81 = v64;
      v66 = [(UISegmentedControl *)v64 constraintEqualToAnchor:v65];
      v96[7] = v66;
      v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:8];
      [v73 activateConstraints:v67];

      v30 = v54;
      v42 = v70;

      v43 = (void *)v71;
    }

    id v23 = v92;
    goto LABEL_16;
  }
LABEL_17:

  return v16;
}

- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5
{
  return -[WFGlyphPicker initWithControl:glyphDimension:sectionInset:useSystemGlyphsOnly:useOutlineGlyphsOnly:](self, "initWithControl:glyphDimension:sectionInset:useSystemGlyphsOnly:useOutlineGlyphsOnly:", a3, 0, 0, a4, a5.top, a5.left, a5.bottom, a5.right);
}

+ (unint64_t)numberOfSections
{
  return 3;
}

@end