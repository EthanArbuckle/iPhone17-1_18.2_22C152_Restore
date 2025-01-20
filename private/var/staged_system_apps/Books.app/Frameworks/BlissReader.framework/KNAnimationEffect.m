@interface KNAnimationEffect
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)localizedMenuString:(int)a3;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (id)updateDirectionAttributeValue:(int64_t)a3 andCustomTextDirectionValue:(unint64_t)a4 turnOffBounce:(BOOL)a5 forAttributes:(id)a6;
+ (int)animationCategory;
+ (unint64_t)directionType;
- (CATransform3D)mvpMatrixWithContext:(SEL)a3;
- (CATransform3D)mvpMatrixWithFrame:(SEL)a3 size:(CGPoint)a4;
- (CATransform3D)mvpMatrixWithTexture:(SEL)a3 andFrame:(id)a4;
- (CATransform3D)perspectiveMVPMatrixWithContext:(SEL)a3;
- (CATransform3D)perspectiveMVPMatrixWithTexture:(SEL)a3 andFrame:(id)a4;
- (KNAnimationEffect)initWithAnimationContext:(id)a3;
@end

@implementation KNAnimationEffect

- (KNAnimationEffect)initWithAnimationContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)KNAnimationEffect;
  result = [(KNAnimationEffect *)&v5 init];
  if (result) {
    result->mAnimationContext = (KNAnimationContext *)a3;
  }
  return result;
}

+ (id)animationName
{
  return 0;
}

+ (int)animationCategory
{
  return 205;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return 0;
}

+ (id)localizedMenuString:(int)a3
{
  return 0;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v3 = @"KNBuildAttributesDuration";
  v4 = &off_499C20;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return 0;
}

+ (id)updateDirectionAttributeValue:(int64_t)a3 andCustomTextDirectionValue:(unint64_t)a4 turnOffBounce:(BOOL)a5 forAttributes:(id)a6
{
  BOOL v7 = a5;
  id v10 = [a6 mutableCopy];
  [v10 setObject:[NSNumber numberWithInteger:a3] forKey:@"KNBuildAttributesDirection"];
  if (![a6 objectForKey:@"KNBuildCustomAttributesTextDelivery"]) {
    [v10 setObject:&off_499330 forKey:@"KNBuildCustomAttributesTextDelivery"];
  }
  [v10 setObject:[NSNumber numberWithUnsignedInteger:a4] forKey:@"KNBuildCustomAttributesDeliveryOption"];
  if (v7) {
    [v10 setObject:&__kCFBooleanFalse forKey:@"KNBuildCustomAttributesBounce"];
  }
  return v10;
}

- (CATransform3D)mvpMatrixWithContext:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  if (![a4 isTransition])
  {
    id v8 = objc_msgSend(objc_msgSend(a4, "textures"), "firstObject");
    if ([a4 isMetalRenderer])
    {
      [(KNAnimationContext *)self->mAnimationContext slideRect];
    }
    else
    {
      result = (CATransform3D *)[a4 drawableFrame];
      if (!self) {
        goto LABEL_8;
      }
    }
    result = -[KNAnimationEffect mvpMatrixWithTexture:andFrame:](self, "mvpMatrixWithTexture:andFrame:", v8);
    goto LABEL_9;
  }
  result = (CATransform3D *)self->mAnimationContext;
  if (!result)
  {
LABEL_8:
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    goto LABEL_9;
  }
  result = (CATransform3D *)[(CATransform3D *)result slideProjectionMatrix];
LABEL_9:
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  *(_OWORD *)&retstr->m41 = v15;
  *(_OWORD *)&retstr->m43 = v16;
  *(_OWORD *)&retstr->m11 = v9;
  *(_OWORD *)&retstr->m13 = v10;
  *(_OWORD *)&retstr->m21 = v11;
  *(_OWORD *)&retstr->m23 = v12;
  return result;
}

- (CATransform3D)mvpMatrixWithFrame:(SEL)a3 size:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  TSDTransform3DMakeOrtho();
  long long v8 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v17.m33 = v8;
  long long v9 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v17.m43 = v9;
  long long v10 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v17.m13 = v10;
  long long v11 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v17.m23 = v11;
  result = CATransform3DTranslate(&v18, &v17, x, -y, 0.0);
  long long v13 = *(_OWORD *)&v18.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v18.m31;
  *(_OWORD *)&retstr->m33 = v13;
  long long v14 = *(_OWORD *)&v18.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v18.m41;
  *(_OWORD *)&retstr->m43 = v14;
  long long v15 = *(_OWORD *)&v18.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v18.m11;
  *(_OWORD *)&retstr->m13 = v15;
  long long v16 = *(_OWORD *)&v18.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v18.m21;
  *(_OWORD *)&retstr->m23 = v16;
  return result;
}

