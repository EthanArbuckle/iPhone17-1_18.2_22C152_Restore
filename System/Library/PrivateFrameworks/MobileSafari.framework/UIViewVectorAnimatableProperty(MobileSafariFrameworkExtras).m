@interface UIViewVectorAnimatableProperty(MobileSafariFrameworkExtras)
+ (id)safari_pointProperty;
+ (id)safari_propertyWithLength:()MobileSafariFrameworkExtras;
+ (id)safari_rectProperty;
+ (id)safari_sizeProperty;
+ (id)safari_transformProperty;
- (CGAffineTransform)safari_transformPresentationValue;
- (CGAffineTransform)safari_transformValue;
- (double)safari_pointPresentationValue;
- (double)safari_pointValue;
- (double)safari_rectPresentationValue;
- (double)safari_rectValue;
- (double)safari_sizePresentationValue;
- (double)safari_sizeValue;
- (uint64_t)safari_setPointValue:()MobileSafariFrameworkExtras;
- (uint64_t)safari_setRectValue:()MobileSafariFrameworkExtras;
- (uint64_t)safari_setSizeValue:()MobileSafariFrameworkExtras;
- (uint64_t)safari_setTransformValue:()MobileSafariFrameworkExtras;
@end

@implementation UIViewVectorAnimatableProperty(MobileSafariFrameworkExtras)

+ (id)safari_propertyWithLength:()MobileSafariFrameworkExtras
{
  char v5 = [MEMORY[0x1E4FB1EE8] instancesRespondToSelector:sel_initWithLength_];
  id v6 = [a1 alloc];
  if (v5) {
    v7 = (void *)[v6 initWithLength:a3];
  }
  else {
    v7 = (void *)[v6 _initWithLength:a3];
  }

  return v7;
}

+ (id)safari_pointProperty
{
  v1 = objc_msgSend(a1, "safari_propertyWithLength:", 2);
  objc_msgSend(v1, "safari_setPointValue:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  return v1;
}

- (uint64_t)safari_setPointValue:()MobileSafariFrameworkExtras
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setPointValue___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v4[4] = a2;
  *(double *)&v4[5] = a3;
  return [a1 _mutateValue:v4];
}

- (double)safari_pointValue
{
  return *(double *)[a1 _value];
}

- (double)safari_pointPresentationValue
{
  return *(double *)[a1 _presentationValue];
}

+ (id)safari_sizeProperty
{
  v1 = objc_msgSend(a1, "safari_propertyWithLength:", 2);
  objc_msgSend(v1, "safari_setSizeValue:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  return v1;
}

- (uint64_t)safari_setSizeValue:()MobileSafariFrameworkExtras
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setSizeValue___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v4[4] = a2;
  *(double *)&v4[5] = a3;
  return [a1 _mutateValue:v4];
}

- (double)safari_sizeValue
{
  return *(double *)[a1 _value];
}

- (double)safari_sizePresentationValue
{
  return *(double *)[a1 _presentationValue];
}

+ (id)safari_rectProperty
{
  v1 = objc_msgSend(a1, "safari_propertyWithLength:", 4);
  objc_msgSend(v1, "safari_setRectValue:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v1;
}

- (uint64_t)safari_setRectValue:()MobileSafariFrameworkExtras
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setRectValue___block_invoke;
  v6[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(double *)&v6[4] = a2;
  *(double *)&v6[5] = a3;
  *(double *)&v6[6] = a4;
  *(double *)&v6[7] = a5;
  return [a1 _mutateValue:v6];
}

- (double)safari_rectValue
{
  return *(double *)[a1 _value];
}

- (double)safari_rectPresentationValue
{
  return *(double *)[a1 _presentationValue];
}

+ (id)safari_transformProperty
{
  v1 = objc_msgSend(a1, "safari_propertyWithLength:", 6);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  objc_msgSend(v1, "safari_setTransformValue:", v4);

  return v1;
}

- (uint64_t)safari_setTransformValue:()MobileSafariFrameworkExtras
{
  memset(&v9, 0, sizeof(v9));
  long long v4 = a3[1];
  *(_OWORD *)&transform.a = *a3;
  *(_OWORD *)&transform.c = v4;
  *(_OWORD *)&transform.tx = a3[2];
  CGAffineTransformDecompose(&v9, &transform);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setTransformValue___block_invoke;
  v6[3] = &__block_descriptor_80_e9_v16__0_d8l;
  CGAffineTransformComponents v7 = v9;
  return [a1 _mutateValue:v6];
}

- (CGAffineTransform)safari_transformValue
{
  uint64_t v3 = [a1 _value];
  long double v4 = exp(*(long double *)v3);
  long double v5 = exp(*(long double *)(v3 + 8));
  CGVector v7 = *(CGVector *)(v3 + 16);
  long long v6 = *(_OWORD *)(v3 + 32);
  v9.scale.width = v4;
  v9.scale.height = v5;
  *(_OWORD *)&v9.horizontalShear = v6;
  v9.translation = v7;
  return CGAffineTransformMakeWithComponents(a2, &v9);
}

- (CGAffineTransform)safari_transformPresentationValue
{
  uint64_t v3 = [a1 _presentationValue];
  long double v4 = exp(*(long double *)v3);
  long double v5 = exp(*(long double *)(v3 + 8));
  CGVector v7 = *(CGVector *)(v3 + 16);
  long long v6 = *(_OWORD *)(v3 + 32);
  v9.scale.width = v4;
  v9.scale.height = v5;
  *(_OWORD *)&v9.horizontalShear = v6;
  v9.translation = v7;
  return CGAffineTransformMakeWithComponents(a2, &v9);
}

@end