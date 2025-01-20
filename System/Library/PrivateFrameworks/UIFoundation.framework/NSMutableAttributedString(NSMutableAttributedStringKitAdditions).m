@interface NSMutableAttributedString(NSMutableAttributedStringKitAdditions)
- (BOOL)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:;
- (BOOL)readFromFileURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:;
- (BOOL)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:;
- (uint64_t)_attributeFixingInProgress;
- (uint64_t)_changeIntAttribute:()NSMutableAttributedStringKitAdditions by:range:;
- (uint64_t)convertBidiControlCharactersToWritingDirection;
- (uint64_t)convertWritingDirectionToBidiControlCharacters;
- (uint64_t)fixAttributesInRange:()NSMutableAttributedStringKitAdditions;
- (uint64_t)fixFontAttributeInRange:()NSMutableAttributedStringKitAdditions;
- (uint64_t)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:;
- (uint64_t)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:;
- (uint64_t)subscriptRange:()NSMutableAttributedStringKitAdditions;
- (uint64_t)superscriptRange:()NSMutableAttributedStringKitAdditions;
- (uint64_t)unscriptRange:()NSMutableAttributedStringKitAdditions;
- (unint64_t)_fixGlyphInfo:()NSMutableAttributedStringKitAdditions inRange:;
- (unint64_t)convertBidiControlCharactersToWritingDirectionForParagraphAtIndex:()NSMutableAttributedStringKitAdditions;
- (unint64_t)convertWritingDirectionToBidiControlCharactersForParagraphAtIndex:()NSMutableAttributedStringKitAdditions;
- (unint64_t)fixGlyphInfoAttributeInRange:()NSMutableAttributedStringKitAdditions;
- (unint64_t)fixParagraphStyleAttributeInRange:()NSMutableAttributedStringKitAdditions;
- (void)fixAttachmentAttributeInRange:()NSMutableAttributedStringKitAdditions;
- (void)setAlignment:()NSMutableAttributedStringKitAdditions range:;
- (void)setBaseWritingDirection:()NSMutableAttributedStringKitAdditions range:;
@end

@implementation NSMutableAttributedString(NSMutableAttributedStringKitAdditions)

- (uint64_t)fixAttributesInRange:()NSMutableAttributedStringKitAdditions
{
  char v7 = [a1 _attributeFixingInProgress];
  if ((v7 & 1) == 0) {
    [a1 _setAttributeFixingInProgress:1];
  }
  [a1 beginEditing];
  objc_msgSend(a1, "fixGlyphInfoAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixFontAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixParagraphStyleAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixAttachmentAttributeInRange:", a3, a4);
  objc_msgSend((id)objc_msgSend(a1, "_intentResolver"), "resolveAttributedString:inRange:", a1, a3, a4);
  uint64_t result = [a1 endEditing];
  if ((v7 & 1) == 0) {
    return [a1 _setAttributeFixingInProgress:0];
  }
  return result;
}

- (unint64_t)fixParagraphStyleAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  if (a3) {
    unint64_t v7 = a3 - 1;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t result = [a1 length];
  if (result > a3 + a4) {
    unint64_t v9 = a3 + a4 + 1;
  }
  else {
    unint64_t v9 = result;
  }
  if (v7 < v9)
  {
    v10 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      unint64_t result = [a1 attribute:@"NSParagraphStyle" atIndex:v7 effectiveRange:&v17];
      unint64_t v7 = v18 + v17;
      if (v18 + v17 >= v9) {
        return result;
      }
      unint64_t v11 = result;
      if (!v10) {
        v10 = (void *)[a1 string];
      }
      unint64_t result = [v10 characterAtIndex:v7 - 1];
      if ((int)result <= 12) {
        break;
      }
      if (result != 8233)
      {
        if (result != 13) {
          goto LABEL_22;
        }
        unint64_t result = [v10 length];
        if (v7 < result)
        {
          unint64_t result = [v10 characterAtIndex:v7];
          if (result == 10) {
            goto LABEL_22;
          }
        }
      }
LABEL_31:
      if (v7 >= v9) {
        return result;
      }
    }
    if (result == 10 || result == 12) {
      goto LABEL_31;
    }
LABEL_22:
    unint64_t v16 = 0;
    objc_msgSend(v10, "getParagraphStart:end:contentsEnd:forRange:", 0, &v16, 0, v7, 0);
    unint64_t v13 = v16;
    if (v16) {
      --v16;
    }
    else {
      unint64_t v13 = 1;
    }
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v7, &v14, v7, v13 - v7);
    if (result != v11 || v15 + v14 < v13)
    {
      if (v11) {
        unint64_t result = objc_msgSend(a1, "addAttribute:value:range:", @"NSParagraphStyle", v11, v7, v13 - v7);
      }
      else {
        unint64_t result = objc_msgSend(a1, "removeAttribute:range:", @"NSParagraphStyle", v7, v13 - v7);
      }
    }
    unint64_t v7 = v16 + 1;
    goto LABEL_31;
  }
  return result;
}

- (void)fixAttachmentAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  v6 = a1;
  unint64_t v7 = (__CFString *)[a1 string];
  unint64_t v39 = a3 + a4;
  CFStringRef theString = v7;
  unint64_t v53 = a3;
  uint64_t v54 = a4;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  v52 = CStringPtr;
  if (a3 < v39)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v43 = 0u;
    v38 = v6;
    uint64_t v34 = -(uint64_t)a3;
    v35 = v7;
    unint64_t v33 = 64 - a3;
    v32 = &buffer[-a3];
    unint64_t v9 = a3;
    unint64_t v36 = a3;
    uint64_t v37 = a4;
    do
    {
      uint64_t v40 = 0;
      unint64_t v41 = 0;
      v10 = (void *)[v6 attributesAtIndex:v9 effectiveRange:&v40];
      unint64_t v11 = @"CTAdaptiveImageProvider";
      if (![v10 objectForKeyedSubscript:@"CTAdaptiveImageProvider"])
      {
        unint64_t v11 = @"NSAttachment";
        if (![v10 objectForKeyedSubscript:@"NSAttachment"]) {
          goto LABEL_46;
        }
      }
      if (!v11) {
        goto LABEL_46;
      }
      unint64_t v12 = a3 - v9;
      if (a3 == v9) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = a3;
      }
      if (a3 == v9) {
        uint64_t v14 = v39;
      }
      else {
        uint64_t v14 = a4;
      }
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", v11, v9, &v40, v13, v14);
      if (CharactersPtr || v41 != 1)
      {
        if (v9 < v41 + v40)
        {
          uint64_t v17 = 0;
          unint64_t v16 = 0;
          uint64_t v15 = 0;
          unint64_t v18 = v34 + v9;
          unint64_t v19 = v33 + v9;
          unint64_t v20 = v34 + v9;
          do
          {
            if (v20 >= 4) {
              uint64_t v21 = 4;
            }
            else {
              uint64_t v21 = v20;
            }
            uint64_t v22 = v18 + v17;
            if ((uint64_t)(v18 + v17) < 0) {
              goto LABEL_41;
            }
            uint64_t v23 = v54;
            if (v54 <= v22) {
              goto LABEL_41;
            }
            if (CharactersPtr)
            {
              UniChar v24 = CharactersPtr[v18 + v17 + v53];
            }
            else if (v52)
            {
              UniChar v24 = v52[v53 + v18 + v17];
            }
            else
            {
              if (v56 <= v22 || (uint64_t v25 = v55, v55 > v22))
              {
                uint64_t v26 = v34 - v21;
                unint64_t v27 = v21 + v12;
                uint64_t v28 = v19 - v21;
                uint64_t v29 = v9 + v17 + v26;
                uint64_t v30 = v29 + 64;
                if (v29 + 64 >= v54) {
                  uint64_t v30 = v54;
                }
                uint64_t v55 = v29;
                uint64_t v56 = v30;
                if (v54 >= v28) {
                  uint64_t v23 = v28;
                }
                v57.length = v23 + v27;
                v57.location = v29 + v53;
                CFStringGetCharacters(theString, v57, buffer);
                uint64_t v25 = v55;
              }
              UniChar v24 = v32[v9 - v25 + v17];
            }
            if (v24 == 65532)
            {
              if (v16 >= 2)
              {
                objc_msgSend(v38, "removeAttribute:range:", v11, v15, v16);
                unint64_t v16 = 0;
              }
            }
            else
            {
LABEL_41:
              if (v16++ == 0) {
                uint64_t v15 = v9 + v17;
              }
            }
            ++v17;
            ++v20;
            --v12;
            ++v19;
          }
          while (v9 + v17 < v41 + v40);
          goto LABEL_44;
        }
      }
      else if ([(__CFString *)v7 characterAtIndex:v9] != 65532)
      {
        uint64_t v15 = v40;
        unint64_t v16 = v41;
LABEL_44:
        a3 = v36;
        a4 = v37;
        v6 = v38;
        unint64_t v7 = v35;
        if (v16) {
          objc_msgSend(v38, "removeAttribute:range:", v11, v15, v16);
        }
      }
