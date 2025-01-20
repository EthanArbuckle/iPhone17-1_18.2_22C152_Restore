@interface PLFileBackedThumbnailVirtualResource
- (int64_t)dataLength;
- (int64_t)estimatedDataLength;
@end

@implementation PLFileBackedThumbnailVirtualResource

- (int64_t)estimatedDataLength
{
  float v3 = (float)[(PLVirtualResource *)self unorientedWidth] * 0.37961;
  return (uint64_t)(float)(v3 * (float)[(PLVirtualResource *)self unorientedHeight]);
}

- (int64_t)dataLength
{
  float v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(PLVirtualResource *)self fileURL];
  v5 = [v4 path];
  v6 = [v3 attributesOfItemAtPath:v5 error:0];
  int64_t v7 = [v6 fileSize];

  return v7;
}

@end