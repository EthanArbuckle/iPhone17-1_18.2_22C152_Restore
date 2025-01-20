@interface NSATSLineFragment
- (CFIndex)layoutForStartingGlyphAtIndex:(double)a3 characterIndex:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 lineFragmentRect:(CGFloat)a7;
- (double)resolveOpticalAlignmentUpdatingMinPosition:(double *)a3 maxPosition:;
- (uint64_t)_copyRenderingContextWithGlyphOrigin:(uint64_t)result;
- (uint64_t)resolvedLineBreakMode:(uint64_t)result;
- (unint64_t)_charIndexToBreakLineByWordWrappingAtIndex:(char *)a3 lineFragmentWidth:(double)a4 hyphenate:;
- (unint64_t)getTypographicLineHeight:(double *)a3 baselineOffset:(double *)a4 leading:;
- (void)_invalidate;
- (void)dealloc;
- (void)finalize;
- (void)justifyWithFactor:(uint64_t)a1;
- (void)saveMorphedGlyphs:(uint64_t)a1;
- (void)saveWithGlyphOrigin:(uint64_t)a1;
@end

@implementation NSATSLineFragment

- (uint64_t)_copyRenderingContextWithGlyphOrigin:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_allocWithZone((Class)NSLineFragmentRenderingContext);
    uint64_t v5 = [*(id *)(v3 + 16) _textStorageForAttachmentProtocol];
    CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)(v3 + 8));
    v7 = *(const __CTLine **)(v3 + 8);
    if (v6 == __CFArrayTypeID)
    {
      CFArrayRef GlyphRuns = *(CFArrayRef *)(v3 + 8);
    }
    else
    {
      CFArrayRef GlyphRuns = CTLineGetGlyphRuns(v7);
      v7 = *(const __CTLine **)(v3 + 8);
    }
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v7, 0);
    double v9 = *(double *)(v3 + 96) + BoundsWithOptions.size.width;
    double v10 = *(double *)(v3 + 80);
    uint64_t v11 = [*(id *)(v3 + 16) _usesScreenFonts];
    BOOL v12 = [*(id *)(v3 + 16) _baseWritingDirection] == 1;
    uint64_t v13 = [*(id *)(v3 + 16) applicationFrameworkContext];
    return [v4 initWithTextStorage:v5 runs:GlyphRuns glyphOrigin:v11 lineFragmentWidth:v12 elasticWidth:v13 usesScreenFonts:a2 isRTL:v9 applicationFrameworkContext:v10];
  }
  return result;
}

- (void)_invalidate
{
  if (a1)
  {
    *(_DWORD *)(a1 + 104) = 0;
    v2 = *(const void **)(a1 + 8);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 8) = 0;
    }
  }
}

- (CFIndex)layoutForStartingGlyphAtIndex:(double)a3 characterIndex:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 lineFragmentRect:(CGFloat)a7
{
  if (!result) {
    return result;
  }
  uint64_t v16 = result;
  uint64_t v17 = [*(id *)(result + 16) _getATSTypesetterGuts];
  v18 = (const __CTTypesetter *)[*(id *)(v16 + 16) _ctTypesetter];
  uint64_t v19 = *(void *)(v17 + 16);
  int v20 = [*(id *)(v16 + 16) _isLineBreakModeOverridden];
  uint64_t v21 = -[NSATSLineFragment resolvedLineBreakMode:](v16, v20);
  uint64_t v22 = [*(id *)(v16 + 16) paragraphCharacterRange];
  long long v145 = 0uLL;
  CFIndex v23 = a9 - v22;
  uint64_t v138 = v24;
  uint64_t v139 = v22 + v24;
  CFStringRef theString = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "string");
  double v25 = a3 - a2;
  v26 = (unsigned char *)[*(id *)(v16 + 16) _bidiLevels];
  [*(id *)(v16 + 16) defaultTighteningFactor];
  double v28 = v27;
  -[NSATSLineFragment _invalidate](v16);
  *(double *)(v16 + 56) = a2;
  *(double *)(v16 + 64) = a3;
  *(_DWORD *)(v16 + 88) = 0;
  *(void *)(v16 + 96) = 0;
  if (v21 > 1)
  {
    *(void *)(v16 + 40) = [*(id *)(v16 + 16) paragraphCharacterRange];
    *(void *)(v16 + 48) = v40;
    *(void *)(v16 + 24) = [*(id *)(v16 + 16) paragraphGlyphRange];
    *(void *)(v16 + 32) = v41;
    v146.length = *(void *)(v16 + 48);
    v146.location = 0;
    *(void *)(v16 + 8) = CTTypesetterCreateLine(v18, v146);
    int v42 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "layoutManager"), "_forcesTrackingFloor");
    v43 = *(const __CTLine **)(v16 + 8);
    if (v42)
    {
      uint64_t JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
      v43 = *(const __CTLine **)(v16 + 8);
      if (JustifiedLineWithOptions)
      {
        v45 = (const __CTLine *)JustifiedLineWithOptions;
        CFRelease(*(CFTypeRef *)(v16 + 8));
        *(void *)(v16 + 8) = v45;
        v43 = v45;
      }
    }
    -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v43, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
    *(void *)(v16 + 72) = *(void *)(*(void *)(v17 + 16) + 168);
    double v46 = *(double *)(*(void *)(v17 + 16) + 176);
    *(double *)(v16 + 80) = v46;
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(v16 + 8), 0);
    double v35 = *(double *)(v16 + 96) - v46;
    double v47 = BoundsWithOptions.size.width + v35;
    if (v20)
    {
      uint64_t v48 = [*(id *)(v16 + 16) paragraphSeparatorCharacterRange];
      BOOL v50 = !v49 && *(void *)(v16 + 48) + *(void *)(v16 + 40) == v48;
      BOOL v51 = !v50 && (unint64_t)v21 >= 3;
      BOOL v52 = !v51 || v25 < v47;
      double v35 = v47 + -1.0;
      if (!v52) {
        double v25 = v47 + -1.0;
      }
    }
    if (v25 >= v47) {
      goto LABEL_129;
    }
    double v35 = v47 - v25;
    if (v47 - v25 <= 0.001) {
      goto LABEL_129;
    }
    if ((unint64_t)v21 < 3)
    {
      if (v28 > 0.0)
      {
        double v35 = (v28 + 1.0) * v25;
        if (v35 >= v47)
        {
          uint64_t v64 = CTLineCreateJustifiedLineWithOptions();
          if (v64)
          {
            uint64_t v65 = v64;
            CFRelease(*(CFTypeRef *)(v16 + 8));
            *(void *)(v16 + 8) = v65;
          }
        }
      }
      goto LABEL_129;
    }
    if ((v20 & 1) == 0)
    {
      int v108 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "currentParagraphStyle", v35), "allowsDefaultTighteningForTruncation");
      if ((v108 & 1) != 0
        || (([*(id *)(v16 + 16) tightenThresholdForTruncation],
             float v124 = v123,
             objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "currentParagraphStyle"), "tighteningFactorForTruncation"),
             v124 == 0.0)
         || v25 >= v47 * v124)
        && v25 * (v125 + 1.0) >= v47)
      {
        uint64_t v126 = CTLineCreateJustifiedLineWithOptions();
        if (v126)
        {
          uint64_t v127 = v126;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(void *)(v16 + 8) = v127;
          goto LABEL_167;
        }
        if (v108)
        {
          uint64_t v128 = CTLineCreateJustifiedLineWithOptions();
          if (v128)
          {
            uint64_t v129 = v128;
            CFRelease(*(CFTypeRef *)(v16 + 8));
            *(void *)(v16 + 8) = v129;
          }
        }
      }
    }
    TruncatedLineWithTokenCallback = (const __CTLine *)CTLineCreateTruncatedLineWithTokenCallback();
    if (TruncatedLineWithTokenCallback)
    {
      v54 = TruncatedLineWithTokenCallback;
      CFArrayRef GlyphRuns = CTLineGetGlyphRuns(TruncatedLineWithTokenCallback);
      if (CFArrayGetCount(GlyphRuns) != 1)
      {
        CFRelease(*(CFTypeRef *)(v16 + 8));
        *(void *)(v16 + 8) = v54;
        goto LABEL_167;
      }
      CFRelease(v54);
    }
    int v56 = v21 == 3;
    if (v21 == 3)
    {
      uint64_t RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
      uint64_t v116 = 0;
      unint64_t v58 = *(void *)(v16 + 40);
      uint64_t v59 = RangeOfCharacterClusterAtIndex - v58;
      CFIndex v60 = *(void *)(v16 + 48) - (RangeOfCharacterClusterAtIndex - v58);
      CFIndex v61 = RangeOfCharacterClusterAtIndex - v58;
    }
    else
    {
      CFStringGetRangeOfCharacterClusterAtIndex();
      unint64_t v117 = *(void *)(v16 + 72);
      unint64_t v58 = *(void *)(v16 + 40);
      if (v117 > v58 && v58 + v116 >= v117) {
        goto LABEL_167;
      }
      CFIndex v61 = 0;
      uint64_t v59 = *(void *)(v16 + 48) - v116;
      CFIndex v60 = v116;
    }
    if (v59 >= 1)
    {
      if (v19)
      {
        uint64_t v118 = *(void *)(v19 + 96);
        if (v118 >= 1)
        {
          int64_t v119 = v58 + v116;
          v120 = *(uint64_t **)(v19 + 88);
          v121 = &v120[13 * v118];
          uint64_t v122 = *(void *)(v19 + 128);
          while (1)
          {
            v122 += v120[2];
            if (v122 > v119) {
              break;
            }
            v120 += 13;
            if (v120 >= v121) {
              goto LABEL_167;
            }
          }
          v130 = [(NSATSGlyphStorage *)(void *)v19 _createEllipsisRunWithStringRange:v59 attributes:*v120];
          if (v26)
          {
            if (v21 == 3) {
              int v56 = (v26[v138 - 1] & 1) == 0;
            }
            else {
              int v56 = *v26 & 1;
            }
          }
          v150.location = v61;
          v150.length = v60;
          Line = CTTypesetterCreateLine(v18, v150);
          CFArrayRef v132 = CTLineGetGlyphRuns(Line);
          CFIndex Count = CFArrayGetCount(v132);
          Mutable = CFArrayCreateMutable(0, Count + 1, MEMORY[0x1E4F1D510]);
          v135 = Mutable;
          if (v56)
          {
            CFArrayAppendValue(Mutable, v130);
            v151.location = 0;
            v151.length = Count;
            CFArrayAppendArray(v135, v132, v151);
          }
          else
          {
            v152.location = 0;
            v152.length = Count;
            CFArrayAppendArray(Mutable, v132, v152);
            CFArrayAppendValue(v135, v130);
          }
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(void *)(v16 + 8) = CTLineCreateWithRunArray();
          CFRelease(v130);
          CFRelease(Line);
          CFRelease(v135);
        }
      }
    }
