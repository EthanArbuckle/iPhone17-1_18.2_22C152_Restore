@interface NSParagraphStyle
+ (BOOL)supportsSecureCoding;
+ (NSParagraphStyle)defaultParagraphStyle;
+ (NSWritingDirection)defaultWritingDirectionForLanguage:(NSString *)languageName;
+ (float)_defaultHyphenationFactor;
+ (int64_t)_defaultWritingDirection;
+ (void)initialize;
- (BOOL)_alignmentFollowsWritingDirection;
- (BOOL)_isSuitableForFastStringDrawingWithAlignment:(int64_t *)a3 mirrorsTextAlignment:(BOOL)a4 lineBreakMode:(int64_t *)a5 tighteningFactorForTruncation:(double *)a6;
- (BOOL)allowsDefaultTighteningForTruncation;
- (BOOL)allowsHangingPunctuation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullyJustified;
- (BOOL)spansAllLines;
- (BOOL)usesDefaultHyphenation;
- (BOOL)usesOpticalAlignment;
- (CGFloat)defaultTabInterval;
- (CGFloat)firstLineHeadIndent;
- (CGFloat)headIndent;
- (CGFloat)lineHeightMultiple;
- (CGFloat)lineSpacing;
- (CGFloat)maximumLineHeight;
- (CGFloat)minimumLineHeight;
- (CGFloat)paragraphSpacing;
- (CGFloat)paragraphSpacingBefore;
- (CGFloat)tailIndent;
- (NSArray)_presentationIntents;
- (NSArray)tabStops;
- (NSArray)textBlocks;
- (NSArray)textLists;
- (NSInteger)headerLevel;
- (NSLineBreakMode)lineBreakMode;
- (NSLineBreakStrategy)lineBreakStrategy;
- (NSParagraphStyle)init;
- (NSParagraphStyle)initWithCoder:(id)a3;
- (NSString)codeBlockIntentLanguageHint;
- (NSString)description;
- (NSTextAlignment)alignment;
- (NSWritingDirection)baseWritingDirection;
- (float)hyphenationFactor;
- (float)tighteningFactorForTruncation;
- (id)_initWithParagraphStyle:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)_listIntentOrdinal;
- (int64_t)compositionLanguage;
- (int64_t)horizontalAlignment;
- (int64_t)secondaryLineBreakMode;
- (unint64_t)_lineBoundsOptions;
- (unint64_t)hash;
- (void)_allocExtraData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSParagraphStyle

- (unint64_t)hash
{
  int64_t v3 = [(NSParagraphStyle *)self horizontalAlignment];
  BOOL v4 = [(NSParagraphStyle *)self isFullyJustified];
  uint64_t v5 = 0x10000000;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 + (v3 << 24) + ((uint64_t)self->_headIndent << 16) + ((uint64_t)self->_firstLineHeadIndent << 8);
  tabStops = self->_tabStops;
  if (tabStops) {
    uint64_t v8 = [(NSArray *)tabStops count];
  }
  else {
    uint64_t v8 = 12;
  }
  unint64_t v9 = v6 + v8;
  id extraData = self->_extraData;
  if (extraData)
  {
    v12 = (void *)*((void *)extraData + 6);
    v11 = (void *)*((void *)extraData + 7);
    if (v12 && [*((id *)extraData + 6) count]) {
      v9 += objc_msgSend((id)objc_msgSend(v12, "lastObject"), "hash");
    }
    if (v11 && [v11 count]) {
      v9 += objc_msgSend((id)objc_msgSend(v11, "lastObject"), "hash");
    }
    uint64_t v13 = [(NSArray *)[(NSParagraphStyle *)self _presentationIntents] hash];
    unint64_t v14 = v9 + [(NSParagraphStyle *)self _listIntentOrdinal];
    return v13
         + [(NSString *)[(NSParagraphStyle *)self codeBlockIntentLanguageHint] hash]+ v14;
  }
  return v9;
}

- (BOOL)isFullyJustified
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[82] != 0;
  }
  else {
    return (*(_DWORD *)&self->_flags & 0xF) == 3;
  }
}

- (int64_t)horizontalAlignment
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[15];
  }
  unsigned int v4 = *(_DWORD *)&self->_flags & 0xF;
  BOOL v5 = v4 > 2;
  int64_t v6 = v4 + 2;
  if (v5) {
    return 0;
  }
  else {
    return v6;
  }
}

- (NSString)codeBlockIntentLanguageHint
{
  id extraData = self->_extraData;
  if (extraData) {
    return (NSString *)*((void *)extraData + 14);
  }
  else {
    return (NSString *)&stru_1EDD49F70;
  }
}

- (int64_t)_listIntentOrdinal
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[13];
  }
  else {
    return 0;
  }
}

- (NSArray)_presentationIntents
{
  id extraData = self->_extraData;
  if (extraData) {
    return (NSArray *)*((void *)extraData + 12);
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (CGFloat)lineHeightMultiple
{
  id extraData = (double *)self->_extraData;
  if (extraData) {
    return extraData[1];
  }
  unsigned int v4 = (*(_DWORD *)&self->_flags >> 11) & 3;
  if (v4) {
    return ((double)v4 + 1.0) * 0.5;
  }
  else {
    return 0.0;
  }
}

- (CGFloat)minimumLineHeight
{
  return self->_minimumLineHeight;
}

- (CGFloat)maximumLineHeight
{
  return self->_maximumLineHeight;
}

+ (NSParagraphStyle)defaultParagraphStyle
{
  if (defaultParagraphStyle_once != -1) {
    dispatch_once(&defaultParagraphStyle_once, &__block_literal_global_18);
  }
  return (NSParagraphStyle *)defaultParagraphStyle_paraStyle;
}

- (CGFloat)lineSpacing
{
  return self->_lineSpacing;
}

+ (NSWritingDirection)defaultWritingDirectionForLanguage:(NSString *)languageName
{
  if (languageName)
  {
    NSWritingDirection result = [(NSString *)languageName length];
    if (result) {
      return (unint64_t)([MEMORY[0x1E4F1CA20] characterDirectionForLanguage:languageName] == 2);
    }
  }
  else
  {
    return [a1 _defaultWritingDirection];
  }
  return result;
}

- (CGFloat)tailIndent
{
  return self->_tailIndent;
}

- (CGFloat)firstLineHeadIndent
{
  return self->_firstLineHeadIndent;
}

- (id)_initWithParagraphStyle:(id)a3
{
  v58.receiver = self;
  v58.super_class = (Class)NSParagraphStyle;
  unsigned int v4 = [(NSParagraphStyle *)&v58 init];
  BOOL v5 = (unsigned int *)v4;
  if (!v4) {
    return v5;
  }
  if (!a3)
  {
    v4->_maximumLineHeight = 0.0;
    CTTextAlignment v36 = NSTextAlignmentToCTTextAlignment(NSTextAlignmentNatural);
    unsigned int v37 = v5[18] & 0xFFFFFC00;
    *((void *)v5 + 4) = 0;
    *((void *)v5 + 8) = 0;
    v5[18] = v37 & 0xFFFFFFF0 | v36 & 0xF | 0x200;
    v5[18] = v5[18] & 0xFFFFC3FF | (([(id)objc_opt_class() _defaultWritingDirection] == 1) << 10) | (__NSAllowsDefaultTightening << 13);
    return v5;
  }
  if (object_getClass(a3) != (Class)__NSParagraphStyleClass
    && object_getClass(a3) != (Class)__NSMutableParagraphStyleClass)
  {
    [a3 paragraphSpacingBefore];
    double v7 = v6;
    [a3 lineHeightMultiple];
    double v57 = v8;
    [a3 hyphenationFactor];
    float v10 = v9;
    [a3 tighteningFactorForTruncation];
    float v12 = v11;
    uint64_t v13 = [a3 baseWritingDirection];
    uint64_t v51 = [a3 headerLevel];
    v56 = (void *)[a3 textBlocks];
    unint64_t v14 = (void *)[a3 textLists];
    uint64_t v15 = [a3 _lineBoundsOptions];
    uint64_t v16 = [a3 lineBreakStrategy];
    int v52 = [a3 usesDefaultHyphenation];
    char v17 = [a3 spansAllLines];
    uint64_t v55 = [a3 secondaryLineBreakMode];
    int v53 = [a3 _alignmentFollowsWritingDirection];
    uint64_t v54 = [a3 compositionLanguage];
    uint64_t v18 = [a3 horizontalAlignment];
    char v19 = [a3 isFullyJustified];
    v5[18] = v5[18] & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment((NSTextAlignment)[a3 alignment]) & 0xF;
    [a3 lineSpacing];
    *((void *)v5 + 1) = v20;
    v5[18] = v5[18] & 0xFFFFFF0F | (16 * ([a3 lineBreakMode] & 0xF));
    [a3 firstLineHeadIndent];
    *((void *)v5 + 5) = v21;
    [a3 paragraphSpacing];
    *((void *)v5 + 2) = v22;
    [a3 headIndent];
    *((void *)v5 + 3) = v23;
    [a3 tailIndent];
    *((void *)v5 + 4) = v24;
    [a3 minimumLineHeight];
    *((void *)v5 + 6) = v25;
    [a3 maximumLineHeight];
    *((void *)v5 + 7) = v26;
    [a3 defaultTabInterval];
    *((void *)v5 + 10) = v27;
    if ([a3 allowsDefaultTighteningForTruncation]) {
      int v28 = 0x2000;
    }
    else {
      int v28 = 0;
    }
    v5[18] = v5[18] & 0xFFFFDFFF | v28;
    *((void *)v5 + 8) = objc_msgSend((id)objc_msgSend(a3, "tabStops"), "copyWithZone:", objc_msgSend(v5, "zone"));
    unsigned int v29 = v5[18];
    if (v13 == -1)
    {
      v5[18] = v29 & 0xFFFFFCFF | 0x200;
      unsigned int v30 = v5[18] & 0xFFFFFBFF | (([(id)objc_opt_class() _defaultWritingDirection] == 1) << 10);
    }
    else
    {
      unsigned int v30 = v29 & 0xFFFFF8FF | ((v13 == 1) << 10);
    }
    double v45 = v12;
    v5[18] = v30;
    if (v7 != 0.0
      || (float64x2_t v49 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v57, 0),
          (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v49, (float64x2_t)xmmword_18E5F7570), (int32x4_t)vceqq_f64(v49, (float64x2_t)xmmword_18E5F7580)))) & 1) == 0)|| v56|| v14|| v10 != 0.0|| *(double *)&__NSTightenFactor != v45|| v51|| v15|| v16|| __NSUsesDefaultHyphenation_0 != v52|| (v17 & 1) != 0|| v55|| v54|| objc_msgSend(v5, "_listIntentOrdinal", *(double *)&__NSTightenFactor)|| objc_msgSend((id)objc_msgSend(v5, "_presentationIntents"), "count")|| objc_msgSend((id)objc_msgSend(v5, "codeBlockIntentLanguageHint"), "length")|| v18|| (v19 & 1) != 0
      || v53)
    {
      v5[18] &= 0xFFFFE7FF;
      v46 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", [v5 zone]), "init");
      *((void *)v5 + 11) = v46;
      v46->_lineHeightMultiple = v57;
      v46->_paragraphSpacingBefore = v7;
      v46->_tighteningFactor = v45;
      v46->_headerLevel = v51;
      if (v56) {
        v46->_textBlocks = (NSArray *)objc_msgSend(v56, "copyWithZone:", objc_msgSend(v5, "zone"));
      }
      if (v14) {
        v46->_textLists = (NSArray *)objc_msgSend(v14, "copyWithZone:", objc_msgSend(v5, "zone"));
      }
      v46->_lineBoundsOptions = v15;
      v46->_lineBreakStrategy = v16;
      v46->_compositionLanguage = v54;
      v46->_usesDefaultHyphenation = v52;
      v46->_spansAllLines = v17;
      v46->_secondaryLineBreakMode = v55;
      v46->_alignmentFollowsWritingDirection = v53;
      double v47 = 0.0;
      if ((v52 & (v10 == *(float *)&__NSDefaultHyphenationFactor)) == 0) {
        double v47 = v10;
      }
      v46->_hyphenationFactor = v47;
      v46->_listIntentOrdinal = [a3 _listIntentOrdinal];
      v46->_presentationIntents = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_presentationIntents"), "copy");
      v46->_codeBlockIntentLanguageHint = (NSString *)objc_msgSend((id)objc_msgSend(a3, "codeBlockIntentLanguageHint"), "copy");
      v46->_horizontalAlignment = v18;
      v46->_fullyJustified = v19;
      goto LABEL_32;
    }
    if (v57 == 1.0)
    {
      unsigned int v50 = v5[18] & 0xFFFFE7FF | 0x800;
    }
    else if (v57 == 1.5)
    {
      unsigned int v50 = v5[18] & 0xFFFFE7FF | 0x1000;
    }
    else
    {
      if (v57 != 2.0) {
        goto LABEL_32;
      }
      unsigned int v50 = v5[18] | 0x1800;
    }
    v5[18] = v50;
