@interface TUIMathCompletionGenerator
- (BOOL)enabled;
- (BOOL)endsWithExpressionTriggerCharacter:(id)a3;
- (BOOL)textBeginsWithPrediction:(id)a3 prediction:(id)a4;
- (TUIMathCompletionGenerator)init;
- (id)expressionMatchForLocation:(int64_t)a3 inTextStorage:(id)a4;
- (id)expressionMatches:(id)a3 range:(_NSRange)a4;
- (id)normalizeExpressionString:(id)a3;
- (int64_t)candidateSourceType;
- (int64_t)generatedCandidateType;
- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)syncToKeyboardState:(id)a3;
@end

@implementation TUIMathCompletionGenerator

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (int64_t)candidateSourceType
{
  return 1;
}

- (int64_t)generatedCandidateType
{
  return 3;
}

- (id)expressionMatchForLocation:(int64_t)a3 inTextStorage:(id)a4
{
  id v6 = a4;
  objc_msgSend(v6, "getLineStart:end:contentsEnd:forRange:", 0, 0, 0, 0, 0);
  v7 = -[TUIMathCompletionGenerator expressionMatches:range:](self, "expressionMatches:range:", v6, 0, a3);

  v8 = [v7 lastObject];
  uint64_t v9 = [v8 range];
  id v10 = 0;
  if (v9 + v11 == a3) {
    id v10 = v8;
  }

  return v10;
}

- (id)expressionMatches:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F56918];
  uint64_t v13 = *MEMORY[0x1E4F56910];
  v7 = (void *)MEMORY[0x1E4F29238];
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v7, "valueWithRange:", location, length);
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [v6 scan:v8 options:v10];

  return v11;
}

- (id)normalizeExpressionString:(id)a3
{
  id v4 = a3;
  if (-[TUIMathCompletionGenerator endsWithExpressionTriggerCharacter:](self, "endsWithExpressionTriggerCharacter:", v4)&& [v4 length])
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)endsWithExpressionTriggerCharacter:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_1EDC79BC0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_1EDC79BC0);
        }
        if ([v3 hasSuffix:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [&unk_1EDC79BC0 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)textBeginsWithPrediction:(id)a3 prediction:(id)a4
{
  return [a3 hasPrefix:a4];
}

- (void)syncToKeyboardState:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 textInputTraits];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = v12;
  if (v5)
  {
    v7 = [v12 textInputTraits];
    uint64_t v8 = [v7 mathExpressionCompletionType];

    if (v8 == 1)
    {
      uint64_t v9 = 0;
    }
    else
    {
      long long v10 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
      long long v11 = [v10 valueForPreferenceKey:*MEMORY[0x1E4FAE8C8]];
      uint64_t v9 = [v11 BOOLValue];
    }
    [(TUIMathCompletionGenerator *)self setEnabled:v9];
    uint64_t v6 = v12;
  }
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v8 = [v6 documentState];
  uint64_t v9 = [v8 contextBeforeInput];

  long long v10 = [v6 documentState];
  long long v11 = [v10 contextAfterInput];

  if (![(TUIMathCompletionGenerator *)self endsWithExpressionTriggerCharacter:v9])goto LABEL_7; {
  id v12 = -[TUIMathCompletionGenerator expressionMatchForLocation:inTextStorage:](self, "expressionMatchForLocation:inTextStorage:", [v9 length], v9);
  }
  long long v13 = v12;
  if (!v12)
  {
LABEL_6:

LABEL_7:
    v7[2](v7, 0);
    goto LABEL_8;
  }
  uint64_t v14 = [v12 range];
  v16 = objc_msgSend(v9, "substringWithRange:", v14, v15);
  v17 = [(TUIMathCompletionGenerator *)self normalizeExpressionString:v16];
  if (![v17 length])
  {

    goto LABEL_6;
  }
  v23 = (void *)MEMORY[0x1E4F56918];
  v31[0] = *MEMORY[0x1E4F568C8];
  v24 = [NSNumber numberWithBool:1];
  v32[0] = v24;
  v31[1] = *MEMORY[0x1E4F568B8];
  v22 = [NSNumber numberWithBool:1];
  v32[1] = v22;
  v31[2] = @"CalculateKeyAllowCurrencyConversions";
  v18 = [NSNumber numberWithBool:0];
  v32[2] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__TUIMathCompletionGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
  v25[3] = &unk_1E5593B98;
  v30 = v7;
  id v26 = v11;
  id v27 = v16;
  v28 = self;
  id v29 = v6;
  id v20 = v16;
  id v21 = (id)[v23 evaluate:v17 options:v19 resultHandler:v25];

LABEL_8:
}

void __76__TUIMathCompletionGenerator_generateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && ![v5 isTrivial])
  {
    v7 = [v5 formattedResult];
    uint64_t v8 = [*(id *)(a1 + 32) length];
    uint64_t v9 = (void *)MEMORY[0x1E4FAE318];
    if (v8)
    {
      long long v10 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:*(void *)(a1 + 40)];
      long long v11 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v7 forInput:&stru_1EDC653C0];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v10 alternateCorrections:0];
      long long v13 = *(void **)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [v5 formattedResult];
      LODWORD(v14) = [v13 textBeginsWithPrediction:v14 prediction:v15];

      v16 = (void *)MEMORY[0x1E4FAE278];
      if (v14)
      {
        v17 = [MEMORY[0x1E4FAE278] listWithCorrections:v12 predictions:0 emojiList:0 inlineCompletions:0];
LABEL_13:

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_14;
      }
      v30[0] = v11;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      v23 = v16;
      v24 = v12;
      v25 = v21;
      id v26 = 0;
    }
    else
    {
      v18 = [NSString stringWithFormat:@"%@%@", *(void *)(a1 + 40), v7];
      long long v10 = [v9 candidateWithCandidate:v18 forInput:*(void *)(a1 + 40) property:1];

      long long v11 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v7 forInput:*(void *)(a1 + 40)];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v10 alternateCorrections:0];
      int v19 = [*(id *)(a1 + 56) inlineCompletionEnabled];
      id v20 = (void *)MEMORY[0x1E4FAE278];
      if (v19)
      {
        id v29 = v11;
        id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        v28 = v10;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        v17 = [v20 listWithCorrections:v12 predictions:0 emojiList:v21 inlineCompletions:v22];

LABEL_12:
        goto LABEL_13;
      }
      id v27 = v11;
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      v23 = v20;
      v24 = v12;
      v25 = 0;
      id v26 = v21;
    }
    v17 = [v23 listWithCorrections:v24 predictions:v25 emojiList:v26 inlineCompletions:0];
    goto LABEL_12;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_14:
}

- (TUIMathCompletionGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUIMathCompletionGenerator;
  return [(TUIMathCompletionGenerator *)&v3 init];
}

@end