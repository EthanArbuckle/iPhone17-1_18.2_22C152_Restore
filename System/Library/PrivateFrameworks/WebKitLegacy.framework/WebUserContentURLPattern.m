@interface WebUserContentURLPattern
- (BOOL)isValid;
- (BOOL)matchesSubdomains;
- (BOOL)matchesURL:(id)a3;
- (WebUserContentURLPattern)initWithPatternString:(id)a3;
- (id)host;
- (id)scheme;
- (void)dealloc;
@end

@implementation WebUserContentURLPattern

- (WebUserContentURLPattern)initWithPatternString:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WebUserContentURLPattern;
  v4 = [(WebUserContentURLPattern *)&v25 init];
  if (!v4) {
    return v4;
  }
  v4->_private = objc_alloc_init(WebUserContentURLPatternPrivate);
  MEMORY[0x1E4E442D0](&v20, a3);
  v21 = 0;
  v22 = 0;
  v23 = 0;
  __int16 v24 = 1;
  LOBYTE(v24) = WebCore::UserContentURLPattern::parse();
  v6 = v4->_private;
  v7 = v21;
  v21 = 0;
  m_ptr = (WTF::StringImpl *)v6->pattern.m_scheme.m_impl.m_ptr;
  v6->pattern.m_scheme.m_impl.m_ptr = (StringImpl *)v7;
  if (!m_ptr)
  {
LABEL_5:
    v9 = v22;
    v22 = 0;
    v10 = (WTF::StringImpl *)v6->pattern.m_host.m_impl.m_ptr;
    v6->pattern.m_host.m_impl.m_ptr = (StringImpl *)v9;
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)m_ptr != 2)
  {
    *(_DWORD *)m_ptr -= 2;
    goto LABEL_5;
  }
  WTF::StringImpl::destroy(m_ptr, v5);
  v11 = v22;
  v22 = 0;
  v10 = (WTF::StringImpl *)v6->pattern.m_host.m_impl.m_ptr;
  v6->pattern.m_host.m_impl.m_ptr = (StringImpl *)v11;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_8:
  if (*(_DWORD *)v10 == 2)
  {
    WTF::StringImpl::destroy(v10, v5);
    v14 = v23;
    v23 = 0;
    v13 = (WTF::StringImpl *)v6->pattern.m_path.m_impl.m_ptr;
    v6->pattern.m_path.m_impl.m_ptr = (StringImpl *)v14;
    if (!v13) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  *(_DWORD *)v10 -= 2;
LABEL_10:
  v12 = v23;
  v23 = 0;
  v13 = (WTF::StringImpl *)v6->pattern.m_path.m_impl.m_ptr;
  v6->pattern.m_path.m_impl.m_ptr = (StringImpl *)v12;
  if (!v13)
  {
LABEL_15:
    *(_WORD *)&v6->pattern.m_error = v24;
    v15 = v22;
    v22 = 0;
    v23 = 0;
    if (!v15) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
LABEL_13:
  if (*(_DWORD *)v13 != 2)
  {
    *(_DWORD *)v13 -= 2;
    goto LABEL_15;
  }
  WTF::StringImpl::destroy(v13, v5);
  v16 = v23;
  *(_WORD *)&v6->pattern.m_error = v24;
  v23 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy(v16, v5);
      v15 = v22;
      v22 = 0;
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_21;
    }
    *(_DWORD *)v16 -= 2;
  }
  v15 = v22;
  v22 = 0;
  if (!v15) {
    goto LABEL_24;
  }
LABEL_21:
  if (*(_DWORD *)v15 == 2) {
    WTF::StringImpl::destroy(v15, v5);
  }
  else {
    *(_DWORD *)v15 -= 2;
  }
LABEL_24:
  v17 = v21;
  v21 = 0;
  if (!v17) {
    goto LABEL_27;
  }
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
LABEL_27:
    v18 = v20;
    v20 = 0;
    if (!v18) {
      return v4;
    }
    goto LABEL_30;
  }
  WTF::StringImpl::destroy(v17, v5);
  v18 = v20;
  v20 = 0;
  if (!v18) {
    return v4;
  }
LABEL_30:
  if (*(_DWORD *)v18 != 2)
  {
    *(_DWORD *)v18 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v18, v5);
  return v4;
}

