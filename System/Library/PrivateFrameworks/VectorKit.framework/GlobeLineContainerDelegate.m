@interface GlobeLineContainerDelegate
- (GlobeLineContainerDelegate)initWithRenderer:(void *)a3;
- (void)lineContainerNeedsDisplay:(id)a3;
@end

@implementation GlobeLineContainerDelegate

- (void)lineContainerNeedsDisplay:(id)a3
{
  uint64_t v3 = **((void **)self->_renderer + 11);
  if (v3)
  {
    char v4 = 7;
    md::MapEngine::setNeedsTick(v3, &v4);
  }
}

- (GlobeLineContainerDelegate)initWithRenderer:(void *)a3
{
  self->_renderer = a3;
  return self;
}

@end