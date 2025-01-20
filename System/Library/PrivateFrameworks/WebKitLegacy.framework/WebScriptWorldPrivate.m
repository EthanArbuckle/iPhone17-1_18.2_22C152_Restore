@interface WebScriptWorldPrivate
- (id).cxx_construct;
@end

@implementation WebScriptWorldPrivate

- (void).cxx_destruct
{
  m_ptr = self->world.m_ptr;
  self->world.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      v4 = (WTF *)MEMORY[0x1E4E45A10]();
      WTF::fastFree(v4, v5);
    }
    else
    {
      --*(_DWORD *)m_ptr;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end