LABEL_167:
    *(void *)(v16 + 72) = v139;
    *(void *)(v16 + 80) = 0;
    goto LABEL_129;
  }
  v29 = v18;
  v136 = v26;
  BOOL v30 = 0;
  char v144 = 0;
  if (v28 > 0.0) {
    BOOL v30 = [*(id *)(v16 + 16) paragraphCharacterRange] == a9;
  }
  uint64_t v31 = [*(id *)(v16 + 16) layoutManager];
  double v32 = 0.001;
  if (!v31) {
    double v32 = 0.0;
  }
  double v33 = v25 + v32;
  *(void *)(v16 + 40) = a9;
  *(void *)(v16 + 48) = 0;
  *(void *)(v16 + 80) = 0;
  CTTypesetterRef typesetter = (CTTypesetterRef)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "attribute:atIndex:effectiveRange:", @"NSAttachment", a9, 0);
  uint64_t v34 = [(__CTTypesetter *)typesetter embeddingType];
  double v35 = *(double *)(v16 + 56);
  double v36 = *(double *)(v16 + 64);
  BOOL v37 = v35 != v36 && v34 == 1;
  int v38 = v37;
  if (v37)
  {
    CFIndex v39 = 1;
  }
  else if (v35 == v36 || (CFIndex v39 = CTTypesetterSuggestClusterBreak(v29, v23, v33), v39 <= 0))
  {
    uint64_t v62 = CFStringGetRangeOfCharacterClusterAtIndex();
    CFIndex v39 = v63 - a9 + v62;
    uint64_t v21 = 1;
  }
  if (v30)
  {
    *(void *)(v16 + 40) = [*(id *)(v16 + 16) paragraphCharacterRange];
    *(void *)(v16 + 48) = v66;
    *(void *)(v16 + 24) = [*(id *)(v16 + 16) paragraphGlyphRange];
    *(void *)(v16 + 32) = v67;
    v147.length = *(void *)(v16 + 48);
    v147.location = 0;
    v68 = CTTypesetterCreateLine(v29, v147);
    *(void *)(v16 + 8) = v68;
    -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v68, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
    *(void *)(v16 + 72) = *(void *)(*(void *)(v17 + 16) + 168);
    double v69 = *(double *)(*(void *)(v17 + 16) + 176);
    *(double *)(v16 + 80) = v69;
    CGRect v154 = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(v16 + 8), 0);
    double v35 = v154.size.width + *(double *)(v16 + 96) - v69;
    if (v35 > v33)
    {
      if ((v28 + 1.0) * v33 < v35 || (uint64_t v70 = CTLineCreateJustifiedLineWithOptions()) == 0)
      {
        uint64_t v70 = 0;
        *(void *)(v16 + 40) = a9;
        *(void *)(v16 + 48) = 0;
        *(void *)(v16 + 80) = 0;
      }
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(void *)(v16 + 8) = v70;
    }
  }
  if (*(void *)(v16 + 8)) {
    goto LABEL_128;
  }
  unint64_t v140 = v139 - a9;
  double v71 = v33;
  while (1)
  {
    while (1)
    {
      if (v39)
      {
        uint64_t v72 = -[NSATSGlyphStorage _collectElasticRangeSurroundingCharacterAtIndex:minimumCharacterIndex:](v19, v39 + a9, a9);
        *(void *)&long long v145 = v72;
        *((void *)&v145 + 1) = v73;
      }
      else
      {
        long long v145 = *(_OWORD *)(v16 + 40);
        uint64_t v73 = *((void *)&v145 + 1);
        uint64_t v72 = v145;
      }
      if (v21) {
        char v74 = 1;
      }
      else {
        char v74 = v38;
      }
      if ((v74 & 1) == 0)
      {
        if (v73 + v72 - a9 >= v140) {
          goto LABEL_79;
        }
        if (v39) {
          unint64_t v75 = v73 + v72;
        }
        else {
          unint64_t v75 = a9;
        }
        uint64_t v76 = v75 + 1;
        if (v75 + 1 - a9 < v140 && (CFStringGetCharacterAtIndex(theString, v75 + 1) & 0xFC00) == 0xDC00) {
          uint64_t v76 = v75 + 2;
        }
        if (typesetter
          && (*(_DWORD *)(v19 + 224) & 2) != 0
          && ![(__CTTypesetter *)typesetter attachmentCell])
        {
          *(void *)(v16 + 40) = [*(id *)(v16 + 16) paragraphCharacterRange];
          *(void *)(v16 + 48) = v77;
          *(void *)(v16 + 24) = [*(id *)(v16 + 16) paragraphGlyphRange];
          *(void *)(v16 + 32) = v78;
          v148.length = *(void *)(v16 + 48);
          v148.location = 0;
          v79 = CTTypesetterCreateLine(v29, v148);
          *(void *)(v16 + 8) = v79;
          -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v79, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
          *(void *)(v16 + 40) = a9;
          *(void *)(v16 + 48) = 0;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(void *)(v16 + 8) = 0;
        }
        unint64_t v80 = -[NSATSLineFragment _charIndexToBreakLineByWordWrappingAtIndex:lineFragmentWidth:hyphenate:](v16, v76, &v144, v33);
        if (v80 == a9)
        {
          uint64_t v81 = CTTypesetterSuggestClusterBreak(v29, v23, v33);
          if (v81 <= 0)
          {
            CFStringGetRangeOfCharacterClusterAtIndex();
            uint64_t v81 = v82;
          }
          *(_DWORD *)(v16 + 104) |= 0x10u;
          goto LABEL_121;
        }
        uint64_t v83 = v80;
        uint64_t v73 = *((void *)&v145 + 1);
        uint64_t v72 = v145;
        if (*((void *)&v145 + 1) + (void)v145 == v83)
        {
LABEL_79:
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v72 = -[NSATSGlyphStorage _collectElasticRangeSurroundingCharacterAtIndex:minimumCharacterIndex:](v19, v83, a9);
          uint64_t v21 = 0;
          *(void *)&long long v145 = v72;
          *((void *)&v145 + 1) = v73;
        }
      }
      uint64_t v84 = v73 + v72;
      uint64_t v81 = v73 + v72 - a9;
      v149.location = v23;
      v149.length = v81;
      *(void *)(v16 + 8) = CTTypesetterCreateLine(v29, v149);
      if (objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "layoutManager"), "_forcesTrackingFloor"))
      {
        uint64_t v85 = CTLineCreateJustifiedLineWithOptions();
        if (v85)
        {
          uint64_t v86 = v85;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(void *)(v16 + 8) = v86;
        }
      }
      long long v87 = v145;
      *(void *)(v16 + 72) = v145;
      if (*((void *)&v87 + 1)) {
        double v88 = [(NSATSGlyphStorage *)v19 _widthForStringRange:*((uint64_t *)&v87 + 1)];
      }
      else {
        double v88 = 0.0;
      }
      *(double *)(v16 + 80) = v88;
      *(_DWORD *)(v16 + 88) = 0;
      *(void *)(v16 + 96) = 0;
      if (v144)
      {
        if (v19 && (uint64_t v89 = *(void *)(v19 + 96), v89 >= 1))
        {
          uint64_t v90 = v84 - 1;
          unint64_t v91 = *(void *)(v19 + 88);
          unint64_t v92 = v91 + 104 * v89;
          uint64_t v93 = *(void *)(v19 + 128);
          while (1)
          {
            v93 += *(void *)(v91 + 16);
            if (v93 > v90) {
              break;
            }
            v91 += 104;
            if (v91 >= v92) {
              goto LABEL_92;
            }
          }
        }
        else
        {
LABEL_92:
          unint64_t v91 = 0;
        }
        unsigned int v94 = objc_msgSend(*(id *)(v16 + 16), "hyphenCharacterForGlyphAtIndex:", objc_msgSend(*(id *)(v16 + 16), "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(v16 + 40) + *(void *)(v16 + 48) - 1, 1, 0));
        if (v94 < 0x10000)
        {
          LOWORD(v95) = v94;
          CFIndex v96 = 1;
        }
        else
        {
          int v95 = (v94 >> 10) - 10240;
          characters[1] = v94 & 0x3FF | 0xDC00;
          CFIndex v96 = 2;
        }
        characters[0] = v95;
        if (CTFontGetGlyphsForCharacters(*(CTFontRef *)(v91 + 8), characters, glyphs, v96) && (uint64_t v97 = glyphs[0]) != 0)
        {
          *(_DWORD *)(v16 + 88) = glyphs[0];
        }
        else
        {
          uint64_t v97 = objc_msgSend(*(id *)(v91 + 8), "hyphenGlyphForLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"));
          *(_DWORD *)(v16 + 88) = v97;
          if (!v97) {
            goto LABEL_101;
          }
        }
        [*(id *)(v91 + 8) advancementForGlyph:v97];
        *(double *)(v16 + 96) = v98 * *(double *)(v91 + 48);
      }
LABEL_101:
      v99 = *(const __CTLine **)(v16 + 8);
      double v100 = *(double *)(v16 + 56);
      double v101 = *(double *)(v16 + 64);
      if (!v38) {
        break;
      }
      -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v99, (CFIndex *)&v145, a4, a5, a6, a7, v100, v101, 0.0);
