@interface MFMailboxURLRoute
- (BOOL)_isCombinedMailboxURL:(id)a3;
- (BOOL)canRouteRequest:(id)a3;
- (DaemonInterfaceProviding)scene;
- (MFMailboxURLRoute)initWithScene:(id)a3;
- (NSString)ef_publicDescription;
- (id)_combinedMailboxes;
- (id)_mailboxFromEmailAddress:(id)a3 mailboxPath:(id)a4;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)_routeToAccountMailbox:(id)a3 promise:(id)a4;
- (void)_routeToCombinedMailbox:(id)a3 promise:(id)a4;
- (void)setScene:(id)a3;
@end

@implementation MFMailboxURLRoute

- (MFMailboxURLRoute)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFMailboxURLRoute;
  v5 = [(MFMailboxURLRoute *)&v8 init];
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
  unsigned __int8 v4 = [v3 ef_hasScheme:EMAppleMailboxURLScheme];

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = +[EFPromise promise];
  v7 = +[NSURLComponents componentsWithURL:v5 resolvingAgainstBaseURL:0];
  if ([(MFMailboxURLRoute *)self _isCombinedMailboxURL:v7]) {
    [(MFMailboxURLRoute *)self _routeToCombinedMailbox:v4 promise:v6];
  }
  else {
    [(MFMailboxURLRoute *)self _routeToAccountMailbox:v4 promise:v6];
  }
  objc_super v8 = [v6 future];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A303C;
  v12[3] = &unk_100604F70;
  id v9 = v4;
  id v13 = v9;
  [v8 addFailureBlock:v12];

  v10 = [v6 future];

  return v10;
}

- (id)_mailboxFromEmailAddress:(id)a3 mailboxPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MFMailboxURLRoute *)self scene];
  id v9 = [v8 daemonInterface];
  v10 = [v9 accountRepository];

  v11 = [v10 receivingAccounts];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001A3374;
  v22[3] = &unk_10060BA88;
  id v12 = v6;
  id v23 = v12;
  id v13 = [v11 ef_firstObjectPassingTest:v22];
  if ([v7 hasPrefix:@"/"])
  {
    uint64_t v14 = [v7 substringFromIndex:1];

    id v7 = (id)v14;
  }
  v15 = [v13 objectID];
  v16 = [v15 representedObjectID];

  if (v13 && v16)
  {
    v17 = +[MailAccount accountWithUniqueId:v16];
    v18 = v17;
    if (v17)
    {
      v19 = [v17 mailboxUidForRelativePath:v7 create:0];
      if (v19) {
        goto LABEL_15;
      }
      v20 = +[MFURLRoutingRequest log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10045CB1C();
      }
    }
    else
    {
      v20 = +[MFURLRoutingRequest log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10045CAA4((uint64_t)v16, v20);
      }
    }
  }
  else
  {
    v18 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10045CB50();
    }
  }
  v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)_isCombinedMailboxURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 host];
  id v6 = [v4 user];
  unsigned __int8 v7 = 0;
  if (!v6 && v5)
  {
    objc_super v8 = [(MFMailboxURLRoute *)self _combinedMailboxes];
    unsigned __int8 v7 = [v8 containsObject:v5];
  }
  return v7;
}

- (void)_routeToCombinedMailbox:(id)a3 promise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 URL];
  id v9 = +[NSURLComponents componentsWithURL:v8 resolvingAgainstBaseURL:0];

  [v9 host];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A3608;
  v13[3] = &unk_100604668;
  v13[4] = self;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  id v12 = +[EFScheduler mainThreadScheduler];
  [v12 performBlock:v13];
}

- (void)_routeToAccountMailbox:(id)a3 promise:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  id v7 = [v6 URL];
  objc_super v8 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];

  id v9 = [v8 user];
  id v10 = [v8 host];
  id v11 = +[NSString stringWithFormat:@"%@@%@", v9, v10];

  id v12 = [objc_alloc((Class)ECEmailAddress) initWithString:v11];
  if (v12)
  {
    id v13 = [v8 path];
    id v14 = [(MFMailboxURLRoute *)self _mailboxFromEmailAddress:v12 mailboxPath:v13];

    if (v14)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001A3B7C;
      v27[3] = &unk_100604668;
      v27[4] = self;
      id v15 = v14;
      id v28 = v15;
      id v29 = v26;
      v16 = +[EFScheduler mainThreadScheduler];
      [v16 performBlock:v27];

      id v14 = v15;
    }
    else
    {
      NSErrorUserInfoKey v32 = NSURLErrorKey;
      v21 = [v8 URL];
      v33 = v21;
      v22 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v23 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v22];

      v24 = +[NSError mf_routingErrorWithUnderlyingError:v23 request:v6 allowFallbackRouting:0];
      [v26 finishWithError:v24];

      v25 = +[MFURLRoutingRequest log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10045CBB8();
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v30 = NSURLErrorKey;
    v17 = [v8 URL];
    v31 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v14 = +[NSError errorWithDomain:NSURLErrorDomain code:-1000 userInfo:v18];

    v19 = +[NSError mf_routingErrorWithUnderlyingError:v14 request:v6 allowFallbackRouting:0];
    [v26 finishWithError:v19];

    v20 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10045CB84();
    }
  }
}

- (id)_combinedMailboxes
{
  if (qword_100699B00 != -1) {
    dispatch_once(&qword_100699B00, &stru_10060BAA8);
  }
  v2 = (void *)qword_100699AF8;

  return v2;
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