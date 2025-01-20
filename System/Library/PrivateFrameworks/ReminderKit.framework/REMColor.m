@interface REMColor
+ (BOOL)supportsSecureCoding;
+ (REMColor)colorWithDictionaryData:(id)a3 error:(id *)a4;
+ (REMColor)colorWithHexString:(id)a3;
+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7;
+ (id)blackColor;
+ (id)blueColor;
+ (id)brownColor;
+ (id)clearColor;
+ (id)cyanColor;
+ (id)grayColor;
+ (id)greenColor;
+ (id)lightGrayColor;
+ (id)magentaColor;
+ (id)orangeColor;
+ (id)purpleColor;
+ (id)redColor;
+ (id)whiteColor;
+ (id)yellowColor;
- (BOOL)isEqual:(id)a3;
- (NSString)ckSymbolicColorName;
- (NSString)daHexString;
- (NSString)daSymbolicColorName;
- (REMColor)initWithCKSymbolicColorName:(id)a3 hexString:(id)a4;
- (REMColor)initWithCoder:(id)a3;
- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4;
- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4 ckSymbolicColorName:(id)a5;
- (REMColor)initWithHexString:(id)a3;
- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7;
- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7 daSymbolicColorName:(id)a8 daHexString:(id)a9 ckSymbolicColorName:(id)a10;
- (REMColor)initWithWhite:(double)a3 alpha:(double)a4;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (id)archivedDictionaryDataWithError:(id *)a3;
- (id)description;
- (id)hexString;
- (id)hexStringWithAlpha;
- (unint64_t)colorRGBSpace;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMColor *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMColor *)self hexStringWithAlpha];
      uint64_t v8 = [(REMColor *)v6 hexStringWithAlpha];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(REMColor *)self hexStringWithAlpha];
        v11 = [(REMColor *)v6 hexStringWithAlpha];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_18;
        }
      }
      v14 = [(REMColor *)self daSymbolicColorName];
      uint64_t v15 = [(REMColor *)v6 daSymbolicColorName];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMColor *)self daSymbolicColorName];
        v18 = [(REMColor *)v6 daSymbolicColorName];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_18;
        }
      }
      v20 = [(REMColor *)self daHexString];
      uint64_t v21 = [(REMColor *)v6 daHexString];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(REMColor *)self daHexString];
        v24 = [(REMColor *)v6 daHexString];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_18;
        }
      }
      v26 = [(REMColor *)self ckSymbolicColorName];
      uint64_t v27 = [(REMColor *)v6 ckSymbolicColorName];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMColor *)self ckSymbolicColorName];
        v30 = [(REMColor *)v6 ckSymbolicColorName];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_18;
        }
      }
      unint64_t v33 = [(REMColor *)self colorRGBSpace];
      BOOL v13 = v33 == [(REMColor *)v6 colorRGBSpace];
      goto LABEL_19;
    }
LABEL_18:
    BOOL v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (REMColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daSymbolicColorName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daHexString"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ckSymbolicColorName"];
  uint64_t v8 = (void *)v7;
  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (v9 && v7 == 0)
  {
    [v4 decodeDoubleForKey:@"red"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"green"];
    double v15 = v14;
    [v4 decodeDoubleForKey:@"blue"];
    double v17 = v16;
    [v4 decodeDoubleForKey:@"alpha"];
    double v19 = v18;
    unsigned int v20 = [v4 decodeIntForKey:@"colorRGBSpace"];
    uint64_t v21 = (int)v20;
    if (v20 >= 3)
    {
      v22 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[REMColor initWithCoder:](v21, v22);
      }

      uint64_t v21 = 2;
    }
    v11 = [(REMColor *)self initWithRed:v21 green:v13 blue:v15 alpha:v17 colorSpace:v19];
  }
  else
  {
    v11 = [(REMColor *)self initWithDASymbolicColorName:v5 daHexString:v6 ckSymbolicColorName:v7];
  }
  v23 = v11;

  return v23;
}

- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4 ckSymbolicColorName:(id)a5
{
  id v8 = a3;
  BOOL v9 = (__CFString *)a5;
  v10 = [a4 uppercaseString];
  v11 = (void *)*MEMORY[0x1E4FB82F8];
  if (!v8) {
    id v8 = v11;
  }
  id v12 = v8;
  if ([v11 isEqualToString:v12])
  {
    id v13 = v10;
    double v14 = v13;
  }
  else
  {
    double v15 = EKSymbolicColorToRGBMapping();
    uint64_t v16 = [v15 objectForKeyedSubscript:v12];
    double v14 = (void *)v16;
    if (v10) {
      double v17 = v10;
    }
    else {
      double v17 = (void *)v16;
    }
    id v13 = v17;
  }
  double v18 = 0;
  if (v14 && v13)
  {
    if (!v9)
    {
      if (REMSymbolicColorIsSupportedByCK(v12)) {
        BOOL v9 = (__CFString *)v12;
      }
      else {
        BOOL v9 = @"custom";
      }
    }
    id v19 = v14;
    unsigned int v20 = [(REMColor *)self initWithHexString:v19];
    p_isa = (id *)&v20->super.isa;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_daSymbolicColorName, v8);
      objc_storeStrong(p_isa + 7, v13);
      objc_storeStrong(p_isa + 8, v9);
    }
    self = p_isa;

    double v18 = self;
  }

  return v18;
}

