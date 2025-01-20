@interface NSString
@end

@implementation NSString

void __64__NSString_TYTextDirectionAnnotations__textDirectionAnnotations__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  unint64_t v10 = 0x263F08000;
  unint64_t v11 = 0x265559000;
  unint64_t v12 = a2 - v9;
  id v35 = (id)v8;
  if (a2 > v9)
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v9, a2 - v9);
    [*(id *)(a1 + 40) processString:v13];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    [*(id *)(a1 + 40) reset];
    [*(id *)(a1 + 40) processString:v35];
    v15 = (void *)MEMORY[0x263EFF960];
    v16 = [*(id *)(a1 + 40) dominantLanguage];
    uint64_t v17 = [v15 characterDirectionForLanguage:v16];

    if (v14) {
      uint64_t v17 = v14;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
      && (v18 = *(void **)(a1 + 48),
          [MEMORY[0x263F08708] characterSetWithCharactersInString:v13],
          v19 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v18) = [v18 isSupersetOfSet:v19],
          v19,
          v18))
    {
      v20 = [*(id *)(a1 + 56) lastObject];
      uint64_t v21 = [v20 range];
      [v20 range];
      objc_msgSend(v20, "setRange:", v21, v22 + v12);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
      unint64_t v11 = 0x265559000;
    }
    else
    {
      unint64_t v11 = 0x265559000uLL;
      v20 = +[TYTextDirectionAnnotation initWithRange:textDirection:](TYTextDirectionAnnotation, "initWithRange:textDirection:", v9, a2 - v9, v17);
      [*(id *)(a1 + 56) addObject:v20];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }

    [*(id *)(a1 + 40) reset];
    uint64_t v8 = (uint64_t)v35;
    unint64_t v10 = 0x263F08000uLL;
  }
  [*(id *)(a1 + 40) processString:v8];
  v23 = [*(id *)(a1 + 40) dominantLanguage];
  uint64_t v24 = [MEMORY[0x263EFF960] characterDirectionForLanguage:v23];
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(void *)(v26 + 24)) {
    *(void *)(v26 + 24) = v24;
  }
  v27 = [*(id *)(v10 + 1800) characterSetWithCharactersInString:v35];
  v28 = [*(id *)(v10 + 1800) decimalDigitCharacterSet];
  int v29 = [v28 isSupersetOfSet:v27];

  uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8);
  if (a4 == 1 || v29)
  {
    if (*(unsigned char *)(v30 + 24))
    {
      v31 = [*(id *)(a1 + 56) lastObject];
      uint64_t v32 = [v31 range];
      [v31 range];
      objc_msgSend(v31, "setRange:", v32, v33 + a3);
      goto LABEL_21;
    }
    if (!a2 && *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 2)
    {
      v34 = objc_msgSend(*(id *)(v11 + 768), "initWithRange:textDirection:", 0, 0, 2);
      [*(id *)(a1 + 56) addObject:v34];

      uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    uint64_t v25 = 1;
    *(unsigned char *)(v30 + 24) = 1;
  }
  else
  {
    *(unsigned char *)(v30 + 24) = 0;
  }
  v31 = objc_msgSend(*(id *)(v11 + 768), "initWithRange:textDirection:", a2, a3, v25);
  [*(id *)(a1 + 56) addObject:v31];
LABEL_21:
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2 + a3;
  [*(id *)(a1 + 40) reset];
}

uint64_t __35__NSString_Grapheme__graphemeCount__block_invoke(uint64_t result)
{
  return result;
}

void __38__NSString_Grapheme__graphemeAtIndex___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 == a1[6])
  {
    uint64_t v11 = [a2 copy];
    uint64_t v12 = *(void *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a7 = 1;
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
  }
  *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v8 + 1;
}

void __35__NSString_Grapheme__graphemeArray__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  [v2 addObject:v3];
}

