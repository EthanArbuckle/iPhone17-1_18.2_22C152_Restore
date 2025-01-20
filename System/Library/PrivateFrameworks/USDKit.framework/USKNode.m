@interface USKNode
- (BOOL)clearVariantSelectionForVariantSet:(id)a3;
- (BOOL)editVariant:(id)a3 variantSet:(id)a4 block:(id)a5;
- (BOOL)hasSchemaType:(id)a3;
- (BOOL)hasVariantSet:(id)a3;
- (BOOL)hasVariantSets;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstanceNode;
- (BOOL)removeProperty:(id)a3;
- (BOOL)selectVariant:(id)a3 variantSet:(id)a4;
- (BOOL)setCustomMetadata:(id)a3 value:(id)a4;
- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5;
- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4;
- (NSArray)schemaTypes;
- (NSDictionary)properties;
- (NSString)type;
- (USKNode)initWithUsdPrim:(UsdPrim *)a3;
- (USKNode)initWithUsdPrim:(UsdPrim *)a3 withSceneOwner:(id)a4;
- (USKToken)typeName;
- (UsdPrim)usdPrim;
- (id).cxx_construct;
- (id)childIterator;
- (id)createUniqueGeomSubset:(id)a3 elementType:(id)a4 indices:(id)a5 familyName:(id)a6 familyType:(id)a7;
- (id)customMetadataWithKey:(id)a3;
- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4;
- (id)getAllGeomSubsets;
- (id)getGeomSubsetElementTypeAttr;
- (id)getGeomSubsetFamilyName;
- (id)getGeomSubsetIndicesAttr;
- (id)getGeomSubsets:(id)a3 familyName:(id)a4;
- (id)inheritedMaterialBinding;
- (id)inheritedProperty:(id)a3;
- (id)inheritedSkeletonAnimationBinding;
- (id)inheritedSkeletonBinding;
- (id)loadedChildIterator;
- (id)loadedSubtreeIterator;
- (id)masterNode;
- (id)metadata;
- (id)metadataWithKey:(id)a3;
- (id)name;
- (id)newCustomPropertyWithName:(id)a3 type:(id)a4 role:(id)a5;
- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5;
- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5 variability:(BOOL)a6;
- (id)parent;
- (id)path;
- (id)property:(id)a3;
- (id)propertyList;
- (id)specifier;
- (id)subtreeIterator;
- (id)variantSets;
- (id)variantsWithVariantSet:(id)a3;
- (unint64_t)hash;
- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4;
- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4 offset:(id)a5;
- (void)addReferenceWithURL:(id)a3 nodePath:(id)a4;
- (void)addVariant:(id)a3 variantSet:(id)a4;
- (void)addVariantSet:(id)a3;
- (void)applyType:(id)a3;
- (void)clearReferences;
- (void)setSpecifier:(id)a3;
@end

@implementation USKNode

