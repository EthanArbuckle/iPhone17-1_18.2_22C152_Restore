@interface PKDiscoverySpacerShelf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKDiscoverySpacerShelf)initWithCoder:(id)a3;
- (PKDiscoverySpacerShelf)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)spacerType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDiscoverySpacerShelf

- (PKDiscoverySpacerShelf)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDiscoverySpacerShelf;
  v5 = [(PKDiscoverySpacerShelf *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(PKDiscoveryShelf *)v5 setType:3];
    id v7 = [v4 PKStringForKey:@"type"];
    if ([@"cardSpacerA" isEqualToString:v7])
    {
      uint64_t v8 = 1;
    }
    else if ([@"cardSpacerB" isEqualToString:v7])
    {
      uint64_t v8 = 2;
    }
    else if ([@"cardSpacerC" isEqualToString:v7])
    {
      uint64_t v8 = 3;
    }
    else if ([@"cardSpacerD" isEqualToString:v7])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    v6->_spacerType = v8;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelf;
  BOOL v5 = [(PKDiscoveryShelf *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_spacerType == v4[4];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoverySpacerShelf;
  unint64_t v3 = [(PKDiscoveryShelf *)&v5 hash];
  return self->_spacerType - v3 + 32 * v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%ld'; ", @"type", self->_spacerType];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoverySpacerShelf;
  id v4 = a3;
  [(PKDiscoveryShelf *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_spacerType, @"type", v5.receiver, v5.super_class);
}

- (PKDiscoverySpacerShelf)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelf;
  objc_super v5 = [(PKDiscoveryShelf *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_spacerType = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (int64_t)spacerType
{
  return self->_spacerType;
}

@end