- (CATransform3D)mvpMatrixWithTexture:(SEL)a3 andFrame:(id)a4
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  TSDTransform3DMakeOrtho();
  [a4 frameOnCanvas];
  double v12 = v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v13 = v12 - CGRectGetMinX(v28);
  [a4 frameOnCanvas];
  double v15 = v14;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v29);
  long long v17 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v26.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v26.m33 = v17;
  long long v18 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v26.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v26.m43 = v18;
  long long v19 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v26.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v26.m13 = v19;
  long long v20 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v26.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v26.m23 = v20;
  result = CATransform3DTranslate(&v27, &v26, v13, -(v15 - MaxY), 0.0);
  long long v22 = *(_OWORD *)&v27.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v27.m31;
  *(_OWORD *)&retstr->m33 = v22;
  long long v23 = *(_OWORD *)&v27.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v27.m41;
  *(_OWORD *)&retstr->m43 = v23;
  long long v24 = *(_OWORD *)&v27.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v27.m11;
  *(_OWORD *)&retstr->m13 = v24;
  long long v25 = *(_OWORD *)&v27.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v27.m21;
  *(_OWORD *)&retstr->m23 = v25;
  return result;
}

- (CATransform3D)perspectiveMVPMatrixWithContext:(SEL)a3
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  if (![a4 isTransition])
  {
    id v8 = objc_msgSend(objc_msgSend(a4, "textures"), "firstObject");
    if ([a4 isMetalRenderer])
    {
      [(KNAnimationContext *)self->mAnimationContext slideRect];
    }
    else
    {
      result = (CATransform3D *)[a4 drawableFrame];
      if (!self) {
        goto LABEL_8;
      }
    }
    result = -[KNAnimationEffect perspectiveMVPMatrixWithTexture:andFrame:](self, "perspectiveMVPMatrixWithTexture:andFrame:", v8);
    goto LABEL_9;
  }
  result = (CATransform3D *)self->mAnimationContext;
  if (!result)
  {
LABEL_8:
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    goto LABEL_9;
  }
  result = (CATransform3D *)[(CATransform3D *)result slideProjectionMatrix];
LABEL_9:
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  *(_OWORD *)&retstr->m41 = v15;
  *(_OWORD *)&retstr->m43 = v16;
  *(_OWORD *)&retstr->m11 = v9;
  *(_OWORD *)&retstr->m13 = v10;
  *(_OWORD *)&retstr->m21 = v11;
  *(_OWORD *)&retstr->m23 = v12;
  return result;
}

- (CATransform3D)perspectiveMVPMatrixWithTexture:(SEL)a3 andFrame:(id)a4
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  [a4 frameOnCanvas];
  double v13 = v12;
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  double v29 = v13 - CGRectGetMinX(v34);
  [a4 frameOnCanvas];
  double v15 = v14;
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  double v16 = v15 - CGRectGetMaxY(v35);
  [(KNAnimationContext *)self->mAnimationContext fieldOfViewInRadians];
  long double v18 = tan(v17 * 0.5);
  long double v19 = height / (v18 + v18);
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  [(KNAnimationContext *)self->mAnimationContext fieldOfViewInRadians];
  TSDTransform3DMakeProjection();
  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeTranslation(&v33, width * -0.5 - x + x + v29, height * -0.5 - y + y - v16, -v19);
  CATransform3D a = v33;
  long long v20 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&b.m33 = v20;
  long long v21 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&b.m43 = v21;
  long long v22 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&b.m13 = v22;
  long long v23 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&b.m23 = v23;
  result = CATransform3DConcat(&v32, &a, &b);
  long long v25 = *(_OWORD *)&v32.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v32.m31;
  *(_OWORD *)&retstr->m33 = v25;
  long long v26 = *(_OWORD *)&v32.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v32.m41;
  *(_OWORD *)&retstr->m43 = v26;
  long long v27 = *(_OWORD *)&v32.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v32.m11;
  *(_OWORD *)&retstr->m13 = v27;
  long long v28 = *(_OWORD *)&v32.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v32.m21;
  *(_OWORD *)&retstr->m23 = v28;
  return result;
}

@end