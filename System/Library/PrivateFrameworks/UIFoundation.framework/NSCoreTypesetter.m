@interface NSCoreTypesetter
+ (BOOL)_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing;
+ (void)_lineMetricsForAttributes:(id)a3 typesetterBehavior:(int64_t)a4 usesFontLeading:(BOOL)a5 applySpacings:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8 layoutOrientation:(int64_t)a9 lineHeight:(double *)a10 baselineOffset:(double *)a11 spacing:(double *)a12;
+ (void)_maximumAscentAndDescentForRuns:(__CFArray *)a3 ascender:(double *)a4 descender:(double *)a5;
+ (void)_minMaxPositionsForLineFragmentWithParagraphStyle:(id)a3 baseWidth:(double)a4 writingDirection:(int64_t)a5 isBeginningOfParagraph:(BOOL)a6 minPosition:(double *)a7 maxPosition:(double *)a8;
- ($1AB5FA073B851C12C2339EC22442E995)_getLineMetricsForRange:(_NSRange)a3 attributes:(id)a4 attributedString:(id)a5 applySpacing:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8;
- ($F08F7EC4C389A89376F473094BC6C9F8)_forcedLineBreakAfterIndex:(SEL)a3;
- (BOOL)_shouldShowLineBadges;
- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics;
- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics;
- (BOOL)breaksLinesForInteractiveText;
- (BOOL)enforcesMinimumTextLineFragment;
- (BOOL)isBeginningOfDocument;
- (BOOL)isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a3;
- (BOOL)limitsLayoutForSuspiciousContents;
- (BOOL)requiresCTLineRef;
- (BOOL)typographicBoundsIncludesLineFragmentPadding;
- (BOOL)usesDefaultHyphenation;
- (BOOL)wantsExtraLineFragment;
- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11;
- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(int64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6;
- (CGSize)textContainerSize;
- (NSArray)forcedLineBreaks;
- (NSArray)truncatedRanges;
- (NSCoreTypesetter)init;
- (NSCoreTypesetterDelegate)delegate;
- (NSDictionary)_extraLineFragmentAttributes;
- (NSTextAnimationKeyframe)keyframe;
- (_NSRange)characterRange;
- (__CTLine)_createLayoutLineFragmentStartingWithCharacterIndex:(int64_t *)a3 proposedLineFragmentRect:(CGRect *)a4 baseLineRef:(const __CTLine *)a5 range:(_NSRange)a6 paragraphStyle:(id)a7 paragraphArbitrator:(id)a8 lineBreakMode:(int64_t)a9 hasAttachments:(BOOL)a10 lineFragmentRect:(CGRect *)a11 glyphOrigin:(CGPoint *)a12 hyphenated:(BOOL *)a13 forcedClusterBreak:(BOOL *)a14;
- (__CTLine)_createLineRefForParentLineRef:(const __CTLine *)a3 range:(_NSRange)a4 availableWidth:(double)a5 offset:(double)a6 paragraphArbitrator:(id)a7 lineBreakMode:(int64_t)a8 hyphenated:(BOOL *)a9 forcedClusterBreak:(BOOL *)a10;
- (__CTRun)_truncationTokenRunRefWithContext:(id *)a3 token:(id)a4 attributes:(id)a5;
- (id)_paragraphStyleFromAttributes:(id)a3;
- (id)_truncationTokenForRange:(_NSRange *)a3 attributes:(id)a4 originalLineRef:(__CTLine *)a5;
- (id)laidOutLineFragment;
- (id)softHyphen;
- (id)validateLineBreakIndex;
- (int)_NSFastDrawString:(id)a3 length:(unint64_t)a4 attributes:(id)a5 paragraphStyle:(id)a6 typesetterBehavior:(int64_t)a7 lineBreakMode:(int64_t)a8 rect:(CGRect)a9 padding:(double)a10 graphicsContext:(id)a11 baselineRendering:(BOOL)a12 usesFontLeading:(BOOL)a13 usesScreenFont:(BOOL)a14 scrollable:(BOOL)a15 syncAlignment:(BOOL)a16 mirrored:(BOOL)a17 boundingRectPointer:(CGRect *)a18 baselineOffsetPointer:(double *)a19 drawingContext:(id)a20;
- (int64_t)_getFirstOverflowTabStopIndexInLineRef:(__CTLine *)a3 range:(_NSRange)a4 string:(id)a5 paragraphStyle:(id)a6 availableWidth:(double)a7 offset:(double)a8;
- (int64_t)containerBreakMode;
- (int64_t)layoutOrientation;
- (int64_t)maximumNumberOfLines;
- (void)dealloc;
- (void)layout;
- (void)layoutWithYOrigin:(double)a3;
- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3;
- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3;
- (void)setBeginningOfDocument:(BOOL)a3;
- (void)setBreaksLinesForInteractiveText:(BOOL)a3;
- (void)setCharacterRange:(_NSRange)a3;
- (void)setContainerBreakMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnforcesMinimumTextLineFragment:(BOOL)a3;
- (void)setForcedLineBreaks:(id)a3;
- (void)setKeyframe:(id)a3;
- (void)setLaidOutLineFragment:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3;
- (void)setMaximumNumberOfLines:(int64_t)a3;
- (void)setRequiresCTLineRef:(BOOL)a3;
- (void)setTextContainerSize:(CGSize)a3;
- (void)setTypographicBoundsIncludesLineFragmentPadding:(BOOL)a3;
- (void)setUsesDefaultHyphenation:(BOOL)a3;
- (void)setValidateLineBreakIndex:(id)a3;
- (void)setWantsExtraLineFragment:(BOOL)a3;
- (void)set_extraLineFragmentAttributes:(id)a3;
@end

@implementation NSCoreTypesetter

- (int)_NSFastDrawString:(id)a3 length:(unint64_t)a4 attributes:(id)a5 paragraphStyle:(id)a6 typesetterBehavior:(int64_t)a7 lineBreakMode:(int64_t)a8 rect:(CGRect)a9 padding:(double)a10 graphicsContext:(id)a11 baselineRendering:(BOOL)a12 usesFontLeading:(BOOL)a13 usesScreenFont:(BOOL)a14 scrollable:(BOOL)a15 syncAlignment:(BOOL)a16 mirrored:(BOOL)a17 boundingRectPointer:(CGRect *)a18 baselineOffsetPointer:(double *)a19 drawingContext:(id)a20
{
  v20 = (unsigned char *)MEMORY[0x1F4188790](self, a2, a3, a4, a5, a6, a7, a8, (__n128)a9.origin, *(__n128 *)&a9.origin.y, (__n128)a9.size, *(__n128 *)&a9.size.height, a10);
  uint64_t v283 = v21;
  v23 = v22;
  v25 = v24;
  unint64_t v27 = v26;
  theString = v28;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  uint64_t v40 = v39;
  v41 = v20;
  v313[128] = *MEMORY[0x1E4F143B8];
  uint64_t v42 = [v20 laidOutLineFragment];
  unint64_t v43 = [v25 count];
  uint64_t v281 = [v41 applicationFrameworkContext];
  uint64_t v44 = [v25 objectForKey:@"NSColor"];
  v45 = (void *)[v25 objectForKey:@"NSShadow"];
  v46 = v45;
  v282 = (void *)v44;
  uint64_t v47 = 1;
  if (v44) {
    uint64_t v47 = 2;
  }
  if (v45) {
    uint64_t v48 = v47;
  }
  else {
    uint64_t v48 = v44 != 0;
  }
  if ([v45 shadowColor]) {
    v49 = v46;
  }
  else {
    v49 = 0;
  }
  v284 = v49;
  v50 = (void *)[a20 layout];
  uint64_t v310 = 0;
  v309 = 0;
  v308 = 0;
  double v307 = 0.0;
  v306 = 0;
  uint64_t v305 = 0;
  if (-[_NSCoreTypesetterLayoutCache getCount:glyphs:advances:elasticAdvances:resolvedFont:textAlignment:]((uint64_t)v50, &v310, &v309, &v308, &v307, (CFTypeRef *)&v306, &v305))
  {
    if (v42) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v40, v41, @"NSCoreTypesetter.m", 1314, @"NSStringDrawingContext not supported when generating NSTextLineFragments");
    }
    if (!v309 || !v308 || !v306) {
      -[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:]();
    }
    uint64_t v51 = 0;
    goto LABEL_16;
  }
  uint64_t v279 = v42;
  if ([v25 objectForKey:*MEMORY[0x1E4F24368]]) {
    return 0;
  }
  uint64_t v66 = [v25 objectForKey:@"NSFont"];
  if (v66)
  {
    v67 = (void *)v66;
    ++v48;
  }
  else
  {
    v67 = NSDefaultFont();
  }
  [v67 pointSize];
  if (v85 < 8.0) {
    return 0;
  }
  uint64_t v86 = [v25 objectForKey:@"NSOriginalFont"];
  if (v86)
  {
    if (v67 != (void *)v86) {
      return 0;
    }
    ++v48;
  }
  unint64_t v276 = v27;
  if (v281 == 2 && a14) {
    v67 = (void *)[v67 screenFontWithRenderingMode:0];
  }
  uint64_t v87 = [v25 objectForKey:@"NSKern"];
  if (!v87 || (v88 = (void *)v87, v87 == [MEMORY[0x1E4F1CA98] null]))
  {
    BOOL v90 = 0;
  }
  else
  {
    [v88 floatValue];
    BOOL v90 = v89 == 0.0;
    if (v89 == 0.0) {
      ++v48;
    }
  }
  v94 = (void *)[v25 objectForKey:@"NSLigature"];
  if (v94)
  {
    int v95 = [v94 intValue];
    BOOL v264 = v95 == 0;
    if (!v95) {
      ++v48;
    }
  }
  else
  {
    BOOL v264 = 0;
  }
  uint64_t v304 = 0;
  v99 = v23;
  if (!v23) {
    v99 = +[NSParagraphStyle defaultParagraphStyle];
  }
  if (![(NSParagraphStyle *)v99 _isSuitableForFastStringDrawingWithAlignment:&v304 mirrorsTextAlignment:a17 lineBreakMode:0 tighteningFactorForTruncation:0])return 0; {
  BOOL v260 = v90;
  }
  v272 = v23;
  if ([v25 objectForKey:@"NSParagraphStyle"]) {
    unint64_t v100 = v48 + 1;
  }
  else {
    unint64_t v100 = v48;
  }
  if (a16
    && (unint64_t)(v304 - 3) <= 1
    && [(NSParagraphStyle *)v23 baseWritingDirection] == NSWritingDirectionNatural)
  {
    uint64_t v304 = 2 * ([(NSParagraphStyle *)v23 horizontalAlignment] == 1);
  }
  unint64_t v101 = v276;
  if ([v41 laidOutLineFragment]
    && [v25 objectForKeyedSubscript:@"NSBackgroundColor"])
  {
    ++v100;
  }
  if ([v25 objectForKey:*MEMORY[0x1E4F284F8]]) {
    ++v100;
  }
  if (v100 < v43)
  {
    uint64_t v102 = 0;
    v312[0] = NSCursorAttributeName;
    v312[1] = NSToolTipAttributeName;
    v312[2] = NSMarkedClauseSegmentAttributeName;
    do
    {
      if ([v25 objectForKey:v312[v102]])
      {
        if (++v100 >= v43) {
          break;
        }
      }
      ++v102;
    }
    while (v102 != 3);
    v23 = v272;
  }
  uint64_t v303 = 0;
  uint64_t v302 = 0;
  if (v43 != v100 || ![v67 _getLatin1Glyphs:&v303 advanceWidths:&v302]) {
    return 0;
  }
  long long v299 = 0uLL;
  long long v297 = 0u;
  long long v295 = 0u;
  long long v296 = 0u;
  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  long long v289 = 0u;
  *(_OWORD *)buffer = 0u;
  *(_OWORD *)theSet = 0u;
  v298[0] = theString;
  uint64_t v301 = 0;
  long long v300 = v276;
  CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v298[1] = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  }
  uint64_t v252 = 0;
  CTFontRef font = (CTFontRef)v67;
  uint64_t v106 = 0;
  unint64_t v278 = 0;
  uint64_t v301 = 0;
  v107 = v312;
  v108 = (CGGlyph *)v313;
  *(void *)&long long v299 = CStringPtr;
  *((void *)&v300 + 1) = 0;
  while (2)
  {
    uint64_t v109 = v300;
    if ((uint64_t)v300 <= v106) {
      break;
    }
    uint64_t v110 = -v106;
    uint64_t v111 = 2 * v106 + 2;
    unint64_t v112 = v106 + 1;
    uint64_t v113 = ~v106;
    uint64_t v114 = v106 + 65;
    uint64_t v115 = v106 + 64;
    v116 = (_OWORD *)MEMORY[0x1E4F28AE0];
    while (1)
    {
      if (v298[1])
      {
        UniChar v117 = *((_WORD *)&v298[1]->isa + *((void *)&v299 + 1) + v106);
      }
      else if ((void)v299)
      {
        UniChar v117 = *(char *)(v299 + *((void *)&v299 + 1) + v106);
      }
      else
      {
        v118 = v107;
        uint64_t v119 = *((void *)&v300 + 1);
        if (v301 <= v106 || *((void *)&v300 + 1) > v106)
        {
          uint64_t v121 = v106 - 4;
          if ((unint64_t)v106 < 4) {
            uint64_t v121 = 0;
          }
          if (v121 + 64 < v109) {
            uint64_t v109 = v121 + 64;
          }
          *((void *)&v300 + 1) = v121;
          uint64_t v301 = v109;
          uint64_t v273 = v106;
          uint64_t v254 = v110;
          uint64_t v262 = v115;
          v314.location = *((void *)&v299 + 1) + v121;
          v314.length = v109 - v121;
          v122 = v108;
          CFStringGetCharacters(v298[0], v314, buffer);
          uint64_t v115 = v262;
          uint64_t v110 = v254;
          uint64_t v106 = v273;
          v108 = v122;
          uint64_t v119 = *((void *)&v300 + 1);
        }
        UniChar v117 = buffer[v106 - v119];
        v107 = v118;
        v116 = (_OWORD *)MEMORY[0x1E4F28AE0];
      }
      if (!v117)
      {
LABEL_339:
        v23 = v272;
        unint64_t v101 = v276;
        v67 = font;
        goto LABEL_340;
      }
      if (v117 > 0xFFu)
      {
        v251 = v107;
        glyphs = v108;
        uint64_t v263 = v115;
        uint64_t v255 = v110;
        if (!v252)
        {
          uint64_t v123 = v106;
          uint64_t v252 = [(__CTFont *)font coveredCharacterSet];
          if (!v252) {
            return 0;
          }
          CFCharacterSetInitInlineBuffer();
          uint64_t v106 = v123;
          uint64_t v110 = v255;
        }
        uint64_t v124 = 0;
        unint64_t v125 = 0;
        uint64_t v126 = -16;
        uint64_t v127 = 1;
        while (1)
        {
          unint64_t v128 = v125;
          uint64_t v129 = v126;
          uint64_t v274 = v124;
          uint64_t v130 = v112 >= 4 ? 4 : v112;
          unint64_t v131 = v117;
          unsigned int v132 = (uint64_t)theSet[1] & 4;
          BOOL v133 = HIDWORD(theSet[1]) <= v117 && v289 > v117;
          uint64_t v268 = v127;
          uint64_t v270 = v129;
          uint64_t v266 = v111;
          uint64_t v258 = v130;
          if (v133)
          {
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              unint64_t v134 = v125;
              uint64_t v135 = v110;
              uint64_t v136 = v106;
              __int16 v256 = v131;
              int IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(theSet[0], v131);
              LOWORD(v131) = v256;
              if (!IsLongCharacterMember) {
                return 0;
              }
            }
            else if (*((void *)&v289 + 1))
            {
              if ((uint64_t)theSet[1])
              {
                unsigned int v144 = v132 >> 2;
                uint64_t v145 = *(unsigned __int8 *)(*((void *)&v289 + 1) + ((unint64_t)v117 >> 8));
                if (*(unsigned char *)(*((void *)&v289 + 1) + ((unint64_t)v117 >> 8)))
                {
                  unint64_t v134 = v128;
                  uint64_t v135 = v110;
                  uint64_t v136 = v106;
                  if (v145 == 255)
                  {
                    unsigned int v144 = v132 == 0;
                  }
                  else
                  {
                    BOOL v146 = v132 == 0;
                    if ((*(unsigned __int8 *)(*((void *)&v289 + 1) + 32 * v145 + (v131 >> 3) + 224) >> (v131 & 7))) {
                      unsigned int v144 = v146;
                    }
                  }
                }
                else
                {
                  unint64_t v134 = v128;
                  uint64_t v135 = v110;
                  uint64_t v136 = v106;
                }
                if (!v144) {
                  return 0;
                }
              }
              else
              {
                unint64_t v134 = v125;
                uint64_t v135 = v110;
                uint64_t v136 = v106;
                BOOL v137 = v132 != 0;
                BOOL v138 = v132 == 0;
                if ((*(unsigned __int8 *)(*((void *)&v289 + 1) + (v131 >> 3)) >> (v131 & 7))) {
                  BOOL v137 = v138;
                }
                if (!v137) {
                  return 0;
                }
              }
            }
            else
            {
              unint64_t v134 = v125;
              uint64_t v135 = v110;
              uint64_t v136 = v106;
              BOOL v140 = v132 == 0;
              BOOL v141 = v132 != 0;
              char v142 = v140;
              if ((uint64_t)theSet[1]) {
                char v143 = v141;
              }
              else {
                char v143 = v142;
              }
              if ((v143 & 1) == 0) {
                return 0;
              }
            }
          }
          else
          {
            unint64_t v134 = v125;
            uint64_t v135 = v110;
            uint64_t v136 = v106;
            if (((uint64_t)theSet[1] & 4) == 0) {
              return 0;
            }
          }
          if (_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__once != -1)
          {
            __int16 v257 = v131;
            dispatch_once(&_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__once, &__block_literal_global_66);
            LOWORD(v131) = v257;
          }
          int IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__whitespaceCharacterSet, v131);
          v148 = glyphs;
          uint64_t v149 = v274;
          v150 = (char *)glyphs + v274;
          if (v278) {
            v150 = (char *)v278;
          }
          v151 = IsCharacterMember ? v150 : 0;
          uint64_t v106 = v136;
          unint64_t v152 = v134;
          uint64_t v153 = v136 + v134 + 1;
          uint64_t v154 = v300;
          unint64_t v278 = (unint64_t)v151;
          if ((uint64_t)v300 <= v153) {
            break;
          }
          uint64_t v155 = v268;
          uint64_t v156 = v270;
          uint64_t v110 = v135;
          uint64_t v157 = v263;
          uint64_t v158 = v266;
          if (v298[1])
          {
            UniChar v117 = *((_WORD *)&v298[1]->isa + v136 + v134 + *((void *)&v299 + 1) + 1);
          }
          else if ((void)v299)
          {
            UniChar v117 = *(char *)(v299 + *((void *)&v299 + 1) + v136 + v134 + 1);
          }
          else
          {
            if (v301 <= v153 || (uint64_t v159 = *((void *)&v300 + 1), *((uint64_t *)&v300 + 1) > v153))
            {
              unint64_t v160 = v134 + v136 - v258;
              unint64_t v161 = v160 + 1;
              uint64_t v162 = v160 + 65;
              if (v162 >= (uint64_t)v300) {
                uint64_t v162 = v300;
              }
              *((void *)&v300 + 1) = v161;
              uint64_t v301 = v162;
              if ((uint64_t)v300 >= v114 - v258) {
                uint64_t v154 = v114 - v258;
              }
              v315.length = v154 + v258 + v113;
              v315.location = v136 + v134 + 1 - v258 + *((void *)&v299 + 1);
              CFStringGetCharacters(v298[0], v315, buffer);
              unint64_t v152 = v134;
              uint64_t v157 = v263;
              uint64_t v110 = v255;
              uint64_t v149 = v274;
              uint64_t v155 = v268;
              uint64_t v156 = v270;
              uint64_t v106 = v136;
              uint64_t v158 = v266;
              uint64_t v159 = *((void *)&v300 + 1);
            }
            UniChar v117 = *(UniChar *)((char *)buffer + v158 + -2 * v159);
          }
          uint64_t v126 = v156 - 16;
          uint64_t v124 = v149 + 2;
          uint64_t v127 = v155 + 1;
          uint64_t v111 = v158 + 2;
          ++v112;
          --v113;
          ++v114;
          unint64_t v125 = v152 + 1;
          if (v117 <= 0xFFu)
          {
            uint64_t v154 = v300;
            v148 = glyphs;
            goto LABEL_201;
          }
        }
        uint64_t v157 = v263;
        uint64_t v158 = v266;
        uint64_t v155 = v268;
LABEL_201:
        uint64_t v163 = v155;
        CFIndex v164 = v152 + 1;
        uint64_t v165 = v152 + 1 + v106;
        v67 = font;
        if (v165 <= v154)
        {
          v23 = v272;
          if (v298[1])
          {
            v166 = (const UniChar *)v298[1] + *((void *)&v299 + 1) + v106;
LABEL_255:
            CFIndex v193 = v164;
            CFIndex v194 = v164;
            v195 = v148;
            CTFontGetGlyphsForCharacters(font, v166, v148, v193);
            [(__CTFont *)font getAdvancements:v251 forCGGlyphs:v195 count:v194];
            v108 = (CGGlyph *)((char *)v195 + v274 + 2);
            v107 = (_OWORD *)((char *)v251 - v270);
            unint64_t v101 = v276;
            goto LABEL_256;
          }
          uint64_t v175 = *((void *)&v300 + 1);
          uint64_t v176 = v301;
          if (v152 <= 0x3F)
          {
            v23 = v272;
            if (v165 > v301 || v106 < *((uint64_t *)&v300 + 1))
            {
              unint64_t v184 = v152 + 1;
              uint64_t v185 = v106 + 64;
              if (v106 + 64 >= v154) {
                uint64_t v185 = v154;
              }
              *((void *)&v300 + 1) = v106;
              uint64_t v301 = v185;
              v186.length = v185 - v106;
              if ((void)v299)
              {
                if (v186.length)
                {
                  uint64_t v187 = v299 + *((void *)&v299 + 1);
                  if (v154 >= v157) {
                    uint64_t v154 = v157;
                  }
                  v188 = buffer;
                  do
                  {
                    *v188++ = *(char *)(v187 + v106);
                    ++v187;
                    --v154;
                  }
                  while (v106 != v154);
                }
              }
              else
              {
                v186.location = *((void *)&v299 + 1) + v106;
                uint64_t v192 = v106;
                CFStringGetCharacters(v298[0], v186, buffer);
                uint64_t v106 = v192;
                CFIndex v164 = v184;
              }
            }
            v166 = &buffer[v106 - *((void *)&v300 + 1)];
            goto LABEL_254;
          }
        }
        else
        {
          v23 = v272;
          if (v298[1])
          {
            v166 = v311;
            __memmove_chk();
LABEL_254:
            v148 = glyphs;
            goto LABEL_255;
          }
          uint64_t v175 = *((void *)&v300 + 1);
          uint64_t v176 = v301;
        }
        unint64_t v259 = v152 + 1;
        if (v106 < v175 || v176 <= v106)
        {
          v180 = v311;
          if (v165 <= v175 || v165 >= v176)
          {
            CFIndex v182 = v152 + 1;
            v23 = v272;
            goto LABEL_245;
          }
          CFIndex v182 = v175 - v106;
          v180 = v311;
          uint64_t v183 = v106;
          memmove(&v311[v175 - v106], buffer, v158 - 2 * v175);
          uint64_t v106 = v183;
        }
        else
        {
          if (v164 >= v176 - v106) {
            unint64_t v177 = v176 - v106;
          }
          else {
            unint64_t v177 = v152 + 1;
          }
          uint64_t v178 = v106;
          unint64_t v267 = v152;
          __memmove_chk();
          uint64_t v179 = v178;
          v180 = &v311[v177];
          uint64_t v106 = v177 + v179;
          uint64_t v181 = v176 + v255;
          if (v163 < v176 + v255) {
            uint64_t v181 = v163;
          }
          CFIndex v182 = v267 - v181 + 1;
        }
        v23 = v272;
        v148 = glyphs;
        if (v182 < 1)
        {
LABEL_251:
          v166 = v311;
          CFIndex v164 = v259;
          goto LABEL_255;
        }
LABEL_245:
        v189.location = *((void *)&v299 + 1) + v106;
        if ((void)v299)
        {
          if (v182)
          {
            v190 = (char *)(v299 + v189.location);
            do
            {
              UniChar v191 = *v190++;
              *v180++ = v191;
              --v182;
            }
            while (v182);
          }
        }
        else
        {
          v189.length = v182;
          CFStringGetCharacters(v298[0], v189, v180);
          v148 = glyphs;
        }
        goto LABEL_251;
      }
      if ((v117 & 0xFF60) != 0 && v117 != 173 && v117 != 127) {
        break;
      }
      if (v279)
      {
        *v107++ = *v116;
        *v108++ = -1;
      }
      ++v106;
      uint64_t v109 = v300;
      --v110;
      v111 += 2;
      ++v112;
      --v113;
      ++v114;
      ++v115;
      if ((uint64_t)v300 <= v106) {
        goto LABEL_339;
      }
    }
    v167 = v107;
    if (v117 == 160) {
      unsigned __int16 v168 = 32;
    }
    else {
      unsigned __int16 v168 = v117;
    }
    uint64_t v169 = -64;
    if ((v168 & 0xFF80) == 0) {
      uint64_t v169 = -32;
    }
    uint64_t v170 = v169 + v168;
    int v171 = *(unsigned __int16 *)(v303 + 2 * v170);
    CGGlyph *v108 = v171;
    v23 = v272;
    unint64_t v101 = v276;
    v67 = font;
    if (!v171) {
      return 0;
    }
    uint64_t v172 = *(void *)(v302 + 8 * v170);
    v173 = (CGGlyph *)v278;
    if (!v278) {
      v173 = v108;
    }
    void *v167 = v172;
    v167[1] = 0;
    if (v168 == 32) {
      v174 = v173;
    }
    else {
      v174 = 0;
    }
    unint64_t v278 = (unint64_t)v174;
    uint64_t v165 = v106 + 1;
    ++v108;
    v107 = v167 + 2;
