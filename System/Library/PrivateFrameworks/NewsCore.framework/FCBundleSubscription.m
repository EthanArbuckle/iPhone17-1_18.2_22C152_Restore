@interface FCBundleSubscription
+ (BOOL)supportsSecureCoding;
+ (FCBundleSubscription)subscriptionWithSubscriptionState:(unint64_t)a3 bundleChannelIDs:(id)a4;
- (BOOL)containsHeadline:(id)a3;
- (BOOL)containsItem:(id)a3;
- (BOOL)containsTagID:(id)a3;
- (BOOL)isAmplifyUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidBundleViaOfferActivated;
- (BOOL)isPurchaser;
- (BOOL)isServicesBundleUser;
- (BOOL)isSubscribed;
- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11;
- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 subscriptionState:(unint64_t)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11;
- (FCBundleSubscription)initWithCoder:(id)a3;
- (NSNumber)initialPurchaseTimestamp;
- (NSOrderedSet)bundleChannelIDs;
- (NSString)bundleChannelIDsVersion;
- (NSString)bundlePurchaseID;
- (NSString)servicesBundlePurchaseID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)hash;
- (unint64_t)unprotectedSubscriptionState;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleChannelIDs:(id)a3;
- (void)setBundleChannelIDsVersion:(id)a3;
- (void)setBundlePurchaseID:(id)a3;
- (void)setInitialPurchaseTimestamp:(id)a3;
- (void)setIsAmplifyUser:(BOOL)a3;
- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3;
- (void)setIsPurchaser:(BOOL)a3;
- (void)setServicesBundlePurchaseID:(id)a3;
- (void)setUnprotectedSubscriptionState:(unint64_t)a3;
@end

@implementation FCBundleSubscription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_servicesBundlePurchaseID, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_bundlePurchaseID, 0);
}

