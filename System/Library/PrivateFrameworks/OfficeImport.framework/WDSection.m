@interface WDSection
- (BOOL)bidi;
- (BOOL)columnsEqualWidth;
- (BOOL)formattingChanged;
- (BOOL)isBidiOverridden;
- (BOOL)isBorderDepthOverridden;
- (BOOL)isBorderDisplayOverridden;
- (BOOL)isBorderOffsetOverridden;
- (BOOL)isBottomBorderOverridden;
- (BOOL)isBottomMarginOverridden;
- (BOOL)isBreakTypeOverridden;
- (BOOL)isChapterNumberSeparatorOverridden;
- (BOOL)isColumnCountOverridden;
- (BOOL)isColumnSpaceOverridden;
- (BOOL)isColumnWidthDefinedAt:(unsigned int)a3;
- (BOOL)isColumnsEqualWidthOverridden;
- (BOOL)isFooterMarginOverridden;
- (BOOL)isFormattingChangeDateOverridden;
- (BOOL)isFormattingChangedOverridden;
- (BOOL)isGutterMarginOverridden;
- (BOOL)isHeaderMarginOverridden;
- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden;
- (BOOL)isLastColumnWidthDefined;
- (BOOL)isLeftBorderOverridden;
- (BOOL)isLeftMarginOverridden;
- (BOOL)isLineNumberDistanceOverridden;
- (BOOL)isLineNumberIncrementOverridden;
- (BOOL)isLineNumberRestartOverridden;
- (BOOL)isLineNumberStartOverridden;
- (BOOL)isPageHeightOverridden;
- (BOOL)isPageNumberFormatOverridden;
- (BOOL)isPageNumberRestartOverridden;
- (BOOL)isPageNumberStartOverridden;
- (BOOL)isPageOrientationOverridden;
- (BOOL)isPageScaleOverridden;
- (BOOL)isPageWidthOverridden;
- (BOOL)isRightBorderOverridden;
- (BOOL)isRightMarginOverridden;
- (BOOL)isRtlGutterOverridden;
- (BOOL)isTextDirectionOverridden;
- (BOOL)isTitlePageOverridden;
- (BOOL)isTopBorderOverridden;
- (BOOL)isTopMarginOverridden;
- (BOOL)isVerticalJustificationOverridden;
- (BOOL)pageNumberRestart;
- (BOOL)rtlGutter;
- (BOOL)titlePage;
- (WDDocument)document;
- (WDSection)initWithDocument:(id)a3;
- (id).cxx_construct;
- (id)bottomBorder;
- (id)description;
- (id)evenPageFooter;
- (id)evenPageHeader;
- (id)firstPageFooter;
- (id)firstPageHeader;
- (id)formattingChangeDate;
- (id)leftBorder;
- (id)mutableBottomBorder;
- (id)mutableLeftBorder;
- (id)mutableRightBorder;
- (id)mutableTopBorder;
- (id)oddPageFooter;
- (id)oddPageHeader;
- (id)rightBorder;
- (id)text;
- (id)topBorder;
- (int)borderDepth;
- (int)borderDisplay;
- (int)borderOffset;
- (int)breakType;
- (int)chapterNumberSeparator;
- (int)lineNumberRestart;
- (int)pageNumberFormat;
- (int)pageOrientation;
- (int)resolveMode;
- (int)textDirection;
- (int)verticalJustification;
- (int64_t)bottomMargin;
- (int64_t)columnSpace;
- (int64_t)columnSpaceAt:(unsigned int)a3;
- (int64_t)columnWidthAt:(unsigned int)a3;
- (int64_t)footerMargin;
- (int64_t)gutterMargin;
- (int64_t)headerMargin;
- (int64_t)leftMargin;
- (int64_t)pageHeight;
- (int64_t)pageWidth;
- (int64_t)rightMargin;
- (int64_t)topMargin;
- (signed)lineNumberDistance;
- (signed)lineNumberStart;
- (unsigned)columnCount;
- (unsigned)indexToAuthorIDOfFormattingChange;
- (unsigned)lineNumberIncrement;
- (unsigned)pageNumberStart;
- (unsigned)pageScale;
- (void)appendColumnSpace:(int64_t)a3;
- (void)appendColumnWidth:(int64_t)a3;
- (void)setBidi:(BOOL)a3;
- (void)setBorderDepth:(int)a3;
- (void)setBorderDisplay:(int)a3;
- (void)setBorderOffset:(int)a3;
- (void)setBottomMargin:(int64_t)a3;
- (void)setBreakType:(int)a3;
- (void)setChapterNumberSeparator:(int)a3;
- (void)setColumnCount:(unsigned __int16)a3;
- (void)setColumnSpace:(int64_t)a3;
- (void)setColumnsEqualWidth:(BOOL)a3;
- (void)setFooterMargin:(int64_t)a3;
- (void)setFormattingChangeDate:(id)a3;
- (void)setFormattingChanged:(BOOL)a3;
- (void)setGutterMargin:(int64_t)a3;
- (void)setHeaderMargin:(int64_t)a3;
- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3;
- (void)setLeftMargin:(int64_t)a3;
- (void)setLineNumberDistance:(signed __int16)a3;
- (void)setLineNumberIncrement:(unsigned __int16)a3;
- (void)setLineNumberRestart:(int)a3;
- (void)setLineNumberStart:(signed __int16)a3;
- (void)setPageHeight:(int64_t)a3;
- (void)setPageNumberFormat:(int)a3;
- (void)setPageNumberRestart:(BOOL)a3;
- (void)setPageNumberStart:(unsigned __int16)a3;
- (void)setPageOrientation:(int)a3;
- (void)setPageScale:(unsigned int)a3;
- (void)setPageWidth:(int64_t)a3;
- (void)setResolveMode:(int)a3;
- (void)setRightMargin:(int64_t)a3;
- (void)setRtlGutter:(BOOL)a3;
- (void)setTextDirection:(int)a3;
- (void)setTitlePage:(BOOL)a3;
- (void)setTopMargin:(int64_t)a3;
- (void)setVerticalJustification:(int)a3;
@end

