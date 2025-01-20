@interface NSLineFragmentRenderingContext
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)_usesSimpleTextEffects;
- (BOOL)isRTL;
- (CGRect)imageBounds;
- (CGSize)sizeWithBehavior:(int64_t)a3 usesFontLeading:(BOOL)a4 baselineDelta:(double *)a5;
- (CUICatalog)cuiCatalog;
- (CUIStyleEffectConfiguration)cuiStyleEffects;
- (NSLineFragmentRenderingContext)initWithTextStorage:(id)a3 runs:(__CFArray *)a4 glyphOrigin:(double)a5 lineFragmentWidth:(double)a6 elasticWidth:(double)a7 usesScreenFonts:(BOOL)a8 isRTL:(BOOL)a9 applicationFrameworkContext:(int64_t)a10;
- (double)elasticWidth;
- (double)lineFragmentWidth;
- (int64_t)applicationFrameworkContext;
- (int64_t)resolvedBaseWritingDirection;
- (int64_t)resolvedTextAlignment;
- (void)_setUsesSimpleTextEffects:(BOOL)a3;
- (void)dealloc;
- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4;
- (void)finalize;
- (void)getMaximumAscender:(double *)a3 minimumDescender:(double *)a4;
- (void)release;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setCuiCatalog:(id)a3;
- (void)setCuiStyleEffects:(id)a3;
- (void)setResolvedBaseWritingDirection:(int64_t)a3;
- (void)setResolvedTextAlignment:(int64_t)a3;
@end

@implementation NSLineFragmentRenderingContext

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3) {
    LOBYTE(a3) = _NSTextScalingTypeForCurrentEnvironment();
  }
  self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFF8F | (16 * (a3 & 7)));
}

