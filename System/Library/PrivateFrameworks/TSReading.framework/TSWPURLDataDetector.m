@interface TSWPURLDataDetector
+ (_NSRange)calculateScanRangeForString:(id)a3 changedRange:(_NSRange)a4;
+ (_NSRange)expandValidRange:(_NSRange)a3 inString:(id)a4;
+ (id)detectorIdentifier;
+ (id)newArrayByScanningString:(id)a3 scanRange:(_NSRange)a4;
+ (id)newURLFromString:(id)a3;
+ (id)scanString:(id)a3 scanRange:(_NSRange)a4;
+ (void)initURLCharacterSets;
+ (void)setInvalidURLSchemes:(id)a3;
@end

@implementation TSWPURLDataDetector

+ (void)setInvalidURLSchemes:(id)a3
{
  gInvalidSchemes = (uint64_t)a3;
}

+ (id)detectorIdentifier
{
  return (id)kURLDataDetectorType;
}

+ (void)initURLCharacterSets
{
  if (!sValidURLCharacters)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
    objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "alphanumericCharacterSet"));
    [v2 addCharactersInString:@";/?:@=&"];
    [v2 addCharactersInString:@"$-_.+!*'(),"];
    [v2 addCharactersInString:@"%~"];
    [v2 addCharactersInString:@"#"];
    sValidURLCharacters = [v2 copy];
    sInvalidURLCharacters = (uint64_t)(id)[(id)sValidURLCharacters invertedSet];
  }
}

+ (_NSRange)expandValidRange:(_NSRange)a3 inString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(id)objc_opt_class() initURLCharacterSets];
  v7.NSUInteger location = objc_msgSend(a4, "rangeOfCharacterFromSet:options:range:", sInvalidURLCharacters, 6, 0, location);
  if (v7.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7.NSUInteger location = 0;
    v7.NSUInteger length = location;
  }
  v8.NSUInteger location = location;
  v8.NSUInteger length = length;

  NSRange v11 = NSUnionRange(v7, v8);
  NSUInteger v10 = v11.length;
  NSUInteger v9 = v11.location;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

+ (_NSRange)calculateScanRangeForString:(id)a3 changedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ((unint64_t)[a3 length] >= 3)
  {
    NSUInteger location = objc_msgSend((id)objc_opt_class(), "expandValidRange:inString:", location, length, a3);
    NSUInteger length = v7;
  }
  for (; length; --length)
  {
    uint64_t v8 = [a3 characterAtIndex:location];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v8) & 1) == 0&& (IsParagraphBreakingCharacter(v8) & 1) == 0&& !IsSpecialCharacter(v8))
    {
      break;
    }
    ++location;
  }
  NSUInteger v9 = location;
  NSUInteger v10 = length;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

+ (id)scanString:(id)a3 scanRange:(_NSRange)a4
{
  v4 = objc_msgSend(a1, "newArrayByScanningString:scanRange:", a3, a4.location, a4.length);

  return v4;
}