@implementation WDSection

- (id).cxx_construct
{
  *((void *)self + 35) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 63) = 0;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  return self;
}

- (WDSection)initWithDocument:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WDSection;
  v5 = [(WDSection *)&v22 init];
  v6 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 8) = *((unsigned char *)v5 + 8) & 0xF8 | 1;
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = [[WDText alloc] initWithDocument:v4 textType:0];
    mText = v6->mText;
    v6->mText = v7;

    v9 = [[WDText alloc] initWithDocument:v4 textType:2];
    mEvenPageHeader = v6->mEvenPageHeader;
    v6->mEvenPageHeader = v9;

    v11 = [[WDText alloc] initWithDocument:v4 textType:2];
    mOddPageHeader = v6->mOddPageHeader;
    v6->mOddPageHeader = v11;

    v13 = [[WDText alloc] initWithDocument:v4 textType:2];
    mFirstPageHeader = v6->mFirstPageHeader;
    v6->mFirstPageHeader = v13;

    v15 = [[WDText alloc] initWithDocument:v4 textType:2];
    mEvenPageFooter = v6->mEvenPageFooter;
    v6->mEvenPageFooter = v15;

    v17 = [[WDText alloc] initWithDocument:v4 textType:2];
    mOddPageFooter = v6->mOddPageFooter;
    v6->mOddPageFooter = v17;

    v19 = [[WDText alloc] initWithDocument:v4 textType:2];
    mFirstPageFooter = v6->mFirstPageFooter;
    v6->mFirstPageFooter = v19;
  }
  return v6;
}

- (id)text
{
  return self->mText;
}

- (id)oddPageHeader
{
  return self->mOddPageHeader;
}

- (id)evenPageHeader
{
  return self->mEvenPageHeader;
}

- (id)firstPageHeader
{
  return self->mFirstPageHeader;
}

- (id)oddPageFooter
{
  return self->mOddPageFooter;
}

- (id)evenPageFooter
{
  return self->mEvenPageFooter;
}

- (id)firstPageFooter
{
  return self->mFirstPageFooter;
}

- (void)setResolveMode:(int)a3
{
  *((unsigned char *)self + 8) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((unsigned char *)self + 8) & 0xF8;
}

- (void)setPageWidth:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 336;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 112;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40u;
}

- (void)setPageHeight:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 344;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 120;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80u;
}

- (void)setLeftMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 368;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 144;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800u;
}

- (void)setRightMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 376;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 152;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000u;
}

- (void)setTopMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 384;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 160;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000u;
}

- (void)setBottomMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 392;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 168;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000u;
}

- (void)setGutterMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 416;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 192;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000u;
}

