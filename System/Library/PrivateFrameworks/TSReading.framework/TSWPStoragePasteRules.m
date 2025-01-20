@interface TSWPStoragePasteRules
- (void)addActionFlag:(int)a3;
- (void)applyParagraph:(int)a3 toCharIndex:(unint64_t)a4 ioTransaction:(void *)a5;
- (void)dealloc;
- (void)didPasteWithIOTransaction:(void *)a3 atDestRange:(_NSRange)a4;
- (void)mapCharacterStyleProperties:(id)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5;
- (void)mapCharacterStyles:(int)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5;
- (void)setupFlagsForPastingSrcStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5;
- (void)willPasteStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5;
@end

@implementation TSWPStoragePasteRules

- (void)dealloc
{
  for (uint64_t i = 0; i != 4; ++i)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPStoragePasteRules;
  [(TSWPStoragePasteRules *)&v4 dealloc];
}

- (void)addActionFlag:(int)a3
{
  unsigned int lastFlag = self->_lastFlag;
  if (lastFlag < 4
    || (v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules addActionFlag:]"],
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 45, @"addActionFlag: bad action flag count."), unsigned int lastFlag = self->_lastFlag, lastFlag <= 3))
  {
    self->_actionFlags[lastFlag] = a3;
    self->_unsigned int lastFlag = lastFlag + 1;
  }
}

- (void)applyParagraph:(int)a3 toCharIndex:(unint64_t)a4 ioTransaction:(void *)a5
{
  v9 = &self->_paragraphs[a3];
  -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self->_destStorage, "setParagraphStyle:forCharRange:undoTransaction:", v9->parStyle, a4, 1, a5);
  -[TSWPStorage setListStyle:forCharRange:undoTransaction:](self->_destStorage, "setListStyle:forCharRange:undoTransaction:", v9->listStyle, a4, 1, a5);
  -[TSWPStorage setParagraphFlags:level:forCharRange:undoTransaction:](self->_destStorage, "setParagraphFlags:level:forCharRange:undoTransaction:", v9->parData.var0.var1.flags, v9->parData.var0.var1.level, a4, 1, a5);
  -[TSWPStorage setListStart:forCharRange:undoTransaction:](self->_destStorage, "setListStart:forCharRange:undoTransaction:", v9->parStartData.var0.var0.listStart, a4, 0, a5);
  -[TSWPStorage setParagraphWritingDirection:forCharRange:undoTransaction:](self->_destStorage, "setParagraphWritingDirection:forCharRange:undoTransaction:", v9->parBidiData.var0.var0.listStart, a4, 0, a5);
  if ([(TSWPStorage *)self->_destStorage supportsColumnStyles]
    && self->_sourceColumnStyleCount >= 2)
  {
    destStorage = self->_destStorage;
    columnStyle = self->_paragraphs[a3].columnStyle;
    -[TSWPStorage setColumnStyle:forCharRange:undoTransaction:](destStorage, "setColumnStyle:forCharRange:undoTransaction:", columnStyle, a4, 1, a5);
  }
}

- (void)mapCharacterStyleProperties:(id)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = [(TSWPStorage *)self->_destStorage stylesheet];
  unint64_t v9 = [(TSWPStorage *)self->_destStorage length];
  if (location + length >= v9) {
    NSUInteger v10 = v9;
  }
  else {
    NSUInteger v10 = location + length;
  }
  if (location < v10)
  {
    NSUInteger v11 = location;
    do
    {
      v12 = +[TSSPropertyMap propertyMapWithPropertyMap:a3];
      id v13 = [(TSWPStorage *)self->_destStorage characterStyleAtCharIndex:v11 effectiveRange:&v17];
      v18.NSUInteger location = location;
      v18.NSUInteger length = length;
      NSRange v14 = NSIntersectionRange(v18, v17);
      if (v14.length) {
        -[TSWPStorage setCharacterStyle:range:undoTransaction:](self->_destStorage, "setCharacterStyle:range:undoTransaction:", objc_msgSend(v15, "variationOfCharacterStyle:paragraphStyle:propertyMap:", v13, -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_destStorage, "paragraphStyleAtCharIndex:effectiveRange:", v11, 0), v12), v14.location, v14.length, a5);
      }
      NSUInteger v11 = v17.length + v17.location;
    }
    while (v17.length + v17.location < v10);
  }
}

