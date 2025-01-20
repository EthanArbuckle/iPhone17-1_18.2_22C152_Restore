@interface TIKeyboardSecureCandidateTextRendering
+ (BOOL)_drawSingleLineSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 abortInsteadOfTruncating:(BOOL)a10 outWidths:(id)a11;
+ (BOOL)_isAllSingleLineStrings:(id)a3;
+ (BOOL)_textRunsHaveFixedFontSize:(id)a3;
+ (CGColor)_newCgColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (CGColor)_newCgColorWithTraitsColor:(id)a3;
+ (__CFAttributedString)_newAttributedStringWithText:(id)a3 font:(__CTFont *)a4 color:(CGColor *)a5;
+ (double)_totalWidthForCell:(unint64_t)a3 fromTextRunResponses:(id)a4;
+ (id)_defaultLayoutTraitsForTraits:(id)a3;
+ (id)_requestLayoutForSimplifiedTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5;
+ (id)requestLayoutForTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5;
+ (id)truncatedWidthsForItemWidths:(id)a3 availableWidth:(double)a4;
+ (void)_drawLineFromCellAtIndex:(unint64_t)a3 ofResponse:(id)a4 atYCoordinate:(double)a5 inContext:(CGContext *)a6 withAvailableWidth:(double)a7;
+ (void)_drawTwoLineCellsWithSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 outWidths:(id)a10;
+ (void)_handleEllipsisTruncationForTextRuns:(id)a3 textRunResponses:(id)a4 inAvailableWidth:(double)a5;
+ (void)drawSecureHeaders:(id)a3 secureContents:(id)a4 inContexts:(__CFArray *)a5 traits:(id)a6 truncationSentinel:(id)a7 outWidths:(id)a8;
@end

@implementation TIKeyboardSecureCandidateTextRendering

+ (void)drawSecureHeaders:(id)a3 secureContents:(id)a4 inContexts:(__CFArray *)a5 traits:(id)a6 truncationSentinel:(id)a7 outWidths:(id)a8
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v83 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = [v15 layoutTraits];
  id v80 = a1;
  if (![v18 headerInliningBehavior])
  {
    uint64_t v19 = [a1 _defaultLayoutTraitsForTraits:v15];

    v18 = (void *)v19;
  }
  v20 = [v15 resultCountToSingleCellWidth];
  uint64_t v21 = [v15 maxCellCount];
  unint64_t v22 = [v14 count];
  if (v21 >= 1)
  {
    unint64_t v23 = [v15 maxCellCount];
    if (v22 >= v23) {
      unint64_t v22 = v23;
    }
  }
  unint64_t v24 = v22;
  if ([v15 sharedCellCount]) {
    unint64_t v24 = [v15 sharedCellCount] + v22;
  }
  if (![v20 count])
  {
    if ([v15 cellRenderingStyle])
    {
      if (v24 == 1)
      {
        v31 = [v15 cellWidthOptions];
        v27 = v31;
        v32 = (void *)MEMORY[0x1E4FAE958];
      }
      else
      {
        if (v24 != 2)
        {
          v78 = v20;
          v26 = [v15 cellWidthOptions];
          v27 = v26;
          if (v24 == 3) {
            v28 = (void *)MEMORY[0x1E4FAE970];
          }
          else {
            v28 = (void *)MEMORY[0x1E4FAE990];
          }
          goto LABEL_27;
        }
        v31 = [v15 cellWidthOptions];
        v27 = v31;
        v32 = (void *)MEMORY[0x1E4FAE980];
      }
    }
    else
    {
      if (v24 != 1)
      {
        v78 = v20;
        v26 = [v15 cellWidthOptions];
        v27 = v26;
        if (v24 == 2) {
          v28 = (void *)MEMORY[0x1E4FAE988];
        }
        else {
          v28 = (void *)MEMORY[0x1E4FAE978];
        }
LABEL_27:
        v36 = [v26 objectForKey:*v28];
        [v36 doubleValue];
        double v30 = v37;

        v20 = v78;
        goto LABEL_28;
      }
      v31 = [v15 cellWidthOptions];
      v27 = v31;
      v32 = (void *)MEMORY[0x1E4FAE960];
    }
    [v31 objectForKey:*v32];
    v34 = v33 = v20;
    [v34 doubleValue];
    double v30 = v35;

    v20 = v33;
    goto LABEL_28;
  }
  unint64_t v25 = [v14 count];
  if (v25 >= [v20 count]) {
    [v20 lastObject];
  }
  else {
  v27 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v14, "count"));
  }
  [v27 doubleValue];
  double v30 = v29;
