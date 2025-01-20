@interface MRRenderArguments
- (BOOL)freezesSizeOfImageRequests;
- (BOOL)isPreloading;
- (BOOL)skipsAnimations;
- (BOOL)timeWasSet;
- (MRRenderArguments)initWithRenderer:(id)a3;
- (MRRenderer)renderer;
- (NSDictionary)forcedState;
- (NSOperationQueue)preloadQueue;
- (double)displayLinkTimestamp;
- (double)morphingProgress;
- (double)unalteredTime;
- (id)copyForPreloading;
- (int)thumbnailPolicy;
- (unsigned)currentLayoutIndex;
- (void)cleanup;
- (void)dealloc;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setDisplayLinkTimestamp:(double)a3;
- (void)setForcedState:(id)a3;
- (void)setFreezesSizeOfImageRequests:(BOOL)a3;
- (void)setMorphingProgress:(double)a3;
- (void)setPreloadQueue:(id)a3;
- (void)setSkipsAnimations:(BOOL)a3;
- (void)setThumbnailPolicy:(int)a3;
- (void)setTimeWasSet:(BOOL)a3;
- (void)setUnalteredTime:(double)a3;
@end

@implementation MRRenderArguments

- (MRRenderArguments)initWithRenderer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRRenderArguments;
  v4 = [(MRRenderArguments *)&v6 init];
  if (v4) {
    v4->_renderer = (MRRenderer *)a3;
  }
  return v4;
}

- (void)dealloc
{
  [(MRRenderArguments *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRRenderArguments;
  [(MRRenderArguments *)&v3 dealloc];
}

- (void)cleanup
{
  renderer = self->_renderer;
  if (renderer)
  {

    self->_renderer = 0;
    self->_preloadQueue = 0;

    self->_forcedState = 0;
  }
}

- (id)copyForPreloading
{
  objc_super v3 = [[MRRenderArguments alloc] initWithRenderer:self->_renderer];
  v3->_preloadQueue = self->_preloadQueue;
  v3->_forcedState = self->_forcedState;
  v3->_unalteredTime = self->_unalteredTime;
  v3->_currentLayoutIndex = self->_currentLayoutIndex;
  v3->_thumbnailPolicy = self->_thumbnailPolicy;
  v3->_freezesSizeOfImageRequests = self->_freezesSizeOfImageRequests;
  v3->_isPreloading = 1;
  v3->_timeWasSet = self->_timeWasSet;
  return v3;
}

- (MRRenderer)renderer
{
  return (MRRenderer *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)preloadQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreloadQueue:(id)a3
{
}

- (NSDictionary)forcedState
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setForcedState:(id)a3
{
}

- (double)unalteredTime
{
  return self->_unalteredTime;
}

- (void)setUnalteredTime:(double)a3
{
  self->_unalteredTime = a3;
}

- (double)displayLinkTimestamp
{
  return self->_displayLinkTimestamp;
}

- (void)setDisplayLinkTimestamp:(double)a3
{
  self->_displayLinkTimestamp = a3;
}

- (double)morphingProgress
{
  return self->_morphingProgress;
}

- (void)setMorphingProgress:(double)a3
{
  self->_morphingProgress = a3;
}

- (unsigned)currentLayoutIndex
{
  return self->_currentLayoutIndex;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  self->_currentLayoutIndex = a3;
}

- (BOOL)timeWasSet
{
  return self->_timeWasSet;
}

- (void)setTimeWasSet:(BOOL)a3
{
  self->_timeWasSet = a3;
}

- (BOOL)isPreloading
{
  return self->_isPreloading;
}

- (int)thumbnailPolicy
{
  return self->_thumbnailPolicy;
}

- (void)setThumbnailPolicy:(int)a3
{
  self->_thumbnailPolicy = a3;
}

- (BOOL)freezesSizeOfImageRequests
{
  return self->_freezesSizeOfImageRequests;
}

- (void)setFreezesSizeOfImageRequests:(BOOL)a3
{
  self->_freezesSizeOfImageRequests = a3;
}

- (BOOL)skipsAnimations
{
  return self->_skipsAnimations;
}

- (void)setSkipsAnimations:(BOOL)a3
{
  self->_skipsAnimations = a3;
}

@end