+ (id)newArrayByScanningString:(id)a3 scanRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v43 = *MEMORY[0x263EF8340];
  NSUInteger v7 = [a3 length];
  uint64_t v8 = 0;
  if (v7 >= 3 && length >= 3)
  {
    v44.NSUInteger length = v7;
    v44.NSUInteger location = 0;
    v46.NSUInteger location = location;
    v46.NSUInteger length = length;
    uint64_t v39 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08770], "dataDetectorWithTypes:error:", 32, &v39), "matchesInString:options:range:", a3, 0, NSIntersectionRange(v44, v46).location, v44.length);
    uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      NSUInteger v11 = 0;
      NSUInteger v12 = 0;
      uint64_t v8 = 0;
      uint64_t v13 = *(void *)v36;
      uint64_t v32 = *(void *)v36;
      while (1)
      {
        uint64_t v14 = 0;
        uint64_t v33 = v10;
        do
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
          NSUInteger v16 = [v15 range];
          NSUInteger v18 = v17;
          uint64_t v19 = [v15 URL];
          if (v19)
          {
            if (v11 > v16 || v12 + v11 < v16 + v18)
            {
              v21 = (void *)v19;
              uint64_t v22 = [v8 count];
              if (v22)
              {
                unint64_t v23 = v22;
                uint64_t v24 = 0;
                unsigned int v25 = 1;
                while (1)
                {
                  v26 = (void *)[v8 objectAtIndexedSubscript:v24];
                  v45.NSUInteger location = objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", kTSWPDataDetectorRangeKey), "rangeValue");
                  NSUInteger v27 = v45.length;
                  v47.NSUInteger location = v16;
                  v47.NSUInteger length = v18;
                  if (NSIntersectionRange(v45, v47).length) {
                    break;
                  }
                  uint64_t v24 = v25;
                  if (v23 <= v25++) {
                    goto LABEL_20;
                  }
                }
                if (v27 >= v18)
                {
LABEL_26:
                  NSUInteger v11 = v16;
                  NSUInteger v12 = v18;
                  uint64_t v13 = v32;
                  uint64_t v10 = v33;
                  goto LABEL_27;
                }
                [v8 removeObjectAtIndex:v24];
              }
LABEL_20:
              uint64_t v29 = objc_msgSend((id)objc_msgSend(v21, "scheme"), "lowercaseString");
              if (!v29) {
                goto LABEL_26;
              }
              uint64_t v13 = v32;
              uint64_t v10 = v33;
              if (![(id)gInvalidSchemes member:v29])
              {
                v30 = objc_msgSend((id)objc_opt_class(), "newURLFromString:", objc_msgSend(v21, "absoluteString"));
                if (!v8) {
                  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
                }
                v40[0] = kTSWPDataDetectorRangeKey;
                v41[0] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v16, v18);
                v41[1] = v30;
                v40[1] = kTSWPDataDetectorValueKey;
                v40[2] = kTSWPDataDetectorTypeKey;
                v41[2] = kURLDataDetectorType;
                objc_msgSend(v8, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 3));
              }
              NSUInteger v11 = v16;
              NSUInteger v12 = v18;
            }
          }
LABEL_27:
          ++v14;
        }
        while (v14 != v10);
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
        if (!v10) {
          goto LABEL_31;
        }
      }
    }
    uint64_t v8 = 0;
  }
LABEL_31:
  [v8 sortUsingFunction:compareHyperlinkRangeValues context:0];
  return v8;
}

+ (id)newURLFromString:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (![a3 compare:@"file://", 1, 0, objc_msgSend(@"file://", "length") options range])
  {
    NSUInteger v12 = (__CFString *)[a3 substringFromIndex:objc_msgSend(@"file://", "length")];
    if (v12)
    {
      uint64_t v13 = v12;
      if ([(__CFString *)v12 length])
      {
        uint64_t v14 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v13, &stru_26D688A48);
        if (v14)
        {
          v15 = v14;
          NSUInteger v16 = (void *)[(__CFString *)v14 stringByExpandingTildeInPath];
          CFRelease(v15);
          if (!v16) {
            goto LABEL_21;
          }
        }
        else
        {
          NSUInteger v16 = (void *)[(__CFString *)v13 stringByExpandingTildeInPath];
          if (!v16) {
            goto LABEL_21;
          }
        }
        [v16 length];
      }
    }
LABEL_21:
    JUMPOUT(0x223CB7200);
  }
  v4 = (void *)[objc_alloc(NSURL) initWithString:a3];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[v4 scheme];
    if (v6)
    {
      NSUInteger v7 = v6;
      uint64_t v8 = (__CFString *)[v6 lowercaseString];
      if ([v7 isEqual:v8]) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v8;
      }
      if ([(__CFString *)v8 isEqualToString:@"feed"]) {
        uint64_t v9 = @"http";
      }
      if (v9)
      {
        uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v9, objc_msgSend(a3, "substringFromIndex:", objc_msgSend(v7, "length"))];

        v5 = (void *)[objc_alloc(NSURL) initWithString:v10];
      }
    }
  }
  return v5;
}

@end