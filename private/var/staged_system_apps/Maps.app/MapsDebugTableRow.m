@interface MapsDebugTableRow
+ (NSString)reuseIdentifier;
+ (void)registerCellsInCollectionView:(id)a3;
- (BOOL)deprecated;
- (BOOL)visible;
- (MapsDebugTableRow)init;
- (MapsDebugTableSection)section;
- (NSString)subtitle;
- (NSString)title;
- (UICollectionViewCell)currentCollectionViewCell;
- (UIListContentConfiguration)cellContentConfiguration;
- (UITableViewCell)currentCell;
- (id)cellForCollectionView:(id)a3 forIndexPath:(id)a4;
- (id)cellForTableView:(id)a3;
- (id)configureBlock;
- (id)configureCollectionViewCellBlock;
- (id)prepareContentBlock;
- (id)selectionAction;
- (int64_t)cellStyle;
- (void)_clearAllControlTargetsForReuse;
- (void)addControlThatNeedsClearingTargetOnReuse:(id)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setConfigureBlock:(id)a3;
- (void)setConfigureCollectionViewCellBlock:(id)a3;
- (void)setCurrentCell:(id)a3;
- (void)setCurrentCollectionViewCell:(id)a3;
- (void)setDeprecated:(BOOL)a3;
- (void)setPrepareContentBlock:(id)a3;
- (void)setSection:(id)a3;
- (void)setSelectionAction:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation MapsDebugTableRow

- (MapsDebugTableRow)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableRow;
  result = [(MapsDebugTableRow *)&v3 init];
  if (result) {
    result->_visible = 1;
  }
  return result;
}

- (void)dealloc
{
  [(MapsDebugTableRow *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableRow;
  [(MapsDebugTableRow *)&v3 dealloc];
}

- (void)invalidate
{
  [(MapsDebugTableRow *)self setCurrentCell:0];
  [(MapsDebugTableRow *)self setSection:0];

  [(MapsDebugTableRow *)self setSelectionAction:0];
}

+ (NSString)reuseIdentifier
{
  return 0;
}

- (void)setCurrentCell:(id)a3
{
  v5 = (UITableViewCell *)a3;
  if (self->_currentCell != v5)
  {
    v6 = v5;
    if (!v5) {
      [(MapsDebugTableRow *)self _clearAllControlTargetsForReuse];
    }
    objc_storeStrong((id *)&self->_currentCell, a3);
    v5 = v6;
  }
}

- (void)addControlThatNeedsClearingTargetOnReuse:(id)a3
{
  id v4 = a3;
  controlsToClearTargetsFromOnReuse = self->_controlsToClearTargetsFromOnReuse;
  id v8 = v4;
  if (!controlsToClearTargetsFromOnReuse)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_controlsToClearTargetsFromOnReuse;
    self->_controlsToClearTargetsFromOnReuse = v6;

    id v4 = v8;
    controlsToClearTargetsFromOnReuse = self->_controlsToClearTargetsFromOnReuse;
  }
  [(NSMutableArray *)controlsToClearTargetsFromOnReuse addObject:v4];
}

- (void)_clearAllControlTargetsForReuse
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_controlsToClearTargetsFromOnReuse;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_controlsToClearTargetsFromOnReuse removeAllObjects];
}

- (id)cellForTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() reuseIdentifier];
  id v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  if (!v6)
  {
    id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:[self cellStyle] reuseIdentifier:v5];
    v7 = [v6 traitCollection];
    id v8 = [v7 userInterfaceIdiom];

    if (v8 == (id)5)
    {
      long long v9 = [v6 contentView];
      long long v10 = [v6 contentView];
      long long v11 = [v10 heightAnchor];
      v12 = [v11 constraintGreaterThanOrEqualToConstant:34.0];
      [v9 addConstraint:v12];
    }
  }
  [v6 setAccessibilityIdentifier:@"MapsDebugTableViewCell"];
  [(MapsDebugTableRow *)self configureCell:v6];

  return v6;
}