LABEL_46:
      unint64_t v9 = v41 + v40;
    }
    while (v41 + v40 < v39);
  }
}

- (unint64_t)fixGlyphInfoAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  unint64_t v7 = a3 + a4;
  if (a3)
  {
    uint64_t v8 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, a3 - 1, &v12, 0, a3);
    if (v8) {
      objc_msgSend(a1, "_fixGlyphInfo:inRange:", v8, v12, v13);
    }
  }
  if (a3 >= v7)
  {
    unint64_t v9 = a3;
  }
  else
  {
    unint64_t v9 = a3;
    do
    {
      uint64_t v10 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, v9, &v12, a3, a4);
      if (v10) {
        objc_msgSend(a1, "_fixGlyphInfo:inRange:", v10, v12, v13);
      }
      unint64_t v9 = v13 + v12;
    }
    while (v13 + v12 < v7);
  }
  unint64_t result = objc_msgSend(a1, "length", v12, v13);
  if (v9 < result)
  {
    unint64_t result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, v9, &v12, v9, objc_msgSend(a1, "length") - v9);
    if (result) {
      return objc_msgSend(a1, "_fixGlyphInfo:inRange:", result, v12, v13);
    }
  }
  return result;
}

- (uint64_t)fixFontAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  uint64_t v7 = MEMORY[0x192FADEA0](0);
  *(_OWORD *)theSet = 0u;
  long long v237 = 0u;
  uint64_t v8 = (__CFString *)[a1 string];
  unint64_t v234 = 0;
  unint64_t v235 = 0;
  [a1 _isStringDrawingTextStorage];
  v230 = a1;
  int v224 = [a1 _shouldSetOriginalFontAttribute];
  if (fixFontAttributeInRange__onceToken != -1) {
    dispatch_once(&fixFontAttributeInRange__onceToken, &__block_literal_global_4);
  }
  uint64_t v249 = 0;
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  *(_OWORD *)CFStringRef theString = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  *(_OWORD *)buffer = 0u;
  if (length)
  {
    if (location)
    {
      unsigned int v9 = [(__CFString *)v8 characterAtIndex:location];
      if ((v9 & 0xF800 | 0x400) == 0xDC00) {
        goto LABEL_6;
      }
      LOBYTE(v216) = fixFontAttributeInRange__nonBaseSetBMP;
      if (fixFontAttributeInRange__nonBaseSetBMP) {
        int v216 = (*(unsigned __int8 *)(fixFontAttributeInRange__nonBaseSetBMP + ((unint64_t)v9 >> 3)) >> (v9 & 7)) & 1;
      }
      if (v9 - 4448 < 0x9A
        || (v216 & 1) != 0
        || (v9 & 0xFFF0) == 0xF870
        || v9 == 8205
        || (v9 & 0xFFF0) == 0xF860
        || fixFontAttributeInRange__combiningDataBMP
        && *(unsigned char *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v9 >> 8))
        && *(unsigned char *)(fixFontAttributeInRange__combiningDataBMP
                    + (*(unsigned __int8 *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v9 >> 8)) << 8)
                    - 256
                    + v9
                    + 256) == 9)
      {
LABEL_6:
        v10.location = [(__CFString *)v8 rangeOfComposedCharacterSequenceAtIndex:location];
        if (location != v10.location)
        {
          v261.location = location;
          v261.length = length;
          NSRange v11 = NSUnionRange(v10, v261);
          location = v11.location;
          length = v11.length;
        }
      }
    }
    if (length + location < [(__CFString *)v8 length])
    {
      unsigned int v12 = [(__CFString *)v8 characterAtIndex:length + location];
      uint64_t v13 = length + location - 1;
      if (([(__CFString *)v8 characterAtIndex:v13] & 0xFC00) == 0xD800) {
        goto LABEL_10;
      }
      LOBYTE(v215) = fixFontAttributeInRange__nonBaseSetBMP;
      if (fixFontAttributeInRange__nonBaseSetBMP) {
        int v215 = (*(unsigned __int8 *)(fixFontAttributeInRange__nonBaseSetBMP + ((unint64_t)v12 >> 3)) >> (v12 & 7)) & 1;
      }
      if ((v215 & 1) != 0
        || v12 - 4448 < 0x9A
        || (v12 & 0xFFF0) == 0xF870
        || v12 == 8205
        || (v12 & 0xFFF0) == 0xF860
        || fixFontAttributeInRange__combiningDataBMP
        && *(unsigned char *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v12 >> 8))
        && *(unsigned char *)(fixFontAttributeInRange__combiningDataBMP
                    + (*(unsigned __int8 *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v12 >> 8)) << 8)
                    - 256
                    + v12
                    + 256) == 9)
      {
LABEL_10:
        v254.location = [(__CFString *)v8 rangeOfComposedCharacterSequenceAtIndex:v13];
        v262.location = location;
        v262.length = length;
        NSRange v14 = NSUnionRange(v254, v262);
        location = v14.location;
        length = v14.length;
      }
    }
  }
  theString[0] = v8;
  *((void *)&v247 + 1) = location;
  *(void *)&long long v248 = length;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v8);
  if (theString[1]) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  }
  *((void *)&v248 + 1) = 0;
  uint64_t v249 = 0;
  *(void *)&long long v247 = CStringPtr;
  if (!length)
  {
    v213 = 0;
    goto LABEL_574;
  }
  CFCharacterSetRef v222 = 0;
  v223 = v8;
  uint64_t v218 = v7;
  uint64_t v16 = 0;
  NSUInteger v17 = 0;
  uint64_t v227 = 0;
  v233 = 0;
  unint64_t v18 = 0;
  unint64_t v229 = 0;
  uint64_t v19 = 0;
  char v221 = 0;
  NSUInteger v220 = location - 1;
  NSUInteger v219 = location - 2;
  uint64_t v217 = -(uint64_t)location;
  NSUInteger v226 = length;
  NSUInteger v228 = location;
  do
  {
    NSUInteger v20 = v17;
    if (v16 == v17)
    {
      id v21 = (id)objc_msgSend(v230, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSFont", v16 + location, &v234, location, length);
      uint64_t v22 = v21;
      if (v21
        && ([v21 _isDefaultFace] & 1) == 0
        && (uint64_t v23 = [v22 coveredCharacterSet]) != 0)
      {
        uint64_t v24 = v23;
        CFCharacterSetInitInlineBuffer();
        uint64_t v25 = v24;
      }
      else
      {
        uint64_t v25 = 0;
      }
      unint64_t v26 = v234;
      unint64_t v27 = v235;
      uint64_t v227 = v25;
      if (v18)
      {
        if (v22)
        {
          [v22 pointSize];
          double v29 = v28;
          [v18 pointSize];
          if (v29 != v30) {
            goto LABEL_29;
          }
          int v31 = [v22 traits];
          if (v31 != [v18 traits]) {
            goto LABEL_29;
          }
          CTFontGetWeight();
          double v33 = v32;
          CTFontGetWeight();
          if (vabdd_f64(v33, v34) >= 0.00000011920929
            || (memset(&v253, 0, sizeof(v253)),
                CTFontGetMatrix(&v253, (CTFontRef)v22),
                memset(&v252, 0, sizeof(v252)),
                CTFontGetMatrix(&v252, (CTFontRef)v18),
                CGAffineTransform t1 = v253,
                CGAffineTransform t2 = v252,
                !CGAffineTransformEqualToTransform(&t1, &t2)))
          {
LABEL_29:
            objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v19, v217);
            if (v224)
            {
              uint64_t v35 = (uint64_t)v233;
              if (!v233)
              {
                if (NSDefaultFont_onceToken != -1) {
                  dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                }
                uint64_t v35 = NSDefaultFont__defaultFont;
              }
              objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v35, v229, v19);
            }
            unint64_t v18 = 0;
          }
        }
      }
      NSUInteger v17 = v26 - location + v27;

      v233 = v22;
    }
    uint64_t v36 = v16 + 1;
    if (v16 < 0 || (uint64_t v37 = v248, (uint64_t)v248 <= v16))
    {
      uint64_t v231 = v19;
      NSUInteger v41 = v17;
      uint64_t v42 = 0;
      uint64_t v225 = 0;
      goto LABEL_43;
    }
    v38 = (UniChar *)theString[1];
    if (theString[1])
    {
      uint64_t v39 = *((void *)&v247 + 1) + v16;
    }
    else
    {
      if ((void)v247)
      {
        UniChar v40 = *(char *)(v247 + *((void *)&v247 + 1) + v16);
        goto LABEL_55;
      }
      if (v249 <= v16 || (uint64_t v74 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v16))
      {
        uint64_t v75 = v16 - 4;
        if ((unint64_t)v16 < 4) {
          uint64_t v75 = 0;
        }
        if (v75 + 64 < (uint64_t)v248) {
          uint64_t v37 = v75 + 64;
        }
        *((void *)&v248 + 1) = v75;
        uint64_t v249 = v37;
        v255.location = *((void *)&v247 + 1) + v75;
        v255.length = v37 - v75;
        CFStringGetCharacters(theString[0], v255, buffer);
        uint64_t v74 = *((void *)&v248 + 1);
      }
      uint64_t v39 = v16 - v74;
      v38 = buffer;
    }
    UniChar v40 = v38[v39];
