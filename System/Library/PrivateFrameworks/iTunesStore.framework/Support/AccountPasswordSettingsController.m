@interface AccountPasswordSettingsController
+ (void)observeXPCServer:(id)a3;
+ (void)updateAccountPasswordSettings:(id)a3 connection:(id)a4;
@end

@implementation AccountPasswordSettingsController

+ (void)observeXPCServer:(id)a3
{
}

+ (void)updateAccountPasswordSettings:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (SSXPCConnectionHasEntitlement() & 1) != 0 || (SSXPCConnectionHasEntitlement())
  {
    v8 = +[Daemon daemon];
    [v8 takeKeepAliveAssertion:@"com.apple.itunesstored.AccountPasswordSettings"];

    objc_opt_class();
    reply = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    objc_opt_class();
    v10 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    objc_opt_class();
    v11 = (void *)SSXPCDictionaryCopyCFObjectWithClass();
    v12 = xpc_dictionary_get_value(v6, "4");
    if (reply)
    {
      v18 = v10;
      id v13 = [v10 integerValue];
      id v14 = [v11 integerValue];
      id v17 = [objc_alloc((Class)SSURLRequestProperties) initWithXPCEncoding:v12];
      v15 = [[UpdateAccountPasswordSettingsOperation alloc] initWithFreeDownloadsPasswordSetting:v13 paidPurchasesPasswordSetting:v14 requestProperties:v17];
      objc_initWeak(&location, v15);
      objc_initWeak(&from, a1);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000BA508;
      v19[3] = &unk_1003A5B70;
      objc_copyWeak(&v23, &from);
      objc_copyWeak(v24, &location);
      id v20 = reply;
      v24[1] = v13;
      v24[2] = v14;
      id v21 = v6;
      id v22 = v7;
      [(UpdateAccountPasswordSettingsOperation *)v15 setCompletionBlock:v19];
      v16 = +[ISOperationQueue mainQueue];
      [v16 addOperation:v15];

      objc_destroyWeak(v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      v10 = v18;
    }
  }
  else
  {
    reply = xpc_dictionary_create_reply(v6);
    xpc_connection_send_message((xpc_connection_t)v7, reply);
  }
}

@end