@interface NSAttributedString(NSAttributedStringUIFoundationAdditions)
+ (_NSAttributedStringAsyncReadReply)readFromData:()NSAttributedStringUIFoundationAdditions options:completionHandler:;
+ (_NSAttributedStringAsyncReadReply)readFromURL:()NSAttributedStringUIFoundationAdditions options:completionHandler:;
+ (uint64_t)_documentTypeForFileType:()NSAttributedStringUIFoundationAdditions;
+ (uint64_t)_isAttributedStringAgent;
+ (uint64_t)allowedSecureCodingClasses;
+ (uint64_t)fontStyleAttributeNames;
- (CFIndex)lineBreakByHyphenatingBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:;
- (__CFString)stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:()NSAttributedStringUIFoundationAdditions;
- (char)itemNumberInTextList:()NSAttributedStringUIFoundationAdditions atIndex:;
- (id)_initWithHTMLData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:;
- (id)dataFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:;
- (id)fontAttributesInRange:()NSAttributedStringUIFoundationAdditions;
- (id)initWithData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:;
- (id)initWithURL:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:;
- (id)rulerAttributesInRange:()NSAttributedStringUIFoundationAdditions;
- (uint64_t)RTFDFileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)RTFDFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)RTFFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)_atStartOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:;
- (uint64_t)_atStartOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:;
- (uint64_t)_documentFromRange:()NSAttributedStringUIFoundationAdditions document:documentAttributes:subresources:;
- (uint64_t)_htmlDocumentFragmentString:()NSAttributedStringUIFoundationAdditions documentAttributes:subresources:;
- (uint64_t)_initWithURLFunnel:()NSAttributedStringUIFoundationAdditions options:documentAttributes:;
- (uint64_t)_isStringDrawingTextStorage;
- (uint64_t)_lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:lineBreakStrategy:;
- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:;
- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:completeRow:;
- (uint64_t)containsAttachments;
- (uint64_t)containsAttachmentsInRange:()NSAttributedStringUIFoundationAdditions;
- (uint64_t)defaultLanguage;
- (uint64_t)docFormatFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions;
- (uint64_t)initWithDocFormat:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions baseURL:documentAttributes:;
- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions options:documentAttributes:;
- (uint64_t)initWithPath:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithRTF:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithRTFD:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithRTFDFileWrapper:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)initWithURL:()NSAttributedStringUIFoundationAdditions documentAttributes:;
- (uint64_t)lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:;
- (uint64_t)prefersRTFDInRange:()NSAttributedStringUIFoundationAdditions;
- (uint64_t)rangeOfTextBlock:()NSAttributedStringUIFoundationAdditions atIndex:;
- (uint64_t)rangeOfTextList:()NSAttributedStringUIFoundationAdditions atIndex:;
- (uint64_t)rangeOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:;
- (unint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions inRange:;
- (unint64_t)nextWordFromIndex:()NSAttributedStringUIFoundationAdditions forward:;
- (void)_atEndOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:;
- (void)_atEndOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:;
- (void)_initWithRTFSelector:()NSAttributedStringUIFoundationAdditions argument:documentAttributes:;
- (void)fileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:;
@end

@implementation NSAttributedString(NSAttributedStringUIFoundationAdditions)

- (uint64_t)prefersRTFDInRange:()NSAttributedStringUIFoundationAdditions
{
  if (!a4) {
    return 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", a3, &v12, a3, a4);
  if (![v7 objectForKeyedSubscript:@"NSAttachment"])
  {
    unint64_t v9 = a3 + a4;
    while (![v7 objectForKeyedSubscript:@"CTAdaptiveImageProvider"])
    {
      uint64_t v10 = v13 + v12;
      uint64_t v11 = v9 - (v13 + v12);
      if (v9 <= v13 + v12) {
        return 0;
      }
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      v7 = objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v12, v10, v11);
      if ([v7 objectForKeyedSubscript:@"NSAttachment"]) {
        return 1;
      }
    }
  }
  return 1;
}

- (CFIndex)lineBreakByHyphenatingBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:
{
  unint64_t v9 = [a1 length];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v9 <= a3 ? v9 - 1 : a3;
  uint64_t v11 = [a1 attribute:NSLanguageAttributeName atIndex:v10 effectiveRange:0];
  if (!v11 || (CFLocaleRef v12 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11]) == 0)
  {
    if (lineBreakByHyphenatingBeforeIndex_withinRange__onceToken != -1) {
      dispatch_once(&lineBreakByHyphenatingBeforeIndex_withinRange__onceToken, &__block_literal_global_65);
    }
    CFLocaleRef v12 = (const __CFLocale *)lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale;
    if (!lineBreakByHyphenatingBeforeIndex_withinRange__defaultLocale) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  CFStringRef v13 = (const __CFString *)[a1 string];
  v15.location = a4;
  v15.length = a5;
  CFIndex result = CFStringGetHyphenationLocationBeforeIndex(v13, a3, v15, 0, v12, 0);
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (unint64_t)nextWordFromIndex:()NSAttributedStringUIFoundationAdditions forward:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)[a1 string];
  uint64_t v8 = [a1 length];
  if (!v8) {
    return 0;
  }
  unint64_t v9 = v8;
  if (a3) {
    BOOL v10 = v8 == a3;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = [a1 attribute:NSLanguageAttributeName atIndex:a3 - v11 effectiveRange:0];
  uint64_t v13 = v12;
  CFStringRef theString = v7;
  if (a4)
  {
    if (v9 <= a3 + 1) {
      return v9;
    }
    if (v9 - a3 >= 0x100) {
      CFIndex v14 = 256;
    }
    else {
      CFIndex v14 = v9 - a3;
    }
    v55.location = a3;
    v55.length = v14;
    CFStringGetCharacters(v7, v55, buffer);
    unint64_t v15 = a3;
    v50 = (void *)v13;
    while (1)
    {
      unint64_t v16 = v15 - a3;
      int v17 = buffer[v15 - a3] & 0xFC00;
      if (v17 == 56320)
      {
        if ((uint64_t)a3 > 0 || v16) {
          [(__CFString *)v7 characterAtIndex:v15 - 1];
        }
      }
      else if (v17 == 55296 && v15 + 1 < v9)
      {
        ++v16;
        -[__CFString characterAtIndex:](v7, "characterAtIndex:");
      }
      if (CFUniCharIsMemberOf())
      {
        do
        {
          if (++v16 >= v14)
          {
            a3 += v14;
            if (v9 <= a3) {
              return v9;
            }
            if (v9 - a3 >= 0x100) {
              CFIndex v14 = 256;
            }
            else {
              CFIndex v14 = v9 - a3;
            }
            v56.location = a3;
            v56.length = v14;
            CFStringGetCharacters(v7, v56, buffer);
            unint64_t v16 = 0;
          }
          if ((buffer[v16] & 0xFC00) == 0xD800)
          {
            if (v16 + a3 + 2 >= v9) {
              return v9;
            }
            if (([(__CFString *)v7 characterAtIndex:v16 + a3 + 1] & 0xFC00) == 0xDC00) {
              ++v16;
            }
          }
        }
        while ((CFUniCharIsMemberOf() & 1) != 0);
      }
      unint64_t v15 = v16 + a3;
      if (a3 + v14 >= v9)
      {
        BOOL v48 = 0;
        v23 = buffer;
        v24 = v50;
      }
      else
      {
        if (v15 + 256 < v9)
        {
          while (1)
          {
            unint64_t v19 = v16 + 1;
            if (v16 + 1 < v14)
            {
              do
              {
                if ((buffer[v19] & 0xFC00) != 0xD800 || a3 + 1 + v19 >= v9)
                {
                  unint64_t v16 = v19;
                }
                else
                {
                  __int16 v21 = -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
                  if ((v21 & 0xFC00) == 0xDC00) {
                    v16 += 2;
                  }
                  else {
                    unint64_t v16 = v19;
                  }
                }
                int IsMemberOf = CFUniCharIsMemberOf();
                if (IsMemberOf) {
                  break;
                }
                unint64_t v19 = v16 + 1;
              }
              while (v16 + 1 < v14);
              v7 = (__CFString *)theString;
              if (IsMemberOf) {
                break;
              }
            }
            a3 += v14;
            if (v9 == a3)
            {
              CFIndex v14 = v9 - v15;
              goto LABEL_58;
            }
            if (v9 - a3 >= 0x100) {
              CFIndex v14 = 256;
            }
            else {
              CFIndex v14 = v9 - a3;
            }
            v57.location = a3;
            v57.length = v14;
            CFStringGetCharacters(v7, v57, buffer);
            unint64_t v16 = 0;
          }
          CFIndex v14 = a3 - v15 + v16;
LABEL_58:
          a3 = v15;
        }
        BOOL v48 = v14 > 256;
        v24 = v50;
        if (v14 < 257) {
          v23 = buffer;
        }
        else {
          v23 = (UniChar *)NSZoneMalloc(0, 2 * v14);
        }
        v58.location = a3;
        v58.length = v14;
        CFStringGetCharacters(v7, v58, v23);
      }
      unint64_t v25 = _NSCopyBreakIterator(v24, (uint64_t)v23, v14, 1u);
      if (!v25) {
        goto LABEL_79;
      }
      int v26 = ubrk_following();
      _NSDisposeBreakIterator(v25, v24, 1);
      if (v26 == -1) {
        goto LABEL_78;
      }
      unint64_t v15 = a3 + v26;
      if (v9 == v15) {
        return v9;
      }
      int v27 = v23[v26 - 1];
      if (v15 >= 2 && (v27 & 0xFC00) == 0xDC00)
      {
        if (v26 < 2) {
          [(__CFString *)(id)theString characterAtIndex:v15 - 2];
        }
      }
      else if (v27 == 95)
      {
        goto LABEL_78;
      }
      if (CFUniCharIsMemberOf())
      {
        if (v9 - v15 >= 0x100) {
          CFIndex v14 = 256;
        }
        else {
          CFIndex v14 = v9 - v15;
        }
        v7 = (__CFString *)theString;
        v59.location = v15;
        v59.length = v14;
        CFStringGetCharacters(theString, v59, buffer);
        LOBYTE(v25) = 1;
        a3 = v15;
        goto LABEL_79;
      }
LABEL_78:
      LOBYTE(v25) = 0;
      v7 = (__CFString *)theString;
LABEL_79:
      if (v48) {
        NSZoneFree(0, v23);
      }
      if ((v25 & 1) == 0) {
        return v15;
      }
    }
  }
  if (a3 < 2) {
    return 0;
  }
  v51 = (void *)v12;
  if (a3 >= 0x100) {
    CFIndex v29 = 256;
  }
  else {
    CFIndex v29 = a3;
  }
  CFIndex v30 = a3 - v29;
  v60.location = a3 - v29;
  v60.length = v29;
  CFStringGetCharacters(v7, v60, buffer);
  while (1)
  {
    unint64_t v31 = a3 + ~v30;
    UniChar v32 = buffer[v31];
    if ((v32 & 0xFC00) == 0xD800)
    {
      if (!v30 && v31 < 2) {
        return 0;
      }
      UniChar v32 = [(__CFString *)v7 characterAtIndex:--v31];
    }
    if ((v32 & 0xFC00) == 0xDC00 && (buffer[v31 - 1] & 0xFC00) == 0xD800)
    {
      if (!((v31 - 1) | v30)) {
        return 0;
      }
      --v31;
    }
    if (CFUniCharIsMemberOf())
    {
      while (1)
      {
        while (1)
        {
          if (v31)
          {
            unint64_t v33 = v31;
          }
          else
          {
            if (v30 < 2) {
              return 0;
            }
            CFIndex v29 = v30 >= 256 ? 256 : v30;
            v30 -= v29;
            v61.location = v30;
            v61.length = v29;
            CFStringGetCharacters(v7, v61, buffer);
            unint64_t v33 = v29;
          }
          unint64_t v31 = v33 - 1;
          int v34 = buffer[v33 - 1];
          if ((v34 & 0xFC00) == 0xDC00) {
            break;
          }
LABEL_112:
          if ((CFUniCharIsMemberOf() & 1) == 0)
          {
            v31 -= (v34 & 0xFFFF0000) != 0;
            goto LABEL_122;
          }
        }
        if (v33 != 1)
        {
          unint64_t v35 = v33 - 2;
          int v36 = buffer[v35];
          if ((v36 & 0xFC00) == 0xD800)
          {
            if (!(v35 | v30)) {
              return 0;
            }
            int v34 = v34 - 56613888 + (v36 << 10);
            unint64_t v31 = v35;
          }
          goto LABEL_112;
        }
        if (v30 < 2) {
          return 0;
        }
        if ((unint64_t)v30 < 0x100) {
          CFIndex v29 = v30 + 1;
        }
        else {
          CFIndex v29 = 256;
        }
        if ((unint64_t)v30 >= 0x100) {
          v30 -= 255;
        }
        else {
          CFIndex v30 = 0;
        }
        v62.location = v30;
        v62.length = v29;
        CFStringGetCharacters(v7, v62, buffer);
        unint64_t v31 = v29;
      }
    }
LABEL_122:
    a3 = v31 + v30;
    if (v30 < 1)
    {
      BOOL v49 = 0;
      v39 = buffer;
      goto LABEL_153;
    }
    if (a3 + 2 > v9) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = 2;
    }
    CFIndex v29 = v37 + a3;
    if (v37 + a3 >= 0x101)
    {
      if (!v31) {
        goto LABEL_139;
      }
      while (1)
      {
        if ((buffer[v31 - 1] & 0xFC00) == 0xDC00)
        {
          if (v31 == 1)
          {
            ++v30;
            goto LABEL_139;
          }
          if ((buffer[v31 - 2] & 0xFC00) == 0xD800) {
            v31 -= 2;
          }
          else {
            --v31;
          }
        }
        else
        {
          --v31;
        }
        int v38 = CFUniCharIsMemberOf();
        if ((v38 & 1) != 0 || !v31)
        {
          if (v38)
          {
            v30 += v31 + 1;
LABEL_149:
            CFIndex v29 = a3 - v30 + v37;
            BOOL v49 = v29 > 256;
            if (v29 < 257) {
              v39 = buffer;
            }
            else {
              v39 = (UniChar *)NSZoneMalloc(0, 2 * v29);
            }
            v65.location = v30;
            v65.length = a3 - v30 + v37;
            CFStringGetCharacters(v7, v65, v39);
            goto LABEL_153;
          }
LABEL_139:
          if (v30 < 1) {
            goto LABEL_149;
          }
          if (v30 >= 256) {
            unint64_t v31 = 256;
          }
          else {
            unint64_t v31 = v30;
          }
          v30 -= v31;
          v63.location = v30;
          v63.length = v31;
          CFStringGetCharacters(v7, v63, buffer);
        }
      }
    }
    if ((v31 & 0x8000000000000000) == 0)
    {
      v40 = &buffer[v31];
      do
      {
        v40[v30] = *v40;
        --v40;
      }
      while (v40 >= buffer);
    }
    v39 = buffer;
    v64.location = 0;
    v64.length = v30;
    CFStringGetCharacters(v7, v64, buffer);
    BOOL v49 = 0;
    CFIndex v30 = 0;
LABEL_153:
    uint64_t v41 = _NSCopyBreakIterator(v51, (uint64_t)v39, v29, 1u);
    if (!v41) {
      break;
    }
    unint64_t v42 = v41;
    int v43 = ubrk_preceding();
    _NSDisposeBreakIterator(v42, v51, 1);
    if (v43 == -1) {
      break;
    }
    a3 = v30 + v43;
    if (!a3) {
      break;
    }
    int v44 = v39[v43];
    if ((v44 & 0xFC00) == 0xDC00)
    {
      --a3;
      goto LABEL_178;
    }
    if ((v44 & 0xFC00) == 0xD800)
    {
      if (a3 + 1 >= v9) {
        goto LABEL_178;
      }
      int v45 = v39[v43 + 1];
      BOOL v10 = (v45 & 0xFC00) == 56320;
      int v46 = (v44 << 10) - 56613888 + v45;
      if (v10) {
        int v44 = v46;
      }
    }
    if ((CFUniCharIsMemberOf() & 1) == 0)
    {
      if (v44 == 95 || !CFUniCharIsMemberOf())
      {
        if (!CFUniCharIsMemberOf()) {
          break;
        }
        int v47 = a3 - 1 >= v30 ? v39[v43 - 1] : -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
        if (v47 != 46) {
          break;
        }
        goto LABEL_178;
      }
      if (v44 == 46 && a3 + 1 < v9)
      {
        if ((-[__CFString characterAtIndex:]((id)theString, "characterAtIndex:") & 0xFC00) == 0xD800 && a3 + 2 < v9) {
          -[__CFString characterAtIndex:]((id)theString, "characterAtIndex:");
        }
        if (CFUniCharIsMemberOf()) {
          break;
        }
      }
    }
LABEL_178:
    if (v43)
    {
      v7 = (__CFString *)theString;
      if (v49)
      {
        if (a3 >= 0x100) {
          CFIndex v29 = 256;
        }
        else {
          CFIndex v29 = a3;
        }
        if (a3 >= 0x100) {
          CFIndex v30 = a3 - 256;
        }
        else {
          CFIndex v30 = 0;
        }
        v66.location = v30;
        v66.length = v29;
        CFStringGetCharacters(theString, v66, buffer);
        goto LABEL_191;
      }
    }
    else
    {
      if (v30 >= 256) {
        CFIndex v29 = 256;
      }
      else {
        CFIndex v29 = v30;
      }
      v30 -= v29;
      v7 = (__CFString *)theString;
      v67.location = v30;
      v67.length = v29;
      CFStringGetCharacters(theString, v67, buffer);
      if (v49) {
LABEL_191:
      }
        NSZoneFree(0, v39);
    }
  }
  if (v49) {
    NSZoneFree(0, v39);
  }
  return a3;
}

