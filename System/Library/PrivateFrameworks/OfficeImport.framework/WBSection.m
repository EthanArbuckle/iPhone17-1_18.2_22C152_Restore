@interface WBSection
+ (void)mapPrinterSettings:(void *)a3 toSection:(id)a4;
+ (void)mapSection:(id)a3 toSectionProperties:(void *)a4;
+ (void)mapSectionProperties:(void *)a3 toSection:(id)a4;
+ (void)readFrom:(id)a3 textRun:(WrdSectionTextRun *)a4 document:(id)a5 index:(int)a6 section:(id)a7;
+ (void)readHeaderFrom:(id)a3 type:(int)a4 index:(int)a5 header:(id)a6;
@end

@implementation WBSection

+ (void)readFrom:(id)a3 textRun:(WrdSectionTextRun *)a4 document:(id)a5 index:(int)a6 section:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v23 = a3;
  id v12 = a5;
  id v13 = a7;
  var4 = a4->var4;
  var5 = a4->var5;
  [v23 setReportProgress:1];
  v16 = [v13 text];
  +[WBText readFrom:v23 text:v16 textRun:a4];

  [v23 setReportProgress:0];
  v17 = [v13 oddPageHeader];
  [a1 readHeaderFrom:v23 type:7 index:v8 header:v17];

  v18 = [v13 evenPageHeader];
  [a1 readHeaderFrom:v23 type:6 index:v8 header:v18];

  v19 = [v13 firstPageHeader];
  [a1 readHeaderFrom:v23 type:10 index:v8 header:v19];

  v20 = [v13 oddPageFooter];
  [a1 readHeaderFrom:v23 type:9 index:v8 header:v20];

  v21 = [v13 evenPageFooter];
  [a1 readHeaderFrom:v23 type:8 index:v8 header:v21];

  v22 = [v13 firstPageFooter];
  [a1 readHeaderFrom:v23 type:11 index:v8 header:v22];

  if (!v8) {
    [a1 mapPrinterSettings:var4 toSection:v13];
  }
  [v13 setResolveMode:0];
  [a1 mapSectionProperties:var4 toSection:v13];
  [v13 setResolveMode:1];
  [a1 mapSectionProperties:var5 toSection:v13];
  [v13 setResolveMode:2];
}

+ (void)readHeaderFrom:(id)a3 type:(int)a4 index:(int)a5 header:(id)a6
{
  unsigned __int16 v7 = a5;
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 tableHeaders];
  if (((*(_DWORD *)(v11 + 16) - *(_DWORD *)(v11 + 8)) & 0x3FFFC) != 0)
  {
    v12[0] = &unk_26EBE4AC0;
    WrdCPTableHeaders::getTextRun(v11, v12, a4, v7);
    +[WBText readFrom:v9 text:v10 textRun:v12];
    if ((unint64_t)[v10 blockCount] >= 2) {
      [v10 removeLastBlock];
    }
  }
}

+ (void)mapPrinterSettings:(void *)a3 toSection:(id)a4
{
  id v9 = a4;
  unsigned int v5 = *((_DWORD *)a3 + 74);
  if (v5 < 0x7B)
  {
    if (v5 == 120)
    {
      [v9 setPageScale:*(unsigned __int8 *)(*((void *)a3 + 38) + 56)];
    }
    else if (v5 >= 0x3D)
    {
      uint64_t v8 = *((void *)a3 + 38);
      if ((*(unsigned char *)(v8 + 40) & 0x10) != 0) {
        [v9 setPageScale:*(__int16 *)(v8 + 52)];
      }
    }
  }
  else
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithBytes:*((void *)a3 + 38) + 122 length:v5 - 122];
    +[WXSection scaleFromPrinterSettings:v6];
    if (v7 != 1.0) {
      [v9 setPageScale:(float)(v7 * 100.0)];
    }
  }
}