LABEL_55:
    uint64_t v42 = v40;
    if (v40 >> 10 != 54) {
      goto LABEL_97;
    }
    uint64_t v50 = v248;
    if ((uint64_t)v248 <= v36) {
      goto LABEL_97;
    }
    v51 = (UniChar *)theString[1];
    if (theString[1])
    {
      uint64_t v52 = *((void *)&v247 + 1) + v36;
    }
    else
    {
      if ((void)v247)
      {
        UniChar v53 = *(char *)(v247 + *((void *)&v247 + 1) + v36);
        goto LABEL_91;
      }
      if (v249 <= v36 || (uint64_t v87 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v36))
      {
        uint64_t v88 = v16 - 3;
        if ((unint64_t)v36 < 4) {
          uint64_t v88 = 0;
        }
        if (v88 + 64 < (uint64_t)v248) {
          uint64_t v50 = v88 + 64;
        }
        *((void *)&v248 + 1) = v88;
        uint64_t v249 = v50;
        v256.location = *((void *)&v247 + 1) + v88;
        v256.length = v50 - v88;
        CFStringGetCharacters(theString[0], v256, buffer);
        uint64_t v87 = *((void *)&v248 + 1);
      }
      uint64_t v52 = v36 - v87;
      v51 = buffer;
    }
    UniChar v53 = v51[v52];
LABEL_91:
    int v76 = v53 >> 10;
    unsigned int v77 = (v42 << 10) + v53 - 56613888;
    if (v76 == 55) {
      uint64_t v36 = v16 + 2;
    }
    else {
      uint64_t v36 = v16 + 1;
    }
    if (v76 == 55) {
      uint64_t v42 = v77;
    }
    else {
      uint64_t v42 = v42;
    }
LABEL_97:
    LODWORD(v225) = v42 & 0x1FFFF0;
    BYTE4(v225) = (v42 & 0x1FFFF0) == 63584;
    if ((v42 & 0x1FFFF0) != 0xF860) {
      goto LABEL_440;
    }
    uint64_t v231 = v19;
    NSUInteger v41 = v17;
    if (length >= v36 + (unint64_t)__NSTranscodingHintLength[(v42 - 63584)]) {
      NSUInteger v43 = v36 + __NSTranscodingHintLength[(v42 - 63584)];
    }
    else {
      NSUInteger v43 = length;
    }
    if (v227)
    {
      unsigned int v78 = (uint64_t)theSet[1] & 4;
      if (HIDWORD(theSet[1]) <= v42 && v237 > v42)
      {
        if (WORD1(v42)) {
          BOOL v80 = 0;
        }
        else {
          BOOL v80 = ((uint64_t)theSet[1] & 2) == 0;
        }
        if (v80)
        {
          if (!*((void *)&v237 + 1))
          {
            BOOL v80 = v78 == 0;
            BOOL v138 = v78 != 0;
            char v139 = v80;
            if (((uint64_t)theSet[1] & 1) == 0) {
              BOOL v138 = v139;
            }
            if (!v138) {
              goto LABEL_412;
            }
            goto LABEL_357;
          }
          if ((uint64_t)theSet[1])
          {
            unsigned int v140 = v78 >> 2;
            uint64_t v141 = *(unsigned __int8 *)(*((void *)&v237 + 1) + ((unint64_t)v42 >> 8));
            if (*(unsigned char *)(*((void *)&v237 + 1) + ((unint64_t)v42 >> 8)))
            {
              if (v141 != 255)
              {
                BOOL v151 = v78 == 0;
                if ((((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1)
                                                            + 32 * v141
                                                            + (v42 >> 3)
                                                            + 224) >> (v42 & 7)) & 1) != 0)
                  unsigned int v140 = v151;
                if (!v140) {
                  goto LABEL_412;
                }
                goto LABEL_357;
              }
              unsigned int v140 = v78 == 0;
            }
            if (!v140) {
              goto LABEL_412;
            }
          }
          else
          {
            BOOL v80 = v78 == 0;
            BOOL v81 = v78 != 0;
            char v82 = v80;
            if ((((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1)
                                                        + ((unint64_t)v42 >> 3)) >> (v42 & 7)) & 1) != 0)
              BOOL v81 = v82;
            if (!v81) {
              goto LABEL_412;
            }
          }
        }
        else if (!CFCharacterSetIsLongCharacterMember(theSet[0], v42))
        {
          goto LABEL_412;
        }
      }
      else if (((uint64_t)theSet[1] & 4) == 0)
      {
        goto LABEL_412;
      }
LABEL_357:
      uint64_t v152 = v36;
      if (v36 < v43)
      {
        uint64_t v153 = -v36;
        uint64_t v154 = v36 + 64;
        uint64_t v152 = v36;
        while (1)
        {
          if ((unint64_t)v152 >= 4) {
            uint64_t v155 = 4;
          }
          else {
            uint64_t v155 = v152;
          }
          if (v152 < 0 || (uint64_t v156 = v248, (uint64_t)v248 <= v152))
          {
            UniChar v157 = 0;
          }
          else if (theString[1])
          {
            UniChar v157 = *((_WORD *)&theString[1]->isa + v152 + *((void *)&v247 + 1));
          }
          else if ((void)v247)
          {
            UniChar v157 = *(char *)(v247 + *((void *)&v247 + 1) + v152);
          }
          else
          {
            if (v249 <= v152 || (uint64_t v167 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v152))
            {
              uint64_t v168 = -v155;
              uint64_t v169 = v155 + v153;
              uint64_t v170 = v154 - v155;
              uint64_t v171 = v152 + v168;
              uint64_t v172 = v171 + 64;
              if (v171 + 64 >= (uint64_t)v248) {
                uint64_t v172 = v248;
              }
              *((void *)&v248 + 1) = v171;
              uint64_t v249 = v172;
              if ((uint64_t)v248 >= v170) {
                uint64_t v156 = v170;
              }
              v259.length = v156 + v169;
              v259.location = v171 + *((void *)&v247 + 1);
              CFStringGetCharacters(theString[0], v259, buffer);
              uint64_t v167 = *((void *)&v248 + 1);
            }
            UniChar v157 = buffer[v152 - v167];
          }
          unsigned int v158 = (uint64_t)theSet[1] & 4;
          if (HIDWORD(theSet[1]) <= v157 && v237 > v157)
          {
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              if (!CFCharacterSetIsLongCharacterMember(theSet[0], v157)) {
                break;
              }
            }
            else if (*((void *)&v237 + 1))
            {
              if ((uint64_t)theSet[1])
              {
                unsigned int v165 = v158 >> 2;
                uint64_t v166 = *(unsigned __int8 *)(*((void *)&v237 + 1) + ((unint64_t)v157 >> 8));
                if (*(unsigned char *)(*((void *)&v237 + 1) + ((unint64_t)v157 >> 8)))
                {
                  if (v166 == 255)
                  {
                    unsigned int v165 = v158 == 0;
                  }
                  else
                  {
                    BOOL v173 = v158 == 0;
                    if ((((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1)
                                                                + 32 * v166
                                                                + (v157 >> 3)
                                                                + 224) >> (v157 & 7)) & 1) != 0)
                      unsigned int v165 = v173;
                  }
                }
                if (!v165) {
                  break;
                }
              }
              else
              {
                BOOL v160 = v158 != 0;
                BOOL v161 = v158 == 0;
                if (((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1) + ((unint64_t)v157 >> 3)) >> (v157 & 7))) {
                  BOOL v160 = v161;
                }
                if (!v160) {
                  break;
                }
              }
            }
            else
            {
              BOOL v80 = v158 == 0;
              BOOL v162 = v158 != 0;
              char v163 = v80;
              if ((uint64_t)theSet[1]) {
                char v164 = v162;
              }
              else {
                char v164 = v163;
              }
              if ((v164 & 1) == 0) {
                break;
              }
            }
          }
          else if (((uint64_t)theSet[1] & 4) == 0)
          {
            break;
          }
          ++v152;
          --v153;
          ++v154;
          if (v43 == v152) {
            goto LABEL_409;
          }
        }
      }
      if (v152 == v43)
      {
LABEL_409:
        if (!v18)
        {
          length = v226;
LABEL_411:
          location = v228;
          NSUInteger v17 = v41;
LABEL_486:
          uint64_t v19 = v231;
          goto LABEL_561;
        }
        objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v231);
        length = v226;
        location = v228;
        NSUInteger v17 = v41;
        if (!v224)
        {
          unint64_t v18 = 0;
          goto LABEL_486;
        }
        uint64_t v19 = v231;
        uint64_t v103 = (uint64_t)v233;
        if (!v233)
        {
          if (NSDefaultFont_onceToken == -1)
          {
LABEL_490:
            uint64_t v103 = NSDefaultFont__defaultFont;
            goto LABEL_491;
          }
LABEL_563:
          dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
          goto LABEL_490;
        }
