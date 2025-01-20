@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

uint64_t __92__NSMutableAttributedString_NSMutableAttributedStringKitAdditions__fixFontAttributeInRange___block_invoke()
{
  fixFontAttributeInRange__nonBaseSetBMP = CFUniCharGetBitmapPtrForPlane();
  fixFontAttributeInRange__combiningDataBMP = CFUniCharGetUnicodePropertyDataForPlane();
  fixFontAttributeInRange__controlFormatBMP = CFUniCharGetBitmapPtrForPlane();
  uint64_t result = CFUniCharGetBitmapPtrForPlane();
  fixFontAttributeInRange__graphemeBMP = result;
  return result;
}

@end