LABEL_256:
    uint64_t v106 = v165;
    if ((v165 & 0x8000000000000000) == 0) {
      continue;
    }
    break;
  }
LABEL_340:
  if (!v260 || !v264)
  {
    v239 = v108;
    CTFontTransformGlyphsWithLanguage();
    v108 = v239;
    if (v240 != 0.0) {
      return 0;
    }
  }
  uint64_t v51 = 0;
  double v241 = 0.0;
  if (v278)
  {
    unint64_t v242 = v101;
    if (v278 < (unint64_t)v108)
    {
      uint64_t v51 = (uint64_t)((uint64_t)v108 - v278) >> 1;
      v243 = v108;
      [v67 _totalAdvancementForNativeGlyphs:v278 count:v51];
      v108 = v243;
      double v241 = v244;
    }
  }
  else
  {
    unint64_t v242 = v101;
  }
  if (v278) {
    v245 = (CGGlyph *)v278;
  }
  else {
    v245 = v108;
  }
  size_t v246 = ((char *)v245 - (char *)v313) >> 1;
  uint64_t v310 = v246;
  v309 = v313;
  v308 = (double *)v312;
  double v307 = v241;
  v306 = v67;
  v247 = (void *)v304;
  uint64_t v305 = v304;
  if ([a20 cachesLayout])
  {
    if (v50)
    {
      v248 = v50;
    }
    else
    {
      v248 = objc_alloc_init(_NSCoreTypesetterLayoutCache);
      [a20 setLayout:v248];
    }
    -[_NSCoreTypesetterLayoutCache setCount:glyphs:advances:elasticAdvances:resolvedFont:textAlignment:]((void **)&v248->super.isa, v246, v313, v312, v67, v247, v241);
  }
  unint64_t v27 = v242;
  uint64_t v42 = v279;
LABEL_16:
  v52 = a18;
  uint64_t v53 = [v41 isBeginningOfDocument] ^ 1;
  LOBYTE(v249) = [v41 isBeginningOfDocument] ^ 1;
  objc_msgSend(v41, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v25, 0, v53, 0, v249);
  double v55 = v54;
  double v277 = v56;
  double v58 = v57;
  if (([v41 isSimpleRectangularTextContainerForStartingCharacterAtIndex:0] & 1) == 0)
  {
    objc_msgSend(v41, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, 0, 0, v38, v36 + v58, 10000000.0, v55);
    double v38 = v59;
    double v36 = v60;
    double v62 = v61;
    double v32 = v63;
    [v41 lineFragmentPadding];
    double v34 = v62 + v64 * -2.0;
    double v58 = 0.0;
  }
  if (v42 && v32 > 0.0 && ([v41 enforcesMinimumTextLineFragment] & 1) == 0 && v55 > v32)
  {
    CGSize v65 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
    a18->origin = (CGPoint)*MEMORY[0x1E4F28AD8];
    a18->size = v65;
    return 2;
  }
  unint64_t v275 = v27;
  v271 = v23;
  v68 = v308;
  uint64_t v69 = v310;
  v70 = &v308[2 * v310];
  double v71 = 0.0;
  if (v310 < 1)
  {
    v72 = v308;
  }
  else
  {
    v72 = v308;
    if (v34 >= 0.0)
    {
      v72 = v308;
      do
      {
        double v73 = *v72;
        v72 += 2;
        double v71 = v71 + v73;
      }
      while (v72 < v70 && v71 <= v34);
    }
  }
  if (!a11)
  {
    if (v305 == 2)
    {
      double v81 = v38 + v34 - v71;
      unint64_t v80 = v275;
    }
    else
    {
      unint64_t v80 = v275;
      if (v305 == 1) {
        double v81 = v38 + (v34 - v71) * 0.5;
      }
      else {
        double v81 = v38;
      }
    }
    goto LABEL_291;
  }
  uint64_t v269 = v51;
  if (v42) {
    -[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:]();
  }
  v75 = (CGContext *)[a11 CGContext];
  int v76 = [a11 isFlipped];
  int v77 = v76;
  if (v34 <= 0.0)
  {
    double v265 = v58;
    double v82 = v55;
    char v83 = 0;
    double v84 = v38;
    v78 = v284;
    goto LABEL_108;
  }
  v78 = v284;
  if (a15 && v305)
  {
    while (v72 < v70)
    {
      double v79 = *v72;
      v72 += 2;
      double v71 = v71 + v79;
    }
    double v92 = 40000.0 - v71;
    if (v305 == 1)
    {
      double v92 = v92 * 0.5;
      if (v71 + v307 <= v34)
      {
        double v265 = v58;
        double v82 = v55;
        char v83 = 0;
        double v93 = (v34 - (v71 + v307)) * 0.5;
        goto LABEL_105;
      }
LABEL_80:
      if (v283 == 2)
      {
        double v265 = v58;
        double v82 = v55;
        uint64_t v69 = ((char *)v72 - (char *)v68) >> 4;
        double v98 = -v92;
        char v83 = 1;
        goto LABEL_106;
      }
      return 1;
    }
    if (v71 > v34) {
      goto LABEL_80;
    }
    double v265 = v58;
    double v82 = v55;
    char v83 = 0;
    double v93 = v34 - v71;
LABEL_105:
    double v98 = v93 - v92;
LABEL_106:
    double v103 = v92 + floor(v98);
LABEL_107:
    double v84 = v38 + v103;
    goto LABEL_108;
  }
  if (v71 <= v34)
  {
    double v265 = v58;
    double v82 = v55;
    double v96 = v34 - v71;
    if (v305 == 1)
    {
      char v83 = 0;
      double v103 = v96 * 0.5;
      goto LABEL_107;
    }
    double v97 = v38 + v96;
    if (v305 == 2) {
      double v84 = v97;
    }
    else {
      double v84 = v38;
    }
    char v83 = 0;
LABEL_108:
    if (!a12) {
      goto LABEL_260;
    }
    double v91 = v36;
    if ((v83 & 1) == 0)
    {
      double v91 = v36;
      goto LABEL_271;
    }
    goto LABEL_275;
  }
  if (v283 != 2) {
    return 1;
  }
  double v265 = v58;
  double v82 = v55;
  uint64_t v69 = ((char *)v72 - (char *)v68) >> 4;
  if (a12)
  {
    double v91 = v36;
    double v84 = v38;
    goto LABEL_275;
  }
  char v83 = 1;
  double v84 = v38;
LABEL_260:
  if (v32 > 0.0) {
    double v196 = v32;
  }
  else {
    double v196 = v82;
  }
  double v197 = v196 - v277;
  if (v76) {
    double v197 = v277;
  }
  double v198 = v32;
  BOOL v199 = v82 <= v32 || v32 <= 0.0;
  double v91 = v36 + v197;
  if (!v199 || (v83 & 1) != 0)
  {
    if (v198 > 0.0)
    {
LABEL_278:
      CGContextSaveGState(v75);
      v316.origin.x = v38 - v30;
      v316.origin.y = v36;
      v316.size.width = v34 + v30 * 2.0;
      v316.size.height = v198;
      CGContextClipToRect(v75, v316);
      char v200 = 1;
      goto LABEL_279;
    }
LABEL_275:
    [v306 boundingRectForFont];
    double v198 = v202;
    double v203 = -(v201 + v202);
    if (!v77) {
      double v203 = v201;
    }
    double v36 = v36 + v203;
    goto LABEL_278;
  }
LABEL_271:
  if (v78) {
    CGContextSaveGState(v75);
  }
  char v200 = 0;
LABEL_279:
  double v81 = v84;
  CGContextGetFontRenderingStyle();
  [v306 applyToGraphicsContext:a11];
  v204 = v282;
  double v55 = v82;
  double v58 = v265;
  if (!v282)
  {
    if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
    {
      v205 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v281];
    }
    else
    {
      v205 = +[NSTextGraphicsContextProvider __defaultColorClass];
    }
    v204 = (void *)[(objc_class *)v205 blackColor];
    v78 = v284;
  }
  [v204 set];
  CGContextSetCharacterSpacing(v75, 0.0);
  if (v78) {
    [v78 applyToGraphicsContext:a11];
  }
  CGContextSetTextPosition(v75, v81, v91);
  CTFontDrawGlyphsWithAdvances();
  CGContextSetFontRenderingStyle();
  char v206 = v200 ^ 1;
  if (v78) {
    char v206 = 0;
  }
  if ((v206 & 1) == 0) {
    CGContextRestoreGState(v75);
  }
  unint64_t v80 = v275;
  uint64_t v42 = 0;
  v52 = a18;
  uint64_t v51 = v269;
LABEL_291:
  if ((unint64_t)v52 | v42)
  {
    double v207 = 0.0;
    if (v69)
    {
      v208 = v68;
      uint64_t v209 = v69;
      do
      {
        double v210 = *v208;
        v208 += 2;
        double v207 = v207 + v210;
        --v209;
      }
      while (v209);
    }
    if (v283 != 2 && !a11 && v34 != 0.0 && v207 > v34 + 0.001) {
      return 1;
    }
    double v212 = 0.0;
    if (v41[57])
    {
      [v41 lineFragmentPadding];
      double v212 = v213;
    }
    if (a12) {
      double v214 = v277 - v55;
    }
    else {
      double v214 = v58;
    }
    double v215 = v207 + v307;
    if (v207 + v307 <= v34 || v34 <= 0.0) {
      double v217 = v207 + v307;
    }
    else {
      double v217 = v34;
    }
    if (v42)
    {
      if (v41[50])
      {
        v218 = theString;
        BOOL v219 = [(__CFString *)theString length] > v80;
      }
      else
      {
        BOOL v219 = 0;
        v218 = theString;
      }
      uint64_t v220 = [(__CFString *)v218 length];
      uint64_t v221 = [v41 applicationFrameworkContext];
      v286[0] = MEMORY[0x1E4F143A8];
      v286[1] = 3221225472;
      v286[2] = __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_2;
      v286[3] = &unk_1E55C7688;
      v286[6] = v68;
      v286[7] = v69;
      v286[8] = v51;
      v286[9] = v306;
      v286[4] = v41;
      v286[5] = v309;
      BOOL v287 = v219;
      __NSCoreTypesetterProcessTextLineFragment(0, (uint64_t)v218, (uint64_t)v25, 0, v220, v221, (uint64_t)v286, 0.0, v277, v81 + 0.0, v214, v217, v55, v212);
      if (v219)
      {
        double v222 = *MEMORY[0x1E4F28AD0];
        double v223 = v34 * 0.5 + *MEMORY[0x1E4F28AD0];
        if (v305 == 2) {
          double v222 = v34 + *MEMORY[0x1E4F28AD0];
        }
        if (v305 == 1) {
          double v224 = v34 * 0.5 + *MEMORY[0x1E4F28AD0];
        }
        else {
          double v224 = v222;
        }
        v225 = objc_msgSend(v41, "_extraLineFragmentAttributes", v222, v223);
        double v226 = 0.0;
        v227 = v271;
        if (v271)
        {
          [(NSParagraphStyle *)v271 paragraphSpacing];
          double v226 = v228;
        }
        if ([v225 count])
        {
          LOBYTE(v250) = 0;
          objc_msgSend(v41, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v225, 0, 0, 0, v250);
          double v230 = v229;
          double v232 = v231;
          v227 = (NSParagraphStyle *)[v41 _paragraphStyleFromAttributes:v225];
        }
        else
        {
          double v232 = 0.0;
          double v230 = v55;
        }
        double v233 = v55 + v214;
        if (v227)
        {
          [(NSParagraphStyle *)v227 lineSpacing];
          double v235 = v232 + v234;
          if (v234 >= 0.0) {
            double v235 = v232;
          }
          if (v234 <= v232) {
            double v232 = v235;
          }
          else {
            double v232 = v234;
          }
          [(NSParagraphStyle *)v227 paragraphSpacingBefore];
          double v233 = v233 + v236;
        }
        uint64_t v237 = [(__CFString *)theString length];
        uint64_t v238 = [v41 applicationFrameworkContext];
        v285[0] = MEMORY[0x1E4F143A8];
        v285[1] = 3221225472;
        v285[2] = __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_3;
        v285[3] = &unk_1E55C7638;
        v285[4] = v41;
        __NSCoreTypesetterProcessTextLineFragment(0, (uint64_t)theString, (uint64_t)v25, v237, 0, v238, (uint64_t)v285, 0.0, v277, v224, v233 + v226 + v232, 0.0, v230, v212);
      }
    }
    else if (v52)
    {
      v52->origin.x = 0.0;
      v52->origin.y = v214;
      v52->size.width = v217;
      v52->size.height = v55;
    }
  }
  if (a19) {
    *a19 = v277;
  }
  return 2;
}