LABEL_491:
        objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v103, v229, v19, v217);
LABEL_452:
        unint64_t v18 = 0;
        goto LABEL_561;
      }
    }
LABEL_412:
    if (!((v18 == 0) | v221 & 1))
    {
      if (!CFCharacterSetIsLongCharacterMember(v222, v42))
      {
        NSUInteger v17 = v41;
        length = v226;
        goto LABEL_439;
      }
      if (v36 >= v43)
      {
        uint64_t v176 = v36;
      }
      else
      {
        uint64_t v174 = -v36;
        uint64_t v175 = v36 + 64;
        uint64_t v176 = v36;
        while (1)
        {
          uint64_t v177 = (unint64_t)v176 >= 4 ? 4 : v176;
          if (v176 < 0 || (uint64_t v178 = v248, (uint64_t)v248 <= v176))
          {
            UniChar v179 = 0;
          }
          else if (theString[1])
          {
            UniChar v179 = *((_WORD *)&theString[1]->isa + v176 + *((void *)&v247 + 1));
          }
          else if ((void)v247)
          {
            UniChar v179 = *(char *)(v247 + *((void *)&v247 + 1) + v176);
          }
          else
          {
            if (v249 <= v176 || (uint64_t v180 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v176))
            {
              uint64_t v181 = -v177;
              uint64_t v182 = v177 + v174;
              uint64_t v183 = v175 - v177;
              uint64_t v184 = v176 + v181;
              uint64_t v185 = v184 + 64;
              if (v184 + 64 >= (uint64_t)v248) {
                uint64_t v185 = v248;
              }
              *((void *)&v248 + 1) = v184;
              uint64_t v249 = v185;
              if ((uint64_t)v248 >= v183) {
                uint64_t v178 = v183;
              }
              v260.length = v178 + v182;
              v260.location = v184 + *((void *)&v247 + 1);
              CFStringGetCharacters(theString[0], v260, buffer);
              uint64_t v180 = *((void *)&v248 + 1);
            }
            UniChar v179 = buffer[v176 - v180];
          }
          if (!CFCharacterSetIsLongCharacterMember(v222, v179)) {
            break;
          }
          ++v176;
          --v174;
          ++v175;
          if (v43 == v176)
          {
            length = v226;
            NSUInteger v17 = v41;
            goto LABEL_480;
          }
        }
        objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v231);
        if (v224)
        {
          uint64_t v188 = (uint64_t)v233;
          length = v226;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1) {
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
            }
            uint64_t v188 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v188, v229, v231, v217);
          unint64_t v18 = 0;
LABEL_478:
          BOOL v80 = v176 == v43;
          NSUInteger v17 = v41;
          uint64_t v19 = v231;
          if (v80)
          {
LABEL_480:
            char v221 = 0;
            location = v228;
            uint64_t v19 = v228 - v229 + v43;
            goto LABEL_561;
          }
          goto LABEL_440;
        }
        unint64_t v18 = 0;
      }
      length = v226;
      goto LABEL_478;
    }
    length = v226;
    NSUInteger v17 = v41;
LABEL_439:
    uint64_t v19 = v231;
LABEL_440:
    if ((v42 - 8232) < 2 || v42 == 160 || v42 == 65532)
    {
      NSUInteger v43 = v36;
LABEL_444:
      location = v228;
      if (v18)
      {
        objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v19);
        if (v224)
        {
          uint64_t v186 = (uint64_t)v233;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1) {
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
            }
            uint64_t v186 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v186, v229, v19, v217);
        }
      }
      if (v233) {
        goto LABEL_452;
      }
      if (NSDefaultFont_onceToken != -1) {
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
      }
      unint64_t v18 = NSDefaultFont__defaultFont;
      char v221 = objc_msgSend((id)NSDefaultFont__defaultFont, "_isDefaultFace", v217);
      if ((v221 & 1) == 0) {
        CFCharacterSetRef v222 = (const __CFCharacterSet *)[v18 coveredCharacterSet];
      }
      unint64_t v187 = v220 + v43;
      if (v42 >= 0x10000) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 1;
      }
      if (v42 >= 0x10000) {
        unint64_t v187 = v219 + v43;
      }
      unint64_t v229 = v187;
      v233 = 0;
      goto LABEL_561;
    }
    uint64_t v231 = v19;
    NSUInteger v41 = v17;
