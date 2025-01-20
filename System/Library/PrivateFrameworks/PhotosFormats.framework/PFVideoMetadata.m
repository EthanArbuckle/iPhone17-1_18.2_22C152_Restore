@interface PFVideoMetadata
+ (BOOL)hasValidMetadataForLoopingVideoAsset:(id)a3;
+ (BOOL)readMetadataType:(unsigned __int8)a3 fromAVAsset:(id)a4 value:(id *)a5 error:(id *)a6;
+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6;
+ (BOOL)videoAssetIsDecodable:(id)a3;
+ (BOOL)videoAssetIsHighDynamicRange:(id)a3;
+ (BOOL)videoAssetIsPlayable:(id)a3;
+ (BOOL)videoAssetIsSpatial:(id)a3;
+ (BOOL)videoTrackFormatDescriptionContainsPortraitData:(opaqueCMFormatDescription *)a3;
+ (BOOL)videoTrackFormatDescriptionIsHDR10:(opaqueCMFormatDescription *)a3;
+ (BOOL)videoTrackFormatDescriptionIsHighDynamicRange:(opaqueCMFormatDescription *)a3;
+ (BOOL)videoTrackFormatDescriptionIsProResLOG:(opaqueCMFormatDescription *)a3;
+ (BOOL)videoTrackIsSpatial:(id)a3;
+ (id)arrayByRemovingMetadataItemOfType:(unsigned __int8)a3 fromArray:(id)a4 error:(id *)a5;
+ (id)firstVideoTrackFormatDebugDescriptionForAsset:(id)a3;
+ (id)metadataItemValueFromAsset:(id)a3 withKey:(id)a4 keySpace:(id)a5;
+ (id)outOfBandHintsForVideoAsset:(id)a3;
+ (id)quickTimeMetadataItemValueFromAsset:(id)a3 withKey:(id)a4;
+ (unsigned)videoCodecFourCharCodeNumberForAVAsset:(id)a3;
+ (void)loadMetadataForAsset:(id)a3 completion:(id)a4;
- (BOOL)isDecodable;
- (BOOL)isHDR;
- (BOOL)isPlayable;
- (BOOL)isSpatial;
- (NSDictionary)outOfBandHints;
- (NSString)firstVideoTrackFormatDebugDescription;
@end

@implementation PFVideoMetadata

- (void).cxx_destruct
{
}

- (NSDictionary)outOfBandHints
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return (NSDictionary *)[v3 outOfBandHintsForVideoAsset:asset];
}

- (NSString)firstVideoTrackFormatDebugDescription
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return (NSString *)[v3 firstVideoTrackFormatDebugDescriptionForAsset:asset];
}

- (BOOL)isDecodable
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return [v3 videoAssetIsDecodable:asset];
}

- (BOOL)isPlayable
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return [v3 videoAssetIsPlayable:asset];
}

- (BOOL)isHDR
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return [v3 videoAssetIsHighDynamicRange:asset];
}

- (BOOL)isSpatial
{
  v3 = objc_opt_class();
  asset = self->_asset;

  return [v3 videoAssetIsSpatial:asset];
}

+ (unsigned)videoCodecFourCharCodeNumberForAVAsset:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PFVideoMetadata_videoCodecFourCharCodeNumberForAVAsset___block_invoke;
  v6[3] = &unk_1E5B2DC58;
  v6[4] = &v7;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:v3 withBlock:v6];
  unsigned int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __58__PFVideoMetadata_videoCodecFourCharCodeNumberForAVAsset___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned char *a5)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  *a5 = 1;
  return result;
}

+ (BOOL)videoTrackFormatDescriptionContainsPortraitData:(opaqueCMFormatDescription *)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = CMMetadataFormatDescriptionGetIdentifiers(a3);
  if ([v3 containsObject:@"mdta/com.apple.quicktime.cinematic-video.rendering"]) {
    char v4 = [v3 containsObject:@"mdta/com.apple.quicktime.cinematic-video.cinematography"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)videoTrackFormatDescriptionIsProResLOG:(opaqueCMFormatDescription *)a3
{
  id v3 = CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x1E4F1EDF8]);
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)videoTrackFormatDescriptionIsHDR10:(opaqueCMFormatDescription *)a3
{
  return CMVideoFormatDescriptionGetVideoDynamicRange() == 4;
}

