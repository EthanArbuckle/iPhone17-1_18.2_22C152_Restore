@interface NSPointerArray
- (BOOL)_maps_containsObject:(id)a3;
- (id)_maps_lastObject;
- (void)_maps_compact;
- (void)_maps_moveOrAddObjectToTop:(id)a3;
- (void)_maps_removeAllObjects;
- (void)_maps_removeObject:(id)a3;
@end

@implementation NSPointerArray

- (void)_maps_moveOrAddObjectToTop:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([(NSPointerArray *)self count])
    {
      uint64_t v5 = 0;
      while ([(NSPointerArray *)self pointerAtIndex:v5] != v6)
      {
        if (++v5 >= [(NSPointerArray *)self count]) {
          goto LABEL_8;
        }
      }
      [(NSPointerArray *)self removePointerAtIndex:v5];
    }
LABEL_8:
    [(NSPointerArray *)self addPointer:v6];
    id v4 = v6;
  }
}

- (id)_maps_lastObject
{
  v3 = [(NSPointerArray *)self count];
  if (v3)
  {
    v3 = [(NSPointerArray *)self pointerAtIndex:(char *)[(NSPointerArray *)self count] - 1];
  }

  return v3;
}

- (BOOL)_maps_containsObject:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSPointerArray *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSPointerArray *)self pointerAtIndex:v5];
      BOOL v7 = v6 == v4;
      if (v6 == v4) {
        break;
      }
      ++v5;
    }
    while (v5 < [(NSPointerArray *)self count]);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_maps_removeObject:(id)a3
{
  id v5 = a3;
  if (v5 && [(NSPointerArray *)self count])
  {
    uint64_t v4 = 0;
    while ([(NSPointerArray *)self pointerAtIndex:v4] != v5)
    {
      if (++v4 >= [(NSPointerArray *)self count]) {
        goto LABEL_8;
      }
    }
    [(NSPointerArray *)self removePointerAtIndex:v4];
  }
LABEL_8:
}

- (void)_maps_removeAllObjects
{
}

- (void)_maps_compact
{
  [(NSPointerArray *)self addPointer:0];

  [(NSPointerArray *)self compact];
}

@end