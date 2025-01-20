@interface MSVDefaultDictionary
+ (id)dictionaryWithCapacity:(unint64_t)a3 defaultValue:(id)a4;
+ (id)dictionaryWithDefaultValue:(id)a3;
+ (id)dictionaryWithDictionary:(id)a3 defaultValue:(id)a4;
- (MSVDefaultDictionary)init;
- (MSVDefaultDictionary)initWithCapacity:(unint64_t)a3 defaultValue:(id)a4;
- (MSVDefaultDictionary)initWithDefaultValue:(id)a3;
- (MSVDefaultDictionary)initWithDictionary:(id)a3 defaultValue:(id)a4;
- (MSVDefaultDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValue;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeObjectForKey:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MSVDefaultDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong(&self->_defaultValue, 0);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (id)keyEnumerator
{
  return (id)[(NSMutableDictionary *)self->_storage keyEnumerator];
}

- (void)setDefaultValue:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = &__block_literal_global_39;
  }
  id v7 = v4;
  v5 = (void *)MEMORY[0x1A62426F0]();
  id defaultValue = self->_defaultValue;
  self->_id defaultValue = v5;
}

uint64_t __40__MSVDefaultDictionary_setDefaultValue___block_invoke()
{
  return 0;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_storage objectForKey:v4];
  if (!v5)
  {
    v5 = (*((void (**)(void))self->_defaultValue + 2))();
    [(NSMutableDictionary *)self->_storage setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_storage count];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[(NSMutableDictionary *)self->_storage copy];
}

- (MSVDefaultDictionary)initWithDictionary:(id)a3 defaultValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSVDefaultDictionary;
  v8 = [(MSVDefaultDictionary *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v9;

    uint64_t v11 = MEMORY[0x1A62426F0](v7);
    id defaultValue = v8->_defaultValue;
    v8->_id defaultValue = (id)v11;
  }
  return v8;
}

- (MSVDefaultDictionary)initWithCapacity:(unint64_t)a3 defaultValue:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSVDefaultDictionary;
  id v7 = [(MSVDefaultDictionary *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a3];
    storage = v7->_storage;
    v7->_storage = (NSMutableDictionary *)v8;

    uint64_t v10 = MEMORY[0x1A62426F0](v6);
    id defaultValue = v7->_defaultValue;
    v7->_id defaultValue = (id)v10;
  }
  return v7;
}

- (MSVDefaultDictionary)initWithDefaultValue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVDefaultDictionary;
  v5 = [(MSVDefaultDictionary *)&v11 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    storage = v5->_storage;
    v5->_storage = v6;

    uint64_t v8 = MEMORY[0x1A62426F0](v4);
    id defaultValue = v5->_defaultValue;
    v5->_id defaultValue = (id)v8;
  }
  return v5;
}

- (MSVDefaultDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MSVDefaultDictionary;
  uint64_t v8 = [(MSVDefaultDictionary *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithObjects:a3 forKeys:a4 count:a5];
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v9;

    id defaultValue = v8->_defaultValue;
    v8->_id defaultValue = &__block_literal_global_36;
  }
  return v8;
}

uint64_t __54__MSVDefaultDictionary_initWithObjects_forKeys_count___block_invoke()
{
  return 0;
}

- (MSVDefaultDictionary)init
{
  return [(MSVDefaultDictionary *)self initWithDefaultValue:&__block_literal_global_2670];
}

uint64_t __28__MSVDefaultDictionary_init__block_invoke()
{
  return 0;
}

+ (id)dictionaryWithDictionary:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithDictionary:v7 defaultValue:v6];

  return v8;
}

+ (id)dictionaryWithCapacity:(unint64_t)a3 defaultValue:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithCapacity:a3 defaultValue:v6];

  return v7;
}

+ (id)dictionaryWithDefaultValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDefaultValue:v4];

  return v5;
}

@end