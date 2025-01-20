@interface NSATSGlyphStorage
+ (NSATSGlyphStorage)allocWithZone:(_NSZone *)a3;
- (__CTGlyphStorage)createCopy:(id)a3;
- (const)_createEllipsisRunWithStringRange:(uint64_t)a3 attributes:(uint64_t)a4;
- (const)_flushCachedObjects;
- (double)_widthForStringRange:(uint64_t)a3;
- (id)childGlyphStorageWithCharacterRange:(uint64_t)a3;
- (id)setGlyphRange:(uint64_t)a3 characterRange:(uint64_t)a4;
- (uint64_t)_collectElasticRangeSurroundingCharacterAtIndex:(uint64_t)a3 minimumCharacterIndex:;
- (uint64_t)_resolvePositionalStakeGlyphsForLineFragment:(CFIndex *)a3 lineFragmentRect:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 maxLineFragmentWidth:(CGFloat)a7 breakHint:(double)a8;
- (uint64_t)createCTTypesetter;
- (void)_invalidate;
- (void)dealloc;
- (void)disposeGlyphStack;
- (void)finalize;
- (void)getCustomAdvance:(CGSize *)a3 forIndex:(int64_t)a4;
- (void)initGlyphStack:(int64_t)a3;
- (void)insertGlyphs:(id)a3;
- (void)moveGlyphsTo:(int64_t)a3 from:(id)a4;
- (void)popGlyph:(int64_t)a3;
- (void)pushGlyph:(int64_t)a3;
- (void)release;
- (void)setAbsorbedCount:(int64_t)a3 forIndex:(int64_t)a4;
- (void)setAdvance:(CGSize)a3 forIndex:(int64_t)a4;
- (void)setGlyphID:(unsigned __int16)a3 forIndex:(int64_t)a4;
- (void)setProps:(unsigned int)a3 forIndex:(int64_t)a4;
- (void)setStringIndex:(int64_t)a3 forIndex:(int64_t)a4;
- (void)swapGlyph:(int64_t)a3 withIndex:(int64_t)a4;
@end

@implementation NSATSGlyphStorage

