@interface ICSortMenu
- (ICFolderCustomNoteSortType)sortType;
- (ICSortMenu)initWithTitle:(id)a3 sortType:(id)a4 selectedSortTypeHandler:(id)a5;
- (NSString)title;
- (id)actionWithDirection:(int64_t)a3;
- (id)actionWithOrder:(int64_t)a3;
- (id)createMenu;
- (id)selectedSortTypeHandler;
- (void)setSelectedSortTypeHandler:(id)a3;
- (void)setSortType:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICSortMenu

- (ICSortMenu)initWithTitle:(id)a3 sortType:(id)a4 selectedSortTypeHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICSortMenu;
  v12 = [(ICSortMenu *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_sortType, a4);
    id v14 = objc_retainBlock(v11);
    id selectedSortTypeHandler = v13->_selectedSortTypeHandler;
    v13->_id selectedSortTypeHandler = v14;
  }
  return v13;
}

- (id)createMenu
{
  v3 = [(ICSortMenu *)self actionWithOrder:0];
  v4 = [(ICSortMenu *)self actionWithOrder:1];
  v5 = [(ICSortMenu *)self actionWithOrder:2];
  v6 = [(ICSortMenu *)self actionWithOrder:3];
  objc_super v17 = [(ICSortMenu *)self actionWithDirection:0];
  v16 = [(ICSortMenu *)self actionWithDirection:1];
  v19[0] = v17;
  v19[1] = v16;
  v7 = +[NSArray arrayWithObjects:v19 count:2];
  v8 = +[UIMenu menuWithTitle:&stru_10063F3D8 image:0 identifier:0 options:1 children:v7];

  id v9 = +[UIImage systemImageNamed:@"arrow.up.arrow.down"];
  id v10 = [(ICSortMenu *)self title];
  v18[0] = v3;
  v18[1] = v4;
  v18[2] = v5;
  v18[3] = v6;
  v18[4] = v8;
  id v11 = +[NSArray arrayWithObjects:v18 count:5];
  v12 = +[UIMenu menuWithTitle:v10 image:v9 identifier:@"com.apple.mobilenotes.sortMenuIdentifier" options:0 children:v11];

  v13 = [(ICSortMenu *)self sortType];
  id v14 = +[ICFolderCustomNoteSortType actionItemTitleForOrder:](ICFolderCustomNoteSortType, "actionItemTitleForOrder:", [v13 order]);
  [v12 setSubtitle:v14];

  return v12;
}

- (id)actionWithOrder:(int64_t)a3
{
  v5 = [(ICSortMenu *)self sortType];
  id v6 = [v5 order];
  v7 = +[ICFolderCustomNoteSortType actionItemTitleForOrder:a3];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100092F60;
  objc_super v17 = &unk_100627908;
  id v20 = v6;
  int64_t v21 = a3;
  id v18 = v5;
  v19 = self;
  id v8 = v5;
  id v9 = +[UIAction actionWithTitle:v7 image:0 identifier:0 handler:&v14];
  id v10 = [v8 order:v14, v15, v16, v17];
  BOOL v11 = v10 == (id)a3;
  if (v10 == (id)a3) {
    v12 = &UIAccessibilityTraitSelected;
  }
  else {
    v12 = &UIAccessibilityTraitNone;
  }
  [v9 setState:v11];
  [v9 setAccessibilityTraits:*v12];

  return v9;
}

- (id)actionWithDirection:(int64_t)a3
{
  v5 = [(ICSortMenu *)self sortType];
  id v6 = +[ICFolderCustomNoteSortType stringNameForDirection:order:](ICFolderCustomNoteSortType, "stringNameForDirection:order:", a3, [v5 order]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10009312C;
  v13[3] = &unk_100627930;
  uint64_t v15 = self;
  int64_t v16 = a3;
  id v14 = v5;
  id v7 = v5;
  id v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v13];
  id v9 = [v7 direction];
  BOOL v10 = v9 == (id)a3;
  if (v9 == (id)a3) {
    BOOL v11 = &UIAccessibilityTraitSelected;
  }
  else {
    BOOL v11 = &UIAccessibilityTraitNone;
  }
  [v8 setState:v10];
  [v8 setAccessibilityTraits:*v11];

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (ICFolderCustomNoteSortType)sortType
{
  return self->_sortType;
}

- (void)setSortType:(id)a3
{
}

- (id)selectedSortTypeHandler
{
  return self->_selectedSortTypeHandler;
}

- (void)setSelectedSortTypeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedSortTypeHandler, 0);
  objc_storeStrong((id *)&self->_sortType, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end