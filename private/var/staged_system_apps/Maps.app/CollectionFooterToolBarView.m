@interface CollectionFooterToolBarView
- (BOOL)_shouldUseGlyphForStrings:(id)a3;
- (BOOL)hideEditButton;
- (BOOL)useMacConfig;
- (void)_updateContent;
- (void)addAction:(id)a3;
- (void)addToAction:(id)a3;
- (void)cancelAction:(id)a3;
- (void)cancelListAction:(id)a3;
- (void)deleteAction:(id)a3;
- (void)deleteListAction:(id)a3;
- (void)editAction:(id)a3;
- (void)editListAction:(id)a3;
- (void)loadContentActions;
- (void)loadEditActions;
- (void)loadEditAllActions;
- (void)loadListActions;
- (void)loadListEditActions;
- (void)loadListEditAllActions;
- (void)newCollectionAction:(id)a3;
- (void)selectAction:(id)a3;
- (void)selectAllAction:(id)a3;
- (void)setHideEditButton:(BOOL)a3;
- (void)setUseMacConfig:(BOOL)a3;
- (void)shareAction:(id)a3;
@end

@implementation CollectionFooterToolBarView

- (void)_updateContent
{
  switch([(FooterToolBarView *)self state])
  {
    case 0uLL:
      id v3 = [(FooterToolBarView *)self toolBar];
      [v3 setItems:&__NSArray0__struct];

      break;
    case 1uLL:
      [(CollectionFooterToolBarView *)self loadContentActions];
      break;
    case 2uLL:
      [(CollectionFooterToolBarView *)self loadEditActions];
      break;
    case 3uLL:
      [(CollectionFooterToolBarView *)self loadEditAllActions];
      break;
    case 4uLL:
      [(CollectionFooterToolBarView *)self loadListActions];
      break;
    case 5uLL:
      [(CollectionFooterToolBarView *)self loadListEditActions];
      break;
    case 6uLL:
      [(CollectionFooterToolBarView *)self loadListEditAllActions];
      break;
    default:
      return;
  }
}

- (void)loadListActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"newCollectionAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editListAction:"];
  if ([(CollectionFooterToolBarView *)self hideEditButton])
  {
    id v10 = v4;
    id v11 = v3;
    v6 = &v10;
    uint64_t v7 = 2;
  }
  else
  {
    id v12 = v5;
    id v13 = v4;
    id v14 = v3;
    v6 = &v12;
    uint64_t v7 = 3;
  }
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, v7, v10, v11, v12, v13, v14);
  v9 = [(FooterToolBarView *)self toolBar];
  [v9 setItems:v8];
}

- (void)loadListEditActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelListAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"[Collection] Delete" value:@"localized string not found" table:0];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"deleteListAction:"];

  v9 = +[UIColor systemRedColor];
  [v8 setTintColor:v9];

  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v8;
  id v10 = +[NSArray arrayWithObjects:v12 count:3];
  id v11 = [(FooterToolBarView *)self toolBar];
  [v11 setItems:v10];
}

- (void)loadListEditAllActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelListAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"[Collection] Delete" value:@"localized string not found" table:0];
  id v8 = [v5 initWithTitle:v7 style:0 target:self action:"deleteListAction:"];

  v9 = +[UIColor systemRedColor];
  [v8 setTintColor:v9];

  [v8 setEnabled:0];
  v12[0] = v3;
  v12[1] = v4;
  v12[2] = v8;
  id v10 = +[NSArray arrayWithObjects:v12 count:3];
  id v11 = [(FooterToolBarView *)self toolBar];
  [v11 setItems:v10];
}

- (void)loadContentActions
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addAction:"];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:self action:"shareAction:"];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editAction:"];
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v7 = +[NSMutableArray array];
  if (![(CollectionFooterToolBarView *)self hideEditButton]) {
    [v7 addObject:v5];
  }
  if (![(FooterToolBarView *)self canDeleteOnly])
  {
    if (GEOConfigGetBOOL())
    {
      v13[0] = v6;
      v13[1] = v4;
      v13[2] = v6;
      v13[3] = v3;
      id v8 = v13;
      uint64_t v9 = 4;
    }
    else
    {
      v12[0] = v6;
      v12[1] = v3;
      id v8 = v12;
      uint64_t v9 = 2;
    }
    id v10 = +[NSArray arrayWithObjects:v8 count:v9];
    [v7 addObjectsFromArray:v10];
  }
  id v11 = [(FooterToolBarView *)self toolBar];
  [v11 setItems:v7];
}

- (BOOL)_shouldUseGlyphForStrings:(id)a3
{
  id v4 = a3;
  double v5 = (double)((unint64_t)[v4 count] + 1) * 20.0;
  NSAttributedStringKey v22 = NSFontAttributeName;
  id v6 = +[UIFont system17];
  v23 = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) sizeWithAttributes:v7 v17];
        double v5 = v5 + v13;
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [(CollectionFooterToolBarView *)self frame];
  BOOL v15 = v14 - v5 < 0.0;

  return v15;
}

