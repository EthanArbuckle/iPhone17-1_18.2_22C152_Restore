@interface PFMetadataLegacyMovieProperties
- (BOOL)configureWithMetadataPlist:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMovie;
- (BOOL)isSloMo;
- (BOOL)isTimelapse;
- (PFMetadataLegacyMovieProperties)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4;
- (PFMetadataLegacyMovieProperties)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4;
- (id)_firstAudioTrack;
- (id)_firstVideoTrack;
- (id)_makeDateTimeProperties;
- (id)_makeGPSProperties;
- (id)_makeGeometryProperties;
- (id)audioDataRate;
- (id)audioSampleRate;
- (id)audioTrackFormat;
- (id)audioTrackFormatFlags;
- (id)cameraMake;
- (id)cameraModel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)durationTimeInterval;
- (id)nominalFrameRate;
- (id)plistForEncoding;
- (id)software;
- (id)videoCodecName;
- (id)videoDataRate;
- (opaqueCMFormatDescription)_formatDescription;
- (void)_enumerateTracksOfType:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation PFMetadataLegacyMovieProperties

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataLegacyMovieProperties;
  if (![(PFMetadata *)&v8 isEqual:v4]
    || (audioVideoProperties = self->_audioVideoProperties, (audioVideoProperties == 0) == (v4[22] != 0)))
  {
    char v6 = 0;
  }
  else
  {
    char v6 = -[NSDictionary isEqual:](audioVideoProperties, "isEqual:");
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataLegacyMovieProperties;
  v4 = [(PFMetadata *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 22, self->_audioVideoProperties);
  return v4;
}

- (id)plistForEncoding
{
  v6.receiver = self;
  v6.super_class = (Class)PFMetadataLegacyMovieProperties;
  v3 = [(PFMetadata *)&v6 plistForEncoding];
  v4 = (void *)[v3 mutableCopy];

  [v4 setObject:self->_audioVideoProperties forKeyedSubscript:PFMetadataPlistAudioVideoProperties];

  return v4;
}

- (id)_makeGPSProperties
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"commonMetadata"];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F15CB0]];

  if (v3)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    v4 = 0;
    if (+[PFMetadataMovie parseISO6709String:v3 outLatitude:&v9 outLongitude:&v8])
    {
      v10[0] = *MEMORY[0x1E4F2FA40];
      v5 = [NSNumber numberWithDouble:v9];
      v11[0] = v5;
      v10[1] = *MEMORY[0x1E4F2FA50];
      objc_super v6 = [NSNumber numberWithDouble:v8];
      v11[1] = v6;
      v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (opaqueCMFormatDescription)_formatDescription
{
  v2 = [(PFMetadataLegacyMovieProperties *)self _firstVideoTrack];
  v3 = [v2 formatDescriptions];

  if ([v3 count])
  {
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }

  return (opaqueCMFormatDescription *)v4;
}

- (void)_enumerateTracksOfType:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (uint64_t (**)(id, void *))a4;
  v7 = (id *)MEMORY[0x1E4F15C18];
  if (a3 != 1986618469) {
    v7 = (id *)MEMORY[0x1E4F15BA8];
  }
  id v8 = *v7;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v9 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"tracks", 0];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:@"mediaType"];
        if ([v15 isEqualToString:v8] && (v6[2](v6, v14) & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (id)_firstAudioTrack
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__4016;
  double v9 = __Block_byref_object_dispose__4017;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PFMetadataLegacyMovieProperties__firstAudioTrack__block_invoke;
  v4[3] = &unk_1E5B2DAD8;
  v4[4] = &v5;
  [(PFMetadataLegacyMovieProperties *)self _enumerateTracksOfType:1936684398 withBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __51__PFMetadataLegacyMovieProperties__firstAudioTrack__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (id)_firstVideoTrack
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__4016;
  double v9 = __Block_byref_object_dispose__4017;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PFMetadataLegacyMovieProperties__firstVideoTrack__block_invoke;
  v4[3] = &unk_1E5B2DAD8;
  v4[4] = &v5;
  [(PFMetadataLegacyMovieProperties *)self _enumerateTracksOfType:1986618469 withBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __51__PFMetadataLegacyMovieProperties__firstVideoTrack__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (id)_makeGeometryProperties
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstVideoTrack];
  CFDictionaryRef v3 = [v2 objectForKeyedSubscript:@"naturalSize"];

  size.width = 0.0;
  size.height = 0.0;
  v4 = 0;
  if (CGSizeMakeWithDictionaryRepresentation(v3, &size))
  {
    v9[0] = *MEMORY[0x1E4F2FD00];
    uint64_t v5 = [NSNumber numberWithDouble:size.width];
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E4F2FCE8];
    objc_super v6 = [NSNumber numberWithDouble:size.height];
    v9[2] = *MEMORY[0x1E4F2FCA0];
    v10[1] = v6;
    void v10[2] = &unk_1EF7CA850;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  }

  return v4;
}

- (id)_makeDateTimeProperties
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"commonMetadata"];
  CFDictionaryRef v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F15CA0]];

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x1E4F2F800];
    double v9 = v3;
    uint64_t v10 = v4;
    uint64_t v8 = *MEMORY[0x1E4F2F7F0];
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v11[0] = v5;
    objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (BOOL)isTimelapse
{
  id v2 = [(PFMetadata *)self captureMode];
  char v3 = [v2 isEqualToString:@"Time-lapse"];

  return v3;
}

