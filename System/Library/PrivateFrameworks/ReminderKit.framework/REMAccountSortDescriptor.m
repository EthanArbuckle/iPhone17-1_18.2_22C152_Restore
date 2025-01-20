@interface REMAccountSortDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (REMAccountSortDescriptor)initWithCoder:(id)a3;
- (REMAccountSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAccountSortDescriptor

- (REMAccountSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REMAccountSortDescriptor;
  result = [(REMAccountSortDescriptor *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_ascending = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountSortDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_super v7 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMAccountSortDescriptor initWithCoder:](v6, v7);
    }
  }
  v8 = -[REMAccountSortDescriptor initWithType:ascending:](self, "initWithType:ascending:", 0, [v4 decodeBoolForKey:@"ascending"]);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountSortDescriptor type](self, "type"), @"type");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountSortDescriptor ascending](self, "ascending"), @"ascending");
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAccountSortDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end