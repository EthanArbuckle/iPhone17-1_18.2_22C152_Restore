@interface PPSStorage
- (PPSStorage)init;
- (void)setupMetadataStorage;
- (void)setupStorageForEntryKey:(id)a3;
- (void)startStorage;
@end

@implementation PPSStorage

- (PPSStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPSStorage;
  return [(PPSStorage *)&v3 init];
}

- (void)setupMetadataStorage
{
}

- (void)startStorage
{
}

- (void)setupStorageForEntryKey:(id)a3
{
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v3) {
    -[PPSStorage setupStorageForEntryKey:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setupStorageForEntryKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end