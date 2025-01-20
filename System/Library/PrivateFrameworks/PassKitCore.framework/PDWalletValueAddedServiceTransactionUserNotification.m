@interface PDWalletValueAddedServiceTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (NSString)merchantIdentifier;
- (PDWalletValueAddedServiceTransactionUserNotification)initWithCoder:(id)a3;
- (PDWalletValueAddedServiceTransactionUserNotification)initWithMerchantIdentifier:(id)a3 localizedPassDescription:(id)a4 passUniqueIdentifier:(id)a5;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDWalletValueAddedServiceTransactionUserNotification

- (PDWalletValueAddedServiceTransactionUserNotification)initWithMerchantIdentifier:(id)a3 localizedPassDescription:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v10, "length"))
  {
    v11 = PKLocalizedString(@"VAS_PASS_ADD_UPGRADE_TITLE", @"%@", v9);
    v12 = PKLocalizedString(@"VAS_PASS_ADD_UPGRADE_MESSAGE", @"%@", v9);
    id v20 = v8;
    v13 = +[NSArray arrayWithObjects:&v20 count:1];
    v19.receiver = self;
    v19.super_class = (Class)PDWalletValueAddedServiceTransactionUserNotification;
    v14 = [(PDGenericUserNotification *)&v19 _initWithTitle:v11 subtitle:0 message:v12 forPassUniqueIdentifier:v10 hashComponents:v13];

    if (v14)
    {
      v15 = (NSString *)[v8 copy];
      merchantIdentifier = v14->_merchantIdentifier;
      v14->_merchantIdentifier = v15;

      v18.receiver = v14;
      v18.super_class = (Class)PDWalletValueAddedServiceTransactionUserNotification;
      [(PDUserNotification *)&v18 setCustomActionRoute:PKUserNotificationActionRouteAddValueAddedServicePass];
    }
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDWalletValueAddedServiceTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDWalletValueAddedServiceTransactionUserNotification;
  v5 = [(PDGenericUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDWalletValueAddedServiceTransactionUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantIdentifier, @"merchantIdentifier", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 2;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void).cxx_destruct
{
}

@end