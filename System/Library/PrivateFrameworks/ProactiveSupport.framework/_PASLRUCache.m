@interface _PASLRUCache
- (_PASLRUCache)initWithCountLimit:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _PASLRUCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33___PASLRUCache_setObject_forKey___block_invoke;
  v11[3] = &unk_1E5AEB200;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2514;
  v16 = __Block_byref_object_dispose__2515;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29___PASLRUCache_objectForKey___block_invoke;
  v9[3] = &unk_1E5AEB1D8;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)removeAllObjects
{
}

- (_PASLRUCache)initWithCountLimit:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_PASLRUCache;
  id v4 = [(_PASLRUCache *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_countLimit = a3;
    id v6 = [_PASLock alloc];
    id v7 = objc_opt_new();
    uint64_t v8 = [(_PASLock *)v6 initWithGuardedData:v7];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, char *))a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2514;
  v28 = __Block_byref_object_dispose__2515;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2514;
  v22 = __Block_byref_object_dispose__2515;
  id v23 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50___PASLRUCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v17[3] = &unk_1E5AEB270;
  v17[4] = &v24;
  v17[5] = &v18;
  [(_PASLock *)lock runWithLockAcquired:v17];
  char v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = (id)v19[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      objc_super v11 = objc_msgSend((id)v25[5], "objectForKeyedSubscript:", v10, (void)v12);
      v4[2](v4, v10, v11, &v16);
      LOBYTE(v10) = v16 == 0;

      if ((v10 & 1) == 0) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35___PASLRUCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5AEB228;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

@end