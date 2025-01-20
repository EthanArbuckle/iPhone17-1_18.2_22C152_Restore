@interface DOMNativeXPathNSResolver
- (id)lookupNamespaceURI:(id)a3;
- (void)dealloc;
@end

@implementation DOMNativeXPathNSResolver

- (void)dealloc
{
  internal = self->super._internal;
  if (internal)
  {
    if (*((_DWORD *)internal + 2) == 1) {
      (*(void (**)(DOMObjectInternal *, SEL))(*(void *)internal + 8))(internal, a2);
    }
    else {
      --*((_DWORD *)internal + 2);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)DOMNativeXPathNSResolver;
  [(DOMObject *)&v4 dealloc];
}

- (id)lookupNamespaceURI:(id)a3
{
  internal = self->super._internal;
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, (const __CFString *)a2);
  (*(void (**)(WTF::StringImpl **__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal
                                                                                                  + 16))(&v10, internal, &v9);
  if (v10)
  {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    v6 = v10;
    v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
        v7 = v9;
        v9 = 0;
        if (!v7) {
          return v5;
        }
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        v7 = v9;
        v9 = 0;
        if (!v7) {
          return v5;
        }
      }
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
    v5 = &stru_1F3C7DA90;
  }
  v7 = v9;
  v9 = 0;
  if (!v7) {
    return v5;
  }
LABEL_8:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return v5;
  }
  WTF::StringImpl::destroy(v7, v4);
  return v5;
}

@end