- (void)configureCell:(id)a3
{
  id v32 = a3;
  id v4 = [(MapsDebugTableRow *)self cellContentConfiguration];
  id v5 = [(MapsDebugTableRow *)self title];
  if (v4)
  {
    [v4 setText:v5];

    unsigned int v6 = [(MapsDebugTableRow *)self deprecated];
    v7 = [(MapsDebugTableRow *)self subtitle];
    id v8 = v7;
    if (v6)
    {
      id v9 = [v7 length];

      if (v9)
      {
        long long v10 = [(MapsDebugTableRow *)self subtitle];
        long long v11 = [v10 stringByAppendingString:@" - DEPRECATED (SOON TO BE REMOVED)"];
        [v4 setSecondaryText:v11];
      }
      else
      {
        [v4 setSecondaryText:@"DEPRECATED (SOON TO BE REMOVED)"];
      }
      uint64_t v19 = +[UIColor systemRedColor];
    }
    else
    {
      [v4 setSecondaryText:v7];

      uint64_t v19 = +[UIColor labelColor];
    }
    v22 = (void *)v19;
    v23 = [v4 secondaryTextProperties];
    [v23 setColor:v22];

    v24 = [v4 textProperties];
  }
  else
  {
    v12 = [v32 textLabel];
    [v12 setText:v5];

    LODWORD(v12) = [(MapsDebugTableRow *)self deprecated];
    v13 = [(MapsDebugTableRow *)self subtitle];
    v14 = v13;
    if (v12)
    {
      id v15 = [v13 length];

      if (v15)
      {
        v16 = [(MapsDebugTableRow *)self subtitle];
        v17 = [v16 stringByAppendingString:@" - DEPRECATED (SOON TO BE REMOVED)"];
        v18 = [v32 detailTextLabel];
        [v18 setText:v17];
      }
      else
      {
        v16 = [v32 detailTextLabel];
        [v16 setText:@"DEPRECATED (SOON TO BE REMOVED)"];
      }

      uint64_t v21 = +[UIColor systemRedColor];
    }
    else
    {
      v20 = [v32 detailTextLabel];
      [v20 setText:v14];

      uint64_t v21 = +[UIColor labelColor];
    }
    v25 = (void *)v21;
    v26 = [v32 detailTextLabel];
    [v26 setTextColor:v25];

    v24 = [v32 textLabel];
  }
  v27 = v24;
  [v24 setAdjustsFontSizeToFitWidth:1];

  v28 = [(MapsDebugTableRow *)self configureBlock];

  if (v28)
  {
    v29 = [(MapsDebugTableRow *)self configureBlock];
    ((void (**)(void, id, void *))v29)[2](v29, v32, v4);
  }
  v30 = [v32 textLabel];
  [v30 setAccessibilityIdentifier:@"TextLabel"];

  v31 = [v32 detailTextLabel];
  [v31 setAccessibilityIdentifier:@"DetailTextLabel"];

  [v32 setContentConfiguration:v4];
}

- (int64_t)cellStyle
{
  objc_super v3 = [(MapsDebugTableRow *)self subtitle];
  if ([v3 length])
  {
    int64_t v4 = 3;
  }
  else if ([(MapsDebugTableRow *)self deprecated])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (UIListContentConfiguration)cellContentConfiguration
{
  objc_super v3 = [(MapsDebugTableRow *)self subtitle];
  if ([v3 length] || -[MapsDebugTableRow deprecated](self, "deprecated"))
  {
    uint64_t v4 = +[UIListContentConfiguration subtitleCellConfiguration];
  }
  else
  {
    uint64_t v4 = +[UIListContentConfiguration cellConfiguration];
  }
  id v5 = (void *)v4;

  return (UIListContentConfiguration *)v5;
}

+ (void)registerCellsInCollectionView:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  v17[8] = objc_opt_class();
  v17[9] = objc_opt_class();
  v17[10] = objc_opt_class();
  v17[11] = objc_opt_class();
  uint64_t v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 12, 0);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(objc_class **)(*((void *)&v12 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        long long v11 = NSStringFromClass(v9);
        [v3 registerClass:v10 forCellWithReuseIdentifier:v11];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)cellForCollectionView:(id)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  long long v11 = [v10 traitCollection];
  id v12 = [v11 userInterfaceIdiom];

  if (v12 != (id)5)
  {
    long long v13 = [v10 contentView];
    long long v14 = [v10 contentView];
    long long v15 = [v14 heightAnchor];
    v16 = [v15 constraintGreaterThanOrEqualToConstant:44.0];
    [v13 addConstraint:v16];
  }
  [(MapsDebugTableRow *)self configureCollectionViewCell:v10];
  [v10 setAccessibilityIdentifier:@"MapsDebugCollectionViewCell"];
  [v10 layoutIfNeeded];

  return v10;
}

