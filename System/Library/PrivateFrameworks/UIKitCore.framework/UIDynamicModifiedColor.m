@interface UIDynamicModifiedColor
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDynamicTintColor;
- (BOOL)isEqual:(id)a3;
- (UIDynamicModifiedColor)colorWithAlphaComponent:(double)a3;
- (UIDynamicModifiedColor)colorWithProminence:(int64_t)a3;
- (id)_highContrastDynamicColor;
- (id)_resolvedColorWithTraitCollection:(id)a3;
- (id)_resolvedMaterialWithTraitCollection:(id)a3;
- (id)description;
- (id)initWithBaseColor:(void *)a3 alphaComponent:(double)a4 contrast:;
- (id)initWithBaseColor:(void *)a3 alphaComponent:(void *)a4 contrast:(double)a5 prominence:;
- (int64_t)prominence;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIDynamicModifiedColor

- (BOOL)_isDynamicTintColor
{
  return [(UIColor *)self->_baseColor _isDynamicTintColor];
}

- (unint64_t)hash
{
  return [(UIColor *)self->_baseColor hash] ^ self->_contrast ^ self->_prominence ^ (unint64_t)(self->_alphaComponent * 100.0);
}

- (void).cxx_destruct
{
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  int64_t contrast = self->_contrast;
  if (contrast)
  {
    if (contrast != 1)
    {
      v13 = [(UIDynamicColor *)self->_baseColor _resolvedColorWithTraitCollection:v4];
      goto LABEL_18;
    }
    baseColor = self->_baseColor;
    id v8 = v4;
    v9 = baseColor;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    v27 = ___UIResolvedDynamicColorWithHighContrast_block_invoke;
    v28 = &unk_1E52F1540;
    id v29 = v8;
    v10 = v9;
    v30 = v10;
    uint64_t v11 = objc_msgSend(v8, "accessibilityContrast", v26, 3221225472);
    v12 = [(UIDynamicColor *)v10 _resolvedColorWithTraitCollection:v8];
    if (v11 == 1)
    {
      v27((uint64_t)&v26, 0);
      v12 = v13 = v12;
    }
    else
    {
      v13 = v27((uint64_t)&v26, 1);
    }
    if ([v13 isEqual:v12])
    {
      if ([v8 userInterfaceStyle] == 2) {
        +[UIColor _accessibilityLightenedColorForColor:v12];
      }
      else {
      uint64_t v18 = +[UIColor _accessibilityDarkenedColorForColor:v12];
      }

      v13 = (void *)v18;
    }
  }
  else
  {
    v14 = self->_baseColor;
    v10 = (UIDynamicColor *)v4;
    v15 = v14;
    if ([(UIDynamicColor *)v10 accessibilityContrast] == 1)
    {
      v16 = [(UIDynamicColor *)v10 _traitCollectionByReplacingNSIntegerValue:0 forTraitToken:0x1ED3F5B08];
    }
    else
    {
      v16 = v10;
    }
    v17 = v16;
    v13 = [(UIDynamicColor *)v15 _resolvedColorWithTraitCollection:v16];
  }
LABEL_18:
  if (self->_alphaComponent != 1.79769313e308)
  {
    uint64_t v19 = objc_msgSend(v13, "colorWithAlphaComponent:");

    v13 = (void *)v19;
  }
  if ([v5 _vibrancy] != 2)
  {
    int64_t prominence = self->_prominence;
    if (prominence >= 1)
    {
      double v21 = 0.180000007;
      if (prominence == 2) {
        double v21 = 0.25;
      }
      if (prominence == 1) {
        double v22 = 0.5;
      }
      else {
        double v22 = v21;
      }
      objc_msgSend(v13, "alphaComponent", v21);
      uint64_t v24 = [v13 colorWithAlphaComponent:v22 * v23];

      v13 = (void *)v24;
    }
  }

  return v13;
}

