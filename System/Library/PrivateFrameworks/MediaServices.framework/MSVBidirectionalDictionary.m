@interface MSVBidirectionalDictionary
+ (BOOL)supportsSecureCoding;
+ (id)bidirectionalDictionary;
- (BOOL)isEqual:(id)a3;
- (MSVBidirectionalDictionary)init;
- (MSVBidirectionalDictionary)initWithCoder:(id)a3;
- (MSVBidirectionalDictionary)initWithDictionary:(id)a3;
- (id)allKeys;
- (id)description;
- (id)keyForObject:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSVBidirectionalDictionary

- (id)keyForObject:(id)a3
{
  return [(NSDictionary *)self->_objectToKeyDictionary objectForKeyedSubscript:a3];
}

- (id)objectForKey:(id)a3
{
  return [(NSDictionary *)self->_keyToObjectDictionary objectForKeyedSubscript:a3];
}

uint64_t __49__MSVBidirectionalDictionary_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

- (id)allKeys
{
  return [(NSDictionary *)self->_keyToObjectDictionary allKeys];
}

+ (id)bidirectionalDictionary
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MSVBidirectionalDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSVBidirectionalDictionary;
  v5 = [(MSVBidirectionalDictionary *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    keyToObjectDictionary = v5->_keyToObjectDictionary;
    v5->_keyToObjectDictionary = (NSDictionary *)v6;

    if (v5->_keyToObjectDictionary)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = v5->_keyToObjectDictionary;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__MSVBidirectionalDictionary_initWithDictionary___block_invoke;
      v14[3] = &unk_1E5ADA798;
      id v10 = v8;
      id v15 = v10;
      [(NSDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v14];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v10 copy];
    objectToKeyDictionary = v5->_objectToKeyDictionary;
    v5->_objectToKeyDictionary = (NSDictionary *)v11;
  }
  return v5;
}

- (MSVBidirectionalDictionary)init
{
  return [(MSVBidirectionalDictionary *)self initWithDictionary:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectToKeyDictionary, 0);
  objc_storeStrong((id *)&self->_keyToObjectDictionary, 0);
}

- (id)description
{
  return [(NSDictionary *)self->_keyToObjectDictionary description];
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_keyToObjectDictionary hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [(NSDictionary *)self->_keyToObjectDictionary isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [MSVMutableBidirectionalDictionary alloc];
  keyToObjectDictionary = self->_keyToObjectDictionary;
  return [(MSVMutableBidirectionalDictionary *)v4 initWithDictionary:keyToObjectDictionary];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  keyToObjectDictionary = self->_keyToObjectDictionary;
  id v4 = a3;
  id v5 = (id)[(NSDictionary *)keyToObjectDictionary copy];
  [v4 encodeObject:v5 forKey:@"keyToObjectDictionary"];
}

- (MSVBidirectionalDictionary)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allowedClasses];
  uint64_t v6 = [v5 setByAddingObject:objc_opt_class()];
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"keyToObjectDictionary"];

  id v8 = [(MSVBidirectionalDictionary *)self initWithDictionary:v7];
  return v8;
}

@end