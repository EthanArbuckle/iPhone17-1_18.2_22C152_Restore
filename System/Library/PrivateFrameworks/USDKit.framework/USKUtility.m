@interface USKUtility
+ (BOOL)isSceneGraphNode:(id)a3;
+ (BOOL)isShaderOutputProperty:(id)a3;
+ (BOOL)isTransformNode:(id)a3;
+ (__n128)localTransformWithNode:(void *)a3 time:;
+ (__n128)worldTransformWithNode:(uint64_t)a3 time:(void *)a4;
+ (id)USDPreviewSurfaceDefaults;
+ (id)bufferMaterialPropertiesWithMaterial:(id)a3;
+ (id)constantMaterialPropertiesWithMaterial:(id)a3;
+ (id)firstUVMeshAttributeNameInMaterial:(id)a3;
+ (id)meshGroupsWithNode:(id)a3;
+ (id)meshUniqueAndTriangulate:(id)a3 names:(id)a4;
+ (id)shaderNodeType:(id)a3;
+ (id)targetPropertyWithProperty:(id)a3;
+ (id)textureMaterialPropertiesWithMaterial:(id)a3;
+ (id)transformKeyTimesWithNode:(id)a3;
+ (void)setLocalTransformWithNode:(uint64_t)a1 transform:(uint64_t)a2 time:(void *)a3;
@end

@implementation USKUtility

+ (__n128)localTransformWithNode:(void *)a3 time:
{
  id v3 = a3;
  v7 = v3;
  if (v3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v12, (const UsdPrim *)v11);
    uint64_t v12 = MEMORY[0x263F90730] + 16;
    if ((v11[24] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)&v11[24] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v11[16]);
    if (*(void *)&v11[8]) {
      sub_2346091F8(*(uint64_t *)&v11[8]);
    }
    memset(v11, 0, sizeof(v11));
    pxrInternal__aapl__pxrReserved__::GfMatrix4d::SetDiagonal((pxrInternal__aapl__pxrReserved__::GfMatrix4d *)v11, 1.0);
    if (v13 && (*(unsigned char *)(v13 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v12 + 32))(&v12))
    {
      MEMORY[0x237DC2190](v10, &v12);
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::XformQuery::GetLocalTransformation();
      v15 = (void **)v10;
      sub_234612BE8(&v15);
    }
    memset(v10, 0, sizeof(v10));
    MEMORY[0x237DC1EC0](v10, v11);
    long long v9 = v10[0];
    MEMORY[0x237DC21B0](&v12);
  }
  else
  {
    long long v9 = *MEMORY[0x263EF89A8];
  }

  return (__n128)v9;
}

+ (void)setLocalTransformWithNode:(uint64_t)a1 transform:(uint64_t)a2 time:(void *)a3
{
  id v3 = a3;
  v7 = v3;
  if (v3)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v14, (const UsdPrim *)v10);
    uint64_t v14 = MEMORY[0x263F90730] + 16;
    if ((v10[24] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)&v10[24] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v10[16]);
    if (*(void *)&v10[8]) {
      sub_2346091F8(*(uint64_t *)&v10[8]);
    }
    if (v15 && (*(unsigned char *)(v15 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v14 + 32))(&v14))
    {
      BOOL v13 = 0;
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetOrderedXformOps(v12, (pxrInternal__aapl__pxrReserved__::UsdGeomXformable *)&v14, &v13);
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      uint64_t v8 = v12[0];
      if (v12[1] == v12[0])
      {
        pxrInternal__aapl__pxrReserved__::UsdGeomXformable::AddTransformOp();
      }
      else
      {
        sub_234612540((uint64_t)v10, v12[0]);
        int v9 = *(_DWORD *)(v8 + 128);
        BYTE4(v11) = *(unsigned char *)(v8 + 132);
        LODWORD(v11) = v9;
      }
      sub_23460AAF4((pxrInternal__aapl__pxrReserved__::UsdGeomXformOp *)v10);
      sub_23461288C((uint64_t)v10);
      *(void *)v10 = v12;
      sub_234612BE8((void ***)v10);
    }
    MEMORY[0x237DC21B0](&v14);
  }
}

+ (__n128)worldTransformWithNode:(uint64_t)a3 time:(void *)a4
{
  id v5 = a4;
  int v9 = v5;
  double v16 = a1;
  memset(&v15, 0, 32);
  if (v5) {
    objc_msgSend_usdPrim(v5, v6, v7, v8);
  }
  memset(v14, 0, sizeof(v14));
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v14, &v15);
  v14[0] = MEMORY[0x263F90728] + 16;
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v15))
  {
    memset(v13, 0, sizeof(v13));
    pxrInternal__aapl__pxrReserved__::UsdGeomImageable::ComputeLocalToWorldTransform();
    MEMORY[0x237DC1EC0](&v12, v13);
    long long v11 = v12;
  }
  else
  {
    long long v11 = *MEMORY[0x263EF89A8];
  }
  MEMORY[0x237DC2180](v14);
  if (((uint64_t)v15._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v15._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v15._proxyPrimPath);
  if (v15._prim._p.px) {
    sub_2346091F8((uint64_t)v15._prim._p.px);
  }

  return (__n128)v11;
}

+ (id)transformKeyTimesWithNode:(id)a3
{
  v21[3] = *(uint64_t **)MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v17, &v13);
    uint64_t v17 = MEMORY[0x263F90730] + 16;
    if (((uint64_t)v13._proxyPrimPath._propPart._poolHandle & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v13._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v13._proxyPrimPath);
    if (v13._prim._p.px) {
      sub_2346091F8((uint64_t)v13._prim._p.px);
    }
    if (v18 && (*(unsigned char *)(v18 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v17 + 32))(&v17))
    {
      __p = 0;
      UsdPrim v15 = 0;
      uint64_t v16 = 0;
      pxrInternal__aapl__pxrReserved__::UsdGeomXformable::GetTimeSamples();
      memset(&v13, 0, sizeof(v13));
      uint64_t v20 = 0;
      v21[0] = &v20;
      sub_2345F9FB0((unint64_t *)&v13, (v15 - (unsigned char *)__p) >> 3, v21);
      uint64_t v8 = __p;
      if (v15 != __p)
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = v8[v9];
          sub_2345FA21C((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v13);
          *((void *)v13._propName._rep._ptrAndBits + v9++) = v10;
          uint64_t v8 = __p;
        }
        while (v9 < (v15 - (unsigned char *)__p) >> 3);
      }
      long long v11 = [USKData alloc];
      v21[2] = (uint64_t *)&off_26E763D20;
      sub_2345F97E0();
    }
    MEMORY[0x237DC21B0](&v17);
  }

  return 0;
}

+ (BOOL)isSceneGraphNode:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3)
  {
    *(_OWORD *)uint64_t v16 = 0u;
    long long v17 = 0u;
    objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::Usd_ThrowExpiredPrimAccessError(0, v8);
    unint64_t v9 = (void *)MEMORY[0x18];
    uint64_t v10 = (pxrInternal__aapl__pxrReserved__::UsdGeomImageable *)MEMORY[0x237DC2530](&v15, "");
    unint64_t v11 = *v9 & 0xFFFFFFFFFFFFFFF8;
    long long v12 = (atomic_uint *)(v15 & 0xFFFFFFFFFFFFFFF8);
    if ((v15 & 7) != 0) {
      atomic_fetch_add_explicit(v12, 0xFFFFFFFE, memory_order_release);
    }
    if ((atomic_uint *)v11 == v12)
    {
      char IsA = 1;
    }
    else
    {
      pxrInternal__aapl__pxrReserved__::UsdGeomImageable::_GetStaticTfType(v10);
      pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::FindSchemaInfo();
      char IsA = pxrInternal__aapl__pxrReserved__::UsdPrim::_IsA();
    }
    if ((BYTE8(v17) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v17);
    if (v16[1]) {
      sub_2346091F8((uint64_t)v16[1]);
    }
  }
  else
  {
    char IsA = 0;
  }

  return IsA;
}

+ (BOOL)isTransformNode:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3)
  {
    uint64_t v8 = (pxrInternal__aapl__pxrReserved__::UsdGeomXformable *)objc_msgSend_usdPrim(v3, v4, v5, v6);
    pxrInternal__aapl__pxrReserved__::UsdGeomXformable::_GetStaticTfType(v8);
    pxrInternal__aapl__pxrReserved__::UsdSchemaRegistry::FindSchemaInfo();
    char IsA = pxrInternal__aapl__pxrReserved__::UsdPrim::_IsA();
    if ((v13 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v12);
    if (v11) {
      sub_2346091F8(v11);
    }
  }
  else
  {
    char IsA = 0;
  }

  return IsA;
}

