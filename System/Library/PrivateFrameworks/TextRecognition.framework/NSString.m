@interface NSString
- (uint64_t)_codePointIsSpaceSeparatedScript:(int16x4_t)a3;
@end

@implementation NSString

void __53__NSString_CRStringUtilities___crStartsWithUppercase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = [a2 characterAtIndex:0];
  v10 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  int v11 = [v10 characterIsMember:v9];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v12 characterIsMember:v9];

    *a7 = 1;
  }
}

void __53__NSString_CRStringUtilities___crStartsWithLowercase__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = [a2 characterAtIndex:0];
  v10 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  int v11 = [v10 characterIsMember:v9];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v12 characterIsMember:v9];

    *a7 = 1;
  }
}

- (uint64_t)_codePointIsSpaceSeparatedScript:(int16x4_t)a3
{
  if (result)
  {
    a3.i16[0] = a2 & 0xFFDF;
    a3.i16[1] = a2;
    result = 1;
    if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x158001F0017001ALL, (uint16x4_t)vadd_s16(vzip1_s16(a3, vdup_lane_s16(a3, 1)), (int16x4_t)0xFF08FF28FF40FFBFLL))) & 1) == 0)
    {
      BOOL v6 = a2 >> 8 == 17
        || a2 - 12592 < 0x60
        || a2 >> 5 == 1355
        || (unsigned __int16)((unsigned __int16)(a2 + 21504) >> 10) < 0xBu;
      return (unsigned __int16)(a2 - 880) < 0x1C0u || v6;
    }
  }
  return result;
}

void __48__NSString_CRStringUtilities___crEndsWithHyphen__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-－"];
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;
}

void __54__NSString_CRStringUtilities___crLocaleForNLLanguage___block_invoke()
{
  v15[25] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F38748];
  v14[0] = *MEMORY[0x1E4F386F0];
  v14[1] = v0;
  v15[0] = @"en-US";
  v15[1] = @"pt-BR";
  uint64_t v1 = *MEMORY[0x1E4F38718];
  v14[2] = *MEMORY[0x1E4F38700];
  v14[3] = v1;
  v15[2] = @"fr-FR";
  v15[3] = @"it-IT";
  uint64_t v2 = *MEMORY[0x1E4F38770];
  v14[4] = *MEMORY[0x1E4F38708];
  v14[5] = v2;
  v15[4] = @"de-DE";
  v15[5] = @"es-ES";
  uint64_t v3 = *MEMORY[0x1E4F387A0];
  v14[6] = *MEMORY[0x1E4F38758];
  v14[7] = v3;
  v15[6] = @"ru-RU";
  v15[7] = @"uk-UA";
  uint64_t v4 = *MEMORY[0x1E4F387B0];
  v14[8] = *MEMORY[0x1E4F38780];
  v14[9] = v4;
  v15[8] = @"th-TH";
  v15[9] = @"vi-VT";
  uint64_t v5 = *MEMORY[0x1E4F38710];
  v14[10] = *MEMORY[0x1E4F38798];
  v14[11] = v5;
  v15[10] = @"tr-TR";
  v15[11] = @"id-ID";
  uint64_t v6 = *MEMORY[0x1E4F386E0];
  v14[12] = *MEMORY[0x1E4F386D8];
  v14[13] = v6;
  v15[12] = @"cs-CZ";
  v15[13] = @"da-DK";
  uint64_t v7 = *MEMORY[0x1E4F38738];
  v14[14] = *MEMORY[0x1E4F386E8];
  v14[15] = v7;
  v15[14] = @"nl-NL";
  v15[15] = @"no-NO";
  uint64_t v8 = *MEMORY[0x1E4F38740];
  v14[16] = *MEMORY[0x1E4F38730];
  v14[17] = v8;
  v15[16] = @"ms-MY";
  v15[17] = @"pl-PL";
  uint64_t v9 = *MEMORY[0x1E4F38778];
  v14[18] = *MEMORY[0x1E4F38750];
  v14[19] = v9;
  v15[18] = @"ro-RO";
  v15[19] = @"sv-SE";
  uint64_t v10 = *MEMORY[0x1E4F38790];
  v14[20] = *MEMORY[0x1E4F38768];
  v14[21] = v10;
  v15[20] = @"zh-Hans";
  v15[21] = @"zh-Hant";
  uint64_t v11 = *MEMORY[0x1E4F38728];
  v14[22] = *MEMORY[0x1E4F38720];
  v14[23] = v11;
  v15[22] = @"ja-JP";
  v15[23] = @"ko-KR";
  v14[24] = *MEMORY[0x1E4F386D0];
  v15[24] = @"ar-SA";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:25];
  v13 = (void *)qword_1EB58C990;
  qword_1EB58C990 = v12;
}

