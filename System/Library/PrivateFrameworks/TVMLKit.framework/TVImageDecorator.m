@interface TVImageDecorator
- (BOOL)isEqual:(id)a3;
- (BOOL)loaderCropToFit;
- (CGSize)expectedSize;
- (CGSize)loaderScaleToSize;
- (NSString)decoratorIdentifier;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
@end

@implementation TVImageDecorator

- (CGSize)loaderScaleToSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)loaderCropToFit
{
  return 0;
}

- (CGSize)expectedSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)decoratorIdentifier
{
  return 0;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end