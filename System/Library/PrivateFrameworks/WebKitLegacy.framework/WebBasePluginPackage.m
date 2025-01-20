@interface WebBasePluginPackage
+ (id)pluginWithPath:(id)a3;
- (BOOL)getPluginInfoFromPLists;
- (BOOL)isJavaPlugIn;
- (BOOL)isNativeLibraryData:(id)a3;
- (BOOL)isQuickTimePlugIn;
- (BOOL)load;
- (BOOL)supportsExtension:(const void *)a3;
- (BOOL)supportsMIMEType:(const void *)a3;
- (String)bundleIdentifier;
- (String)bundleVersion;
- (WebBasePluginPackage)initWithPath:(id)a3;
- (const)path;
- (const)pluginInfo;
- (id).cxx_construct;
- (id)MIMETypeForExtension:(const void *)a3;
- (id)_objectForInfoDictionaryKey:(id)a3;
- (id)pListForPath:(id)a3 createFile:(BOOL)a4;
- (unsigned)versionNumber;
- (void)createPropertyListFile;
- (void)dealloc;
- (void)wasAddedToPluginDatabase:(id)a3;
- (void)wasRemovedFromPluginDatabase:(id)a3;
@end

@implementation WebBasePluginPackage

+ (id)pluginWithPath:(id)a3
{
  v3 = (void *)CFMakeCollectable([[WebPluginPackage alloc] initWithPath:a3]);
  return v3;
}

- (WebBasePluginPackage)initWithPath:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)WebBasePluginPackage;
  v4 = [(WebBasePluginPackage *)&v17 init];
  if (!v4) {
    return v4;
  }
  MEMORY[0x1E4E442D0](&v16, [a3 stringByResolvingSymlinksInPath]);
  v6 = v16;
  v16 = 0;
  m_ptr = (WTF::StringImpl *)v4->path.m_impl.m_ptr;
  v4->path.m_impl.m_ptr = (StringImpl *)v6;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::destroy(m_ptr, v5);
      v9 = v16;
      v16 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2) {
          WTF::StringImpl::destroy(v9, v8);
        }
        else {
          *(_DWORD *)v9 -= 2;
        }
      }
    }
    else
    {
      *(_DWORD *)m_ptr -= 2;
    }
    v6 = (WTF::StringImpl *)v4->path.m_impl.m_ptr;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v11 = (void *)MEMORY[0x1E4F1CB10];
  v12 = v6 ? (__CFString *)WTF::StringImpl::operator NSString *() : &stru_1F3C7DA90;
  CFBundleRef v13 = CFBundleCreate(v10, (CFURLRef)[v11 fileURLWithPath:v12]);
  v14 = v4->cfBundle.m_ptr;
  v4->cfBundle.m_ptr = v13;
  if (v14)
  {
    CFRelease(v14);
    CFBundleRef v13 = (CFBundleRef)v4->cfBundle.m_ptr;
  }
  if (v13) {
    return v4;
  }

  return 0;
}

- (void)createPropertyListFile
{
  if ([(WebBasePluginPackage *)self load])
  {
    BP_CreatePluginMIMETypesPreferences = (void (*)(void))self->BP_CreatePluginMIMETypesPreferences;
    if (BP_CreatePluginMIMETypesPreferences)
    {
      BP_CreatePluginMIMETypesPreferences();
      [(WebBasePluginPackage *)self unload];
    }
  }
}

