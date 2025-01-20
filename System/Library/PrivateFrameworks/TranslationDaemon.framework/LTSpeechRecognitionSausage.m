@interface LTSpeechRecognitionSausage
@end

@implementation LTSpeechRecognitionSausage

id __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F089D8] string];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "confidence", (void)v21);
        double v13 = v12;
        unint64_t v14 = [v5 count];
        if ([v11 hasSpaceBefore]) {
          [v4 appendString:@" "];
        }
        v15 = [v11 tokenName];
        [v4 appendString:v15];

        if ([v11 hasSpaceAfter]) {
          [v4 appendString:@" "];
        }
        double v9 = v9 + v13 / (double)v14;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v17 = [v4 stringByTrimmingCharactersInSet:v16];

  id v18 = objc_alloc_init(MEMORY[0x263F1C140]);
  [v18 setText:v17];
  [v18 setConfidence:(uint64_t)v9];
  [v18 setLowConfidence:v9 < (double)*(uint64_t *)(a1 + 32)];
  v19 = [v5 lastObject];
  objc_msgSend(v18, "setHasSpaceAfter:", objc_msgSend(v19, "hasSpaceAfter"));

  return v18;
}

id __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 alternatives];
  id v3 = [v2 valueForKey:@"confidence"];

  v4 = NSString;
  id v5 = [v3 componentsJoinedByString:@","];
  uint64_t v6 = [v4 stringWithFormat:@"(%@)", v5];

  return v6;
}

id __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F089D8] string];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [v2 tokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v11 = [v10 confidence];
        double v12 = [v2 tokens];
        unint64_t v13 = [v12 count];

        unint64_t v14 = objc_msgSend(v10, "token_text");
        [v3 appendString:v14];

        if (objc_msgSend(v10, "add_space_after")) {
          [v3 appendString:@" "];
        }
        double v8 = v8 + (double)(v11 / v13);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v16 = [v3 stringByTrimmingCharactersInSet:v15];

  id v17 = objc_alloc_init(MEMORY[0x263F1C140]);
  [v17 setText:v16];
  [v17 setConfidence:(uint64_t)v8];
  [v17 setLowConfidence:v8 < (double)_LTPreferencesServerASRWordLevelConfidenceThreshold(*(void **)(a1 + 32))];
  id v18 = [v2 tokens];
  v19 = [v18 lastObject];
  objc_msgSend(v17, "setHasSpaceAfter:", objc_msgSend(v19, "add_space_after"));

  return v17;
}

id __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 alternatives];
  id v3 = [v2 valueForKey:@"confidence"];

  v4 = NSString;
  uint64_t v5 = [v3 componentsJoinedByString:@","];
  uint64_t v6 = [v4 stringWithFormat:@"(%@)", v5];

  return v6;
}

@end