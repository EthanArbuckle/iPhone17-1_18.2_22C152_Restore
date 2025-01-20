@interface ICRadioContentReference
+ (BOOL)supportsSecureCoding;
+ (id)storeItemWithIdentifier:(id)a3;
- (ICRadioContentReference)initWithCoder:(id)a3;
- (id)matchDictionaryWithSubscriptionStatus:(id)a3;
- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3;
- (int64_t)contentType;
@end

@implementation ICRadioContentReference

- (ICRadioContentReference)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICRadioContentReference;
  return [(ICRadioContentReference *)&v4 init];
}

- (id)matchDictionaryWithSubscriptionStatus:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (int64_t)contentType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)storeItemWithIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[ICRadioStoreContentReference alloc] initWithStoreIdentifier:v3];

  return v4;
}

@end