- (uint64_t)_resolvePositionalStakeGlyphsForLineFragment:(CFIndex *)a3 lineFragmentRect:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 maxLineFragmentWidth:(CGFloat)a7 breakHint:(double)a8
{
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v17 = a1;
  uint64_t v172 = [*(id *)(a1 + 80) currentTextContainer];
  theArradouble y = CTLineGetGlyphRuns(a2);
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t v199 = 0;
  uint64_t v198 = 0;
  [*(id *)(v17 + 80) lineFragmentPadding];
  double v20 = v19;
  uint64_t v21 = [*(id *)(v17 + 80) _baseWritingDirection];
  uint64_t v22 = [*(id *)(v17 + 80) applicationFrameworkContext];
  memset(v200, 0, sizeof(v200));
  uint64_t v197 = 0;
  memset(v196, 0, sizeof(v196));
  long long v194 = 0u;
  *(_OWORD *)theString = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  *(_OWORD *)buffer = 0u;
  if ((*(unsigned char *)(v17 + 224) & 2) == 0) {
    return 1;
  }
  uint64_t v24 = v22;
  BOOL v25 = v21 == 1;
  double v155 = v20;
  if (v21 == 1) {
    uint64_t v26 = -1;
  }
  else {
    uint64_t v26 = 1;
  }
  if (v21 == 1) {
    double v27 = a6 + v20 * -2.0 - a9;
  }
  else {
    double v27 = a8;
  }
  if (a10 <= 0.0) {
    double v28 = 0.0;
  }
  else {
    double v28 = v27 + a10;
  }
  uint64_t v183 = Count;
  if (Count < 17) {
    v29 = v200;
  }
  else {
    v29 = NSZoneMalloc(0, 8 * Count);
  }
  CFStringRef v30 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v17 + 80), "attributedString"), "string");
  theString[0] = v30;
  *(_OWORD *)((char *)v196 + 8) = *(_OWORD *)(v17 + 128);
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v30);
  if (theString[1]) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v30, 0x600u);
  }
  *((void *)&v196[1] + 1) = 0;
  uint64_t v197 = 0;
  *(void *)&v196[0] = CStringPtr;
  if (v183 < 1) {
    goto LABEL_208;
  }
  v153 = a3;
  uint64_t v151 = v24;
  BOOL v177 = 0;
  int v178 = a3 != 0;
  double v152 = a8;
  unint64_t v32 = 0;
  uint64_t v33 = v21;
  uint64_t v34 = 0;
  v35 = 0;
  CFCharacterSetRef theSet = 0;
  uint64_t v169 = 0;
  CFIndex v36 = 0;
  uint64_t v185 = v33;
  BOOL v83 = v33 == 1;
  BOOL v37 = v33 != 1;
  uint64_t v38 = v83;
  uint64_t v157 = v38;
  v158 = v29;
  CGFloat v167 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v168 = *MEMORY[0x1E4F28AD8];
  CGFloat v165 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  CGFloat v166 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v156 = a9 + 0.001;
  uint64_t v154 = 2 * v37;
  double v162 = a6 - v155;
  uint64_t v179 = 4 * v26;
  uint64_t v180 = 16 * v26;
  uint64_t v181 = 8 * v26;
  uint64_t v161 = 2 * v25;
  uint64_t v184 = v161;
  double v39 = 0.0;
  double v159 = a6;
  double v160 = a7;
  uint64_t v40 = v183;
  uint64_t v175 = v17;
  do
  {
    if (v185 == 1) {
      CFIndex v41 = v40 + ~v34;
    }
    else {
      CFIndex v41 = v34;
    }
    ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(theArray, v41);
    CFRange StringRange = CTRunGetStringRange(ValueAtIndex);
    run = ValueAtIndex;
    uint64_t GlyphStorage = CTRunGetGlyphStorage();
    v45 = (void *)MEMORY[0x192FAD9C0](GlyphStorage);
    v46 = v45;
    unint64_t v47 = v45[11];
    unint64_t v48 = v47 + 104 * v45[12];
    BOOL v50 = v47 <= v32 && v32 < v48 && v36 <= StringRange.location;
    if (!v50)
    {
      if (v45[25] && v45[26] <= StringRange.location)
      {
        unint64_t v32 = *(void *)(v17 + 200);
        CFIndex v36 = *(void *)(v17 + 208);
      }
      else
      {
        uint64_t v51 = v45[19];
        if (v51) {
          CFIndex v36 = v45[16] - *(void *)(v51 + 128);
        }
        else {
          CFIndex v36 = 0;
        }
        unint64_t v32 = v45[11];
      }
    }
    if (!v32 || v32 >= v48)
    {
      CFIndex v52 = v36;
LABEL_47:
      NSLog((NSString *)@"NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run...", StringRange.location, StringRange.length, run);
      unint64_t v32 = 0;
      CFIndex v36 = v52;
      goto LABEL_48;
    }
    while (1)
    {
      CFIndex v52 = *(void *)(v32 + 16) + v36;
      if (StringRange.location < v52) {
        break;
      }
      v32 += 104;
      CFIndex v36 = v52;
      if (v32 >= v48) {
        goto LABEL_47;
      }
    }
    v53 = (double *)(*(void *)((char *)v45 + (int)*MEMORY[0x1E4F24398]) + 16 * v198);
    int v54 = (v185 == 1) ^ ((CTRunGetStatus(run) & 1) == 0);
    v178 &= v54;
    int v55 = *(_DWORD *)(v32 + 96);
    if (v55)
    {
      double v56 = *v53;
      v57 = v53;
      if ((v55 & 2) != 0 && (v58 = (void *)[*(id *)v32 objectForKey:@"NSAttachment"]) != 0)
      {
        v59 = v58;
        v170 = v53;
        v60 = (void *)[v58 attachmentCell];
        [v59 lineLayoutPadding];
        CGFloat v62 = v61;
        v204.origin.double x = a4;
        v204.origin.double y = a5;
        v204.size.double width = a6;
        v204.size.double height = a7;
        double v163 = v62;
        NSRect v205 = NSInsetRect(v204, v62, 0.0);
        double x = v205.origin.x;
        double y = v205.origin.y;
        double width = v205.size.width;
        double height = v205.size.height;
        if (v60)
        {
          double v67 = v205.size.width - v155 - v27;
          if (v185 != 1) {
            double v67 = v27;
          }
          objc_msgSend(v60, "cellFrameForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v172, *(void *)(v17 + 128) + StringRange.location, x, v205.origin.y, v205.size.width, v205.size.height, x + v67, v205.origin.y);
          double v69 = v68;
          double v71 = v70;
          double v73 = v72;
          double v75 = v74;
          uint64_t v40 = v183;
          v57 = v53;
          CGFloat v76 = v163;
        }
        else
        {
          v57 = v53;
          uint64_t v125 = v172;
          uint64_t v40 = v183;
          if (!v172)
          {
            if ([v59 _allocatesTextContainer]) {
              uint64_t v125 = [*(id *)(v17 + 80) _textContainerForAttachmentProtocol];
            }
            else {
              uint64_t v125 = 0;
            }
          }
          double v126 = width - v155 - v27;
          if (v185 != 1) {
            double v126 = v27;
          }
          double v150 = x + v126;
          objc_msgSend(v59, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v125, *(void *)(v17 + 128) + StringRange.location, x, y, width, height);
          double v69 = v127;
          double v71 = v128;
          double v73 = v129;
          double v75 = v130;
          if (v151 == 2)
          {
            [v59 bounds];
            if (CGRectIsEmpty(v206))
            {
              if (objc_msgSend((id)objc_msgSend(v59, "image"), "conformsToProtocol:", &unk_1EDD8B9A8))
              {
                v131 = (void *)[v59 image];
                [v131 size];
                v213.size.double width = v132;
                v213.size.double height = v133;
                v213.origin.double x = 0.0;
                v213.origin.double y = 0.0;
                v207.origin.double x = v69;
                v207.origin.double y = v71;
                v207.size.double width = v73;
                v207.size.double height = v75;
                if (CGRectEqualToRect(v207, v213)
                  && [v131 willProvideAdaptedImageForPresentation])
                {
                  objc_msgSend(v131, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", *(void *)v32, 0, v125, v69, v71, v73, v75, v150, y);
                  double v69 = v134;
                  double v71 = v135;
                  double v73 = v136;
                  double v75 = v137;
                }
                uint64_t v40 = v183;
                v57 = v170;
              }
            }
          }
          [v59 lineLayoutPadding];
          CGFloat v76 = v163;
          if (v163 != v138)
          {
            [v59 lineLayoutPadding];
            CGFloat v76 = v139;
            v208.origin.double x = a4;
            v208.origin.double y = a5;
            v208.size.double width = v159;
            v208.size.double height = v160;
            NSRect v209 = NSInsetRect(v208, v76, 0.0);
            double v140 = v209.size.width - v155 - v27;
            if (v185 != 1) {
              double v140 = v27;
            }
            objc_msgSend(v59, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v125, *(void *)(v17 + 128) + StringRange.location, v209.origin.x, v209.origin.y, v209.size.width, v209.size.height, v209.origin.x + v140, v209.origin.y);
            double v69 = v141;
            double v71 = v142;
            double v73 = v143;
            double v75 = v144;
          }
        }
        if (v76 != 0.0)
        {
          v210.origin.double x = v69;
          v210.origin.double y = v71;
          v210.size.double width = v73;
          v210.size.double height = v75;
          NSRect v211 = NSInsetRect(v210, -v76, 0.0);
          double v69 = v211.origin.x;
          double v71 = v211.origin.y;
          double v73 = v211.size.width;
          double v75 = v211.size.height;
        }
        BOOL v77 = [v59 embeddingType] == 1;
        if ((v40 == 1 || v27 == v152) && v28 > 0.0 && v27 + v73 > v28) {
          double v56 = v28 - v27;
        }
        else {
          double v56 = v73;
        }
      }
      else
      {
        BOOL v77 = 0;
        double v75 = v165;
        double v73 = v166;
        double v71 = v167;
        double v69 = v168;
        uint64_t v40 = v183;
      }
      if (v35)
      {
        if (v184 == 1) {
          double v145 = v56 * 0.5;
        }
        else {
          double v145 = v56;
        }
        if (v145 >= v39)
        {
          double v56 = v56 - v39;
          double *v35 = 0.0;
          v35 = 0;
        }
        else
        {
          if (v184 == 1) {
            double v56 = v56 * 0.5;
          }
          else {
            double v56 = 0.0;
          }
          double v39 = v39 - v145;
        }
      }
      double v27 = v27 + v56;
      if (v28 <= 0.0) {
        goto LABEL_200;
      }
      if (v34 <= 0) {
        BOOL v77 = 0;
      }
      if (v27 <= v28 && !v77)
      {
LABEL_200:
        v212.origin.double x = v69;
        v212.origin.double y = v71;
        v212.size.double width = v73;
        v212.size.double height = v75;
        v214.origin.double y = v167;
        v214.origin.double x = v168;
        v214.size.double height = v165;
        v214.size.double width = v166;
        if (!NSEqualRects(v212, v214))
        {
          *(double *)(v32 + 64) = v69;
          *(double *)(v32 + 72) = v71;
          *(double *)(v32 + 80) = v73;
          *(double *)(v32 + 88) = v75;
          double *v57 = v73;
          *((void *)v158 + v169++) = run;
        }
        a6 = v159;
        a7 = v160;
        goto LABEL_49;
      }
      if (v178)
      {
        unint64_t v124 = *(void *)(v17 + 128) + StringRange.location;
LABEL_220:
        CFIndex *v153 = v124;
      }
      goto LABEL_221;
    }
    if ((v55 & 2) == 0 && !v35)
    {
      v202.location = 0;
      v202.length = 0;
      v35 = 0;
      double v27 = v27 + CTRunGetTypographicBounds(run, v202, 0, 0, 0);
      if (v28 > 0.0)
      {
        uint64_t v40 = v183;
        if (v27 <= v28) {
          goto LABEL_49;
        }
        if (v178)
        {
          CFIndex v149 = StringRange.location + StringRange.length + *(void *)(v17 + 128);
          if (v149 >= *v153) {
            CFIndex v149 = *v153;
          }
          CFIndex *v153 = v149;
        }
LABEL_221:
        uint64_t v23 = 0;
        v29 = v158;
        goto LABEL_209;
      }
LABEL_48:
      uint64_t v40 = v183;
      goto LABEL_49;
    }
    uint64_t v78 = v199;
    uint64_t v79 = v199 - 1;
    uint64_t v80 = *(void *)((char *)v46 + (int)*MEMORY[0x1E4F243B0]);
    uint64_t v81 = *(void *)((char *)v46 + (int)*MEMORY[0x1E4F243B8]);
    if (v185 != 1) {
      uint64_t v79 = 0;
    }
    uint64_t v82 = *(void *)(v81 + 8 * v198 + 8 * v79);
    --v199;
    if (v78 < 1)
    {
      double v91 = v27;
      uint64_t v40 = v183;
      v89 = v35;
      goto LABEL_154;
    }
    BOOL v83 = v183 == 1 && StringRange.length == 1;
    char v84 = v83;
    v85 = &v53[2 * v79];
    uint64_t v86 = v80 + 4 * v198 + 4 * v79;
    if (v28 > 0.0) {
      char v87 = v84;
    }
    else {
      char v87 = 0;
    }
    char v164 = v87;
    int v171 = v54 ^ 1;
    v88 = (uint64_t *)(v81 + v181 + 8 * v79 + 8 * v198);
    v89 = v35;
    uint64_t v90 = v82;
    while (1)
    {
      double v91 = v27;
      unsigned int v92 = *(_DWORD *)v86;
      int v93 = *(_DWORD *)v86 & 4;
      if (!v89) {
        goto LABEL_88;
      }
      if (!v93)
      {
        if (!theSet) {
          goto LABEL_102;
        }
        if (v90 < 0 || (uint64_t v94 = *(void *)&v196[1], *(uint64_t *)&v196[1] <= v90))
        {
          v96 = v89;
          UniChar v98 = 0;
        }
        else
        {
          v95 = (UniChar *)theString[1];
          if (theString[1])
          {
            v96 = v89;
            uint64_t v97 = *((void *)&v196[0] + 1) + v90;
            goto LABEL_84;
          }
          if (*(void *)&v196[0])
          {
            v96 = v89;
            UniChar v98 = *(char *)(*(void *)&v196[0] + *((void *)&v196[0] + 1) + v90);
          }
          else
          {
            v96 = v89;
            if (v197 <= v90 || (uint64_t v121 = *((void *)&v196[1] + 1), *((uint64_t *)&v196[1] + 1) > v90))
            {
              uint64_t v122 = v90 - 4;
              if ((unint64_t)v90 < 4) {
                uint64_t v122 = 0;
              }
              if (v122 + 64 < *(uint64_t *)&v196[1]) {
                uint64_t v94 = v122 + 64;
              }
              *((void *)&v196[1] + 1) = v122;
              uint64_t v197 = v94;
              v203.location = *((void *)&v196[0] + 1) + v122;
              v203.length = v94 - v122;
              CFStringGetCharacters(theString[0], v203, buffer);
              uint64_t v121 = *((void *)&v196[1] + 1);
            }
            uint64_t v97 = v90 - v121;
            v95 = buffer;
LABEL_84:
            UniChar v98 = v95[v97];
          }
        }
        int IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(theSet, v98);
        v89 = v96;
        if (!IsLongCharacterMember)
        {
LABEL_102:
          double v100 = *v85;
          goto LABEL_103;
        }
      }
      double *v89 = v39;
LABEL_88:
      double v100 = *v85;
      if (!v93)
      {
        v89 = 0;
LABEL_103:
        if ((*(unsigned char *)(v86 + 2) & 0x10) != 0)
        {
          v112 = *(void **)(v175 + 80);
          uint64_t v113 = v34;
          v114 = v89;
          uint64_t v115 = objc_msgSend(v112, "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(v175 + 128) + v90, 1, 0);
          if (v185 == 1) {
            double v116 = v162 - v27;
          }
          else {
            double v116 = v27;
          }
          objc_msgSend(v112, "boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v115, v172, *(void *)(v175 + 128) + v90, a4, a5, a6, a7, a4 + v116, a5);
          v89 = v114;
          uint64_t v34 = v113;
          BOOL v102 = 0;
          if ((v164 & (v27 + v117 > v28)) != 0) {
            double v100 = v28 - v27;
          }
          else {
            double v100 = v117;
          }
          double v101 = v100;
        }
        else
        {
          BOOL v102 = 0;
          double v101 = 0.0;
        }
        uint64_t v103 = v184;
LABEL_124:
        if (v89)
        {
          if (v103 == 1) {
            double v119 = v100 * 0.5;
          }
          else {
            double v119 = v100;
          }
          BOOL v102 = 0;
          if (v119 >= v39)
          {
            double v100 = v100 - v39;
            double *v89 = 0.0;
            v89 = 0;
          }
          else
          {
            if (v103 == 1) {
              double v100 = v100 * 0.5;
            }
            else {
              double v100 = 0.0;
            }
            double v39 = v39 - v119;
          }
        }
        goto LABEL_134;
      }
      if (v177)
      {
        v89 = 0;
        double v101 = 0.0;
        BOOL v102 = 1;
        BOOL v177 = 1;
        uint64_t v103 = v184;
        goto LABEL_134;
      }
      v104 = (void *)[*(id *)(v175 + 80) textTabForGlyphLocation:v157 writingDirection:v27 maxLocation:v156];
      BOOL v177 = v104 == 0;
      if (v104)
      {
        v105 = v104;
        int v106 = (v92 >> 2) & 1;
        [v104 location];
        double v100 = v107 - v27;
        uint64_t v108 = [v105 alignment];
        if (v108 == 3) {
          uint64_t v109 = 0;
        }
        else {
          uint64_t v109 = v108;
        }
        uint64_t v110 = objc_msgSend((id)objc_msgSend(v105, "options"), "objectForKey:", @"NSTabColumnTerminatorsAttributeName");
        CFCharacterSetRef theSet = (const __CFCharacterSet *)v110;
        if (v109 != 4 || v110 == 0) {
          uint64_t v103 = v109;
        }
        else {
          uint64_t v103 = v154;
        }
      }
      else
      {
        if (v28 > 0.0)
        {
          if (!v178) {
            goto LABEL_221;
          }
          unint64_t v124 = *(void *)(v175 + 128) + v90;
          goto LABEL_220;
        }
        int v106 = 0;
        CFCharacterSetRef theSet = 0;
        double v100 = 0.0;
        uint64_t v103 = v161;
      }
      BOOL v118 = v161 == v103 || v103 == 4;
      if (!v118) {
        double v39 = v100;
      }
      double v101 = 0.0;
      if (v118)
      {
        double v101 = v100;
        v89 = 0;
      }
      else
      {
        v89 = v85;
      }
      BOOL v102 = v106 != 0;
      if (!v106) {
        goto LABEL_124;
      }
LABEL_134:
      double v27 = v27 + v100;
      uint64_t v184 = v103;
      if (v28 > 0.0 && v27 > v28) {
        break;
      }
      if ((*(unsigned char *)(v86 + 2) & 0x10) != 0)
      {
        double *v85 = v101;
        if (((v102 | v171) & 1) == 0) {
          *(_DWORD *)v86 &= ~0x100000u;
        }
      }
      uint64_t v120 = v199;
      uint64_t v90 = *v88;
      --v199;
      v85 = (double *)((char *)v85 + v180);
      v86 += v179;
      v88 = (uint64_t *)((char *)v88 + v181);
      if (v120 <= 0)
      {
        double v91 = v91 + v100;
        uint64_t v17 = v175;
        uint64_t v40 = v183;
        goto LABEL_154;
      }
    }
    if (!v178) {
      goto LABEL_221;
    }
    uint64_t v123 = v90;
    uint64_t v17 = v175;
    unint64_t v124 = *(void *)(v175 + 128) + v123;
    uint64_t v40 = v183;
    uint64_t v34 = v183;
    if (v124 < *v153) {
      goto LABEL_220;
    }
LABEL_154:
    v35 = v89;
    if ((*(unsigned char *)(v32 + 96) & 2) != 0)
    {
      *((void *)v158 + v169) = run;
      double v27 = v91;
      ++v169;
    }
    else
    {
      double v27 = v91;
    }
LABEL_49:
    ++v34;
  }
  while (v34 < v40);
  if (v35) {
    double *v35 = v39;
  }
  unint64_t v147 = v169;
  v29 = v158;
  if (v169 >= 1)
  {
    do
    {
      CTRunSyncWithStorage();
      BOOL v50 = v147-- > 1;
    }
    while (v50);
    CTLineSyncWithRuns();
  }
LABEL_208:
  uint64_t v23 = 1;
LABEL_209:
  if (v29 != v200) {
    NSZoneFree(0, v29);
  }
  return v23;
}

- (uint64_t)createCTTypesetter
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void *)(result + 88);
    uint64_t v3 = *(void *)(result + 96);
    if ([*(id *)(result + 80) _bidiLevels]) {
      [*(id *)(v1 + 80) _baseWritingDirection];
    }
    [*(id *)(v1 + 80) limitsLayoutForSuspiciousContents];
    long long v35 = 0u;
    long long v36 = 0u;
    *(_OWORD *)newValues = 0u;
    long long v34 = 0u;
    uint64_t v30 = v1;
    if (!*(void *)(v1 + 72)) {
      *(void *)(v1 + 72) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    }
    if (!__CFArrayTypeID) {
      __CFArrayTypeID = CFArrayGetTypeID();
    }
    if (v3 >= 1)
    {
      NSUInteger v4 = 0;
      CFIndex v5 = 0;
      unint64_t v6 = v2 + 104 * v3;
      uint64_t v7 = v30;
      value = (void *)*MEMORY[0x1E4F1CFD0];
      unint64_t v29 = v6;
      while (1)
      {
        unint64_t v8 = v2 + 104;
        if (v2 + 104 >= v6) {
          v9 = (uint64_t *)(v30 + 120);
        }
        else {
          v9 = (uint64_t *)(v2 + 128);
        }
        uint64_t v10 = *v9;
        uint64_t v11 = *(void *)(v2 + 24);
        if ((*(unsigned char *)(v2 + 96) & 0x20) != 0)
        {
          v13 = (void *)[*(id *)(v2 + 8) _kernOverride];
          [v13 doubleValue];
          if (v14 == 0.0)
          {
            MutableCopdouble y = 0;
          }
          else
          {
            MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
            CFDictionaryAddValue(MutableCopy, @"NSKern", v13);
          }
          uint64_t v7 = v30;
        }
        else
        {
          MutableCopdouble y = 0;
        }
        if ((*(unsigned char *)(v2 + 96) & 0x40) != 0 && ![*(id *)v2 objectForKey:@"CTVerticalForms"])
        {
          if (!MutableCopy) {
            MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
          }
          CFDictionaryAddValue(MutableCopy, @"CTVerticalForms", value);
        }
        if ((*(unsigned char *)(v2 + 96) & 0x80) != 0)
        {
          if (!MutableCopy) {
            MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v2);
          }
          CFDictionarySetValue(MutableCopy, @"NSFont", *(const void **)(v2 + 8));
        }
        NSUInteger v15 = v10 - v11;
        CFArrayRef MutableRunsWithStorageAndOptions = (const __CFArray *)CTRunCreateMutableRunsWithStorageAndOptions();
        if (MutableRunsWithStorageAndOptions)
        {
          CFArrayRef v17 = MutableRunsWithStorageAndOptions;
          if (CFGetTypeID(MutableRunsWithStorageAndOptions) == __CFArrayTypeID)
          {
            uint64_t Count = CFArrayGetCount(v17);
            if (Count > 1) {
              *(_DWORD *)(v30 + 224) |= 4u;
            }
            if (v5 >= 1)
            {
              CFArrayRef v19 = *(const __CFArray **)(v30 + 72);
              v39.location = CFArrayGetCount(v19);
              v39.length = 0;
              CFArrayReplaceValues(v19, v39, (const void **)newValues, v5);
              do
              {
                CFRelease(newValues[v5 - 1]);
                BOOL v20 = (unint64_t)v5-- > 1;
              }
              while (v20);
              CFIndex v5 = 0;
            }
            v42.location = 0;
            v42.length = Count;
            uint64_t v7 = v30;
            CFArrayAppendArray(*(CFMutableArrayRef *)(v30 + 72), v17, v42);
            CFRelease(v17);
          }
          else
          {
            if (v5 == 8)
            {
              CFArrayRef v23 = *(const __CFArray **)(v7 + 72);
              v40.location = CFArrayGetCount(v23);
              v40.length = 0;
              CFArrayReplaceValues(v23, v40, (const void **)newValues, 8);
              uint64_t v24 = 7;
              do
              {
                CFRelease(newValues[v24]);
                unint64_t v25 = v24-- + 1;
              }
              while (v25 > 1);
              CFIndex v5 = 0;
            }
            newValues[v5++] = v17;
          }
        }
        else if ((int)atomic_fetch_add_explicit(createCTTypesetter_numWarnings, 1u, memory_order_relaxed) <= 18)
        {
          v38.location = v4;
          v38.length = v15;
          uint64_t v21 = NSStringFromRange(v38);
          CFDictionaryRef v22 = MutableCopy;
          unint64_t v6 = v29;
          if (!MutableCopy) {
            CFDictionaryRef v22 = *(CFDictionaryRef *)v2;
          }
          NSLog((NSString *)@"NULL run returned from CoreText. Ignoring the storage range %@ for glyph storage -> %@:%@", v21, *(void *)(v7 + 64), v22);
          if (!MutableCopy) {
            goto LABEL_49;
          }
LABEL_48:
          CFRelease(MutableCopy);
          goto LABEL_49;
        }
        unint64_t v6 = v29;
        if (MutableCopy) {
          goto LABEL_48;
        }
LABEL_49:
        v4 += v15;
        unint64_t v2 = v8;
        if (v8 >= v6)
        {
          if (v5 >= 1)
          {
            CFArrayRef v26 = *(const __CFArray **)(v30 + 72);
            v41.location = CFArrayGetCount(v26);
            v41.length = 0;
            CFArrayReplaceValues(v26, v41, (const void **)newValues, v5);
            do
            {
              CFRelease(newValues[v5 - 1]);
              BOOL v20 = (unint64_t)v5-- > 1;
            }
            while (v20);
          }
          break;
        }
      }
    }
    CFStringRef v27 = *(const __CFString **)(v30 + 184);
    if (v27) {
      -[__NSATSStringSegment _setOriginalString:range:](v27, (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v30 + 80), "attributedString"), "string"), *(void *)(v30 + 128), *(char **)(v30 + 136));
    }
    else {
      *(void *)(v30 + 184) = -[__NSATSStringSegment initWithOriginalString:range:](objc_allocWithZone((Class)__NSATSStringSegment), (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v30 + 80), "attributedString"), "string"), *(void *)(v30 + 128), *(char **)(v30 + 136));
    }
    if ([*(id *)(v30 + 80) limitsLayoutForSuspiciousContents])
    {
      return CTTypesetterCreateWithRunArray();
    }
    else
    {
      uint64_t v31 = *MEMORY[0x1E4F247F8];
      uint64_t v32 = MEMORY[0x1E4F1CC38];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      return CTTypesetterCreateWithRunArrayAndOptions();
    }
  }
  return result;
}

