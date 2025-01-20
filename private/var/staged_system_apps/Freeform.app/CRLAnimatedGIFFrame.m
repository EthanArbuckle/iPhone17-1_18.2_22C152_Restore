@interface CRLAnimatedGIFFrame
- (CGImage)image;
- (CRLAnimatedGIFFrame)initWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 time:(double)a5 preloadImage:(BOOL)a6;
- (double)time;
- (id)description;
- (unint64_t)index;
- (void)dealloc;
@end

@implementation CRLAnimatedGIFFrame

- (CRLAnimatedGIFFrame)initWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 time:(double)a5 preloadImage:(BOOL)a6
{
  BOOL v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CRLAnimatedGIFFrame;
  v10 = [(CRLAnimatedGIFFrame *)&v15 init];
  if (v10)
  {
    if (a3)
    {
      v10->_imageSource = (CGImageSource *)CFRetain(a3);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015015C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF240();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015015E0);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFFrame initWithImageSource:index:time:preloadImage:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 56, 0, "invalid nil value for '%{public}s'", "imageSource");
    }
    v10->_index = a4;
    v10->_time = a5;
    if (a4 != -1 && v6) {
      v10->_preloadedImage = CGImageSourceCreateImageAtIndex(v10->_imageSource, a4, 0);
    }
    v10->_imageLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v10;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  preloadedImage = self->_preloadedImage;
  if (preloadedImage)
  {
    CFRelease(preloadedImage);
    self->_preloadedImage = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLAnimatedGIFFrame;
  [(CRLAnimatedGIFFrame *)&v5 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p: %tu %f %p %p>", objc_opt_class(), self, self->_index, *(void *)&self->_time, self->_imageSource, self->_preloadedImage];
}

- (CGImage)image
{
  if (self->_index == -1) {
    return 0;
  }
  preloadedImage = self->_preloadedImage;
  if (preloadedImage)
  {
    ImageAtIndex = CFRetain(preloadedImage);
  }
  else
  {
    p_imageLock = &self->_imageLock;
    os_unfair_lock_lock(&self->_imageLock);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_imageSource, self->_index, 0);
    os_unfair_lock_unlock(p_imageLock);
  }

  return (CGImage *)CFAutorelease(ImageAtIndex);
}

- (unint64_t)index
{
  return self->_index;
}

- (double)time
{
  return self->_time;
}

@end