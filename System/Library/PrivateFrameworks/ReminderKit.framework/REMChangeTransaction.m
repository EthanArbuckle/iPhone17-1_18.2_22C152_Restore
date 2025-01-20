@interface REMChangeTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)changes;
- (NSDate)timestamp;
- (NSString)author;
- (NSString)storeID;
- (REMChangeToken)token;
- (REMChangeTransaction)initWithCoder:(id)a3;
- (REMObjectID)accountID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMChangeTransaction

+ (BOOL)supportsSecureCoding
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = objc_opt_class();
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"Abstract method called -[%@ %@]", v6, v7 format];
}

- (REMChangeTransaction)initWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v7, v8 format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (REMChangeTransaction *)a3;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v8, v9 format];

  return self == v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSArray)changes
{
  return self->_changes;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (NSString)author
{
  return self->_author;
}

- (REMChangeToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_changes, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end