+ (BOOL)videoTrackFormatDescriptionIsHighDynamicRange:(opaqueCMFormatDescription *)a3
{
  return (int)CMVideoFormatDescriptionGetVideoDynamicRange() > 1;
}

+ (BOOL)videoTrackIsSpatial:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F15B08];
  v17[0] = *MEMORY[0x1E4F15B28];
  v17[1] = v4;
  v17[2] = *MEMORY[0x1E4F15B50];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v7 += objc_msgSend(v3, "hasMediaCharacteristic:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
    uint64_t v6 = v7;
  }

  BOOL v10 = [v5 count] == v6;
  return v10;
}

+ (BOOL)videoAssetIsSpatial:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PFVideoMetadata_videoAssetIsSpatial___block_invoke;
  v6[3] = &unk_1E5B2D638;
  v6[4] = &v7;
  void v6[5] = a1;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:v4 withBlock:v6];
  LOBYTE(a1) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

uint64_t __39__PFVideoMetadata_videoAssetIsSpatial___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 40) videoTrackIsSpatial:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

+ (BOOL)videoAssetIsHighDynamicRange:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PFVideoMetadata_videoAssetIsHighDynamicRange___block_invoke;
  v6[3] = &unk_1E5B2D638;
  v6[4] = &v7;
  void v6[5] = a1;
  +[PFMediaUtilities enumerateVideoTrackFormatDescriptionsInAsset:v4 withBlock:v6];
  LOBYTE(a1) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

uint64_t __48__PFVideoMetadata_videoAssetIsHighDynamicRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "videoTrackFormatDescriptionIsHighDynamicRange:");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

+ (BOOL)videoAssetIsPlayable:(id)a3
{
  id v4 = a3;
  if ([a1 videoAssetIsHighDynamicRange:v4]
    && !+[PFMediaCapabilities currentDeviceIsEligibleForHDRPlayback])
  {
    char v5 = 0;
  }
  else
  {
    char v5 = [v4 isPlayable];
  }

  return v5;
}

+ (BOOL)videoAssetIsDecodable:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(a3, "tracks", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    uint64_t v7 = *MEMORY[0x1E4F15C18];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isEnabled])
        {
          char v10 = [v9 mediaType];
          if ([v10 isEqualToString:v7])
          {
            int v11 = [v9 isDecodable];

            if (!v11)
            {
              BOOL v12 = 0;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

+ (id)arrayByRemovingMetadataItemOfType:(unsigned __int8)a3 fromArray:(id)a4 error:(id *)a5
{
  unsigned int v6 = a3;
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = convertTypeToKey(v6, 1);
  if (v8)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      uint64_t v13 = *MEMORY[0x1E4F15DF8];
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
        long long v16 = [v15 keySpace];
        int v17 = [v16 isEqual:v13];

        if (v17)
        {
          v18 = [v15 key];
          char v19 = [v18 isEqual:v8];

          if (v19) {
            break;
          }
        }
        if (v11 == ++v14)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      id v23 = v15;

      if (!v23) {
        goto LABEL_16;
      }
      a5 = (id *)[v9 mutableCopy];
      [a5 removeObject:v23];
    }
    else
    {
LABEL_11:

LABEL_16:
      a5 = (id *)v9;
    }
  }
  else if (a5)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is invalid for the media type %s", v6, "video");
    v31[0] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    *a5 = [v20 errorWithDomain:@"com.apple.PhotosFormats" code:0 userInfo:v22];

    a5 = 0;
  }

  return a5;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromAVAsset:(id)a4 value:(id *)a5 error:(id *)a6
{
  unsigned int v8 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = convertTypeToKey(v8, 1);
  if (v11)
  {
    *a5 = [a1 quickTimeMetadataItemValueFromAsset:v10 withKey:v11];
  }
  else if (a6)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Specified type (%d) is invalid for the media type %s", v8, "video");
    v17[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a6 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:0 userInfo:v14];
  }
  return v11 != 0;
}

