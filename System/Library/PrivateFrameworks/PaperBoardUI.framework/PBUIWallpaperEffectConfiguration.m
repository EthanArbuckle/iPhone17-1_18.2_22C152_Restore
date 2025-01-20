@interface PBUIWallpaperEffectConfiguration
+ (id)normal;
- (BOOL)affectedByContentColorChanges;
- (BOOL)affectedByUserInterfaceStyleChanges;
- (BOOL)includeTint;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresMaterialKitRendering;
- (NSString)description;
- (double)backdropParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithStyle:(void *)a3 contentColor:(uint64_t)a4 userInterfaceStyle:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)configurationByRemovingTint;
- (void)configurationWithUserInterfaceStyle:(void *)a1;
- (void)uniqueIdentifier;
@end

@implementation PBUIWallpaperEffectConfiguration

- (void)uniqueIdentifier
{
  v1 = a1;
  if (a1)
  {
    if (*((void *)a1 + 11))
    {
      v2 = NSString;
      uint64_t v3 = PBUIWallpaperStyleDescription(*((void *)a1 + 2));
      v4 = (void *)v3;
      uint64_t v5 = v1[3];
      v6 = @"Unspecified";
      if (v5 == 2) {
        v6 = @"Dark";
      }
      if (v5 == 1) {
        v7 = @"Light";
      }
      else {
        v7 = v6;
      }
      v1 = [v2 stringWithFormat:@"%@_%@", v3, v7];
    }
    else
    {
      LODWORD(v8) = *((_DWORD *)a1 + 10);
      LODWORD(v9) = *((_DWORD *)a1 + 12);
      double v10 = a1[7];
      double v11 = a1[8];
      double v12 = a1[9];
      double v13 = a1[10];
      if (v10 == 1.79769313e308) {
        double v10 = 0.0;
      }
      if (v11 == 1.79769313e308) {
        double v11 = 0.0;
      }
      if (v12 == 1.79769313e308) {
        double v12 = 0.0;
      }
      if (v13 == 1.79769313e308) {
        double v13 = 0.0;
      }
      if (*((unsigned char *)a1 + 8)) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 0;
      }
      if (*((unsigned char *)a1 + 8)) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = 0;
      }
      v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d:%d:%d:%1.1f:%d:%1.1f:%1.1f", *((void *)a1 + 4), v8, v9, *(void *)&v11, (int)v10, *(void *)&v12, *(void *)&v13);
      v14 = NSString;
      uint64_t v15 = PBUIWallpaperStyleDescription(v1[2]);
      v16 = (void *)v15;
      if (*((unsigned char *)v1 + 8)) {
        v17 = @"tinted";
      }
      else {
        v17 = @"untinted";
      }
      v1 = [v14 stringWithFormat:@"%@_%@_%@", v15, v17, v4];
    }
  }
  return v1;
}

- (id)initWithStyle:(void *)a3 contentColor:(uint64_t)a4 userInterfaceStyle:
{
  id v7 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PBUIWallpaperEffectConfiguration;
    uint64_t v8 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v8;
    if (v8)
    {
      v8[2] = a2;
      _WallpaperBackdropParametersForStyleAndAverageColor(a2, v7, (uint64_t)v14);
      long long v10 = v14[2];
      long long v9 = v14[3];
      long long v11 = v14[1];
      *((_OWORD *)a1 + 2) = v14[0];
      *((_OWORD *)a1 + 3) = v11;
      *((_OWORD *)a1 + 4) = v10;
      *((_OWORD *)a1 + 5) = v9;
      *((unsigned char *)a1 + 8) = _WallpaperStyleHasTint(a2);
      if (_WallpaperStyleUpdatesWithUserInterfaceStyle(a2)) {
        uint64_t v12 = a4;
      }
      else {
        uint64_t v12 = 0;
      }
      *((void *)a1 + 3) = v12;
    }
  }

  return a1;
}

+ (id)normal
{
  self;
  v0 = [PBUIWallpaperEffectConfiguration alloc];
  v1 = [MEMORY[0x1E4F428B8] whiteColor];
  id v2 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v0, 0, v1, 0);

  return v2;
}

- (BOOL)affectedByContentColorChanges
{
  if (result) {
    return *(void *)(result + 88) == 0;
  }
  return result;
}

- (BOOL)requiresMaterialKitRendering
{
  if (result) {
    return *(void *)(result + 88) != 0;
  }
  return result;
}

