@interface _LTSpeechRecognitionSausage(Daemon)
- (id)initWithRecognition:()Daemon wordConfidenceThreshold:;
@end

@implementation _LTSpeechRecognitionSausage(Daemon)

- (id)initWithRecognition:()Daemon wordConfidenceThreshold:
{
  id v6 = a3;
  v26.receiver = a1;
  v26.super_class = (Class)&off_270C59268;
  id v7 = objc_msgSendSuper2(&v26, sel_init);
  if (v7)
  {
    v8 = [MEMORY[0x263EFF980] array];
    v9 = [v6 interpretationIndices];
    v10 = [v9 firstObject];

    v11 = [v6 tokenSausage];
    id v23 = v7;
    if ([v11 count])
    {
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = objc_msgSend(v10, "count", v23);

        if (v12 >= v13) {
          break;
        }
        v14 = [v6 tokenSausage];
        v15 = [v14 objectAtIndexedSubscript:v12];

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke;
        v25[3] = &__block_descriptor_40_e56____LTSpeechRecognitionTokensAlternative_16__0__NSArray_8l;
        v25[4] = a4;
        v16 = [v15 _ltCompactMap:v25];
        v17 = [v10 objectAtIndexedSubscript:v12];
        id v18 = objc_alloc_init(MEMORY[0x263F1C128]);
        objc_msgSend(v18, "setBestAlternativeIndex:", objc_msgSend(v17, "unsignedIntegerValue"));
        [v18 setAlternatives:v16];
        [v8 addObject:v18];

        ++v12;
        v11 = [v6 tokenSausage];
        if (v12 >= [v11 count]) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
    }
    v19 = objc_msgSend(v8, "_ltCompactMap:", &__block_literal_global_24, v23);
    v20 = _LTOSLogSpeech();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_LTSpeechRecognitionSausage(Daemon) initWithRecognition:wordConfidenceThreshold:](v20, v19);
    }
    id v7 = v24;
    [v24 setBins:v8];
    id v21 = v24;
  }
  return v7;
}

- (void)initWithRecognition:()Daemon wordConfidenceThreshold:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 componentsJoinedByString:@","];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Sausage confidences: %@", (uint8_t *)&v5, 0xCu);
}

@end