- (int)resolveMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 8);
  if ((v2 & 2) != 0) {
    int v3 = 1;
  }
  else {
    int v3 = (v2 >> 1) & 2;
  }
  if (v2) {
    return 0;
  }
  else {
    return v3;
  }
}

- (BOOL)isColumnCountOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return *v2 >> 31;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x80000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x80000000) != 0) {
        return *v2 >> 31;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x80000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (void)setPageOrientation:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 356;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 132;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200u;
}

- (BOOL)isPageWidthOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 6) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x40) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x40) != 0) {
        return ((unint64_t)*v2 >> 6) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)pageWidth
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40) != 0)
  {
    uint64_t v3 = 336;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40) == 0) {
      return 0;
    }
    uint64_t v3 = 112;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageHeightOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 7) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x80) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x80) != 0) {
        return ((unint64_t)*v2 >> 7) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)pageHeight
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80) != 0)
  {
    uint64_t v3 = 344;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80) == 0) {
      return 0;
    }
    uint64_t v3 = 120;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)leftMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x800) != 0)
  {
    uint64_t v3 = 368;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x800) == 0) {
      return 1800;
    }
    uint64_t v3 = 144;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)rightMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000) != 0)
  {
    uint64_t v3 = 376;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x1000) == 0) {
      return 1800;
    }
    uint64_t v3 = 152;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)topMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000) != 0)
  {
    uint64_t v3 = 384;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x2000) == 0) {
      return 1440;
    }
    uint64_t v3 = 160;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)bottomMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000) != 0)
  {
    uint64_t v3 = 392;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x4000) == 0) {
      return 1440;
    }
    uint64_t v3 = 168;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 11) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x800) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x800) != 0) {
        return ((unint64_t)*v2 >> 11) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isRightMarginOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 12) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x1000) != 0) {
        return ((unint64_t)*v2 >> 12) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isTopMarginOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 13) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x2000) != 0) {
        return ((unint64_t)*v2 >> 13) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isBottomMarginOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 14) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x4000) != 0) {
        return ((unint64_t)*v2 >> 14) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isBreakTypeOverridden
{
  unsigned int v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 5) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x20) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x20) != 0) {
        return ((unint64_t)*v2 >> 5) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isTitlePageOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x2000000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 5) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x2000000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x2000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 5) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x2000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setTitlePage:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
  }
  unint64_t v4 = (unsigned int *)((char *)self + v3);
  unint64_t v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFFCFFFFFFFFFLL;
  __int16 v6 = 32;
  if (a3) {
    __int16 v6 = 48;
  }
  *unint64_t v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (int64_t)headerMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000) != 0)
  {
    uint64_t v3 = 400;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x8000) == 0) {
      return 720;
    }
    uint64_t v3 = 176;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)titlePage
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && (unint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x2000000000) != 0))
  {
    return (v2 >> 36) & 1;
  }
  else if ((*((unsigned char *)self + 8) & 5) != 0)
  {
    unint64_t v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    LOBYTE(v4) = (v3 & 0x2000000000) != 0 && (v3 & 0x1000000000) != 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setBreakType:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 328;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 104;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20u;
}

- (void)setHeaderMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 400;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 176;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000u;
}

- (void)setBorderDepth:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 428;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 204;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000u;
}

- (void)setBorderDisplay:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 432;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 208;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x100000u;
}

- (void)setBorderOffset:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 436;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 212;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200000u;
}

- (void)setPageNumberStart:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 456;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 232;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000000u;
}

- (void)setPageNumberRestart:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
  }
  uint64_t v4 = (char *)self + v3;
  unint64_t v5 = *(_DWORD *)v4 & 0xCFFFFFFF | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32);
  int v6 = 0x20000000;
  if (a3) {
    int v6 = 805306368;
  }
  *(_DWORD *)uint64_t v4 = v6 | *(_DWORD *)v4 & 0xCFFFFFFF;
  *((_WORD *)v4 + 2) = WORD2(v5);
}

