@interface PXPhotosGridTransitionAssetMapping
- (void)enumerateTransitionAssetsUsingBlock:(id *)a1;
@end

@implementation PXPhotosGridTransitionAssetMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionViews, 0);
  objc_storeStrong((id *)&self->_toRegions, 0);
  objc_storeStrong((id *)&self->_fromRegions, 0);
  objc_storeStrong((id *)&self->_assetReferences, 0);
}

- (void)enumerateTransitionAssetsUsingBlock:(id *)a1
{
  v9 = a2;
  if (a1 && [a1[1] count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [a1[4] objectAtIndexedSubscript:v3];
      v5 = [MEMORY[0x1E4F1CA98] null];

      if (v4 != v5)
      {
        v6 = [a1[1] objectAtIndexedSubscript:v3];
        v7 = [a1[2] objectAtIndexedSubscript:v3];
        v8 = [a1[3] objectAtIndexedSubscript:v3];
        v9[2](v9, v6, v7, v8, v4);
      }
      ++v3;
    }
    while (v3 < [a1[1] count]);
  }
}

@end