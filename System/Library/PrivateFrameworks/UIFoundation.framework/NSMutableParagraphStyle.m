@interface NSMutableParagraphStyle
- (id)copyWithZone:(_NSZone *)a3;
- (void)_mutateTabStops;
- (void)_setLineBoundsOptions:(unint64_t)a3;
- (void)_setListIntentOrdinal:(int64_t)a3;
- (void)_setPresentationIntents:(id)a3;
- (void)addTabStop:(NSTextTab *)anObject;
- (void)removeTabStop:(NSTextTab *)anObject;
- (void)setAlignment:(NSTextAlignment)alignment;
- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation;
- (void)setAllowsHangingPunctuation:(BOOL)a3;
- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection;
- (void)setCodeBlockIntentLanguageHint:(id)a3;
- (void)setCompositionLanguage:(int64_t)a3;
- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval;
- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent;
- (void)setFullyJustified:(BOOL)a3;
- (void)setHeadIndent:(CGFloat)headIndent;
- (void)setHeaderLevel:(NSInteger)headerLevel;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHyphenationFactor:(float)hyphenationFactor;
- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode;
- (void)setLineBreakStrategy:(NSLineBreakStrategy)lineBreakStrategy;
- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple;
- (void)setLineSpacing:(CGFloat)lineSpacing;
- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight;
- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight;
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing;
- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore;
- (void)setParagraphStyle:(NSParagraphStyle *)obj;
- (void)setSecondaryLineBreakMode:(int64_t)a3;
- (void)setSpansAllLines:(BOOL)a3;
- (void)setTabStops:(NSArray *)tabStops;
- (void)setTailIndent:(CGFloat)tailIndent;
- (void)setTextBlocks:(NSArray *)textBlocks;
- (void)setTextLists:(NSArray *)textLists;
- (void)setTighteningFactorForTruncation:(float)tighteningFactorForTruncation;
- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation;
- (void)setUsesOpticalAlignment:(BOOL)a3;
@end