- (id)pListForPath:(id)a3 createFile:(BOOL)a4
{
  if (a4) {
    [(WebBasePluginPackage *)self createPropertyListFile];
  }
  id result = (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  if (result)
  {
    id v6 = result;
    v7 = (void *)MEMORY[0x1E4F28F98];
    return (id)[v7 propertyListWithData:v6 options:0 format:0 error:0];
  }
  return result;
}

- (id)_objectForInfoDictionaryKey:(id)a3
{
  id result = CFBundleGetInfoDictionary((CFBundleRef)self->cfBundle.m_ptr);
  if (result)
  {
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
  }
  return result;
}

- (BOOL)getPluginInfoFromPLists
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (!self->cfBundle.m_ptr)
  {
    LOBYTE(v3) = 0;
    return (char)v3;
  }
  v2 = self;
  id v3 = [(WebBasePluginPackage *)self _objectForInfoDictionaryKey:@"WebPluginMIMETypes"];
  if (v3)
  {
    v4 = v3;
    v5 = (void *)[v3 keyEnumerator];
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      uint64_t v7 = v6;
      p_mimes = &v2->pluginInfo.mimes;
      v79 = v2;
      v76 = v5;
      v77 = v4;
      while (1)
      {
        v8 = (void *)[v4 objectForKey:v7];
        v9 = (void *)[v8 objectForKey:@"WebPluginTypeEnabled"];
        if (v9 && ![v9 BOOLValue]) {
          goto LABEL_94;
        }
        *(_OWORD *)v95 = 0u;
        *(_OWORD *)v96 = 0u;
        CFAllocatorRef v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"WebPluginExtensions"), "_web_lowercaseStrings");
        v80 = v8;
        uint64_t v81 = v7;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v91 objects:v100 count:16];
        if (v11)
        {
          id obj = v10;
          uint64_t v83 = *(void *)v92;
          do
          {
            uint64_t v12 = 0;
            uint64_t v84 = v11;
            do
            {
              if (*(void *)v92 != v83) {
                objc_enumerationMutation(obj);
              }
              CFBundleRef v13 = *(void **)(*((void *)&v91 + 1) + 8 * v12);
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              v14 = (void *)[v13 componentsSeparatedByString:@","];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v99 count:16];
              if (v15)
              {
                uint64_t v16 = *(void *)v88;
                do
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (*(void *)v88 != v16) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v87 + 1) + 8 * i);
                    uint64_t v19 = HIDWORD(v96[1]);
                    if (HIDWORD(v96[1]) == LODWORD(v96[1]))
                    {
                      unint64_t v20 = HIDWORD(v96[1]) + ((unint64_t)HIDWORD(v96[1]) >> 2);
                      if (v20 >= 0x10) {
                        unint64_t v21 = v20 + 1;
                      }
                      else {
                        unint64_t v21 = 16;
                      }
                      if (v21 <= (unint64_t)HIDWORD(v96[1]) + 1) {
                        unint64_t v22 = HIDWORD(v96[1]) + 1;
                      }
                      else {
                        unint64_t v22 = v21;
                      }
                      if (v22 >> 29) {
                        goto LABEL_125;
                      }
                      v23 = v96[0];
                      v24 = (WTF *)WTF::fastMalloc((WTF *)(8 * v22));
                      LODWORD(v96[1]) = v22;
                      v96[0] = v24;
                      memcpy(v24, v23, 8 * v19);
                      if (v23)
                      {
                        if (v96[0] == v23)
                        {
                          v96[0] = 0;
                          LODWORD(v96[1]) = 0;
                        }
                        WTF::fastFree(v23, v25);
                      }
                      v26 = (char *)v96[0] + 8 * HIDWORD(v96[1]);
                    }
                    else
                    {
                      v26 = (char *)v96[0] + 8 * HIDWORD(v96[1]);
                    }
                    MEMORY[0x1E4E442D0](v26, v18);
                    ++HIDWORD(v96[1]);
                  }
                  uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v99 count:16];
                }
                while (v15);
              }
              ++v12;
            }
            while (v12 != v84);
            uint64_t v11 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
          }
          while (v11);
        }
        MEMORY[0x1E4E442D0](&v85, v81);
        WTF::String::convertToASCIILowercase((uint64_t *)&v86, (WTF::String *)&v85);
        v28 = v86;
        v86 = 0;
        v2 = v79;
        if (v28)
        {
          v97 = v28;
          if ((*((unsigned char *)v28 + 16) & 0x10) == 0)
          {
            WTF::AtomStringImpl::addSlowCase();
            v29 = v97;
            v28 = v98;
            v97 = 0;
            v98 = 0;
            if (v29)
            {
              if (*(_DWORD *)v29 == 2) {
                WTF::StringImpl::destroy(v29, v27);
              }
              else {
                *(_DWORD *)v29 -= 2;
              }
            }
          }
        }
        v30 = v95[0];
        v95[0] = v28;
        if (!v30) {
          goto LABEL_45;
        }
        if (*(_DWORD *)v30 != 2) {
          break;
        }
        WTF::StringImpl::destroy(v30, v27);
        v31 = v86;
        v86 = 0;
        if (!v31) {
          goto LABEL_50;
        }
