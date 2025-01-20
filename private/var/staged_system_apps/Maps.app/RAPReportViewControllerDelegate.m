@interface RAPReportViewControllerDelegate
- (RAPReport)report;
- (RAPReportViewControllerDelegate)initWithReport:(id)a3 completion:(id)a4 delegate:(id)a5;
- (RAPReportViewControllerDelegate)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (RAPReportViewControllerProtocol)delegate;
- (RAPUserInfoPart)userInfoPart;
- (UIBarButtonItem)sendButtonItem;
- (id)completion;
- (void)_send;
- (void)dealloc;
- (void)invokeCompletionWithOutcome:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RAPReportViewControllerDelegate

- (RAPReportViewControllerDelegate)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportViewControllerDelegate;
  v10 = [(RAPReportViewControllerDelegate *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_report, a3);
    id v12 = [v9 copy];
    id completion = v11->_completion;
    v11->_id completion = v12;
  }
  return v11;
}

- (RAPReportViewControllerDelegate)initWithReport:(id)a3 completion:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = [(RAPReportViewControllerDelegate *)self initWithReport:a3 question:0 completion:a4];
  v10 = v9;
  if (v9)
  {
    id v11 = objc_storeWeak((id *)&v9->_delegate, v8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      v14 = +[RAPQuestion RAPTitle];
      [WeakRetained setTitle:v14];
    }
  }

  return v10;
}

- (void)invokeCompletionWithOutcome:(int64_t)a3
{
  id completion = (void (**)(id, id, int64_t))self->_completion;
  if (completion)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    completion[2](completion, WeakRetained, a3);
  }
}

- (UIBarButtonItem)sendButtonItem
{
  sendButtonItem = self->_sendButtonItem;
  if (!sendButtonItem)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      v5 = (RAPReportViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      v5 = self;
    }
    v6 = v5;

    id v7 = objc_alloc((Class)UIBarButtonItem);
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"Submit" value:@"localized string not found" table:0];
    id v10 = [v7 initWithTitle:v9 style:2 target:v6 action:"_send"];

    [v10 setEnabled:[self->_report canCreateSubmittableProblem]];
    report = self->_report;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100B38C90;
    v16[3] = &unk_101318BF0;
    id v12 = (UIBarButtonItem *)v10;
    v17 = v12;
    [(RAPReport *)report addObserver:self changeHandler:v16];
    v13 = self->_sendButtonItem;
    self->_sendButtonItem = v12;
    v14 = v12;

    sendButtonItem = self->_sendButtonItem;
  }

  return sendButtonItem;
}

- (RAPUserInfoPart)userInfoPart
{
  userInfoPart = self->_userInfoPart;
  if (!userInfoPart)
  {
    v4 = objc_alloc_init(RAPUserInfoPart);
    v5 = self->_userInfoPart;
    self->_userInfoPart = v4;

    userInfoPart = self->_userInfoPart;
  }

  return userInfoPart;
}

- (void)_send
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100B38DA0;
  v2[3] = &unk_1012F6620;
  v2[4] = self;
  +[RAPPrivacy performPrivacyCheckWithAppearance:1 completion:v2];
}

- (void)dealloc
{
  [(RAPReport *)self->_report removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RAPReportViewControllerDelegate;
  [(RAPReportViewControllerDelegate *)&v3 dealloc];
}

- (RAPReport)report
{
  return self->_report;
}

- (id)completion
{
  return self->_completion;
}

- (RAPReportViewControllerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPReportViewControllerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoPart, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end