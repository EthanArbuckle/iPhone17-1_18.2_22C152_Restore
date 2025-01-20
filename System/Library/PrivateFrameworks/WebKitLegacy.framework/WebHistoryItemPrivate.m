@interface WebHistoryItemPrivate
- (id).cxx_construct;
@end

@implementation WebHistoryItemPrivate

- (void).cxx_destruct
{
  value = (WTF *)self->_redirectURLs.__ptr_.__value_;
  self->_redirectURLs.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *((unsigned int *)value + 3);
    if (v4)
    {
      v5 = *(WTF::StringImpl ***)value;
      uint64_t v6 = 8 * v4;
      do
      {
        v7 = *v5;
        *v5 = 0;
        if (v7)
        {
          if (*(_DWORD *)v7 == 2) {
            WTF::StringImpl::destroy(v7, (StringImpl *)a2);
          }
          else {
            *(_DWORD *)v7 -= 2;
          }
        }
        ++v5;
        v6 -= 8;
      }
      while (v6);
    }
    v8 = *(WTF **)value;
    if (*(void *)value)
    {
      *(void *)value = 0;
      *((_DWORD *)value + 2) = 0;
      WTF::fastFree(v8, (void *)a2);
    }
    WTF::fastFree(value, (void *)a2);
  }
  m_ptr = self->_historyItem.m_ptr;
  self->_historyItem.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 1)
    {
      v10 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v10, v11);
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
  *((void *)self + 3) = 0;
  return self;
}

@end