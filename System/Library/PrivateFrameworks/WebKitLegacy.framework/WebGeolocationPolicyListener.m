@interface WebGeolocationPolicyListener
- (BOOL)shouldClearCache;
- (WebGeolocationPolicyListener)initWithGeolocation:(NakedPtr<WebCore:(id)a4 :Geolocation>)a3 forWebView:;
- (id).cxx_construct;
- (void)allow;
- (void)deny;
- (void)denyOnlyThisRequest;
@end

@implementation WebGeolocationPolicyListener

- (WebGeolocationPolicyListener)initWithGeolocation:(NakedPtr<WebCore:(id)a4 :Geolocation>)a3 forWebView:
{
  v13.receiver = self;
  v13.super_class = (Class)WebGeolocationPolicyListener;
  v6 = [(WebGeolocationPolicyListener *)&v13 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  uint64_t v8 = *(void *)a3.var0;
  if (*(void *)a3.var0) {
    ++*(_DWORD *)(v8 + 32);
  }
  m_ptr = v6->_geolocation.m_ptr;
  v7->_geolocation.m_ptr = (Geolocation *)v8;
  if (!m_ptr)
  {
LABEL_7:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (*((_DWORD *)m_ptr + 8) != 1)
  {
    --*((_DWORD *)m_ptr + 8);
    goto LABEL_7;
  }
  uint64_t v12 = MEMORY[0x1E4E448C0]();
  MEMORY[0x1E4E448D0](v12);
  if (a4) {
LABEL_8:
  }
    CFRetain(a4);
LABEL_9:
  v10 = v7->_webView.m_ptr;
  v7->_webView.m_ptr = a4;
  if (v10) {
    CFRelease(v10);
  }
  return v7;
}

- (void)allow
{
}

WTF::StringImpl *__37__WebGeolocationPolicyListener_allow__block_invoke(uint64_t a1)
{
  v1 = *(WebCore::Geolocation **)(*(void *)(a1 + 32) + 8);
  v4 = 0;
  WebCore::Geolocation::setIsAllowed(v1, 1, (const WTF::String *)&v4);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)deny
{
}

WTF::StringImpl *__36__WebGeolocationPolicyListener_deny__block_invoke(uint64_t a1)
{
  v1 = *(WebCore::Geolocation **)(*(void *)(a1 + 32) + 8);
  v4 = 0;
  WebCore::Geolocation::setIsAllowed(v1, 0, (const WTF::String *)&v4);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)denyOnlyThisRequest
{
}

uint64_t __51__WebGeolocationPolicyListener_denyOnlyThisRequest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deny];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  return MEMORY[0x1F416C5F0](v2);
}

- (BOOL)shouldClearCache
{
  WebThreadLock();
  v3 = (void *)[self->_webView.m_ptr preferences];
  return [v3 _alwaysRequestGeolocationPermission];
}

- (void).cxx_destruct
{
  m_ptr = self->_webView.m_ptr;
  self->_webView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_geolocation.m_ptr;
  self->_geolocation.m_ptr = 0;
  if (v4)
  {
    if (*((_DWORD *)v4 + 8) == 1)
    {
      MEMORY[0x1E4E448C0]();
      JUMPOUT(0x1E4E448D0);
    }
    --*((_DWORD *)v4 + 8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end