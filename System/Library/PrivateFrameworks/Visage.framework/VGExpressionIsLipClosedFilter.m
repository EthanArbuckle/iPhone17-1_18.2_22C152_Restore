@interface VGExpressionIsLipClosedFilter
- (float)filter:(id)a3;
@end

@implementation VGExpressionIsLipClosedFilter

- (float)filter:(id)a3
{
  v3 = +[VGExpressionFilterLegacy getBlendshapes:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = [v3 bytes] + 96;
    float v10 = 1.1755e-38;
    do
    {
      LODWORD(v7) = *(_DWORD *)(v6 + v5);
      LODWORD(v8) = 1057803469;
      LODWORD(v9) = 1058642330;
      +[VGExpressionFilterLegacy clip_to_01:v7 min_val:v8 max_val:v9];
      *(float *)&double v7 = 1.0 - *(float *)&v7;
      if (v10 <= *(float *)&v7) {
        float v10 = *(float *)&v7;
      }
      v5 += 4;
    }
    while (v5 != 32);
  }
  else
  {
    float v10 = 0.0;
  }

  return v10;
}

@end