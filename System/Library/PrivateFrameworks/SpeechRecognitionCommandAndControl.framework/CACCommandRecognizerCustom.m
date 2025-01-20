@interface CACCommandRecognizerCustom
+ (id)customCommandRecognizers;
- (void)_buildLanguageModelUsingCommands;
@end

@implementation CACCommandRecognizerCustom

+ (id)customCommandRecognizers
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v27 = (id)objc_opt_new();
  v2 = objc_opt_new();
  +[CACPreferences sharedPreferences];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = long long v35 = 0u;
  v3 = [v26 enabledCommandIdentifiersForCommandSetIdentifier:@"Custom"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [[CACSpokenCommandCustom alloc] initWithCommandIdentifier:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        v9 = v8;
        if (v8)
        {
          v10 = [(CACSpokenCommand *)v8 strings];

          if (v10)
          {
            v11 = [(CACSpokenCommand *)v9 contextEvaluation];
            v12 = +[CACSpokenCommand stringFromContextEvaluationDictionary:v11 isCustom:1];

            v13 = [v2 objectForKey:v12];
            if (!v13)
            {
              v13 = objc_opt_new();
              [v2 setObject:v13 forKey:v12];
            }
            [v13 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v5);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v2;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        v20 = [v14 objectForKey:v19];
        v21 = [CACCommandRecognizerCustom alloc];
        v22 = [v20 firstObject];
        v23 = [v22 contextEvaluation];
        v24 = [(CACCommandRecognizer *)v21 initWithCommands:v20 contextEvaluators:v23 builtInLMIdentifiers:0];

        [(CACCommandRecognizer *)v24 setType:v19];
        [v27 addObject:v24];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  return v27;
}

- (void)_buildLanguageModelUsingCommands
{
  v4.receiver = self;
  v4.super_class = (Class)CACCommandRecognizerCustom;
  [(CACCommandRecognizer *)&v4 _buildLanguageModelUsingCommands];
  v3 = [(CACSpeechRecognizer *)self->super._speechRecognizer languageModel];
  [v3 setObject:*MEMORY[0x263EFFB40] forAttribute:kCACLanguageModelAttributeCustomCommands];
}

@end