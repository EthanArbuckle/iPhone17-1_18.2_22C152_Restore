@interface SearchUISymbolImage
+ (id)chevronImage;
+ (id)uiImageWithSymbolName:(id)a3;
+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5;
+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7;
+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 platformPrimaryColor:(id)a8 platformSecondaryColor:(id)a9 appearance:(id)a10 preferredFill:(int64_t)a11;
+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10;
+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10 preferredFill:(int64_t)a11;
- (BOOL)drawsOnBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)punchThroughBackground;
- (NSString)symbolName;
- (SearchUISymbolImage)initWithSFImage:(id)a3;
- (SearchUISymbolImage)initWithSymbolName:(id)a3;
- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5;
- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6;
- (UIColor)customBackgroundColor;
- (UIColor)customForegroundColor;
- (UIFont)symbolFont;
- (double)aspectRatio;
- (double)preferredSymbolFontSize;
- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4;
- (int)backgroundColor;
- (int)defaultCornerRoundingStyle;
- (int)primaryColor;
- (int)secondaryColor;
- (int)specifiedFillStyle;
- (int64_t)preferredFill;
- (int64_t)symbolScale;
- (int64_t)symbolWeight;
- (unint64_t)hash;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setBackgroundColor:(int)a3;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setCustomForegroundColor:(id)a3;
- (void)setPreferredFill:(int64_t)a3;
- (void)setPreferredSymbolFontSize:(double)a3;
- (void)setPrimaryColor:(int)a3;
- (void)setPunchThroughBackground:(BOOL)a3;
- (void)setSecondaryColor:(int)a3;
- (void)setSpecifiedFillStyle:(int)a3;
- (void)setSymbolFont:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setSymbolScale:(int64_t)a3;
- (void)setSymbolWeight:(int64_t)a3;
@end