LABEL_28:

  if (v30 >= 20.0)
  {
    [v15 singleCellHeight];
    if (v38 > 0.0)
    {
      v79 = v20;
      for (CFIndex i = 0; CFArrayGetCount(a5) > i; ++i)
      {
        ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a5, i);
        CGContextSaveGState(ValueAtIndex);
        [v15 singleCellHeight];
        CGContextTranslateCTM(ValueAtIndex, 10.0, v41);
      }
      double v43 = v30 + -20.0;
      if ([v18 headerInliningBehavior] == 2
        && ([v18 inputTraitsInOnlyLine],
            v44 = objc_claimAutoreleasedReturnValue(),
            v44,
            v44)
        && [v80 _isAllSingleLineStrings:v83])
      {
        char v45 = [v15 shouldForceDoubleLineCandidateForPasswordAutofill];
        [v15 setShouldForceDoubleLineCandidateForPasswordAutofill:0];
        v20 = v79;
        if ((v45 & 1) == 0)
        {
          char v46 = [v15 shouldForceDoubleLineCandidateForCellularAutofill];
          [v15 setShouldForceDoubleLineCandidateForCellularAutofill:0];
          if ((v46 & 1) == 0)
          {
            LOBYTE(v75) = 1;
            if ([v80 _drawSingleLineSecureHeaders:v14 secureContents:v83 layoutTraits:v18 renderTraits:v15 contexts:a5 availableWidth:v16 truncationSentinel:v43 abortInsteadOfTruncating:v75 outWidths:v17])
            {
LABEL_72:
              for (CFIndex j = 0; CFArrayGetCount(a5) > j; ++j)
              {
                v70 = (CGContext *)CFArrayGetValueAtIndex(a5, j);
                CGContextRestoreGState(v70);
              }
              goto LABEL_39;
            }
          }
          goto LABEL_49;
        }
      }
      else
      {
        [v15 setShouldForceDoubleLineCandidateForPasswordAutofill:0];
      }
      [v15 setShouldForceDoubleLineCandidateForCellularAutofill:0];
LABEL_49:
      id v76 = v17;
      id v77 = v16;
      v82 = [MEMORY[0x1E4F28E60] indexSet];
      v81 = [MEMORY[0x1E4F28E60] indexSet];
      v47 = v14;
      if (!v22)
      {
        uint64_t v49 = -1;
LABEL_62:
        v57 = v82;
        if (([v18 forceSingleLineLayout] & 1) == 0 && objc_msgSend(v81, "count")) {
          [v82 removeAllIndexes];
        }
        id v16 = v77;
        if ((v49 & 0x8000000000000000) == 0) {
          [v82 addIndex:v49];
        }
        if ([v82 count])
        {
          v58 = [v47 objectsAtIndexes:v82];
          v59 = [v83 objectsAtIndexes:v82];
          CFIndex v60 = [v82 count];
          CFMutableArrayRef Mutable = CFArrayCreateMutable(0, v60, MEMORY[0x1E4F1D510]);
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke;
          v85[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
          v85[4] = Mutable;
          v85[5] = a5;
          [v82 enumerateIndexesUsingBlock:v85];
          LOBYTE(v75) = 0;
          [v80 _drawSingleLineSecureHeaders:v58 secureContents:v59 layoutTraits:v18 renderTraits:v15 contexts:Mutable availableWidth:v77 truncationSentinel:v43 abortInsteadOfTruncating:v75 outWidths:v76];
          CFMutableArrayRef v62 = Mutable;
          v57 = v82;
          CFRelease(v62);
        }
        v63 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, v22);
        [v63 removeIndexes:v57];
        if ([v63 count])
        {
          CFIndex v64 = [v63 count];
          v65 = [v47 objectsAtIndexes:v63];
          v66 = [v83 objectsAtIndexes:v63];
          CFMutableArrayRef v67 = CFArrayCreateMutable(0, v64, MEMORY[0x1E4F1D510]);
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke_2;
          v84[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
          v84[4] = v67;
          v84[5] = a5;
          [v63 enumerateIndexesUsingBlock:v84];
          [v80 _drawTwoLineCellsWithSecureHeaders:v65 secureContents:v66 layoutTraits:v18 renderTraits:v15 contexts:v67 availableWidth:v77 truncationSentinel:v43 outWidths:v76];
          CFMutableArrayRef v68 = v67;
          v57 = v82;
          CFRelease(v68);

          id v16 = v77;
        }

        id v14 = v47;
        id v17 = v76;
        v20 = v79;
        goto LABEL_72;
      }
      uint64_t v48 = 0;
      uint64_t v49 = -1;
      while (1)
      {
        v50 = [v14 objectAtIndexedSubscript:v48];
        uint64_t v51 = [v50 length];

        if (v51)
        {
          [v81 addIndex:v48];
          if (([v18 forceSingleLineLayout] & 1) == 0) {
            goto LABEL_57;
          }
        }
        else if (([v18 forceSingleLineLayout] & 1) == 0)
        {
          v52 = [v83 objectAtIndexedSubscript:v48];
          char v53 = [v52 containsString:@"\n"];

          if (v53) {
            goto LABEL_57;
          }
        }
        [v82 addIndex:v48];
LABEL_57:
        v54 = [v83 objectAtIndexedSubscript:v48];
        v55 = [v15 hideMyEmailLocalizedText];
        int v56 = [v54 isEqualToString:v55];

        if (v56) {
          uint64_t v49 = v48;
        }
        ++v48;
        id v14 = v47;
        if (v22 == v48) {
          goto LABEL_62;
        }
      }
    }
  }
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v42 = TIOSLogFacility();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v71 = v20;
      v72 = NSString;
      [v15 singleCellHeight];
      v74 = [v72 stringWithFormat:@"%s TISecureCandidateLogging: failed to draw secure candidate - cell too small, width(%f), height(%f)", "+[TIKeyboardSecureCandidateTextRendering drawSecureHeaders:secureContents:inContexts:traits:truncationSentinel:outWidths:]", *(void *)&v30, v73];
      *(_DWORD *)buf = 138412290;
      v87 = v74;
      _os_log_debug_impl(&dword_1E3F0E000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      v20 = v71;
    }
  }
LABEL_39:
}

void __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke(uint64_t a1, CFIndex a2)
{
  v2 = *(__CFArray **)(a1 + 32);
  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);

  CFArrayAppendValue(v2, ValueAtIndex);
}

void __122__TIKeyboardSecureCandidateTextRendering_drawSecureHeaders_secureContents_inContexts_traits_truncationSentinel_outWidths___block_invoke_2(uint64_t a1, CFIndex a2)
{
  v2 = *(__CFArray **)(a1 + 32);
  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);

  CFArrayAppendValue(v2, ValueAtIndex);
}