@implementation NSMutableParagraphStyle

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  char v3 = lineBreakMode;
  os_unfair_lock_lock_with_options();
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFF0F | (16 * (v3 & 0xF)));

  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection
{
  if (baseWritingDirection == NSWritingDirectionNatural)
  {
    uint64_t v6 = [(id)objc_opt_class() _defaultWritingDirection];
    os_unfair_lock_lock_with_options();
    if (v6 == 1) {
      int v7 = 1536;
    }
    else {
      int v7 = 512;
    }
    unsigned int v5 = v7 | *(_DWORD *)&self->super._flags & 0xFFFFF9FF;
  }
  else
  {
    os_unfair_lock_lock_with_options();
    unsigned int v5 = *(_DWORD *)&self->super._flags & 0xFFFFF9FF | ((baseWritingDirection == NSWritingDirectionRightToLeft) << 10);
  }
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)v5;

  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setParagraphStyle:(NSParagraphStyle *)obj
{
  [(NSMutableParagraphStyle *)self setAlignment:[(NSParagraphStyle *)obj alignment]];
  [(NSParagraphStyle *)obj lineSpacing];
  -[NSMutableParagraphStyle setLineSpacing:](self, "setLineSpacing:");
  [(NSMutableParagraphStyle *)self setLineBreakMode:[(NSParagraphStyle *)obj lineBreakMode]];
  [(NSParagraphStyle *)obj firstLineHeadIndent];
  -[NSMutableParagraphStyle setFirstLineHeadIndent:](self, "setFirstLineHeadIndent:");
  [(NSParagraphStyle *)obj paragraphSpacing];
  -[NSMutableParagraphStyle setParagraphSpacing:](self, "setParagraphSpacing:");
  [(NSParagraphStyle *)obj headIndent];
  -[NSMutableParagraphStyle setHeadIndent:](self, "setHeadIndent:");
  [(NSParagraphStyle *)obj tailIndent];
  -[NSMutableParagraphStyle setTailIndent:](self, "setTailIndent:");
  [(NSParagraphStyle *)obj minimumLineHeight];
  -[NSMutableParagraphStyle setMinimumLineHeight:](self, "setMinimumLineHeight:");
  [(NSParagraphStyle *)obj maximumLineHeight];
  -[NSMutableParagraphStyle setMaximumLineHeight:](self, "setMaximumLineHeight:");
  [(NSMutableParagraphStyle *)self setTabStops:[(NSParagraphStyle *)obj tabStops]];
  [(NSMutableParagraphStyle *)self setBaseWritingDirection:[(NSParagraphStyle *)obj baseWritingDirection]];
  [(NSParagraphStyle *)obj lineHeightMultiple];
  -[NSMutableParagraphStyle setLineHeightMultiple:](self, "setLineHeightMultiple:");
  [(NSParagraphStyle *)obj paragraphSpacingBefore];
  -[NSMutableParagraphStyle setParagraphSpacingBefore:](self, "setParagraphSpacingBefore:");
  [(NSParagraphStyle *)obj defaultTabInterval];
  -[NSMutableParagraphStyle setDefaultTabInterval:](self, "setDefaultTabInterval:");
  [(NSParagraphStyle *)obj tighteningFactorForTruncation];
  -[NSMutableParagraphStyle setTighteningFactorForTruncation:](self, "setTighteningFactorForTruncation:");
  [(NSMutableParagraphStyle *)self setHeaderLevel:[(NSParagraphStyle *)obj headerLevel]];
  [(NSMutableParagraphStyle *)self setTextBlocks:[(NSParagraphStyle *)obj textBlocks]];
  [(NSMutableParagraphStyle *)self setTextLists:[(NSParagraphStyle *)obj textLists]];
  [(NSMutableParagraphStyle *)self setAllowsDefaultTighteningForTruncation:[(NSParagraphStyle *)obj allowsDefaultTighteningForTruncation]];
  [(NSMutableParagraphStyle *)self setLineBreakStrategy:[(NSParagraphStyle *)obj lineBreakStrategy]];
  BOOL v5 = [(NSParagraphStyle *)obj usesDefaultHyphenation];
  BOOL v6 = [(NSParagraphStyle *)obj spansAllLines];
  int64_t v7 = [(NSParagraphStyle *)obj secondaryLineBreakMode];
  [(NSParagraphStyle *)obj hyphenationFactor];
  float v9 = v8;
  [(NSMutableParagraphStyle *)self setUsesDefaultHyphenation:v5];
  double v10 = 0.0;
  if (!v5 || *(float *)&__NSDefaultHyphenationFactor != v9) {
    *(float *)&double v10 = v9;
  }
  [(NSMutableParagraphStyle *)self setHyphenationFactor:v10];
  [(NSMutableParagraphStyle *)self setSpansAllLines:v6];
  [(NSMutableParagraphStyle *)self setSecondaryLineBreakMode:v7];
  [(NSMutableParagraphStyle *)self setHorizontalAlignment:[(NSParagraphStyle *)obj horizontalAlignment]];
  [(NSMutableParagraphStyle *)self setFullyJustified:[(NSParagraphStyle *)obj isFullyJustified]];
  BOOL v11 = [(NSParagraphStyle *)obj _alignmentFollowsWritingDirection];
  if (v11 || self->super._extraData)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((unsigned char *)self->super._extraData + 83) = v11;
  }
  int64_t v12 = [(NSParagraphStyle *)obj compositionLanguage];

  [(NSMutableParagraphStyle *)self setCompositionLanguage:v12];
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
  if (allowsDefaultTighteningForTruncation) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFDFFF | v3);
}

