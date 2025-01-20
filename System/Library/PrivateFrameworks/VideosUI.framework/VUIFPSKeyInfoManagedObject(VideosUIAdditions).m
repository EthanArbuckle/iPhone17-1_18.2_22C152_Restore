@interface VUIFPSKeyInfoManagedObject(VideosUIAdditions)
@end

@implementation VUIFPSKeyInfoManagedObject(VideosUIAdditions)

- (void)populateFromKeyRequest:()VideosUIAdditions video:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1E2BD7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to serialize fpsAdditionalServerParams data: %@", (uint8_t *)&v1, 0xCu);
}

@end