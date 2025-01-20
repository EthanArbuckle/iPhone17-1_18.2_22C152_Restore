@interface LTSpeechRecognizer
@end

@implementation LTSpeechRecognizer

void __66___LTSpeechRecognizer_startRecognitionWithAutoStop_resultHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !WeakRetained[2])
  {
    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    id v10 = WeakRetained;

    *((unsigned char *)v10 + 24) = 0;
    uint64_t v4 = MEMORY[0x26120C050](*(void *)(a1 + 32));
    v5 = (void *)*((void *)v10 + 9);
    *((void *)v10 + 9) = v4;

    [*((id *)v10 + 1) setDetectUtterances:*(unsigned __int8 *)(a1 + 48)];
    [*((id *)v10 + 1) setConcatenateUtterances:0];
    v6 = (void *)*((void *)v10 + 1);
    v7 = [*((id *)v10 + 8) localeIdentifier];
    uint64_t v8 = [v6 runRecognitionWithResultStream:v10 language:v7 task:@"MtApp" samplingRate:16000];
    v9 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v8;

    WeakRetained = v10;
  }
}

void __42___LTSpeechRecognizer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] addAudioSampleData:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

void __31___LTSpeechRecognizer_endAudio__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[2] endAudio];
    WeakRetained = v2;
  }
}

void __40___LTSpeechRecognizer_cancelRecognition__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[1] cancelRecognition];
    [v3[2] endAudio];
    id v2 = v3[2];
    v3[2] = 0;

    WeakRetained = v3;
  }
}

void __50___LTSpeechRecognizer_triggerServerSideEndPointer__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[2] triggerServerSideEndPointer];
    WeakRetained = v2;
  }
}

void __70___LTSpeechRecognizer_speechRecognizer_didFinishRecognitionWithError___block_invoke(uint64_t a1)
{
  v17[2] = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    if (!*((unsigned char *)v3 + 24))
    {
      uint64_t v5 = v3[4];
      if (v5
        && ([MEMORY[0x263F1C130] resultWithPackage:v5 locale:v3[8] modelVersion:v3[7] isFinal:1],
            (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = (void *)v6;
        uint64_t v8 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (!v8)
        {
          v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v10 = (void *)MEMORY[0x263F087E8];
          uint64_t v11 = *MEMORY[0x263F1C1D0];
          v16[0] = *MEMORY[0x263F08320];
          v12 = [v9 localizedStringForKey:@"EMPTY_RECOGNITION_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
          v17[0] = v12;
          v16[1] = *MEMORY[0x263F08338];
          v13 = [v9 localizedStringForKey:@"SPEECH_NOT_RECOGNIZED_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
          v17[1] = v13;
          v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
          v15 = [v10 errorWithDomain:v11 code:10 userInfo:v14];

          v7 = [MEMORY[0x263F1C130] emptyResultWithLocale:v3[8] isFinal:1];
          [*(id *)(a1 + 40) _recognizedResult:v7 error:v15];

          goto LABEL_10;
        }
        v7 = 0;
      }
      [*(id *)(a1 + 40) _recognizedResult:v7 error:v8];
LABEL_10:
    }
  }
}

uint64_t __71___LTSpeechRecognizer_speechRecognizer_didRecognizeFinalResultPackage___block_invoke(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !*((unsigned char *)WeakRetained + 24))
  {
    uint64_t v6 = WeakRetained;
    if ([WeakRetained[1] detectUtterances])
    {
      *((unsigned char *)v6 + 24) = 1;
      [a1[4] cancelRecognition];
      id v3 = [MEMORY[0x263F1C130] resultWithPackage:a1[5] locale:v6[8] modelVersion:v6[7] isFinal:1];
      [a1[4] _recognizedResult:v3 error:0];
    }
    else
    {
      id v4 = a1[5];
      id v3 = v6[4];
      v6[4] = v4;
    }
  }
  return MEMORY[0x270F9A758]();
}

void __66___LTSpeechRecognizer_speechRecognizer_didRecognizePartialResult___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v18 = a1;
    v19 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) tokens];
    uint64_t v5 = [MEMORY[0x263F089D8] stringWithString:&stru_270C008E8];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        v12 = v9;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          if (v12 && [v12 hasSpaceAfter]) {
            [v5 appendString:@" "];
          }
          v14 = (void *)MEMORY[0x263F3B428];
          v15 = [v13 tokenName];
          v16 = [v14 hatToQsrString:v15];

          if (v16) {
            [v5 appendString:v16];
          }
          id v9 = v13;

          ++v11;
          v12 = v9;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v3 = v19;
    v17 = [MEMORY[0x263F1C130] resultWithResult:*(void *)(v18 + 32) locale:v19[8] modelVersion:v19[7] isFinal:0];
    [*(id *)(v18 + 40) _recognizedResult:v17 error:0];
  }
}

@end