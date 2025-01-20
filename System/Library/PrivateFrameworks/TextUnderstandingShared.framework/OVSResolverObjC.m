@interface OVSResolverObjC
+ (BOOL)containsOVSInTokens:(id)a3 forLocaleIdentifier:(id)a4;
+ (unsigned)_lexiconTokenForToken:(id)a3 lexicon:(_LXLexicon *)a4;
@end

@implementation OVSResolverObjC

+ (unsigned)_lexiconTokenForToken:(id)a3 lexicon:(_LXLexicon *)a4
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  LXLexiconEnumerateEntriesForString();
  unsigned int v5 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v5;
}

+ (BOOL)containsOVSInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  if ([v6 count])
  {
    uint64_t v8 = [(__CFString *)v7 length];
    uint64_t v9 = @"en_US";
    if (v8) {
      uint64_t v9 = v7;
    }
    int v10 = v9;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51318], v10);
    CFErrorRef err = 0;
    v12 = (const void *)LXLexiconCreate();
    CFRelease(Mutable);
    if (v12)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v6;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v25 = v10;
        v26 = v7;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(__CFString **)(*((void *)&v27 + 1) + 8 * i);
            v19 = [(__CFString *)v18 localizedLowercaseString];
            if ([v19 lengthOfBytesUsingEncoding:4] || CFStringGetCStringPtr(v18, 4u))
            {
              if ([a1 _lexiconTokenForToken:v19 lexicon:v12])
              {
                v20 = (const void *)LXLexiconCopyEntryForTokenID();
                int v21 = LXEntryGetMetaFlags() & 0x3800000;
                CFRelease(v20);
                if (v21)
                {

                  BOOL v22 = 1;
                  goto LABEL_23;
                }
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        BOOL v22 = 0;
LABEL_23:
        int v10 = v25;
        uint64_t v7 = v26;
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      CFStringRef v23 = CFErrorCopyDescription(err);
      if (!v23)
      {
        BOOL v22 = 0;
        goto LABEL_27;
      }
      v12 = v23;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v12;
        _os_log_error_impl(&dword_25F56F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "OVSResolverObjC: Error finding an appropriate lexicon: %@", buf, 0xCu);
      }
      BOOL v22 = 0;
    }
    CFRelease(v12);
LABEL_27:

    goto LABEL_28;
  }
  BOOL v22 = 0;
LABEL_28:

  return v22;
}

@end