- (id)laidOutLineFragment
{
  return objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isBeginningOfDocument
{
  return self->_beginningOfDocument;
}

void *__131__NSCoreTypesetter__getLineMetricsForRange_attributes_attributedString_applySpacing_usesSystemFontLeading_usesNegativeFontLeading___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 88)
    || (result = (void *)[a2 objectForKeyedSubscript:@"NSAttachment"]) == 0)
  {
    if (!a2) {
      goto LABEL_11;
    }
    if (*(unsigned char *)(a1 + 89) || (v4 = (void *)[a2 objectForKey:_NSOriginalFontAttributeName]) == 0) {
      v4 = (void *)[a2 objectForKey:@"NSFont"];
    }
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
      v4 = (void *)[v4 verticalFont];
    }
    if (!v4) {
LABEL_11:
    }
      v4 = NSDefaultFont();
    uint64_t v6 = (uint64_t)v4;
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v6 = [v4 verticalFont];
    }
    if (v6) {
      v4 = (void *)v6;
    }
    if (!v4) {
      v4 = NSDefaultFont();
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [objc_loadWeak((id *)(a1 + 64)) _paragraphStyleFromAttributes:a2];
    }
    [v4 _defaultLineHeightForUILayout];
    double v7 = 0.0;
    double v9 = v8 + 0.0;
    [v4 ascender];
    double v11 = v10;
    if (*(unsigned char *)(a1 + 92) && ([v4 isVertical] & 1) == 0) {
      double v11 = floor(v9 * 0.5);
    }
    result = (void *)[a2 objectForKeyedSubscript:@"NSBaselineOffset"];
    if (result)
    {
      result = (void *)[result doubleValue];
      double v7 = v12 + 0.0;
    }
    if (*(unsigned char *)(a1 + 91) || *(unsigned char *)(a1 + 93) || *(unsigned char *)(a1 + 94))
    {
      if (*(unsigned char *)(a1 + 94) || (result = (void *)CTFontIsSystemUIFont(), double v12 = 0.0, result))
      {
        result = objc_msgSend(v4, "_leading", v12);
        if (*(unsigned char *)(a1 + 93))
        {
          if (!*(unsigned char *)(a1 + 91) && v12 > 0.0 && *(unsigned char *)(a1 + 94) == 0) {
            double v12 = 0.0;
          }
        }
        else if (v12 < 0.0)
        {
          double v12 = 0.0;
        }
      }
    }
    else
    {
      double v12 = 0.0;
    }
    double v14 = v11 + fmin(v12, 0.0);
    double v15 = v11 - v9;
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v11 - v9 < *(double *)(v16 + 24)) {
      *(double *)(v16 + 24) = v15;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v14 > *(double *)(v17 + 24)) {
      *(double *)(v17 + 24) = v14;
    }
    if (v7 != 0.0)
    {
      double v18 = v7 + v14;
      double v15 = v15 + v7;
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v15 < *(double *)(v19 + 24)) {
        *(double *)(v19 + 24) = v15;
      }
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v18 > *(double *)(v20 + 24)) {
        *(double *)(v20 + 24) = v18;
      }
    }
    if (v12 < 0.0) {
      double v12 = 0.0;
    }
    double v21 = v12 - v15;
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v21 > *(double *)(v22 + 24)) {
      *(double *)(v22 + 24) = v21;
    }
  }
  return result;
}

- (id)_paragraphStyleFromAttributes:(id)a3
{
  id result = (id)[a3 objectForKeyedSubscript:@"NSParagraphStyle"];
  if (!result)
  {
    return [(NSTypesetter *)self defaultParagraphStyle];
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_getLineMetricsForRange:(_NSRange)a3 attributes:(id)a4 attributedString:(id)a5 applySpacing:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8
{
  BOOL v33 = a6;
  NSUInteger v36 = a3.location;
  NSUInteger length = a3.length;
  BOOL v9 = [(NSTypesetter *)self usesFontLeading];
  BOOL v10 = [(NSCoreTypesetter *)self layoutOrientation] == 1;
  BOOL v11 = [(NSCoreTypesetter *)self allowsFontSubstitutionAffectingVerticalMetrics];
  BOOL v12 = [(NSCoreTypesetter *)self allowsFontOverridingTextAttachmentVerticalMetrics];
  v13 = [(NSTypesetter *)self typesetterBehavior];
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3052000000;
  double v71 = __Block_byref_object_copy__11;
  v72 = __Block_byref_object_dispose__11;
  uint64_t v73 = 0;
  uint64_t v64 = 0;
  CGSize v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v60 = 0;
  double v61 = (double *)&v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  double v57 = (double *)&v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v41 = __131__NSCoreTypesetter__getLineMetricsForRange_attributes_attributedString_applySpacing_usesSystemFontLeading_usesNegativeFontLeading___block_invoke;
  uint64_t v42 = &unk_1E55C7660;
  BOOL v48 = v12;
  BOOL v49 = v11;
  v47[1] = (id)(v10 | 2);
  unint64_t v43 = &v68;
  objc_copyWeak(v47, &location);
  BOOL v50 = !v9;
  BOOL v51 = a7;
  BOOL v52 = v10;
  BOOL v53 = a8;
  BOOL v54 = v9;
  uint64_t v44 = &v60;
  v45 = &v64;
  v46 = &v56;
  v47[2] = v13;
  if (!a4 && length && v36 + length <= [a5 length])
  {
    objc_msgSend(a5, "enumerateAttributesInRange:options:usingBlock:", v36, length, 0x100000, v40);
  }
  else
  {
    char v39 = 0;
    ((void (*)(void *, id, NSUInteger, NSUInteger, char *))v41)(v40, a4, v36, length, &v39);
  }
  double v14 = v65[3] - v61[3];
  double v15 = (void *)v69[5];
  if (v15)
  {
    [v15 lineHeightMultiple];
    double v17 = v16;
    [(id)v69[5] minimumLineHeight];
    double v19 = v18;
    [(id)v69[5] maximumLineHeight];
    double v21 = v20;
    double v22 = 0.0;
    if (v33) {
      objc_msgSend((id)v69[5], "lineSpacing", 0.0);
    }
    if (v17 > 0.0)
    {
      v65[3] = v14 * v17 - v14 + v65[3];
      double v14 = v14 * v17;
    }
  }
  else
  {
    double v19 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
  }
  if (v14 >= v19) {
    double v19 = v14;
  }
  else {
    v65[3] = v19 - v14 + v65[3];
  }
  if (v21 <= 0.0 || v19 <= v21) {
    double v21 = v19;
  }
  else {
    v65[3] = v65[3] - (v19 - v21);
  }
  v23 = v57;
  double v24 = v61[3] + v57[3];
  v57[3] = v24;
  if (v22 < 0.0)
  {
    double v24 = v22 + v24;
    v23[3] = v24;
    if (v24 < 0.0)
    {
      v23[3] = 0.0;
      double v24 = 0.0;
    }
  }
  if (v24 < v22 || v9) {
    double v26 = v22;
  }
  else {
    double v26 = v24;
  }
  double v27 = 0.0;
  if (v9) {
    double v27 = v24;
  }
  double v28 = v21 + v27;
  double v29 = v65[3];
  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  double v30 = v28;
  double v31 = v29;
  double v32 = v26;
  result.var2 = v32;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics
{
  return self->_allowsFontOverridingTextAttachmentVerticalMetrics;
}

- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics
{
  return self->_allowsFontSubstitutionAffectingVerticalMetrics;
}

+ (void)_minMaxPositionsForLineFragmentWithParagraphStyle:(id)a3 baseWidth:(double)a4 writingDirection:(int64_t)a5 isBeginningOfParagraph:(BOOL)a6 minPosition:(double *)a7 maxPosition:(double *)a8
{
  NSWritingDirection v10 = a5;
  if (a3)
  {
    if (a6) {
      [a3 firstLineHeadIndent];
    }
    else {
      [a3 headIndent];
    }
    double v15 = v13;
    [a3 tailIndent];
    double v14 = v16;
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
  }
  if (v10 == NSWritingDirectionNatural) {
    NSWritingDirection v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0, a5, a6);
  }
  double v17 = 0.0;
  if (a4 >= 0.0) {
    double v18 = a4;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = -0.0;
  if (v14 <= 0.0) {
    double v19 = v18;
  }
  double v20 = v14 + v19;
  if (v20 <= v15) {
    double v20 = v18;
  }
  double v21 = v18 - v20;
  if (v10 == NSWritingDirectionRightToLeft) {
    double v20 = v18 - v15;
  }
  else {
    double v21 = v15;
  }
  if (v20 < 0.0) {
    double v20 = 0.0;
  }
  if (v20 < v18) {
    double v18 = v20;
  }
  if (v21 >= 0.0) {
    double v17 = v21;
  }
  if (v17 >= v18) {
    double v17 = v18;
  }
  *a7 = v17;
  *a8 = v18;
}

- (BOOL)enforcesMinimumTextLineFragment
{
  return self->_enforcesMinimumTextLineFragment;
}

- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v486 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v17 = (__CFString *)a3;
  }
  else {
    double v17 = 0;
  }
  CFStringRef v361 = (const __CFString *)a3;
  CFStringRef v18 = (const __CFString *)a3;
  if (v17) {
    CFStringRef v18 = (const __CFString *)[(__CFString *)v17 string];
  }
  CFStringRef theString = v18;
  if (v18) {
    unint64_t Length = CFStringGetLength(v18);
  }
  else {
    unint64_t Length = 0;
  }
  double v476 = 0.0;
  double v19 = (double *)MEMORY[0x1E4F28AD8];
  CGSize v381 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  CGPoint v382 = (CGPoint)*MEMORY[0x1E4F28AD8];
  long long v477 = *MEMORY[0x1E4F28AD8];
  CGSize v478 = v381;
  uint64_t v470 = 0;
  v471 = (double *)&v470;
  uint64_t v472 = 0x4010000000;
  v473 = "";
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v474 = *MEMORY[0x1E4F1DB20];
  long long v475 = v20;
  uint64_t v466 = 0;
  v467 = (double *)&v466;
  uint64_t v468 = 0x2020000000;
  uint64_t v469 = 0x7FEFFFFFFFFFFFFFLL;
  int64_t v357 = [(NSCoreTypesetter *)self containerBreakMode];
  int v370 = [a10 wantsMultilineDeviceMetrics];
  BOOL v21 = (a9 & 1) == 0;
  id v388 = [(NSCoreTypesetter *)self laidOutLineFragment];
  if (v388) {
    NSTypesetterBehavior v371 = +[NSTypesetter defaultTypesetterBehavior];
  }
  else {
    NSTypesetterBehavior v371 = [NSString typesetterBehavior];
  }
  truncatedRanges = self->_truncatedRanges;
  if (truncatedRanges)
  {
    [(NSMutableArray *)truncatedRanges removeAllObjects];
    if (a10) {
      goto LABEL_14;
    }
LABEL_25:
    __assert_rtn("-[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:]", "NSCoreTypesetter.m", 2298, "drawingContext != nil");
  }
  self->_truncatedRanges = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a10) {
    goto LABEL_25;
  }
LABEL_14:
  uint64_t v23 = [a10 activeRenderers];
  if (v23) {
    char v24 = v23;
  }
  else {
    char v24 = 3;
  }
  int64_t v355 = [(NSTypesetter *)self applicationFrameworkContext];
  int v367 = 0;
  char v465 = 0;
  unint64_t v464 = 0;
  unint64_t v463 = 0;
  double v462 = 0.0;
  unint64_t v353 = v357 - 3;
  double TrailingWhitespaceWidth = 0.0;
  if (a9)
  {
    unint64_t v25 = ((unint64_t)a9 >> 5) & 1;
    if (v353 < 3) {
      LODWORD(v25) = 1;
    }
    int v367 = v25;
  }
  [(NSTypesetter *)self setAttributedString:v17];
  [(NSTypesetter *)self setTypesetterBehavior:v371];
  [(NSTypesetter *)self setUsesFontLeading:((unint64_t)a9 >> 1) & 1];
  -[NSCoreTypesetter setAllowsFontOverridingTextAttachmentVerticalMetrics:](self, "setAllowsFontOverridingTextAttachmentVerticalMetrics:", [(id)objc_opt_class() _allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing]);
  if ((uint64_t)Length < 1) {
    goto LABEL_631;
  }
  if (v17)
  {
    a8 = (id)[(__CFString *)v17 attributesAtIndex:0 effectiveRange:&v463];
  }
  else
  {
    unint64_t v463 = 0;
    unint64_t v464 = Length;
  }
  v398 = [(NSCoreTypesetter *)self _paragraphStyleFromAttributes:a8];
  if (a7) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = [(NSParagraphStyle *)v398 lineBreakMode];
  }
  int64_t v397 = __NSUltraFastLineBreakFinder(theString, Length, &v465, 0);
  if (!v388 && v355 != 2)
  {
    BOOL v27 = [a10 maximumNumberOfLines] == 1 && v26 <= 1;
    BOOL v28 = !v27;
    BOOL v21 = (a9 & 1) == 0 || !v28;
    if ((a9 & 0x100000) != 0 && !v28)
    {
      if (!v26) {
        uint64_t v26 = 2;
      }
      if (a9) {
        goto LABEL_46;
      }
LABEL_54:
      int v31 = 1;
      goto LABEL_56;
    }
  }
  if (v21) {
    goto LABEL_54;
  }
LABEL_46:
  int v29 = [a10 wrapsForTruncationMode];
  if (v26 > 1) {
    int v30 = v29;
  }
  else {
    int v30 = 0;
  }
  if (v30 == 1)
  {
    int v31 = 0;
    if ([a10 maximumNumberOfLines] != 1) {
      uint64_t v26 = 0;
    }
    int v367 = 1;
  }
  else
  {
    int v31 = 0;
  }
LABEL_56:
  if ((a9 & 0x200) != 0 || self->_layoutOrientation) {
    char v465 = 0;
  }
  if ((uint64_t)Length <= v397) {
    char v32 = 1;
  }
  else {
    char v32 = v31;
  }
  if ((v32 & 1) == 0
    && (!v388 || (uint64_t)(Length - v397) > 1 || [(NSDictionary *)self->__extraLineFragmentAttributes count]))
  {
    char v465 = 0;
  }
  if ([(NSCoreTypesetter *)self requiresCTLineRef]
    || (v24 & 1) == 0
    || v397 > 512
    || v397 > v464
    || [(NSCoreTypesetter *)self forcedLineBreaks])
  {
    char v465 = 0;
  }
  if (v370) {
    char v465 = 0;
  }
  BOOL v33 = [(NSCoreTypesetter *)self isSimpleRectangularTextContainerForStartingCharacterAtIndex:0];
  if (v465) {
    BOOL v34 = v33;
  }
  else {
    BOOL v34 = 0;
  }
  if (v34)
  {
    BYTE5(v337) = (a9 & 0x400) != 0;
    BYTE4(v337) = (a9 & 0x200) != 0;
    BYTE3(v337) = a7;
    BYTE2(v337) = 0;
    BYTE1(v337) = (a9 & 2) != 0;
    LOBYTE(v337) = v31;
    if (-[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:](self, "_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:", theString, v397, a8, v398, v371, v26, x, y, width, height, a5, a6, v337, &v477, &v476,
           a10) == 2)
    {
      [a10 setNumberOfLineFragments:1];
      objc_msgSend(a10, "setTotalBounds:", v477, v478);
      if ([a10 wantsBaselineOffset])
      {
        [a10 setBaselineOffset:v476];
        [a10 setFirstBaselineOffset:v476];
      }
      if (a11) {
        a11->var0 = 1;
      }
      goto LABEL_633;
    }
  }
  if ((v24 & 2) == 0) {
    goto LABEL_631;
  }
  double v35 = (_NSCoreTypesetterLayoutCache *)(id)[a10 layout];
  uint64_t v457 = 0;
  v458 = &v457;
  uint64_t v459 = 0x2020000000;
  uint64_t v460 = 0;
  if (!v35)
  {
    if ([a10 cachesLayout])
    {
      NSUInteger v36 = objc_alloc_init(_NSCoreTypesetterLayoutCache);
      [a10 setLayout:v36];
      double v35 = v36;
    }
    else
    {
      double v35 = 0;
    }
  }
  v350 = v35;
  CFTypeRef cf = 0;
  double v37 = [(NSCoreTypesetter *)self delegate];
  v455 = 0;
  if (objc_opt_respondsToSelector()) {
    double v38 = (_NSTextAttachmentLayoutContext *)[(NSCoreTypesetterDelegate *)v37 textAttachmentLayoutContext];
  }
  else {
    double v38 = 0;
  }
  v455 = v38;
  char v454 = 0;
  -[_NSCoreTypesetterLayoutCache getCTLine:attachmentLayoutContext:lineValidForDrawing:]((uint64_t)v350, &cf, &v455, &v454);
  if (v455) {
    char v39 = v455;
  }
  if (!self->_laidOutLineFragment && (!cf || !v454))
  {
    if (v17)
    {
      uint64_t recta = v26;
      int v66 = v31;
      uint64_t v67 = v19;
      id v68 = a10;
      char v454 = 1;
      CFDictionaryRef v69 = (const __CFDictionary *)a8;
      do
      {
        LOBYTE(buffer) = 1;
        if ((__NSValidateCoreTextAttributes(v69, a6 == 0, (BOOL *)&buffer) & 1) == 0) {
          break;
        }
        v463 += v464;
        if ((_BYTE)buffer) {
          BOOL v70 = v454 == 0;
        }
        else {
          BOOL v70 = 1;
        }
        char v71 = !v70;
        char v454 = v71;
        if (!v455
          && ([(__CFDictionary *)v69 objectForKeyedSubscript:@"NSAttachment"]
           || [(__CFDictionary *)v69 objectForKeyedSubscript:@"CTAdaptiveImageProvider"]))
        {
          v455 = objc_alloc_init(_NSTextAttachmentLayoutContext);
        }
        if (v463 >= Length) {
          break;
        }
        CFDictionaryRef v69 = (const __CFDictionary *)-[__CFString attributesAtIndex:effectiveRange:](v17, "attributesAtIndex:effectiveRange:");
      }
      while (v69);
      if (v463 >= v397) {
        char v72 = v66;
      }
      else {
        char v72 = 0;
      }
      a10 = v68;
      double v19 = v67;
      int v31 = v66;
      uint64_t v26 = recta;
      if (v463 >= Length || (v72 & 1) != 0) {
        goto LABEL_97;
      }
    }
    else
    {
      int v101 = __NSValidateCoreTextAttributes((CFDictionaryRef)a8, a6 == 0, (BOOL *)&v454);
      int v102 = v101;
      if (v455) {
        int v103 = 0;
      }
      else {
        int v103 = v101;
      }
      if (v103 == 1
        && ([a8 objectForKeyedSubscript:@"NSAttachment"]
         || [a8 objectForKeyedSubscript:@"CTAdaptiveImageProvider"])
        && Length == 1
        && CFStringGetCharacterAtIndex(theString, 0) == 65532)
      {
        v455 = objc_alloc_init(_NSTextAttachmentLayoutContext);
      }
      if (v102) {
        goto LABEL_97;
      }
    }
    v346 = 0;
    goto LABEL_628;
  }
