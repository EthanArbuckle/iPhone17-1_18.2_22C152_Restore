@interface CACCorrectionUtilities
+ (id)_spellingGuessesForString:(id)a3 languageIdentifier:(id)a4;
+ (id)alternativesForString:(id)a3 languageIdentifier:(id)a4;
+ (id)emojiSuggestionsForString:(id)a3;
@end

@implementation CACCorrectionUtilities

+ (id)alternativesForString:(id)a3 languageIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 array];
  v10 = [a1 _spellingGuessesForString:v8 languageIdentifier:v7];

  [v9 addObjectsFromArray:v10];
  v11 = [v8 localizedUppercaseString];
  LOBYTE(v6) = [v11 isEqualToString:v8];

  if ((v6 & 1) == 0) {
    [v9 addObject:v11];
  }

  return v9;
}

+ (id)_spellingGuessesForString:(id)a3 languageIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  if (_os_feature_enabled_impl())
  {
    id v8 = +[CACSpeechSystem speechSystem];
    [v8 recognitionSystemRef];
    uint64_t v9 = RXRecognitionSystemCopyPhoneticNeighborsForText();

    id v7 = (void *)v9;
  }
  if (![v7 count])
  {
    v10 = objc_opt_new();
    v11 = objc_msgSend(v10, "guessesForWordRange:inString:language:", 0, objc_msgSend(v5, "length"), v5, v6);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          [v7 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  if (![v7 count])
  {
    v16 = +[CACEmojiManager sharedManager];
    v17 = [v16 stringByReplacingEmojisWithDescriptions:v5];

    if ([v17 length]) {
      [v7 addObject:v17];
    }
  }
  return v7;
}

+ (id)emojiSuggestionsForString:(id)a3
{
  id v3 = a3;
  v4 = +[CACEmojiManager sharedManager];
  id v5 = [v4 stringByReplacingEmojisWithDescriptions:v3];

  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = +[CACEmojiManager sharedManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CACCorrectionUtilities_emojiSuggestionsForString___block_invoke;
  v10[3] = &unk_264D12D60;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateEmojisInText:v5 skinToneFilter:1 usingBlock:v10];

  return v8;
}

uint64_t __52__CACCorrectionUtilities_emojiSuggestionsForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

@end