LABEL_43:
    NSUInteger v43 = v36;
    char v44 = [(id)_CTGetVisibleFormatterCharacterSet() longCharacterIsMember:v42];
    int v45 = v42 & 0xFFFFFFFE;
    if (v42 & 0xFFFFFFFE) == 0xFE0E || (v44) {
      goto LABEL_62;
    }
    if (WORD1(v42))
    {
      uint64_t BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
      if (!BitmapPtrForPlane) {
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t BitmapPtrForPlane = fixFontAttributeInRange__controlFormatBMP;
      if (!fixFontAttributeInRange__controlFormatBMP) {
        goto LABEL_62;
      }
    }
    uint64_t v47 = (unsigned __int16)v42 >> 3;
    int v48 = 1 << (v42 & 7);
    if ((v48 & *(unsigned char *)(BitmapPtrForPlane + v47)) != 0)
    {
      if (WORD1(v42))
      {
        uint64_t v49 = CFUniCharGetBitmapPtrForPlane();
        if (!v49) {
          goto LABEL_80;
        }
      }
      else
      {
        uint64_t v49 = fixFontAttributeInRange__graphemeBMP;
        if (!fixFontAttributeInRange__graphemeBMP) {
          goto LABEL_80;
        }
      }
      if ((v48 & *(unsigned char *)(v49 + v47)) == 0)
      {
LABEL_80:
        length = v226;
        NSUInteger v17 = v41;
        uint64_t v19 = v231;
        goto LABEL_444;
      }
    }
LABEL_62:
    if (v42 >> 4 != 4064 && (v42 - 917760) > 0xEF)
    {
      if (v42 == 8419)
      {
        uint64_t v54 = [(__CFString *)v223 rangeOfComposedCharacterSequenceAtIndex:v220 + v36];
        if (v55 == 2)
        {
          uint64_t v56 = v54;
          if (v54 != v220 + v43)
          {
            uint64_t v57 = v54 - v228;
            if ((uint64_t)(v54 - v228) >= 0)
            {
              uint64_t v58 = v248;
              if ((uint64_t)v248 > v57)
              {
                v59 = (UniChar *)theString[1];
                if (theString[1])
                {
                  uint64_t v60 = *((void *)&v247 + 1) + v57;
                  goto LABEL_71;
                }
                if ((void)v247)
                {
                  UniChar v61 = *(char *)(v247 + *((void *)&v247 + 1) + v57);
                }
                else
                {
                  if (v249 <= v57 || (uint64_t v149 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v57))
                  {
                    uint64_t v150 = v57 - 4;
                    if ((unint64_t)v57 < 4) {
                      uint64_t v150 = 0;
                    }
                    if (v150 + 64 < (uint64_t)v248) {
                      uint64_t v58 = v150 + 64;
                    }
                    *((void *)&v248 + 1) = v150;
                    uint64_t v249 = v58;
                    v258.location = *((void *)&v247 + 1) + v150;
                    v258.length = v58 - v150;
                    CFStringGetCharacters(theString[0], v258, buffer);
                    uint64_t v149 = *((void *)&v248 + 1);
                  }
                  uint64_t v60 = v57 - v149;
                  v59 = buffer;
LABEL_71:
                  UniChar v61 = v59[v60];
                }
                if (v61 == 35 || v61 == 42 || (unsigned __int16)(v61 - 48) <= 9u)
                {
                  if (v57 < v234 || (v89 = v233, v57 - v234 >= v235)) {
                    v89 = objc_msgSend(v230, "attribute:atIndex:effectiveRange:", @"NSFont", v57, 0, v217);
                  }
                  NSUInteger v90 = v228;
                  if (objc_msgSend(v89, "_hasColorGlyphs", v217))
                  {
                    length = v226;
                    NSUInteger v17 = v41;
                    uint64_t v19 = v231;
                  }
                  else
                  {
                    id v135 = (id)CTFontCreateEmojiFontForFont();
                    if (v18)
                    {
                      unint64_t v136 = NSIntersectsRange() ? v56 - v229 : v231;
                      if (v136)
                      {
                        objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v136);
                        if (v224)
                        {
                          uint64_t v137 = (uint64_t)v233;
                          if (!v233)
                          {
                            if (NSDefaultFont_onceToken != -1) {
                              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                            }
                            uint64_t v137 = NSDefaultFont__defaultFont;
                          }
                          objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v137, v229, v136);
                        }
                      }
                    }
                    CFCharacterSetRef v222 = (const __CFCharacterSet *)[v135 coveredCharacterSet];
                    char v221 = 0;
                    NSUInteger v43 = v57 + 2;
                    unint64_t v229 = v56;
                    unint64_t v18 = v135;
                    length = v226;
                    NSUInteger v17 = v41;
                    uint64_t v19 = 2;
                  }
LABEL_309:
                  location = v90;
                  goto LABEL_561;
                }
              }
            }
          }
        }
      }
      length = v226;
      if (!v227) {
        goto LABEL_166;
      }
      unsigned int v91 = (uint64_t)theSet[1] & 4;
      if (HIDWORD(theSet[1]) > v42 || v237 <= v42)
      {
        if (((uint64_t)theSet[1] & 4) != 0) {
          goto LABEL_174;
        }
        goto LABEL_166;
      }
      if (WORD1(v42) || ((uint64_t)theSet[1] & 2) != 0)
      {
        if (CFCharacterSetIsLongCharacterMember(theSet[0], v42)) {
          goto LABEL_174;
        }
        goto LABEL_166;
      }
      if (*((void *)&v237 + 1))
      {
        if (((uint64_t)theSet[1] & 1) == 0)
        {
          BOOL v80 = v91 == 0;
          BOOL v92 = v91 != 0;
          char v93 = v80;
          if ((((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1)
                                                      + ((unint64_t)v42 >> 3)) >> (v42 & 7)) & 1) != 0)
            BOOL v92 = v93;
          if (v92) {
            goto LABEL_174;
          }
LABEL_166:
          if (v42 == 65533)
          {
            v94 = objc_msgSend((id)objc_msgSend(v230, "attribute:atIndex:effectiveRange:", NSGlyphInfoAttributeName, v220 + v43, 0), "_baseString");
            if (v94)
            {
              v95 = v94;
              UTF32Char v96 = 65533;
              if ([v94 length] == 1
                && [v95 characterAtIndex:0] == 65533)
              {
                BOOL v97 = v18 == 0;
                if (v16 == v20 || !v18)
                {
LABEL_179:
                  if (!v97)
                  {
LABEL_180:
                    objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v231, v217);
                    if (v224)
                    {
                      uint64_t v103 = (uint64_t)v233;
                      location = v228;
                      NSUInteger v17 = v41;
                      uint64_t v19 = v231;
                      if (v233) {
                        goto LABEL_491;
                      }
                      if (NSDefaultFont_onceToken == -1) {
                        goto LABEL_490;
                      }
                      goto LABEL_563;
                    }
                  }
                  unint64_t v18 = 0;
                  goto LABEL_411;
                }
                unsigned int v98 = 65533;
LABEL_177:
                char v99 = BYTE4(v225);
                uint64_t v100 = fixFontAttributeInRange__nonBaseSetBMP;
                int v101 = 1;
                if (fixFontAttributeInRange__nonBaseSetBMP) {
                  goto LABEL_178;
                }
LABEL_187:
                LOBYTE(v102) = 0;
                goto LABEL_188;
              }
            }
            else
            {
              UTF32Char v96 = 65533;
            }
LABEL_231:
            UTF32Char v113 = HIWORD(v96);
            NSUInteger v90 = v228;
            NSUInteger v17 = v41;
            if (v18)
            {
              uint64_t v114 = v229 + v231 - 1;
              if (v114 < 0 || (uint64_t v115 = v248, (uint64_t)v248 <= v114))
              {
                UniChar v116 = 0;
              }
              else if (theString[1])
              {
                UniChar v116 = *((_WORD *)&theString[1]->isa + *((void *)&v247 + 1) + v114);
              }
              else if ((void)v247)
              {
                UniChar v116 = *(char *)(v247 + *((void *)&v247 + 1) + v114);
              }
              else
              {
                if (v249 <= v114 || (uint64_t v146 = *((void *)&v248 + 1), *((uint64_t *)&v248 + 1) > v114))
                {
                  uint64_t v147 = v229 + v231 - 5;
                  if ((unint64_t)v114 < 4) {
                    uint64_t v147 = 0;
                  }
                  if (v147 + 64 < (uint64_t)v248) {
                    uint64_t v115 = v147 + 64;
                  }
                  *((void *)&v248 + 1) = v147;
                  uint64_t v249 = v115;
                  v257.location = *((void *)&v247 + 1) + v147;
                  v257.length = v115 - v147;
                  CFStringGetCharacters(theString[0], v257, buffer);
                  uint64_t v146 = *((void *)&v248 + 1);
                }
                UniChar v116 = buffer[v114 - v146];
              }
              if (!(((v116 & 0xFFF0) == 65024) | v221 & 1) && CFCharacterSetIsLongCharacterMember(v222, v96))
              {
                char v221 = 0;
                uint64_t v117 = 1;
                if (v113) {
                  uint64_t v117 = 2;
                }
                uint64_t v19 = v117 + v231;
                goto LABEL_309;
              }
              objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v231, v217);
              if (v224)
              {
                uint64_t v118 = (uint64_t)v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1) {
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                  }
                  uint64_t v118 = NSDefaultFont__defaultFont;
                }
                objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v118, v229, v231);
              }
            }
            if (v113) {
              uint64_t v119 = -2;
            }
            else {
              uint64_t v119 = -1;
            }
            uint64_t v120 = v228 + v43 + v119;
            if (v113) {
              uint64_t v19 = 2;
            }
            else {
              uint64_t v19 = 1;
            }
            if (!v233)
            {
              if (NSDefaultFont_onceToken != -1) {
                dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
              }
              if (CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)objc_msgSend((id)NSDefaultFont__defaultFont, "coveredCharacterSet", v217), v96))
              {
                location = v228;
                if (v224)
                {
                  if (NSDefaultFont_onceToken != -1) {
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                  }
                  objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", NSDefaultFont__defaultFont, v228 + v43 + v119, v19);
                }
                if (NSDefaultFont_onceToken != -1) {
                  dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                }
                unint64_t v18 = NSDefaultFont__defaultFont;
                if ([(id)NSDefaultFont__defaultFont _isDefaultFace])
                {
                  v233 = 0;
                  goto LABEL_557;
                }
                CFCharacterSetRef v222 = (const __CFCharacterSet *)[v18 coveredCharacterSet];
                char v221 = 0;
                v233 = 0;
LABEL_559:
                unint64_t v229 = v120;
LABEL_560:
                length = v226;
                goto LABEL_561;
              }
            }
            uint64_t v232 = v19;
            if (v113)
            {
              uint64_t v121 = CFUniCharGetBitmapPtrForPlane();
              if (!v121) {
                goto LABEL_260;
              }
            }
            else
            {
              uint64_t v121 = fixFontAttributeInRange__graphemeBMP;
              if (!fixFontAttributeInRange__graphemeBMP)
              {
LABEL_260:
                if (v113)
                {
                  uint64_t v122 = CFUniCharGetBitmapPtrForPlane();
                  if (!v122) {
                    goto LABEL_275;
                  }
LABEL_262:
                  int v123 = (*(unsigned __int8 *)(v122 + ((unsigned __int16)v96 >> 3)) >> (v96 & 7)) & 1;
                }
                else
                {
                  uint64_t v122 = fixFontAttributeInRange__nonBaseSetBMP;
                  if (fixFontAttributeInRange__nonBaseSetBMP) {
                    goto LABEL_262;
                  }
LABEL_275:
                  LOBYTE(v123) = 0;
                }
                if (v96 - 4448 >= 0x9A
                  && (v123 & 1) == 0
                  && (v96 & 0x1FFFE0 | 0x10) != 0xF870
                  && v96 - 127995 >= 5
                  && v96 != 8205)
                {
                  goto LABEL_528;
                }
                goto LABEL_280;
              }
            }
            if (((*(unsigned __int8 *)(v121 + ((unsigned __int16)v96 >> 3)) >> (v96 & 7)) & 1) == 0) {
              goto LABEL_260;
            }
