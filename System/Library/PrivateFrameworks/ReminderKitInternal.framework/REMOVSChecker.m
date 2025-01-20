@interface REMOVSChecker
+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4;
+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4;
@end

@implementation REMOVSChecker

+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F72458], v7);
  CFErrorRef err = 0;
  v9 = (const void *)LXLexiconCreate();
  CFRelease(Mutable);
  if (v9)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(__CFString **)(*((void *)&v22 + 1) + 8 * i);
          if (!CFStringGetCStringPtr(v15, 4u)
            && !-[__CFString lengthOfBytesUsingEncoding:](v15, "lengthOfBytesUsingEncoding:", 4, (void)v22))
          {
            goto LABEL_19;
          }
          if (objc_msgSend(a1, "_lexiconTokenForToken:inLexicon:", v15, v9, (void)v22))
          {
            v16 = (const void *)LXLexiconCopyEntryForTokenID();
            int MetaFlags = LXEntryGetMetaFlags();
            if ((MetaFlags & 0x1800000) != 0)
            {
              CFRelease(v16);
LABEL_19:
              char v19 = 1;
              goto LABEL_20;
            }
            int v18 = MetaFlags;
            CFRelease(v16);
            if ((v18 & 0x2000000) != 0) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        char v19 = 0;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v19 = 0;
    }
LABEL_20:
  }
  else
  {
    v9 = CFErrorCopyDescription(err);
    char v19 = 0;
    BOOL v20 = 0;
    if (!v9) {
      goto LABEL_22;
    }
  }
  CFRelease(v9);
  BOOL v20 = v19;
LABEL_22:

  return v20;
}

+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4
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

void __49__REMOVSChecker__lexiconTokenForToken_inLexicon___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  if (CFEqual(v5, *(CFStringRef *)(a1 + 40)))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = LXEntryGetTokenID();
    *a3 = 1;
  }

  CFRelease(v5);
}

@end