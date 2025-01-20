@interface NSString(VSSpeechService)
+ (__CFString)vs_markerStringForContext:()VSSpeechService;
+ (uint64_t)_vs_countPhoneticSyllables_lhp:()VSSpeechService;
+ (uint64_t)_vs_countPhoneticSyllables_xsampa:()VSSpeechService;
+ (uint64_t)vs_isCJKCharacter:()VSSpeechService;
- (double)vs_measurePauses;
- (id)vs_convertToSSML;
- (id)vs_insertContextInfo:()VSSpeechService;
- (id)vs_removePhonetics;
- (id)vs_removeSpeechTags;
- (id)vs_substituteAudioWithLocalPath;
- (uint64_t)vs_countPhoneticSyllables;
- (uint64_t)vs_hasCJKCharacter;
- (void)vs_textifyEmojiWithLanguage:()VSSpeechService;
@end

@implementation NSString(VSSpeechService)

- (id)vs_convertToSSML
{
  if ([a1 hasPrefix:@"<speak>"])
  {
    id v2 = a1;
    goto LABEL_32;
  }
  v3 = [MEMORY[0x263EFF980] array];
  id v2 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"<speak>"];
  [v3 addObject:@"speak"];
  if ([a1 length])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = objc_msgSend(a1, "rangeOfString:options:range:", @"\x1B", 0, v4, objc_msgSend(a1, "length") - v4);
      unint64_t v6 = v5;
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v6 = [a1 length];
      }
      v7 = objc_msgSend(a1, "substringWithRange:", v4, v6 - v4);
      [v2 appendString:v7];

      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v8 = objc_msgSend(a1, "substringWithRange:", v5, objc_msgSend(a1, "length") - v5);
      if ([v8 hasPrefix:@"\x1B\\toi=lhp\\""])
      {
        [v2 appendString:@"<phoneme alphabet=\"lhp\" ph=\""];
        v6 += [@"\x1B\\toi=lhp\\"" length];
        [v3 addObject:@"phoneme"];
      }
      else if ([v8 hasPrefix:@"\x1B\\toi=orth\\""])
      {
        v9 = [v3 lastObject];
        int v10 = [v9 isEqualToString:@"phoneme"];

        if (!v10)
        {
          v13 = (void *)MEMORY[0x263EFF940];
          v14 = @"unbalanced phoneme tag";
LABEL_23:
          [v13 raise:@"SSML error" format:v14];
          goto LABEL_25;
        }
        [v2 appendString:@"\"></phoneme>"];
        v6 += [@"\x1B\\toi=orth\\"" length];
        [v3 removeLastObject];
      }
      else
      {
        if (![v8 hasPrefix:@"\x1B\\tn=normal\\""])
        {
          if ([v8 hasPrefix:@"\x1B\\tn="])
          {
            v15 = [v3 lastObject];
            int v16 = [v15 isEqualToString:@"say-as"];

            if (v16)
            {
              [v2 appendString:@"</say-as>"];
              [v3 removeLastObject];
            }
            uint64_t v17 = [v8 rangeOfString:@"\\", 0, objc_msgSend(@"\x1B\\tn=", "length"), objc_msgSend(v8, "length") - objc_msgSend(@"\x1B\\tn=", "length"") options range];
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
            {
              NSLog(&cfstr_ErrorInTnOverr.isa);
            }
            else
            {
              uint64_t v19 = v18;
              v20 = [v8 substringWithRange:objc_msgSend(@"\x1B\\tn=", "length"), v17 - objc_msgSend(@"\x1B\\tn=", "length")];
              [v2 appendFormat:@"<say-as interpret-as=\"%@\">", v20];
              uint64_t v21 = [@"\x1B\\tn=" length];
              v6 += v19 + v21 + [v20 length];
              [v3 addObject:@"say-as"];
            }
          }
          goto LABEL_25;
        }
        v11 = [v3 lastObject];
        int v12 = [v11 isEqualToString:@"say-as"];

        if (!v12)
        {
          v13 = (void *)MEMORY[0x263EFF940];
          v14 = @"unbalanced say-as tag";
          goto LABEL_23;
        }
        [v2 appendString:@"</say-as>"];
        [v3 removeLastObject];
        v6 += [@"\x1B\\tn=normal\\"" length];
      }
LABEL_25:

      unint64_t v4 = v6;
    }
    while (v6 < [a1 length]);
  }
  while ([v3 count])
  {
    v22 = [v3 lastObject];
    int v23 = [v22 isEqualToString:@"phoneme"];

    if (v23)
    {
      [v2 appendString:@"\"></phoneme>"];
    }
    else
    {
      v24 = [v3 lastObject];
      [v2 appendFormat:@"</%@>", v24];
    }
    [v3 removeLastObject];
  }

LABEL_32:
  return v2;
}

- (uint64_t)vs_hasCJKCharacter
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  do
  {
    uint64_t v3 = objc_msgSend(NSString, "vs_isCJKCharacter:", objc_msgSend(a1, "characterAtIndex:", v2));
    if (v3) {
      break;
    }
    ++v2;
  }
  while (v2 < [a1 length]);
  return v3;
}

- (id)vs_removeSpeechTags
{
  unint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\x1B\\\\\\w+=.+?\\\\"" options:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_26C1B0528);
  unint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"</?.*?>" options:0 error:0];
  uint64_t v5 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_26C1B0528);

  return v5;
}

- (id)vs_removePhonetics
{
  unint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\x1B\\\\toi=\\w+\\\\.*?\x1B\\\\toi=orth\\\\"" options:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_26C1B0528);
  unint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\x1B\\\\toi=\\w+\\\\.*" options:0 error:0];
  uint64_t v5 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_26C1B0528);

  unint64_t v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<phoneme.*?/>" options:0 error:0];
  v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_26C1B0528);

  return v7;
}

- (uint64_t)vs_countPhoneticSyllables
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v30 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\x1B\\\\toi=lhp\\\\([^\x1B]*)" options:0 error:0];
  unint64_t v2 = objc_msgSend(v30, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v38 + 1) + 8 * i) rangeAtIndex:1];
        int v10 = objc_msgSend(a1, "substringWithRange:", v8, v9);
        v5 += objc_msgSend(NSString, "_vs_countPhoneticSyllables_lhp:", v10);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  v29 = [NSString stringWithFormat:@"(?:%@|%@)", @"'(?:[^'\\\\]|\\\\.)*'", @"\"(?:[^\"\\\\]|\\\\.)*\""];
  v28 = [NSString stringWithFormat:@"\\w+=%@", v29];
  v27 = [NSString stringWithFormat:@"<phoneme\\s+(%@)\\s+(%@)\\s*/>", v28, v28];
  v26 = objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:");
  v11 = objc_msgSend(v26, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v15 = 0;
      uint64_t v32 = v13;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
        uint64_t v17 = &stru_26C1B0528;
        if ((unint64_t)[v16 numberOfRanges] >= 2)
        {
          char v18 = 0;
          unint64_t v19 = 1;
          do
          {
            uint64_t v20 = [v16 rangeAtIndex:v19];
            v22 = objc_msgSend(a1, "substringWithRange:", v20, v21);
            if ([v22 hasPrefix:@"alphabet="])
            {
              char v18 = [v22 containsString:@"lhp"];
            }
            else if ([v22 hasPrefix:@"ph="])
            {
              uint64_t v23 = objc_msgSend(v22, "substringWithRange:", 4, objc_msgSend(v22, "length") - 5);

              uint64_t v17 = (__CFString *)v23;
            }

            ++v19;
          }
          while (v19 < [v16 numberOfRanges]);
          if (v18)
          {
            uint64_t v24 = objc_msgSend(NSString, "_vs_countPhoneticSyllables_lhp:", v17);
            uint64_t v14 = v31;
            uint64_t v13 = v32;
            goto LABEL_26;
          }
          uint64_t v14 = v31;
          uint64_t v13 = v32;
        }
        uint64_t v24 = objc_msgSend(NSString, "_vs_countPhoneticSyllables_xsampa:", v17);
LABEL_26:
        v5 += v24;

        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v13);
  }

  return v5;
}

