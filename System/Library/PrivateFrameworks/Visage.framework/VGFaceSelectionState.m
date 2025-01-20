@interface VGFaceSelectionState
- (BOOL)updated;
- (NSArray)hairPoses;
- (NSArray)tronPoses;
- (NSDictionary)debugData;
- (NSDictionary)expressionCaptured;
- (NSDictionary)expressionCapturedPoses;
- (NSDictionary)faceTrackingResultCurrentFrame;
- (NSDictionary)pitchAngleCaptured;
- (NSDictionary)pitchAngleCapturedPoses;
- (NSDictionary)posesForHairCaptured;
- (NSDictionary)posesForHairCapturedPoses;
- (NSDictionary)yawAngleCaptured;
- (NSDictionary)yawAngleCapturedPoses;
- (NSNumber)pitchTargetAngle;
- (NSNumber)yawTargetAngle;
- (VGBodyPoseFrameState)bodyPoseFrameState;
- (VGCaptureData)captureData;
- (VGCapturedPose)capturedFrontPose;
- (VGFaceSelectionState)init;
- (VGFrameRejectionState)rejectionState;
- (float)completionScore;
- (float)pitchAngle;
- (float)yawAngle;
- (id)description;
- (unint64_t)poseIndex;
- (void)setBodyPoseFrameState:(id)a3;
- (void)setCaptureData:(id)a3;
- (void)setCapturedFrontPose:(id)a3;
- (void)setCompletionScore:(float)a3;
- (void)setDebugData:(id)a3;
- (void)setExpressionCapturedPoses:(id)a3;
- (void)setFaceTrackingResultCurrentFrame:(id)a3;
- (void)setHairPoses:(id)a3;
- (void)setPitchAngle:(float)a3;
- (void)setPitchAngleCapturedPoses:(id)a3;
- (void)setPitchTargetAngle:(id)a3;
- (void)setPoseIndex:(unint64_t)a3;
- (void)setPosesForHairCapturedPoses:(id)a3;
- (void)setRejectionState:(id)a3;
- (void)setTronPoses:(id)a3;
- (void)setYawAngle:(float)a3;
- (void)setYawAngleCapturedPoses:(id)a3;
- (void)setYawTargetAngle:(id)a3;
@end

@implementation VGFaceSelectionState

- (VGFaceSelectionState)init
{
  v6.receiver = self;
  v6.super_class = (Class)VGFaceSelectionState;
  v2 = [(VGFaceSelectionState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_poseIndex = -1;
    v4 = v2;
  }

  return v3;
}

- (NSDictionary)yawAngleCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:self->_yawAngleCapturedPoses];
}

- (NSDictionary)pitchAngleCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:self->_pitchAngleCapturedPoses];
}

- (NSDictionary)posesForHairCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:self->_posesForHairCapturedPoses];
}

- (NSDictionary)expressionCaptured
{
  return (NSDictionary *)+[VGSelectionState capturedStatesFromCapturedPoses:self->_expressionCapturedPoses];
}

