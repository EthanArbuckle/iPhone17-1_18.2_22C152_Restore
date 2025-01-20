@interface MapsDebugMenuRow
- (UIMenu)menu;
- (id)cellContentConfiguration;
- (void)_setAccessoriesForCell:(id)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)setMenu:(id)a3;
@end

@implementation MapsDebugMenuRow

- (id)cellContentConfiguration
{
  return +[UIListContentConfiguration valueCellConfiguration];
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsDebugMenuRow;
  [(MapsDebugTableRow *)&v16 configureCell:v4];
  v5 = [(MapsDebugTableRow *)self configureBlock];

  if (v5)
  {
    objc_initWeak(&location, self);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10085524C;
    v13 = &unk_1012FAC20;
    objc_copyWeak(&v14, &location);
    [v4 setConfigurationUpdateHandler:&v10];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = [(UIMenu *)self->_menu selectedElements];
    v7 = [v6 firstObject];
    v8 = [v7 title];
    v9 = [v4 detailTextLabel];
    [v9 setText:v8];
  }
  -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v4, v10, v11, v12, v13);
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MapsDebugMenuRow;
  [(MapsDebugTableRow *)&v17 configureCollectionViewCell:v4];
  id v5 = v4;
  v6 = [(MapsDebugTableRow *)self configureCollectionViewCellBlock];

  if (v6)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10085553C;
    id v14 = &unk_1012FAC48;
    objc_copyWeak(&v15, &location);
    [v5 setConfigurationUpdateHandler:&v11];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = [(UIMenu *)self->_menu selectedElements];
    v8 = [v7 firstObject];
    v9 = [v8 title];
    v10 = [v5 detailTextLabel];
    [v10 setText:v9];
  }
  -[MapsDebugMenuRow _setAccessoriesForCell:](self, "_setAccessoriesForCell:", v5, v11, v12, v13, v14);
}

- (void)setMenu:(id)a3
{
  id v5 = (UIMenu *)a3;
  if (self->_menu != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_menu, a3);
    v6 = [(MapsDebugTableRow *)self currentCollectionViewCell];
    if (v6)
    {
      [(MapsDebugMenuRow *)self _setAccessoriesForCell:v6];
    }
    else
    {
      v7 = [(MapsDebugTableRow *)self currentCell];
      [(MapsDebugMenuRow *)self _setAccessoriesForCell:v7];
    }
    id v5 = v8;
  }
}

- (void)_setAccessoriesForCell:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = +[UIButton buttonWithType:1];
    v7 = +[UIButtonConfiguration plainButtonConfiguration];
    v8 = +[UIImage systemImageNamed:@"ellipsis.circle"];
    [v7 setImage:v8];

    [v6 setConfiguration:v7];
    [v6 setMenu:self->_menu];
    [v6 setShowsMenuAsPrimaryAction:1];
    [v6 sizeToFit];
    [v5 setAccessoryView:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v4;
      objc_initWeak(&location, self);
      id v10 = [objc_alloc((Class)UICellAccessoryPopUpMenu) initWithMenu:self->_menu];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1008559E8;
      v13[3] = &unk_1012FAC70;
      objc_copyWeak(&v15, &location);
      id v11 = v9;
      id v14 = v11;
      [v10 setSelectedElementDidChangeHandler:v13];
      id v17 = v10;
      uint64_t v12 = +[NSArray arrayWithObjects:&v17 count:1];
      [v11 setAccessories:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
}

@end