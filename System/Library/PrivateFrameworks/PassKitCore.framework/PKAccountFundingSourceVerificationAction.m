@interface PKAccountFundingSourceVerificationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)verificationOptions;
- (PKAccountFundingSourceVerificationAction)initWithCoder:(id)a3;
- (PKAccountFundingSourceVerificationAction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setVerificationOptions:(id)a3;
@end

@implementation PKAccountFundingSourceVerificationAction

- (PKAccountFundingSourceVerificationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountFundingSourceVerificationAction;
  v5 = [(PKAccountFundingSourceVerificationAction *)&v11 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKAccountFundingSourceVerificationActionTypeFromString(v6);

    v7 = [v4 PKArrayContaining:objc_opt_class() forKey:@"options"];
    uint64_t v8 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_166);
    verificationOptions = v5->_verificationOptions;
    v5->_verificationOptions = (NSArray *)v8;
  }
  return v5;
}

uint64_t __63__PKAccountFundingSourceVerificationAction_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = PKApplyVerificationTypeFromString(a2);
  return [v2 numberWithUnsignedInteger:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerificationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountFundingSourceVerificationAction;
  v5 = [(PKAccountFundingSourceVerificationAction *)&v12 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"options"];
    verificationOptions = v5->_verificationOptions;
    v5->_verificationOptions = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_verificationOptions forKey:@"options"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  verificationOptions = self->_verificationOptions;
  v6 = (NSArray *)v4[2];
  if (!verificationOptions || !v6)
  {
    if (verificationOptions == v6) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if ((-[NSArray isEqual:](verificationOptions, "isEqual:") & 1) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v7 = self->_type == v4[1];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_verificationOptions];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t type = self->_type;
  if (type > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E56EF130[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  [v4 appendFormat:@"verificationOptions: '%@'; ", self->_verificationOptions];
  [v4 appendFormat:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKAccountFundingSourceVerificationAction allocWithZone:](PKAccountFundingSourceVerificationAction, "allocWithZone:") init];
  v5->_unint64_t type = self->_type;
  uint64_t v6 = [(NSArray *)self->_verificationOptions copyWithZone:a3];
  verificationOptions = v5->_verificationOptions;
  v5->_verificationOptions = (NSArray *)v6;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSArray)verificationOptions
{
  return self->_verificationOptions;
}

- (void)setVerificationOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end