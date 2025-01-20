@interface RAPPlacecardImageryController
- (RAPPlacecardImageryController)initWithReport:(id)a3 layoutManager:(id)a4;
- (UIAlertController)alertController;
- (id)completionHandler;
- (void)_invokeCompletionHandlerWithShouldSubmit:(BOOL)a3;
- (void)_setupAlertController;
- (void)setCompletionHandler:(id)a3;
@end

@implementation RAPPlacecardImageryController

- (RAPPlacecardImageryController)initWithReport:(id)a3 layoutManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlacecardImageryController;
  v9 = [(RAPPlacecardImageryController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutManager, a4);
    objc_storeStrong((id *)&v10->_report, a3);
    v11 = [RAPPlacecardImageryQuestion alloc];
    v12 = [(RAPPlacecardImageryLayoutManager *)v10->_layoutManager issueItems];
    v13 = [(RAPPlacecardImageryQuestion *)v11 initWithReport:v7 parentQuestion:0 supportedIssueItems:v12];
    question = v10->_question;
    v10->_question = v13;

    [v7 setInitialQuestion:v10->_question];
    [(RAPPlacecardImageryController *)v10 _setupAlertController];
  }

  return v10;
}

- (void)_setupAlertController
{
  v3 = (UIAlertController *)objc_alloc_init((Class)UIAlertController);
  alertController = self->_alertController;
  self->_alertController = v3;

  v5 = [(UIAlertController *)self->_alertController popoverPresentationController];
  [v5 setPermittedArrowDirections:3];

  v6 = [(RAPPlacecardImageryQuestion *)self->_question localizedTitle];
  [(UIAlertController *)self->_alertController setTitle:v6];

  objc_initWeak(&location, self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(RAPPlacecardImageryLayoutManager *)self->_layoutManager issueItems];
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v12 = [v11 localizedTitle];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100A99CEC;
        v22[3] = &unk_101316268;
        v22[4] = self;
        v22[5] = v11;
        objc_copyWeak(&v23, &location);
        v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v22];

        [(UIAlertController *)self->_alertController addAction:v13];
        objc_destroyWeak(&v23);
      }
      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"Cancel [RAP Placecard Imagery]" value:@"localized string not found" table:0];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100A99D54;
  v20 = &unk_1012E8EB8;
  objc_copyWeak(&v21, &location);
  objc_super v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:&v17];

  -[UIAlertController addAction:](self->_alertController, "addAction:", v16, v17, v18, v19, v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_invokeCompletionHandlerWithShouldSubmit:(BOOL)a3
{
  completionHandler = (void (**)(id, BOOL, RAPReport *, RAPPlacecardImageryQuestion *))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, a3, self->_report, self->_question);
  }
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);

  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end