@interface WebFramePrivate
- (id).cxx_construct;
- (void)setWebFrameView:(id)a3;
@end

@implementation WebFramePrivate

- (void)setWebFrameView:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->webFrameView.m_ptr;
  self->webFrameView.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->provisionalURL.m_ptr;
  self->provisionalURL.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->url.m_ptr;
  self->url.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  value = (WTF *)self->captionPreferencesTestingModeToken.__ptr_.__value_;
  self->captionPreferencesTestingModeToken.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v6 = *(void *)value;
    if (*(void *)value)
    {
      uint64_t v7 = *(void *)(v6 + 8);
      if (v7)
      {
        int v8 = *(_DWORD *)(v7 + 136);
        if (v8) {
          *(_DWORD *)(v7 + 136) = v8 - 1;
        }
      }
      *(void *)value = 0;
      if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, (unsigned int *)v6);
        WTF::fastFree((WTF *)v6, (void *)a2);
      }
    }
    else
    {
      *(void *)value = 0;
    }
    WTF::fastFree(value, (void *)a2);
  }
  v9 = self->scriptDebugger.__ptr_.__value_;
  self->scriptDebugger.__ptr_.__value_ = 0;
  if (v9)
  {
    uint64_t v10 = *((void *)v9 + 30);
    if (v10)
    {
      v11 = (uint64_t *)(v10 - 16);
      uint64_t v12 = *(void *)(((v10 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
      v13 = *(uint64_t **)(v10 - 8);
      if (v13)
      {
        uint64_t v14 = *v11;
        uint64_t *v13 = *v11;
        *(void *)(v14 + 8) = v13;
        uint64_t *v11 = 0;
        v11[1] = 0;
      }
      uint64_t *v11 = *(void *)(v12 + 40);
      *(void *)(v12 + 40) = v11;
      *((void *)v9 + 30) = 0;
    }
    JSC::Debugger::~Debugger((JSC::Debugger *)v9);
    WTF::fastFree(v15, v16);
  }
  v17 = self->webFrameView.m_ptr;
  self->webFrameView.m_ptr = 0;
  if (v17)
  {
    CFRelease(v17);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end