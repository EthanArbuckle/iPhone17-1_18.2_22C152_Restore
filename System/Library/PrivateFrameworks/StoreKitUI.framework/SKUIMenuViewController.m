@interface SKUIMenuViewController
- (NSArray)menuImages;
- (NSArray)menuTitles;
- (SKUIMenuViewController)initWithMenuTitles:(id)a3;
- (SKUIMenuViewController)initWithMenuTitles:(id)a3 images:(id)a4;
- (SKUIMenuViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)indexOfCheckedTitle;
- (int64_t)menuStyle;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setIndexOfCheckedTitle:(int64_t)a3;
- (void)setMenuStyle:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SKUIMenuViewController

- (SKUIMenuViewController)initWithMenuTitles:(id)a3 images:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuViewController initWithMenuTitles:images:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMenuViewController;
  v8 = [(SKUIMenuViewController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_indexOfCheckedTitle = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = [v6 copy];
    menuTitles = v9->_menuTitles;
    v9->_menuTitles = (NSArray *)v10;

    uint64_t v12 = [v7 copy];
    menuImages = v9->_menuImages;
    v9->_menuImages = (NSArray *)v12;
  }
  return v9;
}

- (SKUIMenuViewController)initWithMenuTitles:(id)a3
{
  return [(SKUIMenuViewController *)self initWithMenuTitles:a3 images:0];
}

- (void)setIndexOfCheckedTitle:(int64_t)a3
{
  if (self->_indexOfCheckedTitle != a3)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t indexOfCheckedTitle = self->_indexOfCheckedTitle;
    if (indexOfCheckedTitle != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:indexOfCheckedTitle inSection:0];
      [v9 addObject:v6];
    }
    self->_int64_t indexOfCheckedTitle = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
      [v9 addObject:v7];
    }
    if ([(SKUIMenuViewController *)self isViewLoaded])
    {
      v8 = [(SKUIMenuViewController *)self tableView];
      [v8 reloadRowsAtIndexPaths:v9 withRowAnimation:5];
    }
  }
}

- (void)setMenuStyle:(int64_t)a3
{
  if (self->_menuStyle != a3)
  {
    self->_menuStyle = a3;
    id v3 = [(SKUIMenuViewController *)self view];
    [v3 setNeedsDisplay];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2 * (self->_menuStyle == 1);
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuViewController;
  [(SKUIMenuViewController *)&v7 loadView];
  id v3 = [(SKUIMenuViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"a"];
  [v3 setSeparatorStyle:0];
  [v3 setSemanticContentAttribute:storeSemanticContentAttribute()];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(SKUIMenuViewController *)self view];
  id v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v5 setBackgroundColor:v6];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_menuTitles count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"a" forIndexPath:v6];
  if (!v7) {
    objc_super v7 = [[SKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"a"];
  }
  uint64_t v8 = [v6 row];
  if (v8 == self->_indexOfCheckedTitle) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  [(SKUITableViewCell *)v7 setAccessoryType:v9];
  uint64_t v10 = [(SKUITableViewCell *)v7 textLabel];
  v11 = [(NSArray *)self->_menuTitles objectAtIndex:v8];
  [v10 setText:v11];

  uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
  [v10 setTextColor:v12];

  menuImages = self->_menuImages;
  if (menuImages)
  {
    v14 = [(NSArray *)menuImages objectAtIndex:v8];
    v20.width = 35.0;
    v20.height = 35.0;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend(v14, "drawInRect:", 0.0, 0.0, 35.0, 35.0);
    objc_super v15 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v16 = [(SKUITableViewCell *)v7 imageView];
    [v16 setImage:v15];
  }
  if (v8 == [(NSArray *)self->_menuTitles count] - 1)
  {
    [(SKUITableViewCell *)v7 setBottomBorderColor:0];
  }
  else
  {
    v17 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
    [(SKUITableViewCell *)v7 setBottomBorderColor:v17];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "menuViewController:didSelectItemAtIndex:", self, objc_msgSend(v6, "row"));
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [a3 backgroundColor];
  [v6 setBackgroundColor:v7];
}

- (SKUIMenuViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIMenuViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)menuTitles
{
  return self->_menuTitles;
}

- (NSArray)menuImages
{
  return self->_menuImages;
}

- (int64_t)indexOfCheckedTitle
{
  return self->_indexOfCheckedTitle;
}

- (int64_t)menuStyle
{
  return self->_menuStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuImages, 0);
  objc_storeStrong((id *)&self->_menuTitles, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithMenuTitles:images:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuViewController initWithMenuTitles:images:]";
}

@end