- (void)_invalidate
{
  if (a1)
  {
    unint64_t v2 = (__CFArray *)a1[9];
    if (v2) {
      CFArrayRemoveAllValues(v2);
    }
    a1[19] = 0;
    uint64_t v3 = (const void *)a1[20];
    if (v3)
    {
      CFRelease(v3);
      a1[20] = 0;
    }
  }
}

- (const)_flushCachedObjects
{
  if (result)
  {
    CFStringRef v1 = result;
    isa = result[2].isa;
    if (isa)
    {
      CFRelease(isa);
      v1[2].isa = 0;
    }
    CFStringRef length = (const __CFString *)v1[5].length;
    return [(__NSATSStringSegment *)length _setOriginalString:0 range:0];
  }
  return result;
}

+ (NSATSGlyphStorage)allocWithZone:(_NSZone *)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSATSGlyphStorageCacheNextIndex;
  if (!__NSATSGlyphStorageCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NSATSGlyphStorage;
    return (NSATSGlyphStorage *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSATSGlyphStorageCacheNextIndex;
  unint64_t v6 = (NSATSGlyphStorage *)__NSATSGlyphStorageCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
  if (!v6) {
    goto LABEL_5;
  }
  return v6;
}

- (id)setGlyphRange:(uint64_t)a3 characterRange:(uint64_t)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v132 = (uint64_t)result;
    uint64_t v122 = [result[10] _getATSTypesetterGuts];
    __NSATSGlyphStorageInitBuffer(v132, a2, a3, a4, a5, a3);
    uint64_t v128 = [*(id *)(v132 + 80) attributedString];
    unint64_t v9 = *(void *)(v132 + 128);
    uint64_t v10 = *(_WORD **)(v132 + (int)*MEMORY[0x1E4F243A8]);
    uint64_t v11 = (int *)MEMORY[0x1E4F24398];
    v12 = *(double **)(v132 + (int)*MEMORY[0x1E4F24398]);
    v13 = (int *)MEMORY[0x1E4F243B0];
    unint64_t v137 = 0;
    unint64_t v138 = 0;
    double v14 = *(_DWORD **)(v132 + (int)*MEMORY[0x1E4F243B0]);
    NSUInteger v15 = (int *)MEMORY[0x1E4F243B8];
    v16 = *(uint64_t **)(v132 + (int)*MEMORY[0x1E4F243B8]);
    [*(id *)(v132 + 80) typesetterBehavior];
    uint64_t v123 = objc_msgSend((id)objc_msgSend(*(id *)(v132 + 80), "currentTextContainer"), "layoutOrientation");
    int v17 = [*(id *)(v132 + 80) _forceOriginalFontBaseline];
    uint64_t v18 = v132;
    int v121 = v17;
    uint64_t v19 = *(void *)(v132 + 88);
    if (v19)
    {
      uint64_t v20 = *(void *)(v132 + 104);
    }
    else
    {
      uint64_t v19 = NSAllocateScannedUncollectable();
      uint64_t v18 = v132;
      *(void *)(v132 + 88) = v19;
      uint64_t v20 = 8;
      *(void *)(v132 + 104) = 8;
    }
    LODWORD(v21) = 128;
    if (*(void *)(v18 + 152)) {
      uint64_t v22 = *(void *)(v18 + 152);
    }
    else {
      uint64_t v22 = v18;
    }
    CFArrayRef v23 = (void *)(v18 + 128);
    if (v9 < *(void *)(v18 + 136) + *(void *)(v18 + 128))
    {
      int v125 = 0;
      uint64_t v131 = *(void *)(v22 + 128);
      unint64_t v24 = v19 + 104 * v20;
      unint64_t v25 = 0x1E91D4000;
      CFArrayRef v26 = (void *)v128;
      while (1)
      {
        unint64_t v27 = v19;
        while (1)
        {
          if (v27 >= v24)
          {
            unint64_t v28 = v27 - *(void *)(v18 + 88);
            *(void *)(v18 + 104) += 8;
            uint64_t v29 = NSReallocateScannedUncollectable();
            uint64_t v18 = v132;
            *(void *)(v132 + 88) = v29;
            unint64_t v27 = v29 + v28;
            CFArrayRef v26 = (void *)v128;
            unint64_t v25 = 0x1E91D4000uLL;
            unint64_t v24 = v29 + 104 * *(void *)(v132 + 104);
            LODWORD(v21) = 128;
          }
          uint64_t v30 = objc_msgSend(v26, "attributesAtIndex:longestEffectiveRange:inRange:", v9, &v137, *(void *)(v18 + (int)v21), *(void *)(v18 + (int)v21 + 8));
          *(void *)unint64_t v27 = v30;
          uint64_t v31 = [v30 objectForKey:@"NSAttachment"];
          uint64_t v32 = (void *)v31;
          unint64_t v33 = v137;
          if (v137 == v9) {
            goto LABEL_34;
          }
          if (v137 < v9 && v31 != 0 && v138 >= 2)
          {
            uint64_t v47 = v137 - v9 + v138;
            goto LABEL_33;
          }
          if ((void *)setGlyphRange_characterRange__lastAttributedString == v26)
          {
            uint64_t v41 = v132;
          }
          else
          {
            long long v36 = (objc_class *)objc_opt_class();
            uint64_t v37 = NSStringFromClass(v36);
            uint64_t v38 = *(int *)(v25 + 1716);
            unint64_t v39 = v24;
            uint64_t v40 = (uint64_t)v26;
            uint64_t v41 = v132;
            NSLog((NSString *)@"%@: %@ (%p) returned run range {%lu %lu} for attributes at %ld in character range {%lu %lu}. Since attribute run ranges are in inconsistent state, there might be layout issues such as garbled text or incorrect glyph spacings", v132, v37, v40, v137, v138, v9, *(void *)(v132 + v38), *(void *)(v132 + v38 + 8));
            setGlyphRange_characterRange__lastAttributedString = v40;
            unint64_t v24 = v39;
            unint64_t v25 = 0x1E91D4000;
            unint64_t v33 = v137;
          }
          unint64_t v21 = *(int *)(v25 + 1716);
          CFArrayRef v23 = (void *)(v41 + v21);
          uint64_t v42 = *(void *)(v41 + v21);
          unint64_t v43 = v33 - v9;
          if (v33 >= v9) {
            break;
          }
          uint64_t v18 = v41;
          CFArrayRef v26 = (void *)v128;
          if (v9 == v42) {
            goto LABEL_32;
          }
          unint64_t v44 = v138 + v33;
          BOOL v45 = v44 > v9;
          unint64_t v46 = v44 - v9;
          if (!v45)
          {
            uint64_t v47 = 1;
LABEL_33:
            unint64_t v137 = v9;
            unint64_t v138 = v47;
            goto LABEL_34;
          }
          *(void *)(v27 - 88) += v46;
          unint64_t v9 = v138 + v137;
          if (v138 + v137 >= v23[1] + *v23)
          {
            uint64_t v19 = v27;
            goto LABEL_146;
          }
        }
        if (v9 == v42)
        {
LABEL_32:
          uint64_t v47 = v43 + v138;
          goto LABEL_33;
        }
        *(void *)(v27 - 88) += v43;
LABEL_34:
        unint64_t v48 = (void *)[*(id *)v27 objectForKey:@"NSExpansion"];
        double v126 = v32;
        if (v48) {
          [v48 doubleValue];
        }
        else {
          long double v49 = 0.0;
        }
        int v50 = v125;
        unint64_t v124 = v24;
        long double v51 = exp(v49);
        *(long double *)(v27 + 48) = v51;
        if (v51 != 1.0) {
          int v50 = 1;
        }
        int v125 = v50;
        CFIndex v52 = (void *)[*(id *)v27 objectForKey:@"CTVerticalForms"];
        if ([v52 BOOLValue])
        {
          int v53 = 1;
        }
        else
        {
          if (v52) {
            BOOL v54 = 1;
          }
          else {
            BOOL v54 = v123 == 0;
          }
          int v53 = !v54;
        }
        id v55 = *(id *)v27;
        if (!*(void *)v27) {
          goto LABEL_51;
        }
        double v56 = (void *)[*(id *)v27 objectForKey:@"NSFont"];
        if (objc_msgSend((id)objc_msgSend(v55, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
          double v56 = (void *)[v56 verticalFont];
        }
        if (!v56) {
LABEL_51:
        }
          double v56 = NSDefaultFont();
        *(void *)(v27 + 8) = v56;
        *(_DWORD *)(v27 + 96) &= ~0x80u;
        if ([v56 isEqual:v56])
        {
          double v56 = *(void **)(v27 + 8);
          if (!v53) {
            goto LABEL_59;
          }
        }
        else
        {
          *(void *)(v27 + 8) = v56;
          *(_DWORD *)(v27 + 96) |= 0x80u;
          if (!v53) {
            goto LABEL_59;
          }
        }
        uint64_t v57 = [v56 verticalFont];
        if (v57) {
          double v56 = (void *)v57;
        }
        *(void *)(v27 + 8) = v56;
LABEL_59:
        *(void *)(v27 + 8) = [*(id *)(v132 + 80) substituteFontForFont:v56];
        id v58 = *(id *)v27;
        if (!*(void *)v27) {
          goto LABEL_66;
        }
        if (!v121 || (v59 = (void *)[*(id *)v27 objectForKey:_NSOriginalFontAttributeName]) == 0) {
          v59 = (void *)[v58 objectForKey:@"NSFont"];
        }
        if (objc_msgSend((id)objc_msgSend(v58, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
          v59 = (void *)[v59 verticalFont];
        }
        if (!v59) {
LABEL_66:
        }
          v59 = NSDefaultFont();
        uint64_t v60 = (uint64_t)v59;
        if (v53) {
          uint64_t v60 = [v59 verticalFont];
        }
        if (v60) {
          v59 = (void *)v60;
        }
        if (([*(id *)(v132 + 80) usesFontLeading] & 1) == 0) {
          [*(id *)(v132 + 80) paragraphSeparatorGlyphRange];
        }
        [v59 _defaultLineHeightForUILayout];
        *(double *)(v27 + 32) = v61 + 0.0;
        [v59 ascender];
        *(void *)(v27 + 40) = v62;
        *(void *)(v27 + 56) = 0;
        if (v123 && ([v59 isVertical] & 1) == 0)
        {
          double v63 = *(double *)(v27 + 32);
          double v64 = ceil(v63 * 0.5);
          if (v63 <= 2.0) {
            double v65 = v63 * 0.5;
          }
          else {
            double v65 = v64;
          }
          *(double *)(v27 + 56) = v65 - *(double *)(v27 + 40);
          *(double *)(v27 + 40) = v65;
        }
        v66 = (void *)[*(id *)v27 objectForKey:@"NSBaselineOffset"];
        if (v66) {
          [v66 doubleValue];
        }
        else {
          double v67 = 0.0;
        }
        *(double *)(v27 + 56) = v67 + *(double *)(v27 + 56);
        double v68 = (void *)[*(id *)v27 objectForKey:@"NSSuperScript"];
        if (v68) {
          *(double *)(v27 + 56) = *(double *)(v27 + 56)
        }
                                + ceil(*(double *)(v27 + 32) * (double)[v68 integerValue] * 0.4);
        if ((*(unsigned char *)(v132 + 224) & 0x10) != 0)
        {
          uint64_t v71 = objc_msgSend(*(id *)(v132 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", v137, v138, 0);
          uint64_t v69 = v72;
          uint64_t v129 = v71;
          uint64_t v70 = v71 - *(void *)(v132 + 112);
        }
        else
        {
          uint64_t v69 = v138;
          uint64_t v70 = v137 - *(void *)(v132 + 128);
          uint64_t v129 = *(void *)(v132 + 112) + v70;
        }
        *(void *)(v27 + 24) = v70;
        if ((*(unsigned char *)(*(void *)(v122 + 40) + 217) & 0x80) == 0)
        {
          double v73 = (void *)[*(id *)v27 objectForKey:@"NSWritingDirection"];
          if (v73)
          {
            double v74 = v73;
            long long v135 = 0u;
            long long v136 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            uint64_t v75 = [v73 countByEnumeratingWithState:&v133 objects:v139 count:16];
            if (v75)
            {
              uint64_t v76 = v75;
              uint64_t v77 = *(void *)v134;
              while (2)
              {
                for (uint64_t i = 0; i != v76; ++i)
                {
                  if (*(void *)v134 != v77) {
                    objc_enumerationMutation(v74);
                  }
                  if ([*(id *)(*((void *)&v133 + 1) + 8 * i) integerValue])
                  {
                    *(_DWORD *)(*(void *)(v122 + 40) + 216) |= 0x8000u;
                    *(_DWORD *)(v122 + 88) &= 0xFFFFFFFC;
                    goto LABEL_99;
                  }
                }
                uint64_t v76 = [v74 countByEnumeratingWithState:&v133 objects:v139 count:16];
                if (v76) {
                  continue;
                }
                break;
              }
            }
          }
        }
LABEL_99:
        long long v79 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
        *(_OWORD *)(v27 + 64) = *MEMORY[0x1E4F28AD8];
        *(_OWORD *)(v27 + 80) = v79;
        *(_DWORD *)(v27 + 96) &= ~2u;
        if ([*(id *)(v27 + 8) _isDefaultFace]) {
          int v80 = 4;
        }
        else {
          int v80 = 0;
        }
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFFB | v80;
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFE7 | (16
                                                                    * ([*(id *)(v27 + 8) renderingMode] != 1));
        if ([*(id *)(v27 + 8) isVertical]) {
          int v81 = 64;
        }
        else {
          int v81 = 0;
        }
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFBF | v81;
        uint64_t v82 = (void *)[*(id *)(v27 + 8) _kernOverride];
        *(_DWORD *)(v27 + 96) = *(_DWORD *)(v27 + 96) & 0xFFFFFFDF | (32 * (v82 != 0));
        if (v82)
        {
          [v82 doubleValue];
          if (v83 == 0.0) {
            *(_DWORD *)(v27 + 96) |= 0x10u;
          }
        }
        if (!v126)
        {
          *(_DWORD *)(v27 + 96) &= ~1u;
          if (v69 < 1)
          {
            uint64_t v18 = v132;
          }
          else
          {
            uint64_t v18 = v132;
            uint64_t v88 = v129;
            double v127 = &v10[v69];
            do
            {
              uint64_t v130 = v88;
              uint64_t v89 = objc_msgSend(*(id *)(v18 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:");
              [*(id *)(v27 + 8) getAdvancements:v12 forCGGlyphs:v10 count:v89];
              if (v89 < 1)
              {
                uint64_t v18 = v132;
              }
              else
              {
                uint64_t v90 = &v10[v89];
                uint64_t v91 = 0x7FFFFFFFFFFFFFFFLL;
                unsigned int v92 = &v140;
                uint64_t v93 = v131;
                uint64_t v18 = v132;
                do
                {
                  unint64_t v94 = (unint64_t)(*(double *)(v27 + 48) != 1.0) << 19;
                  if ((*(void *)v92 & 2) != 0)
                  {
                    uint64_t v95 = v94 | 0x10000;
                    if ((*(unsigned char *)(v27 + 96) & 4) == 0)
                    {
                      char v96 = [*(id *)(v18 + 80) actionForControlCharacterAtIndex:*v16];
                      uint64_t v93 = v131;
                      uint64_t v18 = v132;
                      double *v12 = 0.0;
                      if ((v96 & 6) != 0)
                      {
                        uint64_t v95 = v94 | 0x110000 | v96 & 4;
                        *(_DWORD *)(v27 + 96) |= 2u;
                        *(_DWORD *)(v132 + 224) |= 2u;
                      }
                    }
                    *uint64_t v10 = 0;
                  }
                  else
                  {
                    if ((*(void *)v92 & 1) != 0
                      || (uint64_t v95 = (unint64_t)(*(double *)(v27 + 48) != 1.0) << 19, !*v10))
                    {
                      double *v12 = 0.0;
                      uint64_t v95 = v94 | 0x20;
                    }
                    if (v91 == *v16)
                    {
                      v95 |= 0x80uLL;
                      *(v14 - 1) |= 0x80u;
                    }
                  }
                  uint64_t v97 = (*(void *)v92 >> 2) & 1 | v95;
                  if ((*(void *)v92 & 8) != 0)
                  {
                    LODWORD(v97) = v97 | 0x40;
                    *(_DWORD *)(v27 + 96) |= 8u;
                  }
                  double v98 = *(double *)(v27 + 48);
                  if (v98 != 1.0) {
                    double *v12 = v98 * *v12;
                  }
                  ++v10;
                  v92 += 8;
                  *v14++ = v97;
                  v12 += 2;
                  uint64_t v91 = *v16;
                  *v16++ -= v93;
                }
                while (v10 < v90);
              }
              uint64_t v88 = v89 + v130;
            }
            while (v10 < v127);
          }
          goto LABEL_141;
        }
        uint64_t v84 = [v126 attachmentCell];
        int v85 = *(_DWORD *)(v27 + 96);
        *(_DWORD *)(v27 + 96) = v85 | 1;
        if (v84)
        {
          uint64_t v86 = (void *)v84;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            [v86 cellSize];
            uint64_t v100 = v99;
            uint64_t v102 = v101;
            char v103 = objc_opt_respondsToSelector();
            uint64_t v104 = 0;
            uint64_t v105 = 0;
            if (v103) {
              objc_msgSend(v86, "cellBaselineOffset", 0.0, 0.0);
            }
            *(void *)(v27 + 64) = v104;
            *(void *)(v27 + 72) = v105;
            *(void *)(v27 + 80) = v100;
            *(void *)(v27 + 88) = v102;
            uint64_t v18 = v132;
            goto LABEL_140;
          }
          int v87 = *(_DWORD *)(v27 + 96) | 2;
        }
        else
        {
          int v87 = v85 | 3;
        }
        *(_DWORD *)(v27 + 96) = v87;
        uint64_t v18 = v132;
        *(_DWORD *)(v132 + 224) |= 2u;
LABEL_140:
        *v10++ = 0;
        *v14++ = 0x10000;
        double *v12 = *(double *)(v27 + 80);
        v12[1] = 0.0;
        v12 += 2;
        *v16++ = v137 - v131;
        unint64_t v138 = 1;
LABEL_141:
        uint64_t v19 = v27 + 104;
        unint64_t v21 = v137;
        unint64_t v106 = v138;
        *(void *)(v27 + 16) = v138;
        unint64_t v9 = v106 + v21;
        LODWORD(v21) = 128;
        CFArrayRef v23 = (void *)(v18 + 128);
        CFArrayRef v26 = (void *)v128;
        unint64_t v24 = v124;
        unint64_t v25 = 0x1E91D4000uLL;
        if (v9 >= *(void *)(v18 + 136) + *(void *)(v18 + 128))
        {
LABEL_146:
          uint64_t v11 = (int *)MEMORY[0x1E4F24398];
          NSUInteger v15 = (int *)MEMORY[0x1E4F243B8];
          v13 = (int *)MEMORY[0x1E4F243B0];
          break;
        }
      }
    }
    *(void *)(v18 + 96) = 0x4EC4EC4EC4EC4EC5 * ((v19 - *(void *)(v18 + 88)) >> 3);
    if (!*(void *)(v18 + 152))
    {
      *(void *)(v18 + 168) = v23[1] + *v23;
      *(void *)(v18 + 176) = 0;
      unint64_t v107 = *(void *)(v18 + *v13);
      uint64_t v108 = *(void *)(v18 + 120);
      if (*(unsigned char *)(v107 + 4 * v108 - 4))
      {
        uint64_t v109 = *(void *)(v18 + *v11);
        uint64_t v110 = 4 * v108;
        do
        {
          uint64_t v111 = v110;
          unint64_t v112 = v107 + v110;
          if (v107 + v110 - 4 <= v107) {
            break;
          }
          v110 -= 4;
        }
        while ((*(unsigned char *)(v112 - 8) & 1) != 0);
        uint64_t v113 = v111 - 4;
        *(void *)(v18 + 168) = *(void *)(*(void *)(v18 + *v15) + 2 * v113) + *v23;
        if (v113 >> 2 < v108)
        {
          v114 = (double *)(v109 + 16 * (v113 >> 2));
          double v115 = 0.0;
          do
          {
            double v116 = *v114;
            v114 += 2;
            double v115 = v116 + v115;
            *(double *)(v18 + 176) = v115;
          }
          while ((unint64_t)v114 < v109 + 16 * v108);
        }
      }
    }
    double v117 = *(__CFArray **)(v18 + 72);
    if (v117)
    {
      CFArrayRemoveAllValues(v117);
      uint64_t v18 = v132;
    }
    if (*(void *)(v18 + 64))
    {
      result = (id *)MEMORY[0x192FAD9D0]();
      uint64_t v118 = v132;
    }
    else
    {
      MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
      result = (id *)CFMakeCollectable(MutableWithInterface);
      uint64_t v118 = v132;
      *(void *)(v132 + 64) = result;
    }
    uint64_t v120 = *(double **)(v118 + *v11);
    if (*v120 < 0.0) {
      *uint64_t v120 = fabs(*v120);
    }
  }
  return result;
}

- (void)release
{
  os_unfair_lock_lock_with_options();
  if ([(NSATSGlyphStorage *)self retainCount] == 1
    && (uint64_t v3 = __NSATSGlyphStorageCacheNextIndex, __NSATSGlyphStorageCacheNextIndex <= 2))
  {
    ++__NSATSGlyphStorageCacheNextIndex;
    __NSATSGlyphStorageCache[v3] = self;
    glyphStorage = self->_glyphStorage;
    self->_glyphStorage = 0;
    masterRuns = self->_masterRuns;
    self->_masterRuns = 0;
    self->_parent = 0;
    children = self->_children;
    self->_children = 0;
    [(__NSATSStringSegment *)(const __CFString *)self->_textString _setOriginalString:0 range:0];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
    if (glyphStorage) {
      CFRelease(glyphStorage);
    }
    if (masterRuns) {
      CFRelease(masterRuns);
    }
    if (children)
    {
      CFRelease(children);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSGlyphStorageLock);
    v7.receiver = self;
    v7.super_class = (Class)NSATSGlyphStorage;
    [(NSATSGlyphStorage *)&v7 release];
  }
}

- (id)childGlyphStorageWithCharacterRange:(uint64_t)a3
{
  if (!a1) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 224) & 0x10) != 0)
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a2, a3, 0);
    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 112) + a2 - *(void *)(a1 + 128);
    uint64_t v7 = a3;
  }
  unint64_t v9 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", [(id)a1 zone]);
  uint64_t v10 = *(void **)(a1 + 80);
  v15.receiver = v9;
  v15.super_class = (Class)NSATSGlyphStorage;
  uint64_t v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
  v11[10] = v10;
  v11[19] = (id)a1;
  -[NSATSGlyphStorage setGlyphRange:characterRange:](v11, v6, v7, a2, a3);
  Mutable = *(__CFSet **)(a1 + 160);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
    *(void *)(a1 + 160) = Mutable;
  }
  CFSetAddValue(Mutable, v11);

  if (v11[8])
  {
    MEMORY[0x192FAD9D0]();
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    v11[8] = (id)CFMakeCollectable(MutableWithInterface);
  }
  return v11;
}

