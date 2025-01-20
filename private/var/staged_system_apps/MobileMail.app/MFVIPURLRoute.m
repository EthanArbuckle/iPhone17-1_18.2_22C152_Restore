@interface MFVIPURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (DaemonInterfaceProviding)scene;
- (MFVIPURLRoute)initWithScene:(id)a3;
- (NSString)ef_publicDescription;
- (id)_routeVIPMessagesURL:(id)a3;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setScene:(id)a3;
@end

@implementation MFVIPURLRoute

- (MFVIPURLRoute)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFVIPURLRoute;
  v5 = [(MFVIPURLRoute *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v6->_priority = 0;
  }

  return v6;
}

- (BOOL)canRouteRequest:(id)a3
{
  v3 = [a3 URL];
  if (objc_msgSend(v3, "ef_hasScheme:", EMAppleMailShowVIPMessagesURLScheme)) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 ef_hasScheme:EMAppleMailShowVIPSettingsURLScheme];
  }

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  v5 = +[EFPromise promise];
  v6 = [v4 URL];
  if (objc_msgSend(v6, "ef_hasScheme:", EMAppleMailShowVIPMessagesURLScheme))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002088F8;
    v21[3] = &unk_100604668;
    id v22 = v5;
    v23 = self;
    id v24 = v6;
    v7 = +[EFScheduler mainThreadScheduler];
    [v7 performBlock:v21];
  }
  else if (objc_msgSend(v6, "ef_hasScheme:", EMAppleMailShowVIPSettingsURLScheme))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10020898C;
    v19[3] = &unk_100604618;
    v19[4] = self;
    id v20 = v5;
    objc_super v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v19];
  }
  else
  {
    NSErrorUserInfoKey v26 = NSURLErrorKey;
    v27 = v6;
    v9 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v10 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v9];

    [v5 finishWithError:v10];
    v11 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v4 ef_publicDescription];
      sub_10045D9C4(v12, buf, v11);
    }
  }
  v13 = [v5 future];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100208A40;
  v17[3] = &unk_10060C1D0;
  id v14 = v4;
  id v18 = v14;
  v15 = [v13 recover:v17];

  return v15;
}

- (id)_routeVIPMessagesURL:(id)a3
{
  id v4 = a3;
  v5 = [(MFVIPURLRoute *)self scene];
  v6 = [v5 daemonInterface];
  v7 = [v6 vipManager];

  if ([v7 hasVIPs])
  {
    objc_super v8 = [v4 resourceSpecifier];
    v9 = +[NSCharacterSet characterSetWithCharactersInString:@"/"];
    v10 = [v8 ef_stringByTrimmingLeadingCharactersInSet:v9];

    if ([v10 length])
    {
      v11 = [v7 vipWithIdentifier:v10];
      if (v11)
      {
        v12 = +[FavoriteItem itemForVIP:v11 selected:1];
        v13 = [v5 mailboxPickerController];
        id v14 = [v13 favoriteItemSelectionTarget];
        [v14 selectVIPMailboxWithItem:v12 animated:0];

        v15 = 0;
      }
      else
      {
        NSErrorUserInfoKey v18 = NSURLErrorKey;
        id v19 = v4;
        v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        v15 = +[NSError errorWithDomain:NSURLErrorDomain code:-1008 userInfo:v16];
      }
    }
    else
    {
      NSErrorUserInfoKey v20 = NSURLErrorKey;
      id v21 = v4;
      v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v15 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v11];
    }
  }
  else
  {
    NSErrorUserInfoKey v22 = NSURLErrorKey;
    id v23 = v4;
    v10 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v15 = +[NSError errorWithDomain:NSURLErrorDomain code:-1008 userInfo:v10];
  }

  return v15;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (DaemonInterfaceProviding)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (DaemonInterfaceProviding *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end