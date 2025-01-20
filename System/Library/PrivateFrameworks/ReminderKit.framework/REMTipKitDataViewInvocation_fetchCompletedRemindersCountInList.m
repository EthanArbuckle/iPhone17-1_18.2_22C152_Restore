@interface REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMObjectID)listID;
- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithCoder:(id)a3;
- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithListID:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithListID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listID, a3);
  }

  return v7;
}

- (REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];

  v6 = [(REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *)self initWithListID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *)self listID];
  [v4 encodeObject:v5 forKey:@"listID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *)self listID];
    uint64_t v6 = [v4 listID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *)self listID];
      objc_super v9 = [v4 listID];
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
  v2 = [(REMTipKitDataViewInvocation_fetchCompletedRemindersCountInList *)self listID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
}

@end