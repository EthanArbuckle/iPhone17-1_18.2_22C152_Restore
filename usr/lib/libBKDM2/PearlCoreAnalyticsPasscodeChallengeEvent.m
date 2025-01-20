@interface PearlCoreAnalyticsPasscodeChallengeEvent
- (NSNumber)glassesDetected;
- (PearlCoreAnalyticsPasscodeChallengeEvent)init;
- (void)reset;
- (void)setGlassesDetected:(id)a3;
@end

@implementation PearlCoreAnalyticsPasscodeChallengeEvent

- (PearlCoreAnalyticsPasscodeChallengeEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)PearlCoreAnalyticsPasscodeChallengeEvent;
  v2 = [(PearlCoreAnalyticsEvent *)&v9 initWithName:@"com.apple.biometrickit.pearl.passcodeChallengeAttempt"];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = (int)*MEMORY[0x263F2AAF0];
    v5 = *(Class *)((char *)&v2->super.super.super.isa + v4);
    *(Class *)((char *)&v2->super.super.super.isa + v4) = (Class)&unk_26D5C1050;

    v6 = objc_alloc_init(AWDBiometricKitPassCodeChallengeAttempt);
    awdMetric = v3->super._awdMetric;
    v3->super._awdMetric = &v6->super;
  }
  return v3;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsPasscodeChallengeEvent;
  [(PearlCoreAnalyticsEvent *)&v5 reset];
  v3 = objc_alloc_init(AWDBiometricKitPassCodeChallengeAttempt);
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

- (void).cxx_destruct
{
}

@end