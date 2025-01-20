@interface ICQSubscriptionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isiCloudPlusSubscriber;
- (ICQSubscriptionInfo)initWithCoder:(id)a3;
- (NSArray)specifiersInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setICloudPlusSubscriber:(BOOL)a3;
- (void)setSpecifiersInfo:(id)a3;
@end

@implementation ICQSubscriptionInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"isiCloudPlusSubscriber: %d, specifiersInfo: %@", self->_iCloudPlusSubscriber, self->_specifiersInfo];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQSubscriptionInfo);
  [(ICQSubscriptionInfo *)v4 setICloudPlusSubscriber:self->_iCloudPlusSubscriber];
  [(ICQSubscriptionInfo *)v4 setSpecifiersInfo:self->_specifiersInfo];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL iCloudPlusSubscriber = self->_iCloudPlusSubscriber;
  id v5 = a3;
  [v5 encodeBool:iCloudPlusSubscriber forKey:@"isICloudPlusSubscriber"];
  [v5 encodeObject:self->_specifiersInfo forKey:@"specifiersInfo"];
}

- (ICQSubscriptionInfo)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQSubscriptionInfo;
  id v5 = [(ICQSubscriptionInfo *)&v12 init];
  if (v5)
  {
    v5->_BOOL iCloudPlusSubscriber = [v4 decodeBoolForKey:@"isICloudPlusSubscriber"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"specifiersInfo"];
    specifiersInfo = v5->_specifiersInfo;
    v5->_specifiersInfo = (NSArray *)v9;
  }
  return v5;
}

- (BOOL)isiCloudPlusSubscriber
{
  return self->_iCloudPlusSubscriber;
}

- (void)setICloudPlusSubscriber:(BOOL)a3
{
  self->_BOOL iCloudPlusSubscriber = a3;
}

- (NSArray)specifiersInfo
{
  return self->_specifiersInfo;
}

- (void)setSpecifiersInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end