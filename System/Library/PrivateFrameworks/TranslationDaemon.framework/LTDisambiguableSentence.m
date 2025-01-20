@interface LTDisambiguableSentence
@end

@implementation LTDisambiguableSentence

id __89___LTDisambiguableSentence_Daemon__sentenceFromFTSpeechResponse_sourceText_censorSpeech___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F1C0C0];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = objc_msgSend(v4, "alternative_descriptions");
  v7 = [v3 nodeFromFTSpeechTranslationPhrase:v5 descriptions:v6 sourceText:*(void *)(a1 + 40) censorSpeech:*(unsigned __int8 *)(a1 + 48)];

  return v7;
}

id __63___LTDisambiguableSentence_Daemon__sentenceFromOspreyResponse___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F1C0C0];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = objc_msgSend(v4, "alternative_descriptions");
  v7 = [v3 nodeFromFTTranslationPhrase:v5 descriptions:v6 sourceText:*(void *)(a1 + 40)];

  return v7;
}

id __68___LTDisambiguableSentence_Daemon__sentenceFromOspreyBatchSentence___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F1C0C0];
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = objc_msgSend(v4, "alternative_descriptions");
  v7 = [v3 nodeFromOspreyBatchPhrase:v5 descriptions:v6 sourceText:*(void *)(a1 + 40)];

  return v7;
}

@end