LABEL_48:
        if (*(_DWORD *)v31 != 2)
        {
          *(_DWORD *)v31 -= 2;
LABEL_50:
          v32 = v85;
          v85 = 0;
          if (v32) {
            goto LABEL_53;
          }
          goto LABEL_56;
        }
        WTF::StringImpl::destroy(v31, v27);
        v32 = v85;
        v85 = 0;
        if (v32)
        {
LABEL_53:
          if (*(_DWORD *)v32 == 2) {
            WTF::StringImpl::destroy(v32, v27);
          }
          else {
            *(_DWORD *)v32 -= 2;
          }
        }
LABEL_56:
        MEMORY[0x1E4E442D0](&v98, [v80 objectForKey:@"WebPluginTypeDescription"]);
        v34 = v98;
        v98 = 0;
        v35 = v95[1];
        v95[1] = v34;
        if (!v35) {
          goto LABEL_61;
        }
        int v36 = *(_DWORD *)v35 - 2;
        if (*(_DWORD *)v35 != 2) {
          goto LABEL_60;
        }
        WTF::StringImpl::destroy(v35, v33);
        v35 = v98;
        v98 = 0;
        if (!v35) {
          goto LABEL_61;
        }
        int v36 = *(_DWORD *)v35 - 2;
        if (*(_DWORD *)v35 != 2)
        {
LABEL_60:
          *(_DWORD *)v35 = v36;
LABEL_61:
          uint64_t m_size = v79->pluginInfo.mimes.m_size;
          if (m_size == v79->pluginInfo.mimes.m_capacity) {
            goto LABEL_62;
          }
          goto LABEL_64;
        }
        WTF::StringImpl::destroy(v35, v33);
        uint64_t m_size = v79->pluginInfo.mimes.m_size;
        if (m_size == v79->pluginInfo.mimes.m_capacity)
        {
LABEL_62:
          v38 = WTF::Vector<WebCore::MimeClassInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_mimes, m_size + 1, (unint64_t)v95);
          uint64_t v39 = (uint64_t)v79->pluginInfo.mimes.m_buffer + 32 * v79->pluginInfo.mimes.m_size;
          goto LABEL_65;
        }
LABEL_64:
        uint64_t v39 = (uint64_t)p_mimes->m_buffer + 32 * m_size;
        v38 = v95;
LABEL_65:
        v40 = (_DWORD *)*v38;
        if (*v38) {
          *v40 += 2;
        }
        *(void *)uint64_t v39 = v40;
        v41 = (_DWORD *)v38[1];
        if (v41) {
          *v41 += 2;
        }
        *(void *)(v39 + 8) = v41;
        uint64_t v42 = *((unsigned int *)v38 + 7);
        *(void *)(v39 + 16) = 0;
        *(void *)(v39 + 24) = 0;
        *(_DWORD *)(v39 + 28) = v42;
        if (v42)
        {
          if (v42 >> 29)
          {
LABEL_125:
            __break(0xC471u);
            JUMPOUT(0x1E13CBC18);
          }
          v43 = (void *)WTF::fastMalloc((WTF *)(8 * v42));
          *(_DWORD *)(v39 + 24) = v42;
          *(void *)(v39 + 16) = v43;
          uint64_t v44 = *((unsigned int *)v38 + 7);
          if (v44)
          {
            v45 = (_DWORD **)v38[2];
            uint64_t v46 = 8 * v44;
            do
            {
              v47 = *v45;
              if (*v45) {
                *v47 += 2;
              }
              *v43++ = v47;
              ++v45;
              v46 -= 8;
            }
            while (v46);
          }
        }
        ++v79->pluginInfo.mimes.m_size;
        if (HIDWORD(v96[1]))
        {
          v48 = (WTF::StringImpl **)v96[0];
          uint64_t v49 = 8 * HIDWORD(v96[1]);
          do
          {
            v50 = *v48;
            *v48 = 0;
            if (v50)
            {
              if (*(_DWORD *)v50 == 2) {
                WTF::StringImpl::destroy(v50, v33);
              }
              else {
                *(_DWORD *)v50 -= 2;
              }
            }
            ++v48;
            v49 -= 8;
          }
          while (v49);
        }
        v51 = v96[0];
        if (v96[0])
        {
          v96[0] = 0;
          LODWORD(v96[1]) = 0;
          WTF::fastFree(v51, v33);
        }
        v52 = v95[1];
        v95[1] = 0;
        v5 = v76;
        v4 = v77;
        if (!v52) {
          goto LABEL_88;
        }
        if (*(_DWORD *)v52 != 2)
        {
          *(_DWORD *)v52 -= 2;
LABEL_88:
          v53 = v95[0];
          v95[0] = 0;
          if (v53) {
            goto LABEL_91;
          }
          goto LABEL_94;
        }
        WTF::StringImpl::destroy(v52, v33);
        v53 = v95[0];
        v95[0] = 0;
        if (v53)
        {
LABEL_91:
          if (*(_DWORD *)v53 == 2) {
            WTF::StringImpl::destroy(v53, v33);
          }
          else {
            *(_DWORD *)v53 -= 2;
          }
        }