+ (BOOL)isShaderOutputProperty:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3)
  {
    objc_msgSend_usdProperty(v3, v4, v5, v6);
    int v8 = v18;
    uint64_t v9 = *((void *)&v19 + 1);
  }
  else
  {
    uint64_t v9 = 0;
    int v8 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
  }
  if ((v9 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v19);
  if (*((void *)&v18 + 1)) {
    sub_2346091F8(*((uint64_t *)&v18 + 1));
  }
  if (v8 != 3) {
    goto LABEL_26;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  if (v7)
  {
    objc_msgSend_usdProperty(v7, v10, v11, v12);
  }
  else
  {
    long long v16 = 0uLL;
    long long v17 = 0uLL;
  }
  sub_23460B484((uint64_t)&v16, (uint64_t)&v18);
  if ((BYTE8(v17) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);
  if (*((void *)&v16 + 1)) {
    sub_2346091F8(*((uint64_t *)&v16 + 1));
  }
  long long v16 = 0u;
  long long v17 = 0u;
  MEMORY[0x237DC20C0](&v16, &v18);
  char IsOutput = pxrInternal__aapl__pxrReserved__::UsdShadeOutput::IsOutput();
  if ((BYTE8(v17) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v17 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v17);
  if (*((void *)&v16 + 1)) {
    sub_2346091F8(*((uint64_t *)&v16 + 1));
  }
  if ((BYTE8(v19) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v19 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v19);
  if (*((void *)&v18 + 1)) {
    sub_2346091F8(*((uint64_t *)&v18 + 1));
  }
  if (IsOutput) {
    BOOL v14 = 1;
  }
  else {
LABEL_26:
  }
    BOOL v14 = 0;

  return v14;
}

+ (id)shaderNodeType:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  else {
    memset(&v10, 0, 32);
  }
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v11, &v10);
  uint64_t v11 = MEMORY[0x263F906F0] + 16;
  if (((uint64_t)v10._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v10._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v10._proxyPrimPath);
  if (v10._prim._p.px) {
    sub_2346091F8((uint64_t)v10._prim._p.px);
  }
  if (v12 && (*(unsigned char *)(v12 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v11 + 32))(&v11))
  {
    memset(&v10, 0, 32);
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetIdAttr((uint64_t *)&v10._type, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v11);
    pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::TfToken>();
  }
  int v8 = @"Unknown";
  MEMORY[0x237DC20E0](&v11);

  return v8;
}

+ (id)constantMaterialPropertiesWithMaterial:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_opt_new();
  v63._propName._rep._ptrAndBits = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  else {
    memset(&v63, 0, 32);
  }
  sub_23460BF54(&v63, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v63._propName);
  if (((uint64_t)v63._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v63._proxyPrimPath);
  if (v63._prim._p.px) {
    sub_2346091F8((uint64_t)v63._prim._p.px);
  }
  if (v64
    && (*(unsigned char *)(v64 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v63._propName._rep._ptrAndBits + 4))(&v63._propName))
  {
    v42 = v7;
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v63._propName);
    uint64_t v8 = v62;
    if (v61 != v62)
    {
      uint64_t v9 = v61 + 16;
      while (1)
      {
        memset(&v63, 0, 32);
        uint64_t v10 = v9 - 16;
        v63._type = *(_DWORD *)(v9 - 16);
        uint64_t v11 = *(void *)(v9 - 8);
        v63._prim._p.px = (Usd_PrimData *)v11;
        if (v11) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 48), 1uLL, memory_order_relaxed);
        }
        sub_2345EBC84(&v63._proxyPrimPath, (_DWORD *)v9);
        sub_2345EBCD0((_DWORD *)&v63._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v9 + 4));
        uint64_t v12 = *(Ptr **)(v9 + 8);
        v63._proxyPrimPath._propPart._poolHandle = v12;
        if ((v12 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v12 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v63._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        long long v59 = 0u;
        long long v60 = 0u;
        sub_23460B9A8((uint64_t)&v63, (uint64_t)&v59);
        if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v59)) {
          goto LABEL_90;
        }
        if ((pxrInternal__aapl__pxrReserved__::UsdShadeOutput::IsOutput() & 1) != 0
          || !pxrInternal__aapl__pxrReserved__::UsdAttribute::HasValue((pxrInternal__aapl__pxrReserved__::UsdAttribute *)&v59))
        {
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
          sub_2346128E8((uint64_t)&v50, (uint64_t *)&v59 + 1, &v60);
          pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v51, &v50);
          uint64_t v51 = MEMORY[0x263F906F0] + 16;
          if (((uint64_t)v50._proxyPrimPath._propPart._poolHandle & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v50._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2345EBD10((uint64_t)&v50._proxyPrimPath);
          if (v50._prim._p.px) {
            sub_2346091F8((uint64_t)v50._prim._p.px);
          }
          if (v52 && (*(unsigned char *)(v52 + 57) & 8) == 0 && (*(unsigned int (**)(uint64_t *))(v51 + 32))(&v51))
          {
            memset(&v50, 0, 32);
            MEMORY[0x237DC2530](&v45, "fallback");
            pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((uint64_t *)&v46, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v51, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v45);
            v50._type = (int)v46;
            v50._prim._p.px = (Usd_PrimData *)v47;
            if (v47) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v47 + 48), 1uLL, memory_order_relaxed);
            }
            sub_2345EBC84(&v50._proxyPrimPath, &v48);
            sub_2345EBCD0((_DWORD *)&v50._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)&v48 + 1);
            v50._proxyPrimPath._propPart._poolHandle = v49;
            if ((v49 & 7) != 0
              && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v49 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
            {
              v50._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v50._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
            }
            if ((v49 & 7) != 0) {
              atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v49 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
            }
            pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
            sub_2345EBD10((uint64_t)&v48);
            if (v47) {
              sub_2346091F8(v47);
            }
            if ((v45 & 7) != 0) {
              atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
            }
            if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v50))
            {
              BaseName = (pxrInternal__aapl__pxrReserved__::TfToken *)pxrInternal__aapl__pxrReserved__::UsdProperty::GetBaseName((uint64_t *)&v46, (pxrInternal__aapl__pxrReserved__::UsdProperty *)&v59);
              if (((unint64_t)v46 & 0xFFFFFFFFFFFFFFF8) != 0) {
                unint64_t EmptyString = ((unint64_t)v46 & 0xFFFFFFFFFFFFFFF8) + 16;
              }
              else {
                unint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(BaseName);
              }
              if (*(char *)(EmptyString + 23) < 0)
              {
                sub_2345DBA34(__p, *(void **)EmptyString, *(void *)(EmptyString + 8));
              }
              else
              {
                long long v26 = *(_OWORD *)EmptyString;
                uint64_t v44 = *(void *)(EmptyString + 16);
                *(_OWORD *)__p = v26;
              }
              v27 = sub_23460C5B0((uint64_t)&v50, __p);
              if (SHIBYTE(v44) < 0) {
                operator delete(__p[0]);
              }
              if ((v46 & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v46 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
              if (v27)
              {
                v38 = v27;
                id v40 = v3;
                v46 = 0;
                uint64_t v47 = 0;
                uint64_t v48 = 0;
                v28 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_23460D01C(&v63);
                if ((*(void *)v28 & 0xFFFFFFFFFFFFFFF8) != 0) {
                  unint64_t v29 = (*(void *)v28 & 0xFFFFFFFFFFFFFFF8) + 16;
                }
                else {
                  unint64_t v29 = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v28);
                }
                if (*(char *)(v29 + 23) >= 0) {
                  size_t v30 = *(unsigned __int8 *)(v29 + 23);
                }
                else {
                  size_t v30 = *(void *)(v29 + 8);
                }
                uint64_t v47 = 0;
                uint64_t v48 = 0;
                v46 = 0;
                sub_234612E20((uint64_t)&v46, v30 + 9);
                if (v48 >= 0) {
                  v33 = &v46;
                }
                else {
                  v33 = v46;
                }
                if (v30)
                {
                  if (*(char *)(v29 + 23) >= 0) {
                    v34 = (const void *)v29;
                  }
                  else {
                    v34 = *(const void **)v29;
                  }
                  memmove(v33, v34, v30);
                }
                strcpy((char *)v33 + v30, ":fallback");
                if (v48 >= 0) {
                  objc_msgSend_stringWithUTF8String_(NSString, v31, (uint64_t)&v46, v32, v38, v40);
                }
                else {
                v35 = objc_msgSend_stringWithUTF8String_(NSString, v31, (uint64_t)v46, v32, v38, v40);
                }
                v27 = (void *)v39;
                id v3 = v41;
                objc_msgSend_setObject_forKey_(v42, v36, v39, (uint64_t)v35);

                if (SHIBYTE(v48) < 0) {
                  operator delete(v46);
                }
              }
            }
            if (((uint64_t)v50._proxyPrimPath._propPart._poolHandle & 7) != 0) {
              atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v50._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
            }
            pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
            sub_2345EBD10((uint64_t)&v50._proxyPrimPath);
            if (v50._prim._p.px) {
              sub_2346091F8((uint64_t)v50._prim._p.px);
            }
          }
          MEMORY[0x237DC20E0](&v51);
          goto LABEL_90;
        }
        uint64_t v13 = [USKProperty alloc];
        int v54 = v59;
        uint64_t v55 = *((void *)&v59 + 1);
        if (*((void *)&v59 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v59 + 1) + 48), 1uLL, memory_order_relaxed);
        }
        sub_2345EBC84(&v56, &v60);
        sub_2345EBCD0(&v57, (_DWORD *)&v60 + 1);
        uint64_t v58 = *((void *)&v60 + 1);
        if ((BYTE8(v60) & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v60 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v58 &= 0xFFFFFFFFFFFFFFF8;
        }
        long long v16 = objc_msgSend_initWithUsdProperty_(v13, v14, (uint64_t)&v54, v15);
        long long v17 = NSString;
        unint64_t v20 = *(void *)sub_23460D01C(&v63) & 0xFFFFFFFFFFFFFFF8;
        if (!v20) {
          break;
        }
        v21 = (uint64_t *)(v20 + 16);
        if ((*(char *)(v20 + 39) & 0x80000000) == 0) {
          goto LABEL_51;
        }
        objc_msgSend_stringWithUTF8String_(v17, v18, *v21, v19);
        v24 = LABEL_52:;
        objc_msgSend_setObject_forKey_(v42, v25, (uint64_t)v16, (uint64_t)v24);

        if ((v58 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v58 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v56);
        if (v55) {
          sub_2346091F8(v55);
        }
LABEL_90:
        if ((BYTE8(v60) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v60 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v60);
        if (*((void *)&v59 + 1)) {
          sub_2346091F8(*((uint64_t *)&v59 + 1));
        }
        if (((uint64_t)v63._proxyPrimPath._propPart._poolHandle & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v63._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v63._proxyPrimPath);
        if (v63._prim._p.px) {
          sub_2346091F8((uint64_t)v63._prim._p.px);
        }
        v9 += 32;
        if (v10 + 32 == v8) {
          goto LABEL_99;
        }
      }
      v21 = (uint64_t *)"";
LABEL_51:
      objc_msgSend_stringWithUTF8String_(v17, v18, (uint64_t)v21, v19);
      goto LABEL_52;
    }
LABEL_99:
    *(void *)&v63._type = &v61;
    sub_234612D18((void ***)&v63);
    uint64_t v7 = v42;
  }
  MEMORY[0x237DC20E0](&v63._propName);

  return v7;
}

