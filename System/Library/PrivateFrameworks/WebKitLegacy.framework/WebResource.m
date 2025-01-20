@interface WebResource
- (NSData)data;
- (NSString)MIMEType;
- (NSString)frameName;
- (NSString)textEncodingName;
- (NSURL)URL;
- (NakedRef<WebCore::ArchiveResource>)_coreResource;
- (WebResource)init;
- (WebResource)initWithCoder:(id)a3;
- (WebResource)initWithData:(NSData *)data URL:(NSURL *)URL MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName frameName:(NSString *)frameName;
- (id)_initWithCoreResource:(void *)a3;
- (id)_initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7 response:(id)a8 copyData:(BOOL)a9;
- (id)_initWithData:(id)a3 URL:(id)a4 response:(id)a5;
- (id)_response;
- (id)_stringValue;
- (id)_suggestedFilename;
- (id)description;
- (void)_ignoreWhenUnarchiving;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WebResource

- (WebResource)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebResource;
  v2 = [(WebResource *)&v4 init];
  if (v2) {
    v2->_private = objc_alloc_init(WebResourcePrivate);
  }
  return v2;
}

- (WebResource)initWithData:(NSData *)data URL:(NSURL *)URL MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName frameName:(NSString *)frameName
{
  LOBYTE(v8) = 1;
  return (WebResource *)[(WebResource *)self _initWithData:data URL:URL MIMEType:MIMEType textEncodingName:textEncodingName frameName:frameName response:0 copyData:v8];
}

