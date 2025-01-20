@interface USKScene
+ (id)newSceneWithData:(id)a3 name:(id)a4;
+ (id)newSceneWithData:(id)a3 name:(id)a4 error:(id *)a5;
+ (id)newSceneWithURL:(id)a3;
+ (id)newSceneWithURL:(id)a3 error:(id *)a4;
- (BOOL)exportToURL:(id)a3;
- (BOOL)setCustomMetadata:(id)a3 value:(id)a4;
- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5;
- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4;
- (TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage>)usdStage;
- (USKNode)rootNode;
- (USKScene)init;
- (USKScene)initWithData:(id)a3 name:(id)a4;
- (USKScene)initWithData:(id)a3 name:(id)a4 error:(id *)a5;
- (USKScene)initWithUsdStage:(TfRefPtr<pxrInternal__aapl__pxrReserved__:(id)a4 :UsdStage>)a3 fileURL:;
- (id).cxx_construct;
- (id)customMetadataWithKey:(id)a3;
- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4;
- (id)initSceneFromURL:(id)a3;
- (id)initSceneFromURL:(id)a3 error:(id *)a4;
- (id)loadedNodeIterator;
- (id)metadata;
- (id)metadataWithKey:(id)a3;
- (id)newNodeAtPath:(id)a3 type:(id)a4;
- (id)newNodeAtPath:(id)a3 type:(id)a4 specifier:(id)a5;
- (id)nodeAtPath:(id)a3;
- (id)nodeIterator;
- (id)objectAtPath:(id)a3;
- (id)propertyAtPath:(id)a3;
- (id)subLayerOffsets;
- (id)subLayerPaths;
- (void)addSubLayerWithPath:(id)a3;
- (void)addSubLayerWithPath:(id)a3 offset:(id)a4;
- (void)dealloc;
- (void)dumpUSDA;
- (void)save;
- (void)saveAndCreateARKitUSDZPackageWithURL:(id)a3;
- (void)saveAndCreateUSDZPackageWithURL:(id)a3;
@end

@implementation USKScene

+ (id)newSceneWithURL:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_newSceneWithURL_error_, a3, 0);
}

+ (id)newSceneWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    v6 = sub_234604468();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }

    v7 = 0;
  }
  else
  {
    v26[0] = 0;
    v26[1] = 0;
    sub_23460A160(v26);
    sub_23460A1DC();
    v25 = 0;
    objc_msgSend_path(v5, v8, v9, v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    sub_2345DB968(&__p, v15);
    pxrInternal__aapl__pxrReserved__::UsdStage::CreateNew();
    if (v24 < 0) {
      operator delete(__p);
    }

    sub_23460A22C();
    if (v25)
    {
      v19 = [USKScene alloc];
      v22 = v25;
      sub_234609428((uint64_t *)&v22);
      v7 = objc_msgSend_initWithUsdStage_fileURL_(v19, v20, (uint64_t)&v22, (uint64_t)v5);
      sub_2345DBB48(&v22);
    }
    else if (a4)
    {
      sub_23460A27C((uint64_t)v26, v16, v17, v18);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    sub_2345DBB48(&v25);
    sub_23460A164((uint64_t)v26);
  }

  return v7;
}

+ (id)newSceneWithData:(id)a3 name:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_newSceneWithData_name_error_, a3, a4);
}

+ (id)newSceneWithData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    uint64_t v9 = sub_234604468();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }
  }
  else
  {
    id v10 = v7;
    uint64_t v14 = objc_msgSend_bytes(v10, v11, v12, v13);
    uint64_t v18 = objc_msgSend_length(v10, v15, v16, v17);
    sub_2345DB968(v44, "ArMemoryResolver");
    pxrInternal__aapl__pxrReserved__::ArSetPreferredResolver();
    if (SHIBYTE(v45) < 0) {
      operator delete(v44[0]);
    }
    v21 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@?address=%lx&size=%ld", v20, v8, v14, v18);
    v44[0] = 0;
    v44[1] = 0;
    uint64_t v45 = 0;
    uint64_t v9 = v21;
    v25 = (char *)objc_msgSend_UTF8String(v9, v22, v23, v24);
    v26 = (pxrInternal__aapl__pxrReserved__ *)sub_2345DB968(v44, v25);
    memset(v43, 0, sizeof(v43));
    pxrInternal__aapl__pxrReserved__::ArGetResolver(v26);
    pxrInternal__aapl__pxrReserved__::ArResolver::CreateDefaultContextForAsset();
    v42[0] = 0;
    v42[1] = 0;
    sub_23460A160(v42);
    sub_23460A1DC();
    v41 = 0;
    id v27 = v8;
    v31 = (char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
    sub_2345DB968(&__p, v31);
    pxrInternal__aapl__pxrReserved__::SdfLayer::OpenAsAnonymous();
    if (v40 < 0) {
      operator delete(__p);
    }
    v37 = 0;
    sub_2346094A4((uint64_t *)&__p, (uint64_t *)&v41);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    uint64_t v32 = v39;
    if (v39 && atomic_fetch_add_explicit((atomic_uint *volatile)(v39 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
    }
    sub_23460A22C();
    if (a5)
    {
      sub_23460A27C((uint64_t)v42, v33, v34, v35);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    sub_2345DBB48(&v37);
    sub_234609474(&v41);
    sub_23460A164((uint64_t)v42);
    __p = v43;
    sub_2346090C8((void ***)&__p);
    if (SHIBYTE(v45) < 0) {
      operator delete(v44[0]);
    }
  }

  return 0;
}

- (USKScene)init
{
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    v3 = sub_234604468();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }

    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)USKScene;
  v6 = [(USKScene *)&v9 init];
  if (!v6)
  {
    self = 0;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  pxrInternal__aapl__pxrReserved__::UsdStage::CreateInMemory();
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v6->_usdStage._refBase;
  v6->_usdStage._refBase = v8;
  id v8 = 0;
  sub_2345DBB78(v6 + 24, refBase);
  sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v8);
  if (v6->_usdStage._refBase)
  {
    self = v6;
    v4 = self;
  }
  else
  {
    v4 = 0;
    self = v6;
  }
LABEL_6:

  return v4;
}

- (id)initSceneFromURL:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_initSceneFromURL_error_, a3, 0);
}

