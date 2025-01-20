@interface NSGlyphGenerator
+ (NSGlyphGenerator)sharedGlyphGenerator;
+ (id)defaultGlyphGenerator;
+ (void)initialize;
- (void)generateGlyphsForGlyphStorage:(id)glyphStorage desiredNumberOfCharacters:(NSUInteger)nChars glyphIndex:(NSUInteger *)glyphIndex characterIndex:(NSUInteger *)charIndex;
@end

@implementation NSGlyphGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "stringForKey:", @"NSGlyphGeneratorConcreteClassName");
    if (v2)
    {
      Class v3 = NSClassFromString(v2);
      if (v3) {
        __NSGlyphGeneratorConcreteClass = (uint64_t)v3;
      }
    }
  }
}

- (void)generateGlyphsForGlyphStorage:(id)glyphStorage desiredNumberOfCharacters:(NSUInteger)nChars glyphIndex:(NSUInteger *)glyphIndex characterIndex:(NSUInteger *)charIndex
{
  ((void (*)(NSGlyphGenerator *, SEL, id, NSUInteger, NSUInteger *, NSUInteger *))MEMORY[0x1F4188790])(self, a2, glyphStorage, nChars, glyphIndex, charIndex);
  v7 = v6;
  v9 = v8;
  unint64_t v11 = v10;
  v13 = v12;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  range.length = 0;
  unint64_t v101 = 0;
  v90 = (void *)[v12 attributedString];
  CFStringRef v14 = (const __CFString *)[v90 string];
  v86 = v7;
  unint64_t v88 = *v7;
  range.CFIndex location = *v7;
  theString = (__CFString *)v14;
  CFIndex Length = CFStringGetLength(v14);
  v87 = v9;
  uint64_t v16 = *v9;
  char v99 = [v13 layoutOptions];
  objc_opt_class();
  uint64_t v17 = 0;
  if (objc_opt_isKindOfClass()) {
    uint64_t v17 = [v13 delegate];
  }
  if (objc_opt_respondsToSelector()) {
    v18 = (void *)v17;
  }
  else {
    v18 = 0;
  }
  unint64_t v19 = Length - v88;
  unint64_t v20 = v88;
  if (v19 >= v11) {
    unint64_t v19 = v11;
  }
  unint64_t v89 = v19;
  unint64_t v91 = v19 + v88;
  if (v88 < v19 + v88)
  {
    unint64_t v21 = v88;
    v92 = v18;
    v93 = v13;
    while (1)
    {
      while (1)
      {
        v22 = objc_msgSend(v90, "attributesAtIndex:longestEffectiveRange:inRange:", v21, &range.length, v20, v89);
        font = (const __CTFont *)[v22 objectForKey:@"NSFont"];
        CFIndex location = range.length;
        unint64_t v24 = v101;
        if (range.length < (unint64_t)range.location)
        {
          unint64_t v24 = range.length - range.location + v101;
          range.length = range.location;
          unint64_t v101 = v24;
          CFIndex location = range.location;
        }
        if (v24 + location >= v91)
        {
          unint64_t v24 = v91 - range.location;
          unint64_t v101 = v91 - range.location;
        }
        if (v24 == 1
          && CFStringGetCharacterAtIndex(theString, range.location) == 65532
          && [v22 objectForKey:@"NSAttachment"])
        {
          v106[0] = -1;
          v105[0] = 2;
          if (!v18
            || (uint64_t v25 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, &range, font, v16, 1)) == 0)
          {
            objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, &range, font, v16, 1);
            uint64_t v25 = 1;
          }
          v16 += v25;
          unint64_t v21 = ++range.location;
          goto LABEL_195;
        }
        if (!font)
        {
          unint64_t v29 = v101;
          CFIndex v30 = range.location;
          *(void *)&__pattern8[0] = 1;
          bzero(v106, 0x800uLL);
          memset_pattern8(v105, __pattern8, 0x2000uLL);
          if (v29)
          {
            do
            {
              uint64_t v31 = 0;
              if (v29 >= 0x400) {
                uint64_t v32 = 1024;
              }
              else {
                uint64_t v32 = v29;
              }
              do
              {
                v104[v31] = v30 + v31;
                ++v31;
              }
              while (v32 != v31);
              if (!v18
                || (uint64_t v33 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, v104, 0, v16, v32)) == 0)
              {
                objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, v104, 0, v16, v32);
                uint64_t v33 = v32;
              }
              v16 += v33;
              v30 += v32;
              v29 -= v32;
            }
            while (v29);
            unint64_t v34 = v101;
            CFIndex v30 = range.location;
          }
          else
          {
            unint64_t v34 = 0;
          }
          unint64_t v21 = v30 + v34;
          goto LABEL_193;
        }
        v26 = (void *)[v22 objectForKey:NSGlyphInfoAttributeName];
        if (!v26) {
          break;
        }
        int v27 = objc_msgSend(v26, "_glyphForFont:baseString:", font, -[__CFString substringWithRange:](theString, "substringWithRange:", range.length, v101));
        if (!v27) {
          break;
        }
        if (v27 == 0xFFFFFF)
        {
          LOWORD(v27) = -1;
          uint64_t v28 = 2;
        }
        else
        {
          uint64_t v28 = 0;
        }
        v106[0] = v27;
        v105[0] = v28;
        if (!v18
          || (uint64_t v81 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, &range, font, v16, 1)) == 0)
        {
          objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, &range, font, v16, 1);
          uint64_t v81 = 1;
        }
        v16 += v81;
        unint64_t v21 = ++range.location;
        unint64_t v82 = --v101;
        if (!v101) {
          goto LABEL_194;
        }
        *(void *)&__pattern8[0] = 1;
        bzero(v106, 0x800uLL);
        memset_pattern8(v105, __pattern8, 0x2000uLL);
        do
        {
          uint64_t v83 = 0;
          if (v82 >= 0x400) {
            uint64_t v84 = 1024;
          }
          else {
            uint64_t v84 = v82;
          }
          do
          {
            v104[v83] = v21 + v83;
            ++v83;
          }
          while (v84 != v83);
          if (!v18
            || (uint64_t v85 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, v104, font, v16, v84)) == 0)
          {
            objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, v104, font, v16, v84);
            uint64_t v85 = v84;
          }
          v16 += v85;
          v21 += v84;
          v82 -= v84;
        }
        while (v82);
        unint64_t v21 = range.location + v101;
