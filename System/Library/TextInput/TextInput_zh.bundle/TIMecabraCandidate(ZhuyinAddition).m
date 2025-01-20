@interface TIMecabraCandidate(ZhuyinAddition)
- (BOOL)containPunctuationOnly;
- (uint64_t)hasUnsupportedReading;
- (void)hasUnsupportedReading;
@end

@implementation TIMecabraCandidate(ZhuyinAddition)

- (uint64_t)hasUnsupportedReading
{
  v2 = [a1 mecabraCandidatePointerValue];
  [v2 unsignedLongLongValue];

  v3 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
  if ([v3 count])
  {
    v4 = MecabraCandidateGetDictionaryReading();
    if (v4)
    {
      v5 = [a1 input];
      int v6 = [v5 isEqualToString:v4];

      if (!v6)
      {
LABEL_9:
        uint64_t v13 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    v7 = [a1 candidate];
    v8 = [MEMORY[0x263F08708] zhuyinCharacterSet];
    uint64_t v9 = [v7 rangeOfCharacterFromSet:v8];
    uint64_t v11 = v10;

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (TICanLogMessageAtLevel())
      {
        v12 = TIOSLogFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          [(TIMecabraCandidate(ZhuyinAddition) *)a1 hasUnsupportedReading];
        }
      }
      goto LABEL_9;
    }
LABEL_13:
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = 0;
  if (TICanLogMessageAtLevel())
  {
    v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[TIMecabraCandidate(ZhuyinAddition) hasUnsupportedReading](v4);
    }
    goto LABEL_13;
  }
LABEL_15:

  return v13;
}

- (BOOL)containPunctuationOnly
{
  v2 = [MEMORY[0x263F08708] punctuationCharacterSet];
  v3 = [v2 invertedSet];

  v4 = [a1 input];
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v3))
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = [a1 candidate];
    BOOL v5 = !TIStringContainsCharacterFromSet(v6, (uint64_t)v3);
  }
  return v5;
}

- (void)hasUnsupportedReading
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8 = NSString;
  uint64_t v9 = [a1 candidate];
  uint64_t v10 = objc_msgSend(v9, "substringWithRange:", a2, a3);
  uint64_t v11 = [a1 input];
  v12 = [a1 candidate];
  uint64_t v13 = [v8 stringWithFormat:@"%s Due to incorrect segmentation on reading '%@', '%@' becomes '%@'", "-[TIMecabraCandidate(ZhuyinAddition) hasUnsupportedReading]", v10, v11, v12];
  *(_DWORD *)buf = 138412290;
  v15 = v13;
  _os_log_debug_impl(&dword_241E5B000, a4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

@end