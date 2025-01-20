@interface VGFrameSelectorResult
- (BOOL)isSuccessful;
- (FrameRejectionState)rejectionState;
- (NSDictionary)debugData;
- (VGBodyPoseFrameState)bodyPoseFrameState;
- (VGFrameSelectorResult)init;
- (float)angleInDegrees;
- (float)pitchInDegrees;
- (float)yawInDegrees;
- (id).cxx_construct;
- (int)motionType;
- (unint64_t)poseIndex;
- (unint64_t)targetAngleId;
- (void)addDebugDataForKey:(id)a3 debugData:(id)a4;
- (void)setAngleInDegrees:(float)a3;
- (void)setBodyPoseFrameState:(id)a3;
- (void)setMotionType:(int)a3;
- (void)setPitchInDegrees:(float)a3;
- (void)setPoseIndex:(unint64_t)a3;
- (void)setRejectionState:(FrameRejectionState *)a3;
- (void)setTargetAngleId:(unint64_t)a3;
- (void)setYawInDegrees:(float)a3;
@end

@implementation VGFrameSelectorResult

- (VGFrameSelectorResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)VGFrameSelectorResult;
  v2 = [(VGFrameSelectorResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_poseIndex = -1;
    v4 = v2;
  }

  return v3;
}

- (void)addDebugDataForKey:(id)a3 debugData:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  debugDataInternal = self->_debugDataInternal;
  if (!debugDataInternal)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_debugDataInternal;
    self->_debugDataInternal = v8;

    debugDataInternal = self->_debugDataInternal;
  }
  [(NSMutableDictionary *)debugDataInternal setObject:v6 forKeyedSubscript:v10];
}

- (NSDictionary)debugData
{
  return (NSDictionary *)self->_debugDataInternal;
}

- (BOOL)isSuccessful
{
  return self->_rejectionState.reason == 0;
}

- (unint64_t)poseIndex
{
  return self->_poseIndex;
}

- (void)setPoseIndex:(unint64_t)a3
{
  self->_poseIndex = a3;
}

- (int)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(int)a3
{
  self->_motionType = a3;
}

- (unint64_t)targetAngleId
{
  return self->_targetAngleId;
}

- (void)setTargetAngleId:(unint64_t)a3
{
  self->_targetAngleId = a3;
}

- (float)angleInDegrees
{
  return self->_angleInDegrees;
}

- (void)setAngleInDegrees:(float)a3
{
  self->_angleInDegrees = a3;
}

- (float)yawInDegrees
{
  return self->_yawInDegrees;
}

- (void)setYawInDegrees:(float)a3
{
  self->_yawInDegrees = a3;
}

- (float)pitchInDegrees
{
  return self->_pitchInDegrees;
}

- (void)setPitchInDegrees:(float)a3
{
  self->_pitchInDegrees = a3;
}

- (FrameRejectionState)rejectionState
{
  retstr->reason = self->_rejectionState.reason;
  v5 = self->_rejectionState.description;
  uint64_t v6 = *(void *)&self->_rejectionState.outOfFovOffset;
  debugDictionary = self->_rejectionState.debugDictionary;
  retstr->description = v5;
  *(void *)&retstr->outOfFovOffset = v6;
  result = debugDictionary;
  retstr->debugDictionary = (NSDictionary *)result;
  return result;
}

- (void)setRejectionState:(FrameRejectionState *)a3
{
  self->_rejectionState.reason = a3->reason;
  objc_storeStrong((id *)&self->_rejectionState.description, a3->description);
  *(void *)&self->_rejectionState.outOfFovOffset = *(void *)&a3->outOfFovOffset;
  objc_storeStrong((id *)&self->_rejectionState.debugDictionary, a3->debugDictionary);

  description = a3->description;
}

- (VGBodyPoseFrameState)bodyPoseFrameState
{
  return self->_bodyPoseFrameState;
}

- (void)setBodyPoseFrameState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyPoseFrameState, 0);

  objc_storeStrong((id *)&self->_debugDataInternal, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 14) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end