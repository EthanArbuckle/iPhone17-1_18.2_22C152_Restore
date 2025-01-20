@interface PKTransitPartner
+ (BOOL)supportsSecureCoding;
- (NSSet)supportedTransitNetworkIdentifiers;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSURL)purchaseURL;
- (PKTransitPartner)initWithCoder:(id)a3;
- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4;
- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4 purchaseURL:(id)a5 supportedTransitNetworkIdentifiers:(id)a6;
- (id)description;
- (int64_t)maxNotificationCount;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxNotificationCount:(int64_t)a3;
@end

@implementation PKTransitPartner

- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransitPartner;
  v9 = [(PKTransitPartner *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_localizedDisplayName, a4);
    v10->_maxNotificationCount = 3;
  }

  return v10;
}

- (PKTransitPartner)initWithIdentifier:(id)a3 localizedDisplayName:(id)a4 purchaseURL:(id)a5 supportedTransitNetworkIdentifiers:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [(PKTransitPartner *)self initWithIdentifier:a3 localizedDisplayName:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_purchaseURL, a5);
    objc_storeStrong((id *)&v14->_supportedTransitNetworkIdentifiers, a6);
    v14->_maxNotificationCount = 3;
  }

  return v14;
}

- (PKTransitPartner)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKTransitPartner;
  v5 = [(PKTransitPartner *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseURL"];
    purchaseURL = v5->_purchaseURL;
    v5->_purchaseURL = (NSURL *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"supportedTransitNetworkIdentifiers"];
    supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
    v5->_supportedTransitNetworkIdentifiers = (NSSet *)v15;

    v5->_maxNotificationCount = [v4 decodeIntegerForKey:@"maxNotificationCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_localizedDisplayName forKey:@"localizedDisplayName"];
  [v5 encodeObject:self->_purchaseURL forKey:@"purchaseURL"];
  [v5 encodeObject:self->_supportedTransitNetworkIdentifiers forKey:@"supportedTransitNetworkIdentifiers"];
  [v5 encodeInteger:self->_maxNotificationCount forKey:@"maxNotificationCount"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PKTransitPartner *)self identifier];
  uint64_t v6 = [(PKTransitPartner *)self localizedDisplayName];
  id v7 = [(PKTransitPartner *)self purchaseURL];
  uint64_t v8 = [(PKTransitPartner *)self supportedTransitNetworkIdentifiers];
  v9 = [v3 stringWithFormat:@"<%@: %p> identifier: %@, localizedDisplayName: %@, purchaseURL: %@, supportedTransitNetworkIdentifiers: %@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSURL)purchaseURL
{
  return self->_purchaseURL;
}

- (NSSet)supportedTransitNetworkIdentifiers
{
  return self->_supportedTransitNetworkIdentifiers;
}

- (int64_t)maxNotificationCount
{
  return self->_maxNotificationCount;
}

- (void)setMaxNotificationCount:(int64_t)a3
{
  self->_maxNotificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_purchaseURL, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end