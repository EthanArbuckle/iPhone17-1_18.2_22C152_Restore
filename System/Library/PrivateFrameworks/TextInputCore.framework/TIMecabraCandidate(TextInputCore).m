@interface TIMecabraCandidate(TextInputCore)
+ (id)displayReadingFromMecabraCandidate:()TextInputCore syllableSeparator:;
+ (id)mecabraCandidateWithCandidateRef:()TextInputCore autoconvertedCandidates:;
+ (uint64_t)convertedInputFromMecabraCandidate:()TextInputCore;
+ (uint64_t)dictionaryReadingFromMecabraCandidate:()TextInputCore;
+ (uint64_t)inputFromMecabraCandidate:()TextInputCore;
- (uint64_t)initWithMecabraCandidate:()TextInputCore;
- (uint64_t)initWithMecabraCandidate:()TextInputCore cursorMovement:;
- (uint64_t)initWithMecabraCandidate:()TextInputCore input:;
- (uint64_t)initWithMecabraCandidate:()TextInputCore input:cursorMovement:;
@end

@implementation TIMecabraCandidate(TextInputCore)

- (uint64_t)initWithMecabraCandidate:()TextInputCore input:cursorMovement:
{
  id v8 = a4;
  v9 = MecabraCandidateGetSurface();
  if (!v8)
  {
    MecabraCandidateGetAnalysisString();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v11 = [a1 initWithCandidate:v9 forInput:v8 mecabraCandidatePointerValue:v10 withFlags:FlagsForCandidate() deleteCount:0 cursorMovement:a5];

  return v11;
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore cursorMovement:
{
  return [a1 initWithMecabraCandidate:a3 input:0 cursorMovement:a4];
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore input:
{
  return [a1 initWithMecabraCandidate:a3 input:a4 cursorMovement:0];
}

- (uint64_t)initWithMecabraCandidate:()TextInputCore
{
  return [a1 initWithMecabraCandidate:a3 cursorMovement:0];
}

+ (id)mecabraCandidateWithCandidateRef:()TextInputCore autoconvertedCandidates:
{
  id v5 = a4;
  if (v5) {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FAE298]) initWithMecabraCandidate:a3 autoconvertedCandidates:v5];
  }
  else {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FAE3B8]) initWithMecabraCandidate:a3];
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)displayReadingFromMecabraCandidate:()TextInputCore syllableSeparator:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    if (MecabraCandidateGetType() == 7)
    {
      v7 = MecabraCandidateGetSurface();
LABEL_22:
      v24 = &stru_1F3F7A998;
      goto LABEL_38;
    }
    v9 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
    v7 = (void *)[(id)MecabraCandidateGetAnalysisString() copy];
    if (![v9 count])
    {

      goto LABEL_22;
    }
    v10 = [a1 convertedInputFromMecabraCandidate:a3];
    uint64_t v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v10, "length") + (objc_msgSend(v9, "count") - 1) * objc_msgSend(v6, "length"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v9;
      uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        unint64_t v15 = 0;
        uint64_t v16 = *(void *)v40;
        v36 = v9;
        v37 = v7;
        while (2)
        {
          uint64_t v17 = 0;
          unint64_t v18 = v15;
          do
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
            if ([v12 length]) {
              [v12 appendString:v6];
            }
            unint64_t v20 = [v19 unsignedIntegerValue];
            unint64_t v21 = [v11 length];
            unint64_t v15 = v20 + v18;
            if (v20 > v21 || v15 > v21)
            {

              v9 = v36;
              v7 = v37;
              goto LABEL_28;
            }
            v23 = objc_msgSend(v11, "substringWithRange:", v18, v20);
            [v12 appendString:v23];

            ++v17;
            unint64_t v18 = v15;
          }
          while (v14 != v17);
          uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
          v9 = v36;
          v7 = v37;
          if (v14) {
            continue;
          }
          break;
        }
      }
      else
      {
        unint64_t v15 = 0;
      }

      if (v15 == [v11 length])
      {
        v25 = v12;
      }
      else
      {
LABEL_28:
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel)
        {
          v26 = TIOSLogFacility();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v28 = v7;
            v29 = NSString;
            v30 = [obj valueForKey:@"stringValue"];
            [v30 componentsJoinedByString:@", "];
            v32 = v31 = v9;
            uint64_t Surface = MecabraCandidateGetSurface();
            v33 = v29;
            v7 = v28;
            v34 = [v33 stringWithFormat:@"%s Invalid syllable lengths { %@ } for '%@'/'%@'", "+[TIMecabraCandidate(TextInputCore) displayReadingFromMecabraCandidate:syllableSeparator:]", v32, Surface, v11];
            *(_DWORD *)buf = 138412290;
            v44 = v34;
            _os_log_debug_impl(&dword_1E3F0E000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            v9 = v31;
          }
        }
        v25 = v11;
      }
      id v8 = (__CFString *)[v25 copy];
    }
    else
    {
      id v8 = &stru_1F3F7A998;
    }
  }
  else
  {
    id v8 = &stru_1F3F7A998;
  }
  v24 = v8;
  v7 = v24;
LABEL_38:

  return v7;
}

+ (uint64_t)dictionaryReadingFromMecabraCandidate:()TextInputCore
{
  return MecabraCandidateGetDictionaryReading();
}

+ (uint64_t)convertedInputFromMecabraCandidate:()TextInputCore
{
  return MEMORY[0x1F4180AE8](a3);
}

+ (uint64_t)inputFromMecabraCandidate:()TextInputCore
{
  return MecabraCandidateGetAnalysisString();
}

@end