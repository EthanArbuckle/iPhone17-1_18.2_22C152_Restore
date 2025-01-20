@interface NSAttributedString(VSSpeechAdditions)
+ (id)attributedStringWithFormatAndAttributes:()VSSpeechAdditions;
@end

@implementation NSAttributedString(VSSpeechAdditions)

+ (id)attributedStringWithFormatAndAttributes:()VSSpeechAdditions
{
  v9 = a3;
  uint64_t v89 = *MEMORY[0x263EF8340];
  v87 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v73 = 0u;
  uint64_t v10 = [(__CFString *)a3 length];
  id v11 = objc_alloc_init(MEMORY[0x263F089B8]);
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v87 = (id *)&a9;
  CFStringRef theString = v9;
  uint64_t v83 = 0;
  int64_t v84 = v10;
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  v81 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  int64_t v85 = 0;
  int64_t v86 = 0;
  v82 = CStringPtr;
  uint64_t v15 = v10 - 1;
  if (v10 >= 1)
  {
    int64_t v16 = 0;
    uint64_t v63 = 0;
    int64_t v17 = 0;
    uint64_t v66 = v10 - 1;
    while (1)
    {
      int64_t v18 = v16 + 1;
      if (v16 < 0) {
        goto LABEL_53;
      }
      int64_t v19 = v84;
      if (v84 <= v16) {
        goto LABEL_53;
      }
      if (v81)
      {
        UniChar v20 = v81[v83 + v16];
      }
      else if (v82)
      {
        UniChar v20 = v82[v83 + v16];
      }
      else
      {
        if (v86 <= v16 || (int64_t v21 = v85, v85 > v16))
        {
          int64_t v22 = v16 - 4;
          if ((unint64_t)v16 < 4) {
            int64_t v22 = 0;
          }
          if (v22 + 64 < v84) {
            int64_t v19 = v22 + 64;
          }
          int64_t v85 = v22;
          int64_t v86 = v19;
          v90.location = v83 + v22;
          v90.length = v19 - v22;
          CFStringGetCharacters(theString, v90, buffer);
          uint64_t v15 = v66;
          int64_t v21 = v85;
        }
        UniChar v20 = buffer[v16 - v21];
      }
      if (v20 != 37) {
        goto LABEL_53;
      }
      int64_t v23 = v16 - v17;
      if (v16 > v17)
      {
        objc_msgSend(v12, "addObject:", -[__CFString substringWithRange:](v9, "substringWithRange:", v17, v23));
        uint64_t v15 = v66;
      }
      if (v18 >= v10)
      {
LABEL_53:
        int64_t v40 = v17;
        goto LABEL_54;
      }
      int64_t v64 = v10;
      v65 = v9;
      v24 = 0;
      uint64_t v25 = 0;
      int64_t v26 = ~v16;
      int64_t v27 = v16 + 65;
      int64_t v28 = v16 + 1;
      while (1)
      {
        int64_t v29 = v16 + 1;
        if ((unint64_t)v18 >= 4) {
          uint64_t v30 = 4;
        }
        else {
          uint64_t v30 = v18;
        }
        if (v29 < 0) {
          goto LABEL_51;
        }
        int64_t v31 = v84;
        if (v84 <= v29) {
          goto LABEL_51;
        }
        if (v81)
        {
          UniChar v32 = v81[v16 + 1 + v83];
        }
        else if (v82)
        {
          UniChar v32 = v82[v83 + 1 + v16];
        }
        else
        {
          if (v86 <= v29 || (int64_t v33 = v85, v85 > v29))
          {
            uint64_t v34 = v30 + v26;
            int64_t v35 = v27 - v30;
            int64_t v36 = v16 - v30;
            int64_t v37 = v36 + 1;
            int64_t v38 = v36 + 65;
            if (v38 >= v84) {
              int64_t v38 = v84;
            }
            int64_t v85 = v37;
            int64_t v86 = v38;
            if (v84 >= v35) {
              int64_t v31 = v35;
            }
            v61 = v24;
            int64_t v62 = v28;
            v91.length = v31 + v34;
            uint64_t v39 = v25;
            v91.location = v37 + v83;
            CFStringGetCharacters(theString, v91, buffer);
            uint64_t v25 = v39;
            v24 = v61;
            int64_t v28 = v62;
            uint64_t v15 = v66;
            int64_t v33 = v85;
          }
          UniChar v32 = buffer[v16 + 1 - v33];
        }
        int64_t v40 = v16 + 2;
        if (v32 == 37 && v29 == v28)
        {
          objc_msgSend(v12, "addObject:", @"%", v23);
          uint64_t v15 = v66;
          int64_t v18 = v16 + 2;
          v9 = v65;
          goto LABEL_57;
        }
        if ((unsigned __int16)(v32 - 48) <= 9u)
        {
          uint64_t v25 = 10 * v25 + v32 - 48;
          goto LABEL_51;
        }
        if (v32 == 36)
        {
          v24 = (const void *)v25;
          int64_t v28 = v16 + 2;
          goto LABEL_51;
        }
        if (v32 == 64) {
          break;
        }
LABEL_51:
        --v26;
        ++v27;
        ++v18;
        ++v16;
        if (v15 == v29)
        {
          int64_t v40 = v17;
          int64_t v18 = v64;
          v9 = v65;
          goto LABEL_62;
        }
      }
      if (v24) {
        v42 = v24;
      }
      else {
        v42 = (const void *)(v63 + 1);
      }
      int64_t v43 = v28;
      v44 = objc_alloc_init(VSFormatArgument);
      v9 = v65;
      v44->formatSpecifier = (NSString *)(id)-[__CFString substringWithRange:](v65, "substringWithRange:", v43, v40 - v43);
      CFDictionarySetValue(theDict, v42, v44);
      [v12 addObject:v44];

      uint64_t v15 = v66;
      ++v63;
      int64_t v18 = v16 + 2;
LABEL_57:
      uint64_t v10 = v64;
LABEL_54:
      int64_t v16 = v18;
      int64_t v17 = v40;
      if (v18 >= v10)
      {
LABEL_62:
        if (v18 > v40) {
          objc_msgSend(v12, "addObject:", -[__CFString substringWithRange:](v9, "substringWithRange:", v40, v18 - v40));
        }
        break;
      }
    }
  }
  CFIndex Count = CFDictionaryGetCount(theDict);
  if (Count >= 1)
  {
    CFIndex v46 = Count;
    uint64_t v47 = 0;
    do
    {
      Value = CFDictionaryGetValue(theDict, (const void *)++v47);
      if (Value)
      {
        v49 = Value;
        v50 = v87++;
        Value[3] = *v50;
        v51 = v87++;
        v49[2] = *v51;
      }
    }
    while (v46 != v47);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v52 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v88, 16, v61, v62);
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v69 != v54) {
          objc_enumerationMutation(v12);
        }
        uint64_t v56 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v57 = v11;
          uint64_t v58 = v56;
          uint64_t v59 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v59 = *(void *)(v56 + 16);
          uint64_t v58 = *(void *)(v56 + 24);
          v57 = v11;
        }
        [v57 appendString:v58 withAttributes:v59];
      }
      uint64_t v53 = [v12 countByEnumeratingWithState:&v68 objects:v88 count:16];
    }
    while (v53);
  }
  CFRelease(theDict);

  return v11;
}

@end