- (BOOL)affectedByUserInterfaceStyleChanges
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (void)configurationWithUserInterfaceStyle:(void *)a1
{
  if (a1)
  {
    v4 = a1;
    a1 = (void *)[a1 copy];
    if (v4[3]) {
      a1[3] = a2;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)configurationByRemovingTint
{
  if (a1)
  {
    uint64_t v2 = _WallpaperStyleByRemovingTintFromStyle(a1[2]);
    if (v2 == a1[2])
    {
      uint64_t v3 = (void *)[a1 copy];
    }
    else
    {
      unint64_t v4 = v2;
      uint64_t v5 = [PBUIWallpaperEffectConfiguration alloc];
      v6 = [MEMORY[0x1E4F428B8] blackColor];
      uint64_t v3 = -[PBUIWallpaperEffectConfiguration initWithStyle:contentColor:userInterfaceStyle:](v5, v4, v6, a1[3]);

      v3[6] = a1[6];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(PBUIWallpaperEffectConfiguration);
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_style = self->_style;
    long long v6 = *(_OWORD *)&self->_backdropParameters.backdropStyle;
    long long v7 = *(_OWORD *)&self->_backdropParameters.renderingHint;
    long long v8 = *(_OWORD *)&self->_backdropParameters.grayscaleTintAlpha;
    *(_OWORD *)&v4->_backdropParameters.saturationDeltaFactor = *(_OWORD *)&self->_backdropParameters.saturationDeltaFactor;
    *(_OWORD *)&v4->_backdropParameters.grayscaleTintAlpha = v8;
    *(_OWORD *)&v4->_backdropParameters.backdropStyle = v6;
    *(_OWORD *)&v4->_backdropParameters.renderingHint = v7;
    v4->_includeTint = self->_includeTint;
    v4->_userInterfaceStyle = self->_userInterfaceStyle;
    long long v9 = v4;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PBUIWallpaperEffectConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    long long v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        long long v7 = v6;
      }
      else {
        long long v7 = 0;
      }
    }
    else
    {
      long long v7 = 0;
    }
    long long v9 = v7;

    if (v9 && v9->_style == self->_style)
    {
      uint64_t v10 = 24;
      if (!v9->_backdropParameters.materialStyle) {
        uint64_t v10 = 48;
      }
      BOOL v8 = *(Class *)((char *)&v9->super.isa + v10) == *(Class *)((char *)&self->super.isa + v10);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (double)backdropParameters
{
  if (a1)
  {
    long long v2 = a1[3];
    *a2 = a1[2];
    a2[1] = v2;
    long long v3 = a1[4];
    long long v4 = a1[5];
    a2[2] = v3;
    a2[3] = v4;
  }
  else
  {
    *(void *)&long long v3 = 0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v3;
}

- (unint64_t)hash
{
  long long v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_style];
  id v5 = (id)[v3 appendBool:self->_includeTint];
  id v6 = (id)[v3 appendInteger:self->_backdropParameters.renderingHint];
  id v7 = (id)[v3 appendInteger:self->_userInterfaceStyle];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperEffectConfiguration *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  long long v3 = [(PBUIWallpaperEffectConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = PBUIWallpaperStyleDescription(self->_style);
  [v4 appendString:v5 withName:@"style"];

  id v6 = (id)[v4 appendBool:self->_includeTint withName:@"includeTint"];
  id v7 = (id)[v4 appendBool:self->_userInterfaceStyle != 0 withName:@"affectedByUserInterfaceStyleChanges"];
  int64_t userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle)
  {
    long long v9 = @"Unspecified";
    if (userInterfaceStyle == 2) {
      long long v9 = @"Dark";
    }
    if (userInterfaceStyle == 1) {
      uint64_t v10 = @"Light";
    }
    else {
      uint64_t v10 = v9;
    }
    [v4 appendString:v10 withName:@"userInterfaceStyle"];
  }
  int64_t materialStyle = self->_backdropParameters.materialStyle;
  if (materialStyle)
  {
    uint64_t v12 = PBUIStringForWallpaperMaterialStyle(materialStyle);
    double v13 = @"materialStyle";
  }
  else
  {
    long long v14 = *(_OWORD *)&self->_backdropParameters.renderingHint;
    v17[0] = *(_OWORD *)&self->_backdropParameters.backdropStyle;
    v17[1] = v14;
    long long v15 = *(_OWORD *)&self->_backdropParameters.grayscaleTintAlpha;
    v17[2] = *(_OWORD *)&self->_backdropParameters.saturationDeltaFactor;
    v17[3] = v15;
    uint64_t v12 = PBUIStringForWallpaperBackdropParameters((double *)v17);
    double v13 = @"backdropParameters";
  }
  [v4 appendString:v12 withName:v13];

  return v4;
}

- (id)succinctDescription
{
  long long v2 = [(PBUIWallpaperEffectConfiguration *)self succinctDescriptionBuilder];
  long long v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  long long v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PBUIWallpaperEffectConfiguration_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E62B2C38;
  id v4 = v3;
  id v8 = v4;
  long long v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

void __62__PBUIWallpaperEffectConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  PBUIWallpaperStyleDescription(*(void *)(*(void *)(a1 + 40) + 16));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2 withName:0];
}

- (BOOL)includeTint
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

@end