LABEL_32:
    if ([a3 _presentationIntents]) {
      *(void *)(*((void *)v5 + 11) + 96) = objc_msgSend((id)objc_msgSend(a3, "_presentationIntents"), "copy");
    }
    return v5;
  }
  uint64_t v31 = [a3 baseWritingDirection];
  unsigned int v32 = v5[18] & 0xFFFFFFF0 | *((_DWORD *)a3 + 18) & 0xF;
  v5[18] = v32;
  *((void *)v5 + 3) = *((void *)a3 + 3);
  *((void *)v5 + 4) = *((void *)a3 + 4);
  *((void *)v5 + 1) = *((void *)a3 + 1);
  unsigned int v33 = v32 & 0xFFFFFF0F | (16 * ((*((_DWORD *)a3 + 18) >> 4) & 0xF));
  v5[18] = v33;
  *((void *)v5 + 5) = *((void *)a3 + 5);
  *((void *)v5 + 2) = *((void *)a3 + 2);
  *((void *)v5 + 6) = *((void *)a3 + 6);
  *((void *)v5 + 7) = *((void *)a3 + 7);
  v34 = (void *)*((void *)a3 + 8);
  if (v34)
  {
    uint64_t v35 = objc_msgSend(v34, "copyWithZone:", objc_msgSend(v5, "zone"));
    unsigned int v33 = v5[18];
  }
  else
  {
    uint64_t v35 = 0;
  }
  *((void *)v5 + 8) = v35;
  v5[18] = v33 & 0xFFFFFEFF;
  unsigned int v38 = *((_DWORD *)a3 + 18) & 0x1800 | v33 & 0xFFFFE6FF;
  v5[18] = v38;
  unsigned int v39 = v38 & 0xFFFFDFFF | *((_DWORD *)a3 + 18) & 0x2000;
  v5[18] = v39;
  *((void *)v5 + 10) = *((void *)a3 + 10);
  if (v31 == -1)
  {
    v5[18] = v39 | 0x200;
    unsigned int v40 = v5[18] & 0xFFFFFBFF | (([(id)objc_opt_class() _defaultWritingDirection] == 1) << 10);
  }
  else
  {
    unsigned int v40 = v39 & 0xFFFFF8FF | ((v31 == 1) << 10);
  }
  v5[18] = v40;
  if (*((void *)a3 + 11))
  {
    v41 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", [v5 zone]), "init");
    *((void *)v5 + 11) = v41;
    uint64_t v42 = *((void *)a3 + 11);
    v41->_lineHeightMultiple = *(double *)(v42 + 8);
    v41->_paragraphSpacingBefore = *(double *)(v42 + 16);
    v41->_hyphenationFactor = *(double *)(v42 + 24);
    v41->_tighteningFactor = *(double *)(v42 + 32);
    v41->_headerLevel = *(void *)(v42 + 40);
    v43 = *(void **)(v42 + 48);
    if (v43) {
      v41->_textBlocks = (NSArray *)objc_msgSend(v43, "copyWithZone:", objc_msgSend(v5, "zone"));
    }
    v44 = *(void **)(v42 + 56);
    if (v44) {
      v41->_textLists = (NSArray *)objc_msgSend(v44, "copyWithZone:", objc_msgSend(v5, "zone"));
    }
    v41->_lineBoundsOptions = *(void *)(v42 + 64);
    v41->_lineBreakStrategy = *(void *)(v42 + 72);
    v41->_usesDefaultHyphenation = *(unsigned char *)(v42 + 80);
    v41->_spansAllLines = *(unsigned char *)(v42 + 81);
    v41->_secondaryLineBreakMode = *(void *)(v42 + 128);
    v41->_alignmentFollowsWritingDirection = *(unsigned char *)(v42 + 83);
    v41->_compositionLanguage = *(void *)(v42 + 88);
    v41->_presentationIntents = (NSArray *)[*(id *)(v42 + 96) copy];
    v41->_listIntentOrdinal = *(void *)(v42 + 104);
    v41->_codeBlockIntentLanguageHint = (NSString *)[*(id *)(v42 + 112) copy];
    v41->_horizontalAlignment = *(void *)(v42 + 120);
    v41->_fullyJustified = *(unsigned char *)(v42 + 82);
  }
  return v5;
}

