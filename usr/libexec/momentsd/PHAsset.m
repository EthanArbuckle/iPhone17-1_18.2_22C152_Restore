@interface PHAsset
- (id)resourceType;
@end

@implementation PHAsset

- (id)resourceType
{
  if ((id)[(PHAsset *)self mediaType] == (id)2)
  {
    v3 = &MOPhotoResourceTypeVideo;
  }
  else if ((id)[(PHAsset *)self mediaType] == (id)1)
  {
    unsigned __int8 v4 = [(PHAsset *)self mediaSubtypes];
    v3 = &MOPhotoResourceTypeLivePhoto;
    if ((v4 & 8) == 0) {
      v3 = &MOPhotoResourceTypeStillPhoto;
    }
  }
  else
  {
    v3 = &MOPhotoResourceTypeUnknown;
  }
  v5 = *v3;

  return v5;
}

@end