- (uint64_t)_lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:lineBreakStrategy:
{
  CFStringRef v7 = (const __CFString *)[a1 string];
  unint64_t v8 = [a1 length];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4 < a3)
  {
    unint64_t v10 = v8;
    if (v8 >= a4)
    {
      if (v8 >= a3) {
        unint64_t v11 = a3;
      }
      else {
        unint64_t v11 = v8;
      }
      CFStringRef theString = v7;
      CFIndex v66 = a4;
      CFIndex v67 = v8 - a4;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      if (CharactersPtr) {
        CStringPtr = 0;
      }
      else {
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      }
      uint64_t v13 = 0;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v56 = 0u;
      uint64_t v14 = v11 - a4;
      int64_t v68 = 0;
      CFIndex length = 0;
      int64_t v15 = v11 - a4;
      CFRange v65 = CStringPtr;
      do
      {
        uint64_t v16 = v15;
        if (v15 < 0 || (CFIndex v17 = v67, v67 <= v15))
        {
          UniChar v18 = 0;
        }
        else if (CharactersPtr)
        {
          UniChar v18 = CharactersPtr[v66 + v15];
        }
        else if (v65)
        {
          UniChar v18 = v65[v66 + v15];
        }
        else
        {
          if (length <= v15 || v13 > v15)
          {
            int64_t v19 = v15 - 4;
            if ((unint64_t)v15 < 4) {
              int64_t v19 = 0;
            }
            if (v19 + 64 < v67) {
              CFIndex v17 = v19 + 64;
            }
            int64_t v68 = v19;
            CFIndex length = v17;
            v70.location = v66 + v19;
            v70.CFIndex length = v17 - v19;
            CFStringGetCharacters(theString, v70, buffer);
            uint64_t v13 = v68;
          }
          UniChar v18 = buffer[v16 - v13];
        }
        int64_t v15 = v16 + 1;
      }
      while (v18 == 32 || (unsigned __int16)((unsigned __int16)(v18 - 3712) >> 7) > 0x1FEu);
      if (v16 <= v67)
      {
        if (CharactersPtr)
        {
          int v27 = 0;
          uint64_t v14 = 0;
          v28 = (UniChar *)&CharactersPtr[v66];
          goto LABEL_72;
        }
        if (v16 <= 64)
        {
          if (v16 > length || v13 >= 1)
          {
            if (v67 >= 64) {
              v36.CFIndex length = 64;
            }
            else {
              v36.CFIndex length = v67;
            }
            int64_t v68 = 0;
            CFIndex length = v36.length;
            v36.location = v66;
            if (v65)
            {
              if (v36.length)
              {
                uint64_t v37 = &v65[v66];
                int v38 = buffer;
                do
                {
                  UniChar v39 = *v37++;
                  *v38++ = v39;
                  --v36.length;
                }
                while (v36.length);
              }
            }
            else
            {
              CFStringGetCharacters(theString, v36, buffer);
            }
          }
          int v27 = 0;
          uint64_t v14 = 0;
          v28 = &buffer[-v68];
          goto LABEL_72;
        }
      }
      unint64_t v54 = v11;
      if (v14 < 1)
      {
LABEL_60:
        uint64_t v14 = 0;
        goto LABEL_65;
      }
      while (1)
      {
        int64_t v20 = v14--;
        CFIndex v21 = v67;
        if (v67 >= v20)
        {
          if (CharactersPtr)
          {
            UniChar v22 = CharactersPtr[v66 + v14];
          }
          else if (v65)
          {
            UniChar v22 = v65[v66 + v14];
          }
          else
          {
            int64_t v23 = v68;
            BOOL v24 = length >= v20 && v68 < v20;
            if (!v24)
            {
              int64_t v25 = v20 - 5;
              if ((unint64_t)v20 < 5) {
                int64_t v25 = 0;
              }
              if (v25 + 64 < v67) {
                CFIndex v21 = v25 + 64;
              }
              int64_t v68 = v25;
              CFIndex length = v21;
              v71.location = v66 + v25;
              v71.CFIndex length = v21 - v25;
              CFStringGetCharacters(theString, v71, buffer);
              int64_t v23 = v68;
            }
            UniChar v22 = buffer[v14 - v23];
          }
          if (v22 > 0x84u)
          {
            if (v22 - 8232 < 2 || v22 == 133) {
              goto LABEL_63;
            }
          }
          else if (v22 == 13)
          {
            if ((unint64_t)[0 length] < 2
              || [0 characterAtIndex:1] != 10)
            {
              goto LABEL_63;
            }
          }
          else if (v22 == 10 || v22 == 12)
          {
LABEL_63:
            v16 -= v14;
            if (v16 == 1) {
              return v14 + a4;
            }
LABEL_65:
            CFIndex v29 = v16 + v14;
            if (v16 + v14 <= v67)
            {
              if (CharactersPtr)
              {
                int v27 = 0;
                v28 = (UniChar *)&CharactersPtr[v66 + v14];
                goto LABEL_71;
              }
              if (v16 > 64) {
                goto LABEL_66;
              }
              BOOL v24 = v29 <= length;
              unint64_t v11 = v54;
              if (!v24 || v14 < v68)
              {
                uint64_t v44 = v14 + 64;
                if (v14 + 64 >= v67) {
                  uint64_t v44 = v67;
                }
                int64_t v68 = v14;
                CFIndex length = v44;
                v45.location = v66 + v14;
                v45.CFIndex length = v44 - v14;
                if (v65)
                {
                  if (v45.length)
                  {
                    int v46 = &v65[v45.location];
                    uint64_t v47 = v14 - v44;
                    BOOL v48 = buffer;
                    do
                    {
                      UniChar v49 = *v46++;
                      *v48++ = v49;
                    }
                    while (!__CFADD__(v47++, 1));
                  }
                }
                else
                {
                  CFStringGetCharacters(theString, v45, buffer);
                }
              }
              int v27 = 0;
              v28 = &buffer[v14 - v68];
            }
            else
            {
LABEL_66:
              CFIndex v30 = (UniChar *)NSZoneMalloc((NSZone *)objc_msgSend(a1, "zone", v54), 2 * v16);
              v28 = v30;
              if (CharactersPtr)
              {
                memmove(v30, &CharactersPtr[v66 + v14], 2 * v16);
              }
              else
              {
                if (v14 < v68 || length <= v14)
                {
                  uint64_t v41 = v30;
                  uint64_t v42 = v14;
                  CFIndex v43 = v16;
                  if (v29 > v68)
                  {
                    uint64_t v41 = v30;
                    uint64_t v42 = v14;
                    CFIndex v43 = v16;
                    if (v29 < length)
                    {
                      CFIndex v43 = v68 - v14;
                      memmove(&v30[v68 - v14], buffer, 2 * (v29 - v68));
                      uint64_t v41 = v28;
                      uint64_t v42 = v14;
                    }
                  }
                }
                else
                {
                  if (v16 >= length - v14) {
                    uint64_t v40 = length - v14;
                  }
                  else {
                    uint64_t v40 = v16;
                  }
                  memmove(v30, &buffer[v14 - v68], 2 * v40);
                  uint64_t v41 = &v28[v40];
                  uint64_t v42 = v40 + v14;
                  CFIndex v43 = v16 - v40;
                }
                if (v43 >= 1)
                {
                  v51.location = v66 + v42;
                  if (v65)
                  {
                    v52 = &v65[v51.location];
                    do
                    {
                      UniChar v53 = *v52++;
                      *v41++ = v53;
                      --v43;
                    }
                    while (v43);
                  }
                  else
                  {
                    v51.CFIndex length = v43;
                    CFStringGetCharacters(theString, v51, v41);
                  }
                }
              }
              int v27 = v28;
LABEL_71:
              unint64_t v11 = v54;
            }
LABEL_72:
            unint64_t v31 = (void *)[a1 attribute:NSLanguageAttributeName atIndex:v11 - (v10 <= a3) effectiveRange:0];
            uint64_t v32 = _NSCopyBreakIterator(v31, (uint64_t)v28, v16, 0);
            if (!v32 || (unint64_t v33 = v32, v34 = ubrk_preceding(), _NSDisposeBreakIterator(v33, v31, 0), v34 == -1))
            {
              uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v27) {
                return v9;
              }
            }
            else
            {
              uint64_t v9 = v14 + a4 + v34;
              if (!v27) {
                return v9;
              }
            }
            NSZoneFree((NSZone *)objc_msgSend(a1, "zone", v54), v27);
            return v9;
          }
        }
        if ((unint64_t)v20 <= 1) {
          goto LABEL_60;
        }
      }
    }
  }
  return v9;
}

