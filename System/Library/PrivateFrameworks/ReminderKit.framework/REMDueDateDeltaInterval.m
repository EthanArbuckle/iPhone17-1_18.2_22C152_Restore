@interface REMDueDateDeltaInterval
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (REMDueDateDeltaInterval)initWithCoder:(id)a3;
- (REMDueDateDeltaInterval)initWithUnit:(int64_t)a3 count:(int64_t)a4;
- (REMDueDateDeltaInterval)initWithUnitInteger:(int64_t)a3 count:(int64_t)a4;
- (id)addedTo:(id)a3;
- (id)description;
- (id)inverted;
- (int64_t)count;
- (int64_t)unit;
- (unint64_t)hash;
- (void)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMDueDateDeltaInterval

- (REMDueDateDeltaInterval)initWithUnit:(int64_t)a3 count:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REMDueDateDeltaInterval;
  result = [(REMDueDateDeltaInterval *)&v7 init];
  if (result)
  {
    result->_unit = a3;
    result->_count = a4;
  }
  return result;
}

- (REMDueDateDeltaInterval)initWithUnitInteger:(int64_t)a3 count:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)REMDueDateDeltaInterval;
  v6 = [(REMDueDateDeltaInterval *)&v12 init];
  objc_super v7 = v6;
  if ((unint64_t)a3 <= 4 && v6)
  {
    if ((unint64_t)(a3 - 1) >= 4) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = a3;
    }
    v6->_unit = v8;
    v6->_count = a4;
    v9 = v6;
  }
  else
  {
    v10 = +[REMLog utility];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaInterval initWithUnitInteger:count:]();
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)isEmpty
{
  return [(REMDueDateDeltaInterval *)self count] == 0;
}

- (id)addedTo:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  switch([(REMDueDateDeltaInterval *)self unit])
  {
    case 0:
      objc_msgSend(v5, "setMinute:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    case 1:
      objc_msgSend(v5, "setHour:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    case 2:
      int64_t v7 = [(REMDueDateDeltaInterval *)self count];
      goto LABEL_9;
    case 3:
      int64_t v7 = 7 * [(REMDueDateDeltaInterval *)self count];
LABEL_9:
      [v5 setDay:v7];
      break;
    case 4:
      objc_msgSend(v5, "setMonth:", -[REMDueDateDeltaInterval count](self, "count"));
      break;
    default:
      v6 = +[REMLog utility];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[REMDueDateDeltaInterval addedTo:](self, v6);
      }

      break;
  }
  int64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 dateByAddingComponents:v5 toDate:v4 options:0];
  v10 = v9;
  if (!v9)
  {
    v11 = +[REMLog utility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      [(REMDueDateDeltaInterval *)v8 addedTo:v11];
    }

    v10 = v4;
  }
  id v12 = v10;

  return v12;
}

- (id)inverted
{
  v2 = -[REMDueDateDeltaInterval initWithUnit:count:]([REMDueDateDeltaInterval alloc], "initWithUnit:count:", -[REMDueDateDeltaInterval unit](self, "unit"), -[(REMDueDateDeltaInterval *)self count]);

  return v2;
}

- (id)description
{
  unint64_t unit = self->_unit;
  if (unit >= 5)
  {
    id v5 = +[REMLog utility];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(REMDueDateDeltaInterval *)self description];
    }

    id v4 = @"ERROR-UNIT";
  }
  else
  {
    id v4 = off_1E61DDB18[unit];
  }
  v6 = [NSString stringWithFormat:@"%ld%@", self->_count, v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = REMDynamicCast(v5, (uint64_t)v4);

  int64_t v7 = [(REMDueDateDeltaInterval *)self count];
  if (v7 == [v6 count])
  {
    int64_t v8 = [(REMDueDateDeltaInterval *)self unit];
    BOOL v9 = v8 == [v6 unit];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t count = self->_count;
  uint64_t v3 = ((unint64_t)count >> 36) & 0x8000000 | (self->_unit << 28);
  if (count >= 0) {
    LODWORD(v4) = count;
  }
  else {
    int64_t v4 = -count;
  }
  return v3 & 0xFFFFFFFFFC000000 | v4 & 0x3FFFFFF;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDueDateDeltaInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"unit"];
  unint64_t v6 = v5;
  if (v5 >= 5)
  {
    int64_t v8 = +[REMLog utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMDueDateDeltaInterval initWithCoder:]();
    }

    int64_t v7 = 0;
  }
  else
  {
    if (v5 - 1 >= 4) {
      unint64_t v6 = 0;
    }
    self = -[REMDueDateDeltaInterval initWithUnit:count:](self, "initWithUnit:count:", v6, (int)[v4 decodeIntForKey:@"count"]);
    int64_t v7 = self;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMDueDateDeltaInterval unit](self, "unit"), @"unit");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMDueDateDeltaInterval count](self, "count"), @"count");
}

- (int64_t)unit
{
  return self->_unit;
}

- (int64_t)count
{
  return self->_count;
}

- (void)initWithUnitInteger:count:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, v0, v1, "-[REMDueDateDeltaInterval initWithUnitInteger:count:] failed: either [super init] failed or {unit: %ld} is invalid", v2);
}

- (void)addedTo:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a1 description];
  unint64_t v6 = [a2 description];
  int v7 = 138543618;
  int64_t v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "-[REMDueDateDeltaInterval addedTo:] failed during call to -[NSCalendar dateByAddingComponents:toDate:options:] {currentCalendar: %{public}@, self: %@}", (uint8_t *)&v7, 0x16u);
}

- (void)addedTo:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 unit];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, a2, v3, "-[REMDueDateDeltaInterval addedTo:] called with invalid self.unit {unit: %ld}", v4);
}

- (void)description
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 unit];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, a2, v3, "-[REMDueDateDeltaInterval description:] called with invalid self.unit {unit: %ld}", v4);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_5(&dword_1B9AA2000, v0, v1, "-[REMDueDateDeltaInterval initWithCoder:] failed due to invalid unit: %ld", v2);
}

@end