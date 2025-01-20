@interface WebScriptCallFramePrivate
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation WebScriptCallFramePrivate

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WebScriptCallFramePrivate;
  [(WebScriptCallFramePrivate *)&v2 dealloc];
}

- (void).cxx_destruct
{
  m_ptr = self->functionName.m_impl.m_ptr;
  self->functionName.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (StringImpl *)a2);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end