- (uint64_t)_isStringDrawingTextStorage
{
  return 0;
}

- (uint64_t)containsAttachmentsInRange:()NSAttributedStringUIFoundationAdditions
{
  if (containsAttachmentsInRange__onceToken != -1) {
    dispatch_once(&containsAttachmentsInRange__onceToken, &__block_literal_global_71);
  }
  if (containsAttachmentsInRange__checksImageGlyphs)
  {
    return objc_msgSend(a1, "prefersRTFDInRange:", a3, a4);
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__NSAttributedString_NSAttributedStringUIFoundationAdditions__containsAttachmentsInRange___block_invoke_2;
    v9[3] = &unk_1E55C6630;
    v9[4] = &v10;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", a3, a4, 0, v9);
    uint64_t v8 = *((unsigned __int8 *)v11 + 24);
    _Block_object_dispose(&v10, 8);
    return v8;
  }
}

- (uint64_t)rangeOfTextList:()NSAttributedStringUIFoundationAdditions atIndex:
{
  CFStringRef v7 = (void *)[a1 string];
  if ([v7 length] <= a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v44 = 0;
  uint64_t v45 = 0;
  objc_msgSend(v7, "getParagraphStart:end:contentsEnd:forRange:", &v44, 0, 0, a4, 1);
  unint64_t v8 = v44 >= a4 ? a4 : v44;
  uint64_t v9 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:v8 effectiveRange:&v44];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v9;
  unint64_t v11 = (void *)[v9 textLists];
  uint64_t v12 = [v11 indexOfObjectIdenticalTo:a3];
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11) {
    BOOL v14 = v12 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    unint64_t v16 = v12;
    uint64_t v41 = v10;
    unint64_t v13 = v44;
    unint64_t v17 = v45 + v44;
    unint64_t v42 = [a1 length];
    UniChar v39 = v7;
    unint64_t v40 = v17;
    if (v13)
    {
      UniChar v18 = v41;
      int64_t v19 = v41;
      do
      {
        int64_t v20 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v13 - 1, &v44, v39);
        CFIndex v21 = v20;
        if (v20 == v19)
        {
          BOOL v28 = 1;
        }
        else if (v20 {
               && (UniChar v22 = (void *)[v20 textLists]) != 0
        }
               && (int64_t v23 = v22, [v22 count] > v16))
        {
          unint64_t v24 = 1;
          do
          {
            uint64_t v25 = [v11 objectAtIndex:v24 - 1];
            uint64_t v26 = [v23 objectAtIndex:v24 - 1];
          }
          while (v25 == v26 && v24++ <= v16);
          BOOL v28 = v25 == v26;
          UniChar v18 = v41;
        }
        else
        {
          BOOL v28 = 0;
        }
        if (v28)
        {
          int64_t v19 = v21;
          unint64_t v13 = v44;
        }
        if (v13) {
          BOOL v29 = !v28;
        }
        else {
          BOOL v29 = 1;
        }
      }
      while (!v29);
    }
    else
    {
      UniChar v18 = v41;
    }
    for (unint64_t i = v40; i < v42; unint64_t i = v45 + v44)
    {
      unint64_t v31 = v18;
      uint64_t v32 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:i effectiveRange:&v44];
      UniChar v18 = v32;
      if (v32 != v31)
      {
        if (!v32) {
          break;
        }
        unint64_t v33 = (void *)[v32 textLists];
        if (!v33) {
          break;
        }
        int v34 = v33;
        if ([v33 count] <= v16) {
          break;
        }
        unint64_t v35 = 1;
        do
        {
          uint64_t v36 = objc_msgSend(v11, "objectAtIndex:", v35 - 1, v39);
          uint64_t v37 = [v34 objectAtIndex:v35 - 1];
        }
        while (v36 == v37 && v35++ <= v16);
        if (v36 != v37) {
          break;
        }
      }
    }
    if (i > v13)
    {
      uint64_t v43 = 0;
      objc_msgSend(v39, "getParagraphStart:end:contentsEnd:forRange:", 0, &v43, 0, i - 1, 1);
    }
  }
  return v13;
}

+ (uint64_t)_isAttributedStringAgent
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__NSAttributedString_NSAttributedStringUIFoundationAdditions___isAttributedStringAgent__block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = a1;
  if (_isAttributedStringAgent_onceToken != -1) {
    dispatch_once(&_isAttributedStringAgent_onceToken, block);
  }
  return _isAttributedStringAgent_isInAgent;
}

+ (uint64_t)allowedSecureCodingClasses
{
  if (allowedSecureCodingClasses_onceToken != -1) {
    dispatch_once(&allowedSecureCodingClasses_onceToken, &__block_literal_global_9);
  }
  return allowedSecureCodingClasses_allowedClasses;
}

- (uint64_t)defaultLanguage
{
  return 0;
}

