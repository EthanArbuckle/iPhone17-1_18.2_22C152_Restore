@interface PDPeerPaymentNeedsVerificationUserNotification
- (PDPeerPaymentNeedsVerificationUserNotification)initWithPassUniqueIdentifier:(id)a3;
- (id)_peerPaymentApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_peerPaymentNeedsVerificationGroupDescriptor;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDPeerPaymentNeedsVerificationUserNotification

- (PDPeerPaymentNeedsVerificationUserNotification)initWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)PDPeerPaymentNeedsVerificationUserNotification;
    v5 = [(PDUserNotification *)&v8 initWithNotificationIdentifier:@"peerPaymentIdentityVerification" forPassUniqueIdentifier:v4];
    if (v5)
    {
      v6 = +[NSDate date];
      [(PDUserNotification *)v5 setDate:v6];

      [(PDUserNotification *)v5 setReissueBannerOnUpdate:0];
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (unint64_t)notificationType
{
  return 19;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentNeedsVerificationUserNotification;
  id v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  v5 = PKLocalizedFeatureString();
  [v4 setSubtitle:v5];
  v6 = PKLocalizedFeatureString();
  [v4 setBody:v6];

  v7 = [(PDUserNotification *)self date];
  [v4 setDate:v7];

  return v4;
}

- (id)applicationMessageContent
{
  v3 = PKLocalizedFeatureString();
  id v4 = PKLocalizedFeatureString();
  v5 = [(PDPeerPaymentNeedsVerificationUserNotification *)self _peerPaymentApplicationMessageContentWithTitleText:v3 messageText:v4];

  return v5;
}

- (id)_peerPaymentNeedsVerificationGroupDescriptor
{
  v2 = PKLocalizedFeatureString();
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassPaymentFraudTransactionApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_peerPaymentApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(PDPeerPaymentNeedsVerificationUserNotification *)self _peerPaymentNeedsVerificationGroupDescriptor];
  objc_super v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  v11 = +[PDUserNotification applicationMessageIconForFeature:1];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

@end