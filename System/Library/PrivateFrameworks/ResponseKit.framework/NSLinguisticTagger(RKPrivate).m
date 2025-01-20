@interface NSLinguisticTagger(RKPrivate)
- (BOOL)containsAsianCharacters;
- (__CFString)languageOfRange:()RKPrivate withAdditionalContext:withPreferredLanguages:;
@end

@implementation NSLinguisticTagger(RKPrivate)

- (BOOL)containsAsianCharacters
{
  v2 = [a1 string];
  uint64_t v3 = [v2 length];

  if (!v3) {
    return 0;
  }
  v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[⺀-鿿]" options:1 error:0];
  v5 = [a1 string];
  v6 = [a1 string];
  v7 = objc_msgSend(v4, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v6, "length"));
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (__CFString)languageOfRange:()RKPrivate withAdditionalContext:withPreferredLanguages:
{
  id v10 = a5;
  id v53 = a6;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__5;
  v72 = __Block_byref_object_dispose__5;
  id v73 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke;
  block[3] = &unk_2642D2068;
  block[4] = &v68;
  if (languageOfRange_withAdditionalContext_withPreferredLanguages__onceDataDetectorToken != -1) {
    dispatch_once(&languageOfRange_withAdditionalContext_withPreferredLanguages__onceDataDetectorToken, block);
  }
  if (languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector)
  {
    if (!v69[5])
    {
      v11 = [a1 string];
      uint64_t v12 = [v11 length];

      v13 = (void *)languageOfRange_withAdditionalContext_withPreferredLanguages__dataDetector;
      v14 = [a1 string];
      uint64_t v15 = objc_msgSend(v13, "rangeOfFirstMatchInString:options:range:", v14, 0, 0, v12);
      uint64_t v17 = v16;

      if (!v15 && v12 == v17)
      {
        v18 = @"und";
        goto LABEL_36;
      }
    }
  }
  v19 = +[RKUtilities getDeviceModel];
  if (+[RKUtilities isDeviceSupportedForLSTMBasedLanguageIdentification:v19])
  {
    unint64_t v20 = 15;
  }
  else
  {
    unint64_t v20 = 25;
  }
  v21 = [a1 string];
  unint64_t v22 = [v21 length];

  if (v22 > 0x18) {
    goto LABEL_15;
  }
  v23 = [a1 string];
  v24 = [@" " stringByAppendingString:v10];
  v25 = [v23 stringByAppendingString:v24];

  [a1 setString:v25];
  if ([a1 containsAsianCharacters])
  {
    v26 = [a1 string];
    unint64_t v27 = [v26 length];

    if (v27 >= 5)
    {
LABEL_14:

LABEL_15:
      uint64_t v28 = objc_msgSend(a1, "tagsInRange:scheme:options:tokenRanges:", a3, a4, *MEMORY[0x263F082A8], 6, 0);
      v29 = (void *)[objc_alloc(MEMORY[0x263F08760]) initWithArray:v28];
      v30 = [v29 allObjects];
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_2;
      v65[3] = &unk_2642D2BB8;
      id v31 = v29;
      id v66 = v31;
      v32 = [v30 sortedArrayUsingComparator:v65];
      v33 = (void *)[v32 mutableCopy];

      if ((unint64_t)[v33 count] >= 2) {
        [v33 removeObject:&stru_26C8AEFC8];
      }
      if ((unint64_t)[v33 count] >= 2) {
        [v33 removeObject:@"und"];
      }
      v51 = (void *)v28;
      id v52 = v10;
      if ([v33 count]
        && ([v33 objectAtIndexedSubscript:0],
            v34 = objc_claimAutoreleasedReturnValue(),
            char v35 = [v34 isEqualToString:&stru_26C8AEFC8],
            v34,
            (v35 & 1) == 0))
      {
        v25 = [v33 objectAtIndexedSubscript:0];
      }
      else
      {
        v25 = 0;
      }
      v38 = v19;
      v39 = [MEMORY[0x263EFF9A0] dictionary];
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x2020000000;
      v64[3] = 0;
      v40 = [a1 string];
      uint64_t v41 = [v40 length];
      uint64_t v42 = *MEMORY[0x263F082B8];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_3;
      v61[3] = &unk_2642D2BE0;
      v61[4] = a1;
      id v43 = v39;
      id v62 = v43;
      v63 = v64;
      objc_msgSend(a1, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v41, v42, 4, v61);

      [v43 removeObjectForKey:@"und"];
      uint64_t v55 = 0;
      v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__5;
      v59 = __Block_byref_object_dispose__5;
      id v60 = 0;
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __94__NSLinguisticTagger_RKPrivate__languageOfRange_withAdditionalContext_withPreferredLanguages___block_invoke_4;
      v54[3] = &unk_2642D2C08;
      v54[4] = v64;
      v54[5] = &v55;
      [v43 enumerateKeysAndObjectsUsingBlock:v54];
      v44 = (void *)v56[5];
      if (v44)
      {
        id v45 = v44;

        v25 = v45;
      }
      v46 = [a1 string];
      v47 = +[RKUtilities removeEmoji:v46];

      v48 = +[RKUtilities stripPunctuations:v47];

      v49 = +[RKUtilities removeMultipleWhitespaces:v48];

      if ([v53 indexOfObject:v25] == 0x7FFFFFFFFFFFFFFFLL
        || (([v25 isEqualToString:@"zh-Hans"] & 1) != 0
         || ([v25 isEqualToString:@"zh-Hant"] & 1) != 0
         || [v25 isEqualToString:@"ja"])
        && (unint64_t)[v49 length] < 5)
      {
        v18 = @"und";
      }
      else
      {
        v18 = v25;
      }

      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(v64, 8);

      id v10 = v52;
      v19 = v38;
      goto LABEL_35;
    }
  }
  else
  {
    v36 = [a1 string];
    unint64_t v37 = [v36 length];

    if (v37 >= v20) {
      goto LABEL_14;
    }
  }
  v18 = @"und";
LABEL_35:

LABEL_36:
  _Block_object_dispose(&v68, 8);

  return v18;
}

@end