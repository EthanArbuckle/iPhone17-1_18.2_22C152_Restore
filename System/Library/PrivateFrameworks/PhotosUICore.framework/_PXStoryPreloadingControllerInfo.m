@interface _PXStoryPreloadingControllerInfo
- (PXStoryResourcesPreloadingCoordinatable)preloadingController;
- (int64_t)priority;
- (void)setPreloadingController:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation _PXStoryPreloadingControllerInfo

- (void).cxx_destruct
{
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPreloadingController:(id)a3
{
}

- (PXStoryResourcesPreloadingCoordinatable)preloadingController
{
  return self->_preloadingController;
}

@end