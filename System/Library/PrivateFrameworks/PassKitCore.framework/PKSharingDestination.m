@interface PKSharingDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKSharingDestination)initWithCoder:(id)a3;
- (PKSharingDestination)initWithDestinationIdentifier:(id)a3;
- (id)_name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)idsDestination;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingDestination

- (PKSharingDestination)initWithDestinationIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingDestination;
  v6 = [(PKSharingDestination *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_destinationIdentifier, a3);
  }

  return v7;
}

- (id)idsDestination
{
  destinationIdentifier = self->_destinationIdentifier;
  v3 = [(PKSharingDestination *)self _name];
  v4 = +[PKIDSDestination destinationWithDeviceIdentifier:destinationIdentifier name:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharingDestination;
  id v5 = [(PKSharingDestination *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationIdentifier"];
    destinationIdentifier = v5->_destinationIdentifier;
    v5->_destinationIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_destinationIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_destinationIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (NSString **)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    BOOL v6 = self->_destinationIdentifier == v4[1];
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"destinationIdentifier: '%@'; ", self->_destinationIdentifier];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)_name
{
  destinationIdentifier = self->_destinationIdentifier;
  if (destinationIdentifier)
  {
    int v4 = [destinationIdentifier hasPrefix:@"mailto:"];
    id v5 = self->_destinationIdentifier;
    if (v4)
    {
      BOOL v6 = @"mailto:";
LABEL_6:
      uint64_t v7 = [(NSString *)v5 rangeOfString:v6];
      destinationIdentifier = -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self->_destinationIdentifier, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1EE0F5368, 0, v7, v8);
      goto LABEL_8;
    }
    if ([(NSString *)v5 hasPrefix:@"tel:"])
    {
      id v5 = self->_destinationIdentifier;
      BOOL v6 = @"tel:";
      goto LABEL_6;
    }
    destinationIdentifier = 0;
  }
LABEL_8:
  return destinationIdentifier;
}

- (void).cxx_destruct
{
}

@end