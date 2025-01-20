@interface VGEarPCASelectionState
- (BOOL)completed;
- (BOOL)failed;
- (BOOL)leftEarCompleted;
- (BOOL)rightEarCompleted;
- (EarPose)pose;
- (NSDictionary)leftEarRollAngleCaptured;
- (NSDictionary)leftEarRollAngleCapturedPoses;
- (NSDictionary)leftEarYawAngleCaptured;
- (NSDictionary)leftEarYawAngleCapturedPoses;
- (NSDictionary)rightEarRollAngleCaptured;
- (NSDictionary)rightEarRollAngleCapturedPoses;
- (NSDictionary)rightEarYawAngleCaptured;
- (NSDictionary)rightEarYawAngleCapturedPoses;
- (float)progress;
- (id).cxx_construct;
- (int)detectionError;
- (unsigned)leftFrameCount;
- (unsigned)rightFrameCount;
- (void)setCompleted:(BOOL)a3;
- (void)setDetectionError:(int)a3;
- (void)setFailed:(BOOL)a3;
- (void)setLeftEarCompleted:(BOOL)a3;
- (void)setLeftEarRollAngleCapturedPoses:(id)a3;
- (void)setLeftEarYawAngleCapturedPoses:(id)a3;
- (void)setLeftFrameCount:(unsigned int)a3;
- (void)setPose:(EarPose *)a3;
- (void)setProgress:(float)a3;
- (void)setRightEarCompleted:(BOOL)a3;
- (void)setRightEarRollAngleCapturedPoses:(id)a3;
- (void)setRightEarYawAngleCapturedPoses:(id)a3;
- (void)setRightFrameCount:(unsigned int)a3;
@end

@implementation VGEarPCASelectionState

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (unsigned)leftFrameCount
{
  return self->_leftFrameCount;
}

- (void)setLeftFrameCount:(unsigned int)a3
{
  self->_leftFrameCount = a3;
}

- (BOOL)leftEarCompleted
{
  return self->_leftEarCompleted;
}

- (void)setLeftEarCompleted:(BOOL)a3
{
  self->_leftEarCompleted = a3;
}

- (unsigned)rightFrameCount
{
  return self->_rightFrameCount;
}

- (void)setRightFrameCount:(unsigned int)a3
{
  self->_rightFrameCount = a3;
}

- (BOOL)rightEarCompleted
{
  return self->_rightEarCompleted;
}

- (void)setRightEarCompleted:(BOOL)a3
{
  self->_rightEarCompleted = a3;
}

- (EarPose)pose
{
  long long v5 = *(_OWORD *)&self[1]._rightEarYawAngleCapturedPoses;
  *(_OWORD *)&retstr[2].side = *(_OWORD *)&self[1]._leftEarYawAngleCapturedPoses;
  *(_OWORD *)&retstr[2].faceYawAngle.var0.__null_state_ = v5;
  long long v6 = *(_OWORD *)&self[1]._rightEarYawAngleCaptured;
  *(_OWORD *)&retstr[3].side = *(_OWORD *)&self[1]._leftEarYawAngleCaptured;
  *(_OWORD *)&retstr[3].faceYawAngle.var0.__null_state_ = v6;
  long long v7 = *(_OWORD *)&self->_pose.faceYawAngle.var0.__null_state_;
  *(_OWORD *)&retstr->side = *(_OWORD *)&self->_pose.side;
  *(_OWORD *)&retstr->faceYawAngle.var0.__null_state_ = v7;
  long long v8 = *(_OWORD *)&self[1]._leftFrameCount;
  *(_OWORD *)&retstr[1].side = *(_OWORD *)&self[1].super.isa;
  *(_OWORD *)&retstr[1].faceYawAngle.var0.__null_state_ = v8;
  *(void *)&retstr[4].side = 0;
  v9 = *(const void **)&self[1]._pose.side;
  uint64_t v10 = *(void *)&self[1]._pose.lmPCA.__elems_[1];
  *(void *)&retstr[4].lmPCA.__elems_[1] = 0;
  retstr[4].faceYawAngle = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&retstr[4].side, v9, v10, (v10 - (uint64_t)v9) >> 2);
  *(void *)&retstr[4].yawAngle = 0;
  *(void *)&retstr[5].side = 0;
  *(void *)&retstr[5].lmPCA.__elems_[1] = 0;
  return (EarPose *)std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&retstr[4].yawAngle, *(const void **)&self[1]._pose.yawAngle, (uint64_t)self[2].super.isa, ((uint64_t)self[2].super.isa - *(void *)&self[1]._pose.yawAngle) >> 2);
}

