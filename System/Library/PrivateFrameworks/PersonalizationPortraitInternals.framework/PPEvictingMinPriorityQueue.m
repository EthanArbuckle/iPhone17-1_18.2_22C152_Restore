@interface PPEvictingMinPriorityQueue
- (PPEvictingMinPriorityQueue)initWithCapacity:(unint64_t)a3;
- (double)count;
- (id)extractSortedMutableArray;
- (id)getMinItemWithoutPopping;
- (id)popItem;
- (unint64_t)capacity;
- (void)addObject:(id)a3;
- (void)dealloc;
@end

@implementation PPEvictingMinPriorityQueue

- (id)extractSortedMutableArray
{
  uint64_t v2 = *(void *)self->_queue;
  uint64_t v3 = *((void *)self->_queue + 1);
  int64_t v4 = v3 - v2;
  if (v3 == v2)
  {
    v11 = objc_opt_new();
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16[0] = (void **)&v13;
    v16[1] = 0;
    if (v3 - v2 < 0) {
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(v4 >> 3);
    v13 = v6;
    v15 = &v6[8 * v7];
    bzero(v6, v4);
    v14 = &v6[v4];
    uint64_t v8 = 8 * (v4 >> 3) - 8;
    uint64_t v9 = (v4 >> 3) + 1;
    while (--v9)
    {
      uint64_t v10 = v8 - 8;
      objc_storeStrong((id *)&v13[v8], **(id **)self->_queue);
      std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
      uint64_t v8 = v10;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:count:");
    v16[0] = (void **)&v13;
    std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](v16);
  }
  return v11;
}

- (id)getMinItemWithoutPopping
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
    std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
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
    id v28 = v4;
    if (capacity <= (queue[1] - *queue) >> 3)
    {
      [v4 score];
      double v8 = v7;
      [**(id **)self->_queue score];
      id v4 = v28;
      if (v8 < v9) {
        goto LABEL_26;
      }
      std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop((uint64_t)self->_queue);
      queue = (uint64_t *)self->_queue;
      id v4 = v28;
    }
    id v10 = v4;
    id v11 = v10;
    v13 = (void *)queue[1];
    unint64_t v12 = queue[2];
    if ((unint64_t)v13 >= v12)
    {
      uint64_t v15 = ((uint64_t)v13 - *queue) >> 3;
      if ((unint64_t)(v15 + 1) >> 61) {
        std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v16 = v12 - *queue;
      uint64_t v17 = v16 >> 2;
      if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
        uint64_t v17 = v15 + 1;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v17;
      }
      if (v18) {
        unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(v18);
      }
      else {
        uint64_t v19 = 0;
      }
      v20 = (void *)(v18 + 8 * v15);
      void *v20 = v11;
      uint64_t v14 = (uint64_t)(v20 + 1);
      v22 = (void *)*queue;
      v21 = (void *)queue[1];
      if (v21 == (void *)*queue)
      {
        int64x2_t v24 = vdupq_n_s64((unint64_t)v21);
      }
      else
      {
        do
        {
          uint64_t v23 = *--v21;
          void *v21 = 0;
          *--v20 = v23;
        }
        while (v21 != v22);
        int64x2_t v24 = *(int64x2_t *)queue;
      }
      uint64_t *queue = (uint64_t)v20;
      queue[1] = v14;
      queue[2] = v18 + 8 * v19;
      v26 = (char *)v24.i64[1];
      v25 = (char *)v24.i64[0];
      while (v26 != v25)
      {
        v27 = (void *)*((void *)v26 - 1);
        v26 -= 8;
      }
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      void *v13 = v10;
      uint64_t v14 = (uint64_t)(v13 + 1);
    }
    queue[1] = v14;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>(*queue, v14, (v14 - *queue) >> 3);
    id v4 = v28;
  }
LABEL_26:
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
  queue = self->_queue;
  if (queue)
  {
    v5 = (void **)self->_queue;
    std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1CB79CB70](queue, 0x80C402512154ALL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PPEvictingMinPriorityQueue;
  [(PPEvictingMinPriorityQueue *)&v4 dealloc];
}

- (PPEvictingMinPriorityQueue)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPEvictingMinPriorityQueue;
  objc_super v4 = [(PPEvictingMinPriorityQueue *)&v6 init];
  if (v4)
  {
    v4->_unint64_t capacity = a3;
    operator new();
  }
  return 0;
}

@end