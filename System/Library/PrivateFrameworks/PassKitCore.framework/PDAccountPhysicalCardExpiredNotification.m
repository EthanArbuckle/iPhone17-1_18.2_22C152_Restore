@interface PDAccountPhysicalCardExpiredNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountPhysicalCardExpiredNotification)initWithAccountIdentifier:(id)a3 physicalCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDAccountPhysicalCardExpiredNotification

- (PDAccountPhysicalCardExpiredNotification)initWithAccountIdentifier:(id)a3 physicalCardIdentifier:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v8 length] && objc_msgSend(v7, "length"))
  {
    v9 = +[NSString stringWithFormat:@"%@-physicalCardExpired", v7];
    v16.receiver = self;
    v16.super_class = (Class)PDAccountPhysicalCardExpiredNotification;
    v10 = [(PDUserNotification *)&v16 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:v8];
    v11 = v10;
    if (v10)
    {
      v12 = [(PDUserNotification *)v10 notificationIdentifier];
      id v13 = [v12 length];

      if (v13)
      {
        v14 = +[NSString stringWithFormat:@"%@://%@/%@/%@", PKWalletURLScheme, PKURLActionRouteCreditPaymentPass, PKURLActionRouteCreditPaymentPassDetailsAction, PKURLSubactionRouteCreditPaymentPassReplace];
        [(PDUserNotification *)v11 setCustomActionURLString:v14];
      }
      else
      {
        v14 = v11;
        v11 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isValid
{
  return PKIsMac() ^ 1;
}

- (unint64_t)notificationType
{
  return 77;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountPhysicalCardExpiredNotification;
  v3 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  v4 = PKLocalizedFeatureString();
  [v3 setSubtitle:v4];

  v5 = PDDeviceSpecificLocalizedStringKeyForKey();
  v6 = PKLocalizedFeatureString();
  [v3 setBody:v6];

  return v3;
}

- (id)applicationMessageContent
{
  v3 = PKLocalizedFeatureString();
  v4 = PKLocalizedFeatureString();
  v5 = PKLocalizedFeatureString();
  id v6 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassAccountEventApplicationMessageGroupIdentifier" withSingularSummary:v5 pluralSummary:v5];
  id v7 = PKPassKitUIBundle();
  CFURLRef v8 = [v7 URLForResource:@"PhysicalCardMessageModule" withExtension:@"pdf"];

  v9 = CGPDFDocumentCreateWithURL(v8);
  if (v9)
  {
    +[PKApplicationMessageIcon maximumSizeForStyle:1];
    PKScreenScale();
    v10 = PKGetImageFromPDFDocument();
    CGPDFDocumentRelease(v9);
    id v11 = +[PKImageDescriptorBitmap createForImage:v10 withTintColor:0 hasBackground:0];
    v9 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:v11 style:0];
  }
  v12 = [(PDUserNotification *)self actionURL];
  id v13 = +[PKApplicationMessageActionURL createWithURL:v12];
  id v14 = +[PKApplicationMessageContentDefault createWithGroup:v6 action:v13 icon:v9 title:v3 body:v4];

  return v14;
}

@end