- (void)setPose:(EarPose *)a3
{
  long long v3 = *(_OWORD *)&a3->side;
  long long v4 = *(_OWORD *)&a3->faceYawAngle.var0.__null_state_;
  long long v5 = *(_OWORD *)&a3[1].faceYawAngle.var0.__null_state_;
  *(_OWORD *)&self[1].super.isa = *(_OWORD *)&a3[1].side;
  *(_OWORD *)&self[1]._leftFrameCount = v5;
  *(_OWORD *)&self->_pose.side = v3;
  *(_OWORD *)&self->_pose.faceYawAngle.var0.__null_state_ = v4;
  long long v6 = *(_OWORD *)&a3[2].side;
  long long v7 = *(_OWORD *)&a3[2].faceYawAngle.var0.__null_state_;
  long long v8 = *(_OWORD *)&a3[3].faceYawAngle.var0.__null_state_;
  *(_OWORD *)&self[1]._leftEarYawAngleCaptured = *(_OWORD *)&a3[3].side;
  *(_OWORD *)&self[1]._rightEarYawAngleCaptured = v8;
  *(_OWORD *)&self[1]._leftEarYawAngleCapturedPoses = v6;
  *(_OWORD *)&self[1]._rightEarYawAngleCapturedPoses = v7;
  if (&self->_pose != a3)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self[1]._pose, *(char **)&a3[4].side, *(void *)&a3[4].lmPCA.__elems_[1], (uint64_t)(*(void *)&a3[4].lmPCA.__elems_[1] - *(void *)&a3[4].side) >> 2);
    v11 = *(char **)&a3[4].yawAngle;
    uint64_t v12 = *(void *)&a3[5].side;
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&self[1]._pose.yawAngle, v11, v12, (v12 - (uint64_t)v11) >> 2);
  }
}

- (int)detectionError
{
  return self->_detectionError;
}

- (void)setDetectionError:(int)a3
{
  self->_detectionError = a3;
}

- (NSDictionary)leftEarYawAngleCapturedPoses
{
  return self->_leftEarYawAngleCapturedPoses;
}

- (void)setLeftEarYawAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)leftEarRollAngleCapturedPoses
{
  return self->_leftEarRollAngleCapturedPoses;
}

- (void)setLeftEarRollAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)rightEarYawAngleCapturedPoses
{
  return self->_rightEarYawAngleCapturedPoses;
}

- (void)setRightEarYawAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)rightEarRollAngleCapturedPoses
{
  return self->_rightEarRollAngleCapturedPoses;
}

- (void)setRightEarRollAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)leftEarYawAngleCaptured
{
  return self->_leftEarYawAngleCaptured;
}

- (NSDictionary)leftEarRollAngleCaptured
{
  return self->_leftEarRollAngleCaptured;
}

- (NSDictionary)rightEarYawAngleCaptured
{
  return self->_rightEarYawAngleCaptured;
}

- (NSDictionary)rightEarRollAngleCaptured
{
  return self->_rightEarRollAngleCaptured;
}

- (void).cxx_destruct
{
  long long v3 = *(objc_class **)&self[1]._pose.yawAngle;
  if (v3)
  {
    self[2].super.isa = v3;
    operator delete(v3);
  }
  long long v4 = *(void **)&self[1]._pose.side;
  if (v4)
  {
    *(void *)&self[1]._pose.lmPCA.__elems_[1] = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_rightEarRollAngleCaptured, 0);
  objc_storeStrong((id *)&self->_rightEarYawAngleCaptured, 0);
  objc_storeStrong((id *)&self->_leftEarRollAngleCaptured, 0);
  objc_storeStrong((id *)&self->_leftEarYawAngleCaptured, 0);
  objc_storeStrong((id *)&self->_rightEarRollAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_rightEarYawAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_leftEarRollAngleCapturedPoses, 0);

  objc_storeStrong((id *)&self->_leftEarYawAngleCapturedPoses, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((unsigned char *)self + 188) = 0;
  *((unsigned char *)self + 192) = 0;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  return self;
}

@end