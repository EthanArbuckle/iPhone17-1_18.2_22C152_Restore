@interface TSKAnnotationAuthor
+ (id)authorChangeAdornmentsColorForIndex:(unint64_t)a3;
+ (id)authorColorAppearanceNameForIndex:(unint64_t)a3;
+ (id)authorColorNameForIndex:(unint64_t)a3;
+ (id)authorPopoverColorForIndex:(unint64_t)a3;
+ (id)authorStorageColorForIndex:(unint64_t)a3;
+ (id)authorTextMarkupColorForIndex:(unint64_t)a3;
+ (id)defaultAuthorName;
+ (unint64_t)presetColorCount;
- (BOOL)allowsImplicitComponentOwnership;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (TSKAnnotationAuthor)initWithContext:(id)a3 name:(id)a4 color:(id)a5;
- (TSUColor)cellViolatorColor;
- (TSUColor)changeAdornmentsColor;
- (TSUColor)flagFillColor;
- (TSUColor)flagPressedColor;
- (TSUColor)flagStrokeColor;
- (TSUColor)popoverColor;
- (TSUColor)storageColor;
- (TSUColor)textHighlightColor;
- (TSUColor)textMarkupColor;
- (id)componentRootObject;
- (id)description;
- (unint64_t)hash;
- (unint64_t)p_authorColorIndex;
- (void)dealloc;
- (void)setName:(id)a3;
- (void)setStorageColor:(id)a3;
@end

@implementation TSKAnnotationAuthor

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  [(TSPObject *)self willModify];
  v5 = (NSString *)[a3 copy];

  self->mName = v5;
}

- (TSUColor)storageColor
{
  return self->mColor;
}

- (void)setStorageColor:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mColor = (TSUColor *)a3;
}

- (TSKAnnotationAuthor)initWithContext:(id)a3 name:(id)a4 color:(id)a5
{
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSKAnnotationAuthor initWithContext:name:color:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 39, @"Invalid parameter not satisfying: %s", "name != nil");
    if (a5) {
      goto LABEL_3;
    }
  }
  v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v14 = [NSString stringWithUTF8String:"-[TSKAnnotationAuthor initWithContext:name:color:]"];
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 40, @"Invalid parameter not satisfying: %s", "color != nil");
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)TSKAnnotationAuthor;
  v9 = [(TSPObject *)&v15 initWithContext:a3];
  if (v9)
  {
    v9->mName = (NSString *)[a4 copy];
    v9->mColor = (TSUColor *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthor;
  [(TSKAnnotationAuthor *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v4 = (void *)TSUDynamicCast();
      int v5 = -[TSUColor isEqual:](self->mColor, "isEqual:", [v4 storageColor]);
      if (v5)
      {
        mName = self->mName;
        uint64_t v7 = [v4 name];
        LOBYTE(v5) = [(NSString *)mName isEqualToString:v7];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)TSKAnnotationAuthor;
  unint64_t v3 = [(TSKAnnotationAuthor *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->mName hash] ^ v3;
  return v4 ^ [(TSUColor *)self->mColor hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<TSKAnnotationAuthor: %p name %@ color %@>", self, self->mName, self->mColor];
}

- (unint64_t)p_authorColorIndex
{
  v2 = [(TSKAnnotationAuthor *)self storageColor];
  if (!+[TSKAnnotationAuthor presetColorCount]) {
    goto LABEL_7;
  }
  unint64_t v3 = 0;
  while ((objc_msgSend(+[TSKAnnotationAuthor authorStorageColorForIndex:](TSKAnnotationAuthor, "authorStorageColorForIndex:", v3), "isEqual:", v2) & 1) == 0)
  {
    if (++v3 >= +[TSKAnnotationAuthor presetColorCount]) {
      goto LABEL_7;
    }
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    [(TSUColor *)v2 redComponent];
    double v5 = v4;
    [(TSUColor *)v2 greenComponent];
    double v7 = v6;
    [(TSUColor *)v2 blueComponent];
    double v9 = v8;
    if (!+[TSKAnnotationAuthor presetColorCount])
    {
LABEL_14:
      v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v21 = [NSString stringWithUTF8String:"-[TSKAnnotationAuthor p_authorColorIndex]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 133, @"Should have found a color");
      return 0;
    }
    unint64_t v10 = 0;
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    double v11 = 1.79769313e308;
    do
    {
      id v12 = +[TSKAnnotationAuthor authorStorageColorForIndex:v10];
      if (v12)
      {
        v13 = v12;
        [v12 redComponent];
        double v15 = v14;
        [v13 greenComponent];
        double v17 = v16;
        [v13 blueComponent];
        double v19 = sqrt((v17 - v7) * (v17 - v7) + (v15 - v5) * (v15 - v5) + (v18 - v9) * (v18 - v9));
        if (v19 < v11)
        {
          double v11 = v19;
          unint64_t v3 = v10;
        }
      }
      ++v10;
    }
    while (v10 < +[TSKAnnotationAuthor presetColorCount]);
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  return v3;
}

- (TSUColor)textMarkupColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorTextMarkupColorForIndex:v2];
}

- (TSUColor)textHighlightColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorTextHighlightColorForIndex:v2];
}

- (TSUColor)cellViolatorColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorCellViolatorColorForIndex:v2];
}

- (TSUColor)flagStrokeColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorFlagStrokeColorForIndex:v2];
}

