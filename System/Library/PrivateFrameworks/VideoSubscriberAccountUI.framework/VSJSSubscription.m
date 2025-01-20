@interface VSJSSubscription
+ (id)toVSSubscriptions:(id)a3;
- (NSArray)tierIdentifiers;
- (NSDate)expirationDate;
- (NSString)billingIdentifier;
- (NSString)bundleId;
- (VSJSSubscription)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)toVSSubscription;
- (int64_t)accessLevel;
- (void)setAccessLevel:(int64_t)a3;
- (void)setBillingIdentifier:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setTierIdentifiers:(id)a3;
@end

@implementation VSJSSubscription

- (VSJSSubscription)init
{
  v3 = [MEMORY[0x263F4B3C8] currentAppContext];
  v10.receiver = self;
  v10.super_class = (Class)VSJSSubscription;
  v4 = [(IKJSObject *)&v10 initWithAppContext:v3];

  if (v4)
  {
    bundleId = v4->_bundleId;
    v4->_bundleId = (NSString *)&stru_26F361E90;

    uint64_t v6 = [MEMORY[0x263EFF910] distantFuture];
    expirationDate = v4->_expirationDate;
    v4->_expirationDate = (NSDate *)v6;

    v4->_accessLevel = 0;
    billingIdentifier = v4->_billingIdentifier;
    v4->_billingIdentifier = (NSString *)&stru_26F361E90;
  }
  return v4;
}

- (id)toVSSubscription
{
  id v3 = objc_alloc_init(MEMORY[0x263F1E2A8]);
  id v4 = objc_alloc_init(MEMORY[0x263F1E2B8]);
  [v4 setValue:&unk_26F37E5F0 forKey:@"kind"];
  v5 = [(VSJSSubscription *)self bundleId];
  [v4 setValue:v5 forKey:@"identifier"];

  [v3 setSource:v4];
  objc_msgSend(v3, "setAccessLevel:", -[VSJSSubscription accessLevel](self, "accessLevel"));
  uint64_t v6 = [(VSJSSubscription *)self tierIdentifiers];
  v7 = (void *)[v6 copy];
  [v3 setTierIdentifiers:v7];

  v8 = [(VSJSSubscription *)self billingIdentifier];
  v9 = (void *)[v8 copy];
  [v3 setBillingIdentifier:v9];

  return v3;
}

+ (id)toVSSubscriptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toVSSubscription", (void)v12);
        if ([v10 accessLevel]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[VSJSSubscription allocWithZone:a3];
  id v5 = [(IKJSObject *)self appContext];
  uint64_t v6 = [(IKJSObject *)v4 initWithAppContext:v5];

  uint64_t v7 = [(NSString *)self->_bundleId copy];
  bundleId = v6->_bundleId;
  v6->_bundleId = (NSString *)v7;

  v6->_accessLevel = self->_accessLevel;
  uint64_t v9 = [(NSArray *)self->_tierIdentifiers copy];
  tierIdentifiers = v6->_tierIdentifiers;
  v6->_tierIdentifiers = (NSArray *)v9;

  uint64_t v11 = [(NSString *)self->_billingIdentifier copy];
  billingIdentifier = v6->_billingIdentifier;
  v6->_billingIdentifier = (NSString *)v11;

  return v6;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(int64_t)a3
{
  self->_accessLevel = a3;
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (void)setTierIdentifiers:(id)a3
{
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end