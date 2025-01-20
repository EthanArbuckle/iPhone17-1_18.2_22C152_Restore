@interface _PSSuggester(InteractionAvailable)
@end

@implementation _PSSuggester(InteractionAvailable)

- (void)interactionAvailableForHandle:()InteractionAvailable interactionStoreDB:.cold.2(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1A314B000, v2, v3, "_PSSuggester: For handle %@, incoming interaction call count:%tu", v4, v5, v6, v7, v8);
}

- (void)interactionAvailableForHandle:()InteractionAvailable interactionStoreDB:.cold.3(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1A314B000, v2, v3, "_PSSuggester: For handle %@, outgoing interaction call count:%tu", v4, v5, v6, v7, v8);
}

@end