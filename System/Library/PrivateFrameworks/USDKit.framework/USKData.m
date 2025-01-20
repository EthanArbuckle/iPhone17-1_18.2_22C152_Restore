@interface USKData
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (NSData)dataNoCopy;
- (NSString)type;
- (USKData)initWithBool:(BOOL)a3;
- (USKData)initWithDouble2:(USKData *)self;
- (USKData)initWithDouble2Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithDouble3:(USKData *)self;
- (USKData)initWithDouble3Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithDouble4:(USKData *)self;
- (USKData)initWithDouble4Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithDouble4x4Array:(id *)a3 count:(unint64_t)a4;
- (USKData)initWithDouble:(double)a3;
- (USKData)initWithDoubleArray:(double *)a3 count:(unint64_t)a4;
- (USKData)initWithFloat2:(USKData *)self;
- (USKData)initWithFloat2Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithFloat3:(USKData *)self;
- (USKData)initWithFloat3Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithFloat4:(USKData *)self;
- (USKData)initWithFloat4Array:(USKData *)self count:(SEL)a2;
- (USKData)initWithFloat:(float)a3;
- (USKData)initWithFloatArray:(float *)a3 count:(unint64_t)a4;
- (USKData)initWithInt:(int)a3;
- (USKData)initWithIntArray:(int *)a3 count:(unint64_t)a4;
- (USKData)initWithObjectPath:(id)a3;
- (USKData)initWithQuatfArray:(id *)a3 count:(unint64_t)a4;
- (USKData)initWithResourcePath:(id)a3;
- (USKData)initWithResourcePathArray:(id)a3;
- (USKData)initWithString:(id)a3;
- (USKData)initWithStringArray:(id)a3;
- (USKData)initWithTimeCode:(id)a3;
- (USKData)initWithToken:(id)a3;
- (USKData)initWithTokenArray:(id)a3;
- (USKData)initWithUInt:(unsigned int)a3;
- (USKData)initWithUIntArray:(unsigned int *)a3 count:(unint64_t)a4;
- (USKData)initWithURL:(id)a3;
- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4;
- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withNodeOwner:(id)a5;
- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withPropertyOwner:(id)a5;
- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withSceneOwner:(id)a5;
- (VtValue)value;
- (double)double2Value;
- (double)double4x4Value;
- (double)doubleValue;
- (double)float3Value;
- (double)float4Value;
- (double)float4x4Value;
- (double)quatfValue;
- (float)floatValue;
- (id).cxx_construct;
- (id)objectPathValue;
- (id)pathArray;
- (id)resourcePath;
- (id)resourcePathArray;
- (id)stringArray;
- (id)stringValue;
- (id)timeCodeValue;
- (id)tokenArray;
- (id)tokenValue;
- (id)urlValue;
- (int)intValue;
- (int8x16_t)double3Value;
- (int8x8_t)float2Value;
- (uint64_t)double4Value;
- (uint64_t)initWithDouble4x4:(void *)a1;
- (uint64_t)initWithQuatf:(void *)a1;
- (unint64_t)arraySize;
- (unint64_t)double2Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)double3Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)double4Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4;
- (unint64_t)float2Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)float3Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)float4Array:(USKData *)self maxCount:(SEL)a2;
- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4;
- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4;
- (unsigned)uintValue;
- (void)setBoolValue:(BOOL)a3;
- (void)setDouble2Array:(USKData *)self count:(SEL)a2;
- (void)setDouble2Value:(USKData *)self;
- (void)setDouble3Array:(USKData *)self count:(SEL)a2;
- (void)setDouble3Value:(USKData *)self;
- (void)setDouble4Array:(USKData *)self count:(SEL)a2;
- (void)setDouble4Value:(USKData *)self;
- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4;
- (void)setDouble4x4Value:;
- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4;
- (void)setDoubleValue:(double)a3;
- (void)setFloat2Array:(USKData *)self count:(SEL)a2;
- (void)setFloat2Value:(USKData *)self;
- (void)setFloat3Array:(USKData *)self count:(SEL)a2;
- (void)setFloat3Value:(USKData *)self;
- (void)setFloat4Array:(USKData *)self count:(SEL)a2;
- (void)setFloat4Value:(USKData *)self;
- (void)setFloatArray:(float *)a3 count:(unint64_t)a4;
- (void)setFloatValue:(float)a3;
- (void)setIntArray:(int *)a3 count:(unint64_t)a4;
- (void)setIntValue:(int)a3;
- (void)setObjectPathValue:(id)a3;
- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4;
- (void)setQuatfValue:;
- (void)setResourcePath:(id)a3;
- (void)setResourcePathArray:(id)a3;
- (void)setStringArray:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTimeCodeValue:(id)a3;
- (void)setTokenArray:(id)a3;
- (void)setTokenValue:(id)a3;
- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUIntValue:(unsigned int)a3;
- (void)setURLValue:(id)a3;
- (void)setValue:(VtValue)a3;
@end

@implementation USKData