- (BOOL)_isSuitableForFastStringDrawingWithAlignment:(int64_t *)a3 mirrorsTextAlignment:(BOOL)a4 lineBreakMode:(int64_t *)a5 tighteningFactorForTruncation:(double *)a6
{
  BOOL v8 = a4;
  if (object_getClass(self) == (Class)__NSParagraphStyleClass
    || object_getClass(self) == (Class)__NSMutableParagraphStyleClass)
  {
    if (self->_headIndent != 0.0
      || self->_tailIndent != 0.0
      || self->_firstLineHeadIndent != 0.0
      || self->_minimumLineHeight != 0.0
      || self->_maximumLineHeight != 0.0
      || (*(_DWORD *)&self->_flags & 0x400) != 0)
    {
LABEL_40:
      [(NSParagraphStyle *)self baseWritingDirection];
      return 0;
    }
    id extraData = (double *)self->_extraData;
    if (extraData)
    {
      double v24 = extraData[1];
      if (v24 != 0.0 && v24 != 1.0) {
        goto LABEL_40;
      }
      uint64_t v26 = (void *)*((void *)extraData + 6);
      if (v26)
      {
        if ([v26 count]) {
          goto LABEL_40;
        }
      }
      if ([(NSParagraphStyle *)self alignment] == NSTextAlignmentJustified && *((unsigned char *)extraData + 81)) {
        goto LABEL_40;
      }
      BOOL v29 = *((unsigned char *)extraData + 83) == 0;
      if (a6 && !*((unsigned char *)extraData + 83))
      {
        unsigned int v30 = extraData + 4;
        goto LABEL_48;
      }
    }
    else
    {
      int v28 = *(_DWORD *)&self->_flags & 0x1000;
      BOOL v29 = v28 == 0;
      if (a6 && !v28)
      {
        unsigned int v30 = (double *)&__NSTightenFactor;
LABEL_48:
        *a6 = *v30;
        NSWritingDirection v31 = [(NSParagraphStyle *)self baseWritingDirection];
LABEL_50:
        uint64_t v32 = v31;
        if (v31 == NSWritingDirectionRightToLeft
          || v31 == NSWritingDirectionNatural && [(id)objc_opt_class() _defaultWritingDirection] == 1)
        {
          return 0;
        }
        if (a3)
        {
          NSTextAlignment v33 = [(NSParagraphStyle *)self alignment];
          *a3 = v33;
          if ((unint64_t)(v33 - 3) <= 1)
          {
            if (v32 == -1) {
              uint64_t v32 = [(id)objc_opt_class() _defaultWritingDirection];
            }
            int64_t v34 = 2 * (v32 == 1);
            goto LABEL_58;
          }
          if (v8)
          {
            if (v33 == NSTextAlignmentLeft)
            {
              int64_t v34 = 2;
              goto LABEL_58;
            }
            if (v33 == NSTextAlignmentRight)
            {
              int64_t v34 = 0;
LABEL_58:
              *a3 = v34;
            }
          }
        }
        if (a5) {
          *a5 = (uint64_t)(int)(*(_DWORD *)&self->_flags << 24) >> 28;
        }
        return 1;
      }
    }
    NSWritingDirection v31 = [(NSParagraphStyle *)self baseWritingDirection];
    if (!v29) {
      return 0;
    }
    goto LABEL_50;
  }
  [(NSParagraphStyle *)self headIndent];
  if (v11 != 0.0) {
    goto LABEL_40;
  }
  [(NSParagraphStyle *)self tailIndent];
  if (v12 != 0.0) {
    goto LABEL_40;
  }
  [(NSParagraphStyle *)self firstLineHeadIndent];
  if (v13 != 0.0) {
    goto LABEL_40;
  }
  [(NSParagraphStyle *)self minimumLineHeight];
  if (v14 != 0.0) {
    goto LABEL_40;
  }
  [(NSParagraphStyle *)self maximumLineHeight];
  if (v15 != 0.0) {
    goto LABEL_40;
  }
  [(NSParagraphStyle *)self lineHeightMultiple];
  if (v16 != 0.0 && v16 != 1.0) {
    goto LABEL_40;
  }
  char v17 = [(NSParagraphStyle *)self textBlocks];
  if (v17)
  {
    if ([(NSArray *)v17 count]) {
      goto LABEL_40;
    }
  }
  if ([(NSParagraphStyle *)self alignment] == NSTextAlignmentJustified
    && [(NSParagraphStyle *)self spansAllLines])
  {
    goto LABEL_40;
  }
  BOOL v18 = [(NSParagraphStyle *)self _alignmentFollowsWritingDirection];
  NSWritingDirection v19 = [(NSParagraphStyle *)self baseWritingDirection];
  if (v18) {
    return 0;
  }
  uint64_t v20 = v19;
  if (v19 == NSWritingDirectionRightToLeft
    || v19 == NSWritingDirectionNatural && [(id)objc_opt_class() _defaultWritingDirection] == 1)
  {
    return 0;
  }
  if (a3)
  {
    NSTextAlignment v21 = [(NSParagraphStyle *)self alignment];
    *a3 = v21;
    if ((unint64_t)(v21 - 3) > 1)
    {
      if (!v8) {
        goto LABEL_69;
      }
      if (v21)
      {
        if (v21 != NSTextAlignmentRight) {
          goto LABEL_69;
        }
        int64_t v22 = 0;
      }
      else
      {
        int64_t v22 = 2;
      }
    }
    else
    {
      if (v20 == -1) {
        uint64_t v20 = [(id)objc_opt_class() _defaultWritingDirection];
      }
      int64_t v22 = 2 * (v20 == 1);
    }
    *a3 = v22;
  }
LABEL_69:
  if (a5) {
    *a5 = [(NSParagraphStyle *)self lineBreakMode];
  }
  if (a6)
  {
    [(NSParagraphStyle *)self tighteningFactorForTruncation];
    *a6 = v35;
  }
  return 1;
}

+ (int64_t)_defaultWritingDirection
{
  int64_t v2 = _defaultWritingDirection_defaultDirection;
  if (_defaultWritingDirection_defaultDirection == -1)
  {
    unsigned int v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v4 BOOLForKey:@"NSForceRightToLeftWritingDirection"])
    {
      int64_t v2 = 1;
LABEL_12:
      _defaultWritingDirection_defaultDirection = v2;
      return v2;
    }
    MainBundle = CFBundleGetMainBundle();
    if (!MainBundle || (double v6 = MainBundle, (v7 = CFBundleCopyBundleLocalizations(MainBundle)) == 0))
    {
      int64_t v2 = 0;
      goto LABEL_12;
    }
    CFArrayRef v8 = v7;
    CFArrayRef v9 = CFBundleCopyPreferredLocalizationsFromArray(v7);
    if (v9)
    {
      CFArrayRef v10 = v9;
      int64_t v2 = objc_msgSend(a1, "defaultWritingDirectionForLanguage:", -[__CFArray objectAtIndex:](v9, "objectAtIndex:", 0));
      CFRelease(v10);
      if (v2 != 1)
      {
LABEL_10:
        CFRelease(v8);
        goto LABEL_12;
      }
      if (([v4 BOOLForKey:@"NSForceLeftToRightWritingDirection"] & 1) == 0)
      {
        CFBooleanRef ValueForInfoDictionaryKey = (const __CFBoolean *)CFBundleGetValueForInfoDictionaryKey(v6, @"NSForceLeftToRightWritingDirection");
        if (!ValueForInfoDictionaryKey
          || ((CFBooleanRef v13 = ValueForInfoDictionaryKey, v14 = CFGetTypeID(ValueForInfoDictionaryKey),
                                                CFBooleanGetTypeID() != v14)
           || !CFBooleanGetValue(v13))
          && (CFNumberGetTypeID() != v14 || ([(__CFBoolean *)v13 BOOLValue] & 1) == 0)
          && (CFStringGetTypeID() != v14
           || CFStringGetLength((CFStringRef)v13) < 1
           || CFStringGetCharacterAtIndex((CFStringRef)v13, 0) != 89
           && CFStringGetCharacterAtIndex((CFStringRef)v13, 0) != 121))
        {
          int64_t v2 = 1;
          goto LABEL_10;
        }
      }
    }
    int64_t v2 = 0;
    goto LABEL_10;
  }
  return v2;
}

- (NSWritingDirection)baseWritingDirection
{
  unint64_t flags = self->_flags;
  if ((flags & 0x200) != 0) {
    return -1;
  }
  else {
    return (flags >> 10) & 1;
  }
}

- (NSTextAlignment)alignment
{
  return NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unsigned int v4 = +[NSMutableParagraphStyle allocWithZone:[(NSParagraphStyle *)self zone]];

  return [(NSParagraphStyle *)v4 _initWithParagraphStyle:self];
}

- (CGFloat)headIndent
{
  return self->_headIndent;
}

