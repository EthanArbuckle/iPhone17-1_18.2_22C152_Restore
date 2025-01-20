@interface MSVMutableBidirectionalDictionary
+ (BOOL)supportsSecureCoding;
- (MSVMutableBidirectionalDictionary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)removeAllObjects;
- (void)removeKeyForObject:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setKey:(id)a3 forObject:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation MSVMutableBidirectionalDictionary

- (void)removeObjectForKey:(id)a3
{
  id v7 = a3;
  v4 = self->super._keyToObjectDictionary;
  v5 = self->super._objectToKeyDictionary;
  v6 = [(NSDictionary *)v4 objectForKeyedSubscript:v7];
  if (v6)
  {
    [(NSDictionary *)v4 setObject:0 forKeyedSubscript:v7];
    [(NSDictionary *)v5 setObject:0 forKeyedSubscript:v6];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v11 = self->super._keyToObjectDictionary;
  id v7 = self->super._objectToKeyDictionary;
  id v8 = a4;
  id v9 = a3;
  v10 = [(NSDictionary *)v11 objectForKeyedSubscript:v8];
  if (v10) {
    [(NSDictionary *)v7 setObject:0 forKeyedSubscript:v10];
  }
  [(NSDictionary *)v11 setObject:v9 forKeyedSubscript:v8];
  [(NSDictionary *)v7 setObject:v8 forKeyedSubscript:v9];
}

- (MSVMutableBidirectionalDictionary)initWithDictionary:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MSVMutableBidirectionalDictionary;
  v3 = [(MSVBidirectionalDictionary *)&v13 initWithDictionary:a3];
  v4 = v3;
  if (v3)
  {
    v5 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    if (v3->super._keyToObjectDictionary) {
      keyToObjectDictionary = v3->super._keyToObjectDictionary;
    }
    else {
      keyToObjectDictionary = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v7 = [(NSDictionary *)keyToObjectDictionary mutableCopy];
    id v8 = v4->super._keyToObjectDictionary;
    v4->super._keyToObjectDictionary = (NSDictionary *)v7;

    if (v4->super._objectToKeyDictionary) {
      objectToKeyDictionary = v4->super._objectToKeyDictionary;
    }
    else {
      objectToKeyDictionary = v5;
    }
    uint64_t v10 = [(NSDictionary *)objectToKeyDictionary mutableCopy];
    v11 = v4->super._objectToKeyDictionary;
    v4->super._objectToKeyDictionary = (NSDictionary *)v10;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MSVBidirectionalDictionary alloc];
  keyToObjectDictionary = self->super._keyToObjectDictionary;
  return [(MSVBidirectionalDictionary *)v4 initWithDictionary:keyToObjectDictionary];
}

- (void)removeAllObjects
{
  keyToObjectDictionary = self->super._keyToObjectDictionary;
  v3 = self->super._objectToKeyDictionary;
  v4 = keyToObjectDictionary;
  [(NSDictionary *)v4 removeAllObjects];
  [(NSDictionary *)v3 removeAllObjects];
}

- (void)removeKeyForObject:(id)a3
{
  id v7 = a3;
  v4 = self->super._keyToObjectDictionary;
  v5 = self->super._objectToKeyDictionary;
  v6 = [(NSDictionary *)v5 objectForKeyedSubscript:v7];
  if (v6)
  {
    [(NSDictionary *)v4 setObject:0 forKeyedSubscript:v6];
    [(NSDictionary *)v5 setObject:0 forKeyedSubscript:v7];
  }
}

- (void)setKey:(id)a3 forObject:(id)a4
{
  v11 = self->super._keyToObjectDictionary;
  id v7 = self->super._objectToKeyDictionary;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(NSDictionary *)v7 objectForKeyedSubscript:v8];
  if (v10) {
    [(NSDictionary *)v11 setObject:0 forKeyedSubscript:v10];
  }
  [(NSDictionary *)v11 setObject:v8 forKeyedSubscript:v9];
  [(NSDictionary *)v7 setObject:v9 forKeyedSubscript:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end