@interface STDictionaryData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateObjectsAndKeysWithValidObjectClasses:(id)a3 keyClasses:(id)a4;
- (NSArray)allKeys;
- (NSArray)allObjects;
- (NSDictionary)objectsAndKeys;
- (NSString)description;
- (STDictionaryData)init;
- (STDictionaryData)initWithCoder:(id)a3;
- (STDictionaryData)initWithObjectsAndKeys:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
@end

@implementation STDictionaryData

- (STDictionaryData)init
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(STDictionaryData *)self initWithObjectsAndKeys:v3];

  return v4;
}

- (STDictionaryData)initWithObjectsAndKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDictionaryData;
  v5 = [(STDictionaryData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    objectsAndKeys = v5->_objectsAndKeys;
    v5->_objectsAndKeys = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (NSArray)allKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_objectsAndKeys allKeys];
}

- (NSArray)allObjects
{
  return (NSArray *)[(NSMutableDictionary *)self->_objectsAndKeys allValues];
}

- (NSDictionary)objectsAndKeys
{
  v2 = (void *)[(NSMutableDictionary *)self->_objectsAndKeys copy];

  return (NSDictionary *)v2;
}

- (unint64_t)count
{
  v2 = [(STDictionaryData *)self allKeys];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEmpty
{
  return [(STDictionaryData *)self count] == 0;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  if (a3)
  {
    objectsAndKeys = self->_objectsAndKeys;
    id v4 = a3;
    id v5 = (id)[(NSMutableDictionary *)objectsAndKeys copy];
    [v5 enumerateKeysAndObjectsUsingBlock:v4];
  }
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_objectsAndKeys objectForKeyedSubscript:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = [(STDictionaryData *)self objectsAndKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__STDictionaryData_isEqual___block_invoke;
  v10[3] = &unk_1E6B63B30;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  LOBYTE(v6) = [v5 isEqual];
  return (char)v6;
}

uint64_t __28__STDictionaryData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) objectsAndKeys];
}

- (unint64_t)hash
{
  unint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__STDictionaryData_hash__block_invoke;
  v7[3] = &unk_1E6B63B58;
  id v8 = v3;
  id v4 = v3;
  [(STDictionaryData *)self enumerateKeysAndObjectsUsingBlock:v7];
  unint64_t v5 = [v4 hash];

  return v5;
}

void __24__STDictionaryData_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = (id)[*(id *)(a1 + 32) appendObject:a2];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:v7];
}

- (NSString)description
{
  return (NSString *)[(STDictionaryData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableDictionaryData allocWithZone:a3];
  id v5 = [(STDictionaryData *)self objectsAndKeys];
  id v6 = [(STDictionaryData *)v4 initWithObjectsAndKeys:v5];

  return v6;
}

- (id)succinctDescription
{
  v2 = [(STDictionaryData *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(STDictionaryData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = -[STDictionaryData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    [v6 appendDictionarySection:a1[1] withName:@"dictionaryData" skipIfEmpty:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STDictionaryData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STDictionaryDataDiff diffFromDictionaryData:v4 toDictionaryData:self];
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
      id v5 = (void *)[(STDictionaryData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STDictionaryData *)self mutableCopy];
      [v4 applyToMutableDictionaryData:v5];
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STDictionaryData *)self objectsAndKeys];
  [v4 encodeObject:v5 forKey:@"objectsAndKeys"];
}

- (STDictionaryData)initWithCoder:(id)a3
{
  id v4 = a3;
  self;
  if (qword_1EB5A3598 != -1) {
    dispatch_once(&qword_1EB5A3598, &__block_literal_global_17);
  }
  id v5 = (id)_MergedGlobals_10;
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"objectsAndKeys"];

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
    self = [(STDictionaryData *)self initWithObjectsAndKeys:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (BOOL)validateObjectsAndKeysWithValidObjectClasses:(id)a3 keyClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  objectsAndKeys = self->_objectsAndKeys;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke;
  v12[3] = &unk_1E6B63BA8;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  v15 = &v16;
  [(NSMutableDictionary *)objectsAndKeys enumerateKeysAndObjectsUsingBlock:v12];
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)a1[4];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_2;
  v16[3] = &unk_1E6B63B80;
  id v10 = v7;
  id v17 = v10;
  LODWORD(v9) = objc_msgSend(v9, "bs_containsObjectPassingTest:", v16);
  id v11 = (void *)a1[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_3;
  v14[3] = &unk_1E6B63B80;
  id v12 = v8;
  id v15 = v12;
  char v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v14);
  if (!v9 || (v13 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

uint64_t __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __41__STDictionaryData__encodableObjectTypes__block_invoke()
{
  char v19 = (void *)MEMORY[0x1E4F1CAD0];
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
  uint64_t v11 = _MergedGlobals_10;
  _MergedGlobals_10 = v10;

  return MEMORY[0x1F41817F8](v10, v11);
}

- (void).cxx_destruct
{
}

@end