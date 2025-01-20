@interface USKNodeSubtreeIterator
- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3;
- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4;
- (USKNodeSubtreeIterator)initWithScene:(const void *)a3;
- (USKNodeSubtreeIterator)initWithScene:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4;
- (USKNodeSubtreeIterator)initWithSubtreeRange:(const void *)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextObject;
@end

@implementation USKNodeSubtreeIterator

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [USKNodeSubtreeIterator alloc];
  return (id)objc_msgSend_initWithSubtreeRange_(v4, v5, (uint64_t)&self->_range, v6);
}

- (USKNodeSubtreeIterator)initWithSubtreeRange:(const void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)USKNodeSubtreeIterator;
  v4 = [(USKNodeSubtreeIterator *)&v12 init];
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *(_OWORD *)a3;
    sub_2345EE430((uint64_t)(v4 + 24), (_DWORD *)a3 + 4);
    sub_2345EE488((uint64_t)(v5 + 28), (_DWORD *)a3 + 5);
    long long v6 = *(_OWORD *)((char *)a3 + 37);
    *((_OWORD *)v5 + 2) = *(_OWORD *)((char *)a3 + 24);
    *(_OWORD *)(v5 + 45) = v6;
    sub_23462FE04((uint64_t *)v5 + 1, (uint64_t)&v9);
    *((_OWORD *)v5 + 4) = v9;
    sub_2345EBF68((uint64_t)(v5 + 80), v10);
    sub_2345EBFC0((uint64_t)(v5 + 84));
    *((_DWORD *)v5 + 22) = v10[2];
    *((_WORD *)v5 + 46) = v11;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v10);
    v7 = v5;
  }

  return (USKNodeSubtreeIterator *)v5;
}

- (USKNodeSubtreeIterator)initWithScene:(const void *)a3
{
  v4 = (pxrInternal__aapl__pxrReserved__ *)sub_23461C8F8((uint64_t *)a3);
  UsdPrimDefaultPredicate = (int8x16_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate(v4);
  uint64_t v6 = UsdPrimDefaultPredicate[1].i64[0];
  v7.i64[0] = -8193;
  v7.i64[0] = vandq_s8(*UsdPrimDefaultPredicate, v7).u64[0];
  v7.i64[1] = vorrq_s8(*UsdPrimDefaultPredicate, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  *(int8x16_t *)&v12._mask.__first_ = v7;
  *(void *)&v12._negate = v6;
  pxrInternal__aapl__pxrReserved__::UsdStage::Traverse(v13, v4, &v12);
  v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v13, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);

  return v10;
}

- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3
{
  UsdPrimDefaultPredicate = (int8x16_t *)pxrInternal__aapl__pxrReserved__::GetUsdPrimDefaultPredicate((pxrInternal__aapl__pxrReserved__ *)self);
  uint64_t v6 = UsdPrimDefaultPredicate[1].i64[0];
  v7.i64[0] = -8193;
  v7.i64[0] = vandq_s8(*UsdPrimDefaultPredicate, v7).u64[0];
  v7.i64[1] = vorrq_s8(*UsdPrimDefaultPredicate, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  int8x16_t v12 = v7;
  uint64_t v13 = v6;
  sub_23463183C((uint64_t)v14, (uint64_t)a3, &v12);
  v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v14, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);

  return v10;
}

- (USKNodeSubtreeIterator)initWithScene:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  uint64_t v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_23461C8F8((uint64_t *)a3);
  uint64_t v7 = *(void *)&a4->_negate;
  v8.i64[0] = -8193;
  v8.i64[0] = vandq_s8(*(int8x16_t *)&a4->_mask.__first_, v8).u64[0];
  v8.i64[1] = vorrq_s8(*(int8x16_t *)a4, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  *(int8x16_t *)&v13._mask.__first_ = v8;
  *(void *)&v13._negate = v7;
  pxrInternal__aapl__pxrReserved__::UsdStage::Traverse(v14, v6, &v13);
  __int16 v11 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v9, (uint64_t)v14, v10);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);

  return v11;
}

- (USKNodeSubtreeIterator)initWithPrim:(const void *)a3 withPredicate:(Usd_PrimFlagsPredicate *)a4
{
  uint64_t v6 = *(void *)&a4->_negate;
  v4.i64[0] = -8193;
  *(void *)&long long v7 = vandq_s8(*(int8x16_t *)&a4->_mask.__first_, v4).u64[0];
  *((void *)&v7 + 1) = vorrq_s8(*(int8x16_t *)a4, (int8x16_t)vdupq_n_s64(0x2000uLL)).i64[1];
  long long v12 = v7;
  uint64_t v13 = v6;
  sub_23463183C((uint64_t)v14, (uint64_t)a3, &v12);
  uint64_t v10 = (USKNodeSubtreeIterator *)(id)objc_msgSend_initWithSubtreeRange_(self, v8, (uint64_t)v14, v9);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);

  return v10;
}

- (id)nextObject
{
  p_initDepth = (pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator *)&self->_range._initDepth;
  p_range = (Usd_PrimData *)&self->_range;
  end = self->_range._end;
  v16 = (Usd_PrimData *)&self->_range;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  BOOL v5 = 0;
  int v18 = 0;
  __int16 v19 = 0;
  if (self->_it._underlyingIterator == v16) {
    BOOL v5 = *(Usd_PrimData **)p_initDepth == end
  }
      && self->_it._range == v17
      && !LODWORD(self->_it._proxyPrimPath._primPart._poolHandle)
      && !BYTE4(self->_it._proxyPrimPath._primPart._poolHandle)
      && BYTE5(self->_it._proxyPrimPath._primPart._poolHandle) == 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);
  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    end = self->_range._end;
    v16 = p_range;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
    int v18 = 0;
    __int16 v19 = 0;
    if (self->_it._underlyingIterator == p_range
      && *(Usd_PrimData **)p_initDepth == end
      && self->_it._range == v17
      && !LODWORD(self->_it._proxyPrimPath._primPart._poolHandle)
      && !BYTE4(self->_it._proxyPrimPath._primPart._poolHandle)
      && !BYTE5(self->_it._proxyPrimPath._primPart._poolHandle))
    {
      uint64_t v6 = 0;
    }
    else
    {
      long long v7 = [USKNode alloc];
      sub_234630460((uint64_t)p_initDepth, (uint64_t)&v11);
      uint64_t v6 = objc_msgSend_initWithUsdPrim_(v7, v8, (uint64_t)&v11, v9);
      if ((v14 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2345EBD10((uint64_t)&v13);
      if (v12) {
        sub_2346091F8(v12);
      }
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v17);
    pxrInternal__aapl__pxrReserved__::UsdPrimRange::iterator::increment(p_initDepth);
  }
  return v6;
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_it._range);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_range._initProxyPrimPath);
}

- (id).cxx_construct
{
  self->_range._begin = 0;
  self->_range._end = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  self->_range._initProxyPrimPath._propPart._poolHandle = 0;
  self->_range._predicate._mask.__first_ = 0;
  LOBYTE(self->_range._predicate._values.__first_) = 0;
  *(_DWORD *)&self->_range._predicate._negate = 0;
  *(&self->_range._predicate._negate + 4) = 0;
  *(void *)&self->_range._initDepth = 0;
  self->_it._underlyingIterator = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  LODWORD(self->_it._proxyPrimPath._primPart._poolHandle) = 0;
  WORD2(self->_it._proxyPrimPath._primPart._poolHandle) = 0;
  return self;
}

@end