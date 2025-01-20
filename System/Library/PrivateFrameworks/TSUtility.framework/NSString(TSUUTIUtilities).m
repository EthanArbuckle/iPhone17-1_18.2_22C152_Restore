@interface NSString(TSUUTIUtilities)
- (BOOL)tsu_conformsToUTI:()TSUUTIUtilities;
- (__CFString)tsu_UTIFilenameExtension;
- (__CFString)tsu_pathUTI;
- (uint64_t)tsu_conformsToAnyUTI:()TSUUTIUtilities;
- (uint64_t)tsu_pathConformsToUTI:()TSUUTIUtilities;
- (uint64_t)tsu_pathExtensionConformsToUTI:()TSUUTIUtilities;
@end

@implementation NSString(TSUUTIUtilities)

- (BOOL)tsu_conformsToUTI:()TSUUTIUtilities
{
  return UTTypeConformsTo(a1, inConformsToUTI) != 0;
}

- (uint64_t)tsu_conformsToAnyUTI:()TSUUTIUtilities
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        if (objc_msgSend(a1, "tsu_conformsToUTI:", *(void *)(*((void *)&v9 + 1) + 8 * v8))) {
          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (__CFString)tsu_UTIFilenameExtension
{
  v1 = (__CFString *)UTTypeCopyPreferredTagWithClass(a1, (CFStringRef)*MEMORY[0x263F01910]);
  return v1;
}

- (__CFString)tsu_pathUTI
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v2 = [a1 isAbsolutePath];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263F01910];
  CFStringRef v4 = (const __CFString *)[a1 pathExtension];
  if (v2)
  {
    CFArrayRef AllIdentifiersForTag = UTTypeCreateAllIdentifiersForTag(v3, v4, 0);
    if ((unint64_t)[(__CFArray *)AllIdentifiersForTag count] >= 2)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v6 = [(__CFArray *)AllIdentifiersForTag countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        CFStringRef v8 = 0;
        CFStringRef v9 = 0;
        uint64_t v10 = *(void *)v22;
        CFStringRef v11 = (const __CFString *)*MEMORY[0x263F01A10];
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(AllIdentifiersForTag);
            }
            CFStringRef v13 = *(const __CFString **)(*((void *)&v21 + 1) + 8 * i);
            if (UTTypeConformsTo(v13, v11)) {
              CFStringRef v8 = v13;
            }
            else {
              CFStringRef v9 = v13;
            }
            if (v8) {
              BOOL v14 = v9 == 0;
            }
            else {
              BOOL v14 = 1;
            }
            if (!v14)
            {
              char v20 = 1;
              unsigned __int8 v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v20);
              if ((v18 & (v20 == 0)) != 0) {
                v15 = (__CFString *)v9;
              }
              else {
                v15 = (__CFString *)v8;
              }
              goto LABEL_25;
            }
          }
          uint64_t v7 = [(__CFArray *)AllIdentifiersForTag countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    v15 = (__CFString *)[(__CFArray *)AllIdentifiersForTag objectAtIndex:0];
LABEL_25:
    v19 = v15;

    return v15;
  }
  else
  {
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v3, v4, 0);
    return PreferredIdentifierForTag;
  }
}

- (uint64_t)tsu_pathConformsToUTI:()TSUUTIUtilities
{
  CFStringRef v4 = (void *)[a1 pathExtension];
  return objc_msgSend(v4, "tsu_pathExtensionConformsToUTI:", a3);
}

- (uint64_t)tsu_pathExtensionConformsToUTI:()TSUUTIUtilities
{
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01910], inTag, a3);
  CFStringRef v4 = PreferredIdentifierForTag;
  if (PreferredIdentifierForTag) {
    uint64_t v5 = [(__CFString *)PreferredIdentifierForTag hasPrefix:@"dyn."] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end