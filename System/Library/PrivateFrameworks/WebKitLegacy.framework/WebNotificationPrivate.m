@interface WebNotificationPrivate
- (id).cxx_construct;
@end

@implementation WebNotificationPrivate

- (void).cxx_destruct
{
  if (!*(&self[1]._internal.var0.__engaged_ + 48)) {
    return;
  }
  v3 = (WTF *)*((void *)&self[1]._internal.var0.__engaged_ + 2);
  if (v3)
  {
    *((void *)&self[1]._internal.var0.__engaged_ + 2) = 0;
    self[1]._internal.var0.__val_.defaultActionURL.m_hostEnd = 0;
    WTF::fastFree(v3, (void *)a2);
  }
  m_ptr = self->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr;
  self->_internal.var0.__val_.serviceWorkerRegistrationURL.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (StringImpl *)a2);
      v5 = (WTF::StringImpl *)self->_internal.var0.__val_.originString.m_impl.m_ptr;
      self->_internal.var0.__val_.originString.m_impl.m_ptr = 0;
      if (!v5) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    *(_DWORD *)m_ptr -= 2;
  }
  v5 = (WTF::StringImpl *)self->_internal.var0.__val_.originString.m_impl.m_ptr;
  self->_internal.var0.__val_.originString.m_impl.m_ptr = 0;
  if (!v5)
  {
LABEL_12:
    v6 = self->_internal.var0.__val_.language.m_impl.m_ptr;
    self->_internal.var0.__val_.language.m_impl.m_ptr = 0;
    if (!v6) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_10:
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_12;
  }
  WTF::StringImpl::destroy(v5, (StringImpl *)a2);
  v6 = self->_internal.var0.__val_.language.m_impl.m_ptr;
  self->_internal.var0.__val_.language.m_impl.m_ptr = 0;
  if (!v6) {
    goto LABEL_17;
  }
LABEL_15:
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v6, (StringImpl *)a2);
    v7 = (WTF::StringImpl *)self->_internal.var0.__val_.tag.m_impl.m_ptr;
    self->_internal.var0.__val_.tag.m_impl.m_ptr = 0;
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  *(_DWORD *)v6 -= 2;
LABEL_17:
  v7 = (WTF::StringImpl *)self->_internal.var0.__val_.tag.m_impl.m_ptr;
  self->_internal.var0.__val_.tag.m_impl.m_ptr = 0;
  if (!v7)
  {
LABEL_22:
    v8 = self->_internal.var0.__val_.iconURL.m_impl.m_ptr;
    self->_internal.var0.__val_.iconURL.m_impl.m_ptr = 0;
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_20:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_22;
  }
  WTF::StringImpl::destroy(v7, (StringImpl *)a2);
  v8 = self->_internal.var0.__val_.iconURL.m_impl.m_ptr;
  self->_internal.var0.__val_.iconURL.m_impl.m_ptr = 0;
  if (!v8) {
    goto LABEL_27;
  }
LABEL_25:
  if (*(_DWORD *)v8 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v8, (StringImpl *)a2);
    v9 = (WTF::StringImpl *)self->_internal.var0.__val_.body.m_impl.m_ptr;
    self->_internal.var0.__val_.body.m_impl.m_ptr = 0;
    if (!v9) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  *(_DWORD *)v8 -= 2;
LABEL_27:
  v9 = (WTF::StringImpl *)self->_internal.var0.__val_.body.m_impl.m_ptr;
  self->_internal.var0.__val_.body.m_impl.m_ptr = 0;
  if (!v9)
  {
LABEL_32:
    v10 = self->_internal.var0.__val_.title.m_impl.m_ptr;
    self->_internal.var0.__val_.title.m_impl.m_ptr = 0;
    if (!v10) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
LABEL_30:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    goto LABEL_32;
  }
  WTF::StringImpl::destroy(v9, (StringImpl *)a2);
  v10 = self->_internal.var0.__val_.title.m_impl.m_ptr;
  self->_internal.var0.__val_.title.m_impl.m_ptr = 0;
  if (!v10) {
    goto LABEL_37;
  }
LABEL_35:
  if (*(_DWORD *)v10 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v10, (StringImpl *)a2);
    v11 = self->_internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
    self->_internal.var0.contextIdentifier.var0.m_processIdentifier.m_identifier = 0;
    if (!v11) {
      return;
    }
    goto LABEL_40;
  }
  *(_DWORD *)v10 -= 2;
LABEL_37:
  v11 = self->_internal.var0.__val_.defaultActionURL.m_string.m_impl.m_ptr;
  self->_internal.var0.contextIdentifier.var0.m_processIdentifier.m_identifier = 0;
  if (!v11) {
    return;
  }
LABEL_40:
  if (*(_DWORD *)v11 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v11, (StringImpl *)a2);
  }
  else
  {
    *(_DWORD *)v11 -= 2;
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 16) = 0;
  *((unsigned char *)self + 272) = 0;
  return self;
}

@end