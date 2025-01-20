@interface PPEvictingMaxTokenCountPriorityQueue
- (PPEvictingMaxTokenCountPriorityQueue)initWithCapacity:(unint64_t)a3;
- (double)count;
- (id)getMaxItemWithoutPopping;
- (id)popItem;
- (unint64_t)capacity;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateTokenCountsUsingBlock:(id)a3;
@end

@implementation PPEvictingMaxTokenCountPriorityQueue

- (void)enumerateTokenCountsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v9 = 0;
  uint64_t v5 = *((void *)self->_queue + 1) - *(void *)self->_queue;
  if (v5)
  {
    uint64_t v6 = (v5 >> 3) - 1;
    do
    {
      v4[2](v4, **(void **)self->_queue, &v9);
      std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
      BOOL v8 = v6-- != 0;
    }
    while (!v9 && v8);
  }
}

- (id)getMaxItemWithoutPopping
{
  queue = (id **)self->_queue;
  if (*queue == queue[1]) {
    id v3 = 0;
  }
  else {
    id v3 = **queue;
  }
  return v3;
}

- (id)popItem
{
  queue = (id **)self->_queue;
  if (*queue == queue[1])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **queue;
    std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
  }
  return v4;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  unint64_t capacity = self->_capacity;
  if (capacity)
  {
    queue = (uint64_t *)self->_queue;
    id v26 = v4;
    if (capacity <= (queue[1] - *queue) >> 3)
    {
      unsigned int v7 = [v4 count];
      BOOL v8 = v7 > [**(id **)self->_queue count];
      id v4 = v26;
      if (v8) {
        goto LABEL_27;
      }
      std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop((uint64_t)self->_queue);
      queue = (uint64_t *)self->_queue;
      id v4 = v26;
    }
    id v9 = v4;
    id v10 = v9;
    v11 = (void *)queue[1];
    unint64_t v12 = queue[2];
    if ((unint64_t)v11 >= v12)
    {
      v14 = (void *)*queue;
      uint64_t v15 = ((uint64_t)v11 - *queue) >> 3;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 61) {
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v17 = v12 - (void)v14;
      if (v17 >> 2 > v16) {
        unint64_t v16 = v17 >> 2;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        if (v18 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v19 = (char *)operator new(8 * v18);
        v11 = (void *)queue[1];
      }
      else
      {
        v19 = 0;
      }
      v20 = &v19[8 * v15];
      *(void *)v20 = v10;
      uint64_t v13 = (uint64_t)(v20 + 8);
      if (v11 == v14)
      {
        int64x2_t v22 = vdupq_n_s64((unint64_t)v11);
      }
      else
      {
        do
        {
          uint64_t v21 = *--v11;
          void *v11 = 0;
          *((void *)v20 - 1) = v21;
          v20 -= 8;
        }
        while (v11 != v14);
        int64x2_t v22 = *(int64x2_t *)queue;
      }
      uint64_t *queue = (uint64_t)v20;
      queue[1] = v13;
      queue[2] = (uint64_t)&v19[8 * v18];
      v24 = (char *)v22.i64[1];
      v23 = (char *)v22.i64[0];
      while (v24 != v23)
      {
        v25 = (void *)*((void *)v24 - 1);
        v24 -= 8;
      }
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      void *v11 = v9;
      uint64_t v13 = (uint64_t)(v11 + 1);
    }
    queue[1] = v13;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>(*queue, v13, (v13 - *queue) >> 3);
    id v4 = v26;
  }
LABEL_27:
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (double)count
{
  return (double)(unint64_t)((uint64_t)(*((void *)self->_queue + 1) - *(void *)self->_queue) >> 3);
}

- (void)dealloc
{
  queue = (void **)self->_queue;
  if (queue)
  {
    id v4 = (char *)*queue;
    if (*queue)
    {
      uint64_t v5 = (char *)queue[1];
      uint64_t v6 = *queue;
      if (v5 != v4)
      {
        do
        {
          unsigned int v7 = (void *)*((void *)v5 - 1);
          v5 -= 8;
        }
        while (v5 != v4);
        uint64_t v6 = *queue;
      }
      queue[1] = v4;
      operator delete(v6);
    }
    MEMORY[0x1CB79CB70](queue, 0x80C402512154ALL);
  }
  v8.receiver = self;
  v8.super_class = (Class)PPEvictingMaxTokenCountPriorityQueue;
  [(PPEvictingMaxTokenCountPriorityQueue *)&v8 dealloc];
}

- (PPEvictingMaxTokenCountPriorityQueue)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPEvictingMaxTokenCountPriorityQueue;
  id v4 = [(PPEvictingMaxTokenCountPriorityQueue *)&v6 init];
  if (v4)
  {
    v4->_unint64_t capacity = a3;
    operator new();
  }
  return 0;
}

@end