+ (void)mapSectionProperties:(void *)a3 toSection:(id)a4
{
  id v27 = a4;
  uint64_t v5 = *((void *)a3 + 2);
  if (v5)
  {
    *((void *)a3 + 2) = v5 | 1;
    uint64_t v6 = *((void *)a3 + 3);
    float v7 = [v27 mutableTopBorder];
    +[WBBorder readFrom:v6 to:v7];

    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 2) != 0)
  {
    *((void *)a3 + 2) = v5 | 2;
    uint64_t v8 = *((void *)a3 + 4);
    id v9 = [v27 mutableLeftBorder];
    +[WBBorder readFrom:v8 to:v9];

    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 4) != 0)
  {
    *((void *)a3 + 2) = v5 | 4;
    uint64_t v10 = *((void *)a3 + 5);
    uint64_t v11 = [v27 mutableBottomBorder];
    +[WBBorder readFrom:v10 to:v11];

    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 8) != 0)
  {
    *((void *)a3 + 2) = v5 | 8;
    uint64_t v12 = *((void *)a3 + 6);
    id v13 = [v27 mutableRightBorder];
    +[WBBorder readFrom:v12 to:v13];

    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x40) != 0)
  {
    [v27 setBreakType:*((unsigned int *)a3 + 18)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x400000) != 0)
  {
    [v27 setPageWidth:*((unsigned int *)a3 + 34)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x800000) != 0)
  {
    [v27 setPageHeight:*((unsigned int *)a3 + 35)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x4000) != 0)
  {
    [v27 setPageOrientation:*((unsigned int *)a3 + 26)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x1000000) != 0)
  {
    [v27 setLeftMargin:*((unsigned int *)a3 + 36)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x2000000) != 0)
  {
    [v27 setRightMargin:*((unsigned int *)a3 + 37)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x80000) != 0)
  {
    [v27 setTopMargin:*((int *)a3 + 31)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x100000) != 0)
  {
    [v27 setBottomMargin:*((int *)a3 + 32)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x8000000) != 0)
  {
    [v27 setHeaderMargin:*((unsigned int *)a3 + 39)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x10000000) != 0)
  {
    [v27 setFooterMargin:*((unsigned int *)a3 + 40)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x4000000) != 0)
  {
    [v27 setGutterMargin:*((unsigned int *)a3 + 38)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x10000000000000) != 0)
  {
    [v27 setRtlGutter:*((unsigned char *)a3 + 248) != 0];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x800) != 0)
  {
    [v27 setBorderDepth:*((unsigned int *)a3 + 23)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x400) != 0)
  {
    [v27 setBorderDisplay:*((unsigned int *)a3 + 22)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x1000) != 0)
  {
    [v27 setBorderOffset:*((unsigned int *)a3 + 24)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x10000000000) != 0)
  {
    [v27 setLineNumberStart:*((__int16 *)a3 + 117)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x80000000) != 0)
  {
    [v27 setLineNumberIncrement:*((unsigned __int16 *)a3 + 108)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x10000) != 0)
  {
    [v27 setLineNumberDistance:*((__int16 *)a3 + 56)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x80) != 0)
  {
    [v27 setLineNumberRestart:*((unsigned int *)a3 + 19)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x100) != 0)
  {
    [v27 setPageNumberFormat:*((unsigned int *)a3 + 20)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x800000000) != 0)
  {
    [v27 setPageNumberStart:*((unsigned __int16 *)a3 + 112)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x400000000000) != 0)
  {
    [v27 setPageNumberRestart:*((unsigned char *)a3 + 242) != 0];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x200000000000) != 0)
  {
    [v27 setChapterNumberSeparator:*((unsigned __int8 *)a3 + 241)];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x2000000000000) != 0)
  {
    [v27 setColumnsEqualWidth:*((unsigned char *)a3 + 245) != 0];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x4000000000000) != 0)
  {
    [v27 setBidi:*((unsigned char *)a3 + 246) != 0];
    uint64_t v5 = *((void *)a3 + 2);
  }
  if ((v5 & 0x20000000000) == 0 || (unsigned __int16 v14 = *((_WORD *)a3 + 118) + 1, [v27 setColumnCount:v14], !v14))
  {
    uint64_t v15 = [v27 resolveMode];
    [v27 setResolveMode:2];
    if ([v27 isColumnCountOverridden]) {
      unsigned __int16 v14 = [v27 columnCount];
    }
    else {
      unsigned __int16 v14 = 0;
    }
    [v27 setResolveMode:v15];
  }
  int v16 = v14;
  if (v14 >= 2u)
  {
    int v17 = 0;
LABEL_67:
    uint64_t v18 = *((void *)a3 + 2);
    if ((v18 & 0x40000000) == 0 || (v19 = (uint64_t *)*((void *)a3 + 25)) == 0)
    {
LABEL_73:
      if ((v18 & 0x20000000) == 0) {
        goto LABEL_83;
      }
LABEL_74:
      v21 = (uint64_t *)*((void *)a3 + 22);
      if (!v21) {
        goto LABEL_83;
      }
      while (1)
      {
        unsigned int v22 = *((_DWORD *)v21 + 7);
        if (v22 <= v17)
        {
          if (v22 >= v17)
          {
            objc_msgSend(v27, "appendColumnSpace:", WrdSectionProperties::getColumnGap((WrdSectionProperties *)a3, v17));
            goto LABEL_83;
          }
          ++v21;
        }
        v21 = (uint64_t *)*v21;
        if (!v21) {
          goto LABEL_83;
        }
      }
    }
    while (1)
    {
      unsigned int v20 = *((_DWORD *)v19 + 7);
      if (v20 <= v17)
      {
        if (v20 >= v17)
        {
          objc_msgSend(v27, "appendColumnWidth:", WrdSectionProperties::getColumnWidthSpacing((WrdSectionProperties *)a3, v17));
          if ((*((void *)a3 + 2) & 0x20000000) != 0) {
            goto LABEL_74;
          }
LABEL_83:
          if (++v17 == v16) {
            break;
          }
          goto LABEL_67;
        }
        ++v19;
      }
      v19 = (uint64_t *)*v19;
      if (!v19) {
        goto LABEL_73;
      }
    }
  }
  uint64_t v23 = *((void *)a3 + 2);
  if ((v23 & 0x200000) != 0)
  {
    [v27 setColumnSpace:*((int *)a3 + 33)];
    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x200) != 0)
  {
    [v27 setVerticalJustification:*((unsigned int *)a3 + 21)];
    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x80000000000) != 0)
  {
    [v27 setTitlePage:*((unsigned char *)a3 + 239) != 0];
    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x4000000000) != 0)
  {
    [v27 setFormattingChanged:*((_WORD *)a3 + 115) != 0];
    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x8000000000) != 0)
  {
    [v27 setIndexToAuthorIDOfFormattingChange:*((unsigned __int16 *)a3 + 116)];
    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x10) != 0)
  {
    v24 = objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", *((void *)a3 + 7));
    [v27 setFormattingChangeDate:v24];

    uint64_t v23 = *((void *)a3 + 2);
  }
  if ((v23 & 0x8000) != 0)
  {
    int v25 = *((_DWORD *)a3 + 27) - 1;
    if (v25 > 4) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = dword_238EEED68[v25];
    }
    [v27 setTextDirection:v26];
  }
}