@implementation SearchUISymbolImage

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5
{
  LODWORD(v6) = 0;
  return (id)[a1 uiImageWithSymbolName:a3 font:a4 scale:a5 weight:4 isTemplate:1 primaryColor:0 secondaryColor:v6 appearance:0];
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10
{
  LODWORD(v11) = a9;
  return (id)[a1 uiImageWithSymbolName:a3 font:a4 scale:a5 weight:a6 isTemplate:a7 primaryColor:*(void *)&a8 secondaryColor:v11 appearance:a10 preferredFill:-1];
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 primaryColor:(int)a8 secondaryColor:(int)a9 appearance:(id)a10 preferredFill:(int64_t)a11
{
  uint64_t v11 = *(void *)&a8;
  BOOL v23 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  if (!v18)
  {
    id v18 = [MEMORY[0x1E4FAE060] appearanceWithStyle:0];
  }
  if (v11)
  {
    v19 = objc_msgSend(v18, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", v11));
    if (a9)
    {
LABEL_5:
      v20 = objc_msgSend(v18, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", a9));
      goto LABEL_8;
    }
  }
  else
  {
    v19 = 0;
    if (a9) {
      goto LABEL_5;
    }
  }
  v20 = 0;
LABEL_8:
  v21 = [a1 uiImageWithSymbolName:v16 font:v17 scale:a5 weight:a6 isTemplate:v23 platformPrimaryColor:v19 platformSecondaryColor:v20 appearance:v18 preferredFill:a11];

  return v21;
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7 platformPrimaryColor:(id)a8 platformSecondaryColor:(id)a9 appearance:(id)a10 preferredFill:(int64_t)a11
{
  BOOL v12 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  v19 = objc_opt_new();
  v20 = v19;
  if (v17) {
    [v19 addObject:v17];
  }
  if (v18)
  {
    [v20 addObject:v18];
    [v20 addObject:v18];
  }
  if (a11 == -1
    || ([MEMORY[0x1E4FB1818] _systemImageNamed:v15 shape:-1 fill:a11],
        (v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v21 = [MEMORY[0x1E4FB1818] _systemImageNamed:v15];
  }
  int v22 = [v21 _isHierarchicalColorSymbolImage];
  int v23 = v22;
  if (v12) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = 1;
  }
  if (!v12 && v22)
  {
    if ((unint64_t)objc_msgSend(v20, "count", v24) <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
  }
  v25 = [v21 imageWithRenderingMode:v24];

  if (v16)
  {
    v26 = (void *)MEMORY[0x1E4FB1830];
    [v16 pointSize];
    uint64_t v27 = objc_msgSend(v26, "configurationWithPointSize:weight:scale:", a6, a5);
LABEL_20:
    v28 = (void *)v27;
    uint64_t v29 = [v25 imageWithSymbolConfiguration:v27];

    v25 = (void *)v29;
    goto LABEL_21;
  }
  if (a5)
  {
    uint64_t v27 = [MEMORY[0x1E4FB1830] configurationWithScale:a5];
    goto LABEL_20;
  }
LABEL_21:
  if (!v12 && [v20 count])
  {
    if (v23 && (unint64_t)[v20 count] >= 2)
    {
      v30 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:v20];
      uint64_t v31 = [v25 imageWithSymbolConfiguration:v30];
    }
    else
    {
      v32 = (void *)MEMORY[0x1E4FAE0C0];
      v30 = [v20 firstObject];
      uint64_t v31 = [v32 applyTintColor:v30 toImage:v25];
    }
    v33 = (void *)v31;

    v25 = v33;
  }
  if (!v25)
  {
    v34 = SearchUIGeneralLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[SearchUISymbolImage uiImageWithSymbolName:font:scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:]((uint64_t)v15, v34);
    }
  }
  return v25;
}

- (SearchUISymbolImage)initWithSFImage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUISymbolImage;
  v5 = [(SearchUIImage *)&v9 initWithSFImage:v4];
  if (v5)
  {
    uint64_t v6 = [v4 symbolName];
    [(SearchUISymbolImage *)v5 setSymbolName:v6];

    -[SearchUISymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", [v4 punchThroughBackground]);
    -[SearchUISymbolImage setBackgroundColor:](v5, "setBackgroundColor:", [v4 backgroundColor]);
    -[SearchUISymbolImage setPrimaryColor:](v5, "setPrimaryColor:", [v4 primaryColor]);
    -[SearchUISymbolImage setSecondaryColor:](v5, "setSecondaryColor:", [v4 secondaryColor]);
    -[SearchUISymbolImage setSpecifiedFillStyle:](v5, "setSpecifiedFillStyle:", [v4 fillStyle]);
    if ([(SearchUISymbolImage *)v5 punchThroughBackground]
      && ![(SearchUISymbolImage *)v5 backgroundColor])
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (![(SearchUISymbolImage *)v5 primaryColor]
        && ![(SearchUISymbolImage *)v5 secondaryColor])
      {
        goto LABEL_9;
      }
      uint64_t v7 = 0;
    }
    [(SearchUISymbolImage *)v5 setIsTemplate:v7];
LABEL_9:
    [(SearchUISymbolImage *)v5 setSymbolScale:0];
    [(SearchUISymbolImage *)v5 setSymbolWeight:4];
    [(SearchUISymbolImage *)v5 setPreferredFill:-1];
  }

  return v5;
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3
{
  return [(SearchUISymbolImage *)self initWithSymbolName:a3 font:0 scale:0];
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5
{
  return [(SearchUISymbolImage *)self initWithSymbolName:a3 font:a4 scale:a5 weight:4];
}

- (SearchUISymbolImage)initWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchUISymbolImage;
  BOOL v12 = [(SearchUISymbolImage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(SearchUISymbolImage *)v12 setSymbolName:v10];
    [(SearchUISymbolImage *)v13 setSymbolFont:v11];
    [(SearchUISymbolImage *)v13 setSymbolScale:a5];
    [(SearchUISymbolImage *)v13 setSymbolWeight:a6];
    [(SearchUISymbolImage *)v13 setPreferredFill:-1];
    [(SearchUISymbolImage *)v13 setIsTemplate:1];
  }

  return v13;
}

- (BOOL)drawsOnBackground
{
  if ([(SearchUISymbolImage *)self punchThroughBackground]
    || [(SearchUISymbolImage *)self backgroundColor])
  {
    return 1;
  }
  id v4 = [(SearchUISymbolImage *)self customBackgroundColor];
  BOOL v3 = v4 != 0;

  return v3;
}

- (double)aspectRatio
{
  v12.receiver = self;
  v12.super_class = (Class)SearchUISymbolImage;
  [(SearchUIImage *)&v12 aspectRatio];
  double v4 = v3;
  if (v3 == 0.0)
  {
    v5 = objc_opt_class();
    uint64_t v6 = [(SearchUISymbolImage *)self symbolName];
    uint64_t v7 = [v5 uiImageWithSymbolName:v6];

    [v7 size];
    double v9 = v8;
    [v7 size];
    double v4 = v9 / v10;
  }
  return v4;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(SearchUISymbolImage *)self drawsOnBackground];
  uint64_t v8 = [(SearchUISymbolImage *)self symbolFont];
  int64_t v9 = [(SearchUISymbolImage *)self symbolScale];
  if (!v8 && v7)
  {
    [(SearchUISymbolImage *)self preferredSymbolFontSize];
    if (v10 <= 0.0)
    {
      [(SearchUIImage *)self size];
      double v13 = v12;
      [(SearchUIImage *)self size];
      if (v13 >= v14) {
        double v15 = v14;
      }
      else {
        double v15 = v13;
      }
      double v11 = v15 * 0.32;
      int64_t v9 = 3;
    }
    else
    {
      [(SearchUISymbolImage *)self preferredSymbolFontSize];
      int64_t v9 = 0;
    }
    uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:round(v11)];
  }
  v79 = (void *)v8;
  [(SearchUISymbolImage *)self preferredFill];
  [(SearchUISymbolImage *)self specifiedFillStyle];
  if (v4) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 2;
  }
  id v17 = [MEMORY[0x1E4FAE060] appearanceWithStyle:v16];
  id v18 = [(SearchUISymbolImage *)self customForegroundColor];
  if (v18 || ![(SearchUISymbolImage *)self primaryColor])
  {
    id v19 = v18;
  }
  else
  {
    objc_msgSend(v17, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage primaryColor](self, "primaryColor")));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  if ([(SearchUISymbolImage *)self secondaryColor])
  {
    v21 = objc_msgSend(v17, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage secondaryColor](self, "secondaryColor")));
  }
  else
  {
    v21 = 0;
  }
  int v22 = objc_opt_class();
  int v23 = [(SearchUISymbolImage *)self symbolName];
  v80 = v17;
  uint64_t v24 = objc_msgSend(v22, "uiImageWithSymbolName:font:scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:", v23, v79, v9, -[SearchUISymbolImage symbolWeight](self, "symbolWeight"), -[SearchUIImage isTemplate](self, "isTemplate"), v20, v21, v17, -[SearchUISymbolImage preferredFill](self, "preferredFill"));

  [(SearchUIImage *)self size];
  if (v7)
  {
    CGFloat v27 = v25;
    CGFloat v28 = v26;
    if (v25 != *MEMORY[0x1E4F1DB30] || v26 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v29 = [(SearchUISymbolImage *)self customBackgroundColor];
      v30 = v29;
      double v78 = a3;
      if (v29)
      {
        id v31 = v29;
      }
      else
      {
        objc_msgSend(v80, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", -[SearchUISymbolImage backgroundColor](self, "backgroundColor")));
        id v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v31;

      v33 = (void *)MEMORY[0x1E4FAE100];
      [v24 size];
      objc_msgSend(v33, "idealImageSizeWithSize:fittingSize:");
      double v76 = v35;
      double v77 = v34;
      double v36 = v35;
      [v24 size];
      double v38 = v36 / v37;
      [v24 size];
      double v40 = v39;
      double v42 = v41;
      [v24 alignmentRectInsets];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v40 - v45 - v47;
      CGFloat v50 = v42 - v43 - v49;
      v83.origin.x = v45;
      v83.origin.y = v44;
      v83.size.width = v48;
      v83.size.height = v50;
      double MinX = CGRectGetMinX(v83);
      v84.origin.x = v46;
      v84.origin.y = v44;
      v84.size.width = v48;
      v84.size.height = v50;
      double v52 = v38 * CGRectGetWidth(v84) * 0.5 + MinX * v38;
      v85.origin.x = v46;
      v85.origin.y = v44;
      v85.size.width = v48;
      v85.size.height = v50;
      double MinY = CGRectGetMinY(v85);
      v86.origin.x = v46;
      v86.origin.y = v44;
      v86.size.width = v48;
      v86.size.height = v50;
      double v54 = MinY + CGRectGetHeight(v86) * 0.5;
      v55 = (void *)MEMORY[0x1E4FAE100];
      v87.origin.x = 0.0;
      v87.origin.y = 0.0;
      v87.size.width = v27;
      v87.size.height = v28;
      CGFloat v56 = CGRectGetMidX(v87) - v52;
      v88.origin.x = 0.0;
      v88.origin.y = 0.0;
      v88.size.width = v27;
      v88.size.height = v28;
      objc_msgSend(v55, "deviceScaledRoundedRect:forView:", 0, v56, CGRectGetMidY(v88) - v54, v77, v76);
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      v65 = [(SearchUISymbolImage *)self customForegroundColor];

      if (v65)
      {
        uint64_t v66 = 0;
        CGFloat v67 = v78;
      }
      else
      {
        CGFloat v67 = v78;
        if ([(SearchUISymbolImage *)self punchThroughBackground]
          && ![(SearchUISymbolImage *)self primaryColor])
        {
          uint64_t v66 = 23;
        }
        else
        {
          uint64_t v66 = 20;
        }
      }
      v82.width = v27;
      v82.height = v28;
      UIGraphicsBeginImageContextWithOptions(v82, 0, v67);
      [v32 setFill];
      v89.origin.x = 0.0;
      v89.origin.y = 0.0;
      v89.size.width = v27;
      v89.size.height = v28;
      UIRectFill(v89);
      if ([(SearchUISymbolImage *)self primaryColor]) {
        uint64_t v68 = [(SearchUISymbolImage *)self primaryColor];
      }
      else {
        uint64_t v68 = 7;
      }
      v69 = [(SearchUISymbolImage *)self customForegroundColor];
      v70 = v69;
      if (v69)
      {
        id v71 = v69;
      }
      else
      {
        objc_msgSend(v80, "textColorForColor:", +[SearchUITLKConverters colorForSFColor:](SearchUITLKConverters, "colorForSFColor:", v68));
        id v71 = (id)objc_claimAutoreleasedReturnValue();
      }
      v72 = v71;

      v73 = [v24 imageWithTintColor:v72];
      objc_msgSend(v73, "drawInRect:blendMode:alpha:", v66, v58, v60, v62, v64, 1.0);
      uint64_t v74 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      uint64_t v24 = (void *)v74;
    }
  }

  return v24;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(id, void *, uint64_t))a5;
  if ([(SearchUISymbolImage *)self drawsOnBackground])
  {
    v10.receiver = self;
    v10.super_class = (Class)SearchUISymbolImage;
    [(SearchUIImage *)&v10 loadImageWithScale:v5 isDarkStyle:v8 completionHandler:a3];
  }
  else
  {
    int64_t v9 = [(SearchUISymbolImage *)self loadImageWithScale:v5 isDarkStyle:a3];
    v8[2](v8, v9, 1);
  }
}