- (void)setColumnCount:(unsigned __int16)a3
{
  unint64_t v5 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    columnWidths = self->mTrackedProperties.columnWidths;
    self->mTrackedProperties.columnWidths = 0;

    columnSpaces = self->mTrackedProperties.columnSpaces;
    self->mTrackedProperties.columnSpaces = 0;

    self->mTrackedProperties.columnCount = a3;
    v5[56] |= 0x80000000;
  }
  else if (*((unsigned char *)self + 8))
  {
    int v6 = self->mOriginalProperties.columnWidths;
    self->mOriginalProperties.columnWidths = 0;

    v7 = self->mOriginalProperties.columnSpaces;
    self->mOriginalProperties.columnSpaces = 0;

    self->mOriginalProperties.columnCount = a3;
    *v5 |= 0x80000000;
    if ((v5[56] & 0x80000000) == 0)
    {
      v8 = self->mTrackedProperties.columnWidths;
      self->mTrackedProperties.columnWidths = 0;

      v9 = self->mTrackedProperties.columnSpaces;
      self->mTrackedProperties.columnSpaces = 0;
    }
  }
}

- (void)setColumnSpace:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 488;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 264;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 4u;
}

- (unsigned)columnCount
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    uint64_t v3 = 480;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80000000) == 0) {
      return 0;
    }
    uint64_t v3 = 256;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setFooterMargin:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 408;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 184;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000u;
}

- (int)breakType
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x20) != 0)
  {
    uint64_t v3 = 328;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20) == 0) {
      return 2;
    }
    uint64_t v3 = 104;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setLineNumberDistance:(signed __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 444;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 220;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000000u;
}

- (void)setColumnsEqualWidth:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
  }
  uint64_t v4 = (unsigned int *)((char *)self + v3);
  unint64_t v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFFFCFFFFFFFFLL;
  __int16 v6 = 2;
  if (a3) {
    __int16 v6 = 3;
  }
  *uint64_t v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (void)appendColumnWidth:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    columnWidths = self->mTrackedProperties.columnWidths;
    if (!columnWidths)
    {
      __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v7 = self->mTrackedProperties.columnWidths;
      self->mTrackedProperties.columnWidths = v6;

      columnWidths = self->mTrackedProperties.columnWidths;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    columnWidths = self->mOriginalProperties.columnWidths;
    if (!columnWidths)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v9 = self->mOriginalProperties.columnWidths;
      self->mOriginalProperties.columnWidths = v8;

      columnWidths = self->mOriginalProperties.columnWidths;
    }
  }
  id v10 = [NSNumber numberWithUnsignedLong:a3];
  -[NSMutableArray addObject:](columnWidths, "addObject:");
}

- (void)appendColumnSpace:(int64_t)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    columnSpaces = self->mTrackedProperties.columnSpaces;
    if (!columnSpaces)
    {
      __int16 v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v7 = self->mTrackedProperties.columnSpaces;
      self->mTrackedProperties.columnSpaces = v6;

      columnSpaces = self->mTrackedProperties.columnSpaces;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    columnSpaces = self->mOriginalProperties.columnSpaces;
    if (!columnSpaces)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v9 = self->mOriginalProperties.columnSpaces;
      self->mOriginalProperties.columnSpaces = v8;

      columnSpaces = self->mOriginalProperties.columnSpaces;
    }
  }
  id v10 = [NSNumber numberWithUnsignedLong:a3];
  -[NSMutableArray addObject:](columnSpaces, "addObject:");
}

- (void)setLineNumberIncrement:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 442;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 218;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800000u;
}

- (void)setLineNumberRestart:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 448;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 224;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000000u;
}

- (BOOL)isColumnsEqualWidthOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x200000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 1) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x200000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x200000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x200000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setPageNumberFormat:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 452;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 228;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000000u;
}

- (void)setVerticalJustification:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 496;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 272;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 8u;
}

- (id)mutableRightBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    rightBorder = self->mTrackedProperties.rightBorder;
    if (!rightBorder)
    {
      p_rightBorder = &self->mTrackedProperties.rightBorder;
      uint64_t v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x10u;
      __int16 v6 = objc_alloc_init(WDBorder);
      v7 = *p_rightBorder;
      *p_rightBorder = v6;

      rightBorder = *p_rightBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      unint64_t v2 = 0;
      goto LABEL_10;
    }
    p_rightBorder = &self->mOriginalProperties.rightBorder;
    rightBorder = self->mOriginalProperties.rightBorder;
    if (!rightBorder)
    {
      uint64_t v5 = 288;
      goto LABEL_8;
    }
  }
  unint64_t v2 = rightBorder;
LABEL_10:
  return v2;
}

- (void)setFormattingChanged:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
  }
  uint64_t v4 = (unsigned int *)((char *)self + v3);
  unint64_t v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFF3FFFFFFFFFLL;
  __int16 v6 = 128;
  if (a3) {
    __int16 v6 = 192;
  }
  *uint64_t v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 500;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 276;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 0x100u;
}

