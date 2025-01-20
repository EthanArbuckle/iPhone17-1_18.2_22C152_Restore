@interface REMReminderSortDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)sortDescriptorSortingByCreationDateAscending:(BOOL)a3;
+ (id)sortDescriptorSortingByDueDateAscending:(BOOL)a3;
+ (id)sortDescriptorSortingByOrderingInListAscending:(BOOL)a3;
+ (id)sortDescriptorSortingByPriorityAscending:(BOOL)a3;
+ (id)sortDescriptorSortingByTitleAscending:(BOOL)a3;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (REMReminderSortDescriptor)initWithCoder:(id)a3;
- (REMReminderSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMReminderSortDescriptor

- (REMReminderSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminderSortDescriptor;
  result = [(REMReminderSortDescriptor *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_ascending = a4;
  }
  return result;
}

+ (id)sortDescriptorSortingByTitleAscending:(BOOL)a3
{
  v3 = [[REMReminderSortDescriptor alloc] initWithType:0 ascending:a3];

  return v3;
}

+ (id)sortDescriptorSortingByCreationDateAscending:(BOOL)a3
{
  v3 = [[REMReminderSortDescriptor alloc] initWithType:1 ascending:a3];

  return v3;
}

+ (id)sortDescriptorSortingByDueDateAscending:(BOOL)a3
{
  v3 = [[REMReminderSortDescriptor alloc] initWithType:2 ascending:a3];

  return v3;
}

+ (id)sortDescriptorSortingByPriorityAscending:(BOOL)a3
{
  v3 = [[REMReminderSortDescriptor alloc] initWithType:3 ascending:a3];

  return v3;
}

+ (id)sortDescriptorSortingByOrderingInListAscending:(BOOL)a3
{
  v3 = [[REMReminderSortDescriptor alloc] initWithType:4 ascending:a3];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderSortDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if (v5 >= 5)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[REMReminderSortDescriptor initWithCoder:](v5, v6);
    }

    unint64_t v5 = 1;
  }
  objc_super v7 = -[REMReminderSortDescriptor initWithType:ascending:](self, "initWithType:ascending:", v5, [v4 decodeBoolForKey:@"ascending"]);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMReminderSortDescriptor type](self, "type"), @"type");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderSortDescriptor ascending](self, "ascending"), @"ascending");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReminderSortDescriptor *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v7 = [(REMReminderSortDescriptor *)self type], v7 == [(REMReminderSortDescriptor *)v6 type]))
    {
      BOOL v8 = [(REMReminderSortDescriptor *)self ascending];
      BOOL v9 = v8 ^ [(REMReminderSortDescriptor *)v6 ascending] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
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
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMReminderSortDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end