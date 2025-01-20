@interface PearlCoreAnalyticsMatchEvent
- (NSNumber)engagementInfoFeedbackCameraObstructed;
- (NSNumber)engagementInfoFeedbackDepthCameraObstructed;
- (NSNumber)engagementInfoFeedbackFaceOccluded;
- (NSNumber)engagementInfoFeedbackFaceTooClose;
- (NSNumber)engagementInfoFeedbackFaceTooFar;
- (NSNumber)engagementInfoFeedbackNoAttention;
- (NSNumber)engagementInfoFeedbackNoFaceDetected;
- (NSNumber)engagementInfoFeedbackNoseAndMouthOccluded;
- (NSNumber)engagementInfoFeedbackPartialOutOfFOV;
- (NSNumber)engagementInfoFeedbackPoseMarginal;
- (NSNumber)engagementInfoFeedbackPoseOutOfRange;
- (NSNumber)engagementStatusCameraObstructed;
- (NSNumber)engagementStatusDepthCameraObstructed;
- (NSNumber)engagementStatusFPDFailure;
- (NSNumber)engagementStatusFaceOccluded;
- (NSNumber)engagementStatusFaceTooClose;
- (NSNumber)engagementStatusFaceTooFar;
- (NSNumber)engagementStatusNoAttention;
- (NSNumber)engagementStatusNoFaceDetected;
- (NSNumber)engagementStatusNoseAndMouthOccluded;
- (NSNumber)engagementStatusPartialOutOfFOV;
- (NSNumber)engagementStatusPoseMarginal;
- (NSNumber)engagementStatusPoseOutOfRange;
- (NSNumber)enrolledTemplateCountTotal;
- (NSNumber)enrolledTemplateCountType0;
- (NSNumber)enrolledTemplateCountType0NoGlasses;
- (NSNumber)enrolledTemplateCountType0Unknown;
- (NSNumber)enrolledTemplateCountType0WithGlasses;
- (NSNumber)enrolledTemplateCountType1;
- (NSNumber)enrolledTemplateCountType1NoGlasses;
- (NSNumber)enrolledTemplateCountType1Unknown;
- (NSNumber)enrolledTemplateCountType1WithGlasses;
- (NSNumber)glassesDetected;
- (NSNumber)gmcRun;
- (PearlCoreAnalyticsMatchEvent)init;
- (void)reset;
- (void)setEngagementInfoFeedbackCameraObstructed:(id)a3;
- (void)setEngagementInfoFeedbackDepthCameraObstructed:(id)a3;
- (void)setEngagementInfoFeedbackFaceOccluded:(id)a3;
- (void)setEngagementInfoFeedbackFaceTooClose:(id)a3;
- (void)setEngagementInfoFeedbackFaceTooFar:(id)a3;
- (void)setEngagementInfoFeedbackNoAttention:(id)a3;
- (void)setEngagementInfoFeedbackNoFaceDetected:(id)a3;
- (void)setEngagementInfoFeedbackNoseAndMouthOccluded:(id)a3;
- (void)setEngagementInfoFeedbackPartialOutOfFOV:(id)a3;
- (void)setEngagementInfoFeedbackPoseMarginal:(id)a3;
- (void)setEngagementInfoFeedbackPoseOutOfRange:(id)a3;
- (void)setEngagementStatusCameraObstructed:(id)a3;
- (void)setEngagementStatusDepthCameraObstructed:(id)a3;
- (void)setEngagementStatusFPDFailure:(id)a3;
- (void)setEngagementStatusFaceOccluded:(id)a3;
- (void)setEngagementStatusFaceTooClose:(id)a3;
- (void)setEngagementStatusFaceTooFar:(id)a3;
- (void)setEngagementStatusNoAttention:(id)a3;
- (void)setEngagementStatusNoFaceDetected:(id)a3;
- (void)setEngagementStatusNoseAndMouthOccluded:(id)a3;
- (void)setEngagementStatusPartialOutOfFOV:(id)a3;
- (void)setEngagementStatusPoseMarginal:(id)a3;
- (void)setEngagementStatusPoseOutOfRange:(id)a3;
- (void)setEnrolledTemplateCountTotal:(id)a3;
- (void)setEnrolledTemplateCountType0:(id)a3;
- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType0Unknown:(id)a3;
- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1:(id)a3;
- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1Unknown:(id)a3;
- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3;
- (void)setGlassesDetected:(id)a3;
- (void)setGmcRun:(id)a3;
@end

@implementation PearlCoreAnalyticsMatchEvent

- (PearlCoreAnalyticsMatchEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)PearlCoreAnalyticsMatchEvent;
  v2 = [(PearlCoreAnalyticsEvent *)&v9 initWithName:@"com.apple.biometrickit.pearl.matchAttempt"];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = (int)*MEMORY[0x263F2AAF0];
    v5 = *(Class *)((char *)&v2->super.super.super.isa + v4);
    *(Class *)((char *)&v2->super.super.super.isa + v4) = (Class)&unk_26D5C0FA8;

    v6 = objc_alloc_init(AWDBiometricKitMatchAttempt);
    awdMetric = v3->super._awdMetric;
    v3->super._awdMetric = &v6->super;
  }
  return v3;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsMatchEvent;
  [(PearlCoreAnalyticsEvent *)&v5 reset];
  v3 = objc_alloc_init(AWDBiometricKitMatchAttempt);
  awdMetric = self->super._awdMetric;
  self->super._awdMetric = &v3->super;
}