LABEL_94:
        uint64_t v7 = [v5 nextObject];
        if (!v7) {
          goto LABEL_95;
        }
      }
      *(_DWORD *)v30 -= 2;
LABEL_45:
      v31 = v86;
      v86 = 0;
      if (!v31) {
        goto LABEL_50;
      }
      goto LABEL_48;
    }
LABEL_95:
    if (v2->path.m_impl.m_ptr) {
      v54 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v54 = &stru_1F3C7DA90;
    }
    uint64_t v55 = [(__CFString *)v54 lastPathComponent];
    MEMORY[0x1E4E442D0](v95, v55);
    v57 = v95[0];
    v95[0] = 0;
    m_ptr = (WTF::StringImpl *)v2->pluginInfo.file.m_impl.m_ptr;
    v2->pluginInfo.file.m_impl.m_ptr = (StringImpl *)v57;
    if (m_ptr)
    {
      int v59 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr != 2) {
        goto LABEL_104;
      }
      WTF::StringImpl::destroy(m_ptr, v56);
      m_ptr = v95[0];
      v95[0] = 0;
      if (!m_ptr) {
        goto LABEL_105;
      }
      int v59 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2) {
        WTF::StringImpl::destroy(m_ptr, v60);
      }
      else {
LABEL_104:
      }
        *(_DWORD *)m_ptr = v59;
    }
LABEL_105:
    uint64_t v61 = [(WebBasePluginPackage *)v2 _objectForInfoDictionaryKey:@"WebPluginName"];
    if (v61) {
      uint64_t v62 = v61;
    }
    else {
      uint64_t v62 = v55;
    }
    MEMORY[0x1E4E442D0](v95, v62);
    v64 = v95[0];
    v95[0] = 0;
    v65 = (WTF::StringImpl *)v2->pluginInfo.name.m_impl.m_ptr;
    v2->pluginInfo.name.m_impl.m_ptr = (StringImpl *)v64;
    if (v65)
    {
      int v66 = *(_DWORD *)v65 - 2;
      if (*(_DWORD *)v65 != 2) {
        goto LABEL_112;
      }
      WTF::StringImpl::destroy(v65, v63);
      v65 = v95[0];
      v95[0] = 0;
      if (!v65) {
        goto LABEL_113;
      }
      int v66 = *(_DWORD *)v65 - 2;
      if (*(_DWORD *)v65 == 2) {
        WTF::StringImpl::destroy(v65, v67);
      }
      else {
LABEL_112:
      }
        *(_DWORD *)v65 = v66;
    }
