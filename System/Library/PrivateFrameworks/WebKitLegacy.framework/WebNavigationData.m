@interface WebNavigationData
- (BOOL)hasSubstituteData;
- (WebNavigationData)initWithURLString:(id)a3 title:(id)a4 originalRequest:(id)a5 response:(id)a6 hasSubstituteData:(BOOL)a7 clientRedirectSource:(id)a8;
- (id)clientRedirectSource;
- (id)originalRequest;
- (id)response;
- (id)title;
- (id)url;
- (void)dealloc;
@end

@implementation WebNavigationData

- (WebNavigationData)initWithURLString:(id)a3 title:(id)a4 originalRequest:(id)a5 response:(id)a6 hasSubstituteData:(BOOL)a7 clientRedirectSource:(id)a8
{
  v26.receiver = self;
  v26.super_class = (Class)WebNavigationData;
  v14 = [(WebNavigationData *)&v26 init];
  if (v14)
  {
    v15 = objc_alloc_init(WebNavigationDataPrivate);
    v14->_private = v15;
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = v15->url.m_ptr;
    v15->url.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v17 = v14->_private;
    if (a4) {
      CFRetain(a4);
    }
    v18 = v17->title.m_ptr;
    v17->title.m_ptr = a4;
    if (v18) {
      CFRelease(v18);
    }
    v19 = v14->_private;
    if (a5) {
      CFRetain(a5);
    }
    v20 = v19->originalRequest.m_ptr;
    v19->originalRequest.m_ptr = a5;
    if (v20) {
      CFRelease(v20);
    }
    v21 = v14->_private;
    if (a6) {
      CFRetain(a6);
    }
    v22 = v21->response.m_ptr;
    v21->response.m_ptr = a6;
    if (v22) {
      CFRelease(v22);
    }
    v14->_private->hasSubstituteData = a7;
    v23 = v14->_private;
    if (a8) {
      CFRetain(a8);
    }
    v24 = v23->clientRedirectSource.m_ptr;
    v23->clientRedirectSource.m_ptr = a8;
    if (v24) {
      CFRelease(v24);
    }
  }
  return v14;
}

- (id)url
{
  return self->_private->url.m_ptr;
}

- (id)title
{
  return self->_private->title.m_ptr;
}

- (id)originalRequest
{
  return self->_private->originalRequest.m_ptr;
}

- (id)response
{
  return self->_private->response.m_ptr;
}

- (BOOL)hasSubstituteData
{
  return self->_private->hasSubstituteData;
}

- (id)clientRedirectSource
{
  return self->_private->clientRedirectSource.m_ptr;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebNavigationData;
  [(WebNavigationData *)&v3 dealloc];
}

@end