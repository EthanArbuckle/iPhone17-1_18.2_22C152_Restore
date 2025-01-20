@interface UIColorEffect(Private)
+ (id)sessionColorEffectDark;
+ (id)sessionColorEffectLight;
@end

@implementation UIColorEffect(Private)

+ (id)sessionColorEffectDark
{
  v3[0] = xmmword_23A80CA20;
  v3[1] = xmmword_23A80CA30;
  v3[2] = xmmword_23A80CA40;
  v3[3] = xmmword_23A80CA50;
  v3[4] = xmmword_23A80CA60;
  v1 = [a1 _colorEffectCAMatrix:v3];

  return v1;
}

+ (id)sessionColorEffectLight
{
  v3[0] = xmmword_23A80CA70;
  v3[1] = xmmword_23A80CA80;
  v3[2] = xmmword_23A80CA90;
  int v4 = 1060864002;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  int v7 = 0;
  uint64_t v8 = 1065353216;
  v1 = [a1 _colorEffectCAMatrix:v3];

  return v1;
}

@end