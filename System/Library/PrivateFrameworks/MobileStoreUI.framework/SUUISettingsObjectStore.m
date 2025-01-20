@interface SUUISettingsObjectStore
- (BOOL)containsObject:(id)a3;
- (BOOL)objectIsVisible:(id)a3;
- (SUUISettingsObjectStore)init;
- (id)allObjects;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (id)visibleObjectAtIndex:(unint64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfVisibleObject:(id)a3;
- (unint64_t)numberOfObjects;
- (unint64_t)numberOfVisibleObjects;
- (void)_updateVisibleOrder;
- (void)addObject:(id)a3 hidden:(BOOL)a4;
- (void)enumerateObjects:(id)a3;
- (void)enumerateVisibleObjects:(id)a3;
- (void)hideObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)revealObject:(id)a3;
@end

@implementation SUUISettingsObjectStore

- (SUUISettingsObjectStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUUISettingsObjectStore;
  v2 = [(SUUISettingsObjectStore *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_dirty = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    allObjects = v3->_allObjects;
    v3->_allObjects = v4;

    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    visibleObjects = v3->_visibleObjects;
    v3->_visibleObjects = v6;
  }
  return v3;
}

- (id)allObjects
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_allObjects copy];
  return v2;
}

- (void)addObject:(id)a3 hidden:(BOOL)a4
{
  id v6 = a3;
  -[NSMutableOrderedSet addObject:](self->_allObjects, "addObject:");
  if (!a4) {
    [(NSMutableOrderedSet *)self->_visibleObjects addObject:v6];
  }
}

- (BOOL)containsObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_allObjects indexOfObject:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateObjects:(id)a3
{
}

- (void)enumerateVisibleObjects:(id)a3
{
  id v4 = a3;
  if (self->_dirty) {
    [(SUUISettingsObjectStore *)self _updateVisibleOrder];
  }
  [(NSMutableOrderedSet *)self->_visibleObjects enumerateObjectsUsingBlock:v4];
}

- (void)hideObject:(id)a3
{
}

- (unint64_t)indexOfObject:(id)a3
{
  return [(NSMutableOrderedSet *)self->_allObjects indexOfObject:a3];
}

- (unint64_t)indexOfVisibleObject:(id)a3
{
  id v4 = a3;
  if (self->_dirty) {
    [(SUUISettingsObjectStore *)self _updateVisibleOrder];
  }
  unint64_t v5 = [(NSMutableOrderedSet *)self->_visibleObjects indexOfObject:v4];

  return v5;
}

- (unint64_t)numberOfObjects
{
  return [(NSMutableOrderedSet *)self->_allObjects count];
}

- (unint64_t)numberOfVisibleObjects
{
  return [(NSMutableOrderedSet *)self->_visibleObjects count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableOrderedSet *)self->_allObjects objectAtIndex:a3];
}

- (BOOL)objectIsVisible:(id)a3
{
  return [(NSMutableOrderedSet *)self->_visibleObjects indexOfObject:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removeObject:(id)a3
{
  allObjects = self->_allObjects;
  id v5 = a3;
  [(NSMutableOrderedSet *)allObjects removeObject:v5];
  [(NSMutableOrderedSet *)self->_visibleObjects removeObject:v5];
}

- (void)revealObject:(id)a3
{
  visibleObjects = self->_visibleObjects;
  id v5 = a3;
  self->_dirty = [(NSMutableOrderedSet *)visibleObjects count] != 0;
  [(NSMutableOrderedSet *)self->_visibleObjects addObject:v5];
}

- (id)visibleObjectAtIndex:(unint64_t)a3
{
  if (self->_dirty) {
    [(SUUISettingsObjectStore *)self _updateVisibleOrder];
  }
  visibleObjects = self->_visibleObjects;
  return (id)[(NSMutableOrderedSet *)visibleObjects objectAtIndex:a3];
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v20.receiver = self;
  v20.super_class = (Class)SUUISettingsObjectStore;
  id v4 = [(SUUISettingsObjectStore *)&v20 description];
  id v5 = (void *)[v3 initWithFormat:@"%@: [", v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_allObjects;
  uint64_t v6 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ([(NSMutableOrderedSet *)self->_visibleObjects containsObject:v10]) {
          v11 = @"\nX ";
        }
        else {
          v11 = @"\n  ";
        }
        [v5 appendString:v11];
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        [v5 appendFormat:@"<%@: %p>", v13, v10];
      }
      uint64_t v7 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  [v5 appendString:@"\n]"];
  return v5;
}

- (void)_updateVisibleOrder
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_allObjects;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (-[NSMutableOrderedSet indexOfObject:](self->_visibleObjects, "indexOfObject:", v9, (void)v11) != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableOrderedSet *)v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  visibleObjects = self->_visibleObjects;
  self->_visibleObjects = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleObjects, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

@end