- (const)_createEllipsisRunWithStringRange:(uint64_t)a3 attributes:(uint64_t)a4
{
  uint64_t MutableRunsWithStorageAndOptions = (uint64_t)a1;
  if (!a1) {
    return (const void *)MutableRunsWithStorageAndOptions;
  }
  uint64_t v7 = +[NSATSGlyphStorage allocWithZone:](NSATSGlyphStorage, "allocWithZone:", [a1 zone]);
  uint64_t v8 = *(void *)(MutableRunsWithStorageAndOptions + 80);
  v41.receiver = v7;
  v41.super_class = (Class)NSATSGlyphStorage;
  unint64_t v9 = objc_msgSendSuper2(&v41, sel_init);
  v9[10] = v8;
  uint64_t v10 = *(long long **)(MutableRunsWithStorageAndOptions + 88);
  uint64_t v11 = *(void *)(MutableRunsWithStorageAndOptions + 96);
  LOWORD(v41.receiver) = 8230;
  CGGlyph glyphs = 0;
  v9[19] = MutableRunsWithStorageAndOptions;
  uint64_t v12 = *(void *)(MutableRunsWithStorageAndOptions + 128) + a2;
  uint64_t v13 = objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "glyphRangeForCharacterRange:actualCharacterRange:", v12, a3, 0);
  __NSATSGlyphStorageInitBuffer((uint64_t)v9, v13, v14, v12, a3, 1);
  if (v11 >= 1)
  {
    uint64_t v15 = 0;
    unint64_t v16 = (unint64_t)v10 + 104 * v11;
    do
    {
      v15 += *((void *)v10 + 2);
      if (v15 > a2) {
        break;
      }
      uint64_t v10 = (long long *)((char *)v10 + 104);
    }
    while ((unint64_t)v10 < v16);
  }
  uint64_t v17 = v9[11];
  if (!v17)
  {
    uint64_t v17 = NSAllocateScannedUncollectable();
    v9[11] = v17;
    v9[13] = 8;
  }
  long long v18 = *v10;
  long long v19 = v10[2];
  *(_OWORD *)(v17 + 16) = v10[1];
  *(_OWORD *)(v17 + 32) = v19;
  *(_OWORD *)uint64_t v17 = v18;
  long long v20 = v10[3];
  long long v21 = v10[4];
  long long v22 = v10[5];
  *(void *)(v17 + 96) = *((void *)v10 + 12);
  *(_OWORD *)(v17 + 64) = v21;
  *(_OWORD *)(v17 + 80) = v22;
  *(_OWORD *)(v17 + 48) = v20;
  uint64_t v23 = v9[11];
  *(void *)(v23 + 16) = a3;
  *(void *)(v23 + 24) = 0;
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
  *(_OWORD *)(v23 + 64) = *MEMORY[0x1E4F28AD8];
  *(_OWORD *)(v23 + 80) = v24;
  *(_DWORD *)(v9[11] + 96) &= ~1u;
  v9[12] = 1;
  BOOL GlyphsForCharacters = CTFontGetGlyphsForCharacters(*(CTFontRef *)(v9[11] + 8), (const UniChar *)&v41, &glyphs, 1);
  CGGlyph v26 = glyphs;
  if (!GlyphsForCharacters) {
    CGGlyph v26 = 0;
  }
  unint64_t v27 = (int *)MEMORY[0x1E4F243A8];
  **(_WORD **)((char *)v9 + (int)*MEMORY[0x1E4F243A8]) = v26;
  p_CGGlyph glyphs = *(CGGlyph **)((char *)v9 + *v27);
  uint64_t v29 = (int *)MEMORY[0x1E4F24398];
  if (*p_glyphs) {
    goto LABEL_14;
  }
  if (([*(id *)(MutableRunsWithStorageAndOptions + 80) _allowsEllipsisGlyphSubstitution] & 1) == 0)
  {
    p_CGGlyph glyphs = *(CGGlyph **)((char *)v9 + *v27);
LABEL_14:
    uint64_t v31 = *(void **)(v9[11] + 8);
    uint64_t v32 = *(void *)((char *)v9 + *v29);
    goto LABEL_15;
  }
  uint64_t v30 = (const __CTFont *)objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "substituteFontForFont:", objc_msgSend(*(id *)(MutableRunsWithStorageAndOptions + 80), "_ellipsisFontForFont:", *(void *)(v9[11] + 8)));
  *(void *)(v9[11] + 8) = v30;
  CTFontGetGlyphsForCharacters(v30, (const UniChar *)&v41, &glyphs, 1);
  uint64_t v31 = *(void **)(v9[11] + 8);
  uint64_t v32 = *(void *)((char *)v9 + *v29);
  p_CGGlyph glyphs = &glyphs;
