@interface RCComposition(RCAVFoundation)
@end

@implementation RCComposition(RCAVFoundation)

- (void)_compositionAsset:()RCAVFoundation .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[RCComposition(RCAVFoundation) _compositionAsset:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- insertError = %@", (uint8_t *)&v2, 0x16u);
}

- (void)_enumerateTracksForInsertion:()RCAVFoundation error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[RCComposition(RCAVFoundation) _enumerateTracksForInsertion:error:]";
  _os_log_fault_impl(&dword_1C3964000, log, OS_LOG_TYPE_FAULT, "%s -- fragment asset has no audio tracks", (uint8_t *)&v1, 0xCu);
}

@end