LABEL_97:
  CTLineRef line = 0;
  if (v455)
  {
    [(_NSTextAttachmentLayoutContext *)v455 setApplicationFrameworkContext:v355];
    [(_NSTextAttachmentLayoutContext *)v455 setUsesFontLeading:((unint64_t)a9 >> 1) & 1];
    BOOL v40 = [(NSCoreTypesetter *)self allowsFontOverridingTextAttachmentVerticalMetrics];
    [(_NSTextAttachmentLayoutContext *)v455 setAllowsFontOverridingTextAttachmentVerticalMetrics:v40];
    v346 = 0;
    if (!v37 && width > 0.0)
    {
      v346 = -[NSTextContainer initWithSize:]([NSTextContainer alloc], "initWithSize:", width, 40000.0);
      [(NSTextContainer *)v346 setLineFragmentPadding:0.0];
      [(_NSTextAttachmentLayoutContext *)v455 setTextContainer:v346];
    }
  }
  else
  {
    v346 = 0;
  }
  v41 = (__CFString *)v361;
  if (!v17) {
    v41 = (__CFString *)(id)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithString:v361 attributes:a8];
  }
  uint64_t v42 = [(NSCoreTypesetter *)self keyframe];
  v480.double x = 0.0;
  *(void *)&v480.double y = &v480;
  *(void *)&v481.double width = 0x2020000000;
  LOBYTE(v481.height) = 0;
  uint64_t v43 = [(__CFString *)v41 length];
  double v419 = MEMORY[0x1E4F143A8];
  uint64_t v420 = 3221225472;
  uint64_t v421 = (uint64_t)__attributedStringAtKeyframe_block_invoke;
  v422 = (const char *)&unk_1E55C6630;
  *(void *)&long long v423 = &v480;
  [(__CFString *)v41 enumerateAttribute:@"NSTextAnimation", 0, v43, 0, &v419 inRange options usingBlock];
  uint64_t v44 = v41;
  if (*(unsigned char *)(*(void *)&v480.y + 24))
  {
    id v45 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    rect1.origin.double x = 0.0;
    *(void *)&rect1.origin.double y = &rect1;
    *(void *)&rect1.size.double width = 0x2020000000;
    rect1.size.double height = 0.0;
    uint64_t v46 = [(__CFString *)v41 length];
    *(void *)&long long buffer = MEMORY[0x1E4F143A8];
    *((void *)&buffer + 1) = 3221225472;
    *(void *)&long long v432 = __attributedStringAtKeyframe_block_invoke_2;
    *((void *)&v432 + 1) = &unk_1E55C77F0;
    *(void *)&long long v433 = v45;
    *((void *)&v433 + 1) = v41;
    *((void *)&v434 + 1) = &rect1;
    *(void *)&long long v434 = v42;
    [(__CFString *)v41 enumerateAttribute:@"NSTextAnimation", 0, v46, 0, &buffer inRange options usingBlock];
    unint64_t v47 = *(void *)(*(void *)&rect1.origin.y + 24);
    if (v47 < [(__CFString *)v41 length])
    {
      uint64_t v48 = *(void *)(*(void *)&rect1.origin.y + 24);
      uint64_t v49 = [(__CFString *)v41 length];
      objc_msgSend(v45, "appendAttributedString:", -[__CFString attributedSubstringFromRange:](v41, "attributedSubstringFromRange:", v48, v49 - *(void *)(*(void *)&rect1.origin.y + 24)));
    }
    uint64_t v44 = (__CFString *)v45;
    _Block_object_dispose(&rect1, 8);
  }
  _Block_object_dispose(&v480, 8);
  v354 = v44;
  if (v44 == v41) {
    BOOL v50 = v17;
  }
  else {
    BOOL v50 = v44;
  }
  if (v44 == v41) {
    id v51 = a8;
  }
  else {
    id v51 = 0;
  }
  uint64_t v384 = (uint64_t)v51;
  if (cf)
  {
    BaseLineFromAttributedString = CFRetain(cf);
LABEL_118:
    CFTypeRef cf = BaseLineFromAttributedString;
    goto LABEL_119;
  }
  if (v397 >= 1)
  {
    uint64_t v53 = [(NSCoreTypesetter *)self layoutOrientation];
    int v54 = [(NSCoreTypesetter *)self limitsLayoutForSuspiciousContents];
    BaseLineFromAttributedString = __NSCoreTypesetterCreateBaseLineFromAttributedString(v44, 0, v397, v53, v54, (uint64_t)v455);
    goto LABEL_118;
  }
