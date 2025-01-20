@interface CRLIOUtils
+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3;
+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3 outInfo:(void *)a4 outCallbacks:(const CGDataProviderSequentialCallbacks *)a5;
+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4;
+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4 outInfo:(void *)a5 outCallbacks:(const CGDataProviderSequentialCallbacks *)a6;
+ (void)readAllFromChannel:(id)a3 completion:(id)a4;
+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6;
+ (void)readFromOffsetAndWait:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 handler:(id)a6;
+ (void)readWithHandlerAndWait:(id)a3 handler:(id)a4;
@end

@implementation CRLIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F46A8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A9D80();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F46C8);
  }
  v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A9CD8(v12);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:offset:length:completion:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 74, 0, "invalid nil value for '%{public}s'", "readChannel");

  if (!v11)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F46E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9C44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4708);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9B9C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:offset:length:completion:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 75, 0, "invalid nil value for '%{public}s'", "completion");
  }
LABEL_22:
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1003A81CC;
  v23[4] = sub_1003A81DC;
  id v18 = &_dispatch_data_empty;
  id v24 = &_dispatch_data_empty;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003A81E4;
  v20[3] = &unk_1014F4730;
  v22 = v23;
  id v19 = v11;
  id v21 = v19;
  [v9 readFromOffset:a4 length:a5 handler:v20];

  _Block_object_dispose(v23, 8);
}

+ (void)readAllFromChannel:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4750);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A9FF8();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F4770);
  }
  v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A9F50(v8);
  }
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:completion:]");
  id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 99, 0, "invalid nil value for '%{public}s'", "readChannel");

  if (!v7)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4790);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9EBC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F47B0);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A9E14(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils readAllFromChannel:completion:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 100, 0, "invalid nil value for '%{public}s'", "completion");
  }
LABEL_22:
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1003A81CC;
  v19[4] = sub_1003A81DC;
  id v14 = &_dispatch_data_empty;
  id v20 = &_dispatch_data_empty;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003A8754;
  v16[3] = &unk_1014F4730;
  id v18 = v19;
  id v15 = v7;
  id v17 = v15;
  [v5 readWithHandler:v16];

  _Block_object_dispose(v19, 8);
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  return (CGDataProvider *)[a1 newCGDataProviderForInputStream:a3 outInfo:0 outCallbacks:0];
}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3 outInfo:(void *)a4 outCallbacks:(const CGDataProviderSequentialCallbacks *)a5
{
  if (!a3) {
    return 0;
  }
  id v7 = a3;
  CFRetain(v7);
  if (a4) {
    *a4 = v7;
  }
  if (a5) {
    *a5 = (const CGDataProviderSequentialCallbacks *)&unk_1014F47D0;
  }
  Sequential = CGDataProviderCreateSequential(v7, (const CGDataProviderSequentialCallbacks *)&unk_1014F47D0);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4
{
  return (CGDataProvider *)_[a1 newCGDataProviderForReadChannel:a3 length:a4 outInfo:0 outCallbacks:0];
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3 length:(unint64_t)a4 outInfo:(void *)a5 outCallbacks:(const CGDataProviderSequentialCallbacks *)a6
{
  if (!a3) {
    return 0;
  }
  id v10 = a3;
  v11 = [[CRLReadChannelInputStreamAdapter alloc] initWithReadChannel:v10 length:a4];

  if ([(CRLReadChannelInputStreamAdapter *)v11 canSeek])
  {
    v12 = (CGDataProvider *)[a1 newCGDataProviderForInputStream:v11 outInfo:a5 outCallbacks:a6];
  }
  else
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F47F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AA08C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F4818);
    }
    id v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v14, v13);
    }
    id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLIOUtils newCGDataProviderForReadChannel:length:outInfo:outCallbacks:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLIOUtils.m"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:156 isFatal:0 description:"Need a seekable input stream for CGDataProvider"];

    v12 = 0;
  }

  return v12;
}

+ (void)readWithHandlerAndWait:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A8BD8;
  v9[3] = &unk_1014F4840;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = v5;
  id v7 = v10;
  id v8 = v5;
  [v6 readWithHandler:v9];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)readFromOffsetAndWait:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 handler:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003A8D1C;
  v13[3] = &unk_1014F4840;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  id v15 = v9;
  id v11 = v14;
  id v12 = v9;
  [v10 readFromOffset:a4 length:a5 handler:v13];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

@end