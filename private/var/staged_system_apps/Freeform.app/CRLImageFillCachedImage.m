@interface CRLImageFillCachedImage
+ (id)cachedImageWithHandler:(id)a3;
- (CRLImage)image;
- (CRLImageFillCachedImage)initWithHandler:(id)a3;
- (void)flush;
@end

@implementation CRLImageFillCachedImage

+ (id)cachedImageWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithHandler:v4];

  return v5;
}

- (CRLImageFillCachedImage)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLImageFillCachedImage;
  id v5 = [(CRLImageFillCachedImage *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id mHandler = v5->mHandler;
    v5->id mHandler = v6;

    v5->mLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }

  return v5;
}

- (CRLImage)image
{
  p_mLock = &self->mLock;
  os_unfair_lock_lock(&self->mLock);
  if (!self->mCachedImage)
  {
    (*((void (**)(void))self->mHandler + 2))();
    id v4 = (CRLImage *)objc_claimAutoreleasedReturnValue();
    mCachedImage = self->mCachedImage;
    self->mCachedImage = v4;

    if (!self->mCachedImage)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2120);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101072490();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2140);
      }
      id v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageFillCachedImage image]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 95, 0, "invalid nil value for '%{public}s'", "mCachedImage");
    }
  }
  os_unfair_lock_unlock(p_mLock);
  objc_super v9 = self->mCachedImage;

  return v9;
}

- (void)flush
{
  p_mLock = &self->mLock;
  os_unfair_lock_lock(&self->mLock);
  mCachedImage = self->mCachedImage;
  self->mCachedImage = 0;

  os_unfair_lock_unlock(p_mLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCachedImage, 0);

  objc_storeStrong(&self->mHandler, 0);
}

@end