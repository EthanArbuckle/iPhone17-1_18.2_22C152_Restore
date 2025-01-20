@interface REBulletinDistributorRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (NSString)bulletinSectionIdentifier;
- (REBulletinDistributorRelevanceProvider)initWithBulletinSectionIdentifier:(id)a3;
- (REBulletinDistributorRelevanceProvider)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation REBulletinDistributorRelevanceProvider

- (REBulletinDistributorRelevanceProvider)initWithBulletinSectionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REBulletinDistributorRelevanceProvider;
  v5 = [(RERelevanceProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bulletinSectionIdentifier = v5->_bulletinSectionIdentifier;
    v5->_bulletinSectionIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (id)relevanceSimulatorID
{
  return @"bulletin_distributor";
}

- (REBulletinDistributorRelevanceProvider)initWithDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"bulletin_section"];
  v5 = (void *)v4;
  uint64_t v6 = &stru_26CFA57D0;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [(REBulletinDistributorRelevanceProvider *)self initWithBulletinSectionIdentifier:v7];
  return v8;
}

- (id)dictionaryEncoding
{
  v6[1] = *MEMORY[0x263EF8340];
  bulletinSectionIdentifier = self->_bulletinSectionIdentifier;
  v5 = @"bulletin_section";
  v6[0] = bulletinSectionIdentifier;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)REBulletinDistributorRelevanceProvider;
  uint64_t v4 = [(RERelevanceProvider *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_bulletinSectionIdentifier copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (REBulletinDistributorRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REBulletinDistributorRelevanceProvider;
    if ([(RERelevanceProvider *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v5 = [(NSString *)v4->_bulletinSectionIdentifier isEqual:self->_bulletinSectionIdentifier];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_hash
{
  v5.receiver = self;
  v5.super_class = (Class)REBulletinDistributorRelevanceProvider;
  unint64_t v3 = [(RERelevanceProvider *)&v5 _hash];
  return [(NSString *)self->_bulletinSectionIdentifier hash] ^ v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)REBulletinDistributorRelevanceProvider;
  uint64_t v4 = [(REBulletinDistributorRelevanceProvider *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ <identifier=%ld>", v4, self->_bulletinSectionIdentifier];

  return v5;
}

- (NSString)bulletinSectionIdentifier
{
  return self->_bulletinSectionIdentifier;
}

- (void).cxx_destruct
{
}

@end