@interface PBParagraphProperties
+ (int)pptAlignmentTypeWithOADTextAlignType:(unsigned __int8)a3;
+ (int)pptFontAlignWithOADTextFontAlign:(unsigned __int8)a3;
+ (signed)pptTextSpacingWithOADParaSpacing:(id)a3 defaultPptParaSpacing:(signed __int16)a4;
+ (void)readAlign:(id)a3 pptAlignmentType:(int)a4;
+ (void)readParagraphProperties:(id)a3 paragraphProperty:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 isMaster:(BOOL)a6 state:(id)a7;
+ (void)readParagraphProperties:(id)a3 paragraphPropertyRun:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 state:(id)a6;
@end

@implementation PBParagraphProperties

+ (void)readParagraphProperties:(id)a3 paragraphProperty:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 isMaster:(BOOL)a6 state:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if ((*(_WORD *)((unsigned char *)a4 + 3) & 8) != 0)
  {
    int v14 = *((__int16 *)a4 + 5);
    if (v14 < 1)
    {
      v17 = [[OADPointBulletSize alloc] initWithPoints:-v14];
    }
    else
    {
      v15 = [OADPercentBulletSize alloc];
      *(float *)&double v16 = (float)v14;
      v17 = [(OADPercentBulletSize *)v15 initWithPercent:v16];
    }
    v13 = (OADBulletSizeFollowText *)v17;
    [v11 setBulletSize:v17];
  }
  else
  {
    v13 = objc_alloc_init(OADBulletSizeFollowText);
    [v11 setBulletSize:v13];
  }

  if ((*(_WORD *)((unsigned char *)a4 + 3) & 4) != 0)
  {
    int v19 = *((_DWORD *)a4 + 5);
    if (v19 == 255) {
      goto LABEL_15;
    }
    if (v19 == 254)
    {
      unsigned int v20 = *((unsigned __int16 *)a4 + 7);
      unsigned int v21 = *((unsigned __int16 *)a4 + 8);
      unsigned int v22 = *((unsigned __int16 *)a4 + 9);
      v23 = [OADRgbColor alloc];
      *(float *)&double v24 = (float)v20;
      *(float *)&double v25 = (float)v21;
      *(float *)&double v26 = (float)v22;
      v27 = [(OADRgbColor *)v23 initWithRedByte:v24 greenByte:v25 blueByte:v26];
    }
    else
    {
      v27 = [[OADSchemeColor alloc] initWithSchemeColorIndex:+[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)*((_DWORD *)a4 + 5)]];
    }
    v18 = (OADBulletColorFollowText *)v27;
    TCVerifyInputMeetsCondition(v27 != 0);
    v28 = [[OADBulletColorSpecification alloc] initWithBulletColor:v18];
    [v11 setBulletColor:v28];
  }
  else
  {
    v18 = objc_alloc_init(OADBulletColorFollowText);
    [v11 setBulletColor:v18];
  }

