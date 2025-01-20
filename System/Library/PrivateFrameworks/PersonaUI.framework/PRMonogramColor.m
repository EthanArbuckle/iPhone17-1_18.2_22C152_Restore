@interface PRMonogramColor
+ (NSArray)availableColorNames;
+ (NSArray)availableColors;
+ (PRMonogramColor)colorWithName:(id)a3 inBundle:(id)a4;
+ (id)defaultBundle;
+ (id)defaultGradientEndColor;
+ (id)defaultGradientStartColor;
+ (id)defaultSelectedActiveColor;
+ (id)defaultSelectedActiveTextColor;
+ (id)defaultSelectedInactiveColor;
+ (id)generateMonogramGradientColorsByNameDictionary;
+ (id)gradientEndName:(id)a3;
+ (id)gradientStartColor:(id)a3;
+ (id)gradientStartName:(id)a3;
+ (id)monogramGradientColorNamed:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSBundle)bundle;
- (NSString)colorName;
- (PRMonogramColor)initWithColorName:(id)a3;
- (PRMonogramColor)initWithColorName:(id)a3 inBundle:(id)a4;
- (PRMonogramColor)initWithRandomColor;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (UIColor)selectedActiveColor;
- (UIColor)selectedActiveTextColor;
- (UIColor)selectedInactiveColor;
- (unint64_t)hash;
- (void)setBundle:(id)a3;
- (void)setColor:(id)a3;
- (void)setColorName:(id)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setSelectedActiveColor:(id)a3;
- (void)setSelectedActiveTextColor:(id)a3;
- (void)setSelectedInactiveColor:(id)a3;
@end

@implementation PRMonogramColor

+ (id)defaultGradientEndColor
{
  v3 = [a1 defaultBundle];
  v4 = [a1 colorWithName:@"PlateGradientEndColor" inBundle:v3];

  return v4;
}

+ (id)defaultGradientStartColor
{
  v3 = [a1 defaultBundle];
  v4 = [a1 colorWithName:@"PlateGradientStartColor" inBundle:v3];

  return v4;
}

+ (id)defaultBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

+ (PRMonogramColor)colorWithName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263F1C550] colorNamed:v6 inBundle:a4 compatibleWithTraitCollection:0];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [a1 monogramGradientColorNamed:v6];
  }
  v10 = v9;

  return (PRMonogramColor *)v10;
}

+ (id)gradientStartColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", (v5 * v8 * 0.7 + 0.3) / (v5 * 0.7 + 0.3), (v5 * v7 * 0.7 + 0.3) / (v5 * 0.7 + 0.3), (v5 * v6 * 0.7 + 0.3) / (v5 * 0.7 + 0.3));
  return v3;
}

+ (id)gradientStartName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"_GradientStart"];
}

+ (id)gradientEndName:(id)a3
{
  return (id)[a3 stringByAppendingString:@"_GradientEnd"];
}

