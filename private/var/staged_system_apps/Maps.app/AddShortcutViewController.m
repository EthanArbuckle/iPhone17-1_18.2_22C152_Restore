@interface AddShortcutViewController
- (AddShortcutViewController)initWithShortcutEditSession:(id)a3;
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (BOOL)showsRecents;
- (ShortcutEditSessionController)sessionController;
- (id)dismissActionHandler;
- (id)headerTitle;
- (int)requestSource;
- (int64_t)accessoryTypeToShow;
- (int64_t)shortcutType;
- (void)didDismissByGesture;
- (void)handleDismissAction:(id)a3;
- (void)saveMapItem:(id)a3;
- (void)saveShortcut:(id)a3;
- (void)setDismissActionHandler:(id)a3;
- (void)setSessionController:(id)a3;
@end

@implementation AddShortcutViewController

- (AddShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddShortcutViewController;
  v6 = [(AddFromACViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shortcutEditSession, a3);
  }

  return v7;
}

- (id)headerTitle
{
  return [(ShortcutEditSession *)self->_shortcutEditSession titleForAddressPicker];
}

- (int)requestSource
{
  return 21;
}

- (BOOL)showsRecents
{
  return 0;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)AddShortcutViewController;
  if ([(AddFromACViewController *)&v9 searchDataSource:a3 shouldFilterItem:v6]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = [(ShortcutEditSession *)self->_shortcutEditSession shortcutsContainItem:v6];
  }

  return v7;
}

- (void)saveMapItem:(id)a3
{
  [(ShortcutEditSession *)self->_shortcutEditSession setMapItem:a3];
  id v4 = [(AddShortcutViewController *)self sessionController];
  [v4 viewController:self didEditMapItemInSession:self->_shortcutEditSession];
}

- (void)saveShortcut:(id)a3
{
  id v9 = a3;
  if ([v9 type] == (id)6)
  {
    [v9 setIsHidden:0];
    id v4 = +[ShortcutEditSession addSessionWithShortcut:v9];
    [v4 setMoveToPreferredIndexInFavorites:1];
    id v5 = [(AddShortcutViewController *)self sessionController];
    [v5 addFavoriteButtonShortcut:v4];
  }
  else if (sub_1000BBB44(self) == 5 || [(ShortcutEditSession *)self->_shortcutEditSession alreadySaved])
  {
    id v6 = objc_alloc((Class)MKMapItem);
    BOOL v7 = [v9 geoMapItem];
    id v4 = [v6 initWithGeoMapItem:v7 isPlaceHolderPlace:0];

    [(AddShortcutViewController *)self saveMapItem:v4];
  }
  else
  {
    id v4 = +[ShortcutEditSession addSessionWithShortcut:v9];
    v8 = [(ControlContaineeViewController *)self delegate];
    [v8 viewController:self editShortcut:v4];
  }
}

- (void)handleDismissAction:(id)a3
{
  id v4 = a3;
  id v5 = [(AddShortcutViewController *)self dismissActionHandler];

  if (v5)
  {
    id v6 = [(AddShortcutViewController *)self dismissActionHandler];
    v6[2]();

    [(AddShortcutViewController *)self setDismissActionHandler:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AddShortcutViewController;
    [(ContaineeViewController *)&v7 handleDismissAction:v4];
  }
}

- (void)didDismissByGesture
{
  v2.receiver = self;
  v2.super_class = (Class)AddShortcutViewController;
  [(ContaineeViewController *)&v2 didDismissByGesture];
}

- (int64_t)shortcutType
{
  v3 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
  if ([v3 type] == (id)1)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
    id v4 = [v5 type];
  }
  return (int64_t)v4;
}

- (int64_t)accessoryTypeToShow
{
  return 4;
}

- (ShortcutEditSessionController)sessionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);

  return (ShortcutEditSessionController *)WeakRetained;
}

- (void)setSessionController:(id)a3
{
}

- (id)dismissActionHandler
{
  return self->_dismissActionHandler;
}

- (void)setDismissActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissActionHandler, 0);
  objc_destroyWeak((id *)&self->_sessionController);

  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
}

@end