- (VtValue)value
{
  v3 = sub_2345DDDA0(v2, &self->_value._storage);
  result._info._ptrAndBits = v4;
  result._storage = (type)v3;
  return result;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4
{
  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  sub_234627B1C();
  v17.receiver = self;
  v17.super_class = (Class)USKData;
  v9 = [(USKData *)&v17 init];
  if (v9)
  {
    v10 = *(atomic_uint **)ptrAndBits;
    v16 = v10;
    if ((v10 & 7) != 0)
    {
      v11 = (atomic_uint *)((unint64_t)v10 & 0xFFFFFFFFFFFFFFF8);
      if ((atomic_fetch_add_explicit(v11, 2u, memory_order_relaxed) & 1) == 0) {
        v16 = v11;
      }
    }
    uint64_t v12 = objc_msgSend_dataTypeWithTfToken_(USKToken, v7, (uint64_t)&v16, v8);
    type = v9->_type;
    v9->_type = (NSString *)v12;

    if ((v16 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345E0670(&v9->_value._storage, storage);
    v9->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    v14 = v9;
  }

  return v9;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withNodeOwner:(id)a5
{
  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_234627B1C();
  v20.receiver = self;
  v20.super_class = (Class)USKData;
  uint64_t v12 = [(USKData *)&v20 init];
  if (v12)
  {
    v13 = *(atomic_uint **)ptrAndBits;
    v19 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (atomic_uint *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      if ((atomic_fetch_add_explicit(v14, 2u, memory_order_relaxed) & 1) == 0) {
        v19 = v14;
      }
    }
    uint64_t v15 = objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v19, v11);
    type = v12->_type;
    v12->_type = (NSString *)v15;

    if ((v19 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345E0670(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_nodeOwner, a4._rep._ptrAndBits);
    objc_super v17 = v12;
  }

  return v12;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withSceneOwner:(id)a5
{
  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_234627B1C();
  v20.receiver = self;
  v20.super_class = (Class)USKData;
  uint64_t v12 = [(USKData *)&v20 init];
  if (v12)
  {
    v13 = *(atomic_uint **)ptrAndBits;
    v19 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (atomic_uint *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      if ((atomic_fetch_add_explicit(v14, 2u, memory_order_relaxed) & 1) == 0) {
        v19 = v14;
      }
    }
    uint64_t v15 = objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v19, v11);
    type = v12->_type;
    v12->_type = (NSString *)v15;

    if ((v19 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345E0670(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_sceneOwner, a4._rep._ptrAndBits);
    objc_super v17 = v12;
  }

  return v12;
}

- (USKData)initWithVtValue:(VtValue)a3 typeName:(TfToken)a4 withPropertyOwner:(id)a5
{
  ptrAndBits = a3._info._ptrAndBits;
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  v9 = a4._rep._ptrAndBits;
  sub_234627B1C();
  v20.receiver = self;
  v20.super_class = (Class)USKData;
  uint64_t v12 = [(USKData *)&v20 init];
  if (v12)
  {
    v13 = *(atomic_uint **)ptrAndBits;
    v19 = v13;
    if ((v13 & 7) != 0)
    {
      v14 = (atomic_uint *)((unint64_t)v13 & 0xFFFFFFFFFFFFFFF8);
      if ((atomic_fetch_add_explicit(v14, 2u, memory_order_relaxed) & 1) == 0) {
        v19 = v14;
      }
    }
    uint64_t v15 = objc_msgSend_dataTypeWithTfToken_(USKToken, v10, (uint64_t)&v19, v11);
    type = v12->_type;
    v12->_type = (NSString *)v15;

    if ((v19 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345E0670(&v12->_value._storage, storage);
    v12->_arraySize = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
    objc_storeStrong((id *)&v12->_propertyOwner, a4._rep._ptrAndBits);
    objc_super v17 = v12;
  }

  return v12;
}

- (NSData)dataNoCopy
{
  p_value = &self->_value;
  if (pxrInternal__aapl__pxrReserved__::VtValue::IsArrayValued((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value))
  {
    uint64_t NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)p_value);
    ElementTypeid = (pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::VtValue::GetElementTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)p_value);
    v7 = (pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::TfType::_FindByTypeid(ElementTypeid, v6);
    uint64_t v8 = pxrInternal__aapl__pxrReserved__::TfType::GetSizeof(v7) * NumElements;
    v9 = (void *)MEMORY[0x263EFF8F8];
    ptrAndBits = self->_value._info._ptrAndBits;
    if ((ptrAndBits & 4) != 0) {
      uint64_t v11 = (*(uint64_t (**)(VtValue *))(((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8) + 168))(p_value);
    }
    else {
      uint64_t v11 = sub_2345EC35C((uint64_t *)p_value);
    }
    v13 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v9, v12, *(void *)(v11 + 32), v8, 0);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (id)tokenValue
{
  v11[2] = *MEMORY[0x263EF8340];
  unint64_t v10 = 0;
  sub_2345DDDA0(v11, &self->_value._storage);
  int v2 = sub_2345E0D64((pxrInternal__aapl__pxrReserved__::VtValue *)v11, &v10);
  sub_2345DAC58((uint64_t)v11);
  if (v2)
  {
    v3 = [USKToken alloc];
    unint64_t v9 = v10;
    if ((v10 & 7) != 0)
    {
      unint64_t v6 = v10 & 0xFFFFFFFFFFFFFFF8;
      if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
        unint64_t v9 = v6;
      }
    }
    v7 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v9, v5);
    if ((v9 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return v7;
}

- (id)stringValue
{
  uint64_t v32 = 0;
  long long v30 = 0u;
  memset(v31, 0, sizeof(v31));
  *(_OWORD *)v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  long long v26 = 0u;
  sub_2345E11F4((uint64_t)&v26);
  type = (__CFString *)self->_type;
  if (type == @"asset")
  {
    uint64_t v4 = sub_2345E14CC((uint64_t *)&self->_value);
    int v5 = *(char *)(v4 + 23);
    if (v5 >= 0) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = *(void *)v4;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(v4 + 23);
    }
    else {
      uint64_t v7 = *(void *)(v4 + 8);
    }
    sub_2345DDEB8(v27, v6, v7);
  }
  else if (type == @"rel")
  {
    uint64_t v8 = (_DWORD **)sub_2345E1570((uint64_t *)&self->_value);
    __p = 0;
    v24 = 0;
    uint64_t v25 = 0;
    sub_2345EC094(&__p, *v8, v8[1], ((char *)v8[1] - (char *)*v8) >> 3);
    sub_2345DDEB8(v27, (uint64_t)"[", 1);
    unint64_t v9 = (char *)__p;
    if (v24 != __p)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        uint64_t String = pxrInternal__aapl__pxrReserved__::SdfPath::GetString((pxrInternal__aapl__pxrReserved__::SdfPath *)&v9[v10]);
        int v13 = *(char *)(String + 23);
        if (v13 >= 0) {
          uint64_t v14 = String;
        }
        else {
          uint64_t v14 = *(void *)String;
        }
        if (v13 >= 0) {
          uint64_t v15 = *(unsigned __int8 *)(String + 23);
        }
        else {
          uint64_t v15 = *(void *)(String + 8);
        }
        sub_2345DDEB8(v27, v14, v15);
        unint64_t v9 = (char *)__p;
        unint64_t v16 = (v24 - (unsigned char *)__p) >> 3;
        if (v16 - 1 > v11)
        {
          sub_2345DDEB8(v27, (uint64_t)", ", 2);
          unint64_t v9 = (char *)__p;
          unint64_t v16 = (v24 - (unsigned char *)__p) >> 3;
        }
        ++v11;
        v10 += 8;
      }
      while (v16 > v11);
    }
    sub_2345DDEB8(v27, (uint64_t)"]", 1);
    p_p = &__p;
    sub_2345EC2C4(&p_p);
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::operator<<();
  }
  objc_super v17 = NSString;
  std::stringbuf::str();
  if (v25 >= 0) {
    objc_msgSend_stringWithUTF8String_(v17, v18, (uint64_t)&__p, v19);
  }
  else {
  objc_super v20 = objc_msgSend_stringWithUTF8String_(v17, v18, (uint64_t)__p, v19);
  }
  if (SHIBYTE(v25) < 0) {
    operator delete(__p);
  }
  *(void *)&long long v26 = *MEMORY[0x263F8C2B8];
  uint64_t v21 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v27[-1] + *(void *)(v26 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&v27[0] = v21;
  *((void *)&v27[0] + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x237DC3250](v31);
  return v20;
}

- (id)timeCodeValue
{
  v10[2] = *MEMORY[0x263EF8340];
  double v9 = 0.0;
  sub_2345DDDA0(v10, &self->_value._storage);
  int v2 = sub_2345E1810((pxrInternal__aapl__pxrReserved__::VtValue *)v10, &v9);
  sub_2345DAC58((uint64_t)v10);
  if (v2)
  {
    v3 = [USKTimeCode alloc];
    uint64_t v7 = objc_msgSend_initWithSdfTimeCode_(v3, v4, v5, v6, v9);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)BOOLValue
{
  v5[2] = *MEMORY[0x263EF8340];
  char v4 = 0;
  sub_2345DDDA0(v5, &self->_value._storage);
  char v2 = sub_2345E19A8((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v4) {
    return v2;
  }
  else {
    return 0;
  }
}

- (int)intValue
{
  v5[2] = *MEMORY[0x263EF8340];
  int v4 = 0;
  sub_2345DDDA0(v5, &self->_value._storage);
  int v2 = sub_2345E1B40((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (unsigned)uintValue
{
  v5[2] = *MEMORY[0x263EF8340];
  unsigned int v4 = 0;
  sub_2345DDDA0(v5, &self->_value._storage);
  int v2 = sub_2345E1CD8((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v2) {
    return v4;
  }
  else {
    return 0;
  }
}

- (float)floatValue
{
  v5[2] = *MEMORY[0x263EF8340];
  float v4 = 0.0;
  sub_2345DDDA0(v5, &self->_value._storage);
  int v2 = sub_2345E1E74((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  float result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (int8x8_t)float2Value
{
  v5[2] = *MEMORY[0x263EF8340];
  int8x8_t v4 = 0;
  sub_2345DDDA0(v5, (void *)(a1 + 8));
  int v1 = sub_2345E2014((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v1) {
    unsigned int v2 = -1;
  }
  else {
    unsigned int v2 = 0;
  }
  return vand_s8(v4, (int8x8_t)vdup_n_s32(v2));
}

- (double)float3Value
{
  v5[2] = *MEMORY[0x263EF8340];
  v4.i32[2] = 0;
  v4.i64[0] = 0;
  sub_2345DDDA0(v5, (void *)(a1 + 8));
  int v1 = sub_2345E21BC(v5, (uint64_t)&v4);
  sub_2345DAC58((uint64_t)v5);
  if (v1) {
    unsigned int v2 = -1;
  }
  else {
    unsigned int v2 = 0;
  }
  *(void *)&double result = vbslq_s8((int8x16_t)vdupq_n_s32(v2), v4, (int8x16_t)0).u64[0];
  return result;
}

- (double)float4Value
{
  v5[2] = *MEMORY[0x263EF8340];
  int8x16_t v4 = 0uLL;
  sub_2345DDDA0(v5, (void *)(a1 + 8));
  int v1 = sub_2345E236C(v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v1) {
    unsigned int v2 = -1;
  }
  else {
    unsigned int v2 = 0;
  }
  *(void *)&double result = vandq_s8(v4, (int8x16_t)vdupq_n_s32(v2)).u64[0];
  return result;
}

- (double)float4x4Value
{
  v13[2] = *MEMORY[0x263EF8340];
  memset(v11, 0, sizeof(v11));
  int v1 = sub_2345DDDA0(v13, (void *)(a1 + 8));
  int v2 = sub_2345E2578(v1, v11);
  sub_2345DAC58((uint64_t)v13);
  long long v3 = 0uLL;
  if (v2)
  {
    uint64_t v4 = 0;
    memset(v12, 0, sizeof(v12));
    uint64_t v5 = (double *)v11;
    do
    {
      uint64_t v6 = 0;
      long long v7 = v12[v4];
      do
      {
        float v8 = v5[v6];
        long long v10 = v7;
        *(float *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v8;
        long long v7 = v10;
        ++v6;
      }
      while (v6 != 4);
      v12[v4++] = v10;
      v5 += 4;
    }
    while (v4 != 4);
    *(void *)&long long v3 = *(void *)&v12[0];
  }
  return *(double *)&v3;
}

- (double)doubleValue
{
  v5[2] = *MEMORY[0x263EF8340];
  double v4 = 0.0;
  sub_2345DDDA0(v5, &self->_value._storage);
  int v2 = sub_2345E2744((pxrInternal__aapl__pxrReserved__::VtValue *)v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  double result = v4;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)double2Value
{
  v5[2] = *MEMORY[0x263EF8340];
  int8x16_t v4 = 0uLL;
  sub_2345DDDA0(v5, (void *)(a1 + 8));
  int v1 = sub_2345E28E4(v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v1) {
    unint64_t v2 = -1;
  }
  else {
    unint64_t v2 = 0;
  }
  *(void *)&double result = vandq_s8(v4, (int8x16_t)vdupq_n_s64(v2)).u64[0];
  return result;
}

- (int8x16_t)double3Value
{
  v9[2] = *MEMORY[0x263EF8340];
  int8x16_t v7 = 0uLL;
  uint64_t v8 = 0;
  sub_2345DDDA0(v9, (void *)(a1 + 8));
  int v3 = sub_2345E2AAC(v9, (uint64_t)&v7);
  sub_2345DAC58((uint64_t)v9);
  if (v3)
  {
    int8x16_t result = v7;
    *(void *)&long long v4 = v8;
    unint64_t v6 = vextq_s8(result, result, 8uLL).u64[0];
  }
  else
  {
    result.i64[0] = 0;
    unint64_t v6 = 0;
    *(void *)&long long v4 = 0;
  }
  result.i64[1] = v6;
  *(int8x16_t *)a2 = result;
  *(_OWORD *)(a2 + 16) = v4;
  return result;
}

- (uint64_t)double4Value
{
  v9[2] = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  sub_2345DDDA0(v9, (void *)(a1 + 8));
  int v3 = sub_2345E2C74(v9, &v7);
  uint64_t result = sub_2345DAC58((uint64_t)v9);
  long long v5 = 0uLL;
  long long v6 = 0uLL;
  if (v3)
  {
    long long v5 = v7;
    long long v6 = v8;
  }
  *a2 = v5;
  a2[1] = v6;
  return result;
}

- (double)double4x4Value
{
  v18[2] = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v3 = sub_2345DDDA0(v18, (void *)(a1 + 8));
  int v4 = sub_2345E2578(v3, &v10);
  sub_2345DAC58((uint64_t)v18);
  if (v4)
  {
    long long v5 = v11;
    *a2 = v10;
    a2[1] = v5;
    long long v6 = v13;
    a2[2] = v12;
    a2[3] = v6;
    long long v7 = v15;
    a2[4] = v14;
    a2[5] = v7;
    double result = *(double *)&v16;
    long long v9 = v17;
    a2[6] = v16;
    a2[7] = v9;
  }
  else
  {
    double result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (double)quatfValue
{
  v5[2] = *MEMORY[0x263EF8340];
  int8x16_t v4 = 0uLL;
  sub_2345DDDA0(v5, (void *)(a1 + 8));
  int v1 = sub_2345E2F28(v5, &v4);
  sub_2345DAC58((uint64_t)v5);
  if (v1) {
    unsigned int v2 = -1;
  }
  else {
    unsigned int v2 = 0;
  }
  *(void *)&double result = vandq_s8(v4, (int8x16_t)vdupq_n_s32(v2)).u64[0];
  return result;
}

- (id)objectPathValue
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  sub_2345DDDA0(v11, &self->_value._storage);
  LODWORD(self) = sub_2345E318C((pxrInternal__aapl__pxrReserved__::VtValue *)v11, (uint64_t)&v10);
  sub_2345DAC58((uint64_t)v11);
  if (self)
  {
    int v3 = [USKObjectPath alloc];
    sub_2345EBC84(&v8, &v10);
    sub_2345EBCD0(&v9, (_DWORD *)&v10 + 1);
    long long v6 = objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v8);
  }
  else
  {
    long long v6 = 0;
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v10);
  return v6;
}

- (id)urlValue
{
  v18[2] = *MEMORY[0x263EF8340];
  *(_OWORD *)__p = 0u;
  long long v17 = 0u;
  *(_OWORD *)long long v15 = 0u;
  pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v15);
  p_value = &self->_value;
  sub_2345DDDA0(v18, p_value);
  int v4 = sub_2345E3454(v18, (std::string *)v15);
  sub_2345DAC58((uint64_t)v18);
  if (v4)
  {
    uint64_t v5 = NSURL;
    long long v6 = NSString;
    uint64_t v7 = sub_2345E14CC((uint64_t *)p_value);
    if (*(char *)(v7 + 23) >= 0) {
      objc_msgSend_stringWithUTF8String_(v6, v8, v7, v9);
    }
    else {
    uint64_t v10 = objc_msgSend_stringWithUTF8String_(v6, v8, *(void *)v7, v9);
    }
    long long v13 = objc_msgSend_fileURLWithPath_(v5, v11, (uint64_t)v10, v12);
  }
  else
  {
    long long v13 = 0;
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[1]);
  }
  if (SHIBYTE(__p[0]) < 0) {
    operator delete(v15[0]);
  }
  return v13;
}

- (id)resourcePath
{
  v15[2] = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  *(_OWORD *)long long v13 = 0u;
  pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v13);
  int v3 = sub_2345DDDA0(v15, &self->_value._storage);
  LODWORD(self) = sub_2345E3454(v3, (std::string *)v13);
  sub_2345DAC58((uint64_t)v15);
  if (self)
  {
    long long v6 = [USKResourcePath alloc];
    if (SHIBYTE(v14[0]) < 0)
    {
      sub_2345DBA34(v9, v13[0], (unint64_t)v13[1]);
    }
    else
    {
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v13;
      uint64_t v10 = v14[0];
    }
    if (SHIBYTE(v14[3]) < 0)
    {
      sub_2345DBA34(&__p, v14[1], (unint64_t)v14[2]);
    }
    else
    {
      long long __p = *(_OWORD *)&v14[1];
      uint64_t v12 = v14[3];
    }
    uint64_t v7 = objc_msgSend_initWithSdfAssetPath_(v6, v4, (uint64_t)v9, v5);
    if (SHIBYTE(v12) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v10) < 0) {
      operator delete(v9[0]);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (SHIBYTE(v14[3]) < 0) {
    operator delete(v14[1]);
  }
  if (SHIBYTE(v14[0]) < 0) {
    operator delete(v13[0]);
  }
  return v7;
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  long long v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v6 = sub_2345DDDA0(v17, &self->_value._storage);
  int v7 = sub_2345E38C4(v6, (uint64_t)&v14);
  sub_2345DAC58((uint64_t)v17);
  if (v7)
  {
    long long v11 = v14;
    long long v12 = v15;
    __src = v16;
    if (v16)
    {
      int v8 = (atomic_ullong *)(v16 - 16);
      if (*((void *)&v12 + 1)) {
        int v8 = (atomic_ullong *)*((void *)&v12 + 1);
      }
      atomic_fetch_add_explicit(v8, 1uLL, memory_order_relaxed);
    }
    unint64_t v9 = v11;
    sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v11);
    if (v9 < a4) {
      a4 = v9;
    }
    memcpy(a3, __src, 4 * a4);
    sub_2345D9DC0((uint64_t)&v11);
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)&v14);
  return a4;
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  long long v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v6 = sub_2345DDDA0(v17, &self->_value._storage);
  int v7 = sub_2345E3B14(v6, (uint64_t)&v14);
  sub_2345DAC58((uint64_t)v17);
  if (v7)
  {
    long long v11 = v14;
    long long v12 = v15;
    __src = v16;
    if (v16)
    {
      int v8 = (atomic_ullong *)(v16 - 16);
      if (*((void *)&v12 + 1)) {
        int v8 = (atomic_ullong *)*((void *)&v12 + 1);
      }
      atomic_fetch_add_explicit(v8, 1uLL, memory_order_relaxed);
    }
    unint64_t v9 = v11;
    sub_2345F5790((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v11);
    if (v9 < a4) {
      a4 = v9;
    }
    memcpy(a3, __src, 4 * a4);
    sub_2345D9DC0((uint64_t)&v11);
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)&v14);
  return a4;
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2345DDDA0(v11, &self->_value._storage);
  int v6 = sub_2345E3D30(v11, (uint64_t)v9);
  sub_2345DAC58((uint64_t)v11);
  if (v6)
  {
    if (*(void *)&v9[0] < a4) {
      a4 = *(void *)&v9[0];
    }
    if (a4)
    {
      uint64_t v7 = 0;
      do
      {
        sub_2345EEE00((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *((_OWORD *)a3 + v7) = *(_OWORD *)(v10 + 16 * v7);
        ++v7;
      }
      while (a4 != v7);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)v9);
  return a4;
}

- (id)stringArray
{
  int v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], a2, self->_arraySize, v2);
  if ((__CFString *)self->_type == @"string[]")
  {
    uint64_t v5 = sub_2345E3F34((uint64_t *)&self->_value);
    if (self->_arraySize)
    {
      uint64_t v8 = v5;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = *(void *)(v8 + 32) + v9;
        if (*(char *)(v11 + 23) < 0) {
          uint64_t v11 = *(void *)v11;
        }
        long long v12 = objc_msgSend_stringWithUTF8String_(NSString, v6, v11, v7);
        objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

        ++v10;
        v9 += 24;
      }
      while (v10 < self->_arraySize);
    }
  }
  return v4;
}

- (id)tokenArray
{
  int v4 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], a2, self->_arraySize, v2);
  if ((__CFString *)self->_type == @"token[]")
  {
    uint64_t v5 = sub_2345E4134((uint64_t *)&self->_value);
    if (self->_arraySize)
    {
      uint64_t v6 = v5;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [USKToken alloc];
        uint64_t v11 = *(void *)(*(void *)(v6 + 32) + 8 * v7);
        uint64_t v16 = v11;
        if ((v11 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v16 &= 0xFFFFFFFFFFFFFFF8;
        }
        long long v12 = objc_msgSend_initWithTfToken_(v8, v9, (uint64_t)&v16, v10);
        objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

        if ((v16 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        ++v7;
      }
      while (v7 < self->_arraySize);
    }
  }
  return v4;
}

- (id)pathArray
{
  if ((__CFString *)self->_type == @"rel")
  {
    int v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], a2, self->_arraySize, v2);
    uint64_t v5 = (void *)sub_2345E1570((uint64_t *)&self->_value);
    if (v5[1] != *v5)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [USKObjectPath alloc];
        uint64_t v9 = (_DWORD *)(*v5 + v6);
        sub_2345EBC84(&v16, v9);
        sub_2345EBCD0(&v17, v9 + 1);
        long long v12 = objc_msgSend_initWithSdfPath_(v8, v10, (uint64_t)&v16, v11);
        objc_msgSend_addObject_(v3, v13, (uint64_t)v12, v14);

        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v16);
        ++v7;
        v6 += 8;
      }
      while (v7 < (uint64_t)(v5[1] - *v5) >> 3);
    }
  }
  else
  {
    int v3 = objc_opt_new();
  }
  return v3;
}

- (id)resourcePathArray
{
  if ((__CFString *)self->_type == @"asset[]")
  {
    int v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], a2, self->_arraySize, v2);
    uint64_t v5 = (unint64_t *)sub_2345E4510((uint64_t *)&self->_value);
    if (*v5)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v10 = [USKResourcePath alloc];
        unint64_t v11 = v5[4];
        long long v12 = (long long *)(v11 + v6);
        if (*(char *)(v11 + v6 + 23) < 0)
        {
          sub_2345DBA34(v20, *(void **)v12, *((void *)v12 + 1));
        }
        else
        {
          long long v13 = *v12;
          uint64_t v21 = *((void *)v12 + 2);
          *(_OWORD *)objc_super v20 = v13;
        }
        uint64_t v14 = (void **)(v11 + v6 + 24);
        if (*(char *)(v11 + v6 + 47) < 0)
        {
          sub_2345DBA34(&__p, *v14, *(void *)(v11 + v6 + 32));
        }
        else
        {
          long long v15 = *(_OWORD *)v14;
          uint64_t v23 = *(void *)(v11 + v6 + 40);
          long long __p = v15;
        }
        int v16 = objc_msgSend_initWithSdfAssetPath_(v10, v8, (uint64_t)v20, v9);
        objc_msgSend_addObject_(v3, v17, (uint64_t)v16, v18);

        if (SHIBYTE(v23) < 0) {
          operator delete((void *)__p);
        }
        if (SHIBYTE(v21) < 0) {
          operator delete(v20[0]);
        }
        ++v7;
        v6 += 48;
      }
      while (v7 < *v5);
    }
  }
  else
  {
    int v3 = objc_opt_new();
  }
  return v3;
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  int v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = sub_2345DDDA0(v17, &self->_value._storage);
  int v7 = sub_2345E4704(v6, (uint64_t)&v14);
  sub_2345DAC58((uint64_t)v17);
  if (v7)
  {
    long long v11 = v14;
    long long v12 = v15;
    __src = v16;
    if (v16)
    {
      uint64_t v8 = (atomic_ullong *)(v16 - 16);
      if (*((void *)&v12 + 1)) {
        uint64_t v8 = (atomic_ullong *)*((void *)&v12 + 1);
      }
      atomic_fetch_add_explicit(v8, 1uLL, memory_order_relaxed);
    }
    unint64_t v9 = v11;
    sub_2345F925C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v11);
    if (v9 < a4) {
      a4 = v9;
    }
    memcpy(a3, __src, 4 * a4);
    sub_2345D9DC0((uint64_t)&v11);
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)&v14);
  return a4;
}

- (unint64_t)float2Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2345DDDA0(v11, &self->_value._storage);
  int v6 = sub_2345E4920(v11, (uint64_t)v9);
  sub_2345DAC58((uint64_t)v11);
  if (v6)
  {
    if (*(void *)&v9[0] < v4) {
      unint64_t v4 = *(void *)&v9[0];
    }
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        sub_2345EF788((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(void *)(v5 + 8 * i) = *(void *)(v10 + 8 * i);
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v9);
  return v4;
}

- (unint64_t)float3Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2345DDDA0(v13, &self->_value._storage);
  int v6 = sub_2345E4B48(v13, (uint64_t)v11);
  sub_2345DAC58((uint64_t)v13);
  if (v6)
  {
    if (*(void *)&v11[0] < v4) {
      unint64_t v4 = *(void *)&v11[0];
    }
    if (v4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4;
      do
      {
        sub_2345DF758((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(void *)&long long v9 = *(void *)(v12 + v7);
        DWORD2(v9) = *(_DWORD *)(v12 + v7 + 8);
        *v5++ = v9;
        v7 += 12;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v11);
  return v4;
}

- (unint64_t)float4Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  _OWORD v11[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2345DDDA0(v11, &self->_value._storage);
  int v6 = sub_2345E4D64(v11, (uint64_t)v9);
  sub_2345DAC58((uint64_t)v11);
  if (v6)
  {
    if (*(void *)&v9[0] < v4) {
      unint64_t v4 = *(void *)&v9[0];
    }
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        sub_2345DF620((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(_OWORD *)(v5 + 16 * i) = *(_OWORD *)(v10 + 16 * i);
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v9);
  return v4;
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_2345DDDA0(v19, &self->_value._storage);
  int v6 = sub_2345E4FD0(v19, (uint64_t)v17);
  sub_2345DAC58((uint64_t)v19);
  if (v6)
  {
    if (*(void *)&v17[0] < a4) {
      a4 = *(void *)&v17[0];
    }
    if (a4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      do
      {
        sub_2345EFF6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        uint64_t v9 = 0;
        uint64_t v10 = (char *)a3 + 64 * v8;
        uint64_t v11 = v18 + v7;
        do
        {
          uint64_t v12 = 0;
          long long v13 = *(_OWORD *)&v10[16 * v9];
          do
          {
            float v14 = *(double *)(v11 + 8 * v12);
            long long v16 = v13;
            *(float *)((unint64_t)&v16 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))) = v14;
            long long v13 = v16;
            *(_OWORD *)&v10[16 * v9] = v16;
            ++v12;
          }
          while (v12 != 4);
          ++v9;
          v11 += 32;
        }
        while (v9 != 4);
        ++v8;
        v7 += 128;
      }
      while (v8 != a4);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)v17);
  return a4;
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4
{
  _OWORD v17[2] = *MEMORY[0x263EF8340];
  long long v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  int v6 = sub_2345DDDA0(v17, &self->_value._storage);
  int v7 = sub_2345E5220(v6, (uint64_t)&v14);
  sub_2345DAC58((uint64_t)v17);
  if (v7)
  {
    long long v11 = v14;
    long long v12 = v15;
    __src = v16;
    if (v16)
    {
      uint64_t v8 = (atomic_ullong *)(v16 - 16);
      if (*((void *)&v12 + 1)) {
        uint64_t v8 = (atomic_ullong *)*((void *)&v12 + 1);
      }
      atomic_fetch_add_explicit(v8, 1uLL, memory_order_relaxed);
    }
    unint64_t v9 = v11;
    sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v11);
    if (v9 < a4) {
      a4 = v9;
    }
    memcpy(a3, __src, 8 * a4);
    sub_2345D9DC0((uint64_t)&v11);
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)&v14);
  return a4;
}

- (unint64_t)double2Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  _OWORD v11[2] = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2345DDDA0(v11, &self->_value._storage);
  int v6 = sub_2345E543C(v11, (uint64_t)v9);
  sub_2345DAC58((uint64_t)v11);
  if (v6)
  {
    if (*(void *)&v9[0] < v4) {
      unint64_t v4 = *(void *)&v9[0];
    }
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        sub_2345F06FC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v9);
        *(_OWORD *)(v5 + 16 * i) = *(_OWORD *)(v10 + 16 * i);
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v9);
  return v4;
}

- (unint64_t)double3Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2345DDDA0(v13, &self->_value._storage);
  int v6 = sub_2345E566C(v13, (uint64_t)v11);
  sub_2345DAC58((uint64_t)v13);
  if (v6)
  {
    if (*(void *)&v11[0] < v4) {
      unint64_t v4 = *(void *)&v11[0];
    }
    if (v4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4;
      do
      {
        sub_2345F0B50((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
        *(void *)&long long v9 = *(void *)(v12 + v7 + 16);
        *uint64_t v5 = *(_OWORD *)(v12 + v7);
        v5[1] = v9;
        v5 += 2;
        v7 += 24;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v11);
  return v4;
}

- (unint64_t)double4Array:(USKData *)self maxCount:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  v14[2] = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  memset(v12, 0, sizeof(v12));
  sub_2345DDDA0(v14, &self->_value._storage);
  int v6 = sub_2345E58A0(v14, (uint64_t)v12);
  sub_2345DAC58((uint64_t)v14);
  if (v6)
  {
    if (*(void *)&v12[0] < v4) {
      unint64_t v4 = *(void *)&v12[0];
    }
    if (v4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4;
      do
      {
        sub_2345F0FC0((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v12);
        long long v9 = *(_OWORD *)(v13 + v7 + 16);
        uint64_t v10 = (_OWORD *)(v5 + v7);
        _OWORD *v10 = *(_OWORD *)(v13 + v7);
        v10[1] = v9;
        v7 += 32;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  sub_2345D9DC0((uint64_t)v12);
  return v4;
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  sub_2345DDDA0(v20, &self->_value._storage);
  int v6 = sub_2345E4FD0(v20, (uint64_t)v18);
  sub_2345DAC58((uint64_t)v20);
  if (v6)
  {
    if (*(void *)&v18[0] < a4) {
      a4 = *(void *)&v18[0];
    }
    if (a4)
    {
      uint64_t v7 = 112;
      unint64_t v8 = a4;
      do
      {
        sub_2345EFF6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v18);
        long long v9 = *(_OWORD *)(v19 + v7 - 96);
        long long v10 = *(_OWORD *)(v19 + v7 - 80);
        long long v11 = *(_OWORD *)(v19 + v7 - 64);
        long long v12 = *(_OWORD *)(v19 + v7 - 48);
        long long v13 = *(_OWORD *)(v19 + v7 - 32);
        long long v14 = *(_OWORD *)(v19 + v7 - 16);
        long long v15 = *(_OWORD *)(v19 + v7);
        long long v16 = (_OWORD *)((char *)a3 + v7);
        *(v16 - 7) = *(_OWORD *)(v19 + v7 - 112);
        *(v16 - 6) = v9;
        *(v16 - 5) = v10;
        *(v16 - 4) = v11;
        *(v16 - 3) = v12;
        *(v16 - 2) = v13;
        *(v16 - 1) = v14;
        _OWORD *v16 = v15;
        v7 += 128;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    a4 = 0;
  }
  sub_2345D9DC0((uint64_t)v18);
  return a4;
}

- (void)setValue:(VtValue)a3
{
  storage = (pxrInternal__aapl__pxrReserved__::VtValue *)a3._storage;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (pxrInternal__aapl__pxrReserved__::VtValue::IsArrayValued(*(pxrInternal__aapl__pxrReserved__::VtValue **)&a3._storage)) {
    unint64_t NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements(storage);
  }
  else {
    unint64_t NumElements = 0;
  }
  uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
  if (Type == pxrInternal__aapl__pxrReserved__::VtValue::GetType(storage))
  {
    sub_2345DD6C8(&self->_value._storage, storage);
    self->_arraySize = NumElements;
  }
  else
  {
    uint64_t v12 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
    Typeid = (const std::type_info *)pxrInternal__aapl__pxrReserved__::TfType::GetTypeid((pxrInternal__aapl__pxrReserved__::TfType *)&v12);
    unint64_t v8 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid(storage);
    if (pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(v8, Typeid, v9))
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      long long v10 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)&self->_value);
      long long v11 = sub_2345EBECC(storage, v10);
      sub_2345DDDA0(&v12, v11);
      if (v13)
      {
        sub_2345DD6C8(&self->_value._storage, &v12);
        self->_arraySize = NumElements;
      }
      sub_2345DAC58((uint64_t)&v12);
    }
  }
}

- (void)setTokenValue:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend_token(v4, v5, v6, v7);
    unint64_t v11 = v9;
    uint64_t v12 = (char *)&off_26E762990 + 1;
    if ((v9 & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFF8;
    }
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = (char *)&off_26E762990 + 1;
  }
  objc_msgSend_setValue_(self, v5, (uint64_t)&v11, v7, v9);
  sub_2345DAC58((uint64_t)&v11);
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
}

- (void)setStringValue:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  type = (__CFString *)self->_type;
  if (type == @"string" || type == @"token")
  {
    id v8 = v4;
    v25[0] = objc_msgSend_UTF8String(v8, v9, v10, v11);
    uint64_t v32 = 0;
    sub_2345F12A4((uint64_t)v31, (char **)v25);
  }
  if (type == @"rel")
  {
    id v17 = v4;
    uint64_t v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
    sub_2345DB968(v25, v21);
    MEMORY[0x237DC2500](v24, v25);
    long long v30 = (char *)&off_26E762B10 + 1;
    sub_2345EBC84(&v28, v24);
    sub_2345EBCD0(&v29, (_DWORD *)v24 + 1);
    objc_msgSend_setValue_(self, v22, (uint64_t)&v28, v23);
    sub_2345DAC58((uint64_t)&v28);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v24);
    if (v26 < 0) {
      operator delete(v25[0]);
    }
  }
  else if (type == @"asset")
  {
    id v12 = v4;
    long long v16 = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
    sub_2345DB968(v24, v16);
    MEMORY[0x237DC1F40](v25, v24);
    v27 = &off_26E762BC8;
    sub_2345F21A0();
  }
}

- (void)setTimeCodeValue:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  objc_msgSend_sdfTimeCode(a3, a2, (uint64_t)a3, v3);
  v8[1] = (char *)&off_26E762C80 + 1;
  v8[0] = v5;
  objc_msgSend_setValue_(self, v6, (uint64_t)v8, v7);
  sub_2345DAC58((uint64_t)v8);
}

- (void)setBoolValue:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762D3B;
  v4[0] = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v3);
  sub_2345DAC58((uint64_t)v4);
}

- (void)setIntValue:(int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762DF3;
  int v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2345DAC58((uint64_t)&v4);
}

- (void)setUIntValue:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762EAB;
  unsigned int v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2345DAC58((uint64_t)&v4);
}

- (void)setObjectPathValue:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v8 = v4;
  if (v4) {
    objc_msgSend_path(v4, v5, v6, v7);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v14 = (char *)&off_26E762B10 + 1;
  sub_2345EBC84(&v12, &v11);
  sub_2345EBCD0(&v13, (_DWORD *)&v11 + 1);
  objc_msgSend_setValue_(self, v9, (uint64_t)&v12, v10);
  sub_2345DAC58((uint64_t)&v12);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v11);
}

- (void)setURLValue:(id)a3
{
  v10[8] = *(void **)MEMORY[0x263EF8340];
  objc_msgSend_path(a3, a2, (uint64_t)a3, v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  id v8 = (char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  sub_2345DB968(v9, v8);
  MEMORY[0x237DC1F40](v10, v9);
  v10[7] = &off_26E762BC8;
  sub_2345F21A0();
}

- (void)setResourcePath:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(_OWORD *)uint64_t v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)uint64_t v10 = 0u;
  id v3 = a3;
  uint64_t v7 = (char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  sub_2345DB968(__p, v7);
  MEMORY[0x237DC1F40](v10, __p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  int v13 = &off_26E762BC8;
  sub_2345F21A0();
}

- (void)setFloatValue:(float)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762F63;
  float v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)&v4, v3);
  sub_2345DAC58((uint64_t)&v4);
}

- (void)setFloat2Value:(USKData *)self
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = (char *)&off_26E763018 + 3;
  v4[0] = v3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v2);
  sub_2345DAC58((uint64_t)v4);
}

