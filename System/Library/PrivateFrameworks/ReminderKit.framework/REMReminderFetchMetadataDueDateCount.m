@interface REMReminderFetchMetadataDueDateCount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)dueDate;
- (REMReminderFetchMetadataDueDateCount)initWithCoder:(id)a3;
- (REMReminderFetchMetadataDueDateCount)initWithDueDate:(id)a3 count:(int64_t)a4;
- (int64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMReminderFetchMetadataDueDateCount

- (REMReminderFetchMetadataDueDateCount)initWithDueDate:(id)a3 count:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMReminderFetchMetadataDueDateCount;
  v8 = [(REMReminderFetchMetadataDueDateCount *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dueDate, a3);
    v9->_count = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchMetadataDueDateCount)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadataDueDateCount;
  v5 = [(REMReminderFetchMetadataDueDateCount *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v6;

    v5->_count = [v4 decodeIntegerForKey:@"count"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(REMReminderFetchMetadataDueDateCount *)self dueDate];
  [v5 encodeObject:v4 forKey:@"dueDate"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[REMReminderFetchMetadataDueDateCount count](self, "count"), @"count");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReminderFetchMetadataDueDateCount *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMReminderFetchMetadataDueDateCount *)self dueDate];
      uint64_t v8 = [(REMReminderFetchMetadataDueDateCount *)v6 dueDate];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        objc_super v9 = (void *)v8;
        v10 = [(REMReminderFetchMetadataDueDateCount *)self dueDate];
        objc_super v11 = [(REMReminderFetchMetadataDueDateCount *)v6 dueDate];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      int64_t v14 = [(REMReminderFetchMetadataDueDateCount *)self count];
      BOOL v13 = v14 == [(REMReminderFetchMetadataDueDateCount *)v6 count];
      goto LABEL_9;
    }
LABEL_5:
    BOOL v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(REMReminderFetchMetadataDueDateCount *)self dueDate];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(REMReminderFetchMetadataDueDateCount *)self count] + v4;

  return v5;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end