- (void)release
{
  os_unfair_lock_lock_with_options();
  if ([(NSLineFragmentRenderingContext *)self retainCount] == 1
    && (self->_textStorage,
        self->_textStorage = 0,
        uint64_t v3 = __NSRenderingContextCacheNextIndex,
        __NSRenderingContextCacheNextIndex <= 2))
  {
    ++__NSRenderingContextCacheNextIndex;
    __NSRenderingContextCache[v3] = self;
    runs = (CFTypeRef *)self->_runs;
    int64_t numRuns = self->_numRuns;
    self->_runs = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
    if (runs)
    {
      if (numRuns >= 1)
      {
        v6 = (char *)&runs[16 * numRuns];
        v7 = runs;
        do
        {
          if (((_BYTE)v7[15] & 1) == 0) {
            CFRelease(v7[6]);
          }
          CFTypeRef v8 = *v7;
          v7 += 16;
          CFRelease(v8);
        }
        while (v7 < (CFTypeRef *)v6);
      }
      NSZoneFree(0, runs);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
    v9.receiver = self;
    v9.super_class = (Class)NSLineFragmentRenderingContext;
    [(NSLineFragmentRenderingContext *)&v9 release];
  }
}

- (double)lineFragmentWidth
{
  return self->_lineWidth;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSRenderingContextCacheNextIndex;
  if (!__NSRenderingContextCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NSLineFragmentRenderingContext;
    return objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSRenderingContextCacheNextIndex;
  v6 = (void *)__NSRenderingContextCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
  if (!v6) {
    goto LABEL_5;
  }
  return v6;
}

- (void)setResolvedTextAlignment:(int64_t)a3
{
  self->_resolvedAlignment = a3;
}

- (void)setResolvedBaseWritingDirection:(int64_t)a3
{
  self->_resolvedDirection = a3;
}

- (CGRect)imageBounds
{
  v62[78] = *MEMORY[0x1E4F143B8];
  NSRect v68 = *(NSRect *)*(void *)&MEMORY[0x1E4F28AD8];
  CGFloat y = v68.origin.y;
  CGFloat v53 = *MEMORY[0x1E4F28AD8];
  CGFloat height = v68.size.height;
  CGFloat width = v68.size.width;
  if (NSEqualRects(self->_imageBounds, *MEMORY[0x1E4F28AD8]))
  {
    int64_t numRuns = self->_numRuns;
    double v4 = -1.0;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      double v4 = 1.0;
    }
    double v55 = v4;
    if (numRuns < 1)
    {
      double v9 = y;
      double v58 = width;
      double v59 = height;
      double v10 = v53;
    }
    else
    {
      runs = (char *)self->_runs;
      v47 = &runs[128 * numRuns];
      uint64_t v6 = MEMORY[0x1E4F1DAB8];
      CGFloat v54 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
      glyphs = self->_glyphs;
      advancements = self->_advancements;
      double v9 = y;
      double v10 = v53;
      double v58 = width;
      double v59 = height;
      double v11 = 0.0;
      do
      {
        double v48 = v11;
        if (runs[120])
        {
          double v32 = *((double *)runs + 8);
          double v34 = *((double *)runs + 9);
          double v33 = *((double *)runs + 10);
          double v35 = v11 + *((double *)runs + 7);
          if (__NSImageBoundsOriginZero) {
            goto LABEL_35;
          }
          v66.origin.double x = v10;
          v66.origin.CGFloat y = v9;
          v66.size.CGFloat width = v58;
          v66.size.CGFloat height = v59;
          v70.origin.CGFloat y = y;
          v70.origin.double x = v53;
          v70.size.CGFloat height = height;
          v70.size.CGFloat width = width;
          if (!NSEqualRects(v66, v70))
          {
LABEL_35:
            double v36 = v35 - v10;
            if (v35 >= v10) {
              double v36 = 0.0;
            }
            double v37 = v58 - v36;
            if (v35 < v10) {
              double v10 = v35;
            }
            double v38 = -0.0;
            if (v35 + v34 > v10 + v37) {
              double v38 = v35 + v34 - (v10 + v37);
            }
            double v58 = v37 + v38;
            double v39 = v32 - v9;
            if (v32 >= v9) {
              double v39 = 0.0;
            }
            double v40 = v59 - v39;
            if (v32 < v9) {
              double v9 = v32;
            }
            if (v32 + v33 > v9 + v40) {
              double v40 = v40 + v32 + v33 - (v9 + v40);
            }
            double v59 = v40;
          }
          else
          {
            double v58 = v34;
            double v59 = v33;
            double v9 = v32;
            double v10 = v35;
          }
        }
        else
        {
          uint64_t v12 = *((void *)runs + 1);
          if (v12 >= 1)
          {
            CGFloat v56 = *((double *)runs + 12);
            CGFloat v57 = *((double *)runs + 11);
            double v13 = *((double *)runs + 14);
            double v14 = v11 + *((double *)runs + 13);
            v49 = runs;
            do
            {
              if (v12 >= 20) {
                uint64_t v15 = 20;
              }
              else {
                uint64_t v15 = v12;
              }
              [*((id *)runs + 6) getBoundingRects:v61 forCGGlyphs:glyphs count:v15];
              int v16 = __NSImageBoundsOriginZero;
              v17 = v62;
              uint64_t v18 = v15;
              do
              {
                CGRect v63 = *(CGRect *)(v17 - 2);
                v60.a = v57;
                v60.b = v54;
                v60.c = v56;
                *(_OWORD *)&v60.d = *(_OWORD *)(v6 + 24);
                v60.tCGFloat y = *(CGFloat *)(v6 + 40);
                CGRect v64 = CGRectApplyAffineTransform(v63, &v60);
                double v19 = v64.size.width;
                double v20 = v64.size.height;
                double v21 = v14 + v64.origin.x;
                double v22 = v13 + v64.origin.y;
                if (v16) {
                  goto LABEL_16;
                }
                v65.origin.double x = v10;
                v65.origin.CGFloat y = v9;
                v65.size.CGFloat width = v58;
                v65.size.CGFloat height = v59;
                v69.origin.CGFloat y = y;
                v69.origin.double x = v53;
                v69.size.CGFloat height = height;
                v69.size.CGFloat width = width;
                BOOL v23 = NSEqualRects(v65, v69);
                int v16 = __NSImageBoundsOriginZero;
                if (!v23)
                {
LABEL_16:
                  double v25 = v21 - v10;
                  if (v21 >= v10) {
                    double v25 = 0.0;
                  }
                  double v26 = v58 - v25;
                  if (v21 < v10) {
                    double v10 = v21;
                  }
                  double v27 = -0.0;
                  if (v19 + v21 > v10 + v26) {
                    double v27 = v19 + v21 - (v10 + v26);
                  }
                  double v58 = v26 + v27;
                  double v28 = v22 - v9;
                  if (v22 >= v9) {
                    double v28 = 0.0;
                  }
                  double v24 = v59 - v28;
                  if (v22 < v9) {
                    double v9 = v22;
                  }
                  if (v20 + v22 > v9 + v24) {
                    double v24 = v24 + v20 + v22 - (v9 + v24);
                  }
                }
                else
                {
                  double v24 = v20;
                  double v58 = v19;
                  double v9 = v22;
                  double v10 = v21;
                }
                double v59 = v24;
                double v29 = advancements->width;
                double v30 = advancements->height;
                ++advancements;
                double v14 = v14 + v29;
                double v13 = v13 + v30 * v55;
                v17 += 4;
                --v18;
              }
              while (v18);
              glyphs += v15;
              BOOL v31 = v12 <= v15;
              v12 -= v15;
              runs = v49;
            }
            while (!v31);
          }
        }
        double v11 = v48 + *((double *)runs + 5);
        runs += 128;
      }
      while (runs < v47);
    }
    double leftControlWidth = self->_leftControlWidth;
    double rightControlWidth = self->_rightControlWidth;
    double x = v10 + self->_leftSideDelta - leftControlWidth;
    self->_imageBounds.origin.double x = x;
    self->_imageBounds.origin.CGFloat y = v9;
    double v42 = v58 + leftControlWidth + rightControlWidth;
    self->_imageBounds.size.CGFloat width = v42;
    self->_imageBounds.size.CGFloat height = v59;
  }
  else
  {
    double x = self->_imageBounds.origin.x;
    double v9 = self->_imageBounds.origin.y;
    double v42 = self->_imageBounds.size.width;
    double v59 = self->_imageBounds.size.height;
  }
  double v45 = v9;
  double v46 = v59;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v45;
  result.origin.double x = x;
  return result;
}

- (NSLineFragmentRenderingContext)initWithTextStorage:(id)a3 runs:(__CFArray *)a4 glyphOrigin:(double)a5 lineFragmentWidth:(double)a6 elasticWidth:(double)a7 usesScreenFonts:(BOOL)a8 isRTL:(BOOL)a9 applicationFrameworkContext:(int64_t)a10
{
  BOOL v11 = a9;
  uint64_t v15 = a4;
  CFIndex Count = CFArrayGetCount(a4);
  if (!Count)
  {

    return 0;
  }
  uint64_t v19 = Count;
  self->_double rightControlWidth = 0.0;
  self->_appContext = a10;
  self->_double leftControlWidth = 0.0;
  uint64_t v20 = MEMORY[0x1E4F28AD8];
  self->_leftSideDelta = a5;
  self->_lineWidth = a6;
  CGSize v21 = *(CGSize *)(v20 + 16);
  self->_imageBounds.origin = *(CGPoint *)v20;
  self->_imageBounds.size = v21;
  self->_elasticWidth = a7;
  self->_textStorage = (__NSImmutableTextStorage *)a3;
  self->_$02312DB0ACF3CF5CFCBD8D4CC11D7559 flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v11);
  p_double rightControlWidth = &self->_rightControlWidth;
  self->_$02312DB0ACF3CF5CFCBD8D4CC11D7559 flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFF8F | (16
                                                                                            * (_NSTextScalingTypeForCurrentEnvironment() & 7)));
  if (v19 < 1)
  {
    uint64_t v23 = 0;
  }
  else
  {
    CFIndex v22 = 0;
    uint64_t v23 = 0;
    do
    {
      ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(v15, v22);
      v23 += CTRunGetGlyphCount(ValueAtIndex);
      ++v22;
    }
    while (v19 != v22);
  }
  runs = NSAllocateScannedUncollectable();
  self->_runs = runs;
  if (!runs)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@: Failed to allocate space for %ld runs and %ld glyphs", objc_opt_class(), v19, v23 format];
    runs = self->_runs;
  }
  bzero(runs, 18 * v23 + (v19 << 7));
  double v26 = (char *)self->_runs;
  double v27 = (CGSize *)&v26[128 * v19];
  self->_glyphs = (unsigned __int16 *)&v27[v23];
  self->_advancements = v27;
  v114 = (CGGlyph *)&v27[v23];
  if (v19 < 1)
  {
    v109 = v26;
    goto LABEL_118;
  }
  v116 = v26;
  unint64_t v28 = 0;
  CFIndex v29 = 0;
  CFIndex v30 = 0;
  uint64_t v120 = 0;
  uint64_t v121 = 0;
  CGFloat v31 = *(double *)v20;
  CGFloat v32 = *(double *)(v20 + 8);
  CGFloat v33 = *(double *)(v20 + 16);
  CGFloat v34 = *(double *)(v20 + 24);
  v117 = v15;
  uint64_t v118 = v19;
  do
  {
    double v35 = (const __CTRun *)CFArrayGetValueAtIndex(v15, v29);
    CFRange StringRange = CTRunGetStringRange(v35);
    uint64_t GlyphStorage = CTRunGetGlyphStorage();
    double v38 = (void *)MEMORY[0x192FAD9C0](GlyphStorage);
    double v39 = v38;
    unint64_t v40 = v38[11];
    unint64_t v41 = v40 + 104 * v38[12];
    if (v40 > v28 || v28 >= v41 || v30 > StringRange.location)
    {
      uint64_t v44 = v38[19];
      if (v44) {
        CFIndex v30 = v38[16] - *(void *)(v44 + 128);
      }
      else {
        CFIndex v30 = 0;
      }
      unint64_t v28 = v38[11];
    }
    if (v28 && v28 < v41)
    {
      while (1)
      {
        CFIndex v45 = *(void *)(v28 + 16) + v30;
        if (StringRange.location < v45) {
          break;
        }
        v28 += 104;
        CFIndex v30 = v45;
        if (v28 >= v41) {
          goto LABEL_29;
        }
      }
      v47 = *(void **)v28;
      double v48 = v116;
      *(void *)v116 = CFRetain(*(CFTypeRef *)v28);
      *((_OWORD *)v116 + 1) = *(_OWORD *)(v28 + 32);
      *((void *)v116 + 4) = *(void *)(v28 + 56);
      v122.location = 0;
      v122.length = 0;
      *((double *)v116 + 5) = CTRunGetTypographicBounds(v35, v122, 0, 0, 0);
      v123.origin.double x = v31;
      v123.origin.CGFloat y = v32;
      v123.size.CGFloat width = v33;
      v123.size.CGFloat height = v34;
      if (!NSEqualRects(*(NSRect *)(v28 + 64), v123))
      {
        *((_DWORD *)v116 + 30) |= 1u;
        long long v55 = *(_OWORD *)(v28 + 64);
        *(_OWORD *)(v116 + 72) = *(_OWORD *)(v28 + 80);
        *(_OWORD *)(v116 + 56) = v55;
        *((double *)v116 + 8) = *(double *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F24398]) + 16 * v120 + 8)
                              + *((double *)v116 + 8);
        *((void *)v116 + 6) = [v47 objectForKey:@"NSAttachment"];
        *((void *)v116 + 12) = [v47 objectForKey:@"NSColor"];
        if ([*((id *)v116 + 6) attachmentCell] && (objc_opt_respondsToSelector() & 1) == 0) {
          uint64_t v56 = -1;
        }
        else {
          uint64_t v56 = *(void *)(v28 + 24);
        }
        uint64_t v15 = v117;
        uint64_t v46 = v118;
        CGRect v63 = v114;
        *((void *)v116 + 11) = v56;
        uint64_t v121 = 0;
        *p_double rightControlWidth = 0.0;
        goto LABEL_67;
      }
      *((void *)v116 + 6) = CFRetain(*(CFTypeRef *)(v28 + 8));
      *((void *)v116 + 7) = [v47 objectForKey:@"NSColor"];
      *((void *)v116 + 8) = [v47 objectForKey:@"NSStrokeColor"];
      *((void *)v116 + 9) = [v47 objectForKey:@"NSShadow"];
      uint64_t v49 = [v47 objectForKey:@"NSStrokeWidth"];
      if (v49)
      {
        v50 = (void *)v49;
        [*(id *)(v28 + 8) pointSize];
        double v52 = v51 * 0.01;
        [v50 doubleValue];
        double v54 = v52 * v53;
      }
      else
      {
        double v54 = 0.0;
      }
      uint64_t v46 = v118;
      double v48 = v116;
      *((double *)v116 + 10) = v54;
      CGFloat v57 = (void *)[v47 objectForKey:@"NSExpansion"];
      if (v57)
      {
        [v57 doubleValue];
        double v59 = exp(v58);
      }
      else
      {
        double v59 = 1.0;
      }
      *((double *)v116 + 11) = v59;
      CGAffineTransform v60 = (void *)[v47 objectForKey:@"NSObliqueness"];
      if (v60)
      {
        [v60 doubleValue];
        double v62 = -v61;
      }
      else
      {
        double v62 = 0.0;
      }
      CGRect v63 = v114;
      *((double *)v116 + 12) = v62;
      CTRunGetInitialAdvance();
      *((void *)v116 + 13) = v64;
      *((void *)v116 + 14) = v65;
      if ((*(unsigned char *)(v28 + 96) & 4) != 0)
      {
        uint64_t v76 = v121;
        if (v121 >= 1)
        {
          v77 = (CGGlyph *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F243A8]) + 2 * v120);
          v78 = &v77[v121];
          v79 = (_DWORD *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F243B0]) + 4 * v120);
          v80 = (double *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F24398]) + 16 * v120 + 8);
          uint64_t v15 = v117;
          do
          {
            int v81 = (*v79 >> 5) & 1;
            if (!*v77) {
              int v81 = 1;
            }
            if (v81 == 1 && (*v79 & 0x10000) == 0)
            {
              uint64_t v121 = --v76;
            }
            else
            {
              *v63++ = *v77;
              double v83 = *v80;
              if (*v80 != 0.0)
              {
                *(_DWORD *)&self->_flags |= 2u;
                double v83 = *v80;
              }
              v27->CGFloat width = *(v80 - 1);
              v27->CGFloat height = -v83;
              ++v27;
            }
            ++v77;
            ++v79;
            v80 += 2;
          }
          while (v77 < v78);
          goto LABEL_67;
        }
        goto LABEL_112;
      }
      uint64_t v66 = v120;
      v67 = (CGGlyph *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F243A8]) + 2 * v120);
      if ((v39[28] & 8) != 0)
      {
        *p_double rightControlWidth = 0.0;
        if (v121 == 1)
        {
          if (!*v67)
          {
            UniChar characters = 8230;
            double v48 = v116;
            CTFontGetGlyphsForCharacters(*((CTFontRef *)v116 + 6), &characters, v114, 1);
            [*((id *)v116 + 6) advancementForGlyph:*v114];
            uint64_t v15 = v117;
            if (v85 != 0.0) {
              *(_DWORD *)&self->_flags |= 2u;
            }
            v27->CGFloat width = v84;
            v27->CGFloat height = -v85;
            ++v27;
            CGRect v63 = v114 + 1;
            goto LABEL_67;
          }
LABEL_76:
          v86 = &v67[v121];
          v87 = (double *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F24398]) + 16 * v66 + 8);
          v88 = v114;
          uint64_t v15 = v117;
          do
          {
            if (*v67)
            {
              *v88++ = *v67;
              double v89 = *v87;
              if (*v87 != 0.0)
              {
                *(_DWORD *)&self->_flags |= 2u;
                double v89 = *v87;
              }
              v27->CGFloat width = *(v87 - 1);
              v27->CGFloat height = -v89;
              ++v27;
            }
            ++v67;
            v87 += 2;
          }
          while (v67 < v86);
        }
        else
        {
          if (v121 >= 1) {
            goto LABEL_76;
          }
          v88 = v114;
          uint64_t v15 = v117;
        }
        uint64_t v121 = v88 - v114;
        CGRect v63 = v88;
        double v48 = v116;
