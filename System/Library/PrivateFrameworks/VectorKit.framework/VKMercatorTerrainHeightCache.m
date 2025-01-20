@interface VKMercatorTerrainHeightCache
- (VKMercatorTerrainHeightProvider)heightProvider;
- (double)heightForAnchor:(void *)a3;
- (id).cxx_construct;
- (void)invalidateRect:(const void *)a3;
- (void)removeCachedValueForAnchor:(void *)a3;
- (void)setHeightProvider:(id)a3;
@end

@implementation VKMercatorTerrainHeightCache

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

- (void).cxx_destruct
{
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy((void *)self->_anchorToHeight.__tree_.__pair1_.__value_.__left_);
  objc_destroyWeak((id *)&self->_heightProvider);
}

- (void)setHeightProvider:(id)a3
{
}

- (VKMercatorTerrainHeightProvider)heightProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heightProvider);
  return (VKMercatorTerrainHeightProvider *)WeakRetained;
}

- (void)invalidateRect:(const void *)a3
{
  begin_node = (VKMercatorTerrainHeightCache *)self->_anchorToHeight.__tree_.__begin_node_;
  p_pair1 = &self->_anchorToHeight.__tree_.__pair1_;
  if (begin_node != (VKMercatorTerrainHeightCache *)&self->_anchorToHeight.__tree_.__pair1_)
  {
    do
    {
      value = (id *)begin_node->_anchorToHeight.__tree_.__pair3_.__value_;
      double v8 = (*((double (**)(id *, SEL))*value + 7))(value, a2);
      if (v8 < *(double *)a3 || v8 >= *((double *)a3 + 2) || v9 < *((double *)a3 + 1) || v9 >= *((double *)a3 + 3))
      {
        heightProvider = begin_node->_heightProvider;
        if (heightProvider)
        {
          do
          {
            v12 = (VKMercatorTerrainHeightCache *)heightProvider;
            heightProvider = *(VKMercatorTerrainHeightProvider **)heightProvider;
          }
          while (heightProvider);
        }
        else
        {
          do
          {
            v12 = (VKMercatorTerrainHeightCache *)begin_node->_anchorToHeight.__tree_.__begin_node_;
            BOOL v14 = v12->super.isa == (Class)begin_node;
            begin_node = v12;
          }
          while (!v14);
        }
      }
      else
      {
        v10 = begin_node->_heightProvider;
        v11 = begin_node;
        if (v10)
        {
          do
          {
            v12 = (VKMercatorTerrainHeightCache *)v10;
            v10 = *(VKMercatorTerrainHeightProvider **)v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v12 = (VKMercatorTerrainHeightCache *)v11->_anchorToHeight.__tree_.__begin_node_;
            BOOL v14 = v12->super.isa == (Class)v11;
            v11 = v12;
          }
          while (!v14);
        }
        if (self->_anchorToHeight.__tree_.__begin_node_ == begin_node) {
          self->_anchorToHeight.__tree_.__begin_node_ = v12;
        }
        left = (uint64_t *)self->_anchorToHeight.__tree_.__pair1_.__value_.__left_;
        --self->_anchorToHeight.__tree_.__pair3_.__value_;
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)begin_node);
        operator delete(begin_node);
        id WeakRetained = objc_loadWeakRetained(value + 8);
        [WeakRetained anchorWorldPointDidChange:value];
      }
      begin_node = v12;
    }
    while (v12 != (VKMercatorTerrainHeightCache *)p_pair1);
  }
}

- (void)removeCachedValueForAnchor:(void *)a3
{
  p_pair1 = &self->_anchorToHeight.__tree_.__pair1_;
  left = (uint64_t *)self->_anchorToHeight.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = (uint64_t *)p_pair1;
    v7 = left;
    do
    {
      unint64_t v8 = v7[4];
      BOOL v9 = v8 >= (unint64_t)a3;
      if (v8 >= (unint64_t)a3) {
        v10 = (uint64_t **)v7;
      }
      else {
        v10 = (uint64_t **)(v7 + 1);
      }
      if (v9) {
        v6 = v7;
      }
      v7 = *v10;
    }
    while (*v10);
    if (v6 != (uint64_t *)p_pair1 && v6[4] <= (unint64_t)a3)
    {
      v11 = (uint64_t *)v6[1];
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
      else
      {
        v13 = v6;
        do
        {
          v12 = (uint64_t *)v13[2];
          BOOL v14 = *v12 == (void)v13;
          v13 = v12;
        }
        while (!v14);
      }
      if (self->_anchorToHeight.__tree_.__begin_node_ == v6) {
        self->_anchorToHeight.__tree_.__begin_node_ = v12;
      }
      --self->_anchorToHeight.__tree_.__pair3_.__value_;
      std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, v6);
      operator delete(v6);
    }
  }
}

- (double)heightForAnchor:(void *)a3
{
  p_pair1 = &self->_anchorToHeight.__tree_.__pair1_;
  left = (char *)self->_anchorToHeight.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  v7 = &self->_anchorToHeight.__tree_.__pair1_;
  do
  {
    unint64_t v8 = *((void *)left + 4);
    BOOL v9 = v8 >= (unint64_t)a3;
    if (v8 >= (unint64_t)a3) {
      v10 = (char **)left;
    }
    else {
      v10 = (char **)(left + 8);
    }
    if (v9) {
      v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<md::Anchor *, float>, void *>>> *)left;
    }
    left = *v10;
  }
  while (*v10);
  if (v7 != p_pair1 && v7[4].__value_.__left_ <= a3) {
    return *(float *)&v7[5].__value_.__left_;
  }
LABEL_12:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heightProvider);
  (*(void (**)(void *))(*(void *)a3 + 56))(a3);
  objc_msgSend(WeakRetained, "heightAtPoint:");
  double v13 = v12;

  v15 = (unint64_t *)p_pair1->__value_.__left_;
  v16 = p_pair1;
  if (p_pair1->__value_.__left_)
  {
    while (1)
    {
      while (1)
      {
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<md::Anchor *, float>, void *>>> *)v15;
        unint64_t v17 = v15[4];
        if (v17 <= (unint64_t)a3) {
          break;
        }
        v15 = (unint64_t *)v16->__value_.__left_;
        p_pair1 = v16;
        if (!v16->__value_.__left_) {
          goto LABEL_19;
        }
      }
      if (v17 >= (unint64_t)a3) {
        break;
      }
      v15 = (unint64_t *)v16[1].__value_.__left_;
      if (!v15)
      {
        p_pair1 = v16 + 1;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v18 = v16;
    v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<md::Anchor *, float>, void *>>> *)operator new(0x30uLL);
    v16[4].__value_.__left_ = a3;
    LODWORD(v16[5].__value_.__left_) = 0;
    v16->__value_.__left_ = 0;
    v16[1].__value_.__left_ = 0;
    v16[2].__value_.__left_ = v18;
    p_pair1->__value_.__left_ = v16;
    v19 = *(void **)self->_anchorToHeight.__tree_.__begin_node_;
    v20 = (uint64_t *)v16;
    if (v19)
    {
      self->_anchorToHeight.__tree_.__begin_node_ = v19;
      v20 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_anchorToHeight.__tree_.__pair1_.__value_.__left_, v20);
    ++self->_anchorToHeight.__tree_.__pair3_.__value_;
  }
  float v14 = v13;
  *(float *)&v16[5].__value_.__left_ = v14;
  return v13;
}

@end