void __63__NSString_ArabicFormConverter__combinedArabicCharacterFormMap__block_invoke()
{
  v11[4] = *MEMORY[0x263EF8340];
  if (!combinedArabicCharacterFormMap_combinedArabicCharacterFormMap)
  {
    unint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", 1604, 1570);
    v10[0] = v9;
    v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF5u, 0, 0, 65270));
    v11[0] = v0;
    v1 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", 1604, 1571);
    v10[1] = v1;
    v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF7u, 0, 0, 65272));
    v11[1] = v2;
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", 1604, 1573);
    v10[2] = v3;
    v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF9u, 0, 0, 65274));
    v11[2] = v4;
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C", 1604, 1575);
    v10[3] = v5;
    v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEFBu, 0, 0, 65276));
    v11[3] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
    uint64_t v8 = (void *)combinedArabicCharacterFormMap_combinedArabicCharacterFormMap;
    combinedArabicCharacterFormMap_combinedArabicCharacterFormMap = v7;
  }
}

void __70__NSString_ArabicFormConverter__arabicNonPresentationFormCharacterSet__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 1569, 25);
  objc_msgSend(v0, "addCharactersInRange:", 1600, 10);
  v1 = (void *)arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet;
  arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet = (uint64_t)v0;
}

void __55__NSString_ArabicFormConverter__arabicCharacterFormMap__block_invoke()
{
  v40[37] = *MEMORY[0x263EF8340];
  v39[0] = &unk_270C6EF40;
  v38 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE80u, 0, 0, 0));
  v40[0] = v38;
  v39[1] = &unk_270C6EF58;
  v37 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE81u, 0, 0, 65154));
  v40[1] = v37;
  v39[2] = &unk_270C6EF70;
  v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE83u, 0, 0, 65156));
  v40[2] = v36;
  v39[3] = &unk_270C6EF88;
  id v35 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE85u, 0, 0, 65158));
  v40[3] = v35;
  v39[4] = &unk_270C6EFA0;
  v34 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE87u, 0, 0, 65160));
  v40[4] = v34;
  v39[5] = &unk_270C6EFB8;
  uint64_t v33 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE89u, 0xFE8Bu, 65164, 65162));
  v40[5] = v33;
  v39[6] = &unk_270C6EFD0;
  uint64_t v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE8Du, 0, 0, 65166));
  v40[6] = v32;
  v39[7] = &unk_270C6EFE8;
  v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE8Fu, 0xFE91u, 65170, 65168));
  v40[7] = v31;
  v39[8] = &unk_270C6F000;
  uint64_t v30 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE93u, 0, 0, 65172));
  v40[8] = v30;
  v39[9] = &unk_270C6F018;
  int v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE95u, 0xFE97u, 65176, 65174));
  v40[9] = v29;
  v39[10] = &unk_270C6F030;
  v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE99u, 0xFE9Bu, 65180, 65178));
  v40[10] = v28;
  v39[11] = &unk_270C6F048;
  v27 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE9Du, 0xFE9Fu, 65184, 65182));
  v40[11] = v27;
  v39[12] = &unk_270C6F060;
  uint64_t v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA1u, 0xFEA3u, 65188, 65186));
  v40[12] = v26;
  v39[13] = &unk_270C6F078;
  uint64_t v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA5u, 0xFEA7u, 65192, 65190));
  v40[13] = v25;
  v39[14] = &unk_270C6F090;
  uint64_t v24 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA9u, 0, 0, 65194));
  v40[14] = v24;
  v39[15] = &unk_270C6F0A8;
  v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEABu, 0, 0, 65196));
  v40[15] = v23;
  v39[16] = &unk_270C6F0C0;
  uint64_t v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEADu, 0, 0, 65198));
  v40[16] = v22;
  v39[17] = &unk_270C6F0D8;
  uint64_t v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEAFu, 0, 0, 65200));
  v40[17] = v21;
  v39[18] = &unk_270C6F0F0;
  v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB1u, 0xFEB3u, 65204, 65202));
  v40[18] = v20;
  v39[19] = &unk_270C6F108;
  v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB5u, 0xFEB7u, 65208, 65206));
  v40[19] = v19;
  v39[20] = &unk_270C6F120;
  v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB9u, 0xFEBBu, 65212, 65210));
  v40[20] = v18;
  v39[21] = &unk_270C6F138;
  uint64_t v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEBDu, 0xFEBFu, 65216, 65214));
  v40[21] = v17;
  v39[22] = &unk_270C6F150;
  v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC1u, 0xFEC3u, 65220, 65218));
  v40[22] = v16;
  v39[23] = &unk_270C6F168;
  v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC5u, 0xFEC7u, 65224, 65222));
  v40[23] = v15;
  v39[24] = &unk_270C6F180;
  uint64_t v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC9u, 0xFECBu, 65228, 65226));
  v40[24] = v14;
  v39[25] = &unk_270C6F198;
  v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFECDu, 0xFECFu, 65232, 65230));
  v40[25] = v13;
  v39[26] = &unk_270C6F1B0;
  uint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0x640u, 0, 0, 0));
  v40[26] = v12;
  v39[27] = &unk_270C6F1C8;
  v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED1u, 0xFED3u, 65236, 65234));
  v40[27] = v0;
  v39[28] = &unk_270C6F1E0;
  v1 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED5u, 0xFED7u, 65240, 65238));
  v40[28] = v1;
  v39[29] = &unk_270C6F1F8;
  v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED9u, 0xFEDBu, 65244, 65242));
  v40[29] = v2;
  v39[30] = &unk_270C6F210;
  id v3 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEDDu, 0xFEDFu, 65248, 65246));
  v40[30] = v3;
  v39[31] = &unk_270C6F228;
  v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE1u, 0xFEE3u, 65252, 65250));
  v40[31] = v4;
  v39[32] = &unk_270C6F240;
  v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE5u, 0xFEE7u, 65256, 65254));
  v40[32] = v5;
  v39[33] = &unk_270C6F258;
  v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE9u, 0xFEEBu, 65260, 65258));
  v40[33] = v6;
  v39[34] = &unk_270C6F270;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEEDu, 0, 0, 65262));
  v40[34] = v7;
  v39[35] = &unk_270C6F288;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEEFu, 0, 0, 65264));
  v40[35] = v8;
  v39[36] = &unk_270C6F2A0;
  unint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF1u, 0xFEF3u, 65268, 65266));
  v40[36] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:37];
  uint64_t v11 = (void *)arabicCharacterFormMap_arabicCharacterFormMap;
  arabicCharacterFormMap_arabicCharacterFormMap = v10;
}

