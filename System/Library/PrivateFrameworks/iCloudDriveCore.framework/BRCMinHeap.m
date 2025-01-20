@interface BRCMinHeap
- (BOOL)check;
- (BOOL)containsObject:(id)a3;
- (BRCMinHeap)init;
- (BRCMinHeap)initWithComparator:(id)a3;
- (id)description;
- (id)firstObject;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_moveDown:(id)a3 index:(unint64_t)a4;
- (void)_moveUp:(id)a3 index:(unint64_t)a4;
- (void)_moveUpOrDown:(id)a3 index:(unint64_t)a4;
- (void)_shrink;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)firstObjectWeightChanged;
- (void)objectWeightChanged:(id)a3;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeObject:(id)a3;
@end

@implementation BRCMinHeap

- (BRCMinHeap)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[BRCMinHeap init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCMinHeap)initWithComparator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRCMinHeap;
  v5 = [(BRCMinHeap *)&v11 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x2455D9A50](v4);
    id comparator = v5->_comparator;
    v5->_id comparator = (id)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    objects = v5->_objects;
    v5->_objects = (NSMapTable *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:32];
  [v3 appendFormat:@"<BRCMinHeap %p objects:%@ array:[", self, self->_objects];
  if (self->_size)
  {
    unint64_t v4 = 0;
    do
    {
      [v3 appendFormat:@"%p:%@, ", self->_array[v4], self->_array[v4]];
      ++v4;
    }
    while (v4 < self->_size);
  }
  [v3 appendString:@"]>"];
  return v3;
}

- (void)dealloc
{
  [(BRCMinHeap *)self removeAllObjects];
  free(self->_array);
  v3.receiver = self;
  v3.super_class = (Class)BRCMinHeap;
  [(BRCMinHeap *)&v3 dealloc];
}

- (void)_shrink
{
  unint64_t count = self->_count;
  if (count >= 8)
  {
    unint64_t size = self->_size;
    if (size >= 4 * count)
    {
      v5 = (id *)malloc_type_realloc(self->_array, 4 * (size & 0x1FFFFFFFFFFFFFFFLL), 0x386AD65FuLL);
      unint64_t v6 = self->_size >> 1;
      self->_array = v5;
      self->_unint64_t size = v6;
    }
  }
}

- (BOOL)check
{
  unint64_t count = self->_count;
  if (count == [(NSMapTable *)self->_objects count])
  {
    if (!self->_count) {
      return 1;
    }
    uint64_t v4 = 0;
    while (self->_array[v4])
    {
      v5 = -[NSMapTable objectForKey:](self->_objects, "objectForKey:");
      unint64_t v6 = v5;
      if (!v5 || v4 != [v5 unsignedIntegerValue]) {
        goto LABEL_10;
      }

      if (++v4 >= self->_count) {
        return 1;
      }
    }
    unint64_t v6 = 0;
LABEL_10:
  }
  return 0;
}

- (void)_moveUp:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    while (1)
    {
      unint64_t v7 = a4 - 1;
      unint64_t v8 = (a4 - 1) >> 1;
      id v9 = self->_array[v8];
      if ((*((uint64_t (**)(void))self->_comparator + 2))() <= 0) {
        break;
      }
      self->_array[a4] = v9;
      objects = self->_objects;
      objc_super v11 = NSNumber;
      id v12 = v9;
      v13 = self;
      v14 = [v11 numberWithUnsignedInteger:a4];
      [(NSMapTable *)objects setObject:v14 forKey:v12];

      a4 = v8;
      if (v7 <= 1) {
        goto LABEL_7;
      }
    }

    unint64_t v8 = a4;
  }
  else
  {
    unint64_t v8 = 0;
  }
LABEL_7:
  self->_array[v8] = v6;
  v15 = self->_objects;
  v16 = NSNumber;
  id v19 = v6;
  v17 = self;
  v18 = [v16 numberWithUnsignedInteger:v8];
  [(NSMapTable *)v15 setObject:v18 forKey:v19];
}

- (void)_moveDown:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = (2 * a4) | 1;
  if (v7 < self->_count)
  {
    uint64_t v8 = 2 * a4;
    while (1)
    {
      uint64_t v9 = (*((uint64_t (**)(void))self->_comparator + 2))();
      unint64_t v10 = v8 + 2;
      unint64_t count = self->_count;
      if (v9 < 0)
      {
        if (v8 + 2 >= count || ((*((uint64_t (**)(void))self->_comparator + 2))() & 0x8000000000000000) == 0) {
          unint64_t v10 = v7;
        }
      }
      else
      {
        if (v8 + 2 >= count) {
          break;
        }
        if ((*((uint64_t (**)(void))self->_comparator + 2))() >= 0) {
          unint64_t v10 = a4;
        }
      }
      if (v10 == a4) {
        break;
      }
      array = self->_array;
      id v13 = array[v10];
      array[a4] = v13;
      objects = self->_objects;
      v15 = NSNumber;
      id v16 = v13;
      v17 = self;
      v18 = [v15 numberWithUnsignedInteger:a4];
      [(NSMapTable *)objects setObject:v18 forKey:v16];

      uint64_t v8 = 2 * v10;
      unint64_t v7 = (2 * v10) | 1;
      a4 = v10;
      if (v7 >= self->_count) {
        goto LABEL_15;
      }
    }
  }
  unint64_t v10 = a4;
