@interface WBSReaderLocalizedFonts
+ (id)defaultFontFamilyNameForLanguage:(id)a3;
+ (id)defaultFontFamilyNameForLanguageMap;
+ (id)fontsForLanguage:(id)a3;
@end

@implementation WBSReaderLocalizedFonts

+ (id)fontsForLanguage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"am"])
  {
    v4 = +[WBSReaderFont fontWithFamilyName:@"Kefa" displayName:0];
    v19 = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

    goto LABEL_42;
  }
  if ([v3 isEqualToString:@"ar"])
  {
    v6 = +[WBSReaderFont systemFontWithDisplayName:@"سان فرانسيسكو"];
    v19 = v6;
    v7 = +[WBSReaderFont fontWithFamilyName:@"Myriad Arabic" displayName:@"Myriad عربي"];
    v20 = v7;
    v8 = +[WBSReaderFont fontWithFamilyName:@"Damascus" displayName:@"دمشق عادي"];
    v21 = v8;
    v9 = +[WBSReaderFont fontWithFamilyName:@"Times New Roman" displayName:@"تايمز نيو رومان"];
    v22 = v9;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:4];

    goto LABEL_42;
  }
  if ([v3 isEqualToString:@"hy"])
  {
    v10 = +[WBSReaderFont fontWithFamilyName:@"Mshtakan" displayName:@"մշտական"];
    v19 = v10;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

    goto LABEL_42;
  }
  if ([v3 isEqualToString:@"bn"])
  {
    v11 = +[WBSReaderFont fontWithFamilyName:@"Kohinoor Bangla" displayName:@"কোহিনুর বাংলা"];
    v19 = v11;
    v12 = +[WBSReaderFont fontWithFamilyName:@"Tiro Bangla" displayName:@"Tiro বাংলা"];
    v20 = v12;
    v13 = +[WBSReaderFont fontWithFamilyName:@"Bangla Sangam MN" displayName:@"বাংলা সঙ্গম MN"];
    v21 = v13;
    v14 = +[WBSReaderFont fontWithFamilyName:@"Bangla MN" displayName:@"বাংলা MN"];
    v22 = v14;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:4];

    goto LABEL_42;
  }
  if ([v3 isEqualToString:@"my"])
  {
    v15 = +[WBSReaderFont fontWithFamilyName:@"Noto Sans Myanmar" displayName:@"Noto Sans မြန်မာဘာသာ"];
    v19 = v15;
    v16 = +[WBSReaderFont fontWithFamilyName:@"Noto Serif Myanmar" displayName:@"Noto Serif မြန်မာဘာသာ"];
    v20 = v16;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:2];

    goto LABEL_42;
  }
  if ([v3 isEqualToString:@"chr"])
  {
    uint64_t v17 = cherokeeFonts();
  }
  else if ([v3 isEqualToString:@"gu"])
  {
    uint64_t v17 = gujaratiFonts();
  }
  else if ([v3 isEqualToString:@"pa-Guru"])
  {
    uint64_t v17 = punjabiFonts();
  }
  else if ([v3 isEqualToString:@"he"])
  {
    uint64_t v17 = hebrewFonts();
  }
  else if ([v3 isEqualToString:@"hi"])
  {
    uint64_t v17 = hindiFonts();
  }
  else if ([v3 isEqualToString:@"ja"])
  {
    uint64_t v17 = japaneseFonts();
  }
  else if ([v3 isEqualToString:@"kn"])
  {
    uint64_t v17 = kannadaFonts();
  }
  else if ([v3 isEqualToString:@"km"])
  {
    uint64_t v17 = khmerFonts();
  }
  else if ([v3 isEqualToString:@"ko"])
  {
    uint64_t v17 = koreanFonts();
  }
  else
  {
    if (([v3 isEqualToString:@"lo"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"ml"])
      {
        uint64_t v17 = malayalamFonts();
        goto LABEL_41;
      }
      if ([v3 isEqualToString:@"or"])
      {
        uint64_t v17 = oriyaFonts();
        goto LABEL_41;
      }
      if ([v3 isEqualToString:@"si"])
      {
        uint64_t v17 = sinhalaFonts();
        goto LABEL_41;
      }
      if ([v3 isEqualToString:@"ta"])
      {
        uint64_t v17 = tamilFonts();
        goto LABEL_41;
      }
      if ([v3 isEqualToString:@"te"])
      {
        uint64_t v17 = teluguFonts();
        goto LABEL_41;
      }
      if (![v3 isEqualToString:@"lo"])
      {
        if ([v3 isEqualToString:@"th"])
        {
          uint64_t v17 = thaiFonts();
        }
        else if ([v3 isEqualToString:@"zh-Hans"])
        {
          uint64_t v17 = simplifiedChineseFonts();
        }
        else if ([v3 isEqualToString:@"zh-Hant"])
        {
          uint64_t v17 = traditionalChineseFonts();
        }
        else if ([v3 isEqualToString:@"iu-Cans"])
        {
          uint64_t v17 = unifiedCanadianSyllabicsFonts();
        }
        else
        {
          if ([v3 isEqualToString:@"ur"]) {
            urduFonts();
          }
          else {
          uint64_t v17 = defaultFonts();
          }
        }
        goto LABEL_41;
      }
    }
    uint64_t v17 = laoFonts();
  }
