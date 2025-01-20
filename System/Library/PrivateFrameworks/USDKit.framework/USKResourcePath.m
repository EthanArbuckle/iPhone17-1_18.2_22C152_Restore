@interface USKResourcePath
- (BOOL)isEqual:(id)a3;
- (SdfAssetPath)sdfAssetPath;
- (USKResourcePath)initWithSdfAssetPath:(SdfAssetPath *)a3;
- (id).cxx_construct;
- (id)path;
- (id)resolvedPath;
- (unint64_t)hash;
@end

@implementation USKResourcePath

- (SdfAssetPath)sdfAssetPath
{
  uint64_t v2 = v1;
  if (*(char *)(v1 + 31) < 0)
  {
    sub_2345DBA34(retstr, *(void **)(v1 + 8), *(void *)(v1 + 16));
  }
  else
  {
    *(_OWORD *)retstr->_assetPath.__r_.__value_.var0.var0.__data_ = *(_OWORD *)(v1 + 8);
    *((void *)&retstr->_assetPath.__r_.__value_.var0.var1 + 2) = *(void *)(v1 + 24);
  }
  result = (SdfAssetPath *)&retstr->_assetPath.__r_.var0;
  if (*(char *)(v2 + 55) < 0) {
    return (SdfAssetPath *)sub_2345DBA34(result, *(void **)(v2 + 32), *(void *)(v2 + 40));
  }
  *(_OWORD *)result->_assetPath.__r_.__value_.var0.var0.__data_ = *(_OWORD *)(v2 + 32);
  retstr[1]._assetPath.__r_.__value_.var0.var1.__data_ = *(char **)(v2 + 48);
  return result;
}

- (USKResourcePath)initWithSdfAssetPath:(SdfAssetPath *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)USKResourcePath;
  v4 = [(USKResourcePath *)&v8 init];
  v5 = v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    std::string::operator=((std::string *)(v5 + 32), (const std::string *)&a3->_assetPath.__r_.var0);
    v6 = v5;
  }

  return (USKResourcePath *)v5;
}

- (id)path
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v6 = 0;
  if (*((char *)&self->_path._assetPath.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_2345DBA34(__p, self->_path._assetPath.__r_.__value_.var0.var1.__data_, self->_path._assetPath.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)self->_path._assetPath.__r_.__value_.var0.var0.__data_;
    uint64_t v6 = *((void *)&self->_path._assetPath.__r_.__value_.var0.var1 + 2);
  }
  if (v6 >= 0) {
    objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)__p, v2, __p[0], __p[1], v6);
  }
  else {
  v3 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)__p[0], v2, __p[0], __p[1], v6);
  }
  if (SHIBYTE(v6) < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

- (id)resolvedPath
{
  __p[0] = 0;
  __p[1] = 0;
  Class isa = 0;
  if (SHIBYTE(self[1].super.isa) < 0)
  {
    sub_2345DBA34(__p, *(void **)&self->_path._assetPath.__r_.var0, self->_path._assetPath.var0);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)&self->_path._assetPath.__r_.var0;
    Class isa = self[1].super.isa;
  }
  if (SHIBYTE(isa) >= 0) {
    objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)__p, v2, __p[0], __p[1], isa);
  }
  else {
  v3 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)__p[0], v2, __p[0], __p[1], isa);
  }
  if (SHIBYTE(isa) < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (USKResourcePath *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_sdfAssetPath(v5, v6, v7, v8);
    char v9 = sub_2345F1F1C((unsigned __int8 *)&self->_path, (unsigned __int8 *)&v11);
    if (v14 < 0) {
      operator delete(__p);
    }
    if (v12 < 0) {
      operator delete(v11);
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3[0] = 0;
  v3[1] = 0;
  sub_2345F1EB0((pxrInternal__aapl__pxrReserved__::Tf_HashState *)v3, self->_path._assetPath.__r_.__value_.var0.var0.__data_, (uint64_t)&self->_path._assetPath.__r_.var0);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  if (SHIBYTE(self[1].super.isa) < 0) {
    operator delete(*(void **)&self->_path._assetPath.__r_.var0);
  }
  if (*((char *)&self->_path._assetPath.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_path._assetPath.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (id).cxx_construct
{
  return self;
}

@end