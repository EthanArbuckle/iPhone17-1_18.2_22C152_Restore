@interface REMChangeToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMChangeToken)initWithCoder:(id)a3;
- (int64_t)compareToken:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMChangeToken

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v6 raise:v7, @"Abstract method called -[%@ %@]", v8, v9 format];

  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:0];
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (REMChangeToken *)a3;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v8, v9 format];

  return self == v7;
}

+ (BOOL)supportsSecureCoding
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (REMChangeToken)initWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v7, v8 format];

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

@end