LABEL_103:
      *(void *)(v16 + 48) = v81;
      CFIndex v39 = v81;
      if (v81) {
        goto LABEL_127;
      }
    }
    if (-[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v99, (CFIndex *)&v145, a4, a5, a6, a7, v100, v101, v71 + *(double *)(v16 + 80)))
    {
      double v102 = *(double *)(v16 + 80);
      CGRect v155 = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(v16 + 8), 0);
      if (v155.size.width + *(double *)(v16 + 96) - v102 < v33) {
        goto LABEL_103;
      }
    }
    unint64_t v103 = CFStringGetRangeOfCharacterClusterAtIndex();
    if (v103 == -1) {
      break;
    }
    unint64_t v105 = v103;
    if (v21 != 1 || v103 > a9)
    {
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(void *)(v16 + 8) = 0;
      char v144 = 0;
      if (v105 >= a9) {
        uint64_t v81 = v105 - a9;
      }
      else {
        uint64_t v81 = 0;
      }
      goto LABEL_122;
    }
    uint64_t v106 = *(void *)(v16 + 72);
    if ((void)v145 == v106 || (unint64_t v107 = v103 + v104, v103 + v104 == v106))
    {
      *(void *)(v16 + 48) = v81;
    }
    else
    {
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(void *)(v16 + 8) = 0;
      char v144 = 0;
      if (v107 >= a9) {
        uint64_t v81 = v107 - a9;
      }
      else {
        uint64_t v81 = 0;
      }
      double v71 = 0.0;
    }
LABEL_121:
    uint64_t v21 = 1;
LABEL_122:
    CFIndex v39 = v81;
    uint64_t v81 = *(void *)(v16 + 48);
    if (v81) {
      goto LABEL_127;
    }
  }
  CFRelease(*(CFTypeRef *)(v16 + 8));
  *(void *)(v16 + 8) = 0;
  uint64_t v81 = *(void *)(v16 + 48);
LABEL_127:
  *(void *)(v16 + 24) = objc_msgSend(*(id *)(v16 + 16), "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(v16 + 40), v81, 0);
  *(void *)(v16 + 32) = v109;
LABEL_128:
  v26 = v136;
LABEL_129:
  *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFFC | (objc_msgSend(*(id *)(v16 + 16), "_baseWritingDirection", v35) == 1);
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "attribute:atIndex:effectiveRange:", @"NSAttachment", *(void *)(v16 + 40), 0), "embeddingType");
  *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFF7 | (8 * (result == 1));
  if (v26)
  {
    CFArrayRef v110 = CTLineGetGlyphRuns(*(CTLineRef *)(v16 + 8));
    result = CFArrayGetCount(v110);
    if (result >= 2)
    {
      CFIndex v111 = result;
      if ((*(unsigned char *)(v16 + 104) & 3) != 0)
      {
        while (1)
        {
          BOOL v112 = v111-- < 1;
          if (v112) {
            break;
          }
          ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v110, v111);
          result = CTRunGetStringRange(ValueAtIndex).location;
          BOOL v112 = v23 < result;
          CFIndex v23 = result;
          if (v112) {
            goto LABEL_135;
          }
        }
      }
      else
      {
        CFIndex v114 = 0;
        while (1)
        {
          v115 = (const __CTRun *)CFArrayGetValueAtIndex(v110, v114);
          result = CTRunGetStringRange(v115).location;
          if (result < v23) {
            break;
          }
          ++v114;
          CFIndex v23 = result;
          if (v111 == v114) {
            return result;
          }
        }
LABEL_135:
        *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFFC | 2;
      }
    }
  }
  return result;
}

- (uint64_t)resolvedLineBreakMode:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = [*(id *)(result + 16) _getATSTypesetterGuts];
  if ((*(unsigned char *)(v4 + 84) & 0x10) != 0)
  {
    if (!a2) {
      return 0;
    }
    return ((unint64_t)*(unsigned int *)(*(void *)(v4 + 40) + 216) >> 11) & 0xF;
  }
  if (!a2) {
    return ((unint64_t)*(unsigned int *)(*(void *)(v4 + 40) + 216) >> 11) & 0xF;
  }
  uint64_t v5 = (void *)[*(id *)(v3 + 16) currentTextContainer];

  return [v5 lineBreakMode];
}

