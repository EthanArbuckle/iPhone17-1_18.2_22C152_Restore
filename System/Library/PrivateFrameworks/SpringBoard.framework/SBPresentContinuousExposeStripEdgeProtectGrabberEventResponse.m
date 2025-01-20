@interface SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse
- (BOOL)isInitialPresentation;
- (id)initForInitialPresentation:(BOOL)a3;
- (int64_t)type;
- (void)setInitialPresentation:(BOOL)a3;
@end

@implementation SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse

- (id)initForInitialPresentation:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPresentContinuousExposeStripEdgeProtectGrabberEventResponse;
  id result = [(SBChainableModifierEventResponse *)&v5 init];
  if (result) {
    *((unsigned char *)result + 40) = a3;
  }
  return result;
}

- (int64_t)type
{
  return 40;
}

- (BOOL)isInitialPresentation
{
  return self->_initialPresentation;
}

- (void)setInitialPresentation:(BOOL)a3
{
  self->_initialPresentation = a3;
}

@end