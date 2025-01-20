@interface MLMediaTypeCountedSet
- (id).cxx_construct;
- (id)description;
- (unint64_t)count;
- (void)addMediaType:(unsigned int)a3 count:(unint64_t)a4;
- (void)enumerateMediaTypesWithBlock:(id)a3;
@end

@implementation MLMediaTypeCountedSet

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
}

- (void)enumerateMediaTypesWithBlock:(id)a3
{
  v4 = (void (**)(id, void, void *, char *))a3;
  if ([(MLMediaTypeCountedSet *)self count])
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)self->_map.__tree_.__begin_node_;
    p_pair1 = &self->_map.__tree_.__pair1_;
    if (begin_node != p_pair1)
    {
      do
      {
        char v10 = 0;
        v4[2](v4, LODWORD(begin_node[4].__value_.__left_), begin_node[5].__value_.__left_, &v10);
        if (v10) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            v8 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)begin_node[2].__value_.__left_;
            BOOL v9 = v8->__value_.__left_ == begin_node;
            begin_node = v8;
          }
          while (!v9);
        }
        begin_node = v8;
      }
      while (v8 != p_pair1);
    }
  }
}

- (void)addMediaType:(unsigned int)a3 count:(unint64_t)a4
{
  p_pair1 = &self->_map.__tree_.__pair1_;
  left = (unsigned int *)self->_map.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    while (1)
    {
      while (1)
      {
        BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)left;
        unsigned int v10 = left[8];
        if (v10 <= a3) {
          break;
        }
        left = (unsigned int *)v9->__value_.__left_;
        p_pair1 = v9;
        if (!v9->__value_.__left_) {
          goto LABEL_9;
        }
      }
      if (v10 >= a3) {
        break;
      }
      left = (unsigned int *)v9[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    BOOL v9 = &self->_map.__tree_.__pair1_;
LABEL_9:
    v11 = v9;
    BOOL v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, unsigned long>, void *>>> *)operator new(0x30uLL);
    LODWORD(v9[4].__value_.__left_) = a3;
    v9[5].__value_.__left_ = 0;
    v9->__value_.__left_ = 0;
    v9[1].__value_.__left_ = 0;
    v9[2].__value_.__left_ = v11;
    p_pair1->__value_.__left_ = v9;
    v12 = *(void **)self->_map.__tree_.__begin_node_;
    v13 = (uint64_t *)v9;
    if (v12)
    {
      self->_map.__tree_.__begin_node_ = v12;
      v13 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_map.__tree_.__pair1_.__value_.__left_, v13);
    ++self->_map.__tree_.__pair3_.__value_;
  }
  v9[5].__value_.__left_ = (char *)v9[5].__value_.__left_ + a4;
}

- (unint64_t)count
{
  return self->_map.__tree_.__pair3_.__value_;
}

- (id)description
{
  if (self->_map.__tree_.__pair3_.__value_)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__MLMediaTypeCountedSet_description__block_invoke;
    v11[3] = &unk_1E5FB63E8;
    id v4 = v3;
    id v12 = v4;
    [(MLMediaTypeCountedSet *)self enumerateMediaTypesWithBlock:v11];
    v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    v5 = @"{ -empty- }";
  }
  v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MLMediaTypeCountedSet;
  v7 = [(MLMediaTypeCountedSet *)&v10 description];
  v8 = [v6 stringWithFormat:@"%@ types: %@", v7, v5];

  return v8;
}

void __36__MLMediaTypeCountedSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = NSString;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = NSStringFromMLMediaType(a2);
  v6 = [v4 stringWithFormat:@"count[%@] %@", v7, v5];
  [v3 addObject:v6];
}

@end