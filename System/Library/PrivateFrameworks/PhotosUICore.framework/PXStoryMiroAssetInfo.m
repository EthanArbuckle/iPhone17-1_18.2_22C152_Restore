@interface PXStoryMiroAssetInfo
+ (id)infoForUsedPhoto;
+ (id)infoWithData:(id)a3;
- (BOOL)isUsed;
- (NSData)dataRepresentation;
- (PXStoryMiroAssetInfo)initWithData:(id)a3;
- (void)setIsUsed:(BOOL)a3;
@end

@implementation PXStoryMiroAssetInfo

- (void).cxx_destruct
{
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void)setIsUsed:(BOOL)a3
{
  self->_isUsed = a3;
}

- (BOOL)isUsed
{
  return self->_isUsed;
}

- (PXStoryMiroAssetInfo)initWithData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryMiroAssetInfo;
  return [(PXStoryMiroAssetInfo *)&v4 init];
}

+ (id)infoForUsedPhoto
{
  v2 = objc_alloc_init(PXStoryMiroPhotoInfo);
  [(PXStoryMiroAssetInfo *)v2 setIsUsed:1];
  return v2;
}

+ (id)infoWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v5 = off_1E5DA8E08;
  if (v4 != 5) {
    v5 = off_1E5DA8E10;
  }
  v6 = (void *)[objc_alloc(*v5) initWithData:v3];

  return v6;
}

@end