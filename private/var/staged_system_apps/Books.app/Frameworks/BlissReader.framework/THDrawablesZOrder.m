@interface THDrawablesZOrder
- (THDrawablesZOrder)initWithContext:(id)a3;
- (id)drawableAtZOrder:(unint64_t)a3;
- (id)orderedDrawables:(id)a3;
- (unint64_t)addDrawable:(id)a3;
- (unint64_t)drawableCount;
- (unint64_t)insertDrawable:(id)a3 atZOrder:(unint64_t)a4;
- (unint64_t)zOrderOfDrawable:(id)a3;
- (void)dealloc;
- (void)moveDrawable:(id)a3 toZOrder:(unint64_t)a4;
- (void)moveDrawableAtZOrder:(unint64_t)a3 toZOrder:(unint64_t)a4;
- (void)moveDrawables:(id)a3 toZOrder:(unint64_t)a4;
- (void)removeAllDrawables;
- (void)removeDrawable:(id)a3;
- (void)removeDrawableAtZOrder:(unint64_t)a3;
- (void)swapDrawableAtZOrder:(unint64_t)a3 withDrawableAtZOrder:(unint64_t)a4;
@end

@implementation THDrawablesZOrder

- (THDrawablesZOrder)initWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THDrawablesZOrder;
  v3 = [(THDrawablesZOrder *)&v5 initWithContext:a3];
  if (v3) {
    v3->mDrawables = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THDrawablesZOrder;
  [(THDrawablesZOrder *)&v3 dealloc];
}

- (unint64_t)drawableCount
{
  return (unint64_t)[(NSMutableArray *)self->mDrawables count];
}

- (id)drawableAtZOrder:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mDrawables count] <= a3) {
    return 0;
  }
  mDrawables = self->mDrawables;

  return [(NSMutableArray *)mDrawables objectAtIndex:a3];
}

- (unint64_t)zOrderOfDrawable:(id)a3
{
  if (a3) {
    return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:");
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)addDrawable:(id)a3
{
  return [(THDrawablesZOrder *)self insertDrawable:a3 atZOrder:0xFFFFFFFFLL];
}

- (unint64_t)insertDrawable:(id)a3 atZOrder:(unint64_t)a4
{
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3
    && -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(NSMutableArray *)self->mDrawables count];
    if ((unint64_t)v8 >= a4) {
      unint64_t v4 = a4;
    }
    else {
      unint64_t v4 = (unint64_t)v8;
    }
    [(NSMutableArray *)self->mDrawables insertObject:a3 atIndex:v4];
  }
  return v4;
}

- (void)removeDrawableAtZOrder:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mDrawables count] > a3)
  {
    mDrawables = self->mDrawables;
    [(NSMutableArray *)mDrawables removeObjectAtIndex:a3];
  }
}

- (void)removeDrawable:(id)a3
{
  unint64_t v4 = [(THDrawablesZOrder *)self zOrderOfDrawable:a3];

  [(THDrawablesZOrder *)self removeDrawableAtZOrder:v4];
}

- (void)moveDrawableAtZOrder:(unint64_t)a3 toZOrder:(unint64_t)a4
{
  if (a3 != a4 && a3 + 1 != a4)
  {
    v7 = (char *)[(NSMutableArray *)self->mDrawables count];
    if (a4 != 0xFFFFFFFF || v7 - 1 != (char *)a3)
    {
      id v10 = [(NSMutableArray *)self->mDrawables objectAtIndex:a3];
      id v8 = v10;
      [(NSMutableArray *)self->mDrawables removeObjectAtIndex:a3];
      if (a4 == 0xFFFFFFFF) {
        id v9 = [(NSMutableArray *)self->mDrawables count];
      }
      else {
        id v9 = (id)((__PAIR128__(a4, a3) - a4) >> 64);
      }
      [(NSMutableArray *)self->mDrawables insertObject:v10 atIndex:v9];
    }
  }
}

- (void)moveDrawable:(id)a3 toZOrder:(unint64_t)a4
{
  unint64_t v6 = [(THDrawablesZOrder *)self zOrderOfDrawable:a3];

  [(THDrawablesZOrder *)self moveDrawableAtZOrder:v6 toZOrder:a4];
}

- (void)moveDrawables:(id)a3 toZOrder:(unint64_t)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        [(THDrawablesZOrder *)self moveDrawable:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) toZOrder:a4];
        if (a4 != 0xFFFFFFFF) {
          ++a4;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)swapDrawableAtZOrder:(unint64_t)a3 withDrawableAtZOrder:(unint64_t)a4
{
  id v7 = [(NSMutableArray *)self->mDrawables count];
  if (a3 != a4 && (unint64_t)v7 > a3 && (unint64_t)v7 > a4)
  {
    mDrawables = self->mDrawables;
    [(NSMutableArray *)mDrawables exchangeObjectAtIndex:a3 withObjectAtIndex:a4];
  }
}

- (id)orderedDrawables:(id)a3
{
  objc_super v3 = (NSMutableArray *)a3;
  if (a3)
  {
    v26 = 0;
    v27 = 0;
    uint64_t v28 = 0;
    if (objc_opt_respondsToSelector()) {
      sub_3CEA8((void **)&v26, (unint64_t)[(NSMutableArray *)v3 count]);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v23;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v9 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:", v8, v20, v21);
          if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v20 = v8;
            id v21 = v9;
            long long v11 = v26;
            uint64_t v10 = (uint64_t)v27;
            if (v27 != v26)
            {
              unint64_t v12 = (v27 - v26) >> 4;
              do
              {
                unint64_t v13 = v12 >> 1;
                long long v14 = &v11[16 * (v12 >> 1)];
                unint64_t v15 = *((void *)v14 + 1);
                v16 = v14 + 16;
                v12 += ~(v12 >> 1);
                if (v15 < (unint64_t)v9) {
                  long long v11 = v16;
                }
                else {
                  unint64_t v12 = v13;
                }
              }
              while (v12);
              uint64_t v10 = (uint64_t)v11;
            }
            sub_3CF54(&v26, v10, &v20);
          }
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v5);
    }
    v17 = v27;
    if (v27 == v26)
    {
      objc_super v3 = 0;
      if (!v27) {
        return v3;
      }
      goto LABEL_25;
    }
    objc_super v3 = +[NSMutableArray arrayWithCapacity:(v27 - v26) >> 4];
    v17 = v26;
    v18 = v27;
    if (v26 != v27)
    {
      do
      {
        -[NSMutableArray addObject:](v3, "addObject:", *(void *)v17, v20, v21);
        v17 += 16;
      }
      while (v17 != v18);
      v17 = v26;
    }
    if (v17)
    {
LABEL_25:
      v27 = v17;
      operator delete(v17);
    }
  }
  return v3;
}

- (void)removeAllDrawables
{
  for (i = self->mDrawables; [(NSMutableArray *)i count]; i = self->mDrawables)
    [(THDrawablesZOrder *)self removeDrawableAtZOrder:0];
}

@end