LABEL_15:
  objc_msgSend(v31, "getAdvancements:forCGGlyphs:count:", v32, p_glyphs, 1, a4);
  if (*(double *)(v9[11] + 48) != 1.0) {
    **(double **)((char *)v9 + *v29) = *((double *)v10 + 6) * **(double **)((char *)v9 + *v29);
  }
  **(_DWORD **)((char *)v9 + (int)*MEMORY[0x1E4F243B0]) = 786432;
  **(void **)((char *)v9 + (int)*MEMORY[0x1E4F243B8]) = a2;
  unint64_t v33 = (int *)MEMORY[0x1E4F24390];
  long long v34 = *(void **)((char *)v9 + (int)*MEMORY[0x1E4F24390]);
  if (!v34)
  {
    *(void *)((char *)v9 + *v33) = NSZoneMalloc((NSZone *)[v9 zone], 8uLL);
    long long v34 = *(void **)((char *)v9 + *v33);
  }
  *long long v34 = a3 - 1;
  *((_DWORD *)v9 + 56) |= 1u;
  *((_DWORD *)v9 + 56) |= 8u;
  Mutable = *(__CFSet **)(MutableRunsWithStorageAndOptions + 160);
  if (!Mutable)
  {
    Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
    *(void *)(MutableRunsWithStorageAndOptions + 160) = Mutable;
  }
  CFSetAddValue(Mutable, v9);

  if (v9[8])
  {
    MEMORY[0x192FAD9D0]();
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    v9[8] = CFMakeCollectable(MutableWithInterface);
  }
  uint64_t MutableRunsWithStorageAndOptions = CTRunCreateMutableRunsWithStorageAndOptions();
  if (CFGetTypeID((CFTypeRef)MutableRunsWithStorageAndOptions) == __CFArrayTypeID)
  {
    ValueAtIndedouble x = CFArrayGetValueAtIndex((CFArrayRef)MutableRunsWithStorageAndOptions, 0);
    CFRetain(ValueAtIndex);
    CFRelease((CFTypeRef)MutableRunsWithStorageAndOptions);
    return ValueAtIndex;
  }
  return (const void *)MutableRunsWithStorageAndOptions;
}

- (uint64_t)_collectElasticRangeSurroundingCharacterAtIndex:(uint64_t)a3 minimumCharacterIndex:
{
  v104[16] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 224) & 4) != 0 || [*(id *)(a1 + 80) _bidiLevels])
  {
    unint64_t v6 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a2, *(void *)(a1 + 128) - a2 + *(void *)(a1 + 136), 0);
    unint64_t v8 = v6 + v7;
    if (v6 < v6 + v7)
    {
      unint64_t v9 = v6;
      while (1)
      {
        uint64_t v10 = v8 - v9 >= 0x10 ? 16 : v8 - v9;
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v9, v10, 0, v103, v104, 0);
        if (v11) {
          break;
        }
LABEL_13:
        v9 += v11;
        if (v9 >= v8) {
          goto LABEL_14;
        }
      }
      uint64_t v12 = v104;
      uint64_t v13 = v103;
      uint64_t v14 = v11;
      while (1)
      {
        char v15 = *v13;
        v13 += 8;
        if ((v15 & 4) == 0) {
          break;
        }
        ++v12;
        if (!--v14) {
          goto LABEL_13;
        }
      }
    }
LABEL_14:
    unint64_t v16 = objc_msgSend(*(id *)(a1 + 80), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a2 - a3, 0);
    unint64_t v18 = v16 + v17;
    if (v16 < v16 + v17)
    {
      unint64_t v19 = v16;
      while (1)
      {
        uint64_t v20 = v18 - v19 >= 0x10 ? 16 : v18 - v19;
        v18 -= v20;
        uint64_t v21 = objc_msgSend(*(id *)(a1 + 80), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v18);
        if (v21) {
          break;
        }
LABEL_22:
        if (v19 >= v18) {
          return a3;
        }
      }
      while ((*(void *)&v103[8 * v21 - 8] & 4) != 0)
      {
        if (!--v21) {
          goto LABEL_22;
        }
      }
      return v104[v21 - 1] + 1;
    }
    return a3;
  }
  uint64_t v23 = *(void *)(a1 + 128);
  int64_t v24 = a2 - v23;
  uint64_t v25 = a3 - v23;
  CGGlyph v26 = (int *)MEMORY[0x1E4F243B0];
  if ((*(unsigned char *)(a1 + 224) & 0x10) == 0)
  {
    uint64_t v27 = *(void *)(a1 + (int)*MEMORY[0x1E4F243B0]);
    uint64_t v28 = v27 + 4 * v24;
    uint64_t v29 = *(void *)(a1 + 120);
    if (v24 < v29)
    {
      unint64_t v30 = v27 + 4 * v29;
      unint64_t v31 = v27 - 4 * v23 + 4 * a2 + 4;
      do
      {
        uint64_t v32 = (unsigned char *)v31;
        if ((*(unsigned char *)(v31 - 4) & 1) == 0) {
          break;
        }
        if (v31 >= v30) {
          break;
        }
        v28 += 4;
        v31 += 4;
      }
      while ((*v32 & 0x40) == 0);
    }
    unint64_t v98 = v27 + 4 * v25;
    uint64_t v99 = v27 - 4;
    uint64_t v100 = 4 * a2 - 4 * v23;
    do
    {
      uint64_t v101 = v100;
      uint64_t v102 = (unsigned char *)(v99 + v100);
      if (v99 + v100 < v98) {
        break;
      }
      v100 -= 4;
    }
    while ((*v102 & 1) != 0);
    return v23 + (v101 >> 2);
  }
  unint64_t v33 = *(void *)(a1 + 88);
  unint64_t v34 = v33 + 104 * *(void *)(a1 + 96);
  if (*(void *)(a1 + 200))
  {
    if (*(void *)(a1 + 208) > v25)
    {
      uint64_t v35 = 0;
    }
    else
    {
      unint64_t v33 = *(void *)(a1 + 200);
      uint64_t v35 = *(void *)(a1 + 208);
    }
  }
  else
  {
    uint64_t v35 = 0;
  }
  long long v36 = (int *)MEMORY[0x1E4F24390];
  uint64_t v37 = (int *)MEMORY[0x1E4F243A0];
  if (v33 >= v34)
  {
    uint64_t v38 = 0;
    unint64_t v40 = v34;
    goto LABEL_122;
  }
  uint64_t v38 = 0;
  unint64_t v39 = (int *)MEMORY[0x1E4F243B8];
  unint64_t v40 = v34;
  objc_super v41 = (void *)v33;
  while (1)
  {
    if (v25 >= v35 && v25 < v41[2] + v35)
    {
      if ((unint64_t)v24 >= *(void *)(a1 + 136))
      {
        unint64_t v33 = (unint64_t)v41;
        goto LABEL_122;
      }
      *(void *)(a1 + 200) = v41;
      *(void *)(a1 + 208) = v35;
      unint64_t v33 = (unint64_t)v41;
    }
    uint64_t v42 = v41[2] + v35;
    if (v24 < v42) {
      break;
    }
LABEL_118:
    v41 += 13;
    uint64_t v35 = v42;
    if ((unint64_t)v41 >= v34) {
      goto LABEL_122;
    }
  }
  uint64_t v43 = v41[3];
  uint64_t v44 = *(void *)(a1 + *v36);
  BOOL v45 = (uint64_t *)(v44 + 8 * v43);
  if (v44) {
    unint64_t v46 = (uint64_t *)(v44 + 8 * v43);
  }
  else {
    unint64_t v46 = 0;
  }
  if (v35 > v24)
  {
    uint64_t v47 = 0;
    int v48 = *v26;
    goto LABEL_103;
  }
  if ((unint64_t)(v41 + 13) >= v34) {
    long double v49 = (void *)(a1 + *v37);
  }
  else {
    long double v49 = v41 + 16;
  }
  uint64_t v50 = *(void *)(a1 + *v39);
  long double v51 = (int64_t *)(v50 + 8 * v43);
  uint64_t v52 = v50 + 8 * *v49;
  int v53 = *(_DWORD *)(a1 + 224);
  if ((v53 & 0x20) != 0)
  {
    uint64_t v47 = 0;
  }
  else
  {
    if (!v46)
    {
      uint64_t v47 = 0;
LABEL_67:
      unint64_t v58 = v52 - 8 * v47 - 8;
      if ((unint64_t)v51 <= v58)
      {
        v59 = v51;
        do
        {
          uint64_t v60 = &v59[(uint64_t)(v58 - (void)v59) >> 4];
          if (v24 >= *v60)
          {
            if (v24 <= *v60)
            {
              unint64_t v46 = 0;
              long double v51 = v60;
              goto LABEL_75;
            }
            v59 = v60 + 1;
          }
          else
          {
            unint64_t v58 = (unint64_t)(v60 - 1);
          }
        }
        while ((unint64_t)v59 <= v58);
      }
      unint64_t v46 = 0;
      goto LABEL_75;
    }
    if (*(void *)(a1 + 96) == 1)
    {
      uint64_t v54 = *(void *)(a1 + *v37);
      if (v54 >= 1001)
      {
        if ((v53 & 0x40) == 0)
        {
          uint64_t v55 = v44 + 8 * v54;
          uint64_t v56 = *(void *)(a1 + 216);
          if ((unint64_t)v45 < v55 - 8 * v56)
          {
            do
            {
              uint64_t v57 = *v45++;
              v56 += v57;
              *(void *)(a1 + 216) = v56;
            }
            while ((unint64_t)v45 < v55 - 8 * v56);
            int v53 = *(_DWORD *)(a1 + 224);
          }
          *(_DWORD *)(a1 + 224) = v53 | 0x40;
        }
        uint64_t v47 = *(void *)(a1 + 216);
        goto LABEL_67;
      }
    }
    uint64_t v47 = 0;
    unint64_t v46 = v45;
  }