LABEL_193:
        range.CFIndex location = v21;
LABEL_194:
        unint64_t v20 = v88;
LABEL_195:
        if (v21 >= v91) {
          goto LABEL_198;
        }
      }
      unint64_t v35 = v101;
      unint64_t v21 = range.location;
      if (!v101) {
        goto LABEL_174;
      }
      do
      {
        if (v35 >= 0x400) {
          CFIndex v36 = 1024;
        }
        else {
          CFIndex v36 = v35;
        }
        v113.CFIndex location = v21;
        v113.length = v36;
        CFStringGetCharacters(theString, v113, v107);
        uint64_t v37 = 1023;
        if ((v107[1023] & 0xFC00) != 0xD800) {
          uint64_t v37 = 1024;
        }
        if (v35 <= 0x3FF) {
          CFIndex v38 = v36;
        }
        else {
          CFIndex v38 = v37;
        }
        CTFontGetGlyphsForCharacters(font, v107, v106, v38);
        CFIndex v39 = range.location;
        char v40 = [(__CTFont *)font _isDefaultFace];
        if (__NSInsertNominalGlyphs_onceToken != -1) {
          dispatch_once(&__NSInsertNominalGlyphs_onceToken, &__block_literal_global_12);
        }
        if ((v99 & 2) != 0)
        {
          *(void *)&__pattern8[0] = 0x20002E25CA2423;
          CTFontGetGlyphsForCharacters(font, (const UniChar *)__pattern8, v108, 4);
          uint64_t v41 = 0;
          do
          {
            int v42 = v108[v41];
            if (v108[v41]) {
              BOOL v43 = 1;
            }
            else {
              BOOL v43 = v41 == 3;
            }
            ++v41;
          }
          while (!v43);
        }
        else
        {
          int v42 = 0;
        }
        uint64_t v96 = v16;
        v44 = &v107[v38];
        __memset_chk();
        v45 = v104;
        CFIndex v95 = v38;
        do
        {
          *v45++ = v39++;
          --v38;
        }
        while (v38);
        uint64_t v46 = 0;
        int v97 = 0;
        v47 = v107;
        do
        {
          uint64_t v48 = 0;
          while (1)
          {
            v49 = v47 + 1;
            uint64_t v50 = *v47;
            uint64_t v51 = v48 + v46;
            unsigned int v52 = v106[v48 + v46];
            if ((v50 & 0xFC00) != 0xD800 || v49 >= v44)
            {
              ++v47;
            }
            else
            {
              int v54 = *v49;
              BOOL v55 = (v54 & 0xFC00) == 56320;
              unsigned int v56 = v54 + (v50 << 10) - 56613888;
              if (v55) {
                uint64_t v50 = v56;
              }
              else {
                uint64_t v50 = *v47;
              }
              if (v55) {
                v47 += 2;
              }
              else {
                ++v47;
              }
            }
            if (v52 == 0xFFFF)
            {
              v106[v51] = 0;
              goto LABEL_83;
            }
            if (v106[v48 + v46]) {
              char v57 = 0;
            }
            else {
              char v57 = v40;
            }
            if (v57) {
              goto LABEL_78;
            }
            if ((v40 & 1) == 0)
            {
              CGGlyph v58 = -1;
              if (v50 < 0x20) {
                goto LABEL_79;
              }
              uint64_t v59 = 2;
              if ((v50 - 127) < 0x21) {
                goto LABEL_80;
              }
              if ((v50 - 8232) < 2 || v50 == 173) {
                goto LABEL_79;
              }
              uint64_t v59 = 2;
              if (v50 == 65532) {
                goto LABEL_80;
              }
              if (WORD1(v50))
              {
                uint64_t BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
                if (!BitmapPtrForPlane) {
                  goto LABEL_144;
                }
LABEL_105:
                int v64 = (*(unsigned __int8 *)(BitmapPtrForPlane + ((unsigned __int16)v50 >> 3)) >> (v50 & 7)) & 1;
              }
              else
              {
                uint64_t BitmapPtrForPlane = __NSInsertNominalGlyphs_controlFormatBMP;
                if (__NSInsertNominalGlyphs_controlFormatBMP) {
                  goto LABEL_105;
                }
LABEL_144:
                LOBYTE(v64) = 0;
              }
              if (v50 >> 4 == 4064 || (v64 & 1) != 0 || (v50 - 917760) <= 0xEF)
              {
                if (v52 < 4) {
                  goto LABEL_78;
                }
                char v72 = [(id)_CTGetVisibleFormatterCharacterSet() longCharacterIsMember:v50];
                if ((v99 & 2) == 0 && (v50 & 0xFFFFFFFE) != 0xFE0E && (v72 & 1) == 0)
                {
                  if (WORD1(v50))
                  {
                    uint64_t v73 = CFUniCharGetBitmapPtrForPlane();
                    if (!v73) {
                      goto LABEL_78;
                    }
                  }
                  else
                  {
                    uint64_t v73 = __NSInsertNominalGlyphs_graphemeBMP;
                    if (!__NSInsertNominalGlyphs_graphemeBMP) {
                      goto LABEL_78;
                    }
                  }
                  if (((*(unsigned __int8 *)(v73 + ((unsigned __int16)v50 >> 3)) >> (v50 & 7)) & 1) == 0)
                  {
LABEL_78:
                    CGGlyph v58 = -1;
LABEL_79:
                    uint64_t v59 = 2;
LABEL_80:
                    v106[v51] = v58;
LABEL_81:
                    v105[v51] |= v59;
LABEL_82:
                    if (v106[v51]) {
                      goto LABEL_84;
                    }
LABEL_83:
                    v105[v51] |= 1uLL;
                    goto LABEL_84;
                  }
                }
              }
            }
            if (v50 < 0x10000)
            {
              uint64_t UnicodePropertyDataForPlane = __NSInsertNominalGlyphs_bidiPropertyBMP;
              if (!__NSInsertNominalGlyphs_bidiPropertyBMP) {
                goto LABEL_112;
              }
            }
            else
            {
              uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
              if (!UnicodePropertyDataForPlane) {
                goto LABEL_112;
              }
            }
            unsigned int v65 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + BYTE1(v50));
            if (v65 >= 0x13) {
              unsigned int v65 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v65 << 8) - 4864 + v50 + 256);
            }
            if (v65 == 12)
            {
              CGGlyph v58 = v42;
              uint64_t v59 = 4;
              if (v42) {
                goto LABEL_80;
              }
              goto LABEL_81;
            }
