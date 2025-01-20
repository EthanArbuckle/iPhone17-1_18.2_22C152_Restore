@interface _UIEvaluatedObjectCache
- (NSString)debugDescription;
- (_UIEvaluatedObjectCache)init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sortedObjects;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)topEvaluatedObject;
- (void)_createStorageIfNeeded;
- (void)addObject:(uint64_t)a1;
- (void)demoteObject:(uint64_t)a1;
- (void)evaluateTopObject;
- (void)initWithSortComparator:(const void *)a3 evaluationBlock:;
- (void)promoteObject:(uint64_t)a1;
- (void)removeObject:(uint64_t)a1;
- (void)sortAndEvaluateTopObject;
@end

@implementation _UIEvaluatedObjectCache

- (id)sortedObjects
{
  if (a1)
  {
    v2 = a1;
    -[_UIEvaluatedObjectCache _createStorageIfNeeded]((uint64_t)a1);
    a1 = (id *)[v2[3] copy];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_createStorageIfNeeded
{
  if (a1 && !*(void *)(a1 + 24))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:1];
    v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v2;
  }
}

- (void)sortAndEvaluateTopObject
{
  if (a1)
  {
    if ((unint64_t)[*(id *)(a1 + 24) count] >= 2) {
      [*(id *)(a1 + 24) sortWithOptions:16 usingComparator:*(void *)(a1 + 8)];
    }
    -[_UIEvaluatedObjectCache evaluateTopObject](a1);
  }
}

- (void)initWithSortComparator:(const void *)a3 evaluationBlock:
{
  if (!a1) {
    return 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)_UIEvaluatedObjectCache;
  v5 = objc_msgSendSuper2(&v11, sel_init);
  if (v5)
  {
    v6 = _Block_copy(a2);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = _Block_copy(a3);
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (void)evaluateTopObject
{
  if (a1)
  {
    if ([*(id *)(a1 + 24) count] && *(void *)(a1 + 16))
    {
      uint64_t v6 = 0;
      v7 = &v6;
      uint64_t v8 = 0x3032000000;
      v9 = __Block_byref_object_copy__92;
      v10 = __Block_byref_object_dispose__92;
      id v11 = 0;
      uint64_t v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __44___UIEvaluatedObjectCache_evaluateTopObject__block_invoke;
      v5[3] = &unk_1E52EE978;
      v5[4] = a1;
      v5[5] = &v6;
      [v2 enumerateObjectsWithOptions:2 usingBlock:v5];
      v3 = (void *)v7[5];
      if (!v3) {
        v3 = *(void **)(a1 + 32);
      }
      objc_storeStrong((id *)(a1 + 32), v3);
      _Block_object_dispose(&v6, 8);
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;
    }
  }
}

- (void)addObject:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_addObject_, a1, @"_UIEvaluatedObjectCache.m", 94, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    if (([*(id *)(a1 + 24) containsObject:a2] & 1) == 0) {
      [*(id *)(a1 + 24) addObject:a2];
    }
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (_UIEvaluatedObjectCache)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIEvaluatedObjectCache.m", 26, @"%s: init is not allowed on %@", "-[_UIEvaluatedObjectCache init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEvaluatedObjectCache *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(_UIEvaluatedObjectCache *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableOrderedSet count](self->_sortedObjects, "count"), @"sortedObjects.count");
  id topEvaluatedObject = self->_topEvaluatedObject;
  if (topEvaluatedObject)
  {
    uint64_t v6 = NSString;
    id v7 = topEvaluatedObject;
    uint64_t v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v6 stringWithFormat:@"<%@: %p>", v9, v7];
  }
  else
  {
    v10 = @"(nil)";
  }
  id v11 = (id)[v3 appendObject:v10 withName:@"topEvaluatedObject"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEvaluatedObjectCache *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEvaluatedObjectCache *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (void)removeObject:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_removeObject_, a1, @"_UIEvaluatedObjectCache.m", 104, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
    }
    if ([*(id *)(a1 + 24) containsObject:a2])
    {
      [*(id *)(a1 + 24) removeObject:a2];
      -[_UIEvaluatedObjectCache evaluateTopObject](a1);
    }
  }
}

- (void)promoteObject:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_promoteObject_, a1, @"_UIEvaluatedObjectCache.m", 116, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    int v4 = [*(id *)(a1 + 24) containsObject:a2];
    v5 = *(void **)(a1 + 24);
    if (v4)
    {
      [v5 removeObject:a2];
      v5 = *(void **)(a1 + 24);
    }
    [v5 addObject:a2];
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (void)demoteObject:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      int v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_demoteObject_, a1, @"_UIEvaluatedObjectCache.m", 129, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
    }
    -[_UIEvaluatedObjectCache _createStorageIfNeeded](a1);
    if ([*(id *)(a1 + 24) containsObject:a2]) {
      [*(id *)(a1 + 24) removeObject:a2];
    }
    [*(id *)(a1 + 24) insertObject:a2 atIndex:0];
    -[_UIEvaluatedObjectCache sortAndEvaluateTopObject](a1);
  }
}

- (id)topEvaluatedObject
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topEvaluatedObject, 0);
  objc_storeStrong((id *)&self->_sortedObjects, 0);
  objc_storeStrong(&self->_evaluationBlock, 0);
  objc_storeStrong(&self->_sortComparator, 0);
}

@end