LABEL_15:
  if ((*(_WORD *)((unsigned char *)a4 + 3) & 2) != 0)
  {
    v29 = [v12 fontEntityAtIndex:*((unsigned __int16 *)a4 + 4)];
    TCVerifyInputMeetsCondition(v29 != 0);
    v30 = [OADBulletFontSpecification alloc];
    v31 = [(OADBulletFontFollowText *)v29 faceName];
    v32 = [(OADBulletFontSpecification *)v30 initWithFont:v31];

    [v11 setBulletFont:v32];
    objc_msgSend(v11, "setBulletCharSet:", -[OADBulletFontFollowText charSet](v29, "charSet"));
  }
  else
  {
    v29 = objc_alloc_init(OADBulletFontFollowText);
    [v11 setBulletFont:v29];
  }

  if (*(_WORD *)((unsigned char *)a4 + 3))
  {
    if (!a5
      || (+[PBBulletProperties readBulletProperties:a5 state:v12], (v33 = (OADCharacterBulletProperties *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      __int16 v63 = *((_WORD *)a4 + 3);
      v34 = [NSString stringWithCharacters:&v63 length:1];
      v33 = [[OADCharacterBulletProperties alloc] initWithBullet:v34];
    }
  }
  else
  {
    v33 = objc_alloc_init(OADNullBulletProperties);
  }
  [v11 setBulletProperties:v33];
  __int16 v35 = *(_WORD *)a4;
  if ((*(_WORD *)a4 & 0x800) != 0)
  {
    int v36 = *((__int16 *)a4 + 12);
    if (v36 < 0)
    {
      v39 = [[OADPointTextSpacing alloc] initWithPoints:-v36 >> 3];
    }
    else
    {
      v37 = [OADPercentTextSpacing alloc];
      *(float *)&double v38 = (float)v36;
      v39 = [(OADPercentTextSpacing *)v37 initWithPercent:v38];
    }
    v40 = v39;
    [v11 setLineSpacing:v39];

    __int16 v35 = *(_WORD *)a4;
  }
  if ((v35 & 0x1000) != 0)
  {
    int v41 = *((__int16 *)a4 + 13);
    if (v41 < 0)
    {
      v44 = [[OADPointTextSpacing alloc] initWithPoints:-v41 >> 3];
    }
    else
    {
      v42 = [OADPercentTextSpacing alloc];
      *(float *)&double v43 = (float)v41;
      v44 = [(OADPercentTextSpacing *)v42 initWithPercent:v43];
    }
    v45 = v44;
    [v11 setBeforeSpacing:v44];

    __int16 v35 = *(_WORD *)a4;
  }
  if ((v35 & 0x2000) != 0)
  {
    int v46 = *((__int16 *)a4 + 14);
    if (v46 < 0)
    {
      v49 = [[OADPointTextSpacing alloc] initWithPoints:-v46 >> 3];
    }
    else
    {
      v47 = [OADPercentTextSpacing alloc];
      *(float *)&double v48 = (float)v46;
      v49 = [(OADPercentTextSpacing *)v47 initWithPercent:v48];
    }
    v50 = v49;
    [v11 setAfterSpacing:v49];
  }
  [a1 readAlign:v11 pptAlignmentType:*((unsigned char *)a4 + 4) & 0xF];
  *(float *)&double v51 = (float)*((__int16 *)a4 + 15) * 0.125;
  [v11 setLeftMargin:v51];
  v53 = (void *)*((void *)a4 + 5);
  if (v53)
  {
    id v61 = v12;
    unint64_t v54 = v53[1] - *v53;
    uint64_t v55 = (v54 >> 3);
    v56 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v55];
    if ((v54 & 0x7FFFFFFF8) != 0)
    {
      uint64_t v57 = 0;
      do
      {
        v58 = objc_alloc_init(OADTabStop);
        unint64_t v59 = *(void *)(*v53 + 8 * v57);
        [(OADTabStop *)v58 setAlign:v59];
        [(OADTabStop *)v58 setPosition:((__int16)(WORD2(v59) + ((((int)(v59 >> 16) >> 16) >> 28) & 7)) >> 3)];
        [v56 addObject:v58];

        ++v57;
      }
      while (v55 != v57);
    }
    objc_msgSend(v11, "setTabStops:", v56, v61);

    id v12 = v62;
  }
  *(float *)&double v52 = (float)(*((__int16 *)a4 + 16) - *((__int16 *)a4 + 15)) * 0.125;
  [v11 setIndent:v52];
  *(float *)&double v60 = (float)*((__int16 *)a4 + 17) * 0.125;
  [v11 setDefaultTab:v60];
}

+ (void)readAlign:(id)a3 pptAlignmentType:(int)a4
{
  id v5 = a3;
  unint64_t v6 = 0x503020100uLL >> (8 * a4);
  if (a4 >= 5) {
    LOBYTE(v6) = 0;
  }
  id v7 = v5;
  [v5 setAlign:v6 & 7];
}

+ (void)readParagraphProperties:(id)a3 paragraphPropertyRun:(void *)a4 bulletStyle:(PptParaProperty9 *)a5 state:(id)a6
{
  id v11 = a3;
  id v10 = a6;
  [v11 setLevel:*((__int16 *)a4 + 2)];
  [a1 readParagraphProperties:v11 paragraphProperty:(char *)a4 + 8 bulletStyle:a5 isMaster:0 state:v10];
}

+ (signed)pptTextSpacingWithOADParaSpacing:(id)a3 defaultPptParaSpacing:(signed __int16)a4
{
  LOWORD(v4) = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 percent];
    int v4 = (int)v6;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOWORD(v4) = -8 * [v5 points];
    }
  }

  return v4;
}

+ (int)pptAlignmentTypeWithOADTextAlignType:(unsigned __int8)a3
{
  if ((a3 - 1) > 5) {
    return 0;
  }
  else {
    return dword_238EEFE10[(char)(a3 - 1)];
  }
}

+ (int)pptFontAlignWithOADTextFontAlign:(unsigned __int8)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

@end