LABEL_280:
            uint64_t v124 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v223, "rangeOfComposedCharacterSequenceAtIndex:", v228 + v43 + v119, v217);
            unint64_t v229 = v124;
            uint64_t v126 = v124 - v228;
            if ((uint64_t)(v124 - v228) >= 0)
            {
              uint64_t v127 = v125;
              uint64_t v128 = v248;
              if (v126 + v125 <= (uint64_t)v248)
              {
                if (theString[1])
                {
                  uint64_t v129 = v125;
                  v130 = (UniChar *)theString[1] + *((void *)&v247 + 1) + v126;
                }
                else
                {
                  if (v125 > 64) {
                    goto LABEL_528;
                  }
                  if (v126 + v125 > v249 || v126 < *((uint64_t *)&v248 + 1))
                  {
                    if (v126 + 64 < (uint64_t)v248) {
                      uint64_t v128 = v126 + 64;
                    }
                    *((void *)&v248 + 1) = v124 - v228;
                    uint64_t v249 = v128;
                    v131.length = v128 - v126;
                    if ((void)v247)
                    {
                      if (v131.length)
                      {
                        v132 = (char *)(v247 + v217 + v124 + *((void *)&v247 + 1));
                        v133 = buffer;
                        do
                        {
                          UniChar v134 = *v132++;
                          *v133++ = v134;
                          --v131.length;
                        }
                        while (v131.length);
                      }
                    }
                    else
                    {
                      v131.location = *((void *)&v247 + 1) + v126;
                      CFStringGetCharacters(theString[0], v131, buffer);
                    }
                  }
                  uint64_t v129 = v127;
                  v130 = &buffer[v126 - *((void *)&v248 + 1)];
                }
                uint64_t v197 = (uint64_t)v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1) {
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                  }
                  uint64_t v197 = NSDefaultFont__defaultFont;
                }
                uint64_t v198 = [v230 attributesAtIndex:v229 effectiveRange:0];
                v199 = (void *)v197;
                uint64_t v19 = v129;
                v200 = (void *)[v199 bestMatchingFontForCharacters:v130 length:v129 attributes:v198 actualCoveredLength:0];
                if (v200)
                {
                  unint64_t v18 = v200;
                  char v221 = [v200 _isDefaultFace];
                  if ((v221 & 1) == 0) {
                    CFCharacterSetRef v222 = (const __CFCharacterSet *)[v18 coveredCharacterSet];
                  }
                  location = v228;
                  NSUInteger v43 = v19 - v228 + v229;
                  goto LABEL_560;
                }
              }
            }
LABEL_528:
            location = v228;
            uint64_t v201 = v43 + v119;
            if ((uint64_t)(v43 + v119) < 0)
            {
              unint64_t v18 = 0;
              uint64_t v19 = v232;
            }
            else
            {
              uint64_t v19 = v232;
              if (v201 + v232 <= (uint64_t)v248)
              {
                if (theString[1])
                {
                  v202 = (UniChar *)theString[1] + *((void *)&v247 + 1) + v201;
                }
                else
                {
                  if (v201 + v232 > v249 || v201 < *((uint64_t *)&v248 + 1))
                  {
                    uint64_t v203 = v201 + 64;
                    if (v201 + 64 >= (uint64_t)v248) {
                      uint64_t v203 = v248;
                    }
                    *((void *)&v248 + 1) = v43 + v119;
                    uint64_t v249 = v203;
                    v204.location = *((void *)&v247 + 1) + v201;
                    v204.length = v203 - v201;
                    if ((void)v247)
                    {
                      if (v204.length)
                      {
                        v205 = (char *)(v247 + v204.location);
                        NSUInteger v206 = v119 + v43 - v203;
                        v207 = buffer;
                        do
                        {
                          UniChar v208 = *v205++;
                          *v207++ = v208;
                        }
                        while (!__CFADD__(v206++, 1));
                      }
                    }
                    else
                    {
                      CFStringGetCharacters(theString[0], v204, buffer);
                    }
                  }
                  v202 = &buffer[v201 - *((void *)&v248 + 1)];
                }
                v210 = v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1) {
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                  }
                  v210 = NSDefaultFont__defaultFont;
                }
                unint64_t v18 = objc_msgSend(v210, "bestMatchingFontForCharacters:length:attributes:actualCoveredLength:", v202, v232, objc_msgSend(v230, "attributesAtIndex:effectiveRange:", v120, 0, v217), 0);
                if (!v18)
                {
                  v211 = v233;
                  if (!v233)
                  {
                    if (NSDefaultFont_onceToken != -1) {
                      dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
                    }
                    v211 = NSDefaultFont__defaultFont;
                  }
                  unint64_t v18 = (void *)[v211 lastResortFont];
                }
                if ([v18 _isDefaultFace])
                {
LABEL_557:
                  char v221 = 1;
                }
                else
                {
                  CFCharacterSetRef v222 = (const __CFCharacterSet *)[v18 coveredCharacterSet];
                  char v221 = 0;
                }
              }
              else
              {
                unint64_t v18 = 0;
              }
            }
            goto LABEL_559;
          }
LABEL_211:
          if (v45 == 8208) {
            UTF32Char v96 = 45;
          }
          else {
            UTF32Char v96 = v42;
          }
          if (!v227 || v45 != 8208) {
            goto LABEL_231;
          }
          unsigned int v110 = (uint64_t)theSet[1] & 4;
          if (HIDWORD(theSet[1]) > 0x2D || v237 < 0x2E)
          {
            NSUInteger v17 = v41;
            if (((uint64_t)theSet[1] & 4) != 0) {
              goto LABEL_484;
            }
          }
          else
          {
            NSUInteger v17 = v41;
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              UTF32Char v96 = 45;
              if (CFCharacterSetIsLongCharacterMember(theSet[0], 0x2Du)) {
                goto LABEL_484;
              }
              goto LABEL_231;
            }
            if (*((void *)&v237 + 1))
            {
              if ((uint64_t)theSet[1])
              {
                unsigned int v144 = v110 >> 2;
                uint64_t v145 = **((unsigned char **)&v237 + 1);
                if (**((unsigned char **)&v237 + 1))
                {
                  if (v145 == 255)
                  {
                    unsigned int v144 = v110 == 0;
                  }
                  else
                  {
                    BOOL v189 = v110 == 0;
                    if ((*(unsigned char *)(*((void *)&v237 + 1) + 32 * v145 + 229) & 0x20) != 0) {
                      unsigned int v144 = v189;
                    }
                  }
                }
                if (v144) {
                  goto LABEL_484;
                }
              }
              else
              {
                BOOL v80 = v110 == 0;
                BOOL v111 = v110 != 0;
                char v112 = v80;
                if ((*(unsigned char *)(*((void *)&v237 + 1) + 5) & 0x20) != 0) {
                  BOOL v111 = v112;
                }
                if (v111) {
                  goto LABEL_484;
                }
              }
            }
            else
            {
              BOOL v80 = v110 == 0;
              BOOL v142 = v110 != 0;
              char v143 = v80;
              if (((uint64_t)theSet[1] & 1) == 0) {
                BOOL v142 = v143;
              }
              if (v142)
              {
LABEL_484:
                if (!v18)
                {
                  location = v228;
                  goto LABEL_486;
                }
                uint64_t v19 = v231;
                objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v231);
                location = v228;
                if (v224)
                {
                  uint64_t v103 = (uint64_t)v233;
                  if (v233) {
                    goto LABEL_491;
                  }
                  if (NSDefaultFont_onceToken == -1) {
                    goto LABEL_490;
                  }
                  goto LABEL_563;
                }
                goto LABEL_452;
              }
            }
          }
          NSUInteger v41 = v17;
          UTF32Char v96 = 45;
          goto LABEL_231;
        }
        unsigned int v108 = v91 >> 2;
        uint64_t v109 = *(unsigned __int8 *)(*((void *)&v237 + 1) + ((unint64_t)v42 >> 8));
        if (*(unsigned char *)(*((void *)&v237 + 1) + ((unint64_t)v42 >> 8)))
        {
          if (v109 == 255)
          {
            unsigned int v108 = v91 == 0;
          }
          else
          {
            BOOL v148 = v91 == 0;
            if ((((unint64_t)*(unsigned __int8 *)(*((void *)&v237 + 1)
                                                        + 32 * v109
                                                        + (v42 >> 3)
                                                        + 224) >> (v42 & 7)) & 1) != 0)
              unsigned int v108 = v148;
          }
        }
        if (!v108) {
          goto LABEL_166;
        }
      }
      else
      {
        BOOL v80 = v91 == 0;
        BOOL v106 = v91 != 0;
        char v107 = v80;
        if (((uint64_t)theSet[1] & 1) == 0) {
          BOOL v106 = v107;
        }
        if (!v106) {
          goto LABEL_166;
        }
      }
LABEL_174:
      BOOL v97 = v18 == 0;
      if (v16 == v20 || !v18) {
        goto LABEL_179;
      }
      unsigned int v98 = (unsigned __int16)v42;
      if (!WORD1(v42)) {
        goto LABEL_177;
      }
      uint64_t v100 = CFUniCharGetBitmapPtrForPlane();
      int v101 = 0;
      char v99 = BYTE4(v225);
      if (!v100) {
        goto LABEL_187;
      }
LABEL_178:
      int v102 = (*(unsigned __int8 *)(v100 + ((unint64_t)v98 >> 3)) >> (v98 & 7)) & 1;
