@interface BKActionController
- (AEBookInfo)bookInfo;
- (BKActionController)init;
- (BKActionControllerDelegate)delegate;
- (BKViewController)ancestorViewController;
- (BOOL)_hasValidActions;
- (BOOL)canEmailBook;
- (BOOL)canPrintBook;
- (BOOL)showsEmail;
- (BOOL)showsPrint;
- (NSMutableArray)applicationActivities;
- (NSMutableArray)excludedActivityTypes;
- (NSMutableArray)includedActivityTypes;
- (id)activityItems;
- (id)barButtonItem;
- (void)_setActivities;
- (void)cancelActions;
- (void)dealloc;
- (void)setAncestorViewController:(id)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setBookInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setShowsEmail:(BOOL)a3;
- (void)setShowsPrint:(BOOL)a3;
- (void)showActionControls:(id)a3;
@end

@implementation BKActionController

- (BKActionController)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKActionController;
  v2 = [(BKActionController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    includedActivityTypes = v2->_includedActivityTypes;
    v2->_includedActivityTypes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    excludedActivityTypes = v2->_excludedActivityTypes;
    v2->_excludedActivityTypes = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    applicationActivities = v2->_applicationActivities;
    v2->_applicationActivities = (NSMutableArray *)v7;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKActionController;
  [(BKActionController *)&v4 dealloc];
}

- (void)cancelActions
{
  if (self->_showsPrint)
  {
    if ([(BKActionController *)self canPrintBook])
    {
      Class v2 = NSClassFromString(@"UIPrintInteractionController");
      if (v2)
      {
        id v3 = [(objc_class *)v2 sharedPrintController];
        [v3 dismissAnimated:1];
      }
    }
  }
}

- (id)barButtonItem
{
  if ([(BKActionController *)self _hasValidActions] && !self->_actionButton)
  {
    id v3 = +[UIBarButtonItem bc_readingExperienceBarItem:@"square.and.arrow.up" target:self action:"showActionControls:"];
    actionButton = self->_actionButton;
    self->_actionButton = v3;
  }
  uint64_t v5 = self->_actionButton;

  return v5;
}

- (void)_setActivities
{
  if (self->_showsEmail && [(BKActionController *)self canEmailBook])
  {
    [(NSMutableArray *)self->_includedActivityTypes addObject:UIActivityTypeMail];
    [(NSMutableArray *)self->_includedActivityTypes addObject:UIActivityTypeMessage];
  }
  if (self->_showsPrint && [(BKActionController *)self canPrintBook])
  {
    includedActivityTypes = self->_includedActivityTypes;
    [(NSMutableArray *)includedActivityTypes addObject:UIActivityTypePrint];
  }
}

- (id)activityItems
{
  id v3 = [BKActivityURLItemSource alloc];
  objc_super v4 = [(BKActionController *)self bookInfo];
  uint64_t v5 = [v4 bookBundlePath];
  v6 = [(BKActivityURLItemSource *)v3 initWithPath:v5];

  uint64_t v7 = +[NSMutableArray arrayWithObject:v6];

  return v7;
}

- (void)showActionControls:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_includedActivityTypes removeAllObjects];
  [(NSMutableArray *)self->_excludedActivityTypes removeAllObjects];
  [(NSMutableArray *)self->_applicationActivities removeAllObjects];
  [(BKActionController *)self _setActivities];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_43A34;
  v11[3] = &unk_1DBAE0;
  objc_copyWeak(&v13, &location);
  id v5 = v4;
  id v12 = v5;
  v6 = objc_retainBlock(v11);
  uint64_t v7 = +[BCProgressKitController sharedController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_43DA8;
  v9[3] = &unk_1DBB08;
  v8 = v6;
  id v10 = v8;
  [v7 activeContextWithCompletion:v9];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)canPrintBook
{
  return _isMultitaskingSupported(self, a2);
}

- (BOOL)canEmailBook
{
  return 1;
}

- (BOOL)_hasValidActions
{
  if ([(BKActionController *)self canEmailBook]) {
    return 1;
  }

  return [(BKActionController *)self canPrintBook];
}

- (BOOL)showsEmail
{
  return self->_showsEmail;
}

- (void)setShowsEmail:(BOOL)a3
{
  self->_showsEmail = a3;
}

- (BOOL)showsPrint
{
  return self->_showsPrint;
}

- (void)setShowsPrint:(BOOL)a3
{
  self->_showsPrint = a3;
}

- (AEBookInfo)bookInfo
{
  return self->_bookInfo;
}

- (void)setBookInfo:(id)a3
{
}

- (BKViewController)ancestorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ancestorViewController);

  return (BKViewController *)WeakRetained;
}

- (void)setAncestorViewController:(id)a3
{
}

- (BKActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKActionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (NSMutableArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSMutableArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_ancestorViewController);
  objc_storeStrong((id *)&self->_bookInfo, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end