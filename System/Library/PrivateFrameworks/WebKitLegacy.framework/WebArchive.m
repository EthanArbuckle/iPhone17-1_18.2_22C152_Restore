@interface WebArchive
- (NSArray)subframeArchives;
- (NSArray)subresources;
- (NSData)data;
- (WebArchive)init;
- (WebArchive)initWithCoder:(id)a3;
- (WebArchive)initWithData:(NSData *)data;
- (WebArchive)initWithMainResource:(WebResource *)mainResource subresources:(NSArray *)subresources subframeArchives:(NSArray *)subframeArchives;
- (WebResource)mainResource;
- (id)_initWithCoreLegacyWebArchive:(void *)a3;
- (void)_coreLegacyWebArchive;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WebArchive

- (WebArchive)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebArchive;
  v2 = [(WebArchive *)&v4 init];
  if (v2) {
    v2->_private = objc_alloc_init(WebArchivePrivate);
  }
  return v2;
}

- (WebArchive)initWithMainResource:(WebResource *)mainResource subresources:(NSArray *)subresources subframeArchives:(NSArray *)subframeArchives
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)WebArchive;
  v8 = [(WebArchive *)&v77 init];
  if (!v8) {
    return 0;
  }
  v9 = objc_alloc_init(WebArchivePrivate);
  v8->_private = v9;
  if (mainResource) {
    CFRetain(mainResource);
  }
  m_ptr = v9->cachedMainResource.m_ptr;
  v9->cachedMainResource.m_ptr = mainResource;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v11 = v8->_private;
  if (!v11->cachedMainResource.m_ptr) {
    goto LABEL_27;
  }
  if (!subresources)
  {
    v15 = v11->cachedSubresources.m_ptr;
    v11->cachedSubresources.m_ptr = 0;
    if (!v15) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  NSUInteger v12 = [(NSArray *)subresources count];
  if (v12)
  {
    uint64_t v13 = 0;
    do
    {
      [(NSArray *)subresources objectAtIndex:v13];
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
    }
    while (v12 != ++v13);
  }
  v14 = v8->_private;
  CFRetain(subresources);
  v15 = v14->cachedSubresources.m_ptr;
  v14->cachedSubresources.m_ptr = subresources;
  if (v15) {
LABEL_18:
  }
    CFRelease(v15);
LABEL_19:
  if (!subframeArchives)
  {
    v22 = v8->_private;
    v19 = v22->cachedSubframeArchives.m_ptr;
    v22->cachedSubframeArchives.m_ptr = 0;
    if (!v19) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

    return 0;
  }
  NSUInteger v16 = [(NSArray *)subframeArchives count];
  if (v16)
  {
    uint64_t v17 = 0;
    do
    {
      [(NSArray *)subframeArchives objectAtIndex:v17];
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
    }
    while (v16 != ++v17);
  }
  v18 = v8->_private;
  CFRetain(subframeArchives);
  v19 = v18->cachedSubframeArchives.m_ptr;
  v18->cachedSubframeArchives.m_ptr = subframeArchives;
  if (v19) {
LABEL_31:
  }
    CFRelease(v19);
LABEL_32:
  v62 = v8;
  v75 = 0;
  uint64_t v76 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v23 = [(NSArray *)subresources countByEnumeratingWithState:&v71 objects:v79 count:16];
  v60 = mainResource;
  if (v23)
  {
    uint64_t v24 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v72 != v24) {
          objc_enumerationMutation(subresources);
        }
        uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v71 + 1) + 8 * i), "_coreResource", v60);
        uint64_t v28 = HIDWORD(v76);
        if (HIDWORD(v76) == v76)
        {
          unint64_t v29 = HIDWORD(v76) + ((unint64_t)HIDWORD(v76) >> 2);
          if (v29 >= 0x10) {
            unint64_t v30 = v29 + 1;
          }
          else {
            unint64_t v30 = 16;
          }
          if (v30 <= (unint64_t)HIDWORD(v76) + 1) {
            unint64_t v31 = HIDWORD(v76) + 1;
          }
          else {
            unint64_t v31 = v30;
          }
          if (v31 >> 29)
          {
            __break(0xC471u);
            goto LABEL_103;
          }
          v32 = v75;
          v33 = (WTF *)WTF::fastMalloc((WTF *)(8 * v31));
          LODWORD(v76) = v31;
          v75 = v33;
          memcpy(v33, v32, 8 * v28);
          if (v32)
          {
            if (v75 == v32)
            {
              v75 = 0;
              LODWORD(v76) = 0;
            }
            WTF::fastFree(v32, v34);
          }
          LODWORD(v28) = HIDWORD(v76);
          v26 = (uint64_t *)((char *)v75 + 8 * HIDWORD(v76));
        }
        else
        {
          v26 = (uint64_t *)((char *)v75 + 8 * HIDWORD(v76));
        }
        ++*(_DWORD *)(v27 + 8);
        uint64_t *v26 = v27;
        HIDWORD(v76) = v28 + 1;
      }
      uint64_t v23 = [(NSArray *)subresources countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v23);
  }
  v69 = 0;
  uint64_t v70 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v35 = -[NSArray countByEnumeratingWithState:objects:count:](subframeArchives, "countByEnumeratingWithState:objects:count:", &v65, v78, 16, v60);
  if (v35)
  {
    uint64_t v36 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v66 != v36) {
          objc_enumerationMutation(subframeArchives);
        }
        uint64_t v39 = [*(id *)(*(void *)(*((void *)&v65 + 1) + 8 * j) + 8) coreArchive];
        uint64_t v40 = HIDWORD(v70);
        if (HIDWORD(v70) == v70)
        {
          unint64_t v41 = HIDWORD(v70) + ((unint64_t)HIDWORD(v70) >> 2);
          if (v41 >= 0x10) {
            unint64_t v42 = v41 + 1;
          }
          else {
            unint64_t v42 = 16;
          }
          if (v42 <= (unint64_t)HIDWORD(v70) + 1) {
            unint64_t v43 = HIDWORD(v70) + 1;
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43 >> 29)
          {
            __break(0xC471u);
LABEL_103:
            JUMPOUT(0x1E142E21CLL);
          }
          v44 = v69;
          v45 = (WTF *)WTF::fastMalloc((WTF *)(8 * v43));
          LODWORD(v70) = v43;
          v69 = v45;
          memcpy(v45, v44, 8 * v40);
          if (v44)
          {
            if (v69 == v44)
            {
              v69 = 0;
              LODWORD(v70) = 0;
            }
            WTF::fastFree(v44, v46);
          }
          LODWORD(v40) = HIDWORD(v70);
          v38 = (uint64_t *)((char *)v69 + 8 * HIDWORD(v70));
        }
        else
        {
          v38 = (uint64_t *)((char *)v69 + 8 * HIDWORD(v70));
        }
        ++*(_DWORD *)(v39 + 8);
        uint64_t *v38 = v39;
        HIDWORD(v70) = v40 + 1;
      }
      uint64_t v35 = [(NSArray *)subframeArchives countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v35);
  }
  v20 = v62;
  v47 = v62->_private;
  uint64_t v48 = [v61 _coreResource];
  ++*(_DWORD *)(v48 + 8);
  v63 = (_DWORD *)v48;
  WebCore::LegacyWebArchive::create();
  [(WebArchivePrivate *)v47 setCoreArchive:&v64];
  v50 = v64;
  v64 = 0;
  if (!v50)
  {
LABEL_77:
    v51 = v63;
    if (v63) {
      goto LABEL_78;
    }
    goto LABEL_83;
  }
  if (v50[2] != 1)
  {
    --v50[2];
    goto LABEL_77;
  }
  (*(void (**)(_DWORD *))(*(void *)v50 + 8))(v50);
  v51 = v63;
  if (v63)
  {
LABEL_78:
    if (v51[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v51 + 8))(v51);
    }
    else {
      --v51[2];
    }
  }
