@interface NTKCFaceDetailCollectionCellLabel
@end

@implementation NTKCFaceDetailCollectionCellLabel

double __49___NTKCFaceDetailCollectionCellLabel__textBounds__block_invoke(uint64_t a1)
{
  uint64_t v2 = NTKCScreenStyle();
  v3 = (char *)&unk_1BC8A0500 + 8 * (*(unsigned char *)(a1 + 32) == 0);
  if (v2 == 1) {
    v3 = (char *)&unk_1BC8A04F0 + 8 * (*(unsigned char *)(a1 + 32) == 0);
  }
  return *(double *)v3;
}

@end