@interface CHCSVOrderedDictionary
- (BOOL)isEqual:(id)a3;
- (CHCSVOrderedDictionary)init;
- (CHCSVOrderedDictionary)initWithCoder:(id)a3;
- (CHCSVOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (CHCSVOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4;
- (id)allKeys;
- (id)allValues;
- (id)keyEnumerator;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation CHCSVOrderedDictionary

- (CHCSVOrderedDictionary)initWithObjects:(id)a3 forKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CHCSVOrderedDictionary;
  v8 = [(CHCSVOrderedDictionary *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    keys = v8->_keys;
    v8->_keys = (NSArray *)v9;

    uint64_t v11 = [v6 copy];
    values = v8->_values;
    v8->_values = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8->_values forKeys:v8->_keys];
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSDictionary *)v13;
  }
  return v8;
}

- (CHCSVOrderedDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:a3 count:a5];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:a4 count:a5];
  v10 = [(CHCSVOrderedDictionary *)self initWithObjects:v8 forKeys:v9];

  return v10;
}

- (CHCSVOrderedDictionary)init
{
  return [(CHCSVOrderedDictionary *)self initWithObjects:MEMORY[0x1E4F1CBF0] forKeys:MEMORY[0x1E4F1CBF0]];
}

- (CHCSVOrderedDictionary)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHCSVOrderedDictionary;
  return [(CHCSVOrderedDictionary *)&v4 initWithCoder:a3];
}

- (id)allKeys
{
  return self->_keys;
}

- (id)allValues
{
  return self->_values;
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_dictionary count];
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKey:a3];
}

- (id)keyEnumerator
{
  return [(NSArray *)self->_keys objectEnumerator];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_keys countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)objectAtIndex:(unint64_t)a3
{
  objc_super v4 = [(NSArray *)self->_keys objectAtIndex:a3];
  v5 = [(CHCSVOrderedDictionary *)self objectForKey:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_dictionary hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHCSVOrderedDictionary;
  if ([(CHCSVOrderedDictionary *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v5 = [v4 isEqual:self->_keys];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end