- (id)initWithBaseColor:(void *)a3 alphaComponent:(double)a4 contrast:
{
  id v8 = a2;
  v9 = v8;
  if (a1)
  {
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_initWithBaseColor_alphaComponent_contrast_, a1, @"UIColor.m", 3994, @"Invalid baseColor: %@", v9 object file lineNumber description];
    }
    v13.receiver = a1;
    v13.super_class = (Class)UIDynamicModifiedColor;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((double *)a1 + 4) = a4;
      a1[5] = a3;
      a1[6] = (id)-1;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIDynamicModifiedColor *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (v5->_alphaComponent == self->_alphaComponent
        && v5->_contrast == self->_contrast
        && v5->_prominence == self->_prominence)
      {
        char v7 = [(UIColor *)v5->_baseColor isEqual:self->_baseColor];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  id v4 = a3;
  if (self->_alphaComponent == 1.79769313e308 && self->_contrast == -1)
  {
    v5 = [(UIDynamicColor *)self->_baseColor _resolvedMaterialWithTraitCollection:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIDynamicModifiedColor)colorWithAlphaComponent:(double)a3
{
  if (self->_alphaComponent == a3) {
    v3 = self;
  }
  else {
    v3 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)self->_contrast, (void *)self->_prominence, a3);
  }
  return v3;
}

- (id)initWithBaseColor:(void *)a3 alphaComponent:(void *)a4 contrast:(double)a5 prominence:
{
  id v10 = a2;
  uint64_t v11 = v10;
  if (a1)
  {
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_initWithBaseColor_alphaComponent_contrast_prominence_, a1, @"UIColor.m", 3980, @"Invalid baseColor: %@", v11 object file lineNumber description];
    }
    v15.receiver = a1;
    v15.super_class = (Class)UIDynamicModifiedColor;
    v12 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 3, a2);
      *((double *)a1 + 4) = a5;
      a1[5] = a3;
      a1[6] = a4;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  baseColor = self->_baseColor;
  id v5 = a3;
  [v5 encodeObject:baseColor forKey:@"UIDynamicModifiedBaseColor"];
  [v5 encodeDouble:@"UIDynamicModifiedAlphaComponent" forKey:self->_alphaComponent];
  [v5 encodeInteger:self->_contrast forKey:@"UIDynamicModifiedContrast"];
  [v5 encodeInteger:self->_prominence forKey:@"UIDynamicModifiedProminence"];
  v6.receiver = self;
  v6.super_class = (Class)UIDynamicModifiedColor;
  [(UIColor *)&v6 encodeWithCoder:v5];
}

- (id)_highContrastDynamicColor
{
  if (self->_contrast == 1) {
    v2 = self;
  }
  else {
    v2 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)1, (void *)self->_prominence, self->_alphaComponent);
  }
  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = v3;
  int64_t contrast = self->_contrast;
  if (contrast == 1)
  {
    v6 = @"int64_t contrast = high, ";
  }
  else
  {
    if (contrast) {
      goto LABEL_6;
    }
    v6 = @"int64_t contrast = normal, ";
  }
  [v3 appendString:v6];
LABEL_6:
  if (self->_alphaComponent != 1.79769313e308) {
    [v4 appendFormat:@"alpha = %g, ", *(void *)&self->_alphaComponent];
  }
  unint64_t prominence = self->_prominence;
  if (prominence <= 3) {
    [v4 appendString:off_1E52F15A0[prominence]];
  }
  id v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 stringWithFormat:@"<%@: %p %@baseColor = %@>", v10, self, v4, self->_baseColor];;

  return v11;
}

- (UIDynamicModifiedColor)colorWithProminence:(int64_t)a3
{
  if ([(UIDynamicModifiedColor *)self prominence] == a3)
  {
    id v5 = self;
LABEL_5:
    objc_super v6 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (UIDynamicModifiedColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], self->_baseColor, (void *)self->_contrast, (void *)a3, self->_alphaComponent);
    goto LABEL_5;
  }
  char v7 = [(UIDynamicColor *)self->_baseColor colorWithProminence:a3];
  id v8 = [v7 colorWithAlphaComponent:self->_alphaComponent];
  objc_super v6 = v8;
  if (v8) {
    v9 = v8;
  }

LABEL_9:
  return v6;
}

- (int64_t)prominence
{
  if (self->_prominence == -1) {
    return [(UIDynamicColor *)self->_baseColor prominence];
  }
  else {
    return self->_prominence;
  }
}

@end