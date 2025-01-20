@interface PLSFace
- (CGRect)relativeRect;
- (NSString)albumUUID;
- (PLSFace)initWithFaceInfo:(id)a3;
- (signed)identifier;
- (void)setAlbumUUID:(id)a3;
- (void)setIdentifier:(signed __int16)a3;
- (void)setRelativeRect:(CGRect)a3;
@end

@implementation PLSFace

- (void).cxx_destruct
{
}

- (void)setAlbumUUID:(id)a3
{
}

- (NSString)albumUUID
{
  return self->_albumUUID;
}

- (void)setIdentifier:(signed __int16)a3
{
  self->_identifier = a3;
}

- (signed)identifier
{
  return self->_identifier;
}

- (void)setRelativeRect:(CGRect)a3
{
  self->_relativeRect = a3;
}

- (CGRect)relativeRect
{
  double x = self->_relativeRect.origin.x;
  double y = self->_relativeRect.origin.y;
  double width = self->_relativeRect.size.width;
  double height = self->_relativeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PLSFace)initWithFaceInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLSFace;
  v5 = [(PLSFace *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKey:kPLSAssetFaceAlbumUUIDKey];
    [(PLSFace *)v5 setAlbumUUID:v6];

    v7 = [v4 objectForKey:kPLSAssetFaceIndexKey];
    -[PLSFace setIdentifier:](v5, "setIdentifier:", (__int16)[v7 intValue]);

    CFDictionaryRef v8 = [v4 objectForKey:kPLSAssetFaceRectangleKey];
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v8, &rect)) {
      -[PLSFace setRelativeRect:](v5, "setRelativeRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    }
    else {
      NSLog(@"[PLS] Unable to construct faceRect for faceInfo: %@", v4);
    }
  }
  return v5;
}

@end