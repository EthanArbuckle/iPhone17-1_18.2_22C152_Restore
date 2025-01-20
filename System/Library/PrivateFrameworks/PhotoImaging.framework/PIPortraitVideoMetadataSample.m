@interface PIPortraitVideoMetadataSample
+ (NSString)renderingMetadataIdentifier;
- (PIPortraitVideoMetadataSample)initWithMetadataGroup:(id)a3 majorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5 error:(id *)a6;
- (PTTimedRenderingMetadata)timedMetadata;
- (id)valueWithIdentifier:(id)a3 inGroup:(id)a4 ofClass:(Class)a5;
- (void)applyToRenderRequest:(id)a3;
- (void)nu_updateDigest:(id)a3;
- (void)setTimedMetadata:(id)a3;
@end

@implementation PIPortraitVideoMetadataSample

- (void)nu_updateDigest:(id)a3
{
  v3 = self;
  [a3 addBytes:&v3 length:8];
}

- (void).cxx_destruct
{
}

- (void)setTimedMetadata:(id)a3
{
}

- (PTTimedRenderingMetadata)timedMetadata
{
  return self->_timedMetadata;
}

- (id)valueWithIdentifier:(id)a3 inGroup:(id)a4 ofClass:(Class)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F16558];
  v9 = [a4 items];
  v10 = [v8 metadataItemsFromArray:v9 filteredByIdentifier:v7];

  if ([v10 count])
  {
    unint64_t v11 = [v10 count];
    v12 = (void *)MEMORY[0x1E4F7A750];
    v13 = (os_log_t *)MEMORY[0x1E4F7A758];
    if (v11 >= 2)
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_10660);
      }
      v14 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        Class v23 = (Class)v10;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "PIPortraitVideoMetadataSample: unexpected number of items for identifier %@: %@", (uint8_t *)&v20, 0x16u);
      }
    }
    v15 = [v10 firstObject];
    v16 = [v15 value];

    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
    }
    else
    {
      if (*v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_10660);
      }
      v18 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v16;
        __int16 v22 = 2112;
        Class v23 = a5;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "PIPortraitVideoMetadataSample: item %@ is not of expected class %@", (uint8_t *)&v20, 0x16u);
      }
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)applyToRenderRequest:(id)a3
{
}

- (PIPortraitVideoMetadataSample)initWithMetadataGroup:(id)a3 majorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  if (v11)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    int v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PIPortraitVideoMetadata.m", 43, @"Invalid parameter not satisfying: %@", @"metadataGroup != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PIPortraitVideoMetadata.m", 44, @"Invalid parameter not satisfying: %@", @"outError != NULL" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PIPortraitVideoMetadataSample;
  v12 = [(PIPortraitVideoMetadataSample *)&v22 init];
  if (v12)
  {
    v13 = [(PIPortraitVideoMetadataSample *)v12 valueWithIdentifier:@"mdta/com.apple.quicktime.cinematic-video.rendering" inGroup:v11 ofClass:objc_opt_class()];
    if (v13)
    {
      v14 = [MEMORY[0x1E4F92288] objectFromData:v13 withMajorVersion:v8 minorVersion:v7];
      [(PIPortraitVideoMetadataSample *)v12 setTimedMetadata:v14];

      v15 = [(PIPortraitVideoMetadataSample *)v12 timedMetadata];

      if (v15)
      {
LABEL_9:

        goto LABEL_10;
      }
      v16 = (void *)MEMORY[0x1E4F7A438];
      id v17 = @"Could not decode timed rendering data";
      id v18 = v13;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F7A438];
      id v17 = @"Missing rendering metadata";
      id v18 = v11;
    }
    *a6 = [v16 invalidError:v17 object:v18];

    v12 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

+ (NSString)renderingMetadataIdentifier
{
  return (NSString *)@"mdta/com.apple.quicktime.cinematic-video.rendering";
}

@end