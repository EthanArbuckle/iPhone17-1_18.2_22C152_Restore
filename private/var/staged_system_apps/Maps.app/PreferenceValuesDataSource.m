@interface PreferenceValuesDataSource
+ (void)registerCellsInCollectionView:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PreferenceValuesDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_sections;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)rowAtIndexPath:(id)a3;
- (id)sectionAtIndex:(int64_t)a3;
- (id)sectionAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionOffset;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addSection:(id)a3;
- (void)addSectionWithTitle:(id)a3 content:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadContentNowIfNeeded;
- (void)prepareContentWithBlock:(id)a3;
- (void)rebuildSections;
- (void)setDelegate:(id)a3;
- (void)setSectionOffset:(int64_t)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PreferenceValuesDataSource

- (void)prepareContentWithBlock:(id)a3
{
  v4 = (void (**)(id, PreferenceValuesDataSource *))a3;
  if (!self->_sections)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = self->_mutableSections;
    self->_mutableSections = v5;

    v4[2](v4, self);
    v7 = (NSArray *)[(NSMutableArray *)self->_mutableSections copy];
    sections = self->_sections;
    self->_sections = v7;

    v9 = self->_mutableSections;
    self->_mutableSections = 0;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v10 = self->_sections;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) commit];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)addSection:(id)a3
{
}

- (void)addSectionWithTitle:(id)a3 content:(id)a4
{
  v6 = (void (**)(id, MapsDebugTableSection *))a4;
  id v7 = a3;
  id v12 = objc_alloc_init(MapsDebugTableSection);
  [(MapsDebugTableSection *)v12 setTitle:v7];

  v6[2](v6, v12);
  [(MapsDebugTableSection *)v12 commit];
  mutableSections = self->_mutableSections;
  if (mutableSections)
  {
    [(NSMutableArray *)mutableSections addObject:v12];
  }
  else
  {
    if (self->_sections) {
      sections = self->_sections;
    }
    else {
      sections = (NSArray *)&__NSArray0__struct;
    }
    v10 = [(NSArray *)sections arrayByAddingObject:v12];
    id v11 = self->_sections;
    self->_sections = v10;
  }
}

- (id)_sections
{
  [(PreferenceValuesDataSource *)self loadContentNowIfNeeded];
  sections = self->_sections;

  return sections;
}

- (void)rebuildSections
{
  sections = self->_sections;
  self->_sections = 0;

  [(PreferenceValuesDataSource *)self loadContentNowIfNeeded];
  id v4 = [(PreferenceValuesDataSource *)self delegate];
  [v4 dataSourceDidRebuildSections:self];
}

- (void)loadContentNowIfNeeded
{
  if (!self->_sections)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableSections = self->_mutableSections;
    self->_mutableSections = v3;

    [(PreferenceValuesDataSource *)self prepareContent];
    v5 = (NSArray *)[(NSMutableArray *)self->_mutableSections copy];
    sections = self->_sections;
    self->_sections = v5;

    id v7 = self->_mutableSections;
    self->_mutableSections = 0;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v8 = self->_sections;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) commit:v13];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (id)sectionAtIndex:(int64_t)a3
{
  v5 = [(PreferenceValuesDataSource *)self _sections];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    id v7 = [(PreferenceValuesDataSource *)self _sections];
    v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)sectionAtIndexPath:(id)a3
{
  id v4 = [a3 section];

  return [(PreferenceValuesDataSource *)self sectionAtIndex:v4];
}

- (id)rowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PreferenceValuesDataSource *)self sectionAtIndexPath:v4];
  id v6 = [v5 rows];
  id v7 = [v4 row];

  if (v7 >= [v6 count])
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 objectAtIndexedSubscript:v7];
  }

  return v8;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  v3 = [(PreferenceValuesDataSource *)self sectionAtIndex:a3];
  id v4 = [v3 rows];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (PreferenceValuesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PreferenceValuesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)sectionOffset
{
  return self->_sectionOffset;
}

