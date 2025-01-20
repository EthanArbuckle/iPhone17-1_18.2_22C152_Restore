@interface SBFAnimationUtilities
+ (id)matchMoveAnimationForPinningToView:(id)a3;
@end

@implementation SBFAnimationUtilities

+ (id)matchMoveAnimationForPinningToView:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = [a3 layer];
  id v4 = objc_alloc_init(MEMORY[0x1E4F39C00]);
  [v4 setSourceLayer:v3];
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 0.0);
  v11[0] = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 0.0);
  v11[1] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 1.0, 1.0);
  v11[2] = v7;
  v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, 1.0);
  v11[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  [v4 setSourcePoints:v9];

  [v4 setUsesNormalizedCoordinates:1];
  [v4 setAppliesX:0];
  [v4 setAppliesY:0];
  [v4 setAppliesScale:1];
  [v4 setAppliesRotation:0];
  [v4 setDuration:INFINITY];
  [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v4 setRemovedOnCompletion:0];

  return v4;
}

@end