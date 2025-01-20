@interface REMListsDataViewInvocation_fetchByTemplateObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMListsDataViewInvocation_fetchByTemplateObjectID)initWithCoder:(id)a3;
- (REMListsDataViewInvocation_fetchByTemplateObjectID)initWithTemplateObjectID:(id)a3;
- (REMObjectID)templateObjectID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMListsDataViewInvocation_fetchByTemplateObjectID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchByTemplateObjectID)initWithTemplateObjectID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataViewInvocation_fetchByTemplateObjectID;
  v6 = [(REMStoreInvocationValueStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_templateObjectID, a3);
  }

  return v7;
}

- (REMListsDataViewInvocation_fetchByTemplateObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateObjectID"];

  if (v5)
  {
    self = [(REMListsDataViewInvocation_fetchByTemplateObjectID *)self initWithTemplateObjectID:v5];
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
  id v5 = [(REMListsDataViewInvocation_fetchByTemplateObjectID *)self templateObjectID];
  [v4 encodeObject:v5 forKey:@"templateObjectID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(REMListsDataViewInvocation_fetchByTemplateObjectID *)self templateObjectID];
    uint64_t v6 = [v4 templateObjectID];
    if (v5 == (void *)v6)
    {
      char v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      v8 = [(REMListsDataViewInvocation_fetchByTemplateObjectID *)self templateObjectID];
      objc_super v9 = [v4 templateObjectID];
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
  v2 = [(REMListsDataViewInvocation_fetchByTemplateObjectID *)self templateObjectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMObjectID)templateObjectID
{
  return self->_templateObjectID;
}

- (void).cxx_destruct
{
}

@end