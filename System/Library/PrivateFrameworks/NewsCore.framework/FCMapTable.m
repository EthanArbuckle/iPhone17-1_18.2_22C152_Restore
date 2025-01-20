@interface FCMapTable
+ (BOOL)supportsSecureCoding;
+ (FCMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4;
+ (id)strongToStrongObjectsMapTable;
+ (id)strongToWeakObjectsMapTable;
+ (id)weakToStrongObjectsMapTable;
+ (id)weakToWeakObjectsMapTable;
- (FCMapTable)init;
- (FCMapTable)initWithCoder:(id)a3;
- (FCMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5;
- (FCMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5;
- (FCMapTable)initWithMapTable:(id)a3;
- (NSPointerFunctions)keyPointerFunctions;
- (NSPointerFunctions)valuePointerFunctions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObjectsFromMapTable:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation FCMapTable

- (id)objectForKey:(id)a3
{
  return [(NSMapTable *)self->_mapTable objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (!self->_valueClassName)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    keyClassName = self->_keyClassName;
    self->_keyClassName = v8;

    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    valueClassName = self->_valueClassName;
    self->_valueClassName = v11;
  }
  [(NSMapTable *)self->_mapTable setObject:v13 forKey:v6];
}

+ (id)strongToWeakObjectsMapTable
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  v4 = (void *)[v2 initWithMapTable:v3];

  return v4;
}

+ (FCMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:a3 valueOptions:a4];
  v8 = (void *)[v6 initWithMapTable:v7];

  return (FCMapTable *)v8;
}

- (FCMapTable)initWithMapTable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCMapTable;
  id v6 = [(FCMapTable *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapTable, a3);
  }

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMapTable *)self->_mapTable countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  keyClassName = self->_keyClassName;
  if (keyClassName)
  {
    v4 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      valueClassName = self->_valueClassName;
      *(_DWORD *)buf = 138543618;
      v8 = keyClassName;
      __int16 v9 = 2114;
      v10 = valueClassName;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "will deallocate map table with type <%{public}@, %{public}@>", buf, 0x16u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)FCMapTable;
  [(FCMapTable *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  objc_super v6 = (void *)[(NSMapTable *)self->_mapTable copyWithZone:a3];
  v7 = (void *)[v5 initWithMapTable:v6];

  return v7;
}

- (void)removeObjectForKey:(id)a3
{
}

- (FCMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:a3 valueOptions:a4 capacity:a5];
  v7 = [(FCMapTable *)self initWithMapTable:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueClassName, 0);
  objc_storeStrong((id *)&self->_keyClassName, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

- (FCMapTable)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E10]);
  v4 = [(FCMapTable *)self initWithMapTable:v3];

  return v4;
}

- (FCMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F28E10];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[[v8 alloc] initWithKeyPointerFunctions:v10 valuePointerFunctions:v9 capacity:a5];

  v12 = [(FCMapTable *)self initWithMapTable:v11];
  return v12;
}

+ (id)strongToStrongObjectsMapTable
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v4 = (void *)[v2 initWithMapTable:v3];

  return v4;
}

+ (id)weakToStrongObjectsMapTable
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v4 = (void *)[v2 initWithMapTable:v3];

  return v4;
}

+ (id)weakToWeakObjectsMapTable
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
  v4 = (void *)[v2 initWithMapTable:v3];

  return v4;
}

- (NSPointerFunctions)keyPointerFunctions
{
  return [(NSMapTable *)self->_mapTable keyPointerFunctions];
}

- (NSPointerFunctions)valuePointerFunctions
{
  return [(NSMapTable *)self->_mapTable valuePointerFunctions];
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_mapTable count];
}

- (id)keyEnumerator
{
  return [(NSMapTable *)self->_mapTable keyEnumerator];
}

- (id)objectEnumerator
{
  return [(NSMapTable *)self->_mapTable objectEnumerator];
}

- (void)removeAllObjects
{
}

- (id)dictionaryRepresentation
{
  return [(NSMapTable *)self->_mapTable dictionaryRepresentation];
}

- (void)addObjectsFromMapTable:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FCMapTable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithCoder:v4];

  v7 = (FCMapTable *)[v5 initWithMapTable:v6];
  return v7;
}

@end