- (WebResource)initWithCoder:(id)a3
{
  v47.receiver = self;
  v47.super_class = (Class)WebResource;
  objc_super v4 = [(WebResource *)&v47 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = [a3 decodeObjectForKey:@"WebResourceData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = (WebCore::FragmentedSharedBuffer *)v5;
  }
  else {
    v6 = 0;
  }
  uint64_t v7 = [a3 decodeObjectForKey:@"WebResourceURL"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [a3 decodeObjectForKey:@"WebResourceMIMEType"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [a3 decodeObjectForKey:@"WebResourceTextEncodingName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [a3 decodeObjectForKey:@"WebResourceFrameName"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v10 = 0;
  }
  v11 = (const void *)[a3 decodeObjectForKey:@"WebResourceResponse"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v11 = 0;
  }
  WebCore::FragmentedSharedBuffer::create(v36, v6, v12);
  uint64_t v13 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1E4E44F40](v13, v36);
  uint64_t v44 = v13;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(v36, v14);
  uint64_t v15 = v44;
  uint64_t v44 = 0;
  uint64_t v45 = v15;
  MEMORY[0x1E4E441F0](&v43, v7);
  MEMORY[0x1E4E442D0](&v42, v8);
  MEMORY[0x1E4E442D0](&v41, v9);
  MEMORY[0x1E4E442D0](&v40, v10);
  WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)v36);
  CFTypeRef cf = v11;
  if (v11) {
    CFRetain(v11);
  }
  char v39 = 0;
  char v37 = v37 & 0xF0 | (v11 == 0);
  WebCore::ArchiveResource::create();
  CFTypeRef v17 = cf;
  CFTypeRef cf = 0;
  if (v17) {
    CFRelease(v17);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v36, v16);
  v19 = v40;
  v40 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
    {
      WTF::StringImpl::destroy(v19, v18);
      v20 = v41;
      v41 = 0;
      if (!v20) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    *(_DWORD *)v19 -= 2;
  }
  v20 = v41;
  v41 = 0;
  if (!v20)
  {
LABEL_27:
    v21 = v42;
    v42 = 0;
    if (!v21) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
LABEL_25:
  if (*(_DWORD *)v20 != 2)
  {
    *(_DWORD *)v20 -= 2;
    goto LABEL_27;
  }
  WTF::StringImpl::destroy(v20, v18);
  v21 = v42;
  v42 = 0;
  if (!v21) {
    goto LABEL_32;
  }
LABEL_30:
  if (*(_DWORD *)v21 == 2)
  {
    WTF::StringImpl::destroy(v21, v18);
    v22 = v43;
    v43 = 0;
    if (!v22) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  *(_DWORD *)v21 -= 2;
LABEL_32:
  v22 = v43;
  v43 = 0;
  if (!v22)
  {
LABEL_37:
    uint64_t v23 = v45;
    uint64_t v45 = 0;
    if (!v23) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_35:
  if (*(_DWORD *)v22 != 2)
  {
    *(_DWORD *)v22 -= 2;
    goto LABEL_37;
  }
  WTF::StringImpl::destroy(v22, v18);
  uint64_t v23 = v45;
  uint64_t v45 = 0;
  if (!v23) {
    goto LABEL_41;
  }
LABEL_40:
  if (atomic_fetch_add((atomic_uint *volatile)v23, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v23);
    uint64_t v26 = *(unsigned int *)(v23 + 20);
    if (v26)
    {
      uint64_t v27 = 16 * v26;
      v28 = (unsigned int **)(*(void *)(v23 + 8) + 8);
      do
      {
        v29 = *v28;
        *v28 = 0;
        if (v29 && atomic_fetch_add((atomic_uint *volatile)v29, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v29);
          uint64_t v30 = v29[6];
          if (v30 != -1) {
            ((void (*)(uint64_t *, unsigned int *))off_1F3C7D788[v30])(v36, v29 + 2);
          }
          v29[6] = -1;
          WTF::fastFree((WTF *)v29, v18);
        }
        v28 += 2;
        v27 -= 16;
      }
      while (v27);
    }
    v31 = *(WTF **)(v23 + 8);
    if ((WTF *)(v23 + 24) != v31 && v31 != 0)
    {
      *(void *)(v23 + 8) = 0;
      *(_DWORD *)(v23 + 16) = 0;
      WTF::fastFree(v31, v18);
    }
    WTF::fastFree((WTF *)v23, v18);
    WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v44, v33);
    if (v46) {
      goto LABEL_42;
    }
    goto LABEL_60;
  }
LABEL_41:
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v44, v18);
  if (v46)
  {
LABEL_42:
    v24 = [WebResourcePrivate alloc];
    v36[0] = v46;
    uint64_t v46 = 0;
    v4->_private = -[WebResourcePrivate initWithCoreResource:](v24, "initWithCoreResource:", v36, 0);
    v25 = (_DWORD *)v36[0];
    v36[0] = 0;
    if (v25)
    {
      if (v25[2] == 1) {
        (*(void (**)(_DWORD *))(*(void *)v25 + 8))(v25);
      }
      else {
        --v25[2];
      }
    }
    goto LABEL_61;
  }
LABEL_60:

  objc_super v4 = 0;
LABEL_61:
  v34 = (_DWORD *)v46;
  uint64_t v46 = 0;
  if (v34)
  {
    if (v34[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v34 + 8))(v34);
    }
    else {
      --v34[2];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr)
  {
    v6 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    v11 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = (WebCore::FragmentedSharedBuffer *)WebCore::SubstituteResource::data(*((void *)m_ptr + 39), (void *)a2);
  WebCore::FragmentedSharedBuffer::makeContiguous((uint64_t *)&v12, v5);
  WebCore::SharedBuffer::createNSData((uint64_t *)&v13, v12);
  v6 = v13;
  uint64_t v13 = 0;
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v12, v7);
  uint64_t v8 = WTF::URL::operator NSURL *();
  if (*((void *)m_ptr + 40))
  {
    uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*((void *)m_ptr + 41)) {
      goto LABEL_4;
    }
LABEL_8:
    uint64_t v10 = &stru_1F3C7DA90;
    if (*((void *)m_ptr + 42)) {
      goto LABEL_5;
    }
LABEL_9:
    v11 = &stru_1F3C7DA90;
    goto LABEL_10;
  }
  uint64_t v9 = &stru_1F3C7DA90;
  if (!*((void *)m_ptr + 41)) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
  if (!*((void *)m_ptr + 42)) {
    goto LABEL_9;
  }
LABEL_5:
  v11 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_10:
  m_ptr = (ArchiveResource *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)((char *)m_ptr + 56));
LABEL_11:
  [a3 encodeObject:v6 forKey:@"WebResourceData"];
  [a3 encodeObject:v8 forKey:@"WebResourceURL"];
  [a3 encodeObject:v9 forKey:@"WebResourceMIMEType"];
  [a3 encodeObject:v10 forKey:@"WebResourceTextEncodingName"];
  [a3 encodeObject:v11 forKey:@"WebResourceFrameName"];
  [a3 encodeObject:m_ptr forKey:@"WebResourceResponse"];
  if (v6) {
    CFRelease(v6);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebResource;
  [(WebResource *)&v3 dealloc];
}