LABEL_113:
    uint64_t v68 = [(WebBasePluginPackage *)v2 _objectForInfoDictionaryKey:@"WebPluginDescription"];
    if (v68) {
      uint64_t v69 = v68;
    }
    else {
      uint64_t v69 = v55;
    }
    MEMORY[0x1E4E442D0](v95, v69);
    v71 = v95[0];
    v95[0] = 0;
    v72 = (WTF::StringImpl *)v2->pluginInfo.desc.m_impl.m_ptr;
    v2->pluginInfo.desc.m_impl.m_ptr = (StringImpl *)v71;
    if (!v72) {
      goto LABEL_121;
    }
    int v73 = *(_DWORD *)v72 - 2;
    if (*(_DWORD *)v72 == 2)
    {
      WTF::StringImpl::destroy(v72, v70);
      v72 = v95[0];
      v95[0] = 0;
      if (!v72)
      {
LABEL_121:
        *(_WORD *)&v2->pluginInfo.isApplicationPlugin = 0;
        LOBYTE(v3) = 1;
        return (char)v3;
      }
      int v73 = *(_DWORD *)v72 - 2;
      if (*(_DWORD *)v72 == 2)
      {
        WTF::StringImpl::destroy(v72, v74);
        goto LABEL_121;
      }
    }
    *(_DWORD *)v72 = v73;
    goto LABEL_121;
  }
  return (char)v3;
}

- (BOOL)load
{
  m_ptr = (__CFBundle *)self->cfBundle.m_ptr;
  if (!m_ptr || self->BP_CreatePluginMIMETypesPreferences) {
    return 1;
  }
  self->BP_CreatePluginMIMETypesPreferences = CFBundleGetFunctionPointerForName(m_ptr, @"BP_CreatePluginMIMETypesPreferences");
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebBasePluginPackage;
  [(WebBasePluginPackage *)&v3 dealloc];
}

- (const)path
{
  return &self->path;
}

- (const)pluginInfo
{
  return &self->pluginInfo;
}