- (double)vs_measurePauses
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  unint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\x1B\\\\pause=['\"]?([0-9]+)['\"]?\\\\"" options:0 error:0];
  unint64_t v3 = [a1 length];
  long long v38 = v2;
  uint64_t v4 = objc_msgSend(v2, "matchesInString:options:range:", a1, 0, 0, v3);
  if ([v4 count] && v3 != 1)
  {
    uint64_t v5 = [a1 characterAtIndex:v3 - 1];
    uint64_t v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    if ([v6 characterIsMember:v5])
    {
    }
    else
    {
      v7 = [MEMORY[0x263F08708] punctuationCharacterSet];
      int v8 = [v7 characterIsMember:v5];

      if (!v8) {
        goto LABEL_7;
      }
    }
    --v3;
  }
LABEL_7:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v15 = [v14 rangeAtIndex:1];
        uint64_t v17 = objc_msgSend(a1, "substringWithRange:", v15, v16);
        uint64_t v18 = [v17 integerValue];
        if (v18 <= 10) {
          unint64_t v19 = 10;
        }
        else {
          unint64_t v19 = v18;
        }
        uint64_t v20 = [v14 rangeAtIndex:0];
        if ((v20 + v21 >= v3 || v20 == 0) && v19 > 0x64) {
          uint64_t v24 = 100;
        }
        else {
          uint64_t v24 = v19;
        }
        v11 += v24;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v25 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<break time=['\"]([0-9]+)ms['\"]\\s*/>" options:0 error:0];
  v26 = objc_msgSend(v25, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = [*(id *)(*((void *)&v40 + 1) + 8 * j) rangeAtIndex:1];
        long long v34 = objc_msgSend(a1, "substringWithRange:", v32, v33);
        uint64_t v35 = [v34 integerValue];
        if (v35 <= 10) {
          uint64_t v36 = 10;
        }
        else {
          uint64_t v36 = v35;
        }
        v11 += v36;
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v29);
  }

  return (double)v11 * 0.001;
}