- (id)initSceneFromURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    id v8 = sub_234604468();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }

    goto LABEL_5;
  }
  v30.receiver = self;
  v30.super_class = (Class)USKScene;
  id v11 = [(USKScene *)&v30 init];
  self = v11;
  if (!v11
    || (objc_storeStrong((id *)&v11->_fileURL, a3),
        !objc_msgSend_checkResourceIsReachableAndReturnError_(v7, v12, (uint64_t)a4, v13)))
  {
LABEL_5:
    objc_super v9 = 0;
    goto LABEL_6;
  }
  v29[0] = 0;
  v29[1] = 0;
  sub_23460A160(v29);
  sub_23460A1DC();
  objc_msgSend_path(v7, v14, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
  sub_2345DB968(&__p, v21);
  pxrInternal__aapl__pxrReserved__::UsdStage::Open();
  refBase = self->_usdStage._refBase;
  self->_usdStage._refBase = v28;
  v28 = 0;
  sub_2345DBB78(self + 24, (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)refBase);
  sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v28);
  if (v27 < 0) {
    operator delete(__p);
  }

  sub_23460A22C();
  if (self->_usdStage._refBase)
  {
    objc_super v9 = self;
  }
  else if (a4)
  {
    sub_23460A27C((uint64_t)v29, v23, v24, v25);
    objc_super v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v9 = 0;
  }
  sub_23460A164((uint64_t)v29);
LABEL_6:

  return v9;
}

- (USKScene)initWithData:(id)a3 name:(id)a4
{
  return (USKScene *)MEMORY[0x270F9A6D0](self, sel_initWithData_name_error_, a3, a4);
}

- (USKScene)initWithData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    id v10 = sub_234604468();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }
    id v11 = 0;
    uint64_t v12 = self;
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)USKScene;
    uint64_t v14 = [(USKScene *)&v52 init];
    uint64_t v12 = v14;
    if (!v14)
    {
      id v11 = 0;
      goto LABEL_6;
    }
    fileURL = v14->_fileURL;
    v14->_fileURL = 0;

    id v16 = v8;
    uint64_t v20 = objc_msgSend_bytes(v16, v17, v18, v19);
    uint64_t v24 = objc_msgSend_length(v16, v21, v22, v23);
    objc_msgSend_stringWithFormat_(NSString, v25, @"%@?address=%lx&size=%ld", v26, v9, v20, v24);
    v50[0] = 0;
    v50[1] = 0;
    uint64_t v51 = 0;
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_super v30 = (char *)objc_msgSend_UTF8String(v10, v27, v28, v29);
    sub_2345DB968(v50, v30);
    sub_2345DB968(__p, "ArMemoryResolver");
    v31 = (pxrInternal__aapl__pxrReserved__ *)pxrInternal__aapl__pxrReserved__::ArSetPreferredResolver();
    if (SHIBYTE(v49) < 0) {
      operator delete(__p[0]);
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v49 = 0;
    pxrInternal__aapl__pxrReserved__::ArGetResolver(v31);
    pxrInternal__aapl__pxrReserved__::ArResolver::CreateDefaultContextForAsset();
    v47[0] = 0;
    v47[1] = 0;
    sub_23460A160(v47);
    sub_23460A1DC();
    v46 = 0;
    id v32 = v9;
    v36 = (char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
    sub_2345DB968(&v43, v36);
    pxrInternal__aapl__pxrReserved__::SdfLayer::OpenAsAnonymous();
    if (v45 < 0) {
      operator delete(v43);
    }
    sub_2346094A4((uint64_t *)&v43, (uint64_t *)&v46);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v12->_usdStage._refBase;
    v12->_usdStage._refBase = v42;
    v42 = 0;
    sub_2345DBB78(v12 + 24, refBase);
    sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v42);
    uint64_t v38 = v44;
    if (v44 && atomic_fetch_add_explicit((atomic_uint *volatile)(v44 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
    }
    sub_23460A22C();
    if (v12->_usdStage._refBase)
    {
      id v11 = v12;
    }
    else if (a5)
    {
      sub_23460A27C((uint64_t)v47, v39, v40, v41);
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
    sub_234609474(&v46);
    sub_23460A164((uint64_t)v47);
    v43 = __p;
    sub_2346090C8((void ***)&v43);
    if (SHIBYTE(v51) < 0) {
      operator delete(v50[0]);
    }
  }

LABEL_6:
  return v11;
}

- (USKScene)initWithUsdStage:(TfRefPtr<pxrInternal__aapl__pxrReserved__:(id)a4 :UsdStage>)a3 fileURL:
{
  id v7 = a4;
  sub_234627B1C();
  if (dword_2687AA5D8)
  {
    id v8 = sub_234604468();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_23463768C();
    }

    goto LABEL_5;
  }
  v14.receiver = self;
  v14.super_class = (Class)USKScene;
  id v11 = [(USKScene *)&v14 init];
  p_isa = (id *)&v11->super.super.isa;
  if (!v11)
  {
    self = 0;
LABEL_5:
    id v9 = 0;
    goto LABEL_6;
  }
  if (*(void *)a3._refBase)
  {
    refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v11->_usdStage._refBase;
    v11->_usdStage._refBase = *(TfRefBase **)a3._refBase;
    sub_234609428((uint64_t *)a3._refBase);
    sub_2345DBB78(p_isa + 24, refBase);
    objc_storeStrong(p_isa + 4, a4);
    self = p_isa;
    id v9 = self;
  }
  else
  {
    id v9 = 0;
    self = v11;
  }
LABEL_6:

  return v9;
}

- (TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage>)usdStage
{
  uint64_t *v2 = (uint64_t)self->_usdStage._refBase;
  return (TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage>)sub_234609428(v2);
}

- (BOOL)exportToURL:(id)a3
{
  id v4 = a3;
  sub_2345DB554((id *)&self->_usdStage._refBase);
  id v5 = v4;
  id v9 = (char *)objc_msgSend_fileSystemRepresentation(v5, v6, v7, v8);
  sub_2345DB968(&__p, v9);
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v12 = v13;
  char v10 = pxrInternal__aapl__pxrReserved__::UsdStage::Export();
  sub_23460964C((uint64_t)&v12, v13[0]);
  if (v15 < 0) {
    operator delete(__p);
  }

  return v10;
}

- (void)save
{
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(&v5, v2);
  uint64_t v3 = sub_2346052D4(&v5);
  MEMORY[0x237DC2F30](v3, 0);
  uint64_t v4 = v6;
  if (v6)
  {
    if (atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
  }
}

- (void)saveAndCreateUSDZPackageWithURL:(id)a3
{
  id v4 = a3;
  p_usdStage = &self->_usdStage;
  uint64_t v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer((uint64_t *)&v33, v6);
  uint64_t v7 = sub_2346052D4((uint64_t *)&v33);
  MEMORY[0x237DC2F30](v7, 0);
  uint64_t v8 = v34;
  if (v34 && atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
  p_usdStage->_refBase = 0;
  v33 = 0;
  sub_2345DBB78(self + 24, refBase);
  sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v33);
  fileURL = self->_fileURL;
  if (fileURL)
  {
    objc_super v14 = (char *)objc_msgSend_fileSystemRepresentation(fileURL, v10, v11, v12);
    sub_2345DB968(v31, v14);
    MEMORY[0x237DC1F40](&v33, v31);
    id v15 = v4;
    uint64_t v19 = (char *)objc_msgSend_fileSystemRepresentation(v15, v16, v17, v18);
    sub_2345DB968(&v29, v19);
    pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewUsdzPackage();
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v33);
    }
    if (v32 < 0) {
      operator delete(v31[0]);
    }
    objc_msgSend_path(self->_fileURL, v20, v21, v22);
    id v23 = objc_claimAutoreleasedReturnValue();
    char v27 = (char *)objc_msgSend_UTF8String(v23, v24, v25, v26);
    sub_2345DB968(&v33, v27);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    uint64_t v28 = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
    p_usdStage->_refBase = (TfRefBase *)v31[0];
    v31[0] = 0;
    sub_2345DBB78((int)p_usdStage, v28);
    sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)v31);
    if (v35 < 0) {
      operator delete(v33);
    }
  }
  else
  {
    NSLog(&cfstr_UnableToSaveBe.isa);
  }
}