+ (void)mapSection:(id)a3 toSectionProperties:(void *)a4
{
  id v5 = a3;
  if ([v5 isTopBorderOverridden])
  {
    uint64_t v6 = [v5 topBorder];
    uint64_t v7 = *((void *)a4 + 3);
    *((void *)a4 + 2) |= 1uLL;
    +[WBBorder write:v6 to:v7];
  }
  if ([v5 isLeftBorderOverridden])
  {
    uint64_t v8 = [v5 leftBorder];
    *((void *)a4 + 2) |= 2uLL;
    +[WBBorder write:v8 to:*((void *)a4 + 4)];
  }
  if ([v5 isBottomBorderOverridden])
  {
    id v9 = [v5 bottomBorder];
    *((void *)a4 + 2) |= 4uLL;
    +[WBBorder write:v9 to:*((void *)a4 + 5)];
  }
  if ([v5 isRightBorderOverridden])
  {
    uint64_t v10 = [v5 rightBorder];
    *((void *)a4 + 2) |= 8uLL;
    +[WBBorder write:v10 to:*((void *)a4 + 6)];
  }
  if ([v5 isBreakTypeOverridden])
  {
    *((_DWORD *)a4 + 18) = [v5 breakType];
    *((void *)a4 + 2) |= 0x40uLL;
  }
  if ([v5 isPageWidthOverridden])
  {
    *((_DWORD *)a4 + 34) = [v5 pageWidth];
    *((void *)a4 + 2) |= 0x400000uLL;
  }
  if ([v5 isPageHeightOverridden])
  {
    *((_DWORD *)a4 + 35) = [v5 pageHeight];
    *((void *)a4 + 2) |= 0x800000uLL;
  }
  if ([v5 isPageOrientationOverridden])
  {
    *((_DWORD *)a4 + 26) = [v5 pageOrientation];
    *((void *)a4 + 2) |= 0x4000uLL;
  }
  if ([v5 isLeftMarginOverridden])
  {
    *((_DWORD *)a4 + 36) = [v5 leftMargin];
    *((void *)a4 + 2) |= 0x1000000uLL;
  }
  if ([v5 isRightMarginOverridden])
  {
    *((_DWORD *)a4 + 37) = [v5 rightMargin];
    *((void *)a4 + 2) |= 0x2000000uLL;
  }
  if ([v5 isTopMarginOverridden])
  {
    *((_DWORD *)a4 + 31) = [v5 topMargin];
    *((void *)a4 + 2) |= 0x80000uLL;
  }
  if ([v5 isBottomMarginOverridden])
  {
    *((_DWORD *)a4 + 32) = [v5 bottomMargin];
    *((void *)a4 + 2) |= 0x100000uLL;
  }
  if ([v5 isHeaderMarginOverridden])
  {
    *((_DWORD *)a4 + 39) = [v5 headerMargin];
    *((void *)a4 + 2) |= 0x8000000uLL;
  }
  if ([v5 isFooterMarginOverridden])
  {
    *((_DWORD *)a4 + 40) = [v5 footerMargin];
    *((void *)a4 + 2) |= 0x10000000uLL;
  }
  if ([v5 isGutterMarginOverridden])
  {
    *((_DWORD *)a4 + 38) = [v5 gutterMargin];
    *((void *)a4 + 2) |= 0x4000000uLL;
  }
  if ([v5 isRtlGutterOverridden])
  {
    *((unsigned char *)a4 + 248) = [v5 rtlGutter];
    *((void *)a4 + 2) |= 0x10000000000000uLL;
  }
  if ([v5 isBorderDepthOverridden])
  {
    *((_DWORD *)a4 + 23) = [v5 borderDepth];
    *((void *)a4 + 2) |= 0x800uLL;
  }
  if ([v5 isBorderDisplayOverridden])
  {
    *((_DWORD *)a4 + 22) = [v5 borderDisplay];
    *((void *)a4 + 2) |= 0x400uLL;
  }
  if ([v5 isBorderOffsetOverridden])
  {
    *((_DWORD *)a4 + 24) = [v5 borderOffset];
    *((void *)a4 + 2) |= 0x1000uLL;
  }
  if ([v5 isLineNumberStartOverridden])
  {
    *((_WORD *)a4 + 117) = [v5 lineNumberStart];
    *((void *)a4 + 2) |= 0x10000000000uLL;
  }
  if ([v5 isLineNumberIncrementOverridden])
  {
    *((_WORD *)a4 + 108) = [v5 lineNumberIncrement];
    *((void *)a4 + 2) |= 0x80000000uLL;
  }
  if ([v5 isLineNumberDistanceOverridden])
  {
    *((_DWORD *)a4 + 28) = [v5 lineNumberDistance];
    *((void *)a4 + 2) |= 0x10000uLL;
  }
  if ([v5 isLineNumberRestartOverridden])
  {
    *((_DWORD *)a4 + 19) = [v5 lineNumberRestart];
    *((void *)a4 + 2) |= 0x80uLL;
  }
  if ([v5 isPageNumberFormatOverridden])
  {
    *((_DWORD *)a4 + 20) = +[WBListLevel numberFormatEnumFor:](WBListLevel, "numberFormatEnumFor:", [v5 pageNumberFormat]);
    *((void *)a4 + 2) |= 0x100uLL;
  }
  if ([v5 isPageNumberStartOverridden])
  {
    *((_WORD *)a4 + 112) = [v5 pageNumberStart];
    *((void *)a4 + 2) |= 0x800000000uLL;
  }
  if ([v5 isPageNumberRestartOverridden])
  {
    *((unsigned char *)a4 + 242) = [v5 pageNumberRestart];
    *((void *)a4 + 2) |= 0x400000000000uLL;
  }
  if ([v5 isChapterNumberSeparatorOverridden])
  {
    *((unsigned char *)a4 + 241) = [v5 chapterNumberSeparator];
    *((void *)a4 + 2) |= 0x200000000000uLL;
  }
  if ([v5 isColumnCountOverridden])
  {
    *((_WORD *)a4 + 118) = [v5 columnCount] - 1;
    *((void *)a4 + 2) |= 0x20000000000uLL;
  }
  if ([v5 isColumnsEqualWidthOverridden])
  {
    *((unsigned char *)a4 + 245) = [v5 columnsEqualWidth];
    *((void *)a4 + 2) |= 0x2000000000000uLL;
  }
  if ([v5 isColumnCountOverridden])
  {
    if ([v5 isColumnsEqualWidthOverridden])
    {
      if (([v5 columnsEqualWidth] & 1) == 0)
      {
        int v11 = [v5 columnCount];
        int v12 = v11;
        if (v11)
        {
          uint64_t v13 = 0;
          int v14 = v11 - 1;
          do
          {
            int v15 = [v5 columnWidthAt:v13];
            *((void *)a4 + 2) |= 0x40000000uLL;
            unsigned int v20 = v13;
            v21 = &v20;
            *((_DWORD *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,CsLess<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a4 + 24, &v20, (uint64_t)&std::piecewise_construct, &v21)+ 8) = v15;
            if ((int)v13 < v14)
            {
              int v16 = [v5 columnSpaceAt:v13];
              *((void *)a4 + 2) |= 0x20000000uLL;
              unsigned int v20 = v13;
              v21 = &v20;
              *((_DWORD *)std::__tree<std::__value_type<unsigned int,int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,int>,CsLess<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a4 + 21, &v20, (uint64_t)&std::piecewise_construct, &v21)+ 8) = v16;
            }
            uint64_t v13 = (v13 + 1);
          }
          while (v12 != v13);
        }
      }
    }
  }
  if ([v5 isColumnSpaceOverridden])
  {
    *((_DWORD *)a4 + 33) = [v5 columnSpace];
    *((void *)a4 + 2) |= 0x200000uLL;
  }
  if ([v5 isVerticalJustificationOverridden])
  {
    *((_DWORD *)a4 + 21) = [v5 verticalJustification];
    *((void *)a4 + 2) |= 0x200uLL;
  }
  if ([v5 isTitlePageOverridden])
  {
    *((unsigned char *)a4 + 239) = [v5 titlePage];
    *((void *)a4 + 2) |= 0x80000000000uLL;
  }
  if ([v5 isBidiOverridden])
  {
    *((unsigned char *)a4 + 246) = [v5 bidi];
    *((void *)a4 + 2) |= 0x4000000000000uLL;
  }
  if ([v5 isFormattingChangedOverridden])
  {
    *((_WORD *)a4 + 115) = [v5 formattingChanged];
    *((void *)a4 + 2) |= 0x4000000000uLL;
  }
  if ([v5 isIndexToAuthorIDOfFormattingChangeOverridden])
  {
    *((_WORD *)a4 + 116) = [v5 indexToAuthorIDOfFormattingChange];
    *((void *)a4 + 2) |= 0x8000000000uLL;
  }
  if ([v5 isFormattingChangeDateOverridden])
  {
    int v17 = [v5 formattingChangeDate];
    *((void *)a4 + 2) |= 0x10uLL;
    objc_msgSend(v17, "tc_copyToWordDate:", *((void *)a4 + 7));
  }
  if ([v5 isTextDirectionOverridden])
  {
    unsigned int v18 = [v5 textDirection];
    if (v18 >= 6) {
      int v19 = 0;
    }
    else {
      int v19 = dword_238EEED7C[v18];
    }
    *((_DWORD *)a4 + 27) = v19;
    *((void *)a4 + 2) |= 0x8000uLL;
  }
}

@end