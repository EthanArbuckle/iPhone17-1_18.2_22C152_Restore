@interface SiriSharedUIAnimationUtilities
+ (double)_springDurationForInsertAnimation;
+ (double)_springDurationForMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
+ (double)animationBeginTimeForStyle:(int64_t)a3;
+ (double)animationCoefficient;
+ (double)animationDurationForStyle:(int64_t)a3;
+ (double)animationDurationForStyle:(int64_t)a3 presentationType:(int64_t)a4;
+ (double)defaultAnimationDuration;
+ (id)_centeringAnimationForInitialScale:(double)a3 width:(double)a4;
+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4;
+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4 presentationType:(int64_t)a5;
+ (id)defaultTimingFunction;
+ (void)perfomAnimationBlockWithAnimationBlock:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation SiriSharedUIAnimationUtilities

+ (id)defaultTimingFunction
{
  LODWORD(v2) = 1044401829;
  LODWORD(v3) = 991345561;
  LODWORD(v4) = 1057634019;
  LODWORD(v5) = 1064732459;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :v3 :v4 :v5];
}

+ (double)defaultAnimationDuration
{
  +[SiriSharedUIAnimationUtilities animationCoefficient];
  return v2 + v2;
}

+ (double)animationCoefficient
{
  UIAnimationDragCoefficient();
  return v2;
}

+ (double)animationDurationForStyle:(int64_t)a3
{
  [a1 animationDurationForStyle:a3 presentationType:0];
  return result;
}

+ (double)animationDurationForStyle:(int64_t)a3 presentationType:(int64_t)a4
{
  switch(a3)
  {
    case 0:
    case 1:
    case 5:
      double v4 = 0.5;
      if (a4 == 1)
      {
        [a1 _springDurationForInsertAnimation];
        double v4 = v5;
      }
      break;
    case 2:
      double v4 = 0.2;
      break;
    case 3:
      double v4 = 0.5;
      break;
    case 4:
      double v4 = 0.1;
      break;
    default:
      double v4 = 0.0;
      break;
  }
  +[SiriSharedUIAnimationUtilities animationCoefficient];
  return v4 * v6;
}

+ (void)perfomAnimationBlockWithAnimationBlock:(id)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  [v8 animationDuration];
  v11 = (void *)MEMORY[0x263F82E00];
  if (v10 <= 0.0)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke_2;
    v15[3] = &unk_2640E3AA0;
    v14 = &v16;
    id v16 = v7;
    [v11 performWithoutAnimation:v15];
    if (v9) {
      v9[2](v9, 1);
    }
  }
  else
  {
    double v12 = v10;
    uint64_t v13 = [v8 animationOptions];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke;
    v17[3] = &unk_2640E3AA0;
    v14 = &v18;
    id v18 = v7;
    [v11 animateWithDuration:v13 delay:v17 options:v9 animations:v12 completion:0.0];
  }
}

uint64_t __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__SiriSharedUIAnimationUtilities_perfomAnimationBlockWithAnimationBlock_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (double)animationBeginTimeForStyle:(int64_t)a3
{
  [a1 animationBeginTimeForStyle:a3 presentationType:0];
  return result;
}

+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4
{
  return (id)[a1 animationForStyle:a3 expectedWidthForStyle:a4 presentationType:0];
}