- (USKNode)initWithUsdPrim:(UsdPrim *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)USKNode;
  v4 = [(USKNode *)&v9 init];
  if (v4 && (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v4->_prim._type = a3->_type;
    px = a3->_prim._p.px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    uint64_t v6 = (uint64_t)v4->_prim._prim._p.px;
    v4->_prim._prim._p.px = px;
    if (v6) {
      sub_2346091F8(v6);
    }
    sub_2345EE430((uint64_t)&v4->_prim._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2345EE488((uint64_t)&v4->_prim._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2345EC46C(&v4->_prim._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (USKNode)initWithUsdPrim:(UsdPrim *)a3 withSceneOwner:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)USKNode;
  v8 = [(USKNode *)&v13 init];
  if (v8 && (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)a3) & 1) != 0)
  {
    v8->_prim._type = a3->_type;
    px = a3->_prim._p.px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = (uint64_t)v8->_prim._prim._p.px;
    v8->_prim._prim._p.px = px;
    if (v10) {
      sub_2346091F8(v10);
    }
    sub_2345EE430((uint64_t)&v8->_prim._proxyPrimPath, &a3->_proxyPrimPath);
    sub_2345EE488((uint64_t)&v8->_prim._proxyPrimPath._primPart._poolHandle + 4, (_DWORD *)&a3->_proxyPrimPath._primPart._poolHandle + 1);
    sub_2345EC46C(&v8->_prim._proxyPrimPath._propPart._poolHandle, &a3->_proxyPrimPath._propPart._poolHandle);
    objc_storeStrong((id *)&v8->_prim._propName._rep._ptrAndBits, a4);
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UsdPrim)usdPrim
{
  p_prim = &self->_prim;
  retstr->_type = self->_prim._type;
  px = self->_prim._prim._p.px;
  retstr->_prim._p.px = px;
  if (px) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
  }
  sub_2345EBC84(&retstr->_proxyPrimPath, &self->_prim._proxyPrimPath);
  result = (UsdPrim *)sub_2345EBCD0((_DWORD *)&retstr->_proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&p_prim->_proxyPrimPath._primPart._poolHandle + 1);
  poolHandle = p_prim->_proxyPrimPath._propPart._poolHandle;
  retstr->_proxyPrimPath._propPart._poolHandle = poolHandle;
  if ((poolHandle & 7) != 0
    && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
  {
    retstr->_proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)retstr->_proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
  }
  return result;
}

- (id)createUniqueGeomSubset:(id)a3 elementType:(id)a4 indices:(id)a5 familyName:(id)a6 familyType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v19 = a7;
  if (v12)
  {
    objc_msgSend_token(v12, v16, v17, v18);
    uint64_t v20 = *(void *)&v48[0];
  }
  else
  {
    uint64_t v20 = 0;
    *(void *)&v48[0] = 0;
  }
  unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFF8;
  if ((v20 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    if (*(char *)(v21 + 39) < 0) {
      uint64_t v22 = *(void *)(v21 + 24);
    }
    else {
      uint64_t v22 = *(unsigned __int8 *)(v21 + 39);
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  if ((v20 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)v21, 0xFFFFFFFE, memory_order_release);
  }
  if (v22)
  {
    if (v13)
    {
      objc_msgSend_token(v13, v16, v17, v18);
      uint64_t v23 = *(void *)&v48[0];
    }
    else
    {
      uint64_t v23 = 0;
      *(void *)&v48[0] = 0;
    }
    unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFF8;
    if ((v23 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      if (*(char *)(v24 + 39) < 0) {
        uint64_t v25 = *(void *)(v24 + 24);
      }
      else {
        uint64_t v25 = *(unsigned __int8 *)(v24 + 39);
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    if ((v23 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)v24, 0xFFFFFFFE, memory_order_release);
    }
    if (v25)
    {
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v26 = pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v50, &self->_prim);
      uint64_t v50 = MEMORY[0x263F90728] + 16;
      if (!v51
        || (*(unsigned char *)(v51 + 57) & 8) != 0
        || ((*(uint64_t (**)(uint64_t))(MEMORY[0x263F90728] + 48))(v26) & 1) == 0)
      {
LABEL_36:
        MEMORY[0x237DC2180](&v50);
        goto LABEL_37;
      }
      id v27 = v14;
      uint64_t v31 = objc_msgSend_bytes(v27, v28, v29, v30);
      unint64_t v35 = objc_msgSend_length(v27, v32, v33, v34);
      unint64_t v36 = v35 >> 3;
      uint64_t v49 = 0;
      memset(v48, 0, sizeof(v48));
      sub_2345D7A70((uint64_t)v48, v35 >> 3);
      if (v35 >= 8)
      {
        uint64_t v40 = 0;
        if (v36 <= 1) {
          unint64_t v36 = 1;
        }
        do
        {
          uint64_t v41 = *(void *)(v31 + 8 * v40);
          sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v48);
          *(_DWORD *)(v49 + 4 * v40++) = v41;
        }
        while (v36 != v40);
      }
      memset(v47, 0, sizeof(v47));
      if (v12)
      {
        objc_msgSend_token(v12, v37, v38, v39);
        if (v13) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v46 = 0;
        if (v13)
        {
LABEL_32:
          objc_msgSend_token(v13, v37, v38, v39);
          if (v15) {
            goto LABEL_33;
          }
          goto LABEL_42;
        }
      }
      uint64_t v45 = 0;
      if (v15)
      {
LABEL_33:
        objc_msgSend_token(v15, v37, v38, v39);
        if (v19)
        {
LABEL_34:
          objc_msgSend_token(v19, v37, v38, v39);
LABEL_44:
          pxrInternal__aapl__pxrReserved__::UsdGeomSubset::CreateUniqueGeomSubset();
          if ((v43 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v43 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          if ((v44 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v44 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          if ((v45 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          if ((v46 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v46 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          MEMORY[0x237DC1FE0](v47);
          sub_2345D9DC0((uint64_t)v48);
          goto LABEL_36;
        }
LABEL_43:
        uint64_t v43 = 0;
        goto LABEL_44;
      }
LABEL_42:
      uint64_t v44 = 0;
      if (v19) {
        goto LABEL_34;
      }
      goto LABEL_43;
    }
  }
LABEL_37:

  return 0;
}

- (id)getAllGeomSubsets
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v8, &self->_prim);
  uint64_t v8 = MEMORY[0x263F90728] + 16;
  if (v9
    && (*(unsigned char *)(v9 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x263F90728] + 48))(&v8) & 1) != 0)
  {
    memset(v7, 0, sizeof(v7));
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetAllGeomSubsets();
    id v2 = objc_alloc(MEMORY[0x263EFF980]);
    v5 = objc_msgSend_initWithCapacity_(v2, v3, 0, v4);
    v11 = (void **)v7;
    sub_234612F60(&v11);
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x237DC2180](&v8);
  return v5;
}

- (id)getGeomSubsets:(id)a3 familyName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v22, &self->_prim);
  uint64_t v22 = MEMORY[0x263F90728] + 16;
  if (!v23
    || (*(unsigned char *)(v23 + 57) & 8) != 0
    || ((*(uint64_t (**)(uint64_t *))(MEMORY[0x263F90728] + 48))(&v22) & 1) == 0)
  {
    v11 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v16 = v7;
  id v17 = v6;
  if (!v6)
  {
    unint64_t v25 = 0;
    if (v7) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  objc_msgSend_token(v6, v8, v9, v10);
  if (!v7) {
    goto LABEL_12;
  }
LABEL_6:
  objc_msgSend_token(v7, v8, v9, v10, v7, v6);
LABEL_13:
  pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetGeomSubsets();
  if ((v18 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v18 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v25 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v25 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  id v13 = objc_alloc(MEMORY[0x263EFF980]);
  v11 = objc_msgSend_initWithCapacity_(v13, v14, 0xAAAAAAAAAAAAAAABLL * ((v20 - v19) >> 3), v15);
  unint64_t v25 = (unint64_t)&v19;
  sub_234612F60((void ***)&v25);
  id v7 = v16;
  id v6 = v17;
LABEL_8:
  MEMORY[0x237DC2180](&v22);

  return v11;
}

- (id)getGeomSubsetIndicesAttr
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v14, &self->_prim);
  uint64_t v14 = MEMORY[0x263F906E0] + 16;
  if (v15
    && (*(unsigned char *)(v15 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x263F906E0] + 48))(&v14) & 1) != 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetIndicesAttr((uint64_t *)&v12, (pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v14);
    id v2 = [USKProperty alloc];
    int v7 = v12;
    uint64_t v8 = *((void *)&v12 + 1);
    if (*((void *)&v12 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v9, &v13);
    sub_2345EBCD0(&v10, (_DWORD *)&v13 + 1);
    uint64_t v11 = *((void *)&v13 + 1);
    if ((BYTE8(v13) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v11 &= 0xFFFFFFFFFFFFFFF8;
    }
    v5 = objc_msgSend_initWithUsdProperty_(v2, v3, (uint64_t)&v7, v4);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v9);
    if (v8) {
      sub_2346091F8(v8);
    }
    if ((BYTE8(v13) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13);
    if (*((void *)&v12 + 1)) {
      sub_2346091F8(*((uint64_t *)&v12 + 1));
    }
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x237DC1FE0](&v14);
  return v5;
}

- (id)getGeomSubsetElementTypeAttr
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v14, &self->_prim);
  uint64_t v14 = MEMORY[0x263F906E0] + 16;
  if (v15
    && (*(unsigned char *)(v15 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t *))(MEMORY[0x263F906E0] + 48))(&v14) & 1) != 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetElementTypeAttr((uint64_t *)&v12, (pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v14);
    id v2 = [USKProperty alloc];
    int v7 = v12;
    uint64_t v8 = *((void *)&v12 + 1);
    if (*((void *)&v12 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v9, &v13);
    sub_2345EBCD0(&v10, (_DWORD *)&v13 + 1);
    uint64_t v11 = *((void *)&v13 + 1);
    if ((BYTE8(v13) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v11 &= 0xFFFFFFFFFFFFFFF8;
    }
    v5 = objc_msgSend_initWithUsdProperty_(v2, v3, (uint64_t)&v7, v4);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v9);
    if (v8) {
      sub_2346091F8(v8);
    }
    if ((BYTE8(v13) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13);
    if (*((void *)&v12 + 1)) {
      sub_2346091F8(*((uint64_t *)&v12 + 1));
    }
  }
  else
  {
    v5 = 0;
  }
  MEMORY[0x237DC1FE0](&v14);
  return v5;
}

- (id)getGeomSubsetFamilyName
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v2 = pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v6, &self->_prim);
  uint64_t v6 = MEMORY[0x263F906E0] + 16;
  if (v7
    && (*(unsigned char *)(v7 + 57) & 8) == 0
    && ((*(uint64_t (**)(uint64_t))(MEMORY[0x263F906E0] + 48))(v2) & 1) != 0)
  {
    long long v4 = 0u;
    long long v5 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetFamilyNameAttr((uint64_t *)&v4, (pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)&v6);
    if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v4)) {
      pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>();
    }
    if ((BYTE8(v5) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v5 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v5);
    if (*((void *)&v4 + 1)) {
      sub_2346091F8(*((uint64_t *)&v4 + 1));
    }
  }
  MEMORY[0x237DC1FE0](&v6);
  return 0;
}

- (void)applyType:(id)a3
{
  id v4 = a3;
  long long v38 = 0u;
  uint64_t v39 = 0;
  LODWORD(v38) = 1;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  uint64_t v40 = 0;
  if (objc_msgSend_isEqualToString_(v4, v5, @"SkelBindingAPI", v6))
  {
    pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::Apply(v37, (pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)&self->_prim, v7);
    MEMORY[0x237DC2220](v37);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v7, @"Preliminary_AnchoringAPI", v8))
  {
    pxrInternal__aapl__pxrReserved__::UsdInteractivePreliminary_AnchoringAPI::Apply(v36, (pxrInternal__aapl__pxrReserved__::UsdInteractivePreliminary_AnchoringAPI *)&self->_prim, v9);
    MEMORY[0x237DC2450](v36);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v9, @"MaterialBindingAPI", v10))
  {
    pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::Apply(v35, (pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&self->_prim, v11);
    MEMORY[0x237DC2390](v35);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v11, @"Preliminary_PhysicsColliderAPI", v12))
  {
    pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsColliderAPI::Apply(v34, (pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsColliderAPI *)&self->_prim, v13);
    MEMORY[0x237DC2480](v34);
  }
  else if (objc_msgSend_isEqualToString_(v4, (const char *)v13, @"Preliminary_PhysicsMaterialAPI", v14))
  {
    pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsMaterialAPI::Apply(v33, (pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsMaterialAPI *)&self->_prim, v15);
    MEMORY[0x237DC24A0](v33);
  }
  else
  {
    p_prim = &self->_prim;
    if (objc_msgSend_isEqualToString_(v4, (const char *)v15, @"Preliminary_PhysicsRigidBodyAPI", v16))
    {
      pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsRigidBodyAPI::Apply(v32, (pxrInternal__aapl__pxrReserved__::UsdPhysicsPreliminary_PhysicsRigidBodyAPI *)p_prim, v17);
      MEMORY[0x237DC24C0](v32);
    }
    else
    {
      id v19 = v4;
      uint64_t v23 = objc_msgSend_UTF8String(v19, v20, v21, v22);
      MEMORY[0x237DC2530](&v31, v23);
      char v24 = pxrInternal__aapl__pxrReserved__::UsdPrim::AddAppliedSchema((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v31);
      if ((v31 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v31 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if ((v24 & 1) == 0)
      {
        id v25 = v19;
        uint64_t v29 = objc_msgSend_UTF8String(v25, v26, v27, v28);
        sub_234615930((uint64_t)p_prim, &v31);
        uint64_t Text = pxrInternal__aapl__pxrReserved__::SdfPath::GetText((pxrInternal__aapl__pxrReserved__::SdfPath *)&v31);
        NSLog(&cfstr_CouldNotAddApp.isa, v29, Text);
        sub_2345E32B4((uint64_t)&v31);
      }
    }
  }
  if ((v40 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v39);
  if (*((void *)&v38 + 1)) {
    sub_2346091F8(*((uint64_t *)&v38 + 1));
  }
}

- (BOOL)hasSchemaType:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_tokenWithSchemaType_(USKToken, v5, (uint64_t)v4, v6);
  uint64_t v11 = v7;
  if (v7) {
    objc_msgSend_token(v7, v8, v9, v10);
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t TypeFromName = pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::GetTypeFromName((pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry *)&v14, (const TfToken *)v8);
  char HasAPI = pxrInternal__aapl__pxrReserved__::UsdPrim::HasAPI((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfType *)&TypeFromName);
  if ((v14 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return HasAPI;
}

- (id)metadata
{
  v57[2] = *MEMORY[0x263EF8340];
  unint64_t v35 = objc_opt_new();
  v3 = objc_opt_new();
  uint64_t v52 = 0;
  v53[0] = 0;
  v53[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((uint64_t *)&v52, (pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim);
  long long v5 = v52;
  if (v52 != (uint64_t *)v53)
  {
    uint64_t v33 = *(void *)(MEMORY[0x263F8C2B8] + 64);
    uint64_t v34 = *MEMORY[0x263F8C2B8];
    uint64_t v31 = v49;
    uint64_t v32 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    do
    {
      uint64_t v56 = 0;
      v57[0] = 0;
      v57[1] = 0;
      uint64_t v6 = sub_234609250(&v56, v5 + 4);
      uint64_t v9 = NSString;
      if ((v56 & 0xFFFFFFFFFFFFFFF8) != 0) {
        uint64_t EmptyString = (v56 & 0xFFFFFFFFFFFFFFF8) + 16;
      }
      else {
        uint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v6);
      }
      if (*(char *)(EmptyString + 23) < 0) {
        uint64_t EmptyString = *(void *)EmptyString;
      }
      uint64_t v11 = objc_msgSend_stringWithUTF8String_(v9, v7, EmptyString, v8, v31);
      objc_msgSend_addObject_(v35, v12, (uint64_t)v11, v13);

      uint64_t v51 = 0;
      uint64_t v14 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
      if (!v14) {
        pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      }
      __p[0] = 0;
      *(void *)&long long v41 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v14, (const pxrInternal__aapl__pxrReserved__::VtValue *)v57, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v51, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v41);
      if (((uint64_t)__p[0] & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if (v51)
      {
        uint64_t v15 = [USKData alloc];
        sub_2345DDDA0(v54, v57);
        uint64_t v36 = v51;
        if ((v51 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v51 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v36 &= 0xFFFFFFFFFFFFFFF8;
        }
        id v17 = objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v15, v16, (uint64_t)v54, (uint64_t)&v36, self);
        objc_msgSend_addObject_(v3, v18, (uint64_t)v17, v19);

        if ((v36 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v36 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v54);
      }
      else
      {
        uint64_t v50 = 0;
        long long v48 = 0u;
        memset(v49, 0, sizeof(v49));
        *(_OWORD *)uint64_t v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v41 = 0u;
        sub_2345E11F4((uint64_t)&v41);
        pxrInternal__aapl__pxrReserved__::operator<<();
        uint64_t v20 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x237DC2540](&v40, __p);
        v55[0] = v40;
        v55[1] = (char *)&off_26E762990 + 1;
        if ((v40 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v55[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        uint64_t v21 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x263F90560]);
        if (!v21) {
          uint64_t v21 = sub_2345DEBD0(MEMORY[0x263F90560]);
        }
        pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v37, (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)((char *)v21 + 88));
        uint64_t v23 = objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v20, v22, (uint64_t)v55, (uint64_t)&v37, self);
        objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

        if ((v37 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v37 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v55);
        if ((v40 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if (v39 < 0) {
          operator delete(__p[0]);
        }
        *(void *)&long long v41 = v34;
        *(void *)((char *)&v41 + *(void *)(v34 - 24)) = v33;
        *(void *)&long long v42 = v32;
        *((void *)&v42 + 1) = MEMORY[0x263F8C318] + 16;
        if (SHIBYTE(v47) < 0) {
          operator delete(v46[1]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x237DC3250](v31);
      }
      if ((v51 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v51 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      sub_2345DAC58((uint64_t)v57);
      if ((v56 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v56 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      uint64_t v26 = (uint64_t *)v5[1];
      if (v26)
      {
        do
        {
          uint64_t v27 = v26;
          uint64_t v26 = (uint64_t *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          uint64_t v27 = (uint64_t *)v5[2];
          BOOL v28 = *v27 == (void)v5;
          long long v5 = v27;
        }
        while (!v28);
      }
      long long v5 = v27;
    }
    while (v27 != (uint64_t *)v53);
  }
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_(NSDictionary, v4, (uint64_t)v3, (uint64_t)v35);
  sub_234609D58((uint64_t)&v52, v53[0]);

  return v29;
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
      char v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
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
      char v23 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
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
      char v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v35, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
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
      char v33 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v35, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v39);
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
  char v19 = pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v22, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v21, (const pxrInternal__aapl__pxrReserved__::VtValue *)v23);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v17, (pxrInternal__aapl__pxrReserved__::VtValue *)&v19);
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
    uint64_t v12 = objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v9, v11, (uint64_t)v18, (uint64_t)&v16, self);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v26, (const pxrInternal__aapl__pxrReserved__::TfToken *)&Type, (pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
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
    uint64_t v21 = objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v18, v20, (uint64_t)v27, (uint64_t)&v24, self);
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
  pxrInternal__aapl__pxrReserved__::UsdObject::GetMetadataByDictKey((pxrInternal__aapl__pxrReserved__::UsdObject *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v5 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19, (pxrInternal__aapl__pxrReserved__::VtValue *)&v21);
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
    uint64_t v14 = objc_msgSend_initWithVtValue_typeName_withNodeOwner_(v11, v13, (uint64_t)v20, (uint64_t)&v18, self);
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

- (void)addReferenceWithURL:(id)a3 nodePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v26, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    objc_msgSend_relativeString(v6, v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    sub_2345DB968(__p, v15);
    if (v7) {
      objc_msgSend_path(v7, v16, v17, v18);
    }
    else {
      uint64_t v23 = 0;
    }
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v22, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v23);
    if (v25 < 0) {
      operator delete(__p[0]);
    }

    if ((v29 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v29 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v26, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    sub_2345DB968(__p, "");
    if (v7) {
      objc_msgSend_path(v7, v19, v20, v21);
    }
    else {
      uint64_t v23 = 0;
    }
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v22, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v23);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    if ((v29 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v29 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v28);
  if (v27) {
    sub_2346091F8(v27);
  }
}

- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v23, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    id v8 = v6;
    uint64_t v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
    sub_2345DB968(__p, v12);
    if (v7) {
      objc_msgSend_path(v7, v13, v14, v15);
    }
    else {
      uint64_t v20 = 0;
    }
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v19, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v20);
    if (v22 < 0) {
      operator delete(__p[0]);
    }
    if ((v26 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v26 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v23, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    sub_2345DB968(__p, "");
    if (v7) {
      objc_msgSend_path(v7, v16, v17, v18);
    }
    else {
      uint64_t v20 = 0;
    }
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v19, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v20);
    if (v22 < 0) {
      operator delete(__p[0]);
    }
    if ((v26 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v26 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v25);
  if (v24) {
    sub_2346091F8(v24);
  }
}

- (void)addReferenceWithPath:(id)a3 nodePath:(id)a4 offset:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v31 = 0;
  sub_2345DB968(__p, "");
  if (v8)
  {
    id v11 = v8;
    uint64_t v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
    MEMORY[0x237DC3120](__p, v15);
  }
  if (v10)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v26, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    if (v9) {
      objc_msgSend_path(v9, v16, v17, v18);
    }
    else {
      uint64_t v25 = 0;
    }
    objc_msgSend_sdfLayerOffset(v10, v16, v17, v18);
    v24[0] = v22;
    v24[1] = v23;
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v25);
    if ((v29 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v29 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v26, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
    if (v9) {
      objc_msgSend_path(v9, v19, v20, v21);
    }
    else {
      uint64_t v25 = 0;
    }
    pxrInternal__aapl__pxrReserved__::SdfLayerOffset::SdfLayerOffset((pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v24, 0.0, 1.0);
    pxrInternal__aapl__pxrReserved__::UsdReferences::AddReference();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v25);
    if ((v29 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v29 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2345EBD10((uint64_t)&v28);
  if (v27) {
    sub_2346091F8(v27);
  }
  if (SHIBYTE(v31) < 0) {
    operator delete(__p[0]);
  }
}

- (void)clearReferences
{
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetReferences(&v2, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  MEMORY[0x237DC2000](&v2);
  if ((v5 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v5 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v4);
  if (v3) {
    sub_2346091F8(v3);
  }
}

- (void)addVariantSet:(id)a3
{
  id v4 = a3;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets(&v12, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v5 = v4;
  id v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  sub_2345DB968(&v10, v9);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::AddVariantSet();
  if (v20 < 0) {
    operator delete(__p);
  }
  if ((v18 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v18 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);
  if (v16) {
    sub_2346091F8(v16);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if ((v15 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  if (v13) {
    sub_2346091F8(v13);
  }
}

- (void)addVariant:(id)a3 variantSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&v33, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v9 = v7;
  uint64_t v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2345DB968(&__p, v13);
  char HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (SHIBYTE(v31) < 0) {
    operator delete(__p);
  }
  if ((BYTE8(v34) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v34 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v34);
  if (*((void *)&v33 + 1)) {
    sub_2346091F8(*((uint64_t *)&v33 + 1));
  }
  if (HasVariantSet)
  {
    uint64_t v36 = 0;
    long long v34 = 0u;
    *(_OWORD *)uint64_t v35 = 0u;
    long long v33 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&__p, (pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    id v15 = v9;
    uint64_t v19 = (char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
    sub_2345DB968(&v27, v19);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v28 < 0) {
      operator delete(v27);
    }
    if ((v32 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v32 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v31);
    if (v30) {
      sub_2346091F8(v30);
    }
    id v20 = v6;
    uint64_t v24 = (char *)objc_msgSend_UTF8String(v20, v21, v22, v23);
    sub_2345DB968(&__p, v24);
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::AddVariant();
    if (SHIBYTE(v31) < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v36) < 0) {
      operator delete(v35[0]);
    }
    if ((BYTE8(v34) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v34 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v34);
    if (*((void *)&v33 + 1)) {
      sub_2346091F8(*((uint64_t *)&v33 + 1));
    }
  }
  else
  {
    unint64_t v25 = *(void *)sub_23460D01C(p_prim) & 0xFFFFFFFFFFFFFFF8;
    if (v25)
    {
      uint64_t v26 = (const char *)(v25 + 16);
      if (*(char *)(v25 + 39) < 0) {
        uint64_t v26 = *(const char **)v26;
      }
    }
    else
    {
      uint64_t v26 = "";
    }
    NSLog(&cfstr_WarningVariant.isa, v9, v26);
  }
}

- (BOOL)hasVariantSets
{
  p_prim = &self->_prim;
  MEMORY[0x237DC2530](&v4, "variantSetNames");
  BOOL result = pxrInternal__aapl__pxrReserved__::UsdObject::HasMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v4);
  if ((v4 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v4 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return result;
}

- (BOOL)hasVariantSet:(id)a3
{
  id v4 = a3;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets(&v14, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v5 = v4;
  id v9 = (char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  sub_2345DB968(&__p, v9);
  char HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (v13 < 0) {
    operator delete(__p);
  }
  if ((v17 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v16);
  if (v15) {
    sub_2346091F8(v15);
  }

  return HasVariantSet;
}

- (id)variantSets
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)__p, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetNames(&v16, (pxrInternal__aapl__pxrReserved__::UsdVariantSets *)__p);
  if ((v15 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  if (__p[1]) {
    sub_2346091F8((uint64_t)__p[1]);
  }
  uint64_t v6 = v16;
  for (uint64_t i = v17; v6 != i; v6 += 24)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v14 = 0;
    if (*(char *)(v6 + 23) < 0)
    {
      sub_2345DBA34(__p, *(void **)v6, *(void *)(v6 + 8));
    }
    else
    {
      long long v8 = *(_OWORD *)v6;
      uint64_t v14 = *(void *)(v6 + 16);
      *(_OWORD *)__p = v8;
    }
    if (v14 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v4, (uint64_t)__p, v5, __p[0], __p[1], v14);
    }
    else {
    id v9 = objc_msgSend_stringWithUTF8String_(NSString, v4, (uint64_t)__p[0], v5, __p[0], __p[1], v14);
    }
    objc_msgSend_addObject_(v3, v10, (uint64_t)v9, v11);

    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
  }
  __p[0] = &v16;
  sub_2346092C8((void ***)__p);
  return v3;
}

- (id)variantsWithVariantSet:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v30 = 0;
  long long v28 = 0u;
  *(_OWORD *)uint64_t v29 = 0u;
  long long v27 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets(&v23, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v6 = v4;
  id v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
  sub_2345DB968(__p, v10);
  pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  if ((v26 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v26 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v25);
  if (v24) {
    sub_2346091F8(v24);
  }
  pxrInternal__aapl__pxrReserved__::UsdVariantSet::GetVariantNames(&v23, (pxrInternal__aapl__pxrReserved__::UsdVariantSet *)&v27);
  uint64_t v13 = v23;
  for (uint64_t i = v24; v13 != i; v13 += 24)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v22 = 0;
    if (*(char *)(v13 + 23) < 0)
    {
      sub_2345DBA34(__p, *(void **)v13, *(void *)(v13 + 8));
    }
    else
    {
      long long v15 = *(_OWORD *)v13;
      uint64_t v22 = *(void *)(v13 + 16);
      *(_OWORD *)__p = v15;
    }
    if (v22 >= 0) {
      objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)__p, v12, __p[0], __p[1], v22);
    }
    else {
    uint64_t v16 = objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)__p[0], v12, __p[0], __p[1], v22);
    }
    objc_msgSend_addObject_(v5, v17, (uint64_t)v16, v18);

    if (SHIBYTE(v22) < 0) {
      operator delete(__p[0]);
    }
  }
  __p[0] = &v23;
  sub_2346092C8((void ***)__p);
  id v19 = v5;
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  if ((BYTE8(v28) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v28);
  if (*((void *)&v27 + 1)) {
    sub_2346091F8(*((uint64_t *)&v27 + 1));
  }

  return v19;
}

- (BOOL)selectVariant:(id)a3 variantSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&v41, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v9 = v7;
  uint64_t v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2345DB968(&__p, v13);
  int HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if (SHIBYTE(v39) < 0) {
    operator delete(__p);
  }
  if ((BYTE8(v42) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v42 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v42);
  if (*((void *)&v41 + 1)) {
    sub_2346091F8(*((uint64_t *)&v41 + 1));
  }
  if (HasVariantSet)
  {
    uint64_t v44 = 0;
    long long v42 = 0u;
    *(_OWORD *)long long v43 = 0u;
    long long v41 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&__p, (pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    id v15 = v9;
    id v19 = (char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
    sub_2345DB968(&v35, v19);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v36 < 0) {
      operator delete(v35);
    }
    if ((v40 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v39);
    if (v38) {
      sub_2346091F8(v38);
    }
    id v20 = v6;
    uint64_t v24 = (char *)objc_msgSend_UTF8String(v20, v21, v22, v23);
    sub_2345DB968(&__p, v24);
    char HasAuthoredVariant = pxrInternal__aapl__pxrReserved__::UsdVariantSet::HasAuthoredVariant();
    BOOL v26 = HasAuthoredVariant;
    if (SHIBYTE(v39) < 0)
    {
      operator delete(__p);
      if (v26)
      {
LABEL_16:
        id v27 = v20;
        uint64_t v31 = (char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
        sub_2345DB968(&__p, v31);
        pxrInternal__aapl__pxrReserved__::UsdVariantSet::SetVariantSelection();
        if (SHIBYTE(v39) < 0) {
          operator delete(__p);
        }
        goto LABEL_25;
      }
    }
    else if (HasAuthoredVariant)
    {
      goto LABEL_16;
    }
    NSLog(&cfstr_WarningVariant_0.isa, v20, v15);
LABEL_25:
    if (SHIBYTE(v44) < 0) {
      operator delete(v43[0]);
    }
    if ((BYTE8(v42) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v42 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v42);
    if (*((void *)&v41 + 1)) {
      sub_2346091F8(*((uint64_t *)&v41 + 1));
    }
    goto LABEL_31;
  }
  unint64_t v32 = *(void *)sub_23460D01C(p_prim) & 0xFFFFFFFFFFFFFFF8;
  if (v32)
  {
    long long v33 = (const char *)(v32 + 16);
    if (*(char *)(v32 + 39) < 0) {
      long long v33 = *(const char **)v33;
    }
  }
  else
  {
    long long v33 = "";
  }
  NSLog(&cfstr_WarningVariant.isa, v9, v33);
  BOOL v26 = 0;
LABEL_31:

  return v26;
}

- (BOOL)editVariant:(id)a3 variantSet:(id)a4 block:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  int v12 = objc_msgSend_selectVariant_variantSet_(self, v11, (uint64_t)v8, (uint64_t)v9);
  if (v12)
  {
    uint64_t v25 = 0;
    long long v23 = 0u;
    *(_OWORD *)uint64_t v24 = 0u;
    p_prim = &self->_prim;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&v31, (pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    id v14 = v9;
    uint64_t v18 = (char *)objc_msgSend_UTF8String(v14, v15, v16, v17);
    sub_2345DB968(&__p, v18);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v28 < 0) {
      operator delete(__p);
    }
    if ((BYTE8(v32[0]) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v32[0] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v32);
    if (*((void *)&v31 + 1)) {
      sub_2346091F8(*((uint64_t *)&v31 + 1));
    }
    uint64_t v33 = 0;
    memset(v32, 0, sizeof(v32));
    long long v31 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::GetVariantEditContext();
    MEMORY[0x237DC2080](&v31, &__p);
    sub_2346307C4((uint64_t)&v30);
    uint64_t v19 = v29;
    if (v29 && atomic_fetch_add_explicit((atomic_uint *volatile)(v29 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    }
    uint64_t v20 = v27;
    if (v27 && atomic_fetch_add_explicit((atomic_uint *volatile)(v27 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
    }
    __p = 0;
    uint64_t v27 = 0;
    pxrInternal__aapl__pxrReserved__::UsdObject::GetStage((uint64_t *)&__p, (pxrInternal__aapl__pxrReserved__::UsdObject *)p_prim);
    v10[2](v10);
    uint64_t v21 = v27;
    if (v27 && atomic_fetch_add_explicit((atomic_uint *volatile)(v27 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
    }
    MEMORY[0x237DC2090](&v31);
    if (SHIBYTE(v25) < 0) {
      operator delete(v24[0]);
    }
    if ((BYTE8(v23) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v23);
  }

  return v12;
}

- (BOOL)clearVariantSelectionForVariantSet:(id)a3
{
  id v4 = a3;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&v24, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  id v6 = v4;
  id v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
  sub_2345DB968(&__p, v10);
  int HasVariantSet = pxrInternal__aapl__pxrReserved__::UsdVariantSets::HasVariantSet();
  if ((v22[7] & 0x80000000) != 0) {
    operator delete(__p);
  }
  if ((BYTE8(v25) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v25 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v25);
  if (*((void *)&v24 + 1)) {
    sub_2346091F8(*((uint64_t *)&v24 + 1));
  }
  if (HasVariantSet)
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    *(_OWORD *)BOOL v26 = 0u;
    long long v24 = 0u;
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetVariantSets((uint64_t *)&__p, (pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim);
    id v12 = v6;
    uint64_t v16 = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
    sub_2345DB968(&v18, v16);
    pxrInternal__aapl__pxrReserved__::UsdVariantSets::GetVariantSet();
    if (v19 < 0) {
      operator delete(v18);
    }
    if ((v23 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v23 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v22);
    if (v21) {
      sub_2346091F8(v21);
    }
    pxrInternal__aapl__pxrReserved__::UsdVariantSet::ClearVariantSelection((pxrInternal__aapl__pxrReserved__::UsdVariantSet *)&v24);
    if (SHIBYTE(v27) < 0) {
      operator delete(v26[0]);
    }
    if ((BYTE8(v25) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v25 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v25);
    if (*((void *)&v24 + 1)) {
      sub_2346091F8(*((uint64_t *)&v24 + 1));
    }
  }

  return HasVariantSet;
}

- (id)inheritedMaterialBinding
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v12, &self->_prim);
  v12[3] = 0;
  v12[0] = MEMORY[0x263F907A0] + 16;
  uint64_t v2 = (const pxrInternal__aapl__pxrReserved__::TfToken *)atomic_load(MEMORY[0x263F90550]);
  if (!v2) {
    sub_234631AD4();
  }
  pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::ComputeBoundMaterial((pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)v12, v2, 0);
  MEMORY[0x237DC2390](v12);
  if (v14 && (*(unsigned char *)(v14 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v13 + 32))(&v13))
  {
    id v3 = [USKNode alloc];
    sub_2346128E8((uint64_t)v8, &v14, &v15);
    id v6 = objc_msgSend_initWithUsdPrim_(v3, v4, (uint64_t)v8, v5);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v10);
    if (v9) {
      sub_2346091F8(v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  MEMORY[0x237DC21C0](&v13);
  return v6;
}

- (id)inheritedSkeletonBinding
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v11, &self->_prim);
  v11[3] = 0;
  v11[0] = MEMORY[0x263F90768] + 16;
  pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedSkeleton(&v12, (pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)v11);
  MEMORY[0x237DC2220](v11);
  if (v13 && (*(unsigned char *)(v13 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v12 + 32))(&v12))
  {
    uint64_t v2 = [USKNode alloc];
    sub_2346128E8((uint64_t)v7, &v13, &v14);
    uint64_t v5 = objc_msgSend_initWithUsdPrim_(v2, v3, (uint64_t)v7, v4);
    if ((v10 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v9);
    if (v8) {
      sub_2346091F8(v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  MEMORY[0x237DC2130](&v12);
  return v5;
}

- (id)inheritedSkeletonAnimationBinding
{
  long long v13 = 0u;
  long long v14 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v12, &self->_prim);
  v12[3] = 0;
  v12[0] = MEMORY[0x263F90768] + 16;
  pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI::GetInheritedAnimationSource((uint64_t *)&v13, (pxrInternal__aapl__pxrReserved__::UsdSkelBindingAPI *)v12);
  MEMORY[0x237DC2220](v12);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v13))
  {
    uint64_t v2 = [USKNode alloc];
    sub_2346128E8((uint64_t)&v8, (uint64_t *)&v13 + 1, &v14);
    uint64_t v5 = objc_msgSend_initWithUsdPrim_(v2, v3, (uint64_t)&v8, v4);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v10);
    if (v9) {
      sub_2346091F8(v9);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if ((BYTE8(v14) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v14 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  if (*((void *)&v13 + 1)) {
    sub_2346091F8(*((uint64_t *)&v13 + 1));
  }

  return v6;
}

- (id)inheritedProperty:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v21, &self->_prim);
  v21[3] = 0;
  v21[0] = MEMORY[0x263F90778] + 16;
  id v5 = v4;
  uint64_t v9 = objc_msgSend_UTF8String(v5, v6, v7, v8);
  MEMORY[0x237DC2530](&v20, v9);
  pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI::FindPrimvarWithInheritance((uint64_t *)&v22, (pxrInternal__aapl__pxrReserved__::UsdGeomPrimvarsAPI *)v21, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v20);
  if ((v20 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v20 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  MEMORY[0x237DC2260](v21);
  if (pxrInternal__aapl__pxrReserved__::UsdGeomPrimvar::IsPrimvar())
  {
    uint64_t v10 = [USKProperty alloc];
    int v15 = v22;
    uint64_t v16 = *((void *)&v22 + 1);
    if (*((void *)&v22 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v22 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v17, &v23);
    sub_2345EBCD0(&v18, (_DWORD *)&v23 + 1);
    uint64_t v19 = *((void *)&v23 + 1);
    if ((BYTE8(v23) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v19 &= 0xFFFFFFFFFFFFFFF8;
    }
    uint64_t v12 = objc_msgSend_initWithUsdProperty_withNodeOwner_(v10, v11, (uint64_t)&v15, (uint64_t)self);
    if ((v19 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v17);
    if (v16) {
      sub_2346091F8(v16);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  if ((v24 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v24 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((BYTE8(v23) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v23);
  if (*((void *)&v22 + 1)) {
    sub_2346091F8(*((uint64_t *)&v22 + 1));
  }

  return v13;
}

- (NSDictionary)properties
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  uint64_t v10 = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAuthoredProperties();
  sub_234631F5C(&v9);
  uint64_t v7 = objc_opt_new();
  uint64_t v2 = objc_opt_new();
  id v3 = objc_alloc(NSDictionary);
  id v5 = objc_msgSend_initWithObjects_forKeys_(v3, v4, (uint64_t)v2, (uint64_t)v7);

  *(void *)&long long v9 = v8;
  sub_234631FE0((void ***)&v9);
  return (NSDictionary *)v5;
}

- (id)property:(id)a3
{
  uint64_t v20 = 0;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x237DC2530](&v20, v8);
  long long v18 = 0u;
  long long v19 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((uint64_t *)&v18, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v20);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v18))
  {
    long long v9 = [USKProperty alloc];
    int v13 = v18;
    uint64_t v14 = *((void *)&v18 + 1);
    if (*((void *)&v18 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v18 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v15, &v19);
    sub_2345EBCD0(&v16, (_DWORD *)&v19 + 1);
    uint64_t v17 = *((void *)&v19 + 1);
    if ((BYTE8(v19) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v17 &= 0xFFFFFFFFFFFFFFF8;
    }
    uint64_t v11 = objc_msgSend_initWithUsdProperty_withNodeOwner_(v9, v10, (uint64_t)&v13, (uint64_t)self);
    if ((v17 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v15);
    if (v14) {
      sub_2346091F8(v14);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ((BYTE8(v19) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v19);
  if (*((void *)&v18 + 1)) {
    sub_2346091F8(*((uint64_t *)&v18 + 1));
  }
  if ((v20 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v20 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v11;
}

- (BOOL)removeProperty:(id)a3
{
  uint64_t v19 = 0;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_UTF8String(v4, v5, v6, v7);
  MEMORY[0x237DC2530](&v19, v8);
  long long v17 = 0u;
  long long v18 = 0u;
  p_prim = &self->_prim;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((uint64_t *)&v17, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19);
  char v10 = sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v17);
  if (v10)
  {
    pxrInternal__aapl__pxrReserved__::UsdPrim::RemoveProperty((pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19);
    pxrInternal__aapl__pxrReserved__::UsdPrim::GetProperty((uint64_t *)&v15, (pxrInternal__aapl__pxrReserved__::UsdPrim *)p_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19);
    LODWORD(v17) = v15;
    uint64_t v11 = *((void *)&v15 + 1);
    *((void *)&v15 + 1) = 0;
    uint64_t v12 = *((void *)&v17 + 1);
    *((void *)&v17 + 1) = v11;
    if (v12) {
      sub_2346091F8(v12);
    }
    sub_2345EBF68((uint64_t)&v18, (int *)&v16);
    sub_2345EBFC0((uint64_t)&v18 + 4);
    if ((BYTE8(v18) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v18 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    *((void *)&v18 + 1) = *((void *)&v16 + 1);
    *((void *)&v16 + 1) = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v16);
    if (*((void *)&v15 + 1)) {
      sub_2346091F8(*((uint64_t *)&v15 + 1));
    }
    if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v17))
    {
      if (v17 == 3)
      {
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        sub_23460B484((uint64_t)&v17, (uint64_t)&v15);
        pxrInternal__aapl__pxrReserved__::UsdAttribute::Block((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v15);
        if ((BYTE8(v16) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v16 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      }
      else
      {
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        sub_234617AA0((uint64_t)&v17, (uint64_t)&v15);
        memset(v14, 0, sizeof(v14));
        pxrInternal__aapl__pxrReserved__::UsdRelationship::SetTargets();
        uint64_t v20 = (void **)v14;
        sub_2345EC2C4(&v20);
        if ((BYTE8(v16) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v16 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      }
      sub_2345EBD10((uint64_t)&v16);
      if (*((void *)&v15 + 1)) {
        sub_2346091F8(*((uint64_t *)&v15 + 1));
      }
    }
  }
  if ((BYTE8(v18) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v18 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v18);
  if (*((void *)&v17 + 1)) {
    sub_2346091F8(*((uint64_t *)&v17 + 1));
  }
  if ((v19 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v10;
}

- (BOOL)isInstanceNode
{
  return pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator BOOL();
}

- (id)masterNode
{
  id v3 = [USKNode alloc];
  sub_23462D684((uint64_t)&self->_prim, (uint64_t)&v8);
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

- (id)specifier
{
  sub_23462D7AC((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)a2);
  if (v2 > 2) {
    id v3 = USKNodeSpecifierTypeDefine;
  }
  else {
    id v3 = off_264BF4C48[v2];
  }
  id v4 = *v3;
  return v4;
}

- (void)setSpecifier:(id)a3
{
  id v4 = (__CFString *)a3;
  if (@"SdfSpecifierDef" == v4 || @"SdfSpecifierOver" == v4 || @"SdfSpecifierClass" == v4) {
    sub_23462D8AC((uint64_t)&self->_prim);
  }
}

- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel_newPropertyWithName_type_role_variability_, a3, a4);
}

- (id)newPropertyWithName:(id)a3 type:(id)a4 role:(id)a5 variability:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v43 = v10;
  uint64_t v14 = objc_msgSend_tokenWithDataType_(USKToken, v12, (uint64_t)v10, v13, v9);
  long long v17 = objc_msgSend_tokenWithRoleType_(USKToken, v15, (uint64_t)v11, v16);
  v71[0] = 0;
  id v18 = v9;
  uint64_t v22 = objc_msgSend_UTF8String(v18, v19, v20, v21);
  MEMORY[0x237DC2530](v71, v22);
  uint64_t v70 = 0;
  long long v24 = (pxrInternal__aapl__pxrReserved__::UsdPrimDefinition *)sub_23462E5D4((uint64_t)&self->_prim, v23);
  pxrInternal__aapl__pxrReserved__::UsdPrimDefinition::GetSchemaPropertySpec(&v70, v24, (const pxrInternal__aapl__pxrReserved__::TfToken *)v71);
  if (pxrInternal__aapl__pxrReserved__::SdfSpec::IsDormant((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70))
  {
LABEL_2:
    int type = self->_prim._type;
    px = self->_prim._prim._p.px;
    long long v47 = px;
    if (px) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v48, &self->_prim._proxyPrimPath);
    sub_2345EBCD0(&v49, (_DWORD *)&self->_prim._proxyPrimPath._primPart._poolHandle + 1);
    unint64_t poolHandle = (unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle;
    unint64_t v50 = poolHandle;
    if ((poolHandle & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(poolHandle & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v50 &= 0xFFFFFFFFFFFFFFF8;
    }
    if (v14)
    {
      objc_msgSend_token(v14, v26, v27, v28);
      if (v17)
      {
LABEL_9:
        objc_msgSend_token(v17, v26, v27, v28);
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v45 = 0;
      if (v17) {
        goto LABEL_9;
      }
    }
    uint64_t v44 = 0;
LABEL_48:
    char v36 = sub_23462D944((pxrInternal__aapl__pxrReserved__::UsdPrim *)&type, v18, (pxrInternal__aapl__pxrReserved__ *)&v45, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v44);
    if ((v44 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v44 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v45 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v50 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v50 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v48);
    uint64_t v41 = (uint64_t)v47;
    if (v47) {
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  uint64_t v30 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
  if (pxrInternal__aapl__pxrReserved__::SdfSpec::GetSpecType(v30) == 1)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v31 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetNameToken(&v62, v31);
    unint64_t v32 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
    uint64_t TypeName = pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetTypeName(v32);
    uint64_t v33 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetVariability(v33);
    pxrInternal__aapl__pxrReserved__::UsdPrim::CreateAttribute();
    LODWORD(v68) = v63;
    *((void *)&v68 + 1) = v64;
    uint64_t v64 = 0;
    LODWORD(v69) = v65;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator=();
    DWORD1(v69) = v66;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator=();
    *((void *)&v69 + 1) = v67;
    uint64_t v67 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v65);
    if (v64) {
      sub_2346091F8(v64);
    }
    if ((v62 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v62 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    uint64_t v34 = [USKProperty alloc];
    int v56 = v68;
    uint64_t v57 = *((void *)&v68 + 1);
    if (*((void *)&v68 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v68 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v58, &v69);
    sub_2345EBCD0(&v59, (_DWORD *)&v69 + 1);
    uint64_t v60 = *((void *)&v69 + 1);
    if ((BYTE8(v69) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v69 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v60 &= 0xFFFFFFFFFFFFFFF8;
    }
    char v36 = objc_msgSend_initWithUsdProperty_withNodeOwner_(v34, v35, (uint64_t)&v56, (uint64_t)self);
    if ((v60 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v60 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v58);
    if (v57) {
      sub_2346091F8(v57);
    }
    if ((BYTE8(v69) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v69 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  else
  {
    uint64_t v37 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
    if (pxrInternal__aapl__pxrReserved__::SdfSpec::GetSpecType(v37) != 8) {
      goto LABEL_2;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v38 = sub_23462E638((pxrInternal__aapl__pxrReserved__::SdfSpec *)&v70);
    pxrInternal__aapl__pxrReserved__::SdfPropertySpec::GetNameToken(&v62, v38);
    pxrInternal__aapl__pxrReserved__::UsdPrim::CreateRelationship((pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v62);
    LODWORD(v68) = v63;
    *((void *)&v68 + 1) = v64;
    uint64_t v64 = 0;
    LODWORD(v69) = v65;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::operator=();
    DWORD1(v69) = v66;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator=();
    *((void *)&v69 + 1) = v67;
    uint64_t v67 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v65);
    if (v64) {
      sub_2346091F8(v64);
    }
    if ((v62 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v62 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    uint64_t v39 = [USKProperty alloc];
    int v51 = v68;
    uint64_t v52 = *((void *)&v68 + 1);
    if (*((void *)&v68 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v68 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v53, &v69);
    sub_2345EBCD0(&v54, (_DWORD *)&v69 + 1);
    uint64_t v55 = *((void *)&v69 + 1);
    if ((BYTE8(v69) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v69 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v55 &= 0xFFFFFFFFFFFFFFF8;
    }
    char v36 = objc_msgSend_initWithUsdProperty_withNodeOwner_(v39, v40, (uint64_t)&v51, (uint64_t)self);
    if ((v55 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v55 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v53);
    if (v52) {
      sub_2346091F8(v52);
    }
    if ((BYTE8(v69) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v69 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  }
  sub_2345EBD10((uint64_t)&v69);
  uint64_t v41 = *((void *)&v68 + 1);
  if (*((void *)&v68 + 1)) {
LABEL_55:
  }
    sub_2346091F8(v41);
LABEL_56:
  MEMORY[0x237DC2510](&v70);
  if ((v71[0] & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v71[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v36;
}

- (id)newCustomPropertyWithName:(id)a3 type:(id)a4 role:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_tokenWithDataType_(USKToken, v11, (uint64_t)v9, v12);
  uint64_t v16 = objc_msgSend_tokenWithRoleType_(USKToken, v14, (uint64_t)v10, v15);
  int type = self->_prim._type;
  px = self->_prim._prim._p.px;
  uint64_t v27 = px;
  if (px) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)px + 6, 1uLL, memory_order_relaxed);
  }
  sub_2345EBC84(&v28, &self->_prim._proxyPrimPath);
  sub_2345EBCD0(&v29, (_DWORD *)&self->_prim._proxyPrimPath._primPart._poolHandle + 1);
  unint64_t poolHandle = (unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle;
  unint64_t v30 = poolHandle;
  if ((poolHandle & 7) != 0
    && (atomic_fetch_add_explicit((atomic_uint *volatile)(poolHandle & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
  {
    v30 &= 0xFFFFFFFFFFFFFFF8;
  }
  if (v13)
  {
    objc_msgSend_token(v13, v18, v19, v20);
    if (v16)
    {
LABEL_8:
      objc_msgSend_token(v16, v18, v19, v20);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (v16) {
      goto LABEL_8;
    }
  }
  uint64_t v24 = 0;
LABEL_11:
  uint64_t v22 = sub_23462D944((pxrInternal__aapl__pxrReserved__::UsdPrim *)&type, v8, (pxrInternal__aapl__pxrReserved__ *)&v25, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v24);
  if ((v24 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v24 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v25 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v25 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v30 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v30 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v28);
  if (v27) {
    sub_2346091F8((uint64_t)v27);
  }

  return v22;
}

- (id)name
{
  id v3 = [USKToken alloc];
  uint64_t v6 = *(atomic_uint **)sub_23460D01C(&self->_prim._type);
  id v10 = v6;
  if ((v6 & 7) != 0)
  {
    uint64_t v7 = (atomic_uint *)((unint64_t)v6 & 0xFFFFFFFFFFFFFFF8);
    if ((atomic_fetch_add_explicit(v7, 2u, memory_order_relaxed) & 1) == 0) {
      id v10 = v7;
    }
  }
  id v8 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v10, v5);
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return v8;
}

- (id)path
{
  id v3 = [USKObjectPath alloc];
  sub_234615930((uint64_t)&self->_prim, &v8);
  uint64_t v6 = objc_msgSend_initWithSdfPath_(v3, v4, (uint64_t)&v8, v5);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v8);
  return v6;
}

- (id)childIterator
{
  id v3 = [USKNodeSiblingIterator alloc];
  uint64_t v6 = objc_msgSend_initWithPrim_(v3, v4, (uint64_t)&self->_prim, v5);
  return v6;
}

- (id)subtreeIterator
{
  id v3 = [USKNodeSubtreeIterator alloc];
  uint64_t v6 = objc_msgSend_initWithPrim_(v3, v4, (uint64_t)&self->_prim, v5);
  return v6;
}

- (id)loadedChildIterator
{
  id v3 = [USKNodeSiblingIterator alloc];
  char v8 = 0;
  int64x2_t v7 = vdupq_n_s64(2uLL);
  uint64_t v5 = objc_msgSend_initWithPrim_withPredicate_(v3, v4, (uint64_t)&self->_prim, (uint64_t)&v7);
  return v5;
}

- (id)loadedSubtreeIterator
{
  id v3 = [USKNodeSubtreeIterator alloc];
  char v8 = 0;
  int64x2_t v7 = vdupq_n_s64(2uLL);
  uint64_t v5 = objc_msgSend_initWithPrim_withPredicate_(v3, v4, (uint64_t)&self->_prim, (uint64_t)&v7);
  return v5;
}

- (id)propertyList
{
  v9[4] = *MEMORY[0x263EF8340];
  unsigned int v2 = [USKPropertyIterator alloc];
  v9[3] = 0;
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAuthoredProperties();
  uint64_t v5 = objc_msgSend_initWithProperties_(v2, v3, (uint64_t)v7, v4);
  char v8 = (void **)v7;
  sub_234631FE0(&v8);
  sub_234631F5C(v9);
  return v5;
}

- (NSString)type
{
  unint64_t v10 = 0;
  MEMORY[0x237DC2530](&v9, "typeName");
  uint64_t v11 = 0;
  sub_2346320E8((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)&v9);
  if ((v11 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v9 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  unint64_t v8 = v10;
  if ((v10 & 7) != 0)
  {
    unint64_t v5 = v10 & 0xFFFFFFFFFFFFFFF8;
    if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
      unint64_t v8 = v5;
    }
  }
  uint64_t v6 = objc_msgSend_nodeTypeWithTfToken_(USKToken, v3, (uint64_t)&v8, v4);
  if ((v8 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return (NSString *)v6;
}

- (USKToken)typeName
{
  unint64_t v11 = 0;
  MEMORY[0x237DC2530](&v10, "typeName");
  uint64_t v12 = 0;
  sub_2346320E8((uint64_t)&self->_prim, (const pxrInternal__aapl__pxrReserved__::Usd_PrimData *)&v10);
  if ((v12 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v10 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  id v3 = [USKToken alloc];
  unint64_t v9 = v11;
  if ((v11 & 7) != 0)
  {
    unint64_t v6 = v11 & 0xFFFFFFFFFFFFFFF8;
    if ((atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0) {
      unint64_t v9 = v6;
    }
  }
  int64x2_t v7 = objc_msgSend_initWithTfToken_(v3, v4, (uint64_t)&v9, v5);
  if ((v9 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v11 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  return (USKToken *)v7;
}

- (NSArray)schemaTypes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  pxrInternal__aapl__pxrReserved__::UsdPrim::GetAppliedSchemas((uint64_t *)&v15, (pxrInternal__aapl__pxrReserved__::UsdPrim *)&self->_prim);
  unint64_t v6 = v15;
  for (uint64_t i = v16; v6 != i; ++v6)
  {
    uint64_t v8 = *v6;
    if ((*v6 & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v8 &= 0xFFFFFFFFFFFFFFF8;
    }
    uint64_t v14 = v8;
    if ((v8 & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v14 &= 0xFFFFFFFFFFFFFFF8;
    }
    objc_msgSend_schemaTypeWithTfToken_(USKToken, v4, (uint64_t)&v14, v5);
    unint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v9;
    if ((v14 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if (v9 != @"Unknown") {
      objc_msgSend_addObject_(v3, v10, (uint64_t)v9, v11);
    }

    if ((v8 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
  }
  long long v17 = (void **)&v15;
  sub_234612B94(&v17);
  return (NSArray *)v3;
}

- (id)parent
{
  long long v12 = 0u;
  long long v13 = 0u;
  sub_23462F310((uint64_t)&self->_prim, (uint64_t)&v12);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v12))
  {
    unsigned int v2 = [USKNode alloc];
    int v7 = v12;
    uint64_t v8 = *((void *)&v12 + 1);
    if (*((void *)&v12 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v9, &v13);
    sub_2345EBCD0(&v10, (_DWORD *)&v13 + 1);
    uint64_t v11 = *((void *)&v13 + 1);
    if ((BYTE8(v13) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v11 &= 0xFFFFFFFFFFFFFFF8;
    }
    uint64_t v5 = objc_msgSend_initWithUsdPrim_(v2, v3, (uint64_t)&v7, v4);
    if ((v11 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v11 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v9);
    if (v8) {
      sub_2346091F8(v8);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ((BYTE8(v13) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v13 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v13);
  if (*((void *)&v12 + 1)) {
    sub_2346091F8(*((uint64_t *)&v12 + 1));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (USKNode *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_usdPrim(v5, v6, v7, v8);
    BOOL v9 = self->_prim._type == v11
      && self->_prim._prim._p.px == v12
      && self->_prim._proxyPrimPath._primPart._poolHandle == v13
      && ((unint64_t)self->_prim._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == (v14 & 0xFFFFFFFFFFFFFFF8);
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
  sub_234622270((uint64_t)v3, (unsigned int *)&self->_prim, &self->_prim._prim._p.px, (unsigned int *)&self->_prim._proxyPrimPath, &self->_prim._proxyPrimPath._propPart._poolHandle);
  return bswap64(0x9E3779B97F4A7C55 * v3[0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prim._propName._rep._ptrAndBits, 0);
  p_prim = &self->_prim;
  Handle poolHandle = p_prim->_proxyPrimPath._propPart._poolHandle;
  if ((poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&p_prim->_proxyPrimPath);
  uint64_t px = (uint64_t)p_prim->_prim._p.px;
  if (px)
  {
    sub_2346091F8(px);
  }
}

- (id).cxx_construct
{
  p_prim = &self->_prim;
  self->_prim._int type = 1;
  self->_prim._prim._p.uint64_t px = 0;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  p_prim->_proxyPrimPath._propPart._Handle poolHandle = 0;
  return self;
}

@end