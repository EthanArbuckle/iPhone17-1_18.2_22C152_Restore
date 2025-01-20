@interface PDImportSafariCardRequestUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFPANSuffix:(id)a3 networkName:(id)a4;
+ (id)notificationIdentifierForPaymentSafariCredential:(id)a3;
- (PDImportSafariCardRequestUserNotification)initWithCoder:(id)a3;
- (PDImportSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4;
- (PDImportSafariCardRequestUserNotification)initWithPaymentSafariCredential:(id)a3;
- (id)_messageString;
- (id)_subtitleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDImportSafariCardRequestUserNotification

+ (id)notificationIdentifierForPaymentSafariCredential:(id)a3
{
  id v4 = a3;
  [v4 credentialType];
  v5 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType();
  v6 = [v4 cardNumber];

  v7 = PKFPANSuffixFromFPAN();

  v8 = [a1 notificationIdentifierForFPANSuffix:v7 networkName:v5];

  return v8;
}

+ (id)notificationIdentifierForFPANSuffix:(id)a3 networkName:(id)a4
{
  return +[NSString stringWithFormat:@"SafariCardImport-%@-%@", a4, a3];
}

- (PDImportSafariCardRequestUserNotification)initWithPaymentSafariCredential:(id)a3
{
  id v4 = a3;
  [v4 credentialType];
  v5 = PKDisplayablePaymentNetworkCardNameForPaymentCredentialType();
  v6 = [v4 cardNumber];

  v7 = PKFPANSuffixFromFPAN();

  v8 = [(PDImportSafariCardRequestUserNotification *)self initWithFPANSuffix:v7 networkName:v5];
  return v8;
}

- (PDImportSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[PDImportSafariCardRequestUserNotification notificationIdentifierForFPANSuffix:v6 networkName:v7];
  v15.receiver = self;
  v15.super_class = (Class)PDImportSafariCardRequestUserNotification;
  v9 = [(PDUserNotification *)&v15 initWithNotificationIdentifier:v8 forPassUniqueIdentifier:0];
  if (v9)
  {
    v10 = (NSString *)[v7 copy];
    networkName = v9->_networkName;
    v9->_networkName = v10;

    v12 = (NSString *)[v6 copy];
    fpanSuffix = v9->_fpanSuffix;
    v9->_fpanSuffix = v12;

    [(PDUserNotification *)v9 setCustomActionRoute:PKUserNotificationActionRouteAddPaymentCard];
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 59;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDImportSafariCardRequestUserNotification;
  id v4 = [(PDGenericUserNotification *)&v8 notificationContentWithDataSource:a3];
  v5 = [(PDImportSafariCardRequestUserNotification *)self _messageString];
  [v4 setBody:v5];

  id v6 = [(PDImportSafariCardRequestUserNotification *)self _subtitleString];
  [v4 setSubtitle:v6];

  return v4;
}

- (id)_subtitleString
{
  return (id)PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_BANNER_SUBTITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString(@"SAFARI_CARD_IMPORT_ADD_CARD_BODY", @"%1$@%2$@", self->_networkName, self->_fpanSuffix);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDImportSafariCardRequestUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDImportSafariCardRequestUserNotification;
  v5 = [(PDGenericUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkName"];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanSuffix"];
    fpanSuffix = v5->_fpanSuffix;
    v5->_fpanSuffix = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDImportSafariCardRequestUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkName, @"networkName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fpanSuffix forKey:@"fpanSuffix"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpanSuffix, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end