- (NSLineBreakMode)lineBreakMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_flags << 24) >> 28;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_156;
  }
  if (!a3) {
    goto LABEL_141;
  }
  if (object_getClass(self) != (Class)__NSParagraphStyleClass
    && object_getClass(self) != (Class)__NSMutableParagraphStyleClass
    || object_getClass(a3) != (Class)__NSParagraphStyleClass
    && object_getClass(a3) != (Class)__NSMutableParagraphStyleClass)
  {
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(NSParagraphStyle *)self horizontalAlignment];
      if (v5 == [a3 horizontalAlignment])
      {
        int v6 = [(NSParagraphStyle *)self isFullyJustified];
        if (v6 == [a3 isFullyJustified])
        {
          [(NSParagraphStyle *)self headIndent];
          double v8 = v7;
          [a3 headIndent];
          if (v8 == v9)
          {
            [(NSParagraphStyle *)self firstLineHeadIndent];
            double v11 = v10;
            [a3 firstLineHeadIndent];
            if (v11 == v12)
            {
              [(NSParagraphStyle *)self tailIndent];
              double v14 = v13;
              [a3 tailIndent];
              if (v14 == v15)
              {
                [(NSParagraphStyle *)self lineSpacing];
                double v17 = v16;
                [a3 lineSpacing];
                if (v17 == v18)
                {
                  NSLineBreakMode v19 = [(NSParagraphStyle *)self lineBreakMode];
                  if (v19 == [a3 lineBreakMode])
                  {
                    [(NSParagraphStyle *)self paragraphSpacing];
                    double v21 = v20;
                    [a3 paragraphSpacing];
                    if (v21 == v22)
                    {
                      [(NSParagraphStyle *)self minimumLineHeight];
                      double v24 = v23;
                      [a3 minimumLineHeight];
                      if (v24 == v25)
                      {
                        [(NSParagraphStyle *)self maximumLineHeight];
                        double v27 = v26;
                        [a3 maximumLineHeight];
                        if (v27 == v28)
                        {
                          [(NSParagraphStyle *)self lineHeightMultiple];
                          double v30 = v29;
                          [a3 lineHeightMultiple];
                          if (v30 == v31)
                          {
                            [(NSParagraphStyle *)self paragraphSpacingBefore];
                            double v33 = v32;
                            [a3 paragraphSpacingBefore];
                            if (v33 == v34)
                            {
                              [(NSParagraphStyle *)self hyphenationFactor];
                              float v36 = v35;
                              [a3 hyphenationFactor];
                              if (v36 == v37)
                              {
                                [(NSParagraphStyle *)self tighteningFactorForTruncation];
                                float v39 = v38;
                                [a3 tighteningFactorForTruncation];
                                if (v39 == v40)
                                {
                                  NSInteger v41 = [(NSParagraphStyle *)self headerLevel];
                                  if (v41 == [a3 headerLevel])
                                  {
                                    [(NSParagraphStyle *)self defaultTabInterval];
                                    double v43 = v42;
                                    [a3 defaultTabInterval];
                                    if (v43 == v44)
                                    {
                                      NSWritingDirection v45 = [(NSParagraphStyle *)self baseWritingDirection];
                                      if (v45 == [a3 baseWritingDirection])
                                      {
                                        v46 = [(NSParagraphStyle *)self tabStops];
                                        if (v46 != (NSArray *)[a3 tabStops])
                                        {
                                          int v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle tabStops](self, "tabStops"), "isEqualToArray:", [a3 tabStops]);
                                          if (!v47) {
                                            return v47;
                                          }
                                        }
                                        v48 = [(NSParagraphStyle *)self textBlocks];
                                        if (v48 != (NSArray *)[a3 textBlocks])
                                        {
                                          int v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle textBlocks](self, "textBlocks"), "isEqualToArray:", [a3 textBlocks]);
                                          if (!v47) {
                                            return v47;
                                          }
                                        }
                                        float64x2_t v49 = [(NSParagraphStyle *)self textLists];
                                        if (v49 != (NSArray *)[a3 textLists])
                                        {
                                          int v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle textLists](self, "textLists"), "isEqualToArray:", [a3 textLists]);
                                          if (!v47) {
                                            return v47;
                                          }
                                        }
                                        int v50 = [(NSParagraphStyle *)self allowsDefaultTighteningForTruncation];
                                        if (v50 == [a3 allowsDefaultTighteningForTruncation])
                                        {
                                          unint64_t v51 = [(NSParagraphStyle *)self _lineBoundsOptions];
                                          if (v51 == [a3 _lineBoundsOptions])
                                          {
                                            NSLineBreakStrategy v52 = [(NSParagraphStyle *)self lineBreakStrategy];
                                            if (v52 == [a3 lineBreakStrategy])
                                            {
                                              int v53 = [(NSParagraphStyle *)self usesDefaultHyphenation];
                                              if (v53 == [a3 usesDefaultHyphenation])
                                              {
                                                int v54 = [(NSParagraphStyle *)self spansAllLines];
                                                if (v54 == [a3 spansAllLines])
                                                {
                                                  int64_t v55 = [(NSParagraphStyle *)self secondaryLineBreakMode];
                                                  if (v55 == [a3 secondaryLineBreakMode])
                                                  {
                                                    int v56 = [(NSParagraphStyle *)self _alignmentFollowsWritingDirection];
                                                    if (v56 == [a3 _alignmentFollowsWritingDirection])
                                                    {
                                                      int64_t v57 = [(NSParagraphStyle *)self compositionLanguage];
                                                      if (v57 == [a3 compositionLanguage])
                                                      {
                                                        objc_super v58 = [(NSParagraphStyle *)self _presentationIntents];
                                                        uint64_t v59 = MEMORY[0x1E4F1CBF0];
                                                        if (v58) {
                                                          v60 = v58;
                                                        }
                                                        else {
                                                          v60 = (NSArray *)MEMORY[0x1E4F1CBF0];
                                                        }
                                                        uint64_t v61 = [a3 _presentationIntents];
                                                        if (v61) {
                                                          uint64_t v62 = v61;
                                                        }
                                                        else {
                                                          uint64_t v62 = v59;
                                                        }
                                                        int v47 = [(NSArray *)v60 isEqual:v62];
                                                        if (!v47) {
                                                          return v47;
                                                        }
                                                        int64_t v63 = [(NSParagraphStyle *)self _listIntentOrdinal];
                                                        if (v63 == [a3 _listIntentOrdinal])
                                                        {
                                                          v64 = [(NSParagraphStyle *)self codeBlockIntentLanguageHint];
                                                          uint64_t v65 = [a3 codeBlockIntentLanguageHint];
                                                          LOBYTE(v47) = [(NSString *)v64 isEqual:v65];
                                                          return v47;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_141:
    LOBYTE(v47) = 0;
    return v47;
  }
  id extraData = (unsigned __int8 *)self->_extraData;
  uint64_t v67 = *((void *)a3 + 11);
  if (extraData && v67)
  {
    if (*((double *)extraData + 1) != *(double *)(v67 + 8)
      || *((double *)extraData + 2) != *(double *)(v67 + 16)
      || *((double *)extraData + 3) != *(double *)(v67 + 24)
      || *((double *)extraData + 4) != *(double *)(v67 + 32)
      || *((void *)extraData + 5) != *(void *)(v67 + 40))
    {
      goto LABEL_141;
    }
    v68 = (void *)*((void *)extraData + 6);
    if (v68 != *(void **)(v67 + 48))
    {
      int v47 = objc_msgSend(v68, "isEqualToArray:");
      if (!v47) {
        return v47;
      }
    }
    uint64_t v69 = *((void *)extraData + 7);
    uint64_t v70 = *(void *)(v67 + 56);
    if (v69 != v70)
    {
      v71 = (void *)(v69 ? *((void *)extraData + 7) : MEMORY[0x1E4F1CBF0]);
      uint64_t v72 = v70 ? *(void *)(v67 + 56) : MEMORY[0x1E4F1CBF0];
      int v47 = [v71 isEqualToArray:v72];
      if (!v47) {
        return v47;
      }
    }
    if (*((void *)extraData + 8) != *(void *)(v67 + 64)
      || *((void *)extraData + 9) != *(void *)(v67 + 72)
      || extraData[80] != *(unsigned __int8 *)(v67 + 80)
      || extraData[81] != *(unsigned __int8 *)(v67 + 81)
      || *((void *)extraData + 16) != *(void *)(v67 + 128)
      || extraData[83] != *(unsigned __int8 *)(v67 + 83)
      || *((void *)extraData + 11) != *(void *)(v67 + 88))
    {
      goto LABEL_141;
    }
    if (*((void *)extraData + 12)) {
      v73 = (void *)*((void *)extraData + 12);
    }
    else {
      v73 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (*(void *)(v67 + 96)) {
      uint64_t v74 = *(void *)(v67 + 96);
    }
    else {
      uint64_t v74 = MEMORY[0x1E4F1CBF0];
    }
    int v47 = [v73 isEqual:v74];
    if (!v47) {
      return v47;
    }
    if (*((void *)extraData + 13) != *(void *)(v67 + 104)) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 14)) {
      v75 = (__CFString *)*((void *)extraData + 14);
    }
    else {
      v75 = &stru_1EDD49F70;
    }
    if (*(void *)(v67 + 112)) {
      v76 = *(__CFString **)(v67 + 112);
    }
    else {
      v76 = &stru_1EDD49F70;
    }
    int v47 = [(__CFString *)v75 isEqual:v76];
    if (!v47) {
      return v47;
    }
    if (*((void *)extraData + 15) != *(void *)(v67 + 120) || extraData[82] != *(unsigned __int8 *)(v67 + 82)) {
      goto LABEL_141;
    }
  }
  else if (!extraData || v67)
  {
    $22B4A0797DCB34CD9773A3EA0AC32B0B flags = self->_flags;
    if (extraData || !v67)
    {
      if (((*((_DWORD *)a3 + 18) ^ *(_DWORD *)&flags) & 0x180F) != 0) {
        goto LABEL_141;
      }
    }
    else
    {
      unsigned int v81 = (*(unsigned int *)&flags >> 11) & 3;
      double v82 = ((double)v81 + 1.0) * 0.5;
      if (!v81) {
        double v82 = 0.0;
      }
      if (v82 != *(double *)(v67 + 8)) {
        goto LABEL_141;
      }
      if (*(double *)(v67 + 16) != 0.0) {
        goto LABEL_141;
      }
      if (*(double *)(v67 + 24) != 0.0) {
        goto LABEL_141;
      }
      if (*(double *)&__NSTightenFactor != *(double *)(v67 + 32)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 40)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 48)) {
        goto LABEL_141;
      }
      if (objc_msgSend(*(id *)(v67 + 56), "count", *(double *)&__NSTightenFactor)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 64)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 72)) {
        goto LABEL_141;
      }
      if (__NSUsesDefaultHyphenation_0 != *(unsigned char *)(v67 + 80)) {
        goto LABEL_141;
      }
      if (*(unsigned char *)(v67 + 81)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 128)) {
        goto LABEL_141;
      }
      if (*(unsigned char *)(v67 + 83)) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 88)) {
        goto LABEL_141;
      }
      if ([*(id *)(v67 + 96) count]) {
        goto LABEL_141;
      }
      if (*(void *)(v67 + 104)) {
        goto LABEL_141;
      }
      if ([*(id *)(v67 + 112) length]) {
        goto LABEL_141;
      }
      uint64_t v83 = *(void *)(v67 + 120);
      if (v83 != [(NSParagraphStyle *)self horizontalAlignment] || *(unsigned char *)(v67 + 82)) {
        goto LABEL_141;
      }
    }
  }
  else
  {
    unsigned int v77 = (*((_DWORD *)a3 + 18) >> 11) & 3;
    double v78 = ((double)v77 + 1.0) * 0.5;
    if (!v77) {
      double v78 = 0.0;
    }
    if (*((double *)extraData + 1) != v78) {
      goto LABEL_141;
    }
    if (*((double *)extraData + 2) != 0.0) {
      goto LABEL_141;
    }
    if (*((double *)extraData + 3) != 0.0) {
      goto LABEL_141;
    }
    if (*((double *)extraData + 4) != *(double *)&__NSTightenFactor) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 5)) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 6)) {
      goto LABEL_141;
    }
    if ([*((id *)extraData + 7) count]) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 8)) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 9)) {
      goto LABEL_141;
    }
    if (extraData[80] != __NSUsesDefaultHyphenation_0) {
      goto LABEL_141;
    }
    if (extraData[81]) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 16)) {
      goto LABEL_141;
    }
    if (extraData[83]) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 11)) {
      goto LABEL_141;
    }
    if ([*((id *)extraData + 12) count]) {
      goto LABEL_141;
    }
    if (*((void *)extraData + 13)) {
      goto LABEL_141;
    }
    if ([*((id *)extraData + 14) length]) {
      goto LABEL_141;
    }
    uint64_t v79 = *((void *)extraData + 15);
    if (v79 != [a3 horizontalAlignment] || extraData[82]) {
      goto LABEL_141;
    }
  }
  if (self->_headIndent != *((double *)a3 + 3)) {
    goto LABEL_141;
  }
  if (self->_firstLineHeadIndent != *((double *)a3 + 5)) {
    goto LABEL_141;
  }
  if (self->_tailIndent != *((double *)a3 + 4)) {
    goto LABEL_141;
  }
  if (self->_lineSpacing != *((double *)a3 + 1)) {
    goto LABEL_141;
  }
  int v84 = *((_DWORD *)a3 + 18) ^ *(_DWORD *)&self->_flags;
  if ((v84 & 0xF0) != 0
    || self->_paragraphSpacing != *((double *)a3 + 2)
    || self->_minimumLineHeight != *((double *)a3 + 6)
    || self->_maximumLineHeight != *((double *)a3 + 7))
  {
    goto LABEL_141;
  }
  LOBYTE(v47) = 0;
  if ((v84 & 0x2600) != 0 || self->_defaultTabInterval != *((double *)a3 + 10)) {
    return v47;
  }
  if (self->_tabStops == (NSArray *)*((void *)a3 + 8))
  {
LABEL_156:
    LOBYTE(v47) = 1;
    return v47;
  }
  v85 = [(NSParagraphStyle *)self tabStops];
  uint64_t v86 = [a3 tabStops];

  LOBYTE(v47) = [(NSArray *)v85 isEqualToArray:v86];
  return v47;
}

