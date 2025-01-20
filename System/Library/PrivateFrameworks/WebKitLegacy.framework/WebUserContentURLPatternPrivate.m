@interface WebUserContentURLPatternPrivate
- (id).cxx_construct;
@end

@implementation WebUserContentURLPatternPrivate

- (void).cxx_destruct
{
  m_ptr = (WTF::StringImpl *)self->pattern.m_path.m_impl.m_ptr;
  self->pattern.m_path.m_impl.m_ptr = 0;
  if (!m_ptr)
  {
LABEL_4:
    v4 = self->pattern.m_host.m_impl.m_ptr;
    self->pattern.m_host.m_impl.m_ptr = 0;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)m_ptr != 2)
  {
    *(_DWORD *)m_ptr -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(m_ptr, (StringImpl *)a2);
  v4 = self->pattern.m_host.m_impl.m_ptr;
  self->pattern.m_host.m_impl.m_ptr = 0;
  if (!v4) {
    goto LABEL_9;
  }
LABEL_7:
  if (*(_DWORD *)v4 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v4, (StringImpl *)a2);
    v5 = self->pattern.m_scheme.m_impl.m_ptr;
    self->pattern.m_scheme.m_impl.m_ptr = 0;
    if (!v5) {
      return;
    }
    goto LABEL_12;
  }
  *(_DWORD *)v4 -= 2;
LABEL_9:
  v5 = self->pattern.m_scheme.m_impl.m_ptr;
  self->pattern.m_scheme.m_impl.m_ptr = 0;
  if (!v5) {
    return;
  }
LABEL_12:
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v5, (StringImpl *)a2);
  }
  else
  {
    *(_DWORD *)v5 -= 2;
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((_WORD *)self + 16) = 1;
  return self;
}

@end