@interface REMRemindersDataViewInvocation_fetchByParentReminderID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMObjectID)accountID;
- (REMObjectID)parentReminderID;
- (REMReminderFetchOptions)reminderFetchOptions;
- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithParentReminderID:(id)a3 accountID:(id)a4 subtaskFetchOption:(int64_t)a5 reminderFetchOptions:(id)a6;
- (int64_t)subtaskFetchOption;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchByParentReminderID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithParentReminderID:(id)a3 accountID:(id)a4 subtaskFetchOption:(int64_t)a5 reminderFetchOptions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)REMRemindersDataViewInvocation_fetchByParentReminderID;
  v14 = [(REMStoreInvocationValueStorage *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_parentReminderID, a3);
    objc_storeStrong((id *)&v15->_accountID, a4);
    v15->_subtaskFetchOption = a5;
    objc_storeStrong((id *)&v15->_reminderFetchOptions, a6);
  }

  return v15;
}

- (REMRemindersDataViewInvocation_fetchByParentReminderID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentReminderID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"subtaskFetchOption"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderFetchOptions"];

  if (v5)
  {
    self = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self initWithParentReminderID:v5 accountID:v6 subtaskFetchOption:v7 reminderFetchOptions:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self parentReminderID];
  [v4 encodeObject:v5 forKey:@"parentReminderID"];

  v6 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self accountID];
  [v4 encodeObject:v6 forKey:@"accountID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRemindersDataViewInvocation_fetchByParentReminderID subtaskFetchOption](self, "subtaskFetchOption"), @"subtaskFetchOption");
  id v7 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self reminderFetchOptions];
  [v4 encodeObject:v7 forKey:@"reminderFetchOptions"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  v5 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self parentReminderID];
  uint64_t v6 = [v4 parentReminderID];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    v8 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self parentReminderID];
    v9 = [v4 parentReminderID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_13;
    }
  }
  id v11 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self accountID];
  uint64_t v12 = [v4 accountID];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    id v13 = (void *)v12;
    v14 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self accountID];
    v15 = [v4 accountID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_13;
    }
  }
  int64_t v17 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self subtaskFetchOption];
  if (v17 != [v4 subtaskFetchOption])
  {
LABEL_13:
    char v23 = 0;
    goto LABEL_14;
  }
  v18 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self reminderFetchOptions];
  uint64_t v19 = [v4 reminderFetchOptions];
  if (v18 == (void *)v19)
  {
    char v23 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self reminderFetchOptions];
    v22 = [v4 reminderFetchOptions];
    char v23 = [v21 isEqual:v22];
  }
LABEL_14:

  return v23;
}

- (unint64_t)hash
{
  v3 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self parentReminderID];
  uint64_t v4 = [v3 hash];
  v5 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self accountID];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMRemindersDataViewInvocation_fetchByParentReminderID *)self reminderFetchOptions];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ ([(REMRemindersDataViewInvocation_fetchByParentReminderID *)self subtaskFetchOption]
           + v8);

  return v9;
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (int64_t)subtaskFetchOption
{
  return self->_subtaskFetchOption;
}

- (REMReminderFetchOptions)reminderFetchOptions
{
  return self->_reminderFetchOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderFetchOptions, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_parentReminderID, 0);
}

@end