LABEL_188:
      if (v42 == 8205) {
        char v104 = 1;
      }
      else {
        char v104 = v99;
      }
      if ((v42 - 127995) >= 5
        && (v104 & 1) == 0
        && v225 != 63600
        && (v42 - 4448) >= 0x9A
        && (v102 & 1) == 0)
      {
        if (v101)
        {
          uint64_t v105 = fixFontAttributeInRange__graphemeBMP;
          if (!fixFontAttributeInRange__graphemeBMP) {
            goto LABEL_180;
          }
        }
        else
        {
          uint64_t v105 = CFUniCharGetBitmapPtrForPlane();
          if (!v105) {
            goto LABEL_180;
          }
        }
        if (((*(unsigned __int8 *)(v105 + ((unint64_t)v98 >> 3)) >> (v98 & 7)) & 1) == 0) {
          goto LABEL_180;
        }
      }
      goto LABEL_211;
    }
    location = v228;
    NSUInteger v62 = v36 + v228;
    uint64_t v63 = -2;
    if (WORD1(v42))
    {
      uint64_t v64 = 2;
    }
    else
    {
      uint64_t v63 = -1;
      uint64_t v64 = 1;
    }
    unint64_t v65 = v62 + v63;
    unint64_t v66 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v223, "rangeOfComposedCharacterSequenceAtIndex:", v62 + v63, v217);
    NSUInteger v17 = v41;
    uint64_t v19 = v231;
    if (v66 >= v65) {
      goto LABEL_514;
    }
    unint64_t v68 = v66;
    uint64_t v69 = v66 - v228;
    if ((uint64_t)(v66 - v228) < 0) {
      goto LABEL_514;
    }
    uint64_t v70 = v67;
    uint64_t v71 = v248;
    if (v69 + v67 > (uint64_t)v248) {
      goto LABEL_514;
    }
    if (theString[1])
    {
      v72 = (UniChar *)theString[1] + *((void *)&v247 + 1) + v69;
      v73 = v233;
    }
    else
    {
      if (v67 > 64) {
        goto LABEL_514;
      }
      v73 = v233;
      if (v69 + v67 > v249 || v69 < *((uint64_t *)&v248 + 1))
      {
        if (v69 + 64 < (uint64_t)v248) {
          uint64_t v71 = v69 + 64;
        }
        *((void *)&v248 + 1) = v66 - v228;
        uint64_t v249 = v71;
        v83.length = v71 - v69;
        if ((void)v247)
        {
          if (v83.length)
          {
            v84 = (char *)(v247 + v217 + v66 + *((void *)&v247 + 1));
            v85 = buffer;
            do
            {
              UniChar v86 = *v84++;
              *v85++ = v86;
              --v83.length;
            }
            while (v83.length);
          }
        }
        else
        {
          v83.location = *((void *)&v247 + 1) + v69;
          CFStringGetCharacters(theString[0], v83, buffer);
        }
      }
      v72 = &buffer[v69 - *((void *)&v248 + 1)];
    }
    v190 = v73;
    if (!v73)
    {
      if (NSDefaultFont_onceToken != -1) {
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
      }
      v190 = NSDefaultFont__defaultFont;
    }
    v191 = objc_msgSend(v190, "bestMatchingFontForCharacters:length:attributes:actualCoveredLength:", v72, v70, objc_msgSend(v230, "attributesAtIndex:effectiveRange:", v68, 0), 0);
    location = v228;
    if (!v191)
    {
LABEL_514:
      if (v18) {
        uint64_t v196 = v64;
      }
      else {
        uint64_t v196 = 0;
      }
      uint64_t v19 = v196 + v231;
      goto LABEL_560;
    }
    v192 = v191;
    if ([v191 isEqual:v233]) {
      goto LABEL_560;
    }
    NSUInteger v193 = v17;
    if (v18)
    {
      unint64_t v194 = (NSIntersectsRange() & (v68 > v229)) != 0 ? v68 - v229 : v231;
      if (v194)
      {
        objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v194);
        if (v224)
        {
          uint64_t v195 = (uint64_t)v233;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1) {
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
            }
            uint64_t v195 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v195, v229, v194);
        }
      }
    }
    char v221 = [v192 _isDefaultFace];
    if ((v221 & 1) == 0) {
      CFCharacterSetRef v222 = (const __CFCharacterSet *)[v192 coveredCharacterSet];
    }
    NSUInteger v43 = v70 - v228 + v68;
    uint64_t v19 = v70;
    unint64_t v229 = v68;
    unint64_t v18 = v192;
    length = v226;
    NSUInteger v17 = v193;
LABEL_561:
    uint64_t v16 = v43;
  }
  while (v43 < length);
  if (v18 && (objc_msgSend(v230, "addAttribute:value:range:", @"NSFont", v18, v229, v19), v224))
  {
    uint64_t v212 = (uint64_t)v233;
    uint64_t v7 = v218;
    if (!v233)
    {
      if (NSDefaultFont_onceToken != -1) {
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
      }
      uint64_t v212 = NSDefaultFont__defaultFont;
    }
    objc_msgSend(v230, "addAttribute:value:range:", @"NSOriginalFont", v212, v229, v19, v217);
  }
  else
  {
    uint64_t v7 = v218;
  }
  v213 = v233;
LABEL_574:

  return MEMORY[0x192FADE90](v7);
}

- (uint64_t)_attributeFixingInProgress
{
  return 0;
}

- (uint64_t)convertWritingDirectionToBidiControlCharacters
{
  [a1 beginEditing];
  if ([a1 length])
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = [a1 convertWritingDirectionToBidiControlCharactersForParagraphAtIndex:v2];
      uint64_t v2 = v3 + v4;
    }
    while (v3 + v4 < (unint64_t)[a1 length]);
  }

  return [a1 endEditing];
}

- (unint64_t)convertWritingDirectionToBidiControlCharactersForParagraphAtIndex:()NSMutableAttributedStringKitAdditions
{
  v5 = (__CFString *)[a1 mutableString];
  unint64_t v32 = 0;
  unint64_t v33 = 0;
  uint64_t v31 = 0;
  unint64_t v27 = a1;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", a3, 0), "baseWritingDirection");
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  __int16 v28 = 0;
  -[__CFString getParagraphStart:end:contentsEnd:forRange:](v5, "getParagraphStart:end:contentsEnd:forRange:", &v33, &v31, &v32, a3, 0);
  unint64_t v7 = v32;
  unint64_t v8 = v33;
  BOOL v9 = v6 != -1 && v32 > v33;
  if (v9)
  {
    uint64_t v10 = _NSStringImputedBaseWritingDirectionAtIndex(v5, v33, v33, v32 - v33);
    if (v10 == -1 || v10 == v6)
    {
      unint64_t v7 = v32;
      unint64_t v8 = v33;
    }
    else
    {
      if (v6 == 1) {
        __int16 v12 = 8207;
      }
      else {
        __int16 v12 = 8206;
      }
      __int16 v28 = v12;
      uint64_t v13 = [NSString stringWithCharacters:&v28 length:1];
      [(__CFString *)v5 insertString:v13 atIndex:v33];
      unint64_t v8 = v33 + 1;
      unint64_t v7 = ++v32;
      ++v33;
      ++v31;
    }
  }
  if (v8 >= v7)
  {
    __int16 v28 = 8236;
LABEL_41:
    uint64_t v24 = v31;
    goto LABEL_42;
  }
  NSRange v14 = 0;
  unint64_t v15 = 0;
  unint64_t v26 = @"NSWritingDirection";
  do
  {
    uint64_t v16 = objc_msgSend(v27, "attribute:atIndex:longestEffectiveRange:inRange:", v26, v8, &v29, v8, v7 - v8, v26);
    unint64_t v17 = [v16 count];
    unint64_t v18 = v17;
    unint64_t v19 = 0;
    if (v15 >= v17) {
      unint64_t v20 = v17;
    }
    else {
      unint64_t v20 = v15;
    }
    if (v20)
    {
      while (objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v19), "isEqual:", objc_msgSend(v14, "objectAtIndex:", v19)))
      {
        if (v20 == ++v19)
        {
          unint64_t v19 = v20;
          break;
        }
      }
    }
    __int16 v28 = 8236;
    BOOL v9 = v15 > v19;
    unint64_t v21 = v15 - v19;
    if (v9)
    {
      do
      {
        -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", [NSString stringWithCharacters:&v28 length:1], v8++);
        ++v31;
        ++v32;
        --v21;
      }
      while (v21);
    }
    if (v19 >= v18)
    {
      unint64_t v7 = v32;
    }
    else
    {
      do
      {
        __int16 v28 = 8234;
        char v22 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v19), "unsignedIntegerValue");
        if (v22) {
          ++v28;
        }
        if ((v22 & 2) != 0) {
          v28 += 3;
        }
        -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", [NSString stringWithCharacters:&v28 length:1], v8++);
        unint64_t v7 = v32 + 1;
        ++v31;
        ++v32;
        ++v19;
      }
      while (v18 != v19);
    }
    v8 += v30;
    NSRange v14 = v16;
    unint64_t v15 = v18;
  }
  while (v8 < v7);
  __int16 v28 = 8236;
  if (!v18) {
    goto LABEL_41;
  }
  do
  {
    uint64_t v23 = [NSString stringWithCharacters:&v28 length:1];
    [(__CFString *)v5 insertString:v23 atIndex:v32];
    uint64_t v24 = ++v31;
    ++v32;
    --v18;
  }
  while (v18);
