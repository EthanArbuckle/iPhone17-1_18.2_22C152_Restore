@interface BKLibraryBookshelfSelectedActionBarViewController
- (BKLibraryBookshelfSelectedActionBar)toolbar;
- (BKLibraryBookshelfSelectedActionBarDelegate)delegate;
- (UIBarButtonItem)addButton;
- (UIBarButtonItem)moreButton;
- (UIBarButtonItem)trashButton;
- (void)addButtonTouch:(id)a3;
- (void)moreButtonTouch:(id)a3;
- (void)removeButtonTouch:(id)a3;
- (void)setAddButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setToolbar:(id)a3;
- (void)setTrashButton:(id)a3;
- (void)updateActionBarFromMetrics:(id)a3;
- (void)updateForSelectedItems:(id)a3 deletableItems:(BOOL)a4 seriesItems:(BOOL)a5 editable:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation BKLibraryBookshelfSelectedActionBarViewController

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)BKLibraryBookshelfSelectedActionBarViewController;
  [(BKLibraryBookshelfSelectedActionBarViewController *)&v27 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Actions" value:&stru_100A70340 table:0];
  v5 = [(BKLibraryBookshelfSelectedActionBarViewController *)self view];
  [v5 setAccessibilityLabel:v4];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Delete" value:&stru_100A70340 table:0];
  v8 = [(BKLibraryBookshelfSelectedActionBarViewController *)self trashButton];
  [v8 setAccessibilityLabel:v7];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Share" value:&stru_100A70340 table:0];
  v11 = [(BKLibraryBookshelfSelectedActionBarViewController *)self moreButton];
  [v11 setAccessibilityLabel:v10];

  v12 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:3 scale:17.0];
  v13 = +[UIImage systemImageNamed:@"text.badge.plus"];
  v14 = [v13 imageWithConfiguration:v12];

  objc_opt_class();
  v15 = [(BKLibraryBookshelfSelectedActionBarViewController *)self addButton];
  v16 = [v15 customView];
  v17 = BUDynamicCast();

  [v17 setImage:v14 forState:0];
  v18 = [(BKLibraryBookshelfSelectedActionBarViewController *)self view];
  id v19 = [v18 effectiveUserInterfaceLayoutDirection];

  if (v19 == (id)1) {
    double v20 = -6.0;
  }
  else {
    double v20 = 6.0;
  }
  [v17 setImageEdgeInsets:0.0, -v20, 0.0, v20];
  [v17 setTitleEdgeInsets:0.0, v20, 0.0, -v20];
  [v17 setContentEdgeInsets:0.0, 6.0, 0.0, 6.0];
  v21 = +[UIImage systemImageNamed:@"trash"];
  v22 = [v21 imageWithConfiguration:v12];

  v23 = [(BKLibraryBookshelfSelectedActionBarViewController *)self trashButton];
  [v23 setImage:v22];

  v24 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  v25 = [v24 imageWithConfiguration:v12];

  v26 = [(BKLibraryBookshelfSelectedActionBarViewController *)self moreButton];
  [v26 setImage:v25];
}

- (void)removeButtonTouch:(id)a3
{
  id v4 = [(BKLibraryBookshelfSelectedActionBarViewController *)self delegate];
  [v4 removeForSelectedItems:self];
}

- (void)moreButtonTouch:(id)a3
{
  id v5 = [(BKLibraryBookshelfSelectedActionBarViewController *)self delegate];
  id v4 = [(BKLibraryBookshelfSelectedActionBarViewController *)self moreButton];
  [v5 shareSelectedItemFromBarButtonItem:v4];
}

- (void)addButtonTouch:(id)a3
{
  id v4 = [(BKLibraryBookshelfSelectedActionBarViewController *)self delegate];
  [v4 addForSelectedItems:self];
}

- (void)updateForSelectedItems:(id)a3 deletableItems:(BOOL)a4 seriesItems:(BOOL)a5 editable:(BOOL)a6
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100109D70;
  v9[3] = &unk_100A44818;
  id v10 = a3;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v10;
  +[UIView animateWithDuration:v9 animations:1.0];
}

- (void)updateActionBarFromMetrics:(id)a3
{
  id v4 = a3;
  id v7 = [(BKLibraryBookshelfSelectedActionBarViewController *)self toolbar];
  id v5 = [v4 barTintColor];
  [v7 setBarTintColor:v5];

  v6 = [v4 tintColor];

  [v7 setTintColor:v6];
}

- (BKLibraryBookshelfSelectedActionBar)toolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbar);

  return (BKLibraryBookshelfSelectedActionBar *)WeakRetained;
}

- (void)setToolbar:(id)a3
{
}

- (BKLibraryBookshelfSelectedActionBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookshelfSelectedActionBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIBarButtonItem)trashButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trashButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setTrashButton:(id)a3
{
}

- (UIBarButtonItem)addButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setAddButton:(id)a3
{
}

- (UIBarButtonItem)moreButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moreButton);

  return (UIBarButtonItem *)WeakRetained;
}

- (void)setMoreButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_moreButton);
  objc_destroyWeak((id *)&self->_addButton);
  objc_destroyWeak((id *)&self->_trashButton);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_toolbar);
}

@end