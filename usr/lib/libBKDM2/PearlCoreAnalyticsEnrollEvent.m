@interface PearlCoreAnalyticsEnrollEvent
- (NSNumber)enrolledTemplateCountType0NoGlasses;
- (NSNumber)enrolledTemplateCountType0Unknown;
- (NSNumber)enrolledTemplateCountType0WithGlasses;
- (NSNumber)enrolledTemplateCountType1NoGlasses;
- (NSNumber)enrolledTemplateCountType1Unknown;
- (NSNumber)enrolledTemplateCountType1WithGlasses;
- (NSNumber)glassesDetected;
- (PearlCoreAnalyticsEnrollEvent)init;
- (void)reset;
- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType0Unknown:(id)a3;
- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1Unknown:(id)a3;
- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3;
- (void)setGlassesDetected:(id)a3;
@end

@implementation PearlCoreAnalyticsEnrollEvent

- (PearlCoreAnalyticsEnrollEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)PearlCoreAnalyticsEnrollEvent;
  v2 = [(PearlCoreAnalyticsEvent *)&v9 initWithName:@"com.apple.biometrickit.pearl.enrollAttempt"];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = (int)*MEMORY[0x263F2AAF0];
    v5 = *(Class *)((char *)&v2->super.super.super.isa + v4);
    *(Class *)((char *)&v2->super.super.super.isa + v4) = (Class)&unk_26D5C1020;

    v6 = objc_alloc_init(AWDBiometricKitEnrollAttempt);
    awdMetric = v3->super._awdMetric;
    v3->super._awdMetric = &v6->super;
  }
  return v3;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsEnrollEvent;
  [(PearlCoreAnalyticsEvent *)&v5 reset];
  v3 = objc_alloc_init(AWDBiometricKitEnrollAttempt);
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

- (NSNumber)enrolledTemplateCountType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEnrolledTemplateCountType0Unknown:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setEnrolledTemplateCountType1Unknown:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0NoGlasses, 0);

  objc_storeStrong((id *)&self->_glassesDetected, 0);
}

@end