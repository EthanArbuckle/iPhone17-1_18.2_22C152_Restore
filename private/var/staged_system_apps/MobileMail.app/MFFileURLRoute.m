@interface MFFileURLRoute
- (BOOL)_urlReferencesMailLibrary:(id)a3;
- (BOOL)canRouteRequest:(id)a3;
- (ComposeCapable)scene;
- (MFFileURLRoute)initWithScene:(id)a3;
- (NSString)ef_publicDescription;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setScene:(id)a3;
@end

@implementation MFFileURLRoute

- (MFFileURLRoute)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFFileURLRoute;
  v5 = [(MFFileURLRoute *)&v8 init];
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
  unsigned __int8 v4 = [v3 isFileURL];

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  v5 = +[EFPromise promise];
  v6 = [v4 URL];
  unsigned int v7 = [(MFFileURLRoute *)self _urlReferencesMailLibrary:v6];

  if (v7)
  {
    objc_super v8 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = [v4 ef_publicDescription];
      sub_10045C858(v9, buf, v8);
    }

    v10 = [v5 errorOnlyCompletionHandlerAdapter];
    v11 = +[NSError mf_blockedURLErrorWithRequest:v4];
    v10[2](v10, v11);
  }
  else
  {
    v12 = +[NSFileManager defaultManager];
    v13 = [v4 URL];
    v14 = [v13 path];
    unsigned __int8 v15 = [v12 isReadableFileAtPath:v14];

    if (v15)
    {
      v10 = (void (**)(id, void))[objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
      [v10 setShowKeyboardImmediately:1];
      v16 = [v4 URL];
      [v10 insertAttachmentWithURL:v16];

      v17 = [(MFFileURLRoute *)self scene];
      v11 = v17;
      if (v17)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100198110;
        v25[3] = &unk_100604668;
        v26 = v17;
        v27 = v10;
        id v28 = v5;
        v18 = +[EFScheduler mainThreadScheduler];
        [v18 performBlock:v25];
      }
      else
      {
        v22 = +[NSError mf_generalRoutingErrorWithDescription:@"Cannot present compose. Scene is nil." request:v4];
        [v5 finishWithError:v22];
      }
    }
    else
    {
      v19 = +[MFURLRoutingRequest log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = [v4 ef_publicDescription];
        sub_10045C8B0(v20, buf, v19);
      }

      v21 = +[NSError em_internalErrorWithReason:@"non-existent or unreadable file"];
      v10 = +[NSError mf_routingErrorWithUnderlyingError:v21 request:v4 allowFallbackRouting:1];

      v11 = [v5 errorOnlyCompletionHandlerAdapter];
      v11[2](v11, v10);
    }
  }

  v23 = [v5 future];

  return v23;
}

- (BOOL)_urlReferencesMailLibrary:(id)a3
{
  id v3 = a3;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  id v4 = +[NSFileManager defaultManager];
  v5 = +[EMPersistenceLayoutManager baseMailDirectory];
  unsigned __int8 v6 = [v4 getRelationship:&v9 ofDirectoryAtURL:v5 toItemAtURL:v3 error:0];

  if (v9 < 2) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end