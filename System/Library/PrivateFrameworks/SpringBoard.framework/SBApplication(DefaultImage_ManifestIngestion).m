@interface SBApplication(DefaultImage_ManifestIngestion)
- (void)_resetLaunchImageIngestionStatus;
@end

@implementation SBApplication(DefaultImage_ManifestIngestion)

- (void)_resetLaunchImageIngestionStatus
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "[.png ingestor] [%{public}@] Resetting ingestion status.", v4, v5, v6, v7, v8);
}

- (void)_ingestDefaultPNGsInManifest:()DefaultImage_ManifestIngestion withLaunchImageBaseName:.cold.1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "[legacy ingest] [%{public}@] Found no candidate PNGs...", v4, v5, v6, v7, v8);
}

- (void)_ingestInfoPlistImagesInManifest:()DefaultImage_ManifestIngestion .cold.1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "[.plist ingest] [%{public}@] Found no candidate plist entries...", v4, v5, v6, v7, v8);
}

@end