+ (id)generateMonogramGradientColorsByNameDictionary
{
  v74[34] = *MEMORY[0x263EF8340];
  v72 = [MEMORY[0x263F1C550] colorWithRed:0.937254906 green:0.490196079 blue:0.639215708 alpha:1.0];
  v71 = [MEMORY[0x263F1C550] colorWithRed:0.964705884 green:0.721568644 blue:0.800000012 alpha:1.0];
  v70 = [MEMORY[0x263F1C550] colorWithRed:0.788235307 green:0.592156887 blue:0.572549045 alpha:1.0];
  v69 = [MEMORY[0x263F1C550] colorWithRed:0.882352948 green:0.776470602 blue:0.764705896 alpha:1.0];
  v68 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:");
  v67 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:");
  v66 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.929411769);
  v65 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.960784316);
  v64 = [MEMORY[0x263F1C550] colorWithRed:0.623529434 green:0.905882359 blue:0.529411793 alpha:1.0];
  v63 = [MEMORY[0x263F1C550] colorWithRed:0.792156875 green:0.949019611 blue:0.741176486 alpha:1.0];
  v62 = [MEMORY[0x263F1C550] colorWithRed:0.454901963 green:0.698039234 blue:0.886274517 alpha:1.0];
  v61 = [MEMORY[0x263F1C550] colorWithRed:0.701960802 green:0.835294127 blue:0.937254906 alpha:1.0];
  v60 = [MEMORY[0x263F1C550] colorWithRed:0.709803939 green:0.643137276 blue:0.949019611 alpha:1.0];
  v58 = [MEMORY[0x263F1C550] colorWithRed:0.839215696 green:0.80392158 blue:0.972549021 alpha:1.0];
  v59 = [MEMORY[0x263F1C550] colorWithRed:0.839215696 green:0.807843149 blue:0.870588243 alpha:1.0];
  v56 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:");
  v57 = [MEMORY[0x263F1C550] colorWithRed:0.78039217 green:0.843137264 blue:0.905882359 alpha:1.0];
  v54 = [MEMORY[0x263F1C550] colorWithRed:0.603921592 green:0.717647076 blue:0.827450991 alpha:1.0];
  v55 = [MEMORY[0x263F1C550] colorWithRed:0.815686285 green:0.909803927 blue:0.917647064 alpha:1.0];
  v50 = [MEMORY[0x263F1C550] colorWithRed:0.666666687 green:0.835294127 blue:0.847058833 alpha:1.0];
  v53 = [MEMORY[0x263F1C550] colorWithRed:0.941176474 green:0.717647076 blue:0.925490201 alpha:1.0];
  v37 = [MEMORY[0x263F1C550] colorWithRed:0.890196085 green:0.486274511 blue:0.866666675 alpha:1.0];
  v51 = [MEMORY[0x263F1C550] colorWithRed:0.666666687 green:0.941176474 blue:0.949019611 alpha:1.0];
  v33 = [MEMORY[0x263F1C550] colorWithRed:0.396078438 green:0.894117653 blue:0.905882359 alpha:1.0];
  v49 = [MEMORY[0x263F1C550] colorWithRed:0.694117665 green:0.956862748 blue:0.764705896 alpha:1.0];
  v30 = [MEMORY[0x263F1C550] colorWithRed:0.443137258 green:0.921568632 blue:0.568627477 alpha:1.0];
  v26 = [MEMORY[0x263F1C550] colorWithRed:0.850980401 green:0.831372559 blue:0.811764717 alpha:1.0];
  v27 = [MEMORY[0x263F1C550] colorWithRed:0.725490212 green:0.694117665 blue:0.654901981 alpha:1.0];
  v52 = [MEMORY[0x263F1C550] colorWithRed:0.90196079 green:0.839215696 blue:0.749019623 alpha:1.0];
  v23 = [MEMORY[0x263F1C550] colorWithRed:0.819607854 green:0.70588237 blue:0.541176498 alpha:1.0];
  v19 = [MEMORY[0x263F1C550] colorWithRed:0.831372559 green:0.866666675 blue:0.815686285 alpha:1.0];
  v20 = [MEMORY[0x263F1C550] colorWithRed:0.690196097 green:0.760784328 blue:0.666666687 alpha:1.0];
  v35 = [MEMORY[0x263F1C550] colorWithRed:0.56078434 green:0.56078434 blue:0.56078434 alpha:1.0];
  v48 = [MEMORY[0x263F1C550] colorWithRed:0.200000003 green:0.200000003 blue:0.200000003 alpha:1.0];
  v47 = [a1 gradientStartName:@"Pink"];
  v73[0] = v47;
  v74[0] = v72;
  v46 = [a1 gradientEndName:@"Pink"];
  v73[1] = v46;
  v74[1] = v71;
  v45 = [a1 gradientStartName:@"Red"];
  v73[2] = v45;
  v74[2] = v70;
  v44 = [a1 gradientEndName:@"Red"];
  v73[3] = v44;
  v74[3] = v69;
  v43 = [a1 gradientStartName:@"Orange"];
  v73[4] = v43;
  v74[4] = v68;
  v42 = [a1 gradientEndName:@"Orange"];
  v73[5] = v42;
  v74[5] = v67;
  v41 = [a1 gradientStartName:@"Yellow"];
  v73[6] = v41;
  v74[6] = v66;
  v40 = [a1 gradientEndName:@"Yellow"];
  v73[7] = v40;
  v74[7] = v65;
  v39 = [a1 gradientStartName:@"Green"];
  v73[8] = v39;
  v74[8] = v64;
  v38 = [a1 gradientEndName:@"Green"];
  v73[9] = v38;
  v74[9] = v63;
  v36 = [a1 gradientStartName:@"Blue"];
  v73[10] = v36;
  v74[10] = v62;
  v34 = [a1 gradientEndName:@"Blue"];
  v73[11] = v34;
  v74[11] = v61;
  v32 = [a1 gradientStartName:@"Purple"];
  v73[12] = v32;
  v74[12] = v60;
  v31 = [a1 gradientEndName:@"Purple"];
  v73[13] = v31;
  v74[13] = v58;
  v29 = [a1 gradientStartName:@"D6CEDE"];
  v73[14] = v29;
  v74[14] = v56;
  v28 = [a1 gradientEndName:@"D6CEDE"];
  v73[15] = v28;
  v74[15] = v59;
  v25 = [a1 gradientStartName:@"C7D7E7"];
  v73[16] = v25;
  v74[16] = v54;
  v24 = [a1 gradientEndName:@"C7D7E7"];
  v73[17] = v24;
  v74[17] = v57;
  v22 = [a1 gradientStartName:@"D0E8EA"];
  v73[18] = v22;
  v74[18] = v50;
  v21 = [a1 gradientEndName:@"D0E8EA"];
  v73[19] = v21;
  v74[19] = v55;
  v18 = [a1 gradientStartName:@"F0B7EC"];
  v73[20] = v18;
  v74[20] = v37;
  v17 = [a1 gradientEndName:@"F0B7EC"];
  v73[21] = v17;
  v74[21] = v53;
  v16 = [a1 gradientStartName:@"AAF0F2"];
  v73[22] = v16;
  v74[22] = v33;
  v15 = [a1 gradientEndName:@"AAF0F2"];
  v73[23] = v15;
  v74[23] = v51;
  v14 = [a1 gradientStartName:@"B1F4C3"];
  v73[24] = v14;
  v74[24] = v30;
  uint64_t v3 = [a1 gradientEndName:@"B1F4C3"];
  v73[25] = v3;
  v74[25] = v49;
  v4 = [a1 gradientStartName:@"D9D4CF"];
  v73[26] = v4;
  v74[26] = v27;
  double v5 = [a1 gradientEndName:@"D9D4CF"];
  v73[27] = v5;
  v74[27] = v26;
  double v6 = [a1 gradientStartName:@"E6D6BF"];
  v73[28] = v6;
  v74[28] = v23;
  double v7 = [a1 gradientEndName:@"E6D6BF"];
  v73[29] = v7;
  v74[29] = v52;
  double v8 = [a1 gradientStartName:@"D4DDD0"];
  v73[30] = v8;
  v74[30] = v20;
  id v9 = [a1 gradientEndName:@"D4DDD0"];
  v73[31] = v9;
  v74[31] = v19;
  v10 = [a1 gradientStartName:@"8F8F8F"];
  v73[32] = v10;
  v74[32] = v48;
  v11 = [a1 gradientEndName:@"8F8F8F"];
  v73[33] = v11;
  v74[33] = v35;
  id v13 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:34];

  return v13;
}