- (void)saveAndCreateARKitUSDZPackageWithURL:(id)a3
{
  id v4 = a3;
  p_usdStage = &self->_usdStage;
  uint64_t v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer((uint64_t *)&v33, v6);
  uint64_t v7 = sub_2346052D4((uint64_t *)&v33);
  MEMORY[0x237DC2F30](v7, 0);
  uint64_t v8 = v34;
  if (v34 && atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
  p_usdStage->_refBase = 0;
  v33 = 0;
  sub_2345DBB78(self + 24, refBase);
  sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v33);
  fileURL = self->_fileURL;
  if (fileURL)
  {
    objc_super v14 = (char *)objc_msgSend_fileSystemRepresentation(fileURL, v10, v11, v12);
    sub_2345DB968(v31, v14);
    MEMORY[0x237DC1F40](&v33, v31);
    id v15 = v4;
    uint64_t v19 = (char *)objc_msgSend_fileSystemRepresentation(v15, v16, v17, v18);
    sub_2345DB968(&v29, v19);
    pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewARKitUsdzPackage();
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v37 < 0) {
      operator delete(v36);
    }
    if (v35 < 0) {
      operator delete(v33);
    }
    if (v32 < 0) {
      operator delete(v31[0]);
    }
    objc_msgSend_path(self->_fileURL, v20, v21, v22);
    id v23 = objc_claimAutoreleasedReturnValue();
    char v27 = (char *)objc_msgSend_UTF8String(v23, v24, v25, v26);
    sub_2345DB968(&v33, v27);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    uint64_t v28 = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
    p_usdStage->_refBase = (TfRefBase *)v31[0];
    v31[0] = 0;
    sub_2345DBB78((int)p_usdStage, v28);
    sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)v31);
    if (v35 < 0) {
      operator delete(v33);
    }
  }
  else
  {
    NSLog(&cfstr_UnableToSaveBe.isa);
  }
}

