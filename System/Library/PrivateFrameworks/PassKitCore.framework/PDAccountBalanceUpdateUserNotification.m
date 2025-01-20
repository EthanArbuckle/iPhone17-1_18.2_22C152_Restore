@interface PDAccountBalanceUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (PDAccountBalanceUpdateUserNotification)initWithAmount:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKCurrencyAmount)amount;
- (unint64_t)notificationType;
@end

@implementation PDAccountBalanceUpdateUserNotification

- (PDAccountBalanceUpdateUserNotification)initWithAmount:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = PKLocalizedLynxString(@"NOTIFICATION_IN_STORE_BALANCE_UPDATE_TITLE");
  v9 = [v7 minimalFormattedStringValue];

  v10 = PKLocalizedLynxString(@"NOTIFICATION_IN_STORE_BALANCE_UPDATE_MESSAGE", @"%@", v9);

  v13.receiver = self;
  v13.super_class = (Class)PDAccountBalanceUpdateUserNotification;
  v11 = [(PDGenericUserNotification *)&v13 initWithTitle:v8 message:v10 forPassUniqueIdentifier:v6];

  if (v11) {
    [(PDUserNotification *)v11 setCustomActionRoute:PKURLActionRouteAppleBalancePass];
  }

  return v11;
}

- (unint64_t)notificationType
{
  return 70;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
}

@end