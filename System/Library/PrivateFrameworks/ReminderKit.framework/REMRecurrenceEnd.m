@interface REMRecurrenceEnd
+ (BOOL)supportsSecureCoding;
+ (id)recurrenceEndWithEndDate:(id)a3;
+ (id)recurrenceEndWithOccurrenceCount:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesEndDate;
- (NSDate)endDate;
- (REMRecurrenceEnd)initWithCoder:(id)a3;
- (REMRecurrenceEnd)initWithEndDate:(id)a3;
- (REMRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)occurrenceCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRecurrenceEnd

+ (id)recurrenceEndWithEndDate:(id)a3
{
  id v3 = a3;
  v4 = [[REMRecurrenceEnd alloc] initWithEndDate:v3];

  return v4;
}

+ (id)recurrenceEndWithOccurrenceCount:(unint64_t)a3
{
  id v3 = [[REMRecurrenceEnd alloc] initWithOccurrenceCount:a3];

  return v3;
}

- (REMRecurrenceEnd)initWithEndDate:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"endDate is nil"];
  }
  v11.receiver = self;
  v11.super_class = (Class)REMRecurrenceEnd;
  v5 = [(REMRecurrenceEnd *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v8 = [v6 dateWithTimeIntervalSinceReferenceDate:floor(v7)];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (REMRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3
{
  if (!a3)
  {
    v5 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[REMRecurrenceEnd initWithOccurrenceCount:](v5);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)REMRecurrenceEnd;
  result = [(REMRecurrenceEnd *)&v7 init];
  if (result) {
    result->_occurrenceCount = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRecurrenceEnd;
  v5 = [(REMRecurrenceEnd *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v6;

    v5->_occurrenceCount = [v4 decodeIntegerForKey:@"occurrenceCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(REMRecurrenceEnd *)self endDate];
  [v5 encodeObject:v4 forKey:@"endDate"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount"), @"occurrenceCount");
}

- (BOOL)usesEndDate
{
  v2 = [(REMRecurrenceEnd *)self endDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  BOOL v3 = [(REMRecurrenceEnd *)self endDate];

  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    uint64_t v6 = [(REMRecurrenceEnd *)self endDate];
    objc_super v7 = [v4 stringWithFormat:@"%@ %p { UNTIL=%@ } ", v5, self, v6];
  }
  else
  {
    objc_super v7 = [v4 stringWithFormat:@"%@ %p { COUNT=%lu }", v5, self, -[REMRecurrenceEnd occurrenceCount](self, "occurrenceCount")];
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(REMRecurrenceEnd *)self occurrenceCount];
  id v4 = [(REMRecurrenceEnd *)self endDate];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMRecurrenceEnd *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (unint64_t v6 = [(REMRecurrenceEnd *)self occurrenceCount],
          v6 == [(REMRecurrenceEnd *)v4 occurrenceCount]))
    {
      objc_super v7 = [(REMRecurrenceEnd *)self endDate];
      uint64_t v8 = [(REMRecurrenceEnd *)v4 endDate];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else if (v4)
      {
        objc_super v9 = [(REMRecurrenceEnd *)self endDate];
        v10 = [(REMRecurrenceEnd *)v4 endDate];
        char v11 = [v9 isEqualToDate:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)occurrenceCount
{
  return self->_occurrenceCount;
}

- (void).cxx_destruct
{
}

- (void)initWithOccurrenceCount:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_error_impl(&dword_1B9AA2000, a1, OS_LOG_TYPE_ERROR, "An REMRecurrenceEnd was created with an occurrence count of 0. %@", (uint8_t *)&v3, 0xCu);
}

@end