LABEL_67:
        *((void *)v48 + 1) = v121;
        v114 = v63;
        v116 = v48 + 128;
        goto LABEL_68;
      }
      uint64_t v68 = v121;
      if (v121 >= 1)
      {
        uint64_t v69 = *(void *)((char *)v39 + (int)*MEMORY[0x1E4F243B0]) + 4 * v120;
        unint64_t v70 = v69 + 4 * v121;
        v71 = (double *)(*(void *)((char *)v39 + (int)*MEMORY[0x1E4F24398]) + 16 * v120);
        double v72 = 0.0;
        v73 = (_DWORD *)v69;
        while ((*v73 & 0x10020) != 0 || !*v67)
        {
          double v74 = *v71;
          v71 += 2;
          double v72 = v72 + v74;
          ++v73;
          ++v67;
          if ((unint64_t)v73 >= v70)
          {
            char v75 = 0;
            goto LABEL_86;
          }
        }
        char v75 = 1;
LABEL_86:
        if (v72 != 0.0)
        {
          p_double leftControlWidth = &self->_leftControlWidth;
          if (self->_runs != v116)
          {
            *((double *)v116 - 11) = v72 + *((double *)v116 - 11);
            p_double leftControlWidth = &self->_rightControlWidth;
          }
          *p_double leftControlWidth = v72 + *p_leftControlWidth;
          *((double *)v116 + 5) = *((double *)v116 + 5) - v72;
        }
        if (v75)
        {
          uint64_t v91 = v68 - (((uint64_t)v73 - v69) >> 2);
          uint64_t v121 = v91;
          if ((unint64_t)v73 >= v70)
          {
            double v48 = v116;
            uint64_t v15 = v117;
          }
          else
          {
            v92 = v73;
            v93 = (char *)v67;
            v94 = &self->_rightControlWidth;
            unint64_t v112 = v70;
            do
            {
              if ((*v92 & 0x10020) != 0 || !*v67)
              {
                uint64_t v95 = (char *)v92 - (char *)v73;
                uint64_t v96 = v95 >> 2;
                if (v95 <= 0)
                {
                  double v102 = *v94;
                }
                else
                {
                  uint64_t v115 = v95 >> 2;
                  v97 = &v71[2 * v96];
                  do
                  {
                    CGFloat v98 = -v71[1];
                    v27->CGFloat width = *v71;
                    v27->CGFloat height = v98;
                    if (v71[1] != 0.0) {
                      *(_DWORD *)&self->_flags |= 2u;
                    }
                    ++v27;
                    v71 += 2;
                  }
                  while (v71 < v97);
                  v99 = v63;
                  v100 = v63;
                  v101 = v93;
                  memcpy(v100, v93, v95 >> 1);
                  v93 = v101;
                  v94 = &self->_rightControlWidth;
                  uint64_t v96 = v115;
                  CGRect v63 = &v99[v115];
                  *p_double rightControlWidth = 0.0;
                  double v102 = 0.0;
                  uint64_t v91 = v121;
                  unint64_t v70 = v112;
                }
                v93 += 2 * v96 + 2;
                double *v94 = *v71 + v102;
                double v103 = *v71;
                v71 += 2;
                v27[-1].CGFloat width = v103 + v27[-1].width;
                v73 = v92 + 1;
                uint64_t v121 = --v91;
                uint64_t v46 = v118;
              }
              ++v92;
              ++v67;
            }
            while ((unint64_t)v92 < v70);
            double v48 = v116;
            if (v73 < v92)
            {
              uint64_t v104 = (char *)v92 - (char *)v73;
              if (v104 >= 1)
              {
                v105 = (double *)((char *)v71 + 4 * v104);
                do
                {
                  CGFloat v106 = -v71[1];
                  v27->CGFloat width = *v71;
                  v27->CGFloat height = v106;
                  if (v71[1] != 0.0) {
                    *(_DWORD *)&self->_flags |= 2u;
                  }
                  ++v27;
                  v71 += 2;
                }
                while (v71 < v105);
              }
              uint64_t v15 = v117;
              uint64_t v107 = v104 >> 2;
              memcpy(v63, v93, v104 >> 1);
              v63 += v107;
              *p_double rightControlWidth = 0.0;
              uint64_t v46 = v118;
              goto LABEL_67;
            }
LABEL_112:
            uint64_t v15 = v117;
          }
          goto LABEL_67;
        }
      }
      CFRelease(*(CFTypeRef *)v116);
      *(void *)v116 = 0;
      v108 = (const void *)*((void *)v116 + 6);
      if (v108)
      {
        CFRelease(v108);
        *((void *)v116 + 6) = 0;
      }
      uint64_t v15 = v117;
    }
    else
    {
      CFIndex v45 = v30;
LABEL_29:
      NSLog((NSString *)@"NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run...", StringRange.location, StringRange.length, v35);
      unint64_t v28 = 0;
      CFIndex v30 = v45;
      uint64_t v15 = v117;
      uint64_t v46 = v118;
    }