- (TSUColor)flagPressedColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorFlagPressedColorForIndex:v2];
}

- (TSUColor)changeAdornmentsColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorChangeAdornmentsColorForIndex:v2];
}

- (TSUColor)flagFillColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorFlagFillColorForIndex:v2];
}

- (TSUColor)popoverColor
{
  unint64_t v2 = [(TSKAnnotationAuthor *)self p_authorColorIndex];

  return (TSUColor *)+[TSKAnnotationAuthor authorPopoverColorForIndex:v2];
}

+ (unint64_t)presetColorCount
{
  return 8;
}

+ (id)authorStorageColorForIndex:(unint64_t)a3
{
  if (+[TSKAnnotationAuthor authorStorageColorForIndex:]::onceToken != -1) {
    dispatch_once(&+[TSKAnnotationAuthor authorStorageColorForIndex:]::onceToken, &__block_literal_global_15);
  }
  if (a3 >= 8)
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorStorageColorForIndex:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 227, @"author color id not defined");
  }
  unint64_t v6 = 8;
  if (a3 < 8) {
    unint64_t v6 = a3;
  }
  return (id)+[TSKAnnotationAuthor authorStorageColorForIndex:]::sAuthorColors[v6];
}

id __50__TSKAnnotationAuthor_authorStorageColorForIndex___block_invoke()
{
  uint64_t v0 = 0;
  uint64_t v10 = 0x3FEB3B3B40000000;
  uint64_t v9 = 0x3FE5757580000000;
  uint64_t v8 = 0x3FEDDDDDE0000000;
  do
  {
    switch(v0)
    {
      case 0:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v3 = 0.980392158;
        double v5 = 0.352941185;
        double v4 = 0.937254906;
        goto LABEL_13;
      case 1:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v4 = 0.941176474;
        double v3 = 0.749019623;
        goto LABEL_11;
      case 2:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v4 = 0.800000012;
        double v3 = 0.68235296;
        double v5 = 0.988235295;
        goto LABEL_13;
      case 3:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v3 = 0.980392158;
        double v5 = 0.823529422;
        double v4 = 0.666666687;
        goto LABEL_13;
      case 4:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v4 = *(double *)&v9;
        double v3 = *(double *)&v10;
        double v5 = *(double *)&v8;
        goto LABEL_13;
      case 5:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v3 = 0.552941203;
        double v4 = 0.854901969;
        double v5 = 0.792156875;
        goto LABEL_13;
      case 6:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v3 = 0.960784316;
        double v4 = 0.694117665;
LABEL_11:
        double v5 = 0.301960796;
        goto LABEL_13;
      case 7:
        v1 = (void *)MEMORY[0x263F7C808];
        double v2 = 1.0;
        double v3 = 0.87843138;
        double v4 = 0.87843138;
        double v5 = 0.87843138;
LABEL_13:
        unint64_t v6 = objc_msgSend(v1, "colorWithRed:green:blue:alpha:", v3, v4, v5, v2, v8, v9, v10);
        break;
      default:
        unint64_t v6 = (void *)[MEMORY[0x263F7C808] blackColor];
        break;
    }
    id result = v6;
    +[TSKAnnotationAuthor authorStorageColorForIndex:]::sAuthorColors[v0++] = result;
  }
  while (v0 != 9);
  return result;
}

