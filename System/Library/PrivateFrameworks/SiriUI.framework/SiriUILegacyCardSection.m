@interface SiriUILegacyCardSection
+ (BOOL)supportsSecureCoding;
- (NSString)cardSectionIdentifier;
- (SiriUILegacyCardSection)init;
- (SiriUILegacyCardSection)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCardSectionIdentifier:(id)a3;
@end

@implementation SiriUILegacyCardSection

- (SiriUILegacyCardSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUILegacyCardSection;
  v2 = [(SiriUILegacyCardSection *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    cardSectionIdentifier = v2->_cardSectionIdentifier;
    v2->_cardSectionIdentifier = (NSString *)v4;
  }
  return v2;
}

- (SiriUILegacyCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUILegacyCardSection;
  v5 = [(SiriUILegacyCardSection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_cardSectionIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    cardSectionIdentifier = v5->_cardSectionIdentifier;
    v5->_cardSectionIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cardSectionIdentifier = self->_cardSectionIdentifier;
  id v4 = a3;
  NSStringFromSelector(sel_cardSectionIdentifier);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:cardSectionIdentifier forKey:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCardSectionIdentifier:self->_cardSectionIdentifier];
  return v4;
}

- (NSString)cardSectionIdentifier
{
  return self->_cardSectionIdentifier;
}

- (void)setCardSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end