- (uint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions
{
  uint64_t v5 = [a1 length];

  return objc_msgSend(a1, "doubleClickAtIndex:inRange:", a3, 0, v5);
}

- (unint64_t)doubleClickAtIndex:()NSAttributedStringUIFoundationAdditions inRange:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (__CFString *)[a1 string];
  uint64_t v10 = [a1 length];
  if (!v10) {
    return 0;
  }
  unint64_t v11 = v10;
  int v12 = [(__CFString *)v9 characterAtIndex:a3];
  int v13 = v12;
  if (v12 > 132)
  {
    if ((v12 - 8232) >= 2 && v12 != 133) {
      goto LABEL_16;
    }
LABEL_12:
    if (a3 && v12 == 10 && [(__CFString *)v9 characterAtIndex:a3 - 1] == 13) {
      --a3;
    }
    return a3;
  }
  if (v12 == 10 || v12 == 12) {
    goto LABEL_12;
  }
  if (v12 == 13)
  {
    if (a3 + 1 >= [(__CFString *)v9 length]
      || [(__CFString *)v9 characterAtIndex:a3 + 1] != 10)
    {
      if (a3 + 1 < v11) {
        [(__CFString *)v9 characterAtIndex:a3 + 1];
      }
      return a3;
    }
    int v14 = 0;
    BOOL v15 = a3 != 0;
    int v13 = 13;
    goto LABEL_28;
  }
LABEL_16:
  if ((v12 & 0xFC00) == 0xD800 && a3 + 1 < v11)
  {
    int v16 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
    int v14 = (v16 & 0xFC00) == 56320;
    if ((v16 & 0xFC00) == 0xDC00) {
      int v13 = v16 + (v13 << 10) - 56613888;
    }
  }
  else
  {
    int v14 = 0;
  }
  BOOL v15 = a3 != 0;
  if (a3)
  {
    if ((v13 & 0xFC00) == 0xDC00)
    {
      int v18 = [(__CFString *)v9 characterAtIndex:a3 - 1];
      BOOL v15 = 1;
      if ((v18 & 0xFC00) == 0xD800) {
        int v13 = (v18 << 10) + (unsigned __int16)v13 - 56613888;
      }
    }
  }
LABEL_28:
  if (CFUniCharIsMemberOf())
  {
    uint64_t v19 = a3 - (((v13 & 0xFFFF0000) != 0) & ~v14);
    do
    {
      if (!v19)
      {
        uint64_t v26 = 0;
        goto LABEL_45;
      }
      uint64_t v20 = v19--;
      unsigned int v21 = [(__CFString *)v9 characterAtIndex:v19];
      unsigned int v22 = v21;
      if (v19)
      {
        if ((v21 & 0xFC00) == 0xDC00)
        {
          uint64_t v23 = v20 - 2;
          int v24 = [(__CFString *)v9 characterAtIndex:v23];
          if ((v24 & 0xFC00) == 0xD800)
          {
            uint64_t v19 = v23;
            unsigned int v22 = v22 - 56613888 + (v24 << 10);
          }
        }
      }
    }
    while ((CFUniCharIsMemberOf() & 1) != 0);
    uint64_t v25 = 1;
    if (HIWORD(v22)) {
      uint64_t v25 = 2;
    }
    uint64_t v26 = v25 + v19;
LABEL_45:
    uint64_t v32 = 1;
    if (v14) {
      uint64_t v32 = 2;
    }
    for (unint64_t i = v32 + a3; i < v11; i += v37)
    {
      unsigned int v34 = [(__CFString *)v9 characterAtIndex:i];
      if ((v34 & 0xFC00) == 0xD800 && i + 1 < v11)
      {
        int v36 = -[__CFString characterAtIndex:](v9, "characterAtIndex:");
        if ((v36 & 0xFC00) != 0xDC00) {
          return v26;
        }
        unsigned int v34 = (v34 << 10) - 56613888 + v36;
      }
      if (!CFUniCharIsMemberOf()) {
        break;
      }
      uint64_t v37 = HIWORD(v34) ? 2 : 1;
    }
    return v26;
  }
  BOOL v27 = v11 == a3 && v15;
  BOOL v28 = (void *)[a1 attribute:NSLanguageAttributeName atIndex:a3 - v27 effectiveRange:0];
  CharactersPtr = CFStringGetCharactersPtr(v9);
  if (CharactersPtr)
  {
    int v30 = 0;
    unint64_t v31 = (UniChar *)&CharactersPtr[a4];
    goto LABEL_121;
  }
  if (a5 < 0x100) {
    goto LABEL_119;
  }
  unint64_t v38 = a4 + a5;
  int v66 = v14;
  CFIndex v67 = v28;
  unint64_t v65 = a4 + a5;
  if (a3 > a4)
  {
    if (a3 - a4 >= 0x100) {
      CFIndex v39 = 256;
    }
    else {
      CFIndex v39 = a3 - a4;
    }
    CFIndex v40 = a3 - v39;
    while (1)
    {
      v70.location = v40;
      v70.CFIndex length = v39;
      CFStringGetCharacters(v9, v70, buffer);
      if (v39) {
        break;
      }
LABEL_82:
      if (v40 - a4 >= 0x100) {
        CFIndex v39 = 256;
      }
      else {
        CFIndex v39 = v40 - a4;
      }
      v40 -= v39;
      if (!v39)
      {
        BOOL v28 = v67;
        unint64_t v38 = a4 + a5;
        goto LABEL_90;
      }
    }
    uint64_t v41 = &buffer[v39 - 1];
    while (1)
    {
      unsigned int v42 = *v41;
      if ((v42 & 0xFC00) == 0xDC00)
      {
        if (buffer >= v41)
        {
          if (v40 != a4) {
            ++v40;
          }
LABEL_81:
          int v14 = v66;
          goto LABEL_82;
        }
        int v43 = *(v41 - 1);
        BOOL v44 = (v43 & 0xFC00) == 55296;
        int v45 = v42 - 56613888 + (v43 << 10);
        if (v44) {
          --v41;
        }
        if (v44) {
          unsigned int v42 = v45;
        }
      }
      if (CFUniCharIsMemberOf()) {
        break;
      }
      if (buffer > --v41) {
        goto LABEL_81;
      }
    }
    uint64_t v46 = 1;
    if (HIWORD(v42)) {
      uint64_t v46 = 2;
    }
    a4 = v40 + v41 - buffer + v46;
    unint64_t v38 = v65;
    a5 = v65 - a4;
    int v14 = v66;
    BOOL v28 = v67;
  }
LABEL_90:
  uint64_t v47 = 1;
  if (v14) {
    uint64_t v47 = 2;
  }
  unint64_t v48 = v47 + a3;
  if (v47 + a3 >= v38) {
    goto LABEL_117;
  }
  while (2)
  {
    if (v38 - v48 >= 0x100) {
      CFIndex v49 = 256;
    }
    else {
      CFIndex v49 = v38 - v48;
    }
    v50 = buffer;
    v71.location = v48;
    v71.CFIndex length = v49;
    CFStringGetCharacters(v9, v71, buffer);
    CFIndex v64 = v49;
    CFRange v51 = &buffer[v49];
    while (1)
    {
      if (v50 >= v51)
      {
        uint64_t v57 = v64;
        unint64_t v38 = v65;
        goto LABEL_111;
      }
      v52 = v50 + 1;
      unsigned int v53 = *v50;
      if ((v53 & 0xFC00) == 0xD800) {
        break;
      }
      ++v50;
LABEL_107:
      if (CFUniCharIsMemberOf())
      {
        uint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
        if (HIWORD(v53)) {
          uint64_t v58 = 0x7FFFFFFFFFFFFFFELL;
        }
        a5 = v48 - a4 + &v50[v58] - buffer;
        goto LABEL_116;
      }
    }
    if (v52 < v51)
    {
      int v54 = *v52;
      BOOL v55 = (v54 & 0xFC00) == 56320;
      unsigned int v56 = (v53 << 10) - 56613888 + v54;
      if (v55) {
        v50 += 2;
      }
      else {
        ++v50;
      }
      if (v55) {
        unsigned int v53 = v56;
      }
      goto LABEL_107;
    }
    unint64_t v38 = v65;
    uint64_t v57 = (__PAIR128__(v64, v64 + v48) - v65) >> 64;
LABEL_111:
    v48 += v57;
    if (v48 < v38) {
      continue;
    }
    break;
  }
LABEL_116:
  BOOL v28 = v67;
LABEL_117:
  if (a5 >= 0x100)
  {
    unint64_t v31 = (UniChar *)NSZoneMalloc((NSZone *)[a1 zone], 2 * a5);
    int v30 = 1;
    goto LABEL_120;
  }
LABEL_119:
  int v30 = 0;
  unint64_t v31 = buffer;
LABEL_120:
  v72.location = a4;
  v72.CFIndex length = a5;
  CFStringGetCharacters(v9, v72, v31);
LABEL_121:
  if (a5 == 1)
  {
    unint64_t v59 = a4;
    goto LABEL_137;
  }
  CFIndex v67 = v28;
  if (a3 <= a4)
  {
    unint64_t v60 = 0;
    goto LABEL_130;
  }
  unint64_t v60 = _NSCopyBreakIterator(v28, (uint64_t)v31, a5, 1u);
  if (!v60)
  {
LABEL_130:
    uint64_t v63 = 0;
    goto LABEL_131;
  }
  int v61 = ubrk_preceding();
  if (v61 == -1) {
    int v62 = 0;
  }
  else {
    int v62 = v61;
  }
  uint64_t v63 = v62;
LABEL_131:
  unint64_t v59 = v63 + a4;
  if (a5 - v63 < 2)
  {
    if (v60) {
LABEL_136:
    }
      _NSDisposeBreakIterator(v60, v67, 1);
  }
  else if (v60 || (unint64_t v60 = _NSCopyBreakIterator(v67, (uint64_t)v31, a5, 1u)) != 0)
  {
    ubrk_following();
    goto LABEL_136;
  }
LABEL_137:
  if (v30) {
    NSZoneFree((NSZone *)[a1 zone], v31);
  }
  return v59;
}