- (REMColor)initWithHexString:(id)a3
{
  id v4 = [a3 lowercaseString];
  if (![v4 hasPrefix:@"#"])
  {
    if ([v4 isEqualToString:@"white"])
    {
      v10 = +[REMColor whiteColor];
    }
    else
    {
      if (![v4 isEqualToString:@"black"])
      {
        if ([v4 isEqualToString:@"red"])
        {
          v10 = +[REMColor redColor];
          goto LABEL_30;
        }
        if ([v4 isEqualToString:@"green"])
        {
          v10 = +[REMColor greenColor];
          goto LABEL_30;
        }
        if ([v4 isEqualToString:@"blue"])
        {
          v10 = +[REMColor blueColor];
          goto LABEL_30;
        }
        goto LABEL_25;
      }
      v10 = +[REMColor blackColor];
    }
LABEL_30:
    v35 = v10;
    goto LABEL_31;
  }
  v5 = [v4 substringFromIndex:1];

  uint64_t v37 = 0;
  uint64_t v38 = 0;
  if ([v5 length] == 8)
  {
    v6 = [v5 substringFromIndex:6];
    uint64_t v7 = [v6 substringToIndex:2];

    id v8 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
    int v9 = [v8 scanHexInt:&v37];

    id v4 = [v5 substringToIndex:6];
  }
  else
  {
    LODWORD(v37) = 255;
    int v9 = 1;
    id v4 = v5;
  }
  if (objc_msgSend(v4, "length", v37) != 6)
  {
    if ([v4 length] != 3) {
      goto LABEL_25;
    }
    v11 = [v4 substringToIndex:1];
    uint64_t v27 = [v4 substringFromIndex:1];
    id v13 = [v27 substringToIndex:1];

    v28 = [v4 substringFromIndex:2];
    double v15 = [v28 substringToIndex:1];

    if (v9)
    {
      v29 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
      int v30 = [v29 scanHexInt:(char *)&v38 + 4];

      if (v30)
      {
        int v31 = [MEMORY[0x1E4F28FE8] scannerWithString:v13];
        int v32 = [v31 scanHexInt:&v38];

        if (v32)
        {
          unint64_t v33 = [MEMORY[0x1E4F28FE8] scannerWithString:v15];
          int v34 = [v33 scanHexInt:(char *)&v37 + 4];

          LODWORD(v37) = 15;
          double v26 = 15.0;
          if (v34) {
            goto LABEL_20;
          }
          goto LABEL_25;
        }
      }
    }
    LODWORD(v37) = 15;
LABEL_24:

    goto LABEL_25;
  }
  v11 = [v4 substringToIndex:2];
  id v12 = [v4 substringFromIndex:2];
  id v13 = [v12 substringToIndex:2];

  double v14 = [v4 substringFromIndex:4];
  double v15 = [v14 substringToIndex:2];

  if (!v9) {
    goto LABEL_24;
  }
  uint64_t v16 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
  int v17 = [v16 scanHexInt:(char *)&v38 + 4];

  if (!v17) {
    goto LABEL_24;
  }
  double v18 = [MEMORY[0x1E4F28FE8] scannerWithString:v13];
  char v19 = [v18 scanHexInt:&v38];

  if ((v19 & 1) == 0) {
    goto LABEL_24;
  }
  unsigned int v20 = [MEMORY[0x1E4F28FE8] scannerWithString:v15];
  char v21 = [v20 scanHexInt:(char *)&v37 + 4];

  if (v21)
  {
    double v26 = 255.0;
LABEL_20:
    LODWORD(v22) = HIDWORD(v38);
    LODWORD(v23) = v38;
    LODWORD(v24) = HIDWORD(v37);
    LODWORD(v25) = v37;
    v10 = [(REMColor *)self initWithRed:(double)v22 / v26 green:(double)v23 / v26 blue:(double)v24 / v26 alpha:(double)v25 / v26];
    self = v10;
    goto LABEL_30;
  }
LABEL_25:
  v35 = 0;
LABEL_31:

  return v35;
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7
{
  v18.receiver = self;
  v18.super_class = (Class)REMColor;
  id v12 = [(REMColor *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    v12->_blue = a5;
    v12->_red = a3;
    v12->_green = a4;
    v12->_alpha = a6;
    v12->_colorRGBSpace = a7;
    objc_storeStrong((id *)&v12->_daSymbolicColorName, (id)*MEMORY[0x1E4FB82F8]);
    uint64_t v14 = [(REMColor *)v13 hexString];
    daHexString = v13->_daHexString;
    v13->_daHexString = (NSString *)v14;

    ckSymbolicColorName = v13->_ckSymbolicColorName;
    v13->_ckSymbolicColorName = (NSString *)@"custom";
  }
  return v13;
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return [(REMColor *)self initWithRed:2 green:a3 blue:a4 alpha:a5 colorSpace:a6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(REMColor *)self red];
  objc_msgSend(v4, "encodeDouble:forKey:", @"red");
  [(REMColor *)self green];
  objc_msgSend(v4, "encodeDouble:forKey:", @"green");
  [(REMColor *)self blue];
  objc_msgSend(v4, "encodeDouble:forKey:", @"blue");
  [(REMColor *)self alpha];
  objc_msgSend(v4, "encodeDouble:forKey:", @"alpha");
  objc_msgSend(v4, "encodeInt:forKey:", -[REMColor colorRGBSpace](self, "colorRGBSpace"), @"colorRGBSpace");
  v5 = [(REMColor *)self daSymbolicColorName];
  [v4 encodeObject:v5 forKey:@"daSymbolicColorName"];

  v6 = [(REMColor *)self daHexString];
  [v4 encodeObject:v6 forKey:@"daHexString"];

  id v7 = [(REMColor *)self ckSymbolicColorName];
  [v4 encodeObject:v7 forKey:@"ckSymbolicColorName"];
}

- (NSString)ckSymbolicColorName
{
  return self->_ckSymbolicColorName;
}

- (NSString)daSymbolicColorName
{
  return self->_daSymbolicColorName;
}

- (NSString)daHexString
{
  return self->_daHexString;
}

- (unint64_t)colorRGBSpace
{
  return self->_colorRGBSpace;
}

- (id)hexStringWithAlpha
{
  v3 = NSString;
  [(REMColor *)self red];
  uint64_t v5 = (int)(v4 * 255.0 + 0.5);
  [(REMColor *)self green];
  uint64_t v7 = (int)(v6 * 255.0 + 0.5);
  [(REMColor *)self blue];
  uint64_t v9 = (int)(v8 * 255.0 + 0.5);
  [(REMColor *)self alpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"#%02X%02X%02X%02X", v5, v7, v9, (int)(v10 * 255.0 + 0.5));
}

- (double)alpha
{
  return self->_alpha;
}

- (id)hexString
{
  v3 = NSString;
  [(REMColor *)self red];
  uint64_t v5 = (int)(v4 * 255.0 + 0.5);
  [(REMColor *)self green];
  uint64_t v7 = (int)(v6 * 255.0 + 0.5);
  [(REMColor *)self blue];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"#%02X%02X%02X", v5, v7, (int)(v8 * 255.0 + 0.5));
}

- (double)red
{
  return self->_red;
}

- (double)green
{
  return self->_green;
}

- (double)blue
{
  return self->_blue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckSymbolicColorName, 0);
  objc_storeStrong((id *)&self->_daHexString, 0);

  objc_storeStrong((id *)&self->_daSymbolicColorName, 0);
}

+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  double v6 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5 alpha:a6];

  return (REMColor *)v6;
}

+ (REMColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 targetRGBSpace:(unint64_t)a7
{
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithRed:a7 green:a3 blue:a4 alpha:a5 colorSpace:a6];

  return (REMColor *)v7;
}

+ (REMColor)colorWithHexString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithHexString:v4];

  return (REMColor *)v5;
}

+ (id)clearColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:0.0];

  return v2;
}

+ (id)blackColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.0 alpha:1.0];

  return v2;
}

+ (id)whiteColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:1.0 alpha:1.0];

  return v2;
}