- (void)setFormattingChangeDate:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    id v8 = v5;
    uint64_t v6 = 512;
    uint64_t v7 = 504;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v5;
    uint64_t v6 = 288;
    uint64_t v7 = 280;
  }
  objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
  *(_WORD *)((char *)&self->super.isa + v6 + 4) |= 0x200u;
  id v5 = v8;
LABEL_6:
}

- (id)mutableTopBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    topBorder = self->mTrackedProperties.topBorder;
    if (!topBorder)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      uint64_t v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 2u;
      uint64_t v6 = objc_alloc_init(WDBorder);
      uint64_t v7 = p_mTrackedProperties->topBorder;
      p_mTrackedProperties->topBorder = v6;

      topBorder = p_mTrackedProperties->topBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      unint64_t v2 = 0;
      goto LABEL_10;
    }
    p_mTrackedProperties = &self->mOriginalProperties;
    topBorder = self->mOriginalProperties.topBorder;
    if (!topBorder)
    {
      uint64_t v5 = 288;
      goto LABEL_8;
    }
  }
  unint64_t v2 = topBorder;
LABEL_10:
  return v2;
}

- (id)mutableLeftBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    leftBorder = self->mTrackedProperties.leftBorder;
    if (!leftBorder)
    {
      p_leftBorder = &self->mTrackedProperties.leftBorder;
      uint64_t v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 4u;
      uint64_t v6 = objc_alloc_init(WDBorder);
      uint64_t v7 = *p_leftBorder;
      *p_leftBorder = v6;

      leftBorder = *p_leftBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      unint64_t v2 = 0;
      goto LABEL_10;
    }
    p_leftBorder = &self->mOriginalProperties.leftBorder;
    leftBorder = self->mOriginalProperties.leftBorder;
    if (!leftBorder)
    {
      uint64_t v5 = 288;
      goto LABEL_8;
    }
  }
  unint64_t v2 = leftBorder;
LABEL_10:
  return v2;
}

- (id)mutableBottomBorder
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    bottomBorder = self->mTrackedProperties.bottomBorder;
    if (!bottomBorder)
    {
      p_bottomBorder = &self->mTrackedProperties.bottomBorder;
      uint64_t v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 8u;
      uint64_t v6 = objc_alloc_init(WDBorder);
      uint64_t v7 = *p_bottomBorder;
      *p_bottomBorder = v6;

      bottomBorder = *p_bottomBorder;
    }
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
      unint64_t v2 = 0;
      goto LABEL_10;
    }
    p_bottomBorder = &self->mOriginalProperties.bottomBorder;
    bottomBorder = self->mOriginalProperties.bottomBorder;
    if (!bottomBorder)
    {
      uint64_t v5 = 288;
      goto LABEL_8;
    }
  }
  unint64_t v2 = bottomBorder;
LABEL_10:
  return v2;
}

- (void)setPageScale:(unsigned int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 352;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 128;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x100u;
}

- (void)setTextDirection:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 360;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 136;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400u;
}

- (void)setLineNumberStart:(signed __int16)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 440;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 216;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400000u;
}

- (unsigned)pageScale
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x100) != 0)
  {
    uint64_t v3 = 352;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x100) == 0) {
      return 1;
    }
    uint64_t v3 = 128;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageScaleOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 8) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x100) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x100) != 0) {
        return ((unint64_t)*v2 >> 8) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)textDirection
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x400) != 0)
  {
    uint64_t v3 = 360;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x400) == 0) {
      return 1;
    }
    uint64_t v3 = 136;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isTextDirectionOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 10) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x400) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x400) != 0) {
        return ((unint64_t)*v2 >> 10) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)pageOrientation
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x200) != 0)
  {
    uint64_t v3 = 356;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x200) == 0) {
      return 1;
    }
    uint64_t v3 = 132;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageOrientationOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 9) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x200) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x200) != 0) {
        return ((unint64_t)*v2 >> 9) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isHeaderMarginOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 15) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x8000) != 0) {
        return ((unint64_t)*v2 >> 15) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)footerMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x10000) != 0)
  {
    uint64_t v3 = 408;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10000) == 0) {
      return 720;
    }
    uint64_t v3 = 184;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isFooterMarginOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 16) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x10000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x10000) != 0) {
        return ((unint64_t)*v2 >> 16) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x10000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)gutterMargin
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x20000) != 0)
  {
    uint64_t v3 = 416;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20000) == 0) {
      return 0;
    }
    uint64_t v3 = 192;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isGutterMarginOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 17) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x20000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x20000) != 0) {
        return ((unint64_t)*v2 >> 17) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x20000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)rtlGutter
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40000) != 0)
  {
    uint64_t v3 = 424;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40000) == 0) {
      return 0;
    }
    uint64_t v3 = 200;
  }
  return *((unsigned char *)&self->super.isa + v3) != 0;
}