+ (BOOL)_drawSingleLineSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 abortInsteadOfTruncating:(BOOL)a10 outWidths:(id)a11
{
  v132[3] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v108 = a6;
  id v110 = a9;
  id v19 = a11;
  v20 = [v18 headerTraitsInOnlyLine];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [v18 inputTraitsInOnlyLine];
  }
  unint64_t v23 = v22;
  v113 = v19;
  double v24 = a8 + -7.0;

  v107 = v18;
  unint64_t v25 = [v18 inputTraitsInOnlyLine];
  v112 = v23;
  v26 = [v23 textColor];
  color = (CGColor *)[a1 _newCgColorWithTraitsColor:v26];

  v111 = v25;
  v27 = [v25 textColor];
  v120 = (CGColor *)[a1 _newCgColorWithTraitsColor:v27];

  v28 = [MEMORY[0x1E4F28E60] indexSet];
  v125 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  double v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  if ([v16 count])
  {
    unint64_t v30 = 0;
    do
    {
      v31 = [v16 objectAtIndexedSubscript:v30];
      uint64_t v32 = [v31 length];

      if (v32)
      {
        [v28 addIndex:v30];
        v33 = [v17 objectAtIndexedSubscript:v30];
        [v125 addObject:v33];

        [v29 addObject:&stru_1F3F7A998];
      }
      else
      {
        [v125 addObject:&stru_1F3F7A998];
        v34 = [v17 objectAtIndexedSubscript:v30];
        [v29 addObject:v34];
      }
      ++v30;
    }
    while (v30 < [v16 count]);
  }
  id v109 = v17;
  [v112 maxFontSize];
  double v36 = v35;
  [v112 minFontSize];
  v117 = +[TISCTextRunRequest textRunRequestWithStrings:v16 color:color maxFontSize:!a10 minFontSize:v110 allowTruncation:0 truncationSentinel:v36 widthGroup:v37];
  v132[0] = v117;
  [v111 maxFontSize];
  double v39 = v38;
  [v111 minFontSize];
  v115 = +[TISCTextRunRequest textRunRequestWithStrings:v125 color:v120 maxFontSize:!a10 minFontSize:v110 allowTruncation:0 truncationSentinel:v39 widthGroup:v40];
  v132[1] = v115;
  [v111 maxFontSize];
  double v42 = v41;
  [v111 minFontSize];
  v44 = +[TISCTextRunRequest textRunRequestWithStrings:v29 color:v120 maxFontSize:!a10 minFontSize:v110 allowTruncation:1 truncationSentinel:v42 widthGroup:v43];
  v132[2] = v44;
  char v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:3];
  char v46 = [NSNumber numberWithDouble:v24];
  v131[0] = v46;
  v47 = [NSNumber numberWithDouble:a8];
  v131[1] = v47;
  uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
  uint64_t v49 = [a1 requestLayoutForTextRuns:v45 inWidthGroups:v48 steps:10];

  CGColorRelease(color);
  CGColorRelease(v120);
  if ([v49 count])
  {
    v50 = [v49 objectAtIndexedSubscript:0];
    CGColorRef colora = [v49 objectAtIndexedSubscript:1];
    v106 = v49;
    v121 = [v49 objectAtIndexedSubscript:2];
    v52 = v108;
    uint64_t v51 = v109;
    if (a10 && [v16 count])
    {
      for (unint64_t i = 0; i < [v16 count]; ++i)
      {
        if ([v28 containsIndex:i])
        {
          v130[0] = v50;
          v130[1] = colora;
          v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
          [a1 _totalWidthForCell:i fromTextRunResponses:v54];
          double v56 = v55;

          if (v56 > v24)
          {
            int v105 = 1;
            goto LABEL_45;
          }
        }
        else
        {
          v129 = v121;
          int v105 = 1;
          v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
          [a1 _totalWidthForCell:i fromTextRunResponses:v57];
          double v59 = v58;

          if (v59 > a8) {
            goto LABEL_45;
          }
        }
      }
    }
    [v108 singleCellVerticalPadding];
    double v61 = v60;
    [v112 yCoordinate];
    double v63 = v61 - v62;
    [v111 yCoordinate];
    double v65 = v61 - v64;
    [v112 maxFontSize];
    double v67 = v66;
    [v111 maxFontSize];
    double v69 = v67 - v68;
    if (v67 - v68 != 0.0)
    {
      double v70 = v63 - v65;
      if (v63 - v65 != 0.0)
      {
        v71 = (const __CTFont *)[v50 font];
        v72 = (const __CTFont *)[(CGColor *)colora font];
        double Size = CTFontGetSize(v71);
        double v74 = round(v70 * ((Size - CTFontGetSize(v72)) / v69));
        if (v74 > fabs(v70)) {
          double v74 = v63 - v65;
        }
        double v75 = (v63 + v65) * 0.5;
        double v76 = v74 * 0.5;
        double v63 = v75 + v76;
        double v65 = v75 - v76;
      }
    }
    uint64_t v77 = [v108 maxCellCount];
    unint64_t v78 = [v16 count];
    v79 = v113;
    if (v77 >= 1)
    {
      unint64_t v80 = [v108 maxCellCount];
      if (v78 >= v80) {
        unint64_t v78 = v80;
      }
    }
    if (v78)
    {
      CFIndex v81 = 0;
      double v82 = a8 * 0.5;
      long long v116 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v118 = *MEMORY[0x1E4F1DAB8];
      long long v114 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      do
      {
        int v83 = [v28 containsIndex:v81];
        if (v83)
        {
          v128[0] = v50;
          v128[1] = colora;
          v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
          [a1 _totalWidthForCell:v81 fromTextRunResponses:v84];
          double v86 = v85;

          double v87 = v86 + 7.0;
        }
        else
        {
          v127 = v121;
          uint64_t v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
          [a1 _totalWidthForCell:v81 fromTextRunResponses:v88];
          double v87 = v89;
        }
        double v90 = v82 + v87 * -0.5;
        ValueAtIndex = (CGContext *)CFArrayGetValueAtIndex(a7, v81);
        CGContextSaveGState(ValueAtIndex);
        *(_OWORD *)&v126.a = v118;
        *(_OWORD *)&v126.c = v116;
        *(_OWORD *)&v126.tx = v114;
        CGContextSetTextMatrix(ValueAtIndex, &v126);
        if (v83)
        {
          v92 = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)[v50 ctLines], v81);
          v93 = [v50 widths];
          v94 = [v93 objectAtIndexedSubscript:v81];
          [v94 doubleValue];
          double v96 = v95;

          v97 = [v16 firstObject];
          LODWORD(v93) = [v97 _isNaturallyRTL];

          double v98 = v87 + v90 - v96;
          BOOL v99 = v93 == 0;
          v79 = v113;
          if (v99) {
            double v100 = v90 + v96 + 7.0;
          }
          else {
            double v100 = v82 + v87 * -0.5;
          }
          if (v99) {
            double v98 = v82 + v87 * -0.5;
          }
          CGContextSetTextPosition(ValueAtIndex, v98, v63);
          CTLineDraw(v92, ValueAtIndex);
          CGColorRef v101 = colora;
          double v90 = v100;
        }
        else
        {
          CGColorRef v101 = (CGColorRef)v121;
        }
        v102 = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)[(CGColor *)v101 ctLines], v81);
        CGContextSetTextPosition(ValueAtIndex, v90, v65);
        CTLineDraw(v102, ValueAtIndex);
        CGContextRestoreGState(ValueAtIndex);
        if (v79)
        {
          v103 = [NSNumber numberWithDouble:v87];
          [v79 setObject:v103 atIndexedSubscript:v81];
        }
        ++v81;
      }
      while (v78 != v81);
    }
    int v105 = 0;
    v52 = v108;
    uint64_t v51 = v109;
LABEL_45:

    uint64_t v49 = v106;
  }
  else
  {
    v52 = v108;
    uint64_t v51 = v109;
    int v105 = 1;
  }

  return v105 == 0;
}

