@interface PKAccountReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (PKAccountReport)initWithAccountIdentifier:(id)a3 reportType:(unint64_t)a4;
- (PKAccountReport)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)reportType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountReport

- (PKAccountReport)initWithAccountIdentifier:(id)a3 reportType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountReport;
  v8 = [(PKAccountReport *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_reportType = a4;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  unint64_t reportType = self->_reportType;
  if (reportType > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56E0358[reportType];
  }
  [v3 safelySetObject:v6 forKey:@"reportType"];
  [v4 safelySetObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  id v7 = (void *)[v4 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountReport;
  v5 = [(PKAccountReport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v5->_unint64_t reportType = [v4 decodeIntegerForKey:@"reportType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_reportType forKey:@"reportType"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v5 = (void *)v4[1];
  uint64_t v6 = self->_accountIdentifier;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_10;
    }
  }
  BOOL v10 = self->_reportType == v4[2];
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_accountIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_reportType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  unint64_t reportType = self->_reportType;
  if (reportType > 2) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56E0358[reportType];
  }
  [v3 appendFormat:@"reportType: '%@'; ", v5];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_reportType;
  return v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)reportType
{
  return self->_reportType;
}

- (void).cxx_destruct
{
}

@end