- (NSArray)textBlocks
{
  id extraData = self->_extraData;
  NSWritingDirection result = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (extraData)
  {
    unsigned int v4 = (NSArray *)*((void *)extraData + 6);
    if (v4) {
      return v4;
    }
  }
  return result;
}

- (NSArray)textLists
{
  id extraData = self->_extraData;
  NSWritingDirection result = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (extraData)
  {
    unsigned int v4 = (NSArray *)*((void *)extraData + 7);
    if (v4) {
      return v4;
    }
  }
  return result;
}

uint64_t __41__NSParagraphStyle_defaultParagraphStyle__block_invoke()
{
  uint64_t result = [objc_allocWithZone((Class)NSParagraphStyle) init];
  defaultParagraphStyle_paraStyle = result;
  return result;
}

- (NSParagraphStyle)init
{
  return (NSParagraphStyle *)[(NSParagraphStyle *)self _initWithParagraphStyle:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSParagraphStyle;
  [(NSParagraphStyle *)&v3 dealloc];
}

- (int64_t)secondaryLineBreakMode
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[16];
  }
  else {
    return 0;
  }
}

- (CGFloat)defaultTabInterval
{
  return self->_defaultTabInterval;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_allocExtraData
{
  if (!self->_extraData)
  {
    if (objc_getAssociatedObject(self, a2)) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSParagraphStyle.m", 610, @"_allocExtraData is not reentrant!");
    }
    objc_setAssociatedObject(self, a2, MEMORY[0x1E4F1CC38], (void *)1);
    unsigned int v4 = [+[NSParagraphStyleExtraData allocWithZone:[(NSParagraphStyle *)self zone]] init];
    [(NSParagraphStyle *)self lineHeightMultiple];
    v4->_lineHeightMultiple = v5;
    [(NSParagraphStyle *)self paragraphSpacingBefore];
    v4->_paragraphSpacingBefore = v6;
    v4->_hyphenationFactor = 0.0;
    [(NSParagraphStyle *)self tighteningFactorForTruncation];
    v4->_tighteningFactor = v7;
    NSInteger v8 = [(NSParagraphStyle *)self headerLevel];
    v4->_presentationIntents = 0;
    v4->_textBlocks = 0;
    v4->_textLists = 0;
    v4->_headerLevel = v8;
    v4->_lineBoundsOptions = [(NSParagraphStyle *)self _lineBoundsOptions];
    v4->_lineBreakStrategy = [(NSParagraphStyle *)self lineBreakStrategy];
    v4->_usesDefaultHyphenation = [(NSParagraphStyle *)self usesDefaultHyphenation];
    v4->_spansAllLines = [(NSParagraphStyle *)self spansAllLines];
    v4->_secondaryLineBreakMode = [(NSParagraphStyle *)self secondaryLineBreakMode];
    v4->_alignmentFollowsWritingDirection = [(NSParagraphStyle *)self _alignmentFollowsWritingDirection];
    v4->_compositionLanguage = [(NSParagraphStyle *)self compositionLanguage];
    v4->_listIntentOrdinal = [(NSParagraphStyle *)self listIntentOrdinal];
    v4->_codeBlockIntentLanguageHint = (NSString *)[(NSString *)[(NSParagraphStyle *)self codeBlockIntentLanguageHint] copy];
    unsigned int v9 = *(_DWORD *)&self->_flags & 0xF;
    if (v9 <= 4)
    {
      v4->_horizontalAlignment = qword_18E5F75A8[v9];
      v4->_fullyJustified = 0x1000000uLL >> (8 * v9);
    }
    self->_id extraData = v4;
    objc_setAssociatedObject(self, a2, 0, (void *)1);
  }
}

- (unint64_t)_lineBoundsOptions
{
  id extraData = self->_extraData;
  if (extraData) {
    unint64_t v4 = extraData[8];
  }
  else {
    unint64_t v4 = 0;
  }
  if (object_getClass(self) != (Class)__NSParagraphStyleClass
    && object_getClass(self) != (Class)__NSMutableParagraphStyleClass)
  {
    BOOL v5 = [(NSParagraphStyle *)self allowsHangingPunctuation];
    uint64_t v6 = 4;
    if (!v5) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 | v4 & 0xFFFFFFFFFFFFFFFBLL;
    if ([(NSParagraphStyle *)self usesOpticalAlignment]) {
      return v7 | 0x10;
    }
    else {
      return v7 & 0xFFFFFFFFFFFFFFEFLL;
    }
  }
  return v4;
}

- (int64_t)compositionLanguage
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[11];
  }
  else {
    return 0;
  }
}

- (BOOL)_alignmentFollowsWritingDirection
{
  id extraData = self->_extraData;
  return extraData && extraData[83] != 0;
}

- (BOOL)spansAllLines
{
  id extraData = self->_extraData;
  return extraData && extraData[81] != 0;
}

- (float)hyphenationFactor
{
  id extraData = (double *)self->_extraData;
  if (extraData)
  {
    float v3 = extraData[3];
    if (v3 != 0.0) {
      return v3;
    }
  }
  else
  {
    float v3 = 0.0;
  }
  if (![(NSParagraphStyle *)self usesDefaultHyphenation]) {
    return v3;
  }
  unint64_t v4 = objc_opt_class();

  [v4 _defaultHyphenationFactor];
  return result;
}

- (BOOL)usesDefaultHyphenation
{
  id extraData = (char *)self->_extraData;
  if (extraData) {
    float v3 = (BOOL *)(extraData + 80);
  }
  else {
    float v3 = (BOOL *)&__NSUsesDefaultHyphenation_0;
  }
  return *v3;
}

- (NSLineBreakStrategy)lineBreakStrategy
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[9];
  }
  else {
    return 0;
  }
}

- (CGFloat)paragraphSpacingBefore
{
  id extraData = (double *)self->_extraData;
  if (extraData) {
    return extraData[2];
  }
  else {
    return 0.0;
  }
}

- (float)tighteningFactorForTruncation
{
  id extraData = (char *)self->_extraData;
  if (extraData) {
    float v3 = (double *)(extraData + 32);
  }
  else {
    float v3 = (double *)&__NSTightenFactor;
  }
  return *v3;
}

- (NSInteger)headerLevel
{
  id extraData = self->_extraData;
  if (extraData) {
    return extraData[5];
  }
  else {
    return 0;
  }
}

- (NSArray)tabStops
{
  float result = self->_tabStops;
  if (!result)
  {
    if (defaultTabStops_onceToken != -1) {
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_457);
    }
    return (NSArray *)defaultTabStops_array;
  }
  return result;
}

- (CGFloat)paragraphSpacing
{
  return self->_paragraphSpacing;
}

+ (void)initialize
{
  if (__NSParagraphStyleClass) {
    return;
  }
  int64_t v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 floatForKey:@"NSTighteningFactorForTruncation"];
  float v4 = v3;
  __NSParagraphStyleClass = objc_opt_class();
  __NSMutableParagraphStyleClass = objc_opt_class();
  if (v4 > 0.0 || v4 == 0.0 && [v2 objectForKey:@"NSTighteningFactorForTruncation"]) {
    *(double *)&__NSTightenFactor = v4;
  }
  if ([v2 objectForKey:@"NSAllowsDefaultTighteningForTruncation"])
  {
    char v5 = [v2 BOOLForKey:@"NSAllowsDefaultTighteningForTruncation"];
  }
  else
  {
    if (!__NSAllowsDefaultTightening || (dyld_program_sdk_at_least() & 1) != 0) {
      goto LABEL_9;
    }
    char v5 = 0;
  }
  __NSAllowsDefaultTightening = v5;