+ (void)_drawTwoLineCellsWithSecureHeaders:(id)a3 secureContents:(id)a4 layoutTraits:(id)a5 renderTraits:(id)a6 contexts:(__CFArray *)a7 availableWidth:(double)a8 truncationSentinel:(id)a9 outWidths:(id)a10
{
  v113[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v104 = a4;
  id v92 = a5;
  id v103 = a6;
  id v91 = a9;
  id v107 = a10;
  int v105 = v15;
  uint64_t v16 = [v15 count];
  id v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  id v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  v106 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
  id v108 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v109 = v16;
  v93 = v19;
  if (v16)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      uint64_t v21 = [v105 objectAtIndexedSubscript:i];
      id v22 = [v104 objectAtIndexedSubscript:i];
      if ([v21 length]
        || (uint64_t v23 = [v22 rangeOfString:@"\n"], v23 == 0x7FFFFFFFFFFFFFFFLL))
      {
        [v108 addIndex:i];
        [v17 addObject:v21];
        [v18 addObject:v22];
        [v19 addObject:&stru_1F3F7A998];
        [v106 addObject:&stru_1F3F7A998];
      }
      else
      {
        uint64_t v25 = v23;
        uint64_t v26 = v24;
        [v17 addObject:&stru_1F3F7A998];
        [v18 addObject:&stru_1F3F7A998];
        v27 = [v22 substringToIndex:v25];
        [v93 addObject:v27];

        v28 = [v22 substringFromIndex:v25 + v26];
        [v106 addObject:v28];

        id v19 = v93;
      }
    }
  }
  double v29 = [v92 headerTraitsInFirstLine];
  unint64_t v30 = [v29 textColor];
  v31 = (CGColor *)[a1 _newCgColorWithTraitsColor:v30];

  [v29 maxFontSize];
  double v33 = v32;
  double v100 = v29;
  [v29 minFontSize];
  double v90 = v17;
  double v35 = +[TISCTextRunRequest textRunRequestWithStrings:v17 color:v31 maxFontSize:1 minFontSize:v91 allowTruncation:0 truncationSentinel:v33 widthGroup:v34];
  v113[0] = v35;
  double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:1];
  double v37 = [NSNumber numberWithDouble:a8];
  v112 = v37;
  double v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
  double v96 = [a1 requestLayoutForTextRuns:v36 inWidthGroups:v38 steps:10];

  BOOL v99 = [v96 objectAtIndexedSubscript:0];
  CGColorRelease(v31);
  double v39 = [v92 inputTraitsInSecondLine];
  double v40 = [v92 inputTraitsInFirstAndSecondLines];
  double v41 = [v39 textColor];
  color = (CGColor *)[a1 _newCgColorWithTraitsColor:v41];

  double v42 = [v40 textColor];
  uint64_t v43 = [a1 _newCgColorWithTraitsColor:v42];

  [v39 maxFontSize];
  double v45 = v44;
  [v39 minFontSize];
  double v89 = v18;
  v47 = +[TISCTextRunRequest textRunRequestWithStrings:v18 color:color maxFontSize:1 minFontSize:v91 allowTruncation:1 truncationSentinel:v45 widthGroup:v46];
  v111[0] = v47;
  [v40 maxFontSize];
  double v49 = v48;
  [v40 minFontSize];
  v50 = (CGColor *)v43;
  v52 = +[TISCTextRunRequest textRunRequestWithStrings:v93 color:v43 maxFontSize:1 minFontSize:v91 allowTruncation:0 truncationSentinel:v49 widthGroup:v51];
  v111[1] = v52;
  [v39 maxFontSize];
  double v54 = v53;
  double v98 = v39;
  [v39 minFontSize];
  double v56 = +[TISCTextRunRequest textRunRequestWithStrings:v106 color:v43 maxFontSize:1 minFontSize:v91 allowTruncation:1 truncationSentinel:v54 widthGroup:v55];
  v111[2] = v56;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:3];
  double v58 = [NSNumber numberWithDouble:a8];
  v110[0] = v58;
  double v59 = [NSNumber numberWithDouble:a8];
  v110[1] = v59;
  double v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:2];
  double v61 = [a1 requestLayoutForTextRuns:v57 inWidthGroups:v60 steps:10];

  v97 = [v61 objectAtIndexedSubscript:0];
  double v95 = [v61 objectAtIndexedSubscript:1];
  uint64_t v88 = v61;
  v94 = [v61 objectAtIndexedSubscript:2];
  CGColorRelease(color);
  CGColorRelease(v50);
  double v62 = v107;
  if (v109)
  {
    for (CFIndex j = 0; j != v109; ++j)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a7, j);
      if ([v108 containsIndex:j])
      {
        id v65 = v99;
        id v66 = v97;
        [v100 yCoordinate];
        double v68 = v67;
        [v98 yCoordinate];
        double v70 = v69;
      }
      else
      {
        id v65 = v95;
        id v66 = v94;
        [v40 yCoordinate];
        double v68 = v71;
        [v40 yCoordinate];
        double v73 = v72;
        [v40 baselineOffset];
        double v70 = v73 + v74;
      }
      [v103 singleCellVerticalPadding];
      double v76 = v75;
      [a1 _drawLineFromCellAtIndex:j ofResponse:v65 atYCoordinate:ValueAtIndex inContext:v75 - v68 withAvailableWidth:a8];
      [a1 _drawLineFromCellAtIndex:j ofResponse:v66 atYCoordinate:ValueAtIndex inContext:v76 - v70 withAvailableWidth:a8];
      if (v62)
      {
        uint64_t v77 = [v65 widths];
        unint64_t v78 = [v77 objectAtIndexedSubscript:j];
        [v78 floatValue];
        float v80 = v79;
        CFIndex v81 = [v66 widths];
        double v82 = [v81 objectAtIndexedSubscript:j];
        [v82 floatValue];
        if (v80 > v83) {
          v84 = v65;
        }
        else {
          v84 = v66;
        }
        double v85 = [v84 widths];
        double v86 = [v85 objectAtIndexedSubscript:j];
        [v107 setObject:v86 atIndexedSubscript:j];

        double v62 = v107;
      }
    }
  }
}

+ (void)_drawLineFromCellAtIndex:(unint64_t)a3 ofResponse:(id)a4 atYCoordinate:(double)a5 inContext:(CGContext *)a6 withAvailableWidth:(double)a7
{
  id v11 = a4;
  ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)[v11 ctLines], a3);
  v13 = [v11 widths];

  id v14 = [v13 objectAtIndexedSubscript:a3];
  [v14 doubleValue];
  double v16 = v15;

  CGContextSaveGState(a6);
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v18.c = v17;
  *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextSetTextMatrix(a6, &v18);
  CGContextSetTextPosition(a6, a7 * 0.5 - v16 * 0.5, a5);
  CTLineDraw(ValueAtIndex, a6);
  CGContextRestoreGState(a6);
}

+ (CGColor)_newCgColorWithTraitsColor:(id)a3
{
  id v4 = a3;
  [v4 colorR];
  double v6 = v5;
  [v4 colorG];
  double v8 = v7;
  [v4 colorB];
  double v10 = v9;
  [v4 colorA];
  double v12 = v11;

  return (CGColor *)[a1 _newCgColorWithRed:v6 green:v8 blue:v10 alpha:v12];
}

