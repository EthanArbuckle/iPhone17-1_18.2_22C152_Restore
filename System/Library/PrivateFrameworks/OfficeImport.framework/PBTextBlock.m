@interface PBTextBlock
+ (void)applyTextRuler:(void *)a3 toTextBlock:(id)a4;
+ (void)readClientTextBox:(id)a3 textBody:(id)a4 state:(id)a5;
+ (void)readFromStyledText:(__CFAttributedString *)a3 toStyledPargraphs:(__CFArray *)a4;
+ (void)readFromTextBlock:(id)a3 toStyledText:(__CFAttributedString *)a4;
+ (void)readParagraph:(id)a3 paragraph:(__CFAttributedString *)a4 textType:(int)a5 state:(id)a6;
@end

@implementation PBTextBlock

+ (void)readClientTextBox:(id)a3 textBody:(id)a4 state:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(PptTextBlock);
  [(PptTextBlock *)v10 readTextBlock:v22];
  uint64_t v11 = [(PptTextBlock *)v10 textRuler];
  if (v11) {
    [a1 applyTextRuler:v11 toTextBlock:v10];
  }
  uint64_t v12 = [(PptTextBlock *)v10 textType];
  v13 = [(PptTextBlock *)v10 text];
  v14 = [v13 stringByAppendingString:@"\r"];

  CFDictionaryRef v15 = [NSDictionary dictionary];
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAttributedStringRef v17 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v14, v15);

  MutableCopy = CFAttributedStringCreateMutableCopy(v16, 0, v17);
  CFRelease(v17);
  CFAttributedStringBeginEditing(MutableCopy);
  [a1 readFromTextBlock:v10 toStyledText:MutableCopy];
  CFAttributedStringEndEditing(MutableCopy);
  CFArrayRef Mutable = CFArrayCreateMutable(v16, 0, MEMORY[0x263EFFF70]);
  [a1 readFromStyledText:MutableCopy toStyledPargraphs:Mutable];
  for (unint64_t i = 0; i < CFArrayGetCount(Mutable); ++i)
  {
    v21 = [v8 addParagraph];
    objc_msgSend(a1, "readParagraph:paragraph:textType:state:", v21, CFArrayGetValueAtIndex(Mutable, i), v12, v9);
  }
  CFRelease(Mutable);
  CFRelease(MutableCopy);
}