LABEL_9:
  if ([v2 objectForKey:@"NSUsesDefaultHyphenation"]) {
    __NSUsesDefaultHyphenation_0 = [v2 BOOLForKey:@"NSUsesDefaultHyphenation"];
  }
  if ([v2 objectForKey:@"NSDefaultHyphenationFactor"])
  {
    [v2 floatForKey:@"NSDefaultHyphenationFactor"];
    __NSDefaultHyphenationFactor = v6;
  }
  if ([v2 objectForKey:@"NSUsesOptimalLineBreaking"]) {
    __NSUsesOptimalLineBreaking = [v2 BOOLForKey:@"NSUsesOptimalLineBreaking"];
  }
  if ([v2 objectForKey:@"NSUsesOptimalLineBreakingForNonJustifiedAlignments"]) {
    __NSUsesOptimalLineBreakingForNonJustifiedAlignments = [v2 BOOLForKey:@"NSUsesOptimalLineBreakingForNonJustifiedAlignments"];
  }
}

+ (float)_defaultHyphenationFactor
{
  return *(float *)&__NSDefaultHyphenationFactor;
}

- (BOOL)allowsHangingPunctuation
{
  id extraData = (unsigned __int8 *)self->_extraData;
  if (extraData) {
    return (extraData[64] >> 2) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)usesOpticalAlignment
{
  id extraData = (unsigned __int8 *)self->_extraData;
  if (extraData) {
    return (extraData[64] >> 4) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  $22B4A0797DCB34CD9773A3EA0AC32B0B flags = self->_flags;
  double v6 = 0.0;
  if (((*(unsigned int *)&flags >> 11) & 3) != 0) {
    double v7 = ((double)((*(unsigned int *)&flags >> 11) & 3) + 1.0) * 0.5;
  }
  else {
    double v7 = 0.0;
  }
  unsigned int v8 = *(_DWORD *)&self->_flags & 0xF;
  if (v8 > 4)
  {
    LOBYTE(v48) = 0;
    uint64_t v49 = 0;
  }
  else
  {
    unint64_t v48 = 0x1000000uLL >> (8 * v8);
    uint64_t v49 = qword_18E5F75A8[v8];
  }
  id extraData = (double *)self->_extraData;
  if (extraData)
  {
    double v7 = extraData[1];
    double v10 = extraData[2];
    double v6 = extraData[3];
    double v11 = extraData[4];
    double v12 = (double)*((uint64_t *)extraData + 5);
    uint64_t v14 = *((void *)extraData + 6);
    uint64_t v13 = *((void *)extraData + 7);
    uint64_t v16 = *((void *)extraData + 8);
    uint64_t v15 = *((void *)extraData + 9);
    LODWORD(v50) = *((unsigned __int8 *)extraData + 80);
    HIDWORD(v50) = *((unsigned char *)extraData + 81) != 0;
    uint64_t v17 = *((void *)extraData + 11);
    uint64_t v18 = *((void *)extraData + 15);
    uint64_t v19 = *((void *)extraData + 16);
    int v51 = *((unsigned char *)extraData + 82) != 0;
    BOOL v52 = *((unsigned __int8 *)extraData + 83) != 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v16 = 0;
    uint64_t v15 = 0;
    int v51 = 0;
    uint64_t v19 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    BOOL v52 = 0;
    uint64_t v50 = __NSUsesDefaultHyphenation_0;
    double v11 = *(double *)&__NSTightenFactor;
    double v12 = 0.0;
    double v10 = 0.0;
  }
  if ([a3 allowsKeyedCoding])
  {
    $22B4A0797DCB34CD9773A3EA0AC32B0B v20 = self->_flags;
    if ((*(unsigned char *)&v20 & 0xF) != 0)
    {
      objc_msgSend(a3, "encodeInteger:forKey:");
      $22B4A0797DCB34CD9773A3EA0AC32B0B v20 = self->_flags;
    }
    if (*(unsigned char *)&v20 >> 4) {
      [a3 encodeInteger:(uint64_t)(int)(*(_DWORD *)&v20 << 24) >> 28 forKey:@"NSLineBreakMode"];
    }
    if (self->_lineSpacing != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSLineSpacing");
    }
    if (self->_paragraphSpacing != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSParagraphSpacing");
    }
    if (self->_headIndent != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSHeadIndent");
    }
    if (self->_firstLineHeadIndent != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSFirstLineHeadIndent");
    }
    if (self->_tailIndent != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSTailIndent");
    }
    if (self->_minimumLineHeight != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSMinLineHeight");
    }
    if (self->_maximumLineHeight != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSMaxLineHeight");
    }
    if (v7 != 0.0) {
      [a3 encodeDouble:@"NSLineHeightMultiple" forKey:v7];
    }
    if (v10 != 0.0) {
      [a3 encodeDouble:@"NSParagraphSpacingBefore" forKey:v10];
    }
    if (self->_defaultTabInterval != 0.0) {
      objc_msgSend(a3, "encodeDouble:forKey:", @"NSDefaultTabInterval");
    }
    if (v6 != 0.0) {
      [a3 encodeDouble:@"NSHyphenationFactor" forKey:v6];
    }
    if (v11 != *(double *)&__NSTightenFactor) {
      [a3 encodeDouble:@"NSTighteningFactorForTruncation" forKey:v11];
    }
    if (v12 != 0.0) {
      [a3 encodeDouble:@"NSHeaderLevel" forKey:v12];
    }
    if (self->_tabStops && (*((unsigned char *)&self->_flags + 1) & 1) != 0)
    {
      int v47 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_tabStops];
      [a3 encodeObject:v47 forKey:@"NSTabStops"];

      if (!v14) {
        goto LABEL_45;
      }
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:");
      if (!v14)
      {
LABEL_45:
        if (v13) {
          [a3 encodeObject:v13 forKey:@"NSTextLists"];
        }
        $22B4A0797DCB34CD9773A3EA0AC32B0B v21 = self->_flags;
        if ((*(_WORD *)&v21 & 0x200) == 0)
        {
          if ((*(_WORD *)&v21 & 0x400) != 0) {
            uint64_t v22 = 2;
          }
          else {
            uint64_t v22 = 1;
          }
          [a3 encodeInteger:v22 forKey:@"NSWritingDirection"];
        }
        if (v16) {
          [a3 encodeInteger:v16 forKey:@"NSLineBoundsOptions"];
        }
        if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
          [a3 encodeInteger:1 forKey:@"NSAllowsTighteningForTruncation"];
        }
        if (v15) {
          [a3 encodeInteger:v15 forKey:@"NSLineBreakStrategy"];
        }
        if (v50) {
          [a3 encodeBool:1 forKey:@"NSUsesDefaultHyphenation"];
        }
        if (HIDWORD(v50)) {
          [a3 encodeBool:1 forKey:@"NSSpansAllLines"];
        }
        if (v19) {
          [a3 encodeInteger:v19 forKey:@"NSSecondaryLineBreakMode"];
        }
        if (v17) {
          [a3 encodeInteger:v17 forKey:@"NSCompositionLanguage"];
        }
        if (v18 && (v18 != v49 || v51 != v48)) {
          [a3 encodeInteger:v18 forKey:@"NSTextHorizontalAlignment"];
        }
        if (v51 && (!(_BYTE)v48 || v18 != v49)) {
          [a3 encodeBool:1 forKey:@"NSFullyJustified"];
        }
        if (v52)
        {
          [a3 encodeBool:1 forKey:@"NSAlignmentFollowsWritingDirection"];
        }
        return;
      }
    }
    [a3 encodeObject:v14 forKey:@"NSTextBlocks"];
    goto LABEL_45;
  }
  $22B4A0797DCB34CD9773A3EA0AC32B0B v23 = self->_flags;
  char v55 = *(unsigned char *)&v23 & 0xF;
  char v54 = *(unsigned char *)&v23 >> 4;
  __int16 v53 = 0;
  double lineSpacing = self->_lineSpacing;
  if (lineSpacing == 0.0)
  {
    __int16 v25 = 0;
    uint64_t v27 = 0;
  }
  else
  {
    __int16 v25 = 1;
    __int16 v53 = 1;
    float v26 = lineSpacing;
    v56[0] = v26;
    uint64_t v27 = 1;
  }
  double paragraphSpacing = self->_paragraphSpacing;
  if (paragraphSpacing != 0.0)
  {
    v25 |= 2u;
    __int16 v53 = v25;
    float v29 = paragraphSpacing;
    v56[v27++] = v29;
  }
  double headIndent = self->_headIndent;
  if (headIndent != 0.0)
  {
    v25 |= 4u;
    __int16 v53 = v25;
    float v31 = headIndent;
    v56[v27++] = v31;
  }
  double tailIndent = self->_tailIndent;
  if (tailIndent != 0.0)
  {
    v25 |= 8u;
    __int16 v53 = v25;
    float v33 = tailIndent;
    v56[v27++] = v33;
  }
  double firstLineHeadIndent = self->_firstLineHeadIndent;
  if (firstLineHeadIndent != 0.0)
  {
    v25 |= 0x10u;
    __int16 v53 = v25;
    float v35 = firstLineHeadIndent;
    v56[v27++] = v35;
  }
  double minimumLineHeight = self->_minimumLineHeight;
  if (minimumLineHeight != 0.0)
  {
    v25 |= 0x20u;
    __int16 v53 = v25;
    float v37 = minimumLineHeight;
    v56[v27++] = v37;
  }
  double maximumLineHeight = self->_maximumLineHeight;
  if (maximumLineHeight != 0.0)
  {
    v25 |= 0x40u;
    __int16 v53 = v25;
    float v39 = maximumLineHeight;
    v56[v27++] = v39;
  }
  if (v7 != 0.0)
  {
    v25 |= 0x80u;
    __int16 v53 = v25;
    float v40 = v7;
    v56[v27++] = v40;
  }
  if (v10 != 0.0)
  {
    v25 |= 0x100u;
    __int16 v53 = v25;
    float v41 = v10;
    v56[v27++] = v41;
  }
  double defaultTabInterval = self->_defaultTabInterval;
  if (defaultTabInterval != 0.0)
  {
    v25 |= 0x200u;
    __int16 v53 = v25;
    float v43 = defaultTabInterval;
    v56[v27++] = v43;
  }
  if (v6 != 0.0)
  {
    v25 |= 0x400u;
    __int16 v53 = v25;
    float v44 = v6;
    v56[v27++] = v44;
  }
  if (v11 != *(double *)&__NSTightenFactor)
  {
    v25 |= 0x800u;
    __int16 v53 = v25;
    float v45 = v11;
    v56[v27++] = v45;
  }
  if (v12 != 0.0)
  {
    __int16 v53 = v25 | 0x1000;
    float v46 = v12;
    v56[v27++] = v46;
  }
  objc_msgSend(a3, "encodeValuesOfObjCTypes:", "CC@S", &v55, &v54, &self->_tabStops, &v53);
  if (v53) {
    [a3 encodeArrayOfObjCType:"f" count:v27 at:v56];
  }
}

