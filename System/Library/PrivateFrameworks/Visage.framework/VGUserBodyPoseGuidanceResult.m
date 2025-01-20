@interface VGUserBodyPoseGuidanceResult
- (FrameRejectionState)rejection;
- (VGBodyPoseFrameState)frameState;
- (id).cxx_construct;
- (void)setFrameState:(id)a3;
- (void)setRejection:(FrameRejectionState *)a3;
@end

@implementation VGUserBodyPoseGuidanceResult

- (FrameRejectionState)rejection
{
  retstr->reason = self->_rejection.reason;
  v5 = self->_rejection.description;
  uint64_t v6 = *(void *)&self->_rejection.outOfFovOffset;
  debugDictionary = self->_rejection.debugDictionary;
  retstr->description = v5;
  *(void *)&retstr->outOfFovOffset = v6;
  result = debugDictionary;
  retstr->debugDictionary = (NSDictionary *)result;
  return result;
}

- (void)setRejection:(FrameRejectionState *)a3
{
  self->_rejection.reason = a3->reason;
  objc_storeStrong((id *)&self->_rejection.description, a3->description);
  *(void *)&self->_rejection.outOfFovOffset = *(void *)&a3->outOfFovOffset;
  objc_storeStrong((id *)&self->_rejection.debugDictionary, a3->debugDictionary);

  description = a3->description;
}

- (VGBodyPoseFrameState)frameState
{
  return self->_frameState;
}

- (void)setFrameState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameState, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end