LABEL_83:
  if (HIDWORD(v70))
  {
    v52 = v69;
    uint64_t v53 = 8 * HIDWORD(v70);
    do
    {
      v54 = *(_DWORD **)v52;
      *(void *)v52 = 0;
      if (v54)
      {
        if (v54[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v54 + 8))(v54);
        }
        else {
          --v54[2];
        }
      }
      v52 = (WTF *)((char *)v52 + 8);
      v53 -= 8;
    }
    while (v53);
  }
  v55 = v69;
  if (v69)
  {
    v69 = 0;
    LODWORD(v70) = 0;
    WTF::fastFree(v55, v49);
  }
  if (HIDWORD(v76))
  {
    v56 = v75;
    uint64_t v57 = 8 * HIDWORD(v76);
    do
    {
      v58 = *(_DWORD **)v56;
      *(void *)v56 = 0;
      if (v58)
      {
        if (v58[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v58 + 8))(v58);
        }
        else {
          --v58[2];
        }
      }
      v56 = (WTF *)((char *)v56 + 8);
      v57 -= 8;
    }
    while (v57);
  }
  v59 = v75;
  if (v75)
  {
    v75 = 0;
    LODWORD(v76) = 0;
    WTF::fastFree(v59, v49);
  }
  return v20;
}

