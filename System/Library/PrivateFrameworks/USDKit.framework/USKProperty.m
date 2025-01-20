@interface USKProperty
- (BOOL)BOOLValue;
- (BOOL)isAnimated;
- (BOOL)isEqual:(id)a3;
- (BOOL)setConnectionWithTargetPaths:(id)a3;
- (BOOL)setCustomMetadata:(id)a3 value:(id)a4;
- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5;
- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4;
- (NSString)role;
- (NSString)type;
- (USKProperty)initWithUsdProperty:(UsdProperty *)a3;
- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withNodeOwner:(id)a4;
- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withSceneOwner:(id)a4;
- (USKToken)roleName;
- (USKToken)typeName;
- (UsdProperty)usdProperty;
- (__n128)double3Value;
- (__n128)double3ValueAtTime:(uint64_t)a1@<X0>;
- (__n128)double4Value;
- (__n128)double4ValueAtTime:(uint64_t)a1@<X0>;
- (__n128)double4x4Value;
- (__n128)double4x4ValueAtTime:(uint64_t)a1@<X0>;
- (__n64)float2Value;
- (__n64)float2ValueAtTime:(uint64_t)a1;
- (__n64)float3Value;
- (__n64)float3ValueAtTime:(uint64_t)a1;
- (__n64)float4Value;
- (__n64)float4ValueAtTime:(uint64_t)a1;
- (__n64)quatfValue;
- (__n64)quatfValueAtTime:(uint64_t)a1;
- (double)double2Value;
- (double)double2ValueAtTime:(uint64_t)a1;
- (double)doubleValue;
- (double)doubleValueAtTime:(double)a3;
- (float)floatValue;
- (float)floatValueAtTime:(double)a3;
- (id).cxx_construct;
- (id)connectedPropertyPath;
- (id)connectedPropertyPaths;
- (id)customMetadataWithKey:(id)a3;
- (id)data;
- (id)dataAtTime:(double)a3;
- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4;
- (id)metadata;
- (id)metadataWithKey:(id)a3;
- (id)name;
- (id)objectPath;
- (id)objectPathArray;
- (id)parentNode;
- (id)path;
- (id)resourcePath;
- (id)resourcePathArray;
- (id)stringArray;
- (id)stringArrayAtTime:(double)a3;
- (id)stringValue;
- (id)targetObject;
- (id)timeCodeValue;
- (id)timeSamples;
- (id)tokenArray;
- (id)tokenArrayAtTime:(double)a3;
- (id)tokenValue;
- (id)urlValue;
- (int)intValue;
- (unint64_t)arraySize;
- (unint64_t)arraySizeAtTime:(double)a3;
- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4;
- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2;
- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:;
- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4;
- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)hash;
- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4;
- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4;
- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4;
- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5;
- (unsigned)uintValue;
- (unsigned)uintValueAtTime:(double)a3;
- (void)clearConnections;
- (void)clearMetadata;
- (void)clearValue;
- (void)setBoolValue:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setData:(id)a3 atTime:(double)a4;
- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2;
- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setDouble2Value:(USKProperty *)self;
- (void)setDouble2Value:(double)a3 atTime:;
- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2;
- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setDouble3Value:(USKProperty *)self;
- (void)setDouble3Value:(double)a3 atTime:;
- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2;
- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setDouble4Value:(USKProperty *)self;
- (void)setDouble4Value:(double)a3 atTime:;
- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4;
- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setDouble4x4Value:;
- (void)setDouble4x4Value:atTime:;
- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4;
- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setDoubleValue:(double)a3;
- (void)setDoubleValue:(double)a3 atTime:(double)a4;
- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2;
- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setFloat2Value:(USKProperty *)self;
- (void)setFloat2Value:(double)a3 atTime:;
- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2;
- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setFloat3Value:(USKProperty *)self;
- (void)setFloat3Value:(double)a3 atTime:;
- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2;
- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2 atTime:;
- (void)setFloat4Value:(USKProperty *)self;
- (void)setFloat4Value:(double)a3 atTime:;
- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4;
- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setFloatArray:(float *)a3 count:(unint64_t)a4;
- (void)setFloatArray:(float *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setFloatValue:(float)a3;
- (void)setFloatValue:(float)a3 atTime:(double)a4;
- (void)setIntArray:(int *)a3 count:(unint64_t)a4;
- (void)setIntArray:(int *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setIntValue:(int)a3;
- (void)setObjectPath:(id)a3;
- (void)setObjectPathArray:(id)a3;
- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4;
- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setQuatfValue:;
- (void)setQuatfValue:atTime:;
- (void)setResourcePath:(id)a3;
- (void)setResourcePathArray:(id)a3;
- (void)setStringArray:(id)a3;
- (void)setStringArray:(id)a3 atTime:(double)a4;
- (void)setStringValue:(id)a3;
- (void)setTimeCodeValue:(id)a3;
- (void)setTokenArray:(id)a3;
- (void)setTokenArray:(id)a3 atTime:(double)a4;
- (void)setTokenValue:(id)a3;
- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4 atTime:(double)a5;
- (void)setUIntValue:(unsigned int)a3;
- (void)setUIntValue:(unsigned int)a3 atTime:(double)a4;
- (void)setURL:(id)a3;
@end

@implementation USKProperty

- (NSString)type
{
  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    v9 = USKDataTypeObjectPathArray;
LABEL_20:
    v8 = *v9;
    goto LABEL_21;
  }
  if (p_property->_type != 3)
  {
    v9 = USKDataTypeUnknown;
    goto LABEL_20;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  sub_23460B484((uint64_t)p_property, (uint64_t)&v16);
  uint64_t v15 = 0;
  v3 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
  if (!v3) {
    pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  }
  uint64_t TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v16);
  Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
  uint64_t v12 = 0;
  uint64_t v14 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v3, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v12);
  pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v15, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v14);
  if ((v12 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  uint64_t v11 = v15;
  if ((v15 & 7) != 0)
  {
    unint64_t v7 = v15 & 0xFFFFFFFFFFFFFFF8;
    if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
      uint64_t v11 = v7;
    }
  }
  objc_msgSend_dataTypeWithTfToken_(USKToken, v5, (uint64_t)&v11, v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v15 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((BYTE8(v17) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);
  if (*((void *)&v16 + 1)) {
    sub_2346091F8(*((uint64_t *)&v16 + 1));
  }
LABEL_21:
  return (NSString *)v8;
}

- (USKToken)typeName
{
  v4 = objc_msgSend_type(self, a2, v2, v3);
  unint64_t v7 = objc_msgSend_tokenWithDataType_(USKToken, v5, (uint64_t)v4, v6);

  return (USKToken *)v7;
}

- (NSString)role
{
  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v10);
    uint64_t v9 = 0;
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetRoleName(&v9, (pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v10);
    uint64_t v8 = v9;
    if ((v9 & 7) != 0)
    {
      unint64_t v5 = v9 & 0xFFFFFFFFFFFFFFF8;
      if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
        uint64_t v8 = v5;
      }
    }
    objc_msgSend_roleTypeWithTfToken_(USKToken, v3, (uint64_t)&v8, v4);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v9 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((BYTE8(v11) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v11 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v11);
    if (*((void *)&v10 + 1)) {
      sub_2346091F8(*((uint64_t *)&v10 + 1));
    }
  }
  else
  {
    uint64_t v6 = @"None";
  }
  return (NSString *)v6;
}

- (USKToken)roleName
{
  uint64_t v4 = objc_msgSend_role(self, a2, v2, v3);
  unint64_t v7 = objc_msgSend_tokenWithRoleType_(USKToken, v5, (uint64_t)v4, v6);

  return (USKToken *)v7;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USKProperty;
  uint64_t v4 = [(USKProperty *)&v9 init];
  if (v4 && (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v4->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    uint64_t v6 = (uint64_t)v4->_property._prim._p.px;
    v4->_property._prim._p.px = px;
    if (v6) {
      sub_2346091F8(v6);
    }
    sub_2345EE430((uint64_t)&v4->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2345EE488((uint64_t)&v4->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2345EC46C(&v4->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    unint64_t v7 = v4;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withSceneOwner:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)USKProperty;
  uint64_t v8 = [(USKProperty *)&v13 init];
  if (v8 && (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = (uint64_t)v8->_property._prim._p.px;
    v8->_property._prim._p.px = px;
    if (v10) {
      sub_2346091F8(v10);
    }
    sub_2345EE430((uint64_t)&v8->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2345EE488((uint64_t)&v8->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2345EC46C(&v8->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_property._propName._rep._ptrAndBits, a4);
    long long v11 = v8;
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (USKProperty)initWithUsdProperty:(UsdProperty *)a3 withNodeOwner:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)USKProperty;
  uint64_t v8 = [(USKProperty *)&v13 init];
  if (v8 && (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_property._type = a3->_type;
    px = a3->_prim._p.px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = (uint64_t)v8->_property._prim._p.px;
    v8->_property._prim._p.px = px;
    if (v10) {
      sub_2346091F8(v10);
    }
    sub_2345EE430((uint64_t)&v8->_property._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2345EE488((uint64_t)&v8->_property._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2345EC46C(&v8->_property._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_sceneOwner, a4);
    long long v11 = v8;
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)parentNode
{
  uint64_t v3 = [USKNode alloc];
  sub_2346128E8((uint64_t)&v8, (uint64_t *)&self->_property._prim, &self->_property._proxyPrimPath);
  uint64_t v6 = objc_msgSend_initWithUsdPrim_(v3, v4, (uint64_t)&v8, v5);
  if ((v11 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v10);
  if (v9) {
    sub_2346091F8(v9);
  }
  return v6;
}

- (unint64_t)arraySize
{
  v4[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v4);
  unint64_t NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)v4);
  sub_2345DAC58((uint64_t)v4);
  return NumElements;
}

- (unint64_t)arraySizeAtTime:(double)a3
{
  v5[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v5);
  unint64_t NumElements = pxrInternal__aapl__pxrReserved__::VtValue::_GetNumElements((pxrInternal__aapl__pxrReserved__::VtValue *)v5);
  sub_2345DAC58((uint64_t)v5);
  return NumElements;
}

- (id)name
{
  uint64_t v3 = [USKToken alloc];
  uint64_t v6 = *(atomic_uint **)sub_23460D01C(&self->_property._type);
  uint64_t v10 = v6;
  if ((v6 & 7) != 0)
  {
    id v7 = (atomic_uint *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF8);
    if ((atomic_fetch_add_explicit(v7, 2u, memory_order_relaxed) & 1) == 0) {
      uint64_t v10 = v7;
    }
  }
  uint64_t v8 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v10, v5);
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return v8;
}

- (id)path
{
  uint64_t v3 = [USKObjectPath alloc];
  sub_234615930((uint64_t)&self->_property, &v8);
  uint64_t v6 = objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v8);
  return v6;
}

- (UsdProperty)usdProperty
{
  p_property = &self->_property;
  retstr->_type = self->_property._type;
  px = self->_property._prim._p.px;
  retstr->_prim._p.px = px;
  if (px) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
  }
  sub_2345EBC84(&retstr->_proxyPrimPath, &self->_property._proxyPrimPath);
  result = (UsdProperty *)sub_2345EBCD0((_DWORD *)&retstr->_proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&p_property->_proxyPrimPath._primPart._poolHandle + 1);
  poolHandle = p_property->_proxyPrimPath._propPart._poolHandle;
  retstr->_proxyPrimPath._propPart._poolHandle = poolHandle;
  if ((poolHandle & 7) != 0
    && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
  {
    retstr->_proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)retstr->_proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
  }
  return result;
}

- (id)metadata
{
  v56[2] = *MEMORY[0x263EF8340];
  v34 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  v51 = 0;
  v52[0] = 0;
  v52[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((uint64_t *)&v51, (pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property);
  uint64_t v5 = v51;
  if (v51 != (uint64_t *)v52)
  {
    uint64_t v32 = *(void *)(MEMORY[0x263F8C2B8] + 64);
    uint64_t v33 = *MEMORY[0x263F8C2B8];
    v30 = v48;
    uint64_t v31 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    do
    {
      uint64_t v55 = 0;
      v56[0] = 0;
      v56[1] = 0;
      uint64_t v6 = sub_234609250(&v55, v5 + 4);
      uint64_t v9 = NSString;
      if ((v55 & 0xFFFFFFFFFFFFFFF8) != 0) {
        uint64_t EmptyString = (v55 & 0xFFFFFFFFFFFFFFF8) + 16;
      }
      else {
        uint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v6);
      }
      if (*(char *)(EmptyString + 23) < 0) {
        uint64_t EmptyString = *(void *)EmptyString;
      }
      uint64_t v11 = objc_msgSend_stringWithUTF8String_(v9, v7, EmptyString, v8, v30);
      objc_msgSend_addObject_(v34, v12, (uint64_t)v11, v13);

      uint64_t v50 = 0;
      uint64_t v14 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
      if (!v14) {
        pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      }
      __p[0] = 0;
      *(void *)&long long v40 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v14, (const pxrInternal__aapl__pxrReserved__::VtValue *)v56, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v50, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v40);
      if (((uint64_t)__p[0] & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if (v50)
      {
        uint64_t v15 = [USKData alloc];
        sub_2345DDDA0(v53, v56);
        uint64_t v35 = v50;
        if ((v50 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v50 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v35 &= 0xFFFFFFFFFFFFFFF8;
        }
        long long v17 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v15, v16, (uint64_t)v53, (uint64_t)&v35, self);
        objc_msgSend_addObject_(v3, v18, (uint64_t)v17, v19);

        if ((v35 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v35 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v53);
      }
      else
      {
        uint64_t v49 = 0;
        long long v47 = 0u;
        memset(v48, 0, sizeof(v48));
        *(_OWORD *)v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
        sub_2345E11F4((uint64_t)&v40);
        pxrInternal__aapl__pxrReserved__::operator<<();
        v20 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x237DC2540](&v39, __p);
        v54[0] = v39;
        v54[1] = (char *)&off_26E762990 + 1;
        if ((v39 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v39 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v54[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        MEMORY[0x237DC2530](&v36, "token");
        v22 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v20, v21, (uint64_t)v54, (uint64_t)&v36, self);
        objc_msgSend_addObject_(v3, v23, (uint64_t)v22, v24);

        if ((v36 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v36 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v54);
        if ((v39 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v39 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if (v38 < 0) {
          operator delete(__p[0]);
        }
        *(void *)&long long v40 = v33;
        *(void *)((char *)&v40 + *(void *)(v33 - 24)) = v32;
        *(void *)&long long v41 = v31;
        *((void *)&v41 + 1) = MEMORY[0x263F8C318] + 16;
        if (SHIBYTE(v46) < 0) {
          operator delete(v45[1]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x237DC3250](v30);
      }
      if ((v50 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v50 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      sub_2345DAC58((uint64_t)v56);
      if ((v55 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v55 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      v25 = (uint64_t *)v5[1];
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (uint64_t *)v5[2];
          BOOL v27 = *v26 == (void)v5;
          uint64_t v5 = v26;
        }
        while (!v27);
      }
      uint64_t v5 = v26;
    }
    while (v26 != (uint64_t *)v52);
  }
  v28 = objc_msgSend_dictionaryWithObjects_forKeys_(NSDictionary, v4, (uint64_t)v3, (uint64_t)v34);
  sub_234609D58((uint64_t)&v51, v52[0]);

  return v28;
}

- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x237DC2530](&v25, v12);
  v30._storage = 0;
  v30._info._ptrAndBits = 0;
  uint64_t v13 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
  if (!v13) {
    pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  }
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(v13, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (pxrInternal__aapl__pxrReserved__::VtValue *)&v30))
  {
    if (!v30._info._ptrAndBits) {
      goto LABEL_12;
    }
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v30);
    if (v7)
    {
      objc_msgSend_value(v7, v17, v18, v19);
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }
    uint64_t v22 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
    sub_2345DAC58((uint64_t)&v28);
    if (Type == v22)
    {
LABEL_12:
      if (v7)
      {
        objc_msgSend_value(v7, v14, (uint64_t)v15, v16);
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
      }
      char v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      if (v7)
      {
        objc_msgSend_value(v7, v14, (uint64_t)v15, v16);
      }
      else
      {
        v26[0] = 0;
        v26[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf(v27, (pxrInternal__aapl__pxrReserved__::VtValue *)v26, &v30, v15);
      sub_2345DAAE4(&v28, v27);
      sub_2345DAC58((uint64_t)v27);
      sub_2345DAC58((uint64_t)v26);
      char v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
    }
    BOOL v21 = v23;
    sub_2345DAC58((uint64_t)&v28);
  }
  else
  {
    BOOL v21 = 0;
  }
  sub_2345DAC58((uint64_t)&v30);
  if ((v25 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v25 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v21;
}

- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v36 = 0;
  id v11 = v8;
  uint64_t v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x237DC2530](&v36, v15);
  uint64_t v35 = 0;
  id v16 = v9;
  uint64_t v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
  MEMORY[0x237DC2530](&v35, v20);
  v41._storage = 0;
  v41._info._ptrAndBits = 0;
  BOOL v21 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
  if (!v21) {
    pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  }
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(v21, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v36, (pxrInternal__aapl__pxrReserved__::VtValue *)&v41))
  {
    if (((uint64_t)v41._info._ptrAndBits & 4) != 0) {
      uint64_t v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)(*(uint64_t (**)(VtValue *))(((unint64_t)v41._info._ptrAndBits & 0xFFFFFFFFFFFFFFF8)
    }
                                                                                              + 168))(&v41);
    else {
      uint64_t v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_234609DCC((uint64_t *)&v41);
    }
    if ((v35 & 0xFFFFFFFFFFFFFFF8) == 0) {
      pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v22);
    }
    ValueAtPath = (void *)pxrInternal__aapl__pxrReserved__::VtDictionary::GetValueAtPath();
    if (ValueAtPath)
    {
      sub_2345E0670(&v41, ValueAtPath);
    }
    else
    {
      uint64_t v40 = 0;
      sub_2345DAAE4(&v41, &v39);
      sub_2345DAC58((uint64_t)&v39);
    }
    if (!v41._info._ptrAndBits) {
      goto LABEL_20;
    }
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v41);
    if (v10)
    {
      objc_msgSend_value(v10, v28, v29, v30);
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
    }
    uint64_t v32 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
    sub_2345DAC58((uint64_t)&v39);
    if (Type == v32)
    {
LABEL_20:
      if (v10)
      {
        objc_msgSend_value(v10, v25, (uint64_t)v26, v27);
      }
      else
      {
        uint64_t v39 = 0;
        uint64_t v40 = 0;
      }
      char v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v35, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      if (v10)
      {
        objc_msgSend_value(v10, v25, (uint64_t)v26, v27);
      }
      else
      {
        v37[0] = 0;
        v37[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf(v38, (pxrInternal__aapl__pxrReserved__::VtValue *)v37, &v41, v26);
      sub_2345DAAE4(&v39, v38);
      sub_2345DAC58((uint64_t)v38);
      sub_2345DAC58((uint64_t)v37);
      char v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v35, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
    }
    BOOL v23 = v33;
    sub_2345DAC58((uint64_t)&v39);
  }
  else
  {
    BOOL v23 = 0;
  }
  sub_2345DAC58((uint64_t)&v41);
  if ((v35 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v35 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v36 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v36 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v23;
}

- (BOOL)setCustomMetadata:(id)a3 value:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  unint64_t v8 = atomic_load(MEMORY[0x263F90528]);
  if (!v8) {
    sub_23460936C();
  }
  id v9 = *(atomic_uint **)(v8 + 72);
  uint64_t v22 = v9;
  if ((v9 & 7) != 0)
  {
    id v10 = (atomic_uint *)((unint64_t)v9 & 0xFFFFFFFFFFFFFFF8);
    if ((atomic_fetch_add_explicit(v10, 2u, memory_order_relaxed) & 1) == 0) {
      uint64_t v22 = v10;
    }
  }
  uint64_t v21 = 0;
  id v11 = v6;
  uint64_t v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x237DC2530](&v21, v15);
  if (v7)
  {
    objc_msgSend_value(v7, v16, v17, v18);
  }
  else
  {
    v23[0] = 0;
    v23[1] = 0;
  }
  char v19 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v22, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v21, (const pxrInternal__aapl__pxrReserved__::VtValue *)v23);
  sub_2345DAC58((uint64_t)v23);
  if ((v21 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v22 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v19;
}

- (id)metadataWithKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x237DC2530](&v17, v8);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v17, (pxrInternal__aapl__pxrReserved__::VtValue *)&v19);
  if ((v17 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v20)
  {
    id v9 = [USKData alloc];
    sub_2345DDDA0(v18, &v19);
    id v10 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v10) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t v14 = 0;
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v19);
    uint64_t v17 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v10, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v14);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v16, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v17);
    uint64_t v12 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v9, v11, (uint64_t)v18, (uint64_t)&v16, self);
    if ((v16 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v14 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v18);
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_2345DAC58((uint64_t)&v19);

  return v12;
}

- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x237DC2530](&v26, v12);
  id v13 = v7;
  uint64_t v17 = objc_msgSend_UTF8String(v13, v14, v15, v16);
  MEMORY[0x237DC2530](&Type, v17);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v26, (const pxrInternal__aapl__pxrReserved__::TfToken *)&Type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
  if ((Type & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(Type & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v26 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v26 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v29)
  {
    uint64_t v18 = [USKData alloc];
    sub_2345DDDA0(v27, &v28);
    uint64_t v19 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v19) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
    uint64_t v23 = 0;
    uint64_t v26 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v19, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v23);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v24, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v26);
    uint64_t v21 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v18, v20, (uint64_t)v27, (uint64_t)&v24, self);
    if ((v24 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v24 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v23 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v23 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v27);
  }
  else
  {
    uint64_t v21 = 0;
  }
  sub_2345DAC58((uint64_t)&v28);

  return v21;
}

- (id)customMetadataWithKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  unint64_t v5 = atomic_load(MEMORY[0x263F90528]);
  if (!v5) {
    sub_23460936C();
  }
  id v6 = v4;
  uint64_t v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  MEMORY[0x237DC2530](&v19, v10);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_property, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v5 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19, (pxrInternal__aapl__pxrReserved__::VtValue *)&v21);
  if ((v19 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v22)
  {
    uint64_t v11 = [USKData alloc];
    sub_2345DDDA0(v20, &v21);
    uint64_t v12 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v12) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t v16 = 0;
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v21);
    uint64_t v19 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v12, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v16);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v18, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v19);
    uint64_t v14 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v11, v13, (uint64_t)v20, (uint64_t)&v18, self);
    if ((v18 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v18 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v16 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v20);
  }
  else
  {
    uint64_t v14 = 0;
  }
  sub_2345DAC58((uint64_t)&v21);

  return v14;
}

- (id)connectedPropertyPath
{
  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v5);
    if (pxrInternal__aapl__pxrReserved__::UsdAttribute::HasAuthoredConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v5))
    {
      memset(v4, 0, sizeof(v4));
      pxrInternal__aapl__pxrReserved__::UsdAttribute::GetConnections();
      id v7 = (void **)v4;
      sub_2345EC2C4(&v7);
    }
    if ((BYTE8(v6) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v6 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v6);
    if (*((void *)&v5 + 1)) {
      sub_2346091F8(*((uint64_t *)&v5 + 1));
    }
  }
  return 0;
}