- (void)setFloat3Value:(USKData *)self
{
}

- (void)setFloat4Value:(USKData *)self
{
}

- (void)setDoubleValue:(double)a3
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = &unk_26E763243;
  *(double *)float v4 = a3;
  objc_msgSend_setValue_(self, a2, (uint64_t)v4, v3);
  sub_2345DAC58((uint64_t)v4);
}

- (void)setDouble2Value:(USKData *)self
{
}

- (void)setDouble3Value:(USKData *)self
{
}

- (void)setDouble4Value:(USKData *)self
{
}

- (void)setDouble4x4Value:
{
}

- (void)setQuatfValue:
{
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __dst = 0;
  memset(v6, 0, sizeof(v6));
  sub_2345D7A70((uint64_t)v6, a4);
  sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v6);
  memcpy(__dst, a3, 4 * a4);
  id v8 = &off_26E763690;
  sub_2345F54A8();
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __dst = 0;
  memset(v6, 0, sizeof(v6));
  sub_2345E6F44((uint64_t)v6, a4);
  sub_2345F5790((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v6);
  memcpy(__dst, a3, 4 * a4);
  id v8 = &off_26E763748;
  sub_2345F54A8();
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __dst = 0;
  memset(v6, 0, sizeof(v6));
  sub_2345E70C4((uint64_t)v6, a4);
  sub_2345EEE00((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v6);
  memcpy(__dst, a3, 16 * a4);
  id v8 = off_26E763800;
  sub_2345DEAC0();
}

- (void)setStringArray:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v8 = v4;
  type = (__CFString *)self->_type;
  if (type == @"string[]")
  {
    *(_OWORD *)long long __p = 0u;
    memset(v72, 0, sizeof(v72));
    unint64_t v27 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E77BC((uint64_t)__p, v27);
    uint64_t v31 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v8, v28, v29, v30); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v33, i, v34);
      id v35 = objc_claimAutoreleasedReturnValue();
      uint64_t v39 = objc_msgSend_UTF8String(v35, v36, v37, v38);
      sub_2345F6908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      MEMORY[0x237DC3120](*(void *)&v72[16] + v31, v39);

      v31 += 24;
    }
    v74[0] = 0;
    v74[1] = &off_26E7638B8;
    sub_2345DEAC0();
  }
  if (type == @"token[]")
  {
    *(_OWORD *)long long __p = 0u;
    memset(v72, 0, sizeof(v72));
    unint64_t v40 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E7854((uint64_t)__p, v40);
    uint64_t v44 = 0;
    for (unint64_t j = 0; j < objc_msgSend_count(v8, v41, v42, v43); ++j)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v46, j, v47);
      id v48 = objc_claimAutoreleasedReturnValue();
      uint64_t v52 = objc_msgSend_UTF8String(v48, v49, v50, v51);
      MEMORY[0x237DC2530](v74, v52);
      sub_2345F7418((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      v53 = (void *)(*(void *)&v72[16] + v44);
      if ((void **)(*(void *)&v72[16] + v44) == v74)
      {
        unint64_t v54 = (unint64_t)v74[0];
      }
      else
      {
        if ((*v53 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*v53 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        unint64_t v54 = 0;
        void *v53 = v74[0];
        v74[0] = 0;
      }
      if ((v54 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v54 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }

      v44 += 8;
    }
    v74[0] = 0;
    v74[1] = &off_26E763970;
    sub_2345DEAC0();
  }
  if (type == @"rel")
  {
    *(_OWORD *)long long __p = 0u;
    memset(v72, 0, sizeof(v72));
    unint64_t v55 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E78F8((uint64_t)__p, v55);
    unint64_t v59 = 0;
    uint64_t v60 = 4;
    while (v59 < objc_msgSend_count(v8, v56, v57, v58))
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v61, v59, v62);
      id v63 = objc_claimAutoreleasedReturnValue();
      v67 = (char *)objc_msgSend_UTF8String(v63, v64, v65, v66);
      sub_2345DB968(v74, v67);
      MEMORY[0x237DC2500](v69, v74);
      sub_2345F7DA8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)__p);
      uint64_t v68 = *(void *)&v72[16] + v60;
      sub_2345EBF68(*(void *)&v72[16] + v60 - 4, (int *)v69);
      sub_2345EBFC0(v68);
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2345EBD10((uint64_t)v69);
      if (SBYTE7(v75) < 0) {
        operator delete(v74[0]);
      }

      ++v59;
      v60 += 8;
    }
    v74[0] = 0;
    v74[1] = &off_26E763A28;
    sub_2345DEAC0();
  }
  if (type == @"asset[]")
  {
    uint64_t v76 = 0;
    *(_OWORD *)v74 = 0u;
    long long v75 = 0u;
    unint64_t v10 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E79B0((uint64_t)v74, v10);
    uint64_t v14 = 0;
    for (unint64_t k = 0; k < objc_msgSend_count(v8, v11, v12, v13); ++k)
    {
      objc_msgSend_objectAtIndexedSubscript_(v8, v16, k, v17);
      id v18 = objc_claimAutoreleasedReturnValue();
      v22 = (char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      sub_2345DB968(v69, v22);
      MEMORY[0x237DC1F40](__p, v69);
      sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v74);
      uint64_t v23 = v76 + v14;
      if (*(char *)(v76 + v14 + 23) < 0) {
        operator delete(*(void **)v23);
      }
      long long v24 = *(_OWORD *)__p;
      *(void *)(v23 + 16) = *(void *)v72;
      *(_OWORD *)uint64_t v23 = v24;
      v72[7] = 0;
      LOBYTE(__p[0]) = 0;
      uint64_t v25 = (void **)(v23 + 24);
      if (*(char *)(v23 + 47) < 0) {
        operator delete(*v25);
      }
      long long v26 = *(_OWORD *)&v72[8];
      *(void *)(v23 + 40) = v73;
      *(_OWORD *)uint64_t v25 = v26;
      HIBYTE(v73) = 0;
      v72[8] = 0;
      if ((v72[7] & 0x80000000) != 0) {
        operator delete(__p[0]);
      }
      if (v70 < 0) {
        operator delete(v69[0]);
      }

      v14 += 48;
    }
    __p[0] = 0;
    __p[1] = &off_26E763AF8;
    sub_2345DEAC0();
  }
}