+ (BOOL)_isAllSingleLineStrings:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsString:", @"\n", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (id)_defaultLayoutTraitsForTraits:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FAE378]);
  int v5 = [v3 isCandidateUI];
  uint64_t v6 = [v3 headerTextTraits];
  double v7 = [v6 textColor];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FAE380] lightGrayColor];
  }
  long long v10 = v9;

  long long v11 = [v3 inputTextTraits];
  long long v12 = [v11 textColor];
  long long v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4FAE380] whiteColor];
  }
  uint64_t v15 = v14;

  [v3 singleCellHeight];
  double v17 = v16;
  [v3 screenScale];
  double v19 = 1.0 / v18;
  [v3 screenScale];
  double v21 = 2.0 / v20;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __72__TIKeyboardSecureCandidateTextRendering__defaultLayoutTraitsForTraits___block_invoke;
  v71[3] = &__block_descriptor_57_e11_d24__0d8d16l;
  char v72 = v5;
  double v22 = 55.0 - 2.0 / v20;
  *(double *)&v71[4] = v19;
  *(double *)&v71[5] = 2.0 / v20;
  *(double *)&v71[6] = v17;
  uint64_t v23 = (double (**)(void, double, double))_Block_copy(v71);
  if (v17 >= v22 + -0.1)
  {
    [v4 setHeaderInliningBehavior:2];
    unint64_t v30 = (void *)MEMORY[0x1E4FAE390];
    v31 = v23 + 2;
    double v32 = v23[2](v23, 33.0, 55.0);
    if (v5) {
      double v33 = 15.0;
    }
    else {
      double v33 = 11.0;
    }
    if (v5) {
      double v34 = 15.0;
    }
    else {
      double v34 = 14.0;
    }
    double v35 = [v30 traitsWithFontName:0 maxFontSize:v10 minFontSize:18.0 textColor:v33 yCoordinate:v32 baselineOffset:0.0];
    [v4 setHeaderTraitsInOnlyLine:v35];

    double v36 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 18.0, v33, (*v31)(v23, 33.0, 55.0), 0.0);
    [v4 setInputTraitsInOnlyLine:v36];

    double v37 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 15.0, v33, (*v31)(v23, 24.0, 55.0), 17.0);
    [v4 setInputTraitsInFirstAndSecondLines:v37];

    double v38 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v34, v33, (*v31)(v23, 24.0, 55.0), 0.0);
    [v4 setHeaderTraitsInFirstLine:v38];

    double v39 = (void *)MEMORY[0x1E4FAE390];
    double v40 = (*v31)(v23, 41.0, 55.0);
    double v41 = 15.0;
    goto LABEL_36;
  }
  if (v17 >= 45.0 - v21 + -0.1)
  {
    [v4 setHeaderInliningBehavior:3];
    double v42 = (void *)MEMORY[0x1E4FAE390];
    uint64_t v43 = v23 + 2;
    double v44 = v23[2](v23, 31.0, 45.0);
    if (v5) {
      double v33 = 15.0;
    }
    else {
      double v33 = 11.0;
    }
    if (v5) {
      double v45 = 17.0;
    }
    else {
      double v45 = 14.0;
    }
    double v46 = [v42 traitsWithFontName:0 maxFontSize:v15 minFontSize:18.0 textColor:v33 yCoordinate:v44 baselineOffset:0.0];
    [v4 setInputTraitsInOnlyLine:v46];

    v47 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 17.0, v33, (*v43)(v23, 18.0, 45.0), 19.0);
    [v4 setInputTraitsInFirstAndSecondLines:v47];

    double v48 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v45, v33, (*v43)(v23, 18.0, 45.0), 0.0);
    [v4 setHeaderTraitsInFirstLine:v48];

    double v39 = (void *)MEMORY[0x1E4FAE390];
    double v40 = (*v43)(v23, 37.0, 45.0);
    double v41 = 17.0;
LABEL_36:
    double v49 = v39;
    double v50 = v33;
LABEL_37:
    double v29 = [v49 traitsWithFontName:0 maxFontSize:v15 minFontSize:v41 textColor:v50 yCoordinate:v40 baselineOffset:0.0];
    [v4 setInputTraitsInSecondLine:v29];
    goto LABEL_38;
  }
  if (v17 >= 44.0 - v21 + -0.1)
  {
    [v4 setHeaderInliningBehavior:3];
    v52 = (void *)MEMORY[0x1E4FAE390];
    double v53 = v23 + 2;
    double v54 = v23[2](v23, 30.0, 44.0);
    if (v5) {
      double v55 = 15.0;
    }
    else {
      double v55 = 11.0;
    }
    if (v5) {
      double v56 = 18.0;
    }
    else {
      double v56 = 17.0;
    }
    if (v5) {
      double v57 = 17.0;
    }
    else {
      double v57 = 14.0;
    }
    double v58 = [v52 traitsWithFontName:0 maxFontSize:v15 minFontSize:18.0 textColor:v55 yCoordinate:v54 baselineOffset:0.0];
    [v4 setInputTraitsInOnlyLine:v58];

    double v59 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 17.0, v55, (*v53)(v23, v56, 44.0), 19.0);
    [v4 setInputTraitsInFirstAndSecondLines:v59];

    double v60 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v57, v55, (*v53)(v23, 20.0, 44.0), 0.0);
    [v4 setHeaderTraitsInFirstLine:v60];

    double v61 = (void *)MEMORY[0x1E4FAE390];
    double v40 = (*v53)(v23, 36.0, 44.0);
    double v41 = 17.0;
    goto LABEL_65;
  }
  if (v17 >= 38.0 - v21 + -0.1)
  {
    [v4 setHeaderInliningBehavior:3];
    double v62 = (void *)MEMORY[0x1E4FAE390];
    double v63 = v23 + 2;
    double v64 = v23[2](v23, 27.0, 38.0);
    if (v5) {
      double v55 = 15.0;
    }
    else {
      double v55 = 11.0;
    }
    if (v5) {
      double v65 = 13.0;
    }
    else {
      double v65 = 11.0;
    }
    if (v5) {
      double v66 = 15.0;
    }
    else {
      double v66 = 16.0;
    }
    if (v5) {
      double v67 = 32.0;
    }
    else {
      double v67 = 34.0;
    }
    double v68 = [v62 traitsWithFontName:0 maxFontSize:v15 minFontSize:18.0 textColor:v55 yCoordinate:v64 baselineOffset:0.0];
    [v4 setInputTraitsInOnlyLine:v68];

    double v69 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, 16.0, v55, (*v63)(v23, 17.0, 38.0), 17.0);
    [v4 setInputTraitsInFirstAndSecondLines:v69];

    double v70 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, 13.0, v65, (*v63)(v23, v66, 38.0), 0.0);
    [v4 setHeaderTraitsInFirstLine:v70];

    double v61 = (void *)MEMORY[0x1E4FAE390];
    double v40 = (*v63)(v23, v67, 38.0);
    double v41 = 16.0;
LABEL_65:
    double v49 = v61;
    double v50 = v55;
    goto LABEL_37;
  }
  if (v17 < 32.0 - v21 + -0.1) {
    goto LABEL_39;
  }
  [v4 setHeaderInliningBehavior:1];
  [v4 setForceSingleLineLayout:1];
  if (v5) {
    double v25 = 18.0;
  }
  else {
    double v25 = 14.0;
  }
  if (v5) {
    double v26 = 15.0;
  }
  else {
    double v26 = 11.0;
  }
  v24.n128_u64[0] = 21.0;
  if (v5)
  {
    v24.n128_f64[0] = 22.0;
    double v27 = 18.0;
  }
  else
  {
    double v27 = 17.0;
  }
  v28 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v10, v25, v26, ((double (*)(double (**)(void, double, double), __n128, double))v23[2])(v23, v24, 32.0), 0.0);
  [v4 setHeaderTraitsInOnlyLine:v28];

  double v29 = objc_msgSend(MEMORY[0x1E4FAE390], "traitsWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", 0, v15, v27, v26, v23[2](v23, 22.0, 32.0), 0.0);
  [v4 setInputTraitsInOnlyLine:v29];
LABEL_38:

LABEL_39:

  return v4;
}