LABEL_68:
    ++v29;
  }
  while (v29 != v46);
  v109 = self->_runs;
  double v26 = v116;
LABEL_118:
  self->_int64_t numRuns = (v26 - v109) >> 7;
  self->_leftSideDelta = self->_leftControlWidth + self->_leftSideDelta;
  $02312DB0ACF3CF5CFCBD8D4CC11D7559 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0) {
    self->_$02312DB0ACF3CF5CFCBD8D4CC11D7559 flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&flags | 4);
  }
  return self;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    __NSImageBoundsOriginZero = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"__NSStringDrawingTigerImageBounds");
  }
}

- (void)dealloc
{
  runs = (char *)self->_runs;
  if (runs)
  {
    int64_t numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      int v5 = (CFTypeRef *)&runs[128 * numRuns];
      uint64_t v6 = (CFTypeRef *)self->_runs;
      do
      {
        if (((_BYTE)v6[15] & 1) == 0) {
          CFRelease(v6[6]);
        }
        CFTypeRef v7 = *v6;
        v6 += 16;
        CFRelease(v7);
      }
      while (v6 < v5);
    }
    NSZoneFree(0, runs);
  }

  v8.receiver = self;
  v8.super_class = (Class)NSLineFragmentRenderingContext;
  [(NSLineFragmentRenderingContext *)&v8 dealloc];
}

