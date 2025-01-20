@interface _NTKPhotosPhotoFaceUpgradeItemContext
- (CGRect)originalCrop;
- (NSDate)modificationDate;
- (NSString)localIdentifier;
- (NSURL)imageURL;
- (NSURL)maskURL;
- (_NTKPhotosPhotoFaceUpgradeItemContext)initWithPhoto:(id)a3 timeAlignment:(int64_t)a4;
- (int64_t)timeAlignment;
@end

@implementation _NTKPhotosPhotoFaceUpgradeItemContext

- (_NTKPhotosPhotoFaceUpgradeItemContext)initWithPhoto:(id)a3 timeAlignment:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NTKPhotosPhotoFaceUpgradeItemContext;
  v8 = [(_NTKPhotosPhotoFaceUpgradeItemContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photo, a3);
    v9->_timeAlignment = a4;
  }

  return v9;
}

- (NSString)localIdentifier
{
  return [(NTKPhoto *)self->_photo localIdentifier];
}

- (NSDate)modificationDate
{
  return [(NTKPhoto *)self->_photo modificationDate];
}

- (CGRect)originalCrop
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSURL)imageURL
{
  return [(NTKPhoto *)self->_photo imageURL];
}

- (NSURL)maskURL
{
  return 0;
}

- (int64_t)timeAlignment
{
  return self->_timeAlignment;
}

- (void).cxx_destruct
{
}

@end