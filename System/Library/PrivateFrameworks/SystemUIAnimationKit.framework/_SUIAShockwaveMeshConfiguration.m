@interface _SUIAShockwaveMeshConfiguration
+ (id)meshConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7 usesIntelligentFillLight:(BOOL)a8;
+ (int64_t)configurationType;
- (CAMeshTransform)meshTransform;
- (CATransform3D)viewTransform;
- (CGRect)meshFrame;
- (void)_setMeshFrame:(CGRect)a3;
- (void)_setMeshTransform:(id)a3;
- (void)_setViewTransform:(CATransform3D *)a3;
@end

@implementation _SUIAShockwaveMeshConfiguration

- (void)_setMeshFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"meshFrame"];
}

- (CGRect)meshFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"meshFrame"];
  [v2 getValue:&v7 size:32];

  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setMeshTransform:(id)a3
{
}

- (CAMeshTransform)meshTransform
{
  return (CAMeshTransform *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"meshTransform"];
}

- (void)_setViewTransform:(CATransform3D *)a3
{
  propertyDictionary = self->super._propertyDictionary;
  long long v4 = *(_OWORD *)&a3->m33;
  v9[4] = *(_OWORD *)&a3->m31;
  v9[5] = v4;
  long long v5 = *(_OWORD *)&a3->m43;
  v9[6] = *(_OWORD *)&a3->m41;
  v9[7] = v5;
  long long v6 = *(_OWORD *)&a3->m13;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v6;
  long long v7 = *(_OWORD *)&a3->m23;
  v9[2] = *(_OWORD *)&a3->m21;
  v9[3] = v7;
  long long v8 = [MEMORY[0x263F08D40] valueWithCATransform3D:v9];
  [(NSMutableDictionary *)propertyDictionary setObject:v8 forKey:@"viewTransform"];
}

