@interface _LTSpeechTranscription(Osprey)
- (void)initWithRecognitionChoice:()Osprey inSausage:;
@end

@implementation _LTSpeechTranscription(Osprey)

- (void)initWithRecognitionChoice:()Osprey inSausage:
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v46.receiver = a1;
  v46.super_class = (Class)&off_270C59720;
  id v8 = objc_msgSendSuper2(&v46, sel_init);
  v9 = v8;
  if (v8)
  {
    v39 = v8;
    v10 = [MEMORY[0x263F089D8] string];
    v11 = objc_msgSend(v6, "alternative_index");
    if ([v11 count])
    {
      unint64_t v12 = 0;
      double v13 = 0.0;
      double v14 = 1000.0;
      id v40 = v7;
      v41 = v6;
      while (1)
      {
        v15 = objc_msgSend(v7, "positional_tok_phrase_alt");
        unint64_t v16 = [v15 count];

        if (v12 >= v16) {
          break;
        }
        v17 = objc_msgSend(v7, "positional_tok_phrase_alt");
        v18 = [v17 objectAtIndexedSubscript:v12];

        v19 = objc_msgSend(v6, "alternative_index");
        v20 = [v19 objectAtIndexedSubscript:v12];
        uint64_t v21 = [v20 unsignedIntegerValue];

        v22 = objc_msgSend(v18, "tok_phrases");
        v23 = [v22 objectAtIndexedSubscript:v21];
        v24 = [v23 tokens];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              v31 = objc_msgSend(v30, "token_text");
              [v10 appendString:v31];

              if (objc_msgSend(v30, "add_space_after")) {
                [v10 appendString:@" "];
              }
              int v32 = [v30 confidence];
              if (v14 >= (double)v32) {
                double v14 = (double)v32;
              }
              int v33 = [v30 confidence];
              if (v13 < (double)v33) {
                double v13 = (double)v33;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v27);
        }

        ++v12;
        id v6 = v41;
        v11 = objc_msgSend(v41, "alternative_index");
        id v7 = v40;
        if (v12 >= [v11 count]) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      double v13 = 0.0;
      double v14 = 1000.0;
LABEL_21:
    }
    v9 = v39;
    objc_msgSend(v39, "setConfidence:", (double)(int)objc_msgSend(v6, "confidence"));
    [v39 setMinConfidence:v14];
    [v39 setMaxConfidence:v13];
    [v39 setFormattedString:v10];
    [v39 minConfidence];
    double v35 = v34;
    [v39 maxConfidence];
    if (v35 > v36)
    {
      [v39 confidence];
      objc_msgSend(v39, "setMinConfidence:");
      [v39 confidence];
      objc_msgSend(v39, "setMaxConfidence:");
    }
    id v37 = v39;
  }
  return v9;
}

@end