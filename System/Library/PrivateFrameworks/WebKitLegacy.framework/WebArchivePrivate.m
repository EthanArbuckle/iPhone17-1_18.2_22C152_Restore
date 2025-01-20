@interface WebArchivePrivate
- (WebArchivePrivate)init;
- (WebArchivePrivate)initWithCoreArchive:(void *)a3;
- (id).cxx_construct;
- (void)coreArchive;
- (void)dealloc;
- (void)setCoreArchive:(void *)a3;
@end

@implementation WebArchivePrivate

- (WebArchivePrivate)init
{
  v9.receiver = self;
  v9.super_class = (Class)WebArchivePrivate;
  v2 = [(WebArchivePrivate *)&v9 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  WebCore::LegacyWebArchive::create((uint64_t *)&v8, (WebCore::LegacyWebArchive *)v2);
  uint64_t v4 = (uint64_t)v8;
  v8 = 0;
  m_ptr = v3->coreArchive.m_ptr;
  v3->coreArchive.m_ptr = (LegacyWebArchive *)v4;
  if (!m_ptr) {
    return v3;
  }
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    return v3;
  }
  (*(void (**)(LegacyWebArchive *))(*(void *)m_ptr + 8))(m_ptr);
  v7 = v8;
  v8 = 0;
  if (!v7) {
    return v3;
  }
  if (v7[2] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
  }
  else {
    --v7[2];
  }
  return v3;
}

- (WebArchivePrivate)initWithCoreArchive:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WebArchivePrivate;
  uint64_t v4 = [(WebArchivePrivate *)&v9 init];
  v5 = v4;
  if (v4 && (v6 = *(LegacyWebArchive **)a3) != 0)
  {
    *(void *)a3 = 0;
    m_ptr = v4->coreArchive.m_ptr;
    v5->coreArchive.m_ptr = v6;
    if (!m_ptr) {
      return v5;
    }
    if (*((_DWORD *)m_ptr + 2) != 1)
    {
      --*((_DWORD *)m_ptr + 2);
      return v5;
    }
    (*(void (**)(LegacyWebArchive *))(*(void *)m_ptr + 8))(m_ptr);
    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)coreArchive
{
  return self->coreArchive.m_ptr;
}

- (void)setCoreArchive:(void *)a3
{
  uint64_t v4 = *(LegacyWebArchive **)a3;
  *(void *)a3 = 0;
  m_ptr = self->coreArchive.m_ptr;
  self->coreArchive.m_ptr = v4;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1) {
      (*(void (**)(void))(*(void *)m_ptr + 8))();
    }
    else {
      --*((_DWORD *)m_ptr + 2);
    }
  }
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebArchivePrivate;
    [(WebArchivePrivate *)&v4 dealloc];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->coreArchive.m_ptr;
  self->coreArchive.m_ptr = 0;
  if (!m_ptr)
  {
LABEL_4:
    objc_super v4 = self->cachedSubframeArchives.m_ptr;
    self->cachedSubframeArchives.m_ptr = 0;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    goto LABEL_4;
  }
  (*(void (**)(LegacyWebArchive *, SEL))(*(void *)m_ptr + 8))(m_ptr, a2);
  objc_super v4 = self->cachedSubframeArchives.m_ptr;
  self->cachedSubframeArchives.m_ptr = 0;
  if (v4) {
LABEL_5:
  }
    CFRelease(v4);
LABEL_6:
  v5 = self->cachedSubresources.m_ptr;
  self->cachedSubresources.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->cachedMainResource.m_ptr;
  self->cachedMainResource.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end