@interface USKPropertyIterator
- (USKPropertyIterator)initWithProperties:(const void *)a3;
- (id).cxx_construct;
- (id)nextObject;
@end

@implementation USKPropertyIterator

- (USKPropertyIterator)initWithProperties:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USKPropertyIterator;
  v4 = [(USKPropertyIterator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    uint64_t p_properties = (uint64_t)&v4->_properties;
    if (&v5->_properties != a3) {
      sub_234632354(p_properties, *(void *)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5);
    }
    v5->_it.__i_ = v5->_properties.__begin_;
    v7 = v5;
  }

  return v5;
}

- (id)nextObject
{
  if (self->_it.__i_ == self->_properties.__end_)
  {
    objc_super v9 = 0;
  }
  else
  {
    v3 = [USKProperty alloc];
    i = self->_it.__i_;
    int type = i->_type;
    uint64_t px = (uint64_t)i->_prim._p.px;
    uint64_t v12 = px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(px + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v13, &i->_proxyPrimPath);
    sub_2345EBCD0(&v14, (_DWORD *)&i->_proxyPrimPath._primPart._poolHandle + 1);
    Handle poolHandle = i->_proxyPrimPath._propPart._poolHandle;
    Handle v15 = poolHandle;
    if ((poolHandle & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      Handle v15 = (Handle)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8);
    }
    objc_super v9 = objc_msgSend_initWithUsdProperty_(v3, v6, (uint64_t)&type, v7);
    if ((v15 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13);
    if (v12) {
      sub_2346091F8(v12);
    }
    self->_it.__i_ = (UsdProperty *)((char *)self->_it.__i_ + 32);
  }
  return v9;
}

- (void).cxx_destruct
{
  uint64_t p_properties = &self->_properties;
  sub_234631FE0((void ***)&p_properties);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end