void __60__NSString_ArabicFormConverter__arabicDiacriticCharacterSet__block_invoke()
{
  v0 = (void *)MEMORY[0x263F08708];
  objc_msgSend(NSString, "stringWithFormat:", @"%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C", 1552, 1554, 1555, 1556, 1557, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621,
    1622,
    1623,
    1624,
    1648,
    1750,
    1751,
    1752,
    1753,
    1754,
    1755,
    1756,
    1759,
    1760,
    1761,
    1762,
    1763,
    1764,
    1767,
    1768,
    1770,
    1771,
    1772,
  id v3 = 1773);
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  v2 = (void *)arabicDiacriticCharacterSet_arabicDiacriticCharacterSet;
  arabicDiacriticCharacterSet_arabicDiacriticCharacterSet = v1;
}

void __61__NSString_ArabicFormConverter__arabicFinalFormsCharacterSet__block_invoke()
{
  v0 = (void *)MEMORY[0x263F08708];
  objc_msgSend(NSString, "stringWithFormat:", @"%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C", 65166, 65168, 65174, 65178, 65182, 65186, 65190, 65194, 65196, 65198, 65200, 65202, 65206, 65210, 65214, 65218,
    65222,
    65226,
    65230,
    65234,
    65238,
    65242,
    65246,
    65250,
    65254,
    65258,
    65262,
    65266,
    65154,
    65172,
    65264,
  id v3 = 65276);
  uint64_t v1 = [v0 characterSetWithCharactersInString:v3];
  v2 = (void *)arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet;
  arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet = v1;
}

@end