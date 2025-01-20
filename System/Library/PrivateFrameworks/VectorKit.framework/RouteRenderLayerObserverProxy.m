@interface RouteRenderLayerObserverProxy
- (RouteRenderLayerObserverProxy)initWithPolylineGroupObserver:(PolylineGroupChangeObserver *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)polylineGroup:(id)a3 didAddPolyline:(id)a4;
- (void)polylineGroup:(id)a3 didFocusPolyline:(id)a4;
- (void)polylineGroup:(id)a3 didRemovePolyline:(id)a4;
- (void)polylineGroup:(id)a3 didSelectPolyline:(id)a4;
- (void)polylineGroup:(id)a3 didSkipPolyline:(id)a4;
- (void)startObserving:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation RouteRenderLayerObserverProxy

- (void)startObserving:(id)a3
{
  id v35 = a3;
  if (!v35) {
    return;
  }
  p_pair1 = &self->_observedGroupsSet.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v6 = self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
    do
    {
      unint64_t v7 = v6[4];
      if (v7 <= (unint64_t)v35)
      {
        if (v7 >= (unint64_t)v35) {
          goto LABEL_41;
        }
        ++v6;
      }
      v6 = (void *)*v6;
    }
    while (v6);
    while (1)
    {
      while (1)
      {
        v8 = left;
        unint64_t v9 = (unint64_t)left[4].__value_.__left_;
        if (v9 <= (unint64_t)v35) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)v8->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_) {
          goto LABEL_16;
        }
      }
      if (v9 >= (unint64_t)v35) {
        break;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<VKPolylineGroupOverlay *, void *>>> *)v8[1].__value_.__left_;
      if (!left)
      {
        p_pair1 = v8 + 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
    v8 = &self->_observedGroupsSet.__tree_.__pair1_;
LABEL_16:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = (uint64_t)v35;
    uint64_t *v10 = 0;
    v10[1] = 0;
    v10[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v10;
    v11 = *(void **)self->_observedGroupsSet.__tree_.__begin_node_;
    if (v11)
    {
      self->_observedGroupsSet.__tree_.__begin_node_ = v11;
      v10 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_, v10);
    ++self->_observedGroupsSet.__tree_.__pair3_.__value_;
  }
  [v35 addObserver:self];
  end = (char *)self->_retainedGroups.__end_;
  value = (char *)self->_retainedGroups.__end_cap_.__value_;
  if (end < value)
  {
    id v14 = v35;
    *(void *)end = &unk_1EF559A38;
    *((void *)end + 1) = v14;
    v15 = end + 24;
    goto LABEL_40;
  }
  begin = self->_retainedGroups.__begin_;
  unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  if (v17 + 1 > 0xAAAAAAAAAAAAAAALL) {
    abort();
  }
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
  uint64_t v19 = 2 * v18;
  if (2 * v18 <= v17 + 1) {
    uint64_t v19 = v17 + 1;
  }
  if (v18 >= 0x555555555555555) {
    unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v20 = v19;
  }
  if (v20)
  {
    if (v20 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    v21 = (char *)operator new(24 * v20);
  }
  else
  {
    v21 = 0;
  }
  v22 = (id *)&v21[24 * v17];
  v23 = &v21[24 * v20];
  id v24 = v35;
  id *v22 = &unk_1EF559A38;
  v22[1] = v24;
  v15 = v22 + 3;
  v26 = (char *)self->_retainedGroups.__begin_;
  v25 = (char *)self->_retainedGroups.__end_;
  if (v25 == v26)
  {
    self->_retainedGroups.__begin_ = v22;
    self->_retainedGroups.__end_ = v15;
    self->_retainedGroups.__end_cap_.__value_ = v23;
    if (v25) {
LABEL_39:
    }
      operator delete(v25);
  }
  else
  {
    uint64_t v27 = (uint64_t)&v21[24 * v17 - 24];
    do
    {
      *(v22 - 3) = &unk_1EF559A38;
      v22 -= 3;
      v22[1] = 0;
      objc_storeStrong(v22 + 1, *((id *)v25 - 2));
      v28 = (void *)*((void *)v25 - 2);
      *((void *)v25 - 2) = 0;

      v27 -= 24;
      v25 -= 24;
    }
    while (v25 != v26);
    v25 = (char *)self->_retainedGroups.__begin_;
    v29 = (char *)self->_retainedGroups.__end_;
    self->_retainedGroups.__begin_ = v22;
    self->_retainedGroups.__end_ = v15;
    self->_retainedGroups.__end_cap_.__value_ = v23;
    if (v29 != v25)
    {
      v30 = v29 - 24;
      v31 = v29 - 24;
      v32 = (void (***)(char *))(v29 - 24);
      do
      {
        v33 = *v32;
        v32 -= 3;
        (*v33)(v31);
        v30 -= 24;
        BOOL v34 = v31 == v25;
        v31 = (char *)v32;
      }
      while (!v34);
    }
    if (v25) {
      goto LABEL_39;
    }
  }
LABEL_40:
  self->_retainedGroups.__end_ = v15;
LABEL_41:
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = (char *)self + 48;
  return self;
}

- (RouteRenderLayerObserverProxy)initWithPolylineGroupObserver:(PolylineGroupChangeObserver *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RouteRenderLayerObserverProxy;
  result = [(RouteRenderLayerObserverProxy *)&v5 init];
  if (result) {
    result->_polylineGroupObserver = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((void *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_);
  begin = (char *)self->_retainedGroups.__begin_;
  if (begin)
  {
    end = (char *)self->_retainedGroups.__end_;
    objc_super v5 = self->_retainedGroups.__begin_;
    if (end != begin)
    {
      v6 = end - 24;
      unint64_t v7 = end - 24;
      v8 = (void (***)(char *))(end - 24);
      do
      {
        unint64_t v9 = *v8;
        v8 -= 3;
        (*v9)(v7);
        v6 -= 24;
        BOOL v10 = v7 == begin;
        unint64_t v7 = (char *)v8;
      }
      while (!v10);
      objc_super v5 = self->_retainedGroups.__begin_;
    }
    self->_retainedGroups.__end_ = begin;
    operator delete(v5);
  }
}

- (void)stopObserving:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_44;
  }
  left = (uint64_t *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_44;
  }
  v6 = self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  while (1)
  {
    unint64_t v7 = v6[4];
    if (v7 <= (unint64_t)v4) {
      break;
    }
LABEL_4:
    v6 = (void *)*v6;
    if (!v6) {
      goto LABEL_44;
    }
  }
  if (v7 < (unint64_t)v4)
  {
    ++v6;
    goto LABEL_4;
  }
  p_pair1 = (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_;
  unint64_t v9 = (RouteRenderLayerObserverProxy *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_;
  do
  {
    unint64_t value = (unint64_t)v9->_retainedGroups.__end_cap_.__value_;
    BOOL v11 = value >= (unint64_t)v4;
    if (value >= (unint64_t)v4) {
      p_polylineGroupObserver = (RouteRenderLayerObserverProxy **)v9;
    }
    else {
      p_polylineGroupObserver = (RouteRenderLayerObserverProxy **)&v9->_polylineGroupObserver;
    }
    if (v11) {
      p_pair1 = v9;
    }
    unint64_t v9 = *p_polylineGroupObserver;
  }
  while (*p_polylineGroupObserver);
  id v30 = v4;
  if (p_pair1 != (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_
    && p_pair1->_retainedGroups.__end_cap_.__value_ <= v4)
  {
    polylineGroupObserver = p_pair1->_polylineGroupObserver;
    if (polylineGroupObserver)
    {
      do
      {
        begin = (RouteRenderLayerObserverProxy **)polylineGroupObserver;
        polylineGroupObserver = (PolylineGroupChangeObserver *)polylineGroupObserver->var0;
      }
      while (polylineGroupObserver);
    }
    else
    {
      v15 = p_pair1;
      do
      {
        begin = (RouteRenderLayerObserverProxy **)v15->_retainedGroups.__begin_;
        BOOL v16 = *begin == v15;
        v15 = (RouteRenderLayerObserverProxy *)begin;
      }
      while (!v16);
    }
    if (self->_observedGroupsSet.__tree_.__begin_node_ == p_pair1) {
      self->_observedGroupsSet.__tree_.__begin_node_ = begin;
    }
    --self->_observedGroupsSet.__tree_.__pair3_.__value_;
    std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(left, (uint64_t *)p_pair1);

    operator delete(p_pair1);
    id v4 = v30;
  }
  [v4 removeObserver:self];
  unint64_t v17 = (id *)self->_retainedGroups.__begin_;
  end = (id *)self->_retainedGroups.__end_;
  if (v17 == end)
  {
    v23 = (id *)self->_retainedGroups.__begin_;
  }
  else
  {
    while (1)
    {
      id v19 = v17[1];
      id v20 = v30;
      v21 = v20;
      if (v19 == v20) {
        break;
      }
      char v22 = [v19 isEqual:v20];

      if (v22) {
        goto LABEL_34;
      }
      v17 += 3;
      if (v17 == end)
      {
        unint64_t v17 = end;
        goto LABEL_34;
      }
    }

LABEL_34:
    v23 = v17;
    unint64_t v17 = (id *)self->_retainedGroups.__end_;
  }
  id v4 = v30;
  if (v23 != v17)
  {
    id v24 = v23 + 3;
    if (v23 + 3 != v17)
    {
      do
      {
        v23 = v24;
        objc_storeStrong(v24 - 2, v24[1]);
        id v25 = v23[1];
        v23[1] = 0;

        id v24 = v23 + 3;
      }
      while (v23 + 3 != v17);
      unint64_t v17 = (id *)self->_retainedGroups.__end_;
    }
    if (v17 != v23)
    {
      v26 = v17 - 3;
      uint64_t v27 = v17 - 3;
      v28 = v17 - 3;
      do
      {
        v29 = (void (**)(id *))*v28;
        v28 -= 3;
        (*v29)(v27);
        v26 -= 3;
        BOOL v16 = v27 == v23;
        uint64_t v27 = v28;
      }
      while (!v16);
    }
    self->_retainedGroups.__end_ = v23;
    id v4 = v30;
  }
LABEL_44:
}

- (void)polylineGroup:(id)a3 didSkipPolyline:(id)a4
{
}

- (void)polylineGroup:(id)a3 didFocusPolyline:(id)a4
{
}

- (void)polylineGroup:(id)a3 didSelectPolyline:(id)a4
{
}

- (void)polylineGroup:(id)a3 didRemovePolyline:(id)a4
{
}

- (void)polylineGroup:(id)a3 didAddPolyline:(id)a4
{
}

- (void)dealloc
{
  begin_node = (RouteRenderLayerObserverProxy *)self->_observedGroupsSet.__tree_.__begin_node_;
  p_pair1 = &self->_observedGroupsSet.__tree_.__pair1_;
  if (begin_node != (RouteRenderLayerObserverProxy *)&self->_observedGroupsSet.__tree_.__pair1_)
  {
    do
    {
      id v12 = begin_node->_retainedGroups.__end_cap_.__value_;
      [v12 removeObserver:self];

      polylineGroupObserver = begin_node->_polylineGroupObserver;
      if (polylineGroupObserver)
      {
        do
        {
          begin = (RouteRenderLayerObserverProxy *)polylineGroupObserver;
          polylineGroupObserver = (PolylineGroupChangeObserver *)polylineGroupObserver->var0;
        }
        while (polylineGroupObserver);
      }
      else
      {
        do
        {
          begin = (RouteRenderLayerObserverProxy *)begin_node->_retainedGroups.__begin_;
          BOOL v11 = begin->super.isa == (Class)begin_node;
          begin_node = begin;
        }
        while (!v11);
      }
      begin_node = begin;
    }
    while (begin != (RouteRenderLayerObserverProxy *)p_pair1);
  }
  std::__tree<VKPolylineGroupOverlay * {__strong}>::destroy((void *)self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_);
  self->_observedGroupsSet.__tree_.__pair1_.__value_.__left_ = 0;
  self->_observedGroupsSet.__tree_.__pair3_.__value_ = 0;
  self->_observedGroupsSet.__tree_.__begin_node_ = p_pair1;
  v6 = (char *)self->_retainedGroups.__begin_;
  end = (char *)self->_retainedGroups.__end_;
  if (end != v6)
  {
    unint64_t v7 = end - 24;
    v8 = end - 24;
    unint64_t v9 = (void (***)(char *))(end - 24);
    do
    {
      BOOL v10 = *v9;
      v9 -= 3;
      (*v10)(v8);
      v7 -= 24;
      BOOL v11 = v8 == v6;
      v8 = (char *)v9;
    }
    while (!v11);
  }
  self->_retainedGroups.__end_ = v6;
  v15.receiver = self;
  v15.super_class = (Class)RouteRenderLayerObserverProxy;
  [(RouteRenderLayerObserverProxy *)&v15 dealloc];
}

@end