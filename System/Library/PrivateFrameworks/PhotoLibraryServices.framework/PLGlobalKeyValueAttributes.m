@interface PLGlobalKeyValueAttributes
+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4;
+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6;
- (BOOL)includeInMigrationHistory;
- (Class)anyValueClass;
- (NSString)key;
- (PLGlobalKeyValueAttributes)initWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6;
- (signed)type;
- (void)setAnyValueClass:(Class)a3;
- (void)setIncludeInMigrationHistory:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation PLGlobalKeyValueAttributes

+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithKey:v10 type:v8 includeInMigrationHistory:v7 anyValueClass:a6];

  return v11;
}

+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4
{
  return (id)[a1 attributesWithKey:a3 type:a4 includeInMigrationHistory:1 anyValueClass:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyValueClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setAnyValueClass:(Class)a3
{
}

- (Class)anyValueClass
{
  return self->_anyValueClass;
}

- (void)setIncludeInMigrationHistory:(BOOL)a3
{
  self->_includeInMigrationHistory = a3;
}

- (BOOL)includeInMigrationHistory
{
  return self->_includeInMigrationHistory;
}

- (void)setType:(signed __int16)a3
{
  self->_type = a3;
}

- (signed)type
{
  return self->_type;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (PLGlobalKeyValueAttributes)initWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6
{
  id v11 = a3;
  v12 = [(PLGlobalKeyValueAttributes *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v13->_type = a4;
    v13->_includeInMigrationHistory = a5;
    objc_storeStrong((id *)&v13->_anyValueClass, a6);
  }

  return v13;
}

@end