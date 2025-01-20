@interface RAPReportViewController
- (RAPReport)report;
- (RAPReportViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (RAPUserInfoPart)userInfoPart;
- (UIBarButtonItem)sendButtonItem;
- (id)completion;
- (void)_send;
- (void)invokeCompletionWithOutcome:(int64_t)a3;
@end

@implementation RAPReportViewController

- (RAPReportViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RAPReportViewController;
  v11 = [(RAPReportViewController *)&v16 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = [[RAPReportViewControllerDelegate alloc] initWithReport:v8 completion:v10 delegate:v11];
    rapDelegate = v11->_rapDelegate;
    v11->_rapDelegate = v12;

    if (v9) {
      [v9 localizedTitle];
    }
    else {
    v14 = +[RAPQuestion RAPTitle];
    }
    [(RAPReportViewController *)v11 setTitle:v14];
  }
  return v11;
}

- (UIBarButtonItem)sendButtonItem
{
  return [(RAPReportViewControllerDelegate *)self->_rapDelegate sendButtonItem];
}

- (RAPReport)report
{
  return [(RAPReportViewControllerDelegate *)self->_rapDelegate report];
}

- (id)completion
{
  return [(RAPReportViewControllerDelegate *)self->_rapDelegate completion];
}

- (void)invokeCompletionWithOutcome:(int64_t)a3
{
}

- (void)_send
{
  v3 = [(RAPReportViewController *)self view];
  [v3 endEditing:1];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B3C468;
  v4[3] = &unk_1012F6620;
  v4[4] = self;
  +[RAPPrivacy performPrivacyCheckWithAppearance:1 completion:v4];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoPart, 0);

  objc_storeStrong((id *)&self->_rapDelegate, 0);
}

@end