@interface IPAEditDescription
+ (BOOL)containsValidOperations:(id)a3;
+ (Class)expectedOperationClass;
+ (id)presetifyAdjustmentStack:(id)a3;
+ (id)sortOperations:(id)a3 withOrdering:(id)a4;
+ (unint64_t)insertIndexForOperationWithIdentifier:(id)a3 inArray:(id)a4 withOrdering:(id)a5;
- (BOOL)containsOperationWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptionRenderOperations:(id)a3;
- (IPAEditDescription)descriptionWithOperations:(id)a3;
- (IPAEditDescription)descriptionWithOperationsUpToUUID:(id)a3;
- (IPAEditDescription)init;
- (IPAEditDescription)initWithOperations:(id)a3;
- (NSString)debugDescription;
- (id)_debugDescriptionSuffix;
- (id)_init;
- (id)_operationAtIndex:(unint64_t)a3;
- (id)_operations;
- (id)archivalRepresentation;
- (id)descriptionByAddingOperation:(id)a3;
- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4;
- (id)descriptionByRemovingOperation:(id)a3;
- (id)descriptionByRemovingOperationAtIndex:(unint64_t)a3;
- (id)descriptionByRemovingOperationsStartingAtIndex:(unint64_t)a3;
- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4;
- (id)firstOperationWithIdentifier:(id)a3;
- (id)operationAtIndex:(unint64_t)a3;
- (id)operationWithUUID:(id)a3;
- (id)operations;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)firstIndexOfOperationWithIdentifier:(id)a3;
- (unint64_t)indexOfOperationWithUUID:(id)a3;
- (unint64_t)insertIndexForOperationWithIdentifier:(id)a3;
- (unint64_t)operationCount;
- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3;
- (void)forEachImmutableOperation:(id)a3;
- (void)withImmutableOperationAtIndex:(unint64_t)a3 block:(id)a4;
@end

@implementation IPAEditDescription

- (void).cxx_destruct
{
}

- (NSString)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p operations=%@", objc_opt_class(), self, self->_operations];
  uint64_t v4 = [(IPAEditDescription *)self _debugDescriptionSuffix];
  v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@" %@", v4];
  }
  [v3 appendString:@">"];
  v6 = [v3 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

  return (NSString *)v6;
}

- (IPAEditDescription)descriptionWithOperationsUpToUUID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _PFAssertFailHandler();
  }
  v5 = v4;
  v6 = self;
  uint64_t v7 = [(NSArray *)v6->_operations count];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = v6->_operations;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        v15 = [v14 UUID];
        char v16 = [v5 isEqual:v15];

        if (v16) {
          break;
        }
        [v8 addObject:v14];
        if (v11 == ++v13)
        {
          uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    uint64_t v17 = [(IPAEditDescription *)v6 descriptionWithOperations:v8];

    v6 = (IPAEditDescription *)v17;
  }

  return v6;
}

- (id)descriptionByRemovingOperationsStartingAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSArray *)self->_operations count];
  v6 = self;
  if (v5 > a3)
  {
    uint64_t v7 = -[NSArray subarrayWithRange:](self->_operations, "subarrayWithRange:", 0, a3);
    uint64_t v8 = [(IPAEditDescription *)v6 descriptionWithOperations:v7];

    v6 = (IPAEditDescription *)v8;
  }
  return v6;
}

- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  if ([(NSArray *)v7->_operations count] > a4)
  {
    uint64_t v8 = (void *)[(NSArray *)v7->_operations mutableCopy];
    v9 = (void *)[v6 copy];
    [v8 replaceObjectAtIndex:a4 withObject:v9];
    uint64_t v10 = [(IPAEditDescription *)v7 descriptionWithOperations:v8];

    uint64_t v7 = (IPAEditDescription *)v10;
  }

  return v7;
}

- (id)descriptionByRemovingOperation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = self;
  if (v4)
  {
    id v6 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = v5->_operations;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isEqual:", v4, (void)v16) & 1) == 0) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [(NSArray *)v5->_operations count];
    if (v13 != [v6 count])
    {
      uint64_t v14 = [(IPAEditDescription *)v5 descriptionWithOperations:v6];

      unint64_t v5 = (IPAEditDescription *)v14;
    }
  }
  return v5;
}

- (id)descriptionByRemovingOperationAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_operations count] <= a3)
  {
    id v6 = self;
  }
  else
  {
    unint64_t v5 = (void *)[(NSArray *)self->_operations mutableCopy];
    [v5 removeObjectAtIndex:a3];
    id v6 = [(IPAEditDescription *)self descriptionWithOperations:v5];
  }
  return v6;
}

- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (void *)[a3 copyWithZone:0];
  uint64_t v7 = (void *)[(NSArray *)self->_operations mutableCopy];
  [v7 insertObject:v6 atIndex:a4];
  uint64_t v8 = [(IPAEditDescription *)self descriptionWithOperations:v7];

  return v8;
}

- (id)descriptionByAddingOperation:(id)a3
{
  id v4 = (void *)[a3 copyWithZone:0];
  unint64_t v5 = [(NSArray *)self->_operations arrayByAddingObject:v4];
  id v6 = [(IPAEditDescription *)self descriptionWithOperations:v5];

  return v6;
}

- (IPAEditDescription)descriptionWithOperations:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) _init];
    uint64_t v6 = [v4 copy];
    uint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    return (IPAEditDescription *)v5;
  }
  else
  {
    uint64_t v9 = (IPAEditDescription *)_PFAssertFailHandler();
    [(IPAEditDescription *)v9 withImmutableOperationAtIndex:v11 block:v12];
  }
  return result;
}

- (void)withImmutableOperationAtIndex:(unint64_t)a3 block:(id)a4
{
  SEL v10 = (void (**)(id, void *))a4;
  if (v10)
  {
    if ([(NSArray *)self->_operations count] > a3)
    {
      uint64_t v6 = [(NSArray *)self->_operations objectAtIndexedSubscript:a3];
      v10[2](v10, v6);
    }
  }
  else
  {
    uint64_t v7 = (IPAEditDescription *)_PFAssertFailHandler();
    [(IPAEditDescription *)v7 forEachImmutableOperation:v9];
  }
}

- (void)forEachImmutableOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = self->_operations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, v8 + v10, *(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v7 != v10);
      v8 += v10;
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_operations countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BOOL)containsOperationWithIdentifier:(id)a3
{
  return [(IPAEditDescription *)self firstIndexOfOperationWithIdentifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)operationWithUUID:(id)a3
{
  unint64_t v4 = [(IPAEditDescription *)self indexOfOperationWithUUID:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(IPAEditDescription *)self operationAtIndex:v4];
  }
  return v5;
}

- (id)operationAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || [(NSArray *)self->_operations count] <= a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_operations objectAtIndexedSubscript:a3];
    uint64_t v6 = (void *)[v5 copy];
  }
  return v6;
}

- (id)firstOperationWithIdentifier:(id)a3
{
  unint64_t v4 = [(IPAEditDescription *)self firstIndexOfOperationWithIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(IPAEditDescription *)self operationAtIndex:v4];
  }
  return v5;
}

- (unint64_t)insertIndexForOperationWithIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(id)objc_opt_class() insertIndexForOperationWithIdentifier:v4 inArray:self->_operations withOrdering:self];

  return v5;
}

- (unint64_t)indexOfOperationWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _PFAssertFailHandler();
  }
  unint64_t v5 = v4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_operations;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) UUID];
        char v14 = [v13 isEqual:v5];

        if (v14)
        {
          unint64_t v15 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v15;
}

- (unint64_t)firstIndexOfOperationWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _PFAssertFailHandler();
  }
  unint64_t v5 = v4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_operations;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9 + v8;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) identifier];
        char v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          unint64_t v15 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v15;
}

- (id)operations
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_operations copyItems:1];
  return v2;
}

- (unint64_t)operationCount
{
  return [(NSArray *)self->_operations count];
}

- (BOOL)isEqualToDescriptionRenderOperations:(id)a3
{
  id v4 = (id *)a3;
  uint64_t v5 = [v4 operationCount];
  if (v5 == [(IPAEditDescription *)self operationCount])
  {
    uint64_t v6 = [(NSArray *)self->_operations objectEnumerator];
    uint64_t v7 = [v4[1] objectEnumerator];
    uint64_t v8 = [v6 nextObject];
    uint64_t v9 = [v7 nextObject];
    uint64_t v10 = (void *)v9;
    LOBYTE(v11) = 1;
    if (v8 && v9)
    {
      while (1)
      {
        int v11 = [v8 isEqual:v10];
        if (!v11) {
          break;
        }
        uint64_t v12 = [v6 nextObject];

        long long v13 = [v7 nextObject];

        if (v12)
        {
          uint64_t v10 = v13;
          uint64_t v8 = v12;
          if (v13) {
            continue;
          }
        }
        goto LABEL_10;
      }
    }
    uint64_t v12 = v8;
    long long v13 = v10;
LABEL_10:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(IPAEditDescription *)self isEqualToDescription:v4];

  return v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IPAEditDescription;
  return [(IPAEditDescription *)&v3 init];
}