+ (void)readFromTextBlock:(id)a3 toStyledText:(__CFAttributedString *)a4
{
  id v47 = a3;
  int Length = CFAttributedStringGetLength(a4);
  int v6 = [v47 paragraphRunCount];
  unint64_t v7 = 0x263F08000uLL;
  if (v6 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = 0;
    do
    {
      v10 = (int *)[v47 paragraphRunAtIndex:v9];
      int v11 = *v10;
      verifyRangeValidity(v8, *v10, Length);
      uint64_t v12 = [MEMORY[0x263F08D40] valueWithPointer:v10];
      v49.location = v8;
      v49.length = v11;
      CFAttributedStringSetAttribute(a4, v49, @"PptParagraphPropertyRunAttribute", v12);

      v8 += v11;
      uint64_t v9 = (v9 + 1);
    }
    while (v6 != v9);
  }
  int v13 = [v47 characterRunCount];
  if (v13 >= 1)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    do
    {
      CFAllocatorRef v16 = (int *)[v47 characterRunAtIndex:v15];
      int v17 = *v16;
      verifyRangeValidity(v14, *v16, Length);
      v18 = [MEMORY[0x263F08D40] valueWithPointer:v16];
      v50.location = v14;
      v50.length = v17;
      CFAttributedStringSetAttribute(a4, v50, @"PptCharacterPropertyRunAttribute", v18);

      v14 += v17;
      uint64_t v15 = (v15 + 1);
    }
    while (v13 != v15);
  }
  int v19 = [v47 specialInfoRunCount];
  if (v19 >= 1)
  {
    uint64_t v20 = 0;
    int v21 = 0;
    do
    {
      id v22 = (int *)[v47 specialInfoRunAtIndex:v20];
      int v23 = *v22;
      verifyRangeValidity(v21, *v22, Length);
      v24 = [MEMORY[0x263F08D40] valueWithPointer:v22];
      v51.location = v21;
      v51.length = v23;
      CFAttributedStringSetAttribute(a4, v51, @"PptSpecialInfoRunAttribute", v24);

      v21 += v23;
      uint64_t v20 = (v20 + 1);
    }
    while (v19 != v20);
  }
  v25 = [v47 hyperlinks];
  v46 = v25;
  uint64_t v26 = [v25 count];
  if (v26)
  {
    uint64_t v27 = 0;
    v45 = @"PptClickHyperlinkRunAttribute";
    do
    {
      v28 = objc_msgSend(v25, "objectAtIndex:", v27, v45);
      v29 = (unsigned int *)[v28 txtInteractiveInfoAtom];
      CFIndex v30 = v29[12];
      if ((int)v29[13] >= Length) {
        int v31 = Length;
      }
      else {
        int v31 = v29[13];
      }
      if ((v30 & 0x80000000) == 0 && v31 > (int)v30)
      {
        unint64_t v32 = v7;
        int Instance = EshRecord::getInstance((EshRecord *)v29);
        v34 = @"PptHoverHyperlinkRunAttribute";
        if (Instance != 1) {
          v34 = v45;
        }
        v35 = v34;
        int v36 = v31 - v30;
        verifyRangeValidity(v30, v31 - v30, Length);
        v37 = [*(id *)(v32 + 3392) valueWithPointer:v28];
        v52.length = v36;
        v52.location = v30;
        CFAttributedStringSetAttribute(a4, v52, v35, v37);

        unint64_t v7 = v32;
        v25 = v46;
      }

      ++v27;
    }
    while (v26 != v27);
  }

  v38 = [v47 metaCharacterFields];
  uint64_t v39 = [v38 count];
  if (v39)
  {
    uint64_t v40 = 0;
    while (1)
    {
      v41 = [v38 objectAtIndex:v40];
      int v42 = [v41 position];
      int v43 = v42;
      if (v42 > Length) {
        break;
      }
      verifyRangeValidity(v42, 1, Length);
      v44 = [*(id *)(v7 + 3392) valueWithPointer:v41];
      v53.location = v43;
      v53.length = 1;
      CFAttributedStringSetAttribute(a4, v53, @"PptMetaCharacterRunAttribute", v44);

      if (v39 == ++v40) {
        goto LABEL_27;
      }
    }
  }
LABEL_27:
}

+ (void)readFromStyledText:(__CFAttributedString *)a3 toStyledPargraphs:(__CFArray *)a4
{
  CFAttributedStringGetString(a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = [v15 componentsSeparatedByString:@"\r"];
  uint64_t v7 = [v6 count];
  uint64_t v8 = v7 - 1;
  if (v7 != 1)
  {
    uint64_t v9 = 0;
    CFIndex v10 = 0;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      uint64_t v12 = [v6 objectAtIndex:v9];
      CFIndex v13 = [v12 length] + 1;
      v17.location = v10;
      v17.length = v13;
      CFAttributedStringRef v14 = CFAttributedStringCreateWithSubstring(v11, a3, v17);
      CFArrayAppendValue(a4, v14);
      CFRelease(v14);
      v10 += v13;

      ++v9;
    }
    while (v8 != v9);
  }
}

