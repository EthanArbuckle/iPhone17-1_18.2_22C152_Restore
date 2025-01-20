@interface PKPaymentSetupProductConfiguration
- (NSDate)lastUpdated;
- (NSString)dirtyStateIdentifier;
- (NSString)discoveryCardIdentifier;
- (NSString)notificationMessage;
- (NSString)notificationTitle;
- (NSString)partnerIdentifier;
- (NSString)productIdentifier;
- (PKPaymentSetupProductConfiguration)initWithProductDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)state;
- (unint64_t)type;
- (void)setDirtyStateIdentifier:(id)a3;
- (void)setDiscoveryCardIdentifier:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setLastUpdated:(id)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setNotificationTitle:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentSetupProductConfiguration

- (PKPaymentSetupProductConfiguration)initWithProductDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupProductConfiguration;
  v5 = [(PKPaymentSetupProductConfiguration *)&v23 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKPaymentSetupProductTypeFromString(v6);

    v7 = [v4 PKStringForKey:@"state"];
    v5->_state = PKPaymentSetupProductStateFromString(v7);

    v8 = [v4 PKStringForKey:@"productIdentifier"];
    uint64_t v9 = [v8 copy];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v9;

    v11 = [v4 PKStringForKey:@"identifier"];
    uint64_t v12 = [v11 copy];
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"localizedNotificationTitle"];
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"localizedNotificationMessage"];
    notificationMessage = v5->_notificationMessage;
    v5->_notificationMessage = (NSString *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"discoveryCardIdentifier"];
    discoveryCardIdentifier = v5->_discoveryCardIdentifier;
    v5->_discoveryCardIdentifier = (NSString *)v18;

    v20 = [v4 PKStringForKey:@"featureIdentifier"];
    v21 = v20;
    if (v20) {
      v5->_featureIdentifier = PKFeatureIdentifierFromString(v20);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPaymentSetupProductConfiguration allocWithZone:](PKPaymentSetupProductConfiguration, "allocWithZone:") init];
  v5->_type = self->_type;
  v5->_state = self->_state;
  uint64_t v6 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_partnerIdentifier copyWithZone:a3];
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v8;

  v5->_featureIdentifier = self->_featureIdentifier;
  uint64_t v10 = [(NSString *)self->_dirtyStateIdentifier copyWithZone:a3];
  dirtyStateIdentifier = v5->_dirtyStateIdentifier;
  v5->_dirtyStateIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v12;

  uint64_t v14 = [(NSString *)self->_notificationTitle copyWithZone:a3];
  notificationTitle = v5->_notificationTitle;
  v5->_notificationTitle = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_notificationMessage copyWithZone:a3];
  notificationMessage = v5->_notificationMessage;
  v5->_notificationMessage = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_discoveryCardIdentifier copyWithZone:a3];
  discoveryCardIdentifier = v5->_discoveryCardIdentifier;
  v5->_discoveryCardIdentifier = (NSString *)v18;

  return v5;
}

- (unint64_t)featureIdentifier
{
  unint64_t result = self->_featureIdentifier;
  if (!result)
  {
    if ([(NSString *)self->_productIdentifier hasSuffix:@"3-argon-CCS"])
    {
      unint64_t result = 2;
    }
    else
    {
      id v4 = [(NSString *)self->_productIdentifier lowercaseString];
      v5 = [@"4-argon-FPS" lowercaseString];
      int v6 = [v4 hasSuffix:v5];

      if (v6)
      {
        unint64_t result = 3;
      }
      else
      {
        if (![(NSString *)self->_productIdentifier hasSuffix:@"appleBalance"]) {
          return self->_featureIdentifier;
        }
        unint64_t result = 4;
      }
    }
    self->_featureIdentifier = result;
  }
  return result;
}

- (NSString)productIdentifier
{
  productIdentifier = self->_productIdentifier;
  if (!productIdentifier)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    v5 = [v4 UUIDString];
    int v6 = self->_productIdentifier;
    self->_productIdentifier = v5;

    productIdentifier = self->_productIdentifier;
  }
  return productIdentifier;
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (void)setProductIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)dirtyStateIdentifier
{
  return self->_dirtyStateIdentifier;
}

- (void)setDirtyStateIdentifier:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (NSString)discoveryCardIdentifier
{
  return self->_discoveryCardIdentifier;
}

- (void)setDiscoveryCardIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryCardIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_dirtyStateIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
}

@end