- (uint64_t)lineBreakBeforeIndex:()NSAttributedStringUIFoundationAdditions withinRange:
{
  return objc_msgSend(a1, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", a3, a4, a5, 0xFFFFLL);
}

- (uint64_t)containsAttachments
{
  uint64_t v2 = [a1 length];

  return objc_msgSend(a1, "containsAttachmentsInRange:", 0, v2);
}

+ (uint64_t)_documentTypeForFileType:()NSAttributedStringUIFoundationAdditions
{
  if (NSAttributedStringFileTypeToDocumentTypeDictionary_onceToken != -1) {
    dispatch_once(&NSAttributedStringFileTypeToDocumentTypeDictionary_onceToken, &__block_literal_global_207);
  }
  v4 = NSAttributedStringFileTypeToDocumentTypeDictionary___fileTypeToDocTypeDict;

  return [v4 objectForKey:a3];
}

- (__CFString)stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:()NSAttributedStringUIFoundationAdditions
{
  CFStringRef v7 = (__CFString *)[a1 string];
  unint64_t v48 = a1;
  uint64_t v8 = [a1 length];
  uint64_t v9 = _NSAttachmentCharacterSet();
  unint64_t v10 = a3 + a4;
  unint64_t v52 = a3 + a4;
  if (!a4) {
    return &stru_1EDD49F70;
  }
  uint64_t v42 = v8;
  uint64_t v43 = a4;
  uint64_t v44 = v9;
  unint64_t v11 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  unint64_t v46 = a3;
  uint64_t v47 = v7;
  if (a3 < v10)
  {
    int v12 = 0;
    unint64_t v45 = a3 + a4;
    while (1)
    {
      unint64_t v50 = 0;
      unint64_t v51 = 0;
      int v13 = (void *)[v48 attribute:@"NSParagraphStyle" atIndex:a3 effectiveRange:0];
      if (v13) {
        uint64_t v14 = [v13 baseWritingDirection];
      }
      else {
        uint64_t v14 = -1;
      }
      __int16 v49 = 0;
      -[__CFString getParagraphStart:end:contentsEnd:forRange:](v7, "getParagraphStart:end:contentsEnd:forRange:", &v51, &v52, &v50, a3, 0);
      unint64_t v15 = v51;
      if (v51 < a3)
      {
        unint64_t v51 = a3;
        unint64_t v15 = a3;
      }
      if (v50 <= a3) {
        unint64_t v16 = a3;
      }
      else {
        unint64_t v16 = v50;
      }
      if (v16 >= v10) {
        unint64_t v17 = v10;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v50 < a3 || v16 > v10) {
        unint64_t v50 = v17;
      }
      if (v52 > v10) {
        unint64_t v52 = v10;
      }
      if (v14 != -1 && v17 > v15)
      {
        uint64_t v18 = _NSStringImputedBaseWritingDirectionAtIndex(v7, v15, v15, v17 - v15);
        if (v18 != -1 && v18 != v14)
        {
          if (v14 == 1) {
            __int16 v20 = 8207;
          }
          else {
            __int16 v20 = 8206;
          }
          __int16 v49 = v20;
          if (!v12) {
            int v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v46, v51 - v46));
          }
          objc_msgSend(v12, "appendString:", objc_msgSend(NSString, "stringWithCharacters:length:", &v49, 1));
        }
      }
      unint64_t v21 = v50;
      unint64_t v22 = v51;
      if (v51 < v50) {
        break;
      }
      if (v12)
      {
        __int16 v49 = 8236;
LABEL_67:
        if (v52 > v21) {
          objc_msgSend(v12, "appendString:", -[__CFString substringWithRange:](v7, "substringWithRange:"));
        }
        unint64_t v11 = v12;
        goto LABEL_71;
      }
      unint64_t v11 = 0;
LABEL_71:
      a3 = v52;
      int v12 = v11;
      unint64_t v10 = v45;
      if (v52 >= v45) {
        goto LABEL_72;
      }
    }
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    do
    {
      while (1)
      {
        uint64_t v25 = objc_msgSend(v48, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSWritingDirection", v22, &v53, v22, v21 - v22);
        unint64_t v26 = [v25 count];
        unint64_t v27 = v26;
        unint64_t v28 = 0;
        if (v24 >= v26) {
          unint64_t v29 = v26;
        }
        else {
          unint64_t v29 = v24;
        }
        if (v29)
        {
          while (objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", v28), "isEqual:", objc_msgSend(v23, "objectAtIndex:", v28)))
          {
            if (v29 == ++v28)
            {
              unint64_t v28 = v29;
              break;
            }
          }
          CFStringRef v7 = v47;
        }
        if (v24 | v27) {
          BOOL v30 = v12 == 0;
        }
        else {
          BOOL v30 = 0;
        }
        if (v30) {
          int v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v46, v22 - v46));
        }
        __int16 v49 = 8236;
        BOOL v31 = v24 > v28;
        unint64_t v32 = v24 - v28;
        if (v31)
        {
          do
          {
            objc_msgSend(v12, "appendString:", objc_msgSend(NSString, "stringWithCharacters:length:", &v49, 1));
            --v32;
          }
          while (v32);
        }
        if (v28 < v27)
        {
          do
          {
            __int16 v49 = 8234;
            char v33 = objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", v28), "unsignedIntegerValue");
            if (v33) {
              ++v49;
            }
            if ((v33 & 2) != 0) {
              v49 += 3;
            }
            objc_msgSend(v12, "appendString:", objc_msgSend(NSString, "stringWithCharacters:length:", &v49, 1));
            ++v28;
          }
          while (v27 != v28);
        }
        if (v12) {
          break;
        }
        unint64_t v11 = 0;
        v22 += v54;
        unint64_t v21 = v50;
        uint64_t v23 = v25;
        unint64_t v24 = v27;
        if (v22 >= v50) {
          goto LABEL_71;
        }
      }
      objc_msgSend(v12, "appendString:", -[__CFString substringWithRange:](v7, "substringWithRange:", v53, v54));
      v22 += v54;
      unint64_t v21 = v50;
      uint64_t v23 = v25;
      unint64_t v24 = v27;
    }
    while (v22 < v50);
    __int16 v49 = 8236;
    if (v27)
    {
      do
      {
        objc_msgSend(v12, "appendString:", objc_msgSend(NSString, "stringWithCharacters:length:", &v49, 1));
        --v27;
      }
      while (v27);
      unint64_t v21 = v50;
    }
    goto LABEL_67;
  }
LABEL_72:
  if (-[__CFString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v44, 0, v46, v43) == 0x7FFFFFFFFFFFFFFFLL|| !v34)
  {
    if (!v11)
    {
      if (v46 || v43 != v42) {
        return (__CFString *)-[__CFString substringWithRange:](v47, "substringWithRange:", v46, v43);
      }
      else {
        return v47;
      }
    }
  }
  else
  {
    if (!v11)
    {
      unint64_t v35 = (void *)MEMORY[0x1E4F28E78];
      if (v46 || v43 != v42) {
        uint64_t v36 = -[__CFString substringWithRange:](v47, "substringWithRange:", v46, v43);
      }
      else {
        uint64_t v36 = (uint64_t)v47;
      }
      unint64_t v11 = (void *)[v35 stringWithString:v36];
    }
    uint64_t v37 = [v11 rangeOfCharacterFromSet:v44];
    if (v37 != 0x7FFFFFFFFFFFFFFFLL && v38)
    {
      uint64_t v39 = v37;
      do
      {
        objc_msgSend(v11, "replaceCharactersInRange:withString:", v39, v38, &stru_1EDD49F70);
        uint64_t v40 = [v11 rangeOfCharacterFromSet:v44];
        if (v40 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v39 = v40;
      }
      while (v38);
    }
  }
  return (__CFString *)v11;
}

- (id)dataFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:
{
  id v32 = 0;
  uint64_t v11 = [a5 objectForKey:@"DocumentType"];
  if (a3 || (int v12 = a1, a4 != [a1 length])) {
    int v12 = objc_msgSend(a1, "attributedSubstringFromRange:", a3, a4);
  }
  BOOL v31 = 0;
  if (!v11)
  {
    uint64_t v13 = [a5 objectForKey:@"UTI"];
    if (v13) {
      uint64_t v11 = [MEMORY[0x1E4F28B18] _documentTypeForFileType:v13];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  if (![@"NSPlainText" isEqual:v11])
  {
    if ([@"NSRTF" isEqual:v11])
    {
      uint64_t v18 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
      if (v18)
      {
        unint64_t v24 = v18;
        if (a5) {
          -[NSRTFWriter setDocumentAttributes:]((uint64_t)v18, a5);
        }
        uint64_t v25 = (void *)[a5 objectForKey:@"TextScaling"];
        unint64_t v26 = (void *)[a5 objectForKey:@"SourceTextScaling"];
        if (v26 && v25)
        {
          -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v24, [v26 integerValue]);
          -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v24, [v25 integerValue]);
        }
        id v27 = (id)-[NSRTFWriter RTF]((uint64_t)v24);
        goto LABEL_48;
      }
LABEL_50:
      id v19 = 0;
      goto LABEL_51;
    }
    if ([@"NSRTFD" isEqual:v11])
    {
      uint64_t v18 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
      if (!v18) {
        goto LABEL_50;
      }
      unint64_t v24 = v18;
      if (a5) {
        -[NSRTFWriter setDocumentAttributes:]((uint64_t)v18, a5);
      }
      unint64_t v28 = (void *)[a5 objectForKey:@"TextScaling"];
      unint64_t v29 = (void *)[a5 objectForKey:@"SourceTextScaling"];
      if (v29 && v28)
      {
        -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v24, [v29 integerValue]);
        -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v24, [v28 integerValue]);
      }
      id v27 = (id)-[NSRTFWriter RTFD]((uint64_t)v24);
    }
    else if ([@"NSHTML" isEqual:v11])
    {
      uint64_t v18 = [[NSHTMLWriter alloc] initWithAttributedString:v12];
      if (!v18) {
        goto LABEL_50;
      }
      unint64_t v24 = v18;
      if (a5) {
        [(NSHTMLWriter *)v18 setDocumentAttributes:a5];
      }
      id v27 = [(NSHTMLWriter *)v24 HTMLData];
    }
    else
    {
      if (![@"NSWebArchive" isEqual:v11])
      {
        if (!a6) {
          return 0;
        }
        uint64_t v18 = (NSHTMLWriter *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:66062 userInfo:0];
        id v19 = 0;
        BOOL v31 = v18;
        goto LABEL_52;
      }
      uint64_t v18 = [[NSHTMLWriter alloc] initWithAttributedString:v12];
      if (!v18) {
        goto LABEL_50;
      }
      unint64_t v24 = v18;
      if (a5) {
        [(NSHTMLWriter *)v18 setDocumentAttributes:a5];
      }
      id v27 = [(NSHTMLWriter *)v24 webArchiveData];
    }
LABEL_48:
    id v19 = v27;
    id v32 = v19;

    uint64_t v18 = 0;
    if (!a6) {
      return v19;
    }
    goto LABEL_52;
  }
  unint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"CharacterEncoding"), "unsignedIntegerValue");
  if (!v14) {
    unint64_t v14 = [NSString defaultCStringEncoding];
  }
  CFStringEncoding v15 = CFStringConvertNSStringEncodingToEncoding(v14);
  if (v15 != 1586 && (v15 & 0xFFF) != 0x100
    || (unint64_t v16 = objc_msgSend(a1, "stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:", a3, a4)) == 0)
  {
    unint64_t v16 = (void *)[v12 string];
  }
  if (a6) {
    unint64_t v17 = &v31;
  }
  else {
    unint64_t v17 = 0;
  }
  [v16 getExternalRepresentation:&v32 extendedAttributes:0 forWritingToURLOrPath:0 usingEncoding:v14 error:v17];
  uint64_t v18 = v31;
  id v19 = v32;
  if (!a6 || v32 || v31)
  {
LABEL_51:
    if (!a6) {
      return v19;
    }
    goto LABEL_52;
  }
  __int16 v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F281F8];
  unint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v14];
  uint64_t v18 = (NSHTMLWriter *)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 517, objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, *MEMORY[0x1E4F28908], 0));
  BOOL v31 = v18;
  id v19 = v32;
LABEL_52:
  if (!v19)
  {
    if (v18)
    {
      id v19 = 0;
    }
    else
    {
      uint64_t v18 = (NSHTMLWriter *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
      id v19 = v32;
    }
    *a6 = v18;
  }
  return v19;
}

