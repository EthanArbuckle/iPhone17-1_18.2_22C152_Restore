@interface LTServerSpeechSession
@end

@implementation LTServerSpeechSession

uint64_t __45___LTServerSpeechSession_addSpeechAudioData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _translateSpeechAudioData:a2];
}

void __50___LTServerSpeechSession_languageDetectionResult___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[17] = 1;
    if (WeakRetained[18]) {
      [WeakRetained delegateTranslationDidFinishWithError:*((void *)WeakRetained + 3)];
    }
  }
}

void __56___LTServerSpeechSession_translationDidFinishWithError___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (!*((unsigned char *)WeakRetained + 16) || *((unsigned char *)WeakRetained + 17))
    {
      v3 = (id *)(a1 + 32);
LABEL_5:
      [v2 delegateTranslationDidFinishWithError:*v3];
      goto LABEL_6;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = (id *)(a1 + 32);
    if (v4)
    {
      char v5 = [WeakRetained[10] forceLanguageDetectionResult];
      v2 = WeakRetained;
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
    }
    *((unsigned char *)v2 + 18) = 1;
    objc_storeStrong(v2 + 3, *v3);
  }
LABEL_6:
}

@end