+ (id)authorTextMarkupColorForIndex:(unint64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TSKAnnotationAuthor_authorTextMarkupColorForIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::onceToken != -1) {
    dispatch_once(&+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::onceToken, block);
  }
  if (a3 >= 8)
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 275, @"author color id not defined");
  }
  unint64_t v6 = 8;
  if (a3 < 8) {
    unint64_t v6 = a3;
  }
  return (id)+[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::sAuthorColors[v6];
}

id __53__TSKAnnotationAuthor_authorTextMarkupColorForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v10 = 0x3FE4747480000000;
  do
  {
    switch(*(void *)(a1 + 32))
    {
      case 0:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v4 = 0.0;
        double v5 = 1.0;
        double v7 = 0.596078455;
        double v6 = 0.75686276;
        goto LABEL_12;
      case 1:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v4 = 0.0;
        double v5 = 1.0;
        double v6 = 0.478431374;
        double v7 = 0.647058845;
        goto LABEL_12;
      case 2:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v7 = 0.529411793;
        double v6 = 0.329411775;
        double v4 = 0.80392158;
        goto LABEL_12;
      case 3:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v7 = 0.301960796;
        double v6 = 0.713725507;
        double v4 = 0.541176498;
        goto LABEL_12;
      case 4:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v6 = *(double *)&v10;
        double v7 = 0.407843143;
        double v4 = 0.866666675;
        goto LABEL_12;
      case 5:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v6 = 0.156862751;
        double v7 = 0.53725493;
        double v4 = 0.458823532;
        goto LABEL_12;
      case 6:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v6 = 0.647058845;
        double v7 = 0.427450985;
        double v4 = 0.0862745121;
        goto LABEL_12;
      case 7:
        double v3 = (void *)MEMORY[0x263F7C808];
        double v5 = 1.0;
        double v6 = 0.427450985;
        double v7 = 0.427450985;
        double v4 = 0.427450985;
LABEL_12:
        uint64_t v8 = objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v6, v7, v4, v5, v10);
        break;
      default:
        uint64_t v8 = (void *)[MEMORY[0x263F7C808] blackColor];
        break;
    }
    id result = v8;
    +[TSKAnnotationAuthor authorTextMarkupColorForIndex:]::sAuthorColors[v2++] = (uint64_t)result;
  }
  while (v2 != 9);
  return result;
}

+ (id)authorChangeAdornmentsColorForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.992156863;
      double v5 = 0.815686285;
      double v6 = 0.211764708;
      goto LABEL_10;
    case 1uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.674509823;
      double v5 = 0.858823538;
      double v6 = 0.156862751;
      goto LABEL_10;
    case 2uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.627451003;
      double v5 = 0.749019623;
      double v6 = 0.917647064;
      goto LABEL_10;
    case 3uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.952941179;
      double v5 = 0.666666687;
      double v6 = 0.796078444;
      goto LABEL_10;
    case 4uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.729411781;
      double v5 = 0.509803951;
      double v6 = 0.996078432;
      goto LABEL_10;
    case 5uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.407843143;
      double v5 = 0.749019623;
      double v6 = 0.678431392;
      goto LABEL_10;
    case 6uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.984313726;
      double v5 = 0.674509823;
      double v6 = 0.254901975;