- (void)mapCharacterStyles:(int)a3 toRange:(_NSRange)a4 ioTransaction:(void *)a5
{
  if (self->_paragraphs[a3].parStyle)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v9 = +[TSSPropertyMap propertyMap];
    objc_msgSend(v9, "filterWithProperties:", +[TSWPCharacterStyle properties](TSWPCharacterStyle, "properties"));
    -[TSWPStoragePasteRules mapCharacterStyleProperties:toRange:ioTransaction:](self, "mapCharacterStyleProperties:toRange:ioTransaction:", v9, location, length, a5);
  }
}

- (void)setupFlagsForPastingSrcStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  self->_unsigned int flags = 0;
  self->_destStorage = (TSWPStorage *)a4;
  uint64_t v10 = [a3 length];
  self->_srcLeadRange.NSUInteger location = [a3 textRangeForParagraphAtCharIndex:0];
  self->_srcLeadRange.NSUInteger length = v11;
  self->_srcTrailRange.NSUInteger location = [a3 textRangeForParagraphAtCharIndex:v10];
  self->_srcTrailRange.NSUInteger length = v12;
  unint64_t v13 = [a4 textRangeForParagraphAtCharIndex:location];
  uint64_t v15 = v14;
  NSUInteger v58 = location + length;
  uint64_t v57 = objc_msgSend(a4, "textRangeForParagraphAtCharIndex:");
  uint64_t v17 = v16;
  self->_sourceColumnStyleCount = [a3 columnStyleCount];
  self->_sourceSectionCount = [a3 sectionCount];
  if (location == v13 && length == v15
    || v15 == 1 && IsParagraphBreakingCharacter([a4 characterAtIndex:v13]))
  {
    int v18 = 8;
  }
  else
  {
    int v18 = 0;
  }
  unsigned int flags = self->_flags | v18;
  self->_unsigned int flags = flags;
  if (v10 == 1)
  {
    int v20 = 16 * ([a3 attachmentOrFootnoteAtCharIndex:0] != 0);
    unsigned int flags = self->_flags;
  }
  else
  {
    int v20 = 0;
  }
  int v21 = v20 | (location == v13) | flags;
  if (self->_srcLeadRange.length == self->_srcTrailRange.length
    && self->_srcLeadRange.location == self->_srcTrailRange.location)
  {
    int v23 = 0;
  }
  else
  {
    int v23 = 64;
  }
  if (v15 == v17 && v13 == v57) {
    int v25 = 0;
  }
  else {
    int v25 = 4;
  }
  unsigned int v26 = v25 | v23 | v21;
  self->_unsigned int flags = v26;
  if (v10)
  {
    if (IsParagraphBreakingCharacter([a3 characterAtIndex:v10 - 1])) {
      int v27 = 32;
    }
    else {
      int v27 = 0;
    }
    unsigned int v26 = self->_flags;
  }
  else
  {
    int v27 = 0;
  }
  unsigned int v28 = v26 | v27;
  self->_unsigned int flags = v28;
  if (length)
  {
    if (IsParagraphBreakingCharacter([a4 characterAtIndex:v58 - 1])) {
      int v29 = 2;
    }
    else {
      int v29 = 0;
    }
    unsigned int v28 = self->_flags;
  }
  else
  {
    int v29 = 0;
  }
  unsigned int v30 = v28 | v29;
  self->_unsigned int flags = v30;
  if ((v28 & 1) == 0)
  {
    NSUInteger v31 = location;
    while (v31 > v13)
    {
      if ((objc_msgSend((id)objc_msgSend(a4, "attachmentOrFootnoteAtCharIndex:", --v31), "isAnchored") & 1) == 0)
      {
        unsigned int v30 = self->_flags;
        goto LABEL_40;
      }
    }
    unsigned int v30 = self->_flags | 1;
    self->_unsigned int flags = v30;
  }
