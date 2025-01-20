@interface PKGroupsControllerSnapshot
+ (BOOL)supportsSecureCoding;
- (NSDictionary)annotations;
- (NSDictionary)annotationsByPassUniqueID;
- (NSDictionary)states;
- (NSSet)accounts;
- (NSSet)passes;
- (PKCatalog)catalog;
- (PKGroupsControllerSnapshot)init;
- (PKGroupsControllerSnapshot)initWithCoder:(id)a3;
- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 annotationsByPassUniqueID:(id)a4 accounts:(id)a5 catalog:(id)a6;
- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 states:(id)a4 annotations:(id)a5 accounts:(id)a6 catalog:(id)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKGroupsControllerSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)passes
{
  return self->_passes;
}

- (NSDictionary)states
{
  return self->_states;
}

- (PKCatalog)catalog
{
  return self->_catalog;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (NSSet)accounts
{
  return self->_accounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

- (void)encodeWithCoder:(id)a3
{
  passes = self->_passes;
  id v5 = a3;
  [v5 encodeObject:passes forKey:@"passes"];
  [v5 encodeObject:self->_states forKey:@"states"];
  [v5 encodeObject:self->_annotations forKey:@"annotationsByPassUniqueID"];
  [v5 encodeObject:self->_catalog forKey:@"catalog"];
  [v5 encodeObject:self->_accounts forKey:@"creditAccount"];
}

- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 states:(id)a4 annotations:(id)a5 accounts:(id)a6 catalog:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKGroupsControllerSnapshot;
  v17 = [(PKGroupsControllerSnapshot *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    passes = v17->_passes;
    v17->_passes = (NSSet *)v18;

    uint64_t v20 = [v13 copy];
    states = v17->_states;
    v17->_states = (NSDictionary *)v20;

    uint64_t v22 = [v14 copy];
    annotations = v17->_annotations;
    v17->_annotations = (NSDictionary *)v22;

    objc_storeStrong((id *)&v17->_accounts, a6);
    objc_storeStrong((id *)&v17->_catalog, a7);
  }

  return v17;
}

- (PKGroupsControllerSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKGroupsControllerSnapshot;
  id v5 = [(PKGroupsControllerSnapshot *)&v32 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"passes"];
    passes = v5->_passes;
    v5->_passes = (NSSet *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"states"];
    states = v5->_states;
    v5->_states = (NSDictionary *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v17, "initWithObjects:", v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"annotationsByPassUniqueID"];
    annotations = v5->_annotations;
    v5->_annotations = (NSDictionary *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"catalog"];
    catalog = v5->_catalog;
    v5->_catalog = (PKCatalog *)v24;

    id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"creditAccount"];
    accounts = v5->_accounts;
    v5->_accounts = (NSSet *)v29;
  }
  return v5;
}

- (PKGroupsControllerSnapshot)init
{
  return 0;
}

- (PKGroupsControllerSnapshot)initWithPasses:(id)a3 annotationsByPassUniqueID:(id)a4 accounts:(id)a5 catalog:(id)a6
{
  return [(PKGroupsControllerSnapshot *)self initWithPasses:a3 states:MEMORY[0x1E4F1CC08] annotations:a4 accounts:a5 catalog:a6];
}

- (NSDictionary)annotationsByPassUniqueID
{
  return self->_annotations;
}

@end