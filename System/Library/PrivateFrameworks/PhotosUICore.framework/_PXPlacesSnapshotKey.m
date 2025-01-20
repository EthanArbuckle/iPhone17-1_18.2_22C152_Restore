@interface _PXPlacesSnapshotKey
- (BOOL)isEqual:(id)a3;
- (CGSize)_imageSize;
- (_PXPlacesSnapshotKey)initWithImageSize:(CGSize)a3 userInterfaceStyle:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_userInterfaceStyle;
- (unint64_t)hash;
@end

@implementation _PXPlacesSnapshotKey

- (int64_t)_userInterfaceStyle
{
  return self->__userInterfaceStyle;
}

- (CGSize)_imageSize
{
  double width = self->__imageSize.width;
  double height = self->__imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  [(_PXPlacesSnapshotKey *)self _imageSize];
  return [(_PXPlacesSnapshotKey *)self _userInterfaceStyle] ^ (16 * v3) ^ (v4 << 14);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_PXPlacesSnapshotKey *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(_PXPlacesSnapshotKey *)self _imageSize];
      [(_PXPlacesSnapshotKey *)v5 _imageSize];
      PXSizeApproximatelyEqualToSize();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [_PXPlacesSnapshotKey alloc];
  [(_PXPlacesSnapshotKey *)self _imageSize];
  double v6 = v5;
  double v8 = v7;
  int64_t v9 = [(_PXPlacesSnapshotKey *)self _userInterfaceStyle];
  return -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:](v4, "initWithImageSize:userInterfaceStyle:", v9, v6, v8);
}

- (_PXPlacesSnapshotKey)initWithImageSize:(CGSize)a3 userInterfaceStyle:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_PXPlacesSnapshotKey;
  CGSize result = [(_PXPlacesSnapshotKey *)&v8 init];
  if (result)
  {
    result->__imageSize.CGFloat width = width;
    result->__imageSize.CGFloat height = height;
    result->__userInterfaceStyle = a4;
  }
  return result;
}

@end