- (id)description
{
  v3 = [(VGFaceSelectionState *)self capturedFrontPose];
  if (v3)
  {
    v4 = [(VGFaceSelectionState *)self capturedFrontPose];
    if ([v4 valid])
    {
      v5 = [(VGFaceSelectionState *)self capturedFrontPose];
      objc_super v6 = [v5 captureData];
      v7 = v6;
      if (v6)
      {
        [v6 timestamp];
        uint64_t v22 = v25;
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = -1;
    }
  }
  else
  {
    uint64_t v22 = -1;
  }

  v24 = NSString;
  if ([(VGSelectionState *)self completed]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v23 = v8;
  if ([(VGSelectionState *)self failed]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(VGFaceSelectionState *)self updated]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  uint64_t poseIndex_low = LODWORD(self->_poseIndex);
  [(VGSelectionState *)self progress];
  float v13 = v12;
  v14 = [(VGFaceSelectionState *)self yawAngleCaptured];
  v15 = [(VGFaceSelectionState *)self pitchAngleCaptured];
  v16 = [(VGFaceSelectionState *)self expressionCaptured];
  v17 = [(VGFaceSelectionState *)self capturedFrontPose];
  [(VGFaceSelectionState *)self completionScore];
  if (v17) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  v20 = [v24 stringWithFormat:@"Face frame selection state: completed %@ failed %@ updated %@ poseIndex %d progress %f yaw %@ pitch %@ expr %@ frontPose %@ (%lld) completionScore %.3f", v23, v9, v10, poseIndex_low, v13, v14, v15, v16, v19, v22, v18];

  return v20;
}

- (BOOL)updated
{
  rejectionState = self->_rejectionState;
  if (rejectionState) {
    LOBYTE(rejectionState) = [(VGFrameRejectionState *)rejectionState reason] == 0;
  }
  return (char)rejectionState;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (NSNumber)yawTargetAngle
{
  return self->_yawTargetAngle;
}

- (void)setYawTargetAngle:(id)a3
{
}

- (NSNumber)pitchTargetAngle
{
  return self->_pitchTargetAngle;
}

- (void)setPitchTargetAngle:(id)a3
{
}

- (NSDictionary)yawAngleCapturedPoses
{
  return self->_yawAngleCapturedPoses;
}

- (void)setYawAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)pitchAngleCapturedPoses
{
  return self->_pitchAngleCapturedPoses;
}

- (void)setPitchAngleCapturedPoses:(id)a3
{
}

- (NSDictionary)posesForHairCapturedPoses
{
  return self->_posesForHairCapturedPoses;
}

- (void)setPosesForHairCapturedPoses:(id)a3
{
}

- (NSDictionary)expressionCapturedPoses
{
  return self->_expressionCapturedPoses;
}

- (void)setExpressionCapturedPoses:(id)a3
{
}

- (NSArray)tronPoses
{
  return self->_tronPoses;
}

- (void)setTronPoses:(id)a3
{
}

- (NSArray)hairPoses
{
  return self->_hairPoses;
}

- (void)setHairPoses:(id)a3
{
}

- (VGCapturedPose)capturedFrontPose
{
  return self->_capturedFrontPose;
}

- (void)setCapturedFrontPose:(id)a3
{
}

- (float)completionScore
{
  return self->_completionScore;
}

- (void)setCompletionScore:(float)a3
{
  self->_completionScore = a3;
}

- (VGFrameRejectionState)rejectionState
{
  return self->_rejectionState;
}

- (void)setRejectionState:(id)a3
{
}

- (VGBodyPoseFrameState)bodyPoseFrameState
{
  return self->_bodyPoseFrameState;
}

- (void)setBodyPoseFrameState:(id)a3
{
}

- (NSDictionary)faceTrackingResultCurrentFrame
{
  return self->_faceTrackingResultCurrentFrame;
}

- (void)setFaceTrackingResultCurrentFrame:(id)a3
{
}

- (unint64_t)poseIndex
{
  return self->_poseIndex;
}

- (void)setPoseIndex:(unint64_t)a3
{
  self->_poseIndex = a3;
}

- (NSDictionary)debugData
{
  return self->_debugData;
}

- (void)setDebugData:(id)a3
{
}

- (VGCaptureData)captureData
{
  return self->_captureData;
}

- (void)setCaptureData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureData, 0);
  objc_storeStrong((id *)&self->_debugData, 0);
  objc_storeStrong((id *)&self->_faceTrackingResultCurrentFrame, 0);
  objc_storeStrong((id *)&self->_bodyPoseFrameState, 0);
  objc_storeStrong((id *)&self->_rejectionState, 0);
  objc_storeStrong((id *)&self->_capturedFrontPose, 0);
  objc_storeStrong((id *)&self->_hairPoses, 0);
  objc_storeStrong((id *)&self->_tronPoses, 0);
  objc_storeStrong((id *)&self->_expressionCapturedPoses, 0);
  objc_storeStrong((id *)&self->_posesForHairCapturedPoses, 0);
  objc_storeStrong((id *)&self->_pitchAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_yawAngleCapturedPoses, 0);
  objc_storeStrong((id *)&self->_pitchTargetAngle, 0);

  objc_storeStrong((id *)&self->_yawTargetAngle, 0);
}

@end