@interface ContainerStack
- (ContainerStack)init;
- (id)allObjects;
- (id)containeeStateAtIndex:(unint64_t)a3;
- (id)containeeStateForContainee:(id)a3;
- (id)description;
- (id)lastState;
- (id)popAll;
- (id)popFromIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfContainee:(id)a3;
- (void)pushContaineeState:(id)a3;
- (void)removeContaineeState:(id)a3;
- (void)replaceLastOne:(id)a3;
@end

@implementation ContainerStack

- (void)pushContaineeState:(id)a3
{
  content = self->_content;
  id v5 = a3;
  v6 = [v5 viewController];
  [(NSMapTable *)content setObject:v5 forKey:v6];

  array = self->_array;
  id v8 = [v5 viewController];

  [(NSMutableArray *)array addObject:v8];
}

- (ContainerStack)init
{
  v8.receiver = self;
  v8.super_class = (Class)ContainerStack;
  v2 = [(ContainerStack *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    array = v2->_array;
    v2->_array = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMapTable strongToStrongObjectsMapTable];
    content = v2->_content;
    v2->_content = (NSMapTable *)v5;
  }
  return v2;
}

- (id)containeeStateForContainee:(id)a3
{
  return [(NSMapTable *)self->_content objectForKey:a3];
}

- (unint64_t)indexOfContainee:(id)a3
{
  return (unint64_t)[(NSMutableArray *)self->_array indexOfObject:a3];
}

- (id)allObjects
{
  id v2 = [(NSMutableArray *)self->_array copy];

  return v2;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_array count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_array, 0);
}

- (id)containeeStateAtIndex:(unint64_t)a3
{
  if ([(NSMapTable *)self->_content count]
    && (char *)[(NSMapTable *)self->_content count] - 1 >= (char *)a3)
  {
    content = self->_content;
    v7 = [(NSMutableArray *)self->_array objectAtIndexedSubscript:a3];
    uint64_t v5 = [(NSMapTable *)content objectForKey:v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)removeContaineeState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewController];
  v6 = [v5 cardPresentationController];
  [v6 wantsLayout:1];

  content = self->_content;
  objc_super v8 = [v4 viewController];
  [(NSMapTable *)content removeObjectForKey:v8];

  array = self->_array;
  id v10 = [v4 viewController];

  [(NSMutableArray *)array removeObject:v10];
}

- (void)replaceLastOne:(id)a3
{
  id v4 = a3;
  id v9 = [(ContainerStack *)self lastState];
  content = self->_content;
  v6 = [v9 viewController];
  [(NSMapTable *)content removeObjectForKey:v6];

  array = self->_array;
  objc_super v8 = [v9 viewController];
  [(NSMutableArray *)array removeObject:v8];

  [(ContainerStack *)self pushContaineeState:v4];
}

- (id)popAll
{
  id v3 = [(NSMutableArray *)self->_array copy];
  [(NSMutableArray *)self->_array removeObjectsInArray:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSMapTable removeObjectForKey:](self->_content, "removeObjectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)popFromIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)[(NSMutableArray *)self->_array count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = -[NSMutableArray subarrayWithRange:](self->_array, "subarrayWithRange:", a3 + 1, (char *)[(NSMutableArray *)self->_array count] - a3 - 1);
    [(NSMutableArray *)self->_array removeObjectsInArray:v5];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NSMapTable removeObjectForKey:](self->_content, "removeObjectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }

  return v6;
}

- (id)lastState
{
  content = self->_content;
  id v3 = [(NSMutableArray *)self->_array lastObject];
  id v4 = [(NSMapTable *)content objectForKey:v3];

  return v4;
}

- (id)description
{
  return [(NSMutableArray *)self->_array description];
}

@end