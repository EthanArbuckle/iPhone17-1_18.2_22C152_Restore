@interface WebCache
+ (BOOL)isDisabled;
+ (CGImage)imageForURL:(id)a3;
+ (id)statistics;
+ (void)clearCachedCredentials;
+ (void)empty;
+ (void)emptyInMemoryResources;
+ (void)setDisabled:(BOOL)a3;
+ (void)sizeOfDeadResources:(int *)a3;
@end

@implementation WebCache

+ (id)statistics
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v2 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
  WebCore::MemoryCache::getStatistics(&v4, v2);
  v25[0] = @"Images";
  v26[0] = [NSNumber numberWithInt:v4];
  v25[1] = @"CSS";
  v26[1] = [NSNumber numberWithInt:v7];
  v25[2] = @"XSL";
  v26[2] = [NSNumber numberWithInt:v15];
  v25[3] = @"JavaScript";
  v26[3] = [NSNumber numberWithInt:v11];
  v27[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  v23[0] = @"Images";
  v24[0] = [NSNumber numberWithInt:HIDWORD(v4)];
  v23[1] = @"CSS";
  v24[1] = [NSNumber numberWithInt:v8];
  v23[2] = @"XSL";
  v24[2] = [NSNumber numberWithInt:v16];
  v23[3] = @"JavaScript";
  v24[3] = [NSNumber numberWithInt:v12];
  v27[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  v21[0] = @"Images";
  v22[0] = [NSNumber numberWithInt:v5];
  v21[1] = @"CSS";
  v22[1] = [NSNumber numberWithInt:v9];
  v21[2] = @"XSL";
  v22[2] = [NSNumber numberWithInt:v17];
  v21[3] = @"JavaScript";
  v22[3] = [NSNumber numberWithInt:v13];
  v27[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];
  v19[0] = @"Images";
  v20[0] = [NSNumber numberWithInt:v6];
  v19[1] = @"CSS";
  v20[1] = [NSNumber numberWithInt:v10];
  v19[2] = @"XSL";
  v20[2] = [NSNumber numberWithInt:v18];
  v19[3] = @"JavaScript";
  v20[3] = [NSNumber numberWithInt:v14];
  v27[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
}

+ (void)empty
{
  unint64_t v2 = +[WebView _cacheModel];
  +[WebView _setCacheModel:0];
  uint64_t v3 = WebCore::CrossOriginPreflightResultCache::singleton((WebCore::CrossOriginPreflightResultCache *)+[WebView _setCacheModel:v2]);
  MEMORY[0x1F4171EF0](v3);
}

+ (void)emptyInMemoryResources
{
}

uint64_t __34__WebCache_emptyInMemoryResources__block_invoke()
{
  unint64_t v0 = +[WebView _cacheModel];
  +[WebView _setCacheModel:0];
  uint64_t v1 = WebCore::MemoryCache::singleton((WebCore::MemoryCache *)+[WebView _setCacheModel:v0]);
  return MEMORY[0x1F416CAB8](v1, 1);
}

+ (void)sizeOfDeadResources:(int *)a3
{
  uint64_t v4 = (WebCore::MemoryCache *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
  WebCore::MemoryCache::getStatistics((uint64_t *)v6, v4);
  if (a3)
  {
    int32x2_t v5 = vadd_s32(vadd_s32(*(int32x2_t *)&v6[4], v7), vadd_s32(v9, v8));
    *a3 = vsub_s32(v5, vdup_lane_s32(v5, 1)).u32[0];
  }
}

+ (CGImage)imageForURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  MEMORY[0x1E4E441F0](v22, a3);
  WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)v23, (uint64_t)v22, 0);
  uint64_t v25 = 0;
  uint64_t v4 = (_DWORD *)*MEMORY[0x1E4F30980];
  if (*MEMORY[0x1E4F30980]) {
    *v4 += 2;
  }
  v26 = v4;
  uint64_t v27 = 0;
  char v28 = 0;
  char v29 = 0;
  char v30 = v30 & 0xE0 | 5;
  v24 |= 2u;
  uint64_t v31 = 0;
  int32x2_t v5 = v22[0];
  v22[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      int32x2_t v5 = (WTF::StringImpl *)WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  WebCore::MemoryCache::singleton(v5);
  uint64_t v7 = WebCore::MemoryCache::resourceForRequest();
  if (!v7
    || (*(unsigned char *)(v7 + 556) & 0x1F) != 1
    || !*(void *)(v7 + 688)
    || (int32x2_t v9 = (WebCore::DestinationColorSpace *)WebCore::CachedImage::image((WebCore::CachedImage *)v7),
        uint64_t v10 = WebCore::DestinationColorSpace::SRGB(v9),
        (*(void (**)(WTF::StringImpl **__return_ptr, WebCore::DestinationColorSpace *, uint64_t))(*(void *)v9 + 288))(v22, v9, v10), !v22[0]))
  {
    unsigned int v11 = 0;
    goto LABEL_23;
  }
  unsigned int v11 = *(CGImage **)WebCore::NativeImage::platformImage(v22[0]);
  unsigned int v12 = v22[0];
  v22[0] = 0;
  if (v12)
  {
    char v13 = 0;
    uint64_t v14 = *((void *)v12 + 1);
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v14, (unsigned __int8 *)&v13, 1u, memory_order_acquire, memory_order_acquire);
    if (v13)
    {
      MEMORY[0x1E4E44220](v14);
      int v15 = 1;
      uint64_t v16 = *(void *)(v14 + 8) - 1;
      *(void *)(v14 + 8) = v16;
      if (v16)
      {
LABEL_16:
        uint64_t v17 = 0;
        BOOL v18 = 1;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v14, (unsigned __int8 *)&v15, 0, memory_order_release, memory_order_relaxed);
        if (v15 == 1) {
          goto LABEL_17;
        }
        goto LABEL_26;
      }
    }
    else
    {
      int v15 = 1;
      uint64_t v16 = *(void *)(v14 + 8) - 1;
      *(void *)(v14 + 8) = v16;
      if (v16) {
        goto LABEL_16;
      }
    }
    uint64_t v19 = *(void *)(v14 + 16);
    uint64_t v17 = *(void *)(v14 + 24);
    *(void *)(v14 + 24) = 0;
    BOOL v18 = v19 != 0;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v14, (unsigned __int8 *)&v15, 0, memory_order_release, memory_order_relaxed);
    if (v15 == 1)
    {
LABEL_17:
      if (!v16)
      {
LABEL_18:
        if (v17) {
          (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
        }
        if (!v18) {
          WTF::fastFree((WTF *)v14, v8);
        }
        goto LABEL_23;
      }
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v20 = v16;
    uint64_t v21 = v17;
    WTF::Lock::unlockSlow((WTF::Lock *)v14);
    uint64_t v17 = v21;
    if (!v20) {
      goto LABEL_18;
    }
  }
LABEL_23:
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v23, v8);
  return v11;
}