- (void)setRtlGutter:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 424;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 200;
  }
  *((unsigned char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000u;
}

- (BOOL)isRtlGutterOverridden
{
  unint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 18) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x40000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x40000) != 0) {
        return ((unint64_t)*v2 >> 18) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x40000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)topBorder
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 2) != 0)
  {
    uint64_t v3 = 296;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 2) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 72;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isTopBorderOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 2;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 1) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 2) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 2) != 0) {
        return ((unint64_t)*v2 >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 2;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)leftBorder
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 4) != 0)
  {
    uint64_t v3 = 304;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 4) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 80;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isLeftBorderOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 4;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 2) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 4) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 4) != 0) {
        return ((unint64_t)*v2 >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 4;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)bottomBorder
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 8) != 0)
  {
    uint64_t v3 = 312;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 8) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 88;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isBottomBorderOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 8;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 3) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 8) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 8) != 0) {
        return ((unint64_t)*v2 >> 3) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 8;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)rightBorder
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x10) != 0)
  {
    uint64_t v3 = 320;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 96;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isRightBorderOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 4) & 1;
      }
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x10) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x10) != 0) {
        return ((unint64_t)*v2 >> 4) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderDepth
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000) != 0)
  {
    uint64_t v3 = 428;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80000) == 0) {
      return 0;
    }
    uint64_t v3 = 204;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderDepthOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 19) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x80000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x80000) != 0) {
        return ((unint64_t)*v2 >> 19) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x80000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderDisplay
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x100000) != 0)
  {
    uint64_t v3 = 432;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x100000) == 0) {
      return 0;
    }
    uint64_t v3 = 208;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderDisplayOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 20) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x100000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x100000) != 0) {
        return ((unint64_t)*v2 >> 20) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x100000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderOffset
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x200000) != 0)
  {
    uint64_t v3 = 436;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x200000) == 0) {
      return 0;
    }
    uint64_t v3 = 212;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderOffsetOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 21) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x200000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x200000) != 0) {
        return ((unint64_t)*v2 >> 21) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x200000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (signed)lineNumberStart
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x400000) != 0)
  {
    uint64_t v3 = 440;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 8) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x400000) != 0)
  {
    uint64_t v3 = 216;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isLineNumberStartOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 22) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x400000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x400000) != 0) {
        return ((unint64_t)*v2 >> 22) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x400000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (unsigned)lineNumberIncrement
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x800000) != 0)
  {
    uint64_t v3 = 442;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x800000) == 0) {
      return 0;
    }
    uint64_t v3 = 218;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLineNumberIncrementOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 23) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x800000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x800000) != 0) {
        return ((unint64_t)*v2 >> 23) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = *(void *)&v5 & 0x800000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (signed)lineNumberDistance
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000000) != 0)
  {
    uint64_t v3 = 444;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((unsigned char *)self + 8) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x1000000) != 0)
  {
    uint64_t v3 = 220;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isLineNumberDistanceOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 24) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x1000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x1000000) != 0) {
        return ((unint64_t)*v2 >> 24) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x1000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)lineNumberRestart
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000000) != 0)
  {
    uint64_t v3 = 448;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x2000000) == 0) {
      return 0;
    }
    uint64_t v3 = 224;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLineNumberRestartOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 25) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x2000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x2000000) != 0) {
        return ((unint64_t)*v2 >> 25) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x2000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)pageNumberFormat
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000000) != 0)
  {
    uint64_t v3 = 452;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x4000000) == 0) {
      return 0;
    }
    uint64_t v3 = 228;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageNumberFormatOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 26) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x4000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x4000000) != 0) {
        return ((unint64_t)*v2 >> 26) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x4000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (unsigned)pageNumberStart
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000000) != 0)
  {
    uint64_t v3 = 456;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x8000000) == 0) {
      return 0;
    }
    uint64_t v3 = 232;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageNumberStartOverridden
{
  id v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x8000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 27) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x8000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x8000000) != 0) {
        return ((unint64_t)*v2 >> 27) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x8000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)pageNumberRestart
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && (uint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 54), (v2 & 0x20000000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32)) >> 28) & 1;
  }
  else
  {
    LOBYTE(self) = (*((unsigned char *)self + 8) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20000000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10000000) != 0;
  }
  return (char)self;
}