LABEL_40:
  BOOL v32 = (v30 & 0x44) != 0;
  if ((~v30 & 0x22) == 0) {
    BOOL v32 = 0;
  }
  self->_mapDestTrailCS = v32;
  self->_paragraphs[0].parStyle = (TSWPParagraphStyle *)(id)[a3 paragraphStyleAtCharIndex:0 effectiveRange:0];
  self->_paragraphs[0].columnStyle = (TSWPColumnStyle *)(id)[a3 columnStyleAtCharIndex:0 effectiveRange:0];
  self->_paragraphs[0].section = (TSPObject *)(id)[a3 sectionAtCharIndex:0 effectiveRange:0];
  self->_paragraphs[0].listStyle = (TSWPListStyle *)(id)[a3 listStyleAtCharIndex:0 effectiveRange:0];
  unint64_t v33 = [a3 paragraphLevelAtCharIndex:0];
  if (v33 >= 0x10000)
  {
    v41 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v42 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 191, @"Out-of-bounds type assignment was clamped to max");
    LOWORD(v33) = -1;
  }
  self->_paragraphs[0].parData.var0.var1.level = v33;
  self->_paragraphs[0].parData.var0.var1.unsigned int flags = [a3 paragraphFlagsAtCharIndex:0];
  unint64_t v34 = [a3 listStartAtCharIndex:0];
  if (HIDWORD(v34))
  {
    v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v44 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 193, @"Out-of-bounds type assignment was clamped to max");
    LODWORD(v34) = -1;
  }
  self->_paragraphs[0].parStartData.var0.var0.listStart = v34;
  self->_paragraphs[0].parBidiData.var0.var0.listStart = [a3 writingDirectionForParagraphAtCharIndex:0];
  self->_paragraphs[1].parStyle = (TSWPParagraphStyle *)(id)[a3 paragraphStyleAtCharIndex:v10 effectiveRange:0];
  self->_paragraphs[1].columnStyle = (TSWPColumnStyle *)(id)[a3 columnStyleAtCharIndex:v10 effectiveRange:0];
  self->_paragraphs[1].section = (TSPObject *)(id)[a3 sectionAtCharIndex:v10 effectiveRange:0];
  self->_paragraphs[1].listStyle = (TSWPListStyle *)(id)[a3 listStyleAtCharIndex:v10 effectiveRange:0];
  unint64_t v35 = [a3 paragraphLevelAtCharIndex:v10];
  if (v35 >= 0x10000)
  {
    v45 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v46 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 200, @"Out-of-bounds type assignment was clamped to max");
    LOWORD(v35) = -1;
  }
  self->_paragraphs[1].parData.var0.var1.level = v35;
  self->_paragraphs[1].parData.var0.var1.unsigned int flags = [a3 paragraphFlagsAtCharIndex:v10];
  unint64_t v36 = [a3 listStartAtCharIndex:v10];
  if (HIDWORD(v36))
  {
    v47 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v48 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 202, @"Out-of-bounds type assignment was clamped to max");
    LODWORD(v36) = -1;
  }
  self->_paragraphs[1].parStartData.var0.var0.listStart = v36;
  self->_paragraphs[1].parBidiData.var0.var0.listStart = [a3 writingDirectionForParagraphAtCharIndex:v10];
  self->_paragraphs[2].parStyle = (TSWPParagraphStyle *)(id)[a4 paragraphStyleAtCharIndex:location effectiveRange:0];
  self->_paragraphs[2].columnStyle = (TSWPColumnStyle *)(id)[a4 columnStyleAtCharIndex:location effectiveRange:0];
  self->_paragraphs[2].section = (TSPObject *)(id)[a4 sectionAtCharIndex:location effectiveRange:0];
  self->_paragraphs[2].listStyle = (TSWPListStyle *)(id)[a4 listStyleAtCharIndex:location effectiveRange:0];
  unint64_t v37 = [a4 paragraphLevelAtCharIndex:location];
  if (v37 >= 0x10000)
  {
    v49 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v50 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 209, @"Out-of-bounds type assignment was clamped to max");
    LOWORD(v37) = -1;
  }
  self->_paragraphs[2].parData.var0.var1.level = v37;
  self->_paragraphs[2].parData.var0.var1.unsigned int flags = [a4 paragraphFlagsAtCharIndex:location];
  unint64_t v38 = [a4 listStartAtCharIndex:location];
  if (HIDWORD(v38))
  {
    v51 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v52 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 211, @"Out-of-bounds type assignment was clamped to max");
    LODWORD(v38) = -1;
  }
  self->_paragraphs[2].parStartData.var0.var0.listStart = v38;
  self->_paragraphs[2].parBidiData.var0.var0.listStart = [a4 writingDirectionForParagraphAtCharIndex:location];
  self->_paragraphs[3].parStyle = (TSWPParagraphStyle *)(id)[a4 paragraphStyleAtCharIndex:v58 effectiveRange:0];
  self->_paragraphs[3].columnStyle = (TSWPColumnStyle *)(id)[a4 columnStyleAtCharIndex:v58 effectiveRange:0];
  self->_paragraphs[3].section = (TSPObject *)(id)[a4 sectionAtCharIndex:v58 effectiveRange:0];
  self->_paragraphs[3].listStyle = (TSWPListStyle *)(id)[a4 listStyleAtCharIndex:v58 effectiveRange:0];
  unint64_t v39 = [a4 paragraphLevelAtCharIndex:v58];
  if (v39 >= 0x10000)
  {
    v53 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v54 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 218, @"Out-of-bounds type assignment was clamped to max");
    LOWORD(v39) = -1;
  }
  self->_paragraphs[3].parData.var0.var1.level = v39;
  self->_paragraphs[3].parData.var0.var1.unsigned int flags = [a4 paragraphFlagsAtCharIndex:v58];
  unint64_t v40 = [a4 listStartAtCharIndex:v58];
  if (HIDWORD(v40))
  {
    v55 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v56 = [NSString stringWithUTF8String:"-[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:]"];
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStoragePasteRules.mm"), 220, @"Out-of-bounds type assignment was clamped to max");
    LODWORD(v40) = -1;
  }
  self->_paragraphs[3].parStartData.var0.var0.listStart = v40;
  self->_paragraphs[3].parBidiData.var0.var0.listStart = [a4 writingDirectionForParagraphAtCharIndex:v58];
}