+ (id)monogramGradientColorNamed:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PRMonogramColor_monogramGradientColorNamed___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = monogramGradientColorNamed__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&monogramGradientColorNamed__onceToken, block);
  }
  double v5 = [(id)monogramGradientColorNamed__monogramGradientColorsByName objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __46__PRMonogramColor_monogramGradientColorNamed___block_invoke(uint64_t a1)
{
  monogramGradientColorNamed__monogramGradientColorsByName = [*(id *)(a1 + 32) generateMonogramGradientColorsByNameDictionary];
  return MEMORY[0x270F9A758]();
}

+ (id)defaultSelectedActiveColor
{
  uint64_t v3 = [a1 defaultBundle];
  id v4 = [a1 colorWithName:@"PlateSelectedActiveColor" inBundle:v3];

  return v4;
}

+ (id)defaultSelectedInactiveColor
{
  uint64_t v3 = [a1 defaultBundle];
  id v4 = [a1 colorWithName:@"PlateSelectedInactiveColor" inBundle:v3];

  return v4;
}

+ (id)defaultSelectedActiveTextColor
{
  uint64_t v3 = [a1 defaultBundle];
  id v4 = [a1 colorWithName:@"PlateSelectedActiveTextColor" inBundle:v3];

  return v4;
}

+ (NSArray)availableColorNames
{
  v4[17] = *MEMORY[0x263EF8340];
  v4[0] = @"Pink";
  v4[1] = @"Red";
  v4[2] = @"Orange";
  v4[3] = @"Yellow";
  v4[4] = @"Green";
  v4[5] = @"Blue";
  v4[6] = @"Purple";
  v4[7] = @"D6CEDE";
  v4[8] = @"C7D7E7";
  v4[9] = @"D0E8EA";
  v4[10] = @"F0B7EC";
  v4[11] = @"AAF0F2";
  v4[12] = @"B1F4C3";
  v4[13] = @"D9D4CF";
  v4[14] = @"E6D6BF";
  v4[15] = @"D4DDD0";
  v4[16] = @"8F8F8F";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:17];
  return (NSArray *)v2;
}