- (int)defaultCornerRoundingStyle
{
  if (![(SearchUISymbolImage *)self drawsOnBackground]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SearchUISymbolImage;
  return [(SearchUIImage *)&v4 defaultCornerRoundingStyle];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v7 = (SearchUISymbolImage *)a3;
  if (v7 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = v7;
      int64_t v9 = [(SearchUIImage *)self sfImage];
      if (v9 || ([(SearchUIImage *)v8 sfImage], (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v36.receiver = self;
        v36.super_class = (Class)SearchUISymbolImage;
        unsigned int v10 = [(SearchUIImage *)&v36 isEqual:v8];
        if (v9)
        {

          if (v10) {
            goto LABEL_7;
          }
LABEL_14:
          BOOL v14 = 0;
LABEL_28:

          goto LABEL_29;
        }

        if ((v10 & 1) == 0) {
          goto LABEL_14;
        }
      }
LABEL_7:
      double v11 = [(SearchUISymbolImage *)self symbolName];
      double v12 = [(SearchUISymbolImage *)v8 symbolName];
      if (![v11 isEqualToString:v12])
      {
        BOOL v14 = 0;
LABEL_27:

        goto LABEL_28;
      }
      double v13 = [(SearchUISymbolImage *)self symbolFont];
      if (!v13
        || ([(SearchUISymbolImage *)self symbolFont],
            objc_super v4 = objc_claimAutoreleasedReturnValue(),
            [(SearchUISymbolImage *)v8 symbolFont],
            BOOL v5 = objc_claimAutoreleasedReturnValue(),
            ([v4 isEqual:v5] & 1) == 0))
      {
        double v15 = [(SearchUISymbolImage *)self symbolFont];
        if (v15
          || ([(SearchUISymbolImage *)v8 symbolFont],
              (double v15 = objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_24:
          BOOL v14 = 0;
          goto LABEL_25;
        }
      }
      int64_t v16 = [(SearchUISymbolImage *)self symbolScale];
      if (v16 != [(SearchUISymbolImage *)v8 symbolScale]) {
        goto LABEL_24;
      }
      [(SearchUISymbolImage *)self preferredSymbolFontSize];
      double v18 = v17;
      [(SearchUISymbolImage *)v8 preferredSymbolFontSize];
      if (v18 - v19 >= 2.22044605e-16) {
        goto LABEL_24;
      }
      double v35 = [(SearchUISymbolImage *)self customBackgroundColor];
      if (v35
        && ([(SearchUISymbolImage *)self customBackgroundColor],
            v20 = objc_claimAutoreleasedReturnValue(),
            [(SearchUISymbolImage *)v8 customBackgroundColor],
            v33 = v20,
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v20, "isEqual:") & 1) != 0))
      {
        int v31 = 0;
      }
      else
      {
        int v22 = [(SearchUISymbolImage *)self customBackgroundColor];
        if (v22)
        {
          BOOL v14 = 0;
LABEL_44:

          if (!v35)
          {
LABEL_49:

LABEL_25:
            if (v13)
            {
            }
            goto LABEL_27;
          }
          CGFloat v28 = (void *)v34;
LABEL_48:

          goto LABEL_49;
        }
        int v23 = [(SearchUISymbolImage *)v8 customBackgroundColor];
        if (v23)
        {

          BOOL v14 = 0;
          goto LABEL_47;
        }
        int v31 = 1;
      }
      uint64_t v32 = [(SearchUISymbolImage *)self customForegroundColor];
      if (v32
        && ([(SearchUISymbolImage *)self customForegroundColor],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            [(SearchUISymbolImage *)v8 customForegroundColor],
            uint64_t v29 = objc_claimAutoreleasedReturnValue(),
            v30 = v24,
            (objc_msgSend(v24, "isEqual:") & 1) != 0))
      {
        BOOL v14 = 1;
        double v25 = (void *)v32;
      }
      else
      {
        double v26 = [(SearchUISymbolImage *)self customForegroundColor];
        if (v26)
        {

          BOOL v14 = 0;
        }
        else
        {
          CGFloat v27 = [(SearchUISymbolImage *)v8 customForegroundColor];
          BOOL v14 = v27 == 0;
        }
        double v25 = (void *)v32;
        if (!v32)
        {
          if (v31) {
            goto LABEL_43;
          }
          goto LABEL_47;
        }
      }

      if (v31)
      {
LABEL_43:
        int v22 = 0;
        goto LABEL_44;
      }
LABEL_47:
      CGFloat v28 = (void *)v34;
      if (!v35) {
        goto LABEL_25;
      }
      goto LABEL_48;
    }
    BOOL v14 = 0;
  }
LABEL_29:

  return v14;
}

- (unint64_t)hash
{
  double v3 = [(SearchUISymbolImage *)self symbolName];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(SearchUISymbolImage *)self symbolFont];
  uint64_t v6 = [v5 hash] ^ v4;
  BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[SearchUISymbolImage symbolScale](self, "symbolScale"));
  uint64_t v8 = v6 ^ [v7 hash];
  int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[SearchUISymbolImage symbolWeight](self, "symbolWeight"));
  uint64_t v10 = [v9 hash];
  double v11 = NSNumber;
  [(SearchUISymbolImage *)self preferredSymbolFontSize];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = v8 ^ v10 ^ [v12 hash];
  BOOL v14 = [(SearchUISymbolImage *)self customBackgroundColor];
  uint64_t v15 = [v14 hash];
  int64_t v16 = [(SearchUISymbolImage *)self customForegroundColor];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

