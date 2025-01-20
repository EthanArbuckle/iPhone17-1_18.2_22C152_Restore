@interface REKeyValueMap
- (REKeyValueMap)init;
- (REKeyValueMap)initWithCapacity:(unint64_t)a3;
- (id)keyForValue:(id)a3;
- (id)valueForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)valueCount;
- (void)addKey:(id)a3 withValue:(id)a4;
- (void)removeKey:(id)a3;
@end

@implementation REKeyValueMap

- (REKeyValueMap)init
{
  return [(REKeyValueMap *)self initWithCapacity:16];
}

- (REKeyValueMap)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)REKeyValueMap;
  v4 = [(REKeyValueMap *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:a3];
    keyMap = v4->_keyMap;
    v4->_keyMap = (NSMapTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:a3];
    valueMap = v4->_valueMap;
    v4->_valueMap = (NSMapTable *)v7;
  }
  return v4;
}

- (unint64_t)count
{
  return [(NSMapTable *)self->_keyMap count];
}

- (unint64_t)valueCount
{
  return [(NSMapTable *)self->_valueMap count];
}

- (void)addKey:(id)a3 withValue:(id)a4
{
  keyMap = self->_keyMap;
  id v7 = a4;
  id v8 = a3;
  [(NSMapTable *)keyMap setObject:v7 forKey:v8];
  [(NSMapTable *)self->_valueMap setObject:v8 forKey:v7];
}

- (void)removeKey:(id)a3
{
  keyMap = self->_keyMap;
  id v5 = a3;
  id v6 = [(NSMapTable *)keyMap objectForKey:v5];
  [(NSMapTable *)self->_valueMap removeObjectForKey:v6];
  [(NSMapTable *)self->_keyMap removeObjectForKey:v5];
}

- (id)valueForKey:(id)a3
{
  return [(NSMapTable *)self->_keyMap objectForKey:a3];
}

- (id)keyForValue:(id)a3
{
  return [(NSMapTable *)self->_valueMap objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMap, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);
}

@end