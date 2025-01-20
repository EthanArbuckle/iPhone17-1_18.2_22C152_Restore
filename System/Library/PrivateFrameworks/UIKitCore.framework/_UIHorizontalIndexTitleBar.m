@interface _UIHorizontalIndexTitleBar
- (BOOL)_isViewEntryCell:(id)a3;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)entries;
- (NSDirectionalEdgeInsets)_combinedSectionInset;
- (NSIndexPath)selectedEntryIndexPath;
- (UICollectionView)collectionView;
- (UICollectionViewCompositionalLayout)layout;
- (UIEdgeInsets)_parentContentInset;
- (UIEdgeInsets)sectionInset;
- (UIFocusGuide)horizontalIndexTitleBarFocusGuide;
- (_UIFocusFastScrollingIndexBarEntry)selectedEntry;
- (_UIHorizontalIndexTitleBar)init;
- (_UIHorizontalIndexTitleBarCell)focusedCell;
- (_UIHorizontalIndexTitleBarDelegate)delegate;
- (id)_existingCellForSelectedIndexPath;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)preferredFocusEnvironments;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancelDelayedFocusAction;
- (void)_flipIfRightToLeft;
- (void)_selectEntryForTitleIndex:(int64_t)a3;
- (void)_selectFocusedCell;
- (void)_sendDelayedFocusActionIfNecessary;
- (void)_setParentContentInset:(UIEdgeInsets)a3;
- (void)_updateWithEntries:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)commonInit;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntries:(id)a3;
- (void)setFocusedCell:(id)a3;
- (void)setHorizontalIndexTitleBarFocusGuide:(id)a3;
- (void)setLayout:(id)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
- (void)setSelectedEntry:(id)a3;
- (void)setSelectedEntryIndexPath:(id)a3;
@end

@implementation _UIHorizontalIndexTitleBar

- (_UIHorizontalIndexTitleBar)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIHorizontalIndexTitleBar;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UIHorizontalIndexTitleBar *)v2 commonInit];
  }
  return v3;
}

