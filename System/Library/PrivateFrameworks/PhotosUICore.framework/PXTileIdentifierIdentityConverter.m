@interface PXTileIdentifierIdentityConverter
- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4;
@end

@implementation PXTileIdentifierIdentityConverter

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  return 1;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  return 1;
}

@end