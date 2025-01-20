@interface PKAccountFundingSourceVerification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)options;
- (NSArray)recoveryActions;
- (PKAccountFundingSourceVerification)initWithCoder:(id)a3;
- (PKAccountFundingSourceVerification)initWithDictionary:(id)a3;
- (PKAccountFundingSourceVerificationAttempt)failedAttempt;
- (PKAccountFundingSourceVerificationAttempt)pendingAttempt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setFailedAttempt:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPendingAttempt:(id)a3;
- (void)setRecoveryActions:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKAccountFundingSourceVerification

- (PKAccountFundingSourceVerification)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountFundingSourceVerification;
  v5 = [(PKAccountFundingSourceVerification *)&v31 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"status"];
    v5->_status = PKAccountFundingSourceVerificationStatusFromString(v6);

    v7 = [v4 PKArrayContaining:objc_opt_class() forKey:@"options"];
    uint64_t v8 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_158_0);
    options = v5->_options;
    v5->_options = (NSArray *)v8;

    v10 = [v4 PKDictionaryForKey:@"pendingAttempt"];
    if ([v10 count])
    {
      v11 = [[PKAccountFundingSourceVerificationAttempt alloc] initWithDictionary:v10];
      pendingAttempt = v5->_pendingAttempt;
      v5->_pendingAttempt = v11;
    }
    v13 = [v4 PKDictionaryForKey:@"failedAttempt"];
    if ([v13 count])
    {
      v14 = [[PKAccountFundingSourceVerificationAttempt alloc] initWithDictionary:v13];
      failedAttempt = v5->_failedAttempt;
      v5->_failedAttempt = v14;
    }
    v16 = [v4 PKArrayContaining:objc_opt_class() forKey:@"recoveryActions"];
    if ([v16 count])
    {
      v25 = v13;
      v26 = v10;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v16;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[PKAccountFundingSourceVerificationAction alloc] initWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * v22)];
            [v17 addObject:v23];

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v20);
      }

      [(PKAccountFundingSourceVerification *)v5 setRecoveryActions:v17];
      v13 = v25;
      v10 = v26;
    }
  }
  return v5;
}

uint64_t __57__PKAccountFundingSourceVerification_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = PKApplyVerificationTypeFromString(a2);
  return [v2 numberWithUnsignedInteger:v3];
}

- (void)setRecoveryActions:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_162_2];
  recoveryActions = self->_recoveryActions;
  self->_recoveryActions = v4;
}

uint64_t __57__PKAccountFundingSourceVerification_setRecoveryActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 hash];
  unint64_t v6 = [v4 hash];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerification)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountFundingSourceVerification;
  unint64_t v5 = [(PKAccountFundingSourceVerification *)&v21 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingAttempt"];
    pendingAttempt = v5->_pendingAttempt;
    v5->_pendingAttempt = (PKAccountFundingSourceVerificationAttempt *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failedAttempt"];
    failedAttempt = v5->_failedAttempt;
    v5->_failedAttempt = (PKAccountFundingSourceVerificationAttempt *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"recoveryActions"];
    recoveryActions = v5->_recoveryActions;
    v5->_recoveryActions = (NSArray *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t status = self->_status;
  id v5 = a3;
  [v5 encodeInteger:status forKey:@"status"];
  [v5 encodeObject:self->_options forKey:@"options"];
  [v5 encodeObject:self->_pendingAttempt forKey:@"pendingAttempt"];
  [v5 encodeObject:self->_failedAttempt forKey:@"failedAttempt"];
  [v5 encodeObject:self->_recoveryActions forKey:@"recoveryActions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_22;
  }
  options = self->_options;
  unint64_t v6 = (NSArray *)v4[2];
  if (options && v6)
  {
    if ((-[NSArray isEqual:](options, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (options != v6)
  {
    goto LABEL_22;
  }
  pendingAttempt = self->_pendingAttempt;
  uint64_t v8 = (PKAccountFundingSourceVerificationAttempt *)v4[3];
  if (pendingAttempt && v8)
  {
    if (!-[PKAccountFundingSourceVerificationAttempt isEqual:](pendingAttempt, "isEqual:")) {
      goto LABEL_22;
    }
  }
  else if (pendingAttempt != v8)
  {
    goto LABEL_22;
  }
  failedAttempt = self->_failedAttempt;
  v10 = (PKAccountFundingSourceVerificationAttempt *)v4[4];
  if (failedAttempt && v10)
  {
    if (!-[PKAccountFundingSourceVerificationAttempt isEqual:](failedAttempt, "isEqual:")) {
      goto LABEL_22;
    }
  }
  else if (failedAttempt != v10)
  {
    goto LABEL_22;
  }
  recoveryActions = self->_recoveryActions;
  v12 = (NSArray *)v4[5];
  if (!recoveryActions || !v12)
  {
    if (recoveryActions == v12) {
      goto LABEL_20;
    }
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](recoveryActions, "isEqual:") & 1) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  BOOL v13 = self->_status == v4[1];
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_options];
  [v3 safelyAddObject:self->_pendingAttempt];
  [v3 safelyAddObject:self->_failedAttempt];
  [v3 safelyAddObject:self->_recoveryActions];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t status = self->_status;
  if (status > 4) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = off_1E56EF148[status];
  }
  [v3 appendFormat:@"status: '%@'; ", v6];
  [v4 appendFormat:@"options: '%@'; ", self->_options];
  [v4 appendFormat:@"pendingAttempt: '%@'; ", self->_pendingAttempt];
  [v4 appendFormat:@"failedAttempt: '%@'; ", self->_failedAttempt];
  [v4 appendFormat:@"recoveryActions: '%@'; ", self->_recoveryActions];
  [v4 appendFormat:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKAccountFundingSourceVerification allocWithZone:](PKAccountFundingSourceVerification, "allocWithZone:") init];
  v5->_unint64_t status = self->_status;
  uint64_t v6 = [(NSArray *)self->_options copyWithZone:a3];
  options = v5->_options;
  v5->_options = (NSArray *)v6;

  uint64_t v8 = [(PKAccountFundingSourceVerificationAttempt *)self->_pendingAttempt copyWithZone:a3];
  pendingAttempt = v5->_pendingAttempt;
  v5->_pendingAttempt = v8;

  v10 = [(PKAccountFundingSourceVerificationAttempt *)self->_failedAttempt copyWithZone:a3];
  failedAttempt = v5->_failedAttempt;
  v5->_failedAttempt = v10;

  uint64_t v12 = [(NSArray *)self->_recoveryActions copyWithZone:a3];
  recoveryActions = v5->_recoveryActions;
  v5->_recoveryActions = (NSArray *)v12;

  return v5;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (PKAccountFundingSourceVerificationAttempt)pendingAttempt
{
  return self->_pendingAttempt;
}

- (void)setPendingAttempt:(id)a3
{
}

- (PKAccountFundingSourceVerificationAttempt)failedAttempt
{
  return self->_failedAttempt;
}

- (void)setFailedAttempt:(id)a3
{
}

- (NSArray)recoveryActions
{
  return self->_recoveryActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryActions, 0);
  objc_storeStrong((id *)&self->_failedAttempt, 0);
  objc_storeStrong((id *)&self->_pendingAttempt, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end