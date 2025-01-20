@interface USKNodeSiblingIterator
- (USKNodeSiblingIterator)initWithPrim:(const void *)a3;
- (USKNodeSiblingIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4;
- (USKNodeSiblingIterator)initWithSiblingRange:(const void *)a3;
- (id).cxx_construct;
- (id)nextObject;
@end

@implementation USKNodeSiblingIterator

- (USKNodeSiblingIterator)initWithSiblingRange:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)USKNodeSiblingIterator;
  v4 = [(USKNodeSiblingIterator *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_range._begin._underlyingIterator = *(Usd_PrimData **)a3;
    sub_2345EE430((uint64_t)&v4->_range._begin._proxyPrimPath, (_DWORD *)a3 + 2);
    sub_2345EE488((uint64_t)&v5->_range._begin._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)a3 + 3);
    long long v6 = *((_OWORD *)a3 + 1);
    LOBYTE(v5->_range._begin._predicate._values.__first_) = *((unsigned char *)a3 + 32);
    *(_OWORD *)&v5->_range._begin._proxyPrimPath._propPart._poolHandle = v6;
    *(void *)&v5->_range._begin._predicate._negate = *((void *)a3 + 5);
    sub_2345EE430((uint64_t)&v5->_range._end, (_DWORD *)a3 + 12);
    sub_2345EE488((uint64_t)&v5->_range._end._underlyingIterator + 4, (_DWORD *)a3 + 13);
    char v7 = *((unsigned char *)a3 + 72);
    v5->_range._end._proxyPrimPath = *(SdfPath *)((char *)a3 + 56);
    LOBYTE(v5->_range._end._predicate._mask.__first_) = v7;
    v10 = *(Usd_PrimData **)a3;
    sub_2345EBC84(&v11, (_DWORD *)a3 + 2);
    sub_2345EBCD0(&v12, (_DWORD *)a3 + 3);
    long long v13 = *((_OWORD *)a3 + 1);
    uint64_t v14 = *((void *)a3 + 4);
    v5->_range._end._predicate._values.__first_ = (unint64_t)v10;
    sub_2345EBF68((uint64_t)&v5->_range._end._predicate._negate, &v11);
    sub_2345EBFC0((uint64_t)(&v5->_range._end._predicate._negate + 4));
    *(_OWORD *)&v5->_it._underlyingIterator = v13;
    LOBYTE(v5->_it._proxyPrimPath._propPart._poolHandle) = v14;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v11);
    v8 = v5;
  }

  return v5;
}

- (USKNodeSiblingIterator)initWithPrim:(const void *)a3
{
  UsdPrimDefaultPredicate = (uint64_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate((pxrInternal__aapl__pxrReserved__ *)self);
  uint64_t v6 = *UsdPrimDefaultPredicate;
  uint64_t v7 = UsdPrimDefaultPredicate[1];
  uint64_t v8 = UsdPrimDefaultPredicate[2];
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
  v16[0] = v6 & 0xFFFFFFFFFFFFDFFFLL;
  v16[1] = v7 | 0x2000;
  v16[2] = v8;
  sub_234630D88((uint64_t)a3, v16, (uint64_t)v13);
  int v11 = (USKNodeSiblingIterator *)(id)objc_msgSend_initWithSiblingRange_(self, v9, (uint64_t)v13, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);

  return v11;
}

- (USKNodeSiblingIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  unint64_t first = a4->_mask.__first_;
  unint64_t v7 = a4->_values.__first_;
  uint64_t v8 = *(void *)&a4->_negate;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
  v16[0] = first & 0xFFFFFFFFFFFFDFFFLL;
  v16[1] = v7 | 0x2000;
  v16[2] = v8;
  sub_234630D88((uint64_t)a3, v16, (uint64_t)v13);
  int v11 = (USKNodeSiblingIterator *)(id)objc_msgSend_initWithSiblingRange_(self, v9, (uint64_t)v13, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);

  return v11;
}

- (id)nextObject
{
  *(void *)&long long v16 = *(void *)&self->_range._begin._predicate._negate;
  p_end = &self->_range._end;
  sub_2345EBC84((_DWORD *)&v16 + 2, &self->_range._end);
  sub_2345EBCD0((_DWORD *)&v16 + 3, (_DWORD *)&self->_range._end._underlyingIterator + 1);
  p_values = &self->_range._end._predicate._values;
  unint64_t first = self->_range._end._predicate._values.__first_;
  SdfPath proxyPrimPath = self->_range._end._proxyPrimPath;
  unint64_t v18 = self->_range._end._predicate._mask.__first_;
  if (__PAIR128__(*(void *)&self->_range._end._predicate._negate, first) == v16) {
    char v6 = sub_2346316E8((uint64_t)&self->_it, (uint64_t)&proxyPrimPath);
  }
  else {
    char v6 = 0;
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v16 + 8);
  if (v6)
  {
    unint64_t v7 = 0;
  }
  else
  {
    *(void *)&long long v16 = *(void *)&self->_range._begin._predicate._negate;
    sub_2345EBC84((_DWORD *)&v16 + 2, p_end);
    sub_2345EBCD0((_DWORD *)&v16 + 3, (_DWORD *)&self->_range._end._underlyingIterator + 1);
    SdfPath proxyPrimPath = self->_range._end._proxyPrimPath;
    unint64_t v18 = self->_range._end._predicate._mask.__first_;
    if (*(_OWORD *)&self->_range._end._predicate._values.__first_ == v16
      && (sub_2346316E8((uint64_t)&self->_it, (uint64_t)&proxyPrimPath) & 1) != 0)
    {
      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = [USKNode alloc];
      sub_234631760((uint64_t)p_values, (uint64_t)v12);
      unint64_t v7 = objc_msgSend_initWithUsdPrim_(v8, v9, (uint64_t)v12, v10);
      if ((v15 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2345EBD10((uint64_t)&v14);
      if (v13) {
        sub_2346091F8(v13);
      }
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v16 + 8);
    sub_2346315C0((uint64_t)p_values);
  }
  return v7;
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_range._end._predicate._negate);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_range._end);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_range._begin._proxyPrimPath);
}

- (id).cxx_construct
{
  self->_range._end._predicate._values.__first_ = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  self->_it._underlyingIterator = 0;
  self->_it._proxyPrimPath._primPart._poolHandle = 0;
  LOBYTE(self->_it._proxyPrimPath._propPart._poolHandle) = 0;
  return self;
}

@end