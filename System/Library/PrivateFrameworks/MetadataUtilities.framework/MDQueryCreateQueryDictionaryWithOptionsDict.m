@interface MDQueryCreateQueryDictionaryWithOptionsDict
@end

@implementation MDQueryCreateQueryDictionaryWithOptionsDict

CFAttributedStringRef ____MDQueryCreateQueryDictionaryWithOptionsDict_block_invoke(void *a1, const __CFDictionary *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v4 = (const void **)getkQPParseResultQUOutputKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultQUOutputKeySymbolLoc_ptr;
  if (!getkQPParseResultQUOutputKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultQUOutputKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEEE8;
    v82 = &v83;
    ParserLibrary = (void *)QueryParserLibrary();
    v84[3] = (uint64_t)dlsym(ParserLibrary, "kQPParseResultQUOutputKey");
    getkQPParseResultQUOutputKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v4 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v4)
  {
    _qpUpdateParserOptions_cold_1();
LABEL_96:
    _qpUpdateParserOptions_cold_1();
LABEL_97:
    _qpUpdateParserOptions_cold_1();
LABEL_98:
    _qpUpdateParserOptions_cold_1();
LABEL_99:
    _qpUpdateParserOptions_cold_1();
LABEL_100:
    _qpUpdateParserOptions_cold_1();
LABEL_101:
    _qpUpdateParserOptions_cold_1();
LABEL_102:
    _qpUpdateParserOptions_cold_1();
    goto LABEL_103;
  }
  v6 = *v4;
  if (*v4) {
    BOOL v7 = CFDictionaryContainsKey(a2, *v4) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v8 = (const void **)getkQPParseResultConfidenceKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultConfidenceKeySymbolLoc_ptr;
  if (!getkQPParseResultConfidenceKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultConfidenceKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEF10;
    v82 = &v83;
    v9 = (void *)QueryParserLibrary();
    v84[3] = (uint64_t)dlsym(v9, "kQPParseResultConfidenceKey");
    getkQPParseResultConfidenceKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v8 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v8) {
    goto LABEL_96;
  }
  v10 = *v8;
  if (*v8)
  {
    if (CFDictionaryContainsKey(a2, *v8))
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a2, v10);
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      uint64_t v12 = *(void *)(a1[4] + 8);
      if (valuePtr > *(_DWORD *)(v12 + 24)) {
        *(_DWORD *)(v12 + 24) = valuePtr;
      }
    }
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v13 = (const void **)getkQPParseResultDescriptionKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultDescriptionKeySymbolLoc_ptr;
  if (!getkQPParseResultDescriptionKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultDescriptionKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEF38;
    v82 = &v83;
    v14 = (void *)QueryParserLibrary();
    v15 = dlsym(v14, "kQPParseResultDescriptionKey");
    *(void *)(v82[1] + 24) = v15;
    getkQPParseResultDescriptionKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v13 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v13) {
    goto LABEL_97;
  }
  v16 = *v13;
  if (*v13) {
    char v17 = v7;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) != 0 || !CFDictionaryContainsKey(a2, *v13))
  {
    CFStringRef v18 = 0;
  }
  else
  {
    CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(a2, v16);
    if (CFStringGetLength(v18))
    {
      if (CFStringGetLength(*(CFStringRef *)(*(void *)(a1[5] + 8) + 24))) {
        CFStringAppend(*(CFMutableStringRef *)(*(void *)(a1[5] + 8) + 24), @" || ");
      }
      CFStringAppend(*(CFMutableStringRef *)(*(void *)(a1[5] + 8) + 24), v18);
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
      CFNumberRef v19 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberCFIndexType, (const void *)(*(void *)(a1[6] + 8) + 24));
      if (v19)
      {
        CFNumberRef v20 = v19;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1[7] + 8) + 24), v18, v19);
        CFRelease(v20);
      }
    }
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v21 = (CFDictionaryRef *)getkQPParseResultAttributedParseKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultAttributedParseKeySymbolLoc_ptr;
  if (!getkQPParseResultAttributedParseKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultAttributedParseKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEF60;
    v82 = &v83;
    v22 = (void *)QueryParserLibrary();
    v23 = dlsym(v22, "kQPParseResultAttributedParseKey");
    *(void *)(v82[1] + 24) = v23;
    getkQPParseResultAttributedParseKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v21 = (CFDictionaryRef *)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v21) {
    goto LABEL_98;
  }
  CFDictionaryRef v24 = *v21;
  if (v24)
  {
    if (CFDictionaryContainsKey(a2, v24))
    {
      CFDictionaryRef v24 = (CFDictionaryRef)CFDictionaryGetValue(a2, v24);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[8] + 8) + 24), v24);
      if (v7) {
        v25 = @"kMDUserQueryDictionaryAttributedInputSourceU2Based";
      }
      else {
        v25 = @"kMDUserQueryDictionaryAttributedInputSourceRuleBased";
      }
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[9] + 8) + 24), v25);
    }
    else
    {
      CFDictionaryRef v24 = 0;
    }
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v26 = (const void **)getkQPParseResultRankCategoriesKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultRankCategoriesKeySymbolLoc_ptr;
  if (!getkQPParseResultRankCategoriesKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultRankCategoriesKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEF88;
    v82 = &v83;
    v27 = (void *)QueryParserLibrary();
    v28 = dlsym(v27, "kQPParseResultRankCategoriesKey");
    *(void *)(v82[1] + 24) = v28;
    getkQPParseResultRankCategoriesKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v26 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v26) {
    goto LABEL_99;
  }
  v29 = *v26;
  if (CFDictionaryContainsKey(a2, v29))
  {
    CFDictionaryRef v77 = v24;
    CFDictionaryRef v30 = a2;
    CFDictionaryRef v31 = (const __CFDictionary *)CFDictionaryGetValue(a2, v29);
    CFIndex Count = CFDictionaryGetCount(v31);
    MEMORY[0x1F4188790](v36, Count, v33, v34, v35);
    v37 = (const void **)((char *)&v76 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v37, 8 * Count);
    MEMORY[0x1F4188790](v42, v38, v39, v40, v41);
    v43 = v37;
    bzero(v37, 8 * Count);
    CFDictionaryGetKeysAndValues(v31, v37, v37);
    if (Count >= 1)
    {
      do
      {
        v45 = *v37++;
        v44 = v45;
        v46 = *v43++;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1[10] + 8) + 24), v44, v46);
        --Count;
      }
      while (Count);
    }
    CFDictionaryRef v24 = v77;
  }
  else
  {
    CFDictionaryRef v30 = a2;
    CFDictionaryRef v31 = 0;
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v47 = (const void **)getkQPParseResultSortModifierKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultSortModifierKeySymbolLoc_ptr;
  if (!getkQPParseResultSortModifierKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultSortModifierKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEFB0;
    v82 = &v83;
    v48 = (void *)QueryParserLibrary();
    v49 = dlsym(v48, "kQPParseResultSortModifierKey");
    *(void *)(v82[1] + 24) = v49;
    getkQPParseResultSortModifierKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v47 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v47) {
    goto LABEL_100;
  }
  v50 = *v47;
  if (*(void *)(*(void *)(a1[11] + 8) + 24)) {
    BOOL v51 = 1;
  }
  else {
    BOOL v51 = v50 == 0;
  }
  if (!v51 && CFDictionaryContainsKey(v30, v50)) {
    *(void *)(*(void *)(a1[11] + 8) + 24) = CFDictionaryGetValue(v30, v50);
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v52 = (const void **)getkQPParseResultTokenCountKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultTokenCountKeySymbolLoc_ptr;
  if (!getkQPParseResultTokenCountKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultTokenCountKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEEFD8;
    v82 = &v83;
    v53 = (void *)QueryParserLibrary();
    v54 = dlsym(v53, "kQPParseResultTokenCountKey");
    *(void *)(v82[1] + 24) = v54;
    getkQPParseResultTokenCountKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v52 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v52) {
    goto LABEL_101;
  }
  CFNumberRef v55 = 0;
  if ((*(void *)(*(void *)(a1[12] + 8) + 24) & 0x8000000000000000) != 0)
  {
    v56 = *v52;
    if (v56)
    {
      if (CFDictionaryContainsKey(v30, v56))
      {
        CFNumberRef v55 = (const __CFNumber *)CFDictionaryGetValue(v30, v56);
        CFNumberGetValue(v55, kCFNumberCFIndexType, (void *)(*(void *)(a1[12] + 8) + 24));
      }
      else
      {
        CFNumberRef v55 = 0;
      }
    }
  }
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v57 = (const void **)getkQPParseResultSuggestionKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultSuggestionKeySymbolLoc_ptr;
  if (!getkQPParseResultSuggestionKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultSuggestionKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEF000;
    v82 = &v83;
    v58 = (void *)QueryParserLibrary();
    v59 = dlsym(v58, "kQPParseResultSuggestionKey");
    *(void *)(v82[1] + 24) = v59;
    getkQPParseResultSuggestionKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v57 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v57) {
    goto LABEL_102;
  }
  v60 = *v57;
  if (!v60) {
    goto LABEL_86;
  }
  if (!CFDictionaryContainsKey(v30, v60)) {
    goto LABEL_86;
  }
  CFStringRef v61 = (const __CFString *)CFDictionaryGetValue(v30, v60);
  CFIndex Length = CFStringGetLength(v61);
  if (!v18 || !Length || !CFStringGetLength(v18)) {
    goto LABEL_86;
  }
  CFDictionaryRef v77 = v30;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2000000000;
  v63 = (const void **)getkQPParseResultAttributeCountKeySymbolLoc_ptr;
  uint64_t v86 = getkQPParseResultAttributeCountKeySymbolLoc_ptr;
  if (!getkQPParseResultAttributeCountKeySymbolLoc_ptr)
  {
    uint64_t valuePtr = MEMORY[0x1E4F143A8];
    uint64_t v79 = 0x40000000;
    v80 = __getkQPParseResultAttributeCountKeySymbolLoc_block_invoke;
    v81 = &unk_1E5AEF028;
    v82 = &v83;
    v64 = (void *)QueryParserLibrary();
    v65 = dlsym(v64, "kQPParseResultAttributeCountKey");
    *(void *)(v82[1] + 24) = v65;
    getkQPParseResultAttributeCountKeySymbolLoc_ptr = *(void *)(v82[1] + 24);
    v63 = (const void **)v84[3];
  }
  _Block_object_dispose(&v83, 8);
  if (!v63) {
LABEL_103:
  }
    _qpUpdateParserOptions_cold_1();
  v66 = *v63;
  if (v66)
  {
    CFDictionaryRef v67 = v77;
    CFStringRef v68 = v18;
    if (CFDictionaryContainsKey(v77, v66)) {
      v66 = CFDictionaryGetValue(v67, v66);
    }
    else {
      v66 = 0;
    }
  }
  else
  {
    CFStringRef v68 = v18;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"suggestion", v61);
  CFDictionarySetValue(Mutable, @"query", v68);
  if (v31) {
    CFDictionarySetValue(Mutable, @"categories", v31);
  }
  if (v55) {
    CFDictionarySetValue(Mutable, @"tokenCount", v55);
  }
  if (v66) {
    CFDictionarySetValue(Mutable, @"attributeCount", v66);
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(a1[13] + 8) + 24), Mutable);
  CFRelease(Mutable);
  CFDictionaryRef v30 = v77;
LABEL_86:
  if (v6 && CFDictionaryContainsKey(v30, v6))
  {
    CFDictionaryRef v70 = (const __CFDictionary *)CFDictionaryGetValue(v30, v6);
    CFDictionaryRef v71 = v70;
    if (v24)
    {
      CFIndex v72 = CFDictionaryGetCount(v70);
      CFAllocatorRef v73 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v72 + 1, v71);
      CFDictionaryAddValue(MutableCopy, @"attributedParse", v24);
      *(void *)(*(void *)(a1[14] + 8) + 24) = CFDictionaryCreateCopy(v73, MutableCopy);
      CFRelease(MutableCopy);
    }
    else
    {
      *(void *)(*(void *)(a1[14] + 8) + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v70);
    }
  }
  CFAttributedStringRef result = (CFAttributedStringRef)CFDictionaryContainsKey(v30, @"isEntitySearchKey");
  if (v24)
  {
    if (result)
    {
      CFAttributedStringRef result = CFAttributedStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v24);
      *(void *)(*(void *)(a1[15] + 8) + 24) = result;
    }
  }
  return result;
}

void ____MDQueryCreateQueryDictionaryWithOptionsDict_block_invoke_2(uint64_t a1, const void *a2)
{
  v2 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  CFArrayAppendValue(v2, a2);
}

@end