- (NSData)data
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  objc_super v3 = (WebCore::FragmentedSharedBuffer *)WebCore::SubstituteResource::data(*((void *)m_ptr + 39), (void *)a2);
  WebCore::FragmentedSharedBuffer::makeContiguous((uint64_t *)&v9, v3);
  WebCore::SharedBuffer::createNSData((uint64_t *)&cf, v9);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  v6 = (id)CFMakeCollectable(v4);
  CFTypeRef v7 = cf;
  CFTypeRef cf = 0;
  if (v7) {
    CFRelease(v7);
  }
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v9, v5);
  return v6;
}

- (NSURL)URL
{
  if (self->_private->coreResource.m_ptr) {
    return (NSURL *)WTF::URL::operator NSURL *();
  }
  else {
    return 0;
  }
}

- (NSString)MIMEType
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (*((void *)m_ptr + 40)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return (NSString *)&stru_1F3C7DA90;
}

- (NSString)textEncodingName
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (*((void *)m_ptr + 41)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return (NSString *)&stru_1F3C7DA90;
}

- (NSString)frameName
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (*((void *)m_ptr + 42)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return (NSString *)&stru_1F3C7DA90;
}

- (id)description
{
  objc_super v3 = NSString;
  CFTypeRef v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %@>", NSStringFromClass(v4), -[WebResource URL](self, "URL")];
}

- (id)_initWithCoreResource:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WebResource;
  CFTypeRef v4 = [(WebResource *)&v6 init];
  if (v4) {
    v4->_private = [[WebResourcePrivate alloc] initWithCoreResource:a3];
  }
  return v4;
}

- (NakedRef<WebCore::ArchiveResource>)_coreResource
{
  return (NakedRef<WebCore::ArchiveResource>)self->_private->coreResource.m_ptr;
}

- (void)_ignoreWhenUnarchiving
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (m_ptr) {
    *((unsigned char *)m_ptr + 352) = 1;
  }
}