- (void)setAlignment:(NSTextAlignment)alignment
{
  os_unfair_lock_lock_with_options();
  CTTextAlignment v5 = NSTextAlignmentToCTTextAlignment(alignment);
  self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v5 & 0xF);
  extraData = self->super._extraData;
  if (extraData)
  {
    if ((v5 & 0xFu) <= 4)
    {
      extraData[15] = qword_18E5F75A8[v5 & 0xF];
      *((unsigned char *)extraData + 82) = 0x1000000uLL >> (8 * (v5 & 0xFu));
      extraData = self->super._extraData;
    }
    *((unsigned char *)extraData + 83) = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setHyphenationFactor:(float)hyphenationFactor
{
  extraData = (double *)self->super._extraData;
  if (extraData)
  {
    extraData[3] = hyphenationFactor;
  }
  else if (hyphenationFactor != 0.0)
  {
    double v5 = hyphenationFactor;
    [(NSParagraphStyle *)self _allocExtraData];
    *((double *)self->super._extraData + 3) = v5;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight
{
  self->super._minimumLineHeight = minimumLineHeight;
}

- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple
{
  extraData = (CGFloat *)self->super._extraData;
  if (extraData) {
    goto LABEL_2;
  }
  if (lineHeightMultiple == 0.0)
  {
    os_unfair_lock_lock_with_options();
    $22B4A0797DCB34CD9773A3EA0AC32B0B v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF);
  }
  else if (lineHeightMultiple == 1.0)
  {
    os_unfair_lock_lock_with_options();
    $22B4A0797DCB34CD9773A3EA0AC32B0B v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF | 0x800);
  }
  else if (lineHeightMultiple == 1.5)
  {
    os_unfair_lock_lock_with_options();
    $22B4A0797DCB34CD9773A3EA0AC32B0B v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFE7FF | 0x1000);
  }
  else
  {
    if (lineHeightMultiple != 2.0)
    {
      [(NSParagraphStyle *)self _allocExtraData];
      extraData = (CGFloat *)self->super._extraData;
LABEL_2:
      extraData[1] = lineHeightMultiple;
      return;
    }
    os_unfair_lock_lock_with_options();
    $22B4A0797DCB34CD9773A3EA0AC32B0B v6 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags | 0x1800);
  }
  self->super._flags = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
}

- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
  self->super._firstLineHeadIndent = firstLineHeadIndent;
}

- (void)setLineSpacing:(CGFloat)lineSpacing
{
  self->super._lineSpacing = lineSpacing;
}

- (void)setLineBreakStrategy:(NSLineBreakStrategy)lineBreakStrategy
{
  extraData = self->super._extraData;
  if (extraData)
  {
    extraData[9] = lineBreakStrategy;
  }
  else if (lineBreakStrategy)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 9) = lineBreakStrategy;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight
{
  self->super._maximumLineHeight = maximumLineHeight;
}

- (void)setFullyJustified:(BOOL)a3
{
  if ([(NSParagraphStyle *)self isFullyJustified] != a3)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    extraData = self->super._extraData;
    extraData[82] = a3;
    if (a3)
    {
      LODWORD(v6) = 3;
    }
    else
    {
      unint64_t v6 = *((void *)extraData + 15) - 2;
      if (v6 >= 3) {
        LODWORD(v6) = 4;
      }
    }
    self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v6);
  }
}

- (void)setSpansAllLines:(BOOL)a3
{
  if ([(NSParagraphStyle *)self spansAllLines] != a3)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((unsigned char *)self->super._extraData + 81) = a3;
  }
}

- (void)setSecondaryLineBreakMode:(int64_t)a3
{
  if ([(NSParagraphStyle *)self secondaryLineBreakMode] != a3)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 16) = a3;
  }
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  int64_t v5 = [(NSParagraphStyle *)self horizontalAlignment];
  if (!a3 || v5 != a3)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    extraData = self->super._extraData;
    extraData[15] = a3;
    *((unsigned char *)extraData + 83) = 1;
    int v7 = *((unsigned __int8 *)extraData + 82);
    int v8 = a3 - 2;
    if ((unint64_t)(a3 - 2) >= 3) {
      int v8 = 4;
    }
    if (v7) {
      int v9 = 3;
    }
    else {
      int v9 = v8;
    }
    self->super._flags = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFFF0 | v9);
  }
}

- (void)setCompositionLanguage:(int64_t)a3
{
  if ([(NSParagraphStyle *)self compositionLanguage] != a3)
  {
    extraData = self->super._extraData;
    if (!extraData)
    {
      [(NSParagraphStyle *)self _allocExtraData];
      extraData = self->super._extraData;
    }
    extraData[11] = a3;
  }
}

- (void)setParagraphSpacing:(CGFloat)paragraphSpacing
{
  self->super._paragraphSpacing = paragraphSpacing;
}

- (void)setHeadIndent:(CGFloat)headIndent
{
  self->super._headIndent = headIndent;
}

- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval
{
  self->super._defaultTabInterval = defaultTabInterval;
}

- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore
{
  extraData = (CGFloat *)self->super._extraData;
  if (extraData)
  {
    extraData[2] = paragraphSpacingBefore;
  }
  else if (paragraphSpacingBefore != 0.0)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((CGFloat *)self->super._extraData + 2) = paragraphSpacingBefore;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setTabStops:(NSArray *)tabStops
{
  v4 = self->super._tabStops;
  if (v4 != tabStops)
  {
    unint64_t v6 = v4;
    if (defaultTabStops_onceToken != -1) {
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_457);
    }
    if ((NSArray *)defaultTabStops_array == tabStops)
    {
      self->super._tabStops = 0;
      os_unfair_lock_lock_with_options();
      $22B4A0797DCB34CD9773A3EA0AC32B0B v7 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags & 0xFFFFFEFF);
    }
    else
    {
      self->super._tabStops = (NSArray *)[(NSArray *)tabStops mutableCopyWithZone:[(NSMutableParagraphStyle *)self zone]];
      os_unfair_lock_lock_with_options();
      $22B4A0797DCB34CD9773A3EA0AC32B0B v7 = ($22B4A0797DCB34CD9773A3EA0AC32B0B)(*(_DWORD *)&self->super._flags | 0x100);
    }
    self->super._flags = v7;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setTextLists:(NSArray *)textLists
{
  id extraData = self->super._extraData;
  if (extraData)
  {
    unint64_t v6 = (NSArray *)*((void *)extraData + 7);
    if (v6 != textLists)
    {
      $22B4A0797DCB34CD9773A3EA0AC32B0B v7 = v6;
      *((void *)self->super._extraData + 7) = [(NSArray *)textLists copyWithZone:[(NSMutableParagraphStyle *)self zone]];
    }
  }
  else if (textLists)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 7) = [(NSArray *)textLists copyWithZone:[(NSMutableParagraphStyle *)self zone]];
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation
{
  if ([(NSParagraphStyle *)self usesDefaultHyphenation] != usesDefaultHyphenation)
  {
    id extraData = self->super._extraData;
    if (!extraData)
    {
      [(NSParagraphStyle *)self _allocExtraData];
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
      id extraData = self->super._extraData;
    }
    extraData[80] = usesDefaultHyphenation;
  }
}

- (void)setTighteningFactorForTruncation:(float)tighteningFactorForTruncation
{
  float v3 = tighteningFactorForTruncation;
  id extraData = (double *)self->super._extraData;
  double v6 = tighteningFactorForTruncation;
  if (extraData)
  {
    extraData[4] = v6;
  }
  else
  {
    *(void *)&tighteningFactorForTruncation = __NSTightenFactor;
    if (*(double *)&__NSTightenFactor != v6)
    {
      [(NSParagraphStyle *)self _allocExtraData];
      *((double *)self->super._extraData + 4) = v6;
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
    }
  }
  if (v3 == 0.0)
  {
    -[NSMutableParagraphStyle setAllowsDefaultTighteningForTruncation:](self, "setAllowsDefaultTighteningForTruncation:", 0, *(double *)&tighteningFactorForTruncation);
  }
}

- (void)setTextBlocks:(NSArray *)textBlocks
{
  id extraData = self->super._extraData;
  if (extraData)
  {
    double v6 = (NSArray *)*((void *)extraData + 6);
    if (v6 != textBlocks)
    {
      $22B4A0797DCB34CD9773A3EA0AC32B0B v7 = v6;
      *((void *)self->super._extraData + 6) = [(NSArray *)textBlocks copyWithZone:[(NSMutableParagraphStyle *)self zone]];
    }
  }
  else if (textBlocks)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 6) = [(NSArray *)textBlocks copyWithZone:[(NSMutableParagraphStyle *)self zone]];
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)setTailIndent:(CGFloat)tailIndent
{
  self->super._tailIndent = tailIndent;
}

- (void)setHeaderLevel:(NSInteger)headerLevel
{
  id extraData = self->super._extraData;
  if (extraData)
  {
    extraData[5] = headerLevel;
  }
  else if (headerLevel)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 5) = headerLevel;
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags &= 0xFFFFE7FF;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[NSParagraphStyle allocWithZone:[(NSMutableParagraphStyle *)self zone]];

  return [(NSParagraphStyle *)v4 _initWithParagraphStyle:self];
}

