@interface VGExpressionIsSmileClosedMouthFilter
- (float)filter:(id)a3;
- (int)rejectionReason;
@end

@implementation VGExpressionIsSmileClosedMouthFilter

- (int)rejectionReason
{
  return 22;
}

- (float)filter:(id)a3
{
  v3 = +[VGExpressionFilterLegacy getBlendshapes:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 bytes];
    LODWORD(v6) = *(_DWORD *)(v5 + 120);
    LODWORD(v7) = 0.5;
    LODWORD(v8) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:v6 min_val:v8 max_val:v7];
    float v10 = v9;
    LODWORD(v11) = *(_DWORD *)(v5 + 124);
    LODWORD(v12) = 0.5;
    LODWORD(v13) = 1055286886;
    +[VGExpressionFilterLegacy clip_to_01:v11 min_val:v13 max_val:v12];
    float v15 = v10 * v14;
  }
  else
  {
    float v15 = 0.0;
  }

  return v15;
}

@end