- (id)connectedPropertyPaths
{
  p_property = &self->_property;
  if (p_property->_type != 3) {
    goto LABEL_9;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  sub_23460B484((uint64_t)p_property, (uint64_t)&v11);
  int HasAuthoredConnections = pxrInternal__aapl__pxrReserved__::UsdAttribute::HasAuthoredConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v11);
  char v5 = HasAuthoredConnections;
  if (HasAuthoredConnections)
  {
    memset(v10, 0, sizeof(v10));
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetConnections();
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v2 = objc_msgSend_initWithCapacity_(v6, v7, 0, v8);
    id v13 = (void **)v10;
    sub_2345EC2C4(&v13);
  }
  if ((BYTE8(v12) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v12 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v12);
  if (*((void *)&v11 + 1)) {
    sub_2346091F8(*((uint64_t *)&v11 + 1));
  }
  if ((v5 & 1) == 0) {
LABEL_9:
  }
    uint64_t v2 = 0;
  return v2;
}

- (BOOL)setConnectionWithTargetPaths:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_property._type == 3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    sub_23460B484((uint64_t)&self->_property, (uint64_t)&v29);
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_234617650(&v26, v8);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v22, (uint64_t)v32, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (v17) {
            objc_msgSend_path(v17, v11, v12, v13, (void)v22);
          }
          else {
            uint64_t v31 = 0;
          }
          uint64_t v18 = v27;
          if ((unint64_t)v27 >= v28)
          {
            uint64_t v19 = (_DWORD *)sub_234622390(&v26, &v31);
          }
          else
          {
            sub_2345EC01C(v27, &v31);
            sub_2345EC058(v18 + 1, (_DWORD *)&v31 + 1);
            uint64_t v19 = v18 + 2;
          }
          uint64_t v27 = v19;
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2345EBD10((uint64_t)&v31);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v22, (uint64_t)v32, 16);
      }
      while (v14);
    }

    char v20 = pxrInternal__aapl__pxrReserved__::UsdAttribute::SetConnections();
    uint64_t v31 = (void **)&v26;
    sub_2345EC2C4(&v31);
    if ((BYTE8(v30) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v30 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v30);
    if (*((void *)&v29 + 1)) {
      sub_2346091F8(*((uint64_t *)&v29 + 1));
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)clearConnections
{
  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    long long v3 = 0u;
    long long v4 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v3);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::ClearConnections((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v3);
    if ((BYTE8(v4) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v4 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v4);
    if (*((void *)&v3 + 1)) {
      sub_2346091F8(*((uint64_t *)&v3 + 1));
    }
  }
}

- (void)clearMetadata
{
  v14[2] = *MEMORY[0x263EF8340];
  p_property = &self->_property;
  if (p_property->_type == 3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v11);
    id v9 = 0;
    v10[0] = 0;
    v10[1] = 0;
    pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((uint64_t *)&v9, (pxrInternal__aapl__pxrReserved__::UsdObject *)&v11);
    long long v3 = v9;
    if (v9 != (uint64_t *)v10)
    {
      long long v4 = (unint64_t *)MEMORY[0x263F90528];
      do
      {
        uint64_t v13 = 0;
        v14[0] = 0;
        v14[1] = 0;
        sub_234609250(&v13, v3 + 4);
        unint64_t v5 = atomic_load(v4);
        if (!v5) {
          sub_23460936C();
        }
        if ((v13 & 0xFFFFFFFFFFFFFFF8) != (*(void *)(v5 + 448) & 0xFFFFFFFFFFFFFFF8)) {
          pxrInternal__aapl__pxrReserved__::UsdObject::ClearMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v11, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v13);
        }
        sub_2345DAC58((uint64_t)v14);
        if ((v13 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        uint64_t v6 = (uint64_t *)v3[1];
        if (v6)
        {
          do
          {
            uint64_t v7 = v6;
            uint64_t v6 = (uint64_t *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            uint64_t v7 = (uint64_t *)v3[2];
            BOOL v8 = *v7 == (void)v3;
            long long v3 = v7;
          }
          while (!v8);
        }
        long long v3 = v7;
      }
      while (v7 != (uint64_t *)v10);
    }
    sub_234609D58((uint64_t)&v9, v10[0]);
    if ((BYTE8(v12) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v12 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v12);
    if (*((void *)&v11 + 1)) {
      sub_2346091F8(*((uint64_t *)&v11 + 1));
    }
  }
}

- (void)clearValue
{
  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    long long v3 = 0u;
    long long v4 = 0u;
    sub_234617AA0((uint64_t)p_property, (uint64_t)&v3);
    pxrInternal__aapl__pxrReserved__::UsdRelationship::ClearTargets((pxrInternal__aapl__pxrReserved__::UsdRelationship *)&v3);
    if ((BYTE8(v4) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v4 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    if (p_property->_type != 3) {
      return;
    }
    long long v3 = 0u;
    long long v4 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v3);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Clear((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v3);
    if ((BYTE8(v4) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v4 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v4);
  if (*((void *)&v3 + 1)) {
    sub_2346091F8(*((uint64_t *)&v3 + 1));
  }
}

- (id)data
{
  v22[2] = *MEMORY[0x263EF8340];
  p_property = &self->_property;
  if (p_property->_type == 4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    sub_234617AA0((uint64_t)p_property, (uint64_t)&v16);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    if (v20 != v19)
    {
      uint64_t v10 = [USKData alloc];
      void v18[2] = (void **)&off_26E764278;
      sub_234622BA4();
    }
    id v9 = 0;
    v18[0] = (void **)&v19;
    sub_2345EC2C4(v18);
    if ((BYTE8(v17) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    if (p_property->_type != 3)
    {
      id v9 = 0;
      goto LABEL_28;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v16);
    if (pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v16))
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
      v18[0] = 0;
      long long v4 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
      if (!v4) {
        pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      }
      uint64_t TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v16);
      uint64_t Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
      uint64_t v13 = 0;
      uint64_t v15 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v4, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v13);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((uint64_t *)v18, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v15);
      if ((v13 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      uint64_t v6 = [USKData alloc];
      sub_2345DDDA0(v22, &v19);
      unint64_t v12 = (unint64_t)v18[0];
      if (((uint64_t)v18[0] & 7) != 0)
      {
        unint64_t v8 = (unint64_t)v18[0] & 0xFFFFFFFFFFFFFFF8;
        if ((atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v18[0] & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)unint64_t v12 = v8; {
      }
        }
      id v9 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v6, v7, (uint64_t)v22, (uint64_t)&v12, self);
      if ((v12 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      sub_2345DAC58((uint64_t)v22);
      if (((uint64_t)v18[0] & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v18[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      sub_2345DAC58((uint64_t)&v19);
    }
    else
    {
      id v9 = 0;
    }
    if ((BYTE8(v17) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2345EBD10((uint64_t)&v17);
  if (*((void *)&v16 + 1)) {
    sub_2346091F8(*((uint64_t *)&v16 + 1));
  }
LABEL_28:
  return v9;
}

- (id)dataAtTime:(double)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  p_property = &self->_property;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v19);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v19)
    && pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v19))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v17);
    v22[0] = 0;
    v22[1] = 0;
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
    uint64_t v16 = 0;
    unint64_t v5 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v5) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t TypeName = pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v17);
    uint64_t Type = (const pxrInternal__aapl__pxrReserved__::TfType *)pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetType((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&TypeName);
    uint64_t v13 = 0;
    uint64_t v15 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v5, Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v13);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v16, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v15);
    if ((v13 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    uint64_t v7 = [USKData alloc];
    sub_2345DDDA0(v21, v22);
    uint64_t v12 = v16;
    if ((v16 & 7) != 0)
    {
      unint64_t v9 = v16 & 0xFFFFFFFFFFFFFFF8;
      if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
        uint64_t v12 = v9;
      }
    }
    uint64_t v10 = objc_msgSend_initWithVtValue_typeName_withPropertyOwner_(v7, v8, (uint64_t)v21, (uint64_t)&v12, self);
    if ((v12 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v21);
    if ((v16 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v22);
    if ((BYTE8(v18) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v18 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v18);
    if (*((void *)&v17 + 1)) {
      sub_2346091F8(*((uint64_t *)&v17 + 1));
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ((BYTE8(v20) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v20);
  if (*((void *)&v19 + 1)) {
    sub_2346091F8(*((uint64_t *)&v19 + 1));
  }
  return v10;
}

- (BOOL)isAnimated
{
  p_property = &self->_property;
  if (p_property->_type == 4) {
    return 0;
  }
  long long v5 = 0u;
  long long v6 = 0u;
  sub_23460B484((uint64_t)p_property, (uint64_t)&v5);
  if (pxrInternal__aapl__pxrReserved__::UsdAttribute::GetVariability((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v5) == 1) {
    char v3 = 0;
  }
  else {
    char v3 = pxrInternal__aapl__pxrReserved__::UsdAttribute::ValueMightBeTimeVarying((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v5);
  }
  if ((BYTE8(v6) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v6 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v6);
  if (*((void *)&v5 + 1)) {
    sub_2346091F8(*((uint64_t *)&v5 + 1));
  }
  return v3;
}

- (id)timeSamples
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  p_property = &self->_property;
  if (p_property->_type != 4)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    sub_23460B484((uint64_t)p_property, (uint64_t)&v7);
    if (pxrInternal__aapl__pxrReserved__::UsdAttribute::GetVariability((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7) != 1)
    {
      __p = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTimeSamples();
    }
    if ((BYTE8(v8) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v8);
    if (*((void *)&v7 + 1)) {
      sub_2346091F8(*((uint64_t *)&v7 + 1));
    }
  }
  return 0;
}

- (id)stringValue
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v39 = objc_msgSend_timeSamples(self, a2, v2, v3);
  if (v39)
  {
    uint64_t v48 = 0;
    long long v46 = 0u;
    memset(v47, 0, sizeof(v47));
    *(_OWORD *)__p = 0u;
    long long v45 = 0u;
    memset(v43, 0, sizeof(v43));
    long long v42 = 0u;
    sub_2345E11F4((uint64_t)&v42);
    sub_2345DDEB8(v43, (uint64_t)"[", 1);
    VtValue v41 = 0;
    memset(v40, 0, sizeof(v40));
    objc_msgSend_value(v39, v8, v9, v10);
    sub_2346189E8((uint64_t *)v49, (uint64_t)v40);
    sub_2345DAC58((uint64_t)v49);
    sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
    long long v11 = v41;
    sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v40);
    for (uint64_t i = &v41[*(void *)&v40[0]]; v11 != i; ++v11)
    {
      uint64_t v16 = objc_msgSend_dataAtTime_(self, v12, v13, v14, *v11);
      long long v17 = (void *)std::ostream::operator<<();
      long long v18 = sub_2345DDEB8(v17, (uint64_t)": ", 2);
      objc_msgSend_stringValue(v16, v19, v20, v21);
      id v22 = objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25);
      size_t v27 = strlen(v26);
      unint64_t v28 = sub_2345DDEB8(v18, (uint64_t)v26, v27);
      sub_2345DDEB8(v28, (uint64_t)", ", 2);
    }
    sub_2345DDEB8(v43, (uint64_t)"]", 1);
    long long v29 = NSString;
    std::stringbuf::str();
    if (v50 >= 0) {
      objc_msgSend_stringWithUTF8String_(v29, v30, (uint64_t)v49, v31);
    }
    else {
    uint64_t v32 = objc_msgSend_stringWithUTF8String_(v29, v30, (uint64_t)v49[0], v31);
    }
    if (v50 < 0) {
      operator delete(v49[0]);
    }
    sub_2345D9DC0((uint64_t)v40);
    *(void *)&long long v42 = *MEMORY[0x263F8C2B8];
    uint64_t v33 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(void *)((char *)&v43[-1] + *(void *)(v42 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
    *(void *)&v43[0] = v33;
    *((void *)&v43[0] + 1) = MEMORY[0x263F8C318] + 16;
    if (SHIBYTE(v45) < 0) {
      operator delete(__p[1]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x237DC3250](v47);
  }
  else
  {
    v34 = objc_msgSend_data(self, v5, v6, v7);
    uint64_t v32 = objc_msgSend_stringValue(v34, v35, v36, v37);
  }
  return v32;
}

- (id)tokenValue
{
  uint64_t v3 = [USKToken alloc];
  sub_234618B28(&self->_property._type, (atomic_uint **)&v8);
  uint64_t v6 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v8, v5);
  if ((v8 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return v6;
}

- (id)urlValue
{
  long long v7 = 0u;
  long long v8 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v7);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v7))
  {
    v4[0] = (void *)pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7);
    if (!atomic_load(MEMORY[0x263F90560])) {
      sub_2345DEBD0(MEMORY[0x263F90560]);
    }
    if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
    {
      *(_OWORD *)__p = 0u;
      long long v6 = 0u;
      *(_OWORD *)long long v4 = 0u;
      pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v4);
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::SdfAssetPath>();
    }
  }
  if ((BYTE8(v8) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v8);
  if (*((void *)&v7 + 1)) {
    sub_2346091F8(*((uint64_t *)&v7 + 1));
  }
  return 0;
}

- (id)resourcePath
{
  long long v7 = 0u;
  long long v8 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v7);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v7))
  {
    v4[0] = (void *)pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v7);
    if (!atomic_load(MEMORY[0x263F90560])) {
      sub_2345DEBD0(MEMORY[0x263F90560]);
    }
    if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
    {
      *(_OWORD *)uint64_t v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)long long v4 = 0u;
      pxrInternal__aapl__pxrReserved__::SdfAssetPath::SdfAssetPath((pxrInternal__aapl__pxrReserved__::SdfAssetPath *)v4);
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::SdfAssetPath>();
    }
  }
  if ((BYTE8(v8) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v8 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v8);
  if (*((void *)&v7 + 1)) {
    sub_2346091F8(*((uint64_t *)&v7 + 1));
  }
  return 0;
}

- (id)resourcePathArray
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v6 = 0u;
  long long v7 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v6);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v6))
  {
    pxrInternal__aapl__pxrReserved__::UsdAttribute::GetTypeName((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v6);
    if (!atomic_load(MEMORY[0x263F90560])) {
      sub_2345DEBD0(MEMORY[0x263F90560]);
    }
    if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==()) {
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<pxrInternal__aapl__pxrReserved__::SdfAssetPath>>();
    }
  }
  if ((BYTE8(v7) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v7 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v7);
  if (*((void *)&v6 + 1)) {
    sub_2346091F8(*((uint64_t *)&v6 + 1));
  }
  return v3;
}

- (id)timeCodeValue
{
  id v3 = [USKTimeCode alloc];
  double v4 = sub_234619418(&self->_property._type, NAN);
  long long v8 = objc_msgSend_initWithSdfTimeCode_(v3, v5, v6, v7, v4);
  return v8;
}

- (BOOL)BOOLValue
{
  return sub_234619630(&self->_property._type);
}

- (int)intValue
{
  return sub_234619858(&self->_property._type);
}

- (unsigned)uintValue
{
  return sub_234619A78(&self->_property._type);
}

- (unsigned)uintValueAtTime:(double)a3
{
  return sub_234619A78(&self->_property._type);
}

- (double)doubleValue
{
  return sub_234619CA8(&self->_property._type, NAN);
}

- (double)doubleValueAtTime:(double)a3
{
  return sub_234619CA8(&self->_property._type, a3);
}

- (double)double2Value
{
  return sub_234619EE8((_DWORD *)(a1 + 24));
}

- (double)double2ValueAtTime:(uint64_t)a1
{
  return sub_234619EE8((_DWORD *)(a1 + 24));
}

- (__n128)double3Value
{
  result.n128_f64[0] = sub_23461A158((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)double3ValueAtTime:(uint64_t)a1@<X0>
{
  result.n128_f64[0] = sub_23461A158((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)double4Value
{
  result.n128_f64[0] = sub_23461A3F4((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *((void *)&v6 + 1) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

- (__n128)double4ValueAtTime:(uint64_t)a1@<X0>
{
  result.n128_f64[0] = sub_23461A3F4((_DWORD *)(a1 + 24));
  result.n128_u64[1] = v3;
  *((void *)&v6 + 1) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

- (__n128)double4x4Value
{
  sub_23461A6F0((_DWORD *)(a1 + 24), v8);
  long long v3 = v8[1];
  *a2 = v8[0];
  a2[1] = v3;
  long long v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  long long v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  __n128 result = v9;
  long long v7 = v10;
  a2[6] = v9;
  a2[7] = v7;
  return result;
}

- (__n128)double4x4ValueAtTime:(uint64_t)a1@<X0>
{
  sub_23461A6F0((_DWORD *)(a1 + 24), v8);
  long long v3 = v8[1];
  *a2 = v8[0];
  a2[1] = v3;
  long long v4 = v8[3];
  a2[2] = v8[2];
  a2[3] = v4;
  long long v5 = v8[5];
  a2[4] = v8[4];
  a2[5] = v5;
  __n128 result = v9;
  long long v7 = v10;
  a2[6] = v9;
  a2[7] = v7;
  return result;
}

- (float)floatValue
{
  return sub_23461A9E8(&self->_property._type, 0.0);
}

- (float)floatValueAtTime:(double)a3
{
  return sub_23461A9E8(&self->_property._type, *(float *)&a3);
}

- (__n64)float2Value
{
  result.n64_f32[0] = sub_23461AC28((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float2ValueAtTime:(uint64_t)a1
{
  result.n64_f32[0] = sub_23461AC28((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float3Value
{
  result.n64_f32[0] = sub_23461AE8C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float3ValueAtTime:(uint64_t)a1
{
  result.n64_f32[0] = sub_23461AE8C((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float4Value
{
  result.n64_f32[0] = sub_23461B110((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)float4ValueAtTime:(uint64_t)a1
{
  result.n64_f32[0] = sub_23461B110((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)quatfValue
{
  result.n64_f32[0] = sub_23461B3A0((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (__n64)quatfValueAtTime:(uint64_t)a1
{
  result.n64_f32[0] = sub_23461B3A0((_DWORD *)(a1 + 24));
  result.n64_u32[1] = v1;
  return result;
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4
{
  return sub_23461B604(&self->_property._type, a3, a4);
}

- (unint64_t)intArray:(int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461B604(&self->_property._type, a3, a4);
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  return sub_23461B78C(&self->_property._type, a3, a4);
}

- (unint64_t)uintArray:(unsigned int *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461B78C(&self->_property._type, a3, a4);
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_23461B914(&self->_property._type, a3, a4);
}

- (unint64_t)quatfArray:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461B914(&self->_property._type, a3, a4);
}

- (id)stringArray
{
  v31[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v31);
  if (!v31[1]) {
    goto LABEL_19;
  }
  Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
  if (!pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(Typeid, &stru_26E7628B8, v3))
  {
    uint64_t v16 = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)v31);
    if (pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(v16, &stru_26E7628D0, v17))
    {
      long long v18 = (uint64_t *)sub_2345E4134(v31);
      uint64_t v19 = *v18;
      objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v20, *v18, v21);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v19) {
        goto LABEL_20;
      }
      uint64_t v24 = 0;
      while (1)
      {
        unint64_t v25 = *(void *)(v18[4] + 8 * v24) & 0xFFFFFFFFFFFFFFF8;
        if (!v25) {
          break;
        }
        uint64_t v26 = (uint64_t *)(v25 + 16);
        if ((*(char *)(v25 + 39) & 0x80000000) == 0) {
          goto LABEL_16;
        }
        objc_msgSend_stringWithUTF8String_(NSString, v22, *v26, v23);
        size_t v27 = LABEL_17:;
        objc_msgSend_addObject_(v10, v28, (uint64_t)v27, v29);

        if (v19 == ++v24) {
          goto LABEL_20;
        }
      }
      uint64_t v26 = (uint64_t *)"";
LABEL_16:
      objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)v26, v23);
      goto LABEL_17;
    }
LABEL_19:
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    goto LABEL_20;
  }
  long long v4 = (uint64_t *)sub_2345E3F34(v31);
  uint64_t v5 = *v4;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v6, *v4, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v4[4] + v11;
      if (*(char *)(v12 + 23) < 0) {
        uint64_t v12 = *(void *)v12;
      }
      uint64_t v13 = objc_msgSend_stringWithUTF8String_(NSString, v8, v12, v9);
      objc_msgSend_addObject_(v10, v14, (uint64_t)v13, v15);

      v11 += 24;
      --v5;
    }
    while (v5);
  }
LABEL_20:
  sub_2345DAC58((uint64_t)v31);
  return v10;
}

- (id)stringArrayAtTime:(double)a3
{
  void v20[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v20);
  long long v3 = (uint64_t *)sub_2345E4134(v20);
  uint64_t v4 = *v3;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v5, *v3, v6);
  uint64_t v7 = (pxrInternal__aapl__pxrReserved__::TfToken *)objc_claimAutoreleasedReturnValue();
  id v10 = v7;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v12 = *(void *)(v3[4] + 8 * i);
      if ((v12 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v12 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v13 = NSString;
      uint64_t v14 = (atomic_uint *)(v12 & 0xFFFFFFFFFFFFFFF8);
      if ((v12 & 0xFFFFFFFFFFFFFFF8) != 0) {
        uint64_t EmptyString = (uint64_t)(v14 + 4);
      }
      else {
        uint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v7);
      }
      if (*(char *)(EmptyString + 23) < 0) {
        uint64_t EmptyString = *(void *)EmptyString;
      }
      uint64_t v16 = objc_msgSend_stringWithUTF8String_(v13, v8, EmptyString, v9);
      objc_msgSend_addObject_(v10, v17, (uint64_t)v16, v18);

      if ((v12 & 7) != 0) {
        atomic_fetch_add_explicit(v14, 0xFFFFFFFE, memory_order_release);
      }
    }
  }
  sub_2345DAC58((uint64_t)v20);
  return v10;
}

- (id)tokenArray
{
  v17[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v17);
  uint64_t v2 = (uint64_t *)sub_2345E4134(v17);
  uint64_t v3 = *v2;
  uint64_t v6 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v4, *v2, v5);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v8 = *(void *)(v2[4] + 8 * i);
      if ((v8 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v8 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v9 = [USKToken alloc];
      uint64_t v16 = v8;
      if ((v8 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v16 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v12 = objc_msgSend_initWithTfToken_(v9, v10, (uint64_t)&v16, v11);
      objc_msgSend_addObject_(v6, v13, (uint64_t)v12, v14);

      if ((v16 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v16 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if ((v8 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
    }
  }
  sub_2345DAC58((uint64_t)v17);
  return v6;
}

- (id)tokenArrayAtTime:(double)a3
{
  void v18[2] = *MEMORY[0x263EF8340];
  sub_2346155A8(&self->_property._type, v18);
  uint64_t v3 = (uint64_t *)sub_2345E4134(v18);
  uint64_t v4 = *v3;
  uint64_t v7 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v5, *v3, v6);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v9 = *(void *)(v3[4] + 8 * i);
      if ((v9 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v9 &= 0xFFFFFFFFFFFFFFF8;
      }
      id v10 = [USKToken alloc];
      uint64_t v17 = v9;
      if ((v9 & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v17 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v13 = objc_msgSend_initWithTfToken_(v10, v11, (uint64_t)&v17, v12);
      objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15);

      if ((v17 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if ((v9 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
    }
  }
  sub_2345DAC58((uint64_t)v18);
  return v7;
}

- (id)objectPath
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_234617AA0((uint64_t)&self->_property, (uint64_t)&v4);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v4))
  {
    memset(v3, 0, sizeof(v3));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    uint64_t v6 = (void **)v3;
    sub_2345EC2C4(&v6);
  }
  if ((BYTE8(v5) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v5 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v5);
  if (*((void *)&v4 + 1)) {
    sub_2346091F8(*((uint64_t *)&v4 + 1));
  }
  return 0;
}

- (id)objectPathArray
{
  p_property = &self->_property;
  if (p_property->_type != 4) {
    goto LABEL_9;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  sub_234617AA0((uint64_t)p_property, (uint64_t)&v12);
  int v4 = sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v12);
  char v5 = v4;
  if (v4)
  {
    memset(v11, 0, sizeof(v11));
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    uint64_t v2 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v6, 0, v7);
    sub_2345F7B80(v9);
    *(void *)&v9[0] = v11;
    sub_2345EC2C4((void ***)v9);
  }
  if ((BYTE8(v13) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v13);
  if (*((void *)&v12 + 1)) {
    sub_2346091F8(*((uint64_t *)&v12 + 1));
  }
  if ((v5 & 1) == 0) {
LABEL_9:
  }
    uint64_t v2 = objc_opt_new();
  return v2;
}

- (id)targetObject
{
  long long v5 = 0u;
  long long v6 = 0u;
  sub_234617AA0((uint64_t)&self->_property, (uint64_t)&v5);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v5))
  {
    memset(v4, 0, sizeof(v4));
    pxrInternal__aapl__pxrReserved__::UsdRelationship::GetTargets();
    *(void *)&long long v3 = v4;
    sub_2345EC2C4((void ***)&v3);
  }
  if ((BYTE8(v6) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v6 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v6);
  if (*((void *)&v5 + 1)) {
    sub_2346091F8(*((uint64_t *)&v5 + 1));
  }
  return 0;
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4
{
  return sub_23461C9B8(&self->_property._type, a3, a4);
}

- (unint64_t)floatArray:(float *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461C9B8(&self->_property._type, a3, a4);
}

- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461CB40(&self->_property._type, v2, v3);
}

- (unint64_t)float2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461CB40(&self->_property._type, v2, v3);
}

- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461CCC8(&self->_property._type, v2, v3);
}

- (unint64_t)float3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461CCC8(&self->_property._type, v2, v3);
}

- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461CE7C(&self->_property._type, v2, v3);
}

- (unint64_t)float4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461CE7C(&self->_property._type, v2, v3);
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_23461D004(&self->_property._type, a3, a4);
}

- (unint64_t)float4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461D004(&self->_property._type, a3, a4);
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4
{
  return sub_23461D18C(&self->_property._type, a3, a4);
}

- (unint64_t)doubleArray:(double *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461D18C(&self->_property._type, a3, a4);
}

- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461D314(&self->_property._type, v2, v3);
}

- (unint64_t)double2Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461D314(&self->_property._type, v2, v3);
}

- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461D49C(&self->_property._type, v2, v3);
}

- (unint64_t)double3Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461D49C(&self->_property._type, v2, v3);
}

- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2
{
  return sub_23461D660(&self->_property._type, v2, v3);
}

- (unint64_t)double4Array:(USKProperty *)self maxCount:(SEL)a2 atTime:
{
  return sub_23461D660(&self->_property._type, v2, v3);
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4
{
  return sub_23461D7E8(&self->_property._type, a3, a4);
}

- (unint64_t)double4x4Array:(id *)a3 maxCount:(unint64_t)a4 atTime:(double)a5
{
  return sub_23461D7E8(&self->_property._type, a3, a4);
}

- (void)setData:(id)a3
{
  _OWORD v9[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend_value(v4, v5, v6, v7);
  }
  else
  {
    v9[0] = 0;
    v9[1] = 0;
  }
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v9);
  sub_2345DAC58((uint64_t)v9);
}

- (void)setData:(id)a3 atTime:(double)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = v5;
  if (v5)
  {
    objc_msgSend_value(v5, v6, v7, v8);
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
  }
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v10);
  sub_2345DAC58((uint64_t)v10);
}

- (void)setTokenValue:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend_token(v4, v5, v6, v7);
    unint64_t v10 = v9;
    uint64_t v11 = (char *)&off_26E762990 + 1;
    if ((v9 & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFF8;
    }
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = (char *)&off_26E762990 + 1;
  }
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v10);
  sub_2345DAC58((uint64_t)&v10);
  if ((v9 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
}

- (void)setStringValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = (char *)objc_msgSend_UTF8String(v3, v4, v5, v6);
  uint64_t v9 = 0;
  sub_2345F12A4((uint64_t)v8, &v7);
}

- (void)setTimeCodeValue:(id)a3
{
  v6[2] = *MEMORY[0x263EF8340];
  objc_msgSend_sdfTimeCode(a3, a2, (uint64_t)a3, v3);
  v6[1] = (char *)&off_26E762C80 + 1;
  v6[0] = v5;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v6);
  sub_2345DAC58((uint64_t)v6);
}

- (void)setBoolValue:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v4 = &unk_26E762D3B;
  v3[0] = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2345DAC58((uint64_t)v3);
}

- (void)setIntValue:(int)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v4 = &unk_26E762DF3;
  int v3 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2345DAC58((uint64_t)&v3);
}

- (void)setUIntValue:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v4 = &unk_26E762EAB;
  unsigned int v3 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2345DAC58((uint64_t)&v3);
}

- (void)setUIntValue:(unsigned int)a3 atTime:(double)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762EAB;
  unsigned int v4 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v4);
  sub_2345DAC58((uint64_t)&v4);
}

- (void)setDoubleValue:(double)a3
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[1] = &unk_26E763243;
  *(double *)unsigned int v3 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2345DAC58((uint64_t)v3);
}

- (void)setDoubleValue:(double)a3 atTime:(double)a4
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = &unk_26E763243;
  *(double *)unsigned int v4 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v4);
  sub_2345DAC58((uint64_t)v4);
}

- (void)setDouble2Value:(USKProperty *)self
{
}

- (void)setDouble2Value:(double)a3 atTime:
{
}

- (void)setDouble3Value:(USKProperty *)self
{
}

- (void)setDouble3Value:(double)a3 atTime:
{
}

- (void)setDouble4Value:(USKProperty *)self
{
}

- (void)setDouble4Value:(double)a3 atTime:
{
}

- (void)setDouble4x4Value:
{
}

- (void)setDouble4x4Value:atTime:
{
}

- (void)setFloatValue:(float)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unsigned int v4 = &unk_26E762F63;
  float v3 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v3);
  sub_2345DAC58((uint64_t)&v3);
}

- (void)setFloatValue:(float)a3 atTime:(double)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = &unk_26E762F63;
  float v4 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v4);
  sub_2345DAC58((uint64_t)&v4);
}