- (void)commonInit
{
  v50[1] = *MEMORY[0x1E4F143B8];
  [(_UIHorizontalIndexTitleBar *)self setEntries:MEMORY[0x1E4F1CBF0]];
  v46 = objc_alloc_init(UICollectionViewCompositionalLayoutConfiguration);
  [(UICollectionViewCompositionalLayoutConfiguration *)v46 setScrollDirection:1];
  v3 = [UICollectionViewCompositionalLayout alloc];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __40___UIHorizontalIndexTitleBar_commonInit__block_invoke;
  v47[3] = &unk_1E52EBF20;
  v47[4] = self;
  v4 = [(UICollectionViewCompositionalLayout *)v3 initWithSectionProvider:v47 configuration:v46];
  [(_UIHorizontalIndexTitleBar *)self setLayout:v4];

  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  v9 = [UICollectionView alloc];
  v10 = [(_UIHorizontalIndexTitleBar *)self layout];
  v11 = -[UICollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v10, 0.0, 0.0, v6, v8);
  [(_UIHorizontalIndexTitleBar *)self setCollectionView:v11];

  v12 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"_UIHorizontalIndexTitleBarCell"];

  v13 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v13 setDataSource:self];

  v14 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v14 setDelegate:self];

  v15 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v15 setAllowsSelection:1];

  v16 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v16 _setSafeAreaInsetsFrozen:1];

  v17 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [(UIView *)self addSubview:v17];

  v18 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v18 setAutoresizingMask:18];

  v19 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:1];

  v20 = objc_alloc_init(UIFocusGuide);
  [(_UIHorizontalIndexTitleBar *)self setHorizontalIndexTitleBarFocusGuide:v20];

  v21 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  v50[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  v23 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  [v23 setPreferredFocusEnvironments:v22];

  v24 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  [(UIView *)self addLayoutGuide:v24];

  v38 = (void *)MEMORY[0x1E4F5B268];
  v44 = [(UIView *)self leftAnchor];
  v45 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  v43 = [v45 leftAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[0] = v42;
  v40 = [(UIView *)self topAnchor];
  v41 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  v39 = [v41 topAnchor];
  v37 = [v40 constraintEqualToAnchor:v39 constant:1.0];
  v49[1] = v37;
  v25 = [(UIView *)self rightAnchor];
  v26 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  v27 = [v26 rightAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v49[2] = v28;
  v29 = [(UIView *)self bottomAnchor];
  v30 = [(_UIHorizontalIndexTitleBar *)self horizontalIndexTitleBarFocusGuide];
  v31 = [v30 bottomAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:-1.0];
  v49[3] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v38 activateConstraints:v33];

  [(_UIHorizontalIndexTitleBar *)self _flipIfRightToLeft];
  v34 = self;
  v48 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  id v36 = [(UIView *)self registerForTraitChanges:v35 withAction:sel__flipIfRightToLeft];
}

- (void)_flipIfRightToLeft
{
  v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  double v5 = [(UIView *)self layer];
  int v6 = [v5 flipsHorizontalAxis];

  if (v4 == 1)
  {
    if (v6) {
      return;
    }
    double v7 = [(UIView *)self layer];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    if (!v6) {
      return;
    }
    double v7 = [(UIView *)self layer];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  [v7 setFlipsHorizontalAxis:v8];
}

- (void)_updateWithEntries:(id)a3
{
  id v4 = a3;
  [(_UIHorizontalIndexTitleBar *)self setSelectedEntry:0];
  [(_UIHorizontalIndexTitleBar *)self setSelectedEntryIndexPath:0];
  [(_UIHorizontalIndexTitleBar *)self setEntries:v4];

  id v5 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  [v5 reloadData];
}

- (void)_selectEntryForTitleIndex:(int64_t)a3
{
  id v5 = [(_UIHorizontalIndexTitleBar *)self entries];
  int v6 = [v5 objectAtIndexedSubscript:a3];
  [(_UIHorizontalIndexTitleBar *)self setSelectedEntry:v6];

  double v7 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  [(_UIHorizontalIndexTitleBar *)self setSelectedEntryIndexPath:v7];

  uint64_t v8 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  id v9 = [v8 indexPathsForSelectedItems];
  id v14 = [v9 firstObject];

  if (!v14
    || ([(_UIHorizontalIndexTitleBar *)self selectedEntryIndexPath],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v14 isEqual:v10],
        v10,
        (v11 & 1) == 0))
  {
    v12 = [(_UIHorizontalIndexTitleBar *)self collectionView];
    v13 = [(_UIHorizontalIndexTitleBar *)self selectedEntryIndexPath];
    [v12 selectItemAtIndexPath:v13 animated:1 scrollPosition:16];
  }
}

- (BOOL)_isViewEntryCell:(id)a3
{
  id v4 = [a3 superview];
  id v5 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  LOBYTE(self) = v4 == v5;

  return (char)self;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
  id v3 = [(_UIHorizontalIndexTitleBar *)self layout];
  [v3 invalidateLayout];
}

- (void)_setParentContentInset:(UIEdgeInsets)a3
{
  self->_parentContentInset = a3;
  id v3 = [(_UIHorizontalIndexTitleBar *)self layout];
  [v3 invalidateLayout];
}

- (void)_selectFocusedCell
{
  id v3 = [(_UIHorizontalIndexTitleBar *)self focusedCell];
  id v4 = v3;
  if (v3)
  {
    v10 = v3;
    char v5 = [v3 isSelected];
    id v4 = v10;
    if ((v5 & 1) == 0)
    {
      [(_UIHorizontalIndexTitleBar *)self _cancelDelayedFocusAction];
      int v6 = [(_UIHorizontalIndexTitleBar *)self collectionView];
      double v7 = [v6 indexPathForCell:v10];

      if (v7)
      {
        uint64_t v8 = [(_UIHorizontalIndexTitleBar *)self collectionView];
        [v8 selectItemAtIndexPath:v7 animated:1 scrollPosition:0];

        id v9 = [(_UIHorizontalIndexTitleBar *)self collectionView];
        [(_UIHorizontalIndexTitleBar *)self collectionView:v9 didSelectItemAtIndexPath:v7];
      }
      id v4 = v10;
    }
  }
}

- (void)_sendDelayedFocusActionIfNecessary
{
  [(_UIHorizontalIndexTitleBar *)self _cancelDelayedFocusAction];
  [(_UIHorizontalIndexTitleBar *)self performSelector:sel__selectFocusedCell withObject:0 afterDelay:0.31];
}

- (void)_cancelDelayedFocusAction
{
  id v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__selectFocusedCell object:0];
}

