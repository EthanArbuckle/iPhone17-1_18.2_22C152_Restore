@interface PBOfficeArtWriterClient
- (unsigned)eshSchemeColorIndexForOADSchemeColorValue:(int)a3 state:(id)a4;
@end

@implementation PBOfficeArtWriterClient

- (unsigned)eshSchemeColorIndexForOADSchemeColorValue:(int)a3 state:(id)a4
{
  return +[PBColorScheme eshSchemeColorIndexForOADSchemeColorValue:](PBColorScheme, "eshSchemeColorIndexForOADSchemeColorValue:", *(void *)&a3, a4);
}

@end