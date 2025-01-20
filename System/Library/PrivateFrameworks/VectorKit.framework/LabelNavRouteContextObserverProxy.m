@interface LabelNavRouteContextObserverProxy
- (LabelNavRouteContextObserverProxy)initWithRouteContextChangeObserver:(RouteContextChangeObserver *)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)routeContextStateDidChange:(id)a3;
- (void)startObserving:(id)a3;
- (void)stopObserving:(id)a3;
@end

@implementation LabelNavRouteContextObserverProxy

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  v2 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v5 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v4 = v3;
    self = v5;
    if (v4) {
      operator new();
    }
  }
  *((void *)self + 5) = *((void *)v2 + 91);
  return self;
}

- (LabelNavRouteContextObserverProxy)initWithRouteContextChangeObserver:(RouteContextChangeObserver *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LabelNavRouteContextObserverProxy;
  result = [(LabelNavRouteContextObserverProxy *)&v5 init];
  if (result) {
    result->_observer = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  begin = (char *)self->_observedContexts.__begin_;
  if (begin)
  {
    end = (char *)self->_observedContexts.__end_;
    objc_super v5 = self->_observedContexts.__begin_;
    if (end != begin)
    {
      v6 = end - 24;
      v7 = end - 24;
      v8 = (void (***)(char *, void *))(end - 24);
      do
      {
        v9 = *v8;
        v8 -= 3;
        (*v9)(v7, v5);
        v6 -= 24;
        BOOL v10 = v7 == begin;
        v7 = (char *)v8;
      }
      while (!v10);
    }
    self->_observedContexts.__end_ = begin;
    v11 = *(void (**)(void))(*(void *)self->_observedContexts.__end_cap_.__value__2._allocator + 40);
    v11();
  }
}

- (void)routeContextStateDidChange:(id)a3
{
  id v5 = a3;
  observer = self->_observer;
  if (observer) {
    (*(void (**)(RouteContextChangeObserver *, id))observer->var0)(observer, v5);
  }
}

- (void)stopObserving:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    begin = (char *)self->_observedContexts.__begin_;
    end = (char *)self->_observedContexts.__end_;
    if (begin != end)
    {
      while (*((id *)begin + 1) != v4)
      {
        begin += 24;
        if (begin == end) {
          goto LABEL_15;
        }
      }
    }
    if (begin != end)
    {
      id v15 = v4;
      [v4 removeObserver:self withType:2];
      v7 = begin + 24;
      v8 = (char *)self->_observedContexts.__end_;
      if (begin + 24 != v8)
      {
        do
        {
          begin = v7;
          objc_storeStrong((id *)v7 - 2, *((id *)v7 + 1));
          v9 = (void *)*((void *)begin + 1);
          *((void *)begin + 1) = 0;

          v7 = begin + 24;
        }
        while (begin + 24 != v8);
        v7 = (char *)self->_observedContexts.__end_;
      }
      if (v7 != begin)
      {
        BOOL v10 = v7 - 24;
        v11 = v7 - 24;
        v12 = v7 - 24;
        do
        {
          v13 = *(void (***)(char *))v12;
          v12 -= 24;
          (*v13)(v11);
          v10 -= 24;
          BOOL v14 = v11 == begin;
          v11 = v12;
        }
        while (!v14);
      }
      self->_observedContexts.__end_ = begin;
      id v4 = v15;
    }
  }
LABEL_15:
}

- (void)startObserving:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    begin = (id *)self->_observedContexts.__begin_;
    end = (id *)self->_observedContexts.__end_;
    if (begin != end)
    {
      while (begin[1] != v4)
      {
        begin += 3;
        if (begin == end) {
          goto LABEL_7;
        }
      }
    }
    if (begin == end)
    {
LABEL_7:
      id v30 = v4;
      [v4 addObserver:self withType:2];
      v8 = (char *)self->_observedContexts.__end_;
      value = (char *)self->_observedContexts.__end_cap_.__value_;
      if (v8 < value)
      {
        if (v8)
        {
          id v9 = v30;
          *(void *)v8 = &unk_1EF5595D8;
          *((void *)v8 + 1) = v9;
        }
        BOOL v10 = v8 + 24;
        goto LABEL_30;
      }
      v11 = self->_observedContexts.__begin_;
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((value - v11) >> 3);
      uint64_t v14 = 2 * v13;
      if (2 * v13 <= v12 + 1) {
        uint64_t v14 = v12 + 1;
      }
      if (v13 >= 0x555555555555555) {
        uint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        uint64_t v15 = v14;
      }
      if (v15)
      {
        uint64_t v16 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)self->_observedContexts.__end_cap_.__value__2._allocator
                                                                       + 16))(self->_observedContexts.__end_cap_.__value__2._allocator, 24 * v15, 8);
        v17 = (id *)(v16 + 24 * v12);
        uint64_t v15 = v16 + 24 * v15;
        if (v16)
        {
          id v18 = v30;
          id *v17 = &unk_1EF5595D8;
          *(void *)(v16 + 24 * v12 + 8) = v18;
        }
      }
      else
      {
        v17 = (id *)(24 * v12);
      }
      BOOL v10 = v17 + 3;
      v20 = (id *)self->_observedContexts.__begin_;
      v19 = (id *)self->_observedContexts.__end_;
      if (v19 == v20)
      {
        self->_observedContexts.__begin_ = v17;
        self->_observedContexts.__end_ = v10;
        v24 = self->_observedContexts.__end_cap_.__value_;
        self->_observedContexts.__end_cap_.__value_ = (void *)v15;
        if (!v19) {
          goto LABEL_30;
        }
      }
      else
      {
        v21 = v17 - 3;
        do
        {
          *(v17 - 3) = &unk_1EF5595D8;
          v17 -= 3;
          v17[1] = 0;
          objc_storeStrong(v17 + 1, *(v19 - 2));
          v22 = *(v19 - 2);
          *(v19 - 2) = 0;

          v21 -= 3;
          v19 -= 3;
        }
        while (v19 != v20);
        v19 = (id *)self->_observedContexts.__begin_;
        v23 = (id *)self->_observedContexts.__end_;
        self->_observedContexts.__begin_ = v17;
        self->_observedContexts.__end_ = v10;
        v24 = self->_observedContexts.__end_cap_.__value_;
        self->_observedContexts.__end_cap_.__value_ = (void *)v15;
        if (v23 != v19)
        {
          v25 = (char *)(v23 - 3);
          v26 = v23 - 3;
          v27 = v23 - 3;
          do
          {
            v28 = (void (**)(id *))*v27;
            v27 -= 3;
            (*v28)(v26);
            v25 -= 24;
            BOOL v29 = v26 == v19;
            v26 = v27;
          }
          while (!v29);
        }
        if (!v19) {
          goto LABEL_30;
        }
      }
      (*(void (**)(Allocator *, id *, int64_t))(*(void *)self->_observedContexts.__end_cap_.__value__2._allocator
                                                                + 40))(self->_observedContexts.__end_cap_.__value__2._allocator, v19, v24 - (unsigned char *)v19);
LABEL_30:
      id v4 = v30;
      self->_observedContexts.__end_ = v10;
    }
  }
}

- (void)dealloc
{
  begin = (id *)self->_observedContexts.__begin_;
  for (i = (id *)self->_observedContexts.__end_; begin != i; begin += 3)
  {
    id v5 = begin[1];
    [v5 removeObserver:self withType:2];
  }
  v6.receiver = self;
  v6.super_class = (Class)LabelNavRouteContextObserverProxy;
  [(LabelNavRouteContextObserverProxy *)&v6 dealloc];
}

@end