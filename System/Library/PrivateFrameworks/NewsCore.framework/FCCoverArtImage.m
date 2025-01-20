@interface FCCoverArtImage
- (CGSize)dimensions;
- (FCCoverArtImage)initWithDimensions:(CGSize)a3 URL:(id)a4;
- (NSURL)URL;
@end

@implementation FCCoverArtImage

- (FCCoverArtImage)initWithDimensions:(CGSize)a3 URL:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCoverArtImage;
  v9 = [(FCCoverArtImage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_dimensions.CGFloat width = width;
    v9->_dimensions.CGFloat height = height;
    objc_storeStrong((id *)&v9->_URL, a4);
  }

  return v10;
}

- (CGSize)dimensions
{
  double width = self->_dimensions.width;
  double height = self->_dimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end