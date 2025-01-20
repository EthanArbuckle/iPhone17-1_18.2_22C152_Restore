@interface TISupplementalPhraseItem(TextInputCore)
- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:;
- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:;
- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore;
- (void)core_appendEntitiesToArray:()TextInputCore;
@end

@implementation TISupplementalPhraseItem(TextInputCore)

- (id)core_nameReadingPairsWithGenerationMode:()TextInputCore mecabraEnvironment:
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v9 = [a1 phoneticTitle];
  v10 = [a1 title];
  v11 = TIGenerateReading(v9, v10, a3, v7);

  v12 = [a1 title];
  v13 = +[TINameReadingPair nameReadingPairWithName:v12 reading:v11];

  [v8 addObject:v13];

  return v8;
}

- (id)core_nonPhoneticRangesInString:()TextInputCore options:locale:
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 title];
  v11 = rangesOfStringInString(v10, v9, a4, v8);

  return v11;
}

- (uint64_t)core_isEqualToMecabraCandidate:()TextInputCore
{
  id v6 = a3;
  id v7 = [v6 input];
  uint64_t v8 = [v7 length];
  if (v8)
  {
    v3 = [a1 phoneticTitle];
    v4 = [v6 input];
    if ([v3 isEqualToString:v4])
    {
      uint64_t v9 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = [v6 candidate];
  if ([v10 length])
  {
    v11 = [a1 title];
    v12 = [v6 candidate];
    uint64_t v9 = [v11 isEqualToString:v12];
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (v8) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (void)core_appendEntitiesToArray:()TextInputCore
{
  id v12 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F6F4C8]);
  v5 = [a1 title];
  id v6 = objc_msgSend(v4, "initWithName:data:", v5, objc_msgSend(a1, "identifier"));
  [v12 addObject:v6];

  id v7 = [a1 phoneticTitle];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6F4C8]);
    v10 = [a1 phoneticTitle];
    v11 = objc_msgSend(v9, "initWithName:data:", v10, objc_msgSend(a1, "identifier"));
    [v12 addObject:v11];
  }
}

@end