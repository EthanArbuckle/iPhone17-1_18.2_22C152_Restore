@interface WebFrameViewPrivate
- (id).cxx_construct;
@end

@implementation WebFrameViewPrivate

- (void).cxx_destruct
{
  m_ptr = self->frameScrollView.m_ptr;
  self->frameScrollView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end