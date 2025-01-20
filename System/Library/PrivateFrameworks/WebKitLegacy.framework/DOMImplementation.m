@interface DOMImplementation
- (BOOL)hasFeature:(NSString *)feature version:(NSString *)version;
- (DOMCSSStyleSheet)createCSSStyleSheet:(NSString *)title media:(NSString *)media;
- (DOMDocument)createDocument:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName doctype:(DOMDocumentType *)doctype;
- (DOMDocumentType)createDocumentType:(NSString *)qualifiedName publicId:(NSString *)publicId systemId:(NSString *)systemId;
- (DOMHTMLDocument)createHTMLDocument:(NSString *)title;
- (void)dealloc;
@end

@implementation DOMImplementation

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      uint64_t v5 = *(void *)(*((void *)internal + 1) + 8);
      if (*(_DWORD *)(v5 + 28) == 2)
      {
        if ((*(_WORD *)(v5 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v5);
        }
      }
      else
      {
        *(_DWORD *)(v5 + 28) -= 2;
      }
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMImplementation;
    [(DOMObject *)&v6 dealloc];
  }
}

- (BOOL)hasFeature:(NSString *)feature version:(NSString *)version
{
  return 1;
}

- (DOMDocumentType)createDocumentType:(NSString *)qualifiedName publicId:(NSString *)publicId systemId:(NSString *)systemId
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v24);
  WTF::AtomStringImpl::add(v25, (WTF::AtomStringImpl *)qualifiedName, v8);
  v19 = (WTF::StringImpl *)v25[0];
  MEMORY[0x1E4E442D0](&v18, publicId);
  MEMORY[0x1E4E442D0](&v17, systemId);
  WebCore::DOMImplementation::createDocumentType();
  if (!v22)
  {
    v9 = v20;
    v20 = 0;
    v23 = v9;
    v11 = (DOMDocumentType *)kit(v9);
    if (v9)
    {
      if (*((_DWORD *)v9 + 7) == 2)
      {
        if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v9);
        }
      }
      else
      {
        *((_DWORD *)v9 + 7) -= 2;
      }
    }
    if (v22 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A198[v22])(v25, &v20);
    }
    int v22 = -1;
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v10);
        v13 = v18;
        v18 = 0;
        if (!v13) {
          goto LABEL_17;
        }
LABEL_15:
        if (*(_DWORD *)v13 == 2)
        {
          WTF::StringImpl::destroy(v13, v10);
          v14 = v19;
          v19 = 0;
          if (!v14)
          {
LABEL_23:
            WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v24, v10);
            return v11;
          }
LABEL_20:
          if (*(_DWORD *)v14 == 2) {
            WTF::StringImpl::destroy(v14, v10);
          }
          else {
            *(_DWORD *)v14 -= 2;
          }
          goto LABEL_23;
        }
        *(_DWORD *)v13 -= 2;
LABEL_17:
        v14 = v19;
        v19 = 0;
        if (!v14) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
      *(_DWORD *)v12 -= 2;
    }
    v13 = v18;
    v18 = 0;
    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v22 == 1)
  {
    LOBYTE(v25[0]) = (_BYTE)v20;
    uint64_t v16 = v21;
    uint64_t v21 = 0;
    v25[1] = v16;
    raiseDOMErrorException();
  }
  result = (DOMDocumentType *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMDocument)createDocument:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName doctype:(DOMDocumentType *)doctype
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  WTF::AtomStringImpl::add(v22, (WTF::AtomStringImpl *)namespaceURI, v7);
  uint64_t v16 = (WTF::StringImpl *)v22[0];
  WTF::AtomStringImpl::add(v22, (WTF::AtomStringImpl *)qualifiedName, v8);
  v15 = (WTF::StringImpl *)v22[0];
  WebCore::DOMImplementation::createDocument();
  if (!v19)
  {
    v9 = v17;
    v17 = 0;
    v20 = v9;
    v11 = (DOMDocument *)kit(v9);
    if (v9)
    {
      if (*((_DWORD *)v9 + 7) == 2)
      {
        if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v9);
        }
      }
      else
      {
        *((_DWORD *)v9 + 7) -= 2;
      }
    }
    if (v19 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A1A8[v19])(v22, &v17);
    }
    int v19 = -1;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
      {
        WTF::StringImpl::destroy(v15, v10);
        v12 = v16;
        if (!v16)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v10);
          return v11;
        }
LABEL_15:
        if (*(_DWORD *)v12 == 2) {
          WTF::StringImpl::destroy(v12, v10);
        }
        else {
          *(_DWORD *)v12 -= 2;
        }
        goto LABEL_18;
      }
      *(_DWORD *)v15 -= 2;
    }
    v12 = v16;
    if (!v16) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v19 == 1)
  {
    LOBYTE(v22[0]) = (_BYTE)v17;
    uint64_t v14 = v18;
    uint64_t v18 = 0;
    v22[1] = v14;
    raiseDOMErrorException();
  }
  result = (DOMDocument *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCSSStyleSheet)createCSSStyleSheet:(NSString *)title media:(NSString *)media
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1E4E442D0](&v14, title);
  MEMORY[0x1E4E442D0](&v13, media);
  WebCore::DOMImplementation::createCSSStyleSheet((uint64_t *)&v15, (WebCore::DOMImplementation *)&v14, (const WTF::String *)&v13, v6);
  CFStringRef v8 = (DOMCSSStyleSheet *)kit(v15);
  v9 = v15;
  v15 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 2) == 1)
    {
      (*(void (**)(DOMObjectInternal *))(*(void *)v9 + 8))(v9);
      v10 = v13;
      v13 = 0;
      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    --*((_DWORD *)v9 + 2);
  }
  v10 = v13;
  v13 = 0;
  if (!v10) {
    goto LABEL_8;
  }
LABEL_5:
  if (*(_DWORD *)v10 == 2) {
    WTF::StringImpl::destroy(v10, v7);
  }
  else {
    *(_DWORD *)v10 -= 2;
  }
LABEL_8:
  v11 = v14;
  uint64_t v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v7);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v7);
  return v8;
}

- (DOMHTMLDocument)createHTMLDocument:(NSString *)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v9, title);
  WebCore::DOMImplementation::createHTMLDocument();
  uint64_t v5 = (DOMHTMLDocument *)kit(v10);
  objc_super v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  CFStringRef v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return v5;
}

@end