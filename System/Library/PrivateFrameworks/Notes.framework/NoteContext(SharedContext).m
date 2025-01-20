@interface NoteContext(SharedContext)
@end

@implementation NoteContext(SharedContext)

+ (void)mainContextObjectFromObject:()SharedContext .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "ic_loggingDescription");
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CFDA4000, a2, OS_LOG_TYPE_ERROR, "Error getting main context object from object: %@", (uint8_t *)&v4, 0xCu);
}

@end