LABEL_75:
  if ((unint64_t)v51 >= v52 - 8 * v47) {
    return a2;
  }
  double v61 = v51;
  while (*v51 < v24)
  {
    if (v46)
    {
      uint64_t v62 = *v46++;
      v47 += v62;
    }
    ++v51;
    ++v61;
    if ((unint64_t)v51 >= v52 - 8 * v47) {
      return a2;
    }
  }
  if (*v51 != v24) {
    return a2;
  }
  uint64_t v63 = (uint64_t)v61 - *(void *)(a1 + *v39);
  uint64_t v43 = v63 >> 3;
  uint64_t v64 = *(void *)(a1 + *v36);
  if (v46) {
    BOOL v65 = 1;
  }
  else {
    BOOL v65 = v64 == 0;
  }
  v66 = (uint64_t *)(v64 + (v63 & 0xFFFFFFFFFFFFFFF8));
  if (!v65) {
    unint64_t v46 = v66;
  }
  int v48 = *v26;
  if (v35 < v24)
  {
    uint64_t v67 = *(void *)(a1 + v48);
    uint64_t v68 = v67 + 4 * v43;
    unint64_t v69 = v67 + 4 * v41[3];
    if (v68 - 4 >= v69 && (*(unsigned char *)(v68 - 4) & 1) != 0)
    {
      unint64_t v71 = v67 + 4 * v43 - 8;
      while (1)
      {
        uint64_t v72 = (unsigned char *)v71;
        if (v46)
        {
          if (*--v46) {
            break;
          }
        }
        if (v71 >= v69)
        {
          v71 -= 4;
          if (*v72) {
            continue;
          }
        }
        uint64_t v70 = v72 + 4;
        goto LABEL_100;
      }
      uint64_t v70 = (unsigned char *)(v71 + 8);
    }
    else
    {
      uint64_t v70 = (unsigned char *)(v67 + 4 * v43);
    }
LABEL_100:
    uint64_t v74 = v68 - (void)v70;
    a2 -= v74 >> 2;
    v38 += v74 >> 2;
    if (v70 != (unsigned char *)v69) {
      unint64_t v33 = (unint64_t)v41;
    }
  }
  unint64_t v40 = (unint64_t)v41;
LABEL_103:
  if ((unint64_t)(v41 + 13) >= v34) {
    uint64_t v75 = (void *)(a1 + *v37);
  }
  else {
    uint64_t v75 = v41 + 16;
  }
  uint64_t v76 = *(void *)(a1 + v48);
  unint64_t v77 = v76 + 4 * v43;
  unint64_t v78 = v76 + 4 * *v75 - 4 * v47;
  if (v77 >= v78)
  {
    unint64_t v81 = v77;
LABEL_117:
    v38 += (uint64_t)(v81 - v77) >> 2;
    uint64_t v42 = v41[2] + v35;
    goto LABEL_118;
  }
  uint64_t v79 = 0;
  while ((*(unsigned char *)(v77 + v79) & 1) != 0)
  {
    int v80 = (unsigned char *)(v77 + v79 + 4);
    if ((unint64_t)v80 < v78 && (*v80 & 0x40) != 0) {
      break;
    }
    if (v46)
    {
      if (*v46 > 0) {
        break;
      }
      ++v46;
    }
    v79 += 4;
    unint64_t v81 = v77 + v79;
    if (v77 + v79 >= v78) {
      goto LABEL_117;
    }
  }
  v38 += v79 >> 2;
  do
  {
LABEL_122:
    if (v40 - 104 < v33) {
      break;
    }
    uint64_t v82 = (uint64_t *)(v40 >= v34 ? a1 + *v37 : v40 + 24);
    uint64_t v83 = *(void *)(a1 + *v26);
    uint64_t v84 = *(void *)(v40 - 80);
    uint64_t v85 = *v82;
    unint64_t v86 = v83 + 4 * *v82;
    if (v84 >= v85)
    {
      int v87 = 0;
    }
    else
    {
      int v87 = 0;
      uint64_t v88 = *(void *)(a1 + *v36);
      uint64_t v89 = (uint64_t *)(v88 + 8 * v84);
      if (!v88) {
        uint64_t v89 = 0;
      }
      uint64_t v90 = (unsigned char *)(v83 + 4 * v84 + 4);
      do
      {
        if (v87 || (int v87 = v90 - 4, (*(v90 - 4) & 1) == 0) || (unint64_t)v90 < v86 && (*v90 & 0x40) != 0) {
          int v87 = 0;
        }
        if (v89)
        {
          uint64_t v92 = *v89++;
          uint64_t v91 = v92;
          BOOL v93 = v92 <= 0;
          uint64_t v94 = v92 > 0 ? -v91 : 0;
          v86 += 4 * v94;
          if (!v93) {
            int v87 = 0;
          }
        }
        BOOL v95 = (unint64_t)v90 >= v86;
        v90 += 4;
      }
      while (!v95);
    }
    char v96 = (unsigned char *)(v83 + 4 * v84);
    uint64_t v97 = (uint64_t)(v86 - (void)v87) >> 2;
    if (!v87) {
      uint64_t v97 = 0;
    }
    v38 += v97;
    a2 -= v97;
    v40 -= 104;
  }
  while (v87 == v96);
  return a2;
}

- (double)_widthForStringRange:(uint64_t)a3
{
  double v3 = 0.0;
  if (a1 && a3)
  {
    unint64_t v5 = a2 - *(void *)(a1 + 128);
    unint64_t v6 = *(void *)(a1 + 144);
    if (v5 + a3 >= v6) {
      CFIndex v7 = *(void *)(a1 + 144);
    }
    else {
      CFIndex v7 = v5 + a3;
    }
    if (v5 >= v6) {
      unint64_t v8 = *(void *)(a1 + 144);
    }
    else {
      unint64_t v8 = a2 - *(void *)(a1 + 128);
    }
    int v9 = *(_DWORD *)(a1 + 224);
    if ((v9 & 0x10) != 0)
    {
      if ((v9 & 4) != 0)
      {
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 72));
        if (Count >= 1)
        {
          CFIndex v37 = Count;
          for (CFIndex i = 0; i != v37; ++i)
          {
            ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), i);
            CFRange StringRange = CTRunGetStringRange(ValueAtIndex);
            if (v7 <= StringRange.location) {
              break;
            }
            CFIndex v41 = StringRange.location + StringRange.length;
            if (v8 <= StringRange.location && v41 < v7)
            {
              v45.location = 0;
              v45.CFStringRef length = 0;
              double v3 = v3 + CTRunGetTypographicBounds(ValueAtIndex, v45, 0, 0, 0);
            }
            else if (v41 >= v8)
            {
              uint64_t GlyphStorage = CTRunGetGlyphStorage();
              MEMORY[0x192FAD9C0](GlyphStorage);
            }
          }
        }
      }
      else
      {
        uint64_t v14 = *(void **)(a1 + 88);
        unint64_t v15 = (unint64_t)&v14[13 * *(void *)(a1 + 96)];
        unint64_t v16 = *(void *)(a1 + 200);
        if (v16)
        {
          if (*(void *)(a1 + 208) > v8)
          {
            unint64_t v16 = 0;
          }
          else
          {
            uint64_t v14 = *(void **)(a1 + 200);
            unint64_t v16 = *(void *)(a1 + 208);
          }
        }
        for (; (unint64_t)v14 < v15 && (uint64_t)v16 < v7; v14 += 13)
        {
          v16 += v14[2];
          if (v16 > v8)
          {
            if ((unint64_t)(v14 + 13) >= v15) {
              unint64_t v18 = (void *)(a1 + (int)*MEMORY[0x1E4F243A0]);
            }
            else {
              unint64_t v18 = v14 + 16;
            }
            uint64_t v19 = *(void *)(a1 + (int)*MEMORY[0x1E4F24398]);
            int64_t v20 = v14[3];
            uint64_t v21 = (double *)(v19 + 16 * v20);
            unint64_t v22 = v19 + 16 * *v18;
            uint64_t v23 = *(void *)(a1 + (int)*MEMORY[0x1E4F243B8]);
            int64_t v24 = (unint64_t *)(v23 + 8 * v20);
            uint64_t v25 = *(void *)(a1 + (int)*MEMORY[0x1E4F24390]);
            CGGlyph v26 = (void *)(v25 + 8 * v20);
            if (v25) {
              unint64_t v27 = v25 + 8 * v20;
            }
            else {
              unint64_t v27 = 0;
            }
            if ((v9 & 0x20) == 0)
            {
              if ((v9 & 0x40) != 0)
              {
                if (*(void *)(a1 + (int)*MEMORY[0x1E4F243A0]) >= *(void *)(a1 + 120)) {
                  unint64_t v27 = 0;
                }
                else {
                  unint64_t v27 = *(void *)(a1 + 216);
                }
                v22 -= 16 * v27;
              }
              else if (v27)
              {
                unint64_t v27 = (unint64_t)v26;
                goto LABEL_51;
              }
              if ((unint64_t)(v14 + 13) >= v15) {
                uint64_t v28 = (void *)(a1 + (int)*MEMORY[0x1E4F243A0]);
              }
              else {
                uint64_t v28 = v14 + 16;
              }
              int64_t v29 = *v28 + ~v27;
              if (v20 <= v29)
              {
                unint64_t v30 = (char *)(v23 + 8 * v29);
                unint64_t v31 = (char *)(v23 + 8 * v20);
                do
                {
                  uint64_t v32 = (unint64_t *)&v31[8 * ((v30 - v31) >> 4)];
                  if (v8 >= *v32)
                  {
                    if (v8 <= *v32)
                    {
                      unint64_t v27 = 0;
                      uint64_t v21 = (double *)((char *)v21 + 2 * ((char *)v32 - (char *)v24));
                      int64_t v24 = v32;
                      goto LABEL_51;
                    }
                    unint64_t v31 = (char *)(v32 + 1);
                  }
                  else
                  {
                    unint64_t v30 = (char *)(v32 - 1);
                  }
                }
                while (v31 <= v30);
              }
              unint64_t v27 = 0;
            }
LABEL_51:
            while ((unint64_t)v21 < v22)
            {
              CFIndex v33 = *v24;
              if (*v24 >= v8 && v33 < v7) {
                double v3 = v3 + *v21;
              }
              if ((v9 & 0x20) == 0 && v33 >= v7) {
                break;
              }
              if (v27)
              {
                uint64_t v35 = *(void *)v27;
                v27 += 8;
                v22 -= 16 * v35;
              }
              v21 += 2;
              ++v24;
            }
          }
        }
      }
    }
    else if ((uint64_t)v8 < v7)
    {
      uint64_t v10 = *(void *)(a1 + (int)*MEMORY[0x1E4F24398]);
      unint64_t v11 = v10 + 16 * v7;
      uint64_t v12 = (double *)(v10 + 16 * v8);
      do
      {
        double v13 = *v12;
        v12 += 2;
        double v3 = v3 + v13;
      }
      while ((unint64_t)v12 < v11);
    }
  }
  return v3;
}

