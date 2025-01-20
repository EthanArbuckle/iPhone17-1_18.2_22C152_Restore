@interface KNBuildSparkle
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4;
- (void)animationDidEndWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildSparkle

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNSparkle";
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499AD0;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-sparkle";
}

+ (id)defaultAttributes
{
  CFStringRef v3 = @"KNBuildAttributesDuration";
  v4 = &off_498FF8;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 3;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  [a4 drawableFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  self->_drawableFrame = v9;
  CGRectGetMinX(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMinY(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMaxX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetMaxY(v12);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinY(v13);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxY(v14);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinX(v15);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxX(v16);
  self = (KNBuildSparkle *)((char *)self + 184);
  TSDRectWithPoints();
  *(CGRect *)&self->super.super.isa = v17;
  CGRect result = CGRectIntegral(v17);
  *(CGRect *)&self->super.super.isa = result;
  return result;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "textures"), "objectAtIndexedSubscript:", 0), "contentRect");
  CGFloat x = v8.origin.x;
  CGFloat y = v8.origin.y;
  CGFloat width = v8.size.width;
  CGFloat height = v8.size.height;
  self->_drawableFrame = v8;
  CGRectGetMinX(v8);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetMinY(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMaxY(v11);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinY(v12);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxY(v13);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMinX(v14);
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxX(v15);
  self = (KNBuildSparkle *)((char *)self + 184);
  TSDRectWithPoints();
  *(CGRect *)&self->super.super.isa = v16;
  CGRect result = CGRectIntegral(v16);
  *(CGRect *)&self->super.super.isa = result;
  return result;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v5 = [a3 textures];
  id v6 = [a3 animatedBuild];
  objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "frame");
  -[KNBuildSparkle frameOfEffectWithFrame:context:](self, "frameOfEffectWithFrame:context:", a3);
  if ([v5 count] != (char *)&dword_0 + 1) {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildSparkle animationWillBeginWithContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildSparkle.m"), 172, @"Effect expects one texture. Passed (%ld) textures.", objc_msgSend(v5, "count"));
  }
  id v7 = [v6 direction];
  id v8 = [v5 lastObject];
  if (self)
  {
    [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:a3];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
  }
  long long v9 = v33;
  *(_OWORD *)&self->_baseTransform.m31 = v32;
  *(_OWORD *)&self->_baseTransform.m33 = v9;
  long long v10 = v35;
  *(_OWORD *)&self->_baseTransform.m41 = v34;
  *(_OWORD *)&self->_baseTransform.m43 = v10;
  long long v11 = v29;
  *(_OWORD *)&self->_baseTransform.m11 = v28;
  *(_OWORD *)&self->_baseTransform.m13 = v11;
  long long v12 = v31;
  *(_OWORD *)&self->_baseTransform.m21 = v30;
  *(_OWORD *)&self->_baseTransform.m23 = v12;
  CGRect v13 = [KNSparkleEffect alloc];
  mAnimationContext = self->super.mAnimationContext;
  [v6 duration];
  double v16 = v15;
  id v17 = [v6 buildType];
  id v18 = [a3 metalContext];
  id v19 = [a3 randomGenerator];
  double x = self->_frameRect.origin.x;
  double y = self->_frameRect.origin.y;
  double width = self->_frameRect.size.width;
  double height = self->_frameRect.size.height;
  long long v24 = *(_OWORD *)&self->_baseTransform.m33;
  long long v32 = *(_OWORD *)&self->_baseTransform.m31;
  long long v33 = v24;
  long long v25 = *(_OWORD *)&self->_baseTransform.m43;
  long long v34 = *(_OWORD *)&self->_baseTransform.m41;
  long long v35 = v25;
  long long v26 = *(_OWORD *)&self->_baseTransform.m13;
  long long v28 = *(_OWORD *)&self->_baseTransform.m11;
  long long v29 = v26;
  long long v27 = *(_OWORD *)&self->_baseTransform.m23;
  long long v30 = *(_OWORD *)&self->_baseTransform.m21;
  long long v31 = v27;
  self->_effect = -[KNSparkleEffect initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:](v13, "initWithAnimationContext:texture:destinationRect:translate:duration:direction:buildType:metalContext:randomGenerator:", mAnimationContext, v8, &v28, v7, v17, v18, x, y, width, height, v16, v19);
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)animationDidEndWithContext:(id)a3
{
  self->_effect = 0;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  [a3 drawableFrame];
  self->_drawableFrame.origin.double x = v5;
  self->_drawableFrame.origin.double y = v6;
  self->_drawableFrame.size.double width = v7;
  self->_drawableFrame.size.double height = v8;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_frameRect.origin.double x = v9;
  self->_frameRect.origin.double y = v10;
  self->_frameRect.size.double width = v11;
  self->_frameRect.size.double height = v12;

  [(KNBuildSparkle *)self animationWillBeginWithContext:a3];
}

- (void)metalRenderFrameWithContext:(id)a3
{
  effect = self->_effect;
  [a3 percent];
  double v6 = v5;
  id v7 = [a3 metalContext];

  [(KNSparkleEffect *)effect renderEffectAtPercent:v7 withContext:v6];
}

@end