- (unint64_t)getTypographicLineHeight:(double *)a3 baselineOffset:(double *)a4 leading:
{
  if (!result) {
    return result;
  }
  unint64_t v7 = result;
  uint64_t v8 = [*(id *)(result + 16) _getATSTypesetterGuts];
  uint64_t v69 = *(void *)(v8 + 40);
  double v9 = *(void **)(v8 + 16);
  unint64_t v10 = v9[11];
  uint64_t v11 = v9[12];
  uint64_t v12 = *(void *)(v7 + 40);
  uint64_t v13 = v12 - [*(id *)(v7 + 16) paragraphCharacterRange];
  uint64_t v74 = [*(id *)(v7 + 16) typesetterBehavior];
  int v77 = [*(id *)(v7 + 16) usesFontLeading];
  result = [*(id *)(v7 + 16) _forceOriginalFontBaseline];
  int v75 = result;
  uint64_t v72 = a3;
  uint64_t v73 = a4;
  if (v9[25])
  {
    uint64_t v14 = v9[26];
    if (v14 <= v13) {
      unint64_t v15 = v9[25];
    }
    else {
      unint64_t v15 = v10;
    }
    if (v14 <= v13) {
      uint64_t v16 = v9[26];
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v15 = v10;
  }
  unint64_t v17 = v10 + 104 * v11;
  uint64_t v70 = v9;
  if ((v77 & 1) == 0)
  {
    result = [*(id *)(v7 + 16) paragraphSeparatorGlyphRange];
    if (v19)
    {
      uint64_t v20 = *(void *)(v7 + 24);
    }
    else
    {
      uint64_t v20 = *(void *)(v7 + 24);
      if (*(void *)(v7 + 32) + v20 >= result)
      {
        int v76 = 0;
        goto LABEL_17;
      }
    }
    int v76 = 1;
LABEL_17:
    BOOL v18 = v20 != 0;
    goto LABEL_18;
  }
  int v76 = 0;
  BOOL v18 = 0;
LABEL_18:
  double v71 = a2;
  if (v15 < v17)
  {
    while (1)
    {
      uint64_t v21 = *(void *)(v15 + 16) + v16;
      if (v13 < v21) {
        break;
      }
      v15 += 104;
      uint64_t v16 = v21;
      if (v15 >= v17) {
        goto LABEL_23;
      }
    }
  }
  uint64_t v21 = v16;
LABEL_23:
  double v22 = 0.0;
  if (v15 >= v17)
  {
    double v24 = 0.0;
    double v25 = 0.0;
  }
  else
  {
    uint64_t v23 = *(void *)(v7 + 48) + v13;
    double v24 = 0.0;
    double v25 = 0.0;
    if (v23 > v21)
    {
      CGFloat v79 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      CGFloat v80 = *MEMORY[0x1E4F28AD8];
      CGFloat v26 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      CGFloat bRect = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      unint64_t v27 = v15 + 104;
      do
      {
        v81.origin.y = v79;
        v81.origin.x = v80;
        v81.size.width = bRect;
        v81.size.height = v26;
        result = NSEqualRects(*(NSRect *)(v27 - 40), v81);
        if (result)
        {
          double v28 = *(double *)(v27 - 72);
          double v29 = *(double *)(v27 - 64);
        }
        else
        {
          double v28 = *(double *)(v27 - 16);
          double v29 = v28 + *(double *)(v27 - 32);
        }
        double v30 = 0.0;
        if (v76 | v18 | v77)
        {
          result = [*(id *)(v27 - 96) isVertical];
          if ((result & 1) == 0)
          {
            uint64_t v31 = *(void **)(v27 - 104);
            if (!v31) {
              goto LABEL_38;
            }
            if (!v75
              || (double v32 = (void *)[*(id *)(v27 - 104) objectForKey:_NSOriginalFontAttributeName]) == 0)
            {
              double v32 = (void *)[v31 objectForKey:@"NSFont"];
            }
            result = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", @"CTVerticalForms"), "BOOLValue");
            if (result)
            {
              result = [v32 verticalFont];
              double v32 = (void *)result;
            }
            if (!v32)
            {
LABEL_38:
              result = NSDefaultFont();
              double v32 = (void *)result;
            }
            if ((v77 & 1) != 0 || (result = CTFontIsSystemUIFont(), result))
            {
              if (v32)
              {
                result = [v32 _leading];
                double v30 = v33;
              }
            }
          }
        }
        if (v18)
        {
          if ((v76 & 1) == 0)
          {
            int v34 = v77;
            if (v30 <= 0.0) {
              int v34 = 1;
            }
            if (!v34) {
              double v30 = 0.0;
            }
          }
        }
        else if (v30 < 0.0)
        {
          double v30 = 0.0;
        }
        double v35 = *(double *)(v27 - 48);
        if (v35 <= 0.0) {
          double v36 = 0.0;
        }
        else {
          double v36 = *(double *)(v27 - 48);
        }
        double v37 = fmin(v30, 0.0) + v29 + v36;
        if (v35 >= 0.0) {
          double v38 = 0.0;
        }
        else {
          double v38 = *(double *)(v27 - 48);
        }
        double v39 = v29 - v28 + v38;
        if (((v74 < 2) & ~(_BYTE)v77 & (v35 > 0.0)) != 0) {
          double v40 = *(double *)(v27 - 48);
        }
        else {
          double v40 = -0.0;
        }
        double v41 = v39 + v40;
        if (v39 < v24)
        {
          double v24 = v41;
          double v39 = v41;
        }
        if (((v74 < 2) & ~(_BYTE)v77 & (v35 < 0.0)) == 0) {
          double v35 = -0.0;
        }
        double v42 = v35 + v37;
        if (v37 > v22) {
          double v22 = v42;
        }
        if (v30 >= 0.0) {
          double v43 = v30;
        }
        else {
          double v43 = 0.0;
        }
        double v44 = v43 - v39;
        if (v44 > v25) {
          double v25 = v44;
        }
        if (v27 >= v17) {
          break;
        }
        v21 += *(void *)(v27 - 88);
        v27 += 104;
      }
      while (v23 > v21);
    }
  }
  double v45 = v22 - v24;
  if (v74 < 3)
  {
    double v50 = v22 - v24;
    BOOL v51 = v72;
    BOOL v52 = v73;
    v54 = v70;
    v53 = v71;
    uint64_t v47 = v69;
    unint64_t v46 = v7;
  }
  else
  {
    uint64_t v47 = v69;
    unint64_t v46 = v7;
    double v48 = *(double *)(v69 + 104);
    BOOL v49 = v48 <= 0.0;
    double v50 = v45 * v48;
    if (v49) {
      double v50 = v22 - v24;
    }
    else {
      double v22 = v22 + v50 - v45;
    }
    BOOL v51 = v72;
    BOOL v52 = v73;
    v54 = v70;
    v53 = v71;
  }
  double v55 = *(double *)(v47 + 88);
  double v56 = *(double *)(v47 + 96);
  double v57 = v55 - v50;
  if (v50 >= v55) {
    double v57 = -0.0;
  }
  double v58 = v22 + v57;
  if (v50 < v55) {
    double v50 = *(double *)(v47 + 88);
  }
  BOOL v59 = v56 > 0.0;
  BOOL v60 = v50 > v56;
  double v61 = v50 - v56;
  if (!v59 || !v60) {
    double v61 = 0.0;
  }
  double v62 = v58 - v61;
  if (v59 && v60) {
    double v50 = *(double *)(v47 + 96);
  }
  int v63 = HIWORD(*(_DWORD *)(v47 + 216)) & 1;
  if (v50 < v45) {
    int v63 = 1;
  }
  if (v63) {
    int v64 = 4;
  }
  else {
    int v64 = 0;
  }
  *(_DWORD *)(v46 + 104) = v64 | *(_DWORD *)(v46 + 104) & 0xFFFFFFFB;
  double *v53 = v62 - v24;
  *BOOL v51 = v62;
  *BOOL v52 = v24 + v25;
  int v65 = v77;
  if (v74 >= 3) {
    int v65 = 0;
  }
  if (v65 == 1)
  {
    uint64_t v66 = *(void **)v54[11];
    if (!v66) {
      goto LABEL_105;
    }
    if (!v75 || (uint64_t v67 = (void *)[v66 objectForKey:_NSOriginalFontAttributeName]) == 0) {
      uint64_t v67 = (void *)[v66 objectForKey:@"NSFont"];
    }
    if (objc_msgSend((id)objc_msgSend(v66, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
      uint64_t v67 = (void *)[v67 verticalFont];
    }
    if (!v67) {
LABEL_105:
    }
      uint64_t v67 = NSDefaultFont();
    result = [v67 _leading];
    *(void *)BOOL v52 = v68;
  }
  return result;
}

- (double)resolveOpticalAlignmentUpdatingMinPosition:(double *)a3 maxPosition:
{
  if (a1)
  {
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(a1 + 8), 0x80uLL);
    double x = BoundsWithOptions.origin.x;
    double width = BoundsWithOptions.size.width;
    CGRect v10 = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(a1 + 8), 0xC0uLL);
    v10.size.height = *(CGFloat *)(a1 + 64);
    v10.origin.y = *(double *)(a1 + 56) + x - v10.origin.x;
    *(CGFloat *)(a1 + 56) = v10.origin.y;
    *(double *)(a1 + 64) = v10.size.height + x + width - (v10.origin.x + v10.size.width);
    *a2 = v10.origin.y;
    double result = *(double *)(a1 + 64);
    *a3 = result;
  }
  return result;
}

- (void)justifyWithFactor:(uint64_t)a1
{
  if (a1)
  {
    double v4 = *(double *)(a1 + 64) - *(double *)(a1 + 56);
    double v5 = *(double *)(a1 + 80);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(void *)(a1 + 8), 0);
    if (BoundsWithOptions.size.width + *(double *)(a1 + 96) - v5 < v4 * a2)
    {
      uint64_t JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
      if (JustifiedLineWithOptions)
      {
        uint64_t v7 = JustifiedLineWithOptions;
        CFRelease(*(CFTypeRef *)(a1 + 8));
        *(void *)(a1 + 8) = v7;
        *(void *)(a1 + 72) = *(void *)(a1 + 48) + *(void *)(a1 + 40);
        *(void *)(a1 + 80) = 0;
      }
    }
  }
}