- (void)setTokenArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  unint64_t v7 = objc_msgSend_count(v3, v4, v5, v6);
  sub_2345E7854((uint64_t)v23, v7);
  uint64_t v11 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v3, v8, v9, v10); ++i)
  {
    uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(v3, v13, i, v14);
    uint64_t v19 = v15;
    if (v15) {
      objc_msgSend_token(v15, v16, v17, v18);
    }
    else {
      uint64_t v22 = 0;
    }
    sub_2345F7418((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v23);
    uint64_t v20 = (void *)(v24 + v11);
    if ((uint64_t *)(v24 + v11) == &v22)
    {
      uint64_t v21 = v22;
    }
    else
    {
      if ((*v20 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(*v20 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      uint64_t v21 = 0;
      *uint64_t v20 = v22;
      uint64_t v22 = 0;
    }
    if ((v21 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }

    v11 += 8;
  }
  uint64_t v25 = &off_26E763970;
  sub_2345DEAC0();
}

- (void)setResourcePathArray:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  unint64_t v7 = objc_msgSend_count(v3, v4, v5, v6);
  sub_2345E79B0((uint64_t)v30, v7);
  uint64_t v11 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v3, v8, v9, v10); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3, v13, i, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = (char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
    sub_2345DB968(v24, v19);
    MEMORY[0x237DC1F40](__p, v24);
    sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v30);
    uint64_t v20 = v31 + v11;
    if (*(char *)(v31 + v11 + 23) < 0) {
      operator delete(*(void **)v20);
    }
    long long v21 = *(_OWORD *)__p;
    *(void *)(v20 + 16) = v27;
    *(_OWORD *)uint64_t v20 = v21;
    HIBYTE(v27) = 0;
    LOBYTE(__p[0]) = 0;
    uint64_t v22 = (void **)(v20 + 24);
    if (*(char *)(v20 + 47) < 0) {
      operator delete(*v22);
    }
    long long v23 = v28;
    *(void *)(v20 + 40) = v29;
    *(_OWORD *)uint64_t v22 = v23;
    HIBYTE(v29) = 0;
    LOBYTE(v28) = 0;
    if (SHIBYTE(v27) < 0) {
      operator delete(__p[0]);
    }
    if (v25 < 0) {
      operator delete(v24[0]);
    }

    v11 += 48;
  }
  uint64_t v32 = &off_26E763AF8;
  sub_2345DEAC0();
}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __dst = 0;
  memset(v6, 0, sizeof(v6));
  sub_2345E7F98((uint64_t)v6, a4);
  sub_2345F925C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v6);
  memcpy(__dst, a3, 4 * a4);
  id v8 = &off_26E763BB0;
  sub_2345F97E0();
}