- (void)_mutateTabStops
{
  tabStops = self->super._tabStops;
  if (tabStops)
  {
    if ((*((unsigned char *)&self->super._flags + 1) & 1) == 0)
    {
      v4 = tabStops;
      self->super._tabStops = (NSArray *)[(NSArray *)tabStops mutableCopyWithZone:[(NSMutableParagraphStyle *)self zone]];
      os_unfair_lock_lock_with_options();
      *(_DWORD *)&self->super._flags |= 0x100u;
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
    }
  }
  else
  {
    if (defaultTabStops_onceToken != -1) {
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_457);
    }
    self->super._tabStops = (NSArray *)objc_msgSend((id)defaultTabStops_array, "mutableCopyWithZone:", -[NSMutableParagraphStyle zone](self, "zone"));
    os_unfair_lock_lock_with_options();
    *(_DWORD *)&self->super._flags |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSParagraphStyleLock);
  }
}

- (void)addTabStop:(NSTextTab *)anObject
{
  [(NSTextTab *)anObject location];
  double v6 = v5;
  [(NSMutableParagraphStyle *)self _mutateTabStops];
  NSUInteger v7 = [(NSArray *)self->super._tabStops count];
  uint64_t v8 = 0;
  do
  {
    uint64_t v9 = v8;
    NSUInteger v10 = v7 + v8;
    if ((uint64_t)(v7 + v8) < 1) {
      break;
    }
    --v8;
    objc_msgSend(-[NSArray objectAtIndex:](self->super._tabStops, "objectAtIndex:", v9 - 1 + v7), "location");
  }
  while (v11 > v6);
  tabStops = self->super._tabStops;
  if (v9)
  {
    [(NSArray *)tabStops insertObject:anObject atIndex:v10];
  }
  else
  {
    [(NSArray *)tabStops addObject:anObject];
  }
}

- (void)removeTabStop:(NSTextTab *)anObject
{
  [(NSMutableParagraphStyle *)self _mutateTabStops];
  NSUInteger v5 = [(NSArray *)self->super._tabStops indexOfObject:anObject];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v6 = v5;
    tabStops = self->super._tabStops;
    [(NSArray *)tabStops removeObjectAtIndex:v6];
  }
}

- (void)_setLineBoundsOptions:(unint64_t)a3
{
  [(NSParagraphStyle *)self _allocExtraData];
  *((void *)self->super._extraData + 8) = a3;
  if (object_getClass(self) != (Class)__NSMutableParagraphStyleClass)
  {
    [(NSMutableParagraphStyle *)self setAllowsHangingPunctuation:(a3 >> 2) & 1];
    [(NSMutableParagraphStyle *)self setUsesOpticalAlignment:(a3 >> 4) & 1];
  }
}

- (void)setAllowsHangingPunctuation:(BOOL)a3
{
  unint64_t extraData = (unint64_t)self->super._extraData;
  if (extraData) {
    unint64_t extraData = *(void *)(extraData + 64) & 0xFFFFFFFFFFFFFFFBLL;
  }
  uint64_t v5 = 4;
  if (!a3) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = extraData | v5;
  [(NSParagraphStyle *)self _allocExtraData];
  *((void *)self->super._extraData + 8) = v6;
}

- (void)setUsesOpticalAlignment:(BOOL)a3
{
  unint64_t extraData = (unint64_t)self->super._extraData;
  if (extraData) {
    unint64_t extraData = *(void *)(extraData + 64) & 0xFFFFFFFFFFFFFFEFLL;
  }
  uint64_t v5 = 16;
  if (!a3) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = extraData | v5;
  [(NSParagraphStyle *)self _allocExtraData];
  *((void *)self->super._extraData + 8) = v6;
}

- (void)setCodeBlockIntentLanguageHint:(id)a3
{
  [(NSParagraphStyle *)self _allocExtraData];
  id v5 = (id)*((void *)self->super._extraData + 14);
  if (v5 != a3)
  {

    *((void *)self->super._extraData + 14) = [a3 copy];
  }
}

- (void)_setPresentationIntents:(id)a3
{
  [(NSParagraphStyle *)self _allocExtraData];
  id v5 = (id)*((void *)self->super._extraData + 12);
  if (v5 != a3)
  {

    *((void *)self->super._extraData + 12) = [a3 copy];
  }
}

- (void)_setListIntentOrdinal:(int64_t)a3
{
  if (a3 || self->super._extraData)
  {
    [(NSParagraphStyle *)self _allocExtraData];
    *((void *)self->super._extraData + 13) = a3;
  }
}

@end