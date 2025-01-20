@interface ICNote(AttachmentManagement)
@end

@implementation ICNote(AttachmentManagement)

- (void)addAttachmentWithFileURL:()AttachmentManagement updateFileBasedAttributes:analytics:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Failed to determine if %@ is a directory, error %@");
}

- (void)addMediaToAttachment:()AttachmentManagement withBlock:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Need to wait for a save before adding media in background for %@", v2);
}

- (void)addMediaToAttachment:()AttachmentManagement withBlock:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Adding media asynchronously for %@", v2);
}

@end