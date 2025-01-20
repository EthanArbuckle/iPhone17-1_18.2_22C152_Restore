@interface TIDPUnknownTokenWithContextRecorder
- (id)recordingKey;
- (id)records;
@end

@implementation TIDPUnknownTokenWithContextRecorder

- (id)records
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(TIDPRecorder *)self typingSessionAligned];
  v5 = [v4 alignedEntries];

  v6 = [(TIDPRecorder *)self typingSessionAligned];
  v7 = [v6 alignedEntries];
  v8 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_1898];

  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke_2;
  v15[3] = &unk_1E6E2AC38;
  id v16 = v9;
  id v17 = v5;
  id v18 = v3;
  id v10 = v3;
  id v11 = v5;
  id v12 = v9;
  [v8 enumerateIndexesUsingBlock:v15];
  v13 = (void *)[v10 copy];

  return v13;
}

uint64_t __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke_2(id *a1, unint64_t a2)
{
  id v4 = a1[4];
  if (a2)
  {
    v5 = [a1[5] objectAtIndexedSubscript:a2 - 1];
    v6 = [v5 originalWord];
    v7 = [v6 acceptedString];
    [v4 addObject:v7];
  }
  else
  {
    [a1[4] addObject:@"<s>"];
  }
  id v8 = a1[4];
  v9 = [a1[5] objectAtIndexedSubscript:a2];
  id v10 = [v9 originalWord];
  id v11 = [v10 acceptedString];
  [v8 addObject:v11];

  unint64_t v12 = [a1[5] count] - 1;
  id v13 = a1[4];
  if (v12 <= a2)
  {
    [a1[4] addObject:@"</s>"];
  }
  else
  {
    v14 = [a1[5] objectAtIndexedSubscript:a2 + 1];
    v15 = [v14 originalWord];
    id v16 = [v15 acceptedString];
    [v13 addObject:v16];
  }
  if ([a1[4] count])
  {
    unint64_t v17 = 0;
    do
    {
      id v18 = [a1[4] objectAtIndexedSubscript:v17];
      v19 = [NSNumber numberWithUnsignedInteger:++v17];
      v20 = +[TIDPWordRecord word:v18 atPosition:v19];

      [a1[6] addObject:v20];
    }
    while (v17 < [a1[4] count]);
  }
  id v21 = a1[4];

  return [v21 removeAllObjects];
}

uint64_t __46__TIDPUnknownTokenWithContextRecorder_records__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 originalWord];
  uint64_t v3 = [v2 isFromStaticLexicon] ^ 1;

  return v3;
}

- (id)recordingKey
{
  v2 = [(TIDPRecorder *)self recordingKeyLocaleSubstring];
  uint64_t v3 = [@"com.apple.TextInput.UnknownTokenWithContext." stringByAppendingString:v2];

  return v3;
}

@end