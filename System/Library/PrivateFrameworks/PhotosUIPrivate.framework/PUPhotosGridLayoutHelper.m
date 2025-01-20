@interface PUPhotosGridLayoutHelper
+ (int64_t)zIndexForFloatingHeaderForVisualSection:(int64_t)a3;
+ (int64_t)zIndexForItemAtIndexPath:(id)a3;
+ (int64_t)zIndexForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5;
@end

@implementation PUPhotosGridLayoutHelper

+ (int64_t)zIndexForFloatingHeaderForVisualSection:(int64_t)a3
{
  return 0x7FFFFFFFLL;
}

+ (int64_t)zIndexForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5
{
  return 0;
}

+ (int64_t)zIndexForItemAtIndexPath:(id)a3
{
  return 2147483646;
}

@end