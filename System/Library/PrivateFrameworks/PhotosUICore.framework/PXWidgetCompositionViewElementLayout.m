@interface PXWidgetCompositionViewElementLayout
+ (PXTileIdentifier)viewTileIdentifier;
- (PXWidgetCompositionViewElementLayout)init;
@end

@implementation PXWidgetCompositionViewElementLayout

- (PXWidgetCompositionViewElementLayout)init
{
  v3 = objc_opt_class();
  if (v3)
  {
    [v3 viewTileIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  v5.receiver = self;
  v5.super_class = (Class)PXWidgetCompositionViewElementLayout;
  return [(PXSingleTileLayout *)&v5 initWithTileIdentifier:v6];
}

+ (PXTileIdentifier)viewTileIdentifier
{
  retstr->index[9] = 0;
  *(_OWORD *)&retstr->index[5] = 0u;
  *(_OWORD *)&retstr->index[7] = 0u;
  *(_OWORD *)&retstr->index[1] = 0u;
  *(_OWORD *)&retstr->index[3] = 0u;
  *(_OWORD *)&retstr->length = xmmword_1AB35A1A0;
  return result;
}

@end