- (id)vs_insertContextInfo:()VSSpeechService
{
  unint64_t v2 = objc_msgSend(NSString, "vs_markerStringForContext:");
  unint64_t v3 = [v2 stringByAppendingString:a1];

  return v3;
}

- (id)vs_substituteAudioWithLocalPath
{
  uint64_t v2 = [a1 length];
  unint64_t v3 = [MEMORY[0x263F089D8] stringWithString:a1];
  uint64_t v4 = objc_msgSend(v3, "rangeOfString:options:range:", @"\x1B\\audio=", 0, 0, v2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = objc_msgSend(v3, "rangeOfString:options:range:", @"\\"", 0, v7 + v8, v9 + v2 - (v7 + v8));
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_2;
      }
      uint64_t v11 = v10;
      uint64_t v12 = v10 - v7;
      uint64_t v13 = objc_msgSend(v3, "substringWithRange:", v7 + v8, v10 - v7 - v8);
      if ([v13 hasPrefix:@"\""]
        && [v13 hasSuffix:@"\""]
        && (unint64_t)[v13 length] >= 2)
      {
        uint64_t v14 = objc_msgSend(v13, "substringWithRange:", 1, objc_msgSend(v13, "length") - 2);

        uint64_t v13 = (void *)v14;
      }
      if ([v13 hasPrefix:@"/"]) {
        break;
      }
      uint64_t v15 = [MEMORY[0x263F089D8] stringWithString:v13];
      [v15 insertString:@"/System/Library/PrivateFrameworks/VoiceServices.framework/TTSResources/Tones/" atIndex:0];
      if (([v13 hasSuffix:@".wav"] & 1) == 0) {
        [v15 appendString:@".wav"];
      }
      uint64_t v16 = [v15 lastPathComponent];
      char v17 = [v16 isEqualToString:@"AssistantEtiquette.wav"];

      if ((v17 & 1) == 0)
      {
        id v23 = v3;

        goto LABEL_17;
      }
      uint64_t v18 = [NSString stringWithFormat:@"\x1B\\audio=\"%@\"\\"", v15];
      objc_msgSend(v3, "replaceCharactersInRange:withString:", v7, v12 + 1, v18);

      uint64_t v19 = [v15 length];
      uint64_t v9 = v19 - [v13 length] + v11;

      uint64_t v20 = [v3 length];
      uint64_t v2 = v20 - v9;
      uint64_t v7 = objc_msgSend(v3, "rangeOfString:options:range:", @"\x1B\\audio=", 0, v9, v20 - v9);
      uint64_t v8 = v21;
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_2;
      }
    }
    id v22 = v3;
LABEL_17:

    goto LABEL_18;
  }
LABEL_2:
  id v6 = v3;
LABEL_18:

  return v3;
}

- (void)vs_textifyEmojiWithLanguage:()VSSpeechService
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v7 = (void (*)(id, uint64_t, id, void))getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr;
  uint64_t v16 = getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr;
  if (!getTTSSpeechTransformTextWithLanguageSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke;
    v12[3] = &unk_2640E8AE0;
    v12[4] = &v13;
    __getTTSSpeechTransformTextWithLanguageSymbolLoc_block_invoke(v12);
    uint64_t v7 = (void (*)(id, uint64_t, id, void))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    uint64_t v8 = v7(v5, 3, v6, 0);

    id v9 = v8;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *soft_TTSSpeechTransformTextWithLanguage(NSString *__strong, TTSSpeechTransformOptions, NSString * _Nullable __strong, NSMutableArray * _Nullable __strong)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"NSString+VSSpeechService.m", 18, @"%s", dlerror());

    __break(1u);
  }
}

+ (uint64_t)vs_isCJKCharacter:()VSSpeechService
{
  if (vs_isCJKCharacter__onceToken != -1) {
    dispatch_once(&vs_isCJKCharacter__onceToken, &__block_literal_global_920);
  }
  id v4 = (void *)vs_isCJKCharacter____CJKCharacterSet;
  return [v4 characterIsMember:a3];
}

+ (uint64_t)_vs_countPhoneticSyllables_xsampa:()VSSpeechService
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 1;
    do
    {
      int v8 = [v3 characterAtIndex:v6];
      if (v8 == 46 || v8 == 35) {
        ++v7;
      }
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (uint64_t)_vs_countPhoneticSyllables_lhp:()VSSpeechService
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 1;
    do
    {
      int v8 = [v3 characterAtIndex:v6];
      if (v8 == 95 || v8 == 46) {
        ++v7;
      }
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (__CFString)vs_markerStringForContext:()VSSpeechService
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = [MEMORY[0x263F089D8] string];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = NSString;
          uint64_t v13 = [v6 objectForKeyedSubscript:v11];
          uint64_t v14 = [v12 stringWithFormat:@"\x1B\\mrk=%@=%@\\"", v11, v13];
          [(__CFString *)v5 appendString:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v4 = v16;
  }
  else
  {
    uint64_t v5 = &stru_26C1B0528;
  }

  return v5;
}

@end