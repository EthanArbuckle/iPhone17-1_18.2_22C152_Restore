@interface WebResourcePrivate
- (WebResourcePrivate)init;
- (WebResourcePrivate)initWithCoreResource:(void *)a3;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation WebResourcePrivate

- (WebResourcePrivate)init
{
  v3.receiver = self;
  v3.super_class = (Class)WebResourcePrivate;
  return [(WebResourcePrivate *)&v3 init];
}

- (WebResourcePrivate)initWithCoreResource:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WebResourcePrivate;
  v4 = [(WebResourcePrivate *)&v9 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v6 = *(ArchiveResource **)a3;
  *(void *)a3 = 0;
  m_ptr = v4->coreResource.m_ptr;
  v5->coreResource.m_ptr = v6;
  if (!m_ptr) {
    return v5;
  }
  if (*((_DWORD *)m_ptr + 2) != 1)
  {
    --*((_DWORD *)m_ptr + 2);
    return v5;
  }
  (*(void (**)(ArchiveResource *))(*(void *)m_ptr + 8))(m_ptr);
  return v5;
}

- (void)dealloc
{
  objc_super v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebResourcePrivate;
    [(WebResourcePrivate *)&v4 dealloc];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->coreResource.m_ptr;
  self->coreResource.m_ptr = 0;
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

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end