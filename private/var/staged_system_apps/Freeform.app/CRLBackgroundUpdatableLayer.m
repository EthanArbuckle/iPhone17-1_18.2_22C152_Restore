@interface CRLBackgroundUpdatableLayer
+ (Class)crl_renderableClass;
- (CRLBackgroundUpdatableLayer)init;
- (void)dealloc;
- (void)display;
- (void)setContentsFromBackground:(void *)a3;
@end

@implementation CRLBackgroundUpdatableLayer

- (CRLBackgroundUpdatableLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLBackgroundUpdatableLayer;
  result = [(CRLBackgroundUpdatableLayer *)&v3 init];
  if (result)
  {
    result->_backgroundUpdatableLayerLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    result->_contentsToSetOnNextDisplay = 0;
    result->_wantsContentsUpdatedOnNextDisplay = 0;
  }
  return result;
}

- (void)dealloc
{
  contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
  if (contentsToSetOnNextDisplay)
  {
    CFRelease(contentsToSetOnNextDisplay);
    self->_contentsToSetOnNextDisplay = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLBackgroundUpdatableLayer;
  [(CRLBackgroundUpdatableLayer *)&v4 dealloc];
}

- (void)setContentsFromBackground:(void *)a3
{
  p_backgroundUpdatableLayerLock = &self->_backgroundUpdatableLayerLock;
  os_unfair_lock_lock(&self->_backgroundUpdatableLayerLock);
  contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
  if (contentsToSetOnNextDisplay != a3)
  {
    if (contentsToSetOnNextDisplay)
    {
      CFRelease(contentsToSetOnNextDisplay);
      self->_contentsToSetOnNextDisplay = 0;
    }
    self->_contentsToSetOnNextDisplay = (void *)CFRetain(a3);
    self->_wantsContentsUpdatedOnNextDisplay = 1;
  }

  os_unfair_lock_unlock(p_backgroundUpdatableLayerLock);
}

- (void)display
{
  p_backgroundUpdatableLayerLock = &self->_backgroundUpdatableLayerLock;
  os_unfair_lock_lock(&self->_backgroundUpdatableLayerLock);
  if (self->_wantsContentsUpdatedOnNextDisplay)
  {
    [(CRLBackgroundUpdatableLayer *)self setContents:self->_contentsToSetOnNextDisplay];
    contentsToSetOnNextDisplay = self->_contentsToSetOnNextDisplay;
    if (contentsToSetOnNextDisplay)
    {
      CFRelease(contentsToSetOnNextDisplay);
      self->_contentsToSetOnNextDisplay = 0;
    }
    self->_wantsContentsUpdatedOnNextDisplay = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLBackgroundUpdatableLayer;
    [(CRLBackgroundUpdatableLayer *)&v5 display];
  }
  os_unfair_lock_unlock(p_backgroundUpdatableLayerLock);
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end