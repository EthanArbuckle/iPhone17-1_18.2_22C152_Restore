@interface WFGradient
+ (BOOL)supportsSecureCoding;
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (CGGradient)CGGradient;
- (WFColor)accessibilityBaseColor;
- (WFColor)baseColor;
- (WFColor)darkAccessibilityBaseColor;
- (WFColor)darkBaseColor;
- (WFColor)endColor;
- (WFColor)startColor;
- (WFGradient)initWithBaseColor:(id)a3 darkBaseColor:(id)a4 accessibilityBaseColor:(id)a5 darkAccessibilityBaseColor:(id)a6 startColor:(id)a7 endColor:(id)a8;
- (WFGradient)initWithBaseColor:(id)a3 startColor:(id)a4 endColor:(id)a5;
- (WFGradient)initWithCoder:(id)a3;
- (WFGradient)initWithColor:(id)a3;
- (WFGradient)initWithStartColor:(id)a3 endColor:(id)a4;
- (double)perceivedBrightness;
- (id)baseColorForDarkMode:(BOOL)a3 highContrast:(BOOL)a4;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFGradient

- (BOOL)isDark
{
  [(WFGradient *)self perceivedBrightness];
  return v2 < 0.6;
}

- (double)perceivedBrightness
{
  v3 = [(WFGradient *)self endColor];
  [v3 red];
  double v5 = v4;
  v6 = [(WFGradient *)self startColor];
  [v6 red];
  double v8 = vabdd_f64(v5, v7) * 0.5;

  v9 = [(WFGradient *)self endColor];
  [v9 green];
  double v11 = v10;
  v12 = [(WFGradient *)self startColor];
  [v12 green];
  double v14 = vabdd_f64(v11, v13) * 0.5;

  v15 = [(WFGradient *)self endColor];
  [v15 blue];
  double v17 = v16;
  v18 = [(WFGradient *)self startColor];
  [v18 blue];
  double v20 = vabdd_f64(v17, v19) * 0.5;

  v21 = [(WFGradient *)self endColor];
  [v21 red];
  double v23 = v8 + v22;

  v24 = [(WFGradient *)self endColor];
  [v24 green];
  double v26 = v14 + v25;

  v27 = [(WFGradient *)self endColor];
  [v27 blue];
  double v29 = v20 + v28;

  return v26 * 0.7152 + v23 * 0.2126 + v29 * 0.0722;
}

- (WFColor)endColor
{
  return self->_endColor;
}

- (WFColor)startColor
{
  return self->_startColor;
}

- (id)baseColorForDarkMode:(BOOL)a3 highContrast:(BOOL)a4
{
  if (a3 && a4)
  {
    double v4 = [(WFGradient *)self darkAccessibilityBaseColor];
  }
  else if (a3)
  {
    double v4 = [(WFGradient *)self darkBaseColor];
  }
  else
  {
    if (a4) {
      [(WFGradient *)self accessibilityBaseColor];
    }
    else {
    double v4 = [(WFGradient *)self baseColor];
    }
  }
  return v4;
}

- (WFColor)baseColor
{
  return self->_baseColor;
}

- (WFGradient)initWithStartColor:(id)a3 endColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ([v8 isEqual:v7])
  {
    id v9 = v8;
  }
  else
  {
    double v20 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    double v17 = 0.0;
    [v8 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];
    double v15 = 0.0;
    double v16 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    [v7 getRed:&v16 green:&v15 blue:&v14 alpha:&v13];
    id v9 = +[WFColor colorWithRed:(v20 + v16) * 0.5 green:(v19 + v15) * 0.5 blue:(v18 + v14) * 0.5 alpha:(v17 + v13) * 0.5];
  }
  double v10 = v9;

  double v11 = [(WFGradient *)self initWithBaseColor:v10 startColor:v8 endColor:v7];
  return v11;
}

- (WFGradient)initWithBaseColor:(id)a3 startColor:(id)a4 endColor:(id)a5
{
  return [(WFGradient *)self initWithBaseColor:a3 darkBaseColor:a3 accessibilityBaseColor:a3 darkAccessibilityBaseColor:a3 startColor:a4 endColor:a5];
}

- (WFGradient)initWithBaseColor:(id)a3 darkBaseColor:(id)a4 accessibilityBaseColor:(id)a5 darkAccessibilityBaseColor:(id)a6 startColor:(id)a7 endColor:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id obj = a6;
  id v17 = a6;
  id v32 = a7;
  id v18 = a7;
  id v33 = a8;
  id v19 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFGradient.m", 50, @"Invalid parameter not satisfying: %@", @"baseColor" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  double v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFGradient.m", 51, @"Invalid parameter not satisfying: %@", @"darkBaseColor" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v17) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  double v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"WFGradient.m", 52, @"Invalid parameter not satisfying: %@", @"accessibilityBaseColor" object file lineNumber description];

  if (v17)
  {
LABEL_5:
    if (v18) {
      goto LABEL_6;
    }
LABEL_14:
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFGradient.m", 54, @"Invalid parameter not satisfying: %@", @"startColor" object file lineNumber description];

    if (v19) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFGradient.m", 53, @"Invalid parameter not satisfying: %@", @"darkAccessibilityBaseColor" object file lineNumber description];

  if (!v18) {
    goto LABEL_14;
  }
LABEL_6:
  if (v19) {
    goto LABEL_7;
  }
LABEL_15:
  double v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFGradient.m", 55, @"Invalid parameter not satisfying: %@", @"endColor" object file lineNumber description];

LABEL_7:
  v35.receiver = self;
  v35.super_class = (Class)WFGradient;
  double v20 = [(WFGradient *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_baseColor, a3);
    objc_storeStrong((id *)&v21->_darkBaseColor, a4);
    objc_storeStrong((id *)&v21->_accessibilityBaseColor, a5);
    objc_storeStrong((id *)&v21->_darkAccessibilityBaseColor, obj);
    objc_storeStrong((id *)&v21->_startColor, v32);
    objc_storeStrong((id *)&v21->_endColor, v33);
    double v22 = v21;
  }

  return v21;
}