- (void)setFloat2Value:(USKProperty *)self
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[1] = (char *)&off_26E763018 + 3;
  v3[0] = v2;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2345DAC58((uint64_t)v3);
}

- (void)setFloat2Value:(double)a3 atTime:
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[1] = (char *)&off_26E763018 + 3;
  *(double *)float v3 = a3;
  sub_23461D950(&self->_property._type, (pxrInternal__aapl__pxrReserved__::VtValue *)v3);
  sub_2345DAC58((uint64_t)v3);
}

- (void)setFloat3Value:(USKProperty *)self
{
}

- (void)setFloat3Value:(double)a3 atTime:
{
}

- (void)setFloat4Value:(USKProperty *)self
{
}

- (void)setFloat4Value:(double)a3 atTime:
{
}

- (void)setQuatfValue:
{
}

- (void)setQuatfValue:atTime:
{
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4
{
}

- (void)setIntArray:(int *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setUIntArray:(unsigned int *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4
{
}

- (void)setQuatfArray:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setStringArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v21 = 0;
  unint64_t v7 = objc_msgSend_count(v3, v4, v5, v6, 0, 0, 0, 0);
  sub_2345E77BC((uint64_t)&v20, v7);
  uint64_t v11 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v3, v8, v9, v10); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v3, v13, i, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_UTF8String(v15, v16, v17, v18);
    sub_2345F6908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v20);
    MEMORY[0x237DC3120](v21 + v11, v19);

    v11 += 24;
  }
  id v22 = &off_26E7638B8;
  sub_2345DEAC0();
}