- (void)fileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:error:
{
  uint64_t v11 = [a5 objectForKey:@"DocumentType"];
  if (a3 || (int v12 = a1, a4 != [a1 length])) {
    int v12 = objc_msgSend(a1, "attributedSubstringFromRange:", a3, a4);
  }
  uint64_t v37 = 0;
  if (!v11)
  {
    uint64_t v13 = [a5 objectForKey:@"UTI"];
    if (v13) {
      uint64_t v11 = [MEMORY[0x1E4F28B18] _documentTypeForFileType:v13];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  if ([@"NSPlainText" isEqual:v11])
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"CharacterEncoding"), "unsignedIntegerValue");
    if (!v14) {
      unint64_t v14 = [NSString defaultCStringEncoding];
    }
    CFStringEncoding v15 = CFStringConvertNSStringEncodingToEncoding(v14);
    if (v15 != 1586 && (v15 & 0xFFF) != 0x100
      || (unint64_t v16 = objc_msgSend(a1, "stringByStrippingAttachmentCharactersAndConvertingWritingDirectionToBidiControlCharactersFromRange:", a3, a4)) == 0)
    {
      unint64_t v16 = (void *)[v12 string];
    }
    if (a6) {
      unint64_t v17 = &v37;
    }
    else {
      unint64_t v17 = 0;
    }
    uint64_t v18 = 0;
    if ([v16 getExternalRepresentation:&v36 extendedAttributes:&v35 forWritingToURLOrPath:0 usingEncoding:v14 error:v17])
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28CF0]);
      __int16 v20 = (id)[v19 initRegularFileWithContents:v36];
      uint64_t v18 = v20;
      if (v35)
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v20, "fileAttributes"));
        [v21 setObject:v35 forKey:*MEMORY[0x1E4F282C8]];
        [v18 setFileAttributes:v21];
      }
    }
    if (a6 && !v18 && !v37)
    {
      unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F281F8];
      unint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:v14];
      uint64_t v37 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 517, objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, *MEMORY[0x1E4F28908], 0));
    }
    goto LABEL_45;
  }
  if ([@"NSRTFD" isEqual:v11])
  {
    unint64_t v26 = (NSHTMLWriter *)-[NSRTFWriter initWithAttributedString:]([NSRTFWriter alloc], v12);
    if (v26)
    {
      id v27 = v26;
      if (a5) {
        -[NSRTFWriter setDocumentAttributes:]((uint64_t)v26, a5);
      }
      unint64_t v28 = (void *)[a5 objectForKey:@"TextScaling"];
      unint64_t v29 = (void *)[a5 objectForKey:@"SourceTextScaling"];
      if (v29 && v28)
      {
        -[NSRTFWriter _setTextScalingConversionSource:]((uint64_t)v27, [v29 integerValue]);
        -[NSRTFWriter _setTextScalingConversionTarget:]((uint64_t)v27, [v28 integerValue]);
      }
      BOOL v30 = -[NSRTFWriter RTFDFileWrapper](v27);
LABEL_38:
      uint64_t v18 = v30;

      goto LABEL_45;
    }
    goto LABEL_39;
  }
  if ([@"NSHTML" isEqual:v11])
  {
    BOOL v31 = [[NSHTMLWriter alloc] initWithAttributedString:v12];
    if (v31)
    {
      id v27 = v31;
      if (a5) {
        [(NSHTMLWriter *)v31 setDocumentAttributes:a5];
      }
      BOOL v30 = [(NSHTMLWriter *)v27 HTMLFileWrapper];
      goto LABEL_38;
    }
LABEL_39:
    uint64_t v18 = 0;
    goto LABEL_45;
  }
  if (a6) {
    id v32 = &v37;
  }
  else {
    id v32 = 0;
  }
  uint64_t v18 = objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, a5, v32);
  if (v18) {
    uint64_t v18 = (id)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:v18];
  }
LABEL_45:
  if (a6 && !v18)
  {
    uint64_t v33 = v37;
    if (!v37) {
      uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];
    }
    *a6 = v33;
  }
  return v18;
}

- (uint64_t)RTFFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  [v8 setObject:@"NSRTF" forKey:@"DocumentType"];

  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)RTFDFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  [v8 setObject:@"NSRTFD" forKey:@"DocumentType"];

  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)RTFDFileWrapperFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  [v8 setObject:@"NSRTFD" forKey:@"DocumentType"];

  return objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)docFormatFromRange:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return 0;
}

- (uint64_t)_htmlDocumentFragmentString:()NSAttributedStringUIFoundationAdditions documentAttributes:subresources:
{
  unint64_t v10 = a1;
  if (a3 || a4 != [a1 length]) {
    unint64_t v10 = objc_msgSend(v10, "attributedSubstringFromRange:", a3, a4);
  }
  uint64_t v11 = [[NSHTMLWriter alloc] initWithAttributedString:v10];
  if (!v11) {
    return 0;
  }
  int v12 = v11;
  if (a5) {
    [(NSHTMLWriter *)v11 setDocumentAttributes:a5];
  }
  uint64_t v13 = [(NSHTMLWriter *)v12 documentFragmentString];
  if (a6) {
    *a6 = [(NSHTMLWriter *)v12 subresources];
  }

  return v13;
}

- (uint64_t)_documentFromRange:()NSAttributedStringUIFoundationAdditions document:documentAttributes:subresources:
{
  int v12 = a1;
  if (a3 || a4 != [a1 length]) {
    int v12 = objc_msgSend(v12, "attributedSubstringFromRange:", a3, a4);
  }
  uint64_t v13 = [[NSHTMLWriter alloc] initWithAttributedString:v12];
  if (!v13) {
    return 0;
  }
  unint64_t v14 = v13;
  if (a6) {
    [(NSHTMLWriter *)v13 setDocumentAttributes:a6];
  }
  uint64_t v15 = [(NSHTMLWriter *)v14 documentFragmentForDocument:a5];
  if (a7) {
    *a7 = [(NSHTMLWriter *)v14 subresources];
  }

  return v15;
}

- (id)initWithData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  v17.receiver = a1;
  v17.super_class = (Class)NSAttributedString_0;
  id v10 = objc_msgSendSuper2(&v17, sel_init);
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = (void *)[v10 init];
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = _NSReadAttributedStringFromURLOrData(v11, 0, a3, a4, a5, a6);
    uint64_t v13 = (void *)v12;
    if (!v12) {
      goto LABEL_9;
    }
    if ((id)v12 != v10)
    {
      uint64_t v14 = objc_opt_class();
      if (v14 != objc_opt_class())
      {
        uint64_t v15 = [v10 initWithAttributedString:v13];
        id v10 = v13;
        uint64_t v13 = (void *)v15;
      }
LABEL_9:

      return v13;
    }
  }
  return v10;
}

- (void)_initWithRTFSelector:()NSAttributedStringUIFoundationAdditions argument:documentAttributes:
{
  v19.receiver = a1;
  v19.super_class = (Class)NSAttributedString_0;
  id v8 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = -[NSRTFReader performSelector:withObject:](+[NSRTFReader allocWithZone:](NSRTFReader, "allocWithZone:", [v8 zone]), "performSelector:withObject:", a3, a4);
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 init];
        [v11 setMutableAttributedString:v9];
      }
      uint64_t v12 = [v11 attributedString];
      if (v12)
      {
        uint64_t v13 = (void *)v12;
        if ((void *)v12 != v9)
        {
          uint64_t v14 = objc_opt_class();
          if (v14 == objc_opt_class())
          {

            id v15 = v13;
          }
          else
          {
            id v15 = (id)[v9 initWithAttributedString:v13];
          }
          uint64_t v9 = v15;
        }
        if (a5)
        {
          unint64_t v16 = (void *)[v11 documentAttributes];
          if (v16) {
            id v17 = (id)[v16 mutableCopy];
          }
          else {
            id v17 = (id)[MEMORY[0x1E4F1CA60] dictionary];
          }
          *a5 = v17;
        }
        goto LABEL_18;
      }
    }
    uint64_t v11 = v9;
    uint64_t v9 = 0;
LABEL_18:
  }
  return v9;
}

- (uint64_t)initWithRTF:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"NSRTF", @"DocumentType", 0);

  return [a1 initWithData:a3 options:v7 documentAttributes:a4 error:0];
}

- (uint64_t)initWithRTFD:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"NSRTFD", @"DocumentType", 0);

  return [a1 initWithData:a3 options:v7 documentAttributes:a4 error:0];
}

- (uint64_t)initWithRTFDFileWrapper:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return [a1 _initWithRTFSelector:sel_initWithRTFDFileWrapper_ argument:a3 documentAttributes:a4];
}

- (uint64_t)initWithDocFormat:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return 0;
}

- (id)initWithURL:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  v19.receiver = a1;
  v19.super_class = (Class)NSAttributedString_0;
  id v10 = objc_msgSendSuper2(&v19, sel_init);
  if (v10)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a4];
    uint64_t v12 = v11;
    if (a3 && ![v11 objectForKey:@"BaseURL"]) {
      [v12 setObject:a3 forKey:@"BaseURL"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = (void *)[v10 init];
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = _NSReadAttributedStringFromURLOrData(v13, a3, 0, v12, a5, a6);
    id v15 = (void *)v14;
    if (!v14) {
      goto LABEL_12;
    }
    if ((id)v14 != v10)
    {
      uint64_t v16 = objc_opt_class();
      if (v16 != objc_opt_class())
      {
        uint64_t v17 = [v10 initWithAttributedString:v15];
        id v10 = v15;
        id v15 = (void *)v17;
      }
LABEL_12:

      return v15;
    }
  }
  return v10;
}

- (uint64_t)_initWithURLFunnel:()NSAttributedStringUIFoundationAdditions options:documentAttributes:
{
  return [a1 initWithURL:a3 options:a4 documentAttributes:a5 error:0];
}

- (uint64_t)initWithURL:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return [a1 initWithURL:a3 options:0 documentAttributes:a4 error:0];
}

- (uint64_t)initWithPath:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");

  return [a1 initWithURL:v6 options:0 documentAttributes:a4 error:0];
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions options:documentAttributes:
{
  id v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a4];
  [v8 setObject:@"NSHTML" forKey:@"DocumentType"];

  return [a1 initWithData:a3 options:v8 documentAttributes:a5 error:0];
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions documentAttributes:
{
  return [a1 initWithHTML:a3 options:0 documentAttributes:a4];
}

- (uint64_t)initWithHTML:()NSAttributedStringUIFoundationAdditions baseURL:documentAttributes:
{
  if (a4) {
    a4 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, @"BaseURL", 0);
  }

  return [a1 initWithHTML:a3 options:a4 documentAttributes:a5];
}

+ (_NSAttributedStringAsyncReadReply)readFromURL:()NSAttributedStringUIFoundationAdditions options:completionHandler:
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromURL_options_completionHandler___block_invoke;
  v6[3] = &unk_1E55C6658;
  v6[4] = a1;
  v6[5] = a5;
  return _NSReadAttributedStringFromURLOrDataAsync(a3, 0, a4, (uint64_t)v6);
}

+ (_NSAttributedStringAsyncReadReply)readFromData:()NSAttributedStringUIFoundationAdditions options:completionHandler:
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__NSAttributedString_NSAttributedStringUIFoundationAdditions__readFromData_options_completionHandler___block_invoke;
  v6[3] = &unk_1E55C6658;
  v6[4] = a1;
  v6[5] = a5;
  return _NSReadAttributedStringFromURLOrDataAsync(0, a3, a4, (uint64_t)v6);
}

- (id)_initWithHTMLData:()NSAttributedStringUIFoundationAdditions options:documentAttributes:error:
{
  v14.receiver = a1;
  v14.super_class = (Class)NSAttributedString_0;
  id v10 = objc_msgSendSuper2(&v14, sel_init);
  if (v10)
  {
    id v13 = 0;
    if (_NSReadAttributedStringFromHTMLData(a3, a4, 0, &v13, a5, a6))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (id)[v10 init];
        [v10 setAttributedString:v13];
      }
      else
      {
        uint64_t v11 = objc_opt_class();
        if (v11 == objc_opt_class())
        {

          return v13;
        }
        id v10 = (id)[v10 initWithAttributedString:v13];
      }
    }
    else
    {

      return 0;
    }
  }
  return v10;
}