LABEL_119:
  double v452 = 0.0;
  double v451 = 0.0;
  BOOL v55 = [(NSCoreTypesetter *)self isSimpleRectangularTextContainerForStartingCharacterAtIndex:0];
  double v360 = 0.0;
  double v358 = width;
  if (v55)
  {
    double rect = height;
    double v57 = y;
    double v56 = x;
    double v58 = 0.0;
  }
  else
  {
    if (Length == v464 || v50 == 0) {
      uint64_t v60 = v384;
    }
    else {
      uint64_t v60 = 0;
    }
    LOBYTE(v336) = 0;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, v397, v60, v50, 0, 0, v336);
    double v62 = v61;
    double v58 = v63;
    double v452 = v61;
    double v451 = v64;
    if (!v398
      || (NSWritingDirection IsRightToLeft = [(NSParagraphStyle *)v398 baseWritingDirection],
          IsRightToLeft == NSWritingDirectionNatural))
    {
      if (cf) {
        NSWritingDirection IsRightToLeft = (unint64_t)CTLineIsRightToLeft();
      }
      else {
        NSWritingDirection IsRightToLeft = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
      }
    }
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, IsRightToLeft, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), 10000000.0, v62);
    double rect = v73;
    double v56 = v74;
    double v57 = v75;
    double v77 = v76;
    [(NSTypesetter *)self lineFragmentPadding];
    double width = v77 + v78 * -2.0;
  }
  if (self->_typographicBoundsIncludesLineFragmentPadding)
  {
    [(NSTypesetter *)self lineFragmentPadding];
    double v360 = v79;
  }
  unint64_t v80 = (CGContext *)[a6 CGContext];
  double v450 = 0.0;
  double v449 = 0.0;
  if (v398) {
    NSWritingDirection v81 = [(NSParagraphStyle *)v398 baseWritingDirection];
  }
  else {
    NSWritingDirection v81 = NSWritingDirectionNatural;
  }
  +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:v398 baseWidth:v81 writingDirection:1 isBeginningOfParagraph:&v450 minPosition:&v449 maxPosition:width];
  double v391 = v58;
  if (v449 <= v450) {
    double v82 = width;
  }
  else {
    double v82 = v449 - v450;
  }
  if (cf)
  {
    CTLineRef line = (CTLineRef)CFRetain(cf);
    double TypographicBounds = CTLineGetTypographicBounds(line, 0, 0, 0);
    BOOL v348 = 0;
    double TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(line);
    double v462 = TypographicBounds - TrailingWhitespaceWidth;
    if ((v31 & 1) == 0 && v26 <= 1 && v82 > 0.0) {
      BOOL v348 = -[NSCoreTypesetter _getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:](self, "_getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:", cf, 0, v397, theString, v398, v82, v450) != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v348 = 0;
    CTLineRef line = 0;
    double TrailingWhitespaceWidth = 0.0;
    double v462 = 0.0;
  }
  if (a6)
  {
    *(void *)&long long buffer = 0;
    *((void *)&buffer + 1) = &buffer;
    *(void *)&long long v432 = 0x2020000000;
    BYTE8(v432) = 0;
    uint64_t v84 = [(__CFString *)v354 length];
    v448[0] = MEMORY[0x1E4F143A8];
    v448[1] = 3221225472;
    v448[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke;
    v448[3] = &unk_1E55C6630;
    v448[4] = &buffer;
    [(__CFString *)v354 enumerateAttribute:@"NSLink", 0, v84, 0x100000, v448 inRange options usingBlock];
    if (*(unsigned char *)(*((void *)&buffer + 1) + 24))
    {
      uint64_t v85 = [a10 linkTextAttributesProvider];
      uint64_t v86 = +[NSTextLayoutManager linkRenderingAttributesForLabels];
      v447[0] = MEMORY[0x1E4F143A8];
      v447[1] = 3221225472;
      v345 = v447;
      v447[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_2;
      v447[3] = &unk_1E55C76B0;
      v447[6] = v85;
      v447[4] = v354;
      v447[5] = v86;
    }
    else
    {
      v345 = 0;
    }
    _Block_object_dispose(&buffer, 8);
  }
  else
  {
    v345 = 0;
  }
  unint64_t v356 = ((unint64_t)a9 >> 10) & 1;
  double v366 = width;
  if (v31)
  {
    double v87 = v450;
    double v88 = v56 + v450;
    if (!v55 | ((unint64_t)a9 >> 3) & 1)
    {
LABEL_210:
      if (line)
      {
        if (v87 > 0.0)
        {
          CTLineGetStringRange(line);
          uint64_t v110 = (const __CTLine *)CTLineCreateFromLineWithOffset();
          if (v110)
          {
            CFRelease(line);
            CTLineRef line = v110;
          }
        }
      }
      if (v82 <= 0.0 || v82 >= 10000000.0)
      {
        LOBYTE(v111) = 0;
        double v112 = v462;
      }
      else
      {
        int v111 = __NSCoreTypesetterTruncateLine((uint64_t)self, &line, v398, v26, 0, &v462, &TrailingWhitespaceWidth, v82);
        double v112 = v462;
        double v113 = 0.0;
        if (v462 <= v82)
        {
          if ([(NSParagraphStyle *)v398 isFullyJustified])
          {
            if (((![(NSParagraphStyle *)v398 spansAllLines] | v111) & 1) == 0)
            {
              JustifiedLine = CTLineCreateJustifiedLine(line, 1.0, v82);
              if (JustifiedLine)
              {
                CFRelease(line);
                CTLineRef line = JustifiedLine;
                double v462 = v82;
                double v112 = v82;
              }
            }
          }
          unint64_t v115 = [(NSParagraphStyle *)v398 horizontalAlignment];
          CTLineRef v116 = line;
          int v117 = (a9 & 0x200) != 0
              || [(NSParagraphStyle *)v398 _alignmentFollowsWritingDirection];
          double v113 = _flushFactorFromAlignment(v115, v81, (uint64_t)v116, v117, v356);
        }
        double v88 = v88 + CTLineGetPenOffsetForFlush(line, v113, v82);
      }
      BOOL v118 = v112 > v82 && v82 > 0.0;
      if (a6) {
        int v119 = [a6 isFlipped];
      }
      else {
        int v119 = 1;
      }
      if (line && v455) {
        __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(line, &v452, &v451);
      }
      if (v31)
      {
        double v120 = a5;
        double v121 = v57;
        double v122 = v57;
      }
      else
      {
        v488.origin.double x = v56;
        v488.origin.double y = v57;
        v488.size.double width = width;
        v488.size.double height = rect;
        if (CGRectGetHeight(v488) > 0.0)
        {
          double v123 = v452;
          v489.origin.double x = v56;
          v489.origin.double y = v57;
          v489.size.double width = width;
          v489.size.double height = rect;
          if (v123 > CGRectGetHeight(v489)) {
            BOOL v118 = 1;
          }
        }
        if (v119)
        {
          double v120 = a5;
          double v121 = v451;
        }
        else
        {
          v490.origin.double x = v56;
          v490.origin.double y = v57;
          v490.size.double width = width;
          v490.size.double height = rect;
          if (CGRectGetHeight(v490) <= 0.0)
          {
            double v120 = a5;
            double v124 = v452;
          }
          else
          {
            v491.origin.double x = v56;
            v491.origin.double y = v57;
            v491.size.double width = width;
            v491.size.double height = rect;
            double v124 = CGRectGetHeight(v491);
            double v120 = a5;
          }
          double v121 = v124 - v451;
        }
        double v122 = v57 + v121;
      }
      double v125 = v112 + TrailingWhitespaceWidth;
      double v462 = v125;
      if (v388)
      {
        double v126 = v452;
        uint64_t v127 = [(NSTypesetter *)self applicationFrameworkContext];
        if (v125 <= v82 || v82 <= 0.0) {
          double v129 = v125;
        }
        else {
          double v129 = v82;
        }
        v445[0] = MEMORY[0x1E4F143A8];
        v445[1] = 3221225472;
        v445[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_3;
        v445[3] = &unk_1E55C76D8;
        char v446 = v111;
        v445[5] = line;
        v445[4] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v50, (uint64_t)theString, v384, 0, Length, v127, (uint64_t)v445, v88 - v88, v451, v88, v391, v129, v126, v360);
      }
      else
      {
        if (v118)
        {
          if ((v31 & 1) != 0
            || (v492.origin.double x = v56,
                v492.origin.double y = v57,
                v492.size.double width = v366,
                v492.size.double height = rect,
                CGRectGetHeight(v492) <= 0.0))
          {
            *(void *)&long long buffer = 0;
            double v419 = 0.0;
            +[NSCoreTypesetter _maximumAscentAndDescentForRuns:CTLineGetGlyphRuns(line) ascender:&buffer descender:&v419];
            double v130 = -*(double *)&buffer;
            if (!v119) {
              double v130 = v419;
            }
            double v57 = v57 + v130;
            double rect = *(double *)&buffer - v419;
          }
          double v131 = v56 - v120;
          double v132 = v366 + v120 * 2.0;
        }
        else
        {
          double v131 = *v19;
          double v57 = v19[1];
          double v132 = v19[2];
          double rect = v19[3];
        }
        BOOL v133 = line;
        uint64_t v134 = [(NSTypesetter *)self applicationFrameworkContext];
        v443[0] = MEMORY[0x1E4F143A8];
        v443[1] = 3221225472;
        v443[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_4;
        v443[3] = &unk_1E55C7700;
        char v444 = v370;
        *(double *)&v443[6] = v121;
        *(double *)&v443[7] = v88;
        *(double *)&v443[8] = v122;
        v443[4] = &v466;
        v443[5] = &v470;
        __NSCoreTypesetterRenderLineAndAttachments(v133, a6, v134, v455, 0, (uint64_t)v345, v370, (uint64_t)v443, v88, v122, v131, v57, v132, rect);
        char v135 = v370;
        if ((a9 & 8) == 0) {
          char v135 = 1;
        }
        if (v135)
        {
          long long v477 = *MEMORY[0x1E4F28AD0];
          double v136 = v462;
          v478.double width = v462;
          v478.double height = v391 + v452;
          double v476 = v451;
          if (v31) {
            *((double *)&v477 + 1) = v451 - (v391 + v452);
          }
        }
        else
        {
          *(CGRect *)(&v136 - 2) = CTLineGetImageBounds(line, v80);
          *(void *)&long long v477 = v137;
          *((double *)&v477 + 1) = v138;
          v478.double width = v136;
          v478.double height = v139;
          double v476 = v138;
          if ((v31 & 1) == 0) {
            *((void *)&v477 + 1) = 0;
          }
        }
        if (v82 > 0.0 && v136 > v82) {
          v478.double width = v82;
        }
        [a10 setNumberOfLineFragments:1];
        objc_msgSend(a10, "setTotalBounds:", v477, v478);
        if ([a10 wantsBaselineOffset])
        {
          [a10 setBaselineOffset:v476];
          [a10 setFirstBaselineOffset:v476];
        }
      }
      if (a11) {
        a11->var0 = 2;
      }
      goto LABEL_624;
    }
LABEL_203:
    if (Length == v464 || v50 == 0) {
      uint64_t v105 = v384;
    }
    else {
      uint64_t v105 = 0;
    }
    BOOL v106 = [(NSCoreTypesetter *)self isBeginningOfDocument];
    LOBYTE(v336) = ![(NSCoreTypesetter *)self isBeginningOfDocument];
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, v397, v105, v50, !v106, 0, v336);
    double v391 = v107;
    double v452 = v108;
    double v451 = v109;
    double v87 = v450;
    goto LABEL_210;
  }
  if (Length == v397
    && (v26 > 1 || v82 <= 0.0 || !v348 && ![(NSCoreTypesetter *)self forcedLineBreaks] && v462 <= v82))
  {
    double v87 = v450;
    double v88 = v56 + v450;
    if (!v55) {
      goto LABEL_210;
    }
    goto LABEL_203;
  }
  if (a6 && ![a6 isFlipped]) {
    goto LABEL_624;
  }
  uint64_t v442 = 0;
  long long v440 = 0u;
  long long v441 = 0u;
  long long v438 = 0u;
  long long v439 = 0u;
  long long v436 = 0u;
  long long v437 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  long long v432 = 0u;
  long long v433 = 0u;
  long long buffer = 0u;
  uint64_t v89 = [a10 maximumNumberOfLines];
  BOOL v90 = [(NSCoreTypesetter *)self enforcesMinimumTextLineFragment];
  rectb = +[NSParagraphArbitrator paragraphArbitratorWithAttributedString:range:](NSParagraphArbitrator, "paragraphArbitratorWithAttributedString:range:", v354, 0, v397);
  double v419 = 0.0;
  uint64_t v420 = (uint64_t)&v419;
  uint64_t v421 = 0x9810000000;
  long long v426 = 0u;
  long long v427 = 0u;
  long long v428 = 0u;
  long long v429 = 0u;
  long long v430 = 0u;
  long long v423 = 0u;
  long long v424 = 0u;
  uint64_t v425 = 0;
  double v91 = +[NSParagraphStyle defaultParagraphStyle];
  double v93 = *v19;
  double v92 = v19[1];
  double v95 = v19[2];
  double v94 = v19[3];
  uint64_t v96 = *MEMORY[0x1E4F28AD0];
  uint64_t v97 = *(void *)(MEMORY[0x1E4F28AD0] + 8);
  *(void *)&long long v427 = 0;
  long long v426 = (unint64_t)v91;
  CGFloat v339 = v95;
  CGFloat v340 = v93;
  *((double *)&v427 + 1) = v93;
  double v341 = v94;
  double v342 = v92;
  *(double *)&long long v428 = v92;
  *((double *)&v428 + 1) = v95;
  *(double *)&long long v429 = v94;
  *((void *)&v429 + 1) = v96;
  *(void *)&long long v430 = v97;
  WORD4(v430) = 0;
  CGPoint v480 = v382;
  CGSize v481 = v381;
  if (v89) {
    uint64_t v98 = v89;
  }
  else {
    uint64_t v98 = -1;
  }
  unint64_t v374 = v98;
  BOOL v99 = v90;
  if ((uint64_t)Length >= v397)
  {
    *(void *)&long long v439 = theString;
    *((void *)&v440 + 1) = 0;
    *(void *)&long long v441 = Length;
    *((void *)&v439 + 1) = CFStringGetCharactersPtr(theString);
    if (*((void *)&v439 + 1)) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    }
    uint64_t v442 = 0;
    *(void *)&long long v440 = CStringPtr;
    *((void *)&v441 + 1) = 0;
  }
  if (![(NSCoreTypesetter *)self isBeginningOfDocument])
  {
    LOBYTE(v336) = 1;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v384, v50, 1, 0, v336);
    v480.double y = v140 + v480.y;
  }
  id v343 = a10;
  int v141 = 0;
  int v142 = 0;
  *(double *)&unint64_t v143 = 0.0;
  unint64_t v144 = 0;
  p_var3 = &a11->var3;
  if (!a11) {
    p_var3 = 0;
  }
  v359 = p_var3;
  CGFloat v379 = *MEMORY[0x1E4F1DB28];
  CGFloat v377 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v378 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat rect2 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  int v146 = v370;
  if ((a9 & 8) == 0) {
    int v146 = 1;
  }
  int v352 = v146;
  double v351 = INFINITY;
  double v347 = 0.0;
  double v147 = 0.0;
  char v148 = 1;
  v383 = v50;
  do
  {
    if ((v141 & 1) != 0
      && [(NSDictionary *)[(NSCoreTypesetter *)self _extraLineFragmentAttributes] count])
    {
      uint64_t v149 = [(NSCoreTypesetter *)self _extraLineFragmentAttributes];
      v398 = [(NSCoreTypesetter *)self _paragraphStyleFromAttributes:v149];
      uint64_t v384 = (uint64_t)v149;
    }
    else
    {
      if (v50) {
        v398 = [(NSCoreTypesetter *)self _paragraphStyleFromAttributes:[(__CFString *)v50 attributesAtIndex:v143 - ((v143 != 0) & v141) effectiveRange:0]];
      }
      uint64_t v149 = 0;
    }
    if (v398)
    {
      if (v367 && ([v343 wrapsForTruncationMode] & 1) != 0) {
        uint64_t v389 = 0;
      }
      else {
        uint64_t v389 = [(NSParagraphStyle *)v398 lineBreakMode];
      }
      NSWritingDirection v386 = [(NSParagraphStyle *)v398 baseWritingDirection];
    }
    else
    {
      uint64_t v389 = 0;
      NSWritingDirection v386 = NSWritingDirectionNatural;
    }
    double v150 = 0.0;
    if ((v148 & (v143 != 0)) == 1) {
      [(NSParagraphStyle *)v398 paragraphSpacingBefore];
    }
    unint64_t v392 = v143;
    double v151 = v150 + v480.y;
    v480.double y = v151;
    if (!rectb || !line) {
      goto LABEL_324;
    }
    if (v398) {
      uint64_t v152 = [(NSParagraphStyle *)v398 lineBreakStrategy];
    }
    else {
      uint64_t v152 = +[NSTypesetter defaultLineBreakStrategy];
    }
    if (v152 == 0xFFFF) {
      uint64_t v152 = __NSLineBreakStrategyStandardActualOptions([(NSParagraphStyle *)v398 isFullyJustified]);
    }
    if (v389) {
      unint64_t v153 = v152 & 0xFFFFFFFFFFFFFFF3 | 4;
    }
    else {
      unint64_t v153 = v152;
    }
    if (v398)
    {
      [(NSParagraphStyle *)v398 hyphenationFactor];
      double v155 = v154;
      if (v154 != 0.0) {
        goto LABEL_318;
      }
    }
    else
    {
      double v155 = 0.0;
    }
    if (![(NSCoreTypesetter *)self usesDefaultHyphenation])
    {
LABEL_318:
      double v158 = 0.0;
      if (v155 >= 0.0) {
        double v158 = v155;
      }
      double v157 = fmin(v158, 1.0);
      goto LABEL_321;
    }
    +[NSParagraphStyle _defaultHyphenationFactor];
    double v157 = v156;
LABEL_321:
    [(NSParagraphArbitrator *)rectb setAttributedString:v354];
    -[NSParagraphArbitrator setParagraphRange:](rectb, "setParagraphRange:", v143, v397);
    [(NSParagraphArbitrator *)rectb setParagraphLine:line];
    [(NSParagraphArbitrator *)rectb setLineBreakStrategy:v153];
    [(NSParagraphArbitrator *)rectb setHyphenationFactor:v157];
    [(NSParagraphArbitrator *)rectb setTypesetterBehavior:v371];
    if (self->_validateLineBreakIndex)
    {
      v418[6] = MEMORY[0x1E4F143A8];
      v418[7] = 3221225472;
      v418[8] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_5;
      v418[9] = &unk_1E55C57E0;
      v418[10] = self;
    }
    -[NSParagraphArbitrator setValidateLineBreakContext:](rectb, "setValidateLineBreakContext:");
    v418[0] = MEMORY[0x1E4F143A8];
    v418[1] = 3221225472;
    v418[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_6;
    v418[3] = &unk_1E55C7728;
    v418[5] = line;
    v418[4] = self;
    [(NSParagraphArbitrator *)rectb setLineWidth:v418];
    -[NSParagraphArbitrator setPreviousLineRange:](rectb, "setPreviousLineRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(NSParagraphArbitrator *)rectb setTextContainerIsSimple:[(NSCoreTypesetter *)self isSimpleRectangularTextContainerForStartingCharacterAtIndex:v143]];
    [(NSParagraphArbitrator *)rectb setTextContainerWidth:width];
    [(NSParagraphArbitrator *)rectb setDefaultParagraphStyle:[(NSTypesetter *)self defaultParagraphStyle]];
    [(NSParagraphArbitrator *)rectb setBreaksLinesForInteractiveText:[(NSCoreTypesetter *)self breaksLinesForInteractiveText]];
    [(NSParagraphArbitrator *)rectb setMaximumNumberOfLines:[(NSCoreTypesetter *)self maximumNumberOfLines]];
LABEL_324:
    int v380 = v142;
    int v375 = v141;
    if (v144 >= v374)
    {
      CFIndex v160 = 0;
      goto LABEL_329;
    }
    BOOL v159 = line == 0;
    if (!v397 && line)
    {
      CFIndex v160 = 0;
LABEL_329:
      CFIndex location = v143;
      goto LABEL_475;
    }
    unint64_t v344 = v143 - ((v143 != 0) & v141);
    v349 = v149;
    unint64_t v162 = v143;
    int64_t v390 = v397;
    while (1)
    {
      rect1.CGPoint origin = v382;
      rect1.CGSize size = v381;
      long long v417 = *MEMORY[0x1E4F28AD0];
      char v416 = 0;
      if (!v159
        && ![(NSCoreTypesetter *)self isSimpleRectangularTextContainerForStartingCharacterAtIndex:v162])
      {
        double v483 = *(double *)&v162;
        LOBYTE(v338) = v455 != 0;
        v166 = -[NSCoreTypesetter _createLayoutLineFragmentStartingWithCharacterIndex:proposedLineFragmentRect:baseLineRef:range:paragraphStyle:paragraphArbitrator:lineBreakMode:hasAttachments:lineFragmentRect:glyphOrigin:hyphenated:forcedClusterBreak:](self, "_createLayoutLineFragmentStartingWithCharacterIndex:proposedLineFragmentRect:baseLineRef:range:paragraphStyle:paragraphArbitrator:lineBreakMode:hasAttachments:lineFragmentRect:glyphOrigin:hyphenated:forcedClusterBreak:", &v483, &v480, &line, v162, v390, v398, rectb, v389, v338, &rect1, &v417, &v416, v359);
        CFRange StringRange = CTLineGetStringRange(v166);
        CFIndex location = StringRange.location;
        CFIndex v160 = StringRange.length;
        goto LABEL_374;
      }
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:v398 baseWidth:v386 writingDirection:v148 & 1 isBeginningOfParagraph:&v450 minPosition:&v449 maxPosition:width];
      double v163 = v449;
      if (v449 <= v450) {
        double v164 = width;
      }
      else {
        double v164 = v449 - v450;
      }
      if (!line)
      {
        v166 = 0;
LABEL_345:
        CFIndex location = v392;
        CFIndex v160 = v397;
        goto LABEL_346;
      }
      if (v162 == v392)
      {
        if (v389 > 1 || v164 <= 0.0 || (double v163 = v462, !v348 && v462 <= v164))
        {
          if (![(NSCoreTypesetter *)self forcedLineBreaks])
          {
            if (v397 == CTLineGetStringRange(line).length && v450 == 0.0) {
              uint64_t v215 = (uint64_t)CFRetain(line);
            }
            else {
              uint64_t v215 = CTLineCreateFromLineWithOffset();
            }
            v166 = (__CTLine *)v215;
            goto LABEL_345;
          }
        }
      }
      uint64_t v165 = [(NSCoreTypesetter *)self _createLineRefForParentLineRef:&line range:v162 availableWidth:v390 offset:rectb paragraphArbitrator:v389 lineBreakMode:&v416 hyphenated:v164 forcedClusterBreak:v359];
      v166 = v165;
      if (!v165)
      {
        CFIndex v160 = 0;
LABEL_358:
        CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_374;
      }
      CFRange v167 = CTLineGetStringRange(v165);
      CFIndex location = v167.location;
      CFIndex v160 = v167.length;
LABEL_346:
      if (location == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_358;
      }
      uint64_t v168 = v384;
      if (theString != v361)
      {
        uint64_t v168 = v384;
        if (Length != v464)
        {
          uint64_t v168 = line ? 0 : (uint64_t)v349;
          if (!((unint64_t)line | (unint64_t)v349)) {
            uint64_t v168 = [(__CFString *)v383 attributesAtIndex:v344 effectiveRange:0];
          }
        }
      }
      uint64_t v169 = rangeOfParagraphSeparatorAtIndex(Length, (UniChar *)&buffer, v160 + location);
      uint64_t v171 = v170;
      double v483 = 0.0;
      uint64_t v484 = 0;
      double v485 = 0.0;
      if (location) {
        LOBYTE(v172) = 1;
      }
      else {
        int v172 = ![(NSCoreTypesetter *)self isBeginningOfDocument];
      }
      LOBYTE(v336) = v172;
      -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", location, v160, v168, v383, v398 != 0, v169 + v171 != Length, v336);
      double v483 = v174;
      uint64_t v484 = v175;
      double v485 = v176;
      if (v166 && v455) {
        __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(v166, &v483, (double *)&v484);
      }
      v493.origin.double y = y;
      v493.origin.double x = x;
      v493.size.double width = v358;
      v493.size.double height = height;
      if (CGRectGetHeight(v493) <= 0.0 || v99)
      {
        double v177 = v483;
      }
      else
      {
        uint64_t v178 = [(NSCoreTypesetter *)self forcedLineBreaks];
        double v177 = v483;
        if (!v178)
        {
          double v179 = v480.y;
          v494.origin.double y = y;
          v494.origin.double x = x;
          v494.size.double width = v358;
          v494.size.double height = height;
          if (v179 + v177 > CGRectGetHeight(v494) + 0.001) {
            goto LABEL_374;
          }
        }
      }
      rect1.CGPoint origin = v480;
      double v180 = 0.0;
      if (v164 < 10000000.0 && v164 > 0.0) {
        double v180 = v164;
      }
      rect1.size.double width = v180;
      rect1.size.double height = v177;
      *(double *)&long long v417 = v450;
      *((void *)&v417 + 1) = v484;
      v480.double x = 0.0;
      v480.double y = rect1.origin.y + v177 + v485;
      CGSize v481 = (CGSize)0;
LABEL_374:
      v496.origin.double x = v379;
      v496.size.double width = v377;
      v496.origin.double y = v378;
      v496.size.double height = rect2;
      if (CGRectEqualToRect(rect1, v496)) {
        break;
      }
      uint64_t v182 = v420;
      if ((!v388 || !v144) && !*(unsigned char *)(v420 + 145)) {
        goto LABEL_431;
      }
      double v415 = 0.0;
      uint64_t v183 = *(const __CTLine **)(v420 + 32);
      if (v183
        && (double v184 = CTLineGetTypographicBounds(v183, 0, 0, 0),
            uint64_t v182 = v420,
            uint64_t v185 = *(const __CTLine **)(v420 + 32),
            double v415 = v184,
            double v414 = 0.0,
            v185))
      {
        double v186 = CTLineGetTrailingWhitespaceWidth(v185);
        uint64_t v182 = v420;
      }
      else
      {
        double v186 = 0.0;
      }
      double v414 = v186;
      if (!*(unsigned char *)(v182 + 145))
      {
        char v189 = 0;
        double v188 = v415 - v186;
        goto LABEL_397;
      }
      if (*(void *)(v182 + 32) && *(unsigned char *)(v182 + 144))
      {
        if (v398)
        {
          if ([(NSParagraphStyle *)v398 isFullyJustified]) {
            goto LABEL_387;
          }
LABEL_391:
          BOOL v187 = 0;
        }
        else
        {
          if (!objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "isFullyJustified"))goto LABEL_391; {
LABEL_387:
          }
          BOOL v187 = *(void *)(v420 + 48) + *(void *)(v420 + 40) < *(void *)(v420 + 64) + *(void *)(v420 + 56);
        }
        __NSCoreTypesetterHyphenateLine(v420 + 32, (uint64_t)[(NSCoreTypesetter *)self softHyphen], v187, &v415, &v414);
        double v186 = v414;
        uint64_t v182 = v420;
        int v190 = *(unsigned __int8 *)(v420 + 145);
        double v188 = v415 - v414;
        double v415 = v415 - v414;
        if (!v190) {
          goto LABEL_396;
        }
        goto LABEL_393;
      }
      double v188 = v415 - v186;
      double v415 = v415 - v186;
LABEL_393:
      if (*(void *)(v182 + 32) && *(double *)(v182 + 112) > 0.0)
      {
        char v189 = __NSCoreTypesetterTruncateLine((uint64_t)self, (CTLineRef *)(v182 + 32), *(void **)(v182 + 72), *(void *)(v182 + 80), 0, &v415, &v414, *(double *)(v182 + 112));
        double PenOffsetForFlush = CTLineGetPenOffsetForFlush(*(CTLineRef *)(v420 + 32), *(CGFloat *)(v420 + 88), *(double *)(v420 + 112));
        *(double *)(v420 + 128) = PenOffsetForFlush + *(double *)(v420 + 128);
        double v186 = v414;
        double v188 = v415;
        goto LABEL_397;
      }
LABEL_396:
      char v189 = 0;
LABEL_397:
      double v415 = v186 + v188;
      if (v144 == 1 && [(NSCoreTypesetter *)self _shouldShowLineBadges])
      {
        CFAttributedStringRef v192 = [(NSParagraphArbitrator *)rectb debugString];
        if (v192)
        {
          *(double *)&CFIndex v193 = COERCE_DOUBLE((uint64_t)+[UIFont systemFontOfSize:9.0]);
          if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
          {
            CFIndex v194 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v355];
          }
          else
          {
            CFIndex v194 = +[NSTextGraphicsContextProvider __defaultColorClass];
          }
          v216 = v194;
          uint64_t v217 = [(objc_class *)v194 blackColor];
          *(double *)&uint64_t v218 = COERCE_DOUBLE([(objc_class *)v216 systemYellowColor]);
          *(void *)&v482[0] = @"NSFont";
          *(void *)&v482[1] = @"NSColor";
          double v483 = *(double *)&v193;
          uint64_t v484 = v217;
          *(void *)&v482[2] = @"NSBackgroundColor";
          double v485 = *(double *)&v218;
          uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v483 forKeys:v482 count:3];
          CFAttributedStringRef v192 = (const __CFAttributedString *)(id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v192 attributes:v219];
        }
      }
      else
      {
        CFAttributedStringRef v192 = 0;
      }
      uint64_t v195 = v420;
      if (v388)
      {
        uint64_t v196 = *(void *)(v420 + 40);
        double v197 = *(double *)(v420 + 120);
        double v198 = *(double *)(v420 + 128);
        double v200 = *(double *)(v420 + 96);
        double v199 = *(double *)(v420 + 104);
        double v201 = *(double *)(v420 + 112);
        double v202 = v415;
        uint64_t v203 = [(NSTypesetter *)self applicationFrameworkContext];
        if (v202 <= v201 || v201 <= 0.0) {
          double v205 = v202;
        }
        else {
          double v205 = v201;
        }
        double v206 = *(double *)(v420 + 136);
        v412[0] = MEMORY[0x1E4F143A8];
        v412[1] = 3221225472;
        v412[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_7;
        v412[3] = &unk_1E55C7750;
        v412[6] = &v419;
        char v413 = v189;
        v412[4] = v192;
        v412[5] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v383, (uint64_t)theString, v384, v196, location - v196, v203, (uint64_t)v412, 0.0, v206, v198 + v200, v199, v205, v197, v360);
        uint64_t v195 = v420;
        double width = v366;
      }
      else
      {
        if (*(unsigned char *)(v420 + 145))
        {
          double v207 = *(const __CTLine **)(v420 + 32);
          if (v207)
          {
            double v209 = *(double *)(v420 + 128);
            double v208 = *(double *)(v420 + 136);
            double v210 = *(double *)(v420 + 112);
            if (v210 <= 0.0 || v415 <= v210)
            {
              double v211 = v147;
              CGFloat v214 = v339;
              CGFloat v212 = v340;
              double v213 = v341;
              double v364 = v342;
            }
            else
            {
              double v211 = v147;
              double v483 = 0.0;
              v482[0] = 0.0;
              +[NSCoreTypesetter _maximumAscentAndDescentForRuns:CTLineGetGlyphRuns(v207) ascender:&v483 descender:v482];
              CGFloat v212 = x;
              double v364 = y - v483;
              double v213 = height + v483 - v482[0];
              uint64_t v195 = v420;
              double v207 = *(const __CTLine **)(v420 + 32);
              CGFloat v214 = v358;
            }
            double v220 = *(double *)(v195 + 96);
            double v221 = *(double *)(v195 + 104);
            uint64_t v222 = [(NSTypesetter *)self applicationFrameworkContext];
            v408[0] = MEMORY[0x1E4F143A8];
            v408[1] = 3221225472;
            v408[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_8;
            v408[3] = &unk_1E55C7778;
            char v411 = v370;
            *(double *)&v408[8] = y + v221;
            double v409 = v209 + x + v220;
            CGFloat v410 = v208 + y + v221;
            v408[4] = &v466;
            v408[5] = &v470;
            v408[6] = &v457;
            v408[7] = &v419;
            __NSCoreTypesetterRenderLineAndAttachments(v207, a6, v222, v455, v192, (uint64_t)v345, v370, (uint64_t)v408, v409, v410, v212, v364, v214, v213);
            uint64_t v195 = v420;
            double width = v366;
            double v147 = v211;
          }
        }
        if (v352)
        {
          double v223 = *(double *)(v195 + 128);
          double v224 = v351;
          if (v351 > v223) {
            double v224 = *(double *)(v195 + 128);
          }
          double v351 = v224;
          double v225 = v223 + v415;
          if (v347 < v225) {
            double v347 = v225;
          }
        }
      }
      double v226 = *(const void **)(v195 + 32);
      if (v226) {
        CFRelease(v226);
      }
      *(void *)(v195 + 32) = 0;
      *(unsigned char *)(v195 + 145) = 0;
LABEL_431:
      char v227 = v416;
      CGPoint origin = rect1.origin;
      CGSize size = rect1.size;
      double v230 = v398;
      long long v231 = v417;
      if (!v398)
      {
        long long v362 = v417;
        CGSize v363 = rect1.size;
        CGPoint v365 = rect1.origin;
        double v230 = +[NSParagraphStyle defaultParagraphStyle];
        CGSize size = v363;
        CGPoint origin = v365;
        long long v231 = v362;
      }
      uint64_t v232 = v420;
      *(void *)(v420 + 32) = v166;
      *(void *)(v232 + 40) = location;
      *(void *)(v232 + 48) = v160;
      *(double *)(v232 + 56) = *(double *)&v392;
      *(void *)(v232 + 64) = v397;
      *(void *)(v232 + 72) = v230;
      *(void *)(v232 + 80) = v389;
      *(void *)(v232 + 88) = 0;
      *(CGPoint *)(v232 + 96) = origin;
      *(CGSize *)(v232 + 112) = size;
      *(_OWORD *)(v232 + 128) = v231;
      *(unsigned char *)(v232 + 144) = v227;
      *(unsigned char *)(v232 + 145) = 1;
      if (v166)
      {
        double v233 = CTLineGetTypographicBounds(v166, 0, 0, 0);
        double v234 = v233 - CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)(v420 + 32));
      }
      else
      {
        double v234 = 0.0;
      }
      double v151 = rect1.size.width;
      if (rect1.size.width > 0.0)
      {
        int v235 = [(NSParagraphStyle *)v398 spansAllLines];
        if (v398)
        {
          if (![(NSParagraphStyle *)v398 isFullyJustified]) {
            goto LABEL_453;
          }
LABEL_441:
          uint64_t v236 = *(void *)(v420 + 40);
          uint64_t v237 = *(void *)(v420 + 48);
          uint64_t v238 = *(void *)(v420 + 56);
          uint64_t v239 = *(void *)(v420 + 64);
          double v240 = rect1.size.width;
          int v241 = [(NSParagraphArbitrator *)rectb mayCompressLines];
          if (v234 <= v240)
          {
            if (v237 + v236 == v239 + v238) {
              int v241 = v235;
            }
            else {
              int v241 = 1;
            }
          }
          if (*(unsigned char *)(v420 + 145))
          {
            int v242 = *(void *)(v420 + 32) ? v241 : 0;
            if (v242 == 1)
            {
              CTLineRef v243 = CTLineCreateJustifiedLine(*(CTLineRef *)(v420 + 32), 1.0, rect1.size.width);
              if (v243)
              {
                CFRelease(*(CFTypeRef *)(v420 + 32));
                *(void *)(v420 + 32) = v243;
              }
            }
          }
          if (v398)
          {
LABEL_453:
            int v244 = [(NSParagraphStyle *)v398 _alignmentFollowsWritingDirection];
            unint64_t v245 = [(NSParagraphStyle *)v398 horizontalAlignment];
LABEL_455:
            double v151 = _flushFactorFromAlignment(v245, v386, (uint64_t)line, ((unint64_t)a9 >> 9) & 1 | v244, v356);
            *(double *)(v420 + 88) = v151;
            goto LABEL_456;
          }
        }
        else if (objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "isFullyJustified"))
        {
          goto LABEL_441;
        }
        int v244 = objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "_alignmentFollowsWritingDirection");
        unint64_t v245 = objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "horizontalAlignment");
        goto LABEL_455;
      }
