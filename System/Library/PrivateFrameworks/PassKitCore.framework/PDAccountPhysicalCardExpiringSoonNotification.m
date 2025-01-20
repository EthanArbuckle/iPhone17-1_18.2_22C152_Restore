@interface PDAccountPhysicalCardExpiringSoonNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountPhysicalCardExpiringSoonNotification)initWithAccount:(id)a3 physicalCard:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PDAccountPhysicalCardExpiringSoonNotification)initWithCoder:(id)a3;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPhysicalCardExpiringSoonNotification

- (PDAccountPhysicalCardExpiringSoonNotification)initWithAccount:(id)a3 physicalCard:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length]
    && ([v9 identifier],
        v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 length],
        v11,
        v12))
  {
    v13 = [v9 identifier];
    v14 = +[NSString stringWithFormat:@"%@-physicalCardExpiringSoon", v13];

    v30.receiver = self;
    v30.super_class = (Class)PDAccountPhysicalCardExpiringSoonNotification;
    v15 = [(PDUserNotification *)&v30 initWithNotificationIdentifier:v14 forPassUniqueIdentifier:v10];
    v16 = v15;
    if (v15)
    {
      v17 = [(PDUserNotification *)v15 notificationIdentifier];
      id v18 = [v17 length];

      if (v18)
      {
        id v19 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        v20 = [v8 productTimeZone];
        [v19 setTimeZone:v20];

        uint64_t v21 = [v9 expirationDateInCalendar:v19];
        expirationDate = v16->_expirationDate;
        v16->_expirationDate = (NSDate *)v21;

        v23 = +[NSString stringWithFormat:@"%@://%@/%@/%@", PKWalletURLScheme, PKURLActionRouteCreditPaymentPass, PKURLActionRouteCreditPaymentPassDetailsAction, PKURLSubactionRouteCreditPaymentPassReplace];
        [(PDUserNotification *)v16 setCustomActionURLString:v23];

        if (!v16->_expirationDate)
        {

          v28 = 0;
          goto LABEL_10;
        }
        uint64_t v24 = [v8 accountIdentifier];
        accountIdentifier = v16->_accountIdentifier;
        v16->_accountIdentifier = (NSString *)v24;

        uint64_t v26 = [v9 identifier];
        physicalCardIdentifier = v16->_physicalCardIdentifier;
        v16->_physicalCardIdentifier = (NSString *)v26;
      }
    }
  }
  else
  {

    v16 = 0;
  }
  v16 = v16;
  v28 = v16;
LABEL_10:

  return v28;
}

- (PDAccountPhysicalCardExpiringSoonNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAccountPhysicalCardExpiringSoonNotification;
  v5 = [(PDUserNotification *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalCardIdentifier"];
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountPhysicalCardExpiringSoonNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, @"expirationDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_physicalCardIdentifier forKey:@"physicalCardIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isValid
{
  v2 = PKAppleCardPhysicalCardExpiredMessagingStartDate();
  if (PKIsMac())
  {
    BOOL v3 = 0;
  }
  else if (v2)
  {
    id v4 = +[NSDate now];
    [v4 timeIntervalSinceDate:v2];
    BOOL v3 = v5 < 0.0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (unint64_t)notificationType
{
  return 76;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDAccountPhysicalCardExpiringSoonNotification;
  BOOL v3 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  id v4 = PKLocalizedFeatureString();
  [v3 setSubtitle:v4];

  double v5 = PDDeviceSpecificLocalizedStringKeyForKey();
  uint64_t v6 = PKMediumDayAndMonthStringFromDate();
  v7 = PKLocalizedFeatureString();
  objc_msgSend(v3, "setBody:", v7, v6);

  return v3;
}

- (id)applicationMessageContent
{
  BOOL v3 = PKLocalizedFeatureString();
  v16 = PKMediumDayAndMonthStringFromDate();
  id v4 = PKLocalizedFeatureString();

  double v5 = PKLocalizedFeatureString();
  id v6 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassAccountEventApplicationMessageGroupIdentifier", v5, v5, v16 withSingularSummary pluralSummary];
  v7 = PKPassKitUIBundle();
  CFURLRef v8 = [v7 URLForResource:@"PhysicalCardMessageModule" withExtension:@"pdf"];

  objc_super v9 = CGPDFDocumentCreateWithURL(v8);
  if (v9)
  {
    +[PKApplicationMessageIcon maximumSizeForStyle:1];
    PKScreenScale();
    uint64_t v10 = PKGetImageFromPDFDocument();
    CGPDFDocumentRelease(v9);
    id v11 = +[PKImageDescriptorBitmap createForImage:v10 withTintColor:0 hasBackground:0];
    objc_super v9 = (CGPDFDocument *)+[PKApplicationMessageIcon createWithImage:v11 style:0];
  }
  id v12 = [(PDUserNotification *)self actionURL];
  id v13 = +[PKApplicationMessageActionURL createWithURL:v12];
  id v14 = +[PKApplicationMessageContentDefault createWithGroup:v6 action:v13 icon:v9 title:v3 body:v4];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end