- (id)nodeAtPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v4, v6, v7, v8);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetPrimAtPath((uint64_t *)&v19, v5, (const pxrInternal__aapl__pxrReserved__::SdfPath *)v18);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v18);
    if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v19))
    {
      id v9 = [USKNode alloc];
      int v13 = v19;
      uint64_t v14 = *((void *)&v19 + 1);
      if (*((void *)&v19 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v19 + 1) + 48), 1uLL, memory_order_relaxed);
      }
      sub_2345EBC84(&v15, &v20);
      sub_2345EBCD0(&v16, (_DWORD *)&v20 + 1);
      uint64_t v17 = *((void *)&v20 + 1);
      if ((BYTE8(v20) & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v17 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v11 = objc_msgSend_initWithUsdPrim_withSceneOwner_(v9, v10, (uint64_t)&v13, (uint64_t)self);
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
    if ((BYTE8(v20) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v20);
    if (*((void *)&v19 + 1)) {
      sub_2346091F8(*((uint64_t *)&v19 + 1));
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)propertyAtPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v4, v6, v7, v8);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetObjectAtPath(&v19, v5, (const pxrInternal__aapl__pxrReserved__::SdfPath *)v18);
    sub_234605E20((uint64_t)&v19, (uint64_t)&v23);
    if ((v22 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v21);
    if (v20) {
      sub_2346091F8(v20);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)v18);
    if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v23))
    {
      id v9 = [USKProperty alloc];
      int v13 = v23;
      uint64_t v14 = *((void *)&v23 + 1);
      if (*((void *)&v23 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v23 + 1) + 48), 1uLL, memory_order_relaxed);
      }
      sub_2345EBC84(&v15, &v24);
      sub_2345EBCD0(&v16, (_DWORD *)&v24 + 1);
      uint64_t v17 = *((void *)&v24 + 1);
      if ((BYTE8(v24) & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v24 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v17 &= 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v11 = objc_msgSend_initWithUsdProperty_withSceneOwner_(v9, v10, (uint64_t)&v13, (uint64_t)self);
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
    if ((BYTE8(v24) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v24 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v24);
    if (*((void *)&v23 + 1)) {
      sub_2346091F8(*((uint64_t *)&v23 + 1));
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)objectAtPath:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  if (v4) {
    objc_msgSend_path(v4, v5, v6, v7);
  }
  else {
    *(void *)&long long v27 = 0;
  }
  pxrInternal__aapl__pxrReserved__::UsdStage::GetObjectAtPath((uint64_t *)&v29, v8, (const pxrInternal__aapl__pxrReserved__::SdfPath *)&v27);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v27);
  long long v27 = 0u;
  long long v28 = 0u;
  sub_234606334((uint64_t)&v29, (uint64_t)&v27);
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v27))
  {
    id v9 = [USKNode alloc];
    int v22 = v27;
    uint64_t v23 = *((void *)&v27 + 1);
    if (*((void *)&v27 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v27 + 1) + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v24, &v28);
    sub_2345EBCD0(&v25, (_DWORD *)&v28 + 1);
    uint64_t v26 = *((void *)&v28 + 1);
    if ((BYTE8(v28) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v26 &= 0xFFFFFFFFFFFFFFF8;
    }
    self = (USKScene *)objc_msgSend_initWithUsdPrim_withSceneOwner_(v9, v10, (uint64_t)&v22, (uint64_t)self);
    if ((v26 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v26 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v24);
    if (v23) {
      sub_2346091F8(v23);
    }
    int v11 = 1;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    sub_234605E20((uint64_t)&v29, (uint64_t)&v20);
    if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v20))
    {
      uint64_t v12 = [USKProperty alloc];
      int v15 = v20;
      uint64_t v16 = *((void *)&v20 + 1);
      if (*((void *)&v20 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v20 + 1) + 48), 1uLL, memory_order_relaxed);
      }
      sub_2345EBC84(&v17, &v21);
      sub_2345EBCD0(&v18, (_DWORD *)&v21 + 1);
      uint64_t v19 = *((void *)&v21 + 1);
      if ((BYTE8(v21) & 7) != 0
        && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v21 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
      {
        v19 &= 0xFFFFFFFFFFFFFFF8;
      }
      self = (USKScene *)objc_msgSend_initWithUsdProperty_withSceneOwner_(v12, v13, (uint64_t)&v15, (uint64_t)self);
      if ((v19 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2345EBD10((uint64_t)&v17);
      if (v16) {
        sub_2346091F8(v16);
      }
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
    }
    if ((BYTE8(v21) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v21 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v21);
    if (*((void *)&v20 + 1)) {
      sub_2346091F8(*((uint64_t *)&v20 + 1));
    }
  }
  if ((BYTE8(v28) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v28);
  if (*((void *)&v27 + 1)) {
    sub_2346091F8(*((uint64_t *)&v27 + 1));
  }
  if ((BYTE8(v30) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v30 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v30);
  if (*((void *)&v29 + 1)) {
    sub_2346091F8(*((uint64_t *)&v29 + 1));
  }
  if (!v11) {
    self = 0;
  }

  return self;
}

- (id)newNodeAtPath:(id)a3 type:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_newNodeAtPath_type_specifier_, a3, a4);
}

- (id)newNodeAtPath:(id)a3 type:(id)a4 specifier:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = (__CFString *)a5;
  if (!v8)
  {
    int v17 = 0;
    goto LABEL_56;
  }
  *(_OWORD *)&v46[8] = 0u;
  long long v47 = 0uLL;
  *(_DWORD *)&v46[8] = 1;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  if (!v10 || @"SdfSpecifierDef" == v10)
  {
    int v18 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v19, v20, v21);
    uint64_t v45 = 0;
    pxrInternal__aapl__pxrReserved__::UsdStage::DefinePrim(&v48, v18, (const SdfPath *)v46, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v45);
    *(_DWORD *)&v46[8] = v48;
    uint64_t v22 = v49;
    uint64_t v49 = 0;
    uint64_t v23 = *(void *)&v46[16];
    *(void *)&v46[16] = v22;
    if (v23) {
      sub_2346091F8(v23);
    }
    sub_2345EBF68((uint64_t)&v47, &v50);
    sub_2345EBFC0((uint64_t)&v47 + 4);
    if ((BYTE8(v47) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v47 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    *((void *)&v47 + 1) = v51;
    uint64_t v51 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v50);
    if (v49) {
      sub_2346091F8(v49);
    }
    if ((v45 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    goto LABEL_30;
  }
  if (@"SdfSpecifierOver" == v10)
  {
    int v24 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v25, v26, v27);
    pxrInternal__aapl__pxrReserved__::UsdStage::OverridePrim(&v48, v24, (const SdfPath *)v46);
    *(_DWORD *)&v46[8] = v48;
    uint64_t v28 = v49;
    uint64_t v49 = 0;
    uint64_t v29 = *(void *)&v46[16];
    *(void *)&v46[16] = v28;
    if (v29) {
      sub_2346091F8(v29);
    }
    sub_2345EBF68((uint64_t)&v47, &v50);
    sub_2345EBFC0((uint64_t)&v47 + 4);
    if ((BYTE8(v47) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v47 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    *((void *)&v47 + 1) = v51;
    uint64_t v51 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v50);
    if (v49) {
      sub_2346091F8(v49);
    }
    goto LABEL_29;
  }
  if (@"SdfSpecifierClass" == v10)
  {
    int v11 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v12, v13, v14);
    pxrInternal__aapl__pxrReserved__::UsdStage::CreateClassPrim(&v48, v11, (const SdfPath *)v46);
    *(_DWORD *)&v46[8] = v48;
    uint64_t v15 = v49;
    uint64_t v49 = 0;
    uint64_t v16 = *(void *)&v46[16];
    *(void *)&v46[16] = v15;
    if (v16) {
      sub_2346091F8(v16);
    }
    sub_2345EBF68((uint64_t)&v47, &v50);
    sub_2345EBFC0((uint64_t)&v47 + 4);
    if ((BYTE8(v47) & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v47 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    *((void *)&v47 + 1) = v51;
    uint64_t v51 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v50);
    if (v49) {
      sub_2346091F8(v49);
    }
LABEL_29:
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
LABEL_30:
    sub_2345EBD10((uint64_t)v46);
  }
  if (sub_234609168((pxrInternal__aapl__pxrReserved__::UsdObject *)&v46[8]))
  {
    if (v9)
    {
      MEMORY[0x237DC2530](v46, "typeName");
      char v32 = objc_msgSend_tokenWithNodeType_(USKToken, v30, (uint64_t)v9, v31);
      v36 = v32;
      if (v32)
      {
        objc_msgSend_token(v32, v33, v34, v35);
        uint64_t v48 = v45;
        uint64_t v49 = (uint64_t)&off_26E762990 + 1;
        if ((v45 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v48 &= 0xFFFFFFFFFFFFFFF8;
        }
      }
      else
      {
        uint64_t v45 = 0;
        uint64_t v48 = 0;
        uint64_t v49 = (uint64_t)&off_26E762990 + 1;
      }
      pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v46[8], (const pxrInternal__aapl__pxrReserved__::TfToken *)v46, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v48);
      sub_2345DAC58((uint64_t)&v48);
      if ((v45 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v45 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }

      if ((v46[0] & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)v46 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
    }
    char v37 = [USKNode alloc];
    int v40 = *(_DWORD *)&v46[8];
    uint64_t v41 = *(void *)&v46[16];
    if (*(void *)&v46[16]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&v46[16] + 48), 1uLL, memory_order_relaxed);
    }
    sub_2345EBC84(&v42, &v47);
    sub_2345EBCD0(&v43, (_DWORD *)&v47 + 1);
    uint64_t v44 = *((void *)&v47 + 1);
    if ((BYTE8(v47) & 7) != 0
      && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v47 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
    {
      v44 &= 0xFFFFFFFFFFFFFFF8;
    }
    int v17 = objc_msgSend_initWithUsdPrim_withSceneOwner_(v37, v38, (uint64_t)&v40, (uint64_t)self);
    if ((v44 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v44 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2345EBD10((uint64_t)&v42);
    if (v41) {
      sub_2346091F8(v41);
    }
  }
  else
  {
    int v17 = 0;
  }
  if ((BYTE8(v47) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v47 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v47);
  if (*(void *)&v46[16]) {
    sub_2346091F8(*(uint64_t *)&v46[16]);
  }
LABEL_56:

  return v17;
}

- (USKNode)rootNode
{
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetPseudoRoot((uint64_t *)&v13, v3);
  id v4 = [USKNode alloc];
  int v8 = v13;
  uint64_t v9 = *((void *)&v13 + 1);
  if (*((void *)&v13 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v13 + 1) + 48), 1uLL, memory_order_relaxed);
  }
  sub_2345EBC84(&v10, &v14);
  sub_2345EBCD0(&v11, (_DWORD *)&v14 + 1);
  uint64_t v12 = *((void *)&v14 + 1);
  if ((BYTE8(v14) & 7) != 0
    && (atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v14 + 1) & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
  {
    v12 &= 0xFFFFFFFFFFFFFFF8;
  }
  uint64_t v6 = objc_msgSend_initWithUsdPrim_withSceneOwner_(v4, v5, (uint64_t)&v8, (uint64_t)self);
  if ((v12 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v10);
  if (v9) {
    sub_2346091F8(v9);
  }
  if ((BYTE8(v14) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v14 + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)&v14);
  if (*((void *)&v13 + 1)) {
    sub_2346091F8(*((uint64_t *)&v13 + 1));
  }
  return (USKNode *)v6;
}

- (void)addSubLayerWithPath:(id)a3
{
}

- (void)addSubLayerWithPath:(id)a3 offset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  int v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(&v25, v8);
  sub_2346052D4(&v25);
  id v9 = v6;
  long long v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2345DB968(__p, v13);
  pxrInternal__aapl__pxrReserved__::SdfLayer::InsertSubLayerPath();
  if ((v24 & 0x80000000) == 0)
  {
    if (!v7) {
      goto LABEL_8;
    }
LABEL_6:
    long long v14 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2346052D4(&v25);
    objc_msgSend_sdfLayerOffset(v7, v15, v16, v17);
    v22[0] = v18;
    v22[1] = v19;
    uint64_t v20 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2346052D4(&v25);
    pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerOffsets((uint64_t *)__p, v20);
    pxrInternal__aapl__pxrReserved__::SdfLayer::SetSubLayerOffset(v14, (const pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v22);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    goto LABEL_8;
  }
  operator delete(__p[0]);
  if (v7) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t v21 = v26;
  if (v26 && atomic_fetch_add_explicit((atomic_uint *volatile)(v26 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
LABEL_11:
}

- (id)subLayerPaths
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer((uint64_t *)&__dst, v2);
  uint64_t v3 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2346052D4((uint64_t *)&__dst);
  pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerPaths(&v22, v3);
  uint64_t v4 = *((void *)&__dst + 1);
  if (*((void *)&__dst + 1)
    && atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&__dst + 1) + 8), 0xFFFFFFFF, memory_order_release) == 1)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  if (sub_234607038((uint64_t)&v22))
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v6 = sub_2346098DC((uint64_t)&v22);
    sub_2346070B0((uint64_t)&v22, (uint64_t)&v17);
    if (v6) {
      id v7 = &v22;
    }
    else {
      id v7 = 0;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    *((void *)&__dst + 1) = v7;
    uint64_t v28 = 0;
    long long v25 = v17;
    unint64_t v26 = v18;
    sub_234609954(&v19, (uint64_t)&__dst, (uint64_t)&v25, v18);
    int v10 = v19;
    for (i = v20; v10 != i; int v10 = (long long *)((char *)v10 + 24))
    {
      long long __dst = 0uLL;
      uint64_t v28 = 0;
      if (*((char *)v10 + 23) < 0)
      {
        sub_2345DBA34(&__dst, *(void **)v10, *((void *)v10 + 1));
      }
      else
      {
        long long v12 = *v10;
        uint64_t v28 = *((void *)v10 + 2);
        long long __dst = v12;
      }
      if (v28 >= 0) {
        objc_msgSend_stringWithUTF8String_(NSString, v8, (uint64_t)&__dst, v9);
      }
      else {
      long long v13 = objc_msgSend_stringWithUTF8String_(NSString, v8, __dst, v9);
      }
      objc_msgSend_addObject_(v5, v14, (uint64_t)v13, v15);

      if (SHIBYTE(v28) < 0) {
        operator delete((void *)__dst);
      }
    }
    *(void *)&long long __dst = &v19;
    sub_2346092C8((void ***)&__dst);
  }
  else
  {
    id v5 = 0;
  }
  if (v23) {
    sub_2345DBAD4(v23);
  }
  return v5;
}

- (id)subLayerOffsets
{
  __p = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(&v19, v2);
  uint64_t v3 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2346052D4(&v19);
  pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerOffsets((uint64_t *)&__p, v3);
  uint64_t v4 = v20;
  if (v20 && atomic_fetch_add_explicit((atomic_uint *volatile)(v20 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  id v5 = v22;
  if (v22 == __p)
  {
    id v6 = 0;
    if (v22)
    {
LABEL_8:
      uint64_t v22 = v5;
      operator delete(v5);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = (double *)__p;
    int v8 = (double *)v22;
    if (__p != v22)
    {
      do
      {
        double v9 = *v7;
        double v10 = v7[1];
        uint64_t v11 = [USKLayerOffset alloc];
        uint64_t v15 = objc_msgSend_initWithSdfLayerOffset_(v11, v12, v13, v14, v9, v10);
        objc_msgSend_addObject_(v6, v16, (uint64_t)v15, v17);

        v7 += 2;
      }
      while (v7 != v8);
    }
    id v5 = __p;
    if (__p) {
      goto LABEL_8;
    }
  }
  return v6;
}

- (id)metadata
{
  v54[2] = *MEMORY[0x263EF8340];
  uint64_t v35 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  uint64_t v49 = 0;
  v50[0] = 0;
  v50[1] = 0;
  uint64_t v4 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetPseudoRoot((uint64_t *)&v41, v4);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((uint64_t *)&v49, (pxrInternal__aapl__pxrReserved__::UsdObject *)&v41);
  if ((BYTE8(v42[0]) & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*((void *)&v42[0] + 1) & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2345EBD10((uint64_t)v42);
  if (*((void *)&v41 + 1)) {
    sub_2346091F8(*((uint64_t *)&v41 + 1));
  }
  id v6 = v49;
  if (v49 != (uint64_t *)v50)
  {
    uint64_t v33 = *(void *)(MEMORY[0x263F8C2B8] + 64);
    uint64_t v34 = *MEMORY[0x263F8C2B8];
    uint64_t v31 = v46;
    uint64_t v32 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    do
    {
      uint64_t v53 = 0;
      v54[0] = 0;
      v54[1] = 0;
      id v7 = sub_234609250(&v53, v6 + 4);
      double v10 = NSString;
      if ((v53 & 0xFFFFFFFFFFFFFFF8) != 0) {
        uint64_t EmptyString = (v53 & 0xFFFFFFFFFFFFFFF8) + 16;
      }
      else {
        uint64_t EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v7);
      }
      if (*(char *)(EmptyString + 23) < 0) {
        uint64_t EmptyString = *(void *)EmptyString;
      }
      long long v12 = objc_msgSend_stringWithUTF8String_(v10, v8, EmptyString, v9, v31);
      objc_msgSend_addObject_(v35, v13, (uint64_t)v12, v14);

      uint64_t v48 = 0;
      uint64_t v15 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
      if (!v15) {
        pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      }
      __p[0] = 0;
      *(void *)&long long v41 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v15, (const pxrInternal__aapl__pxrReserved__::VtValue *)v54, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v48, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v41);
      if (((uint64_t)__p[0] & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      if (v48)
      {
        uint64_t v16 = [USKData alloc];
        sub_2345DDDA0(v51, v54);
        uint64_t v36 = v48;
        if ((v48 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v48 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v36 &= 0xFFFFFFFFFFFFFFF8;
        }
        unint64_t v18 = objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v16, v17, (uint64_t)v51, (uint64_t)&v36, self);
        objc_msgSend_addObject_(v3, v19, (uint64_t)v18, v20);

        if ((v36 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v36 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v51);
      }
      else
      {
        uint64_t v47 = 0;
        long long v45 = 0u;
        memset(v46, 0, sizeof(v46));
        *(_OWORD *)int v43 = 0u;
        long long v44 = 0u;
        memset(v42, 0, sizeof(v42));
        long long v41 = 0u;
        sub_2345E11F4((uint64_t)&v41);
        pxrInternal__aapl__pxrReserved__::operator<<();
        uint64_t v21 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x237DC2540](&v40, __p);
        v52[0] = v40;
        v52[1] = (char *)&off_26E762990 + 1;
        if ((v40 & 7) != 0
          && (atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 2u, memory_order_relaxed) & 1) == 0)
        {
          v52[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        MEMORY[0x237DC2530](&v37, "token");
        uint64_t v23 = objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v21, v22, (uint64_t)v52, (uint64_t)&v37, self);
        objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

        if ((v37 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v37 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        sub_2345DAC58((uint64_t)v52);
        if ((v40 & 7) != 0) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
        }
        if (v39 < 0) {
          operator delete(__p[0]);
        }
        *(void *)&long long v41 = v34;
        *(void *)((char *)&v42[-1] + *(void *)(v34 - 24)) = v33;
        *(void *)&v42[0] = v32;
        *((void *)&v42[0] + 1) = MEMORY[0x263F8C318] + 16;
        if (SHIBYTE(v44) < 0) {
          operator delete(v43[1]);
        }
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x237DC3250](v31);
      }
      if ((v48 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v48 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      sub_2345DAC58((uint64_t)v54);
      if ((v53 & 7) != 0) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v53 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
      }
      unint64_t v26 = (uint64_t *)v6[1];
      if (v26)
      {
        do
        {
          uint64_t v27 = v26;
          unint64_t v26 = (uint64_t *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          uint64_t v27 = (uint64_t *)v6[2];
          BOOL v28 = *v27 == (void)v6;
          id v6 = v27;
        }
        while (!v28);
      }
      id v6 = v27;
    }
    while (v27 != (uint64_t *)v50);
  }
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_(NSDictionary, v5, (uint64_t)v3, (uint64_t)v35);
  sub_234609D58((uint64_t)&v49, v50[0]);

  return v29;
}

- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  id v8 = v6;
  uint64_t v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x237DC2530](&v30, v12);
  v35._storage = 0;
  v35._info._ptrAndBits = 0;
  uint64_t v13 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
  if (!v13) {
    pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  }
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(v13, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v30, (pxrInternal__aapl__pxrReserved__::VtValue *)&v35))
  {
    if (!v35._info._ptrAndBits) {
      goto LABEL_12;
    }
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v35);
    if (v7)
    {
      objc_msgSend_value(v7, v14, v15, v16);
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
    }
    uint64_t v19 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v33);
    sub_2345DAC58((uint64_t)&v33);
    if (Type == v19)
    {
LABEL_12:
      unint64_t v26 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
      if (v7)
      {
        objc_msgSend_value(v7, v23, v24, v25);
      }
      else
      {
        uint64_t v33 = 0;
        uint64_t v34 = 0;
      }
      char v27 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadata(v26, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v30, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v33);
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      if (v7)
      {
        objc_msgSend_value(v7, v20, (uint64_t)v21, v22);
      }
      else
      {
        v31[0] = 0;
        v31[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf(v32, (pxrInternal__aapl__pxrReserved__::VtValue *)v31, &v35, v21);
      sub_2345DAAE4(&v33, v32);
      sub_2345DAC58((uint64_t)v32);
      sub_2345DAC58((uint64_t)v31);
      BOOL v28 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
      char v27 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadata(v28, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v30, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v33);
    }
    BOOL v18 = v27;
    sub_2345DAC58((uint64_t)&v33);
  }
  else
  {
    BOOL v18 = 0;
  }
  sub_2345DAC58((uint64_t)&v35);
  if ((v30 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v30 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v18;
}

- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v41 = 0;
  id v11 = v8;
  uint64_t v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x237DC2530](&v41, v15);
  uint64_t v40 = 0;
  id v16 = v9;
  uint64_t v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
  MEMORY[0x237DC2530](&v40, v20);
  v46._storage = 0;
  v46._info._ptrAndBits = 0;
  uint64_t v21 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
  if (!v21) {
    pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  }
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(v21, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v41, (pxrInternal__aapl__pxrReserved__::VtValue *)&v46))
  {
    if (((uint64_t)v46._info._ptrAndBits & 4) != 0) {
      uint64_t v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)(*(uint64_t (**)(VtValue *))(((unint64_t)v46._info._ptrAndBits & 0xFFFFFFFFFFFFFFF8)
    }
                                                                                              + 168))(&v46);
    else {
      uint64_t v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_234609DCC((uint64_t *)&v46);
    }
    if ((v40 & 0xFFFFFFFFFFFFFFF8) == 0) {
      pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v22);
    }
    ValueAtPath = (void *)pxrInternal__aapl__pxrReserved__::VtDictionary::GetValueAtPath();
    if (ValueAtPath)
    {
      sub_2345E0670(&v46, ValueAtPath);
    }
    else
    {
      uint64_t v45 = 0;
      sub_2345DAAE4(&v46, &v44);
      sub_2345DAC58((uint64_t)&v44);
    }
    if (!v46._info._ptrAndBits) {
      goto LABEL_20;
    }
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v46);
    if (v10)
    {
      objc_msgSend_value(v10, v25, v26, v27);
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v45 = 0;
    }
    uint64_t v29 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v44);
    sub_2345DAC58((uint64_t)&v44);
    if (Type == v29)
    {
LABEL_20:
      uint64_t v36 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
      if (v10)
      {
        objc_msgSend_value(v10, v33, v34, v35);
      }
      else
      {
        uint64_t v44 = 0;
        uint64_t v45 = 0;
      }
      char v37 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v41, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v44);
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      if (v10)
      {
        objc_msgSend_value(v10, v30, (uint64_t)v31, v32);
      }
      else
      {
        v42[0] = 0;
        v42[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf(v43, (pxrInternal__aapl__pxrReserved__::VtValue *)v42, &v46, v31);
      sub_2345DAAE4(&v44, v43);
      sub_2345DAC58((uint64_t)v43);
      sub_2345DAC58((uint64_t)v42);
      uint64_t v38 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
      char v37 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v38, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v41, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v40, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v44);
    }
    BOOL v23 = v37;
    sub_2345DAC58((uint64_t)&v44);
  }
  else
  {
    BOOL v23 = 0;
  }
  sub_2345DAC58((uint64_t)&v46);
  if ((v40 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v40 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v41 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v41 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v23;
}

- (BOOL)setCustomMetadata:(id)a3 value:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v23 = 0;
  unint64_t v8 = atomic_load(MEMORY[0x263F90528]);
  if (!v8) {
    sub_23460936C();
  }
  id v9 = *(atomic_uint **)(v8 + 80);
  BOOL v23 = v9;
  if ((v9 & 7) != 0)
  {
    id v10 = (atomic_uint *)((unint64_t)v9 & 0xFFFFFFFFFFFFFFF8);
    if ((atomic_fetch_add_explicit(v10, 2u, memory_order_relaxed) & 1) == 0) {
      BOOL v23 = v10;
    }
  }
  uint64_t v22 = 0;
  id v11 = v6;
  uint64_t v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x237DC2530](&v22, v15);
  uint64_t v19 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  if (v7)
  {
    objc_msgSend_value(v7, v16, v17, v18);
  }
  else
  {
    v24[0] = 0;
    v24[1] = 0;
  }
  char v20 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v19, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v23, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v22, (const pxrInternal__aapl__pxrReserved__::VtValue *)v24);
  sub_2345DAC58((uint64_t)v24);
  if ((v22 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v23 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)((unint64_t)v23 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }

  return v20;
}

- (id)metadataWithKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  id v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  id v6 = v4;
  uint64_t v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  MEMORY[0x237DC2530](&v19, v10);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadata(v5, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v19, (pxrInternal__aapl__pxrReserved__::VtValue *)&v21);
  if ((v19 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v22)
  {
    id v11 = [USKData alloc];
    sub_2345DDDA0(v20, &v21);
    uint64_t v12 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v12) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t v16 = 0;
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v21);
    uint64_t v19 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v12, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v16);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v18, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v19);
    uint64_t v14 = objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v11, v13, (uint64_t)v20, (uint64_t)&v18, self);
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

- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  id v9 = v6;
  uint64_t v13 = objc_msgSend_UTF8String(v9, v10, v11, v12);
  MEMORY[0x237DC2530](&v47, v13);
  id v14 = v7;
  uint64_t v18 = objc_msgSend_UTF8String(v14, v15, v16, v17);
  MEMORY[0x237DC2530](&v43, v18);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadataByDictKey(v8, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v47, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v43, (pxrInternal__aapl__pxrReserved__::VtValue *)&v51);
  if ((v43 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v43 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if ((v47 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v47 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v52)
  {
    if (sub_2345EF1A8((uint64_t)&v51))
    {
      uint64_t v45 = 0;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v19 = sub_2345E4510(&v51);
      long long v20 = *(_OWORD *)(v19 + 16);
      long long v43 = *(_OWORD *)v19;
      long long v44 = v20;
      uint64_t v21 = *(long long **)(v19 + 32);
      uint64_t v45 = v21;
      if (v21)
      {
        uint64_t v22 = (atomic_ullong *)(v21 - 1);
        if (*((void *)&v44 + 1)) {
          uint64_t v22 = (atomic_ullong *)*((void *)&v44 + 1);
        }
        atomic_fetch_add_explicit(v22, 1uLL, memory_order_relaxed);
      }
      uint64_t v42 = 0;
      memset(v41, 0, sizeof(v41));
      sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v43);
      uint64_t v23 = v45;
      sub_2345F89B8((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v43);
      uint64_t v24 = &v45[3 * v43];
      if (v23 == v24)
      {
LABEL_36:
        *((void *)&v47 + 1) = &off_26E763AF8;
        sub_2345DEAC0();
      }
      while (1)
      {
        __dst[0] = 0;
        __dst[1] = 0;
        uint64_t v40 = 0;
        if (*((char *)v23 + 23) < 0)
        {
          sub_2345DBA34(__dst, *(void **)v23, *((void *)v23 + 1));
        }
        else
        {
          long long v25 = *v23;
          uint64_t v40 = *((void *)v23 + 2);
          *(_OWORD *)long long __dst = v25;
        }
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v38 = 0;
        if (*((char *)v23 + 47) < 0)
        {
          sub_2345DBA34(__p, *((void **)v23 + 3), *((void *)v23 + 4));
        }
        else
        {
          long long v26 = *(long long *)((char *)v23 + 24);
          uint64_t v38 = *((void *)v23 + 5);
          *(_OWORD *)__p = v26;
        }
        if (SHIBYTE(v38) < 0)
        {
          if (!__p[1])
          {
LABEL_22:
            uint64_t v27 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
            pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(&v35, v27);
            pxrInternal__aapl__pxrReserved__::SdfComputeAssetPathRelativeToLayer();
            if (SHIBYTE(v38) < 0) {
              operator delete(__p[0]);
            }
            *(_OWORD *)__p = v47;
            uint64_t v38 = v48;
            HIBYTE(v48) = 0;
            LOBYTE(v47) = 0;
            uint64_t v28 = v36;
            if (v36
              && atomic_fetch_add_explicit((atomic_uint *volatile)(v36 + 8), 0xFFFFFFFF, memory_order_release) == 1)
            {
              (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
            }
          }
        }
        else if (!HIBYTE(v38))
        {
          goto LABEL_22;
        }
        MEMORY[0x237DC1F50](&v47, __dst, __p);
        sub_234609E10((uint64_t)v41, &v47);
        if (v50 < 0) {
          operator delete(v49);
        }
        if (SHIBYTE(v48) < 0) {
          operator delete((void *)v47);
        }
        if (SHIBYTE(v38) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v40) < 0) {
          operator delete(__dst[0]);
        }
        v23 += 3;
        if (v23 == v24) {
          goto LABEL_36;
        }
      }
    }
    uint64_t v29 = [USKData alloc];
    sub_2345DDDA0(v46, &v51);
    uint64_t v30 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v30) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    *(void *)&long long v43 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v51);
    *(void *)&v41[0] = 0;
    *(void *)&long long v47 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v30, (const pxrInternal__aapl__pxrReserved__::TfType *)&v43, (const pxrInternal__aapl__pxrReserved__::TfToken *)v41);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v34, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v47);
    uint64_t v32 = objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v29, v31, (uint64_t)v46, (uint64_t)&v34, self);
    if ((v34 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v34 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v41[0] & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)&v41[0] & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v46);
  }
  else
  {
    uint64_t v32 = 0;
  }
  sub_2345DAC58((uint64_t)&v51);

  return v32;
}