+ (void)readParagraph:(id)a3 paragraph:(__CFAttributedString *)a4 textType:(int)a5 state:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v50 = a3;
  id v51 = a6;
  if ([v51 hasCurrentSourceMasterStyleInfoVector]) {
    uint64_t v9 = [v51 currentSourceMasterStyleInfoOfType:v7];
  }
  else {
    uint64_t v9 = 0;
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAttributedStringRef Copy = CFAttributedStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a4);
  effectiveRange.location = 0;
  effectiveRange.length = 0;
  CFStringRef String = CFAttributedStringGetString(Copy);
  CFIndex Length = CFStringGetLength(String);
  CFIndex v13 = [v51 currentBulletStyle];
  CFAttributedStringRef v14 = (const void *)[v13 eshObject];
  if (v14) {
  else
  }
    id v15 = 0;
  v48 = CFAttributedStringGetAttributes(Copy, 0, &effectiveRange);
  CFRange v49 = [v48 objectForKey:@"PptParagraphPropertyRunAttribute"];
  aStr = a4;
  v45 = v13;
  if (v49)
  {
    CFAllocatorRef v16 = [v50 properties];
    uint64_t v17 = [v49 pointerValue];
    uint64_t v18 = v17;
    if (v9 && v17)
    {
      if (*(void *)v9)
      {
        unsigned int v19 = *(unsigned __int16 *)(v17 + 4);
        LevelReference = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference(*(PptTextMasterStyleAtom **)v9, v19);
        PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)(v18 + 8), LevelReference);
      }
      else
      {
        unsigned int v19 = 0;
      }
    }
    else
    {
      unsigned int v19 = 0;
      if (!v9) {
        goto LABEL_19;
      }
    }
    int v21 = *(PptTextMasterStyleAtom **)(v9 + 8);
    if (v21)
    {
      id v22 = (const PptParaProperty9 *)PptTextMasterStyleAtom::getLevelReference(v21, v19);
      if (!v15) {
        goto LABEL_26;
      }
      goto LABEL_20;
    }
LABEL_19:
    id v22 = 0;
    if (!v15)
    {
LABEL_26:
      if (v15) {
        uint64_t v27 = v15;
      }
      else {
        uint64_t v27 = v22;
      }
      +[PBParagraphProperties readParagraphProperties:v16 paragraphPropertyRun:v18 bulletStyle:v27 state:v51];

      goto LABEL_30;
    }
LABEL_20:
    int v23 = objc_msgSend(v48, "objectForKey:", @"PptCharacterPropertyRunAttribute", v16, aStr, v13);
    uint64_t v24 = [v23 pointerValue];

    if (v24)
    {
      unint64_t v25 = ((unint64_t)*(unsigned __int16 *)(v24 + 8) >> 10) & 0xF;
      uint64_t v26 = *(void *)&v15[4].var0;
      CFAllocatorRef v16 = v43;
      if (v25 >= (unsigned __int16)((*(_DWORD *)&v15[4].var3 - v26) >> 3))
      {
        id v15 = 0;
      }
      else
      {
        id v15 = *(const PptParaProperty9 **)(v26 + 8 * v25);
        if (v22) {
          PptParaProperty9::copyOverridesFromParent(*(PptParaProperty9 **)(v26 + 8 * v25), v22);
        }
      }
    }
    else
    {
      id v15 = 0;
      CFAllocatorRef v16 = v43;
    }
    goto LABEL_26;
  }
  unsigned int v19 = 0;
