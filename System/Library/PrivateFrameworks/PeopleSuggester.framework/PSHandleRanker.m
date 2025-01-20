@interface PSHandleRanker
@end

@implementation PSHandleRanker

void __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_4(uint64_t a1, void *a2)
{
}

void __53___PSHandleRanker_rankedHandlesFromCandidateHandles___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "XPC Error: %@", (uint8_t *)&v2, 0xCu);
}

@end