- (NSParagraphStyle)initWithCoder:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  double v4 = *(double *)&__NSTightenFactor;
  int v5 = __NSUsesDefaultHyphenation_0;
  v78.receiver = self;
  v78.super_class = (Class)NSParagraphStyle;
  double v6 = [(NSParagraphStyle *)&v78 init];
  if (!v6) {
    return (NSParagraphStyle *)v6;
  }
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    __int16 v77 = 0;
    unsigned __int16 v76 = 0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "CC@S", (char *)&v77 + 1, &v77, v6 + 64, &v76);
    unsigned int v10 = *((_DWORD *)v6 + 18) & 0xFFFFFE00 | HIBYTE(v77) & 0xF | (16 * (v77 & 0xF));
    *((_DWORD *)v6 + 18) = v10;
    if (!v76)
    {
      double v75 = 0.0;
      double v25 = 0.0;
      double v28 = 0.0;
      double v31 = 0.0;
LABEL_72:
      *((_DWORD *)v6 + 18) = v10 | 0x200;
      uint64_t v63 = [(id)objc_opt_class() _defaultWritingDirection];
      uint64_t v72 = 0;
      unsigned __int8 v50 = 0;
      uint64_t v74 = 0;
      float v40 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      char v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      int v73 = 0;
      int v49 = 0;
      *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFBFF | ((v63 == 1) << 10);
      goto LABEL_73;
    }
    uint64_t v11 = 0;
    unint64_t v12 = 1;
    do
    {
      if (((unsigned __int16)v12 & v76) != 0) {
        ++v11;
      }
      BOOL v13 = v12 >= 0x8000;
      v12 *= 2;
    }
    while (!v13);
    [a3 decodeArrayOfObjCType:"f" count:v11 at:v79];
    unsigned __int16 v14 = v76;
    if (v76)
    {
      *((double *)v6 + 1) = v79[0];
      uint64_t v15 = 1;
      if ((v14 & 2) == 0) {
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if ((v76 & 2) == 0)
      {
LABEL_47:
        if ((v14 & 4) != 0)
        {
          float v54 = v79[v15++];
          *((double *)v6 + 3) = v54;
          if ((v14 & 8) == 0)
          {
LABEL_49:
            if ((v14 & 0x10) == 0) {
              goto LABEL_50;
            }
            goto LABEL_58;
          }
        }
        else if ((v14 & 8) == 0)
        {
          goto LABEL_49;
        }
        float v55 = v79[v15++];
        *((double *)v6 + 4) = v55;
        if ((v14 & 0x10) == 0)
        {
LABEL_50:
          if ((v14 & 0x20) == 0) {
            goto LABEL_51;
          }
          goto LABEL_59;
        }
LABEL_58:
        float v56 = v79[v15++];
        *((double *)v6 + 5) = v56;
        if ((v14 & 0x20) == 0)
        {
LABEL_51:
          if ((v14 & 0x40) == 0) {
            goto LABEL_53;
          }
          goto LABEL_52;
        }
LABEL_59:
        float v57 = v79[v15++];
        *((double *)v6 + 6) = v57;
        if ((v14 & 0x40) == 0)
        {
LABEL_53:
          double v25 = 0.0;
          if ((v14 & 0x80) != 0)
          {
            float v58 = v79[v15++];
            double v53 = v58;
            if ((v14 & 0x100) == 0)
            {
LABEL_63:
              if ((v14 & 0x200) != 0)
              {
                float v60 = v79[v15++];
                *((double *)v6 + 10) = v60;
              }
              double v28 = 0.0;
              if ((v14 & 0x400) != 0)
              {
                float v61 = v79[v15++];
                double v28 = v61;
              }
              if ((v14 & 0x800) != 0)
              {
                float v62 = v79[v15++];
                double v4 = v62;
              }
              double v31 = 0.0;
              if ((v14 & 0x1000) != 0) {
                double v31 = v79[v15];
              }
              double v75 = v53;
              unsigned int v10 = *((_DWORD *)v6 + 18);
              goto LABEL_72;
            }
          }
          else
          {
            double v53 = 0.0;
            if ((v14 & 0x100) == 0) {
              goto LABEL_63;
            }
          }
          float v59 = v79[v15++];
          double v25 = v59;
          goto LABEL_63;
        }
LABEL_52:
        float v52 = v79[v15++];
        *((double *)v6 + 7) = v52;
        goto LABEL_53;
      }
    }
    float v51 = v79[v15++];
    *((double *)v6 + 2) = v51;
    goto LABEL_47;
  }
  uint64_t v7 = [a3 decodeIntegerForKey:@"NSWritingDirection"];
  char v8 = [a3 decodeIntegerForKey:@"NSAlignment"];
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFFF0 | v8 & 0xF;
  if ((v8 & 0xFu) > 4)
  {
    uint64_t v72 = 0;
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v72 = qword_18E5F75A8[v8 & 0xF];
    unint64_t v9 = 0x1000000uLL >> (8 * (v8 & 0xFu));
  }
  unsigned __int8 v71 = v9;
  int v73 = v9 != 0;
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFF0F | (16
                                                            * ([a3 decodeIntegerForKey:@"NSLineBreakMode"] & 0xF));
  [a3 decodeDoubleForKey:@"NSLineSpacing"];
  *((void *)v6 + 1) = v16;
  [a3 decodeDoubleForKey:@"NSParagraphSpacing"];
  *((void *)v6 + 2) = v17;
  [a3 decodeDoubleForKey:@"NSHeadIndent"];
  *((void *)v6 + 3) = v18;
  [a3 decodeDoubleForKey:@"NSFirstLineHeadIndent"];
  *((void *)v6 + 5) = v19;
  [a3 decodeDoubleForKey:@"NSTailIndent"];
  *((void *)v6 + 4) = v20;
  [a3 decodeDoubleForKey:@"NSMinLineHeight"];
  *((void *)v6 + 6) = v21;
  [a3 decodeDoubleForKey:@"NSMaxLineHeight"];
  *((void *)v6 + 7) = v22;
  [a3 decodeDoubleForKey:@"NSLineHeightMultiple"];
  double v75 = v23;
  [a3 decodeDoubleForKey:@"NSParagraphSpacingBefore"];
  double v25 = v24;
  [a3 decodeDoubleForKey:@"NSDefaultTabInterval"];
  *((void *)v6 + 10) = v26;
  [a3 decodeDoubleForKey:@"NSHyphenationFactor"];
  double v28 = v27;
  if ([a3 containsValueForKey:@"NSTighteningFactorForTruncation"])
  {
    [a3 decodeDoubleForKey:@"NSTighteningFactorForTruncation"];
    double v4 = v29;
  }
  [a3 decodeDoubleForKey:@"NSHeaderLevel"];
  double v31 = v30;
  double v32 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  id v34 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0), @"NSTabStops");
  *((void *)v6 + 8) = v34;
  if (v34)
  {
    if ([a3 decodeBoolForKey:@"NSTabStopsMutable"]) {
      int v35 = 256;
    }
    else {
      int v35 = 0;
    }
    *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFEFF | v35;
  }
  float v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  uint64_t v74 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0), @"NSTextBlocks");
  float v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  float v40 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0), @"NSTextLists");
  int v41 = *((_DWORD *)v6 + 18);
  if (v7)
  {
    unsigned int v42 = v41 & 0xFFFFF9FF | ((v7 == 2) << 10);
  }
  else
  {
    *((_DWORD *)v6 + 18) = v41 | 0x200;
    unsigned int v42 = *((_DWORD *)v6 + 18) & 0xFFFFFBFF | (([(id)objc_opt_class() _defaultWritingDirection] == 1) << 10);
  }
  *((_DWORD *)v6 + 18) = v42;
  uint64_t v43 = [a3 decodeIntegerForKey:@"NSLineBoundsOptions"];
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFDFFF | (([a3 decodeIntegerForKey:@"NSAllowsTighteningForTruncation"] != 0) << 13);
  uint64_t v44 = [a3 decodeIntegerForKey:@"NSLineBreakStrategy"];
  if ([a3 containsValueForKey:@"NSUsesDefaultHyphenation"]) {
    int v5 = [a3 decodeBoolForKey:@"NSUsesDefaultHyphenation"];
  }
  if ([a3 containsValueForKey:@"NSSpansAllLines"]) {
    char v45 = [a3 decodeBoolForKey:@"NSSpansAllLines"];
  }
  else {
    char v45 = 0;
  }
  if ([a3 containsValueForKey:@"NSSecondaryLineBreakMode"]) {
    uint64_t v46 = [a3 decodeIntegerForKey:@"NSSecondaryLineBreakMode"];
  }
  else {
    uint64_t v46 = 0;
  }
  if ([a3 containsValueForKey:@"NSCompositionLanguage"]) {
    uint64_t v47 = [a3 decodeIntegerForKey:@"NSCompositionLanguage"];
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v48 = v72;
  if ([a3 containsValueForKey:@"NSTextHorizontalAlignment"]) {
    uint64_t v48 = [a3 decodeIntegerForKey:@"NSTextHorizontalAlignment"];
  }
  if ([a3 containsValueForKey:@"NSFullyJustified"]) {
    int v73 = [a3 decodeBoolForKey:@"NSFullyJustified"];
  }
  if ([a3 containsValueForKey:@"NSAlignmentFollowsWritingDirection"]) {
    int v49 = [a3 decodeBoolForKey:@"NSAlignmentFollowsWritingDirection"];
  }
  else {
    int v49 = 0;
  }
  unsigned __int8 v50 = v71;
LABEL_73:
  if (v25 != 0.0) {
    goto LABEL_74;
  }
  float64x2_t v66 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v75, 0);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v66, (float64x2_t)xmmword_18E5F7570), (int32x4_t)vceqq_f64(v66, (float64x2_t)xmmword_18E5F7580)))) & 1) == 0|| v74|| v40|| v28 != 0.0|| v4 != *(double *)&__NSTightenFactor|| v31 != 0.0|| v43|| v44|| __NSUsesDefaultHyphenation_0 != (v5 != 0))
  {
    goto LABEL_74;
  }
  char v67 = v46 ? 1 : v45;
  if ((v67 & 1) != 0 || v47 || v48 && (v48 != v72 || v73 != v50)) {
    goto LABEL_74;
  }
  if (v73)
  {
    if (v50) {
      BOOL v68 = v48 == v72;
    }
    else {
      BOOL v68 = 0;
    }
    if (v68) {
      char v69 = v49;
    }
    else {
      char v69 = 1;
    }
    if ((v69 & 1) == 0) {
      goto LABEL_103;
    }
LABEL_74:
    *((_DWORD *)v6 + 18) &= 0xFFFFE7FF;
    v64 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", [v6 zone]), "init");
    *((void *)v6 + 11) = v64;
    v64->_lineHeightMultiple = v75;
    v64->_paragraphSpacingBefore = v25;
    v64->_hyphenationFactor = v28;
    v64->_tighteningFactor = v4;
    v64->_headerLevel = (uint64_t)v31;
    v64->_textBlocks = v74;
    v64->_textLists = v40;
    v64->_lineBoundsOptions = v43;
    v64->_lineBreakStrategy = v44;
    v64->_usesDefaultHyphenation = v5 != 0;
    v64->_spansAllLines = v45;
    v64->_compositionLanguage = v47;
    v64->_horizontalAlignment = v48;
    v64->_secondaryLineBreakMode = 0;
    v64->_fullyJustified = v73;
    v64->_alignmentFollowsWritingDirection = v49;
    return (NSParagraphStyle *)v6;
  }
  if (v49) {
    goto LABEL_74;
  }