double __72__TIKeyboardSecureCandidateTextRendering__defaultLayoutTraitsForTraits___block_invoke(uint64_t a1, double a2, double a3)
{
  if (!*(unsigned char *)(a1 + 56)) {
    a2 = a2 - *(double *)(a1 + 32);
  }
  double result = a2 + (*(double *)(a1 + 48) - (a3 - *(double *)(a1 + 40))) * 0.5;
  if (!*(unsigned char *)(a1 + 56)) {
    return result + 1.0;
  }
  return result;
}

+ (double)_totalWidthForCell:(unint64_t)a3 fromTextRunResponses:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) widths];
        long long v12 = [v11 objectAtIndexedSubscript:a3];
        [v12 doubleValue];
        double v9 = v9 + v13;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

+ (id)requestLayoutForTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [*(id *)(*((void *)&v34 + 1) + 8 * i) truncationSentinel];

          if (v15)
          {

            long long v17 = [MEMORY[0x1E4F1CA48] array];
            long long v18 = (void *)MEMORY[0x1E4E7C3D0]();
            double v19 = [MEMORY[0x1E4F28E60] indexSet];
            uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke;
            v31[3] = &unk_1E6E2A570;
            id v32 = v20;
            id v33 = v19;
            id v21 = v19;
            id v22 = v20;
            [v10 enumerateObjectsUsingBlock:v31];
            uint64_t v23 = [a1 _requestLayoutForSimplifiedTextRuns:v22 inWidthGroups:v9 steps:a5];
            v30[0] = 0;
            v30[1] = v30;
            v30[2] = 0x2020000000;
            v30[3] = 0;
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke_2;
            v26[3] = &unk_1E6E2A598;
            id v27 = v23;
            double v29 = v30;
            id v16 = v17;
            id v28 = v16;
            id v24 = v23;
            [v21 enumerateIndexesUsingBlock:v26];

            _Block_object_dispose(v30, 8);
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v16 = [a1 _requestLayoutForSimplifiedTextRuns:v10 inWidthGroups:v9 steps:a5];
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }
LABEL_13:

  return v16;
}

void __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = a1;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [v2 strings];
  id v33 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = [v2 strings];
  id v32 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obCFIndex j = [v2 strings];
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v9 = 0;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v2, "truncationSentinel", v30);
        if (v13 && (uint64_t v14 = [v12 rangeOfString:v13], (v16 = v15) != 0))
        {
          id v17 = v2;
          long long v18 = [v12 substringToIndex:v14];
          double v19 = [v12 substringFromIndex:v14 + v16];
          [v33 addObject:v18];
          [v32 addObject:v19];
          BOOL v9 = v9 || [v19 length] != 0;

          id v2 = v17;
        }
        else
        {
          [v33 addObject:v12];
          [v32 addObject:&stru_1F3F7A998];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  uint64_t v20 = [v2 color];
  [v2 maxFontSize];
  double v22 = v21;
  [v2 minFontSize];
  id v24 = +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v33, v20, [v2 allowTruncation], 0, objc_msgSend(v2, "widthGroup"), v22, v23);
  [*(id *)(v30 + 32) addObject:v24];
  if (v9)
  {
    uint64_t v25 = [v2 color];
    [v2 maxFontSize];
    double v27 = v26;
    [v2 minFontSize];
    double v29 = +[TISCTextRunRequest textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:](TISCTextRunRequest, "textRunRequestWithStrings:color:maxFontSize:minFontSize:allowTruncation:truncationSentinel:widthGroup:", v32, v25, 0, 0, [v2 widthGroup], v27, v28);
    [*(id *)(v30 + 32) addObject:v29];
  }
  objc_msgSend(*(id *)(v30 + 40), "addIndex:", objc_msgSend(*(id *)(v30 + 32), "count", v30));
}

void __87__TIKeyboardSecureCandidateTextRendering_requestLayoutForTextRuns_inWidthGroups_steps___block_invoke_2(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  if ([*(id *)(a1 + 32) count] >= a2)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v6, a2 - v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = +[TISCTextRunResponse textRunResponseByMergingResponses:v9];
    [v7 addObject:v8];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  else
  {
    *a3 = 1;
  }
}

+ (id)_requestLayoutForSimplifiedTextRuns:(id)a3 inWidthGroups:(id)a4 steps:(unint64_t)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v8;
  id v11 = v9;
  uint64_t v12 = [v8 firstObject];
  uint64_t v13 = [v12 strings];
  uint64_t v64 = [v13 count];

  id v68 = a1;
  if ([a1 _textRunsHaveFixedFontSize:v8]) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = a5;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke;
  aBlock[3] = &__block_descriptor_40_e14_d32__0d8d16Q24l;
  unint64_t v69 = v14 - 1;
  aBlock[4] = v14 - 1;
  double v67 = (double (**)(void *, void, double, double))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v75 = (id)objc_claimAutoreleasedReturnValue();
  CFIndex v15 = [v10 count];
  theArray = CFArrayCreateMutable(0, v15, MEMORY[0x1E4F1D510]);
  uint64_t v16 = malloc_type_malloc(8 * [v11 count], 0x100004000313F17uLL);
  id v17 = v16;
  char v72 = v11;
  unint64_t v63 = v14;
  if (v14)
  {
    uint64_t v74 = 0;
    uint64_t v66 = *MEMORY[0x1E4F245A8];
    uint64_t v65 = *MEMORY[0x1E4F24410];
    double v73 = v10;
    double v71 = v16;
LABEL_6:
    while (2)
    {
      objc_msgSend(v75, "removeAllObjects", v63);
      CFArrayRemoveAllValues(theArray);
      if (v64)
      {
        uint64_t v18 = 0;
        char v19 = 1;
        while (1)
        {
          if ([v11 count])
          {
            unint64_t v20 = 0;
            do
              v17[v20++] = 0;
            while (v20 < [v11 count]);
          }
          if ([v10 count]) {
            break;
          }
LABEL_30:
          ++v18;
          id v17 = v71;
          id v11 = v72;
          if (v18 == v64)
          {
            if (!(v19 & 1 | (++v74 == v63))) {
              goto LABEL_6;
            }
            goto LABEL_34;
          }
        }
        unint64_t v21 = 0;
        while (1)
        {
          double v22 = [v10 objectAtIndexedSubscript:v21];
          double v23 = [v22 strings];
          id v24 = [v23 objectAtIndexedSubscript:v18];

          uint64_t v25 = [v22 widthGroup];
          double v26 = [v72 objectAtIndexedSubscript:v25];
          [v26 doubleValue];
          double v28 = v27;

          if (v18)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(theArray, v21);
          }
          else
          {
            uint64_t v80 = v66;
            v81[0] = @".SFUISymbols-Regular";
            uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:&v80 count:1];
            v31 = (void *)CTFontDescriptorCreateWithAttributesAndOptions();

            float v79 = v31;
            id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];

            uint64_t v77 = v65;
            unint64_t v78 = v32;
            CFDictionaryRef v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            long long v34 = CTFontDescriptorCreateWithAttributes(v33);

            [v22 minFontSize];
            double v36 = v35;
            [v22 maxFontSize];
            CGFloat v38 = v67[2](v67, v74, v36, v37);
            UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, v38, 0);
            ValueAtIndex = CTFontCreateCopyWithAttributes(UIFontForLanguage, 0.0, 0, v34);
            CFRelease(v34);
            double v40 = UIFontForLanguage;
            uint64_t v10 = v73;
            CFRelease(v40);
            CFArrayAppendValue(theArray, ValueAtIndex);
            CFRelease(ValueAtIndex);
          }
          if ([v24 length])
          {
            CFAttributedStringRef v41 = (const __CFAttributedString *)objc_msgSend(v68, "_newAttributedStringWithText:font:color:", v24, ValueAtIndex, objc_msgSend(v22, "color"));
            double v42 = CTLineCreateWithAttributedString(v41);
            CFRelease(v41);
            double TypographicBounds = CTLineGetTypographicBounds(v42, 0, 0, 0);
          }
          else
          {
            if (_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__onceToken != -1) {
              dispatch_once(&_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__onceToken, &__block_literal_global_64);
            }
            double v42 = (const __CTLine *)CFRetain((CFTypeRef)_requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__emptyCtLine);
            double TypographicBounds = 0.0;
          }
          double v44 = TypographicBounds + *(double *)&v71[v25];
          *(double *)&v71[v25] = v44;
          BOOL v45 = v44 <= v28;
          if (v44 > v28 && v74 != v69) {
            break;
          }
          v47 = (void *)MEMORY[0x1E4E7C3D0]();
          if (v18)
          {
            double v48 = [v75 objectAtIndexedSubscript:v21];
          }
          else
          {
            double v48 = +[TISCTextRunResponse textRunResponseWithFont:ValueAtIndex];
            [v75 addObject:v48];
          }
          v19 &= v45;
          CFArrayAppendValue((CFMutableArrayRef)[v48 ctLines], v42);
          CFRelease(v42);
          double v49 = [v48 widths];
          double v50 = [NSNumber numberWithDouble:TypographicBounds];
          [v49 addObject:v50];

          ++v21;
          uint64_t v10 = v73;
          if (v21 >= [v73 count]) {
            goto LABEL_30;
          }
        }
        CFRelease(v42);

        ++v74;
        id v17 = v71;
        id v11 = v72;
        if (v74 != v63) {
          continue;
        }
      }
      break;
    }
  }