- (void)configureCollectionViewCell:(id)a3
{
  id v25 = a3;
  uint64_t v4 = [(MapsDebugTableRow *)self configureCollectionViewCellBlock];

  if (v4)
  {
    id v5 = [(MapsDebugTableRow *)self cellContentConfiguration];
    id v6 = [(MapsDebugTableRow *)self title];
    [v5 setText:v6];

    id v7 = [(MapsDebugTableRow *)self subtitle];
    [v5 setSecondaryText:v7];

    id v8 = [(MapsDebugTableRow *)self configureCollectionViewCellBlock];
    ((void (**)(void, id, void *))v8)[2](v8, v25, v5);

    [v25 setContentConfiguration:v5];
    id v9 = [v25 contentView];
    [v9 setAccessibilityIdentifier:@"TextLabel"];

    uint64_t v10 = [(MapsDebugTableRow *)self title];
    long long v11 = [v25 contentView];
    [v11 setAccessibilityLabel:v10];
  }
  else
  {
    id v12 = [v25 contentConfiguration];

    if (v12)
    {
      [v25 setContentConfiguration:0];
      [v25 setupContentView];
    }
    long long v13 = [(MapsDebugTableRow *)self title];
    long long v14 = [v25 textLabel];
    [v14 setText:v13];

    LODWORD(v14) = [(MapsDebugTableRow *)self deprecated];
    long long v15 = [(MapsDebugTableRow *)self subtitle];
    v16 = v15;
    if (v14)
    {
      id v17 = [v15 length];

      if (v17)
      {
        v18 = [(MapsDebugTableRow *)self subtitle];
        uint64_t v19 = [v18 stringByAppendingString:@" - DEPRECATED (SOON TO BE REMOVED)"];
        v20 = [v25 detailTextLabel];
        [v20 setText:v19];
      }
      else
      {
        v18 = [v25 detailTextLabel];
        [v18 setText:@"DEPRECATED (SOON TO BE REMOVED)"];
      }

      uint64_t v22 = +[UIColor systemRedColor];
    }
    else
    {
      uint64_t v21 = [v25 detailTextLabel];
      [v21 setText:v16];

      uint64_t v22 = +[UIColor labelColor];
    }
    v23 = (void *)v22;
    v24 = [v25 detailTextLabel];
    [v24 setTextColor:v23];

    id v5 = [v25 textLabel];
    [v5 setAdjustsFontSizeToFitWidth:1];
  }
}

- (MapsDebugTableSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);

  return (MapsDebugTableSection *)WeakRetained;
}

- (void)setSection:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)deprecated
{
  return self->_deprecated;
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (id)prepareContentBlock
{
  return self->_prepareContentBlock;
}

- (void)setPrepareContentBlock:(id)a3
{
}

- (id)selectionAction
{
  return self->_selectionAction;
}

- (void)setSelectionAction:(id)a3
{
}

- (UITableViewCell)currentCell
{
  return self->_currentCell;
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (void)setConfigureBlock:(id)a3
{
}

- (id)configureCollectionViewCellBlock
{
  return self->_configureCollectionViewCellBlock;
}

- (void)setConfigureCollectionViewCellBlock:(id)a3
{
}

- (UICollectionViewCell)currentCollectionViewCell
{
  return self->_currentCollectionViewCell;
}

- (void)setCurrentCollectionViewCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCollectionViewCell, 0);
  objc_storeStrong(&self->_configureCollectionViewCellBlock, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong((id *)&self->_currentCell, 0);
  objc_storeStrong(&self->_selectionAction, 0);
  objc_storeStrong(&self->_prepareContentBlock, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_section);

  objc_storeStrong((id *)&self->_controlsToClearTargetsFromOnReuse, 0);
}

@end