- (id)_initWithData:(id)a3 URL:(id)a4 MIMEType:(id)a5 textEncodingName:(id)a6 frameName:(id)a7 response:(id)a8 copyData:(BOOL)a9
{
  v52.receiver = self;
  v52.super_class = (Class)WebResource;
  uint64_t v15 = [(WebResource *)&v52 init];
  CFTypeRef v17 = v15;
  if (v15)
  {
    if (!a3 || !a4 || !a5)
    {

      return 0;
    }
    if (a9) {
      a3 = (id)[a3 copy];
    }
    WebCore::FragmentedSharedBuffer::create(v41, (WebCore::FragmentedSharedBuffer *)a3, v16);
    uint64_t v18 = WTF::fastMalloc((WTF *)0x38);
    MEMORY[0x1E4E44F40](v18, v41);
    uint64_t v49 = v18;
    WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(v41, v19);
    uint64_t v20 = v49;
    uint64_t v49 = 0;
    uint64_t v50 = v20;
    MEMORY[0x1E4E441F0](&v48, a4);
    MEMORY[0x1E4E442D0](&v47, a5);
    MEMORY[0x1E4E442D0](&v46, a6);
    MEMORY[0x1E4E442D0](&v45, a7);
    WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)v41);
    CFTypeRef cf = a8;
    if (a8) {
      CFRetain(a8);
    }
    char v44 = 0;
    char v42 = v42 & 0xF0 | (a8 == 0);
    WebCore::ArchiveResource::create();
    CFTypeRef v22 = cf;
    CFTypeRef cf = 0;
    if (v22) {
      CFRelease(v22);
    }
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v41, v21);
    v24 = v45;
    uint64_t v45 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2)
      {
        WTF::StringImpl::destroy(v24, v23);
        v25 = v46;
        uint64_t v46 = 0;
        if (!v25) {
          goto LABEL_20;
        }
LABEL_18:
        if (*(_DWORD *)v25 == 2)
        {
          WTF::StringImpl::destroy(v25, v23);
          uint64_t v26 = v47;
          objc_super v47 = 0;
          if (!v26) {
            goto LABEL_25;
          }
LABEL_23:
          if (*(_DWORD *)v26 == 2)
          {
            WTF::StringImpl::destroy(v26, v23);
            uint64_t v27 = v48;
            v48 = 0;
            if (!v27) {
              goto LABEL_30;
            }
LABEL_28:
            if (*(_DWORD *)v27 == 2)
            {
              WTF::StringImpl::destroy(v27, v23);
              uint64_t v28 = v50;
              uint64_t v50 = 0;
              if (!v28) {
                goto LABEL_34;
              }
LABEL_33:
              if (atomic_fetch_add((atomic_uint *volatile)v28, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, (unsigned int *)v28);
                uint64_t v33 = *(unsigned int *)(v28 + 20);
                if (v33)
                {
                  uint64_t v34 = 16 * v33;
                  v35 = (unsigned int **)(*(void *)(v28 + 8) + 8);
                  do
                  {
                    v36 = *v35;
                    *v35 = 0;
                    if (v36 && atomic_fetch_add((atomic_uint *volatile)v36, 0xFFFFFFFF) == 1)
                    {
                      atomic_store(1u, v36);
                      uint64_t v37 = v36[6];
                      if (v37 != -1) {
                        ((void (*)(uint64_t *, unsigned int *))off_1F3C7D788[v37])(v41, v36 + 2);
                      }
                      v36[6] = -1;
                      WTF::fastFree((WTF *)v36, v23);
                    }
                    v35 += 2;
                    v34 -= 16;
                  }
                  while (v34);
                }
                v38 = *(WTF **)(v28 + 8);
                if ((WTF *)(v28 + 24) != v38 && v38 != 0)
                {
                  *(void *)(v28 + 8) = 0;
                  *(_DWORD *)(v28 + 16) = 0;
                  WTF::fastFree(v38, v23);
                }
                WTF::fastFree((WTF *)v28, v23);
                WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v49, v40);
                if (!a9)
                {
LABEL_37:
                  if (v51)
                  {
                    v29 = [WebResourcePrivate alloc];
                    v41[0] = v51;
                    uint64_t v51 = 0;
                    v17->_private = [(WebResourcePrivate *)v29 initWithCoreResource:v41];
                    uint64_t v30 = (_DWORD *)v41[0];
                    v41[0] = 0;
                    if (v30)
                    {
                      if (v30[2] == 1)
                      {
                        (*(void (**)(_DWORD *))(*(void *)v30 + 8))(v30);
                        v31 = (_DWORD *)v51;
                        uint64_t v51 = 0;
                        if (!v31) {
                          return v17;
                        }
                      }
                      else
                      {
                        --v30[2];
                        v31 = (_DWORD *)v51;
                        uint64_t v51 = 0;
                        if (!v31) {
                          return v17;
                        }
                      }
LABEL_44:
                      if (v31[2] == 1) {
                        (*(void (**)(_DWORD *))(*(void *)v31 + 8))(v31);
                      }
                      else {
                        --v31[2];
                      }
                      return v17;
                    }
                  }
                  else
                  {

                    CFTypeRef v17 = 0;
                  }
                  v31 = (_DWORD *)v51;
                  uint64_t v51 = 0;
                  if (!v31) {
                    return v17;
                  }
                  goto LABEL_44;
                }
LABEL_35:
                if (a3) {
                  CFRelease(a3);
                }
                goto LABEL_37;
              }
LABEL_34:
              WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v49, v23);
              if (!a9) {
                goto LABEL_37;
              }
              goto LABEL_35;
            }
            *(_DWORD *)v27 -= 2;
LABEL_30:
            uint64_t v28 = v50;
            uint64_t v50 = 0;
            if (!v28) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
          *(_DWORD *)v26 -= 2;
LABEL_25:
          uint64_t v27 = v48;
          v48 = 0;
          if (!v27) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }
        *(_DWORD *)v25 -= 2;
LABEL_20:
        uint64_t v26 = v47;
        objc_super v47 = 0;
        if (!v26) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      *(_DWORD *)v24 -= 2;
    }
    v25 = v46;
    uint64_t v46 = 0;
    if (!v25) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  return v17;
}

- (id)_initWithData:(id)a3 URL:(id)a4 response:(id)a5
{
  LOBYTE(v6) = 0;
  return -[WebResource _initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:](self, "_initWithData:URL:MIMEType:textEncodingName:frameName:response:copyData:", a3, a4, [a5 MIMEType], objc_msgSend(a5, "textEncodingName"), 0, a5, v6);
}