LABEL_456:
      if (!v144)
      {
        double v151 = *(double *)(v420 + 104);
        double v147 = v151 + *(double *)(v420 + 136);
      }
      unint64_t v246 = v144 + 1;
      if (!line)
      {
        char v148 = 0;
        BOOL v99 = 0;
        ++v144;
        goto LABEL_474;
      }
      if (v374 - 1 == v144)
      {
        BOOL v99 = 0;
        char v148 = 0;
        unint64_t v143 = v397 + v392;
        unint64_t v144 = v374;
        goto LABEL_477;
      }
      BOOL v159 = 0;
      unint64_t v247 = v160 + location;
      unint64_t v248 = v390 + v162;
      if (v160 + location >= v390 + v162) {
        v162 += v390;
      }
      else {
        unint64_t v162 = v160 + location;
      }
      ++v144;
      char v148 = 0;
      BOOL v99 = 0;
      BOOL v252 = v248 >= v247;
      int64_t v250 = v248 - v247;
      BOOL v249 = v250 != 0 && v252;
      if (!v252) {
        int64_t v250 = 0;
      }
      int64_t v390 = v250;
      if (!v249)
      {
        unint64_t v144 = v246;
        char v148 = 0;
        BOOL v99 = 0;
        goto LABEL_474;
      }
    }
    if (v166) {
      CFRelease(v166);
    }
    v380 |= v375 ^ 1;
LABEL_474:
    unint64_t v143 = v392;
LABEL_475:
    v143 += v397;
    if (v144 >= v374)
    {
LABEL_477:
      char v251 = 0;
      BOOL v252 = v160 + location >= v143 && v143 >= Length;
      int v253 = !v252;
      int v142 = v253 | v380;
    }
    else
    {
      char v251 = 1;
      int v142 = v380;
    }
    BOOL v50 = v383;
    if ((v142 & 1) != 0 || v143 >= Length)
    {
      if (self->_wantsExtraLineFragment && (v375 & 1) != 0 && v388)
      {
        uint64_t v269 = *(void *)(v420 + 40);
        double v270 = *(double *)(v420 + 104);
        double v271 = *(double *)(v420 + 112);
        double v273 = *(double *)(v420 + 88);
        double v272 = *(double *)(v420 + 96);
        double v274 = *(double *)(v420 + 120);
        double v275 = *(double *)(v420 + 128);
        uint64_t v276 = [(NSTypesetter *)self applicationFrameworkContext];
        double v277 = *(double *)(v420 + 136);
        v407[0] = MEMORY[0x1E4F143A8];
        v407[1] = 3221225472;
        v407[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_9;
        v407[3] = &unk_1E55C7638;
        v407[4] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v383, (uint64_t)theString, v384, v269, Length - v269, v276, (uint64_t)v407, v272 + v271 * v273 + v275 - (v272 + v271 * v273 + v275), v277, v272 + v271 * v273 + v275, v270, 0.0, v274, v360);
        int v141 = 0;
        double width = v366;
      }
      else
      {
        int v141 = 0;
      }
      continue;
    }
    uint64_t v254 = rangeOfParagraphSeparatorAtIndex(Length, (UniChar *)&buffer, v143);
    unint64_t v143 = v254 + v256;
    BOOL v257 = v254 + v256 == Length;
    char v258 = v251 ^ 1;
    if (!line) {
      char v258 = 1;
    }
    if ((v258 & 1) == 0)
    {
      CFRelease(line);
      CTLineRef line = 0;
    }
    if (v143 >= Length)
    {
LABEL_531:
      int64_t v397 = 0;
      if (*(double *)&v143 == 0.0) {
        goto LABEL_535;
      }
      goto LABEL_532;
    }
    uint64_t v259 = v143;
    int64_t v397 = 0;
    while (2)
    {
      uint64_t v260 = v441;
      if ((uint64_t)v441 <= v259) {
        goto LABEL_507;
      }
      p_long long buffer = (long long *)*((void *)&v439 + 1);
      if (*((void *)&v439 + 1))
      {
        uint64_t v262 = *((void *)&v440 + 1) + v259;
        goto LABEL_495;
      }
      if ((void)v440)
      {
        unsigned __int16 v263 = *(char *)(v440 + *((void *)&v440 + 1) + v259);
      }
      else
      {
        uint64_t v266 = *((void *)&v441 + 1);
        if (v442 <= v259 || *((void *)&v441 + 1) > v259)
        {
          uint64_t v268 = v259 - 4;
          if ((unint64_t)v259 < 4) {
            uint64_t v268 = 0;
          }
          if (v268 + 64 < (uint64_t)v441) {
            uint64_t v260 = v268 + 64;
          }
          *((void *)&v441 + 1) = v268;
          uint64_t v442 = v260;
          v487.CFIndex location = *((void *)&v440 + 1) + v268;
          v487.NSUInteger length = v260 - v268;
          CFStringGetCharacters((CFStringRef)v439, v487, (UniChar *)&buffer);
          uint64_t v266 = *((void *)&v441 + 1);
        }
        uint64_t v262 = v259 - v266;
        p_long long buffer = &buffer;
LABEL_495:
        unsigned __int16 v263 = *((_WORD *)p_buffer + v262);
      }
      BOOL v264 = v263 > 0xDu || ((1 << v263) & 0x3400) == 0;
      BOOL v265 = v264 && v263 - 8232 >= 2;
      if (v265 && v263 != 133)
      {
LABEL_507:
        uint64_t v259 = ++v397 + v143;
        if (v397 + v143 >= Length) {
          break;
        }
        continue;
      }
      break;
    }
    if (!v397) {
      goto LABEL_531;
    }
    uint64_t v278 = [(NSCoreTypesetter *)self layoutOrientation];
    int v279 = [(NSCoreTypesetter *)self limitsLayoutForSuspiciousContents];
    CTLineRef line = __NSCoreTypesetterCreateBaseLineFromAttributedString(v354, v143, v397, v278, v279, (uint64_t)v455);
    double v280 = CTLineGetTypographicBounds(line, 0, 0, 0);
    double TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(line);
    double v462 = v280 - TrailingWhitespaceWidth;
    double v255 = v358;
    if (v358 > 0.0)
    {
      uint64_t v281 = v398;
      if (v383) {
        uint64_t v281 = -[NSCoreTypesetter _paragraphStyleFromAttributes:](self, "_paragraphStyleFromAttributes:", -[__CFString attributesAtIndex:effectiveRange:](v383, "attributesAtIndex:effectiveRange:", v143, 0, v358));
      }
      BOOL v348 = -[NSCoreTypesetter _getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:](self, "_getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:", line, v143, v397, theString, v281, v358, 0.0) != 0x7FFFFFFFFFFFFFFFLL;
    }
    if (*(double *)&v143 == 0.0)
    {
LABEL_535:
      if (v398) {
        [(NSParagraphStyle *)v398 paragraphSpacing];
      }
      else {
        double v283 = 0.0;
      }
      char v148 = 1;
      goto LABEL_539;
    }
LABEL_532:
    int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v143 - 1);
    if (CharacterAtIndex == 10 || CharacterAtIndex == 8233 || CharacterAtIndex == 13) {
      goto LABEL_535;
    }
    char v148 = 0;
    double v283 = 0.0;
LABEL_539:
    int v141 = v257 | v375;
    double v151 = v283 + v480.y;
    v480.double y = v151;
  }
  while ((v142 & 1) == 0 && (v143 < Length) | v141 & 1);
  uint64_t v284 = v420;
  a10 = v343;
  if (!*(unsigned char *)(v420 + 145)) {
    goto LABEL_616;
  }
  if (!*(void *)(v420 + 32))
  {
    if (v352)
    {
      double v151 = v347 - v351;
      CGFloat v288 = *(double *)(v420 + 104) + *(double *)(v420 + 120);
      v478.double width = v347 - v351;
      v478.double height = v288;
    }
    goto LABEL_616;
  }
  char v285 = v142;
  rect1.origin.double x = 0.0;
  double v483 = 0.0;
  if (!v367)
  {
    char v287 = v142 ^ 1;
    uint64_t v286 = *(void *)(v420 + 80);
LABEL_553:
    char v289 = 1;
    goto LABEL_569;
  }
  if (![(NSCoreTypesetter *)self wantsExtraLineFragment])
  {
    if (v142 & 1 | (*(double *)(v420 + 120) + *(double *)(v420 + 104) + *(double *)(v420 + 120) > height)) {
      goto LABEL_555;
    }
LABEL_549:
    char v285 = 0;
    uint64_t v284 = v420;
    uint64_t v286 = *(void *)(v420 + 80);
    char v287 = 1;
    goto LABEL_553;
  }
  if ((v142 & 1) == 0) {
    goto LABEL_549;
  }
LABEL_555:
  if ([v343 wrapsForTruncationMode])
  {
    uint64_t v286 = [*(id *)(v420 + 72) lineBreakMode];
  }
  else if (v353 >= 3)
  {
    uint64_t v286 = 4;
  }
  else
  {
    uint64_t v286 = v357;
  }
  uint64_t v284 = v420;
  if (line
    && (uint64_t v290 = *(void *)(v420 + 40),
        uint64_t v291 = *(void *)(v420 + 56),
        *(void *)(v420 + 48) + v290 < (unint64_t)(*(void *)(v420 + 64) + v291))
    && (v290 != v291 ? (uint64_t v292 = CTLineCreateFromLineWithOffset()) : (uint64_t v292 = (uint64_t)CFRetain(line)),
        uint64_t v293 = v292,
        uint64_t v284 = v420,
        v292))
  {
    CFRelease(*(CFTypeRef *)(v420 + 32));
    char v287 = 0;
    char v289 = 0;
    uint64_t v284 = v420;
    *(void *)(v420 + 32) = v293;
    *(unsigned char *)(v284 + 144) = 0;
  }
  else
  {
    char v287 = 0;
    char v289 = 0;
  }
  char v285 = 1;
LABEL_569:
  rect1.origin.double x = CTLineGetTypographicBounds(*(CTLineRef *)(v284 + 32), 0, 0, 0);
  double v294 = CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)(v420 + 32));
  double v483 = v294;
  uint64_t v295 = v420;
  if (*(unsigned char *)(v420 + 145) && *(void *)(v420 + 32) && *(unsigned char *)(v420 + 144))
  {
    __NSCoreTypesetterHyphenateLine(v420 + 32, (uint64_t)[(NSCoreTypesetter *)self softHyphen], 0, &rect1.origin.x, &v483);
    double v294 = v483;
    uint64_t v295 = v420;
  }
  double v296 = rect1.origin.x - v294;
  rect1.origin.double x = v296;
  double v297 = *(double *)(v295 + 112);
  if (v297 <= 0.0 || v297 >= v296)
  {
    if (v289)
    {
      unsigned int v303 = 0;
      double v301 = 0.0;
      id v302 = v388;
      goto LABEL_586;
    }
    unint64_t v299 = v286 - 3;
    id v302 = v388;
  }
  else
  {
    char v298 = v367 ^ 1;
    unint64_t v299 = v286 - 3;
    if ((unint64_t)(v286 - 3) < 3) {
      char v298 = 1;
    }
    char v300 = v287 | v298;
    double v301 = 0.0;
    if ((unint64_t)(v286 - 3) < 3) {
      double v301 = *(double *)(v295 + 112);
    }
    id v302 = v388;
    if (v300)
    {
      unsigned int v303 = 0;
      goto LABEL_586;
    }
  }
  unsigned int v303 = v299 < 3;
  double v301 = 0.0;
  if (v299 < 3) {
    double v301 = *(double *)(v295 + 112);
  }
LABEL_586:
  char v304 = __NSCoreTypesetterTruncateLine((uint64_t)self, (CTLineRef *)(v295 + 32), *(void **)(v295 + 72), v286, v303, &rect1.origin.x, &v483, v301);
  if (v297 > 0.0 && v297 < 10000000.0)
  {
    double v305 = CTLineGetPenOffsetForFlush(*(CTLineRef *)(v420 + 32), *(CGFloat *)(v420 + 88), *(double *)(v420 + 112));
    *(double *)(v420 + 128) = v305 + *(double *)(v420 + 128);
  }
  uint64_t v306 = v420;
  if (v302)
  {
    double v307 = *(const __CTLine **)(v420 + 32);
    if (v307)
    {
      CFIndex v308 = CTLineGetStringRange(v307).length;
      uint64_t v306 = v420;
      uint64_t v309 = *(void *)(v420 + 40);
    }
    else
    {
      uint64_t v309 = *(void *)(v420 + 40);
      CFIndex v308 = Length - v309;
    }
    if (v309 + v308 == *(void *)(v306 + 64) + *(void *)(v306 + 56))
    {
      *(void *)&v482[0] = v309 + v308;
      v321 = (void *)[(__CFString *)v383 string];
      objc_msgSend(v321, "getParagraphStart:end:contentsEnd:forRange:", 0, v482, 0, *(void *)&v482[0] - 1, 1);
      if (*(void *)&v482[0] > (unint64_t)(v309 + v308)) {
        CFIndex v308 = *(void *)&v482[0] - v309;
      }
      uint64_t v306 = v420;
    }
    double v322 = v483 + rect1.origin.x;
    if (v483 + rect1.origin.x <= v297 || v297 <= 0.0) {
      double v324 = v483 + rect1.origin.x;
    }
    else {
      double v324 = v297;
    }
    rect1.origin.double x = v483 + rect1.origin.x;
    if (v322 > v297) {
      rect1.origin.double x = v297;
    }
    double v325 = *(double *)(v306 + 120);
    double v326 = *(double *)(v306 + 128);
    double v328 = *(double *)(v306 + 96);
    double v327 = *(double *)(v306 + 104);
    uint64_t v329 = [(NSTypesetter *)self applicationFrameworkContext];
    double v330 = *(double *)(v420 + 136);
    v404[0] = MEMORY[0x1E4F143A8];
    v404[1] = 3221225472;
    v404[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_10;
    v404[3] = &unk_1E55C77A0;
    char v405 = v304;
    char v406 = v285 & 1;
    v404[5] = &v419;
    v404[4] = self;
    __NSCoreTypesetterProcessTextLineFragment((uint64_t)v383, (uint64_t)theString, v384, v309, v308, v329, (uint64_t)v404, 0.0, v330, v326 + v328, v327, v324, v325, v360);
    uint64_t v316 = v420;
  }
  else
  {
    double v310 = *(double *)(v420 + 128);
    double v311 = *(double *)(v420 + 136);
    if (v297 > 0.0 && rect1.origin.x > *(double *)(v420 + 112))
    {
      v482[0] = 0.0;
      *(void *)&long long v417 = 0;
      +[NSCoreTypesetter _maximumAscentAndDescentForRuns:CTLineGetGlyphRuns(*(CTLineRef *)(v420 + 32)) ascender:v482 descender:&v417];
      double v341 = height + v482[0] - *(double *)&v417;
      double v342 = y - v482[0];
      uint64_t v306 = v420;
      CGFloat v339 = v358;
      CGFloat v340 = x;
    }
    double v312 = *(double *)(v306 + 96);
    double v313 = *(double *)(v306 + 104);
    CFRange v314 = *(const __CTLine **)(v306 + 32);
    uint64_t v315 = [(NSTypesetter *)self applicationFrameworkContext];
    v400[0] = MEMORY[0x1E4F143A8];
    v400[1] = 3221225472;
    v400[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_11;
    v400[3] = &unk_1E55C7700;
    char v403 = v370;
    *(double *)&v400[6] = y + v313;
    double v401 = v310 + x + v312;
    double v402 = v311 + y + v313;
    v400[4] = &v466;
    v400[5] = &v470;
    __NSCoreTypesetterRenderLineAndAttachments(v314, a6, v315, v455, 0, (uint64_t)v345, v370, (uint64_t)v400, v401, v402, v340, v342, v339, v341);
    uint64_t v316 = v420;
    if (v352)
    {
      double v317 = *(double *)(v420 + 128);
      double v318 = v351;
      if (v351 > v317) {
        double v318 = *(double *)(v420 + 128);
      }
      double v319 = v317 + rect1.origin.x;
      if (v347 >= v319) {
        double v319 = v347;
      }
      CGFloat v320 = *(double *)(v420 + 104) + *(double *)(v420 + 120);
      v478.double width = v319 - v318;
      v478.double height = v320;
    }
  }
  CFRelease(*(CFTypeRef *)(v316 + 32));
LABEL_616:
  if (v358 > 0.0)
  {
    double v151 = v478.width;
    if (v478.width > v358) {
      v478.double width = v358;
    }
  }
  if (objc_msgSend(v343, "wantsBaselineOffset", v151))
  {
    [v343 setBaselineOffset:*(double *)(v420 + 104) + *(double *)(v420 + 136)];
    [v343 setFirstBaselineOffset:v147];
  }
  [v343 setNumberOfLineFragments:v144];
  objc_msgSend(v343, "setTotalBounds:", v477, v478);
  [(NSParagraphArbitrator *)rectb reset];
  if (a11) {
    a11->var0 = 3;
  }
  _Block_object_dispose(&v419, 8);
LABEL_624:
  if (line) {
    CFRelease(line);
  }
  -[_NSCoreTypesetterLayoutCache setCTLine:attachmentLayoutContext:validForDrawing:]((uint64_t)v350, cf, v455, v454);
  if (cf) {
    CFRelease(cf);
  }
LABEL_628:
  if (a11) {
    a11->var1 = v458[3];
  }
  [(_NSTextAttachmentLayoutContext *)v455 setTextContainer:0];

  _Block_object_dispose(&v457, 8);
LABEL_631:
  if (v370)
  {
    double v331 = v471[4];
    v471[5] = v467[3] + v471[5];
    [a10 setMultilineDeviceMetricsRect:v331];
  }
LABEL_633:
  _Block_object_dispose(&v466, 8);
  _Block_object_dispose(&v470, 8);
  double v333 = *((double *)&v477 + 1);
  double v332 = *(double *)&v477;
  double v335 = v478.height;
  double v334 = v478.width;
  result.size.double height = v335;
  result.size.double width = v334;
  result.origin.double y = v333;
  result.origin.double x = v332;
  return result;
}

- (BOOL)isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a3
{
  if (isSimpleRectangularTextContainerForStartingCharacterAtIndex__onceToken != -1) {
    dispatch_once(&isSimpleRectangularTextContainerForStartingCharacterAtIndex__onceToken, &__block_literal_global_54);
  }
  if (isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !self->_delegateSupportsTextContainer;
  }
  if (v5) {
    return isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple == 0;
  }
  delegate = self->_delegate;

  return [(NSCoreTypesetterDelegateInternal *)delegate coreTypesetter:self isSimpleRectangularTextContainerForStartingCharacterAtIndex:a3];
}

- (NSArray)forcedLineBreaks
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (int64_t)containerBreakMode
{
  return self->_containerBreakMode;
}

- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3
{
  self->_allowsFontOverridingTextAttachmentVerticalMetrics = a3;
}

- (BOOL)requiresCTLineRef
{
  return self->_requiresCTLineRef;
}

+ (BOOL)_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing
{
  if (_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing_onceToken != -1) {
    dispatch_once(&_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing_onceToken, &__block_literal_global_23);
  }
  return _allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing;
}

- (NSTextAnimationKeyframe)keyframe
{
  return (NSTextAnimationKeyframe *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  return self->_limitsLayoutForSuspiciousContents;
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

- (BOOL)usesDefaultHyphenation
{
  return self->_usesDefaultHyphenation;
}

- (BOOL)wantsExtraLineFragment
{
  return self->_wantsExtraLineFragment;
}

- (BOOL)_shouldShowLineBadges
{
  if (_shouldShowLineBadges_once != -1) {
    dispatch_once(&_shouldShowLineBadges_once, &__block_literal_global_73);
  }
  return _shouldShowLineBadges_result;
}

- (NSDictionary)_extraLineFragmentAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)truncatedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTextContainerSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->textContainerSize, &v3, 16, 1, 0);
}

