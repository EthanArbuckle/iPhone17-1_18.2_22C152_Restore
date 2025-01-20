@interface CRLImageProvider
+ (CRLImageProvider)allocWithZone:(_NSZone *)a3;
- (BOOL)i_hasFlushableContent;
- (BOOL)isError;
- (BOOL)isValid;
- (CGSize)naturalSize;
- (CRLImageProvider)initWithImageData:(id)a3;
- (CRLImageProvider)retain;
- (_TtC8Freeform8CRLAsset)imageData;
- (int)i_loadState;
- (int)interest;
- (unint64_t)i_flushableMemoryEstimate;
- (unint64_t)imageGamut;
- (void)addInterest;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)i_flushIfNoOneUsing;
- (void)release;
- (void)removeInterest;
- (void)setI_loadState:(int)a3;
@end

@implementation CRLImageProvider

+ (CRLImageProvider)allocWithZone:(_NSZone *)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CRLImageProvider;
  result = [super allocWithZone:a3];
  if (result) {
    atomic_store(1u, (unsigned int *)&result->mRetainCount);
  }
  return result;
}

- (CRLImageProvider)initWithImageData:(id)a3
{
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EFC50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A187C();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLImageProvider *)NSString initWithImageData:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"], 35, 0, "invalid nil value for '%{public}s'", "imageData"");
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLImageProvider;
  v5 = [(CRLImageProvider *)&v7 init];
  if (v5)
  {
    v5->mImageData = (_TtC8Freeform8CRLAsset *)a3;
    [(CRLImageProvider *)v5 i_commonInit];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRLImageProvider;
  [(CRLImageProvider *)&v3 dealloc];
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return self->mImageData;
}

- (CGSize)naturalSize
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EFC90);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A1960();
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101076AC0();
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLImageProvider *)NSString naturalSize], 60, 0, "subclasses of CRLImageProvider must implement -naturalSize"");
  double v2 = 100.0;
  double v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)imageGamut
{
  return 0;
}

- (BOOL)isValid
{
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EFCD0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A1A1C();
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101076AC0();
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLImageProvider *)NSString isValid], 74, 0, "subclasses of CRLImageProvider must implement -isValid"");
  return 1;
}

- (BOOL)isError
{
  return 0;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EFD10);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010A1AD8();
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101076AC0();
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageProvider drawImageInContext:rect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageProvider.m"), 84, 0, "subclasses of CRLImageProvider must implement -drawImageInContext:rect:");
}

- (BOOL)i_hasFlushableContent
{
  return 0;
}

- (unint64_t)i_flushableMemoryEstimate
{
  return 0;
}

- (int)interest
{
  return atomic_load((unsigned int *)&self->mInterest);
}

- (void)addInterest
{
}

- (void)removeInterest
{
}

- (CRLImageProvider)retain
{
  atomic_fetch_add(&self->mRetainCount, 1u);
  v3.receiver = self;
  v3.super_class = (Class)CRLImageProvider;
  return [(CRLImageProvider *)&v3 retain];
}

- (void)release
{
  atomic_fetch_add(&self->mRetainCount, 0xFFFFFFFF);
  v2.receiver = self;
  v2.super_class = (Class)CRLImageProvider;
  [(CRLImageProvider *)&v2 release];
}

- (void)i_flushIfNoOneUsing
{
  unsigned int v2 = atomic_load((unsigned int *)&self->mRetainCount);
  if (v2 == 1) {
    [(CRLImageProvider *)self flush];
  }
}

- (int)i_loadState
{
  return self->mLoadState;
}

- (void)setI_loadState:(int)a3
{
  self->mLoadState = a3;
}

@end