+ (id)chevronImage
{
  id v2 = objc_alloc((Class)objc_opt_class());
  double v3 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v4 = (void *)[v2 initWithSymbolName:@"chevron.forward" font:v3 scale:1 weight:(uint64_t)*MEMORY[0x1E4FB09E0]];

  return v4;
}

+ (id)uiImageWithSymbolName:(id)a3
{
  return (id)[a1 uiImageWithSymbolName:a3 font:0 scale:0];
}

+ (id)uiImageWithSymbolName:(id)a3 font:(id)a4 scale:(int64_t)a5 weight:(int64_t)a6 isTemplate:(BOOL)a7
{
  BOOL v7 = a7;
  double v12 = (void *)MEMORY[0x1E4FAE060];
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v12 appearanceWithStyle:0];
  LODWORD(v18) = 0;
  int64_t v16 = [a1 uiImageWithSymbolName:v14 font:v13 scale:a5 weight:a6 isTemplate:v7 primaryColor:0 secondaryColor:v18 appearance:v15];

  return v16;
}

- (int64_t)preferredFill
{
  return self->_preferredFill;
}

- (void)setPreferredFill:(int64_t)a3
{
  self->_preferredFill = a3;
}

- (int64_t)symbolScale
{
  return self->_symbolScale;
}

