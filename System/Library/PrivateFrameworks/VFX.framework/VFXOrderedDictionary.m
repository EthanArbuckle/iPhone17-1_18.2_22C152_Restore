@interface VFXOrderedDictionary
- (id)allKeys;
- (id)allValues;
- (id)copy;
- (id)description;
- (id)dictionary;
- (id)keys;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)_setupFrom:(id)a3;
- (void)applyBlock:(id)a3;
- (void)applyFunction:(void *)a3 withContext:(void *)a4;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation VFXOrderedDictionary

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXOrderedDictionary;
  [(VFXOrderedDictionary *)&v3 dealloc];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  objc_msgSend_removeObjectForKey_(self, a2, (uint64_t)a4, (uint64_t)a4);
  if (a3)
  {
    keys = self->_keys;
    if (!keys)
    {
      self->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_keyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      keys = self->_keys;
    }
    objc_msgSend_addObject_(keys, v7, (uint64_t)a4, v8);
    keyValues = self->_keyValues;
    objc_msgSend_setObject_forKey_(keyValues, v10, (uint64_t)a3, (uint64_t)a4);
  }
}

- (id)objectForKey:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_keyValues, a2, (uint64_t)a3, v3);
}

- (id)objectAtIndex:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndex_(self->_keys, a2, a3, v3);

  return (id)objc_msgSend_objectForKey_(self, v5, v6, v7);
}

- (void)removeObjectForKey:(id)a3
{
  if (objc_msgSend_objectForKey_(self->_keyValues, a2, (uint64_t)a3, v3))
  {
    if (objc_msgSend_count(self->_keys, v6, v7, v8) == 1)
    {
      objc_msgSend_removeAllObjects(self, v9, v10, v11);
    }
    else
    {
      objc_msgSend_removeObject_(self->_keys, v9, (uint64_t)a3, v11);
      keyValues = self->_keyValues;
      objc_msgSend_removeObjectForKey_(keyValues, v12, (uint64_t)a3, v13);
    }
  }
}

- (void)removeAllObjects
{
  self->_keys = 0;
  self->_keyValues = 0;
}

- (id)allKeys
{
  v4 = objc_msgSend_copy(self->_keys, a2, v2, v3);

  return v4;
}

- (void)applyFunction:(void *)a3 withContext:(void *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  keys = self->_keys;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, a2, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(keys);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_objectForKey_(self->_keyValues, v9, v14, v10);
        ((void (*)(uint64_t, uint64_t, void *))a3)(v14, v15, a4);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v9, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v11);
  }
}

- (void)applyBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  keys = self->_keys;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, a2, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(keys);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKey_(self->_keyValues, v7, v12, v8);
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v12, v13);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v7, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v9);
  }
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_keys, a2, v2, v3);
}

- (id)allValues
{
  return (id)objc_msgSend_allValues(self->_keyValues, a2, v2, v3);
}

- (id)dictionary
{
  return self->_keyValues;
}

- (id)keys
{
  return self->_keys;
}

- (void)_setupFrom:(id)a3
{
  uint64_t v6 = objc_msgSend_dictionary(a3, a2, (uint64_t)a3, v3);
  self->_keyValues = (NSMutableDictionary *)objc_msgSend_mutableCopy(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_keys(a3, v10, v11, v12);
  self->_keys = (NSMutableArray *)objc_msgSend_mutableCopy(v13, v14, v15, v16);
}

- (id)copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend__setupFrom_(v3, v4, (uint64_t)self, v5);
  return v3;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p\n{\n", v7, v5, self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  keys = self->_keys;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v10, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(keys);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(self->_keyValues, v12, v17, v13);
        objc_msgSend_appendFormat_(v8, v19, @"    \"%@\" = \"%@\"\n", v20, v17, v18);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v12, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }
  objc_msgSend_appendString_(v8, v12, @"}>", v13);
  return v8;
}

@end