@interface MCDAlertAction
+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
- (id)actionHandler;
- (void)setActionHandler:(id)a3;
@end

@implementation MCDAlertAction

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [[MCDAlertButtonViewController alloc] initWithTitle:v8 image:v9];
  v12 = [a1 _actionWithContentViewController:v11 style:0 handler:v10];
  [v12 setActionHandler:v10];
  objc_initWeak(&location, v12);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000B381C;
  v17 = &unk_100FC3628;
  objc_copyWeak(&v18, &location);
  [(MCDAlertButtonViewController *)v11 setCompletionHandler:&v14];
  [v12 setEnabled:0, v14, v15, v16, v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end