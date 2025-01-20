@interface ML3MigrationExecuteDirectives
@end

@implementation ML3MigrationExecuteDirectives

void ___ML3MigrationExecuteDirectives_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "[Migration] Autogeneration of supported sizes completed (error=%{public}@)", (uint8_t *)&v4, 0xCu);
  }
}

@end