@interface VGExpressionIsMouthOpenFilter
- (float)filter:(id)a3;
- (int)rejectionReason;
@end

@implementation VGExpressionIsMouthOpenFilter

- (int)rejectionReason
{
  return 21;
}

- (float)filter:(id)a3
{
  v3 = +[VGExpressionFilterLegacy getBlendshapes:a3];
  v4 = v3;
  if (v3)
  {
    LODWORD(v5) = *(_DWORD *)([v3 bytes] + 76);
    LODWORD(v6) = 1050253722;
    LODWORD(v7) = 0.5;
    +[VGExpressionFilterLegacy clip_to_01:v5 min_val:v6 max_val:v7];
    float v9 = v8;
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

@end