+ (uint64_t)fontStyleAttributeNames
{
  v1[19] = *MEMORY[0x1E4F143B8];
  v1[0] = @"NSFont";
  v1[1] = @"NSColor";
  v1[2] = @"NSUnderline";
  v1[3] = @"NSSuperScript";
  v1[4] = @"NSBackgroundColor";
  v1[5] = @"NSLigature";
  v1[6] = @"NSBaselineOffset";
  v1[7] = @"NSKern";
  v1[8] = @"NSStrokeWidth";
  v1[9] = @"NSStrokeColor";
  v1[10] = @"NSUnderlineColor";
  v1[11] = @"NSStrikethrough";
  v1[12] = @"NSStrikethroughColor";
  v1[13] = @"NSShadow";
  v1[14] = @"NSObliqueness";
  v1[15] = @"NSExpansion";
  v1[16] = NSTypographyFeatureAttributeName;
  v1[17] = @"NSTextHighlightStyle";
  v1[18] = @"NSTextHighlightColorScheme";
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:19];
}

- (id)fontAttributesInRange:()NSAttributedStringUIFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[a1 attributesAtIndex:a3 effectiveRange:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(), "fontStyleAttributeNames", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        if (v11)
        {
          uint64_t v12 = v11;
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v7 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  if (v7) {
    return v7;
  }
  else {
    return (id)MEMORY[0x1E4F1CC08];
  }
}

- (id)rulerAttributesInRange:()NSAttributedStringUIFoundationAdditions
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a3, 0), "objectForKey:", @"NSParagraphStyle");
  if (v3) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, @"NSParagraphStyle", 0);
  }

  return +[NSAttributeDictionary emptyAttributeDictionary];
}

- (uint64_t)rangeOfTextBlock:()NSAttributedStringUIFoundationAdditions atIndex:
{
  uint64_t v5 = a1;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v6 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:&v38];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = v6;
  uint64_t v8 = (void *)[v6 textBlocks];
  uint64_t v9 = [v8 indexOfObjectIdenticalTo:a3];
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8) {
    BOOL v11 = v9 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = v9;
    uint64_t v10 = v38;
    unint64_t v13 = v39 + v38;
    uint64_t v36 = v5;
    unint64_t v37 = [v5 length];
    unint64_t v35 = v13;
    if (v10)
    {
      long long v14 = v7;
      do
      {
        long long v15 = objc_msgSend(v5, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v10 - 1, &v38, v35);
        long long v16 = v15;
        if (v15 == v14)
        {
          BOOL v23 = 1;
        }
        else if (v15 {
               && (long long v17 = (void *)[v15 textBlocks]) != 0
        }
               && (uint64_t v18 = v17, [v17 count] > v12))
        {
          unint64_t v19 = 1;
          do
          {
            uint64_t v20 = [v8 objectAtIndex:v19 - 1];
            uint64_t v21 = [v18 objectAtIndex:v19 - 1];
          }
          while (v20 == v21 && v19++ <= v12);
          BOOL v23 = v20 == v21;
          uint64_t v5 = v36;
        }
        else
        {
          BOOL v23 = 0;
        }
        if (v23)
        {
          long long v14 = v16;
          uint64_t v10 = v38;
        }
        if (v10) {
          BOOL v24 = !v23;
        }
        else {
          BOOL v24 = 1;
        }
      }
      while (!v24);
    }
    for (unint64_t i = v35; i < v37; unint64_t i = v39 + v38)
    {
      unint64_t v26 = v7;
      id v27 = (void *)[v5 attribute:@"NSParagraphStyle" atIndex:i effectiveRange:&v38];
      id v7 = v27;
      if (v27 != v26)
      {
        if (!v27) {
          break;
        }
        unint64_t v28 = (void *)[v27 textBlocks];
        if (!v28) {
          break;
        }
        unint64_t v29 = v28;
        if ([v28 count] <= v12) {
          break;
        }
        unint64_t v30 = 1;
        do
        {
          uint64_t v31 = objc_msgSend(v8, "objectAtIndex:", v30 - 1, v35);
          uint64_t v32 = [v29 objectAtIndex:v30 - 1];
        }
        while (v31 == v32 && v30++ <= v12);
        uint64_t v5 = v36;
        if (v31 != v32) {
          break;
        }
      }
    }
  }
  return v10;
}

- (uint64_t)rangeOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  uint64_t v5 = a1;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v6 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:&v46];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = v6;
  uint64_t v8 = (void *)[v6 textBlocks];
  uint64_t v9 = [v8 count];
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    unint64_t v11 = v9;
    unint64_t v12 = 1;
    do
    {
      unint64_t v13 = v12 - 1;
      long long v14 = (void *)[v8 objectAtIndex:v12 - 1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v14 table] != a3) {
          unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v12 >= v11) {
        break;
      }
      ++v12;
    }
    while (v13 == 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 && v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v44 = a3;
      uint64_t v10 = v46;
      unint64_t v15 = v47 + v46;
      unint64_t v45 = [v5 length];
      uint64_t v42 = v7;
      if (v10)
      {
        long long v16 = v7;
        uint64_t v43 = v5;
        do
        {
          long long v17 = (void *)[v5 attribute:@"NSParagraphStyle" atIndex:v10 - 1 effectiveRange:&v46];
          uint64_t v18 = v17;
          if (v17 == v16)
          {
            BOOL v25 = 1;
          }
          else
          {
            if (!v17) {
              goto LABEL_31;
            }
            unint64_t v19 = (void *)[v17 textBlocks];
            if (!v19) {
              goto LABEL_31;
            }
            uint64_t v20 = v19;
            if ([v19 count] <= v13) {
              goto LABEL_31;
            }
            if (v13)
            {
              unint64_t v21 = 1;
              do
              {
                uint64_t v22 = [v8 objectAtIndex:v21 - 1];
                uint64_t v23 = [v20 objectAtIndex:v21 - 1];
              }
              while (v22 == v23 && v21++ < v13);
              BOOL v25 = v22 == v23;
              uint64_t v5 = v43;
            }
            else
            {
              BOOL v25 = 1;
            }
            unint64_t v26 = (void *)[v20 objectAtIndex:v13];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v26 table] != v44) {
LABEL_31:
            }
              BOOL v25 = 0;
          }
          if (v25)
          {
            long long v16 = v18;
            uint64_t v10 = v46;
          }
          if (v10) {
            BOOL v27 = !v25;
          }
          else {
            BOOL v27 = 1;
          }
        }
        while (!v27);
      }
      unint64_t v28 = v15;
      if (v15 < v45)
      {
        unint64_t v29 = v42;
        do
        {
          unint64_t v30 = v29;
          uint64_t v31 = (void *)[v5 attribute:@"NSParagraphStyle" atIndex:v28 effectiveRange:&v46];
          unint64_t v29 = v31;
          if (v31 != v30)
          {
            if (!v31) {
              break;
            }
            uint64_t v32 = (void *)[v31 textBlocks];
            if (!v32) {
              break;
            }
            uint64_t v33 = v32;
            if ([v32 count] <= v13) {
              break;
            }
            if (v13)
            {
              unint64_t v34 = 1;
              do
              {
                uint64_t v35 = [v8 objectAtIndex:v34 - 1];
                uint64_t v36 = [v33 objectAtIndex:v34 - 1];
              }
              while (v35 == v36 && v34++ < v13);
              BOOL v38 = v35 == v36;
            }
            else
            {
              BOOL v38 = 1;
            }
            uint64_t v39 = (void *)[v33 objectAtIndex:v13];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            uint64_t v40 = [v39 table];
            if (!v38 || v40 != v44) {
              break;
            }
          }
          unint64_t v28 = v47 + v46;
        }
        while (v47 + v46 < v45);
      }
    }
  }
  return v10;
}

- (uint64_t)_atStartOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  v25[0] = 0;
  v25[1] = 0;
  id v7 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:v25];
  if (v7) {
    BOOL v8 = v25[0] == a4;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v7;
  unint64_t v11 = (void *)[v7 textBlocks];
  uint64_t result = [v11 count];
  if (result)
  {
    unint64_t v12 = result;
    unint64_t v13 = 1;
    do
    {
      unint64_t v14 = v13 - 1;
      unint64_t v15 = (void *)[v11 objectAtIndex:v13 - 1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v15 table] != a3) {
          unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v13 >= v12) {
        break;
      }
      ++v13;
    }
    while (v14 == 0x7FFFFFFFFFFFFFFFLL);
    uint64_t result = 0;
    if (v11)
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v25[0])
        {
          long long v16 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:v25[0] - 1 effectiveRange:v25];
          if (v16 == v10)
          {
            BOOL v22 = 1;
            return !v22;
          }
          if (v16)
          {
            long long v17 = (void *)[v16 textBlocks];
            if (v17)
            {
              uint64_t v18 = v17;
              if ([v17 count] > v14)
              {
                if (v14)
                {
                  unint64_t v19 = 1;
                  do
                  {
                    uint64_t v20 = [v11 objectAtIndex:v19 - 1];
                    uint64_t v21 = [v18 objectAtIndex:v19 - 1];
                    BOOL v22 = v20 == v21;
                  }
                  while (v20 == v21 && v19++ < v14);
                }
                else
                {
                  BOOL v22 = 1;
                }
                BOOL v24 = (void *)[v18 objectAtIndex:v14];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && [v24 table] == a3) {
                  return !v22;
                }
              }
            }
          }
        }
        BOOL v22 = 0;
        return !v22;
      }
    }
  }
  return result;
}