- (void)finalize
{
  runs = (char *)self->_runs;
  if (runs)
  {
    int64_t numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      int v5 = (CFTypeRef *)&runs[128 * numRuns];
      uint64_t v6 = (CFTypeRef *)self->_runs;
      do
      {
        if (((_BYTE)v6[15] & 1) == 0) {
          CFRelease(v6[6]);
        }
        CFTypeRef v7 = *v6;
        v6 += 16;
        CFRelease(v7);
      }
      while (v6 < v5);
    }
    NSZoneFree(0, runs);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSLineFragmentRenderingContext;
  [(NSLineFragmentRenderingContext *)&v8 finalize];
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$02312DB0ACF3CF5CFCBD8D4CC11D7559 flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)_usesSimpleTextEffects
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  double v8 = ((double (*)(NSLineFragmentRenderingContext *, SEL, CGContext *, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))MEMORY[0x1F4188790])(self, a2, a4, v4, v5, v6, v7, (__n128)a3, *(__n128 *)&a3.y);
  double v10 = v9;
  double v12 = v11;
  double v13 = v8;
  uint64_t v15 = v14;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  int v16 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", [v14 applicationFrameworkContext]);
  v17 = (double *)v15[1];
  uint64_t v18 = v15[2];
  CGContextGetFontRenderingStyle();
  unint64_t v112 = v15;
  uint64_t v19 = [v15 applicationFrameworkContext];
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    uint64_t v20 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v19];
  }
  else
  {
    uint64_t v20 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  v108 = (void *)[(objc_class *)v20 blackColor];
  uint64_t v21 = v15[3];
  unint64_t v22 = v112[4];
  uint64_t v105 = v112[20];
  if (v16) {
    int v23 = [v16 isFlipped];
  }
  else {
    int v23 = 1;
  }
  int v24 = *((_DWORD *)v112 + 28);
  if ((v24 & 2) == 0 || v23 == (v112[14] & 4u) >> 2)
  {
    int v106 = 0;
  }
  else
  {
    *((_DWORD *)v112 + 28) = v24 ^ 4;
    int v106 = 1;
  }
  unint64_t v25 = (unint64_t)&v17[16 * v18];
  CGFloat v26 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
  double v27 = *((double *)v112 + 6);
  double v28 = v13 + *((double *)v112 + 5);
  double v29 = 0.0;
  if (v27 == 0.0) {
    double v30 = 0.0;
  }
  else {
    double v30 = v28 + v27;
  }
  [v108 set];
  char v113 = 0;
  v109 = 0;
  uint64_t v115 = 0;
  CGFloat v31 = 0;
  v110 = (uint64_t *)&v17[16 * v18];
  uint64_t v107 = v16;
  while ((unint64_t)v17 < v25)
  {
    CGFloat v32 = v17;
    if ((_BYTE)v17[15])
    {
      double v41 = v17[7];
      double v42 = v17[8];
      double width = v17[9];
      double height = v17[10];
      CFIndex v45 = (void *)[*((id *)v17 + 6) attachmentCell];
      if (v23) {
        double v46 = -(v42 + height) - v17[4];
      }
      else {
        double v46 = v42 + v17[4];
      }
      double x = v28 + v41;
      double y = v12 + v46;
      [*((id *)v17 + 6) lineLayoutPadding];
      if (v49 != 0.0)
      {
        CGFloat v50 = v49;
        v125.origin.double x = x;
        v125.origin.double y = y;
        v125.size.double width = width;
        v125.size.double height = height;
        NSRect v126 = NSInsetRect(v125, v50, 0.0);
        double x = v126.origin.x;
        double y = v126.origin.y;
        double width = v126.size.width;
        double height = v126.size.height;
      }
      if (v45)
      {
        if (*((void *)v17 + 11) == -1) {
          objc_msgSend(v45, "drawWithFrame:inView:", 0, x, y, width, height);
        }
        else {
          objc_msgSend(v45, "drawWithFrame:inView:characterIndex:", 0, x, y, width, height);
        }
LABEL_54:
        uint64_t v115 = 0;
        CGFloat v31 = 0;
        double v29 = 0.0;
        goto LABEL_108;
      }
      double v51 = v109;
      if (!v109)
      {
        double v51 = (void *)v112[19];
        if (v51) {
          double v51 = (void *)[v51 textContainer];
        }
      }
      double v52 = (void *)*((void *)v17 + 6);
      v109 = v51;
      double v53 = objc_msgSend(v52, "imageForBounds:textContainer:characterIndex:", x, y, width, height);
      uint64_t v54 = [v52 image];
      if (v105 == 2)
      {
        unint64_t v25 = (unint64_t)v110;
        if (v53 == (void *)v54 && [v53 conformsToProtocol:&unk_1EDD8B9A8])
        {
          uint64_t v55 = *(void *)v17;
          if ([v53 willProvideAdaptedImageForPresentation]) {
            double v53 = objc_msgSend(v53, "imageForBounds:attributes:location:textContainer:", v55, 0, v109, x, y, width, height);
          }
          goto LABEL_46;
        }
      }
      else
      {
LABEL_46:
        unint64_t v25 = (unint64_t)v110;
      }
      uint64_t v56 = *((void *)v17 + 12);
      if (v115 != v56)
      {
        if (v56) {
          CGFloat v57 = (void *)*((void *)v17 + 12);
        }
        else {
          CGFloat v57 = v108;
        }
        [v57 set];
      }
      objc_msgSend(v53, "drawInRect:", x, y, width, height);
      goto LABEL_54;
    }
    if (*((uint64_t *)v17 + 1) >= 1)
    {
      CGFloat v33 = (void *)*((void *)v17 + 9);
      CGFloat v34 = (void *)*((void *)v17 + 6);
      if ((v31 != v34) | v113 & 1)
      {
        CGContextSetFontRenderingStyle();
        [v34 applyToGraphicsContext:v16];
        CGFloat v31 = v34;
      }
      uint64_t v35 = *((void *)v17 + 7);
      if (v115 != v35)
      {
        if (v35) {
          double v36 = (void *)*((void *)v32 + 7);
        }
        else {
          double v36 = v108;
        }
        [v36 set];
        uint64_t v115 = v35;
      }
      double v37 = (void *)*((void *)v32 + 8);
      if (v37)
      {
        [v37 setStroke];
        uint64_t v115 = 0;
      }
      double v38 = v32[10];
      if (v29 != v38)
      {
        if (v38 == 0.0)
        {
          CGTextDrawingMode v39 = kCGTextFill;
          double v40 = 1.0;
        }
        else if (v38 < 0.0)
        {
          double v40 = -v38;
          CGTextDrawingMode v39 = kCGTextFillStroke;
        }
        else
        {
          CGTextDrawingMode v39 = kCGTextStroke;
          double v40 = v32[10];
        }
        CGContextSetTextDrawingMode(v10, v39);
        CGContextSetLineWidth(v10, v40);
        double v29 = v38;
      }
      double v58 = v32[11];
      if (v58 == 1.0 && v32[12] == 0.0)
      {
        char v113 = 0;
        if (v33) {
          goto LABEL_65;
        }
      }
      else
      {
        if (v23) {
          double v59 = v32[12];
        }
        else {
          double v59 = -v32[12];
        }
        CGContextGetTextMatrix(&t1, v10);
        t2.a = v58;
        t2.b = v26;
        t2.c = v59;
        *(_OWORD *)&t2.d = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 24);
        t2.tdouble y = *(CGFloat *)(MEMORY[0x1E4F1DAB8] + 40);
        CGAffineTransformConcat(&v122, &t1, &t2);
        CGContextSetTextMatrix(v10, &v122);
        char v113 = 1;
        if (v33)
        {
LABEL_65:
          CGContextSaveGState(v10);
          [v33 applyToGraphicsContext:v16];
        }
      }
      v111 = v33;
      if (v106)
      {
        uint64_t v60 = *((void *)v32 + 1);
        if (v60 >= 1)
        {
          unint64_t v61 = v22 + 16 * v60;
          unint64_t v62 = v22;
          do
          {
            *(double *)(v62 + 8) = -*(double *)(v62 + 8);
            v62 += 16;
          }
          while (v62 < v61);
        }
      }
      unint64_t v114 = v22;
      double v63 = v32[4] + v32[14];
      uint64_t v64 = [__NSTextAppearanceEffectContext alloc];
      uint64_t v65 = [*(id *)v32 objectForKey:@"NSTextEffect"];
      uint64_t v67 = v112[17];
      uint64_t v66 = v112[18];
      uint64_t v68 = [v112 applicationFrameworkContext];
      LOBYTE(v104) = (v112[14] & 8) != 0;
      uint64_t v69 = [(__NSTextAppearanceEffectContext *)v64 initWithTextEffectName:v65 catalog:v67 styleEffectConfiguration:v66 font:v31 color:v115 applicationFrameworkContext:v68 useSimplifiedEffect:v104];
      if ([v31 isVertical])
      {
        uint64_t v70 = *((void *)v32 + 1);
        double v71 = v32[13];
        memset(&v120, 0, sizeof(v120));
        CGContextGetTextMatrix(&v119, v10);
        CGAffineTransformInvert(&v120, &v119);
        if (*((uint64_t *)v32 + 1) >= 1)
        {
          uint64_t v72 = 0;
          double v73 = -v63;
          if (!v23) {
            double v73 = v63;
          }
          double v74 = v12 + v73;
          double v75 = v28 + v71;
          if (v70 >= 256) {
            uint64_t v76 = 256;
          }
          else {
            uint64_t v76 = v70;
          }
          do
          {
            [v31 getVerticalOriginTranslations:&t2 forCGGlyphs:v21 + 2 * v72 count:v76];
            if (v76 >= 1)
            {
              float64x2_t v77 = *(float64x2_t *)&v120.a;
              float64x2_t v78 = *(float64x2_t *)&v120.c;
              v79 = (double *)(v114 + 8 + 16 * v72);
              p_CGAffineTransform t2 = (float64x2_t *)&t2;
              uint64_t v81 = v76;
              float64x2_t v82 = *(float64x2_t *)&v120.tx;
              do
              {
                double v83 = p_t2->f64[1];
                if (v23) {
                  double v83 = -v83;
                }
                float64x2_t *p_t2 = vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v78, v74 + v83), v77, v75 + p_t2->f64[0]));
                ++p_t2;
                double v75 = v75 + *(v79 - 1);
                double v84 = *v79;
                v79 += 2;
                double v74 = v74 + v84;
                --v81;
              }
              while (v81);
            }
            if (v69) {
              [(__NSTextAppearanceEffectContext *)v69 drawGlyphs:v21 + 2 * v72 positions:&t2 count:v76 context:v10];
            }
            else {
              CTFontDrawGlyphsAtPositions();
            }
            v72 += v76;
            uint64_t v85 = *((void *)v32 + 1);
            if (v85 - v72 >= 256) {
              uint64_t v76 = 256;
            }
            else {
              uint64_t v76 = v85 - v72;
            }
          }
          while (v85 > v72);
        }
        int v16 = v107;
        goto LABEL_104;
      }
      if (v69)
      {
        uint64_t v86 = *((void *)v32 + 1);
        double v87 = v32[13];
        memset(&v120, 0, sizeof(v120));
        CGContextGetTextMatrix(&v118, v10);
        CGAffineTransformInvert(&v120, &v118);
        int v16 = v107;
        if (*((uint64_t *)v32 + 1) >= 1)
        {
          uint64_t v90 = 0;
          double v91 = -v63;
          if (!v23) {
            double v91 = v63;
          }
          *(double *)&long long v88 = v12 + v91;
          *(double *)&long long v89 = v28 + v87;
          if (v86 >= 256) {
            uint64_t v92 = 256;
          }
          else {
            uint64_t v92 = v86;
          }
          do
          {
            if (v92 >= 1)
            {
              float64x2_t v93 = *(float64x2_t *)&v120.a;
              float64x2_t v94 = *(float64x2_t *)&v120.c;
              uint64_t v95 = (double *)(v114 + 8 + 16 * v90);
              uint64_t v96 = &t2;
              uint64_t v97 = v92;
              float64x2_t v98 = *(float64x2_t *)&v120.tx;
              do
              {
                *(float64x2_t *)&v96->a = vaddq_f64(v98, vmlaq_n_f64(vmulq_n_f64(v94, *(double *)&v88), v93, *(double *)&v89));
                uint64_t v96 = (CGAffineTransform *)((char *)v96 + 16);
                *(double *)&long long v89 = *(double *)&v89 + *(v95 - 1);
                double v99 = *v95;
                v95 += 2;
                *(double *)&long long v88 = *(double *)&v88 + v99;
                --v97;
              }
              while (v97);
            }
            long long v116 = v89;
            long long v117 = v88;
            [(__NSTextAppearanceEffectContext *)v69 drawGlyphs:v21 + 2 * v90 positions:&t2 count:v92 context:v10];
            long long v89 = v116;
            long long v88 = v117;
            v90 += v92;
            uint64_t v100 = *((void *)v32 + 1);
            if (v100 - v90 >= 256) {
              uint64_t v92 = 256;
            }
            else {
              uint64_t v92 = v100 - v90;
            }
          }
          while (v100 > v90);
        }
LABEL_104:
        unint64_t v101 = v114;
      }
      else
      {
        double v103 = -v63;
        if (!v23) {
          double v103 = v63;
        }
        CGContextSetTextPosition(v10, v28 + v32[13], v12 + v103);
        int v16 = v107;
        unint64_t v101 = v114;
        if (v31) {
          CTFontDrawGlyphsWithAdvances();
        }
      }

      unint64_t v25 = (unint64_t)v110;
      if (v111) {
        CGContextRestoreGState(v10);
      }
      uint64_t v102 = *((void *)v32 + 1);
      v21 += 2 * v102;
      unint64_t v22 = v101 + 16 * v102;
    }
