@interface REMAssignmentsDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)assignments;
- (REMAssignmentsDataViewInvocationResult)initWithAssignments:(id)a3;
- (REMAssignmentsDataViewInvocationResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAssignmentsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAssignmentsDataViewInvocationResult)initWithAssignments:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAssignmentsDataViewInvocationResult;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assignments, a3);
  }

  return v7;
}

- (REMAssignmentsDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"assignments"];

  if (v8)
  {
    self = [(REMAssignmentsDataViewInvocationResult *)self initWithAssignments:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAssignmentsDataViewInvocationResult *)self assignments];
  [v4 encodeObject:v5 forKey:@"assignments"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMAssignmentsDataViewInvocationResult *)self assignments];
    uint64_t v6 = [v4 assignments];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMAssignmentsDataViewInvocationResult *)self assignments];
      objc_super v9 = [v4 assignments];
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
  v2 = [(REMAssignmentsDataViewInvocationResult *)self assignments];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSSet)assignments
{
  return self->_assignments;
}

- (void).cxx_destruct
{
}

@end