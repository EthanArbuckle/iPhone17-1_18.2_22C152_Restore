@interface REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)fromDate;
- (NSDate)toDate;
- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithCoder:(id)a3;
- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithFromDate:(id)a3 toDate:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithFromDate:(id)a3 toDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromDate, a3);
    objc_storeStrong((id *)&v10->_toDate, a4);
  }

  return v10;
}

- (REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"fromDate"];
  v6 = [v4 decodeObjectForKey:@"toDate"];

  id v7 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self initWithFromDate:v5 toDate:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self fromDate];
  [v4 encodeObject:v5 forKey:@"fromDate"];

  id v6 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self toDate];
  [v4 encodeObject:v6 forKey:@"toDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self fromDate];
  uint64_t v6 = [v4 fromDate];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self fromDate];
    v9 = [v4 fromDate];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self toDate];
  uint64_t v13 = [v4 toDate];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self toDate];
    v16 = [v4 toDate];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self fromDate];
  uint64_t v4 = [v3 hash];
  v5 = [(REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *)self toDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);

  objc_storeStrong((id *)&self->_fromDate, 0);
}

@end