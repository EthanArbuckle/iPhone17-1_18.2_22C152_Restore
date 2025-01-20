@interface WebFramePolicyListener
- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:(id)a6 defaultPolicy:(id)a7 appLinkURL:referrerURL:;
- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:defaultPolicy:;
- (id).cxx_construct;
- (void)continue;
- (void)dealloc;
- (void)download;
- (void)ignore;
- (void)invalidate;
- (void)receivedPolicyDecision:(unsigned __int8)a3;
- (void)use;
@end

@implementation WebFramePolicyListener

- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:defaultPolicy:
{
  v8 = [(WebFramePolicyListener *)self init];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)a3.m_ptr;
    if (*(void *)a3.m_ptr) {
      atomic_fetch_add((atomic_uint *volatile)(v10 + 8), 1u);
    }
    m_ptr = v8->_frame.m_ptr;
    v8->_frame.m_ptr = (LocalFrame *)v10;
    if (m_ptr)
    {
      v12 = (unsigned int *)((char *)m_ptr + 8);
      if (atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v12);
        v16 = (void *)WTF::fastMalloc((WTF *)0x10);
        void *v16 = &unk_1F3C797F0;
        v16[1] = v12;
        v17 = v16;
        WTF::ensureOnMainThread();
        if (v17) {
          (*(void (**)(void *))(*v17 + 8))(v17);
        }
      }
    }
    v13 = *(void **)a4;
    *(void *)a4 = 0;
    value = v9->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    v9->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = v13;
    if (value) {
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
    v9->_defaultPolicy = a5;
  }
  return v9;
}

- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:(id)a6 defaultPolicy:(id)a7 appLinkURL:referrerURL:
{
  uint64_t v26 = *(void *)a3.m_ptr;
  v9 = [(WebFramePolicyListener *)self initWithFrame:&v26 policyFunction:a4 defaultPolicy:a5];
  if (!v9) {
    return v9;
  }
  if (a6) {
    CFRetain(a6);
  }
  m_ptr = v9->_appLinkURL.m_ptr;
  v9->_appLinkURL.m_ptr = a6;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  MEMORY[0x1E4E441F0](v23, a7);
  WebCore::SecurityOrigin::create((uint64_t *)&v24, (WebCore::SecurityOrigin *)v23, v11);
  WebCore::SecurityOrigin::toURL((uint64_t *)&v25, v24);
  v12 = (void *)WTF::URL::operator NSURL *();
  v14 = v12;
  if (v12) {
    CFRetain(v12);
  }
  v15 = v9->_referrerURL.m_ptr;
  v9->_referrerURL.m_ptr = v14;
  if (v15) {
    CFRelease(v15);
  }
  v16 = v25;
  v25 = 0;
  if (!v16)
  {
LABEL_13:
    v17 = v24;
    v24 = 0;
    if (!v17) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (*(_DWORD *)v16 != 2)
  {
    *(_DWORD *)v16 -= 2;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v16, v13);
  v17 = v24;
  v24 = 0;
  if (!v17) {
    goto LABEL_17;
  }
LABEL_16:
  if (atomic_fetch_add((atomic_uint *volatile)v17, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v17);
    v20 = (WTF::StringImpl *)*((void *)v17 + 6);
    *((void *)v17 + 6) = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2) {
        WTF::StringImpl::destroy(v20, v13);
      }
      else {
        *(_DWORD *)v20 -= 2;
      }
    }
    v21 = (WTF::StringImpl *)*((void *)v17 + 5);
    *((void *)v17 + 5) = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2) {
        WTF::StringImpl::destroy(v21, v13);
      }
      else {
        *(_DWORD *)v21 -= 2;
      }
    }
    uint64_t v22 = *((unsigned int *)v17 + 8);
    if (v22 != -1) {
      ((void (*)(char *, char *))off_1F3C7ABF8[v22])(&v27, (char *)v17 + 8);
    }
    *((_DWORD *)v17 + 8) = -1;
    WTF::fastFree(v17, v13);
    v18 = v23[0];
    v23[0] = 0;
    if (!v18) {
      return v9;
    }
    goto LABEL_18;
  }
LABEL_17:
  v18 = v23[0];
  v23[0] = 0;
  if (!v18) {
    return v9;
  }
