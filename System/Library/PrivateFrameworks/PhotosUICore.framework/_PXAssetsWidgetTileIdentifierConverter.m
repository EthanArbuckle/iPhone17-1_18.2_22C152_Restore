@interface _PXAssetsWidgetTileIdentifierConverter
- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4;
@end

@implementation _PXAssetsWidgetTileIdentifierConverter

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  return a3->length == 1 && a3->index[0] >> 1 == 16050;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  return a3->length == 1 && a3->index[0] >> 1 == 16050;
}

@end