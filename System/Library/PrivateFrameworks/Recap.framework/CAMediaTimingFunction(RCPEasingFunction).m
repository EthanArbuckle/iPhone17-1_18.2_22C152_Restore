@interface CAMediaTimingFunction(RCPEasingFunction)
- (double)rcp_solveForDelta:()RCPEasingFunction withSteps:step:;
- (double)rcp_solveForStart:()RCPEasingFunction end:at:;
- (id)rcp_functionWithLinearEnd;
@end

@implementation CAMediaTimingFunction(RCPEasingFunction)

- (double)rcp_solveForStart:()RCPEasingFunction end:at:
{
  double v7 = a2;
  *(float *)&a2 = a6;
  [a1 _solveForInput:a2];
  return v7 + (a4 - v7) * v8;
}

- (double)rcp_solveForDelta:()RCPEasingFunction withSteps:step:
{
  *(float *)&a6 = (float)a9 / (float)a8;
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  float v14 = (float)((float)a9 + 1.0) / (float)a8;
  objc_msgSend(a1, "rcp_solveForStart:end:at:", *MEMORY[0x1E4F1DAD8], v13, a2, a3, a6);
  double v16 = v15;
  *(float *)&double v17 = v14;
  objc_msgSend(a1, "rcp_solveForStart:end:at:", v12, v13, a2, a3, v17);
  return v18 - v16;
}

- (id)rcp_functionWithLinearEnd
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  [a1 getControlPointAtIndex:1 values:v7];
  LODWORD(v2) = HIDWORD(v7[0]);
  LODWORD(v1) = v7[0];
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  v5 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v1 :v2 :v3 :v4];
  return v5;
}

@end