- (BOOL)isSloMo
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self nominalFrameRate];
  [v2 doubleValue];
  *(float *)&double v3 = v3;
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:v3];
  BOOL v5 = v4 < 1.0;

  return v5;
}

- (id)videoCodecName
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstVideoTrack];
  double v3 = [v2 objectForKeyedSubscript:@"formatDescriptions"];
  float v4 = [v3 firstObject];

  BOOL v5 = [v4 objectForKeyedSubscript:@"videoTrackFormatName"];

  return v5;
}

- (id)audioTrackFormatFlags
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstAudioTrack];
  double v3 = [v2 objectForKeyedSubscript:@"formatDescriptions"];
  float v4 = [v3 objectAtIndex:0];

  BOOL v5 = [v4 objectForKeyedSubscript:@"audioTrackFormatFlags"];

  return v5;
}

- (id)audioTrackFormat
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstAudioTrack];
  double v3 = [v2 objectForKeyedSubscript:@"formatDescriptions"];
  float v4 = [v3 objectAtIndex:0];

  BOOL v5 = [v4 objectForKeyedSubscript:@"audioTrackFormat"];

  return v5;
}

- (id)audioSampleRate
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstAudioTrack];
  double v3 = [v2 objectForKeyedSubscript:@"formatDescriptions"];
  float v4 = [v3 objectAtIndex:0];

  BOOL v5 = [v4 objectForKeyedSubscript:@"audioTrackSampleRate"];

  return v5;
}

- (id)audioDataRate
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstAudioTrack];
  double v3 = [v2 objectForKeyedSubscript:@"estimatedDataRate"];

  return v3;
}

- (id)videoDataRate
{
  uint64_t v5 = 0;
  objc_super v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PFMetadataLegacyMovieProperties_videoDataRate__block_invoke;
  v4[3] = &unk_1E5B2DAB0;
  v4[4] = &v5;
  [(PFMetadataLegacyMovieProperties *)self _enumerateTracksOfType:1986618469 withBlock:v4];
  id v2 = [NSNumber numberWithDouble:v6[3] / 1000.0];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __48__PFMetadataLegacyMovieProperties_videoDataRate__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 objectForKeyedSubscript:@"estimatedDataRate"];
  [v3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);

  return 1;
}

- (id)nominalFrameRate
{
  id v2 = [(PFMetadataLegacyMovieProperties *)self _firstVideoTrack];
  double v3 = [v2 objectForKeyedSubscript:@"nominalFrameRate"];

  return v3;
}

- (id)durationTimeInterval
{
  return [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"duration"];
}

- (id)software
{
  id v2 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"commonMetadata"];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F15CC8]];

  return v3;
}

- (id)cameraModel
{
  id v2 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"commonMetadata"];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F15CC0]];

  return v3;
}

- (id)cameraMake
{
  id v2 = [(NSDictionary *)self->_audioVideoProperties objectForKeyedSubscript:@"commonMetadata"];
  double v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F15CB8]];

  return v3;
}

- (BOOL)isMovie
{
  return 1;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMetadataLegacyMovieProperties;
  BOOL v5 = [(PFMetadata *)&v9 configureWithMetadataPlist:v4];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:PFMetadataPlistAudioVideoProperties];
    audioVideoProperties = self->_audioVideoProperties;
    self->_audioVideoProperties = v6;
  }
  return v5;
}

- (PFMetadataLegacyMovieProperties)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4
{
  id v6 = a3;
  uint64_t v7 = PFMetadataPlistContentTypeIdentifier;
  id v8 = a4;
  objc_super v9 = [v6 objectForKeyedSubscript:v7];
  uint64_t v10 = +[PFUniformTypeUtilities typeWithIdentifier:v9];

  uint64_t v11 = [v6 objectForKeyedSubscript:PFMetadataPlistOptions];
  uint64_t v12 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", v10, (unsigned __int16)[v11 integerValue], v8);

  if (v12 && ![(PFMetadataLegacyMovieProperties *)v12 configureWithMetadataPlist:v6])
  {

    uint64_t v12 = 0;
  }

  return v12;
}

- (PFMetadataLegacyMovieProperties)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    v16.receiver = self;
    v16.super_class = (Class)PFMetadataLegacyMovieProperties;
    id v8 = [(PFMetadata *)&v16 initWithContentType:0 options:12 timeZoneLookup:v7];
    if (v8)
    {
      id v15 = 0;
      objc_super v9 = +[PFMetadata propertyListObjectFromEncodedData:v6 expectedClass:objc_opt_class() options:0 error:&v15];
      id v10 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v8->_audioVideoProperties, v9);
        [(PFMetadata *)v8 setSourceType:8];
      }
      else
      {
        uint64_t v11 = (void *)metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          v13 = v11;
          uint64_t v14 = [v6 length];
          *(_DWORD *)buf = 134218498;
          id v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = v14;
          __int16 v21 = 2114;
          id v22 = v10;
          _os_log_error_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);
        }
        id v8 = 0;
      }
    }
  }
  else
  {

    id v8 = 0;
  }

  return v8;
}

@end