@interface SKStatusSubscriptionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersonalStatusSubscription;
- (NSArray)ownerHandles;
- (NSString)statusTypeIdentifier;
- (NSString)subscriptionIdentifier;
- (SKPublishedStatus)currentStatus;
- (SKStatusSubscriptionMetadata)initWithCoder:(id)a3;
- (SKStatusSubscriptionMetadata)initWithSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 isPersonalStatusSubscription:(BOOL)a5 currentStatus:(id)a6 ownerHandles:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKStatusSubscriptionMetadata

- (SKStatusSubscriptionMetadata)initWithSubscriptionIdentifier:(id)a3 statusTypeIdentifier:(id)a4 isPersonalStatusSubscription:(BOOL)a5 currentStatus:(id)a6 ownerHandles:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SKStatusSubscriptionMetadata;
  v16 = [(SKStatusSubscriptionMetadata *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    subscriptionIdentifier = v16->_subscriptionIdentifier;
    v16->_subscriptionIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    statusTypeIdentifier = v16->_statusTypeIdentifier;
    v16->_statusTypeIdentifier = (NSString *)v19;

    v16->_personalStatusSubscription = a5;
    objc_storeStrong((id *)&v16->_currentStatus, a6);
    uint64_t v21 = [v15 copy];
    ownerHandles = v16->_ownerHandles;
    v16->_ownerHandles = (NSArray *)v21;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  subscriptionIdentifier = self->_subscriptionIdentifier;
  id v5 = a3;
  [v5 encodeObject:subscriptionIdentifier forKey:@"subscriptionIdentifier"];
  [v5 encodeObject:self->_statusTypeIdentifier forKey:@"statusTypeIdentifier"];
  [v5 encodeBool:self->_personalStatusSubscription forKey:@"isPersonalStatusSubscription"];
  [v5 encodeObject:self->_currentStatus forKey:@"currentStatus"];
  [v5 encodeObject:self->_ownerHandles forKey:@"ownerHandles"];
}

- (SKStatusSubscriptionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusTypeIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isPersonalStatusSubscription"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentStatus"];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"ownerHandles"];

  id v13 = [(SKStatusSubscriptionMetadata *)self initWithSubscriptionIdentifier:v5 statusTypeIdentifier:v6 isPersonalStatusSubscription:v7 currentStatus:v8 ownerHandles:v12];
  return v13;
}

- (id)description
{
  BOOL personalStatusSubscription = self->_personalStatusSubscription;
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(SKStatusSubscriptionMetadata *)self subscriptionIdentifier];
  if (personalStatusSubscription)
  {
    uint64_t v7 = [(SKStatusSubscriptionMetadata *)self currentStatus];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; subscriptionID = \"%@\"; personal = YES; status = \"%@\">",
      v5,
      self,
      v6,
    v8 = v7);
  }
  else
  {
    uint64_t v7 = [(SKStatusSubscriptionMetadata *)self ownerHandles];
    v9 = [(SKStatusSubscriptionMetadata *)self currentStatus];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; subscriptionID = \"%@\"; owners = \"%@\"; status = \"%@\">",
      v5,
      self,
      v6,
      v7,
    v8 = v9);
  }
  return v8;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (BOOL)isPersonalStatusSubscription
{
  return self->_personalStatusSubscription;
}

- (SKPublishedStatus)currentStatus
{
  return self->_currentStatus;
}

- (NSArray)ownerHandles
{
  return self->_ownerHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHandles, 0);
  objc_storeStrong((id *)&self->_currentStatus, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
}

@end