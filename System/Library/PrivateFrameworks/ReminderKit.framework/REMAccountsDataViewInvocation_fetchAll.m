@interface REMAccountsDataViewInvocation_fetchAll
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMAccountsDataViewInvocation_fetchAll)initWithCoder:(id)a3;
- (REMAccountsDataViewInvocation_fetchAll)initWithPurpose:(int64_t)a3;
- (int64_t)purpose;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAccountsDataViewInvocation_fetchAll

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchAll)initWithPurpose:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchAll;
  result = [(REMStoreInvocationValueStorage *)&v5 init];
  if (result) {
    result->_purpose = a3;
  }
  return result;
}

- (REMAccountsDataViewInvocation_fetchAll)initWithCoder:(id)a3
{
  unint64_t v4 = [a3 decodeIntegerForKey:@"purpose"];
  if (v4 >= 3)
  {
    objc_super v5 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[REMAccountsDataViewInvocation_fetchAll initWithCoder:](v4, v5);
    }

    unint64_t v4 = 0;
  }
  return [(REMAccountsDataViewInvocation_fetchAll *)self initWithPurpose:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountsDataViewInvocation_fetchAll purpose](self, "purpose"), @"purpose");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(REMAccountsDataViewInvocation_fetchAll *)self purpose];
    BOOL v6 = v5 == [v4 purpose];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAccountsDataViewInvocation_fetchAll_purpose %ld", (uint8_t *)&v2, 0xCu);
}

@end