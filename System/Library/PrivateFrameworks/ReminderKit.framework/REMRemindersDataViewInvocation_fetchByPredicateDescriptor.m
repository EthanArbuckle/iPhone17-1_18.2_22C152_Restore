@interface REMRemindersDataViewInvocation_fetchByPredicateDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)sortDescriptors;
- (REMReminderFetchOptions)options;
- (REMReminderPredicateDescriptor)predicateDescriptor;
- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithCoder:(id)a3;
- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMRemindersDataViewInvocation_fetchByPredicateDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMRemindersDataViewInvocation_fetchByPredicateDescriptor;
  v12 = [(REMStoreInvocationValueStorage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_predicateDescriptor, a3);
    objc_storeStrong((id *)&v13->_sortDescriptors, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (REMRemindersDataViewInvocation_fetchByPredicateDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicateDescriptor"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sortDescriptors"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];

  if (v5)
  {
    self = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self initWithPredicateDescriptor:v5 sortDescriptors:v9 options:v10];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self predicateDescriptor];
  [v4 encodeObject:v5 forKey:@"predicateDescriptor"];

  v6 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self sortDescriptors];
  [v4 encodeObject:v6 forKey:@"sortDescriptors"];

  id v7 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self options];
  [v4 encodeObject:v7 forKey:@"options"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v5 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self predicateDescriptor];
  uint64_t v6 = [v4 predicateDescriptor];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    v8 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self predicateDescriptor];
    id v9 = [v4 predicateDescriptor];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_8;
    }
  }
  id v11 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self sortDescriptors];
  uint64_t v12 = [v4 sortDescriptors];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self sortDescriptors];
    objc_super v15 = [v4 sortDescriptors];
    int v16 = [v14 isEqual:v15];

    if (!v16)
    {
LABEL_8:
      char v17 = 0;
      goto LABEL_14;
    }
  }
  v18 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self options];
  uint64_t v19 = [v4 options];
  if (v18 == (void *)v19)
  {
    char v17 = 1;
    v20 = v18;
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self options];
    v22 = [v4 options];
    char v17 = [v21 isEqual:v22];
  }
LABEL_14:

  return v17;
}

- (unint64_t)hash
{
  v2 = [(REMRemindersDataViewInvocation_fetchByPredicateDescriptor *)self predicateDescriptor];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMReminderPredicateDescriptor)predicateDescriptor
{
  return self->_predicateDescriptor;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (REMReminderFetchOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);

  objc_storeStrong((id *)&self->_predicateDescriptor, 0);
}

@end