@interface SCDAQueue
- (SCDAQueueDelegate)delegate;
- (id)_objects;
- (id)dequeueAllObjects;
- (id)dequeueObject;
- (id)description;
- (id)frontObject;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enqueueObject:(id)a3;
- (void)enqueueObjects:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SCDAQueue

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

- (void)setDelegate:(id)a3
{
}

- (SCDAQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCDAQueueDelegate *)WeakRetained;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SCDAQueue;
  v3 = [(SCDAQueue *)&v7 description];
  v4 = [(SCDAQueue *)self _objects];
  v5 = [v3 stringByAppendingFormat:@" %@", v4];

  return v5;
}

- (id)dequeueAllObjects
{
  if (self->_count)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
    v4 = self->_head;
    if (v4)
    {
      v5 = v4;
      do
      {
        v6 = [v5 object];
        [v3 addObject:v6];

        id v7 = v5;
        v5 = [v7 nextItem];

        [v7 removeFromList];
      }
      while (v5);
    }
    head = self->_head;
    self->_head = 0;

    tail = self->_tail;
    self->_tail = 0;

    self->_count = 0;
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)dequeueObject
{
  if (self->_count && (v3 = self->_head) != 0)
  {
    v4 = [(SCDALinkedListItem *)v3 object];
    v5 = self->_head;
    v6 = v5;
    if (self->_tail == v5)
    {
      self->_tail = 0;
    }
    id v7 = [(SCDALinkedListItem *)self->_head nextItem];
    head = self->_head;
    self->_head = v7;

    [(SCDALinkedListItem *)v6 removeFromList];
    --self->_count;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)enqueueObjects:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v19 = v5;
  v6 = self->_head;
  id v7 = self->_tail;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v21;
  do
  {
    uint64_t v12 = 0;
    v13 = v7;
    do
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      v14 = [[SCDALinkedListItem alloc] initWithObject:*(void *)(*((void *)&v20 + 1) + 8 * v12)];
      id v7 = v14;
      if (v6)
      {
        if (!v13) {
          goto LABEL_10;
        }
LABEL_9:
        [(SCDALinkedListItem *)v7 insertAfterItem:v13];
        goto LABEL_10;
      }
      v6 = v14;
      if (v13) {
        goto LABEL_9;
      }
LABEL_10:

      ++v12;
      v13 = v7;
    }
    while (v10 != v12);
    uint64_t v15 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v10 = v15;
  }
  while (v15);
LABEL_15:

  objc_storeStrong((id *)&self->_head, v6);
  objc_storeStrong((id *)&self->_tail, v7);
  self->_count += v19;
  v16 = [(SCDAQueue *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [(SCDAQueue *)self delegate];
    [v18 queue:self didEnqueueObjects:v8];
  }
LABEL_18:
}

- (void)enqueueObject:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SCDAQueue enqueueObjects:](self, "enqueueObjects:", v6, v7, v8);
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count <= a3)
  {
    v6 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = a3;
  if (!a3)
  {
    head = self->_head;
    goto LABEL_7;
  }
  if (count - 1 == a3)
  {
    head = self->_tail;
LABEL_7:
    v6 = [(SCDALinkedListItem *)head object];
    goto LABEL_11;
  }
  id v7 = self->_head;
  do
  {
    uint64_t v8 = v7;
    id v7 = [(SCDALinkedListItem *)v7 nextItem];

    --v4;
  }
  while (v4);
  v6 = [(SCDALinkedListItem *)v7 object];

LABEL_11:
  return v6;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)frontObject
{
  return [(SCDALinkedListItem *)self->_head object];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  if (!self->_count || a3->var3[0] == 1) {
    return 0;
  }
  unint64_t var0 = a3->var0;
  uint64_t v12 = (SCDALinkedListItem *)(id)a3->var0;
  if (!var0) {
    uint64_t v12 = self->_head;
  }
  v13 = v12;
  unint64_t v6 = 0;
  while (a5 != v6)
  {
    a4[v6++] = (id)[v13 object];
    unint64_t v14 = [v13 nextItem];

    a3->unint64_t var0 = v14;
    v13 = (void *)v14;
    if (!v14)
    {
      a3->var3[0] = 1;
      return v6;
    }
  }

  return a5;
}

- (id)_objects
{
  if (self->_count)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
    unint64_t v4 = self->_head;
    if (v4)
    {
      id v5 = v4;
      do
      {
        unint64_t v6 = [v5 object];
        [v3 addObject:v6];

        uint64_t v7 = [v5 nextItem];

        id v5 = (void *)v7;
      }
      while (v7);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (void)dealloc
{
  v3 = self->_head;
  if (v3)
  {
    unint64_t v4 = v3;
    do
    {
      id v5 = v4;
      unint64_t v4 = [v5 nextItem];

      [v5 removeFromList];
    }
    while (v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)SCDAQueue;
  [(SCDAQueue *)&v6 dealloc];
}

@end