- (void)dealloc
{
  self->_private = 0;
  v3.receiver = self;
  v3.super_class = (Class)WebUserContentURLPattern;
  [(WebUserContentURLPattern *)&v3 dealloc];
}

- (BOOL)isValid
{
  return self->_private->pattern.m_error == 0;
}

- (id)scheme
{
  if (self->_private->pattern.m_scheme.m_impl.m_ptr) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1F3C7DA90;
  }
}

- (id)host
{
  if (self->_private->pattern.m_host.m_impl.m_ptr) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1F3C7DA90;
  }
}

- (BOOL)matchesSubdomains
{
  return self->_private->pattern.m_matchSubdomains;
}

- (BOOL)matchesURL:(id)a3
{
  objc_super v3 = self->_private;
  if (v3->pattern.m_error) {
    return 0;
  }
  p_pattern = (WebCore::UserContentURLPattern *)&v3->pattern;
  MEMORY[0x1E4E441F0](v21, a3);
  if (!WebCore::UserContentURLPattern::matchesScheme(p_pattern, (const WTF::URL *)v21))
  {
    char v4 = 0;
    goto LABEL_39;
  }
  MEMORY[0x1E4E441F0](v20, a3);
  WTF::URL::host((WTF::URL *)v20);
  if ((v9 & 0xFF00000000) != 0)
  {
    if (v9)
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
LABEL_11:
      v10 = v19[0];
      goto LABEL_13;
    }
  }
  else if (v9)
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    goto LABEL_11;
  }
  v10 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
  *MEMORY[0x1E4F30960] += 2;
LABEL_13:
  v23 = v10;
  int v11 = WebCore::UserContentURLPattern::matchesHost(p_pattern, (const WTF::String *)&v23);
  v12 = v23;
  v23 = 0;
  if (!v12) {
    goto LABEL_16;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
LABEL_16:
    if (v11) {
      goto LABEL_17;
    }
LABEL_21:
    char v4 = 0;
    v14 = v20[0];
    v20[0] = 0;
    if (!v14) {
      goto LABEL_39;
    }
    goto LABEL_36;
  }
  WTF::StringImpl::destroy(v12, v8);
  if (!v11) {
    goto LABEL_21;
  }
LABEL_17:
  MEMORY[0x1E4E441F0](v19, a3);
  WTF::URL::path((WTF::URL *)v19);
  if ((v13 & 0xFF00000000) != 0)
  {
    if (v13)
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
LABEL_25:
      v15 = v23;
      goto LABEL_27;
    }
  }
  else if (v13)
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    goto LABEL_25;
  }
  v15 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
  *MEMORY[0x1E4F30960] += 2;
LABEL_27:
  v22 = v15;
  char v4 = WebCore::UserContentURLPattern::matchesPath(p_pattern, (const WTF::String *)&v22);
  v16 = v22;
  v22 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy(v16, v8);
      v17 = v19[0];
      v19[0] = 0;
      if (!v17) {
        goto LABEL_35;
      }
LABEL_33:
      if (*(_DWORD *)v17 == 2)
      {
        WTF::StringImpl::destroy(v17, v8);
        v14 = v20[0];
        v20[0] = 0;
        if (!v14) {
          goto LABEL_39;
        }
        goto LABEL_36;
      }
      *(_DWORD *)v17 -= 2;
      goto LABEL_35;
    }
    *(_DWORD *)v16 -= 2;
  }
  v17 = v19[0];
  v19[0] = 0;
  if (v17) {
    goto LABEL_33;
  }
LABEL_35:
  v14 = v20[0];
  v20[0] = 0;
  if (!v14) {
    goto LABEL_39;
  }
LABEL_36:
  if (*(_DWORD *)v14 == 2) {
    WTF::StringImpl::destroy(v14, v8);
  }
  else {
    *(_DWORD *)v14 -= 2;
  }
LABEL_39:
  v18 = v21[0];
  v21[0] = 0;
  if (!v18) {
    return v4;
  }
  if (*(_DWORD *)v18 == 2) {
    WTF::StringImpl::destroy(v18, v8);
  }
  else {
    *(_DWORD *)v18 -= 2;
  }
  return v4;
}

@end