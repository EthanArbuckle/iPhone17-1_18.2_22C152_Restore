@interface RBAssertionCollection
- (BOOL)hasAssertion:(id)a3;
- (BOOL)hasAssertionsForOriginator:(id)a3;
- (BOOL)hasAssertionsForOriginator:(id)a3 exceedingCount:(unint64_t)a4;
- (BOOL)hasResolvedAssertion:(id)a3;
- (RBAssertionCollection)init;
- (id)allAssertions;
- (id)assertionWithIdentifier:(id)a3;
- (id)assertionsForOriginator:(id)a3;
- (id)assertionsForTarget:(id)a3;
- (id)assertionsForTargetIdentity:(id)a3;
- (unint64_t)assertionCountForOriginator:(id)a3;
- (unint64_t)assertionCountForTargetProcessIdentity:(id)a3;
- (unint64_t)count;
- (void)addAssertion:(id)a3;
- (void)enumerateAssertionsForOriginator:(id)a3 withBlock:(id)a4;
- (void)enumerateAssertionsForProcessTargetsWithBlock:(id)a3;
- (void)enumerateAssertionsForSystemTargetWithBlock:(id)a3;
- (void)enumerateAssertionsForTargetProcessIdentity:(id)a3 withBlock:(id)a4;
- (void)enumerateAssertionsWithBlock:(id)a3;
- (void)noteResolvedAssertion:(id)a3;
- (void)removeAssertion:(id)a3;
@end

@implementation RBAssertionCollection

- (unint64_t)assertionCountForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 count];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (BOOL)hasAssertionsForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v5 count] != 0;
  os_unfair_recursive_lock_unlock();
  return (char)v4;
}

- (unint64_t)count
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t v3 = [(NSMutableDictionary *)self->_assertionsByIdentifier count];
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)addAssertion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  v5 = [v4 target];
  unint64_t v6 = [v4 originator];
  v7 = [v6 identifier];

  v8 = [v4 identifier];
  v9 = [v5 identity];
  [(NSMutableDictionary *)self->_assertionsByIdentifier setObject:v4 forKeyedSubscript:v8];
  v10 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKey:v7];
  if (!v10)
  {
    v10 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)self->_assertionsByOriginator setObject:v10 forKey:v7];
  }
  [v10 addObject:v4];
  v11 = rbs_assertion_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[RBAssertionCollection addAssertion:]((uint64_t)v4, v11);
  }

  v12 = rbs_assertion_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v17 = [(NSMutableDictionary *)self->_assertionsByIdentifier count];
    int v18 = 67109634;
    *(_DWORD *)v19 = v17;
    *(_WORD *)&v19[4] = 2114;
    *(void *)&v19[6] = v7;
    __int16 v20 = 1024;
    int v21 = [v10 count];
    _os_log_debug_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEBUG, "Now tracking %u assertions (%{public}@ holds %u).", (uint8_t *)&v18, 0x18u);
  }

  if ([v5 isSystem])
  {
    [(NSMutableSet *)self->_systemAssertions addObject:v4];
  }
  else
  {
    [(NSMutableSet *)self->_processAssertions addObject:v4];
    v13 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKey:v9];
    if (!v13)
    {
      v13 = [MEMORY[0x263EFF9C0] set];
      [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity setObject:v13 forKey:v9];
    }
    [v13 addObject:v4];
    v14 = rbs_assertion_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKeyedSubscript:v9];
      int v16 = [v15 count];
      int v18 = 138543618;
      *(void *)v19 = v9;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v16;
      _os_log_impl(&dword_226AB3000, v14, OS_LOG_TYPE_INFO, "%{public}@ is now targeted by %u assertions", (uint8_t *)&v18, 0x12u);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (void)removeAssertion:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  v5 = [v4 target];
  unint64_t v6 = [v4 originator];
  v7 = [v6 identifier];

  v8 = [v4 identifier];
  v9 = [v5 identity];
  [(NSMutableDictionary *)self->_assertionsByIdentifier removeObjectForKey:v8];
  [(NSMutableSet *)self->_resolvedIdentifiers removeObject:v8];
  v10 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKeyedSubscript:v7];
  v11 = v10;
  if (v10) {
    [v10 removeObject:v4];
  }
  if (![v11 count]) {
    [(NSMutableDictionary *)self->_assertionsByOriginator removeObjectForKey:v7];
  }
  v12 = rbs_assertion_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v23 = [(NSMutableDictionary *)self->_assertionsByIdentifier count];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v23;
    *(_WORD *)&v28[4] = 2114;
    *(void *)&v28[6] = v7;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = [v11 count];
    _os_log_debug_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEBUG, "Now tracking %u assertions (%{public}@ holds %u).", buf, 0x18u);
  }

  v13 = rbs_assertion_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    v15 = rbs_assertion_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(RBAssertionCollection *)(uint64_t)v8 removeAssertion:v15];
    }

    [v11 enumerateObjectsUsingBlock:&__block_literal_global_13];
  }
  if ([v5 isSystem])
  {
    [(NSMutableSet *)self->_systemAssertions removeObject:v4];
  }
  else
  {
    [(NSMutableSet *)self->_processAssertions removeObject:v4];
    int v16 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKey:v9];
    [v16 removeObject:v4];
    if (![v16 count]) {
      [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity removeObjectForKey:v9];
    }
    v24 = v9;
    int v17 = rbs_assertion_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKeyedSubscript:v9];
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 138543618;
      *(void *)v28 = v24;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v19;
      _os_log_impl(&dword_226AB3000, v17, OS_LOG_TYPE_INFO, "%{public}@ is now targeted by %lu assertions", buf, 0x16u);
    }
    __int16 v20 = rbs_assertion_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

    if (v21)
    {
      uint64_t v22 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKeyedSubscript:v24];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __41__RBAssertionCollection_removeAssertion___block_invoke_2;
      v25[3] = &unk_2647C7EC8;
      id v26 = v7;
      [v22 enumerateObjectsUsingBlock:v25];
    }
    v9 = v24;
  }
  os_unfair_recursive_lock_unlock();
}