- (void)_atEndOfTextTable:()NSAttributedStringUIFoundationAdditions atIndex:
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t result = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:&v24];
  if (result)
  {
    if (a4 + 1 != v25 + v24) {
      return 0;
    }
    BOOL v8 = result;
    uint64_t v9 = (void *)[result textBlocks];
    uint64_t result = (void *)[v9 count];
    if (result)
    {
      unint64_t v10 = (unint64_t)result;
      unint64_t v11 = 1;
      do
      {
        unint64_t v12 = v11 - 1;
        unint64_t v13 = (void *)[v9 objectAtIndex:v11 - 1];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v13 table] != a3) {
            unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v11 >= v10) {
          break;
        }
        ++v11;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = 0;
      if (v9)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v14 = v25 + v24;
          if (v14 < [a1 length])
          {
            unint64_t v15 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:v14 effectiveRange:&v24];
            if (v15 == v8)
            {
              BOOL v21 = 1;
              return (void *)!v21;
            }
            if (v15)
            {
              long long v16 = (void *)[v15 textBlocks];
              if (v16)
              {
                long long v17 = v16;
                if ([v16 count] > v12)
                {
                  if (v12)
                  {
                    unint64_t v18 = 1;
                    do
                    {
                      uint64_t v19 = [v9 objectAtIndex:v18 - 1];
                      uint64_t v20 = [v17 objectAtIndex:v18 - 1];
                      BOOL v21 = v19 == v20;
                    }
                    while (v19 == v20 && v18++ < v12);
                  }
                  else
                  {
                    BOOL v21 = 1;
                  }
                  uint64_t v23 = (void *)[v17 objectAtIndex:v12];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 table] == a3) {
                    return (void *)!v21;
                  }
                }
              }
            }
          }
          BOOL v21 = 0;
          return (void *)!v21;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:completeRow:
{
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  id v7 = objc_msgSend(a1, "attribute:atIndex:effectiveRange:");
  uint64_t v8 = [a3 numberOfColumns];
  if (!v7)
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    char v37 = 1;
    if (!a5) {
      return v12;
    }
    goto LABEL_52;
  }
  uint64_t v9 = v8;
  unint64_t v10 = (void *)[v7 textBlocks];
  uint64_t v11 = [v10 count];
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
  {
    unint64_t v13 = v11;
    uint64_t v44 = v7;
    uint64_t v46 = 0;
    uint64_t v40 = v9;
    uint64_t v14 = 0;
    unint64_t v15 = 1;
    char v16 = 1;
    do
    {
      unint64_t v17 = v15 - 1;
      unint64_t v18 = (void *)[v10 objectAtIndex:v15 - 1];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (void *)[v18 table] == a3)
      {
        uint64_t v46 = [v18 startingRow];
        uint64_t v14 = [v18 columnSpan];
        if ([v18 rowSpan] > 1) {
          char v16 = 0;
        }
      }
      else
      {
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v15 >= v13) {
        break;
      }
      ++v15;
    }
    while (v17 == 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v10 && v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v39 = v14;
      uint64_t v12 = v48;
      unint64_t v43 = v49 + v48;
      unint64_t v42 = [a1 length];
      [v10 objectAtIndex:v17];
      uint64_t v41 = a5;
      uint64_t v19 = [v10 objectAtIndex:v17];
      unint64_t v20 = v43;
      if (v43 < v42)
      {
        BOOL v21 = (void *)v19;
        BOOL v22 = a5;
        uint64_t v23 = v39;
        uint64_t v24 = v44;
        while (1)
        {
          uint64_t v25 = v24;
          uint64_t v24 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:v20 effectiveRange:&v48];
          if (v24 != v25) {
            break;
          }
          unint64_t v34 = v42;
LABEL_42:
          unint64_t v20 = v49 + v48;
          if (v49 + v48 >= v34) {
            goto LABEL_48;
          }
        }
        if (!v24) {
          goto LABEL_48;
        }
        unint64_t v45 = v24;
        unint64_t v26 = (void *)[v24 textBlocks];
        if (!v26) {
          goto LABEL_48;
        }
        BOOL v27 = v26;
        if ([v26 count] <= v17) {
          goto LABEL_48;
        }
        if (v17)
        {
          unint64_t v28 = 1;
          do
          {
            uint64_t v29 = [v10 objectAtIndex:v28 - 1];
            uint64_t v30 = [v27 objectAtIndex:v28 - 1];
          }
          while (v29 == v30 && v28++ < v17);
          BOOL v32 = v29 == v30;
          BOOL v33 = v29 == v30;
          BOOL v22 = v41;
          if (!v32) {
            goto LABEL_40;
          }
        }
        else
        {
          BOOL v33 = 1;
        }
        uint64_t v35 = [v27 objectAtIndex:v17];
        if ((void *)v35 != v21)
        {
          uint64_t v36 = (void *)v35;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (void *)[v36 table] != a3
            || [v36 startingRow] != v46)
          {
            goto LABEL_48;
          }
          v23 += [v36 columnSpan];
          if ([v36 rowSpan] > 1) {
            char v16 = 0;
          }
          goto LABEL_41;
        }
LABEL_40:
        uint64_t v36 = v21;
LABEL_41:
        unint64_t v34 = v42;
        BOOL v21 = v36;
        uint64_t v24 = v45;
        if (!v33) {
          goto LABEL_48;
        }
        goto LABEL_42;
      }
      BOOL v22 = a5;
      uint64_t v23 = v39;
LABEL_48:
      if (v23 != v40) {
        char v16 = 0;
      }
      a5 = v22;
    }
  }
  else
  {
    char v16 = 1;
  }
  char v37 = v16;
  if (a5) {
LABEL_52:
  }
    *a5 = v37;
  return v12;
}

- (uint64_t)_rangeOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  return [a1 _rangeOfTextTableRow:a3 atIndex:a4 completeRow:0];
}

- (uint64_t)_atStartOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  v27[0] = 0;
  v27[1] = 0;
  id v7 = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:v27];
  if (v7) {
    BOOL v8 = v27[0] == a4;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return 0;
  }
  unint64_t v10 = v7;
  uint64_t v11 = (void *)[v7 textBlocks];
  uint64_t result = [v11 count];
  if (result)
  {
    unint64_t v12 = result;
    uint64_t v25 = a1;
    uint64_t v26 = 0;
    unint64_t v13 = 1;
    do
    {
      unint64_t v14 = v13 - 1;
      unint64_t v15 = objc_msgSend(v11, "objectAtIndex:", v13 - 1, v25);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 table] == a3) {
        uint64_t v26 = [v15 startingRow];
      }
      else {
        unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v13 >= v12) {
        break;
      }
      ++v13;
    }
    while (v14 == 0x7FFFFFFFFFFFFFFFLL);
    uint64_t result = 0;
    if (v11)
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v27[0])
        {
          char v16 = (void *)[v25 attribute:@"NSParagraphStyle" atIndex:v27[0] - 1 effectiveRange:v27];
          if (v16 == v10)
          {
            BOOL v22 = 1;
            return !v22;
          }
          if (v16)
          {
            unint64_t v17 = (void *)[v16 textBlocks];
            if (v17)
            {
              unint64_t v18 = v17;
              if ([v17 count] > v14)
              {
                if (v14)
                {
                  unint64_t v19 = 1;
                  do
                  {
                    uint64_t v20 = [v11 objectAtIndex:v19 - 1];
                    uint64_t v21 = [v18 objectAtIndex:v19 - 1];
                    BOOL v22 = v20 == v21;
                  }
                  while (v20 == v21 && v19++ < v14);
                }
                else
                {
                  BOOL v22 = 1;
                }
                uint64_t v24 = (void *)[v18 objectAtIndex:v14];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && [v24 table] == a3
                  && [v24 startingRow] == v26)
                {
                  return !v22;
                }
              }
            }
          }
        }
        BOOL v22 = 0;
        return !v22;
      }
    }
  }
  return result;
}

- (void)_atEndOfTextTableRow:()NSAttributedStringUIFoundationAdditions atIndex:
{
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t result = (void *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:&v26];
  if (result)
  {
    if (a4 + 1 != v27 + v26) {
      return 0;
    }
    BOOL v8 = result;
    uint64_t v9 = (void *)[result textBlocks];
    uint64_t result = (void *)[v9 count];
    if (result)
    {
      unint64_t v10 = (unint64_t)result;
      uint64_t v24 = @"NSParagraphStyle";
      uint64_t v25 = 0;
      unint64_t v11 = 1;
      do
      {
        unint64_t v12 = v11 - 1;
        unint64_t v13 = objc_msgSend(v9, "objectAtIndex:", v11 - 1, v24);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 table] == a3) {
          uint64_t v25 = [v13 startingRow];
        }
        else {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v11 >= v10) {
          break;
        }
        ++v11;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = 0;
      if (v9)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v14 = v27 + v26;
          if (v14 < [a1 length])
          {
            unint64_t v15 = (void *)[a1 attribute:v24 atIndex:v14 effectiveRange:&v26];
            if (v15 == v8)
            {
              BOOL v21 = 1;
              return (void *)!v21;
            }
            if (v15)
            {
              char v16 = (void *)[v15 textBlocks];
              if (v16)
              {
                unint64_t v17 = v16;
                if ([v16 count] > v12)
                {
                  if (v12)
                  {
                    unint64_t v18 = 1;
                    do
                    {
                      uint64_t v19 = [v9 objectAtIndex:v18 - 1];
                      uint64_t v20 = [v17 objectAtIndex:v18 - 1];
                      BOOL v21 = v19 == v20;
                    }
                    while (v19 == v20 && v18++ < v12);
                  }
                  else
                  {
                    BOOL v21 = 1;
                  }
                  uint64_t v23 = (void *)[v17 objectAtIndex:v12];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && [v23 table] == a3
                    && [v23 startingRow] == v25)
                  {
                    return (void *)!v21;
                  }
                }
              }
            }
          }
          BOOL v21 = 0;
          return (void *)!v21;
        }
      }
    }
  }
  return result;
}

- (char)itemNumberInTextList:()NSAttributedStringUIFoundationAdditions atIndex:
{
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v7 = [a1 string];
  BOOL v8 = (char *)[a1 attribute:@"NSParagraphStyle" atIndex:a4 effectiveRange:&v35];
  uint64_t v9 = v8;
  if (v8)
  {
    unint64_t v10 = (void *)[v8 textLists];
    uint64_t v11 = [v10 indexOfObjectIdenticalTo:a3];
    if (v10) {
      BOOL v12 = v11 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      return 0;
    }
    unint64_t v13 = v11;
    BOOL v32 = (void *)v7;
    unint64_t v34 = a4;
    unint64_t v14 = v35;
    unint64_t v33 = [a1 length];
    if (v14)
    {
      do
      {
        unint64_t v15 = (char *)[a1 attribute:@"NSParagraphStyle" atIndex:v14 - 1 effectiveRange:&v35];
        char v16 = v15;
        if (v15 == v9)
        {
          BOOL v23 = 1;
        }
        else if (v15 {
               && (unint64_t v17 = (void *)[v15 textLists]) != 0
        }
               && (unint64_t v18 = v17, [v17 count] > v13))
        {
          unint64_t v19 = 1;
          do
          {
            uint64_t v20 = [v10 objectAtIndex:v19 - 1];
            uint64_t v21 = [v18 objectAtIndex:v19 - 1];
          }
          while (v20 == v21 && v19++ <= v13);
          BOOL v23 = v20 == v21;
        }
        else
        {
          BOOL v23 = 0;
        }
        if (v23)
        {
          uint64_t v9 = v16;
          unint64_t v14 = v35;
        }
        if (v14) {
          BOOL v24 = !v23;
        }
        else {
          BOOL v24 = 1;
        }
      }
      while (!v24);
    }
    if (v14 > a4 || v14 >= v33)
    {
      return 0;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v26 = v13 + 1;
      do
      {
        uint64_t v27 = objc_msgSend(v32, "paragraphRangeForRange:", v14, 0);
        uint64_t v29 = v28;
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v14, &v35), "textLists"), "count") == v26)
        {
          unint64_t v14 = v27 + v29;
          ++v9;
        }
        else
        {
          unint64_t v14 = v36 + v35;
        }
      }
      while (v14 <= v34 && v14 < v33);
    }
  }
  return v9;
}

@end