- (void)setSymbolScale:(int64_t)a3
{
  self->_symbolScale = a3;
}

- (double)preferredSymbolFontSize
{
  return self->_preferredSymbolFontSize;
}

- (void)setPreferredSymbolFontSize:(double)a3
{
  self->_preferredSymbolFontSize = a3;
}

- (UIColor)customForegroundColor
{
  return self->_customForegroundColor;
}

- (void)setCustomForegroundColor:(id)a3
{
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSymbolName:(id)a3
{
}

- (UIFont)symbolFont
{
  return (UIFont *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSymbolFont:(id)a3
{
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(int64_t)a3
{
  self->_symbolWeight = a3;
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (void)setPunchThroughBackground:(BOOL)a3
{
  self->_punchThroughBackground = a3;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int)a3
{
  self->_backgroundColor = a3;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(int)a3
{
  self->_primaryColor = a3;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (void)setSecondaryColor:(int)a3
{
  self->_secondaryColor = a3;
}

- (int)specifiedFillStyle
{
  return self->_specifiedFillStyle;
}

- (void)setSpecifiedFillStyle:(int)a3
{
  self->_specifiedFillStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolFont, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customForegroundColor, 0);
}

+ (void)uiImageWithSymbolName:(uint64_t)a1 font:(NSObject *)a2 scale:weight:isTemplate:platformPrimaryColor:platformSecondaryColor:appearance:preferredFill:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "Symbol named %@ not found", (uint8_t *)&v2, 0xCu);
}

@end