- (void)dealloc
{
  double v3 = (NSZone *)[(NSATSGlyphStorage *)self zone];
  glyphStorage = self->_glyphStorage;
  if (glyphStorage) {
    CFRelease(glyphStorage);
  }
  masterRuns = self->_masterRuns;
  if (masterRuns) {
    CFRelease(masterRuns);
  }
  runs = self->_runs;
  if (runs) {
    NSZoneFree(0, runs);
  }
  CFIndex v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]);
  if (v7) {
    NSZoneFree(v3, v7);
  }
  unint64_t v8 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
  if (v8) {
    NSZoneFree(v3, v8);
  }
  children = self->_children;
  if (children) {
    CFRelease(children);
  }

  v10.receiver = self;
  v10.super_class = (Class)NSATSGlyphStorage;
  [(NSATSGlyphStorage *)&v10 dealloc];
}

- (void)finalize
{
  double v3 = (NSZone *)[(NSATSGlyphStorage *)self zone];
  masterRuns = self->_masterRuns;
  if (masterRuns) {
    CFRelease(masterRuns);
  }
  runs = self->_runs;
  if (runs) {
    NSZoneFree(0, runs);
  }
  unint64_t v6 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]);
  if (v6) {
    NSZoneFree(v3, v6);
  }
  CFIndex v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
  if (v7) {
    NSZoneFree(v3, v7);
  }
  children = self->_children;
  if (children) {
    CFRelease(children);
  }
  v9.receiver = self;
  v9.super_class = (Class)NSATSGlyphStorage;
  [(NSATSGlyphStorage *)&v9 finalize];
}

- (__CTGlyphStorage)createCopy:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (self->_parent) {
    parent = self->_parent;
  }
  else {
    parent = self;
  }
  if ((*(unsigned char *)&self->_gFlags & 0x10) == 0)
  {
    uint64_t v56 = self->_characterRange.location + a3.var0;
    int64_t v57 = a3.var1;
    int64_t v54 = a3.var1;
    uint64_t v55 = self->_glyphRange.location + a3.var0;
    int64_t v7 = a3.var1;
    goto LABEL_28;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]);
  objc_super v9 = (uint64_t *)(v8 + 8 * a3.var0);
  uint64_t v10 = *v9;
  int64_t v11 = a3.var0 + a3.var1 - 1;
  uint64_t v12 = (uint64_t *)(v8 + 8 * v11);
  uint64_t v14 = *v12;
  uint64_t v15 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]);
  if ((*(_DWORD *)(v15 + 4 * a3.var0) & 0x200000) == 0) {
    goto LABEL_12;
  }
  if (a3.var1 >= 1)
  {
    unint64_t v16 = v8 + 8 * (a3.var0 + a3.var1);
    uint64_t v17 = v9;
    do
    {
      uint64_t v19 = *v17++;
      uint64_t v18 = v19;
      if (v19 < v10) {
        uint64_t v10 = v18;
      }
    }
    while ((unint64_t)v17 < v16);
LABEL_12:
    if ((*(_DWORD *)(v15 + 4 * v11) & 0x200000) != 0 && a3.var1 >= 1)
    {
      do
      {
        uint64_t v21 = *v12--;
        uint64_t v20 = v21;
        if (v21 > v14) {
          uint64_t v14 = v20;
        }
      }
      while (v12 >= v9);
    }
  }
  uint64_t v23 = v14 - v10;
  BOOL v22 = v14 - v10 < 0;
  if (v14 < v10) {
    uint64_t v10 = v14;
  }
  if (v22) {
    uint64_t v24 = -v23;
  }
  else {
    uint64_t v24 = v23;
  }
  int64_t v7 = v24 + 1;
  NSUInteger location = parent->_characterRange.location;
  BOOL v25 = a3.var0 == v10 && v7 == a3.var1;
  uint64_t v56 = v10 + location;
  if (v25)
  {
    int64_t v54 = a3.var1;
    uint64_t v55 = self->_glyphRange.location + a3.var0;
    int64_t v57 = a3.var1;
  }
  else
  {
    uint64_t v26 = -[NSTypesetter glyphRangeForCharacterRange:actualCharacterRange:](self->_typesetter, "glyphRangeForCharacterRange:actualCharacterRange:", v10 + location, v24 + 1, 0);
    int64_t v54 = v27;
    uint64_t v55 = v26;
    int64_t v57 = v7;
  }
LABEL_28:
  uint64_t v28 = +[NSATSGlyphStorage allocWithZone:[(NSATSGlyphStorage *)self zone]];
  typesetter = self->_typesetter;
  v59.receiver = v28;
  v59.super_class = (Class)NSATSGlyphStorage;
  unint64_t v30 = [(NSATSGlyphStorage *)&v59 init];
  *((void *)v30 + 10) = typesetter;
  unint64_t v58 = parent;
  *((void *)v30 + 19) = parent;
  runs = self->_runs;
  unint64_t v32 = (unint64_t)&runs[self->_numRuns];
  zone = (NSZone *)[v30 zone];
  __NSATSGlyphStorageInitBuffer((uint64_t)v30, v55, v54, v56, v7, var1);
  p_var3 = &runs[1].var3;
  do
  {
    unint64_t v34 = p_var3;
    if ((unint64_t)(p_var3 - 3) >= v32) {
      break;
    }
    p_var3 += 13;
  }
  while (*v34 <= var0);
  uint64_t v35 = *((void *)v30 + 11);
  if (!v35)
  {
    uint64_t v35 = NSAllocateScannedUncollectable();
    *((void *)v30 + 11) = v35;
    *((void *)v30 + 13) = 8;
  }
  long long v36 = *((_OWORD *)v34 - 8);
  long long v37 = *((_OWORD *)v34 - 6);
  *(_OWORD *)(v35 + 16) = *((_OWORD *)v34 - 7);
  *(_OWORD *)(v35 + 32) = v37;
  *(_OWORD *)uint64_t v35 = v36;
  long long v38 = *((_OWORD *)v34 - 5);
  long long v39 = *((_OWORD *)v34 - 4);
  long long v40 = *((_OWORD *)v34 - 3);
  *(void *)(v35 + 96) = *(v34 - 4);
  *(_OWORD *)(v35 + 64) = v39;
  *(_OWORD *)(v35 + 80) = v40;
  *(_OWORD *)(v35 + 48) = v38;
  uint64_t v41 = *((void *)v30 + 11);
  *(void *)(v41 + 16) = v57;
  *(void *)(v41 + 24) = 0;
  *((void *)v30 + 12) = 1;
  memcpy(*(void **)&v30[*MEMORY[0x1E4F243A8]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]) + 2 * var0, 2 * var1);
  memcpy(*(void **)&v30[*MEMORY[0x1E4F24398]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]) + 16 * var0, 16 * var1);
  uint64_t v42 = (int)*MEMORY[0x1E4F243B0];
  memcpy(*(void **)&v30[v42], *(char **)((char *)&self->super.super.isa + v42) + 4 * var0, 4 * var1);
  memcpy(*(void **)&v30[*MEMORY[0x1E4F243B8]], *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]) + 8 * var0, 8 * var1);
  uint64_t v43 = (int)*MEMORY[0x1E4F24390];
  uint64_t v44 = *(uint64_t *)((char *)&self->super.super.isa + v43);
  if (v44)
  {
    CFRange v45 = *(void **)&v30[v43];
    if (!v45)
    {
      CFRange v45 = NSZoneMalloc(zone, 8 * *((void *)v30 + 18));
      *(void *)&v30[v43] = v45;
      uint64_t v44 = *(uint64_t *)((char *)&self->super.super.isa + v43);
    }
    memcpy(v45, (const void *)(v44 + 8 * var0), 8 * var1);
  }
  unsigned int v46 = *((_DWORD *)v30 + 56) & 0xFFFFFFFD | (2 * ((*((_DWORD *)v34 - 8) >> 1) & 1));
  *((_DWORD *)v30 + 56) = v46;
  if ((*(unsigned char *)&self->_gFlags & 1) != 0 && var1 >= 1)
  {
    unint64_t v47 = *(void *)&v30[v42];
    unint64_t v48 = v47 + 4 * var1;
    do
    {
      if ((*(unsigned char *)(v47 + 2) & 4) != 0)
      {
        v46 |= 1u;
        *((_DWORD *)v30 + 56) = v46;
      }
      v47 += 4;
    }
    while (v47 < v48);
  }
  children = v58->_children;
  if (!children)
  {
    children = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
    v58->_children = children;
  }
  CFSetAddValue(children, v30);

  if (*((void *)v30 + 8))
  {
    MEMORY[0x192FAD9D0]();
    CFTypeRef v50 = (CFTypeRef)*((void *)v30 + 8);
  }
  else
  {
    MutableWithInterface = (const void *)CTGlyphStorageCreateMutableWithInterface();
    CFTypeRef v50 = CFMakeCollectable(MutableWithInterface);
    *((void *)v30 + 8) = v50;
  }
  return (__CTGlyphStorage *)CFRetain(v50);
}

- (void)getCustomAdvance:(CGSize *)a3 forIndex:(int64_t)a4
{
  runs = self->_runs;
  uint64_t v8 = &runs[self->_numRuns];
  objc_super v9 = runs + 1;
  do
  {
    uint64_t v10 = v9;
    if (v9 >= v8) {
      break;
    }
    int64_t var3 = v9->var3;
    ++v9;
  }
  while (var3 <= a4);
  [v10[-1].var1 advancementForGlyph:(*(unsigned __int16 **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]))[a4]];
  CGFloat v13 = (*(double **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]))[2 * a4 + 1];
  a3->double width = v12 * v10[-1].var6;
  a3->double height = v13;
}

- (void)setGlyphID:(unsigned __int16)a3 forIndex:(int64_t)a4
{
  (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]))[a4] = a3;
  (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]))[a4] |= 0x40000u;
  *(_DWORD *)&self->_gFlags |= 1u;
}

- (void)setAdvance:(CGSize)a3 forIndex:(int64_t)a4
{
  NSUInteger v4 = (CGSize *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]) + 16 * a4);
  if (v4->width != a3.width || v4->height != a3.height)
  {
    *NSUInteger v4 = a3;
    (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]))[a4] |= 0x80000u;
  }
}

- (void)setProps:(unsigned int)a3 forIndex:(int64_t)a4
{
  NSUInteger v4 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]) + 4 * a4;
  *(_DWORD *)NSUInteger v4 = a3 | (v4[2] << 16);
}

- (void)setAbsorbedCount:(int64_t)a3 forIndex:(int64_t)a4
{
  uint64_t v7 = (int)*MEMORY[0x1E4F24390];
  uint64_t v8 = *(Class *)((char *)&self->super.super.isa + v7);
  if (!v8)
  {
    uint64_t v8 = (objc_class *)NSZoneCalloc((NSZone *)[(NSATSGlyphStorage *)self zone], self->_bufferSize, 8uLL);
    *(Class *)((char *)&self->super.super.isa + v7) = v8;
  }
  *((void *)v8 + a4) = a3;
}