- (WFGradient)initWithColor:(id)a3
{
  id v4 = a3;
  double v5 = +[WFColor clearColor];
  id v6 = +[WFColor clearColor];
  id v7 = [(WFGradient *)self initWithBaseColor:v4 startColor:v5 endColor:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
  objc_storeStrong((id *)&self->_darkAccessibilityBaseColor, 0);
  objc_storeStrong((id *)&self->_accessibilityBaseColor, 0);
  objc_storeStrong((id *)&self->_darkBaseColor, 0);
  objc_storeStrong((id *)&self->_baseColor, 0);
}

- (WFColor)darkAccessibilityBaseColor
{
  return self->_darkAccessibilityBaseColor;
}

- (WFColor)accessibilityBaseColor
{
  return self->_accessibilityBaseColor;
}

- (WFColor)darkBaseColor
{
  return self->_darkBaseColor;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(WFGradient *)self baseColor];
  [v4 encodeObject:v5 forKey:@"baseColor"];

  id v6 = [(WFGradient *)self darkBaseColor];
  [v4 encodeObject:v6 forKey:@"darkBaseColor"];

  id v7 = [(WFGradient *)self accessibilityBaseColor];
  [v4 encodeObject:v7 forKey:@"accessibilityBaseColor"];

  id v8 = [(WFGradient *)self darkAccessibilityBaseColor];
  [v4 encodeObject:v8 forKey:@"darkAccessibilityBaseColor"];

  id v9 = [(WFGradient *)self startColor];
  [v4 encodeObject:v9 forKey:@"startColor"];

  id v10 = [(WFGradient *)self endColor];
  [v4 encodeObject:v10 forKey:@"endColor"];
}

- (WFGradient)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseColor"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkBaseColor"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityBaseColor"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"darkAccessibilityBaseColor"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startColor"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endColor"];

  double v11 = [(WFGradient *)self initWithBaseColor:v5 darkBaseColor:v6 accessibilityBaseColor:v7 darkAccessibilityBaseColor:v8 startColor:v9 endColor:v10];
  return v11;
}

- (id)debugDescription
{
  v21[7] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p, {\n", v5, self];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v6];
  v21[0] = @"baseColor";
  v21[1] = @"darkBaseColor";
  v21[2] = @"accessibilityBaseColor";
  v21[3] = @"accessibilityBaseColor";
  v21[4] = @"darkAccessibilityBaseColor";
  v21[5] = @"startColor";
  v21[6] = @"endColor";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [(WFGradient *)self valueForKey:v13];
        [v7 appendFormat:@"\t%@: %@\n", v13, v14, (void)v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v7 appendString:@"}>"];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFGradient *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(WFGradient *)self baseColor];
      id v6 = [(WFGradient *)v4 baseColor];
      id v7 = v5;
      id v8 = v6;
      uint64_t v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        char v10 = 0;
        uint64_t v11 = v8;
        id v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_33;
        }
        int v13 = [v7 isEqual:v8];

        if (!v13)
        {
          char v10 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      id v14 = [(WFGradient *)self darkBaseColor];
      id v15 = [(WFGradient *)v4 darkBaseColor];
      id v12 = v14;
      id v16 = v15;
      uint64_t v11 = v16;
      if (v12 == v16)
      {
      }
      else
      {
        char v10 = 0;
        long long v17 = v16;
        id v18 = v12;
        if (!v12 || !v16) {
          goto LABEL_32;
        }
        int v19 = [v12 isEqual:v16];

        if (!v19)
        {
          char v10 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      double v20 = [(WFGradient *)self startColor];
      v21 = [(WFGradient *)v4 startColor];
      id v18 = v20;
      id v22 = v21;
      v30 = v22;
      if (v18 != v22)
      {
        char v10 = 0;
        if (v18)
        {
          double v23 = v22;
          id v24 = v18;
          if (v22)
          {
            int v25 = [v18 isEqual:v22];

            if (!v25)
            {
              char v10 = 0;
LABEL_31:
              long long v17 = v30;
LABEL_32:

              goto LABEL_33;
            }
            goto LABEL_23;
          }
        }
        else
        {
          double v23 = v22;
          id v24 = 0;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_23:
      double v26 = [(WFGradient *)self endColor];
      v27 = [(WFGradient *)v4 endColor];
      id v24 = v26;
      id v28 = v27;
      double v23 = v28;
      if (v24 == v28)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v24 && v28) {
          char v10 = [v24 isEqual:v28];
        }
      }

      goto LABEL_30;
    }
    char v10 = 0;
  }
LABEL_35:

  return v10;
}

- (void)dealloc
{
  CGGradientRelease(self->_CGGradient);
  v3.receiver = self;
  v3.super_class = (Class)WFGradient;
  [(WFGradient *)&v3 dealloc];
}

- (CGGradient)CGGradient
{
  v5[2] = *MEMORY[0x1E4F143B8];
  result = self->_CGGradient;
  if (!result)
  {
    v5[0] = [(WFColor *)self->_startColor CGColor];
    v5[1] = [(WFColor *)self->_endColor CGColor];
    long long v4 = xmmword_1B3D889F0;
    result = CGGradientCreateWithColors(0, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2], (const CGFloat *)&v4);
    self->_CGGradient = result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end