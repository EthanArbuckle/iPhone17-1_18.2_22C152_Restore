@interface LTDisambiguationLinkConfiguration
@end

@implementation LTDisambiguationLinkConfiguration

uint64_t __106___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithEMTSelectionSpan_sourceText_targetText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1C1C0] unvalidatedEdgeWithEMTAlternative:a2];
}

uint64_t __118___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithFTSelectionSpan_descriptions_sourceText_targetText___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F1C1C0] unvalidatedEdgeWithFTAlternative:a2 descriptions:*(void *)(a1 + 32)];
}

@end