- (id)_suggestedFilename
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  WebCore::ResourceResponseBase::suggestedFilename((uint64_t *)&v7, (WebCore::ResourceResponseBase *)((char *)m_ptr + 56));
  if (!v7) {
    return &stru_1F3C7DA90;
  }
  CFTypeRef v4 = (void *)WTF::StringImpl::operator NSString *();
  uint64_t v5 = v7;
  CFTypeRef v7 = 0;
  if (!v5) {
    return v4;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v5, v3);
  return v4;
}

- (id)_response
{
  m_ptr = self->_private->coreResource.m_ptr;
  if (!m_ptr
    || (id result = (id)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)((char *)m_ptr + 56))) == 0)
  {
    CFTypeRef v4 = (void *)CFMakeCollectable(objc_alloc_init(MEMORY[0x1E4F18DB0]));
    return v4;
  }
  return result;
}

- (id)_stringValue
{
  v2 = self;
  long long v31 = 0uLL;
  uint64_t v30 = &unk_1F3C7B378;
  m_ptr = self->_private->coreResource.m_ptr;
  if (m_ptr)
  {
    self = (WebResource *)PAL::TextEncoding::TextEncoding((PAL::TextEncoding *)&v27, (const WTF::String *)((char *)m_ptr + 328));
    __int16 v32 = v29;
    long long v31 = v28;
    if (*((void *)&v28 + 1))
    {
      uint64_t v5 = v2->_private->coreResource.m_ptr;
      if (v5) {
        goto LABEL_4;
      }
      return &stru_1F3C7DA90;
    }
  }
  uint64_t v12 = PAL::WindowsLatin1Encoding((PAL *)self);
  __int16 v13 = *(_WORD *)(v12 + 24);
  long long v31 = *(_OWORD *)(v12 + 8);
  __int16 v32 = v13;
  uint64_t v5 = v2->_private->coreResource.m_ptr;
  if (!v5) {
    return &stru_1F3C7DA90;
  }
LABEL_4:
  uint64_t v6 = *((void *)v5 + 39);
  CFTypeRef v7 = (WebCore::FragmentedSharedBuffer *)WebCore::SubstituteResource::data(v6, v4);
  atomic_fetch_add((atomic_uint *volatile)v6, 1u);
  WebCore::FragmentedSharedBuffer::makeContiguous((uint64_t *)&v26, v7);
  WebCore::SharedBuffer::data(v26);
  char v33 = 0;
  PAL::TextEncoding::decode();
  if (v27)
  {
    uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    uint64_t v10 = v27;
    uint64_t v27 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v8);
        WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v26, v18);
        if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1) {
          goto LABEL_14;
        }
      }
      else
      {
        *(_DWORD *)v10 -= 2;
        WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v26, v8);
        if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) == 1) {
          goto LABEL_14;
        }
      }
      return v9;
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v9 = &stru_1F3C7DA90;
  }
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v26, v8);
  if (atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF) != 1) {
    return v9;
  }
LABEL_14:
  atomic_store(1u, (unsigned int *)v6);
  uint64_t v15 = *(unsigned int *)(v6 + 20);
  if (v15)
  {
    uint64_t v16 = 16 * v15;
    CFTypeRef v17 = (unsigned int **)(*(void *)(v6 + 8) + 8);
    do
    {
      v19 = *v17;
      *CFTypeRef v17 = 0;
      if (v19 && atomic_fetch_add((atomic_uint *volatile)v19, 0xFFFFFFFF) == 1)
      {
        uint64_t v23 = v16;
        v24 = v17;
        atomic_store(1u, v19);
        v25 = (WTF *)v19;
        uint64_t v20 = v19[6];
        if (v20 != -1) {
          ((void (*)(WTF::StringImpl **, unsigned int *))off_1F3C7D788[v20])(&v27, v19 + 2);
        }
        *((_DWORD *)v25 + 6) = -1;
        WTF::fastFree(v25, v11);
        uint64_t v16 = v23;
        CFTypeRef v17 = v24;
      }
      v17 += 2;
      v16 -= 16;
    }
    while (v16);
  }
  v21 = *(WTF **)(v6 + 8);
  if ((WTF *)(v6 + 24) != v21 && v21 != 0)
  {
    *(void *)(v6 + 8) = 0;
    *(_DWORD *)(v6 + 16) = 0;
    WTF::fastFree(v21, v11);
  }
  WTF::fastFree((WTF *)v6, v11);
  return v9;
}

@end