- (void)setFloat2Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_2345E8134((uint64_t)v8, v3);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = *(void *)(v5 + 8 * i);
      sub_2345EF788((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
      *(void *)(v9 + 8 * i) = v7;
    }
  }
  uint64_t v10 = off_26E763C68;
  sub_2345DEAC0();
}

- (void)setFloat3Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  sub_2345DD204((uint64_t)v11, v3);
  if (v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (_DWORD *)(v5 + 8);
    do
    {
      uint64_t v8 = *((void *)v7 - 1);
      int v9 = *v7;
      sub_2345DF758((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v11);
      uint64_t v10 = v12 + v6;
      *(void *)uint64_t v10 = v8;
      *(_DWORD *)(v10 + 8) = v9;
      v7 += 4;
      v6 += 12;
      --v4;
    }
    while (v4);
  }
  uint64_t v13 = &off_26E762600;
  sub_2345DEAC0();
}

- (void)setFloat4Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_2345DD190((uint64_t)v8, v3);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      long long v7 = *(_OWORD *)(v5 + 16 * i);
      sub_2345DF620((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
      *(_OWORD *)(v9 + 16 * i) = v7;
    }
  }
  uint64_t v10 = &off_26E7626E0;
  sub_2345DEAC0();
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  __dst = 0;
  memset(v6, 0, sizeof(v6));
  sub_2345E8518((uint64_t)v6, a4);
  sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v6);
  memcpy(__dst, a3, 8 * a4);
  uint64_t v8 = &off_26E763D20;
  sub_2345F97E0();
}