- (void)saveMorphedGlyphs:(uint64_t)a1
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a1;
    if (*(void *)(a1 + 8))
    {
      uint64_t v101 = *(void *)([*(id *)(a1 + 16) _getATSTypesetterGuts] + 16);
      CFArrayRef GlyphRuns = CTLineGetGlyphRuns(*(CTLineRef *)(v2 + 8));
      uint64_t v112 = 0;
      uint64_t v113 = 0;
      CFIndex Count = CFArrayGetCount(GlyphRuns);
      CFIndex v6 = Count;
      int v7 = *(_DWORD *)(v2 + 104) & 3;
      uint64_t v98 = a2;
      if (v7 == 2)
      {
        MutableCopy = CFArrayCreateMutableCopy(0, Count, GlyphRuns);
        v116.CFIndex location = 0;
        v116.length = v6;
        CFArraySortValues(MutableCopy, v116, (CFComparatorFunction)__NSATSLineFragmentRunCompare, 0);
        CFIndex v10 = 0;
        uint64_t v99 = 1;
        CFArrayRef v100 = MutableCopy;
        uint64_t v97 = MutableCopy;
      }
      else
      {
        BOOL v8 = v7 == 1;
        if (v7 == 1) {
          uint64_t v9 = -1;
        }
        else {
          uint64_t v9 = 1;
        }
        uint64_t v99 = v9;
        CFArrayRef v100 = GlyphRuns;
        if (v8) {
          CFIndex v10 = Count - 1;
        }
        else {
          CFIndex v10 = 0;
        }
        uint64_t v97 = 0;
      }
      uint64_t v12 = 0;
      uint64_t v107 = v2;
      uint64_t v108 = 0;
      double v102 = (uint64_t *)(v2 + 32);
      unint64_t v13 = 0x1E91D4000uLL;
LABEL_13:
      uint64_t v104 = v12;
      while (v6-- >= 1)
      {
        ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(v100, v10);
        v10 += v99;
        CFIndex location = CTRunGetStringRange(ValueAtIndex).location;
        uint64_t GlyphStorage = CTRunGetGlyphStorage();
        uint64_t v18 = MEMORY[0x192FAD9C0](GlyphStorage);
        uint64_t v19 = *(int *)(v13 + 1728);
        int v20 = *(_DWORD *)(v18 + v19);
        if (v20)
        {
          uint64_t v21 = v18;
          uint64_t v22 = *(void *)(v18 + 152);
          if (!v22) {
            uint64_t v22 = v18;
          }
          uint64_t v103 = *(void *)(v22 + 128);
          uint64_t v23 = *(void *)(v18 + (int)*MEMORY[0x1E4F243A8]);
          uint64_t v24 = v112;
          uint64_t v25 = *(void *)(v18 + (int)*MEMORY[0x1E4F243B0]);
          uint64_t v26 = *(void *)(v18 + (int)*MEMORY[0x1E4F243B8]);
          uint64_t v27 = *(void *)(v18 + (int)*MEMORY[0x1E4F24390]);
          if (v27) {
            double v28 = (uint64_t *)(v27 + 8 * v112);
          }
          else {
            double v28 = 0;
          }
          if ((v20 & 0x10) != 0 || (*(unsigned char *)(v101 + v19) & 0x10) != 0)
          {
            double v30 = *(void **)(v2 + 16);
            uint64_t v31 = v103 + location;
            uint64_t v32 = v25;
            uint64_t v33 = v26;
            uint64_t v94 = v112;
            unint64_t v34 = v13;
            uint64_t v35 = v2;
            uint64_t v36 = v23;
            uint64_t v37 = objc_msgSend(v30, "glyphRangeForCharacterRange:actualCharacterRange:", v31, 1, 0);
            uint64_t v23 = v36;
            uint64_t v2 = v35;
            unint64_t v13 = v34;
            uint64_t v24 = v94;
            uint64_t v26 = v33;
            uint64_t v25 = v32;
            uint64_t v29 = v37;
          }
          else
          {
            uint64_t v29 = *(void *)(v18 + 112) + v112;
          }
          double v38 = (unsigned __int16 *)(v23 + 2 * v24);
          uint64_t v111 = v29;
          if (v113 == 1 && (*(unsigned char *)(v21 + *(int *)(v13 + 1728)) & 8) != 0 && !*v38)
          {
            uint64_t v95 = v25;
            uint64_t v39 = v26;
            int v40 = [*(id *)(v2 + 16) _allowsEllipsisGlyphSubstitution];
            uint64_t v26 = v39;
            uint64_t v25 = v95;
            if (v40)
            {
              v114[0] = 0xFFFFFF;
              if (v28 && (uint64_t v41 = *v28, v41 >= 1))
              {
                if ((unint64_t)v41 < 0x80)
                {
                  uint64_t v45 = v41 + 1;
                  __memset_chk();
                  uint64_t v108 = v29;
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v29, v41 + 1, v114);
                }
                else
                {
                  uint64_t v42 = v29;
                  uint64_t v43 = 1;
                  do
                  {
                    uint64_t v44 = 128 - v43;
                    bzero(&v114[v43], 4 * (128 - v43));
                    objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v42, 128, v114);
                    uint64_t v43 = 0;
                    v42 += v44;
                    v41 -= v44;
                  }
                  while ((unint64_t)v41 > 0x80);
                  uint64_t v108 = v42;
                  __memset_chk();
                  uint64_t v12 = 0;
                  uint64_t v45 = v41;
                  if (!v41) {
                    goto LABEL_13;
                  }
LABEL_155:
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v108, v41, v114);
                }
              }
              else
              {
                uint64_t v108 = v29;
                uint64_t v45 = 1;
                objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v29, 1, v114);
              }
              uint64_t v12 = v45;
              goto LABEL_13;
            }
          }
          unint64_t v46 = (char *)(v25 + 4 * v24);
          uint64_t v47 = (void *)(v26 + 8 * v24);
          if ((CTRunGetStatus(ValueAtIndex) & 1) == 0)
          {
            uint64_t v48 = v104;
            if (v113 < 1)
            {
LABEL_154:
              uint64_t v45 = 0;
              uint64_t v41 = v48;
              uint64_t v12 = 0;
              if (!v41) {
                goto LABEL_13;
              }
              goto LABEL_155;
            }
            BOOL v49 = &v38[v113];
            CFIndex v96 = v49;
            while (2)
            {
              int v50 = *(_DWORD *)v46;
              if (!v48 || (v50 & 0x40000) != 0)
              {
                BOOL v51 = (v50 & 0x220000) != 0 || v28 == 0;
                if (!v51 && *v28 && v48 != 128)
                {
                  if ((v50 & 0x200000) == 0) {
                    goto LABEL_48;
                  }
LABEL_55:
                  if ((char *)v49 - (char *)v38 < 1)
                  {
                    uint64_t v52 = 0;
                  }
                  else
                  {
                    char v53 = 0;
                    v54 = v28;
                    double v55 = v46;
                    do
                    {
                      if ((*(_DWORD *)v55 & 0x200000) == 0) {
                        break;
                      }
                      if (v54 && (uint64_t v56 = *v54, ++v54, v56 > 0) || (*(_DWORD *)v55 & 0x60000) != 0) {
                        char v53 = 1;
                      }
                      v55 += 4;
                    }
                    while (v55 < &v46[2 * ((char *)v49 - (char *)v38)]);
                    uint64_t v57 = v55 - v46;
                    uint64_t v52 = v57 >> 2;
                    if (v53)
                    {
                      uint64_t v58 = v48;
                      uint64_t v59 = v2;
                      unint64_t v60 = *(void *)(v2 + 32);
                      __NSDoReordants(*(void **)(v59 + 16), (uint64_t)v38, (uint64_t)v46, (uint64_t)v47, (uint64_t)v28, v103, v57 >> 2, &v111, v102);
                      if (*(void *)(v59 + 32) <= v60)
                      {
                        uint64_t v2 = v107;
                        unint64_t v13 = 0x1E91D4000;
                      }
                      else
                      {
                        unint64_t v13 = 0x1E91D4000uLL;
                        *(_DWORD *)(v101 + 224) |= 0x10u;
                        uint64_t v2 = v107;
                      }
                      uint64_t v48 = v58;
                      BOOL v49 = v96;
LABEL_70:
                      v38 += v52;
                      v46 += 4 * v52;
                      v47 += v52;
LABEL_71:
                      double v61 = &v28[v52];
                      goto LABEL_72;
                    }
                  }
                  v111 += v52;
                  goto LABEL_70;
                }
              }
              objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v108);
              uint64_t v48 = 0;
              int v50 = *(_DWORD *)v46;
              if ((*(_DWORD *)v46 & 0x200000) != 0) {
                goto LABEL_55;
              }
LABEL_48:
              if ((v50 & 0x20000) != 0)
              {
                if ((v50 & 0x20) != 0)
                {
                  ++v38;
                  v46 += 4;
                  if (v47) {
                    ++v47;
                  }
                  else {
                    uint64_t v47 = 0;
                  }
                  uint64_t v52 = 1;
                  goto LABEL_71;
                }
                uint64_t v62 = v48;
                [*(id *)(v2 + 16) insertGlyph:*v38 atGlyphIndex:v111 characterIndex:*v47 + v103];
                uint64_t v48 = v62;
                *(_DWORD *)(v101 + *(int *)(v13 + 1728)) |= 0x10u;
                ++*(void *)(v2 + 32);
                int v50 = *(_DWORD *)v46;
              }
              if ((v50 & 0x40000) != 0)
              {
                uint64_t v63 = v108;
                if (!v48) {
                  uint64_t v63 = v111;
                }
                uint64_t v108 = v63;
                int v64 = *v38;
                if (v64 == 0xFFFF) {
                  int v64 = 0;
                }
                v114[v48++] = v64;
                unint64_t v13 = 0x1E91D4000;
              }
              if (v28)
              {
                unint64_t v65 = *v28;
                uint64_t v66 = v111;
                if (*v28 >= 1)
                {
                  uint64_t v67 = v108;
                  if (!v48) {
                    uint64_t v67 = v111 + 1;
                  }
                  uint64_t v109 = v67;
                  unint64_t v68 = v65 + v48;
                  uint64_t v105 = v111;
                  if (v65 + v48 < 0x81)
                  {
                    uint64_t v71 = v48;
                    uint64_t v69 = v109;
                  }
                  else
                  {
                    uint64_t v69 = v67;
                    do
                    {
                      uint64_t v70 = 128 - v48;
                      bzero(&v114[v48], 4 * (128 - v48));
                      objc_msgSend(*(id *)(v107 + 16), "substituteGlyphsInRange:withGlyphs:", v69, 128, v114);
                      uint64_t v48 = 0;
                      uint64_t v71 = 0;
                      v69 += v70;
                      v65 -= v70;
                      unint64_t v68 = v65;
                    }
                    while (v65 > 0x80);
                  }
                  uint64_t v108 = v69;
                  bzero(&v114[v71], 4 * v65);
                  uint64_t v66 = *v28 + v105;
                  uint64_t v48 = v68;
                  uint64_t v2 = v107;
                  unint64_t v13 = 0x1E91D4000;
                }
              }
              else
              {
                uint64_t v66 = v111;
              }
              uint64_t v111 = v66 + 1;
              ++v38;
              v46 += 4;
              if (v47) {
                ++v47;
              }
              else {
                uint64_t v47 = 0;
              }
              double v61 = v28 + 1;
LABEL_72:
              if (v28) {
                double v28 = v61;
              }
              else {
                double v28 = 0;
              }
              if (v38 >= v49) {
                goto LABEL_154;
              }
              continue;
            }
          }
          uint64_t v72 = v113 - 1;
          uint64_t v12 = v104;
          if (v113 < 1) {
            goto LABEL_13;
          }
          uint64_t v73 = &v38[v72];
          if (v28) {
            uint64_t v74 = (unint64_t *)&v28[v72];
          }
          else {
            uint64_t v74 = 0;
          }
          int v75 = &v47[v72];
          int v76 = &v46[4 * v72];
          while (2)
          {
            uint64_t v106 = v12;
LABEL_105:
            int v77 = *(_DWORD *)v76;
            if ((*(_DWORD *)v76 & 0x200000) == 0)
            {
              if ((v77 & 0x20000) == 0)
              {
                uint64_t v85 = v111;
                if ((v77 & 0x40000) == 0) {
                  goto LABEL_133;
                }
                goto LABEL_130;
              }
              if ((v77 & 0x20) == 0)
              {
                uint64_t v85 = v111;
                [*(id *)(v2 + 16) insertGlyph:*v73 atGlyphIndex:v111 characterIndex:*v75 + v103];
                uint64_t v12 = v106;
                ++*(void *)(v2 + 32);
                *(_DWORD *)(v101 + *(int *)(v13 + 1728)) |= 0x10u;
                if ((*(_DWORD *)v76 & 0x40000) == 0) {
                  goto LABEL_133;
                }
LABEL_130:
                int v86 = *v73;
                if (v86 == 0xFFFF) {
                  int v86 = 0;
                }
                v114[0] = v86;
                uint64_t v12 = 1;
LABEL_133:
                if (!v74) {
                  goto LABEL_144;
                }
                uint64_t v110 = v85;
                unint64_t v87 = *v74;
                if ((uint64_t)*v74 < 1)
                {
                  uint64_t v85 = v110;
LABEL_144:
                  uint64_t v88 = v85;
                  if (!v12) {
                    goto LABEL_146;
                  }
LABEL_145:
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v88, v12, v114);
                  goto LABEL_146;
                }
                if (v12) {
                  uint64_t v88 = v110;
                }
                else {
                  uint64_t v88 = v110 + 1;
                }
                unint64_t v89 = v87 + v12;
                if (v87 + v12 < 0x81)
                {
                  uint64_t v91 = v12;
                }
                else
                {
                  do
                  {
                    uint64_t v90 = 128 - v12;
                    bzero(&v114[v12], 4 * (128 - v12));
                    objc_msgSend(*(id *)(v107 + 16), "substituteGlyphsInRange:withGlyphs:", v88, 128, v114);
                    uint64_t v12 = 0;
                    uint64_t v91 = 0;
                    v88 += v90;
                    v87 -= v90;
                    unint64_t v89 = v87;
                  }
                  while (v87 > 0x80);
                }
                bzero(&v114[v91], 4 * v87);
                uint64_t v85 = *v74 + v110;
                uint64_t v12 = v89;
                uint64_t v2 = v107;
                if (v12) {
                  goto LABEL_145;
                }
LABEL_146:
                uint64_t v12 = 0;
                uint64_t v108 = v88;
                uint64_t v111 = v85 + 1;
                --v73;
                v76 -= 4;
                --v75;
                if (v74) {
                  --v74;
                }
                else {
                  uint64_t v74 = 0;
                }
                unint64_t v13 = 0x1E91D4000;
                if (v73 < v38) {
                  goto LABEL_13;
                }
                continue;
              }
              uint64_t v78 = -1;
              goto LABEL_124;
            }
            break;
          }
          if ((char *)v73 - (char *)v38 < 0)
          {
            uint64_t v83 = 0;
          }
          else
          {
            char v79 = 0;
            CGFloat v80 = (uint64_t *)v74;
            NSRect v81 = v76;
            do
            {
              if ((*(_DWORD *)v81 & 0x200000) == 0) {
                break;
              }
              if (v80 && (uint64_t v82 = *v80, --v80, v82 > 0) || (*(_DWORD *)v81 & 0x60000) != 0) {
                char v79 = 1;
              }
              v81 -= 4;
            }
            while (v81 >= &v76[-2 * ((char *)v73 - (char *)v38)]);
            uint64_t v83 = (v76 - v81) >> 2;
            if (v79)
            {
              unint64_t v84 = *(void *)(v2 + 32);
              uint64_t v78 = -v83;
              __NSDoReordants(*(void **)(v2 + 16), (uint64_t)v73, (uint64_t)v76, (uint64_t)v75, (uint64_t)v74, v103, -v83, &v111, v102);
              if (*(void *)(v2 + 32) <= v84)
              {
                uint64_t v2 = v107;
                unint64_t v13 = 0x1E91D4000;
              }
              else
              {
                unint64_t v13 = 0x1E91D4000uLL;
                *(_DWORD *)(v101 + 224) |= 0x10u;
                uint64_t v2 = v107;
              }
              uint64_t v12 = v106;
LABEL_124:
              v73 += v78;
              v76 += 4 * v78;
              if (v74) {
                v74 += v78;
              }
              else {
                uint64_t v74 = 0;
              }
              v75 += v78;
              if (v73 < v38) {
                goto LABEL_13;
              }
              goto LABEL_105;
            }
          }
          v111 += v83;
          uint64_t v78 = -v83;
          goto LABEL_124;
        }
      }
      uint64_t v92 = *(unsigned int *)(v2 + 88);
      unint64_t v93 = *(void *)(v2 + 32);
      if (v92)
      {
        [*(id *)(v2 + 16) insertGlyph:v92 atGlyphIndex:v93 + *(void *)(v2 + 24) characterIndex:*(void *)(v2 + 40) + *(void *)(v2 + 48) - 1];
        *(_DWORD *)(v101 + *(int *)(v13 + 1728)) |= 0x10u;
        unint64_t v93 = *(void *)(v2 + 32) + 1;
        *(void *)(v2 + 32) = v93;
      }
      if (*(void *)(v98 + 8) < v93) {
        *(void *)(v98 + 8) = v93;
      }
      if (v97) {
        CFRelease(v97);
      }
    }
  }
}

