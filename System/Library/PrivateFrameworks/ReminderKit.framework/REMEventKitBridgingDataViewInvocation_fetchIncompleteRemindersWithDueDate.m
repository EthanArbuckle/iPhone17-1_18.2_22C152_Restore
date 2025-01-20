@interface REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)listIDs;
- (NSDate)endDate;
- (NSDate)startDate;
- (REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate)initWithCoder:(id)a3;
- (REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate)initWithListIDs:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate)initWithListIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate;
  v12 = [(REMStoreInvocationValueStorage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listIDs, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

- (REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"listIDs"];

  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];

  id v11 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self initWithListIDs:v8 startDate:v9 endDate:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self listIDs];
  [v4 encodeObject:v5 forKey:@"listIDs"];

  uint64_t v6 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self startDate];
  [v4 encodeObject:v6 forKey:@"startDate"];

  id v7 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self endDate];
  [v4 encodeObject:v7 forKey:@"endDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v5 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self listIDs];
  uint64_t v6 = [v4 listIDs];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    v8 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self listIDs];
    id v9 = [v4 listIDs];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  id v11 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self startDate];
  uint64_t v12 = [v4 startDate];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self startDate];
    objc_super v15 = [v4 startDate];
    int v16 = [v14 isEqual:v15];

    if (!v16)
    {
LABEL_8:
      char v17 = 0;
      goto LABEL_14;
    }
  }
  v18 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self endDate];
  uint64_t v19 = [v4 endDate];
  if (v18 == (void *)v19)
  {
    char v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self endDate];
    v22 = [v4 endDate];
    char v17 = [v21 isEqual:v22];
  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  v3 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self listIDs];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self startDate];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMEventKitBridgingDataViewInvocation_fetchIncompleteRemindersWithDueDate *)self endDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSArray)listIDs
{
  return self->_listIDs;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_listIDs, 0);
}

@end