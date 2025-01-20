@interface ICStoreURLRequest
- (void)_startGeniusRequestWithStartDate:(id)a3 retryTimeout:(double)a4 debugName:(id)a5 connectionResponseBlock:(id)a6;
- (void)startGeniusRequestWithRetryTimeout:(double)a3 debugName:(id)a4 connectionResponseBlock:(id)a5;
@end

@implementation ICStoreURLRequest

- (void)_startGeniusRequestWithStartDate:(id)a3 retryTimeout:(double)a4 debugName:(id)a5 connectionResponseBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = os_log_create("com.apple.amp.itunescloudd", "Genius");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v15 = v14;
    [v10 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138543618;
    id v28 = v11;
    __int16 v29 = 2048;
    double v30 = a4 - (v15 - v16);
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sending request for %{public}@ (retryTimeRemaining = %g seconds)", buf, 0x16u);
  }

  v17 = +[ICURLSessionManager defaultSession];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10007E6B0;
  v21[3] = &unk_1001BBB00;
  id v22 = v11;
  id v23 = v10;
  double v26 = a4;
  v24 = self;
  id v25 = v12;
  id v18 = v10;
  id v19 = v12;
  id v20 = v11;
  [v17 enqueueDataRequest:self withCompletionHandler:v21];
}

- (void)startGeniusRequestWithRetryTimeout:(double)a3 debugName:(id)a4 connectionResponseBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSDate date];
  [(ICStoreURLRequest *)self _startGeniusRequestWithStartDate:v10 retryTimeout:v9 debugName:v8 connectionResponseBlock:a3];
}

@end