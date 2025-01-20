@interface SAUIDisambiguationList(SiriUIFoundationAdditions)
- (BOOL)sruif_hasButton;
- (__CFString)_speakableFinalDelimiterForSpeakableString:()SiriUIFoundationAdditions usingParser:;
- (id)_speakableStringFromString:()SiriUIFoundationAdditions usingParser:;
- (id)sruif_combinedSpeakableText;
@end

@implementation SAUIDisambiguationList(SiriUIFoundationAdditions)

- (id)sruif_combinedSpeakableText
{
  v2 = [MEMORY[0x263F089D8] string];
  v3 = objc_msgSend(MEMORY[0x263F28640], "sruif_speakableUtteranceParserForCurrentLanguage");
  [v3 setHandleTTSCodes:1];
  v4 = [a1 speakableText];
  v5 = [a1 _speakableStringFromString:v4 usingParser:v3];

  v6 = [a1 speakableDelimiter];
  v7 = [a1 _speakableStringFromString:v6 usingParser:v3];

  v8 = [a1 speakableSuffix];
  v9 = [a1 _speakableStringFromString:v8 usingParser:v3];

  if ([v5 length]) {
    [v2 appendString:v5];
  }
  v10 = [a1 items];
  uint64_t v11 = [v10 count];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 1;
  v12 = [a1 items];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __80__SAUIDisambiguationList_SiriUIFoundationAdditions__sruif_combinedSpeakableText__block_invoke;
  v22 = &unk_2647869E8;
  v23 = a1;
  id v13 = v3;
  id v24 = v13;
  v27 = v29;
  uint64_t v28 = v11;
  id v14 = v2;
  id v25 = v14;
  id v15 = v7;
  id v26 = v15;
  [v12 enumerateObjectsUsingBlock:&v19];

  if (objc_msgSend(v9, "length", v19, v20, v21, v22, v23)) {
    [v14 appendString:v9];
  }
  if ([v14 length]) {
    v16 = v14;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  _Block_object_dispose(v29, 8);
  return v17;
}

- (id)_speakableStringFromString:()SiriUIFoundationAdditions usingParser:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = [v6 parseStringWithFormat:v5 error:0];
    v8 = (void *)[v7 copy];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__CFString)_speakableFinalDelimiterForSpeakableString:()SiriUIFoundationAdditions usingParser:
{
  id v6 = a3;
  id v7 = a4;
  v8 = SRUIFGetLanguageCode();
  if ([v8 hasPrefix:@"es"])
  {
    if (FirstCharacterOfStringIsInCharacterSetInString(v6, @"oó"))
    {
      v9 = @" u ";
      goto LABEL_8;
    }
  }
  else if ([v8 hasPrefix:@"it"] {
         && (FirstCharacterOfStringIsInCharacterSetInString(v6, @"aeiouıᅡ-ᅵ") & 1) != 0)
  }
  {
    v9 = @" od ";
    goto LABEL_8;
  }
  v10 = [a1 speakableFinalDelimiter];
  v9 = [a1 _speakableStringFromString:v10 usingParser:v7];

LABEL_8:
  return v9;
}

- (BOOL)sruif_hasButton
{
  v1 = [a1 items];
  BOOL v2 = [v1 count] != 0;

  return v2;
}

@end