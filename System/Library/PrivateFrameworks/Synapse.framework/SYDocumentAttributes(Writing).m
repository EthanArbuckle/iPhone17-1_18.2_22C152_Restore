@interface SYDocumentAttributes(Writing)
@end

@implementation SYDocumentAttributes(Writing)

- (void)saveToFileURL:()Writing additionalAttributes:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize document attributes, error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_removeDocumentAttributesForFileAtURL:()Writing keepDocumentRelatedUniqueIdentifierKey:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

@end