- (id)assertionWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByIdentifier objectForKeyedSubscript:v4];

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)noteResolvedAssertion:(id)a3
{
  resolvedIdentifiers = self->_resolvedIdentifiers;
  id v4 = [a3 identifier];
  [(NSMutableSet *)resolvedIdentifiers addObject:v4];
}

- (id)assertionsForTargetIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKey:v4];

  unint64_t v6 = (void *)[v5 copy];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)assertionsForTarget:(id)a3
{
  id v4 = a3;
  if ([v4 isSystem])
  {
    os_unfair_recursive_lock_lock_with_options();
    v5 = (void *)[(NSMutableSet *)self->_systemAssertions copy];
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    unint64_t v6 = [v4 identity];
    v5 = [(RBAssertionCollection *)self assertionsForTargetIdentity:v6];
  }
  return v5;
}

- (BOOL)hasResolvedAssertion:(id)a3
{
  resolvedIdentifiers = self->_resolvedIdentifiers;
  id v4 = [a3 identifier];
  LOBYTE(resolvedIdentifiers) = [(NSMutableSet *)resolvedIdentifiers containsObject:v4];

  return (char)resolvedIdentifiers;
}

- (BOOL)hasAssertionsForOriginator:(id)a3 exceedingCount:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v7 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKeyedSubscript:v6];
  if ([v7 count] <= a4)
  {
    BOOL v14 = 0;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_assertionsByOriginator, "objectForKeyedSubscript:", v6, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isValid])
          {
            if (++v11 > a4)
            {
              BOOL v14 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_14:
  }
  os_unfair_recursive_lock_unlock();

  return v14;
}

- (void)enumerateAssertionsForTargetProcessIdentity:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  v8 = [(NSMutableDictionary *)self->_assertionsByTargetProcessIdentity objectForKey:v6];
  uint64_t v9 = [v8 allObjects];

  os_unfair_recursive_lock_unlock();
  unsigned __int8 v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
      long long v16 = (void *)MEMORY[0x22A660FC0](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      if (v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v12 = v11;
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)assertionsForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKey:v4];

  id v6 = (void *)[v5 copy];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (RBAssertionCollection)init
{
  v17.receiver = self;
  v17.super_class = (Class)RBAssertionCollection;
  v2 = [(RBAssertionCollection *)&v17 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_lock = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    assertionsByIdentifier = v3->_assertionsByIdentifier;
    v3->_assertionsByIdentifier = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    processAssertions = v3->_processAssertions;
    v3->_processAssertions = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    systemAssertions = v3->_systemAssertions;
    v3->_systemAssertions = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    assertionsByTargetProcessIdentity = v3->_assertionsByTargetProcessIdentity;
    v3->_assertionsByTargetProcessIdentity = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    assertionsByOriginator = v3->_assertionsByOriginator;
    v3->_assertionsByOriginator = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9C0] set];
    resolvedIdentifiers = v3->_resolvedIdentifiers;
    v3->_resolvedIdentifiers = (NSMutableSet *)v14;
  }
  return v3;
}

