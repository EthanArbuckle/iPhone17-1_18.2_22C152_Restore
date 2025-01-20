@interface RCCaptureFormat
+ (BOOL)supportsFileExtension:(id)a3;
+ (id)AVAssetAuthoringMetadataWithComposition:(id)a3;
+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5;
+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5 musicMemoMetadata:(id)a6;
+ (id)AVAssetAuthoringMetadataWithRecordingMetadata:(id)a3;
+ (id)AVAssetExportPresetForExportingToExtension:(id)a3 preferredFormat:(unsigned int)a4;
+ (id)AVFileTypeIdentifierForFileExtension:(id)a3;
+ (id)fileExtensionsSupported;
+ (id)supportedFileTypeIdentifiers;
+ (void)AVAssetExportDetermineSettingsForExportingAsset:(id)a3 preferredOutputExtension:(id)a4 preferredFormat:(unsigned int)a5 completionHandler:(id)a6;
+ (void)_AVAssetExportDetermineSettingsForExportingAsset:(id)a3 outputExtensionWithFallbacks:(id)a4 preferredFormat:(unsigned int)a5 completionHandler:(id)a6;
@end

@implementation RCCaptureFormat

+ (id)fileExtensionsSupported
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"m4a";
  v4[1] = @"qta";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)supportedFileTypeIdentifiers
{
  v3 = [a1 fileExtensionsSupported];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__RCCaptureFormat_supportedFileTypeIdentifiers__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

uint64_t __47__RCCaptureFormat_supportedFileTypeIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) AVFileTypeIdentifierForFileExtension:a2];
}

+ (BOOL)supportsFileExtension:(id)a3
{
  id v4 = a3;
  v5 = [a1 fileExtensionsSupported];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)AVFileTypeIdentifierForFileExtension:(id)a3
{
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F442D8] typeWithTag:v5 tagClass:*MEMORY[0x1E4F442E0] conformingToType:0];
  v7 = [v6 identifier];
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"RCCaptureFormat.m", 48, @"unsupported file extension: %@", v5 object file lineNumber description];
  }
  return v7;
}

+ (id)AVAssetExportPresetForExportingToExtension:(id)a3 preferredFormat:(unsigned int)a4
{
  if ([a3 isEqualToString:@"m4a"])
  {
    id v5 = (void **)MEMORY[0x1E4F15770];
    if (a4 != 1634492771) {
      id v5 = (void **)MEMORY[0x1E4F156D8];
    }
  }
  else
  {
    id v5 = (void **)MEMORY[0x1E4F156E8];
  }
  char v6 = *v5;
  return v6;
}

+ (void)AVAssetExportDetermineSettingsForExportingAsset:(id)a3 preferredOutputExtension:(id)a4 preferredFormat:(unsigned int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = [a1 fileExtensionsSupported];
  v13 = (void *)[v12 mutableCopy];

  [v13 removeObject:@"m4a"];
  [v13 insertObject:@"m4a" atIndex:0];
  if ([v10 length] && (objc_msgSend(@"m4a", "isEqual:", v10) & 1) == 0)
  {
    [v13 removeObject:v10];
    [v13 insertObject:v10 atIndex:0];
  }
  [a1 _AVAssetExportDetermineSettingsForExportingAsset:v14 outputExtensionWithFallbacks:v13 preferredFormat:v7 completionHandler:v11];
}

+ (void)_AVAssetExportDetermineSettingsForExportingAsset:(id)a3 outputExtensionWithFallbacks:(id)a4 preferredFormat:(unsigned int)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v11 count])
  {
    v13 = [v11 firstObject];
    id v14 = [a1 AVFileTypeIdentifierForFileExtension:v13];
    [v11 removeObjectAtIndex:0];
    v15 = (void *)MEMORY[0x1E4F16360];
    uint64_t v16 = *MEMORY[0x1E4F15758];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __131__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke;
    v20[3] = &unk_1E6497B58;
    id v21 = v10;
    unsigned int v27 = a5;
    id v22 = v13;
    id v23 = v14;
    id v25 = v12;
    id v26 = a1;
    id v24 = v11;
    id v17 = v14;
    id v18 = v13;
    [v15 determineCompatibilityOfExportPreset:v16 withAsset:v21 outputFileType:v17 completionHandler:v20];
  }
  else
  {
    v19 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[RCCaptureFormat _AVAssetExportDetermineSettingsForExportingAsset:outputExtensionWithFallbacks:preferredFormat:completionHandler:]((uint64_t)v10, v19);
    }

    (*((void (**)(id, void, void, void))v12 + 2))(v12, 0, 0, 0);
  }
}

