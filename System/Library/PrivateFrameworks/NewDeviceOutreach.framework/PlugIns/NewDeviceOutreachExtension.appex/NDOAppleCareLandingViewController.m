@interface NDOAppleCareLandingViewController
- (NSString)presentedSerialNumber;
- (UINavigationController)vcToPresent;
- (id)manager;
- (unint64_t)presentedDeviceType;
- (void)_clearNotificationForSerialNumber:(id)a3 completion:(id)a4;
- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3;
- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3 params:(id)a4;
- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)setPresentedDeviceType:(unint64_t)a3;
- (void)setPresentedSerialNumber:(id)a3;
- (void)setVcToPresent:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webviewFinishedWithCompletion:(unint64_t)a3;
@end

@implementation NDOAppleCareLandingViewController

- (id)manager
{
  v2 = objc_opt_new();
  return v2;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _NDOLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 userInfo];
    v13 = [v12 allKeys];
    v14 = [v9 label];
    v15 = [v9 identifier];
    *(_DWORD *)buf = 138412802;
    v31 = v13;
    __int16 v32 = 2112;
    v33 = v14;
    __int16 v34 = 2112;
    v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Proccess followup with user info keys: %@ :: %@ :: %@", buf, 0x20u);
  }
  v16 = [v8 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"FollowupSerialNumber"];

  [(NDOAppleCareLandingViewController *)self setPresentedSerialNumber:v17];
  v18 = _NDOLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_1000026CC((uint64_t)v17, v18);
  }

  v19 = [(NDOAppleCareLandingViewController *)self manager];
  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000013DC;
  v24[3] = &unk_100004240;
  objc_copyWeak(&v29, (id *)buf);
  id v20 = v10;
  id v28 = v20;
  v24[4] = self;
  id v21 = v9;
  id v25 = v21;
  id v22 = v17;
  id v26 = v22;
  id v23 = v8;
  id v27 = v23;
  [v19 getDeviceInfoForSerialNumber:v22 usingPolicy:0 withReply:v24];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

- (void)_clearNotificationForSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NDOAppleCareLandingViewController *)self manager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100001E10;
  v11[3] = &unk_1000041F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 dismissNotificationForSerialNumber:v10 completion:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NDOAppleCareLandingViewController;
  [(NDOAppleCareLandingViewController *)&v7 viewWillAppear:a3];
  v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)6)
  {
    id v6 = [(NDOAppleCareLandingViewController *)self vcToPresent];
    [v6 preferredContentSize];
    -[NDOAppleCareLandingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NDOAppleCareLandingViewController;
  [(NDOAppleCareLandingViewController *)&v10 viewDidAppear:a3];
  v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)1)
  {

LABEL_4:
    objc_super v7 = [(NDOAppleCareLandingViewController *)self vcToPresent];
    [v7 setModalPresentationStyle:2];

    goto LABEL_5;
  }
  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)6) {
    goto LABEL_4;
  }
LABEL_5:
  id v8 = [(NDOAppleCareLandingViewController *)self vcToPresent];
  [v8 setModalInPresentation:1];

  id v9 = [(NDOAppleCareLandingViewController *)self vcToPresent];
  [(NDOAppleCareLandingViewController *)self presentViewController:v9 animated:1 completion:&stru_100004280];
}

- (void)webviewFinishedWithCompletion:(unint64_t)a3
{
  id v5 = [(NDOAppleCareLandingViewController *)self presentedSerialNumber];
  [(NDOAppleCareLandingViewController *)self outreachFinishedForDeviceWithSerialNumber:v5 withCompletion:a3];
}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3
{
  id v5 = [(NDOAppleCareLandingViewController *)self presentedSerialNumber];
  [(NDOAppleCareLandingViewController *)self outreachFinishedForDeviceWithSerialNumber:v5 withCompletion:a3];
}

- (void)amsUIViewFinishedWithCompletion:(unint64_t)a3 params:(id)a4
{
  id v6 = [(NDOAppleCareLandingViewController *)self presentedSerialNumber];
  [(NDOAppleCareLandingViewController *)self outreachFinishedForDeviceWithSerialNumber:v6 withCompletion:a3];
}

- (void)outreachFinishedForDeviceWithSerialNumber:(id)a3 withCompletion:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "outreachFinishedWithCompletion: %ld", buf, 0xCu);
  }

  id v8 = [(NDOAppleCareLandingViewController *)self manager];
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002368;
    v10[3] = &unk_1000042A8;
    id v11 = v6;
    [v8 dismissFollowUpForSerialNumber:v11 completion:v10];
  }
  if (a4 <= 5 && ((1 << a4) & 0x2C) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002440;
    v9[3] = &unk_1000042F8;
    v9[4] = self;
    v9[5] = a4;
    [v8 getDeviceInfoForSerialNumber:v6 usingPolicy:2 withReply:v9];
  }
  else
  {
    [(NDOAppleCareLandingViewController *)self finishProcessing];
  }
}

- (UINavigationController)vcToPresent
{
  return (UINavigationController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVcToPresent:(id)a3
{
}

- (NSString)presentedSerialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentedSerialNumber:(id)a3
{
}

- (unint64_t)presentedDeviceType
{
  return self->_presentedDeviceType;
}

- (void)setPresentedDeviceType:(unint64_t)a3
{
  self->_presentedDeviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedSerialNumber, 0);
  objc_storeStrong((id *)&self->_vcToPresent, 0);
}

@end