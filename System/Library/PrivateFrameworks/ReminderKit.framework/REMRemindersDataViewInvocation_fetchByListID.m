@interface REMRemindersDataViewInvocation_fetchByListID
+ (BOOL)supportsSecureCoding;
- (BOOL)includingSubtasks;
- (BOOL)isEqual:(id)a3;
- (REMObjectID)listID;
- (REMRemindersDataViewInvocation_fetchByListID)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchByListID)initWithListID:(id)a3 includingSubtasks:(BOOL)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchByListID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByListID)initWithListID:(id)a3 includingSubtasks:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMRemindersDataViewInvocation_fetchByListID;
  v8 = [(REMStoreInvocationValueStorage *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_listID, a3);
    v9->_includingSubtasks = a4;
  }

  return v9;
}

- (REMRemindersDataViewInvocation_fetchByListID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includingSubtasks"];

  if (v5)
  {
    self = -[REMRemindersDataViewInvocation_fetchByListID initWithListID:includingSubtasks:](self, "initWithListID:includingSubtasks:", v5, [v6 BOOLValue]);
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMRemindersDataViewInvocation_fetchByListID *)self listID];
  [v4 encodeObject:v5 forKey:@"listID"];

  objc_msgSend(NSNumber, "numberWithBool:", -[REMRemindersDataViewInvocation_fetchByListID includingSubtasks](self, "includingSubtasks"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"includingSubtasks"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMRemindersDataViewInvocation_fetchByListID *)self listID];
  uint64_t v6 = [v4 listID];
  if (v5 == (void *)v6)
  {

    goto LABEL_6;
  }
  id v7 = (void *)v6;
  v8 = [(REMRemindersDataViewInvocation_fetchByListID *)self listID];
  v9 = [v4 listID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
LABEL_6:
    BOOL v12 = [(REMRemindersDataViewInvocation_fetchByListID *)self includingSubtasks];
    int v11 = v12 ^ [v4 includingSubtasks] ^ 1;
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v11) = 0;
LABEL_7:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMRemindersDataViewInvocation_fetchByListID *)self listID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 + [(REMRemindersDataViewInvocation_fetchByListID *)self includingSubtasks];

  return v5;
}

- (BOOL)includingSubtasks
{
  return self->_includingSubtasks;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void).cxx_destruct
{
}

@end