- (void)willPasteStorage:(id)a3 intoDestStorage:(id)a4 atDestRange:(_NSRange)a5
{
  -[TSWPStoragePasteRules setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:](self, "setupFlagsForPastingSrcStorage:intoDestStorage:atDestRange:", a3, a4, a5.location, a5.length);
  unsigned int flags = self->_flags;
  if ((flags & 8) != 0)
  {
    if ((flags & 0x10) != 0) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 3;
    }
    goto LABEL_14;
  }
  uint64_t v7 = self;
  if ((self->_flags & 0x41) <= 0x3F)
  {
    [(TSWPStoragePasteRules *)self addActionFlag:1];
    uint64_t v8 = 6;
LABEL_14:
    [(TSWPStoragePasteRules *)self addActionFlag:v8];
    goto LABEL_15;
  }
  if ((self->_flags & 0x41) == 0x40)
  {
    [(TSWPStoragePasteRules *)self addActionFlag:1];
    uint64_t v7 = self;
    uint64_t v9 = 6;
  }
  else
  {
    uint64_t v9 = 3;
  }
  [(TSWPStoragePasteRules *)v7 addActionFlag:v9];
  if (self->_srcTrailRange.length) {
    [(TSWPStoragePasteRules *)self addActionFlag:4];
  }
  if (self->_mapDestTrailCS)
  {
    uint64_t v8 = 5;
    goto LABEL_14;
  }
LABEL_15:
  if ((~self->_flags & 0x22) == 0)
  {
    [(TSWPStoragePasteRules *)self addActionFlag:2];
  }
}

- (void)didPasteWithIOTransaction:(void *)a3 atDestRange:(_NSRange)a4
{
  self->_srcLeadRange.location += a4.location;
  self->_srcTrailRange.location += a4.location;
  uint64_t v6 = 12;
  while (2)
  {
    switch(*(_DWORD *)((char *)&self->super.isa + v6))
    {
      case 0:
        return;
      case 1:
        NSUInteger location = self->_srcLeadRange.location;
        uint64_t v8 = self;
        uint64_t v9 = 2;
        goto LABEL_7;
      case 2:
        NSUInteger location = self->_srcTrailRange.length + self->_srcTrailRange.location;
        uint64_t v8 = self;
        uint64_t v9 = 3;
        goto LABEL_7;
      case 3:
        NSUInteger location = self->_srcLeadRange.location;
        uint64_t v8 = self;
        uint64_t v9 = 0;
        goto LABEL_7;
      case 4:
        NSUInteger location = self->_srcTrailRange.location;
        uint64_t v8 = self;
        uint64_t v9 = 1;
LABEL_7:
        [(TSWPStoragePasteRules *)v8 applyParagraph:v9 toCharIndex:location ioTransaction:a3];
        goto LABEL_12;
      case 5:
        uint64_t v10 = [(TSWPStorage *)self->_destStorage textRangeForParagraphAtCharIndex:self->_srcTrailRange.length + self->_srcTrailRange.location];
        NSUInteger v11 = self->_srcTrailRange.length + self->_srcTrailRange.location;
        NSUInteger length = v10 + v12 - v11;
        if (v10 + v12 == v11) {
          goto LABEL_12;
        }
        uint64_t v14 = self;
        uint64_t v15 = 3;
LABEL_11:
        -[TSWPStoragePasteRules mapCharacterStyles:toRange:ioTransaction:](v14, "mapCharacterStyles:toRange:ioTransaction:", v15, v11, length, a3);
LABEL_12:
        v6 += 4;
        if (v6 != 28) {
          continue;
        }
        return;
      case 6:
        NSUInteger v11 = self->_srcLeadRange.location;
        NSUInteger length = self->_srcLeadRange.length;
        uint64_t v14 = self;
        uint64_t v15 = 0;
        goto LABEL_11;
      default:
        goto LABEL_12;
    }
  }
}

@end