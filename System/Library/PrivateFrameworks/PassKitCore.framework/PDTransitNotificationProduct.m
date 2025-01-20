@interface PDTransitNotificationProduct
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)transitNetworkIdentifier;
- (PKPaymentMarket)transitMarket;
- (int64_t)credentialType;
- (unint64_t)hash;
- (void)setCredentialType:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setTransitMarket:(id)a3;
- (void)setTransitNetworkIdentifier:(id)a3;
@end

@implementation PDTransitNotificationProduct

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(PDTransitNotificationProduct *)self transitMarket];
    v8 = [v6 transitMarket];
    if (PKEqualObjects())
    {
      v9 = [(PDTransitNotificationProduct *)self displayName];
      v10 = [v6 transitMarket];
      if (PKEqualObjects()
        && (id v11 = [(PDTransitNotificationProduct *)self credentialType],
            v11 == [v6 credentialType]))
      {
        v12 = [(PDTransitNotificationProduct *)self transitNetworkIdentifier];
        v13 = [v6 transitNetworkIdentifier];
        char v14 = PKEqualObjects();
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = +[NSMutableArray array];
  [v3 safelyAddObject:self->_transitMarket];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_transitNetworkIdentifier];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (PKPaymentMarket)transitMarket
{
  return (PKPaymentMarket *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransitMarket:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (NSString)transitNetworkIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransitNetworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitNetworkIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_transitMarket, 0);
}

@end