+ (NSArray)availableColors
{
  v2 = +[PRMonogramColor availableColorNames];
  uint64_t v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_0);

  return (NSArray *)v3;
}

PRMonogramColor *__34__PRMonogramColor_availableColors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PRMonogramColor alloc] initWithColorName:v2];

  return v3;
}

- (PRMonogramColor)initWithRandomColor
{
  uint64_t v3 = +[PRMonogramColor availableColorNames];
  id v4 = objc_msgSend(v3, "objectAtIndex:", arc4random_uniform(objc_msgSend(v3, "count")));
  double v5 = [(PRMonogramColor *)self initWithColorName:v4];

  return v5;
}

- (PRMonogramColor)initWithColorName:(id)a3
{
  id v4 = a3;
  double v5 = [(id)objc_opt_class() defaultBundle];
  double v6 = [(PRMonogramColor *)self initWithColorName:v4 inBundle:v5];

  return v6;
}

- (PRMonogramColor)initWithColorName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PRMonogramColor;
  double v8 = [(PRMonogramColor *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(PRMonogramColor *)v8 setColorName:v6];
    objc_storeStrong((id *)&v9->_bundle, a4);
  }

  return v9;
}

- (void)setColorName:(id)a3
{
  id v4 = (__CFString *)a3;
  if (!v4) {
    id v4 = &stru_26C639EC0;
  }
  id v9 = v4;
  unint64_t v5 = [(__CFString *)v4 lengthOfBytesUsingEncoding:4];
  if (v5 > 0x10)
  {
    double v8 = [NSNumber numberWithUnsignedInteger:v5];
    NSLog(&cfstr_PrmonogramSetc.isa, v9, v8, &unk_26C63BA20);

    colorName = self->_colorName;
    self->_colorName = (NSString *)&stru_26C639EC0;
  }
  else
  {
    id v6 = (NSString *)[(__CFString *)v9 copy];
    colorName = self->_colorName;
    self->_colorName = v6;
  }
}

- (UIColor)gradientStartColor
{
  gradientStartColor = self->_gradientStartColor;
  if (!gradientStartColor)
  {
    id v4 = [(PRMonogramColor *)self colorName];
    unint64_t v5 = [v4 stringByAppendingString:@"_GradientStart"];

    id v6 = objc_opt_class();
    id v7 = [(PRMonogramColor *)self bundle];
    double v8 = [v6 colorWithName:v5 inBundle:v7];
    id v9 = self->_gradientStartColor;
    self->_gradientStartColor = v8;

    gradientStartColor = self->_gradientStartColor;
  }
  return gradientStartColor;
}

- (UIColor)gradientEndColor
{
  gradientEndColor = self->_gradientEndColor;
  if (!gradientEndColor)
  {
    id v4 = [(PRMonogramColor *)self colorName];
    unint64_t v5 = [v4 stringByAppendingString:@"_GradientEnd"];

    id v6 = objc_opt_class();
    id v7 = [(PRMonogramColor *)self bundle];
    double v8 = [v6 colorWithName:v5 inBundle:v7];
    id v9 = self->_gradientEndColor;
    self->_gradientEndColor = v8;

    gradientEndColor = self->_gradientEndColor;
  }
  return gradientEndColor;
}

- (UIColor)selectedActiveColor
{
  id v2 = objc_opt_class();
  return (UIColor *)[v2 defaultSelectedActiveTextColor];
}

- (UIColor)selectedInactiveColor
{
  id v2 = objc_opt_class();
  return (UIColor *)[v2 defaultSelectedInactiveColor];
}

- (UIColor)selectedActiveTextColor
{
  id v2 = objc_opt_class();
  return (UIColor *)[v2 defaultSelectedActiveTextColor];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PRMonogramColor *)self colorName];
    id v7 = [v5 colorName];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v2 = [(PRMonogramColor *)self colorName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void)setColor:(id)a3
{
}

- (void)setGradientStartColor:(id)a3
{
}

- (void)setGradientEndColor:(id)a3
{
}

- (void)setSelectedActiveColor:(id)a3
{
}

- (void)setSelectedInactiveColor:(id)a3
{
}

- (void)setSelectedActiveTextColor:(id)a3
{
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_selectedActiveTextColor, 0);
  objc_storeStrong((id *)&self->_selectedInactiveColor, 0);
  objc_storeStrong((id *)&self->_selectedActiveColor, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end