- (WebArchive)initWithData:(NSData *)data
{
  v15.receiver = self;
  v15.super_class = (Class)WebArchive;
  objc_super v4 = [(WebArchive *)&v15 init];
  if (!v4) {
    return v4;
  }
  v4->_private = objc_alloc_init(WebArchivePrivate);
  WebCore::FragmentedSharedBuffer::create((uint64_t *)&v16, (WebCore::FragmentedSharedBuffer *)data, v5);
  uint64_t v6 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1E4E44F40](v6, &v16);
  uint64_t v13 = v6;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v16, v7);
  WebCore::LegacyWebArchive::create();
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v13, v8);
  if (v14)
  {
    v9 = v4->_private;
    NSUInteger v16 = (_DWORD *)v14;
    uint64_t v14 = 0;
    [(WebArchivePrivate *)v9 setCoreArchive:&v16];
    v10 = v16;
    NSUInteger v16 = 0;
    if (v10)
    {
      if (v10[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
        v11 = (_DWORD *)v14;
        uint64_t v14 = 0;
        if (!v11) {
          return v4;
        }
      }
      else
      {
        --v10[2];
        v11 = (_DWORD *)v14;
        uint64_t v14 = 0;
        if (!v11) {
          return v4;
        }
      }
      goto LABEL_9;
    }
  }
  else
  {

    objc_super v4 = 0;
  }
  v11 = (_DWORD *)v14;
  uint64_t v14 = 0;
  if (!v11) {
    return v4;
  }
LABEL_9:
  if (v11[2] != 1)
  {
    --v11[2];
    return v4;
  }
  (*(void (**)(_DWORD *))(*(void *)v11 + 8))(v11);
  return v4;
}

- (WebArchive)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectForKey:@"WebMainResource"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = (void *)[a3 decodeObjectForKey:@"WebSubresources"];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 count];
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v8 = 0;
    while (1)
    {
      [v6 objectAtIndex:v8];
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_10:
  v9 = (void *)[a3 decodeObjectForKey:@"WebSubframeArchives"];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v9 count];
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v11 = 0;
    while (1)
    {
      [v9 objectAtIndex:v11];
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_17;
      }
    }
  }
  v9 = 0;
LABEL_17:
  return [(WebArchive *)self initWithMainResource:v5 subresources:v6 subframeArchives:v9];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[WebArchive mainResource](self, "mainResource"), @"WebMainResource");
  objc_msgSend(a3, "encodeObject:forKey:", -[WebArchive subresources](self, "subresources"), @"WebSubresources");
  uint64_t v5 = [(WebArchive *)self subframeArchives];
  [a3 encodeObject:v5 forKey:@"WebSubframeArchives"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebArchive;
  [(WebArchive *)&v3 dealloc];
}

- (WebResource)mainResource
{
  objc_super v3 = self->_private;
  if (!v3->cachedMainResource.m_ptr)
  {
    uint64_t v7 = [(WebArchivePrivate *)v3 coreArchive];
    if (v7)
    {
      uint64_t v8 = *(_DWORD **)(v7 + 16);
      if (v8)
      {
        v9 = [WebResource alloc];
        ++v8[2];
        uint64_t v14 = v8;
        uint64_t v10 = [(WebResource *)v9 _initWithCoreResource:&v14];
        uint64_t v11 = self->_private;
        m_ptr = v11->cachedMainResource.m_ptr;
        v11->cachedMainResource.m_ptr = (void *)v10;
        if (m_ptr) {
          CFRelease(m_ptr);
        }
        uint64_t v13 = v14;
        uint64_t v14 = 0;
        if (v13)
        {
          if (v13[2] == 1) {
            (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
          }
          else {
            --v13[2];
          }
        }
      }
    }
  }
  objc_super v4 = self->_private;
  uint64_t v5 = v4->cachedMainResource.m_ptr;
  if (v5) {
    CFRetain(v4->cachedMainResource.m_ptr);
  }
  return (WebResource *)(id)CFMakeCollectable(v5);
}

- (NSArray)subresources
{
  objc_super v3 = self->_private;
  if (!v3->cachedSubresources.m_ptr)
  {
    uint64_t v4 = [(WebArchivePrivate *)v3 coreArchive];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v4 + 36)];
      uint64_t v7 = *(unsigned int *)(v5 + 36);
      if (v7)
      {
        uint64_t v8 = *(void *)(v5 + 24);
        for (uint64_t i = 8 * v7; i; i -= 8)
        {
          uint64_t v10 = [WebResource alloc];
          uint64_t v11 = *(_DWORD **)v8;
          v11[2] = *(_DWORD *)(*(void *)v8 + 8) + 1;
          v21 = v11;
          id v12 = [(WebResource *)v10 _initWithCoreResource:&v21];
          uint64_t v13 = v21;
          v21 = 0;
          if (v13)
          {
            if (v13[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
              if (!v12) {
                goto LABEL_5;
              }
LABEL_10:
              [v6 addObject:v12];
              CFRelease(v12);
              goto LABEL_5;
            }
            --v13[2];
          }
          if (v12) {
            goto LABEL_10;
          }
LABEL_5:
          v8 += 8;
        }
      }
      uint64_t v14 = self->_private;
      m_ptr = v14->cachedSubresources.m_ptr;
      v14->cachedSubresources.m_ptr = v6;
      if (m_ptr) {
        goto LABEL_14;
      }
    }
    else
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      v20 = self->_private;
      m_ptr = v20->cachedSubresources.m_ptr;
      v20->cachedSubresources.m_ptr = v19;
      if (m_ptr) {
LABEL_14:
      }
        CFRelease(m_ptr);
    }
  }
  result = (NSArray *)[self->_private->cachedSubresources.m_ptr count];
  if (result)
  {
    uint64_t v17 = self->_private;
    v18 = v17->cachedSubresources.m_ptr;
    if (v18) {
      CFRetain(v17->cachedSubresources.m_ptr);
    }
    return (NSArray *)(id)CFMakeCollectable(v18);
  }
  return result;
}