- (BOOL)isPageNumberRestartOverridden
{
  uint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 29) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x20000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x20000000) != 0) {
        return ((unint64_t)*v2 >> 29) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x20000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)chapterNumberSeparator
{
  if ((*((unsigned char *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40000000) != 0)
  {
    uint64_t v3 = 460;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40000000) == 0) {
      return 0;
    }
    uint64_t v3 = 236;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setChapterNumberSeparator:(int)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
    uint64_t v4 = 460;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
    uint64_t v4 = 236;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000000u;
}

- (BOOL)isChapterNumberSeparatorOverridden
{
  uint64_t v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return ((unint64_t)*v2 >> 30) & 1;
      }
      goto LABEL_10;
    }
    int v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x40000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0 || (*v2 & 0x40000000) != 0) {
        return ((unint64_t)*v2 >> 30) & 1;
      }
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    uint64_t v3 = v5 & 0x40000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)columnWidthAt:(unsigned int)a3
{
  char v5 = *((unsigned char *)self + 8);
  if ((v5 & 6) != 0)
  {
    if ([(NSMutableArray *)self->mTrackedProperties.columnWidths count] > (unint64_t)a3)
    {
      uint64_t v6 = [(NSMutableArray *)self->mTrackedProperties.columnWidths objectAtIndex:a3];
      int v7 = [v6 intValue];
      goto LABEL_8;
    }
    char v5 = *((unsigned char *)self + 8);
  }
  if ((v5 & 5) == 0 || [(NSMutableArray *)self->mOriginalProperties.columnWidths count] <= (unint64_t)a3) {
    return 0;
  }
  uint64_t v6 = [(NSMutableArray *)self->mOriginalProperties.columnWidths objectAtIndex:a3];
  int v7 = [v6 intValue];
LABEL_8:
  int64_t v8 = v7;

  return v8;
}

- (BOOL)isLastColumnWidthDefined
{
  uint64_t v3 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  char v4 = *((unsigned char *)self + 8);
  if ((v4 & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    unint64_t columnCount = self->mTrackedProperties.columnCount;
    if ([(NSMutableArray *)self->mTrackedProperties.columnWidths count] >= columnCount) {
      return 1;
    }
    char v4 = *((unsigned char *)self + 8);
  }
  if ((v4 & 5) == 0) {
    return 0;
  }
  if ((*v3 & 0x80000000) == 0) {
    return 0;
  }
  unint64_t v6 = self->mOriginalProperties.columnCount;
  return [(NSMutableArray *)self->mOriginalProperties.columnWidths count] >= v6;
}

- (BOOL)isColumnWidthDefinedAt:(unsigned int)a3
{
  char v5 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  char v6 = *((unsigned char *)self + 8);
  if ((v6 & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    if ([(NSMutableArray *)self->mTrackedProperties.columnWidths count] > (unint64_t)a3) {
      return 1;
    }
    char v6 = *((unsigned char *)self + 8);
  }
  return (v6 & 5) != 0
      && (*v5 & 0x80000000) != 0
      && [(NSMutableArray *)self->mOriginalProperties.columnWidths count] > (unint64_t)a3;
}

- (int64_t)columnSpaceAt:(unsigned int)a3
{
  char v5 = *((unsigned char *)self + 8);
  if ((v5 & 6) != 0)
  {
    if ([(NSMutableArray *)self->mTrackedProperties.columnSpaces count] > (unint64_t)a3)
    {
      char v6 = [(NSMutableArray *)self->mTrackedProperties.columnSpaces objectAtIndex:a3];
      int64_t v7 = (int)[v6 intValue];
      goto LABEL_8;
    }
    char v5 = *((unsigned char *)self + 8);
  }
  if ((v5 & 5) == 0 || [(NSMutableArray *)self->mOriginalProperties.columnSpaces count] <= (unint64_t)a3) {
    return 0;
  }
  char v6 = [(NSMutableArray *)self->mOriginalProperties.columnSpaces objectAtIndex:a3];
  int64_t v7 = [v6 longValue];
LABEL_8:

  return v7;
}

- (BOOL)columnsEqualWidth
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && (unint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x200000000) != 0))
  {
    return HIDWORD(v2) & 1;
  }
  else if ((*((unsigned char *)self + 8) & 5) != 0)
  {
    unint64_t v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    if ((v3 & 0x200000000) != 0) {
      LOBYTE(v4) = BYTE4(v3) & 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int64_t)columnSpace
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x400000000) != 0)
  {
    uint64_t v3 = 488;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x400000000) == 0)
    {
      return 720;
    }
    uint64_t v3 = 264;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isColumnSpaceOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x400000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 2) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x400000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x400000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x400000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)verticalJustification
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x800000000) != 0)
  {
    uint64_t v3 = 496;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x800000000) == 0)
    {
      return 0;
    }
    uint64_t v3 = 272;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isVerticalJustificationOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x800000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 3) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x800000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x800000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 3) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x800000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)bidi
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x40000000000) != 0)
  {
    return *((_DWORD *)&self->mTrackedProperties + 54) & 1;
  }
  if ((*((unsigned char *)self + 8) & 5) == 0) {
    return 0;
  }
  if (((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32)) & 0x40000000000) != 0)
    return *((unsigned char *)&self->mOriginalProperties + 216) & 1;
  return 0;
}

