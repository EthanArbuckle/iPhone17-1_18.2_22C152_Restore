@interface COSPartnerAppAMSDelegate
- (COSPartnerAppAMSDelegate)initWithPresentingViewController:(id)a3;
- (UIViewController)presentingViewController;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)setPresentingViewController:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation COSPartnerAppAMSDelegate

- (COSPartnerAppAMSDelegate)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COSPartnerAppAMSDelegate;
  v5 = [(COSPartnerAppAMSDelegate *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    [(COSPartnerAppAMSDelegate *)v6 startListening];
  }

  return v6;
}

- (void)stopListening
{
  id v2 = +[ASDNotificationCenter defaultCenter];
  [v2 setDialogObserver:0];
}

- (void)startListening
{
  id v3 = +[ASDNotificationCenter defaultCenter];
  [v3 setDialogObserver:self];
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)AMSUIAuthenticateTask);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v10 = [v8 initWithRequest:v7 presentingViewController:WeakRetained];

  v11 = [v10 performAuthentication];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100056B6C;
  v13[3] = &unk_100244998;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)AMSUIAlertDialogTask);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v10 = [v8 initWithRequest:v7 presentingViewController:WeakRetained];

  v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100056D94;
  v13[3] = &unk_1002449C0;
  id v14 = v6;
  id v12 = v6;
  [v11 addFinishBlock:v13];
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end