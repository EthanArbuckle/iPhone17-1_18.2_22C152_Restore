@interface SXJSONObject
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (Class)classOverrideAtInitialization:(Class)a3 type:(id)a4;
+ (id)jsonPropertyNameForObjCPropertyName:(id)a3;
+ (id)objectValueClassBlockForPropertyWithName:(id)a3;
+ (id)propertyDefinitions;
+ (id)propertyHashTable;
+ (id)protocolPropertyDefinitions;
+ (id)purgeClassBlockForPropertyWithName:(id)a3;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
+ (void)initialize;
+ (void)lock;
+ (void)unlock;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)jsonDictionary;
- (NSMutableDictionary)objectStorage;
- (NSString)specificationVersion;
- (SXJSONObject)init;
- (SXJSONObject)initWithJSONData:(id)a3 andVersion:(id)a4;
- (SXJSONObject)initWithJSONObject:(id)a3 andVersion:(id)a4;
- (id)JSONRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)jsonData;
- (id)objectForLookupKey:(id *)a1;
- (id)valueForLookupKey:(id)a3;
- (os_unfair_lock_s)unfairLock;
- (void)storeObject:(id)a3 forLookupKey:(id)a4;
- (void)storeValue:(id)a3 forLookupKey:(id)a4;
@end

@implementation SXJSONObject

- (SXJSONObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)SXJSONObject;
  result = [(SXJSONObject *)&v3 init];
  if (result) {
    result->_unfairLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    unfairLock = 0;
    +[SXJSONPrimitives initializePrimitives];
  }
  v2 = (objc_class *)objc_opt_class();
  SXJSONObjectRuntimeGenerateAccessorsForClass(v2);
}

- (SXJSONObject)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SXJSONObject;
    v9 = [(SXJSONObject *)&v15 init];
    v10 = v9;
    if (v9)
    {
      v9->_unfairLock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_specificationVersion, a4);
      objc_storeStrong((id *)&v10->_jsonDictionary, a3);
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      objectStorage = v10->_objectStorage;
      v10->_objectStorage = v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (void)unlock
{
}

+ (void)lock
{
}

+ (id)propertyDefinitions
{
  if (+[SXJSONObject propertyDefinitions]::onceToken != -1) {
    dispatch_once(&+[SXJSONObject propertyDefinitions]::onceToken, &__block_literal_global_17);
  }
  v2 = (void *)+[SXJSONObject propertyDefinitions]::propertyDefinitions;
  return v2;
}

+ (id)protocolPropertyDefinitions
{
  if (+[SXJSONObject protocolPropertyDefinitions]::onceToken != -1) {
    dispatch_once(&+[SXJSONObject protocolPropertyDefinitions]::onceToken, &__block_literal_global_19);
  }
  v2 = (void *)+[SXJSONObject protocolPropertyDefinitions]::protocolPropertyDefinitions;
  return v2;
}

+ (id)propertyHashTable
{
  if (+[SXJSONObject propertyHashTable]::onceToken != -1) {
    dispatch_once(&+[SXJSONObject propertyHashTable]::onceToken, &__block_literal_global_15);
  }
  v2 = (void *)+[SXJSONObject propertyHashTable]::propertyHashTable;
  return v2;
}

uint64_t __43__SXJSONObject_protocolPropertyDefinitions__block_invoke()
{
  +[SXJSONObject protocolPropertyDefinitions]::protocolPropertyDefinitions = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __35__SXJSONObject_propertyDefinitions__block_invoke()
{
  +[SXJSONObject propertyDefinitions]::propertyDefinitions = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __33__SXJSONObject_propertyHashTable__block_invoke()
{
  +[SXJSONObject propertyHashTable]::propertyHashTable = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (void)storeObject:(id)a3 forLookupKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  objectStorage = self->_objectStorage;
  if (v8) {
    [(NSMutableDictionary *)objectStorage setObject:v8 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)objectStorage removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (id)objectForLookupKey:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 1);
    os_unfair_lock_lock_with_options();
    a1 = [a1[4] objectForKey:v3];
    os_unfair_lock_unlock(v4);
  }

  return a1;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  return &__block_literal_global_22;
}

- (SXJSONObject)initWithJSONData:(id)a3 andVersion:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidJSON" reason:@"No JSON to parse" userInfo:0];
    objc_exception_throw(v12);
  }
  id v16 = 0;
  id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v16];
  id v9 = v16;
  if (v9)
  {
    v13 = (void *)MEMORY[0x263EFF940];
    v17 = @"error";
    v18[0] = v9;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v15 = [v13 exceptionWithName:@"InvalidJSON" reason:@"Error while parsing JSON" userInfo:v14];

    objc_exception_throw(v15);
  }
  v10 = [(SXJSONObject *)self initWithJSONObject:v8 andVersion:v7];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SXJSONObject *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  jsonDictionary = v4->_jsonDictionary;
  if (jsonDictionary == self->_jsonDictionary) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSDictionary isEqualToDictionary:](jsonDictionary, "isEqualToDictionary:");
  }
LABEL_7:

  return v6;
}

+ (Class)classOverrideAtInitialization:(Class)a3 type:(id)a4
{
  return a3;
}

- (id)jsonData
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  jsonDictionary = self->_jsonDictionary;
  specificationVersion = self->_specificationVersion;
  return (id)[v4 initWithJSONObject:jsonDictionary andVersion:specificationVersion];
}

+ (id)objectValueClassBlockForPropertyWithName:(id)a3
{
  return 0;
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  return 0;
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  return 0;
}

- (void)storeValue:(id)a3 forLookupKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:@"NotImplemented" reason:@"Currently not implemented yet" userInfo:0];
  objc_exception_throw(v7);
}

- (id)valueForLookupKey:(id)a3
{
  id v3 = [(NSDictionary *)self->_jsonDictionary objectForKey:a3];
  return v3;
}

- (id)JSONRepresentation
{
  return self->_jsonDictionary;
}

- (id)debugDescription
{
  return (id)[(NSDictionary *)self->_jsonDictionary debugDescription];
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (NSString)specificationVersion
{
  return self->_specificationVersion;
}

- (NSMutableDictionary)objectStorage
{
  return self->_objectStorage;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectStorage, 0);
  objc_storeStrong((id *)&self->_specificationVersion, 0);
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
}

@end