LABEL_41:
  v5 = (void *)v17;
LABEL_42:

  return v5;
}

+ (id)defaultFontFamilyNameForLanguage:(id)a3
{
  id v4 = a3;
  v5 = [a1 defaultFontFamilyNameForLanguageMap];
  v6 = [v5 objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = +[WBSReaderFont systemFont];
    id v8 = [v9 familyName];
  }
  return v8;
}

+ (id)defaultFontFamilyNameForLanguageMap
{
  v5[24] = *MEMORY[0x1E4F143B8];
  {
    v2 = (void *)+[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap]::fontFamilyNameForLanguage;
  }
  else
  {
    v4[0] = @"am";
    v4[1] = @"hy";
    v5[0] = @"Kefa";
    v5[1] = @"Mshtakan";
    v4[2] = @"bn";
    v4[3] = @"my";
    v5[2] = @"Kohinoor Bangla";
    v5[3] = @"Noto Sans Myanmar";
    v4[4] = @"chr";
    v4[5] = @"gu";
    v5[4] = @"Plantagenet Cherokee";
    v5[5] = @"Kohinoor Gujarati";
    v4[6] = @"pa-Guru";
    v4[7] = @"he";
    v5[6] = @"Mukta Mahee";
    v5[7] = @"Arial Hebrew";
    v4[8] = @"hi";
    v4[9] = @"ja";
    v5[8] = @"Kohinoor Devanagari";
    v5[9] = @"Hiragino Maru Gothic ProN";
    v4[10] = @"kn";
    v4[11] = @"km";
    v5[10] = @"Noto Sans Kannada";
    v5[11] = @"Khmer Sangam MN";
    v4[12] = @"ko";
    v4[13] = @"lo";
    v5[12] = @"Apple SD Gothic Neo";
    v5[13] = @"Lao Sangam MN";
    v4[14] = @"ml";
    v4[15] = @"or";
    v5[14] = @"Malayalam Sangam MN";
    v5[15] = @"Noto Sans Oriya";
    v4[16] = @"si";
    v4[17] = @"ta";
    v5[16] = @"Sinhala Sangam MN";
    v5[17] = @"Tamil Sangam MN";
    v4[18] = @"te";
    v4[19] = @"th";
    v5[18] = @"Kohinoor Telugu";
    v5[19] = @"Thonburi";
    v4[20] = @"zh-Hans";
    v4[21] = @"zh-Hant";
    v5[20] = @"PingFang SC";
    v5[21] = @"PingFang TC";
    v4[22] = @"iu-Cans";
    v4[23] = @"ur";
    v5[22] = @"Euphemia UCAS";
    v5[23] = @"Noto Nastaliq Urdu";
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:24];
    +[WBSReaderLocalizedFonts defaultFontFamilyNameForLanguageMap]::fontFamilyNameForLanguage = (uint64_t)v2;
  }
  return v2;
}

@end