LABEL_42:
  objc_msgSend(v27, "removeAttribute:range:", @"NSWritingDirection", v33, v24 - v33);
  return v33;
}

- (unint64_t)_fixGlyphInfo:()NSMutableAttributedStringKitAdditions inRange:
{
  unint64_t result = objc_msgSend((id)objc_msgSend(a3, "_baseString"), "length");
  if (result <= a5)
  {
    unint64_t v10 = result;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSFont", a4, &v13, a4, a5);
    if (v13 == a4 && v14 == a5)
    {
      unint64_t result = objc_msgSend(a3, "_glyphForFont:baseString:", result, objc_msgSend((id)objc_msgSend(a1, "string"), "substringWithRange:", a4, v10));
      if (result) {
        unint64_t v12 = v10;
      }
      else {
        unint64_t v12 = 0;
      }
      a4 += v12;
      a5 -= v12;
    }
  }
  if (a5) {
    return objc_msgSend(a1, "removeAttribute:range:", NSGlyphInfoAttributeName, a4, a5);
  }
  return result;
}

- (void)setAlignment:()NSMutableAttributedStringKitAdditions range:
{
  if (a5)
  {
    unint64_t v8 = result;
    unint64_t v9 = a4 + a5;
    uint64_t v10 = [result zone];
    [v8 beginEditing];
    if (a4 < v9)
    {
      uint64_t v11 = a4;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        unint64_t v12 = (NSParagraphStyle *)objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v11, &v14, a4, a5);
        if (!v12) {
          unint64_t v12 = +[NSParagraphStyle defaultParagraphStyle];
        }
        if ([(NSParagraphStyle *)v12 alignment] != a3)
        {
          id v13 = [(NSParagraphStyle *)v12 mutableCopyWithZone:v10];
          [v13 setAlignment:a3];
          objc_msgSend(v8, "addAttribute:value:range:", @"NSParagraphStyle", v13, v14, v15);
        }
        uint64_t v11 = v15 + v14;
      }
      while (v15 + v14 < v9);
    }
    return (void *)[v8 endEditing];
  }
  return result;
}

- (void)setBaseWritingDirection:()NSMutableAttributedStringKitAdditions range:
{
  if (a5)
  {
    unint64_t v8 = result;
    unint64_t v9 = a4 + a5;
    uint64_t v10 = [result zone];
    [v8 beginEditing];
    if (a4 < v9)
    {
      uint64_t v11 = a4;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        unint64_t v12 = (NSParagraphStyle *)objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", v11, &v14, a4, a5);
        if (!v12) {
          unint64_t v12 = +[NSParagraphStyle defaultParagraphStyle];
        }
        if ([(NSParagraphStyle *)v12 baseWritingDirection] != a3)
        {
          id v13 = [(NSParagraphStyle *)v12 mutableCopyWithZone:v10];
          [v13 setBaseWritingDirection:a3];
          objc_msgSend(v8, "addAttribute:value:range:", @"NSParagraphStyle", v13, v14, v15);
        }
        uint64_t v11 = v15 + v14;
      }
      while (v15 + v14 < v9);
    }
    return (void *)[v8 endEditing];
  }
  return result;
}

- (uint64_t)_changeIntAttribute:()NSMutableAttributedStringKitAdditions by:range:
{
  uint64_t result = [a1 zone];
  if (a6)
  {
    uint64_t v12 = result;
    [a1 beginEditing];
    if (a5 < a5 + a6)
    {
      uint64_t v13 = a5;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v14 = (char *)objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", a3, v13, &v16, a5, a6);
        if (v14) {
          uint64_t v14 = (char *)[v14 integerValue];
        }
        if (&v14[a4])
        {
          uint64_t v15 = objc_msgSend((id)objc_msgSend(NSNumber, "allocWithZone:", v12), "initWithInteger:", &v14[a4]);
          objc_msgSend(a1, "addAttribute:value:range:", a3, v15, v16, v17);
        }
        else
        {
          objc_msgSend(a1, "removeAttribute:range:", a3, v16, v17);
        }
        uint64_t v13 = v17 + v16;
      }
      while (v17 + v16 < a5 + a6);
    }
    return [a1 endEditing];
  }
  return result;
}

- (uint64_t)superscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "_changeIntAttribute:by:range:", @"NSSuperScript", 1, a3, a4);
}

- (uint64_t)subscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "_changeIntAttribute:by:range:", @"NSSuperScript", -1, a3, a4);
}

- (uint64_t)unscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "removeAttribute:range:", @"NSSuperScript", a3, a4);
}

- (BOOL)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, a3, 0, a4, a5, a6) != 0;
}

- (BOOL)readFromFileURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, a3, 0, a4, a5, a6) != 0;
}

- (BOOL)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, 0, a3, a4, a5, a6) != 0;
}

- (uint64_t)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:
{
  return [a1 readFromURL:a3 options:a4 documentAttributes:a5 error:0];
}

- (uint64_t)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:
{
  return [a1 readFromData:a3 options:a4 documentAttributes:a5 error:0];
}

- (unint64_t)convertBidiControlCharactersToWritingDirectionForParagraphAtIndex:()NSMutableAttributedStringKitAdditions
{
  v5 = (void *)[a1 mutableString];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v16 = 0;
  uint64_t v7 = _NSBidiEmbeddingAndOverrideCharSet();
  objc_msgSend(v5, "getParagraphStart:end:contentsEnd:forRange:", &v18, &v16, &v17, a3, 0);
  unint64_t v8 = v17;
  unint64_t v9 = v18;
  if (v17 > v18)
  {
    int v10 = [v5 characterAtIndex:v18];
    unint64_t v9 = v18;
    if ((v10 & 0xFFFE) == 0x200E)
    {
      objc_msgSend(a1, "setBaseWritingDirection:range:", v10 == 8207, v18, v16 - v18);
      objc_msgSend(v5, "deleteCharactersInRange:", v18, 1);
      unint64_t v9 = v18;
      unint64_t v8 = v17 - 1;
      --v16;
      --v17;
    }
    else
    {
      unint64_t v8 = v17;
    }
  }
  if (v9 < v8)
  {
    do
    {
      uint64_t v11 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v7, 0, v9, v8 - v9);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v12 = v17;
      }
      else {
        unint64_t v12 = v11;
      }
      if (v12 > v9)
      {
        if ([v6 count]) {
          objc_msgSend(a1, "addAttribute:value:range:", @"NSWritingDirection", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", v6), v9, v12 - v9);
        }
        else {
          objc_msgSend(a1, "removeAttribute:range:", @"NSWritingDirection", v9, v12 - v9);
        }
      }
      unint64_t v8 = v17;
      if (v12 >= v17) {
        break;
      }
      unint64_t v9 = v12;
      switch([v5 characterAtIndex:v12])
      {
        case 0x202Au:
          uint64_t v13 = NSNumber;
          uint64_t v14 = 0;
          goto LABEL_21;
        case 0x202Bu:
          uint64_t v13 = NSNumber;
          uint64_t v14 = 1;
          goto LABEL_21;
        case 0x202Cu:
          if ([v6 count]) {
            [v6 removeLastObject];
          }
          break;
        case 0x202Du:
          uint64_t v13 = NSNumber;
          uint64_t v14 = 2;
          goto LABEL_21;
        case 0x202Eu:
          uint64_t v13 = NSNumber;
          uint64_t v14 = 3;
LABEL_21:
          objc_msgSend(v6, "addObject:", objc_msgSend(v13, "numberWithUnsignedInteger:", v14));
          break;
        default:
          break;
      }
      objc_msgSend(v5, "deleteCharactersInRange:", v12, 1);
      unint64_t v8 = v17 - 1;
      --v16;
      unint64_t v17 = v8;
    }
    while (v12 < v8);
  }
  if (v16 > v8) {
    objc_msgSend(a1, "removeAttribute:range:", @"NSWritingDirection");
  }
  return v18;
}

- (uint64_t)convertBidiControlCharactersToWritingDirection
{
  [a1 beginEditing];
  if ([a1 length])
  {
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = [a1 convertBidiControlCharactersToWritingDirectionForParagraphAtIndex:v2];
      uint64_t v2 = v3 + v4;
    }
    while (v3 + v4 < (unint64_t)[a1 length]);
  }

  return [a1 endEditing];
}

@end