- (void)setEnforcesMinimumTextLineFragment:(BOOL)a3
{
  self->_enforcesMinimumTextLineFragment = a3;
}

+ (void)_lineMetricsForAttributes:(id)a3 typesetterBehavior:(int64_t)a4 usesFontLeading:(BOOL)a5 applySpacings:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8 layoutOrientation:(int64_t)a9 lineHeight:(double *)a10 baselineOffset:(double *)a11 spacing:(double *)a12
{
  BOOL v13 = a7;
  BOOL v14 = a6;
  BOOL v15 = a5;
  double v22 = objc_alloc_init(NSCoreTypesetter);
  [(NSTypesetter *)v22 setTypesetterBehavior:a4];
  [(NSTypesetter *)v22 setUsesFontLeading:v15];
  [(NSCoreTypesetter *)v22 setLayoutOrientation:a9];
  [(NSCoreTypesetter *)v22 setAllowsFontSubstitutionAffectingVerticalMetrics:0];
  LOBYTE(v21) = a8;
  -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](v22, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, a3, 0, v14, v13, v21);
  if (a10) {
    *(void *)a10 = v18;
  }
  if (a11) {
    *(void *)a11 = v19;
  }
  if (a12) {
    *(void *)a12 = v20;
  }
}

- (NSCoreTypesetter)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSCoreTypesetter;
  CGRect result = [(NSCoreTypesetter *)&v3 init];
  if (result)
  {
    result->characterRange.CFIndex location = 0;
    result->characterRange.NSUInteger length = 0;
    result->textContainerSize = (CGSize)*MEMORY[0x1E4F28AE0];
    result->_laidOutLineFragment = 0;
    result->_wantsExtraLineFragment = 1;
    result->_limitsLayoutForSuspiciousContents = 1;
    result->_allowsFontSubstitutionAffectingVerticalMetrics = 1;
    result->_allowsFontOverridingTextAttachmentVerticalMetrics = 1;
    result->_beginningOfDocument = 1;
    result->_keyframe = 0;
    result->_forcedLineBreaks = 0;
  }
  return result;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3
{
  self->_allowsFontSubstitutionAffectingVerticalMetrics = a3;
}

- (__CTRun)_truncationTokenRunRefWithContext:(id *)a3 token:(id)a4 attributes:(id)a5
{
  var2 = a3->var2;
  if (var2)
  {
    if (a3->var0 == a4) {
      return var2;
    }
    if ([a3->var0 isEqualToAttributedString:a4]) {
      return a3->var2;
    }
  }
  if (a4)
  {
    BaseLineFromAttributedString = __NSCoreTypesetterCreateBaseLineFromAttributedString(a4, 0, [a4 length], -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation"), -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"), 0);
  }
  else
  {
    if ([a5 objectForKeyedSubscript:@"NSFont"]) {
      CTFontIsVertical();
    }
    BaseLineFromAttributedString = (const __CTLine *)CTLineCreateWithString();
  }
  CTLineRef v11 = BaseLineFromAttributedString;
  if (BaseLineFromAttributedString)
  {
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(BaseLineFromAttributedString);
    CFIndex Count = CFArrayGetCount(GlyphRuns);
    if (Count)
    {
      unint64_t v14 = Count;
      BOOL v15 = (void *)[a4 attributesAtIndex:0 effectiveRange:0];
      ValueAtIndedouble x = CFArrayGetValueAtIndex(GlyphRuns, 0);
      var2 = (__CTRun *)CFRetain(ValueAtIndex);
      if (a4 && (v14 > 1 || [v15 objectForKeyedSubscript:@"NSAttachment"]))
      {
        double v17 = (__CFDictionary *)[v15 mutableCopy];
        uint64_t v18 = -[_NSTruncationTokenAttachment initWithAttributedString:lineRef:]([_NSTruncationTokenAttachment alloc], a4, 0);
        uint64_t v19 = (const void *)*MEMORY[0x1E4F247B0];
        CTRunDelegateRef v20 = -[_NSTruncationTokenAttachment runDelegate](v18);
        CFDictionarySetValue(v17, v19, v20);
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttachment:v18 attributes:v17];
        CFRelease(v11);
        CTLineRef v11 = __NSCoreTypesetterCreateBaseLineFromAttributedString(v21, 0, [a4 length], -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation"), -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"), 0);
        CFArrayRef v22 = CTLineGetGlyphRuns(v11);
        CFRelease(var2);
        uint64_t v23 = CFArrayGetValueAtIndex(v22, 0);
        var2 = (__CTRun *)CFRetain(v23);

LABEL_19:
        CFRelease(v11);
        goto LABEL_20;
      }
    }
    else
    {
      var2 = 0;
    }
    uint64_t v18 = 0;
    goto LABEL_19;
  }
  var2 = 0;
  uint64_t v18 = 0;
LABEL_20:
  if (a3->var0 != a4)
  {

    a3->var0 = a4;
  }

  a3->var1 = v18;
  char v24 = a3->var2;
  if (v24) {
    CFRelease(v24);
  }
  a3->var2 = var2;
  return var2;
}

- (id)_truncationTokenForRange:(_NSRange *)a3 attributes:(id)a4 originalLineRef:(__CTLine *)a5
{
  if (self->_delegateSupportsTextContainer) {
    return (id)[(NSCoreTypesetterDelegateInternal *)self->_delegate coreTypesetter:self attributedStringForTruncatedCharacterRange:a3 attributes:a4 originalLineRef:a5];
  }
  else {
    return 0;
  }
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)dealloc
{
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCoreTypesetter;
  [(NSTypesetter *)&v3 dealloc];
}

- (__CTLine)_createLineRefForParentLineRef:(const __CTLine *)a3 range:(_NSRange)a4 availableWidth:(double)a5 offset:(double)a6 paragraphArbitrator:(id)a7 lineBreakMode:(int64_t)a8 hyphenated:(BOOL *)a9 forcedClusterBreak:(BOOL *)a10
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v27 = a4.length;
  if ([(NSCoreTypesetter *)self forcedLineBreaks])
  {
    if (self) {
      [(NSCoreTypesetter *)self _forcedLineBreakAfterIndex:location];
    }
    if (location + length) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = location + length;
    }
    uint64_t v18 = v17 - location;
    unint64_t v20 = 0;
  }
  else if (a7)
  {
    uint64_t v16 = CTLineSuggestClusterBreakWithTabOverflow();
    uint64_t v17 = v16;
    if (a8 == 1 || !v16 || (uint64_t v18 = v27, v16 + location >= location + v27))
    {
      unint64_t v20 = v16;
      uint64_t v18 = v16;
    }
    else
    {
      unint64_t v19 = objc_msgSend(a7, "adjustedLineBreakIndexForProposedIndex:");
      if (v19 <= location + v27)
      {
        unint64_t v20 = v19;
        objc_msgSend(a7, "lineBreakContextBeforeIndex:lineFragmentWidth:range:", v19, location, v27, a5);
        uint64_t v18 = -(uint64_t)location;
        uint64_t v17 = 0;
      }
      else
      {
        unint64_t v20 = v17;
      }
    }
  }
  else
  {
    uint64_t v18 = CTLineSuggestLineBreakWithTabOverflow();
    unint64_t v20 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v21 = [(NSCoreTypesetter *)self delegate];
  if (v21)
  {
    CFArrayRef v22 = v21;
    if (objc_opt_respondsToSelector())
    {
      unint64_t v23 = [(NSCoreTypesetterDelegate *)v22 coreTypesetter:self indexToBreakLineByWordBeforeCharacterAtIndex:v20 proposedIndex:v17];
      if (v23 < v20 && v23 > location) {
        uint64_t v18 = v23 - location;
      }
    }
  }
  if (v18) {
    return (__CTLine *)CTLineCreateFromLineWithOffset();
  }
  else {
    return 0;
  }
}

- (NSCoreTypesetterDelegate)delegate
{
  objc_sync_enter(self);
  delegate = self->_delegate;
  objc_sync_exit(self);
  return delegate;
}

- (int64_t)_getFirstOverflowTabStopIndexInLineRef:(__CTLine *)a3 range:(_NSRange)a4 string:(id)a5 paragraphStyle:(id)a6 availableWidth:(double)a7 offset:(double)a8
{
  if (a3) {
    CFIndex length = CTLineGetStringRange(a3).length;
  }
  else {
    CFIndex length = 0;
  }
  if (a7 <= 0.0 || length < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!a6) {
    a6 = [(NSTypesetter *)self defaultParagraphStyle];
  }
  [a6 defaultTabInterval];
  BOOL v15 = v14 == 0.0 ? 0 : (void *)[a6 tabStops];
  double TypographicBounds = CTLineGetTypographicBounds(a3, 0, 0, 0);
  objc_msgSend((id)objc_msgSend(v15, "lastObject"), "location");
  if (TypographicBounds < v17) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = CTLineGetStringIndexOfTabOverflow();
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(double *)(v5 + 24) == 1.79769313e308) {
      *(void *)(v5 + 24) = *(void *)(a1 + 48);
    }
    double v6 = a3 - *(double *)(a1 + 48);
    double v7 = a2 + *(double *)(a1 + 56);
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
  }
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(double *)(v6 + 24) == 1.79769313e308) {
      *(void *)(v6 + 24) = *(void *)(a1 + 64);
    }
    double v7 = a3 - *(double *)(a1 + 64);
    double v8 = a2 + *(double *)(a1 + 72);
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 48)
                                                              + *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 40);
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_11(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(double *)(v5 + 24) == 1.79769313e308) {
      *(void *)(v5 + 24) = *(void *)(a1 + 48);
    }
    double v6 = a3 - *(double *)(a1 + 48);
    double v7 = a2 + *(double *)(a1 + 56);
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8)+ 32));
  }
}

+ (void)_maximumAscentAndDescentForRuns:(__CFArray *)a3 ascender:(double *)a4 descender:(double *)a5
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      if (!CFArrayGetValueAtIndex(a3, v10) || (Font = (void *)CTRunGetFont()) == 0) {
        Font = NSDefaultFont();
      }
      [Font boundingRectForFont];
      if (v14 < v11) {
        double v11 = v14;
      }
      if (v14 + v15 > v12) {
        double v12 = v14 + v15;
      }
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    double v12 = 0.0;
    double v11 = 0.0;
  }
  *a4 = ceil(v12);
  *a5 = floor(v11);
}

- (void)set_extraLineFragmentAttributes:(id)a3
{
}

- (void)setWantsExtraLineFragment:(BOOL)a3
{
  self->_wantsExtraLineFragment = a3;
}

- (void)setValidateLineBreakIndex:(id)a3
{
}

- (void)setUsesDefaultHyphenation:(BOOL)a3
{
  self->_usesDefaultHyphenation = a3;
}

- (void)setTypographicBoundsIncludesLineFragmentPadding:(BOOL)a3
{
  self->_typographicBoundsIncludesLineFragmentPadding = a3;
}

- (void)setRequiresCTLineRef:(BOOL)a3
{
  self->_requiresCTLineRef = a3;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3
{
  self->_limitsLayoutForSuspiciousContents = a3;
}

- (void)setLaidOutLineFragment:(id)a3
{
}

- (void)setKeyframe:(id)a3
{
}

- (void)setForcedLineBreaks:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  objc_sync_enter(self);
  if (self->_delegate != a3)
  {
    self->_delegate = (NSCoreTypesetterDelegateInternal *)a3;
    if (objc_opt_respondsToSelector()) {
      char v5 = objc_opt_respondsToSelector();
    }
    else {
      char v5 = 0;
    }
    self->_delegateSupportsTextContainer = v5 & 1;
    self->_delegatesSupportsTruncationToken = objc_opt_respondsToSelector() & 1;
  }

  objc_sync_exit(self);
}

- (void)setContainerBreakMode:(int64_t)a3
{
  self->_containerBreakMode = a3;
}

- (void)setCharacterRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->characterRange, &v3, 16, 1, 0);
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (void)setBeginningOfDocument:(BOOL)a3
{
  self->_beginningOfDocument = a3;
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 145) && *(void *)(v4 + 32))
  {
    objc_msgSend(a2, "setLineRef:");
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  [a2 setIsHyphenated:*(unsigned __int8 *)(v4 + 144)];
  [a2 setIsTruncated:*(unsigned __int8 *)(a1 + 48)];
  char v5 = *(uint64_t (**)(void))([*(id *)(a1 + 32) laidOutLineFragment] + 16);

  return v5();
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  LOBYTE(v34) = 0;
  objc_msgSend(a2, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, a3, *(void *)(a1 + 32), 1, 0, v34);
  double v13 = v12;
  uint64_t v15 = v14;
  double v17 = v16;
  double v18 = *(double *)(a1 + 72);
  uint64_t v19 = [a2 characterRange];
  if ([a2 isSimpleRectangularTextContainerForStartingCharacterAtIndex:v19])
  {
    CGFloat v20 = *(double *)(a1 + 64);
    if (v18 <= 0.0) {
      double v18 = v13;
    }
    CGFloat v21 = 0.0;
    CGFloat v22 = 0.0;
  }
  else
  {
    objc_msgSend(a2, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v19, 0, 0, 0.0, 0.0, 10000000.0, v13);
    CGFloat v21 = v23;
    CGFloat v22 = v24;
    CGFloat v20 = v25;
    double v18 = v26;
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 57)) {
    uint64_t v27 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v27 = 0;
  }
  *a6 = v27;
  v37.origin.double x = v21;
  v37.origin.double y = v22;
  v37.size.double width = v20;
  v37.size.double height = v18;
  if (CGRectGetHeight(v37) + 0.001 >= v13
    || (uint64_t result = [a2 enforcesMinimumTextLineFragment], result))
  {
    v38.origin.double x = v21;
    v38.origin.double y = v22;
    v38.size.double width = v20;
    v38.size.double height = v18;
    if (CGRectGetWidth(v38) == 10000000.0)
    {
      double v32 = 0.0;
      goto LABEL_28;
    }
    int v29 = (void *)[a2 _paragraphStyleFromAttributes:a3];
    NSWritingDirection v30 = [v29 baseWritingDirection];
    if (v30 == NSWritingDirectionNatural) {
      NSWritingDirection v30 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
    }
    unint64_t v31 = [v29 horizontalAlignment];
    if (v31 > 1)
    {
      unint64_t v33 = v31;
      double v35 = 0.0;
      double v36 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:v29 baseWidth:v30 writingDirection:1 isBeginningOfParagraph:&v36 minPosition:&v35 maxPosition:*(double *)(a1 + 64)];
      if (v33 == 4)
      {
        double v32 = (v36 + v35) * 0.5;
        goto LABEL_28;
      }
      if (v33 == 3) {
        goto LABEL_18;
      }
      double v32 = 0.0;
      if (v33 != 2) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v31 == 1)
      {
        if (v30 != NSWritingDirectionRightToLeft)
        {
LABEL_17:
          double v35 = 0.0;
          double v36 = 0.0;
          +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:v29 baseWidth:v30 writingDirection:1 isBeginningOfParagraph:&v36 minPosition:&v35 maxPosition:*(double *)(a1 + 64)];
LABEL_18:
          double v32 = v35;
LABEL_28:
          *a5 = 0;
          a5[1] = v15;
          *(double *)a4 = v32;
          *(void *)(a4 + 8) = 0;
          *(void *)(a4 + 16) = 0;
          *(double *)(a4 + 24) = v13 + v17;
          return 1;
        }
      }
      else if (v30 == NSWritingDirectionRightToLeft)
      {
        goto LABEL_17;
      }
      double v35 = 0.0;
      double v36 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:v29 baseWidth:v30 writingDirection:1 isBeginningOfParagraph:&v36 minPosition:&v35 maxPosition:*(double *)(a1 + 64)];
    }
    double v32 = v36;
    goto LABEL_28;
  }
  return result;
}

- (void)layoutWithYOrigin:(double)a3
{
  [(NSTypesetter *)self lineFragmentPadding];
  double v7 = v6;
  [(NSCoreTypesetter *)self textContainerSize];
  double v9 = v8;
  [(NSCoreTypesetter *)self textContainerSize];
  double v11 = v10;
  [(NSMutableArray *)self->_truncatedRanges removeAllObjects];
  double v12 = 0.0;
  if (a3 <= 0.0 || v11 <= 0.0 || (double v11 = v11 - a3, v12 = a3, v11 > 0.0))
  {
    uint64_t v13 = [(NSCoreTypesetter *)self characterRange];
    uint64_t v15 = v14;
    double v16 = [(NSTypesetter *)self attributedString];
    double v17 = -[NSAttributedString attributedSubstringFromRange:](v16, "attributedSubstringFromRange:", v13, v15);
    if ([(NSTypesetter *)self usesFontLeading]) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 1;
    }
    uint64_t v19 = objc_alloc_init(NSStringDrawingContext);
    [(NSStringDrawingContext *)v19 setActiveRenderers:3];
    [(NSStringDrawingContext *)v19 setMaximumNumberOfLines:[(NSCoreTypesetter *)self maximumNumberOfLines]];
    v50[0] = 0;
    CFStringRef v20 = [(NSAttributedString *)v17 string];
    CFStringRef v21 = v20;
    if (v20) {
      CFIndex Length = CFStringGetLength(v20);
    }
    else {
      CFIndex Length = 0;
    }
    uint64_t v23 = __NSUltraFastLineBreakFinder(v21, Length, (unsigned char *)v50 + 1, v50);
    CTSwapLineBreakEpsilon();
    double lineFragmentOriginYOffset = self->_lineFragmentOriginYOffset;
    self->_double lineFragmentOriginYOffset = a3;
    if (Length > 1 || v23 >= 1)
    {
      -[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](self, "_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:", v17, 0, 0, 0, v18, v19, 0.0, v12, v9 + v7 * -2.0, v11, 0.0, 0);
    }
    else if ([(NSCoreTypesetter *)self laidOutLineFragment])
    {
      double v25 = [(NSAttributedString *)v17 length]
          ? [(NSAttributedString *)v17 attributesAtIndex:0 effectiveRange:0]
          : self->__extraLineFragmentAttributes;
      double v48 = 0.0;
      double v49 = 0.0;
      long long v46 = 0u;
      long long v47 = 0u;
      SEL v44 = a2;
      double v45 = 0.0;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      double v35 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, double *, double *))__38__NSCoreTypesetter_layoutWithYOrigin___block_invoke;
      double v36 = &unk_1E55C7610;
      CGRect v38 = self;
      uint64_t v39 = 0;
      double v40 = v12;
      double v41 = v9 + v7 * -2.0;
      CGRect v37 = v17;
      double v42 = v11;
      double v43 = v7;
      double v26 = v25;
      if (__38__NSCoreTypesetter_layoutWithYOrigin___block_invoke((uint64_t)v34, self, (uint64_t)v25, (uint64_t)&v46, &v48, &v45))
      {
        uint64_t v27 = [(NSTypesetter *)self applicationFrameworkContext];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_2;
        v33[3] = &unk_1E55C7638;
        v33[4] = self;
        double v28 = *((double *)&v46 + 1);
        double v29 = *((double *)&v47 + 1);
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v16, (uint64_t)&stru_1EDD49F70, (uint64_t)v26, v13, Length, v27, (uint64_t)v33, v48, v49, *(double *)&v46, *((double *)&v46 + 1), *(double *)&v47, *((double *)&v47 + 1), v45);
        if (self->_wantsExtraLineFragment && v23 < Length)
        {
          extraLineFragmentAttributes = self->__extraLineFragmentAttributes;
          if (v26 != extraLineFragmentAttributes
            && ![(NSDictionary *)v26 isEqualToDictionary:self->__extraLineFragmentAttributes])
          {
            v35((uint64_t)v34, self, (uint64_t)extraLineFragmentAttributes, (uint64_t)&v46, &v48, &v45);
            double v29 = *((double *)&v47 + 1);
            double v28 = *((double *)&v46 + 1);
          }
          *((double *)&v46 + 1) = v29 + v28;
          uint64_t v31 = [(NSTypesetter *)self applicationFrameworkContext];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_3;
          v32[3] = &unk_1E55C7638;
          v32[4] = self;
          __NSCoreTypesetterProcessTextLineFragment((uint64_t)v16, (uint64_t)&stru_1EDD49F70, (uint64_t)v26, Length + v13, 0, v31, (uint64_t)v32, v48, v49, *(double *)&v46, *((double *)&v46 + 1), *(double *)&v47, *((double *)&v47 + 1), v45);
        }
      }
    }
    CTSwapLineBreakEpsilon();
    self->_double lineFragmentOriginYOffset = lineFragmentOriginYOffset;
  }
}

