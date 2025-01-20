@interface PearlCoreAnalyticsGlassesBannerEvent
- (NSNumber)displayNotificationCount;
- (NSNumber)enrollmentAfterBannerCount;
- (PearlCoreAnalyticsGlassesBannerEvent)initWithEnrollment;
- (PearlCoreAnalyticsGlassesBannerEvent)initWithNotification;
- (void)setDisplayNotificationCount:(id)a3;
- (void)setEnrollmentAfterBannerCount:(id)a3;
@end

@implementation PearlCoreAnalyticsGlassesBannerEvent

- (PearlCoreAnalyticsGlassesBannerEvent)initWithNotification
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsGlassesBannerEvent;
  v2 = [(PearlCoreAnalyticsEvent *)&v5 initWithName:@"com.apple.biometrickit.pearl.glassesBannerEvent"];
  v3 = v2;
  if (v2) {
    [(PearlCoreAnalyticsGlassesBannerEvent *)v2 setDisplayNotificationCount:&unk_26D5C1350];
  }
  return v3;
}

- (PearlCoreAnalyticsGlassesBannerEvent)initWithEnrollment
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsGlassesBannerEvent;
  v2 = [(PearlCoreAnalyticsEvent *)&v5 initWithName:@"com.apple.biometrickit.pearl.glassesBannerEvent"];
  v3 = v2;
  if (v2) {
    [(PearlCoreAnalyticsGlassesBannerEvent *)v2 setEnrollmentAfterBannerCount:&unk_26D5C1350];
  }
  return v3;
}

- (NSNumber)displayNotificationCount
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDisplayNotificationCount:(id)a3
{
}

- (NSNumber)enrollmentAfterBannerCount
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEnrollmentAfterBannerCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentAfterBannerCount, 0);

  objc_storeStrong((id *)&self->_displayNotificationCount, 0);
}

@end