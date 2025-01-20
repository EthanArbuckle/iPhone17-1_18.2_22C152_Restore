@interface ICMedia(Management)
@end

@implementation ICMedia(Management)

+ (void)newMediaWithAttachment:()Management forData:filename:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Creating media with filename: %@", v2, v3, v4, v5, v6);
}

+ (void)newMediaWithAttachment:()Management forData:filename:error:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Trying to create a media from data with no filename", v1, 2u);
}

+ (void)newMediaWithAttachment:()Management forFileWrapper:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Trying to add a media from a file wrapper with no filename: %@", v2, v3, v4, v5, v6);
}

+ (void)newMediaWithAttachment:()Management forURL:error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 filename];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Creating media with filename: %@", v4, 0xCu);
}

+ (void)mediaIdentifiersForAccount:()Management .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "error fetching media identifiers: %@", v2, v3, v4, v5, v6);
}

@end