- (id)customMetadataWithKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  id v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  unint64_t v6 = atomic_load(MEMORY[0x263F90528]);
  if (!v6) {
    sub_23460936C();
  }
  id v7 = v4;
  uint64_t v11 = objc_msgSend_UTF8String(v7, v8, v9, v10);
  MEMORY[0x237DC2530](&v20, v11);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadataByDictKey(v5, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v6 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v20, (pxrInternal__aapl__pxrReserved__::VtValue *)&v22);
  if ((v20 & 7) != 0) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v20 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
  }
  if (v23)
  {
    uint64_t v12 = [USKData alloc];
    sub_2345DDDA0(v21, &v22);
    uint64_t v13 = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_264BF46F0);
    if (!v13) {
      pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    }
    uint64_t v17 = 0;
    uint64_t Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v22);
    uint64_t v20 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(v13, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v17);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken(&v19, (pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v20);
    uint64_t v15 = objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v12, v14, (uint64_t)v21, (uint64_t)&v19, self);
    if ((v19 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v19 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    if ((v17 & 7) != 0) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v17 & 0xFFFFFFFFFFFFFFF8), 0xFFFFFFFE, memory_order_release);
    }
    sub_2345DAC58((uint64_t)v21);
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_2345DAC58((uint64_t)&v22);

  return v15;
}