+ (id)grayColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.5 alpha:1.0];

  return v2;
}

+ (id)lightGrayColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithWhite:0.667 alpha:1.0];

  return v2;
}

+ (id)redColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)greenColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)blueColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)cyanColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)yellowColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)magentaColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];

  return v2;
}

+ (id)orangeColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)purpleColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0];

  return v2;
}

+ (id)brownColor
{
  v2 = (void *)[objc_alloc((Class)a1) initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0];

  return v2;
}

- (REMColor)initWithWhite:(double)a3 alpha:(double)a4
{
  return [(REMColor *)self initWithRed:a3 green:a3 blue:a3 alpha:a4];
}

- (REMColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 colorSpace:(unint64_t)a7 daSymbolicColorName:(id)a8 daHexString:(id)a9 ckSymbolicColorName:(id)a10
{
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v25.receiver = self;
  v25.super_class = (Class)REMColor;
  unint64_t v22 = [(REMColor *)&v25 init];
  unint64_t v23 = v22;
  if (v22)
  {
    v22->_blue = a5;
    v22->_red = a3;
    v22->_green = a4;
    v22->_alpha = a6;
    v22->_colorRGBSpace = a7;
    objc_storeStrong((id *)&v22->_daSymbolicColorName, a8);
    objc_storeStrong((id *)&v23->_daHexString, a9);
    objc_storeStrong((id *)&v23->_ckSymbolicColorName, a10);
  }

  return v23;
}

- (REMColor)initWithDASymbolicColorName:(id)a3 daHexString:(id)a4
{
  return [(REMColor *)self initWithDASymbolicColorName:a3 daHexString:a4 ckSymbolicColorName:0];
}

- (REMColor)initWithCKSymbolicColorName:(id)a3 hexString:(id)a4
{
  double v6 = (__CFString *)a3;
  id v7 = a4;
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = @"custom";
  }
  uint64_t v9 = v8;
  if ([(__CFString *)v9 isEqualToString:@"custom"])
  {
    double v10 = (__CFString *)(id)*MEMORY[0x1E4FB82F8];
    id v11 = v7;
LABEL_14:
    self = [(REMColor *)self initWithDASymbolicColorName:v10 daHexString:v11 ckSymbolicColorName:v9];
    uint64_t v16 = self;
    goto LABEL_15;
  }
  id v12 = ckSymbolicColorNameToRGBMapping();
  uint64_t v13 = [v12 objectForKeyedSubscript:v9];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    if (REMSymbolicColorIsSupportedByDA(v9))
    {
      double v10 = v9;
      double v15 = v7;
    }
    else
    {
      double v10 = (__CFString *)(id)*MEMORY[0x1E4FB82F8];
      if (v7) {
        double v15 = v7;
      }
      else {
        double v15 = v14;
      }
    }
    id v11 = v15;

    goto LABEL_14;
  }

  id v11 = 0;
  double v10 = 0;
  uint64_t v16 = 0;
LABEL_15:

  return v16;
}

- (unint64_t)hash
{
  v3 = [(REMColor *)self hexStringWithAlpha];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(REMColor *)self daSymbolicColorName];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(REMColor *)self daHexString];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(REMColor *)self colorRGBSpace];

  return v9;
}

- (id)description
{
  v3 = NSString;
  [(REMColor *)self red];
  uint64_t v5 = v4;
  [(REMColor *)self green];
  uint64_t v7 = v6;
  [(REMColor *)self blue];
  uint64_t v9 = v8;
  [(REMColor *)self alpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"REMColor:rgba(%lf,%lf,%lf,%lf)", v5, v7, v9, v10);
}

+ (REMColor)colorWithDictionaryData:(id)a3 error:(id *)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v13 = 0;
  uint64_t v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:&v13];

  id v8 = v13;
  uint64_t v9 = [[REMColor alloc] initWithCoder:v7];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    id v11 = +[REMLog utility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[REMColor colorWithDictionaryData:error:]((uint64_t)v8, v11);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v9;
}

- (id)archivedDictionaryDataWithError:(id *)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(REMColor *)self encodeWithCoder:v4];
  uint64_t v5 = [v4 encodedData];
  if (!v5)
  {
    id v6 = +[REMLog utility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMColor archivedDictionaryDataWithError:](v6);
    }
  }

  return v5;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMColorRGBSpace %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)colorWithDictionaryData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Error decoding color {error: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)archivedDictionaryDataWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Error encoding color", v1, 2u);
}

@end