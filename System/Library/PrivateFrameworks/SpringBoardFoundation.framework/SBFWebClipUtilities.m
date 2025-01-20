@interface SBFWebClipUtilities
+ (id)sanitizeWebClip:(id)a3;
+ (id)sanitizeWebClips:(id)a3;
+ (id)sanitizeWebClipsIfNeeded;
@end

@implementation SBFWebClipUtilities

+ (id)sanitizeWebClipsIfNeeded
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = _CFCopySystemVersionDictionaryValue();
  v5 = (void *)v4;
  v6 = @"Invalid Build Version";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [v3 objectForKey:@"SBFWebClipUtilitiesLastSanitizedBuildVersionUserDefaultsKey"];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    v10 = SBLogWebClip();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18B52E000, v10, OS_LOG_TYPE_DEFAULT, "Webclips already sanitized for this build; skipping...",
        v14,
        2u);
    }

    v11 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F43048] webClips];
    v11 = [a1 sanitizeWebClips:v12];

    [v3 setObject:v7 forKey:@"SBFWebClipUtilitiesLastSanitizedBuildVersionUserDefaultsKey"];
  }

  return v11;
}

+ (id)sanitizeWebClips:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [a1 sanitizeWebClip:v10];
        v12 = [v11 error];
        uint64_t v13 = [v11 result];
        if (v12) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v13 == 0;
        }
        if (v14)
        {
          if (!v7)
          {
            v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          }
          [v7 setObject:v11 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)sanitizeWebClip:(id)a3
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3 || ([v3 pageURL], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.webClipUtilitiesErrorDomain" code:0 userInfo:0];
    v26 = [SBFWebClipSanitationReport alloc];
    v27 = v4;
    uint64_t v28 = 0;
    v29 = v8;
LABEL_15:
    v25 = [(SBFWebClipSanitationReport *)v26 initWithWebClip:v27 result:v28 error:v29];
    goto LABEL_16;
  }
  uint64_t v6 = SBLogWebClip();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    v60 = v7;
    _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "Sanitizing webclip '%@'", buf, 0xCu);
  }
  uint64_t v8 = [v4 iconImagePath];
  if (![v8 length])
  {
    v26 = [SBFWebClipSanitationReport alloc];
    v27 = v4;
    uint64_t v28 = 1;
    v29 = 0;
    goto LABEL_15;
  }
  id v9 = v8;
  uint64_t v10 = CGDataProviderCreateWithFilename((const char *)[v9 fileSystemRepresentation]);
  v11 = CGImageSourceCreateWithDataProvider(v10, 0);
  double v13 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v65 = *MEMORY[0x1E4F2FF08];
  v66[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v11, 0, v14);

  double v16 = v12;
  double v17 = v13;
  if (v15)
  {
    long long v18 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
    [v18 floatValue];
    double v17 = v19;

    v20 = [(__CFDictionary *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
    [v20 floatValue];
    double v16 = v21;

    CFRelease(v15);
  }
  v22 = SBLogWebClip();
  v23 = v22;
  if (v13 == v17 && v12 == v16)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[SBFWebClipUtilities sanitizeWebClip:](v4);
    }

    v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.webClipUtilitiesErrorDomain" code:1 userInfo:0];
    v25 = [[SBFWebClipSanitationReport alloc] initWithWebClip:v4 result:0 error:v24];

    if (!v11) {
      goto LABEL_50;
    }
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v31 = [v4 identifier];
      v68.width = v17;
      v68.height = v16;
      v32 = NSStringFromCGSize(v68);
      *(_DWORD *)buf = 138412546;
      v60 = v31;
      __int16 v61 = 2112;
      v62 = v32;
      _os_log_impl(&dword_18B52E000, v23, OS_LOG_TYPE_INFO, "Webclip '%@' is of size %@; checking if sanitization is needed...",
        buf,
        0x16u);
    }
    if (v17 > 400.0 || v16 > 400.0)
    {
      v37 = SBLogWebClip();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = [v4 identifier];
        v69.width = v17;
        v69.height = v16;
        v39 = NSStringFromCGSize(v69);
        v70.width = 400.0;
        v70.height = 400.0;
        v40 = NSStringFromCGSize(v70);
        *(_DWORD *)buf = 138412802;
        v60 = v38;
        __int16 v61 = 2112;
        v62 = v39;
        __int16 v63 = 2112;
        v64 = v40;
        _os_log_impl(&dword_18B52E000, v37, OS_LOG_TYPE_INFO, "Webclip '%@' needs to be sanitized; resizing icon from %@ -> %@",
          buf,
          0x20u);
      }
      v41 = (void *)MEMORY[0x18C132FE0]();
      uint64_t v42 = *MEMORY[0x1E4F2FF68];
      v57[0] = *MEMORY[0x1E4F2FE28];
      v57[1] = v42;
      v58[0] = MEMORY[0x1E4F1CC38];
      v43 = [NSNumber numberWithDouble:400.0];
      v58[1] = v43;
      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2]);

      if (ThumbnailAtIndex)
      {
        CFURLRef v45 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
        v46 = CGImageDestinationCreateWithURL(v45, (CFStringRef)[(id)*MEMORY[0x1E4F44460] identifier], 1uLL, 0);

        CGImageDestinationAddImage(v46, ThumbnailAtIndex, 0);
        BOOL v47 = CGImageDestinationFinalize(v46);
        v48 = SBLogWebClip();
        v49 = v48;
        if (v47)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v50 = [v4 identifier];
            *(_DWORD *)buf = 138412290;
            v60 = v50;
            _os_log_impl(&dword_18B52E000, v49, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@'", buf, 0xCu);
          }
          v25 = [[SBFWebClipSanitationReport alloc] initWithWebClip:v4 result:2 error:0];
        }
        else
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            +[SBFWebClipUtilities sanitizeWebClip:](v4);
          }

          v53 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.webClipUtilitiesErrorDomain" code:2 userInfo:0];
          v25 = [[SBFWebClipSanitationReport alloc] initWithWebClip:v4 result:0 error:v53];
        }
        if (v46) {
          CFRelease(v46);
        }
        CFRelease(ThumbnailAtIndex);
        v52 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v55 = *MEMORY[0x1E4F28370];
        uint64_t v56 = *MEMORY[0x1E4F28378];
        v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        [v52 setAttributes:v54 ofItemAtPath:v9 error:0];
      }
      else
      {
        v51 = SBLogWebClip();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          +[SBFWebClipUtilities sanitizeWebClip:](v4);
        }

        v52 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.webClipUtilitiesErrorDomain" code:2 userInfo:0];
        v25 = [[SBFWebClipSanitationReport alloc] initWithWebClip:v4 result:0 error:v52];
      }

      if (!v11) {
        goto LABEL_50;
      }
    }
    else
    {
      if (objc_msgSend(v4, "sb_markIconImageFileProtectionTypeAsNone"))
      {
        v33 = SBLogWebClip();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [v4 identifier];
          *(_DWORD *)buf = 138412290;
          v60 = v34;
          _os_log_impl(&dword_18B52E000, v33, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@' needed File Protection Class repair", buf, 0xCu);
        }
      }
      v35 = SBLogWebClip();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [v4 identifier];
        *(_DWORD *)buf = 138412290;
        v60 = v36;
        _os_log_impl(&dword_18B52E000, v35, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@' didn't need sanitizing", buf, 0xCu);
      }
      v25 = [[SBFWebClipSanitationReport alloc] initWithWebClip:v4 result:1 error:0];
      if (!v11) {
        goto LABEL_50;
      }
    }
  }
  CFRelease(v11);
LABEL_50:
  if (v10) {
    CFRelease(v10);
  }
LABEL_16:

  return v25;
}

+ (void)sanitizeWebClip:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_5(&dword_18B52E000, v2, v3, "Webclip '%@' cannot be resized; Icon is of size 0,0; Bailing.",
    v4,
    v5,
    v6,
    v7,
    2u);
}

+ (void)sanitizeWebClip:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_5(&dword_18B52E000, v2, v3, "Webclip '%@' cannot be resized; Failed to create CGImageSource; Bailing.",
    v4,
    v5,
    v6,
    v7,
    2u);
}

+ (void)sanitizeWebClip:(void *)a1 .cold.3(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_5(&dword_18B52E000, v2, v3, "Webclip '%@' icon cannot be resized.", v4, v5, v6, v7, 2u);
}

@end