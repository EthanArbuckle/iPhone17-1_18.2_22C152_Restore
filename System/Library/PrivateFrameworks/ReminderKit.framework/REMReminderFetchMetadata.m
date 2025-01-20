@interface REMReminderFetchMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)dueDateCounts;
- (NSDictionary)subtaskCounts;
- (REMReminderFetchMetadata)initWithCoder:(id)a3;
- (REMReminderFetchMetadata)initWithDueDateCounts:(id)a3;
- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3;
- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3 dueDateCounts:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMReminderFetchMetadata

- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadata;
  v6 = [(REMReminderFetchMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subtaskCounts, a3);
  }

  return v7;
}

- (REMReminderFetchMetadata)initWithDueDateCounts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFetchMetadata;
  v6 = [(REMReminderFetchMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dueDateCounts, a3);
  }

  return v7;
}

- (REMReminderFetchMetadata)initWithSubtaskCounts:(id)a3 dueDateCounts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMReminderFetchMetadata;
  objc_super v9 = [(REMReminderFetchMetadata *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subtaskCounts, a3);
    objc_storeStrong((id *)&v10->_dueDateCounts, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REMReminderFetchMetadata;
  id v5 = [(REMFetchMetadata *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"subtaskCounts"];
    subtaskCounts = v5->_subtaskCounts;
    v5->_subtaskCounts = (NSDictionary *)v10;

    objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"dueDateCounts"];
    dueDateCounts = v5->_dueDateCounts;
    v5->_dueDateCounts = (NSArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchMetadata;
  id v4 = a3;
  [(REMFetchMetadata *)&v7 encodeWithCoder:v4];
  id v5 = [(REMReminderFetchMetadata *)self subtaskCounts];
  [v4 encodeObject:v5 forKey:@"subtaskCounts"];

  v6 = [(REMReminderFetchMetadata *)self dueDateCounts];
  [v4 encodeObject:v6 forKey:@"dueDateCounts"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReminderFetchMetadata *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(REMReminderFetchMetadata *)self subtaskCounts];
      uint64_t v8 = [(REMReminderFetchMetadata *)v6 subtaskCounts];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        objc_super v9 = (void *)v8;
        uint64_t v10 = [(REMReminderFetchMetadata *)self subtaskCounts];
        v11 = [(REMReminderFetchMetadata *)v6 subtaskCounts];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(REMReminderFetchMetadata *)self dueDateCounts];
      uint64_t v15 = [(REMReminderFetchMetadata *)v6 dueDateCounts];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMReminderFetchMetadata *)self dueDateCounts];
        objc_super v18 = [(REMReminderFetchMetadata *)v6 dueDateCounts];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMReminderFetchMetadata *)self subtaskCounts];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDictionary)subtaskCounts
{
  return self->_subtaskCounts;
}

- (NSArray)dueDateCounts
{
  return self->_dueDateCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateCounts, 0);

  objc_storeStrong((id *)&self->_subtaskCounts, 0);
}

@end