void __73__NSString_CRStringUtilities___crStringByPreparingForLanguageRecognition__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  id v4 = (id)[v0 mutableCopy];

  uint64_t v1 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  [v4 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)qword_1EB58C9A0;
  qword_1EB58C9A0 = v2;
}

uint64_t __59__NSString_CRStringUtilities___crArrayOfComposedCharacters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __67__NSString_CRStringUtilities___crStringByRemovingParenthesizedText__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"([{<（［｛＜");
  uint64_t v1 = (void *)qword_1EB58C9B0;
  qword_1EB58C9B0 = v0;
}

uint64_t __77__NSString_CRStringUtilities___crStringByReversingComposedCharacterSequences__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendString:a2];
}

void __80__NSString_CRLineWrappingUtilities___crIsSentencePunctuatedIncludingWhitespace___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v15 = a2;
  if (([v15 containsString:@"."] & 1) == 0
    && ([v15 containsString:@","] & 1) == 0
    && ![v15 containsString:@"，"])
  {
    goto LABEL_7;
  }
  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v12
    || ([v12 _crContainsText] & 1) != 0
    || a5 + a6 < (unint64_t)[*(id *)(a1 + 32) length]
    && (objc_msgSend(*(id *)(a1 + 32), "substringWithRange:"),
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 _crContainsText],
        v13,
        (v14 & 1) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a7 = 1;
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"•⋅"];
  uint64_t v3 = (void *)qword_1EB58CCC0;
  qword_1EB58CCC0 = v2;

  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[\\(|\\[] ?([0-9]+) ?[\\)|\\]]" options:0 error:0];
  uint64_t v5 = (void *)qword_1EB58CCC8;
  qword_1EB58CCC8 = v4;

  uint64_t v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([a-zA-Z])(\\([0-9]+\\))" options:0 error:0];
  uint64_t v7 = (void *)qword_1EB58CCD0;
  qword_1EB58CCD0 = v6;

  uint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"((\\s|^|\\.|/)([a-zA-Z]|\\p{script=Cyrillic})+)(\\s\\.|\\.\\s|\\s\\.\\s)((com|рф)(\\s|$|/))" options:0 error:0];
  uint64_t v9 = (void *)qword_1EB58CCD8;
  qword_1EB58CCD8 = v8;

  uint64_t v10 = *(void **)(a1 + 32);
  id v22 = [&unk_1F393AE60 allKeys];
  uint64_t v11 = objc_msgSend(v10, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  uint64_t v12 = (void *)qword_1EB58CCE0;
  qword_1EB58CCE0 = v11;

  v13 = *(void **)(a1 + 32);
  id v23 = [&unk_1F393AE88 allKeys];
  uint64_t v14 = objc_msgSend(v13, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  id v15 = (void *)qword_1EB58CCE8;
  qword_1EB58CCE8 = v14;

  v16 = *(void **)(a1 + 32);
  id v24 = [&unk_1F393AEB0 allKeys];
  uint64_t v17 = objc_msgSend(v16, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v18 = (void *)qword_1EB58CCF0;
  qword_1EB58CCF0 = v17;

  v19 = *(void **)(a1 + 32);
  id v25 = [&unk_1F393AED8 allKeys];
  uint64_t v20 = objc_msgSend(v19, "_compositeRegexForReplacing:nonspaceLeft:nonspaceRight:");
  v21 = (void *)qword_1EB58CCF8;
  qword_1EB58CCF8 = v20;
}

__CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_2()
{
  return @"($1)";
}

__CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_3()
{
  return @"$1 $2";
}

__CFString *__52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_4()
{
  return @"$1.$5";
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 rangeAtIndex:2];
  uint64_t v7 = objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [&unk_1F393AE60 objectForKeyedSubscript:v7];
    uint64_t v10 = [v8 stringWithFormat:@"$1%@$3", v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 rangeAtIndex:2];
  uint64_t v7 = objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [&unk_1F393AE88 objectForKeyedSubscript:v7];
    uint64_t v10 = [v8 stringWithFormat:@"$1%@$3", v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 rangeAtIndex:2];
  uint64_t v7 = objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [&unk_1F393AEB0 objectForKeyedSubscript:v7];
    uint64_t v10 = [v8 stringWithFormat:@"$1%@$3", v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __52__NSString_CRDD___crDDFriendlyTextWithIndexMapping___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 rangeAtIndex:2];
  uint64_t v7 = objc_msgSend(v4, "safeSubstringWithRange:", v5, v6);
  if (v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [&unk_1F393AED8 objectForKeyedSubscript:v7];
    uint64_t v10 = [v8 stringWithFormat:@"$1%@$3", v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end