- (NSArray)subframeArchives
{
  objc_super v3 = self->_private;
  if (!v3->cachedSubframeArchives.m_ptr)
  {
    uint64_t v4 = [(WebArchivePrivate *)v3 coreArchive];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v4 + 52)];
      uint64_t v7 = *(unsigned int *)(v5 + 52);
      if (v7)
      {
        uint64_t v8 = *(void *)(v5 + 40);
        uint64_t v9 = 8 * v7;
        while (1)
        {
          uint64_t v10 = [WebArchive alloc];
          uint64_t v11 = *(_DWORD **)v8;
          v11[2] = *(_DWORD *)(*(void *)v8 + 8) + 1;
          v21 = v11;
          id v12 = [(WebArchive *)v10 _initWithCoreLegacyWebArchive:&v21];
          uint64_t v13 = v21;
          v21 = 0;
          if (!v13) {
            goto LABEL_9;
          }
          if (v13[2] != 1) {
            break;
          }
          (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
          if (v12) {
            goto LABEL_12;
          }
LABEL_5:
          v8 += 8;
          v9 -= 8;
          if (!v9) {
            goto LABEL_13;
          }
        }
        --v13[2];
LABEL_9:
        if (!v12) {
          goto LABEL_5;
        }
LABEL_12:
        [v6 addObject:v12];
        CFRelease(v12);
        goto LABEL_5;
      }
LABEL_13:
      uint64_t v14 = self->_private;
      m_ptr = v14->cachedSubframeArchives.m_ptr;
      v14->cachedSubframeArchives.m_ptr = v6;
      if (m_ptr) {
        goto LABEL_14;
      }
    }
    else
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      v20 = self->_private;
      m_ptr = v20->cachedSubframeArchives.m_ptr;
      v20->cachedSubframeArchives.m_ptr = v19;
      if (m_ptr) {
LABEL_14:
      }
        CFRelease(m_ptr);
    }
  }
  NSUInteger v16 = self->_private;
  uint64_t v17 = v16->cachedSubframeArchives.m_ptr;
  if (v17) {
    CFRetain(v16->cachedSubframeArchives.m_ptr);
  }
  return (NSArray *)(id)CFMakeCollectable(v17);
}

- (NSData)data
{
  WebCore::LegacyWebArchive::rawDataRepresentation((uint64_t *)&cf, (WebCore::LegacyWebArchive *)[(WebArchivePrivate *)self->_private coreArchive]);
  CFTypeRef v2 = cf;
  if (cf) {
    CFRetain(cf);
  }
  objc_super v3 = (id)CFMakeCollectable(v2);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  return v3;
}

- (id)_initWithCoreLegacyWebArchive:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WebArchive;
  CFTypeRef v4 = [(WebArchive *)&v7 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = [[WebArchivePrivate alloc] initWithCoreArchive:a3];
  v4->_private = v5;
  if (v5) {
    return v4;
  }

  return 0;
}

- (void)_coreLegacyWebArchive
{
  return [(WebArchivePrivate *)self->_private coreArchive];
}

@end