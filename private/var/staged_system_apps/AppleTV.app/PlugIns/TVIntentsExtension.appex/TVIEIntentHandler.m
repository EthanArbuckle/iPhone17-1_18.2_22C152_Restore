@interface TVIEIntentHandler
- (void)_buildPlayUrlForIntent:(id)a3 completion:(id)a4;
- (void)confirmPlayMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
@end

@implementation TVIEIntentHandler

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)INPlayMediaIntentResponse) initWithCode:1 userActivity:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);

  v7 = sub_10000212C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100002C2C();
  }
}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000022FC;
  v7[3] = &unk_1000041F0;
  id v8 = a4;
  id v6 = v8;
  [(TVIEIntentHandler *)self _buildPlayUrlForIntent:a3 completion:v7];
}

- (void)_buildPlayUrlForIntent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, v7);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_1000025EC;
  v14 = &unk_100004218;
  objc_copyWeak(&v17, &location);
  id v8 = v5;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  [v7 setCompletionBlock:&v11];
  v10 = +[NSOperationQueue wlkDefaultQueue];
  [v10 addOperation:v7];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

@end