+ (id)animationForStyle:(int64_t)a3 expectedWidthForStyle:(id)a4 presentationType:(int64_t)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  BOOL v8 = SiriSharedUIReducedMotionEnabled();
  switch(a3)
  {
    case 0:
    case 5:
      double v5 = [MEMORY[0x263F15750] animation];
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:a3 presentationType:a5];
      objc_msgSend(v5, "setDuration:");
      +[SiriSharedUIAnimationUtilities animationBeginTimeForStyle:a3 presentationType:a5];
      objc_msgSend(v5, "setBeginTime:");
      [v5 setFillMode:*MEMORY[0x263F15AA0]];
      v9 = +[SiriSharedUIAnimationUtilities defaultTimingFunction];
      [v5 setTimingFunction:v9];

      double v10 = [MEMORY[0x263F15890] animation];
      [v10 setKeyPath:@"transform.translation.y"];
      [v10 setFromValue:&unk_26C1AE680];
      [v10 setToValue:&unk_26C1AE690];
      double v11 = 2.5;
      if (a5 == 1)
      {
        double v12 = 200.0;
      }
      else
      {
        double v11 = 3.0;
        double v12 = 1000.0;
      }
      if (a5 == 1) {
        double v13 = 300.0;
      }
      else {
        double v13 = 1000.0;
      }
      if (a5 == 1) {
        double v14 = 50.0;
      }
      else {
        double v14 = 500.0;
      }
      if (a5 == 1) {
        double v15 = 2.0;
      }
      else {
        double v15 = 3.0;
      }
      [v10 setMass:v11];
      [v10 setStiffness:v12];
      [v10 setDamping:dbl_20CA891E0[a5 == 1]];
      id v16 = [MEMORY[0x263F15890] animation];
      [v16 setKeyPath:@"opacity"];
      [v16 setFromValue:&unk_26C1AE690];
      [v16 setToValue:&unk_26C1AE6A0];
      [v16 setMass:3.0];
      [v16 setStiffness:v13];
      [v16 setDamping:v14];
      v17 = [MEMORY[0x263F15890] animation];
      [v17 setKeyPath:@"transform.scale"];
      [v17 setFromValue:&unk_26C1AE6B0];
      [v17 setToValue:&unk_26C1AE6A0];
      [v17 setMass:v15];
      [v17 setStiffness:v13];
      [v17 setDamping:v14];
      id v18 = [MEMORY[0x263F15890] animation];
      [v18 setKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v18 setFromValue:&unk_26C1AE6C0];
      [v18 setToValue:&unk_26C1AE690];
      [v18 setMass:2.0];
      [v18 setStiffness:300.0];
      [v18 setDamping:50.0];
      if (v8)
      {
        v44[0] = v16;
        v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      }
      else
      {
        v30 = (void *)MEMORY[0x263EFF980];
        v43[0] = v10;
        v43[1] = v16;
        v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
        v19 = [v30 arrayWithArray:v31];

        if (a5 == 1) {
          v32 = v18;
        }
        else {
          v32 = v17;
        }
        [v19 addObject:v32];
      }
      [v5 setAnimations:v19];

      goto LABEL_36;
    case 1:
      double v5 = [MEMORY[0x263F15750] animation];
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:1 presentationType:a5];
      objc_msgSend(v5, "setDuration:");
      [v5 setBeginTime:CACurrentMediaTime()];
      [v5 setFillMode:*MEMORY[0x263F15AA0]];
      v25 = +[SiriSharedUIAnimationUtilities defaultTimingFunction];
      [v5 setTimingFunction:v25];

      double v10 = [MEMORY[0x263F15890] animation];
      [v10 setKeyPath:@"transform.translation.y"];
      [v10 setFromValue:&unk_26C1AE690];
      [v10 setToValue:&unk_26C1AE6D0];
      [v10 setMass:3.0];
      [v10 setStiffness:1000.0];
      [v10 setDamping:500.0];
      id v16 = [MEMORY[0x263F15890] animation];
      [v16 setKeyPath:@"opacity"];
      [v16 setFromValue:&unk_26C1AE6A0];
      [v16 setToValue:&unk_26C1AE690];
      [v16 setMass:3.0];
      [v16 setStiffness:1000.0];
      [v16 setDamping:500.0];
      if (v8)
      {
        v42 = v16;
        v26 = (void *)MEMORY[0x263EFF8C0];
        v27 = &v42;
        uint64_t v28 = 1;
      }
      else
      {
        v41[0] = v10;
        v41[1] = v16;
        v26 = (void *)MEMORY[0x263EFF8C0];
        v27 = (void **)v41;
        uint64_t v28 = 2;
      }
      v36 = [v26 arrayWithObjects:v27 count:v28];
      [v5 setAnimations:v36];

      goto LABEL_36;
    case 2:
      double v5 = [MEMORY[0x263F15750] animation];
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:2 presentationType:a5];
      objc_msgSend(v5, "setDuration:");
      v29 = +[SiriSharedUIAnimationUtilities defaultTimingFunction];
      [v5 setTimingFunction:v29];

      [v5 setRemovedOnCompletion:0];
      double v10 = [MEMORY[0x263F15890] animation];
      [v10 setKeyPath:@"opacity"];
      [v10 setFromValue:&unk_26C1AE6A0];
      [v10 setToValue:&unk_26C1AE690];
      [v10 setMass:3.0];
      [v10 setStiffness:1000.0];
      [v10 setDamping:500.0];
      v38 = v10;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
      [v5 setAnimations:v16];
      goto LABEL_36;
    case 3:
    case 4:
      double v5 = [MEMORY[0x263F15750] animation];
      +[SiriSharedUIAnimationUtilities animationDurationForStyle:a3 presentationType:a5];
      objc_msgSend(v5, "setDuration:");
      +[SiriSharedUIAnimationUtilities animationBeginTimeForStyle:a3 presentationType:a5];
      objc_msgSend(v5, "setBeginTime:");
      [v5 setFillMode:*MEMORY[0x263F15AA0]];
      v20 = +[SiriSharedUIAnimationUtilities defaultTimingFunction];
      [v5 setTimingFunction:v20];

      [v5 setRemovedOnCompletion:0];
      double v10 = [MEMORY[0x263F15890] animation];
      [v10 setKeyPath:@"opacity"];
      [v10 setFromValue:&unk_26C1AE690];
      [v10 setToValue:&unk_26C1AE6A0];
      [v10 setMass:3.0];
      [v10 setStiffness:1000.0];
      [v10 setDamping:500.0];
      id v16 = [MEMORY[0x263F15890] animation];
      [v16 setKeyPath:@"transform.translation.y"];
      [v16 setFromValue:&unk_26C1AE6E0];
      [v16 setToValue:&unk_26C1AE690];
      [v16 setMass:3.0];
      [v16 setStiffness:1000.0];
      [v16 setDamping:500.0];
      v21 = [MEMORY[0x263F15890] animation];
      [v21 setKeyPath:@"transform.scale.xy"];
      [v21 setFromValue:&unk_26C1AE6B0];
      [v21 setToValue:&unk_26C1AE6F0];
      [v21 setMass:3.0];
      [v21 setStiffness:1000.0];
      [v21 setDamping:500.0];
      v22 = [MEMORY[0x263F15890] animation];
      [v22 setKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v22 setFromValue:&unk_26C1AE6C0];
      [v22 setToValue:&unk_26C1AE690];
      [v22 setMass:3.0];
      [v22 setStiffness:1000.0];
      [v22 setDamping:500.0];
      int v23 = a3 == 4 || v8;
      if (v23 == 1)
      {
        v40 = v10;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      }
      else
      {
        v33 = (void *)MEMORY[0x263EFF980];
        v39[0] = v16;
        v39[1] = v10;
        v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
        v24 = [v33 arrayWithArray:v34];

        if (a5 == 1) {
          v35 = v22;
        }
        else {
          v35 = v21;
        }
        [v24 addObject:v35];
      }
      [v5 setAnimations:v24];

LABEL_36:
      break;
    default:
      break;
  }
  return v5;
}

+ (id)_centeringAnimationForInitialScale:(double)a3 width:(double)a4
{
  double v6 = [MEMORY[0x263F15890] animation];
  [v6 setKeyPath:@"transform.translation.x"];
  id v7 = [NSNumber numberWithDouble:(1.0 - a3) * (a4 * 0.5)];
  [v6 setFromValue:v7];

  [v6 setToValue:&unk_26C1AE690];
  return v6;
}

+ (double)_springDurationForInsertAnimation
{
  [a1 _springDurationForMass:2.0 stiffness:300.0 damping:50.0];
  return result;
}

+ (double)_springDurationForMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  id v8 = objc_alloc_init(MEMORY[0x263F15890]);
  [v8 setMass:a3];
  [v8 setStiffness:a4];
  [v8 setDamping:a5];
  [v8 settlingDuration];
  double v10 = v9;

  return v10;
}

@end