- (void)setDouble2Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_2345E86B4((uint64_t)v8, v3);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      long long v7 = *(_OWORD *)(v5 + 16 * i);
      sub_2345F06FC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
      *(_OWORD *)(v9 + 16 * i) = v7;
    }
  }
  uint64_t v10 = off_26E763DD8;
  sub_2345DEAC0();
}

- (void)setDouble3Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  sub_2345E8864((uint64_t)v10, v3);
  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      long long v8 = *v5;
      long long v9 = v5[1];
      sub_2345F0B50((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
      uint64_t v7 = v11 + v6;
      *(_OWORD *)uint64_t v7 = v8;
      *(void *)(v7 + 16) = v9;
      v5 += 2;
      v6 += 24;
      --v4;
    }
    while (v4);
  }
  uint64_t v12 = off_26E763E90;
  sub_2345DEAC0();
}

- (void)setDouble4Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  sub_2345E8A14((uint64_t)v10, v3);
  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      long long v8 = *(_OWORD *)(v5 + v6);
      long long v9 = *(_OWORD *)(v5 + v6 + 16);
      sub_2345F0FC0((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
      uint64_t v7 = (_OWORD *)(v11 + v6);
      _OWORD *v7 = v8;
      v7[1] = v9;
      v6 += 32;
      --v4;
    }
    while (v4);
  }
  uint64_t v12 = off_26E763F48;
  sub_2345DEAC0();
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  sub_2345E8C08((uint64_t)v16, a4);
  if (v4)
  {
    uint64_t v6 = 0;
    do
    {
      long long v14 = *(_OWORD *)((char *)a3 + v6 + 48);
      long long v15 = *(_OWORD *)((char *)a3 + v6 + 16);
      long long v10 = *(_OWORD *)((char *)a3 + v6 + 32);
      long long v11 = *(_OWORD *)((char *)a3 + v6);
      long long v12 = *(_OWORD *)((char *)a3 + v6 + 112);
      long long v13 = *(_OWORD *)((char *)a3 + v6 + 80);
      long long v8 = *(_OWORD *)((char *)a3 + v6 + 96);
      long long v9 = *(_OWORD *)((char *)a3 + v6 + 64);
      sub_2345EFF6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v16);
      uint64_t v7 = (_OWORD *)(v17 + v6);
      _OWORD *v7 = v11;
      v7[1] = v15;
      v7[2] = v10;
      v7[3] = v14;
      v7[4] = v9;
      v7[5] = v13;
      v7[6] = v8;
      v7[7] = v12;
      v6 += 128;
      --v4;
    }
    while (v4);
  }
  uint64_t v18 = off_26E764000;
  sub_2345DEAC0();
}