LABEL_15:
  self->_array[v10] = v6;
  id v19 = self->_objects;
  v20 = NSNumber;
  id v23 = v6;
  v21 = self;
  v22 = [v20 numberWithUnsignedInteger:v10];
  [(NSMapTable *)v19 setObject:v22 forKey:v23];
}

- (void)_moveUpOrDown:(id)a3 index:(unint64_t)a4
{
  id v16 = a3;
  if (!a4)
  {
    uint64_t v9 = self;
    id v10 = v16;
    unint64_t v11 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = (*((uint64_t (**)(void))self->_comparator + 2))();
  if (v6 == 1)
  {
    [(BRCMinHeap *)self _moveUp:v16 index:a4];
    goto LABEL_11;
  }
  if (!v6)
  {
    self->_array[a4] = v16;
    objects = self->_objects;
    id v13 = NSNumber;
    id v14 = v16;
    v15 = [v13 numberWithUnsignedInteger:a4];
    [(NSMapTable *)objects setObject:v15 forKey:v14];

    goto LABEL_11;
  }
  BOOL v7 = v6 == -1;
  uint64_t v8 = v16;
  if (v7)
  {
    uint64_t v9 = self;
    id v10 = v16;
    unint64_t v11 = a4;
LABEL_8:
    [(BRCMinHeap *)v9 _moveDown:v10 index:v11];
LABEL_11:
    uint64_t v8 = v16;
  }
}

- (id)firstObject
{
  if (self->_count) {
    return *self->_array;
  }
  else {
    return 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  array = self->_array;
  a3->var0 = 1;
  a3->var1 = array;
  a3->var2 = &self->_mutation;
  return self->_count;
}

- (BOOL)containsObject:(id)a3
{
  objc_super v3 = [(NSMapTable *)self->_objects objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_objects objectForKey:v4];

  if (v5)
  {
    id v10 = brc_bread_crumbs();
    unint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCMinHeap addObject:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  unint64_t v6 = self->_count + 1;
  unint64_t size = self->_size;
  if (v6 > size)
  {
    unint64_t v8 = ((3 * size) >> 1) + 4;
    uint64_t v9 = (id *)malloc_type_realloc(self->_array, 8 * v8, 0x80040B8603338uLL);
    self->_array = v9;
    bzero(&v9[self->_size], 8 * (v8 - self->_size));
    self->_unint64_t size = v8;
    unint64_t v6 = self->_count + 1;
  }
  self->_unint64_t count = v6;
  -[BRCMinHeap _moveUp:index:](self, "_moveUp:index:", v4);
  ++self->_mutation;
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_objects objectForKey:v4];
  unint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    if (self->_array[v7] != v4)
    {
      unint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCMinHeap removeObject:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    [(NSMapTable *)self->_objects removeObjectForKey:v4];
    array = self->_array;
    unint64_t v9 = self->_count - 1;
    self->_unint64_t count = v9;
    id v10 = array[v9];

    self->_array[self->_count] = 0;
    if (v7 != self->_count) {
      [(BRCMinHeap *)self _moveUpOrDown:v10 index:v7];
    }
    [(BRCMinHeap *)self _shrink];
  }
  else
  {
    id v10 = v4;
  }
  ++self->_mutation;
}

- (void)removeFirstObject
{
  unint64_t count = self->_count;
  if (count)
  {
    array = self->_array;
    unint64_t v5 = count - 1;
    self->_unint64_t count = v5;
    id v6 = array[v5];
    id v7 = *self->_array;
    objects = self->_objects;
    unint64_t v9 = self;
    [(NSMapTable *)objects removeObjectForKey:v7];

    self->_array[self->_count] = 0;
    if (self->_count) {
      [(BRCMinHeap *)v9 _moveDown:v6 index:0];
    }
    [(BRCMinHeap *)v9 _shrink];
  }
  ++self->_mutation;
}

- (void)removeAllObjects
{
  [(NSMapTable *)self->_objects removeAllObjects];
  if (self->_count)
  {
    unint64_t v3 = 0;
    do
      self->_array[v3++] = 0;
    while (v3 < self->_count);
  }
  self->_unint64_t count = 0;
  ++self->_mutation;
}

- (void)firstObjectWeightChanged
{
}

- (void)objectWeightChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMapTable *)self->_objects objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 unsignedIntegerValue];
    if (self->_array[v7] != v4)
    {
      unint64_t v8 = brc_bread_crumbs();
      unint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BRCMinHeap removeObject:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    [(BRCMinHeap *)self _moveUpOrDown:v4 index:v7];
  }
  ++self->_mutation;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong(&self->_comparator, 0);
}

- (void)addObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23FA42000, a2, a3, "[CRIT] Assertion failed: _getIndex(self, o) == nil%@", a5, a6, a7, a8, 2u);
}

- (void)removeObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_23FA42000, a2, a3, "[CRIT] Assertion failed: _array[index] == o%@", a5, a6, a7, a8, 2u);
}

@end