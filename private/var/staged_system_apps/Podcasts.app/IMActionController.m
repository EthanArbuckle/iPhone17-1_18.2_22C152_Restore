@interface IMActionController
- (IMActionController)initWithDelegate:(id)a3;
- (IMActionControllerDelegate)delegate;
- (IMActionSheetAction)moreAction;
- (NSArray)allActions;
- (NSArray)availableActions;
- (NSObject)actionObject;
- (id)createMoreAction;
- (id)presentAvailableActionsFromView:(id)a3;
- (void)dismissActionSheetsAndPopovers;
- (void)prepareForReuse;
- (void)registerActions:(id)a3;
- (void)reloadActions;
- (void)setActionObject:(id)a3;
- (void)setActionObject:(id)a3 reloadActions:(BOOL)a4;
- (void)setAllActions:(id)a3;
- (void)setAvailableActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreAction:(id)a3;
- (void)updateActionSheetsAndPopovers;
@end

@implementation IMActionController

- (IMActionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMActionController;
  v5 = [(IMActionController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setActionObject:(id)a3
{
}

- (void)setActionObject:(id)a3 reloadActions:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_actionObject, a3);
  if (a3 && v4)
  {
    [(IMActionController *)self reloadActions];
  }
}

- (void)reloadActions
{
  v3 = [(IMActionController *)self allActions];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006CBD0;
  v6[3] = &unk_10054E0D0;
  v6[4] = self;
  BOOL v4 = [v3 indexesOfObjectsPassingTest:v6];
  v5 = [v3 objectsAtIndexes:v4];
  [(IMActionController *)self setAvailableActions:v5];
}

- (id)presentAvailableActionsFromView:(id)a3
{
  id v4 = a3;
  v5 = [(IMActionController *)self moreAction];
  v6 = [v5 actionBlock];
  ((void (**)(void, IMActionController *, id))v6)[2](v6, self, v4);

  v7 = [v5 alertController];

  return v7;
}

- (void)prepareForReuse
{
  [(IMActionController *)self setDelegate:0];
  [(IMActionController *)self dismissActionSheetsAndPopovers];
  v3 = [(IMActionController *)self moreAction];
  [v3 setAlertController:0];

  [(IMActionController *)self setActionObject:0];
}

- (void)updateActionSheetsAndPopovers
{
  v3 = [(IMActionController *)self availableActions];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006CDF4;
  v5[3] = &unk_10054E138;
  v6 = &stru_10054E110;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = [(IMActionController *)self moreAction];
  sub_10006CD84(v4, v4);
}

- (void)dismissActionSheetsAndPopovers
{
  v3 = [(IMActionController *)self availableActions];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006CF28;
  v5[3] = &unk_10054E138;
  v6 = &stru_10054E158;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = [(IMActionController *)self moreAction];
  sub_10006CEB8(v4, v4);
}

- (void)setAvailableActions:(id)a3
{
  id v4 = (NSArray *)a3;
  [(IMActionController *)self registerActions:v4];
  availableActions = self->_availableActions;
  self->_availableActions = v4;
}

- (void)registerActions:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006CFF8;
  v3[3] = &unk_10054E180;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

- (id)createMoreAction
{
  v2 = [[IMActionSheetAction alloc] initWithTitle:0 icon:0];
  objc_initWeak(&location, v2);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_10006D104;
  v7 = &unk_10054D478;
  objc_copyWeak(&v8, &location);
  [(IMAction *)v2 setActionBlock:&v4];
  -[IMAction setConditionBlock:](v2, "setConditionBlock:", &stru_10054E1A0, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v2;
}

- (IMActionSheetAction)moreAction
{
  moreAction = self->_moreAction;
  if (!moreAction)
  {
    id v4 = [(IMActionController *)self createMoreAction];
    uint64_t v5 = self->_moreAction;
    self->_moreAction = v4;

    [(IMAction *)self->_moreAction setController:self];
    moreAction = self->_moreAction;
  }

  return moreAction;
}

- (NSObject)actionObject
{
  return self->_actionObject;
}

- (IMActionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMActionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setMoreAction:(id)a3
{
}

- (NSArray)allActions
{
  return self->_allActions;
}

- (void)setAllActions:(id)a3
{
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_allActions, 0);
  objc_storeStrong((id *)&self->_moreAction, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionObject, 0);
}

@end