LABEL_112:
            if (v50 == 160)
            {
              if (v52 > 3)
              {
                int v66 = v97;
                if (v97) {
                  goto LABEL_117;
                }
              }
              else
              {
                int v66 = v97;
                if (!v97)
                {
                  UniChar characters = 32;
                  CGGlyph glyphs = 0;
                  CTFontGetGlyphsForCharacters(font, &characters, &glyphs, 1);
                  int v66 = glyphs;
                }
                if (v66)
                {
LABEL_117:
                  int v60 = 0;
                  int v97 = v66;
                  v106[v51] = v66;
                  goto LABEL_87;
                }
              }
              int v97 = 0;
              goto LABEL_82;
            }
            if (v52 > 3 || (v50 & 0xFFFFFFFE) != 0x2010) {
              goto LABEL_82;
            }
            UniChar characters = 45;
            CGGlyph glyphs = 0;
            CTFontGetGlyphsForCharacters(font, &characters, &glyphs, 1);
            int v67 = glyphs;
            v106[v51] = glyphs;
            if (!v67) {
              goto LABEL_83;
            }
LABEL_84:
            if (v50 < 0x10000)
            {
              int v60 = 0;
            }
            else
            {
              v105[v51 + 1] = v105[v51];
              int v60 = 1;
            }