- (id)allAssertions
{
  os_unfair_recursive_lock_lock_with_options();
  processAssertions = self->_processAssertions;
  if (self->_systemAssertions)
  {
    if (processAssertions)
    {
      uint64_t v4 = -[NSMutableSet setByAddingObjectsFromSet:](processAssertions, "setByAddingObjectsFromSet:");
      goto LABEL_6;
    }
    processAssertions = self->_systemAssertions;
  }
  uint64_t v4 = [(NSMutableSet *)processAssertions copy];
LABEL_6:
  v5 = (void *)v4;
  os_unfair_recursive_lock_unlock();
  return v5;
}

- (void)enumerateAssertionsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByIdentifier allValues];
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x22A660FC0](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForSystemTargetWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableSet *)self->_systemAssertions allObjects];
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x22A660FC0](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForProcessTargetsWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableSet *)self->_processAssertions allObjects];
  os_unfair_recursive_lock_unlock();
  unsigned __int8 v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      uint64_t v12 = (void *)MEMORY[0x22A660FC0](v7);
      v4[2](v4, v11, &v17);
      LODWORD(v11) = v17;
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateAssertionsForOriginator:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, unsigned __int8 *))a4;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKey:v6];
  uint64_t v9 = [v8 allObjects];

  os_unfair_recursive_lock_unlock();
  unsigned __int8 v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
      long long v16 = (void *)MEMORY[0x22A660FC0](v11);
      v7[2](v7, v15, &v21);
      LODWORD(v15) = v21;
      if (v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        uint64_t v12 = v11;
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __41__RBAssertionCollection_removeAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = rbs_assertion_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(v2);
  }
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = rbs_assertion_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(a1, v3);
  }
}

- (BOOL)hasAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  assertionsByIdentifier = self->_assertionsByIdentifier;
  id v6 = [v4 identifier];

  uint64_t v7 = [(NSMutableDictionary *)assertionsByIdentifier objectForKeyedSubscript:v6];
  LOBYTE(assertionsByIdentifier) = v7 != 0;

  os_unfair_recursive_lock_unlock();
  return (char)assertionsByIdentifier;
}

- (unint64_t)assertionCountForOriginator:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = [(NSMutableDictionary *)self->_assertionsByOriginator objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 count];
  os_unfair_recursive_lock_unlock();
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionsByTargetProcessIdentity, 0);
  objc_storeStrong((id *)&self->_assertionsByOriginator, 0);
  objc_storeStrong((id *)&self->_systemAssertions, 0);
  objc_storeStrong((id *)&self->_processAssertions, 0);
  objc_storeStrong((id *)&self->_assertionsByIdentifier, 0);
}

- (void)removeAssertion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_226AB3000, log, OS_LOG_TYPE_DEBUG, "Removing assertion %{public}@ on %{public}@", (uint8_t *)&v3, 0x16u);
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_cold_1(void *a1)
{
  id v2 = [a1 target];
  int v3 = [v2 identity];
  uint64_t v4 = [a1 explanation];
  __int16 v5 = [a1 identifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_226AB3000, v6, v7, "> %{public}@ ['%{public}@'] [%{public}@]", v8, v9, v10, v11, v12);
}

void __41__RBAssertionCollection_removeAssertion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  int v3 = [a2 explanation];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_226AB3000, v5, v6, "> %{public}@ ['%{public}@'] [%{public}@]", v7, v8, v9, v10, v11);
}

- (void)addAssertion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226AB3000, a2, OS_LOG_TYPE_DEBUG, "Adding assertion %{public}@", (uint8_t *)&v2, 0xCu);
}

@end