- (IPAEditDescription)init
{
  return 0;
}

+ (id)sortOperations:(id)a3 withOrdering:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  if (!v26) {
    _PFAssertFailHandler();
  }
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v14 = v13;
            unint64_t v15 = [v14 identifier];
            if (v15)
            {
              uint64_t v16 = [a1 insertIndexForOperationWithIdentifier:v15 inArray:v7 withOrdering:v26];
              if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v17 = IPAAdjustmentGetLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v32 = (uint64_t)a1;
                  __int16 v33 = 2112;
                  uint64_t v34 = (uint64_t)v14;
                  long long v18 = v17;
                  long long v19 = "%@ unable to divine insert index for operation: %@";
                  uint32_t v20 = 22;
                  goto LABEL_17;
                }
                goto LABEL_18;
              }
              [v7 insertObject:v14 atIndex:v16];
            }
            else
            {
              long long v17 = IPAAdjustmentGetLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v32 = (uint64_t)v14;
                long long v18 = v17;
                long long v19 = "%@ does not have an identifier";
                uint32_t v20 = 12;
LABEL_17:
                _os_log_impl(&dword_1DD3FD000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
              }
LABEL_18:
            }
            goto LABEL_21;
          }
          char v14 = IPAAdjustmentGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = (uint64_t)v13;
            _os_log_impl(&dword_1DD3FD000, v14, OS_LOG_TYPE_ERROR, "%@ is not an edit operation", buf, 0xCu);
          }
LABEL_21:
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v10);
    }

    uint64_t v21 = [v7 count];
    if (v21 != [v8 count])
    {
      uint64_t v22 = IPAAdjustmentGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v7 count];
        uint64_t v24 = [v8 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v32 = v23;
        __int16 v33 = 2048;
        uint64_t v34 = v24;
        _os_log_impl(&dword_1DD3FD000, v22, OS_LOG_TYPE_ERROR, "ordered count %lu doesn't match input count %lu - something went wrong (see above)", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

+ (unint64_t)insertIndexForOperationWithIdentifier:(id)a3 inArray:(id)a4 withOrdering:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    _PFAssertFailHandler();
LABEL_16:
    _PFAssertFailHandler();
  }
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v23 = v7;
  unint64_t v11 = [v9 sortOrderForOperationWithIdentifier:v7];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v25;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v15 + v14;
    while (1)
    {
      if (*(void *)v25 != v16) {
        objc_enumerationMutation(v12);
      }
      long long v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v17) identifier];
      unint64_t v20 = [v10 sortOrderForOperationWithIdentifier:v19];

      if (v11 < v20) {
        break;
      }
      if (v14 == ++v17)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
        uint64_t v15 = v18;
        if (v14) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    unint64_t v21 = v15 + v17;

    if (v15 + v17 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  unint64_t v21 = [v12 count];
LABEL_14:

  return v21;
}

- (id)_debugDescriptionSuffix
{
  return 0;
}

- (id)_operations
{
  return self->_operations;
}

- (id)_operationAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    if ([(NSArray *)self->_operations count] <= a3)
    {
      id v4 = 0;
    }
    else
    {
      id v4 = [(NSArray *)self->_operations objectAtIndexedSubscript:a3];
    }
  }
  return v4;
}

- (IPAEditDescription)initWithOperations:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPAEditDescription;
  BOOL v5 = [(IPAEditDescription *)&v9 init];
  if (v5)
  {
    if (v4) {
      uint64_t v6 = [v4 copy];
    }
    else {
      uint64_t v6 = objc_opt_new();
    }
    operations = v5->_operations;
    v5->_operations = (NSArray *)v6;
  }
  return v5;
}

- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  BOOL v5 = (IPAEditDescription *)_PFAssertFailHandler();
  return (unint64_t)[(IPAEditDescription *)v5 archivalRepresentation];
}

- (id)archivalRepresentation
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  id v3 = (void *)_PFAssertFailHandler();
  return (id)+[IPAEditDescription containsValidOperations:v5];
}

+ (BOOL)containsValidOperations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [(id)objc_opt_class() expectedOperationClass];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  return v4 == 0;
}

+ (Class)expectedOperationClass
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  id v3 = (void *)_PFAssertFailHandler();
  return (Class)+[IPAEditDescription presetifyAdjustmentStack:v5];
}

+ (id)presetifyAdjustmentStack:(id)a3
{
  id v3 = a3;
  SEL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  id v5 = (IPAPhotoAdjustmentStack *)_PFAssertFailHandler();
  [(IPAPhotoAdjustmentStack *)v5 .cxx_destruct];
  return result;
}

@end