- (void)setStringIndex:(int64_t)a3 forIndex:(int64_t)a4
{
  uint64_t v4 = (int)*MEMORY[0x1E4F243B8];
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.isa + v4);
  uint64_t v6 = (int)*MEMORY[0x1E4F243B0];
  if (*(void *)(v5 + 8 * a4) != a3)
  {
    *(void *)(v5 + 8 * a4) = a3;
    uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
    int v8 = *(_DWORD *)(v7 + 4 * a4);
    if ((v8 & 0x20300) == 0) {
      *(_DWORD *)(v7 + 4 * a4) = v8 | 0x40000;
    }
  }
  *(_DWORD *)&self->_gFlags |= 0x30u;
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  uint64_t v10 = (_DWORD *)(v9 + 4 * a4);
  if ((*v10 & 0x220000) == 0x20000)
  {
    unint64_t v11 = *(unint64_t *)((char *)&self->super.super.isa + v4);
    if (!a4 || *(void *)(v11 + 8 * a4 - 8) != a3)
    {
      uint64_t v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A0]);
      if (v12 == a4 + 1 || *(void *)(v11 + 8 * (a4 + 1)) != a3)
      {
        unint64_t v13 = v11 + 8 * v12;
        int64_t v14 = 8 * a4;
        if (v11 + 8 * a4 + 8 >= v13)
        {
LABEL_17:
          unint64_t v19 = v11 - 8;
          while (v19 + v14 >= v11)
          {
            uint64_t v20 = *(void *)(v19 + v14);
            v14 -= 8;
            if (v20 == a3)
            {
              if (!v9) {
                return;
              }
              uint64_t v21 = (_DWORD *)(v9 + (v14 >> 1));
              goto LABEL_24;
            }
          }
        }
        else
        {
          uint64_t v15 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
          unint64_t v16 = (uint64_t *)(v15 + 8 * a4);
          if (!v15) {
            unint64_t v16 = 0;
          }
          uint64_t v17 = v14 + 8;
          while (*(void *)(v11 + v17) < a3)
          {
            if (v16)
            {
              uint64_t v18 = *v16++;
              v13 -= 8 * v18;
            }
            v17 += 8;
            if (v11 + v17 >= v13) {
              goto LABEL_17;
            }
          }
          uint64_t v21 = (_DWORD *)(v9 + 4 * a4);
          uint64_t v10 = (_DWORD *)(v9 + (v17 >> 1));
LABEL_24:
          while (v21 <= v10)
            *v21++ |= 0x200000u;
        }
      }
    }
  }
}

- (void)swapGlyph:(int64_t)a3 withIndex:(int64_t)a4
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]);
  __int16 v5 = *(_WORD *)(v4 + 2 * a3);
  *(_WORD *)(v4 + 2 * a3) = *(_WORD *)(v4 + 2 * a4);
  *(_WORD *)(v4 + 2 * a4) = v5;
  uint64_t v6 = (int)*MEMORY[0x1E4F24398];
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  long long v8 = *(_OWORD *)(v7 + 16 * a3);
  *(_OWORD *)(v7 + 16 * a3) = *(_OWORD *)(v7 + 16 * a4);
  (*(_OWORD **)((char *)&self->super.super.isa + v6))[a4] = v8;
  uint64_t v9 = (int)*MEMORY[0x1E4F243B0];
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.isa + v9);
  int v11 = *(_DWORD *)(v10 + 4 * a3);
  *(_DWORD *)(v10 + 4 * a3) = *(_DWORD *)(v10 + 4 * a4);
  (*(_DWORD **)((char *)&self->super.super.isa + v9))[a4] = v11;
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]);
  uint64_t v13 = *(void *)(v12 + 8 * a3);
  *(void *)(v12 + 8 * a3) = *(void *)(v12 + 8 * a4);
  *(void *)(v12 + 8 * a4) = v13;
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
  if (v14)
  {
    uint64_t v15 = *(void *)(v14 + 8 * a3);
    *(void *)(v14 + 8 * a3) = *(void *)(v14 + 8 * a4);
    *(void *)(v14 + 8 * a4) = v15;
  }
  *(_DWORD *)&self->_gFlags |= 0x30u;
}

- (void)moveGlyphsTo:(int64_t)a3 from:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  long long v8 = (int *)MEMORY[0x1E4F243B0];
  if (self->_stack && a4.var1 >= 1)
  {
    uint64_t v9 = (_DWORD *)(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]) + 4 * a4.var0);
    uint64_t v10 = &v9[a4.var1];
    do
      *v9++ |= 0x200000u;
    while (v9 < v10);
  }
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]) + 2 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]) + 2 * a4.var0, 2 * a4.var1);
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]) + 16 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]) + 16 * var0, 16 * var1);
  memmove(*(char **)((char *)&self->super.super.isa + *v8) + 4 * a3, *(char **)((char *)&self->super.super.isa + *v8) + 4 * var0, 4 * var1);
  size_t v11 = 8 * var1;
  memmove(*(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]) + 8 * a3, *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]) + 8 * var0, v11);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
  if (v12) {
    memmove((void *)(v12 + 8 * a3), (const void *)(v12 + 8 * var0), v11);
  }
  *(_DWORD *)&self->_gFlags |= 0x10u;
}

- (void)insertGlyphs:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = (int)*MEMORY[0x1E4F243A0];
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + v6);
  int64_t v8 = a3.var0 + 1;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)(v7 + a3.var1);
  uint64_t v9 = v7 - (a3.var0 + 1);
  if (v7 + a3.var1 <= self->_bufferSize)
  {
    int v26 = *MEMORY[0x1E4F243A8];
    int64_t v27 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]) + 2 * v8;
    memmove(&v27[2 * a3.var1], v27, 2 * v9);
    int v42 = *MEMORY[0x1E4F24398];
    uint64_t v28 = *(char **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]) + 16 * v8;
    memmove(&v28[16 * var1], v28, 16 * v9);
    zonea = (NSZone *)(int)*MEMORY[0x1E4F243B0];
    memmove((void *)(*(void *)((char *)zonea + (void)self) + 4 * v8 + 4 * var1), (const void *)(*(void *)((char *)zonea + (void)self) + 4 * v8), 4 * v9);
    uint64_t v22 = (int)*MEMORY[0x1E4F243B8];
    memmove(*(char **)((char *)&self->super.super.isa + v22) + 8 * v8 + 8 * var1, *(char **)((char *)&self->super.super.isa + v22) + 8 * v8, 8 * v9);
    uint64_t v24 = (char *)(int)*MEMORY[0x1E4F24390];
    uint64_t v29 = *(void *)&v24[(void)self];
    if (v29) {
      memmove((void *)(v29 + 8 * v8 + 8 * var1), (const void *)(v29 + 8 * v8), 8 * v9);
    }
    uint64_t v21 = zonea;
  }
  else
  {
    int64_t v38 = a3.var0;
    uint64_t v10 = (NSZone *)[(NSATSGlyphStorage *)self zone];
    zone = v10;
    uint64_t v11 = *(uint64_t *)((char *)&self->super.super.isa + v6);
    uint64_t v12 = v11 & 0x7F;
    if (v11 <= 0) {
      uint64_t v12 = -(-v11 & 0x7F);
    }
    int64_t v13 = v11 - v12 + 128;
    self->_int64_t bufferSize = v13;
    uint64_t v14 = (objc_class *)NSZoneMalloc(v10, 30 * v13);
    int64_t bufferSize = self->_bufferSize;
    uint64_t v24 = (char *)v14 + 16 * bufferSize;
    unint64_t v16 = v14;
    uint64_t v17 = &v24[8 * bufferSize];
    uint64_t v18 = (objc_class *)&v17[4 * bufferSize];
    uint64_t v41 = v18;
    uint64_t v19 = (int)*MEMORY[0x1E4F243A8];
    memcpy(v18, *(const void **)((char *)&self->super.super.isa + v19), 2 * v8);
    memcpy((char *)v18 + 2 * v8 + 2 * var1, *(char **)((char *)&self->super.super.isa + v19) + 2 * v8, 2 * v9);
    uint64_t v20 = (int)*MEMORY[0x1E4F24398];
    long long v36 = v16;
    memcpy(v16, *(const void **)((char *)&self->super.super.isa + v20), 16 * v8);
    memcpy((char *)v16 + 16 * v8 + 16 * var1, *(char **)((char *)&self->super.super.isa + v20) + 16 * v8, 16 * v9);
    uint64_t v21 = (NSZone *)(int)*MEMORY[0x1E4F243B0];
    memcpy(v17, *(const void **)((char *)v21 + (void)self), 4 * v8);
    memcpy(&v17[4 * v8 + 4 * var1], (const void *)(*(void *)((char *)v21 + (void)self) + 4 * v8), 4 * v9);
    uint64_t v22 = (int)*MEMORY[0x1E4F243B8];
    memcpy(v24, *(const void **)((char *)&self->super.super.isa + v22), 8 * v8);
    size_t v23 = 8 * v9;
    memcpy(&v24[8 * v8 + 8 * var1], *(char **)((char *)&self->super.super.isa + v22) + 8 * v8, v23);
    NSZoneFree(zone, *(void **)((char *)&self->super.super.isa + v20));
    int v37 = v19;
    *(Class *)((char *)&self->super.super.isa + v19) = v41;
    int v42 = v20;
    *(Class *)((char *)&self->super.super.isa + v20) = v36;
    *(void *)((char *)v21 + (void)self) = v17;
    *(Class *)((char *)&self->super.super.isa + v22) = (Class)v24;
    LODWORD(v24) = *MEMORY[0x1E4F24390];
    if (*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]))
    {
      BOOL v25 = (char *)NSZoneMalloc(zone, 8 * self->_bufferSize);
      memcpy(v25, *(const void **)((char *)&self->super.super.isa + (int)v24), 8 * v8);
      memcpy(&v25[8 * v8 + 8 * var1], *(char **)((char *)&self->super.super.isa + (int)v24) + 8 * v8, v23);
      NSZoneFree(zone, *(void **)((char *)&self->super.super.isa + (int)v24));
      *(Class *)((char *)&self->super.super.isa + (int)v24) = (Class)v25;
    }
    int v26 = v37;
    int64_t var0 = v38;
  }
  if (var1 >= 1)
  {
    uint64_t v30 = *(void *)((char *)v21 + (void)self);
    unint64_t v31 = (void *)(v30 + 4 * v8);
    uint64_t v32 = v30 + 4 * var0;
    unint64_t v33 = v30 + 4 * (var0 + var1) + 4;
    if (v33 <= v32 + 8) {
      unint64_t v33 = v32 + 8;
    }
    memset_pattern16(v31, &unk_18E5F7400, ((v33 - v32 - 5) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
  bzero(*(char **)((char *)&self->super.super.isa + v26) + 2 * v8, 2 * var1);
  bzero(*(char **)((char *)&self->super.super.isa + v42) + 16 * v8, 16 * var1);
  size_t v34 = 8 * var1;
  bzero(*(char **)((char *)&self->super.super.isa + (int)v22) + 8 * v8, v34);
  uint64_t v35 = *(uint64_t *)((char *)&self->super.super.isa + (int)v24);
  if (v35) {
    bzero((void *)(v35 + 8 * v8), v34);
  }
  *(_DWORD *)&self->_gFlags |= 0x11u;
}

- (void)initGlyphStack:(int64_t)a3
{
  if (self->_stack) {
    NSZoneFree((NSZone *)[(NSATSGlyphStorage *)self zone], self->_stack);
  }
  __int16 v5 = ($D420464EB917A5D1CA60E49AE1666B3F *)NSZoneMalloc((NSZone *)[(NSATSGlyphStorage *)self zone], (48 * a3) | 8);
  self->_stack = v5;
  v5->int64_t var0 = 0;
}

- (void)pushGlyph:(int64_t)a3
{
  stack = self->_stack;
  if (stack)
  {
    int64_t v4 = stack->var0++;
    __int16 v5 = stack + 6 * v4;
    uint64_t v6 = (int *)MEMORY[0x1E4F24398];
    v5->var1[0].int64_t var0 = (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]))[a3];
    v5->var1[0].int64_t var1 = (CGSize)(*(_OWORD **)((char *)&self->super.super.isa + *v6))[a3];
    uint64_t v7 = (int *)MEMORY[0x1E4F243B8];
    v5->var1[0].var2 = (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]))[a3] | 0x200000;
    v5->var1[0].int64_t var3 = *(void *)(*(int64_t *)((char *)&self->super.super.isa + *v7) + 8 * a3);
    int64_t v8 = *(int64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
    if (v8) {
      int64_t v8 = *(void *)(v8 + 8 * a3);
    }
    stack->var1[v4].var4 = v8;
  }
}

- (void)popGlyph:(int64_t)a3
{
  stack = self->_stack;
  if (stack)
  {
    uint64_t v4 = stack->var0 - 1;
    stack->int64_t var0 = v4;
    __int16 v5 = stack + 6 * v4;
    (*(_WORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243A8]))[a3] = v5->var1[0].var0;
    (*(_OWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24398]))[a3] = v5->var1[0].var1;
    (*(_DWORD **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B0]))[a3] = v5->var1[0].var2;
    (*($D420464EB917A5D1CA60E49AE1666B3F **)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F243B8]))[a3] = ($D420464EB917A5D1CA60E49AE1666B3F)v5->var1[0].var3;
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F24390]);
    if (v6) {
      *($D420464EB917A5D1CA60E49AE1666B3F *)(v6 + 8 * a3) = ($D420464EB917A5D1CA60E49AE1666B3F)stack->var1[v4].var4;
    }
    *(_DWORD *)&self->_gFlags |= 0x30u;
  }
}

- (void)disposeGlyphStack
{
  if (self->_stack)
  {
    NSZoneFree((NSZone *)[(NSATSGlyphStorage *)self zone], self->_stack);
    self->_stack = 0;
  }
}

@end