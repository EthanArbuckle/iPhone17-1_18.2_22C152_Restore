@interface WebKitFullScreenListener
- (WebKitFullScreenListener)initWithElement:(void *)a3;
- (id).cxx_construct;
- (void)webkitDidEnterFullScreen;
- (void)webkitDidExitFullScreen;
- (void)webkitWillEnterFullScreen;
- (void)webkitWillExitFullScreen;
@end

@implementation WebKitFullScreenListener

- (WebKitFullScreenListener)initWithElement:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WebKitFullScreenListener;
  v4 = [(WebKitFullScreenListener *)&v8 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (a3) {
    *((_DWORD *)a3 + 7) += 2;
  }
  m_ptr = v4->_element.m_ptr;
  v5->_element.m_ptr = (Element *)a3;
  if (!m_ptr) {
    return v5;
  }
  if (*((_DWORD *)m_ptr + 7) != 2)
  {
    *((_DWORD *)m_ptr + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)m_ptr + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
  return v5;
}

- (void)webkitWillEnterFullScreen
{
  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    if (*(void *)(*(void *)(*((void *)m_ptr + 6) + 8) + 2032))
    {
    }
    else
    {
      WebCore::Document::ensureFullscreenManager(*(WebCore::Document **)(*((void *)m_ptr + 6) + 8));
    }
    MEMORY[0x1F416EDA8]();
  }
}

- (void)webkitDidEnterFullScreen
{
  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((void *)m_ptr + 6) + 8);
    if (*((void *)v3 + 254))
    {
    }
    else
    {
      WebCore::Document::ensureFullscreenManager(v3);
    }
    MEMORY[0x1F416ED98]();
  }
}

- (void)webkitWillExitFullScreen
{
  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((void *)m_ptr + 6) + 8);
    if (*((void *)v3 + 254))
    {
    }
    else
    {
      WebCore::Document::ensureFullscreenManager(v3);
    }
    MEMORY[0x1F416EDA0]();
  }
}

- (void)webkitDidExitFullScreen
{
  m_ptr = self->_element.m_ptr;
  if (m_ptr)
  {
    v3 = *(WebCore::Document **)(*((void *)m_ptr + 6) + 8);
    if (*((void *)v3 + 254))
    {
    }
    else
    {
      WebCore::Document::ensureFullscreenManager(v3);
    }
    MEMORY[0x1F416ED90]();
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_element.m_ptr;
  self->_element.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 7) == 2)
    {
      if ((*((_WORD *)m_ptr + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
      }
    }
    else
    {
      *((_DWORD *)m_ptr + 7) -= 2;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end