@interface OZARMetadata
+ (BOOL)supportsSecureCoding;
+ (NSArray)personSegmentationMediaCharacteristics;
+ (NSArray)sceneDepthMediaCharacteristics;
+ (id)createWithMetadataItem:(id)a3 error:(id *)a4;
+ (id)decompressedData:(id)a3 error:(id *)a4;
+ (id)metadataItemIdentifier;
+ (id)simplyDecodeFromData:(id)a3 error:(id *)a4;
+ (int64_t)metadataCompressionAlgorithm;
+ (opaqueCMFormatDescription)createMetadataFormat;
+ (opaqueCMFormatDescription)metadataFormat;
- (OZARMetadata)initWithCoder:(id)a3;
- (id)compressedDataWithError:(id *)a3;
- (id)metadataItemWithTimeRange:(id *)a3 error:(id *)a4;
@end

@implementation OZARMetadata

- (id)compressedDataWithError:(id *)a3
{
  v4 = (void *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
  uint64_t v5 = [(id)objc_opt_class() metadataCompressionAlgorithm];
  if (v5 < 0) {
    return v4;
  }

  return (id)[v4 compressedDataUsingAlgorithm:v5 error:a3];
}

+ (id)decompressedData:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(id)objc_opt_class() metadataCompressionAlgorithm];
  if (v6 < 0) {
    return a3;
  }

  return (id)[a3 decompressedDataUsingAlgorithm:v6 error:a4];
}

+ (int64_t)metadataCompressionAlgorithm
{
  return 0;
}

+ (opaqueCMFormatDescription)createMetadataFormat
{
  uint64_t v2 = [(id)objc_opt_class() metadataItemIdentifier];

  return OZSimplyCreateCMMetadataFormatDescriptionForRawDataWithIdentifier(v2);
}

+ (opaqueCMFormatDescription)metadataFormat
{
  result = (opaqueCMFormatDescription *)[a1 createMetadataFormat];
  +[OZARMetadata metadataFormat]::metadataFormat = (uint64_t)result;
  return result;
}

+ (NSArray)sceneDepthMediaCharacteristics
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F15B58];
  v3[1] = @"com.apple.quicktime.video-map";
  v3[2] = @"com.apple.quicktime.video-map.depth";
  v3[3] = @"com.apple.videoapps.media-characteristic.ar.scene.depth";
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
}

+ (NSArray)personSegmentationMediaCharacteristics
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F15B58];
  v3[1] = @"com.apple.quicktime.video-map";
  v3[2] = @"com.apple.videoapps.media-characteristic.ar.person.segmentation";
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
}

+ (id)simplyDecodeFromData:(id)a3 error:(id *)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (![a3 length]) {
    return 0;
  }
  v7 = (void *)[a1 decompressedData:a3 error:a4];
  if (![v7 length]) {
    return 0;
  }
  [MEMORY[0x1E4F28DC0] setClass:objc_opt_class() forClassName:@"PCDMARFrameMetadata"];
  v8 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v9 = objc_opt_class();

  return (id)[v8 unarchivedObjectOfClass:v9 fromData:v7 error:a4];
}

+ (id)createWithMetadataItem:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 value];

  return (id)[a1 simplyDecodeFromData:v6 error:a4];
}

+ (id)metadataItemIdentifier
{
  [a1 doesNotRecognizeSelector:a2];
  uint64_t v2 = (void *)MEMORY[0x1E4F16558];
  uint64_t v3 = *MEMORY[0x1E4F15DF8];

  return (id)[v2 identifierForKey:@"com.apple.videoapps.arfx.metadata" keySpace:v3];
}

- (id)metadataItemWithTimeRange:(id *)a3 error:(id *)a4
{
  v7 = (void *)MEMORY[0x1E4F16558];
  uint64_t v8 = [(id)objc_opt_class() metadataItemIdentifier];
  long long v9 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  return (id)[v7 simplyCreateMetadataItemWithObject:self identifier:v8 timeRange:v11 error:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OZARMetadata;
  return [(OZARMetadata *)&v4 init];
}

@end