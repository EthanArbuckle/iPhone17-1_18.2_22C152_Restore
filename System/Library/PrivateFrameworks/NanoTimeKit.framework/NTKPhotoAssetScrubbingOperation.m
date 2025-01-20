@interface NTKPhotoAssetScrubbingOperation
- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5;
- (id)supportedExtensions;
@end

@implementation NTKPhotoAssetScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1F16E9C10;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  CFURLRef v8 = (const __CFURL *)a4;
  v9 = CGImageSourceCreateWithURL(v7, 0);
  if (v9)
  {
    v10 = v9;
    CFDictionaryRef v11 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
    v12 = [(__CFDictionary *)v11 objectForKey:*MEMORY[0x1E4F2FA18]];

    if (!v12)
    {
      v23 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v7;
        _os_log_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Location data not found in asset: '%@'. Passing through.", buf, 0xCu);
      }

      v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v21 = [v24 copyItemAtURL:v7 toURL:v8 error:a5];

      CFRelease(v10);
      goto LABEL_27;
    }
    CFStringRef Type = CGImageSourceGetType(v10);
    if (Type)
    {
      CGImageDestinationRef v14 = CGImageDestinationCreateWithURL(v8, Type, 1uLL, 0);
      if (v14)
      {
        v15 = v14;
        CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
        if (Mutable)
        {
          CGMutableImageMetadataRef v17 = Mutable;
          v18 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v7;
            _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Found location data in asset: '%@'. Will scrub.", buf, 0xCu);
          }

          uint64_t v19 = *MEMORY[0x1E4F2F440];
          v28[0] = *MEMORY[0x1E4F2F448];
          v28[1] = v19;
          v29[0] = v17;
          v29[1] = MEMORY[0x1E4F1CC38];
          v28[2] = *MEMORY[0x1E4F2F4A0];
          v29[2] = MEMORY[0x1E4F1CC38];
          CFDictionaryRef v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
          *(void *)buf = 0;
          char v21 = CGImageDestinationCopyImageSource(v15, v10, v20, (CFErrorRef *)buf);
          CFRelease(v17);
          CFRelease(v15);
          CFRelease(v10);
          v22 = *(void **)buf;
          if (*(void *)buf)
          {
            if (a5) {
              *a5 = *(id *)buf;
            }
          }
          goto LABEL_27;
        }
        CFRelease(v15);
        CFRelease(v10);
        if (a5)
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = 1004;
          goto LABEL_25;
        }
LABEL_26:
        char v21 = 0;
        goto LABEL_27;
      }
      CFRelease(v10);
      if (!a5) {
        goto LABEL_26;
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = 1003;
    }
    else
    {
      CFRelease(v10);
      if (!a5) {
        goto LABEL_26;
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = 1002;
    }
LABEL_25:
    [v25 errorWithDomain:@"com.apple.nanotimekit.photos" code:v26 userInfo:0];
    char v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.photos" code:1002 userInfo:0];
    char v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v21 = 0;
  }
LABEL_28:

  return v21;
}

@end