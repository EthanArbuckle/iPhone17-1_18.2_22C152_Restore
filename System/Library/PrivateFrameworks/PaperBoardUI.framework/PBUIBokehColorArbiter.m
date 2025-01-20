@interface PBUIBokehColorArbiter
+ (id)colorSwatchForBokehColor:(uint64_t)a1;
+ (id)gradientColorsForBokehColor:(uint64_t)a1;
+ (id)legibilityColorForBokehColor:(uint64_t)a1;
+ (uint64_t)averageColorForBokehColor:(uint64_t)a1;
+ (uint64_t)bokehColorForVariant:(uint64_t)a1;
+ (uint64_t)randomCircleColorForBokehColor:(uint64_t)a1;
@end

@implementation PBUIBokehColorArbiter

+ (uint64_t)bokehColorForVariant:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 localizedCaseInsensitiveContainsString:@"New"])
  {
    if ([v2 localizedCaseInsensitiveContainsString:@"Mixed"])
    {
      uint64_t v3 = -1;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Green"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Yellow"])
    {
      uint64_t v3 = 1;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Orange"])
    {
      uint64_t v3 = 4;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Red"])
    {
      uint64_t v3 = 0;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Purple"])
    {
      uint64_t v3 = 3;
    }
    else if ([v2 localizedCaseInsensitiveContainsString:@"Blue"])
    {
      uint64_t v3 = 5;
    }
    else
    {
      uint64_t v3 = -2;
    }
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"GradientSilver"])
  {
    uint64_t v3 = 12;
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"Gradient"] {
         && ![v2 localizedCaseInsensitiveContainsString:@"Silver"])
  }
  {
    uint64_t v3 = 11;
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"Blue"])
  {
    uint64_t v3 = 6;
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"Green"])
  {
    uint64_t v3 = 7;
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"Yellow"])
  {
    uint64_t v3 = 8;
  }
  else if ([v2 localizedCaseInsensitiveContainsString:@"Red"])
  {
    uint64_t v3 = 9;
  }
  else
  {
    uint64_t v3 = -2;
    if ([v2 localizedCaseInsensitiveContainsString:@"Silver"]
      && ![v2 localizedCaseInsensitiveContainsString:@"Gradient"])
    {
      uint64_t v3 = 10;
    }
  }

  return v3;
}

+ (id)gradientColorsForBokehColor:(uint64_t)a1
{
  self;
  uint64_t v3 = *(&allGradientColors + a2 + 2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  LOBYTE(v8) = v3[3];
  if ((_BYTE)v8)
  {
    do
    {
      LOBYTE(v5) = *v3;
      LOBYTE(v6) = v3[1];
      LOBYTE(v7) = v3[2];
      v9 = [MEMORY[0x1E4F428B8] colorWithRed:(float)((float)v5 / 255.0) green:(float)((float)v6 / 255.0) blue:(float)((float)v7 / 255.0) alpha:(float)((float)v8 / 255.0)];
      objc_msgSend(v4, "addObject:", objc_msgSend(v9, "cgColor"));

      int v8 = v3[7];
      v3 += 4;
    }
    while (v8);
  }
  return v4;
}

+ (uint64_t)randomCircleColorForBokehColor:(uint64_t)a1
{
  self;
  uint64_t v3 = (uint64_t)*(&allCircleColors + a2 + 2);
  id v4 = (unsigned __int8 *)(v3 + 3);
  int v5 = -1;
  do
  {
    int v6 = *v4;
    v4 += 4;
    ++v5;
  }
  while (v6);
  *(float *)&unsigned int v7 = (float)((float)((float)rand() * 4.6566e-10) * (float)v5) + 0.0;
  int v8 = (unsigned char *)(v3 + 4 * (int)*(float *)&v7);
  v9 = (void *)MEMORY[0x1E4F428B8];
  LOBYTE(v7) = *v8;
  double v10 = (float)((float)v7 / 255.0);
  double v11 = (float)((float)v8[1] / 255.0);
  LOBYTE(v12) = v8[2];
  double v13 = (float)((float)v12 / 255.0);
  LOBYTE(v14) = v8[3];
  return [v9 colorWithRed:v10 green:v11 blue:v13 alpha:(float)((float)v14 / 255.0)];
}

+ (uint64_t)averageColorForBokehColor:(uint64_t)a1
{
  self;
  uint64_t v3 = (char *)&allAverageColors + 4 * a2;
  id v4 = (void *)MEMORY[0x1E4F428B8];
  LOBYTE(v5) = v3[8];
  double v6 = (float)((float)v5 / 255.0);
  LOBYTE(v7) = v3[9];
  double v8 = (float)((float)v7 / 255.0);
  LOBYTE(v9) = v3[10];
  return [v4 colorWithRed:v6 green:v8 blue:(float)((float)v9 / 255.0) alpha:1.0];
}

+ (id)legibilityColorForBokehColor:(uint64_t)a1
{
  uint64_t v3 = self;
  if (a2 == 8) {
    [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.988235295 blue:0.90196079 alpha:1.0];
  }
  else {
  id v4 = +[PBUIBokehColorArbiter averageColorForBokehColor:](v3, a2);
  }
  return v4;
}

+ (id)colorSwatchForBokehColor:(uint64_t)a1
{
  uint64_t v3 = self;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", 10.0, 10.0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PBUIBokehColorArbiter_colorSwatchForBokehColor___block_invoke;
  v12[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v12[4] = v3;
  v12[5] = a2;
  __asm { FMOV            V0.2D, #10.0 }
  long long v13 = _Q0;
  double v10 = [v4 imageWithActions:v12];

  return v10;
}

void __50__PBUIBokehColorArbiter_colorSwatchForBokehColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  unsigned int v5 = +[PBUIBokehColorArbiter averageColorForBokehColor:](v3, v4);
  [v5 setFill];

  objc_msgSend(v6, "fillRect:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end