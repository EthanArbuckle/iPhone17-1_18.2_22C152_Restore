@interface PXStoryMiroPhotoInfo
- (PXStoryMiroPhotoInfo)initWithData:(id)a3;
- (id)dataRepresentation;
@end

@implementation PXStoryMiroPhotoInfo

- (id)dataRepresentation
{
  v4[4] = [(PXStoryMiroAssetInfo *)self isUsed];
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:5];
  return v2;
}

- (PXStoryMiroPhotoInfo)initWithData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXStoryMiroPhotoInfo;
  v5 = [(PXStoryMiroAssetInfo *)&v7 initWithData:v4];
  if (v5 && [v4 length] == 5) {
    -[PXStoryMiroAssetInfo setIsUsed:](v5, "setIsUsed:", *(unsigned char *)([v4 bytes] + 4) & 1);
  }

  return v5;
}

@end