@interface TRIPBAutocreatedDictionary
- (TRIPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation TRIPBAutocreatedDictionary

- (void)dealloc
{
  if (self->_autocreator) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRIPBDictionary.m", 12018, @"%@: Autocreator must be cleared before release, autocreator: %@", objc_opt_class(), self->_autocreator);
  }

  v3.receiver = self;
  v3.super_class = (Class)TRIPBAutocreatedDictionary;
  [(TRIPBAutocreatedDictionary *)&v3 dealloc];
}

- (TRIPBAutocreatedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TRIPBAutocreatedDictionary;
  v8 = [(TRIPBAutocreatedDictionary *)&v10 init];
  if (v8) {
    v8->_dictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithObjects:a3 forKeys:a4 count:a5];
  }
  return v8;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_dictionary count];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
}

- (id)keyEnumerator
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_dictionary = dictionary;
  }
  return (id)[(NSMutableDictionary *)dictionary keyEnumerator];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_dictionary = dictionary;
  }
  [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  dictionary = self->_dictionary;
  if (dictionary)
  {
    return (id)[(NSMutableDictionary *)dictionary copyWithZone:a3];
  }
  else
  {
    v5 = (void *)[MEMORY[0x1E4F1CA60] allocWithZone:a3];
    return (id)[v5 init];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  dictionary = self->_dictionary;
  if (dictionary)
  {
    return (id)[(NSMutableDictionary *)dictionary mutableCopyWithZone:a3];
  }
  else
  {
    v5 = (void *)[MEMORY[0x1E4F1CA60] allocWithZone:a3];
    return (id)[v5 init];
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_dictionary = dictionary;
  }
  [(NSMutableDictionary *)dictionary setObject:a3 forKeyedSubscript:a4];
  autocreator = self->_autocreator;
  if (autocreator)
  {
    TRIPBAutocreatedDictionaryModified(autocreator, (uint64_t)self);
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

@end