LABEL_103:
  if (v75 == 1.0)
  {
    unsigned int v70 = *((_DWORD *)v6 + 18) & 0xFFFFE7FF | 0x800;
LABEL_109:
    *((_DWORD *)v6 + 18) = v70;
    return (NSParagraphStyle *)v6;
  }
  if (v75 == 1.5)
  {
    unsigned int v70 = *((_DWORD *)v6 + 18) & 0xFFFFE7FF | 0x1000;
    goto LABEL_109;
  }
  if (v75 == 2.0)
  {
    unsigned int v70 = *((_DWORD *)v6 + 18) | 0x1800;
    goto LABEL_109;
  }
  return (NSParagraphStyle *)v6;
}

- (NSString)description
{
  BOOL v3 = NSString;
  NSTextAlignment v4 = [(NSParagraphStyle *)self alignment];
  if ((unint64_t)v4 >= (NSTextAlignmentNatural|NSTextAlignmentCenter)) {
    char v45 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v4);
  }
  else {
    char v45 = off_1E55C7058[v4];
  }
  BOOL v5 = [(NSParagraphStyle *)self spansAllLines];
  [(NSParagraphStyle *)self lineSpacing];
  uint64_t v7 = v6;
  [(NSParagraphStyle *)self paragraphSpacing];
  uint64_t v9 = v8;
  [(NSParagraphStyle *)self paragraphSpacingBefore];
  uint64_t v11 = v10;
  [(NSParagraphStyle *)self headIndent];
  uint64_t v13 = v12;
  [(NSParagraphStyle *)self tailIndent];
  uint64_t v15 = v14;
  [(NSParagraphStyle *)self firstLineHeadIndent];
  uint64_t v17 = v16;
  [(NSParagraphStyle *)self minimumLineHeight];
  uint64_t v19 = v18;
  [(NSParagraphStyle *)self maximumLineHeight];
  uint64_t v21 = v20;
  [(NSParagraphStyle *)self lineHeightMultiple];
  uint64_t v50 = v22;
  NSLineBreakMode v23 = [(NSParagraphStyle *)self lineBreakMode];
  if ((unint64_t)v23 >= (NSLineBreakByTruncatingTail|NSLineBreakByClipping)) {
    uint64_t v44 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v23);
  }
  else {
    uint64_t v44 = off_1E55C7080[v23];
  }
  if ([(NSParagraphStyle *)self secondaryLineBreakMode])
  {
    double v24 = NSString;
    unint64_t v25 = [(NSParagraphStyle *)self secondaryLineBreakMode];
    if (v25 >= 3) {
      uint64_t v26 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v25);
    }
    else {
      uint64_t v26 = off_1E55C70B0[v25];
    }
    double v27 = (__CFString *)[v24 stringWithFormat:@", SecondaryLineBreakMode %@", v26];
  }
  else
  {
    double v27 = &stru_1EDD49F70;
  }
  double v28 = [(NSParagraphStyle *)self tabStops];
  [(NSParagraphStyle *)self defaultTabInterval];
  uint64_t v48 = v29;
  double v30 = [(NSParagraphStyle *)self textBlocks];
  double v31 = [(NSParagraphStyle *)self textLists];
  NSWritingDirection v32 = [(NSParagraphStyle *)self baseWritingDirection];
  uint64_t v51 = v7;
  int v49 = v27;
  uint64_t v46 = v30;
  uint64_t v47 = v28;
  if ((unint64_t)(v32 + 1) >= 3) {
    uint64_t v33 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", v32);
  }
  else {
    uint64_t v33 = off_1E55C70C8[v32 + 1];
  }
  if (v5) {
    id v34 = @", SpansAllLines YES";
  }
  else {
    id v34 = &stru_1EDD49F70;
  }
  [(NSParagraphStyle *)self hyphenationFactor];
  double v36 = v35;
  if ([(NSParagraphStyle *)self allowsDefaultTighteningForTruncation]) {
    uint64_t v37 = @"YES";
  }
  else {
    uint64_t v37 = @"NO";
  }
  NSInteger v38 = [(NSParagraphStyle *)self headerLevel];
  NSLineBreakStrategy v39 = [(NSParagraphStyle *)self lineBreakStrategy];
  if ([(NSParagraphStyle *)self usesDefaultHyphenation]) {
    float v40 = @", UsesDefaultHyphenation YES";
  }
  else {
    float v40 = &stru_1EDD49F70;
  }
  int v41 = [(NSParagraphStyle *)self _presentationIntents];
  if (v41) {
    unsigned int v42 = v41;
  }
  else {
    unsigned int v42 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"Alignment %@%@, LineSpacing %g, ParagraphSpacing %g, ParagraphSpacingBefore %g, HeadIndent %g, TailIndent %g, FirstLineHeadIndent %g, LineHeight %g/%g, LineHeightMultiple %g, LineBreakMode %@%@, Tabs %@, DefaultTabInterval %g, Blocks %@, Lists %@, BaseWritingDirection %@, HyphenationFactor %g, TighteningForTruncation %@, HeaderLevel %ld LineBreakStrategy %lu%@ PresentationIntents %@ ListIntentOrdinal %ld CodeBlockIntentLanguageHint '%@'", v45, v34, v51, v9, v11, v13, v15, v17, v19, v21, v50, v44, v49, v47, v48, v46,
                       v31,
                       v33,
                       *(void *)&v36,
                       v37,
                       v38,
                       v39,
                       v40,
                       v42,
                       [(NSParagraphStyle *)self _listIntentOrdinal],
                       [(NSParagraphStyle *)self codeBlockIntentLanguageHint]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end