@interface ICDPlaybackPositionRequestOperationPut
- (ICDPlaybackPositionRequestOperationPut)initWithRequestContext:(id)a3 completionBlock:(id)a4;
- (id)_baseRequestWithURL:(id)a3;
- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4;
- (void)_finishWithError:(id)a3;
- (void)_finishWithResponse:(id)a3 error:(id)a4;
- (void)execute;
@end

@implementation ICDPlaybackPositionRequestOperationPut

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDomainVersion, 0);
  objc_storeStrong((id *)&self->_resultItemVersionAnchor, 0);
  objc_storeStrong((id *)&self->_resultItemEntity, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_urlBagKey, 0);
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  completionHandler = (void (**)(id, BOOL, id, ICPlaybackPositionEntity *))self->_completionHandler;
  id v6 = v4;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, self->_success, v4, self->_resultItemEntity);
    id v4 = v6;
  }
  [(ICDPlaybackPositionRequestOperationPut *)self finishWithError:v4];
}

- (id)_resolveConflictBetweenClientPayloadPair:(id)a3 andServerPayloadPair:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 bookmarkTimestamp];
  v8 = [v5 bookmarkTimestamp];

  if (v7 >= v8) {
    v9 = v6;
  }
  else {
    v9 = v5;
  }
  id v10 = v9;

  return v10;
}

- (void)_finishWithResponse:(id)a3 error:(id)a4
{
  id v26 = a4;
  self->_isReschedulable = 0;
  id v6 = [a3 parsedBodyDictionary];
  v7 = objc_msgSend(v6, "ic_dictionaryValueForKey:", @"value");
  if (v7)
  {
    v8 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
    v9 = [v8 playbackPositionKey];

    id v10 = objc_msgSend(v6, "ic_stringValueForKey:", @"version");
    v11 = objc_msgSend(v6, "ic_stringValueForKey:", @"domain-version");
    id v12 = objc_alloc((Class)ICPlaybackPositionEntity);
    v13 = [(ICDPlaybackPositionRequestContext *)self->_context playbackPositionDomain];
    id v14 = [v12 initWithDomain:v13];

    [v14 setPlaybackPositionKey:v9];
    v15 = objc_msgSend(v7, "ic_numberValueForKey:", @"bktm");
    [v14 setBookmarkTime:v15];

    v16 = objc_msgSend(v7, "ic_numberValueForKey:", @"hbpl");
    [v14 setHasBeenPlayed:v16];

    v17 = objc_msgSend(v7, "ic_numberValueForKey:", @"plct");
    [v14 setUserPlayCount:v17];

    v18 = objc_msgSend(v7, "ic_numberValueForKey:", @"tstm");
    [v14 setBookmarkTimestamp:v18];

    v19 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
    v20 = [(ICDPlaybackPositionRequestOperationPut *)self _resolveConflictBetweenClientPayloadPair:v19 andServerPayloadPair:v14];

    id v21 = v10;
  }
  else
  {
    v11 = objc_msgSend(v6, "ic_stringValueForKey:", @"domain-version");
    v22 = [v6 objectForKeyedSubscript:@"status"];
    if (v22) {
      BOOL v23 = objc_msgSend(v6, "ic_integerValueForKey:", @"status") == 0;
    }
    else {
      BOOL v23 = 0;
    }
    self->_success = v23;

    resultItemEntity = self->_resultItemEntity;
    self->_resultItemEntity = 0;

    resultItemVersionAnchor = self->_resultItemVersionAnchor;
    self->_resultItemVersionAnchor = 0;

    objc_storeStrong((id *)&self->_resultDomainVersion, v11);
    [(ICDPlaybackPositionRequestOperationPut *)self _finishWithError:v26];
  }
}

- (id)_baseRequestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v4];

  [v5 setHTTPMethod:@"POST"];
  [v5 setValue:ICHTTPHeaderContentTypeXApplePlist forHTTPHeaderField:ICHTTPHeaderKeyContentType];
  v18[0] = @"domain";
  id v6 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  v7 = [v6 playbackPositionDomain];
  v19[0] = v7;
  v18[1] = @"key";
  v8 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  v9 = [v8 playbackPositionKey];
  v19[1] = v9;
  v18[2] = @"value";
  id v10 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  v11 = [(ICDPlaybackPositionRequestOperationBase *)self keyValueStorePayloadWithEntity:v10];
  v19[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v13 = [v12 mutableCopy];

  id v14 = +[ICDeviceInfo currentDeviceInfo];
  v15 = [v14 deviceGUID];

  if (v15) {
    [v13 setObject:v15 forKey:@"guid"];
  }
  v16 = +[NSPropertyListSerialization dataWithPropertyList:v13 format:[(ICDPlaybackPositionRequestOperationBase *)self bodyContentFormat] options:0 error:0];
  if (v16) {
    [v5 setHTTPBody:v16];
  }

  return v5;
}

- (void)execute
{
  v3 = [(ICDPlaybackPositionRequestContext *)self->_context storeRequestContext];
  if (!v3)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      v8 = "%{public}@ context.requestContext=nil";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    }
LABEL_9:

    v9 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
    [(ICDPlaybackPositionRequestOperationPut *)self _finishWithError:v9];

    goto LABEL_10;
  }
  id v4 = [(ICDPlaybackPositionRequestContext *)self->_context entity];
  id v5 = [v4 playbackPositionKey];

  if (!v5)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      v8 = "%{public}@ entity.playbackPositionKey=nil";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v6 = +[ICURLBagProvider sharedBagProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011E5E0;
  v10[3] = &unk_1001BF210;
  v10[4] = self;
  id v11 = v3;
  [v6 getBagForRequestContext:v11 withCompletionHandler:v10];

LABEL_10:
}

- (ICDPlaybackPositionRequestOperationPut)initWithRequestContext:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDPlaybackPositionRequestOperationPut;
  v9 = [(ICDPlaybackPositionRequestOperationPut *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_urlBagKey, ICURLBagKeyKVSRequestURLPut);
    id v11 = objc_retainBlock(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    v10->_isReschedulable = 1;
  }

  return v10;
}

@end