LABEL_34:
  CFRelease(theArray);
  free(v17);
  unint64_t v51 = [v75 count];
  if ([v11 count])
  {
    unint64_t v52 = 0;
    do
    {
      double v53 = objc_msgSend(v11, "objectAtIndexedSubscript:", v52, v63);
      [v53 doubleValue];
      double v55 = v54;

      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v10 count])
      {
        unint64_t v58 = 0;
        do
        {
          double v59 = [v10 objectAtIndexedSubscript:v58];
          if ([v59 widthGroup] == v52 && v58 < v51)
          {
            [v56 addObject:v59];
            double v61 = [v75 objectAtIndexedSubscript:v58];
            [v57 addObject:v61];
          }
          ++v58;
        }
        while (v58 < [v10 count]);
      }
      [v68 _handleEllipsisTruncationForTextRuns:v56 textRunResponses:v57 inAvailableWidth:v55];

      ++v52;
      id v11 = v72;
    }
    while (v52 < [v72 count]);
  }

  return v75;
}

double __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  if (a3 != a4 && a2 != 0)
  {
    unint64_t v5 = *(void *)(a1 + 32);
    if (v5 == a2) {
      return a3;
    }
    else {
      return ((double)(v5 - a2) * a4 + a3 * (double)a2) / (double)v5;
    }
  }
  return a4;
}

void __98__TIKeyboardSecureCandidateTextRendering__requestLayoutForSimplifiedTextRuns_inWidthGroups_steps___block_invoke_2()
{
  CFAttributedStringRef v0 = CFAttributedStringCreate(0, &stru_1F3F7A998, MEMORY[0x1E4F1CC08]);
  _requestLayoutForSimplifiedTextRuns_inWidthGroups_steps__emptyCtLine = (uint64_t)CTLineCreateWithAttributedString(v0);

  CFRelease(v0);
}

+ (void)_handleEllipsisTruncationForTextRuns:(id)a3 textRunResponses:(id)a4 inAvailableWidth:(double)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
  id v11 = v9;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v57 != v13) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v56 + 1) + 8 * i) allowTruncation])
        {
          id v44 = a1;

          CFIndex v15 = [v9 firstObject];
          uint64_t v16 = [v15 strings];
          uint64_t v17 = [v16 count];

          id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
          uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
          if (v17)
          {
            uint64_t v19 = v17;
            do
            {
              objc_msgSend(v11, "addObject:", &unk_1F3FA8078, v44);
              [v18 addObject:&unk_1F3FA8078];
              --v19;
            }
            while (v19);
          }
          double v49 = v18;
          if (objc_msgSend(v9, "count", v44))
          {
            uint64_t v20 = 0;
            double v46 = v9;
            do
            {
              unint64_t v21 = [v9 objectAtIndexedSubscript:v20];
              uint64_t v48 = v20;
              double v50 = [v47 objectAtIndexedSubscript:v20];
              if (v17)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  double v23 = NSNumber;
                  id v24 = [v11 objectAtIndexedSubscript:j];
                  [v24 doubleValue];
                  double v26 = v25;
                  double v27 = [v50 widths];
                  double v28 = [v27 objectAtIndexedSubscript:j];
                  [v28 doubleValue];
                  uint64_t v30 = [v23 numberWithDouble:v26 + v29];
                  [v11 setObject:v30 atIndexedSubscript:j];

                  if (([v21 allowTruncation] & 1) == 0)
                  {
                    v31 = NSNumber;
                    id v32 = [v49 objectAtIndexedSubscript:j];
                    [v32 doubleValue];
                    double v34 = v33;
                    double v35 = [v50 widths];
                    double v36 = [v35 objectAtIndexedSubscript:j];
                    [v36 doubleValue];
                    CGFloat v38 = [v31 numberWithDouble:v34 + v37];
                    [v49 setObject:v38 atIndexedSubscript:j];
                  }
                }
              }

              uint64_t v20 = v48 + 1;
              id v9 = v46;
            }
            while (v48 + 1 < (unint64_t)[v46 count]);
          }
          uint64_t v39 = [MEMORY[0x1E4F28E60] indexSet];
          if ([v11 count])
          {
            unint64_t v40 = 0;
            do
            {
              CFAttributedStringRef v41 = [v11 objectAtIndexedSubscript:v40];
              [v41 doubleValue];
              double v43 = v42;

              if (v43 > a5) {
                [v39 addIndex:v40];
              }
              ++v40;
            }
            while (v40 < [v11 count]);
          }
          if ([v39 count])
          {
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke;
            v51[3] = &unk_1E6E2A528;
            id v52 = v9;
            id v53 = v47;
            uint64_t v54 = v45;
            double v55 = a5;
            [v39 enumerateIndexesUsingBlock:v51];
          }
          goto LABEL_29;
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v11 = v9;
  }
