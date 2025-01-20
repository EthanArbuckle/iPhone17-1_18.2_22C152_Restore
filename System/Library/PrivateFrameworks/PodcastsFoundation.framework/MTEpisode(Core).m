@interface MTEpisode(Core)
- (void)setAssetURL:()Core;
@end

@implementation MTEpisode(Core)

- (void)setAssetURL:()Core
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    [(MTEpisode *)self setSecurityScopedAssetData:0];
    id v4 = 0;
  }
  [(MTEpisode *)self _setAssetUrl:v4];
}

- (void)setPodcastUuid:()Core .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 podcastUuid];
  id v5 = [a1 uuid];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1AC9D5000, a2, OS_LOG_TYPE_FAULT, "Setting podcastUuid from %@ to nil will cause an exception on context save. Episode: %@", (uint8_t *)&v6, 0x16u);
}

@end