- (void)setSectionOffset:(int64_t)a3
{
  self->_sectionOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_mutableSections, 0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PreferenceValuesDataSource *)self numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(PreferenceValuesDataSource *)self rowAtIndexPath:a4];
  v8 = [v7 cellForTableView:v6];
  id v9 = [v6 theme];

  id v10 = [v9 _maps_colorNamed:@"BackgroundGroupedTableView"];
  [v8 setBackgroundColor:v10];

  uint64_t v11 = +[UIColor clearColor];
  id v12 = [v8 contentView];
  [v12 setBackgroundColor:v11];

  [v8 setOpaque:0];
  long long v13 = [v7 selectionAction];
  [v8 setSelectionStyle:v13 != 0];

  [v7 setCurrentCell:v8];

  return v8;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a4;
  id v9 = [(PreferenceValuesDataSource *)self rowAtIndexPath:a5];
  id v8 = [v9 currentCell];

  if (v8 == v7) {
    [v9 setCurrentCell:0];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(PreferenceValuesDataSource *)self rowAtIndexPath:a4];
  id v5 = [v4 selectionAction];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PreferenceValuesDataSource *)self rowAtIndexPath:v6];
  id v8 = [v7 selectionAction];

  if (v8)
  {
    id v9 = [v7 selectionAction];
    v9[2]();
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(PreferenceValuesDataSource *)self sectionAtIndex:a4];
  id v5 = [v4 title];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(PreferenceValuesDataSource *)self sectionAtIndex:a4];
  id v5 = [v4 footer];

  return v5;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3 = a3;
  +[MapsDebugTableRow registerCellsInCollectionView:v3];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = _UICollectionViewListLayoutElementKindSectionHeader;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = _UICollectionViewListLayoutElementKindSectionFooter;
  id v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v3 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v11];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PreferenceValuesDataSource *)self numberOfRowsInSection:a4];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", [v6 item], (unsigned char *)objc_msgSend(v6, "section") - (unsigned char *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset"));
  uint64_t v9 = [(PreferenceValuesDataSource *)self rowAtIndexPath:v8];
  id v10 = [v9 cellForCollectionView:v7 forIndexPath:v6];

  id v11 = [v7 theme];

  id v12 = [v11 _maps_colorNamed:@"BackgroundGroupedTableView"];
  [v10 setBackgroundColor:v12];

  long long v13 = +[UIColor clearColor];
  long long v14 = [v10 contentView];
  [v14 setBackgroundColor:v13];

  [v10 setOpaque:0];
  [v9 setCurrentCollectionViewCell:v10];

  return v10;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [v7 item];
  id v10 = [v7 section];

  id v13 = +[NSIndexPath indexPathForItem:v9 inSection:v10 - (unsigned char *)[(PreferenceValuesDataSource *)self sectionOffset]];
  id v11 = -[PreferenceValuesDataSource rowAtIndexPath:](self, "rowAtIndexPath:");
  id v12 = [v11 currentCollectionViewCell];

  if (v12 == v8) {
    [v11 setCurrentCollectionViewCell:0];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 item];
  id v7 = [v5 section];

  id v8 = +[NSIndexPath indexPathForItem:v6 inSection:v7 - (unsigned char *)[(PreferenceValuesDataSource *)self sectionOffset]];
  id v9 = [(PreferenceValuesDataSource *)self rowAtIndexPath:v8];
  id v10 = [v9 selectionAction];
  LOBYTE(v5) = v10 != 0;

  return (char)v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [NSIndexPath indexPathForItem:[v6 item] inSection:[v6 section] - [self sectionOffset]];
  id v8 = [(PreferenceValuesDataSource *)self rowAtIndexPath:v7];
  id v9 = [v8 selectionAction];

  if (v9)
  {
    id v10 = [v8 selectionAction];
    v10[2]();
  }
  [v11 deselectItemAtIndexPath:v6 animated:1];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100AA60F8;
  v20[3] = &unk_101316458;
  id v21 = v8;
  id v11 = v9;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  id v13 = v8;
  long long v14 = objc_retainBlock(v20);
  long long v15 = -[PreferenceValuesDataSource sectionAtIndex:](self, "sectionAtIndex:", (unsigned char *)[v12 section] - (unsigned char *)-[PreferenceValuesDataSource sectionOffset](self, "sectionOffset"));
  if ([v11 isEqualToString:_UICollectionViewListLayoutElementKindSectionHeader])
  {
    long long v16 = [v15 title];
    uint64_t v17 = ((void (*)(void *, void *, void))v14[2])(v14, v16, 0);
LABEL_5:
    long long v18 = (void *)v17;

    goto LABEL_7;
  }
  if ([v11 isEqualToString:_UICollectionViewListLayoutElementKindSectionFooter])
  {
    long long v16 = [v15 footer];
    uint64_t v17 = ((void (*)(void *, void *, uint64_t))v14[2])(v14, v16, 1);
    goto LABEL_5;
  }
  long long v18 = ((void (*)(void *, void, void))v14[2])(v14, 0, 0);
LABEL_7:

  return v18;
}

@end