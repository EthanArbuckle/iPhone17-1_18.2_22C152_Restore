@interface PKMiniDiscoveryCard
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKMiniDiscoveryCard)initWithCoder:(id)a3;
- (PKMiniDiscoveryCard)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)miniCardTemplateType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKMiniDiscoveryCard

- (PKMiniDiscoveryCard)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMiniDiscoveryCard;
  v5 = [(PKDiscoveryCard *)&v8 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"miniCardTemplateType"];
    v5->_miniCardTemplateType = PKDiscoveryMiniCardTemplateTypeFromString(v6);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  BOOL v5 = [(PKDiscoveryCard *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_miniCardTemplateType == v4[14];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PKMiniDiscoveryCard;
  unint64_t v3 = [(PKDiscoveryCard *)&v5 hash];
  return self->_miniCardTemplateType - v3 + 32 * v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  id v4 = [(PKDiscoveryCard *)&v7 description];
  [v3 appendFormat:@" %@ ", v4];

  [v3 appendFormat:@"%@: '%ld'; ", @"miniCardTemplateType", self->_miniCardTemplateType];
  [v3 appendFormat:@">"];
  objc_super v5 = (void *)[v3 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKMiniDiscoveryCard;
  id v4 = a3;
  [(PKDiscoveryCard *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_miniCardTemplateType, @"miniCardTemplateType", v5.receiver, v5.super_class);
}

- (PKMiniDiscoveryCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  objc_super v5 = [(PKDiscoveryCard *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_miniCardTemplateType = [v4 decodeIntegerForKey:@"miniCardTemplateType"];
  }

  return v5;
}

- (int64_t)miniCardTemplateType
{
  return self->_miniCardTemplateType;
}

@end