- (void)saveWithGlyphOrigin:(uint64_t)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (!a1 || !*(void *)(a1 + 8)) {
    return;
  }
  uint64_t v4 = [*(id *)(a1 + 16) _getATSTypesetterGuts];
  uint64_t v61 = *(void *)(v4 + 16);
  uint64_t v65 = [*(id *)(a1 + 16) _bidiLevels];
  v67[8] = 0;
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  [*(id *)(a1 + 16) lineFragmentPadding];
  uint64_t v64 = v7;
  int v8 = *(_DWORD *)(*(void *)(v4 + 40) + 216);
  *(void *)uint64_t v67 = *(_DWORD *)(a1 + 88) != 0;
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(*(CTLineRef *)(a1 + 8));
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  uint64_t v66 = a1;
  *(float64x2_t *)(a1 + 56) = vaddq_f64((float64x2_t)vdupq_lane_s64(v64, 0), *(float64x2_t *)(a1 + 56));
  CFIndex v63 = Count;
  if (Count <= 0) {
    goto LABEL_57;
  }
  unint64_t v11 = 0;
  CFIndex v12 = 0;
  CFIndex v13 = 0;
  int v59 = v8;
  double v14 = *(double *)&v64 + a2;
  CGFloat v15 = *MEMORY[0x1E4F28AD8];
  CGFloat v16 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v17 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat v18 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  uint64_t v60 = v5 + v6 - 1;
  double v19 = 0.0;
  CFArrayRef v62 = GlyphRuns;
  CFIndex v20 = Count;
  do
  {
    ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v12);
    CTRunGetInitialAdvance();
    double v23 = v22;
    double v25 = v24;
    CFRange StringRange = CTRunGetStringRange(ValueAtIndex);
    uint64_t GlyphStorage = CTRunGetGlyphStorage();
    uint64_t v28 = MEMORY[0x192FAD9C0](GlyphStorage);
    uint64_t v29 = v28;
    unint64_t v30 = *(void *)(v28 + 88);
    unint64_t v31 = v30 + 104 * *(void *)(v28 + 96);
    if (v30 > v11 || v11 >= v31 || v13 > StringRange.location)
    {
      unint64_t v11 = *(void *)(v28 + 200);
      if (!v11 || (CFIndex v13 = *(void *)(v28 + 208), v13 > StringRange.location))
      {
        uint64_t v34 = *(void *)(v28 + 152);
        if (v34) {
          CFIndex v13 = *(void *)(v28 + 128) - *(void *)(v34 + 128);
        }
        else {
          CFIndex v13 = 0;
        }
        unint64_t v11 = *(void *)(v28 + 88);
      }
    }
    double v14 = v14 + v23;
    double v19 = v19 + v25;
    if (v11 && v11 < v31)
    {
      while (1)
      {
        CFIndex v35 = *(void *)(v11 + 16) + v13;
        if (StringRange.location < v35) {
          break;
        }
        v11 += 104;
        CFIndex v13 = v35;
        if (v11 >= v31) {
          goto LABEL_24;
        }
      }
      uint64_t v36 = *(void *)(v28 + (int)*MEMORY[0x1E4F24398]);
      if ((*(unsigned char *)(v28 + 224) & 0x10) != 0 || (*(unsigned char *)(v61 + 224) & 0x10) != 0)
      {
        uint64_t v39 = (void *)[*(id *)(v66 + 16) layoutManager];
        uint64_t v40 = *(void *)(v29 + 152);
        if (!v40) {
          uint64_t v40 = v29;
        }
        uint64_t v37 = objc_msgSend(v39, "_exactGlyphRangeForCharacterRange:", *(void *)(v40 + 128) + StringRange.location, StringRange.length);
        uint64_t v38 = v41;
      }
      else
      {
        uint64_t v37 = *(void *)(v28 + 112) + *(void *)&v67[1];
        uint64_t v38 = 0;
      }
      v71.origin.double x = v15;
      v71.origin.y = v16;
      v71.size.double width = v17;
      v71.size.height = v18;
      if (!NSEqualRects(*(NSRect *)(v11 + 64), v71))
      {
        double v42 = *(double *)(v11 + 72);
        objc_msgSend(*(id *)(v66 + 16), "setAttachmentSize:forGlyphRange:", v37, 1, *(double *)(v11 + 80), *(double *)(v11 + 88));
        objc_msgSend(*(id *)(v66 + 16), "setNotShownAttribute:forGlyphRange:", 1, v37, 1);
        objc_msgSend(*(id *)(v66 + 16), "setLocation:withAdvancements:forStartOfGlyphRange:", 0, v37, 1, v14, v19 + v42 + *(double *)(v11 + 56));
        double v14 = v14 + *(double *)(v36 + 16 * *(void *)&v67[1]);
LABEL_41:
        CFArrayRef GlyphRuns = v62;
        CFIndex v20 = v63;
        goto LABEL_25;
      }
      if ((*(unsigned char *)(v29 + 224) & 8) != 0)
      {
        v67[0] = 1;
        objc_msgSend((id)objc_msgSend(*(id *)(v66 + 16), "layoutManager"), "setEllipsisGlyphAttribute:forGlyphAtIndex:", 1, v37);
      }
      if (v65 && (*(unsigned char *)(v29 + 224) & 8) == 0 && (CTRunGetStatus(ValueAtIndex) & 1) != 0)
      {
        v67[0] = 1;
        if (*(_DWORD *)(v66 + 88) && v38 + v37 - 1 == v60)
        {
          [*(id *)(v66 + 16) setLocation:0 withAdvancements:v14 forStartOfGlyphRange:v19 + *(double *)(v11 + 56)];
          double v14 = v14 + *(double *)(v66 + 96);
        }
        goto LABEL_41;
      }
      CFArrayRef GlyphRuns = v62;
      CFIndex v20 = v63;
      if (*(_DWORD *)(v66 + 88) && v37 == v60)
      {
        [*(id *)(v66 + 16) setLocation:0 withAdvancements:v14 forStartOfGlyphRange:v19 + *(double *)(v11 + 56)];
        double v14 = v14 + *(double *)(v66 + 96);
      }
    }
    else
    {
      CFIndex v35 = v13;
LABEL_24:
      NSLog((NSString *)@"NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run...", StringRange.location, StringRange.length, ValueAtIndex);
      unint64_t v11 = 0;
      CFIndex v13 = v35;
    }
