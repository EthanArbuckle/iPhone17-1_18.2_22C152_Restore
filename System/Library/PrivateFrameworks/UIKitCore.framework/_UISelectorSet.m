@interface _UISelectorSet
- (BOOL)containsSelector:(SEL)a3;
- (BOOL)containsSet:(id)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_UISelectorSet)init;
- (_UISelectorSet)initWithHash:(id)a3;
- (_UISelectorSet)initWithSelectors:(SEL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)hash;
- (void)addSelector:(SEL)a3;
- (void)enumerateSelectorsUsingBlock:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeSelector:(SEL)a3;
- (void)unionSet:(id)a3;
@end

@implementation _UISelectorSet

- (_UISelectorSet)initWithHash:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISelectorSet;
  v6 = [(_UISelectorSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hash, a3);
  }

  return v7;
}

- (_UISelectorSet)init
{
  if (!init_pointerFunctions)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:256];
    v4 = (void *)init_pointerFunctions;
    init_pointerFunctions = v3;

    [(id)init_pointerFunctions setDescriptionFunction:selectorDescription_0];
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28D30]);
  v6 = (void *)[v5 initWithPointerFunctions:init_pointerFunctions capacity:0];
  v7 = [(_UISelectorSet *)self initWithHash:v6];

  return v7;
}

- (_UISelectorSet)initWithSelectors:(SEL)a3
{
  v4 = [(_UISelectorSet *)self init];
  if (v4)
  {
    v7 = (SEL *)&v8;
    if (a3)
    {
      do
      {
        NSHashInsert(v4->_hash, a3);
        id v5 = v7++;
        a3 = *v5;
      }
      while (*v5);
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [_UISelectorSet alloc];
  v6 = (void *)[(NSHashTable *)self->_hash copyWithZone:a3];
  v7 = [(_UISelectorSet *)v5 initWithHash:v6];

  return v7;
}

- (unint64_t)count
{
  return [(NSHashTable *)self->_hash count];
}

- (BOOL)containsSelector:(SEL)a3
{
  return NSHashGet(self->_hash, a3) != 0;
}

- (void)addSelector:(SEL)a3
{
}

- (void)removeSelector:(SEL)a3
{
}

- (void)enumerateSelectorsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateHashTable(&enumerator, self->_hash);
  do
  {
    id v5 = NSNextHashEnumeratorItem(&enumerator);
    if (!v5) {
      break;
    }
    char v6 = 0;
    v4[2](v4, v5, &v6);
  }
  while (!v6);
  NSEndHashTableEnumeration(&enumerator);
}

- (BOOL)intersectsSet:(id)a3
{
  return [(NSHashTable *)self->_hash intersectsHashTable:*((void *)a3 + 1)];
}

- (BOOL)containsSet:(id)a3
{
  return [*((id *)a3 + 1) isSubsetOfHashTable:self->_hash];
}

- (void)intersectSet:(id)a3
{
}

- (void)minusSet:(id)a3
{
}

- (void)unionSet:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSHashTable **)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && NSCompareHashTables(self->_hash, v4[1]);

  return v5;
}

- (unint64_t)hash
{
  return [(NSHashTable *)self->_hash hash];
}

- (id)description
{
  return (id)[(NSHashTable *)self->_hash description];
}

- (void).cxx_destruct
{
}

@end