- (CGSize)textContainerSize
{
  objc_copyStruct(v4, &self->textContainerSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (_NSRange)characterRange
{
  objc_copyStruct(v4, &self->characterRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.CFIndex length = v3;
  result.NSUInteger location = v2;
  return result;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v4 + 145) && *(void *)(v4 + 32)) {
    objc_msgSend(a2, "setLineRef:");
  }
  if (*(void *)(a1 + 32)) {
    objc_msgSend(a2, "setLineBadge:");
  }
  [a2 setIsHyphenated:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 144)];
  [a2 setIsTruncated:*(unsigned __int8 *)(a1 + 56)];
  char v5 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 64) + 16);

  return v5();
}

- (int64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16))();
}

uint64_t __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_2(void *a1, void *a2)
{
  [a2 setGlyphs:a1[5] advances:a1[6] count:a1[7] elasticCount:a1[8] font:a1[9]];
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(a1[4] + 64) + 16);

  return v3();
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_9(uint64_t a1, void *a2)
{
  [a2 setIsExtra:1];
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);

  return v3();
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40)) {
    objc_msgSend(a2, "setLineRef:");
  }
  [a2 setIsTruncated:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);

  return v4();
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, char a4, __n128 a5)
{
  uint64_t v28 = 0;
  if ((a4 & 1) != 0 && (uint64_t v8 = CTLineCreateFromLineWithOffset()) != 0)
  {
    double v9 = (const void *)v8;
    uint64_t v27 = 0;
    long long v15 = *MEMORY[0x1E4F28AD8];
    uint64_t v10 = *(void *)(MEMORY[0x1E4F28AD8] + 16);
    uint64_t v11 = *(void *)(MEMORY[0x1E4F28AD8] + 24);
    uint64_t v12 = *MEMORY[0x1E4F28AD0];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F28AD0] + 8);
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    long long v22 = v15;
    uint64_t v23 = v10;
    uint64_t v24 = v11;
    uint64_t v25 = v12;
    uint64_t v26 = v13;
    uint64_t v19 = +[NSParagraphStyle defaultParagraphStyle];
    CFTypeRef cf = v9;
    __NSCoreTypesetterHyphenateLine((uint64_t)&cf, [*(id *)(a1 + 32) softHyphen], 0, (double *)&v28, 0);
    CFRelease(cf);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    a5.n128_u64[0] = 0;
    MEMORY[0x1F40DF828](v14, a2, a3, a5);
  }
}

- (id)softHyphen
{
  return @"‐";
}

uint64_t __86__NSCoreTypesetter__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  _allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing = result;
  return result;
}

uint64_t __80__NSCoreTypesetter_isSimpleRectangularTextContainerForStartingCharacterAtIndex___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"_NSCoreTypesetterForcesNonSimpleLayout");
  isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple = result;
  return result;
}

uint64_t __41__NSCoreTypesetter__shouldShowLineBadges__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSCoreTypesetterDebugBadgesEnabled");
  _shouldShowLineBadges_uint64_t result = result;
  return result;
}

CFTypeRef __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke()
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFTypeRef result = CFRetain(Predefined);
  _NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__whitespaceCharacterSet = (uint64_t)result;
  return result;
}

- (void)layout
{
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setIsExtra:1];
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);

  return v3();
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(int64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat x = a3.origin.x;
  double v11 = a3.origin.y + self->_lineFragmentOriginYOffset;
  if (self->_delegateSupportsTextContainer)
  {
    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v29 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v30 = v12;
    -[NSCoreTypesetterDelegateInternal coreTypesetter:lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self->_delegate, "coreTypesetter:lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", self, a4, a5, &v29, a3.origin.x, v11, a3.size.width, a3.size.height);
    CGFloat x = v13;
    double v11 = v14;
    double width = v15;
    double height = v16;
    if (!a6) {
      goto LABEL_16;
    }
    double lineFragmentOriginYOffset = self->_lineFragmentOriginYOffset;
    if (v29.y >= lineFragmentOriginYOffset) {
      v29.double y = v29.y - lineFragmentOriginYOffset;
    }
    CGPoint v18 = v29;
    CGSize v19 = v30;
    goto LABEL_15;
  }
  [(NSCoreTypesetter *)self textContainerSize];
  double v22 = v21;
  if (v20 > 0.0)
  {
    double v23 = v20;
    v31.origin.CGFloat x = x;
    v31.origin.double y = v11;
    v31.size.double width = width;
    v31.size.double height = height;
    if (v23 < CGRectGetMaxX(v31))
    {
      v32.origin.CGFloat x = x;
      v32.origin.double y = v11;
      v32.size.double width = width;
      v32.size.double height = height;
      double width = v23 - CGRectGetMinX(v32);
    }
  }
  if (v22 > 0.0)
  {
    v33.origin.CGFloat x = x;
    v33.origin.double y = v11;
    v33.size.double width = width;
    v33.size.double height = height;
    if (v22 < CGRectGetMaxY(v33)
      && ![(NSCoreTypesetter *)self enforcesMinimumTextLineFragment])
    {
      v34.origin.CGFloat x = x;
      v34.origin.double y = v11;
      v34.size.double width = width;
      v34.size.double height = height;
      double height = v22 - CGRectGetMinY(v34);
    }
  }
  if (a6)
  {
    CGPoint v18 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
LABEL_15:
    a6->CGPoint origin = v18;
    a6->CGSize size = v19;
  }
LABEL_16:
  double v24 = self->_lineFragmentOriginYOffset;
  if (v11 < v24) {
    double v24 = 0.0;
  }
  double v25 = v11 - v24;
  double v26 = x;
  double v27 = width;
  double v28 = height;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v25;
  result.origin.CGFloat x = v26;
  return result;
}

uint64_t __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setIsExtra:1];
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);

  return v3();
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_forcedLineBreakAfterIndex:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSCoreTypesetter *)self forcedLineBreaks]) {
    -[NSCoreTypesetter _forcedLineBreakAfterIndex:]();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v7 = [(NSCoreTypesetter *)self forcedLineBreaks];
  CGRect result = ($F08F7EC4C389A89376F473094BC6C9F8 *)[(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    double v9 = result;
    uint64_t v10 = *(void *)v14;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      CGSize v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
      retstr->var1 = 0;
      *(void *)&retstr->var2 = 0;
      retstr->var0 = 0;
      if (v12)
      {
        CGRect result = ($F08F7EC4C389A89376F473094BC6C9F8 *)objc_msgSend(v12, "UIF_lineBreakContextValue");
        if (retstr->var0 > a4) {
          break;
        }
      }
      if (v9 == ($F08F7EC4C389A89376F473094BC6C9F8 *)++v11)
      {
        CGRect result = ($F08F7EC4C389A89376F473094BC6C9F8 *)[(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        double v9 = result;
        if (result) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    *(_OWORD *)&retstr->var0 = NSLineBreakContextNull;
    *(void *)&retstr->var2 = 0;
  }
  return result;
}

- (__CTLine)_createLayoutLineFragmentStartingWithCharacterIndex:(int64_t *)a3 proposedLineFragmentRect:(CGRect *)a4 baseLineRef:(const __CTLine *)a5 range:(_NSRange)a6 paragraphStyle:(id)a7 paragraphArbitrator:(id)a8 lineBreakMode:(int64_t)a9 hasAttachments:(BOOL)a10 lineFragmentRect:(CGRect *)a11 glyphOrigin:(CGPoint *)a12 hyphenated:(BOOL *)a13 forcedClusterBreak:(BOOL *)a14
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  CGSize v19 = [(NSTypesetter *)self attributedString];
  double v20 = [(NSAttributedString *)v19 string];
  double v91 = v19;
  uint64_t v90 = [(NSAttributedString *)v19 attributesAtIndex:*a3 effectiveRange:0];
  if (!a7) {
    a7 = [(NSTypesetter *)self defaultParagraphStyle];
  }
  uint64_t IsRightToLeft = [a7 baseWritingDirection];
  CGSize v22 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  v103.CGPoint origin = (CGPoint)*MEMORY[0x1E4F28AD8];
  v103.CGSize size = v22;
  unint64_t v23 = *a3;
  NSTypesetterBehavior v24 = [(NSTypesetter *)self typesetterBehavior];
  double v101 = 0.0;
  double v102 = 0.0;
  [(NSTypesetter *)self lineFragmentPadding];
  double v26 = v25;
  double v98 = 0.0;
  CGFloat v99 = 0.0;
  double v100 = 0.0;
  double x = a4->origin.x;
  double y = a4->origin.y;
  v106.double width = a4->size.width;
  double height = a4->size.height;
  double width = v106.width;
  v106.double height = height;
  if (NSEqualSizes(v106, *MEMORY[0x1E4F28AE0]))
  {
    if (v23) {
      LOBYTE(v28) = 1;
    }
    else {
      int v28 = ![(NSCoreTypesetter *)self isBeginningOfDocument];
    }
    LOBYTE(v82) = v28;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", v23, 0, v90, v91, 1, 0, v82);
    double height = v29;
    double v98 = v29;
    CGFloat v99 = v30;
    double v100 = v31;
    double width = 10000000.0;
  }
  uint64_t v84 = a4;
  if ((uint64_t)v23 < 1) {
    goto LABEL_19;
  }
  if (v23 == 1)
  {
    unint64_t v32 = 0;
  }
  else
  {
    int v33 = [(NSString *)v20 characterAtIndex:v23 - 1];
    unint64_t v32 = v23 - 1;
    if (v33 == 10)
    {
      if ([(NSString *)v20 characterAtIndex:v23 - 2] == 13) {
        unint64_t v32 = v23 - 2;
      }
      else {
        unint64_t v32 = v23 - 1;
      }
    }
  }
  char v34 = [(NSTypesetter *)self actionForControlCharacterAtIndex:v32];
  if ((v34 & 0x10) != 0 || v24 <= NSTypesetterBehavior_10_3 && (v34 & 0x20) != 0)
  {
LABEL_19:
    BOOL v35 = 1;
  }
  else
  {
    unint64_t v80 = [(NSTypesetter *)self attributedString];
    uint64_t v104 = 0;
    uint64_t v105 = 0;
    id v81 = [(NSAttributedString *)v80 attribute:@"NSAttachment" atIndex:v23 - 1 effectiveRange:&v104];
    if (v105 + v104 > v23 || !v81)
    {
      if ([(NSString *)v20 length] <= v23)
      {
        id v81 = 0;
      }
      else
      {
        id v81 = [(NSAttributedString *)v80 attribute:@"NSAttachment" atIndex:v23 effectiveRange:&v104];
        if (v105 + v104 > v23) {
          id v81 = 0;
        }
      }
    }
    BOOL v35 = [v81 embeddingType] == 1;
  }
  BOOL v86 = v35;
  NSUInteger v36 = length;
  if (IsRightToLeft == -1) {
    uint64_t IsRightToLeft = CTLineIsRightToLeft();
  }
  CGRect v37 = 0;
  double v87 = -v26;
  unint64_t v88 = location + v36;
  CGFloat v38 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat v93 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat v95 = *MEMORY[0x1E4F28AD8];
  char v85 = 1;
  CGFloat v39 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  while (1)
  {
    [(NSCoreTypesetter *)self beginLine];
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v23, IsRightToLeft, &v103, x, y, width, height);
    if (v42 == 0.0) {
      break;
    }
    CGFloat v43 = v40;
    double v44 = v41;
    double v45 = v42;
    double v46 = v42 + v87 * 2.0;
    +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:a7 baseWidth:IsRightToLeft writingDirection:v86 isBeginningOfParagraph:&v102 minPosition:&v101 maxPosition:v46];
    double v47 = v101;
    if (v101 <= v46)
    {
      if (v101 < 0.0)
      {
        double v101 = 0.0;
        double v47 = 0.0;
      }
    }
    else
    {
      double v101 = v46;
      double v47 = v46;
    }
    double v48 = v102;
    if (v102 >= 0.0)
    {
      if (v102 > v47)
      {
        double v102 = v47;
        double v48 = v47;
      }
    }
    else
    {
      double v102 = 0.0;
      double v48 = 0.0;
    }
    if (v47 > v48) {
      double v46 = v47 - v48;
    }
    if (v37)
    {
      CFRelease(v37);
      double v48 = v102;
    }
    CGRect v37 = -[NSCoreTypesetter _createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:](self, "_createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:", a5, *a3, v88 - *a3, a8, a9, a13, v46, v48, a14);
    CFRange StringRange = CTLineGetStringRange(v37);
    unint64_t v23 = StringRange.location;
    if (StringRange.location <= 0) {
      int v50 = ![(NSCoreTypesetter *)self isBeginningOfDocument];
    }
    else {
      LOBYTE(v50) = 1;
    }
    LOBYTE(v83) = v50;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", StringRange.location, StringRange.length, v90, v91, 1, 0, v83);
    double v52 = v51;
    double v98 = v51;
    CGFloat v99 = v53;
    double v100 = v54;
    if (v37) {
      BOOL v55 = !a10;
    }
    else {
      BOOL v55 = 1;
    }
    if (!v55)
    {
      __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(v37, &v98, &v99);
      double v52 = v98;
    }
    if (v52 == height) {
      goto LABEL_49;
    }
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", StringRange.location, IsRightToLeft, &v103, x, v44, width, v52);
    double v60 = v59;
    if (v45 == v58 && v58 != 0.0 && v59 != 0.0)
    {
      double v52 = v59;
      double v45 = v58;
      double v44 = v57;
      CGFloat v43 = v56;
LABEL_49:
      CGFloat v62 = v93;
      CGFloat v61 = v95;
      goto LABEL_61;
    }
    CGFloat v64 = v93;
    CGFloat v63 = v95;
    if (v52 <= height)
    {
      if (v59 <= height)
      {
        if (v57 == v44 || v45 == v58)
        {
          double v65 = v52;
          CGFloat v66 = v52;
        }
        else
        {
          double x = v56;
          double width = 10000000.0;
          CGFloat v43 = v95;
          double v44 = v93;
          double v45 = v38;
          double v65 = v39;
          CGFloat v66 = v39;
          double height = v60;
          double y = v57;
        }
      }
      else
      {
        double v67 = width;
        if (!(v85 & 1 | (v58 >= v45))) {
          double v67 = v58;
        }
        double width = v67;
        CGFloat v43 = v95;
        double v44 = v93;
        double v45 = v38;
        double v65 = v39;
        CGFloat v66 = v39;
        double height = v52;
        char v85 = 0;
      }
    }
    else
    {
      CGFloat v43 = v95;
      double v44 = v93;
      double v45 = v38;
      double v65 = v39;
      CGFloat v66 = v39;
      double height = v52;
    }
    CGFloat v68 = v43;
    double v69 = v44;
    double v70 = v45;
    CGFloat v71 = v38;
    CGFloat v72 = v39;
    BOOL v73 = NSEqualRects(*(NSRect *)(&v65 - 3), *(NSRect *)&v63);
    CGFloat v62 = v93;
    CGFloat v61 = v95;
    double v52 = v66;
    if (!v73) {
      break;
    }
LABEL_61:
    v107.origin.double x = v43;
    v107.origin.double y = v44;
    v107.size.double width = v45;
    v107.size.double height = v52;
    CGFloat v74 = v38;
    CGFloat v75 = v39;
    if (!NSEqualRects(v107, *(NSRect *)&v61))
    {
      [(NSCoreTypesetter *)self endLine];
      *a3 = StringRange.location + StringRange.length;
      [(NSTypesetter *)self lineFragmentPadding];
      double v77 = v45 + v76 * -2.0;
      v108.origin.double y = v93;
      v108.origin.double x = v95;
      v108.size.double width = v38;
      v108.size.double height = v39;
      if (NSEqualRects(v103, v108) || v88 <= *a3)
      {
        v103.origin.double x = 0.0;
        v103.origin.double y = v52 + v44 + v100;
        v103.CGSize size = 0uLL;
      }
      CGSize size = v103.size;
      v84->CGPoint origin = v103.origin;
      v84->CGSize size = size;
      a11->origin.double x = v43;
      a11->origin.double y = v44;
      a11->size.double width = v77;
      a11->size.double height = v52;
      size.double width = v99;
      a12->double x = v102;
      a12->double y = size.width;
      return v37;
    }
  }
  if (v37)
  {
    CFRelease(v37);
    return 0;
  }
  return v37;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  if ([*(id *)(a1 + 32) length] <= a2)
  {
    uint64_t result = 0;
    if (a3)
    {
      *a3 = a2;
      a3[1] = 0;
    }
  }
  else
  {
    long long v11 = 0uLL;
    if (a3) {
      double v6 = &v11;
    }
    else {
      double v6 = 0;
    }
    double v7 = objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a2, v6, v11);
    uint64_t v8 = v7;
    if (a3) {
      *(_OWORD *)a3 = v11;
    }
    uint64_t result = [v7 objectForKeyedSubscript:@"NSLink"];
    if (result)
    {
      uint64_t v10 = *(void *)(a1 + 48);
      if (v10) {
        return (*(uint64_t (**)(uint64_t, void *, unint64_t))(v10 + 16))(v10, v8, a2);
      }
      else {
        return *(void *)(a1 + 40);
      }
    }
  }
  return result;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
}

- (id)validateLineBreakIndex
{
  return objc_getProperty(self, a2, 72, 1);
}

- (BOOL)typographicBoundsIncludesLineFragmentPadding
{
  return self->_typographicBoundsIncludesLineFragmentPadding;
}

- (void)_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:.cold.1()
{
}

- (void)_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:.cold.2()
{
  __assert_rtn("-[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:]", "NSCoreTypesetter.m", 1315, "glyphs != NULL && advances != NULL && resolvedFont != NULL");
}

- (void)_forcedLineBreakAfterIndex:.cold.1()
{
  __assert_rtn("-[NSCoreTypesetter _forcedLineBreakAfterIndex:]", "NSCoreTypesetter.m", 1933, "nil != self.forcedLineBreaks");
}

@end