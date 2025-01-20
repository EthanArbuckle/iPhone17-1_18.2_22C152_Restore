@interface PXStoryMiroVideoRangeInfo
- (PXStoryMiroVideoRangeInfo)initWithData:(id)a3;
- (id)dataRepresentation;
@end

@implementation PXStoryMiroVideoRangeInfo

- (id)dataRepresentation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[8] = [(PXStoryMiroAssetInfo *)self isUsed];
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:10];
  return v2;
}

- (PXStoryMiroVideoRangeInfo)initWithData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXStoryMiroVideoRangeInfo;
  uint64_t v5 = [(PXStoryMiroAssetInfo *)&v7 initWithData:v4];
  if (v5 && (unint64_t)([v4 length] - 9) <= 1) {
    -[PXStoryMiroAssetInfo setIsUsed:](v5, "setIsUsed:", *(unsigned char *)([v4 bytes] + 8) & 1);
  }

  return v5;
}

@end