- (void)loadEditAllActions
{
  [(FooterToolBarView *)self setCanAdaptToWidth:1];
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[Footer] Cancel" value:@"localized string not found" table:0];

  double v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"[Collection] Select All" value:@"localized string not found" table:0];

  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"[Collection] Delete" value:@"localized string not found" table:0];

  v29[0] = v4;
  v29[1] = v6;
  v29[2] = v8;
  v26 = +[NSArray arrayWithObjects:v29 count:3];
  unsigned int v24 = -[CollectionFooterToolBarView _shouldUseGlyphForStrings:](self, "_shouldUseGlyphForStrings:");
  v27 = (void *)v4;
  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:0 target:self action:"cancelAction:"];
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v25 = (void *)v6;
  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v6 style:0 target:self action:"selectAllAction:"];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v8 style:0 target:self action:"deleteAction:"];
  double v13 = +[UIColor systemRedColor];
  [v12 setTintColor:v13];

  [v12 setEnabled:0];
  double v14 = v9;
  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"deleteAction:"];
  v16 = +[UIColor systemRedColor];
  [v15 setTintColor:v16];

  [v15 setEnabled:0];
  long long v17 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, 0);
  if (![(CollectionFooterToolBarView *)self useMacConfig])
  {
    if ([(FooterToolBarView *)self canBeSaved])
    {
      [v17 addObject:v11];
    }
    else
    {
      if (v24) {
        long long v18 = v15;
      }
      else {
        long long v18 = v12;
      }
      v28[0] = v11;
      v28[1] = v10;
      v28[2] = v18;
      id v19 = v11;
      long long v20 = v14;
      id v21 = v18;
      NSAttributedStringKey v22 = +[NSArray arrayWithObjects:v28 count:3];

      double v14 = v20;
      id v11 = v19;
      [v17 addObjectsFromArray:v22];
    }
  }
  v23 = [(FooterToolBarView *)self toolBar];
  [v23 setItems:v17];
}

- (void)loadEditActions
{
  [(FooterToolBarView *)self setCanAdaptToWidth:1];
  id v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[Footer] Cancel" value:@"localized string not found" table:0];

  double v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"[Collection] Add to Guide" value:@"localized string not found" table:0];

  uint64_t v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"[Collection] Delete" value:@"localized string not found" table:0];

  v31[0] = v4;
  v31[1] = v6;
  v31[2] = v8;
  v27 = +[NSArray arrayWithObjects:v31 count:3];
  unsigned int v25 = -[CollectionFooterToolBarView _shouldUseGlyphForStrings:](self, "_shouldUseGlyphForStrings:");
  v28 = (void *)v4;
  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:0 target:self action:"cancelAction:"];
  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v26 = (void *)v6;
  id v11 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v6 style:0 target:self action:"addToAction:"];
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v8 style:0 target:self action:"deleteAction:"];
  double v13 = +[UIColor systemRedColor];
  [v12 setTintColor:v13];

  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"deleteAction:"];
  id v15 = v11;
  v16 = v9;
  long long v17 = +[UIColor systemRedColor];
  [v14 setTintColor:v17];

  long long v18 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v9, v10, 0);
  if (![(CollectionFooterToolBarView *)self useMacConfig])
  {
    if ([(FooterToolBarView *)self canBeSaved])
    {
      [v18 addObject:v15];
    }
    else
    {
      if (v25) {
        id v19 = v14;
      }
      else {
        id v19 = v12;
      }
      id v20 = v19;
      if ([(FooterToolBarView *)self canMove])
      {
        v30[0] = v15;
        v30[1] = v10;
        v30[2] = v20;
        id v21 = (id *)v30;
        uint64_t v22 = 3;
      }
      else
      {
        id v29 = v20;
        id v21 = &v29;
        uint64_t v22 = 1;
      }
      v23 = +[NSArray arrayWithObjects:v21 count:v22];

      [v18 addObjectsFromArray:v23];
    }
  }
  unsigned int v24 = [(FooterToolBarView *)self toolBar];
  [v24 setItems:v18];
}

- (void)editListAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:3];
}

- (void)cancelListAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:4];
}

- (void)deleteListAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:5];
}

- (void)editAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:0];
}

- (void)cancelAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:1];
}

- (void)newCollectionAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:8];
}

- (void)addToAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:7];
}

- (void)selectAllAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:6];
}

- (void)deleteAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:2];
}

- (void)addAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:9];
}

- (void)shareAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:10];
}

- (void)selectAction:(id)a3
{
  id v4 = [(FooterToolBarView *)self delegate];
  [v4 view:self requestsCollectionFooterAction:0];
}

- (BOOL)useMacConfig
{
  return self->_useMacConfig;
}

- (void)setUseMacConfig:(BOOL)a3
{
  self->_useMacConfig = a3;
}

- (BOOL)hideEditButton
{
  return self->_hideEditButton;
}

- (void)setHideEditButton:(BOOL)a3
{
  self->_hideEditButton = a3;
}

@end