- (void)setBidi:(BOOL)a3
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    uint64_t v3 = 512;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 1) == 0) {
      return;
    }
    uint64_t v3 = 288;
  }
  unint64_t v4 = (unsigned int *)((char *)self + v3);
  uint64_t v5 = *v4;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32) | a3 | 0x40000000000;
  *unint64_t v4 = v5 & 0xFFFFFFFE | a3;
  *((_WORD *)v4 + 2) = WORD2(v6);
}

- (BOOL)isBidiOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x40000000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 10) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x40000000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x40000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 10) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x40000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)formattingChanged
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && (unint64_t v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x8000000000) != 0))
  {
    return (v2 >> 38) & 1;
  }
  else if ((*((unsigned char *)self + 8) & 5) != 0)
  {
    unint64_t v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    LOBYTE(v4) = (v3 & 0x8000000000) != 0 && (v3 & 0x4000000000) != 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isFormattingChangedOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x8000000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 7) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x8000000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x8000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 7) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x8000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x10000000000) != 0)
  {
    uint64_t v3 = 500;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x10000000000) == 0)
    {
      return 0;
    }
    uint64_t v3 = 276;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x10000000000;
    return v2 != 0;
  }
  if ((*((unsigned char *)self + 8) & 4) != 0)
  {
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x10000000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x10000000000) != 0)
      {
        return *((unsigned char *)&self->mOriginalProperties + 221) & 1;
      }
      return 0;
    }
    unint64_t v2 = v4 & 0x10000000000;
    return v2 != 0;
  }
  if ((*((unsigned char *)self + 8) & 1) == 0) {
    return 0;
  }
  return *((unsigned char *)&self->mOriginalProperties + 221) & 1;
}

- (id)formattingChangeDate
{
  if ((*((unsigned char *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x20000000000) != 0)
  {
    uint64_t v3 = 504;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x20000000000) == 0)
    {
      id v2 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = 280;
  }
  id v2 = *(id *)((char *)&self->super.isa + v3);
LABEL_9:
  return v2;
}

- (BOOL)isFormattingChangeDateOverridden
{
  if ((*((unsigned char *)self + 8) & 2) != 0)
  {
    unint64_t v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x20000000000;
  }
  else
  {
    if ((*((unsigned char *)self + 8) & 4) == 0)
    {
      if (*((unsigned char *)self + 8)) {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 9) & 1;
      }
      goto LABEL_10;
    }
    unint64_t v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x20000000000) == 0)
    {
      if ((*((unsigned char *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x20000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 9) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    unint64_t v2 = v4 & 0x20000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDSection;
  unint64_t v2 = [(WDSection *)&v4 description];
  return v2;
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);

  objc_storeStrong((id *)&self->mFirstPageFooter, 0);
  objc_storeStrong((id *)&self->mOddPageFooter, 0);
  objc_storeStrong((id *)&self->mEvenPageFooter, 0);
  objc_storeStrong((id *)&self->mFirstPageHeader, 0);
  objc_storeStrong((id *)&self->mOddPageHeader, 0);
  objc_storeStrong((id *)&self->mEvenPageHeader, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end