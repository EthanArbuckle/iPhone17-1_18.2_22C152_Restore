@interface FakePaymentPolygonFetcher
- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4;
- (FakePaymentPolygonFetcher)initWithTestCallback:(id)a3;
- (void)configurePaymentPolygonMapItems:(id)a3;
- (void)configurePaymentPolygonResponseError:(id)a3;
@end

@implementation FakePaymentPolygonFetcher

- (FakePaymentPolygonFetcher)initWithTestCallback:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FakePaymentPolygonFetcher;
  v5 = [(FakePaymentPolygonFetcher *)&v12 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Maps.fakeFetcherQueue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_retainBlock(v4);
    id testCallback = v5->_testCallback;
    v5->_id testCallback = v9;
  }
  return v5;
}

- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_super v12 = sub_100021338();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
      __int16 v20 = 1024;
      int v21 = 35;
      __int16 v22 = 2082;
      v23 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      __int16 v24 = 2082;
      v25 = "nil == completion";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil", buf, 0x26u);
    }

    v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
    __int16 v20 = 1024;
    int v21 = 35;
    __int16 v22 = 2082;
    v23 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    __int16 v24 = 2082;
    v25 = "nil == completion";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil";
    goto LABEL_12;
  }
  if (!v6)
  {
    v14 = sub_100021338();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
      __int16 v20 = 1024;
      int v21 = 36;
      __int16 v22 = 2082;
      v23 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      __int16 v24 = 2082;
      v25 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", buf, 0x26u);
    }

    v11 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446978;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/FakePaymentPolygonFetcher.m";
    __int16 v20 = 1024;
    int v21 = 36;
    __int16 v22 = 2082;
    v23 = "-[FakePaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    __int16 v24 = 2082;
    v25 = "nil == location";
    v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v13, buf, 0x26u);
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100834A84;
  v16[3] = &unk_1012E5F78;
  v16[4] = self;
  v17 = v7;
  dispatch_async(queue, v16);
  BOOL v10 = 1;
  v11 = v17;
LABEL_14:

  return v10;
}

- (void)configurePaymentPolygonMapItems:(id)a3
{
}

- (void)configurePaymentPolygonResponseError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paymentPolygonResponseError, 0);
  objc_storeStrong((id *)&self->_paymentPolygonMapItems, 0);

  objc_storeStrong(&self->_testCallback, 0);
}

@end