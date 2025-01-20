@interface PDImportSafariCardConsentRequiredUserNotification
- (PDImportSafariCardConsentRequiredUserNotification)init;
- (unint64_t)notificationType;
@end

@implementation PDImportSafariCardConsentRequiredUserNotification

- (PDImportSafariCardConsentRequiredUserNotification)init
{
  v3 = PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_CONSENT_REQUIRED_BANNER_BODY");
  v6.receiver = self;
  v6.super_class = (Class)PDImportSafariCardConsentRequiredUserNotification;
  v4 = [(PDGenericUserNotification *)&v6 initWithMessage:v3];

  if (v4) {
    [(PDUserNotification *)v4 setCustomActionRoute:PKUserNotificationActionRouteImportSafariCardConsent];
  }
  return v4;
}

- (unint64_t)notificationType
{
  return 58;
}

@end