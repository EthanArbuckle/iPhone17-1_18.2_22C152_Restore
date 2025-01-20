@interface WebHTMLViewPrivate
- (id).cxx_construct;
- (void)clear;
- (void)dealloc;
@end

@implementation WebHTMLViewPrivate

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WebHTMLViewPrivate;
    [(WebHTMLViewPrivate *)&v4 dealloc];
  }
}

- (void)clear
{
  m_ptr = self->mouseDownEvent.m_ptr;
  self->mouseDownEvent.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->keyDownEvent.m_ptr;
  self->keyDownEvent.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->pluginController.m_ptr;
  self->pluginController.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->dataSource.m_ptr;
  self->dataSource.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  self->layerHostingView = 0;
}

- (void).cxx_destruct
{
  m_ptr = self->dataSource.m_ptr;
  self->dataSource.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->pageRects.m_ptr;
  self->pageRects.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->pluginController.m_ptr;
  self->pluginController.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->keyDownEvent.m_ptr;
  self->keyDownEvent.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->mouseDownEvent.m_ptr;
  self->mouseDownEvent.m_ptr = 0;
  if (v7)
  {
    CFRelease(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end