+ (id)bufferMaterialPropertiesWithMaterial:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_opt_new();
  v47._propName._rep._ptrAndBits = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  else {
    memset(&v47, 0, 32);
  }
  sub_23460BF54(&v47, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v47._propName);
  if (((uint64_t)v47._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v47._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v47._proxyPrimPath);
  if (v47._prim._p.px) {
    sub_2346091F8((uint64_t)v47._prim._p.px);
  }
  if (v48
    && (*(unsigned char *)(v48 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v47._propName._rep._ptrAndBits + 4))(&v47._propName))
  {
    id v29 = v3;
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v47._propName);
    uint64_t v8 = v46;
    if (v45 != v46)
    {
      uint64_t v9 = v45 + 16;
      while (1)
      {
        memset(&v47, 0, 32);
        uint64_t v10 = v9 - 16;
        v47._type = *(_DWORD *)(v9 - 16);
        uint64_t v11 = *(void *)(v9 - 8);
        v47._prim._p.px = (Usd_PrimData *)v11;
        if (v11) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 48), 1uLL, memory_order_relaxed);
        }
        sub_2345EBC84(&v47._proxyPrimPath, (_DWORD *)v9);
        sub_2345EBCD0((_DWORD *)&v47._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v9 + 4));
        uint64_t v12 = *(Ptr **)(v9 + 8);
        v47._proxyPrimPath._propPart._poolHandle = v12;
        if ((v12 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v12 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v47._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v47._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        long long v43 = 0u;
        long long v44 = 0u;
        sub_23460B9A8((uint64_t)&v47, (uint64_t)&v43);
        if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v43)) {
          goto LABEL_57;
        }
        uint64_t v42 = 0;
        sub_2346128E8((uint64_t)&v38, (uint64_t *)&v43 + 1, &v44);
        sub_23460C434((pxrInternal__aapl__pxrReserved__::UsdObject *)&v38, &v42);
        if ((v41 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v41 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v40);
        if (v39) {
          sub_2346091F8(v39);
        }
        MEMORY[0x237DC2530](&v38, "UsdPrimvarReader_float");
        uint64_t v13 = v38;
        if ((v42 & 0xFFFFFFFFFFFFFFF8) == (v38 & 0xFFFFFFFFFFFFFFF8))
        {
          BOOL v16 = 1;
        }
        else
        {
          MEMORY[0x237DC2530](&v37, "UsdPrimvarReader_float2");
          uint64_t v14 = v37;
          if ((v42 & 0xFFFFFFFFFFFFFFF8) == (v37 & 0xFFFFFFFFFFFFFFF8))
          {
            BOOL v16 = 1;
          }
          else
          {
            MEMORY[0x237DC2530](&v36, "UsdPrimvarReader_float3");
            uint64_t v15 = v36;
            if ((v42 & 0xFFFFFFFFFFFFFFF8) == (v36 & 0xFFFFFFFFFFFFFFF8))
            {
              BOOL v16 = 1;
            }
            else
            {
              MEMORY[0x237DC2530](&v35, "UsdPrimvarReader_float4");
              BOOL v16 = (v42 & 0xFFFFFFFFFFFFFFF8) == (v35 & 0xFFFFFFFFFFFFFFF8);
              if ((v35 & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(v35 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
              uint64_t v15 = v36;
            }
            if ((v15 & 7) != 0) {
              atomic_fetch_add_explicit((atomic_uint *volatile)(v15 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
            }
            uint64_t v14 = v37;
          }
          if ((v14 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v14 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          uint64_t v13 = v38;
        }
        if ((v13 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v13 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if (v16) {
          break;
        }
LABEL_55:
        if ((v42 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v42 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
LABEL_57:
        if ((BYTE8(v44) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v44 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v44);
        if (*((void *)&v43 + 1)) {
          sub_2346091F8(*((uint64_t *)&v43 + 1));
        }
        if (((uint64_t)v47._proxyPrimPath._propPart._poolHandle & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v47._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v47._proxyPrimPath);
        if (v47._prim._p.px) {
          sub_2346091F8((uint64_t)v47._prim._p.px);
        }
        v9 += 32;
        if (v10 + 32 == v8) {
          goto LABEL_66;
        }
      }
      long long v17 = [USKProperty alloc];
      int v30 = v43;
      uint64_t v31 = *((void *)&v43 + 1);
      if (*((void *)&v43 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v43 + 1) + 48), 1uLL, memory_order_relaxed);
      }
      sub_2345EBC84(&v32, &v44);
      sub_2345EBCD0(&v33, (_DWORD *)&v44 + 1);
      uint64_t v34 = *((void *)&v44 + 1);
      if ((BYTE8(v44) & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v44 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v34 &= 0xFFFFFFFFFFFFFFF8;
      }
      unint64_t v20 = objc_msgSend_initWithUsdProperty_(v17, v18, (uint64_t)&v30, v19);
      v21 = NSString;
      unint64_t v24 = *(void *)sub_23460D01C(&v47) & 0xFFFFFFFFFFFFFFF8;
      if (v24)
      {
        v25 = (uint64_t *)(v24 + 16);
        if (*(char *)(v24 + 39) < 0)
        {
          objc_msgSend_stringWithUTF8String_(v21, v22, *v25, v23);
          long long v26 = LABEL_51:;
          objc_msgSend_setObject_forKey_(v7, v27, (uint64_t)v20, (uint64_t)v26);

          if ((v34 & 7) != 0) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v34 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
          }
          pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
          sub_2345EBD10((uint64_t)&v32);
          if (v31) {
            sub_2346091F8(v31);
          }
          goto LABEL_55;
        }
      }
      else
      {
        v25 = (uint64_t *)"";
      }
      objc_msgSend_stringWithUTF8String_(v21, v22, (uint64_t)v25, v23);
      goto LABEL_51;
    }
LABEL_66:
    *(void *)&v47._type = &v45;
    sub_234612D18((void ***)&v47);
    id v3 = v29;
  }
  MEMORY[0x237DC20E0](&v47._propName);

  return v7;
}

+ (id)textureMaterialPropertiesWithMaterial:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_opt_new();
  v43._propName._rep._ptrAndBits = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  else {
    memset(&v43, 0, 32);
  }
  sub_23460BF54(&v43, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v43._propName);
  if (((uint64_t)v43._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v43._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v43._proxyPrimPath);
  if (v43._prim._p.px) {
    sub_2346091F8((uint64_t)v43._prim._p.px);
  }
  if (v44
    && (*(unsigned char *)(v44 + 57) & 8) == 0
    && (*((unsigned int (**)(TfToken *))v43._propName._rep._ptrAndBits + 4))(&v43._propName))
  {
    id v27 = v3;
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v43._propName);
    uint64_t v8 = v42;
    if (v41 != v42)
    {
      uint64_t v9 = v41 + 16;
      while (1)
      {
        memset(&v43, 0, 32);
        uint64_t v10 = v9 - 16;
        v43._type = *(_DWORD *)(v9 - 16);
        uint64_t v11 = *(void *)(v9 - 8);
        v43._prim._p.px = (Usd_PrimData *)v11;
        if (v11) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 48), 1uLL, memory_order_relaxed);
        }
        sub_2345EBC84(&v43._proxyPrimPath, (_DWORD *)v9);
        sub_2345EBCD0((_DWORD *)&v43._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v9 + 4));
        uint64_t v12 = *(Ptr **)(v9 + 8);
        v43._proxyPrimPath._propPart._poolHandle = v12;
        if ((v12 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v12 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v43._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v43._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
        }
        long long v39 = 0u;
        long long v40 = 0u;
        sub_23460B9A8((uint64_t)&v43, (uint64_t)&v39);
        if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v39)) {
          goto LABEL_42;
        }
        sub_2346128E8((uint64_t)v34, (uint64_t *)&v39 + 1, &v40);
        sub_23460C434((pxrInternal__aapl__pxrReserved__::UsdObject *)v34, &v38);
        MEMORY[0x237DC2530](&v33, "UsdUVTexture");
        uint64_t v13 = v38;
        uint64_t v14 = (atomic_uint *)(v33 & 0xFFFFFFFFFFFFFFF8);
        if ((v33 & 7) != 0) {
          atomic_fetch_add_explicit(v14, 0xFFFFFFFE, memory_order_release);
        }
        if ((v38 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v38 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if ((v37 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v37 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v36);
        if (v35) {
          sub_2346091F8(v35);
        }
        if ((atomic_uint *)(v13 & 0xFFFFFFFFFFFFFFF8) != v14) {
          goto LABEL_42;
        }
        uint64_t v15 = [USKProperty alloc];
        int v28 = v39;
        uint64_t v29 = *((void *)&v39 + 1);
        if (*((void *)&v39 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v39 + 1) + 48), 1uLL, memory_order_relaxed);
        }
        sub_2345EBC84(&v30, &v40);
        sub_2345EBCD0(&v31, (_DWORD *)&v40 + 1);
        uint64_t v32 = *((void *)&v40 + 1);
        if ((BYTE8(v40) & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v40 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v32 &= 0xFFFFFFFFFFFFFFF8;
        }
        long long v18 = objc_msgSend_initWithUsdProperty_(v15, v16, (uint64_t)&v28, v17);
        uint64_t v19 = NSString;
        unint64_t v22 = *(void *)sub_23460D01C(&v43) & 0xFFFFFFFFFFFFFFF8;
        if (!v22) {
          break;
        }
        uint64_t v23 = (uint64_t *)(v22 + 16);
        if ((*(char *)(v22 + 39) & 0x80000000) == 0) {
          goto LABEL_37;
        }
        objc_msgSend_stringWithUTF8String_(v19, v20, *v23, v21);
        unint64_t v24 = LABEL_38:;
        objc_msgSend_setObject_forKey_(v7, v25, (uint64_t)v18, (uint64_t)v24);

        if ((v32 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v32 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v30);
        if (v29) {
          sub_2346091F8(v29);
        }
LABEL_42:
        if ((BYTE8(v40) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v40 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v40);
        if (*((void *)&v39 + 1)) {
          sub_2346091F8(*((uint64_t *)&v39 + 1));
        }
        if (((uint64_t)v43._proxyPrimPath._propPart._poolHandle & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v43._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v43._proxyPrimPath);
        if (v43._prim._p.px) {
          sub_2346091F8((uint64_t)v43._prim._p.px);
        }
        v9 += 32;
        if (v10 + 32 == v8) {
          goto LABEL_51;
        }
      }
      uint64_t v23 = (uint64_t *)"";
LABEL_37:
      objc_msgSend_stringWithUTF8String_(v19, v20, (uint64_t)v23, v21);
      goto LABEL_38;
    }
LABEL_51:
    *(void *)&v43._type = &v41;
    sub_234612D18((void ***)&v43);
    id v3 = v27;
  }
  MEMORY[0x237DC20E0](&v43._propName);

  return v7;
}

+ (id)firstUVMeshAttributeNameInMaterial:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = v3;
  v58._propName._rep._ptrAndBits = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  else {
    memset(&v58, 0, 32);
  }
  sub_23460BF54(&v58, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v58._propName);
  if (((uint64_t)v58._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v58._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v58._proxyPrimPath);
  if (v58._prim._p.px) {
    sub_2346091F8((uint64_t)v58._prim._p.px);
  }
  if (!v59
    || (*(unsigned char *)(v59 + 57) & 8) != 0
    || !(*((unsigned int (**)(TfToken *))v58._propName._rep._ptrAndBits + 4))(&v58._propName))
  {
    id v8 = 0;
LABEL_156:
    id v8 = v8;
    goto LABEL_157;
  }
  pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInputs((pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v58._propName);
  uint64_t v40 = v57;
  if (v56 == v57)
  {
    id v8 = 0;
LABEL_161:
    *(void *)&v58._type = &v56;
    sub_234612D18((void ***)&v58);
    goto LABEL_156;
  }
  id v8 = 0;
  uint64_t v9 = v56 + 16;
  while (1)
  {
    memset(&v58, 0, 32);
    uint64_t v10 = v9 - 16;
    v58._type = *(_DWORD *)(v9 - 16);
    uint64_t v11 = *(void *)(v9 - 8);
    v58._prim._p.px = (Usd_PrimData *)v11;
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v58._proxyPrimPath, (_DWORD *)v9);
    sub_2345EBCD0((_DWORD *)&v58._proxyPrimPath._primPart._poolHandle + 1, (_DWORD *)(v9 + 4));
    uint64_t v12 = *(Ptr **)(v9 + 8);
    v58._proxyPrimPath._propPart._poolHandle = v12;
    if ((v12 & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v12 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v58._proxyPrimPath._propPart._poolHandle = (Handle)((unint64_t)v58._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8);
    }
    memset(&v55, 0, 32);
    sub_23460B9A8((uint64_t)&v58, (uint64_t)&v55);
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v55)
      || v55._type == v58._type
      && *(_OWORD *)&v55._prim._p.px == *(_OWORD *)&v58._prim._p.px
      && ((unint64_t)v55._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8) == ((unint64_t)v58._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8))
    {
LABEL_136:
      char v37 = 1;
      goto LABEL_138;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    sub_2346128E8((uint64_t)&v53, (uint64_t *)&v55._prim, &v55._proxyPrimPath);
    sub_23460C434((pxrInternal__aapl__pxrReserved__::UsdObject *)&v53, v52);
    MEMORY[0x237DC2530](v51, "UsdUVTexture");
    uint64_t v13 = v52[0];
    uint64_t v14 = (atomic_uint *)(v51[0] & 0xFFFFFFFFFFFFFFF8);
    if ((v51[0] & 7) != 0) {
      atomic_fetch_add_explicit(v14, 0xFFFFFFFE, memory_order_release);
    }
    if ((v52[0] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v52[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((atomic_uint *)(v13 & 0xFFFFFFFFFFFFFFF8) != v14)
    {
LABEL_130:
      char v36 = 1;
      goto LABEL_131;
    }
    memset(v52, 0, sizeof(v52));
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v49, (const UsdPrim *)&v53);
    *(void *)&long long v49 = MEMORY[0x263F906F0] + 16;
    MEMORY[0x237DC2530](&v47, "st");
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput(v51, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)&v49, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v47);
    LODWORD(v52[0]) = v51[0];
    v52[1] = v51[1];
    if (v51[1]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v51[1] + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v52[2], &v51[2]);
    sub_2345EBCD0((_DWORD *)&v52[2] + 1, (_DWORD *)&v51[2] + 1);
    v52[3] = v51[3];
    if ((v51[3] & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(v51[3] & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v52[3] &= 0xFFFFFFFFFFFFFFF8;
    }
    if ((v51[3] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v51[3] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v51[2]);
    if (v51[1]) {
      sub_2346091F8(v51[1]);
    }
    if ((v47 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v47 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    MEMORY[0x237DC20E0](&v49);
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v52))
    {
LABEL_123:
      char v35 = 1;
      goto LABEL_125;
    }
    memset(v51, 0, sizeof(v51));
    sub_23460B9A8((uint64_t)v52, (uint64_t)v51);
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v51)
      || LODWORD(v51[0]) == LODWORD(v52[0])
      && *(_OWORD *)&v51[1] == *(_OWORD *)&v52[1]
      && (v51[3] & 0xFFFFFFFFFFFFFFF8) == (v52[3] & 0xFFFFFFFFFFFFFFF8))
    {
LABEL_116:
      char v34 = 1;
      goto LABEL_118;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    LODWORD(v49) = 1;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
    *((void *)&v50 + 1) = 0;
    long long v48 = 0u;
    long long v47 = 0u;
    sub_2346128E8((uint64_t)&v47, &v51[1], &v51[2]);
    uint64_t v46 = 0;
    sub_23460C434((pxrInternal__aapl__pxrReserved__::UsdObject *)&v47, &v46);
    MEMORY[0x237DC2530](v45, "UsdPrimvarReader_float2");
    uint64_t v15 = v46;
    BOOL v16 = (atomic_uint *)(*(void *)&v45[0] & 0xFFFFFFFFFFFFFFF8);
    if ((v45[0] & 7) != 0) {
      atomic_fetch_add_explicit(v16, 0xFFFFFFFE, memory_order_release);
    }
    if ((atomic_uint *)(v15 & 0xFFFFFFFFFFFFFFF8) == v16)
    {
      LODWORD(v49) = v47;
      uint64_t v21 = *((void *)&v47 + 1);
      if (*((void *)&v47 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v47 + 1) + 48), 1uLL, memory_order_relaxed);
      }
      uint64_t v22 = *((void *)&v49 + 1);
      *((void *)&v49 + 1) = v21;
      if (v22) {
        sub_2346091F8(v22);
      }
      sub_2345EE430((uint64_t)&v50, &v48);
      sub_2345EE488((uint64_t)&v50 + 4, (_DWORD *)&v48 + 1);
      sub_2345EC46C((void *)&v50 + 1, (void *)&v48 + 1);
    }
    else
    {
      MEMORY[0x237DC2530](v45, "UsdTransform2d");
      uint64_t v17 = v46;
      long long v18 = (atomic_uint *)(*(void *)&v45[0] & 0xFFFFFFFFFFFFFFF8);
      if ((v45[0] & 7) != 0) {
        atomic_fetch_add_explicit(v18, 0xFFFFFFFE, memory_order_release);
      }
      if ((atomic_uint *)(v17 & 0xFFFFFFFFFFFFFFF8) == v18)
      {
        memset(v45, 0, sizeof(v45));
        pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v44, (const UsdPrim *)&v47);
        *(void *)&v44[0] = MEMORY[0x263F906F0] + 16;
        MEMORY[0x237DC2530](__p, "in");
        pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((uint64_t *)v45, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)v44, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
        if (((uint64_t)__p[0] & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        MEMORY[0x237DC20E0](v44);
        if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v45)
          && pxrInternal__aapl__pxrReserved__::UsdShadeInput::IsInput())
        {
          memset(v44, 0, sizeof(v44));
          sub_23460B9A8((uint64_t)v45, (uint64_t)v44);
          if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v44)
            && (LODWORD(v44[0]) != LODWORD(v45[0])
             || *(_OWORD *)((char *)v44 + 8) != *(_OWORD *)((char *)v45 + 8)
             || (*((void *)&v44[1] + 1) & 0xFFFFFFFFFFFFFFF8) != (*((void *)&v45[1] + 1) & 0xFFFFFFFFFFFFFFF8)))
          {
            *(_OWORD *)__p = 0u;
            long long v43 = 0u;
            sub_2346128E8((uint64_t)__p, (uint64_t *)v44 + 1, &v44[1]);
            sub_23460C434((pxrInternal__aapl__pxrReserved__::UsdObject *)__p, &v61);
            MEMORY[0x237DC2530](&v41, "UsdPrimvarReader_float2");
            uint64_t v19 = v61;
            unint64_t v20 = (atomic_uint *)(v41 & 0xFFFFFFFFFFFFFFF8);
            if ((v41 & 7) != 0) {
              atomic_fetch_add_explicit(v20, 0xFFFFFFFE, memory_order_release);
            }
            if ((v61 & 7) != 0) {
              atomic_fetch_add_explicit((atomic_uint *volatile)(v61 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
            }
            if ((atomic_uint *)(v19 & 0xFFFFFFFFFFFFFFF8) == v20) {
              sub_23460F38C((uint64_t)&v49, (uint64_t)__p);
            }
            sub_234605B54((uint64_t)__p);
          }
          sub_23460B564((uint64_t)v44);
        }
        if ((BYTE8(v45[1]) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v45[1] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
        sub_2345EBD10((uint64_t)&v45[1]);
        if (*((void *)&v45[0] + 1)) {
          sub_2346091F8(*((uint64_t *)&v45[0] + 1));
        }
      }
    }
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v49))
    {
LABEL_103:
      char v33 = 1;
      goto LABEL_105;
    }
    memset(v45, 0, sizeof(v45));
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v44, (const UsdPrim *)&v49);
    *(void *)&v44[0] = MEMORY[0x263F906F0] + 16;
    MEMORY[0x237DC2530](__p, "varname");
    pxrInternal__aapl__pxrReserved__::UsdShadeShader::GetInput((uint64_t *)v45, (pxrInternal__aapl__pxrReserved__::UsdShadeShader *)v44, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
    if (((uint64_t)__p[0] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    MEMORY[0x237DC20E0](v44);
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v45)
      || !pxrInternal__aapl__pxrReserved__::UsdShadeInput::IsInput())
    {
LABEL_97:
      char v32 = 1;
      goto LABEL_98;
    }
    memset(v44, 0, sizeof(v44));
    sub_23460B9A8((uint64_t)v45, (uint64_t)v44);
    if (!sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)v44)) {
      goto LABEL_85;
    }
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
    if (!v62)
    {
      sub_2345DAC58((uint64_t)&v61);
LABEL_85:
      char v27 = 1;
      goto LABEL_92;
    }
    if (sub_23460F404((uint64_t)&v61))
    {
      uint64_t v23 = NSString;
      uint64_t v24 = sub_23460F43C(&v61);
      if (*(char *)(v24 + 23) >= 0) {
        goto LABEL_89;
      }
    }
    else
    {
      Typeid = (pxrInternal__aapl__pxrReserved__::VtValue *)pxrInternal__aapl__pxrReserved__::VtValue::GetTypeid((pxrInternal__aapl__pxrReserved__::VtValue *)&v61);
      if (!pxrInternal__aapl__pxrReserved__::VtValue::_CanCast(Typeid, &stru_26E762B00, v29))
      {
        pxrInternal__aapl__pxrReserved__::VtValue::GetTypeName((uint64_t *)__p, (pxrInternal__aapl__pxrReserved__::VtValue *)&v61);
        uint64_t v38 = __p;
        if (SBYTE7(v43) < 0) {
          uint64_t v38 = (void **)__p[0];
        }
        NSLog(&cfstr_WarningInvalid.isa, v38);
        if (SBYTE7(v43) < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_91;
      }
      int v30 = sub_23460F4E0((uint64_t)&v61);
      sub_2345E0670(&v61, v30);
      uint64_t v23 = NSString;
      uint64_t v24 = sub_23460F43C(&v61);
      if (*(char *)(v24 + 23) >= 0)
      {
LABEL_89:
        objc_msgSend_stringWithUTF8String_(v23, v25, v24, v26);
        goto LABEL_90;
      }
    }
    objc_msgSend_stringWithUTF8String_(v23, v25, *(void *)v24, v26);
    uint64_t v31 = LABEL_90:;

    id v8 = (id)v31;
LABEL_91:
    id v8 = v8;
    sub_2345DAC58((uint64_t)&v61);
    char v27 = 0;
LABEL_92:
    if ((BYTE8(v44[1]) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v44[1] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v44[1]);
    if (*((void *)&v44[0] + 1)) {
      sub_2346091F8(*((uint64_t *)&v44[0] + 1));
    }
    if (v27) {
      goto LABEL_97;
    }
    char v32 = 0;
LABEL_98:
    if ((BYTE8(v45[1]) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v45[1] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v45[1]);
    if (*((void *)&v45[0] + 1)) {
      sub_2346091F8(*((uint64_t *)&v45[0] + 1));
    }
    if (v32) {
      goto LABEL_103;
    }
    char v33 = 0;
LABEL_105:
    if ((v46 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v46 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((BYTE8(v48) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v48 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v48);
    if (*((void *)&v47 + 1)) {
      sub_2346091F8(*((uint64_t *)&v47 + 1));
    }
    if ((BYTE8(v50) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v50 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v50);
    if (*((void *)&v49 + 1)) {
      sub_2346091F8(*((uint64_t *)&v49 + 1));
    }
    if (v33) {
      goto LABEL_116;
    }
    char v34 = 0;
LABEL_118:
    if ((v51[3] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v51[3] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v51[2]);
    if (v51[1]) {
      sub_2346091F8(v51[1]);
    }
    if (v34) {
      goto LABEL_123;
    }
    char v35 = 0;
LABEL_125:
    if ((v52[3] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v52[3] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v52[2]);
    if (v52[1]) {
      sub_2346091F8(v52[1]);
    }
    if (v35) {
      goto LABEL_130;
    }
    char v36 = 0;
LABEL_131:
    if ((BYTE8(v54) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v54 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v54);
    if (*((void *)&v53 + 1)) {
      sub_2346091F8(*((uint64_t *)&v53 + 1));
    }
    if (v36) {
      goto LABEL_136;
    }
    char v37 = 0;
LABEL_138:
    if (((uint64_t)v55._proxyPrimPath._propPart._poolHandle & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v55._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v55._proxyPrimPath);
    if (v55._prim._p.px) {
      sub_2346091F8((uint64_t)v55._prim._p.px);
    }
    if (((uint64_t)v58._proxyPrimPath._propPart._poolHandle & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v58._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v58._proxyPrimPath);
    if (v58._prim._p.px) {
      sub_2346091F8((uint64_t)v58._prim._p.px);
    }
    if ((v37 & 1) == 0) {
      break;
    }
    v9 += 32;
    if (v10 + 32 == v40) {
      goto LABEL_161;
    }
  }
  *(void *)&v58._type = &v56;
  sub_234612D18((void ***)&v58);
LABEL_157:
  MEMORY[0x237DC20E0](&v58._propName);

  return v8;
}

+ (id)USDPreviewSurfaceDefaults
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = [USKData alloc];
  uint64_t v5 = (char *)&off_26E7630D0 + 2;
  operator new();
}

+ (id)targetPropertyWithProperty:(id)a3
{
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3)
  {
    objc_msgSend_usdProperty(v3, v4, v5, v6);
    int v8 = v24[0];
    uint64_t v9 = v24[3];
  }
  else
  {
    uint64_t v9 = 0;
    int v8 = 0;
    memset(v24, 0, sizeof(v24));
  }
  if ((v9 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v24[2]);
  if (v24[1]) {
    sub_2346091F8(v24[1]);
  }
  if (v8 == 3)
  {
    memset(v24, 0, sizeof(v24));
    if (v7) {
      objc_msgSend_usdProperty(v7, v10, v11, v12);
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    sub_23460B484((uint64_t)v23, (uint64_t)v24);
    if ((BYTE8(v23[1]) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23[1] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v23[1]);
    if (*((void *)&v23[0] + 1)) {
      sub_2346091F8(*((uint64_t *)&v23[0] + 1));
    }
    memset(v23, 0, sizeof(v23));
    sub_23460B9A8((uint64_t)v24, (uint64_t)v23);
    if (LODWORD(v23[0]) == LODWORD(v24[0])
      && *(_OWORD *)((char *)v23 + 8) == *(_OWORD *)&v24[1]
      && (*((void *)&v23[1] + 1) & 0xFFFFFFFFFFFFFFF8) == (v24[3] & 0xFFFFFFFFFFFFFFF8))
    {
      id v13 = v7;
    }
    else
    {
      uint64_t v14 = [USKProperty alloc];
      int v18 = v23[0];
      uint64_t v19 = *((void *)&v23[0] + 1);
      if (*((void *)&v23[0] + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v23[0] + 1) + 48), 1uLL, memory_order_relaxed);
      }
      sub_2345EBC84(&v20, &v23[1]);
      sub_2345EBCD0(&v21, (_DWORD *)&v23[1] + 1);
      uint64_t v22 = *((void *)&v23[1] + 1);
      if ((BYTE8(v23[1]) & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23[1] + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v22 &= 0xFFFFFFFFFFFFFFF8;
      }
      id v13 = (id)objc_msgSend_initWithUsdProperty_(v14, v15, (uint64_t)&v18, v16);
      if ((v22 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2345EBD10((uint64_t)&v20);
      if (v19) {
        sub_2346091F8(v19);
      }
    }
    if ((BYTE8(v23[1]) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v23[1] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v23[1]);
    if (*((void *)&v23[0] + 1)) {
      sub_2346091F8(*((uint64_t *)&v23[0] + 1));
    }
    if ((v24[3] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v24[3] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v24[2]);
    if (v24[1]) {
      sub_2346091F8(v24[1]);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)meshGroupsWithNode:(id)a3
{
  id v3 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(&v30, 0, 32);
  if (v3) {
    objc_msgSend_usdPrim(v3, v4, v5, v6);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v28, &v30);
  *((void *)&v29 + 1) = 0;
  uint64_t v27 = 0;
  *(void *)&long long v28 = MEMORY[0x263F907A0] + 16;
  v25 = 0;
  uint64_t v26 = 0;
  pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::GetMaterialBindSubsets((uint64_t *)&v25, (pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&v28);
  int v8 = v25;
  for (i = v26; v8 != i; int v8 = (const pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)((char *)v8 + 24))
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v22, v8);
    uint64_t v22 = (const pxrInternal__aapl__pxrReserved__::UsdSchemaBase **)(MEMORY[0x263F906E0] + 16);
    uint64_t v10 = [USKNode alloc];
    sub_2346128E8((uint64_t)v18, &v23, &v24);
    id v13 = objc_msgSend_initWithUsdPrim_(v10, v11, (uint64_t)v18, v12);
    if ((v21 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v21 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v20);
    if (v19) {
      sub_2346091F8(v19);
    }
    objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15);

    MEMORY[0x237DC1FE0](&v22);
  }
  id v16 = v7;
  uint64_t v22 = &v25;
  sub_234612F60((void ***)&v22);
  MEMORY[0x237DC2390](&v28);
  if (((uint64_t)v30._proxyPrimPath._propPart._poolHandle & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v30._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v30._proxyPrimPath);
  if (v30._prim._p.px) {
    sub_2346091F8((uint64_t)v30._prim._p.px);
  }

  return v16;
}

+ (id)meshUniqueAndTriangulate:(id)a3 names:(id)a4
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v131 = a4;
  v132 = v5;
  id v133 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_type(v5, v6, v7, v8);
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9 == @"Mesh")
  {
    memset(&v168, 0, 32);
    if (v5) {
      objc_msgSend_usdPrim(v5, v10, v11, v12);
    }
    long long v166 = 0u;
    long long v167 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    id v20 = v131;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v164, (uint64_t)v184, 16);
    if (v24)
    {
      int v25 = 0;
      uint64_t v26 = *(void *)v165;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v165 != v26) {
            objc_enumerationMutation(v20);
          }
          v25 |= objc_msgSend_isEqualToString_(*(void **)(*((void *)&v164 + 1) + 8 * i), v22, @"points", v23);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v164, (uint64_t)v184, 16);
      }
      while (v24);

      if (v25)
      {
        uint64_t v163 = 0;
        long long v162 = 0u;
        memset(v161, 0, sizeof(v161));
        long long v159 = 0u;
        long long v160 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        UsdPrim v30 = objc_msgSend_property_(v132, v28, @"faceVertexIndices", v29);
        char v34 = objc_msgSend_data(v30, v31, v32, v33);
        uint64_t v38 = v34;
        if (v34)
        {
          objc_msgSend_value(v34, v35, v36, v37);
        }
        else
        {
          uint64_t v174 = 0;
          unint64_t v173 = 0;
        }
        sub_234610EB4((uint64_t *)&v173, (uint64_t)&v176);
        sub_2345D9DC0((uint64_t)&v161[1]);
        *(_OWORD *)&v161[1] = v176;
        *(_OWORD *)&v161[3] = v177;
        long long v176 = 0u;
        long long v177 = 0u;
        v161[5] = v178;
        *(void *)&long long v178 = 0;
        sub_2345D9DC0((uint64_t)&v176);
        sub_2345DAC58((uint64_t)&v173);

        uint64_t v42 = objc_msgSend_property_(v132, v40, @"faceVertexCounts", v41);
        uint64_t v46 = objc_msgSend_data(v42, v43, v44, v45);
        long long v50 = v46;
        if (v46)
        {
          objc_msgSend_value(v46, v47, v48, v49);
        }
        else
        {
          uint64_t v174 = 0;
          unint64_t v173 = 0;
        }
        sub_234610EB4((uint64_t *)&v173, (uint64_t)&v176);
        sub_2345D9DC0((uint64_t)&v159);
        long long v159 = v176;
        long long v160 = v177;
        v130 = &v159;
        long long v176 = 0u;
        long long v177 = 0u;
        v161[0] = v178;
        *(void *)&long long v178 = 0;
        sub_2345D9DC0((uint64_t)&v176);
        sub_2345DAC58((uint64_t)&v173);

        uint64_t v182 = 0;
        uint64_t v183 = 0;
        long long v53 = objc_msgSend_property_(v132, v51, @"points", v52);
        uint64_t v57 = objc_msgSend_data(v53, v54, v55, v56);
        uint64_t v61 = v57;
        if (v57)
        {
          objc_msgSend_value(v57, v58, v59, v60);
        }
        else
        {
          uint64_t v182 = 0;
          uint64_t v183 = 0;
        }

        sub_2345DDDA0(&v176, &v182);
        *(void *)&long long v179 = 0;
        long long v177 = 0u;
        long long v178 = 0u;
        MEMORY[0x237DC2530]((char *)&v179 + 8, "points");
        uint64_t v62 = (pxrInternal__aapl__pxrReserved__::Sdf_ValueTypeNamesType *)atomic_load(MEMORY[0x263F90560]);
        if (!v62) {
          uint64_t v62 = sub_2345DEBD0(MEMORY[0x263F90560]);
        }
        *(void *)&long long v180 = *((void *)v62 + 83);
        MEMORY[0x237DC2530]((char *)&v180 + 8, "vertex");
        LODWORD(v181) = 1;
        uint64_t v63 = v158;
        v129 = (char *)&v157 + 8;
        if ((unint64_t)v158 >= *((void *)&v158 + 1))
        {
          uint64_t v64 = sub_2345DECA0((uint64_t *)&v157 + 1, (uint64_t)&v176);
        }
        else
        {
          sub_2345DEC28((uint64_t)&v157 + 8, (uint64_t)&v176);
          uint64_t v64 = v63 + 88;
        }
        *(void *)&long long v158 = v64;
        if ((BYTE8(v180) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v180 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if ((BYTE8(v179) & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v179 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345D9DC0((uint64_t)&v177);
        sub_2345DAC58((uint64_t)&v176);
        v154 = 0;
        v155 = 0;
        unint64_t v156 = 0;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        id v65 = v20;
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v150, (uint64_t)v175, 16);
        if (v69)
        {
          obuint64_t j = 0;
          BOOL v70 = 0;
          uint64_t v71 = *(void *)v151;
          do
          {
            uint64_t v72 = 0;
            do
            {
              if (*(void *)v151 != v71) {
                objc_enumerationMutation(v65);
              }
              v73 = *(void **)(*((void *)&v150 + 1) + 8 * v72);
              if ((objc_msgSend_isEqualToString_(v73, v67, @"faceVertexIndices", v68) & 1) == 0
                && (objc_msgSend_isEqualToString_(v73, v67, @"faceVertexCounts", v68) & 1) == 0
                && (objc_msgSend_isEqualToString_(v73, v67, @"points", v68) & 1) == 0)
              {
                if ((objc_msgSend_isEqualToString_(v73, v67, @"normals", v68) & 1) != 0
                  || objc_msgSend_isEqualToString_(v73, v74, @"primvar:normals", v75))
                {
                  obuint64_t j = sub_234611050((uint64_t *)&v157, v132) ^ 1;
                }
                else if (objc_msgSend_isEqualToString_(v73, v76, @"tangents", v77))
                {
                  BOOL v70 = !sub_234611100((uint64_t *)&v157, v132);
                }
                else
                {
                  id v78 = v73;
                  if ((objc_msgSend_hasPrefix_(v78, v79, @"primvars:", v80) & 1) == 0)
                  {
                    uint64_t v83 = objc_msgSend_stringWithFormat_(NSString, v81, @"primvars:%@", v82, v78, v129, v130);

                    id v78 = (id)v83;
                  }
                  sub_234610738((uint64_t *)&v157, v132, v78);
                  if (!atomic_load(MEMORY[0x263F90560])) {
                    sub_2345DEBD0(MEMORY[0x263F90560]);
                  }
                  if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==()) {
                    goto LABEL_56;
                  }
                  if (!atomic_load(MEMORY[0x263F90560])) {
                    sub_2345DEBD0(MEMORY[0x263F90560]);
                  }
                  if (pxrInternal__aapl__pxrReserved__::SdfValueTypeName::operator==())
                  {
LABEL_56:
                    v86 = (uint64_t *)(v158 - 32);
                    v87 = v155;
                    if ((unint64_t)v155 >= v156)
                    {
                      v89 = sub_234613168(&v154, v86);
                    }
                    else
                    {
                      uint64_t v88 = *v86;
                      *(void *)v155 = *v86;
                      if ((v88 & 7) != 0
                        && (atomic_fetch_add_explicit((atomic_uint *volatile)(v88 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
                      {
                        *(void *)v87 &= 0xFFFFFFFFFFFFFFF8;
                      }
                      v89 = v87 + 8;
                    }
                    v155 = v89;
                  }
                }
              }
              ++v72;
            }
            while (v69 != v72);
            uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v67, (uint64_t)&v150, (uint64_t)v175, 16);
            uint64_t v69 = v90;
          }
          while (v90);
        }
        else
        {
          obuint64_t j = 0;
          BOOL v70 = 0;
        }

        long long v148 = 0u;
        long long v149 = 0u;
        pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)&v148, &v168);
        *((void *)&v149 + 1) = 0;
        uint64_t v147 = 0;
        *(void *)&long long v148 = MEMORY[0x263F907A0] + 16;
        v145 = 0;
        v146 = 0;
        pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI::GetMaterialBindSubsets((uint64_t *)&v145, (pxrInternal__aapl__pxrReserved__::UsdShadeMaterialBindingAPI *)&v148);
        if (v145 != v146)
        {
          memset(v144, 0, sizeof(v144));
          pxrInternal__aapl__pxrReserved__::UsdSchemaBase::UsdSchemaBase((pxrInternal__aapl__pxrReserved__::UsdSchemaBase *)v144, v145);
          v144[0] = MEMORY[0x263F906E0] + 16;
          memset(v143, 0, sizeof(v143));
          pxrInternal__aapl__pxrReserved__::UsdGeomSubset::GetIndicesAttr((uint64_t *)v143, (pxrInternal__aapl__pxrReserved__::UsdGeomSubset *)v144);
          *(void *)&long long v178 = 0;
          long long v176 = 0u;
          long long v177 = 0u;
          pxrInternal__aapl__pxrReserved__::UsdAttribute::_Get<pxrInternal__aapl__pxrReserved__::VtArray<int>>();
        }
        v91 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_2345D7B98((uint64_t)&v157);
        if ((obj | v70))
        {
          if (obj) {
            sub_2345DC1CC((uint64_t)&v157, 0);
          }
          if (v70 && v155 != v154)
          {
            unint64_t v92 = *(void *)v154 & 0xFFFFFFFFFFFFFFF8;
            uint64_t v93 = v92 ? v92 + 16 : pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v91);
            if (*(char *)(v93 + 23) < 0)
            {
              sub_2345DBA34(__p, *(void **)v93, *(void *)(v93 + 8));
            }
            else
            {
              long long v94 = *(_OWORD *)v93;
              uint64_t v142 = *(void *)(v93 + 16);
              *(_OWORD *)__p = v94;
            }
            sub_2345DD920(&v157, 0, (uint64_t)__p, 3.1416);
            if (SHIBYTE(v142) < 0) {
              operator delete(__p[0]);
            }
          }
        }
        sub_2346362C4((uint64_t)&v157);
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        id obja = v65;
        uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v95, (uint64_t)&v137, (uint64_t)v172, 16);
        if (v96)
        {
          uint64_t v97 = *(void *)v138;
          do
          {
            for (uint64_t j = 0; j != v96; ++j)
            {
              if (*(void *)v138 != v97) {
                objc_enumerationMutation(obja);
              }
              v99 = *(void **)(*((void *)&v137 + 1) + 8 * j);
              unint64_t v173 = 0;
              id v100 = v99;
              uint64_t v104 = objc_msgSend_UTF8String(v100, v101, v102, v103);
              MEMORY[0x237DC2530](&v173, v104);
              uint64_t v106 = *((void *)&v157 + 1);
              uint64_t v107 = v158;
              while (1)
              {
                if (v106 == v107) {
                  goto LABEL_112;
                }
                uint64_t v181 = 0;
                long long v179 = 0u;
                long long v180 = 0u;
                long long v177 = 0u;
                long long v178 = 0u;
                long long v176 = 0u;
                sub_2345DDDA0(&v176, (void *)v106);
                long long v108 = *(_OWORD *)(v106 + 32);
                long long v177 = *(_OWORD *)(v106 + 16);
                long long v178 = v108;
                uint64_t v109 = *(void *)(v106 + 48);
                *(void *)&long long v179 = v109;
                if (v109)
                {
                  v110 = (atomic_ullong *)(v109 - 16);
                  if (*((void *)&v178 + 1)) {
                    v110 = (atomic_ullong *)*((void *)&v178 + 1);
                  }
                  atomic_fetch_add_explicit(v110, 1uLL, memory_order_relaxed);
                }
                uint64_t v111 = *(void *)(v106 + 56);
                *((void *)&v179 + 1) = v111;
                if ((v111 & 7) != 0
                  && (atomic_fetch_add_explicit((atomic_uint *volatile)(v111 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
                {
                  *((void *)&v179 + 1) &= 0xFFFFFFFFFFFFFFF8;
                }
                *(void *)&long long v180 = *(void *)(v106 + 64);
                uint64_t v112 = *(void *)(v106 + 72);
                *((void *)&v180 + 1) = v112;
                if ((v112 & 7) != 0
                  && (atomic_fetch_add_explicit((atomic_uint *volatile)(v112 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
                {
                  *((void *)&v180 + 1) &= 0xFFFFFFFFFFFFFFF8;
                }
                LODWORD(v181) = *(_DWORD *)(v106 + 80);
                uint64_t v113 = *((void *)&v179 + 1);
                if ((*((void *)&v179 + 1) & 0xFFFFFFFFFFFFFFF8) == (v173 & 0xFFFFFFFFFFFFFFF8)) {
                  break;
                }
                if ((BYTE8(v180) & 7) != 0)
                {
                  atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v180 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
                  uint64_t v113 = *((void *)&v179 + 1);
                }
                if ((v113 & 7) != 0) {
                  atomic_fetch_add_explicit((atomic_uint *volatile)(v113 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
                }
                sub_2345D9DC0((uint64_t)&v177);
                sub_2345DAC58((uint64_t)&v176);
                v106 += 88;
              }
              v114 = [USKData alloc];
              sub_2345DDDA0(v171, &v176);
              pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v136, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v180);
              v116 = objc_msgSend_initWithVtValue_typeName_(v114, v115, (uint64_t)v171, (uint64_t)&v136);
              if ((v136 & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(v136 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
              sub_2345DAC58((uint64_t)v171);
              objc_msgSend_addObject_(v133, v117, (uint64_t)v116, v118);

              if ((BYTE8(v180) & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v180 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
              if ((BYTE8(v179) & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v179 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
              sub_2345D9DC0((uint64_t)&v177);
              sub_2345DAC58((uint64_t)&v176);
LABEL_112:
              if ((v173 & 7) != 0) {
                atomic_fetch_add_explicit((atomic_uint *volatile)(v173 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
              }
            }
            uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v105, (uint64_t)&v137, (uint64_t)v172, 16);
          }
          while (v96);
        }

        v119 = (pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v162;
        if (*((void *)&v162 + 1) != (void)v162)
        {
          *(void *)&long long v178 = 0;
          long long v176 = 0u;
          long long v177 = 0u;
          unint64_t v120 = 3 * *(void *)v162;
          LODWORD(v143[0]) = 0;
          unint64_t v173 = (unint64_t)v143;
          sub_2345DA8E4((unint64_t *)&v176, v120, (_DWORD **)&v173);
          sub_2345D9D28(v119);
          v121 = (int *)*((void *)v119 + 4);
          sub_2345D9D28(v119);
          uint64_t v122 = *((void *)v119 + 4) + 4 * *(void *)v119;
          if (v121 != (int *)v122)
          {
            uint64_t v123 = 0;
            do
            {
              uint64_t v124 = *v121;
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v161[1]);
              int v125 = 3 * v124;
              LODWORD(v124) = *(_DWORD *)(v161[5] + 12 * v124);
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v176);
              *(_DWORD *)(v178 + v123) = v124;
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v161[1]);
              LODWORD(v124) = *(_DWORD *)(v161[5] + 4 * v125 + 4);
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v176);
              *(_DWORD *)(v178 + v123 + 4) = v124;
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v161[1]);
              LODWORD(v124) = *(_DWORD *)(v161[5] + 4 * v125 + 8);
              sub_2345D9D28((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v176);
              *(_DWORD *)(v178 + v123 + 8) = v124;
              ++v121;
              v123 += 12;
            }
            while (v121 != (int *)v122);
          }
          v126 = [USKData alloc];
          v169 = &off_26E763690;
          sub_2345F54A8();
        }
        v127 = [USKData alloc];
        v170 = &off_26E763690;
        sub_2345F54A8();
      }
    }
    else
    {
    }
    NSLog(&cfstr_ErrorObjectIsM.isa);
    id v39 = v133;
    if (((uint64_t)v168._proxyPrimPath._propPart._poolHandle & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v168._proxyPrimPath._propPart._poolHandle & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v168._proxyPrimPath);
    if (v168._prim._p.px) {
      sub_2346091F8((uint64_t)v168._prim._p.px);
    }
    int v18 = v133;
  }
  else
  {
    id v13 = objc_msgSend_name(v5, v10, v11, v12);
    uint64_t v17 = objc_msgSend_stringValue(v13, v14, v15, v16);
    NSLog(&cfstr_ErrorNodeIsNot.isa, v17);

    int v18 = v133;
    id v19 = v133;
  }

  return v133;
}

@end