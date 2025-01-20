@interface OADCachedTextStyle
- (BOOL)isEqual:(id)a3;
- (OADCachedTextStyle)initWithTextBodyProperties:(id)a3 paragraphProperties:(id)a4 characterProperties:(id)a5 colorContext:(id)a6 graphicStyleCache:(id)a7;
- (unint64_t)hash;
- (void)applyToParagraphProperties:(id)a3 graphicStyleCache:(id)a4;
- (void)applyToTextBodyProperties:(id)a3 graphicStyleCache:(id)a4;
@end

@implementation OADCachedTextStyle

- (OADCachedTextStyle)initWithTextBodyProperties:(id)a3 paragraphProperties:(id)a4 characterProperties:(id)a5 colorContext:(id)a6 graphicStyleCache:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v47 = a7;
  v48.receiver = self;
  v48.super_class = (Class)OADCachedTextStyle;
  v16 = [(OADCachedTextStyle *)&v48 init];
  if (v16)
  {
    v16[8] = v16[8] & 0xF8 | [v12 textAnchorType] & 7;
    v17 = [v13 lineSpacing];
    *(_WORD *)(v16 + 9) = OADTextCachedSpacingWithSpacing(v17);

    v18 = [v13 beforeSpacing];
    *(_WORD *)(v16 + 11) = OADTextCachedSpacingWithSpacing(v18);

    v19 = [v13 afterSpacing];
    *(_WORD *)(v16 + 13) = OADTextCachedSpacingWithSpacing(v19);

    [v13 leftMargin];
    *(_WORD *)(v16 + 15) = llroundf(v20 * 8.0);
    [v13 rightMargin];
    *(_WORD *)(v16 + 17) = llroundf(v21 * 8.0);
    [v13 indent];
    *(_WORD *)(v16 + 19) = llroundf(v22 * 8.0);
    [v13 defaultTab];
    *(_WORD *)(v16 + 21) = llroundf(v23 * 8.0);
    v16[23] = v16[23] & 0xF0 | [v13 align] & 0xF;
    if ([v14 hasLatinFont]) {
      [v14 latinFont];
    }
    else {
    v46 = [v13 latinFont];
    }
    v24 = objc_msgSend(v47, "fontFaceCache", v12);
    *((_WORD *)v16 + 12) = [v24 cacheFeature:v46];

    if ([v14 hasSize]) {
      v25 = v14;
    }
    else {
      v25 = v13;
    }
    [v25 size];
    *((_WORD *)v16 + 13) = llroundf(v26 * 8.0);
    if ([v14 hasFill]) {
      [v14 fill];
    }
    else {
    v45 = [v13 fill];
    }
    uint64_t v27 = objc_opt_class();
    v28 = TSUDynamicCast(v27, (uint64_t)v45);
    v29 = [v28 color];

    if (!v29)
    {
      v29 = +[OADSchemeColor schemeColorWithIndex:1];
    }
    v30 = [v15 map];
    v31 = [v15 scheme];
    v32 = [v15 palette];
    v33 = +[OADColor rgbColorWithColor:v29 colorMap:v30 colorScheme:v31 colorPalette:v32];

    id v12 = v44;
    v34 = [v47 colorCache];
    *((_WORD *)v16 + 14) = [v34 cacheFeature:v33];

    if ([v14 hasIsBold]) {
      v35 = v14;
    }
    else {
      v35 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFFFE | [v35 isBold];
    if ([v14 hasIsItalic]) {
      v36 = v14;
    }
    else {
      v36 = v13;
    }
    if ([v36 isItalic]) {
      __int16 v37 = 2;
    }
    else {
      __int16 v37 = 0;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFFFD | v37;
    if ([v14 hasUnderlineType]) {
      v38 = v14;
    }
    else {
      v38 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFF83 | (4 * ([v38 underlineType] & 0x1F));
    if ([v14 hasFormatType]) {
      v39 = v14;
    }
    else {
      v39 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xFE7F | (([v39 formatType] & 3) << 7);
    if ([v14 hasFormatKerningType]) {
      v40 = v14;
    }
    else {
      v40 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xF9FF | (([v40 formatKerningType] & 3) << 9);
    if ([v14 hasStrikeThroughType]) {
      v41 = v14;
    }
    else {
      v41 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0xE7FF | (([v41 strikeThroughType] & 3) << 11);
    if ([v14 hasCaps]) {
      v42 = v14;
    }
    else {
      v42 = v13;
    }
    *((_WORD *)v16 + 15) = *((_WORD *)v16 + 15) & 0x9FFF | (([v42 caps] & 3) << 13);
    *((void *)v16 + 4) = TSUHash(v16 + 8, 24);
  }
  return (OADCachedTextStyle *)v16;
}

- (unint64_t)hash
{
  return *((void *)&self->mData + 3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = v4;
  uint64_t v7 = objc_opt_class();
  BOOL v10 = v7 == objc_opt_class()
     && *((void *)&v5->mData + 3) == v6[4]
     && *(void *)&v5->mData == v6[1]
     && *(void *)&v5->mData.leftMargin == v6[2]
     && *((void *)&v5->mData + 2) == v6[3];

  return v10;
}

- (void)applyToParagraphProperties:(id)a3 graphicStyleCache:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData + 1));
  [v22 setLineSpacing:v7];

  v8 = OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData.lineSpacing + 1));
  [v22 setBeforeSpacing:v8];

  v9 = OADTextSpacingWithCachedSpacing(*(__int16 *)((char *)&self->mData.beforeSpacing + 1));
  [v22 setAfterSpacing:v9];

  *(float *)&double v10 = (float)*(__int16 *)((char *)&self->mData.afterSpacing + 1) * 0.125;
  [v22 setLeftMargin:v10];
  *(float *)&double v11 = (float)*(__int16 *)((char *)&self->mData.leftMargin + 1) * 0.125;
  [v22 setRightMargin:v11];
  *(float *)&double v12 = (float)*(__int16 *)((char *)&self->mData.rightMargin + 1) * 0.125;
  [v22 setIndent:v12];
  *(float *)&double v13 = (float)*(__int16 *)((char *)&self->mData.indent + 1) * 0.125;
  [v22 setDefaultTab:v13];
  [v22 setAlign:HIBYTE(self->mData.defaultTab) & 0xF];
  id v14 = [v6 fontFaceCache];
  id v15 = [v14 countedFeatureAtIndex:*((unsigned __int16 *)&self->mData + 8)];
  v16 = [v15 feature];
  [v22 setLatinFont:v16];

  *(float *)&double v17 = (float)(__int16)self->mData.fontFaceIndex * 0.125;
  [v22 setSize:v17];
  v18 = objc_alloc_init(OADSolidFill);
  v19 = [v6 colorCache];
  float v20 = [v19 countedFeatureAtIndex:(unsigned __int16)self->mData.fontSize];
  float v21 = [v20 feature];
  [(OADSolidFill *)v18 setColor:v21];

  [v22 setFill:v18];
  [v22 setIsBold:self->mData.fontColorIndex & 1];
  [v22 setIsItalic:(self->mData.fontColorIndex >> 1) & 1];
  [v22 setUnderlineType:(LOBYTE(self->mData.fontColorIndex) >> 2) & 0x1F];
  [v22 setFormatType:(self->mData.fontColorIndex >> 7) & 3];
  [v22 setFormatKerningType:(self->mData.fontColorIndex >> 9) & 3];
  [v22 setStrikeThroughType:(self->mData.fontColorIndex >> 11) & 3];
  [v22 setCaps:(self->mData.fontColorIndex >> 13) & 3];
}

- (void)applyToTextBodyProperties:(id)a3 graphicStyleCache:(id)a4
{
}

@end