+ (BOOL)readMetadataType:(unsigned __int8)a3 fromFileURL:(id)a4 value:(id *)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v10 options:0];
  if (v11)
  {
    LOBYTE(a6) = [a1 readMetadataType:v8 fromAVAsset:v11 value:a5 error:a6];
  }
  else if (a6)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [NSString stringWithFormat:@"Unable to access input media through URL %@", v10, *MEMORY[0x1E4F28228]];
    v17[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a6 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:1 userInfo:v14];

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

+ (id)quickTimeMetadataItemValueFromAsset:(id)a3 withKey:(id)a4
{
  return (id)[a1 metadataItemValueFromAsset:a3 withKey:a4 keySpace:*MEMORY[0x1E4F15DF8]];
}

+ (BOOL)hasValidMetadataForLoopingVideoAsset:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  +[PFVideoMetadata readMetadataType:4 fromAVAsset:v3 value:&v14 error:0];
  id v4 = v14;
  int v5 = [v4 unsignedIntValue];
  if (v5) {
    BOOL v6 = v5 == 3;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    char v12 = 0;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F16558];
    uint64_t v8 = [v3 metadata];
    id v9 = [v7 metadataItemsFromArray:v8 withKey:@"LOOP" keySpace:*MEMORY[0x1E4F15E00]];

    id v10 = [v9 firstObject];
    uint64_t v11 = [v10 dataType];
    char v12 = [v11 isEqualToString:*MEMORY[0x1E4F1F020]];
  }
  return v12;
}

+ (id)outOfBandHintsForVideoAsset:(id)a3
{
  return +[PFMediaUtilities outOfBandHintsForVideoAsset:a3];
}

+ (id)firstVideoTrackFormatDebugDescriptionForAsset:(id)a3
{
  id v3 = +[PFVideoMetadataVideoTrackFormatInfo infoForFirstVideoTrackOfAsset:a3];
  id v4 = [v3 formatDebugDescription];

  return v4;
}

+ (id)metadataItemValueFromAsset:(id)a3 withKey:(id)a4 keySpace:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F16558];
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 metadata];
  uint64_t v11 = [v7 metadataItemsFromArray:v10 withKey:v9 keySpace:v8];

  char v12 = [v11 firstObject];
  uint64_t v13 = [v12 value];

  return v13;
}

+ (void)loadMetadataForAsset:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F14500];
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(MEMORY[0x1E4F14500], v5);
  id v9 = v7;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_signpost_emit_with_name_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_BEGIN, v8, "com.apple.photos.backend.videometadata", "Load metadata for asset asset %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PFVideoMetadata_loadMetadataForAsset_completion___block_invoke;
  v12[3] = &unk_1E5B2D610;
  id v13 = &unk_1EF7CAD48;
  id v14 = v5;
  id v15 = v6;
  os_signpost_id_t v16 = v8;
  id v10 = v6;
  id v11 = v5;
  [v11 loadValuesAsynchronouslyForKeys:&unk_1EF7CAD48 completionHandler:v12];
}

void __51__PFVideoMetadata_loadMetadataForAsset_completion___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = MEMORY[0x1E4F14500];
  os_signpost_id_t v3 = *(void *)(a1 + 56);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(MEMORY[0x1E4F14500]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_SIGNPOST_INTERVAL_END, v3, "com.apple.photos.backend.videometadata", (const char *)&unk_1A42E5DAB, buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        char v12 = *(void **)(a1 + 40);
        id v16 = v10;
        uint64_t v13 = [v12 statusOfValueForKey:v11 error:&v16];
        id v7 = v16;

        if (v13 != 2)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            uint64_t v22 = v13;
            __int16 v23 = 2112;
            uint64_t v24 = v11;
            __int16 v25 = 2112;
            uint64_t v26 = v15;
            __int16 v27 = 2112;
            id v28 = v7;
            _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFVideoMetadata: Unexpected AVKeyValueStatus status %td while loading values for key '%@' of AVAsset %@: %@", buf, 0x2Au);
          }

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          goto LABEL_18;
        }
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  id v14 = (id *)objc_opt_new();
  objc_storeStrong(v14 + 1, *(id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_18:
}

@end