- (void)setStringArray:(id)a3 atTime:(double)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v22 = 0;
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7, 0, 0, 0, 0);
  sub_2345E77BC((uint64_t)&v21, v8);
  uint64_t v12 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
    sub_2345F6908((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v21);
    MEMORY[0x237DC3120](v22 + v12, v20);

    v12 += 24;
  }
  uint64_t v23 = &off_26E7638B8;
  sub_2345DEAC0();
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
      void *v20 = v22;
      uint64_t v22 = 0;
    }
    if ((v21 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }

    v11 += 8;
  }
  unint64_t v25 = &off_26E763970;
  sub_2345DEAC0();
}

- (void)setTokenArray:(id)a3 atTime:(double)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);
  sub_2345E7854((uint64_t)v24, v8);
  uint64_t v12 = 0;
  for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
  {
    id v16 = objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
    uint64_t v20 = v16;
    if (v16) {
      objc_msgSend_token(v16, v17, v18, v19);
    }
    else {
      uint64_t v23 = 0;
    }
    sub_2345F7418((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v24);
    uint64_t v21 = (void *)(v25 + v12);
    if ((uint64_t *)(v25 + v12) == &v23)
    {
      uint64_t v22 = v23;
    }
    else
    {
      if ((*v21 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(*v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      uint64_t v22 = 0;
      void *v21 = v23;
      uint64_t v23 = 0;
    }
    if ((v22 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }

    v12 += 8;
  }
  uint64_t v26 = &off_26E763970;
  sub_2345DEAC0();
}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4
{
}

- (void)setFloatArray:(float *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2
{
  sub_234620954((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat2Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_234620954((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2
{
  sub_234620AA8((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat3Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_234620AA8((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2
{
  sub_234620C2C((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat4Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_234620C2C((uint64_t)&self->_property, v2, v3);
}

- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4
{
}

- (void)setFloat4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4
{
}

- (void)setDoubleArray:(double *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2
{
  sub_234621028((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble2Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_234621028((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2
{
  sub_23462117C((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble3Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_23462117C((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2
{
  sub_234621300((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble4Array:(USKProperty *)self count:(SEL)a2 atTime:
{
  sub_234621300((uint64_t)&self->_property, v2, v3);
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4
{
}

- (void)setDouble4x4Array:(id *)a3 count:(unint64_t)a4 atTime:(double)a5
{
}

- (void)setObjectPathArray:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  sub_234617AA0((uint64_t)&self->_property, (uint64_t)&v27);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v27))
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_234617650(&v24, v8);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v30, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (v17) {
            objc_msgSend_path(v17, v11, v12, v13, (void)v20);
          }
          else {
            uint64_t v29 = 0;
          }
          uint64_t v18 = v25;
          if ((unint64_t)v25 >= v26)
          {
            uint64_t v19 = (_DWORD *)sub_234622390(&v24, &v29);
          }
          else
          {
            sub_2345EC01C(v25, &v29);
            sub_2345EC058(v18 + 1, (_DWORD *)&v29 + 1);
            uint64_t v19 = v18 + 2;
          }
          uint64_t v25 = v19;
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2345EBD10((uint64_t)&v29);
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v20, (uint64_t)v30, 16);
      }
      while (v14);
    }

    pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
    uint64_t v29 = (void **)&v24;
    sub_2345EC2C4(&v29);
  }
  if ((BYTE8(v28) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v28);
  if (*((void *)&v27 + 1)) {
    sub_2346091F8(*((uint64_t *)&v27 + 1));
  }
}

- (void)setObjectPath:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  sub_234617AA0((uint64_t)&self->_property, (uint64_t)&v11);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v11))
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    if (v4) {
      objc_msgSend_path(v4, v5, v6, v7);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v9 = sub_234622390(&v8, &v13);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13);
    pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
    uint64_t v13 = (void **)&v8;
    sub_2345EC2C4(&v13);
  }
  if ((BYTE8(v12) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v12 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v12);
  if (*((void *)&v11 + 1)) {
    sub_2346091F8(*((uint64_t *)&v11 + 1));
  }
}

- (void)setURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v14);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v14))
  {
    objc_msgSend_relativeString(v4, v5, v6, v7, 0, 0, 0, 0, 0, 0);
    id v8 = objc_claimAutoreleasedReturnValue();
    long long v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    sub_2345DB968(v16, v12);
    MEMORY[0x237DC1F40](v13, v16);
    if (v17 < 0) {
      operator delete(v16[0]);
    }

    v16[1] = &off_26E762BC8;
    sub_2345F21A0();
  }
  if ((BYTE8(v15) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v15 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15);
  if (*((void *)&v14 + 1)) {
    sub_2346091F8(*((uint64_t *)&v14 + 1));
  }
}

- (void)setResourcePath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v11);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v11))
  {
    id v5 = v4;
    uint64_t v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8, 0, 0, 0, 0, 0, 0);
    sub_2345DB968(v13, v9);
    MEMORY[0x237DC1F40](v10, v13);
    if (v14 < 0) {
      operator delete(v13[0]);
    }
    v13[1] = &off_26E762BC8;
    sub_2345F21A0();
  }
  if ((BYTE8(v12) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v12 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v12);
  if (*((void *)&v11 + 1)) {
    sub_2346091F8(*((uint64_t *)&v11 + 1));
  }
}

- (void)setResourcePathArray:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  sub_23460B484((uint64_t)&self->_property, (uint64_t)&v29);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v29))
  {
    uint64_t v28 = 0;
    memset(v27, 0, sizeof(v27));
    unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);
    sub_2345E79B0((uint64_t)v27, v8);
    uint64_t v12 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v4, v9, v10, v11); ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i, v15);
      id v16 = objc_claimAutoreleasedReturnValue();
      long long v20 = (char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
      sub_2345DB968(v25, v20);
      MEMORY[0x237DC1F40](__p, v25);
      sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v27);
      uint64_t v21 = v28 + v12;
      if (*(char *)(v28 + v12 + 23) < 0) {
        operator delete(*(void **)v21);
      }
      long long v22 = *(_OWORD *)__p;
      *(void *)(v21 + 16) = v32;
      *(_OWORD *)uint64_t v21 = v22;
      HIBYTE(v32) = 0;
      LOBYTE(__p[0]) = 0;
      long long v23 = (void **)(v21 + 24);
      if (*(char *)(v21 + 47) < 0) {
        operator delete(*v23);
      }
      long long v24 = v33;
      *(void *)(v21 + 40) = v34;
      *(_OWORD *)long long v23 = v24;
      HIBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v32) < 0) {
        operator delete(__p[0]);
      }
      if (v26 < 0) {
        operator delete(v25[0]);
      }

      v12 += 48;
    }
    __p[1] = &off_26E763AF8;
    sub_2345DEAC0();
  }
  if ((BYTE8(v30) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v30 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v30);
  if (*((void *)&v29 + 1)) {
    sub_2346091F8(*((uint64_t *)&v29 + 1));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (USKProperty *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_usdProperty(v5, v6, v7, v8);
    BOOL v9 = self->_property._type == v11
      && self->_property._prim._p.px == v12
      && self->_property._proxyPrimPath._primPart._poolHandle == v13
      && ((unint64_t)self->_property._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == (v14 & 0xFFFFFFFFFFFFFFF8);
    if ((v14 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13);
    if (v12) {
      sub_2346091F8((uint64_t)v12);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3[0] = 0;
  v3[1] = 0;
  sub_234622270((uint64_t)v3, (unsigned int *)&self->_property, &self->_property._prim._p.px, (unsigned int *)&self->_property._proxyPrimPath, &self->_property._proxyPrimPath._propPart._poolHandle);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneOwner, 0);
  objc_storeStrong((id *)&self->_property._propName._rep._ptrAndBits, 0);
  p_property = &self->_property;
  Handle poolHandle = p_property->_proxyPrimPath._propPart._poolHandle;
  if ((poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&p_property->_proxyPrimPath);
  uint64_t px = (uint64_t)p_property->_prim._p.px;
  if (px)
  {
    sub_2346091F8(px);
  }
}

- (id).cxx_construct
{
  p_property = &self->_property;
  self->_property._type = 2;
  self->_property._prim._p.uint64_t px = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  p_property->_proxyPrimPath._propPart._Handle poolHandle = 0;
  return self;
}

@end