LABEL_108:
    v17 = v32 + 16;
    double v28 = v28 + v32[5];
    if (v30 > 0.0 && v28 >= v30) {
      break;
    }
  }
  CGContextSetFontRenderingStyle();
  if (v29 != 0.0)
  {
    CGContextSetTextDrawingMode(v10, kCGTextFill);
    CGContextSetLineWidth(v10, 1.0);
  }
}

- (CGSize)sizeWithBehavior:(int64_t)a3 usesFontLeading:(BOOL)a4 baselineDelta:(double *)a5
{
  BOOL v6 = a4;
  runs = (double *)self->_runs;
  int64_t numRuns = self->_numRuns;
  if (a3 < 0)
  {
    a3 = sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior;
    if (sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior == -1)
    {
      a3 = +[NSTypesetter defaultTypesetterBehavior];
      sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior = a3;
    }
  }
  double v59 = a5;
  int64_t v58 = a3;
  if (numRuns < 1)
  {
    double v14 = 0.0;
    double v13 = 0.0;
    double v12 = 0.0;
  }
  else
  {
    double v10 = &runs[16 * numRuns];
    unsigned __int8 v11 = (a3 < 2) & ~v6;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    do
    {
      if ((_BYTE)runs[15])
      {
        double v15 = runs[10];
        double v16 = v15 + runs[8];
      }
      else
      {
        double v15 = runs[2];
        double v16 = runs[3];
      }
      double v17 = 0.0;
      if (v6)
      {
        id v18 = *(id *)runs;
        if (!*(void *)runs) {
          goto LABEL_16;
        }
        uint64_t v19 = objc_msgSend(*(id *)runs, "objectForKey:", _NSOriginalFontAttributeName, 0.0);
        if (!v19) {
          uint64_t v19 = (void *)[v18 objectForKey:@"NSFont"];
        }
        if (objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
          uint64_t v19 = (void *)[v19 verticalFont];
        }
        if (!v19) {
LABEL_16:
        }
          uint64_t v19 = NSDefaultFont();
        [v19 _leading];
      }
      double v20 = runs[4];
      if (v20 <= 0.0) {
        double v21 = 0.0;
      }
      else {
        double v21 = runs[4];
      }
      double v22 = v16 + v21;
      if (v20 >= 0.0) {
        double v23 = 0.0;
      }
      else {
        double v23 = runs[4];
      }
      double v24 = v16 - v15 + v23;
      if ((v11 & (v20 > 0.0)) != 0) {
        double v25 = runs[4];
      }
      else {
        double v25 = -0.0;
      }
      double v26 = v24 + v25;
      if (v24 < v13)
      {
        double v13 = v26;
        double v24 = v26;
      }
      if ((v11 & (v20 < 0.0)) == 0) {
        double v20 = -0.0;
      }
      double v27 = v22 + v20;
      if (v22 > v14) {
        double v14 = v27;
      }
      double v28 = v17 - v24;
      if (v28 > v12) {
        double v12 = v28;
      }
      runs += 16;
    }
    while (runs < v10);
  }
  double v29 = (NSParagraphStyle *)[*(id *)self->_runs objectForKey:@"NSParagraphStyle"];
  double v30 = (NSParagraphStyle *)sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle;
  if (!sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle)
  {
    double v30 = +[NSParagraphStyle defaultParagraphStyle];
    sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle = (uint64_t)v30;
  }
  double v31 = v14 - v13;
  if (v29) {
    BOOL v32 = v30 == v29;
  }
  else {
    BOOL v32 = 1;
  }
  double v33 = 0.0;
  double v34 = 0.0;
  double v35 = 0.0;
  double v36 = 0.0;
  if (!v32)
  {
    [(NSParagraphStyle *)v29 lineHeightMultiple];
    double v33 = v37;
    [(NSParagraphStyle *)v29 minimumLineHeight];
    double v34 = v38;
    [(NSParagraphStyle *)v29 maximumLineHeight];
    double v35 = v39;
    [(NSParagraphStyle *)v29 lineSpacing];
    double v36 = v40;
  }
  BOOL v41 = v58 > 2;
  BOOL v42 = v33 > 0.0;
  double v43 = v31 * v33;
  if (v41 && v42) {
    double v44 = v31 * v33 - v31;
  }
  else {
    double v44 = -0.0;
  }
  if (!v41 || !v42) {
    double v43 = v14 - v13;
  }
  if (v43 >= v34) {
    double v45 = -0.0;
  }
  else {
    double v45 = v34 - v43;
  }
  if (v43 >= v34) {
    double v34 = v43;
  }
  BOOL v46 = v35 > 0.0;
  BOOL v47 = v34 > v35;
  BOOL v48 = v46 && v47;
  if (v46 && v47) {
    double v49 = v34 - v35;
  }
  else {
    double v49 = 0.0;
  }
  if (v6 && v58 <= 2)
  {
    double v50 = v44;
    double v51 = *(void **)self->_runs;
    if (!v51) {
      goto LABEL_66;
    }
    double v52 = (void *)[v51 objectForKey:_NSOriginalFontAttributeName];
    if (!v52) {
      double v52 = (void *)[v51 objectForKey:@"NSFont"];
    }
    if (objc_msgSend((id)objc_msgSend(v51, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
      double v52 = (void *)[v52 verticalFont];
    }
    if (!v52) {
LABEL_66:
    }
      double v52 = NSDefaultFont();
    [v52 _leading];
    double v44 = v50;
  }
  else
  {
    double v53 = v13 + v12;
  }
  if (v58 >= 2 && v36 < 0.0)
  {
    double v53 = v36 + v53;
    if (v53 < 0.0) {
      double v53 = 0.0;
    }
  }
  if (v59) {
    *double v59 = v14 + v44 + v45 - v49;
  }
  if (v48) {
    double v54 = v35;
  }
  else {
    double v54 = v34;
  }
  if (v53 >= v36) {
    double v55 = v53;
  }
  else {
    double v55 = v36;
  }
  double lineWidth = self->_lineWidth;
  double v57 = v54 + v55;
  result.double height = v57;
  result.double width = lineWidth;
  return result;
}

- (void)getMaximumAscender:(double *)a3 minimumDescender:(double *)a4
{
  int64_t numRuns = self->_numRuns;
  if (numRuns < 1)
  {
    double v11 = 0.0;
    double v10 = 0.0;
  }
  else
  {
    runs = (char *)self->_runs;
    unint64_t v8 = (unint64_t)&runs[128 * numRuns];
    double v9 = runs + 80;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      double v13 = v9 - 80;
      double v12 = (void *)*((void *)v9 - 10);
      if (!v12) {
        goto LABEL_9;
      }
      double v14 = (void *)[*((id *)v9 - 10) objectForKey:_NSOriginalFontAttributeName];
      if (!v14) {
        double v14 = (void *)[v12 objectForKey:@"NSFont"];
      }
      if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
        double v14 = (void *)[v14 verticalFont];
      }
      if (!v14) {
LABEL_9:
      }
        double v14 = NSDefaultFont();
      [v14 boundingRectForFont];
      if (v9[40])
      {
        double v17 = *((double *)v9 - 2);
        double v18 = v17 - v15;
        if (v17 >= v15) {
          double v18 = 0.0;
        }
        double v16 = v16 - v18;
        if (v17 < v15) {
          double v15 = *((double *)v9 - 2);
        }
        double v19 = v17 + *(double *)v9;
        if (v19 > v15 + v16) {
          double v16 = v16 + v19 - (v15 + v16);
        }
      }
      double v20 = v15 + *((double *)v9 - 6);
      if (v20 < v10) {
        double v10 = v15 + *((double *)v9 - 6);
      }
      double v21 = v16 + v20;
      if (v21 > v11) {
        double v11 = v21;
      }
      v9 += 128;
    }
    while ((unint64_t)(v13 + 128) < v8);
  }
  *a3 = ceil(v11);
  *a4 = floor(v10);
}

- (double)elasticWidth
{
  return self->_elasticWidth;
}

- (BOOL)isRTL
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int64_t)applicationFrameworkContext
{
  return ((unint64_t)self->_flags >> 4) & 7;
}

- (int64_t)resolvedBaseWritingDirection
{
  return self->_resolvedDirection;
}

- (int64_t)resolvedTextAlignment
{
  return self->_resolvedAlignment;
}

- (CUICatalog)cuiCatalog
{
  return self->_catalog;
}

- (void)setCuiCatalog:(id)a3
{
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_styleEffects;
}

- (void)setCuiStyleEffects:(id)a3
{
}

@end