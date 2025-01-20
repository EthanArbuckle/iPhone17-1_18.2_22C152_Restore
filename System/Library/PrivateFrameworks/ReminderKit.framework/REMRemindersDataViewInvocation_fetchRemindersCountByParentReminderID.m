@interface REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMObjectID)parentReminderID;
- (REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID)initWithParentReminderID:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID)initWithParentReminderID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parentReminderID, a3);
  }

  return v7;
}

- (REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentReminderID"];

  if (v5)
  {
    self = [(REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *)self initWithParentReminderID:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *)self parentReminderID];
  [v4 encodeObject:v5 forKey:@"parentReminderID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *)self parentReminderID];
    uint64_t v6 = [v4 parentReminderID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *)self parentReminderID];
      objc_super v9 = [v4 parentReminderID];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(REMRemindersDataViewInvocation_fetchRemindersCountByParentReminderID *)self parentReminderID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (void).cxx_destruct
{
}

@end