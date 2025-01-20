@interface PPTUniversalCompletionProvider
- (id)_generateResultsForString:(id)a3;
- (id)_generateSingleResult;
- (void)setQueryToComplete:(id)a3;
@end

@implementation PPTUniversalCompletionProvider

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  v5 = [v4 queryString];
  char v6 = [v5 isEqualToString:self->querySimulated];

  if ((v6 & 1) == 0)
  {
    v7 = [v4 queryString];
    v8 = (NSString *)[v7 copy];
    querySimulated = self->querySimulated;
    self->querySimulated = v8;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__PPTUniversalCompletionProvider_setQueryToComplete___block_invoke;
    v12[3] = &unk_1E6D7C010;
    v12[4] = self;
    v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v12 block:0.1];
    networkDelaySimulatorTimer = self->networkDelaySimulatorTimer;
    self->networkDelaySimulatorTimer = v10;
  }
}

void __53__PPTUniversalCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 _generateResultsForString:v2[17]];
  [v2 setCompletions:v3 forString:*(void *)(*(void *)(a1 + 32) + 136)];
}

- (id)_generateResultsForString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 length])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(PPTUniversalCompletionProvider *)self _generateSingleResult];
      [v5 addObject:v7];

      ++v6;
    }
    while (v6 < [v4 length]);
  }

  return v5;
}

- (id)_generateSingleResult
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
  [v2 setPlacement:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4F9A4C0]);
  [v3 setText:@"This is a test title"];
  [v3 setMaxLines:2];
  [v2 setTitle:v3];
  [v2 setSectionHeader:@"Test Header"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F9A378]);
  [v4 setText:@"This is a test"];
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 setDescriptions:v5];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->querySimulated, 0);
  objc_storeStrong((id *)&self->networkDelaySimulatorTimer, 0);
}

@end