- (USKData)initWithToken:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  long long v8 = [(USKData *)&v11 init];
  if (v8)
  {
    if (v4)
    {
      objc_msgSend_token(v4, v5, v6, v7);
      unint64_t v12 = v10;
      long long v13 = (char *)&off_26E762990 + 1;
      if ((v10 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFF8;
      }
    }
    else
    {
      unint64_t v10 = 0;
      unint64_t v12 = 0;
      long long v13 = (char *)&off_26E762990 + 1;
    }
    sub_2345DAAE4(&v8->_value._storage, &v12);
    sub_2345DAC58((uint64_t)&v12);
    if ((v10 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    objc_storeStrong((id *)&v8->_type, @"token");
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithString:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  if ([(USKData *)&v11 init])
  {
    id v5 = v4;
    unint64_t v10 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
    uint64_t v13 = 0;
    sub_2345F12A4((uint64_t)v12, &v10);
  }

  return 0;
}

- (USKData)initWithTimeCode:(id)a3
{
  _OWORD v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  uint64_t v8 = [(USKData *)&v11 init];
  if (v8)
  {
    objc_msgSend_sdfTimeCode(v4, v5, v6, v7);
    v12[1] = (char *)&off_26E762C80 + 1;
    v12[0] = v9;
    sub_2345DAAE4(&v8->_value._storage, v12);
    sub_2345DAC58((uint64_t)v12);
    objc_storeStrong((id *)&v8->_type, @"timecode");
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithBool:(BOOL)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  id v5 = [(USKData *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[1] = &unk_26E762D3B;
    LOBYTE(v9[0]) = a3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"BOOL");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithInt:(int)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  id v5 = [(USKData *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[1] = &unk_26E762DF3;
    LODWORD(v9[0]) = a3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"int");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithUInt:(unsigned int)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  id v5 = [(USKData *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[1] = &unk_26E762EAB;
    LODWORD(v9[0]) = a3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"uint");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithObjectPath:(id)a3
{
  _OWORD v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v11.receiver = self;
  v11.super_class = (Class)USKData;
  objc_super v8 = [(USKData *)&v11 init];
  if (v8)
  {
    if (v4) {
      objc_msgSend_path(v4, v5, v6, v7);
    }
    else {
      uint64_t v10 = 0;
    }
    v12[1] = (char *)&off_26E762B10 + 1;
    sub_2345EBC84(v12, &v10);
    sub_2345EBCD0((_DWORD *)v12 + 1, (_DWORD *)&v10 + 1);
    sub_2345DAAE4(&v8->_value._storage, v12);
    sub_2345DAC58((uint64_t)v12);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v10);
    objc_storeStrong((id *)&v8->_type, @"rel");
    v8->_arraySize = 0;
  }

  return v8;
}

- (USKData)initWithURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v16.receiver = self;
  v16.super_class = (Class)USKData;
  if ([(USKData *)&v16 init])
  {
    objc_msgSend_relativeString(v4, v5, v6, v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    unint64_t v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    sub_2345DB968(v14, v12);
    MEMORY[0x237DC1F40](&v15, v14);
    uint64_t v17 = &off_26E762BC8;
    sub_2345F21A0();
  }

  return 0;
}

- (USKData)initWithResourcePath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  if ([(USKData *)&v12 init])
  {
    id v5 = v4;
    uint64_t v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8, 0, 0, 0, 0, 0, 0);
    sub_2345DB968(__p, v9);
    MEMORY[0x237DC1F40](v11, __p);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
    __p[1] = &off_26E762BC8;
    sub_2345F21A0();
  }

  return 0;
}

- (USKData)initWithFloat:(float)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  id v5 = [(USKData *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[1] = &unk_26E762F63;
    *(float *)uint64_t v9 = a3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"float");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithFloat2:(USKData *)self
{
  uint64_t v3 = v2;
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  id v5 = [(USKData *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v9[1] = (char *)&off_26E763018 + 3;
    v9[0] = v3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"float2");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithFloat3:(USKData *)self
{
  long long v5 = v2;
  uint64_t v8 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v6.receiver = self;
  v6.super_class = (Class)USKData;
  if ([(USKData *)&v6 init])
  {
    uint64_t v7 = (char *)&off_26E7630D0 + 2;
    operator new();
  }
  return 0;
}

- (USKData)initWithFloat4:(USKData *)self
{
  long long v5 = v2;
  uint64_t v8 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v6.receiver = self;
  v6.super_class = (Class)USKData;
  if ([(USKData *)&v6 init])
  {
    uint64_t v7 = (char *)&off_26E763188 + 2;
    operator new();
  }
  return 0;
}

- (USKData)initWithDouble:(double)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v8.receiver = self;
  v8.super_class = (Class)USKData;
  long long v5 = [(USKData *)&v8 init];
  objc_super v6 = v5;
  if (v5)
  {
    v9[1] = &unk_26E763243;
    *(double *)uint64_t v9 = a3;
    sub_2345DAAE4(&v5->_value._storage, v9);
    sub_2345DAC58((uint64_t)v9);
    objc_storeStrong((id *)&v6->_type, @"double");
    v6->_arraySize = 0;
  }
  return v6;
}

- (USKData)initWithDouble2:(USKData *)self
{
  long long v5 = v2;
  uint64_t v8 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v6.receiver = self;
  v6.super_class = (Class)USKData;
  if ([(USKData *)&v6 init])
  {
    uint64_t v7 = (char *)&off_26E7632F8 + 2;
    operator new();
  }
  return 0;
}

- (USKData)initWithDouble3:(USKData *)self
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v5 = *v2;
  long long v6 = v2[1];
  sub_234627B1C();
  v7.receiver = self;
  v7.super_class = (Class)USKData;
  if ([(USKData *)&v7 init])
  {
    uint64_t v8 = (char *)&off_26E7633B0 + 2;
    operator new();
  }
  return 0;
}

- (USKData)initWithDouble4:(USKData *)self
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v5 = *v2;
  long long v6 = v2[1];
  sub_234627B1C();
  v7.receiver = self;
  v7.super_class = (Class)USKData;
  if ([(USKData *)&v7 init])
  {
    uint64_t v8 = (char *)&off_26E763468 + 2;
    operator new();
  }
  return 0;
}

- (uint64_t)initWithDouble4x4:(void *)a1
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v3.receiver = a1;
  v3.super_class = (Class)USKData;
  if ([(USKData *)&v3 init])
  {
    id v4 = (char *)&off_26E763520 + 2;
    operator new();
  }
  return 0;
}

- (uint64_t)initWithQuatf:(void *)a1
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v5.receiver = a1;
  v5.super_class = (Class)USKData;
  if ([(USKData *)&v5 init])
  {
    long long v6 = &off_26E7635D8;
    operator new();
  }
  return 0;
}

- (USKData)initWithIntArray:(int *)a3 count:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  if ([(USKData *)&v10 init])
  {
    __dst = 0;
    memset(v8, 0, sizeof(v8));
    sub_2345D7A70((uint64_t)v8, a4);
    sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
    memcpy(__dst, a3, 4 * a4);
    uint64_t v11 = &off_26E763690;
    sub_2345F54A8();
  }
  return 0;
}

- (USKData)initWithUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  if ([(USKData *)&v10 init])
  {
    __dst = 0;
    memset(v8, 0, sizeof(v8));
    sub_2345E6F44((uint64_t)v8, a4);
    sub_2345F5790((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
    memcpy(__dst, a3, 4 * a4);
    uint64_t v11 = &off_26E763748;
    sub_2345F54A8();
  }
  return 0;
}

- (USKData)initWithQuatfArray:(id *)a3 count:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  if ([(USKData *)&v12 init])
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_2345E70C4((uint64_t)v10, a4);
    if (a4)
    {
      uint64_t v7 = 0;
      do
      {
        long long v9 = *((_OWORD *)a3 + v7);
        sub_2345EEE00((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(_OWORD *)(v11 + 16 * v7++) = v9;
      }
      while (a4 != v7);
    }
    uint64_t v13 = off_26E763800;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithStringArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v24.receiver = self;
  v24.super_class = (Class)USKData;
  if ([(USKData *)&v24 init])
  {
    uint64_t v23 = 0;
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
    sub_2345E77BC((uint64_t)&v22, v8);
    uint64_t v12 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      id v16 = objc_claimAutoreleasedReturnValue();
      uint64_t v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
      sub_2345F6908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v22);
      MEMORY[0x237DC3120](v23 + v12, v20);

      v12 += 24;
    }
    char v25 = &off_26E7638B8;
    sub_2345DEAC0();
  }

  return 0;
}

- (USKData)initWithTokenArray:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v26.receiver = self;
  v26.super_class = (Class)USKData;
  if ([(USKData *)&v26 init])
  {
    uint64_t v25 = 0;
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
    sub_2345E7854((uint64_t)&v24, v8);
    uint64_t v12 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
    {
      id v16 = objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      uint64_t v20 = v16;
      if (v16) {
        objc_msgSend_token(v16, v17, v18, v19);
      }
      else {
        v27[0] = 0;
      }
      sub_2345F7418((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v24);
      long long v21 = (void *)(v25 + v12);
      if ((void *)(v25 + v12) == v27)
      {
        uint64_t v22 = v27[0];
      }
      else
      {
        if ((*v21 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        uint64_t v22 = 0;
        *long long v21 = v27[0];
        v27[0] = 0;
      }
      if ((v22 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }

      v12 += 8;
    }
    v27[1] = &off_26E763970;
    sub_2345DEAC0();
  }

  return 0;
}

- (USKData)initWithResourcePathArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sub_234627B1C();
  v30.receiver = self;
  v30.super_class = (Class)USKData;
  if ([(USKData *)&v30 init])
  {
    uint64_t v29 = 0;
    memset(v28, 0, sizeof(v28));
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E79B0((uint64_t)v28, v8);
    uint64_t v12 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      id v16 = objc_claimAutoreleasedReturnValue();
      uint64_t v20 = (char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
      sub_2345DB968(v26, v20);
      MEMORY[0x237DC1F40](__p, v26);
      sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v28);
      uint64_t v21 = v29 + v12;
      if (*(char *)(v29 + v12 + 23) < 0) {
        operator delete(*(void **)v21);
      }
      long long v22 = *(_OWORD *)__p;
      *(void *)(v21 + 16) = v32;
      *(_OWORD *)uint64_t v21 = v22;
      HIBYTE(v32) = 0;
      LOBYTE(__p[0]) = 0;
      uint64_t v23 = (void **)(v21 + 24);
      if (*(char *)(v21 + 47) < 0) {
        operator delete(*v23);
      }
      long long v24 = v33;
      *(void *)(v21 + 40) = v34;
      *(_OWORD *)uint64_t v23 = v24;
      HIBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v32) < 0) {
        operator delete(__p[0]);
      }
      if (v27 < 0) {
        operator delete(v26[0]);
      }

      v12 += 48;
    }
    __p[1] = &off_26E763AF8;
    sub_2345DEAC0();
  }

  return 0;
}

- (USKData)initWithFloatArray:(float *)a3 count:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  if ([(USKData *)&v10 init])
  {
    __dst = 0;
    memset(v8, 0, sizeof(v8));
    sub_2345E7F98((uint64_t)v8, a4);
    sub_2345F925C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
    memcpy(__dst, a3, 4 * a4);
    uint64_t v11 = &off_26E763BB0;
    sub_2345F97E0();
  }
  return 0;
}

