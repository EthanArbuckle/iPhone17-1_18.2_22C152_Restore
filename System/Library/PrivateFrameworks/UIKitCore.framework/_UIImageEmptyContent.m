@interface _UIImageEmptyContent
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (CGSize)sizeInPixels;
- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5;
- (id)typeName;
- (unint64_t)hash;
@end

@implementation _UIImageEmptyContent

- (CGSize)sizeInPixels
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (id)typeName
{
  return @"empty";
}

- (CGSize)size
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5
{
  v5 = +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, 0, 0, 0);
  v6 = +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  return 0;
}

@end