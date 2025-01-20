@interface NSString(NSStringUtils)
+ (id)mf_messageIDStringWithDomainHint:()NSStringUtils;
+ (uint64_t)mf_stringForMimeTypeFromFileName:()NSStringUtils;
+ (uint64_t)mf_stringRepresentationForBytes:()NSStringUtils;
+ (uint64_t)mf_stringWithAttachmentCharacter;
- (BOOL)mf_containsSubstring:()NSStringUtils options:;
- (__CFString)mf_stringByEscapingHTMLCodes;
- (id)mf_fileSystemString;
- (id)mf_stringWithNoExtraSpaces;
- (uint64_t)mf_containsSubstring:()NSStringUtils;
- (uint64_t)mf_prefixToString:()NSStringUtils;
- (void)mf_uniqueFilenameWithRespectToFilenames:()NSStringUtils;
@end

@implementation NSString(NSStringUtils)

+ (id)mf_messageIDStringWithDomainHint:()NSStringUtils
{
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  v5 = (void *)[MEMORY[0x1E4F60850] stringByEncodingDomainName:a3];
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v4, "length") + objc_msgSend(v5, "length") + 3);
  [v6 appendString:@"<"];
  [v6 appendString:v4];
  if (a3)
  {
    [v6 appendString:@"@"];
    [v6 appendString:v5];
  }
  [v6 appendString:@">"];
  return v6;
}

- (id)mf_fileSystemString
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  id result = a1;
  if (v2)
  {
    memset(__b, 170, sizeof(__b));
    int v4 = [a1 getFileSystemRepresentation:__b maxLength:1023];
    id result = a1;
    if (v4)
    {
      __b[1023] = 0;
      id result = (id)[objc_allocWithZone(NSString) initWithUTF8String:__b];
    }
  }
  if (!result) {
    return a1;
  }
  return result;
}

+ (uint64_t)mf_stringRepresentationForBytes:()NSStringUtils
{
  return MEMORY[0x1F41092E8]((float)a3);
}

- (id)mf_stringWithNoExtraSpaces
{
  v1 = (void *)[a1 mutableCopy];
  if ([v1 length])
  {
    unint64_t v2 = 0;
    do
    {
      int v3 = [v1 characterAtIndex:v2++];
      if (v3 == 32)
      {
        while (v2 < [v1 length] && objc_msgSend(v1, "characterAtIndex:", v2) == 32)
          objc_msgSend(v1, "deleteCharactersInRange:", v2, 1);
      }
    }
    while (v2 < [v1 length]);
  }
  if ([v1 length] && objc_msgSend(v1, "characterAtIndex:", 0) == 32) {
    objc_msgSend(v1, "deleteCharactersInRange:", 0, 1);
  }
  uint64_t v4 = [v1 length];
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    if ([v1 characterAtIndex:v4 - 1] == 32) {
      objc_msgSend(v1, "deleteCharactersInRange:", v5, 1);
    }
  }
  return v1;
}

+ (uint64_t)mf_stringWithAttachmentCharacter
{
  uint64_t result = mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter;
  if (!mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter)
  {
    __int16 v1 = -4;
    uint64_t result = [[NSString alloc] initWithCharacters:&v1 length:1];
    mf_stringWithAttachmentCharacter_stringWithAttachmentCharacter = result;
  }
  return result;
}

- (void)mf_uniqueFilenameWithRespectToFilenames:()NSStringUtils
{
  LODWORD(v5) = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  v8 = 0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  do
  {
    while (1)
    {
      if (!v8)
      {
        v8 = a1;
        goto LABEL_12;
      }
      if (v7)
      {
        if (!v6) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v7 = [a1 stringByDeletingPathExtension];
        if (!v6) {
LABEL_9:
        }
          uint64_t v6 = (void *)[a1 pathExtension];
      }
      uint64_t v5 = (v5 + 1);
      uint64_t v9 = [v6 length]
         ? [NSString stringWithFormat:@"%@-%d.%@", v7, v5, v6]
         : [NSString stringWithFormat:@"%@-%d", v7, v5, v16];
      v8 = (void *)v9;
LABEL_12:
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      v11 = v8;
      if (!v10) {
        break;
      }
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v18;
LABEL_14:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * v14) isEqualToString:v8]) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_14;
          }
          v11 = v8;
          goto LABEL_21;
        }
      }
    }
LABEL_21:
    ;
  }
  while (!v11);
  return v8;
}

- (__CFString)mf_stringByEscapingHTMLCodes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (__CFString *)[MEMORY[0x1E4F28E78] string];
  uint64_t v14 = a1;
  uint64_t v3 = [a1 length];
  if (v3)
  {
    unint64_t v4 = v3;
    memset(__b, 170, sizeof(__b));
    unint64_t v5 = 0;
    char v6 = 0;
    while (1)
    {
      uint64_t v7 = v4 - v5 >= 0x1FF ? 511 : v4 - v5;
      objc_msgSend(v14, "getCharacters:range:", __b, v5, v7);
      if (v7) {
        break;
      }
LABEL_28:
      v5 += v7;
      if (v5 >= v4) {
        return v2;
      }
    }
    v8 = (const UniChar *)__b;
    uint64_t v9 = v7;
    while (1)
    {
      unsigned int v10 = *v8;
      if (v10 > 0x25)
      {
        switch(v10)
        {
          case '&':
            v11 = v2;
            uint64_t v12 = @"&amp;";
            break;
          case '>':
            v11 = v2;
            uint64_t v12 = @"&gt;";
            break;
          case '<':
            v11 = v2;
            uint64_t v12 = @"&lt;";
            break;
          default:
            goto LABEL_26;
        }
      }
      else
      {
        switch(v10)
        {
          case 9u:
            v11 = v2;
            uint64_t v12 = @"&nbsp;&nbsp;&nbsp;&nbsp;";
            break;
          case 0xAu:
            v11 = v2;
            uint64_t v12 = @"<br>";
            break;
          case 0x20u:
            if (v6)
            {
              [(__CFString *)v2 appendString:@"&nbsp;"];
              char v6 = 1;
            }
            else
            {
              char v6 = 1;
              CFStringAppendCharacters(v2, v8, 1);
            }
            goto LABEL_24;
          default:
LABEL_26:
            CFStringAppendCharacters(v2, v8, 1);
            goto LABEL_23;
        }
      }
      [(__CFString *)v11 appendString:v12];
LABEL_23:
      char v6 = 0;
LABEL_24:
      ++v8;
      if (!--v9) {
        goto LABEL_28;
      }
    }
  }
  return v2;
}

+ (uint64_t)mf_stringForMimeTypeFromFileName:()NSStringUtils
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F73588]);
  objc_msgSend(v4, "setPathExtension:", objc_msgSend(a3, "pathExtension"));
  [v4 setFilename:a3];
  uint64_t v5 = [v4 mimeType];
  if (MFGetTypeInfo()) {
    uint64_t v5 = [v4 mimeType];
  }

  return v5;
}

- (BOOL)mf_containsSubstring:()NSStringUtils options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)mf_containsSubstring:()NSStringUtils
{
  return objc_msgSend(a1, "mf_containsSubstring:options:", a3, 0);
}

- (uint64_t)mf_prefixToString:()NSStringUtils
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfString:");
  if (!v3) {
    return 0;
  }
  return objc_msgSend(a1, "substringWithRange:", 0, v2);
}

@end