LABEL_25:
    ++v12;
  }
  while (v12 != v20);
  if (v29 && !v67[0] && (*(unsigned char *)(v29 + 224) & 1) != 0 && (*(void *)(v29 + 152) || (v59 & 0x20000) != 0)) {
    v67[0] = 1;
  }
LABEL_57:
  if (v65)
  {
    uint64_t v44 = [*(id *)(v66 + 16) paragraphCharacterRange];
    unint64_t v46 = v44;
    uint64_t v47 = *(void *)(v66 + 32);
    if (*(void *)(v66 + 48) == v47)
    {
      [*(id *)(v66 + 16) setBidiLevels:v65 + *(void *)(v66 + 40) - v44 forGlyphRange:*(void *)(v66 + 24)];
    }
    else
    {
      unint64_t v48 = *(void *)(v66 + 24);
      unint64_t v49 = v48 + v47;
      if (v48 < v48 + v47)
      {
        unint64_t v50 = v45;
        do
        {
          if (v49 - v48 >= 0x80) {
            uint64_t v51 = 128;
          }
          else {
            uint64_t v51 = v49 - v48;
          }
          uint64_t v52 = objc_msgSend(*(id *)(v66 + 16), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v48, v51, 0, 0, v69, v68);
          uint64_t v53 = v52;
          if (v52 >= 1)
          {
            v54 = v68;
            double v55 = v69;
            do
            {
              unint64_t v56 = *v55 - v46;
              if (*v55 < v46 || v56 >= v50) {
                char v58 = 0;
              }
              else {
                char v58 = *(unsigned char *)(v65 + v56);
              }
              *v54++ = v58;
              ++v55;
            }
            while (v54 < &v68[v52]);
          }
          objc_msgSend(*(id *)(v66 + 16), "setBidiLevels:forGlyphRange:", v68, v48, v52);
          v48 += v53;
        }
        while (v48 < v49);
      }
    }
  }
  if ((*(unsigned char *)(v66 + 104) & 4) != 0) {
    objc_msgSend(*(id *)(v66 + 16), "setDrawsOutsideLineFragment:forGlyphRange:", 1, *(void *)(v66 + 24), *(void *)(v66 + 32));
  }
  if (v67[0]) {
    objc_msgSend(*(id *)(v66 + 16), "setHardInvalidation:forGlyphRange:", 1, *(void *)(v66 + 24), *(void *)(v66 + 32));
  }
}

