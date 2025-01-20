@interface REMTemplateSectionsDataViewInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)templateSectionStorages;
- (NSArray)templateStorages;
- (REMTemplateSectionsDataViewInvocationResult)initWithCoder:(id)a3;
- (REMTemplateSectionsDataViewInvocationResult)initWithTemplateStorages:(id)a3 templateSectionStorages:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTemplateSectionsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplateSectionsDataViewInvocationResult)initWithTemplateStorages:(id)a3 templateSectionStorages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTemplateSectionsDataViewInvocationResult;
  v9 = [(REMStoreInvocationValueStorage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_templateStorages, a3);
    objc_storeStrong((id *)&v10->_templateSectionStorages, a4);
  }

  return v10;
}

- (REMTemplateSectionsDataViewInvocationResult)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"templateStorages"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  objc_super v12 = [v5 decodeObjectOfClasses:v11 forKey:@"templateSectionStorages"];

  v13 = 0;
  if (v8 && v12)
  {
    self = [(REMTemplateSectionsDataViewInvocationResult *)self initWithTemplateStorages:v8 templateSectionStorages:v12];
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMTemplateSectionsDataViewInvocationResult *)self templateStorages];
  [v4 encodeObject:v5 forKey:@"templateStorages"];

  id v6 = [(REMTemplateSectionsDataViewInvocationResult *)self templateSectionStorages];
  [v4 encodeObject:v6 forKey:@"templateSectionStorages"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  id v5 = [(REMTemplateSectionsDataViewInvocationResult *)self templateStorages];
  uint64_t v6 = [v4 templateStorages];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMTemplateSectionsDataViewInvocationResult *)self templateStorages];
    v9 = [v4 templateStorages];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMTemplateSectionsDataViewInvocationResult *)self templateSectionStorages];
  uint64_t v13 = [v4 templateSectionStorages];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMTemplateSectionsDataViewInvocationResult *)self templateSectionStorages];
    v16 = [v4 templateSectionStorages];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(REMTemplateSectionsDataViewInvocationResult *)self templateStorages];
  uint64_t v4 = [v3 hash];
  id v5 = [(REMTemplateSectionsDataViewInvocationResult *)self templateSectionStorages];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSArray)templateStorages
{
  return self->_templateStorages;
}

- (NSArray)templateSectionStorages
{
  return self->_templateSectionStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSectionStorages, 0);

  objc_storeStrong((id *)&self->_templateStorages, 0);
}

@end