- (USKData)initWithFloat2Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  if ([(USKData *)&v12 init])
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_2345E8134((uint64_t)v10, v4);
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v8 = *(void *)(v5 + 8 * i);
        sub_2345EF788((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(void *)(v11 + 8 * i) = v8;
      }
    }
    uint64_t v13 = off_26E763C68;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithFloat3Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v18 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v16.receiver = self;
  v16.super_class = (Class)USKData;
  if ([(USKData *)&v16 init])
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_2345DD204((uint64_t)v14, v4);
    if (v4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = (_DWORD *)(v5 + 8);
      unint64_t v9 = v4;
      do
      {
        uint64_t v10 = *((void *)v8 - 1);
        int v11 = *v8;
        sub_2345DF758((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v14);
        uint64_t v12 = v15 + v7;
        *(void *)uint64_t v12 = v10;
        *(_DWORD *)(v12 + 8) = v11;
        v8 += 4;
        v7 += 12;
        --v9;
      }
      while (v9);
    }
    uint64_t v17 = &off_26E762600;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithFloat4Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  if ([(USKData *)&v12 init])
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_2345DD190((uint64_t)v10, v4);
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        long long v9 = *(_OWORD *)(v5 + 16 * i);
        sub_2345DF620((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(_OWORD *)(v11 + 16 * i) = v9;
      }
    }
    uint64_t v13 = &off_26E7626E0;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithDoubleArray:(double *)a3 count:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v10.receiver = self;
  v10.super_class = (Class)USKData;
  if ([(USKData *)&v10 init])
  {
    __dst = 0;
    memset(v8, 0, sizeof(v8));
    sub_2345E8518((uint64_t)v8, a4);
    sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v8);
    memcpy(__dst, a3, 8 * a4);
    uint64_t v11 = &off_26E763D20;
    sub_2345F97E0();
  }
  return 0;
}

- (USKData)initWithDouble2Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v12.receiver = self;
  v12.super_class = (Class)USKData;
  if ([(USKData *)&v12 init])
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_2345E86B4((uint64_t)v10, v4);
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        long long v9 = *(_OWORD *)(v5 + 16 * i);
        sub_2345F06FC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v10);
        *(_OWORD *)(v11 + 16 * i) = v9;
      }
    }
    uint64_t v13 = off_26E763DD8;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithDouble3Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v15.receiver = self;
  v15.super_class = (Class)USKData;
  if ([(USKData *)&v15 init])
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_2345E8864((uint64_t)v13, v4);
    if (v4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4;
      do
      {
        long long v11 = *v5;
        long long v12 = v5[1];
        sub_2345F0B50((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v13);
        uint64_t v9 = v14 + v7;
        *(_OWORD *)uint64_t v9 = v11;
        *(void *)(v9 + 16) = v12;
        v5 += 2;
        v7 += 24;
        --v8;
      }
      while (v8);
    }
    objc_super v16 = off_26E763E90;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithDouble4Array:(USKData *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v15.receiver = self;
  v15.super_class = (Class)USKData;
  if ([(USKData *)&v15 init])
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_2345E8A14((uint64_t)v13, v4);
    if (v4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v4;
      do
      {
        long long v11 = *(_OWORD *)(v5 + v7);
        long long v12 = *(_OWORD *)(v5 + v7 + 16);
        sub_2345F0FC0((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v13);
        uint64_t v9 = (_OWORD *)(v14 + v7);
        _OWORD *v9 = v11;
        v9[1] = v12;
        v7 += 32;
        --v8;
      }
      while (v8);
    }
    objc_super v16 = off_26E763F48;
    sub_2345DEAC0();
  }
  return 0;
}

- (USKData)initWithDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  sub_234627B1C();
  v28.receiver = self;
  v28.super_class = (Class)USKData;
  if ([(USKData *)&v28 init])
  {
    uint64_t v27 = 0;
    memset(v26, 0, sizeof(v26));
    sub_2345E8C08((uint64_t)v26, a4);
    if (a4)
    {
      uint64_t v7 = 0;
      unint64_t v8 = a4;
      do
      {
        long long v24 = *(_OWORD *)((char *)a3 + v7 + 48);
        long long v25 = *(_OWORD *)((char *)a3 + v7 + 16);
        long long v20 = *(_OWORD *)((char *)a3 + v7 + 32);
        long long v21 = *(_OWORD *)((char *)a3 + v7);
        long long v22 = *(_OWORD *)((char *)a3 + v7 + 112);
        long long v23 = *(_OWORD *)((char *)a3 + v7 + 80);
        long long v18 = *(_OWORD *)((char *)a3 + v7 + 96);
        long long v19 = *(_OWORD *)((char *)a3 + v7 + 64);
        sub_2345EFF6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v26);
        uint64_t v9 = (long long *)(v27 + v7);
        long long *v9 = v21;
        v9[1] = v25;
        _OWORD v9[2] = v20;
        void v9[3] = v24;
        v9[4] = v19;
        v9[5] = v23;
        v9[6] = v18;
        v9[7] = v22;
        sub_2345EFF6C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v26);
        objc_super v10 = (_OWORD *)(v27 + v7);
        long long v11 = *v9;
        long long v12 = v9[1];
        long long v13 = v9[3];
        _OWORD v10[2] = v9[2];
        void v10[3] = v13;
        long long v14 = v9[7];
        long long v16 = v9[4];
        long long v15 = v9[5];
        v10[6] = v9[6];
        v10[7] = v14;
        v10[4] = v16;
        v10[5] = v15;
        _OWORD *v10 = v11;
        v10[1] = v12;
        v7 += 128;
        --v8;
      }
      while (v8);
    }
    uint64_t v29 = off_26E764000;
    sub_2345DEAC0();
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v4 = (USKData *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_value(v5, v6, v7, v8);
    char v9 = sub_2345EBBB8((uint64_t)&self->_value, (uint64_t)v11);
    sub_2345DAC58((uint64_t)v11);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return MEMORY[0x270FA4FB8](&self->_value, a2);
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)arraySize
{
  return self->_arraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_propertyOwner, 0);
  objc_storeStrong((id *)&self->_sceneOwner, 0);
  objc_storeStrong((id *)&self->_nodeOwner, 0);
  sub_2345DAC58((uint64_t)&self->_value);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end