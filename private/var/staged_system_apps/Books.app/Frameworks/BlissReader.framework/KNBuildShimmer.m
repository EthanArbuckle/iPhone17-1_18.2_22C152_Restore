@interface KNBuildShimmer
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)localizedMenuString:(int)a3;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (void)animationDidEndWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildShimmer

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNShimmer";
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499A88;
}

+ (id)localizedMenuString:(int)a3
{
  v3 = KNBundle();
  v4 = [v3 localizedStringForKey:@"Shimmer *Shimmer Build*" value:@"Shimmer" table:@"Keynote"];

  return v4;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-shimmer";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  self->_drawableFrame = v16;
  CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRectGetMinY(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectGetMaxX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRectGetMaxY(v19);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  TSDRectWithPoints();
  self->_frameRect.origin.CGFloat x = v8;
  self->_frameRect.origin.CGFloat y = v9;
  self->_frameRect.size.CGFloat width = v10;
  self->_frameRect.size.CGFloat height = v11;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  v22.origin.CGFloat x = v12;
  v22.origin.CGFloat y = v13;
  v22.size.CGFloat width = v14;
  v22.size.CGFloat height = v15;
  CGRect v20 = CGRectIntersection(self->_frameRect, v22);
  self->_frameRect = v20;
  CGRect result = CGRectIntegral(v20);
  self->_frameRect = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildShimmer *)self metalPrepareAnimationWithContext:v4];
  v5 = [v4 textures];
  if ([v5 count] != (char *)&dword_0 + 1)
  {
    v6 = +[TSUAssertionHandler currentHandler];
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildShimmer animationWillBeginWithContext:]");
    CGFloat v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 151, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
  }
  CGFloat v9 = [v4 animatedBuild];
  id v33 = [v4 direction];
  v32 = [v5 lastObject];
  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:v4];
  long long v10 = v39;
  *(_OWORD *)&self->_baseTransform.m31 = v38;
  *(_OWORD *)&self->_baseTransform.m33 = v10;
  long long v11 = v41;
  *(_OWORD *)&self->_baseTransform.m41 = v40;
  *(_OWORD *)&self->_baseTransform.m43 = v11;
  long long v12 = v35;
  *(_OWORD *)&self->_baseTransform.m11 = v34;
  *(_OWORD *)&self->_baseTransform.m13 = v12;
  long long v13 = v37;
  *(_OWORD *)&self->_baseTransform.m21 = v36;
  *(_OWORD *)&self->_baseTransform.m23 = v13;
  CGFloat v14 = [KNShimmerEffect alloc];
  mAnimationContext = self->super.mAnimationContext;
  [v9 duration];
  double v17 = v16;
  id v18 = [v9 buildType];
  [v4 metalContext];
  CGRect v19 = v31 = v5;
  CGRect v20 = [v4 randomGenerator];
  double x = self->_frameRect.origin.x;
  double y = self->_frameRect.origin.y;
  double width = self->_frameRect.size.width;
  double height = self->_frameRect.size.height;
  long long v25 = *(_OWORD *)&self->_baseTransform.m33;
  long long v38 = *(_OWORD *)&self->_baseTransform.m31;
  long long v39 = v25;
  long long v26 = *(_OWORD *)&self->_baseTransform.m43;
  long long v40 = *(_OWORD *)&self->_baseTransform.m41;
  long long v41 = v26;
  long long v27 = *(_OWORD *)&self->_baseTransform.m13;
  long long v34 = *(_OWORD *)&self->_baseTransform.m11;
  long long v35 = v27;
  long long v28 = *(_OWORD *)&self->_baseTransform.m23;
  long long v36 = *(_OWORD *)&self->_baseTransform.m21;
  long long v37 = v28;
  v29 = -[KNShimmerEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:](v14, "initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:", mAnimationContext, v32, &v34, v33, v18, v19, x, y, width, height, v17, v20);
  effect = self->_effect;
  self->_effect = v29;
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)animationDidEndWithContext:(id)a3
{
  [(KNShimmerEffect *)self->_effect teardown];
  effect = self->_effect;
  self->_effect = 0;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  [a3 drawableFrame];
  self->_drawableFrame.origin.double x = v4;
  self->_drawableFrame.origin.double y = v5;
  self->_drawableFrame.size.double width = v6;
  self->_drawableFrame.size.double height = v7;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_frameRect.origin.double x = v8;
  self->_frameRect.origin.double y = v9;
  self->_frameRect.size.double width = v10;
  self->_frameRect.size.double height = v11;
}

- (void)metalRenderFrameWithContext:(id)a3
{
  effect = self->_effect;
  id v4 = a3;
  [v4 percent];
  double v6 = v5;
  id v7 = [v4 metalContext];

  [(KNShimmerEffect *)effect renderEffectAtPercent:v7 withContext:v6];
}

- (void).cxx_destruct
{
}

@end