- (BOOL)supportsExtension:(const void *)a3
{
  uint64_t m_size = self->pluginInfo.mimes.m_size;
  if (!m_size) {
    return 0;
  }
  m_buffer = self->pluginInfo.mimes.m_buffer;
  uint64_t v6 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
  while (!*((_DWORD *)m_buffer + 7))
  {
LABEL_3:
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    if (m_buffer == v6) {
      return 0;
    }
  }
  uint64_t v7 = 0;
  while ((WTF::equal(*(WTF **)(*((void *)m_buffer + 2) + 8 * v7), *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    if (++v7 >= (unint64_t)*((unsigned int *)m_buffer + 7)) {
      goto LABEL_3;
    }
  }
  return 1;
}

- (BOOL)supportsMIMEType:(const void *)a3
{
  uint64_t m_size = self->pluginInfo.mimes.m_size;
  if (!m_size) {
    return 0;
  }
  m_buffer = self->pluginInfo.mimes.m_buffer;
  uint64_t v6 = 32 * m_size - 32;
  do
  {
    uint64_t v7 = *(WTF **)m_buffer;
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    BOOL result = WTF::equal(v7, *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3);
    if (result) {
      break;
    }
    uint64_t v9 = v6;
    v6 -= 32;
  }
  while (v9);
  return result;
}

- (id)MIMETypeForExtension:(const void *)a3
{
  uint64_t m_size = self->pluginInfo.mimes.m_size;
  if (!m_size) {
    return 0;
  }
  m_buffer = self->pluginInfo.mimes.m_buffer;
  uint64_t v6 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
  while (!*((_DWORD *)m_buffer + 7))
  {
LABEL_3:
    m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
    if (m_buffer == v6) {
      return 0;
    }
  }
  uint64_t v7 = 0;
  while ((WTF::equal(*(WTF **)(*((void *)m_buffer + 2) + 8 * v7), *(const WTF::StringImpl **)a3, (const WTF::StringImpl *)a3) & 1) == 0)
  {
    if (++v7 >= (unint64_t)*((unsigned int *)m_buffer + 7)) {
      goto LABEL_3;
    }
  }
  if (!*(void *)m_buffer) {
    return &stru_1F3C7DA90;
  }
  return (id)WTF::StringImpl::operator NSString *();
}

- (BOOL)isQuickTimePlugIn
{
  if (self)
  {
    [(WebBasePluginPackage *)self bundleIdentifier];
    self = v5;
  }
  else
  {
    v5 = 0;
  }
  char v3 = MEMORY[0x1E4E44240](self, "com.apple.quicktime.webplugin", 29);
  if (!v5) {
    return v3;
  }
  if (LODWORD(v5->super.isa) != 2)
  {
    LODWORD(v5->super.isa) -= 2;
    return v3;
  }
  WTF::StringImpl::destroy((WTF::StringImpl *)v5, v2);
  return v3;
}

- (BOOL)isJavaPlugIn
{
  if (self)
  {
    [(WebBasePluginPackage *)self bundleIdentifier];
    self = v5;
  }
  else
  {
    v5 = 0;
  }
  if (MEMORY[0x1E4E44240](self, "com.apple.JavaPluginCocoa", 25)) {
    char v3 = 1;
  }
  else {
    char v3 = MEMORY[0x1E4E44240](v5, "com.apple.JavaAppletPlugin", 26);
  }
  if (!v5) {
    return v3;
  }
  if (LODWORD(v5->super.isa) != 2)
  {
    LODWORD(v5->super.isa) -= 2;
    return v3;
  }
  WTF::StringImpl::destroy((WTF::StringImpl *)v5, v2);
  return v3;
}

- (BOOL)isNativeLibraryData:(id)a3
{
  uint64_t v4 = [a3 length];
  size_t v5 = v4;
  unint64_t v6 = v4 + 3;
  unint64_t v7 = (unint64_t)(v4 + 3) >> 2;
  v43 = (WTF *)v46;
  int v44 = 128;
  unsigned int v45 = v7;
  v8 = (WTF *)v46;
  if ((unint64_t)(v4 + 3) >= 0x204)
  {
    if (HIDWORD(v6))
    {
      __break(0xC471u);
      return v4;
    }
    v8 = (WTF *)WTF::fastMalloc((WTF *)(v6 & 0xFFFFFFFFFFFFFFFCLL));
    int v44 = v7;
    v43 = v8;
  }
  memcpy(v8, (const void *)[a3 bytes], v5);
  BOOL v10 = 0;
  v41[0] = 0;
  v41[1] = 0;
  int v42 = 0;
  if (v5 < 0x20)
  {
LABEL_46:
    v37 = v43;
    if (v46 == (unsigned char *)v43 || v43 == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  BOOL v10 = 0;
  uint64_t v11 = v43;
  int v12 = *(_DWORD *)v43;
  if (*(int *)v43 > -805638659)
  {
    if (v12 != -805638658)
    {
      if (v12 != -17958194 && v12 != -17958193) {
        goto LABEL_46;
      }
      goto LABEL_43;
    }
    uint64_t v17 = v45;
    if (v45)
    {
      if (v45 >= 8)
      {
        uint64_t v18 = v45 & 0xFFFFFFF8;
        v26 = (int8x16_t *)((char *)v43 + 16);
        uint64_t v27 = v18;
        do
        {
          int8x16_t v28 = vrev32q_s8(*v26);
          v26[-1] = vrev32q_s8(v26[-1]);
          int8x16_t *v26 = v28;
          v26 += 2;
          v27 -= 8;
        }
        while (v27);
        if (v18 == v17) {
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v29 = v17 - v18;
      v30 = (unsigned int *)((char *)v11 + 4 * v18);
      do
      {
        unsigned int *v30 = bswap32(*v30);
        ++v30;
        --v29;
      }
      while (v29);
    }
    goto LABEL_43;
  }
  if (v12 == -1095041334)
  {
    uint64_t v15 = v45;
    if (!v45) {
      goto LABEL_27;
    }
    if (v45 >= 8)
    {
      uint64_t v16 = v45 & 0xFFFFFFF8;
      uint64_t v19 = (int8x16_t *)((char *)v43 + 16);
      uint64_t v20 = v16;
      do
      {
        int8x16_t v21 = vrev32q_s8(*v19);
        v19[-1] = vrev32q_s8(v19[-1]);
        *uint64_t v19 = v21;
        v19 += 2;
        v20 -= 8;
      }
      while (v20);
      if (v16 == v15) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v22 = v15 - v16;
    v23 = (unsigned int *)((char *)v11 + 4 * v16);
    do
    {
      unsigned int *v23 = bswap32(*v23);
      ++v23;
      --v22;
    }
    while (v22);
    goto LABEL_27;
  }
  if (v12 != -889275714)
  {
    if (v12 != -822415874) {
      goto LABEL_46;
    }
    uint64_t v13 = v45;
    if (!v45) {
      goto LABEL_43;
    }
    if (v45 >= 8)
    {
      uint64_t v14 = v45 & 0xFFFFFFF8;
      v31 = (int8x16_t *)((char *)v43 + 16);
      uint64_t v32 = v14;
      do
      {
        int8x16_t v33 = vrev32q_s8(*v31);
        v31[-1] = vrev32q_s8(v31[-1]);
        int8x16_t *v31 = v33;
        v31 += 2;
        v32 -= 8;
      }
      while (v32);
      if (v14 == v13) {
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v34 = v13 - v14;
    v35 = (unsigned int *)((char *)v11 + 4 * v14);
    do
    {
      unsigned int *v35 = bswap32(*v35);
      ++v35;
      --v34;
    }
    while (v34);
LABEL_43:
    v41[0] = *(void *)((char *)v11 + 4);
    uint32_t v24 = 1;
    v25 = (fat_arch *)v41;
    goto LABEL_44;
  }
LABEL_27:
  if (*((_DWORD *)v11 + 1) >= ((v5 - 8) / 0x14)) {
    uint32_t v24 = (v5 - 8) / 0x14;
  }
  else {
    uint32_t v24 = *((_DWORD *)v11 + 1);
  }
  if (!v24) {
    goto LABEL_52;
  }
  v25 = (fat_arch *)((char *)v11 + 8);
LABEL_44:
  int v36 = NXGetLocalArchInfo();
  if (v36)
  {
    BOOL v10 = NXFindBestFatArch(v36->cputype, v36->cpusubtype, v25, v24) != 0;
    goto LABEL_46;
  }
LABEL_52:
  BOOL v10 = 0;
  v37 = v43;
  if (v46 == (unsigned char *)v43 || v43 == 0) {
    goto LABEL_51;
  }
LABEL_50:
  v43 = 0;
  int v44 = 0;
  WTF::fastFree(v37, v9);
LABEL_51:
  LOBYTE(v4) = v10;
  return v4;
}

- (unsigned)versionNumber
{
  return CFBundleGetVersionNumber((CFBundleRef)self->cfBundle.m_ptr);
}

- (void)wasAddedToPluginDatabase:(id)a3
{
  pluginDatabases = self->pluginDatabases;
  if (pluginDatabases)
  {
  }
  else
  {
    pluginDatabases = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    self->pluginDatabases = pluginDatabases;
  }
  -[NSMutableSet addObject:](pluginDatabases, "addObject:");
}

- (void)wasRemovedFromPluginDatabase:(id)a3
{
}

- (String)bundleIdentifier
{
  CFBundleGetIdentifier((CFBundleRef)self->cfBundle.m_ptr);
  JUMPOUT(0x1E4E442D0);
}

- (String)bundleVersion
{
  char v3 = v2;
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary((CFBundleRef)self->cfBundle.m_ptr);
  if (InfoDictionary)
  {
    Value = CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E4F1D020]);
    if (Value)
    {
      CFGetTypeID(Value);
      CFStringGetTypeID();
    }
    else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
    {
      __break(0xC471u);
    }
    JUMPOUT(0x1E4E442D0);
  }
  void *v3 = 0;
  return (String)InfoDictionary;
}

- (void).cxx_destruct
{
  m_ptr = self->cfBundle.m_ptr;
  self->cfBundle.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->pluginInfo.bundleIdentifier.m_impl.m_ptr;
  self->pluginInfo.bundleIdentifier.m_impl.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)v4, (StringImpl *)a2);
      uint64_t m_size = self->pluginInfo.mimes.m_size;
      if (!m_size) {
        goto LABEL_29;
      }
      goto LABEL_9;
    }
    *(_DWORD *)v4 -= 2;
  }
  uint64_t m_size = self->pluginInfo.mimes.m_size;
  if (m_size)
  {
LABEL_9:
    m_buffer = self->pluginInfo.mimes.m_buffer;
    unint64_t v7 = (MimeClassInfo *)((char *)m_buffer + 32 * m_size);
    while (1)
    {
      uint64_t v8 = *((unsigned int *)m_buffer + 7);
      if (v8)
      {
        uint64_t v9 = (WTF::StringImpl **)*((void *)m_buffer + 2);
        uint64_t v10 = 8 * v8;
        do
        {
          uint64_t v11 = *v9;
          void *v9 = 0;
          if (v11)
          {
            if (*(_DWORD *)v11 == 2) {
              WTF::StringImpl::destroy(v11, (StringImpl *)a2);
            }
            else {
              *(_DWORD *)v11 -= 2;
            }
          }
          ++v9;
          v10 -= 8;
        }
        while (v10);
      }
      int v12 = (WTF *)*((void *)m_buffer + 2);
      if (v12)
      {
        *((void *)m_buffer + 2) = 0;
        *((_DWORD *)m_buffer + 6) = 0;
        WTF::fastFree(v12, (void *)a2);
      }
      uint64_t v13 = (WTF::StringImpl *)*((void *)m_buffer + 1);
      *((void *)m_buffer + 1) = 0;
      if (!v13) {
        goto LABEL_24;
      }
      if (*(_DWORD *)v13 != 2) {
        break;
      }
      WTF::StringImpl::destroy(v13, (StringImpl *)a2);
      uint64_t v14 = *(WTF::StringImpl **)m_buffer;
      *(void *)m_buffer = 0;
      if (v14)
      {
LABEL_27:
        if (*(_DWORD *)v14 == 2) {
          WTF::StringImpl::destroy(v14, (StringImpl *)a2);
        }
        else {
          *(_DWORD *)v14 -= 2;
        }
      }
LABEL_11:
      m_buffer = (MimeClassInfo *)((char *)m_buffer + 32);
      if (m_buffer == v7) {
        goto LABEL_29;
      }
    }
    *(_DWORD *)v13 -= 2;
LABEL_24:
    uint64_t v14 = *(WTF::StringImpl **)m_buffer;
    *(void *)m_buffer = 0;
    if (v14) {
      goto LABEL_27;
    }
    goto LABEL_11;
  }
LABEL_29:
  uint64_t v15 = self->pluginInfo.mimes.m_buffer;
  if (v15)
  {
    self->pluginInfo.mimes.m_buffer = 0;
    self->pluginInfo.mimes.m_capacity = 0;
    WTF::fastFree((WTF *)v15, (void *)a2);
  }
  uint64_t v16 = self->pluginInfo.desc.m_impl.m_ptr;
  self->pluginInfo.desc.m_impl.m_ptr = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)v16, (StringImpl *)a2);
      uint64_t v17 = (WTF::StringImpl *)self->pluginInfo.file.m_impl.m_ptr;
      self->pluginInfo.file.m_impl.m_ptr = 0;
      if (!v17) {
        goto LABEL_39;
      }
      goto LABEL_37;
    }
    *(_DWORD *)v16 -= 2;
  }
  uint64_t v17 = (WTF::StringImpl *)self->pluginInfo.file.m_impl.m_ptr;
  self->pluginInfo.file.m_impl.m_ptr = 0;
  if (!v17)
  {
LABEL_39:
    uint64_t v18 = self->pluginInfo.name.m_impl.m_ptr;
    self->pluginInfo.name.m_impl.m_ptr = 0;
    if (!v18) {
      goto LABEL_44;
    }
    goto LABEL_42;
  }
LABEL_37:
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
    goto LABEL_39;
  }
  WTF::StringImpl::destroy(v17, (StringImpl *)a2);
  uint64_t v18 = self->pluginInfo.name.m_impl.m_ptr;
  self->pluginInfo.name.m_impl.m_ptr = 0;
  if (!v18) {
    goto LABEL_44;
  }
LABEL_42:
  if (*(_DWORD *)v18 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v18, (StringImpl *)a2);
    uint64_t v19 = self->path.m_impl.m_ptr;
    self->path.m_impl.m_ptr = 0;
    if (!v19) {
      return;
    }
    goto LABEL_47;
  }
  *(_DWORD *)v18 -= 2;
LABEL_44:
  uint64_t v19 = self->path.m_impl.m_ptr;
  self->path.m_impl.m_ptr = 0;
  if (!v19) {
    return;
  }
LABEL_47:
  if (*(_DWORD *)v19 == 2)
  {
    WTF::StringImpl::destroy((WTF::StringImpl *)v19, (StringImpl *)a2);
  }
  else
  {
    *(_DWORD *)v19 -= 2;
  }
}

- (id).cxx_construct
{
  *((_WORD *)self + 32) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end