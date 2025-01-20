@interface ICAttachment(SearchLinkPresentation)
- (void)synapseBasedMetadata;
@end

@implementation ICAttachment(SearchLinkPresentation)

- (void)synapseBasedMetadata
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving SYContentItem: %@", (uint8_t *)&v2, 0xCu);
}

@end