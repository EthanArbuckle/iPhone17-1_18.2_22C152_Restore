@interface PBCharacterProperties
+ (void)readCharacterProperties:(id)a3 characterProperty:(PptCharProperty *)a4 state:(id)a5;
+ (void)readCharacterProperties:(id)a3 characterPropertyRun:(PptCharRun *)a4 state:(id)a5;
+ (void)readCharacterProperties:(id)a3 specialInfo:(const PptSpecialInfo *)a4 state:(id)a5;
+ (void)readCharacterProperties:(id)a3 specialInfoRun:(const void *)a4 state:(id)a5;
@end

@implementation PBCharacterProperties

+ (void)readCharacterProperties:(id)a3 characterProperty:(PptCharProperty *)a4 state:(id)a5
{
  id v44 = a3;
  id v7 = a5;
  v8 = [v7 currentMacCharStyle];
  v9 = v8;
  if (v8 {
    && (v10 = (const void *)[v8 eshObject]) != 0
  }
  {
    uint64_t v14 = *(void *)(v13 + 8 * v12);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (([v7 hasCharacterPropertyBulletIndex] & 1) == 0) {
    [v7 setBulletIndex:(*((unsigned __int16 *)a4 + 2) >> 10) & 0xF];
  }
  [v44 setIsBold:*((_WORD *)a4 + 2) & 1];
  [v44 setIsItalic:(*((unsigned __int16 *)a4 + 2) >> 1) & 1];
  [v44 setUnderlineType:(*((unsigned __int8 *)a4 + 4) >> 1) & 2];
  if ((*((_WORD *)a4 + 2) & 0x10) != 0)
  {
    uint64_t v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
    if (!+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects)
    {
      id v16 = objc_alloc(MEMORY[0x263EFF8C0]);
      uint64_t v17 = objc_msgSend(v16, "initWithObjects:", kOADAutoTextShadowEffect, 0);
      v18 = (void *)+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
      +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects = v17;

      uint64_t v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
    }
  }
  else
  {
    if (+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::once != -1) {
      dispatch_once(&+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::once, &__block_literal_global_98);
    }
    uint64_t v15 = +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
  }
  [v44 setEffects:v15];
  if (v14 && *(unsigned char *)(v14 + 8))
  {
    *(float *)&double v19 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)*(unsigned int *)(v14 + 12));
    [v44 setOpacity:v19];
  }
  int v20 = *((unsigned __int16 *)a4 + 2);
  if ((v20 & 8) != 0) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = (v20 << 22 >> 31) & 3;
  }
  [v44 setFormatType:v21];
  double v22 = (double)a4->var19 / 100.0;
  *(float *)&double v22 = v22;
  [v44 setBaseline:v22];
  if ((*((unsigned char *)&a4->var0 + 1) & 0x40) != 0)
  {
    LOWORD(v23) = a4->var17;
    *(float *)&double v23 = (float)LODWORD(v23);
    [v44 setSize:v23];
  }
  if (a4->var13 != 0xFFFFLL)
  {
    v24 = objc_msgSend(v7, "fontEntityAtIndex:");
    v25 = [v24 faceName];
    [v44 setLatinFont:v25];
  }
  if ((*((unsigned char *)&a4->var0 + 1) & 0x10) != 0 && a4->var15 != 0xFFFFLL)
  {
    v26 = objc_msgSend(v7, "fontEntityAtIndex:");
    v27 = [v26 faceName];
    [v44 setHAnsiFont:v27];
  }
  if (a4->var14 != 0xFFFFLL)
  {
    v28 = objc_msgSend(v7, "fontEntityAtIndex:");
    v29 = [v28 faceName];
    [v44 setEastAsianFont:v29];
  }
  if (((__int16)a4->var16 & 0x80000000) == 0)
  {
    v30 = [v7 fontEntityAtIndex:a4->var16];
    v31 = [v30 faceName];
    [v44 setSymbolFont:v31];
  }
  $4A9E05CF4EB813CDA9C8B3A246960F55 var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x40) != 0 && (*((_WORD *)a4 + 2) & 0x40) != 0)
  {
    [v44 setFormatKerningType:2];
    $4A9E05CF4EB813CDA9C8B3A246960F55 var0 = a4->var0;
  }
  if ((*(_WORD *)&var0 & 0x100) != 0 && (*((_WORD *)a4 + 2) & 0x100) != 0) {
    [v44 setFormatKerningType:1];
  }
  int var1 = a4->var18.var1;
  if (var1 != 255)
  {
    if (var1 == 254)
    {
      unsigned int v34 = a4->var18.var0.var1;
      unsigned int var2 = a4->var18.var0.var2;
      unsigned int var3 = a4->var18.var0.var3;
      v37 = [OADRgbColor alloc];
      *(float *)&double v38 = (float)v34;
      *(float *)&double v39 = (float)var2;
      *(float *)&double v40 = (float)var3;
      v41 = [(OADRgbColor *)v37 initWithRedByte:v38 greenByte:v39 blueByte:v40];
    }
    else
    {
      v41 = [[OADSchemeColor alloc] initWithSchemeColorIndex:+[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a4->var18.var1]];
    }
    v42 = v41;
    v43 = objc_alloc_init(OADSolidFill);
    [(OADSolidFill *)v43 setColor:v42];
    [v44 setFill:v43];
  }
}

+ (void)readCharacterProperties:(id)a3 characterPropertyRun:(PptCharRun *)a4 state:(id)a5
{
}

void __73__PBCharacterProperties_readCharacterProperties_characterProperty_state___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  v1 = (void *)+[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects;
  +[PBCharacterProperties readCharacterProperties:characterProperty:state:]::effects = (uint64_t)v0;
}

+ (void)readCharacterProperties:(id)a3 specialInfoRun:(const void *)a4 state:(id)a5
{
}

+ (void)readCharacterProperties:(id)a3 specialInfo:(const PptSpecialInfo *)a4 state:(id)a5
{
  id v6 = a3;
  if ((*(unsigned char *)&a4->var0 & 2) != 0) {
    [v6 setLanguage:*(_DWORD *)&a4->var1];
  }
}

@end