- (id)nodeIterator
{
  uint64_t v3 = [USKNodeSubtreeIterator alloc];
  sub_234609FCC(&v9, (uint64_t *)&self->_usdStage);
  unint64_t v6 = objc_msgSend_initWithScene_(v3, v4, (uint64_t)&v9, v5);
  uint64_t v7 = v10;
  if (v10 && atomic_fetch_add_explicit((atomic_uint *volatile)(v10 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  return v6;
}

- (id)loadedNodeIterator
{
  uint64_t v3 = [USKNodeSubtreeIterator alloc];
  sub_234609FCC(&v10, (uint64_t *)&self->_usdStage);
  char v9 = 0;
  int64x2_t v8 = vdupq_n_s64(2uLL);
  uint64_t v5 = objc_msgSend_initWithScene_withPredicate_(v3, v4, (uint64_t)&v10, (uint64_t)&v8);
  uint64_t v6 = v11;
  if (v11 && atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  return v5;
}

- (void)dumpUSDA
{
  __p = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer((uint64_t *)&v8, v2);
  sub_2346052D4((uint64_t *)&v8);
  pxrInternal__aapl__pxrReserved__::SdfLayer::ExportToString();
  uint64_t v3 = v9;
  if (v9 && atomic_fetch_add_explicit((atomic_uint *volatile)(v9 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  if (v12 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if (v12 >= 0) {
    uint64_t v5 = HIBYTE(v12);
  }
  else {
    uint64_t v5 = v11;
  }
  uint64_t v6 = sub_2345DDEB8(MEMORY[0x263F8C100], (uint64_t)p_p, v5);
  std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
  uint64_t v7 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
  ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
  std::locale::~locale(&v8);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(v12) < 0) {
    operator delete(__p);
  }
}

- (void)dealloc
{
  p_usdStage = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&self->_usdStage;
  if (*p_usdStage) {
    sub_234608FD4(p_usdStage);
  }
  v4.receiver = self;
  v4.super_class = (Class)USKScene;
  [(USKScene *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  sub_2345DBB48((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&self->_usdStage);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end