- (unint64_t)_charIndexToBreakLineByWordWrappingAtIndex:(char *)a3 lineFragmentWidth:(double)a4 hyphenate:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = a1;
  int v8 = (void *)[*(id *)(a1 + 16) paragraphArbitrator];
  unint64_t v9 = *(void *)(v7 + 40);
  unint64_t v55 = a2 - v9;
  CFIndex v10 = *(void **)(v7 + 16);
  if (v8)
  {
    objc_msgSend(v8, "setLineBreakStrategy:", objc_msgSend(v10, "lineBreakStrategy"));
    [*(id *)(v7 + 16) hyphenationFactorForGlyphAtIndex:*(void *)(v7 + 24)];
    [v8 setHyphenationFactor:v11];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke;
    v57[3] = &unk_1E55C57E0;
    v57[4] = v7;
    [v8 setValidateLineBreakContext:v57];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke_2;
    v56[3] = &unk_1E55C5808;
    v56[4] = v7;
    [v8 setLineWidth:v56];
    objc_msgSend(v8, "setAttributedString:", objc_msgSend(*(id *)(v7 + 16), "attributedString"));
    uint64_t v12 = [*(id *)(v7 + 16) paragraphCharacterRange];
    objc_msgSend(v8, "setParagraphRange:", v12, v13);
    objc_msgSend(v8, "setTypesetterBehavior:", objc_msgSend(*(id *)(v7 + 16), "typesetterBehavior"));
    objc_msgSend(v8, "lineBreakContextBeforeIndex:lineFragmentWidth:range:", a2, v9, v55, a4);
    [v8 resetBreaker];
    [v8 reset];
    *a3 = 0;
    return 0;
  }
  unint64_t v48 = a3;
  uint64_t v49 = [v10 _getATSTypesetterGuts];
  CGFloat v15 = (void *)[*(id *)(v7 + 16) attributedString];
  CFStringRef theString = (__CFString *)[v15 string];
  uint64_t v16 = [*(id *)(v7 + 16) paragraphCharacterRange];
  uint64_t v18 = v17;
  [*(id *)(v7 + 16) hyphenationFactorForGlyphAtIndex:*(void *)(v7 + 24)];
  float v20 = v19;
  unsigned __int8 v21 = [*(id *)(v7 + 16) lineBreakStrategy];
  uint64_t v52 = [v15 methodForSelector:sel_lineBreakBeforeIndex_withinRange_];
  uint64_t v50 = v7;
  uint64_t v51 = [(id)objc_opt_class() instanceMethodForSelector:sel_lineBreakBeforeIndex_withinRange_];
  int v22 = 0;
  int v23 = 0;
  int v24 = v21 & (v9 == v16);
  unint64_t v25 = v16 + v18;
  do
  {
    uint64_t v26 = a2 - 1;
    if (a2 < 1 || CFStringGetCharacterAtIndex(theString, a2 - 1) != 9)
    {
      if (v52 == v51) {
        uint64_t v27 = objc_msgSend(v15, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", a2, v9, v55, objc_msgSend(*(id *)(v7 + 16), "lineBreakStrategy"));
      }
      else {
        uint64_t v27 = objc_msgSend(v15, "lineBreakBeforeIndex:withinRange:", a2, v9, v55);
      }
      uint64_t v26 = v27;
    }
    BOOL v28 = v26 < v9 || v26 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v28 && v26 < a2) {
      unint64_t v14 = v26;
    }
    else {
      unint64_t v14 = v9;
    }
    if (v14 - v9 > 0x1D) {
      int v30 = v24;
    }
    else {
      int v30 = 0;
    }
    if (v30 == 1 && (uint64_t)v14 < a2 && v25 - v14 <= 5)
    {
      int v53 = v23;
      unint64_t v33 = v25;
      unint64_t v34 = [v15 nextWordFromIndex:v14 forward:1];
      if (v33 > v34)
      {
        uint64_t v35 = [v15 string];
        uint64_t v36 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
        uint64_t v37 = (void *)v35;
        uint64_t v7 = v50;
        objc_msgSend(v37, "rangeOfCharacterFromSet:options:range:", v36, 0, v34, v33 - v34);
        if (!v38) {
          unint64_t v34 = v33;
        }
      }
      BOOL v28 = v34 == v33;
      unint64_t v25 = v33;
      int v23 = v53;
      if (v28)
      {
        unint64_t v39 = v14 - (v14 == a2);
        if (v39 > v9) {
          goto LABEL_62;
        }
      }
    }
    if (v14 > v9) {
      v22 |= [(__CFString *)theString characterAtIndex:v14 - 1] == 173;
    }
    if (v20 <= 0.0)
    {
      int v40 = 0;
    }
    else
    {
      if (!((v14 <= v9) | v23 & 1)
        && ((v22 & 1) != 0 || [(NSATSGlyphStorage *)*(void *)(v49 + 16) _widthForStringRange:v14 - v9] / a4 < v20))
      {
        int v23 = 1;
LABEL_46:
        unint64_t v41 = objc_msgSend(v15, "lineBreakByHyphenatingBeforeIndex:withinRange:", a2, v9, v55);
        BOOL v44 = v41 != 0x7FFFFFFFFFFFFFFFLL && v41 > v9 && v41 < a2;
        int v40 = v44 && v14 != v41;
        if (v40) {
          unint64_t v14 = v41;
        }
        goto LABEL_57;
      }
      if (v23 & 1 | (v14 == v9)) {
        goto LABEL_46;
      }
      int v40 = 0;
      int v23 = 0;
    }
LABEL_57:
    unint64_t v45 = *(void **)(v7 + 16);
    if ((v22 | v40))
    {
      if ([v45 shouldBreakLineByHyphenatingBeforeCharacterAtIndex:v14])
      {
        char v46 = 1;
        goto LABEL_64;
      }
    }
    else if ([v45 shouldBreakLineByWordBeforeCharacterAtIndex:v14])
    {
      break;
    }
    unint64_t v39 = v14 - (v14 == a2);
LABEL_62:
    a2 = v39;
  }
  while (v39 > v9);
  char v46 = 0;
LABEL_64:
  *unint64_t v48 = v46;
  return v14;
}

uint64_t __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *a2;
  if (*((unsigned char *)a2 + 16)) {
    return [v2 shouldBreakLineByHyphenatingBeforeCharacterAtIndex:v3];
  }
  else {
    return [v2 shouldBreakLineByWordBeforeCharacterAtIndex:v3];
  }
}

double __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)([*(id *)(*(void *)(a1 + 32) + 16) _getATSTypesetterGuts] + 16);

  return [(NSATSGlyphStorage *)v5 _widthForStringRange:a3];
}

- (void)dealloc
{
  -[NSATSLineFragment _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NSATSLineFragment;
  [(NSATSLineFragment *)&v3 dealloc];
}

- (void)finalize
{
  -[NSATSLineFragment _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NSATSLineFragment;
  [(NSATSLineFragment *)&v3 finalize];
}

@end