@interface WebMIMETypeRegistry
+ (BOOL)isSupportedImageMIMEType:(id)a3;
+ (BOOL)isSupportedMediaMIMEType:(id)a3;
+ (id)mimeTypeForExtension:(id)a3;
+ (id)preferredExtensionForMIMEType:(id)a3;
@end

@implementation WebMIMETypeRegistry

+ (id)mimeTypeForExtension:(id)a3
{
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::MIMETypeRegistry::mimeTypeForExtension();
  if (v9)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v3);
        v6 = v8;
        v8 = 0;
        if (!v6) {
          return v4;
        }
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        v6 = v8;
        v8 = 0;
        if (!v6) {
          return v4;
        }
      }
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    v4 = &stru_1F3C7DA90;
  }
  v6 = v8;
  v8 = 0;
  if (!v6) {
    return v4;
  }
LABEL_8:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

+ (id)preferredExtensionForMIMEType:(id)a3
{
  MEMORY[0x1E4E442D0](&v9, a3);
  WebCore::MIMETypeRegistry::preferredExtensionForMIMEType((uint64_t *)&v10, (WebCore::MIMETypeRegistry *)&v9, v3);
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

+ (BOOL)isSupportedImageMIMEType:(id)a3
{
  MEMORY[0x1E4E442D0](&v8, a3);
  char isSupportedImageMIMEType = WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (!v6) {
    return isSupportedImageMIMEType;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return isSupportedImageMIMEType;
  }
  WTF::StringImpl::destroy(v6, v4);
  return isSupportedImageMIMEType;
}

+ (BOOL)isSupportedMediaMIMEType:(id)a3
{
  MEMORY[0x1E4E442D0](&v8, a3);
  char isSupportedMediaMIMEType = WebCore::MIMETypeRegistry::isSupportedMediaMIMEType((WebCore::MIMETypeRegistry *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (!v6) {
    return isSupportedMediaMIMEType;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return isSupportedMediaMIMEType;
  }
  WTF::StringImpl::destroy(v6, v4);
  return isSupportedMediaMIMEType;
}

@end