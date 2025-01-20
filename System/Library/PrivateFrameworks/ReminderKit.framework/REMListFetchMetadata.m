@interface REMListFetchMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)incompleteReminderCounts;
- (REMListFetchMetadata)initWithCoder:(id)a3;
- (REMListFetchMetadata)initWithIncompleteReminderCounts:(id)a3 scheduledCount:(int64_t)a4;
- (int64_t)scheduledCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListFetchMetadata

- (REMListFetchMetadata)initWithIncompleteReminderCounts:(id)a3 scheduledCount:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMListFetchMetadata;
  v8 = [(REMListFetchMetadata *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_incompleteReminderCounts, a3);
    v9->_scheduledCount = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListFetchMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMListFetchMetadata;
  v5 = [(REMFetchMetadata *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"incompleteReminderCounts"];
    incompleteReminderCounts = v5->_incompleteReminderCounts;
    v5->_incompleteReminderCounts = (NSDictionary *)v10;

    v5->_scheduledCount = [v4 decodeIntegerForKey:@"scheduledCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMListFetchMetadata;
  id v4 = a3;
  [(REMFetchMetadata *)&v6 encodeWithCoder:v4];
  v5 = [(REMListFetchMetadata *)self incompleteReminderCounts];
  [v4 encodeObject:v5 forKey:@"incompleteReminderCounts"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListFetchMetadata scheduledCount](self, "scheduledCount"), @"scheduledCount");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMListFetchMetadata *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_super v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(REMListFetchMetadata *)self incompleteReminderCounts];
      uint64_t v8 = [(REMListFetchMetadata *)v6 incompleteReminderCounts];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        uint64_t v10 = [(REMListFetchMetadata *)self incompleteReminderCounts];
        objc_super v11 = [(REMListFetchMetadata *)v6 incompleteReminderCounts];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(REMListFetchMetadata *)self incompleteReminderCounts];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDictionary)incompleteReminderCounts
{
  return self->_incompleteReminderCounts;
}

- (int64_t)scheduledCount
{
  return self->_scheduledCount;
}

- (void).cxx_destruct
{
}

@end