+ (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  int32x2_t v5 = (WebCore::MemoryCache *)pthread_main_np();
  if (v5)
  {
    uint64_t v6 = WebCore::MemoryCache::singleton(v5);
    MEMORY[0x1F416CA98](v6, v3);
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "_webkit_invokeOnMainThread");
    [v7 setDisabled:v3];
  }
}

+ (BOOL)isDisabled
{
  return *(unsigned char *)WebCore::MemoryCache::singleton((WebCore::MemoryCache *)a1);
}

+ (void)clearCachedCredentials
{
  +[WebView _makeAllWebViewsPerformSelector:sel__clearCredentials];
  {
    uint64_t v2 = defaultNetworkStorageSession(void)::session;
    if (defaultNetworkStorageSession(void)::session) {
      goto LABEL_3;
    }
  }
  else
  {
    defaultNetworkStorageSession(void)::session = 0;
  }
  uint64_t v4 = (WebCore::NetworkStorageSession *)WTF::fastMalloc((WTF *)0x128);
  v5.m_identifier = 1;
  uint64_t v2 = WebCore::NetworkStorageSession::NetworkStorageSession(v4, v5);
  {
    uint64_t v6 = defaultNetworkStorageSession(void)::session;
    defaultNetworkStorageSession(void)::session = v2;
    if (!v6)
    {
LABEL_3:
      uint64_t v3 = v2 + 96;
      goto __ZN7WebCore17CredentialStorage16clearCredentialsEv;
    }
    MEMORY[0x1E4E470D0](v6);
    if (*(_DWORD *)(v6 + 8))
    {
      *(void *)(v6 + 288) = 0;
      *(_OWORD *)(v6 + 256) = 0u;
      *(_OWORD *)(v6 + 272) = 0u;
      *(_OWORD *)(v6 + 224) = 0u;
      *(_OWORD *)(v6 + 240) = 0u;
      *(_OWORD *)(v6 + 192) = 0u;
      *(_OWORD *)(v6 + 208) = 0u;
      *(_OWORD *)(v6 + 160) = 0u;
      *(_OWORD *)(v6 + 176) = 0u;
      *(_OWORD *)(v6 + 128) = 0u;
      *(_OWORD *)(v6 + 144) = 0u;
      *(_OWORD *)(v6 + 96) = 0u;
      *(_OWORD *)(v6 + 112) = 0u;
      *(_OWORD *)(v6 + 64) = 0u;
      *(_OWORD *)(v6 + 80) = 0u;
      *(_OWORD *)(v6 + 32) = 0u;
      *(_OWORD *)(v6 + 48) = 0u;
      *(_OWORD *)uint64_t v6 = 0u;
      *(_OWORD *)(v6 + 16) = 0u;
      {
LABEL_11:
        uint64_t v3 = defaultNetworkStorageSession(void)::session + 96;
        goto __ZN7WebCore17CredentialStorage16clearCredentialsEv;
      }
    }
    else
    {
      WTF::fastFree((WTF *)v6, v7);
        goto LABEL_11;
    }
    defaultNetworkStorageSession(void)::session = 0;
    uint64_t v3 = 96;
  }
  else
  {
    defaultNetworkStorageSession(void)::session = v2;
    uint64_t v3 = v2 + 96;
  }
__ZN7WebCore17CredentialStorage16clearCredentialsEv:
  MEMORY[0x1F416ED10](v3);
}

@end