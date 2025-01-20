@interface PGMusicCuratorConfigurationWrapper
+ (PGMusicCuratorConfigurationWrapper)defaultConfiguration;
+ (PGMusicCuratorConfigurationWrapper)memoryCreationConfiguration;
- (PGMusicCuratorConfigurationWrapper)init;
- (int64_t)audioFilePrefetchThresholdInDays;
- (int64_t)metadataPrefetchThresholdInDays;
@end

@implementation PGMusicCuratorConfigurationWrapper

+ (PGMusicCuratorConfigurationWrapper)defaultConfiguration
{
  return (PGMusicCuratorConfigurationWrapper *)sub_1D1A66434((uint64_t)a1, (uint64_t)a2, (void (*)(void *__return_ptr))static MusicCuratorConfiguration.defaultConfiguration());
}

+ (PGMusicCuratorConfigurationWrapper)memoryCreationConfiguration
{
  return (PGMusicCuratorConfigurationWrapper *)sub_1D1A66434((uint64_t)a1, (uint64_t)a2, (void (*)(void *__return_ptr))static MusicCuratorConfiguration.memoryCreationConfiguration());
}

- (int64_t)metadataPrefetchThresholdInDays
{
  return *(void *)&self->configuration[OBJC_IVAR___PGMusicCuratorConfigurationWrapper_configuration + 64];
}

- (int64_t)audioFilePrefetchThresholdInDays
{
  return *(void *)&self->configuration[OBJC_IVAR___PGMusicCuratorConfigurationWrapper_configuration + 72];
}

- (PGMusicCuratorConfigurationWrapper)init
{
  result = (PGMusicCuratorConfigurationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end