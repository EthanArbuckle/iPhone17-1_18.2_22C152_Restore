@interface PXImageUtilities
+ (BOOL)symbolIsEmbeddedGlyph:(id)a3;
@end

@implementation PXImageUtilities

+ (BOOL)symbolIsEmbeddedGlyph:(id)a3
{
  return [a3 isEqualToString:@"spatial"];
}

@end