LABEL_29:
}

void __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_opt_new();
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
      int v9 = [v8 allowTruncation];

      uint64_t v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6];
      id v11 = [v10 widths];
      uint64_t v12 = [v11 objectAtIndexedSubscript:a2];
      [v12 doubleValue];
      double v14 = v13;

      if (v9 && v14 > 0.0)
      {
        CFIndex v15 = [NSNumber numberWithDouble:v14];
        [v5 addObject:v15];

        [v4 addIndex:v6];
      }
      else
      {
        [v5 addObject:&unk_1F3FA8078];
        double v7 = v7 + v14;
      }
      ++v6;
    }
    while (v6 < [*(id *)(a1 + 32) count]);
  }
  else
  {
    double v7 = 0.0;
  }
  uint64_t v16 = [*(id *)(a1 + 48) truncatedWidthsForItemWidths:v5 availableWidth:*(double *)(a1 + 56) - v7];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke_2;
  v19[3] = &unk_1E6E2A500;
  id v20 = *(id *)(a1 + 40);
  id v21 = v16;
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v23 = a2;
  uint64_t v24 = v17;
  id v22 = *(id *)(a1 + 32);
  id v18 = v16;
  [v4 enumerateIndexesUsingBlock:v19];
}

void __113__TIKeyboardSecureCandidateTextRendering__handleEllipsisTruncationForTextRuns_textRunResponses_inAvailableWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v20 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [v20 widths];
  id v8 = [v7 objectAtIndexedSubscript:*(void *)(a1 + 56)];
  [v8 doubleValue];
  double v10 = v9;

  if (v6 < v10)
  {
    ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)[v20 ctLines], *(void *)(a1 + 56));
    uint64_t v12 = *(void **)(a1 + 64);
    uint64_t v13 = [v20 font];
    double v14 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    CFAttributedStringRef v15 = (const __CFAttributedString *)objc_msgSend(v12, "_newAttributedStringWithText:font:color:", @"…", v13, objc_msgSend(v14, "color"));

    uint64_t v16 = CTLineCreateWithAttributedString(v15);
    CFRelease(v15);
    TruncatedLine = CTLineCreateTruncatedLine(ValueAtIndex, v6, kCTLineTruncationEnd, v16);
    if (!TruncatedLine) {
      TruncatedLine = CFRetain(v16);
    }
    CFRelease(v16);
    CFArraySetValueAtIndex((CFMutableArrayRef)[v20 ctLines], *(void *)(a1 + 56), TruncatedLine);
    id v18 = objc_msgSend(NSNumber, "numberWithDouble:", CTLineGetTypographicBounds((CTLineRef)TruncatedLine, 0, 0, 0));
    uint64_t v19 = [v20 widths];
    [v19 setObject:v18 atIndexedSubscript:*(void *)(a1 + 56)];

    CFRelease(TruncatedLine);
  }
}

+ (__CFAttributedString)_newAttributedStringWithText:(id)a3 font:(__CTFont *)a4 color:(CGColor *)a5
{
  double v7 = (__CFString *)a3;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24740], a5);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F243F0], a4);
  double v9 = CFAttributedStringCreate(0, v7, Mutable);

  CFRelease(Mutable);
  return v9;
}

+ (BOOL)_textRunsHaveFixedFontSize:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "minFontSize", (void)v14);
        double v10 = v9;
        [v8 maxFontSize];
        if (v10 != v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (id)truncatedWidthsForItemWidths:(id)a3 availableWidth:(double)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    id v8 = v5;
LABEL_5:
    id v7 = v8;
    goto LABEL_6;
  }
  if ([v5 count] == 1)
  {
    uint64_t v6 = [NSNumber numberWithDouble:a4];
    v42[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];

    goto LABEL_6;
  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      unint64_t v17 = 0;
      do
      {
        [v7 addObject:&unk_1F3FA8078];
        ++v17;
      }
      while (v17 < [v5 count]);
    }
    goto LABEL_6;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) doubleValue];
        double v14 = v14 + v16;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
  }

  if (v14 <= a4)
  {
    id v8 = v10;
    goto LABEL_5;
  }
  id v18 = (void *)[v10 mutableCopy];
  while (1)
  {
    uint64_t v19 = objc_opt_new();
    if ([v18 count])
    {
      unint64_t v20 = 0;
      double v21 = 0.0;
      double v22 = 0.0;
      do
      {
        uint64_t v23 = [v18 objectAtIndexedSubscript:v20];
        [v23 doubleValue];
        double v25 = v24;

        if (v25 <= v22)
        {
          double v26 = v22;
          double v22 = v21;
        }
        else
        {
          [v19 removeAllIndexes];
          double v26 = v25;
        }
        if (v25 == v26)
        {
          [v19 addIndex:v20];
        }
        else if (v25 > v22)
        {
          double v22 = v25;
        }
        ++v20;
        double v27 = v22;
        double v21 = v22;
        double v22 = v26;
      }
      while (v20 < [v18 count]);
    }
    else
    {
      double v26 = 0.0;
      double v27 = 0.0;
    }
    double v28 = v14 - (double)(unint64_t)[v19 count] * (v26 - v27);
    if (v28 < a4) {
      break;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke_2;
    v31[3] = &unk_1E6E2A4D8;
    id v7 = v18;
    id v32 = v7;
    double v33 = v27;
    [v19 enumerateIndexesUsingBlock:v31];

    double v14 = v28;
    if (v28 <= a4) {
      goto LABEL_6;
    }
  }
  double v29 = a4 - (v14 - (double)(unint64_t)[v19 count] * v26);
  double v30 = v29 / (double)(unint64_t)[v19 count];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke;
  v34[3] = &unk_1E6E2A4D8;
  id v7 = v18;
  id v35 = v7;
  double v36 = v30;
  [v19 enumerateIndexesUsingBlock:v34];

LABEL_6:

  return v7;
}

void __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v4 atIndexedSubscript:a2];
}

void __86__TIKeyboardSecureCandidateTextRendering_truncatedWidthsForItemWidths_availableWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v4 atIndexedSubscript:a2];
}

+ (CGColor)_newCgColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (_newCgColorWithRed_green_blue_alpha__onceToken != -1) {
    dispatch_once(&_newCgColorWithRed_green_blue_alpha__onceToken, &__block_literal_global_3588);
  }
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  return CGColorCreate((CGColorSpaceRef)_newCgColorWithRed_green_blue_alpha__colorSpace, components);
}

CGColorSpaceRef __78__TIKeyboardSecureCandidateTextRendering__newCgColorWithRed_green_blue_alpha___block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  _newCgColorWithRed_green_blue_alpha__colorSpace = (uint64_t)result;
  return result;
}

@end