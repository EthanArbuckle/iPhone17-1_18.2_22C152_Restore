@interface WebNavigationDataPrivate
- (id).cxx_construct;
@end

@implementation WebNavigationDataPrivate

- (void).cxx_destruct
{
  m_ptr = self->clientRedirectSource.m_ptr;
  self->clientRedirectSource.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->response.m_ptr;
  self->response.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->originalRequest.m_ptr;
  self->originalRequest.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->title.m_ptr;
  self->title.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->url.m_ptr;
  self->url.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end