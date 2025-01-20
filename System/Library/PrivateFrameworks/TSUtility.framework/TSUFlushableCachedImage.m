@interface TSUFlushableCachedImage
- (BOOL)hasFlushableContent;
- (CGImage)newImage;
- (TSUFlushableCachedImage)initWithDelegate:(id)a3 createImageSelector:(SEL)a4;
- (void)dealloc;
- (void)unload;
@end

@implementation TSUFlushableCachedImage

- (TSUFlushableCachedImage)initWithDelegate:(id)a3 createImageSelector:(SEL)a4
{
  result = [(TSUFlushableObject *)self init];
  if (result)
  {
    result->_delegate = a3;
    if (a4) {
      v7 = a4;
    }
    else {
      v7 = 0;
    }
    result->_delegateCreateImageSelector = v7;
  }
  return result;
}

- (void)dealloc
{
  self->_delegate = 0;
  self->_delegateCreateImageSelector = 0;
  [(TSUFlushableCachedImage *)self unload];
  v3.receiver = self;
  v3.super_class = (Class)TSUFlushableCachedImage;
  [(TSUFlushableObject *)&v3 dealloc];
}

- (void)unload
{
  self->_image = 0;
}

- (BOOL)hasFlushableContent
{
  return self->_image != 0;
}

- (CGImage)newImage
{
  [(TSUFlushableObject *)self ownerWillAccess];
  objc_sync_enter(self);
  image = self->_image;
  if (!image)
  {
    if (self->_delegateCreateImageSelector) {
      SEL delegateCreateImageSelector = self->_delegateCreateImageSelector;
    }
    else {
      SEL delegateCreateImageSelector = 0;
    }
    image = (CGImage *)[self->_delegate performSelector:delegateCreateImageSelector];
    self->_image = image;
  }
  v5 = CGImageRetain(image);
  objc_sync_exit(self);
  [(TSUFlushableObject *)self ownerDidAccess];
  return v5;
}

@end