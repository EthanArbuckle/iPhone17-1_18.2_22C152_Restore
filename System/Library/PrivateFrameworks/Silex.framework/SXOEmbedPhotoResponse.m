@interface SXOEmbedPhotoResponse
- (CGSize)size;
@end

@implementation SXOEmbedPhotoResponse

- (CGSize)size
{
  [(SXOEmbedPhotoResponse *)self width];
  double v4 = v3;
  [(SXOEmbedPhotoResponse *)self height];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

@end