LABEL_87:
            if ((v99 & 1) != 0
              && (v105[v51] & 2) != 0
              && (v50 < 0x20 || (v50 - 127) <= 0x20)
              && (CFUniCharIsMemberOf() & 1) == 0)
            {
              v111[0] = 94;
              if (v50 < 0x80)
              {
                uint64_t v61 = 1;
              }
              else
              {
                v111[1] = 126;
                uint64_t v61 = 2;
              }
              UniChar v68 = v50 & 0x3F | 0x40;
              if (v50 == 127) {
                UniChar v68 = 63;
              }
              uint64_t v69 = v61 + 1;
              v111[v61] = v68;
              if (CTFontGetGlyphsForCharacters(font, v111, v110, v61 + 1)) {
                break;
              }
            }
            if (v40) {
              goto LABEL_137;
            }
            if (WORD1(v50))
            {
              uint64_t v70 = CFUniCharGetBitmapPtrForPlane();
              if (!v70) {
                goto LABEL_132;
              }
            }
            else
            {
              uint64_t v70 = __NSInsertNominalGlyphs_nonBaseSetBMP;
              if (!__NSInsertNominalGlyphs_nonBaseSetBMP) {
                goto LABEL_132;
              }
            }
            if ((*(unsigned __int8 *)(v70 + ((unsigned __int16)v50 >> 3)) >> (v50 & 7))) {
              goto LABEL_135;
            }
LABEL_132:
            if ((v50 - 4448) < 0x9A || (v50 & 0x1FFFF0) == 0xF860 && v47 < v44)
            {
LABEL_135:
              v105[v51] |= 8uLL;
              if (v60) {
                v105[v51 + 1] |= 8uLL;
              }
            }
LABEL_137:
            uint64_t v71 = 1;
            if (v60) {
              uint64_t v71 = 2;
            }
            v48 += v71;
            if (v47 >= v44)
            {
              if (v48)
              {
                if (!v92
                  || (uint64_t v80 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, &v106[v46], &v105[v46], &v104[v46], font, v96, v48)) == 0)
                {
                  objc_msgSend(v93, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", &v106[v46], &v105[v46], &v104[v46], font, v96, v48);
                  uint64_t v80 = v48;
                }
                v96 += v80;
              }
              goto LABEL_173;
            }
          }
          if (v48)
          {
            v74 = &v106[v46];
            v75 = &v105[v46];
            v76 = &v104[v46];
            v77 = v93;
            if (!v92
              || (uint64_t v78 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, v74, v75, v76, font, v96, v48), v77 = v93, v74 = &v106[v46], !v78))
            {
              objc_msgSend(v77, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v74, v75, v76, font, v96, v48);
              uint64_t v78 = v48;
            }
            v96 += v78;
            uint64_t v46 = v51 + 1;
          }
          memset(__pattern8, 0, sizeof(__pattern8));
          memset_pattern8(v108, &v104[v51], 8 * v69);
          if (!v92
            || (uint64_t v79 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, v110, __pattern8, v108, font, v96, v69)) == 0)
          {
            objc_msgSend(v93, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v110, __pattern8, v108, font, v96, v69);
            uint64_t v79 = v69;
          }
          v96 += v79;
        }
        while (v47 < v44);
LABEL_173:
        uint64_t v16 = v96;
        unint64_t v21 = range.location + v95;
        range.location += v95;
        unint64_t v35 = v101 - v95;
        v101 -= v95;
      }
      while (v101);
LABEL_174:
      v18 = v92;
      v13 = v93;
      unint64_t v20 = v88;
      if (v21 >= v91) {
        goto LABEL_198;
      }
    }
  }
  unint64_t v21 = v88;
LABEL_198:
  void *v86 = v21;
  uint64_t *v87 = v16;
}

+ (id)defaultGlyphGenerator
{
  v2 = (void *)__NSGlyphGeneratorConcreteClass;
  if (__NSGlyphGeneratorConcreteClass)
  {
    return (id)[v2 sharedGlyphGenerator];
  }
  else
  {
    if (defaultGlyphGenerator_onceToken != -1) {
      dispatch_once(&defaultGlyphGenerator_onceToken, &__block_literal_global_11);
    }
    return (id)defaultGlyphGenerator_glyphGenerator;
  }
}

NSGlyphGenerator *__41__NSGlyphGenerator_defaultGlyphGenerator__block_invoke()
{
  result = objc_alloc_init(NSGlyphGenerator);
  defaultGlyphGenerator_glyphGenerator = (uint64_t)result;
  return result;
}

+ (NSGlyphGenerator)sharedGlyphGenerator
{
  v2 = objc_opt_class();

  return (NSGlyphGenerator *)[v2 defaultGlyphGenerator];
}

@end