LABEL_18:
  if (*(_DWORD *)v18 != 2)
  {
    *(_DWORD *)v18 -= 2;
    return v9;
  }
  WTF::StringImpl::destroy(v18, v13);
  return v9;
}

- (void)invalidate
{
  m_ptr = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (m_ptr)
  {
    v4 = (unsigned int *)((char *)m_ptr + 8);
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v4);
      v6 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v6 = &unk_1F3C797F0;
      v6[1] = v4;
      v7 = v6;
      WTF::ensureOnMainThread();
      if (v7) {
        (*(void (**)(void *))(*v7 + 8))(v7);
      }
    }
  }
  value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
  self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(void *, uint64_t))(*(void *)value + 16))(value, 2);
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    m_ptr = self->_frame.m_ptr;
    self->_frame.m_ptr = 0;
    if (m_ptr)
    {
      v5 = (unsigned int *)((char *)m_ptr + 8);
      if (atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v5);
        v9 = (void *)WTF::fastMalloc((WTF *)0x10);
        void *v9 = &unk_1F3C797F0;
        v9[1] = v5;
        *(void *)buf = v9;
        WTF::ensureOnMainThread();
        uint64_t v10 = *(void *)buf;
        *(void *)buf = 0;
        if (v10) {
          (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
        }
      }
    }
    value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value)
    {
      v7 = qword_1EAD7FA48;
      if (os_log_type_enabled((os_log_t)qword_1EAD7FA48, OS_LOG_TYPE_ERROR))
      {
        int defaultPolicy = self->_defaultPolicy;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = defaultPolicy;
        _os_log_error_impl(&dword_1E1345000, v7, OS_LOG_TYPE_ERROR, "Client application failed to make a policy decision via WebPolicyDecisionListener, using defaultPolicy %hhu", buf, 8u);
      }
      (*(void (**)(void *, void))(*(void *)value + 16))(value, self->_defaultPolicy);
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
    v11.receiver = self;
    v11.super_class = (Class)WebFramePolicyListener;
    [(WebFramePolicyListener *)&v11 dealloc];
  }
}

- (void)receivedPolicyDecision:(unsigned __int8)a3
{
  m_ptr = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (m_ptr)
  {
    value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value)
    {
      (*(void (**)(void *, void))(*(void *)value + 16))(value, a3);
      (*(void (**)(void *))(*(void *)value + 8))(value);
    }
    v5 = (unsigned int *)((char *)m_ptr + 8);
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v5);
      v6 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v6 = &unk_1F3C797F0;
      v6[1] = v5;
      v7 = v6;
      WTF::ensureOnMainThread();
      if (v7) {
        (*(void (**)(void *))(*v7 + 8))(v7);
      }
    }
  }
}

- (void)ignore
{
}

- (void)download
{
}

- (void)use
{
  if (self->_appLinkURL.m_ptr && self->_frame.m_ptr)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v3 setReferrerURL:self->_referrerURL.m_ptr];
    m_ptr = self->_appLinkURL.m_ptr;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __29__WebFramePolicyListener_use__block_invoke;
    v5[3] = &unk_1E6D97D08;
    v5[4] = self;
    [MEMORY[0x1E4F22398] openWithURL:m_ptr configuration:v3 completionHandler:v5];
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    [(WebFramePolicyListener *)self receivedPolicyDecision:0];
  }
}

uint64_t __29__WebFramePolicyListener_use__block_invoke()
{
  return WebThreadRun();
}

uint64_t __29__WebFramePolicyListener_use__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) receivedPolicyDecision:2 * *(unsigned __int8 *)(a1 + 40)];
}

- (void)continue
{
}

- (void).cxx_destruct
{
  m_ptr = self->_referrerURL.m_ptr;
  self->_referrerURL.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_appLinkURL.m_ptr;
  self->_appLinkURL.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
  self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  v6 = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (v6)
  {
    v7 = (unsigned int *)((char *)v6 + 8);
    if (atomic_fetch_add((atomic_uint *volatile)v6 + 2, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v7);
      v8 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v8 = &unk_1F3C797F0;
      v8[1] = v7;
      v9 = v8;
      WTF::ensureOnMainThread();
      if (v9) {
        (*(void (**)(void *))(*v9 + 8))(v9);
      }
    }
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end