- (NSNumber)glassesDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGlassesDetected:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackNoFaceDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEngagementInfoFeedbackNoFaceDetected:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackFaceTooClose
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setEngagementInfoFeedbackFaceTooClose:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackFaceTooFar
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEngagementInfoFeedbackFaceTooFar:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackPoseOutOfRange
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setEngagementInfoFeedbackPoseOutOfRange:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackNoAttention
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEngagementInfoFeedbackNoAttention:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackFaceOccluded
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEngagementInfoFeedbackFaceOccluded:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackCameraObstructed
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setEngagementInfoFeedbackCameraObstructed:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackPartialOutOfFOV
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setEngagementInfoFeedbackPartialOutOfFOV:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackPoseMarginal
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setEngagementInfoFeedbackPoseMarginal:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackNoseAndMouthOccluded
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setEngagementInfoFeedbackNoseAndMouthOccluded:(id)a3
{
}

- (NSNumber)engagementInfoFeedbackDepthCameraObstructed
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setEngagementInfoFeedbackDepthCameraObstructed:(id)a3
{
}

- (NSNumber)engagementStatusNoFaceDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEngagementStatusNoFaceDetected:(id)a3
{
}

- (NSNumber)engagementStatusFaceTooClose
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setEngagementStatusFaceTooClose:(id)a3
{
}

- (NSNumber)engagementStatusFaceTooFar
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setEngagementStatusFaceTooFar:(id)a3
{
}

- (NSNumber)engagementStatusPoseOutOfRange
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setEngagementStatusPoseOutOfRange:(id)a3
{
}

- (NSNumber)engagementStatusNoAttention
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setEngagementStatusNoAttention:(id)a3
{
}

- (NSNumber)engagementStatusFaceOccluded
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setEngagementStatusFaceOccluded:(id)a3
{
}

- (NSNumber)engagementStatusCameraObstructed
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setEngagementStatusCameraObstructed:(id)a3
{
}

- (NSNumber)engagementStatusPartialOutOfFOV
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setEngagementStatusPartialOutOfFOV:(id)a3
{
}

- (NSNumber)engagementStatusPoseMarginal
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setEngagementStatusPoseMarginal:(id)a3
{
}

- (NSNumber)engagementStatusNoseAndMouthOccluded
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEngagementStatusNoseAndMouthOccluded:(id)a3
{
}

- (NSNumber)engagementStatusDepthCameraObstructed
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setEngagementStatusDepthCameraObstructed:(id)a3
{
}

- (NSNumber)engagementStatusFPDFailure
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setEngagementStatusFPDFailure:(id)a3
{
}

- (NSNumber)enrolledTemplateCountTotal
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setEnrolledTemplateCountTotal:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setEnrolledTemplateCountType0:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setEnrolledTemplateCountType0Unknown:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setEnrolledTemplateCountType1:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setEnrolledTemplateCountType1Unknown:(id)a3
{
}

- (NSNumber)gmcRun
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setGmcRun:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gmcRun, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0NoGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountTotal, 0);
  objc_storeStrong((id *)&self->_engagementStatusFPDFailure, 0);
  objc_storeStrong((id *)&self->_engagementStatusDepthCameraObstructed, 0);
  objc_storeStrong((id *)&self->_engagementStatusNoseAndMouthOccluded, 0);
  objc_storeStrong((id *)&self->_engagementStatusPoseMarginal, 0);
  objc_storeStrong((id *)&self->_engagementStatusPartialOutOfFOV, 0);
  objc_storeStrong((id *)&self->_engagementStatusCameraObstructed, 0);
  objc_storeStrong((id *)&self->_engagementStatusFaceOccluded, 0);
  objc_storeStrong((id *)&self->_engagementStatusNoAttention, 0);
  objc_storeStrong((id *)&self->_engagementStatusPoseOutOfRange, 0);
  objc_storeStrong((id *)&self->_engagementStatusFaceTooFar, 0);
  objc_storeStrong((id *)&self->_engagementStatusFaceTooClose, 0);
  objc_storeStrong((id *)&self->_engagementStatusNoFaceDetected, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackDepthCameraObstructed, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackNoseAndMouthOccluded, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackPoseMarginal, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackPartialOutOfFOV, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackCameraObstructed, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackFaceOccluded, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackNoAttention, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackPoseOutOfRange, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackFaceTooFar, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackFaceTooClose, 0);
  objc_storeStrong((id *)&self->_engagementInfoFeedbackNoFaceDetected, 0);

  objc_storeStrong((id *)&self->_glassesDetected, 0);
}

@end