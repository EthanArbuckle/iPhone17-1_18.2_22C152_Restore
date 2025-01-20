@interface _UIWindowSceneActivationPrewarmActionResponse
+ (id)responseWithSceneContainer:(id)a3 expectedSceneFrame:(CGRect)a4 cornerRadii:(UIRectCornerRadii)a5;
- (CGRect)sceneFrame;
- (UIRectCornerRadii)sceneCornerRadii;
- (unint64_t)sceneContainerRenderId;
- (unsigned)sceneContainerContextId;
@end

@implementation _UIWindowSceneActivationPrewarmActionResponse

+ (id)responseWithSceneContainer:(id)a3 expectedSceneFrame:(CGRect)a4 cornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  v15 = objc_opt_new();
  v16 = [v14 layer];
  v17 = [v16 context];
  uint64_t v18 = [v17 contextId];

  v19 = [v14 layer];

  uint64_t RenderId = CALayerGetRenderId();
  v21 = [NSNumber numberWithUnsignedInt:v18];
  [v15 setObject:v21 forSetting:1];

  v22 = [NSNumber numberWithUnsignedLongLong:RenderId];
  [v15 setObject:v22 forSetting:2];

  *(CGFloat *)v30 = x;
  *(CGFloat *)&v30[1] = y;
  *(CGFloat *)&v30[2] = width;
  *(CGFloat *)&v30[3] = height;
  v23 = [MEMORY[0x1E4F29238] valueWithBytes:v30 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v15 setObject:v23 forSetting:3];

  v24 = [NSNumber numberWithDouble:topLeft];
  [v15 setObject:v24 forSetting:4];

  v25 = [NSNumber numberWithDouble:topRight];
  [v15 setObject:v25 forSetting:5];

  v26 = [NSNumber numberWithDouble:bottomRight];
  [v15 setObject:v26 forSetting:6];

  v27 = [NSNumber numberWithDouble:bottomLeft];
  [v15 setObject:v27 forSetting:7];

  v28 = [a1 responseWithInfo:v15];

  return v28;
}

- (unsigned)sceneContainerContextId
{
  v2 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  v3 = [v2 objectForSetting:1];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)sceneContainerRenderId
{
  v2 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (CGRect)sceneFrame
{
  v2 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  v3 = [v2 objectForSetting:3];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (UIRectCornerRadii)sceneCornerRadii
{
  v3 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  double v4 = [v3 objectForSetting:4];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  double v8 = [v7 objectForSetting:5];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  double v12 = [v11 objectForSetting:7];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = [(_UIWindowSceneActivationPrewarmActionResponse *)self info];
  v16 = [v15 objectForSetting:6];
  [v16 doubleValue];
  double v18 = v17;

  double v19 = v6;
  double v20 = v14;
  double v21 = v18;
  double v22 = v10;
  result.double topRight = v22;
  result.double bottomRight = v21;
  result.double bottomLeft = v20;
  result.double topLeft = v19;
  return result;
}

@end