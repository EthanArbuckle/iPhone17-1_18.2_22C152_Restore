@interface VGExpressionIsOtherFilter
- (float)filter:(id)a3;
@end

@implementation VGExpressionIsOtherFilter

- (float)filter:(id)a3
{
  v3 = +[VGExpressionFilterLegacy getBlendshapes:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    v6 = (_DWORD *)[v5 bytes];
    unint64_t v7 = [v5 length];
    if (v7 >= 4)
    {
      unint64_t v12 = v7 >> 2;
      float v11 = 1.1755e-38;
      do
      {
        LODWORD(v8) = *v6;
        LODWORD(v9) = 0.5;
        LODWORD(v10) = 1058642330;
        +[VGExpressionFilterLegacy clip_to_01:v8 min_val:v9 max_val:v10];
        if (v11 <= *(float *)&v8) {
          float v11 = *(float *)&v8;
        }
        ++v6;
        --v12;
      }
      while (v12);
    }
    else
    {
      float v11 = 1.1755e-38;
    }
  }
  else
  {
    float v11 = 0.0;
  }

  return v11;
}

@end