- (BOOL)containsHeadline:(id)a3
{
  id v4 = a3;
  v5 = [v4 sourceChannel];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if ([v4 isBundlePaid])
    {
      v8 = [(FCBundleSubscription *)self bundleChannelIDs];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        v10 = [v7 identifier];
        BOOL v11 = [(FCBundleSubscription *)self containsTagID:v10];
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)containsTagID:(id)a3
{
  id v4 = a3;
  v5 = [(FCBundleSubscription *)self bundleChannelIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isServicesBundleUser
{
  v2 = [(FCBundleSubscription *)self servicesBundlePurchaseID];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (FCBundleSubscription)subscriptionWithSubscriptionState:(unint64_t)a3 bundleChannelIDs:(id)a4
{
  id v5 = a4;
  char v6 = objc_alloc_init(FCBundleSubscription);
  [(FCBundleSubscription *)v6 setUnprotectedSubscriptionState:a3];
  id v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v5];

  [(FCBundleSubscription *)v6 setBundleChannelIDs:v7];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v7 = v5;

  if (v7
    && (unint64_t v8 = [(FCBundleSubscription *)self unprotectedSubscriptionState],
        v8 == [v7 unprotectedSubscriptionState])
    && (int v9 = [(FCBundleSubscription *)self isPurchaser],
        v9 == [v7 isPurchaser])
    && (int v10 = [(FCBundleSubscription *)self isAmplifyUser],
        v10 == [v7 isAmplifyUser])
    && (int v11 = [(FCBundleSubscription *)self isPaidBundleViaOfferActivated],
        v11 == [v7 isPaidBundleViaOfferActivated]))
  {
    v13 = NSString;
    v14 = [(FCBundleSubscription *)self bundlePurchaseID];
    v15 = [v7 bundlePurchaseID];
    if (objc_msgSend(v13, "fc_string:isEqualToString:", v14, v15))
    {
      v16 = NSString;
      v17 = [(FCBundleSubscription *)self servicesBundlePurchaseID];
      v18 = [v7 servicesBundlePurchaseID];
      if (objc_msgSend(v16, "fc_string:isEqualToString:", v17, v18))
      {
        v19 = [(FCBundleSubscription *)self bundleChannelIDs];
        v20 = [v7 bundleChannelIDs];
        if ([v19 isEqualToOrderedSet:v20])
        {
          v21 = NSString;
          uint64_t v22 = [(FCBundleSubscription *)self bundleChannelIDsVersion];
          uint64_t v23 = [v7 bundleChannelIDsVersion];
          v28 = (void *)v22;
          uint64_t v24 = v22;
          v25 = (void *)v23;
          if (objc_msgSend(v21, "fc_string:isEqualToString:", v24, v23))
          {
            v26 = [(FCBundleSubscription *)self initialPurchaseTimestamp];
            v27 = [v7 initialPurchaseTimestamp];
            BOOL v6 = v26 == v27;
          }
          else
          {
            BOOL v6 = 0;
          }
        }
        else
        {
          BOOL v6 = 0;
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FCBundleSubscription *)self bundlePurchaseID];
  unint64_t v6 = [(FCBundleSubscription *)self unprotectedSubscriptionState];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"));
  unint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"));
  int v9 = [(FCBundleSubscription *)self servicesBundlePurchaseID];
  int v10 = [v3 stringWithFormat:@"<%@: %p \n bundlePurchaseID: %@ \n subscriptionState: %lu \n isPurchaser=%@ \n isAmplifyUser=%@ \n servicesBundlePurchaseID=%@ \n>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(FCBundleSubscription);
  id v5 = [(FCBundleSubscription *)self bundlePurchaseID];
  unint64_t v6 = (void *)[v5 copy];
  [(FCBundleSubscription *)v4 setBundlePurchaseID:v6];

  id v7 = [(FCBundleSubscription *)self bundleChannelIDs];
  unint64_t v8 = (void *)[v7 copy];
  [(FCBundleSubscription *)v4 setBundleChannelIDs:v8];

  int v9 = [(FCBundleSubscription *)self bundleChannelIDsVersion];
  int v10 = (void *)[v9 copy];
  [(FCBundleSubscription *)v4 setBundleChannelIDsVersion:v10];

  [(FCBundleSubscription *)v4 setUnprotectedSubscriptionState:[(FCBundleSubscription *)self unprotectedSubscriptionState]];
  [(FCBundleSubscription *)v4 setIsPurchaser:[(FCBundleSubscription *)self isPurchaser]];
  [(FCBundleSubscription *)v4 setIsAmplifyUser:[(FCBundleSubscription *)self isAmplifyUser]];
  [(FCBundleSubscription *)v4 setIsPaidBundleViaOfferActivated:[(FCBundleSubscription *)self isPaidBundleViaOfferActivated]];
  int v11 = [(FCBundleSubscription *)self servicesBundlePurchaseID];
  v12 = (void *)[v11 copy];
  [(FCBundleSubscription *)v4 setServicesBundlePurchaseID:v12];

  v13 = [(FCBundleSubscription *)self initialPurchaseTimestamp];
  v14 = (void *)[v13 copy];
  [(FCBundleSubscription *)v4 setInitialPurchaseTimestamp:v14];

  if ([(FCBundleSubscription *)self unprotectedSubscriptionState] <= 1) {
    v15 = v4;
  }
  else {
    v15 = (FCBundleSubscription *)((char *)&v4->super.isa + 1);
  }
  p_initialPurchaseTimestamp = &v15[1]._initialPurchaseTimestamp;
  v17 = NSNumber;
  v18 = v4;
  v19 = [v17 numberWithUnsignedInteger:p_initialPurchaseTimestamp];
  v20 = [NSNumber numberWithUnsignedInteger:-113 - (void)v4];
  objc_setAssociatedObject(v18, (char *)&v4->super.isa + 1, v19, (void *)1);
  objc_setAssociatedObject(v18, (const void *)~(unint64_t)p_initialPurchaseTimestamp, v20, (void *)1);

  return v18;
}

- (NSString)servicesBundlePurchaseID
{
  return self->_servicesBundlePurchaseID;
}

- (BOOL)isSubscribed
{
  return [(FCBundleSubscription *)self unprotectedSubscriptionState] < 2;
}

- (unint64_t)unprotectedSubscriptionState
{
  return self->_unprotectedSubscriptionState;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSString)bundlePurchaseID
{
  return self->_bundlePurchaseID;
}

- (BOOL)isPaidBundleViaOfferActivated
{
  return self->_isPaidBundleViaOfferActivated;
}

- (NSOrderedSet)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (void)setUnprotectedSubscriptionState:(unint64_t)a3
{
  self->_unprotectedSubscriptionState = a3;
}

- (void)setBundleChannelIDs:(id)a3
{
}

- (void)setServicesBundlePurchaseID:(id)a3
{
}

- (void)setIsPurchaser:(BOOL)a3
{
  self->_isPurchaser = a3;
}

- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3
{
  self->_isPaidBundleViaOfferActivated = a3;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  self->_isAmplifyUser = a3;
}

- (void)setInitialPurchaseTimestamp:(id)a3
{
}

- (void)setBundlePurchaseID:(id)a3
{
}

- (void)setBundleChannelIDsVersion:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCBundleSubscription)initWithCoder:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 decodeIntegerForKey:@"subscriptionState"];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [v3 decodeDoubleForKey:@"initialPurchaseTimestamp"];
  if (v8 == 0.0)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  int v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePurchaseID"];
  [v3 decodeObjectOfClasses:v7 forKey:@"bundleChannelIDs"];
  int v11 = v26 = (void *)v7;
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleChannelIDsVersion"];
  uint64_t v13 = [v3 decodeBoolForKey:@"isPurchaser"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"servicesBundlePurchaseID"];
  char v15 = [v3 decodeBoolForKey:@"isAmplifyUser"];
  LOBYTE(v25) = [v3 decodeBoolForKey:@"isPaidBundleViaOfferActivated"];
  LOBYTE(v24) = v15;
  v16 = [(FCBundleSubscription *)self initWithBundlePurchaseID:v10 bundleChannelIDs:v11 bundleChannelIDsVersion:v12 subscriptionState:v4 isPurchaser:v13 servicesBundlePurchaseID:v14 isAmplifyUser:v24 initialPurchaseTimestamp:v9 isPaidBundleViaOfferActivated:v25];

  uint64_t v17 = 146;
  if (v4 > 1) {
    uint64_t v17 = 147;
  }
  unint64_t v18 = (unint64_t)v16 + v17;
  v19 = NSNumber;
  v20 = v16;
  v21 = [v19 numberWithUnsignedInteger:v18];
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:-147 - (void)v16];
  objc_setAssociatedObject(v20, (char *)&v16->super.isa + 1, v21, (void *)1);
  objc_setAssociatedObject(v20, (const void *)~v18, v22, (void *)1);

  return v20;
}

- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 subscriptionState:(unint64_t)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a10;
  v34.receiver = self;
  v34.super_class = (Class)FCBundleSubscription;
  uint64_t v22 = [(FCBundleSubscription *)&v34 init];
  if (v22)
  {
    uint64_t v23 = [v17 copy];
    bundlePurchaseID = v22->_bundlePurchaseID;
    v22->_bundlePurchaseID = (NSString *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v18];
    bundleChannelIDs = v22->_bundleChannelIDs;
    v22->_bundleChannelIDs = (NSOrderedSet *)v25;

    uint64_t v27 = [v19 copy];
    bundleChannelIDsVersion = v22->_bundleChannelIDsVersion;
    v22->_bundleChannelIDsVersion = (NSString *)v27;

    v22->_unprotectedSubscriptionState = a6;
    v22->_isPurchaser = a7;
    v22->_isAmplifyUser = a9;
    v22->_isPaidBundleViaOfferActivated = a11;
    uint64_t v29 = [v20 copy];
    servicesBundlePurchaseID = v22->_servicesBundlePurchaseID;
    v22->_servicesBundlePurchaseID = (NSString *)v29;

    uint64_t v31 = [v21 copy];
    initialPurchaseTimestamp = v22->_initialPurchaseTimestamp;
    v22->_initialPurchaseTimestamp = (NSNumber *)v31;
  }
  return v22;
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  if ([v4 isBundlePaid])
  {
    id v5 = [v4 publisherID];
    BOOL v6 = [(FCBundleSubscription *)self containsTagID:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (FCBundleSubscription)initWithBundlePurchaseID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 inTrialPeriod:(BOOL)a6 isPurchaser:(BOOL)a7 servicesBundlePurchaseID:(id)a8 isAmplifyUser:(BOOL)a9 initialPurchaseTimestamp:(id)a10 isPaidBundleViaOfferActivated:(BOOL)a11
{
  return -[FCBundleSubscription initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:](self, "initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:subscriptionState:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", a3, a4, a5, !a6 && !a9 && !a11, a7, a8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCBundleSubscription *)self bundleChannelIDs];
  BOOL v6 = [v5 array];
  [v4 encodeObject:v6 forKey:@"bundleChannelIDs"];

  uint64_t v7 = [(FCBundleSubscription *)self bundleChannelIDsVersion];
  [v4 encodeObject:v7 forKey:@"bundleChannelIDsVersion"];

  double v8 = [(FCBundleSubscription *)self bundlePurchaseID];
  [v4 encodeObject:v8 forKey:@"bundlePurchaseID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"), @"subscriptionState");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"), @"isPurchaser");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"), @"isAmplifyUser");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"), @"isPaidBundleViaOfferActivated");
  int v9 = [(FCBundleSubscription *)self servicesBundlePurchaseID];
  [v4 encodeObject:v9 forKey:@"servicesBundlePurchaseID"];

  id v10 = [(FCBundleSubscription *)self initialPurchaseTimestamp];
  [v10 doubleValue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"initialPurchaseTimestamp");
}

- (unint64_t)hash
{
  id v3 = [(FCBundleSubscription *)self bundleChannelIDs];
  uint64_t v4 = [v3 hash];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCBundleSubscription unprotectedSubscriptionState](self, "unprotectedSubscriptionState"));
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscription isPurchaser](self, "isPurchaser"));
  uint64_t v8 = [v7 hash];
  int v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscription isAmplifyUser](self, "isAmplifyUser"));
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FCBundleSubscription isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"));
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(FCBundleSubscription *)self bundleChannelIDsVersion];
  uint64_t v14 = v12 ^ [v13 hash];
  char v15 = [(FCBundleSubscription *)self initialPurchaseTimestamp];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

@end