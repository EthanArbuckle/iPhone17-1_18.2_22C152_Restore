@interface PDDiscoveryUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForDiscoveryNotification:(id)a3;
- (PDDiscoveryUserNotification)initWithCoder:(id)a3;
- (PDDiscoveryUserNotification)initWithDiscoveryNotification:(id)a3 passUniqueIdentifier:(id)a4;
- (PKDiscoveryNotification)discoveryNotification;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscoveryNotification:(id)a3;
@end

@implementation PDDiscoveryUserNotification

+ (id)notificationIdentifierForDiscoveryNotification:(id)a3
{
  v3 = [a3 identifier];
  v4 = +[NSString stringWithFormat:@"%@-discoveryNotification", v3];

  return v4;
}

- (PDDiscoveryUserNotification)initWithDiscoveryNotification:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    v8 = [(id)objc_opt_class() notificationIdentifierForDiscoveryNotification:v6];
    v12.receiver = self;
    v12.super_class = (Class)PDDiscoveryUserNotification;
    v9 = [(PDUserNotification *)&v12 initWithNotificationIdentifier:v8 forPassUniqueIdentifier:v7];

    if (v9) {
      [(PDDiscoveryUserNotification *)v9 setDiscoveryNotification:v6];
    }
    self = v9;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setDiscoveryNotification:(id)a3
{
  id v15 = a3;
  p_discoveryNotification = &self->_discoveryNotification;
  objc_storeStrong((id *)&self->_discoveryNotification, a3);
  id v6 = [(PKDiscoveryNotification *)self->_discoveryNotification actionType];
  if (v6 == (id)5)
  {
    objc_super v12 = [(PKDiscoveryNotification *)*p_discoveryNotification discoveryCardIdentifier];
    if (v12)
    {
      v13 = +[NSString stringWithFormat:@"%@/%@/%@", PKURLRouteDiscovery, PKURLRouteDiscoveryCard, v12];
    }
    else
    {
      v13 = 0;
    }

    if (!v13) {
      goto LABEL_18;
    }
LABEL_17:
    [(PDUserNotification *)self setCustomActionRoute:v13];

    goto LABEL_18;
  }
  if (v6 == (id)3)
  {
    id v9 = [(PKDiscoveryNotification *)*p_discoveryNotification passQualifier];
    if (v9 == (id)2)
    {
      uint64_t v10 = PKURLActionRouteCreditPaymentPass;
      v11 = &PKURLActionRouteCreditPaymentPassDetailsAction;
    }
    else
    {
      if (v9 != (id)1) {
        goto LABEL_18;
      }
      uint64_t v10 = PKURLActionRoutePeerPaymentPass;
      v11 = &PKUserNotificationActionRouteViewPassDetails;
    }
    id v14 = +[NSString stringWithFormat:@"%@/%@", v10, *v11];
  }
  else
  {
    if (v6 != (id)2) {
      goto LABEL_18;
    }
    id v7 = [(PKDiscoveryNotification *)*p_discoveryNotification passQualifier];
    if (v7 == (id)2)
    {
      v8 = (id *)&PKURLActionRouteCreditPaymentPass;
    }
    else
    {
      if (v7 != (id)1) {
        goto LABEL_18;
      }
      v8 = (id *)&PKURLActionRoutePeerPaymentPass;
    }
    id v14 = *v8;
  }
  v13 = v14;
  if (v14) {
    goto LABEL_17;
  }
LABEL_18:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDDiscoveryUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDDiscoveryUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveryNotification"];
    discoveryNotification = v5->_discoveryNotification;
    v5->_discoveryNotification = (PKDiscoveryNotification *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDDiscoveryUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_discoveryNotification, @"discoveryNotification", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 27;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDDiscoveryUserNotification;
  id v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  objc_super v5 = [(PKDiscoveryNotification *)self->_discoveryNotification localizedTitle];
  uint64_t v6 = [(PKDiscoveryNotification *)self->_discoveryNotification localizedMessage];
  if (v5) {
    [v4 setSubtitle:v5];
  }
  if (v6) {
    [v4 setBody:v6];
  }
  if ([(PKDiscoveryNotification *)self->_discoveryNotification actionType] == (id)4)
  {
    id v7 = [(PKDiscoveryNotification *)self->_discoveryNotification url];
    [v4 setDefaultActionURL:v7];
  }
  return v4;
}

- (PKDiscoveryNotification)discoveryNotification
{
  return self->_discoveryNotification;
}

- (void).cxx_destruct
{
}

@end