LABEL_30:
  if (v9 && *(void *)v9)
  {
    uint64_t v28 = PptTextMasterStyleAtom::getLevelReference(*(PptTextMasterStyleAtom **)v9, v19);
    v29 = [v50 properties];
    CFIndex v30 = (const PptCharProperty *)(v28 + 48);
    +[PBCharacterProperties readCharacterProperties:v29 characterProperty:v28 + 48 state:v51];
    uint64_t v31 = Length;
  }
  else
  {
    CFIndex v30 = 0;
    uint64_t v31 = Length;
  }
  CFIndex v32 = v31 - 1;
  id v47 = CFAttributedStringGetAttribute(Copy, v31 - 1, @"PptCharacterPropertyRunAttribute", 0);
  uint64_t v33 = [v47 pointerValue];
  if (v33)
  {
    uint64_t v34 = v33 + 4;
    if (v30) {
      PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v33 + 4), v30);
    }
    v35 = [v50 paragraphEndCharacterProperties];
    +[PBCharacterProperties readCharacterProperties:v35 characterProperty:v34 state:v51];
  }
  CFRelease(Copy);
  v54.location = 0;
  v54.length = v31 - 1;
  CFAttributedStringRef v36 = CFAttributedStringCreateWithSubstring(v10, aStr, v54);
  if (v31 >= 2)
  {
    CFIndex v37 = 0;
    do
    {
      longestEffectiveRange.location = 0;
      longestEffectiveRange.length = 0;
      v55.location = 0;
      v55.length = v32;
      v38 = CFAttributedStringGetAttributesAndLongestEffectiveRange(v36, v37, v55, &longestEffectiveRange);
      uint64_t v39 = [v38 objectForKey:@"PptCharacterPropertyRunAttribute"];
      uint64_t v40 = [v39 pointerValue];

      if (v30 && v40) {
        PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v40 + 4), v30);
      }
      CFAttributedStringRef v41 = CFAttributedStringCreateWithSubstring(v10, v36, longestEffectiveRange);
      +[PBTextRun readTextRun:v50 plainText:CFAttributedStringGetString(v41) characterAttributes:v38 state:v51];
      CFIndex v42 = longestEffectiveRange.length;
      CFRelease(v41);
      v37 += v42;
    }
    while (v37 < v32);
  }
  [v51 setHasCharacterPropertyBulletIndex:0];
  CFRelease(v36);
}

+ (void)applyTextRuler:(void *)a3 toTextBlock:(id)a4
{
  id v20 = a4;
  for (uint64_t i = 0; (int)i < (int)[v20 paragraphRunCount]; uint64_t i = (i + 1))
  {
    uint64_t v6 = [v20 paragraphRunAtIndex:i];
    uint64_t v7 = v6;
    int v8 = *((unsigned __int16 *)a3 + 38);
    if (v8 != 0xFFFF)
    {
      __int16 v9 = *(_WORD *)(v6 + 8);
      *(_WORD *)(v6 + 42) = v8;
      *(_WORD *)(v6 + 8) = v9 | 0x4000;
    }
    CFAllocatorRef v10 = (uint64_t **)*((void *)a3 + 6);
    if (v10)
    {
      if ((*(_WORD *)(v6 + 8) & 0x8000) == 0)
      {
        CFAllocatorRef v11 = (uint64_t **)operator new(0x18uLL);
        *CFAllocatorRef v11 = 0;
        v11[1] = 0;
        v11[2] = 0;
        __int16 v12 = *(_WORD *)(v7 + 8);
        *(void *)(v7 + 48) = v11;
        *(_WORD *)(v7 + 8) = v12 | 0x8000;
        if (v11 != v10) {
          std::vector<PptTab,ChAllocator<PptTab>>::__assign_with_size[abi:ne180100]<PptTab*,PptTab*>((uint64_t)v11, *v10, v10[1], v10[1] - *v10);
        }
      }
    }
    uint64_t v13 = *(__int16 *)(v7 + 4);
    if (v13 <= 4)
    {
      CFAttributedStringRef v14 = (char *)a3 + 2 * v13;
      int v15 = *((unsigned __int16 *)v14 + 28);
      if (v15 != 0xFFFF)
      {
        __int16 v16 = *(_WORD *)(v7 + 8);
        *(_WORD *)(v7 + 38) = v15;
        *(_WORD *)(v7 + 8) = v16 | 0x100;
      }
      int v17 = *((unsigned __int16 *)v14 + 33);
      if (v17 != 0xFFFF)
      {
        __int16 v19 = *(_WORD *)(v7 + 8);
        uint64_t v18 = (_WORD *)(v7 + 8);
        v18[16] = v17;
        _WORD *v18 = v19 | 0x200;
      }
    }
  }
}

@end