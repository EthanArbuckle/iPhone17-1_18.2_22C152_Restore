@interface USKObjectPath
- (BOOL)isEqual:(id)a3;
- (BOOL)isNodePath;
- (BOOL)isPropertyPath;
- (SdfPath)path;
- (USKObjectPath)init;
- (USKObjectPath)initWithSdfPath:(SdfPath)a3;
- (USKObjectPath)initWithString:(id)a3;
- (USKObjectPath)initWithToken:(id)a3;
- (id).cxx_construct;
- (id)nodePath;
- (id)pathByAppendingPropertyComponent:(id)a3;
- (id)propertyName;
- (id)stringValue;
- (id)tokenValue;
- (unint64_t)hash;
@end

@implementation USKObjectPath

- (SdfPath)path
{
  v4 = sub_2345EBC84(v2, &self->_path) + 1;
  v5 = (Ptr *)sub_2345EBCD0(v4, (_DWORD *)&self->_path._primPart._poolHandle + 1);
  result._propPart._poolHandle = v6;
  result._primPart._poolHandle = v5;
  return result;
}

- (USKObjectPath)init
{
  sub_234627B1C();
  v7.receiver = self;
  v7.super_class = (Class)USKObjectPath;
  v3 = [(USKObjectPath *)&v7 init];
  if (v3)
  {
    uint64_t v6 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
    sub_2345EBF68((uint64_t)&v3->_path, (int *)&v6);
    sub_2345EBFC0((uint64_t)&v3->_path._primPart._poolHandle + 4);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v6);
    v4 = v3;
  }

  return v3;
}

- (USKObjectPath)initWithSdfPath:(SdfPath)a3
{
  Handle poolHandle = a3._primPart._poolHandle;
  sub_234627B1C();
  v9.receiver = self;
  v9.super_class = (Class)USKObjectPath;
  v5 = [(USKObjectPath *)&v9 init];
  uint64_t v6 = v5;
  if (v5)
  {
    sub_2345EE430((uint64_t)&v5->_path, poolHandle);
    sub_2345EE488((uint64_t)&v6->_path._primPart._poolHandle + 4, (_DWORD *)poolHandle + 1);
    objc_super v7 = v6;
  }

  return v6;
}

- (USKObjectPath)initWithString:(id)a3
{
  id v4 = a3;
  sub_234627B1C();
  v16.receiver = self;
  v16.super_class = (Class)USKObjectPath;
  v5 = [(USKObjectPath *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    sub_2345DB968(__p, v10);
    MEMORY[0x237DC2500](&v15, __p);
    sub_2345EBF68((uint64_t)&v5->_path, &v15);
    sub_2345EBFC0((uint64_t)&v5->_path._primPart._poolHandle + 4);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v15);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
    v11 = v5;
  }

  return v5;
}

- (USKObjectPath)initWithToken:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)USKObjectPath;
  v5 = [(USKObjectPath *)&v15 init];
  uint64_t v9 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  if (!v4)
  {
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  v5 = (USKObjectPath *)objc_msgSend_token(v4, v6, v7, v8);
  if ((v13 & 0xFFFFFFFFFFFFFFF8) == 0)
  {
LABEL_6:
    unint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v5);
    goto LABEL_7;
  }
  unint64_t EmptyString = (v13 & 0xFFFFFFFFFFFFFFF8) + 16;
LABEL_7:
  MEMORY[0x237DC2500](&v14, EmptyString);
  sub_2345EBF68((uint64_t)&v9->_path, &v14);
  sub_2345EBFC0((uint64_t)&v9->_path._primPart._poolHandle + 4);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  if ((v13 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  v11 = v9;
LABEL_10:

  return v9;
}

- (id)stringValue
{
  p_path = &self->_path;
  if (pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL())
  {
    v3 = NSString;
    uint64_t String = pxrInternal__aapl__pxrReserved__::SdfPath::GetString((pxrInternal__aapl__pxrReserved__::SdfPath *)p_path);
    if (*(char *)(String + 23) >= 0) {
      objc_msgSend_stringWithUTF8String_(v3, v5, String, v6);
    }
    else {
    uint64_t v7 = objc_msgSend_stringWithUTF8String_(v3, v5, *(void *)String, v6);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)pathByAppendingPropertyComponent:(id)a3
{
  uint64_t v17 = 0;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x237DC2530](&v16, v8);
  pxrInternal__aapl__pxrReserved__::SdfPath::AppendProperty(&v17, (pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v16);
  if ((v16 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  uint64_t v9 = [USKObjectPath alloc];
  sub_2345EBC84(&v14, &v17);
  sub_2345EBCD0(&v15, (_DWORD *)&v17 + 1);
  v12 = objc_msgSend_initWithSdfPath_(v9, v10, (uint64_t)&v14, v11);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);

  return v12;
}

- (id)tokenValue
{
  p_path = &self->_path;
  if (pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL())
  {
    v3 = [USKToken alloc];
    uint64_t v6 = *(atomic_uint **)pxrInternal__aapl__pxrReserved__::SdfPath::GetToken((pxrInternal__aapl__pxrReserved__::SdfPath *)p_path);
    v10 = v6;
    if ((v6 & 7) != 0)
    {
      uint64_t v7 = (atomic_uint *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF8);
      if ((atomic_fetch_add_explicit(v7, 2u, memory_order_relaxed) & 1) == 0) {
        v10 = v7;
      }
    }
    uint64_t v8 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v10, v5);
    if ((v10 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (BOOL)isNodePath
{
  return MEMORY[0x270FA4C50](&self->_path, a2);
}

- (id)nodePath
{
  v3 = [USKObjectPath alloc];
  pxrInternal__aapl__pxrReserved__::SdfPath::GetPrimPath(&v8, (pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
  uint64_t v6 = objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v8);
  return v6;
}

- (BOOL)isPropertyPath
{
  return MEMORY[0x270FA4CC8](&self->_path, a2);
}

- (id)propertyName
{
  v3 = [USKToken alloc];
  pxrInternal__aapl__pxrReserved__::SdfPath::GetElementToken(&v8, (pxrInternal__aapl__pxrReserved__::SdfPath *)&self->_path);
  uint64_t v6 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v8, v5);
  if ((v8 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (USKObjectPath *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_path(v5, v6, v7, v8);
    Handle poolHandle = self->_path._primPart._poolHandle;
    v10 = v13;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    BOOL v11 = poolHandle == v10;
    sub_2345EBD10((uint64_t)&v13);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return bswap64(0x9E3779B97F4A7C55* (HIDWORD(self->_path._primPart._poolHandle)+ ((HIDWORD(self->_path._primPart._poolHandle)+ (unint64_t)LODWORD(self->_path._primPart._poolHandle)+ (HIDWORD(self->_path._primPart._poolHandle) + (unint64_t)LODWORD(self->_path._primPart._poolHandle))* (HIDWORD(self->_path._primPart._poolHandle) + (unint64_t)LODWORD(self->_path._primPart._poolHandle))) >> 1)));
}

- (void).cxx_destruct
{
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&self->_path);
}

- (id).cxx_construct
{
  return self;
}

@end