- (CATransform3D)viewTransform
{
  long long v4 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"viewTransform"];
  if (v4)
  {
    long long v6 = v4;
    [v4 CATransform3DValue];
    long long v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

+ (int64_t)configurationType
{
  return 2;
}

+ (id)meshConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7 usesIntelligentFillLight:(BOOL)a8
{
  BOOL v8 = a8;
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  CGFloat v12 = a5.size.height;
  CGFloat v13 = a5.size.width;
  double v14 = a5.origin.y;
  double v15 = a5.origin.x;
  id v18 = a6;
  v19 = objc_alloc_init(_SUIAShockwaveMeshConfiguration);
  v20 = [v18 meshPointsAnimationSettings];
  v21 = [v18 meshPointsCancelledAnimationSettings];
  v22 = [v18 meshPositionAnimationSettings];
  uint64_t v23 = SUIAScreenEdgeForNormalizedButtonRect();
  if (a4 == 2 || a4 == 1) {
    goto LABEL_6;
  }
  if (!a4)
  {
    if (![v18 useSiriMeshForCapture])
    {
      uint64_t v24 = +[_SUIAShockwaveMeshes captureButtonMesh];
LABEL_7:
      v25 = (void *)v24;
      goto LABEL_9;
    }
LABEL_6:
    uint64_t v24 = +[_SUIAShockwaveMeshes siriButtonAndEdgeMesh];
    goto LABEL_7;
  }
  v25 = 0;
LABEL_9:
  memset(&v88, 0, sizeof(v88));
  CATransform3DMakeScale(&v88, 1.0, -1.0, 1.0);
  if (v23 == 2)
  {
    CATransform3D v86 = v88;
    CGFloat v26 = 1.57079633;
  }
  else
  {
    if (v23 == 1) {
      goto LABEL_16;
    }
    CATransform3D v86 = v88;
    if (v23 == 8) {
      CGFloat v26 = -1.57079633;
    }
    else {
      CGFloat v26 = 3.14159265;
    }
  }
  CATransform3DRotate(&v87, &v86, v26, 0.0, 0.0, 1.0);
  CATransform3D v88 = v87;
LABEL_16:
  double v83 = v15;
  double v84 = v13;
  double v82 = v12;
  CATransform3D v87 = v88;
  [(_SUIAShockwaveMeshConfiguration *)v19 _setViewTransform:&v87];
  BSRectWithSize();
  if ((unint64_t)a3 > 5) {
    goto LABEL_52;
  }
  if (((1 << a3) & 0x2C) != 0)
  {
    v90.origin.CGFloat x = x;
    v90.origin.CGFloat y = y;
    v90.size.CGFloat width = width;
    v90.size.CGFloat height = height;
    CGRectGetWidth(v90);
    v91.origin.CGFloat x = x;
    v91.origin.CGFloat y = y;
    v91.size.CGFloat width = width;
    v91.size.CGFloat height = height;
    CGRectGetHeight(v91);
    [v18 meshSquareFinalSizeDiagonalRatio];
    if (v23 == 4 || v23 == 1)
    {
      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.CGFloat width = width;
      v92.size.CGFloat height = height;
      CGRectGetWidth(v92);
      [v18 meshRectangularFinalShortDimensionRatio];
      v93.origin.CGFloat x = x;
      v93.origin.CGFloat y = y;
      v93.size.CGFloat width = width;
      v93.size.CGFloat height = height;
      CGRectGetHeight(v93);
      [v18 meshRectangularFinalLongDimensionRatio];
    }
    v94.origin.CGFloat x = SUIAExpandNormalizedRect(x, y, width, height, v15);
    CGFloat v40 = v94.origin.x;
    double v41 = x;
    CGFloat v42 = v94.origin.y;
    CGFloat v43 = v94.size.width;
    CGFloat v44 = v94.size.height;
    CGRectGetMidX(v94);
    v95.origin.CGFloat x = v40;
    v95.origin.CGFloat y = v42;
    v95.size.CGFloat width = v43;
    v95.size.CGFloat height = v44;
    CGRectGetMidY(v95);
    CGFloat rect = width;
    if (objc_msgSend(v18, "shouldBehaveLikeLargeScreen:", width, height))
    {
      [v18 meshFinalProportionTowardsCenterOnLargeDisplays];
      UIRectGetCenter();
      CGFloat v45 = v41;
      CGFloat v46 = y;
      CGFloat v47 = height;
      UIRectGetCenter();
    }
    else
    {
      CGFloat v47 = height;
      CGFloat v45 = v41;
      CGFloat v46 = y;
    }
    if (v23 == 2)
    {
      v96.origin.CGFloat x = v45;
      v96.origin.CGFloat y = v46;
      v96.size.CGFloat width = rect;
      v96.size.CGFloat height = v47;
      CGRectGetWidth(v96);
      v97.origin.CGFloat x = v45;
      v97.origin.CGFloat y = v46;
      v97.size.CGFloat width = rect;
      v97.size.CGFloat height = v47;
      CGRectGetWidth(v97);
      [v18 meshFinalProportionAcrossScreenLongEdge];
    }
    else if (v23 == 1)
    {
      v98.origin.CGFloat x = v45;
      v98.origin.CGFloat y = v46;
      v98.size.CGFloat width = rect;
      v98.size.CGFloat height = v47;
      CGRectGetHeight(v98);
      [v18 meshFinalProportionAcrossScreenShortEdge];
    }
    else
    {
      CGFloat v48 = v45;
      CGFloat v49 = v46;
      CGFloat v50 = rect;
      CGFloat v51 = v47;
      if (v23 == 8)
      {
        CGRectGetWidth(*(CGRect *)&v48);
        [v18 meshFinalProportionAcrossScreenLongEdge];
      }
      else
      {
        CGRectGetHeight(*(CGRect *)&v48);
        v99.origin.CGFloat x = v45;
        v99.origin.CGFloat y = v46;
        v99.size.CGFloat width = rect;
        v99.size.CGFloat height = v47;
        CGRectGetHeight(v99);
        [v18 meshFinalProportionAcrossScreenShortEdge];
      }
    }
    BSRectCenteredAboutPoint();
    -[_SUIAShockwaveMeshConfiguration _setMeshFrame:](v19, "_setMeshFrame:");
    if (a4)
    {
      uint64_t v69 = 7;
    }
    else
    {
      if (v8) {
        [v18 visionIntelligenceHintRetargetImpulse];
      }
      else {
        [v18 captureHintRetargetImpulse];
      }
      double v71 = v70;
      v72 = (void *)[v20 copy];

      [v72 retargetImpulse];
      [v72 setRetargetImpulse:v71 + v73];
      v74 = (void *)[v21 copy];

      [v74 retargetImpulse];
      [v74 setRetargetImpulse:v71 + v75];
      v76 = (void *)[v22 copy];

      [v76 retargetImpulse];
      [v76 setRetargetImpulse:v71 + v77];
      if ([v18 useSiriMeshForCapture]) {
        uint64_t v69 = 7;
      }
      else {
        uint64_t v69 = 9;
      }
      v22 = v76;
      v21 = v74;
      v20 = v72;
    }
    [(_SUIAAbstractDictionaryBackedConfiguration *)v19 _setBehaviorSettings:v22 forKeypath:@"meshFrame"];
    v78 = +[_SUIAShockwaveMeshes identityMeshTransformRows:v69 columns:v69];
    [(_SUIAShockwaveMeshConfiguration *)v19 _setMeshTransform:v78];

    if (a3 == 5) {
      v79 = v21;
    }
    else {
      v79 = v20;
    }
    [(_SUIAAbstractDictionaryBackedConfiguration *)v19 _setBehaviorSettings:v79 forKeypath:@"meshTransform"];
    if (a3 != 5)
    {
      [v18 meshPointsEndTransitionDelay];
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v19, "_setDelay:forApplicationOfKeypath:", @"meshTransform");
    }
  }
  else
  {
    CGFloat v34 = v27;
    CGFloat v35 = v28;
    CGFloat v36 = v29;
    CGFloat v37 = v30;
    if (((1 << a3) & 0x11) != 0)
    {
      [(_SUIAShockwaveMeshConfiguration *)v19 _setMeshFrame:SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v27, v28, v29, v30, 1.0, v31, v32, v33, v83, v14, v84, v82, x, y, width, height)];
      [(_SUIAShockwaveMeshConfiguration *)v19 _setMeshTransform:v25];
      if (a3 != 4) {
        goto LABEL_52;
      }
      [(_SUIAAbstractDictionaryBackedConfiguration *)v19 _setBehaviorSettings:v22 forKeypath:@"meshFrame"];
      v38 = v19;
      v39 = v21;
    }
    else
    {
      double v52 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v27, v28, v29, v30, 1.0, v31, v32, v33, v83, v14, v84, v82, x, y, width, height);
      if (!a4)
      {
        objc_msgSend(v18, "captureHintMeshOffset", v52);
        double v60 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v34, v35, v36, v37, v56, v57, v58, v59, v83, v14, v84, v82, x, y, width, height);
        double v62 = v61;
        double v64 = v63;
        double v66 = v65;
        uint64_t v67 = [v18 captureHintAnimationSettings];

        uint64_t v68 = [v18 captureHintAnimationSettings];

        double v55 = v66;
        double v54 = v64;
        double v53 = v62;
        double v52 = v60;
        v22 = (void *)v67;
        v20 = (void *)v68;
      }
      -[_SUIAShockwaveMeshConfiguration _setMeshFrame:](v19, "_setMeshFrame:", v52, v53, v54, v55);
      [(_SUIAAbstractDictionaryBackedConfiguration *)v19 _setBehaviorSettings:v22 forKeypath:@"meshFrame"];
      [(_SUIAShockwaveMeshConfiguration *)v19 _setMeshTransform:v25];
      v38 = v19;
      v39 = v20;
    }
    [(_SUIAAbstractDictionaryBackedConfiguration *)v38 _setBehaviorSettings:v39 forKeypath:@"meshTransform"];
  }
LABEL_52:

  return v19;
}

@end