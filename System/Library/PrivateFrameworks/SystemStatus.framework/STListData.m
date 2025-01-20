@interface STListData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)objects;
- (NSString)debugDescription;
- (NSString)description;
- (STListData)init;
- (STListData)initWithCoder:(id)a3;
- (STListData)initWithObjects:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithListData:(void *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation STListData

- (unint64_t)count
{
  v2 = [(STListData *)self objects];
  unint64_t v3 = [v2 count];

  return v3;
}

- (STListData)init
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(STListData *)self initWithObjects:v3];

  return v4;
}

- (id)initWithListData:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    unint64_t v3 = [a2 objects];
    id v2 = (id)[v2 initWithObjects:v3];
  }
  return v2;
}

- (STListData)initWithObjects:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STListData;
  v5 = [(STListData *)&v11 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
    }
    objects = v5->_objects;
    v5->_objects = v8;
  }
  return v5;
}

- (NSArray)objects
{
  id v2 = (void *)[(NSMutableArray *)self->_objects copy];

  return (NSArray *)v2;
}

- (void).cxx_destruct
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableListData allocWithZone:a3];

  return -[STListData initWithListData:](v4, self);
}

id __22__STListData_isEqual___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28BD0]);
  unint64_t v3 = [*(id *)(a1 + 32) objects];
  id v4 = (void *)[v2 initWithArray:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = objc_alloc(MEMORY[0x1E4F28BD0]);
  v7 = [(STListData *)self objects];
  v8 = (void *)[v6 initWithArray:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __22__STListData_isEqual___block_invoke;
  v12[3] = &unk_1E6B63F78;
  id v13 = v4;
  id v9 = v4;
  id v10 = (id)[v5 appendObject:v8 counterpart:v12];

  LOBYTE(v7) = [v5 isEqual];
  return (char)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STListData *)self objects];
  [v4 encodeObject:v5 forKey:@"objects"];
}

- (STListData)initWithCoder:(id)a3
{
  id v4 = a3;
  self;
  if (qword_1EB5A35B8 != -1) {
    dispatch_once(&qword_1EB5A35B8, &__block_literal_global_14);
  }
  id v5 = (id)_MergedGlobals_12;
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"objects"];

  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8)
  {
    self = [(STListData *)self initWithObjects:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(STListData *)self objects];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__STListData_enumerateObjectsUsingBlock___block_invoke;
    v6[3] = &unk_1E6B63F50;
    id v7 = v4;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __41__STListData_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)hash
{
  unint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = objc_alloc(MEMORY[0x1E4F28BD0]);
  id v5 = [(STListData *)self objects];
  id v6 = (void *)[v4 initWithArray:v5];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (NSString)description
{
  return (NSString *)[(STListData *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STListData *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STListData *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STListData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = -[STListData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 succinctDescriptionBuilder];
    [v6 setActiveMultilinePrefix:v5];

    [v6 setUseDebugDescription:a3];
    id v7 = [a1 objects];
    unint64_t v8 = [v6 activeMultilinePrefix];
    [v6 appendArraySection:v7 withName:0 multilinePrefix:v8 skipIfEmpty:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STListData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STListDataDiff diffFromListData:v4 toListData:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STListData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STListData *)self mutableCopy];
      [v4 applyToMutableListData:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __35__STListData__encodableObjectTypes__block_invoke()
{
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v18, v17, v16, v15, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(),
  uint64_t v10 = 0);
  uint64_t v11 = _MergedGlobals_12;
  _MergedGlobals_12 = v10;

  return MEMORY[0x1F41817F8](v10, v11);
}

@end