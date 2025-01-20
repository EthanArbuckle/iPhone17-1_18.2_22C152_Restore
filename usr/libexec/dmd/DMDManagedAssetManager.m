@interface DMDManagedAssetManager
- (void)promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7;
- (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
@end

@implementation DMDManagedAssetManager

- (void)promptUserToLoginToiTunesIfNeededTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[SSAccountStore defaultStore];
  v15 = [v14 activeAccount];

  if (!v15)
  {
    v18 = +[DMDUserNotificationManager sharedManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100053950;
    v19[3] = &unk_1000CB408;
    v19[4] = self;
    id v20 = v12;
    id v21 = v13;
    [v18 promptUserToLogIntoiTunesWithTitle:v10 message:v11 assertion:v20 completionBlock:v19];

    v17 = v20;
    goto LABEL_5;
  }
  if (v13)
  {
    v16 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100053908;
    block[3] = &unk_1000CB3B8;
    id v24 = v13;
    id v23 = v12;
    dispatch_async(v16, block);

    v17 = v24;
LABEL_5:
  }
}

- (void)promptUserForiTunesAccount:(id)a3 accountNameEditable:(BOOL)a4 canCreateNewAccount:(BOOL)a5 assertion:(id)a6 completionBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v10 = a3;
  id v11 = a7;
  if (v10)
  {
    id v12 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:v10];
  }
  else
  {
    id v12 = +[SSMutableAuthenticationContext contextForSignIn];
  }
  id v13 = v12;
  [v12 setPromptStyle:0];
  [v13 setAccountNameEditable:v9];
  [v13 setCanCreateNewAccount:v8];
  v14 = +[DMDSSAuthenticationRequestDelegate delegateWithAuthenticationContext:v13];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053BBC;
  v16[3] = &unk_1000CB430;
  id v17 = v11;
  id v15 = v11;
  [v14 startWithCompletionBlock:v16];
}

@end