void __131__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "rc_audioTracks");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v14 count] <= 1)
  {
    v3 = [v14 firstObject];
    id v4 = [v3 formatDescriptions];
    unint64_t v5 = [v4 count];

    if (v5 <= 1)
    {
      char v6 = [v14 firstObject];
      uint64_t v7 = [v6 formatDescriptions];
      v8 = [v7 firstObject];

      if (CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)v8)->mFormatID != *(_DWORD *)(a1 + 80))
      {

LABEL_9:
        v9 = +[RCCaptureFormat AVAssetExportPresetForExportingToExtension:*(void *)(a1 + 40) preferredFormat:*(unsigned int *)(a1 + 80)];
        id v10 = (void *)MEMORY[0x1E4F16360];
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 48);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __131__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke_2;
        v15[3] = &unk_1E6497B30;
        id v21 = *(id *)(a1 + 64);
        id v16 = *(id *)(a1 + 40);
        id v17 = *(id *)(a1 + 48);
        id v18 = v9;
        uint64_t v22 = *(void *)(a1 + 72);
        id v19 = *(id *)(a1 + 32);
        id v20 = *(id *)(a1 + 56);
        int v23 = *(_DWORD *)(a1 + 80);
        id v13 = v9;
        [v10 determineCompatibilityOfExportPreset:v13 withAsset:v11 outputFileType:v12 completionHandler:v15];

        return;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __131__RCCaptureFormat__AVAssetExportDetermineSettingsForExportingAsset_outputExtensionWithFallbacks_preferredFormat_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else {
    return [*(id *)(a1 + 80) _AVAssetExportDetermineSettingsForExportingAsset:*(void *)(a1 + 56) outputExtensionWithFallbacks:*(void *)(a1 + 64) preferredFormat:*(unsigned int *)(a1 + 88) completionHandler:*(void *)(a1 + 72)];
  }
}

+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5 musicMemoMetadata:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  id v14 = RCNonUserGeneratedDeviceName();
  v15 = RCOperatingSystemVersionString();
  id v16 = (void *)*MEMORY[0x1E4F15E08];
  id v17 = (void *)*MEMORY[0x1E4F15ED8];
  id v18 = [NSString stringWithFormat:@"com.apple.VoiceMemos (%@ %@)", v14, v15];
  id v19 = appendMDItem(v13, v16, v17, v18);

  if (v9) {
    id v20 = appendMDItem(v13, (void *)*MEMORY[0x1E4F15DF0], (void *)*MEMORY[0x1E4F15D30], v9);
  }
  if (v10) {
    id v21 = appendMDItem(v13, v16, (void *)*MEMORY[0x1E4F15EF0], v10);
  }
  uint64_t v22 = (void **)MEMORY[0x1E4F15E10];
  if (v11) {
    id v23 = appendMDItem(v13, (void *)*MEMORY[0x1E4F15E10], @"com.apple.iTunes.voice-memo-uuid", v11);
  }
  if (v12)
  {
    id v24 = [v12 objectForKeyedSubscript:@"musicMemoTextNote"];
    id v25 = v24;
    if (v24 && [v24 length]) {
      id v26 = appendMDItem(v13, *v22, @"com.apple.iTunes.music-memo-note", v25);
    }
    unsigned int v27 = [v12 objectForKeyedSubscript:@"musicMemoStarRating"];
    if (v27) {
      id v28 = appendMDItem(v13, *v22, @"com.apple.iTunes.music-memo-rating", v27);
    }
    v29 = [v12 objectForKeyedSubscript:@"musicMemoTags"];
    v30 = v29;
    if (v29 && [v29 length]) {
      id v31 = appendMDItem(v13, (void *)*MEMORY[0x1E4F15E10], @"com.apple.iTunes.music-memo-tags", v30);
    }
  }
  return v13;
}

+ (id)AVAssetAuthoringMetadataWithCreationDate:(id)a3 title:(id)a4 uniqueID:(id)a5
{
  return (id)[a1 AVAssetAuthoringMetadataWithCreationDate:a3 title:a4 uniqueID:a5 musicMemoMetadata:0];
}

+ (id)AVAssetAuthoringMetadataWithComposition:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 creationDate];
  char v6 = [v4 title];
  uint64_t v7 = [v4 savedRecordingUUID];
  v8 = [v4 musicMemoMetadata];

  id v9 = [a1 AVAssetAuthoringMetadataWithCreationDate:v5 title:v6 uniqueID:v7 musicMemoMetadata:v8];

  return v9;
}

+ (id)AVAssetAuthoringMetadataWithRecordingMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"date"];
  unint64_t v5 = [v3 objectForKeyedSubscript:@"title"];
  char v6 = [v3 objectForKeyedSubscript:@"uniqueID"];
  uint64_t v7 = +[RCCaptureFormat AVAssetAuthoringMetadataWithCreationDate:v4 title:v5 uniqueID:v6 musicMemoMetadata:v3];

  return v7;
}

+ (void)_AVAssetExportDetermineSettingsForExportingAsset:(uint64_t)a1 outputExtensionWithFallbacks:(NSObject *)a2 preferredFormat:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "+[RCCaptureFormat _AVAssetExportDetermineSettingsForExportingAsset:outputExtensionWithFallbacks:preferredFormat:c"
       "ompletionHandler:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- Unable to determine any output settings for asset %@", (uint8_t *)&v2, 0x16u);
}

@end