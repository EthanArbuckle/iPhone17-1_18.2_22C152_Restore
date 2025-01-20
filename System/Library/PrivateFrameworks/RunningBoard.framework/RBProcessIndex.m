@interface RBProcessIndex
+ (RBProcessIndex)indexWithCapacity:(unint64_t)a3;
+ (id)index;
- (BOOL)addProcess:(id)a3;
- (BOOL)addProcess:(id)a3 existingProcess:(id *)a4;
- (BOOL)containsIdentifier:(id)a3;
- (BOOL)containsIdentity:(id)a3;
- (BOOL)containsInstance:(id)a3;
- (BOOL)containsProcess:(id)a3;
- (BOOL)removeProcess:(id)a3;
- (RBProcessIndex)init;
- (id)allProcesses;
- (id)processForIdentifier:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)processForInstance:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_lock_removeProcess:(id *)a1;
- (void)initWithCapacity:(void *)a1;
- (void)removeAllObjects;
@end

@implementation RBProcessIndex

- (id)processForIdentity:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    v6 = [(NSMutableDictionary *)self->_processByIdentity objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)processForIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    processByIdentifier = self->_processByIdentifier;
    v7 = [MEMORY[0x263F64580] identifierForIdentifier:v4];
    v8 = [(NSMutableDictionary *)processByIdentifier objectForKey:v7];
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)containsIdentity:(id)a3
{
  v3 = [(RBProcessIndex *)self processForIdentity:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)containsProcess:(id)a3
{
  BOOL v4 = [a3 instance];
  LOBYTE(self) = [(RBProcessIndex *)self containsInstance:v4];

  return (char)self;
}

- (BOOL)containsInstance:(id)a3
{
  v3 = [(RBProcessIndex *)self processForInstance:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)processForInstance:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    v6 = [(NSMutableDictionary *)self->_processByInstance objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(RBProcessIndex *)self allProcesses];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (id)allProcesses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableOrderedSet *)self->_processes objectEnumerator];
  v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)addProcess:(id)a3 existingProcess:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  char v7 = [(NSMutableOrderedSet *)self->_processes containsObject:v6];
  if ((v7 & 1) == 0)
  {
    v8 = [v6 identity];
    unint64_t v9 = [v6 instance];
    v10 = [MEMORY[0x263F64580] identifierForIdentifier:v6];
    uint64_t v11 = [(NSMutableDictionary *)self->_processByIdentifier objectForKey:v10];
    if (!v6) {
      -[RBProcessIndex addProcess:existingProcess:]();
    }
    if (!v8) {
      -[RBProcessIndex addProcess:existingProcess:]();
    }
    if (!v9) {
      -[RBProcessIndex addProcess:existingProcess:]();
    }
    if (!v10) {
      -[RBProcessIndex addProcess:existingProcess:].cold.4();
    }
    v12 = (void *)v11;
    v13 = rbs_ttl_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      v20 = v12;
      _os_log_impl(&dword_226AB3000, v13, OS_LOG_TYPE_DEFAULT, "Existing process in RBProcessIndex is: %{public}@", (uint8_t *)&v19, 0xCu);
    }

    if (v12)
    {
      int v14 = [v12 pidversion];
      if (v14 == [v6 pidversion])
      {
        v15 = rbs_ttl_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          int v19 = 138543874;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v6;
          __int16 v23 = 2114;
          v24 = v10;
          _os_log_fault_impl(&dword_226AB3000, v15, OS_LOG_TYPE_FAULT, "cannot map existing process %{public}@ and new process %{public}@ which have the same identifier: %{public}@", (uint8_t *)&v19, 0x20u);
        }
      }
      else
      {
        v16 = rbs_process_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543618;
          v20 = v12;
          __int16 v21 = 2114;
          id v22 = v6;
          _os_log_impl(&dword_226AB3000, v16, OS_LOG_TYPE_DEFAULT, "replacing %{public}@ which appears to have been exec'd into %{public}@", (uint8_t *)&v19, 0x16u);
        }

        if (a4) {
          *a4 = v12;
        }
      }
    }
    [(NSMutableOrderedSet *)self->_processes insertObject:v6 atIndex:0];
    [(NSMutableDictionary *)self->_processByIdentity setObject:v6 forKey:v8];
    [(NSMutableDictionary *)self->_processByInstance setObject:v6 forKey:v9];
    [(NSMutableDictionary *)self->_processByIdentifier setObject:v6 forKey:v10];
    if (self->_capacity && [(NSMutableOrderedSet *)self->_processes count] > self->_capacity)
    {
      v17 = [(NSMutableOrderedSet *)self->_processes lastObject];
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v17);
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v7 ^ 1;
}

- (BOOL)addProcess:(id)a3
{
  return [(RBProcessIndex *)self addProcess:a3 existingProcess:0];
}

- (unint64_t)count
{
  return [(NSMutableOrderedSet *)self->_processes count];
}

- (BOOL)removeProcess:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    int v5 = [(NSMutableOrderedSet *)self->_processes containsObject:v4];
    if (v5) {
      -[RBProcessIndex _lock_removeProcess:]((id *)&self->super.isa, v4);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_lock_removeProcess:(id *)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v10 = v3;
    id v4 = [v3 instance];
    int v5 = [v10 identity];
    id v6 = [MEMORY[0x263F64580] identifierForIdentifier:v10];
    [a1[3] removeObject:v10];
    id v7 = [a1[5] objectForKey:v4];
    if (v7 == v10) {
      [a1[5] removeObjectForKey:v4];
    }
    id v8 = [a1[6] objectForKey:v6];

    if (v8 == v10) {
      [a1[6] removeObjectForKey:v6];
    }
    id v9 = [a1[4] objectForKey:v5];

    if (v9 == v10) {
      [a1[4] removeObjectForKey:v5];
    }

    id v3 = v10;
  }
}

+ (id)index
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (RBProcessIndex)indexWithCapacity:(unint64_t)a3
{
  id v3 = -[RBProcessIndex initWithCapacity:]([RBProcessIndex alloc], a3);
  return (RBProcessIndex *)v3;
}

- (void)initWithCapacity:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)RBProcessIndex;
  id v3 = objc_msgSendSuper2(&v14, sel_init);
  id v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 2) = 0;
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v6 = (void *)v4[3];
    v4[3] = v5;

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = (void *)v4[4];
    v4[4] = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v10 = (void *)v4[5];
    v4[5] = v9;

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v12 = (void *)v4[6];
    v4[6] = v11;
  }
  return v4;
}

- (RBProcessIndex)init
{
  return (RBProcessIndex *)-[RBProcessIndex initWithCapacity:](self, 0);
}

- (BOOL)containsIdentifier:(id)a3
{
  id v3 = [(RBProcessIndex *)self processForIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)removeAllObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(NSMutableOrderedSet *)self->_processes removeAllObjects];
  [(NSMutableDictionary *)self->_processByIdentity removeAllObjects];
  [(NSMutableDictionary *)self->_processByInstance removeAllObjects];
  [(NSMutableDictionary *)self->_processByIdentifier removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processByIdentifier, 0);
  objc_storeStrong((id *)&self->_processByInstance, 0);
  objc_storeStrong((id *)&self->_processByIdentity, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

- (void)addProcess:existingProcess:.cold.1()
{
}

- (void)addProcess:existingProcess:.cold.2()
{
}

- (void)addProcess:existingProcess:.cold.3()
{
}

- (void)addProcess:existingProcess:.cold.4()
{
}

@end