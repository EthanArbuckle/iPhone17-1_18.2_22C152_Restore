@interface PKAMSMediaRequestArtworkConfiguration
- (CGSize)artworkSize;
- (PKAMSMediaRequestArtworkConfiguration)initWithArtworkSize:(CGSize)a3 artworkCropType:(unint64_t)a4 animatedArtworkType:(unint64_t)a5;
- (unint64_t)animatedArtworkType;
- (unint64_t)cropType;
@end

@implementation PKAMSMediaRequestArtworkConfiguration

- (PKAMSMediaRequestArtworkConfiguration)initWithArtworkSize:(CGSize)a3 artworkCropType:(unint64_t)a4 animatedArtworkType:(unint64_t)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)PKAMSMediaRequestArtworkConfiguration;
  result = [(PKAMSMediaRequestArtworkConfiguration *)&v10 init];
  if (result)
  {
    result->_artworkSize.CGFloat width = width;
    result->_artworkSize.CGFloat height = height;
    result->_cropType = a4;
    result->_animatedArtworkType = a5;
  }
  return result;
}

- (CGSize)artworkSize
{
  double width = self->_artworkSize.width;
  double height = self->_artworkSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)cropType
{
  return self->_cropType;
}

- (unint64_t)animatedArtworkType
{
  return self->_animatedArtworkType;
}

@end