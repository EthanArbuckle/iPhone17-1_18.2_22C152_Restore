@interface LTDisambiguationNode
@end

@implementation LTDisambiguationNode

id __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 text];
  if ([v2 length]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

uint64_t __75___LTDisambiguationNode_Daemon__nodeFromEMTResult_sourceText_romanization___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1C0B8] linkConfigurationWithEMTSelectionSpan:a2 sourceText:*(void *)(a1 + 32) targetText:*(void *)(a1 + 40)];
}

uint64_t __104___LTDisambiguationNode_Daemon__nodeFromFTSpeechTranslationPhrase_descriptions_sourceText_censorSpeech___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x263F1C0B8] linkConfigurationWithFTSelectionSpan:a2 descriptions:a1[4] sourceText:a1[5] targetText:a1[6]];
}

uint64_t __85___LTDisambiguationNode_Daemon__nodeFromFTTranslationPhrase_descriptions_sourceText___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x263F1C0B8] linkConfigurationWithFTSelectionSpan:a2 descriptions:a1[4] sourceText:a1[5] targetText:a1[6]];
}

uint64_t __83___LTDisambiguationNode_Daemon__nodeFromOspreyBatchPhrase_descriptions_sourceText___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x263F1C0B8] linkConfigurationWithFTSelectionSpan:a2 descriptions:a1[4] sourceText:a1[5] targetText:a1[6]];
}

@end