LABEL_10:
      double v11 = 1.0;
      goto LABEL_11;
    case 7uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.87843138;
      double v11 = 1.0;
      double v5 = 0.87843138;
      double v6 = 0.87843138;
LABEL_11:
      id result = (id)[v3 colorWithRed:v4 green:v5 blue:v6 alpha:v11];
      break;
    default:
      double v7 = (void *)[MEMORY[0x263F7C808] blackColor];
      uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorChangeAdornmentsColorForIndex:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 333, @"author color id not defined");
      id result = v7;
      break;
  }
  return result;
}

+ (id)authorPopoverColorForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.984313726;
      double v5 = 0.945098042;
      double v6 = 0.490196079;
      goto LABEL_10;
    case 1uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.749019623;
      double v5 = 0.941176474;
      double v6 = 0.301960796;
      goto LABEL_10;
    case 2uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.733333349;
      double v5 = 0.839215696;
      double v6 = 0.984313726;
      goto LABEL_10;
    case 3uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v5 = 0.730000019;
      double v6 = 0.850000024;
      double v4 = 1.0;
      goto LABEL_10;
    case 4uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.850980401;
      double v5 = 0.670588255;
      double v6 = 0.933333337;
      goto LABEL_10;
    case 5uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.552941203;
      double v5 = 0.854901969;
      double v6 = 0.792156875;
      goto LABEL_10;
    case 6uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.970000029;
      double v6 = 0.370000005;
      double v5 = 0.75;
LABEL_10:
      double v11 = 1.0;
      goto LABEL_11;
    case 7uLL:
      double v3 = (void *)MEMORY[0x263F7C808];
      double v4 = 0.956862748;
      double v11 = 1.0;
      double v5 = 0.956862748;
      double v6 = 0.956862748;
LABEL_11:
      id result = (id)[v3 colorWithRed:v4 green:v5 blue:v6 alpha:v11];
      break;
    default:
      double v7 = (void *)[MEMORY[0x263F7C808] blackColor];
      uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorPopoverColorForIndex:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 376, @"author color id not defined");
      id result = v7;
      break;
  }
  return result;
}

+ (id)authorColorAppearanceNameForIndex:(unint64_t)a3
{
  if (a3 < 8) {
    return off_2646B0C80[a3];
  }
  double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorColorAppearanceNameForIndex:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 416, @"author color id not defined");
  return @"Unknown";
}

+ (id)authorColorNameForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Yellow";
      goto LABEL_11;
    case 1uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Green";
      goto LABEL_11;
    case 2uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Blue";
      goto LABEL_11;
    case 3uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Pink";
      goto LABEL_11;
    case 4uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Purple";
      goto LABEL_11;
    case 5uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Teal";
      goto LABEL_11;
    case 6uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Orange";
      goto LABEL_11;
    case 7uLL:
      double v3 = (void *)TSKBundle();
      double v4 = @"Gray";
LABEL_11:
      id result = (id)[v3 localizedStringForKey:v4 value:&stru_26D688A48 table:@"TSKit"];
      break;
    default:
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"+[TSKAnnotationAuthor authorColorNameForIndex:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthor.mm"), 454, @"author color id not defined");
      id result = @"Unknown";
      break;
  }
  return result;
}

+ (id)defaultAuthorName
{
  uint64_t v2 = (void *)[MEMORY[0x263F1C5C0] currentDevice];

  return (id)[v2 localizedModel];
}

- (id)componentRootObject
{
  id v2 = [(TSPObject *)self documentRoot];

  return (id)[v2 annotationAuthorStorage];
}

- (BOOL)allowsImplicitComponentOwnership
{
  return 0;
}

@end