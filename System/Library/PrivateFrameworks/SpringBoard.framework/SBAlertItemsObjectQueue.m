@interface SBAlertItemsObjectQueue
- (BOOL)containsObject:(id)a3;
- (BOOL)hasObject;
- (BOOL)hasObjectOfClass:(Class)a3;
- (NSMutableOrderedSet)objects;
- (SBAlertItemsObjectQueue)init;
- (id)dequeueAllObjects;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)objectsOfClass:(Class)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)appendObject:(id)a3;
- (void)prependObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)setObjects:(id)a3;
@end

@implementation SBAlertItemsObjectQueue

- (BOOL)hasObjectOfClass:(Class)a3
{
  objects = self->_objects;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SBAlertItemsObjectQueue_hasObjectOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e15_B32__0_8Q16_B24lu32l8;
  v5[4] = a3;
  return [(NSMutableOrderedSet *)objects indexOfObjectPassingTest:v5] != 0x7FFFFFFFFFFFFFFFLL;
}

- (SBAlertItemsObjectQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBAlertItemsObjectQueue;
  v2 = [(SBAlertItemsObjectQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    objects = v2->_objects;
    v2->_objects = v3;
  }
  return v2;
}

- (void)appendObject:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBAlertItemsObjectQueue.m" lineNumber:34 description:@"Cannot append nil to the queue."];

    id v5 = 0;
  }
  [(NSMutableOrderedSet *)self->_objects addObject:v5];
}

- (void)prependObject:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBAlertItemsObjectQueue.m" lineNumber:39 description:@"Cannot prepend nil to the queue."];

    id v5 = 0;
  }
  [(NSMutableOrderedSet *)self->_objects insertObject:v5 atIndex:0];
}

- (BOOL)hasObject
{
  return [(NSMutableOrderedSet *)self->_objects count] != 0;
}

- (id)dequeueAllObjects
{
  v3 = (void *)[(NSMutableOrderedSet *)self->_objects copy];
  [(NSMutableOrderedSet *)self->_objects removeAllObjects];
  v4 = [v3 array];

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_objects containsObject:a3];
}

- (void)removeObject:(id)a3
{
  id v6 = a3;
  if (!-[SBAlertItemsObjectQueue containsObject:](self, "containsObject:"))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBAlertItemsObjectQueue.m" lineNumber:58 description:@"Trying to remove an object that is not in the queue."];
  }
  [(NSMutableOrderedSet *)self->_objects removeObject:v6];
}

uint64_t __44__SBAlertItemsObjectQueue_hasObjectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)objectsOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_objects;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableOrderedSet *)self->_objects countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)succinctDescription
{
  v2 = [(SBAlertItemsObjectQueue *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_objects withName:@"objects"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBAlertItemsObjectQueue *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSMutableOrderedSet)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end