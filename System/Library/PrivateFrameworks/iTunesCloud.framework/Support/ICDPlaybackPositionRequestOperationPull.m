@interface ICDPlaybackPositionRequestOperationPull
- (ICDPlaybackPositionRequestOperationPull)initWithRequestContext:(id)a3 completionHandler:(id)a4;
- (id)_baseRequestWithURL:(id)a3;
- (id)_requestItemVersion;
- (void)_finishWithError:(id)a3;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation ICDPlaybackPositionRequestOperationPull

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultEntity, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  completionHandler = (void (**)(id, BOOL, id, ICPlaybackPositionEntity *))self->_completionHandler;
  id v6 = v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, v4 == 0, v4, self->_resultEntity);
    id v4 = v6;
  }
  [(ICDPlaybackPositionRequestOperationPull *)self finishWithError:v4];
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v7 = a3;
    v8 = [ICDPlaybackPositionResponseDataPull alloc];
    v9 = [v7 parsedBodyDictionary];

    v10 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
    v11 = [v10 playbackPositionDomain];
    v12 = [(ICDPlaybackPositionResponseDataPull *)v8 initWithResponseDictionary:v9 forDomain:v11];

    v13 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      v17 = self;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with reponseData: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    v14 = [(ICDPlaybackPositionResponseDataPull *)v12 cloudEntity];
    resultEntity = self->_resultEntity;
    self->_resultEntity = v14;
  }
  [(ICDPlaybackPositionRequestOperationPull *)self _finishWithError:v6];
}

- (id)_baseRequestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v4];

  [v5 setHTTPMethod:@"POST"];
  [v5 setValue:ICHTTPHeaderContentTypeXApplePlist forHTTPHeaderField:ICHTTPHeaderKeyContentType];
  v22[0] = @"domain";
  id v6 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  id v7 = [v6 playbackPositionDomain];
  v23[0] = v7;
  v22[1] = @"since-version";
  v8 = [(ICDPlaybackPositionRequestOperationPull *)self _requestItemVersion];
  v23[1] = v8;
  v22[2] = @"key";
  v9 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  v10 = [v9 playbackPositionKey];
  v23[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v12 = [v11 mutableCopy];

  v13 = +[ICDeviceInfo currentDeviceInfo];
  v14 = [v13 deviceGUID];

  if (v14) {
    [v12 setObject:v14 forKey:@"guid"];
  }
  v15 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ creating request with body: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  int v16 = +[NSPropertyListSerialization dataWithPropertyList:v12 format:[(ICDPlaybackPositionRequestOperationBase *)self bodyContentFormat] options:0 error:0];
  if (v16) {
    [v5 setHTTPBody:v16];
  }

  return v5;
}

- (id)_requestItemVersion
{
  v3 = [(ICDPlaybackPositionRequestContext *)self->_context library];
  uint64_t v4 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
  id v5 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  id v6 = [v5 playbackPositionKey];
  id v7 = +[ML3ComparisonPredicate predicateWithProperty:v4 equalToValue:v6];
  v8 = +[ML3Track anyInLibrary:v3 predicate:v7];

  v9 = [v8 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataEntityRevision];
  v10 = v9;
  if (!v9) {
    v9 = @"0";
  }
  v11 = v9;

  return v11;
}

- (void)execute
{
  v3 = [(ICDPlaybackPositionRequestContext *)self->_context storeRequestContext];
  if (!v3)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      v8 = "%{public}@ context.requestContext=nil";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }
LABEL_9:

    v9 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
    [(ICDPlaybackPositionRequestOperationPull *)self _finishWithError:v9];

    goto LABEL_10;
  }
  uint64_t v4 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  id v5 = [v4 playbackPositionKey];

  if (!v5)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      v8 = "%{public}@ entity.playbackPositionKey=nil";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v6 = +[ICURLBagProvider sharedBagProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000586F0;
  v10[3] = &unk_1001BF210;
  v10[4] = self;
  id v11 = v3;
  [v6 getBagForRequestContext:v11 withCompletionHandler:v10];

LABEL_10:
}

- (ICDPlaybackPositionRequestOperationPull)initWithRequestContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDPlaybackPositionRequestOperationPull;
  v9 = [(ICDPlaybackPositionRequestOperationPull *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_urlBagKey, ICURLBagKeyKVSRequestURLGet);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }
  return v10;
}

@end