@interface CAAnimation(PKCAUtilities)
+ (id)pkui_shakeAnimationWithInitalOffest:()PKCAUtilities springStiffness:springDamping:;
+ (uint64_t)pkui_shakeAnimation;
+ (uint64_t)pkui_smallShakeAnimation;
- (id)pkui_completionHandler;
- (id)pkui_didStartHandler;
- (void)pkui_setCompletionHandler:()PKCAUtilities;
- (void)pkui_setDidStartHandler:()PKCAUtilities;
@end

@implementation CAAnimation(PKCAUtilities)

+ (uint64_t)pkui_shakeAnimation
{
  return objc_msgSend(a1, "pkui_shakeAnimationWithInitalOffest:springStiffness:springDamping:", 75.0, 1200.0, 12.0);
}

+ (uint64_t)pkui_smallShakeAnimation
{
  return objc_msgSend(a1, "pkui_shakeAnimationWithInitalOffest:springStiffness:springDamping:", 40.0, 800.0, 10.0);
}

+ (id)pkui_shakeAnimationWithInitalOffest:()PKCAUtilities springStiffness:springDamping:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
  [v6 setAdditive:1];
  [v6 setMass:1.20000005];
  [v6 setStiffness:a2];
  [v6 setDamping:a3];
  LODWORD(v7) = 1028389654;
  LODWORD(v8) = 990057071;
  LODWORD(v9) = 1059712716;
  LODWORD(v10) = 1.0;
  v11 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :v8 :v9 :v10];
  [v6 setTimingFunction:v11];

  [v6 setInitialVelocity:0.0];
  uint64_t v12 = *MEMORY[0x1E4F39FA8];
  [v6 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v6 durationForEpsilon:0.001];
  objc_msgSend(v6, "setDuration:");
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(v6, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", a1, 0.0, *MEMORY[0x1E4F1DAD8], v14, a1, 0.0);
  v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  [v15 setAdditive:1];
  LODWORD(v16) = 1054276898;
  LODWORD(v17) = 1058305108;
  LODWORD(v18) = 1.0;
  v19 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v16 :0.0 :v17 :v18];
  [v15 setTimingFunction:v19];

  [v15 setDuration:0.100000001];
  [v15 setFillMode:v12];
  objc_msgSend(v15, "pkui_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", v13, v14, a1, 0.0, v13, v14);
  v20 = [MEMORY[0x1E4F39B38] animation];
  v27[0] = v6;
  v27[1] = v15;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v20 setAnimations:v21];

  [v6 duration];
  double v23 = v22;
  [v15 duration];
  if (v23 <= v24) {
    v25 = v15;
  }
  else {
    v25 = v6;
  }
  [v25 duration];
  objc_msgSend(v20, "setDuration:");

  return v20;
}

- (id)pkui_didStartHandler
{
  v1 = [a1 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 didStartHandler];
  }
  else
  {
    v2 = 0;
  }
  v3 = _Block_copy(v2);

  return v3;
}

- (void)pkui_setDidStartHandler:()PKCAUtilities
{
  id v5 = a3;
  v4 = [a1 delegate];
  if (v5 && !v4)
  {
    v4 = objc_alloc_init(PKUIAnimationDelegate);
    [a1 setDelegate:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PKUIAnimationDelegate *)v4 setDidStartHandler:v5];
  }
}

- (id)pkui_completionHandler
{
  v1 = [a1 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 completionHandler];
  }
  else
  {
    v2 = 0;
  }
  v3 = _Block_copy(v2);

  return v3;
}

- (void)pkui_setCompletionHandler:()PKCAUtilities
{
  id v6 = a3;
  v4 = [a1 delegate];
  if (!v4)
  {
    id v5 = v6;
    if (!v6) {
      goto LABEL_6;
    }
    v4 = objc_alloc_init(PKUIAnimationDelegate);
    [a1 setDelegate:v4];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __break(1u);
    return;
  }
  [(PKUIAnimationDelegate *)v4 setCompletionHandler:v6];

  id v5 = v6;
LABEL_6:
}

@end