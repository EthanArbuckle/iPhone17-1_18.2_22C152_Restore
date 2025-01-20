@interface PKTransactionReleasedDataElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReleasedDataElement:(id)a3;
- (NSString)elementNamespace;
- (NSString)identifier;
- (PKTransactionReleasedDataElement)initWithCoder:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)retentionPeriod;
- (unint64_t)hash;
- (unint64_t)retentionIntent;
- (void)encodeWithCoder:(id)a3;
- (void)setElementNamespace:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRetentionIntent:(unint64_t)a3;
- (void)setRetentionPeriod:(int64_t)a3;
@end

@implementation PKTransactionReleasedDataElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReleasedDataElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReleasedDataElement;
  v5 = [(PKTransactionReleasedDataElement *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"elementNamespace"];
    elementNamespace = v5->_elementNamespace;
    v5->_elementNamespace = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v5->_retentionIntent = [v4 decodeIntegerForKey:@"retentionIntent"];
    v5->_retentionPeriod = [v4 decodeIntegerForKey:@"retentionPeriod"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  elementNamespace = self->_elementNamespace;
  id v5 = a3;
  [v5 encodeObject:elementNamespace forKey:@"elementNamespace"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_retentionIntent forKey:@"retentionIntent"];
  [v5 encodeInteger:self->_retentionPeriod forKey:@"retentionPeriod"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_elementNamespace];
  [v3 safelyAddObject:self->_identifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_retentionIntent - v4 + 32 * v4;
  unint64_t v6 = self->_retentionPeriod - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKTransactionReleasedDataElement *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReleasedDataElement *)self isEqualToReleasedDataElement:v5];

  return v6;
}

- (BOOL)isEqualToReleasedDataElement:(id)a3
{
  uint64_t v4 = a3;
  elementNamespace = self->_elementNamespace;
  BOOL v6 = (NSString *)v4[1];
  if (elementNamespace) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (elementNamespace != v6) {
      goto LABEL_16;
    }
  }
  else if ((-[NSString isEqual:](elementNamespace, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  identifier = self->_identifier;
  v9 = (NSString *)v4[2];
  if (!identifier || !v9)
  {
    if (identifier == v9) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  if (self->_retentionIntent != v4[3]) {
    goto LABEL_16;
  }
  BOOL v10 = self->_retentionPeriod == v4[4];
LABEL_17:

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"namespace: '%@'; ", self->_elementNamespace];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"retention: '%lu'; ", self->_retentionIntent);
  objc_msgSend(v3, "appendFormat:", @"retentionPeriod: '%lu'; ", self->_retentionPeriod);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  elementNamespace = self->_elementNamespace;
  identifier = self->_identifier;
  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_retentionIntent];
  BOOL v7 = [NSNumber numberWithInteger:self->_retentionPeriod];
  uint64_t v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", elementNamespace, @"namespace", identifier, @"identifier", v6, @"retentionIntent", v7, @"retentionPeriod", 0);

  return v8;
}

- (NSString)elementNamespace
{
  return self->_elementNamespace;
}

- (void)setElementNamespace:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)retentionIntent
{
  return self->_retentionIntent;
}

- (void)setRetentionIntent:(unint64_t)a3
{
  self->_retentionIntent = a3;
}

- (int64_t)retentionPeriod
{
  return self->_retentionPeriod;
}

- (void)setRetentionPeriod:(int64_t)a3
{
  self->_retentionPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementNamespace, 0);
}

@end