@interface USKResource
+ (id)resourceWithPath:(id)a3;
+ (id)resourceWithResourcePath:(id)a3;
+ (id)resourceWithURL:(id)a3;
+ (id)resourceWithUSKScene:(id)a3 path:(id)a4;
- (id).cxx_construct;
- (id)dataNoCopy;
- (void)dealloc;
@end

@implementation USKResource

+ (id)resourceWithURL:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if (objc_msgSend_checkResourceIsReachableAndReturnError_(v3, v4, 0, v5))
  {
    v9 = objc_alloc_init(USKResource);
    if (v9)
    {
      objc_msgSend_path(v3, v6, v7, v8);
      id v10 = objc_claimAutoreleasedReturnValue();
      v14 = (char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
      sub_2345DB968(__p, v14);
      sub_2345DB090(v9, (char *)__p);
      if (v17 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    NSLog(&cfstr_WarningUnableT_0.isa, v3);
    v9 = 0;
  }

  return v9;
}

+ (id)resourceWithUSKScene:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_234627B1C();
  pxrInternal__aapl__pxrReserved__::ArGetResolver(v7);
  long long v27 = 0uLL;
  uint64_t v28 = 0;
  id v8 = v6;
  uint64_t v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  sub_2345DB968(&v27, v12);
  if (pxrInternal__aapl__pxrReserved__::TfIsRelativePath())
  {
    if (v5) {
      objc_msgSend_usdStage(v5, v13, v14, v15);
    }
    else {
      v22 = 0;
    }
    v16 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2345DB554((id *)&v22);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(&v23, v16);
    pxrInternal__aapl__pxrReserved__::SdfComputeAssetPathRelativeToLayer();
    if (SHIBYTE(v28) < 0) {
      operator delete((void *)v27);
    }
    long long v27 = v25;
    uint64_t v28 = v26;
    HIBYTE(v26) = 0;
    LOBYTE(v25) = 0;
    uint64_t v17 = v24;
    if (v24 && atomic_fetch_add_explicit((atomic_uint *volatile)(v24 + 8), 0xFFFFFFFF, memory_order_release) == 1) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
    sub_2345DBB48(&v22);
  }
  v18 = objc_alloc_init(USKResource);
  if (v18)
  {
    if (SHIBYTE(v28) < 0)
    {
      sub_2345DBA34(__p, (void *)v27, *((unint64_t *)&v27 + 1));
    }
    else
    {
      *(_OWORD *)__p = v27;
      uint64_t v21 = v28;
    }
    sub_2345DB090(v18, (char *)__p);
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
  }
  if (SHIBYTE(v28) < 0) {
    operator delete((void *)v27);
  }

  return v18;
}

+ (id)resourceWithPath:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    uint64_t v7 = objc_alloc_init(USKResource);
    if (v7)
    {
      id v8 = v3;
      uint64_t v12 = (char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
      sub_2345DB968(__p, v12);
      sub_2345DB090(v7, (char *)__p);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    NSLog(&cfstr_WarningUnableT_1.isa);
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)resourceWithResourcePath:(id)a3
{
  id v3 = a3;
  sub_234627B1C();
  uint64_t v7 = objc_msgSend_resolvedPath(v3, v4, v5, v6);
  if (objc_msgSend_length(v7, v8, v9, v10))
  {
    uint64_t v11 = objc_alloc_init(USKResource);
    if (v11)
    {
      id v12 = v7;
      v16 = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
      sub_2345DB968(__p, v16);
      sub_2345DB090(v11, (char *)__p);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    NSLog(&cfstr_WarningUnableT_1.isa);
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  if (self->_buffer.__ptr_)
  {
    cntrl = self->_buffer.__cntrl_;
    self->_buffer.__ptr_ = 0;
    self->_buffer.__cntrl_ = 0;
    if (cntrl) {
      sub_2345DBAD4((std::__shared_weak_count *)cntrl);
    }
  }
  if (self->_asset.__ptr_)
  {
    v4 = self->_asset.__cntrl_;
    self->_asset.__ptr_ = 0;
    self->_asset.__cntrl_ = 0;
    if (v4) {
      sub_2345DBAD4((std::__shared_weak_count *)v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)USKResource;
  [(USKResource *)&v5 dealloc];
}

- (id)dataNoCopy
{
  ptr = self->_asset.__ptr_;
  if (ptr)
  {
    (*(void (**)(shared_ptr<const char> *__return_ptr))(*(void *)ptr + 24))(&v9);
    shared_ptr<const char> v5 = v9;
    shared_ptr<const char> v9 = (shared_ptr<const char>)0;
    cntrl = self->_buffer.__cntrl_;
    self->_buffer = v5;
    if (cntrl)
    {
      sub_2345DBAD4((std::__shared_weak_count *)cntrl);
      if (v9.__cntrl_) {
        sub_2345DBAD4((std::__shared_weak_count *)v9.__cntrl_);
      }
      uint64_t v7 = self->_buffer.__ptr_;
      if (v7) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v7 = v5.__ptr_;
      if (v5.__ptr_)
      {
LABEL_6:
        ptr = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x263EFF8F8], v4, (uint64_t)v7, self->_length, 0, v9.__ptr_);
        goto LABEL_9;
      }
    }
    ptr = 0;
  }
LABEL_9:
  return ptr;
}

- (void).cxx_destruct
{
  cntrl = self->_buffer.__cntrl_;
  if (cntrl) {
    sub_2345DBAD4((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_asset.__cntrl_;
  if (v4)
  {
    sub_2345DBAD4((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end