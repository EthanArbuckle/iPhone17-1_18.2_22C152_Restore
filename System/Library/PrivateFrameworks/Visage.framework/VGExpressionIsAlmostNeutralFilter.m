@interface VGExpressionIsAlmostNeutralFilter
- (VGExpressionIsAlmostNeutralFilter)initWithLowerBound:(float)a3 withUpperBound:(float)a4;
- (float)filter:(id)a3;
- (int)rejectionReason;
@end

@implementation VGExpressionIsAlmostNeutralFilter

- (int)rejectionReason
{
  return 20;
}

- (VGExpressionIsAlmostNeutralFilter)initWithLowerBound:(float)a3 withUpperBound:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VGExpressionIsAlmostNeutralFilter;
  v6 = [(VGExpressionIsAlmostNeutralFilter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_lowerBound = a3;
    v6->_upperBound = a4;
    v8 = v6;
  }

  return v7;
}

- (float)filter:(id)a3
{
  v4 = +[VGExpressionFilterLegacy getBlendshapes:a3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    unint64_t v8 = [v6 length];
    if (v8 < 0x3C)
    {
      float v14 = 1.1755e-38;
    }
    else
    {
      uint64_t v12 = (v8 >> 2) - 14;
      v13 = (_DWORD *)(v7 + 56);
      float v14 = 1.1755e-38;
      do
      {
        LODWORD(v9) = *v13;
        *(float *)&double v10 = self->_lowerBound;
        *(float *)&double v11 = self->_upperBound;
        +[VGExpressionFilterLegacy clip_to_01:v9 min_val:v10 max_val:v11];
        if (v14 <= *(float *)&v9) {
          float v14 = *(float *)&v9;
        }
        ++v13;
        --v12;
      }
      while (v12);
    }
    float v15 = 1.0 - v14;
  }
  else
  {
    float v15 = 0.0;
  }

  return v15;
}

@end