- (NSDirectionalEdgeInsets)_combinedSectionInset
{
  [(_UIHorizontalIndexTitleBar *)self sectionInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(_UIHorizontalIndexTitleBar *)self _parentContentInset];
  double v12 = UIEdgeInsetsAdd(10, v4, v6, v8, v10, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(UIView *)self traitCollection];
  uint64_t v20 = [v19 layoutDirection];

  if (v20 == 1) {
    double v21 = v18;
  }
  else {
    double v21 = v14;
  }
  if (v20 == 1) {
    double v22 = v14;
  }
  else {
    double v22 = v18;
  }
  double v23 = v12;
  double v24 = v16;
  result.trailing = v22;
  result.bottom = v24;
  result.leading = v21;
  result.top = v23;
  return result;
}

- (id)_existingCellForSelectedIndexPath
{
  double v3 = [(_UIHorizontalIndexTitleBar *)self selectedEntryIndexPath];

  if (v3)
  {
    double v4 = [(_UIHorizontalIndexTitleBar *)self collectionView];
    double v5 = [(_UIHorizontalIndexTitleBar *)self selectedEntryIndexPath];
    double v6 = [v4 cellForItemAtIndexPath:v5];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)setEntries:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    double v5 = (NSArray *)v4;
  }
  else {
    double v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  entries = self->_entries;
  self->_entries = v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 nextFocusedView];
  if ([(_UIHorizontalIndexTitleBar *)self _isViewEntryCell:v5])
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)_UIHorizontalIndexTitleBar;
    BOOL v8 = [(UIView *)&v10 shouldUpdateFocusInContext:v4];
    goto LABEL_6;
  }
  double v6 = [(_UIHorizontalIndexTitleBar *)self focusedCell];
  id v7 = [(_UIHorizontalIndexTitleBar *)self _existingCellForSelectedIndexPath];

  if (v6 == v7) {
    goto LABEL_5;
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIHorizontalIndexTitleBar;
  [(UIView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = [v6 nextFocusedView];
  BOOL v8 = [v7 superview];
  double v9 = [(_UIHorizontalIndexTitleBar *)self collectionView];

  if (v8 == v9)
  {
    objc_super v10 = [v6 nextFocusedItem];
    [(_UIHorizontalIndexTitleBar *)self setFocusedCell:v10];
  }
  else
  {
    [(_UIHorizontalIndexTitleBar *)self setFocusedCell:0];
  }
  [(_UIHorizontalIndexTitleBar *)self _sendDelayedFocusActionIfNecessary];
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_UIHorizontalIndexTitleBar *)self collectionView];
  v5[0] = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = [(_UIHorizontalIndexTitleBar *)self entries];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_UIHorizontalIndexTitleBar *)self entries];
  double v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  objc_super v10 = [v7 dequeueReusableCellWithReuseIdentifier:@"_UIHorizontalIndexTitleBarCell" forIndexPath:v6];

  [v10 updateForEntry:v9];
  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIHorizontalIndexTitleBar *)self entries];
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(_UIHorizontalIndexTitleBar *)self setSelectedEntry:v8];
  [(_UIHorizontalIndexTitleBar *)self setSelectedEntryIndexPath:v5];

  id v7 = [(_UIHorizontalIndexTitleBar *)self delegate];
  [v7 horizontalIndexBar:self selectedEntry:v8];
}

- (NSArray)entries
{
  return self->_entries;
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

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (UIFocusGuide)horizontalIndexTitleBarFocusGuide
{
  return self->_horizontalIndexTitleBarFocusGuide;
}

- (void)setHorizontalIndexTitleBarFocusGuide:(id)a3
{
}

- (_UIFocusFastScrollingIndexBarEntry)selectedEntry
{
  return self->_selectedEntry;
}

- (void)setSelectedEntry:(id)a3
{
}

- (NSIndexPath)selectedEntryIndexPath
{
  return self->_selectedEntryIndexPath;
}

- (void)setSelectedEntryIndexPath:(id)a3
{
}

- (_UIHorizontalIndexTitleBarCell)focusedCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedCell);
  return (_UIHorizontalIndexTitleBarCell *)WeakRetained;
}

- (void)setFocusedCell:(id)a3
{
}

- (_UIHorizontalIndexTitleBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIHorizontalIndexTitleBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)_parentContentInset
{
  double top = self->_parentContentInset.top;
  double left = self->_parentContentInset.left;
  double bottom = self->_parentContentInset.bottom;
  double right = self->_parentContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_focusedCell);
  objc_storeStrong((id *)&self->_selectedEntryIndexPath, 0);
  objc_storeStrong((id *)&self->_selectedEntry, 0);
  objc_storeStrong((id *)&self->_horizontalIndexTitleBarFocusGuide, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end