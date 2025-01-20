@interface _LTSpeechRecognitionSausage(Osprey)
- (id)initWithOspreySausage:()Osprey choices:locale:;
@end

@implementation _LTSpeechRecognitionSausage(Osprey)

- (id)initWithOspreySausage:()Osprey choices:locale:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = a1;
  v32.super_class = (Class)&off_270C59268;
  id v11 = objc_msgSendSuper2(&v32, sel_init);
  if (v11)
  {
    v12 = [v9 firstObject];
    if (v12)
    {
      id v29 = v9;
      v13 = [MEMORY[0x263EFF980] array];
      v14 = objc_msgSend(v12, "alternative_index");
      if ([v14 count])
      {
        unint64_t v15 = 0;
        while (1)
        {
          v16 = objc_msgSend(v8, "positional_tok_phrase_alt");
          unint64_t v17 = [v16 count];

          if (v15 >= v17) {
            break;
          }
          v18 = objc_msgSend(v8, "positional_tok_phrase_alt");
          v19 = [v18 objectAtIndexedSubscript:v15];

          v20 = objc_msgSend(v19, "tok_phrases");
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke;
          v30[3] = &unk_265548090;
          id v31 = v10;
          v21 = [v20 _ltCompactMap:v30];

          v22 = objc_msgSend(v12, "alternative_index");
          v23 = [v22 objectAtIndexedSubscript:v15];

          id v24 = objc_alloc_init(MEMORY[0x263F1C128]);
          objc_msgSend(v24, "setBestAlternativeIndex:", objc_msgSend(v23, "unsignedIntegerValue"));
          [v24 setAlternatives:v21];
          [v13 addObject:v24];

          ++v15;
          v14 = objc_msgSend(v12, "alternative_index");
          if (v15 >= [v14 count]) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
      }
      v25 = [v13 _ltCompactMap:&__block_literal_global_25];
      v26 = _LTOSLogSpeech();
      id v9 = v29;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[_LTSpeechRecognitionSausage(Daemon) initWithRecognition:wordConfidenceThreshold:](v26, v25);
      }
      [v11 setBins:v13];
      id v27 = v11;
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

@end