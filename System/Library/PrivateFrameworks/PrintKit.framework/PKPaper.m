@interface PKPaper
+ (BOOL)supportsSecureCoding;
+ (BOOL)useMetric;
+ (BOOL)willAdjustMarginsForDuplexMode:(id)a3;
+ (id)defaultGenericPaperForLocale:(id)a3;
+ (id)documentPapers;
+ (id)generic3_5x5Paper;
+ (id)generic4x6Paper;
+ (id)genericA4Paper;
+ (id)genericA6Paper;
+ (id)genericBorderlessWithName:(id)a3;
+ (id)genericHagakiPaper;
+ (id)genericLegalPaper;
+ (id)genericLetterPaper;
+ (id)genericPRC32KPaper;
+ (id)genericWithName:(id)a3;
+ (id)mediaNameForWidth:(int)a3 Height:(int)a4 mediaType:(id)a5 Borderless:(BOOL)a6 Simplex:(BOOL)a7;
+ (id)mediaNameForWidth:(int)a3 height:(int)a4 borderless:(BOOL)a5 simplex:(BOOL)a6;
+ (id)paperWithAttributes:(id)a3;
+ (id)photoPapers;
- (BOOL)isBorderless;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualSize:(id)a3;
- (BOOL)isEqualSizeAndMediaType:(id)a3;
- (BOOL)isRoll;
- (CGRect)imageableAreaRect;
- (CGSize)paperSize;
- (NSDictionary)mediaInfo;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)localizedName;
- (NSString)mediaTypeName;
- (PKPaper)initWithCoder:(id)a3;
- (PKPaper)initWithUserCodableDictionary:(id)a3;
- (PKPaper)initWithWidth:(int)a3 Height:(int)a4 Left:(int)a5 Top:(int)a6 Right:(int)a7 Bottom:(int)a8 localizedName:(id)a9 codeName:(id)a10 mediaInfo:(id)a11;
- (PKPaper)paperWithMarginsAdjustedForDuplexMode:(id)a3;
- (double)imageableArea;
- (id)baseName;
- (id)createMediaColAndDoMargins:(BOOL)a3;
- (id)cutToLength:(double)a3;
- (id)cutToPWGLength:(int)a3;
- (id)localizedNameFromDimensions;
- (id)mediaType;
- (id)name;
- (id)nameWithoutSuffixes:(id)a3;
- (id)userCodableDictionary;
- (int)bottomMargin;
- (int)height;
- (int)leftMargin;
- (int)maxHeight;
- (int)minHeight;
- (int)rightMargin;
- (int)topMargin;
- (int)width;
- (int64_t)sizeAndImageableCompare:(id)a3;
- (int64_t)sizeMediaTypeAndImageableCompare:(id)a3;
- (unint64_t)bottomMarginInPoints;
- (unint64_t)hash;
- (unint64_t)maxCutLength;
- (unint64_t)minCutLength;
- (unint64_t)topMarginInPoints;
- (void)addToMediaCol:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)visitProperties:(Visitor *)a3;
@end

@implementation PKPaper

+ (id)defaultGenericPaperForLocale:(id)a3
{
  id v4 = a3;
  if (+[PKPaper defaultGenericPaperForLocale:]::onceToken != -1) {
    dispatch_once(&+[PKPaper defaultGenericPaperForLocale:]::onceToken, &__block_literal_global_8);
  }
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v5 objectForKey:*MEMORY[0x263EFF4D0]];

  if (v6
    && [(id)+[PKPaper defaultGenericPaperForLocale:]::_letterCountries containsObject:v6])
  {
    uint64_t v7 = [a1 genericLetterPaper];
  }
  else
  {
    uint64_t v7 = [a1 genericA4Paper];
  }
  v8 = (void *)v7;

  return v8;
}

void __40__PKPaper_defaultGenericPaperForLocale___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"US", @"CA", @"MX", @"CR", @"PH", @"CL", @"CO", 0);
  v1 = (void *)+[PKPaper defaultGenericPaperForLocale:]::_letterCountries;
  +[PKPaper defaultGenericPaperForLocale:]::_letterCountries = v0;
}

+ (BOOL)useMetric
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x263EFF560]];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (id)mediaNameForWidth:(int)a3 Height:(int)a4 mediaType:(id)a5 Borderless:(BOOL)a6 Simplex:(BOOL)a7
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a4)
  {
    BOOL v8 = a7;
    BOOL v9 = a6;
    uint64_t v10 = *(void *)&a4;
    v11 = pwgMediaForSize(*(const char **)&a3, *(uint64_t *)&a4, v15);
    v12 = "";
    if (v8) {
      v12 = "-simplex";
    }
    if (v9) {
      v12 = "-fullbleed";
    }
    if (v11 && *(void *)v11)
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s%s", *(void *)v11, v12);
    }
    else
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"media-%dx%d%s", v7, v10, v12);
    }
  }
  else
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"roll-%dx0", *(void *)&a4, a5, a6, a7, *(void *)&a3);
  }

  return v13;
}

+ (id)paperWithAttributes:(id)a3
{
  id v4 = a3;
  v32 = [v4 objectForKeyedSubscript:@"media-size"];
  v5 = [v32 objectForKeyedSubscript:@"x-dimension"];
  uint64_t v6 = [v5 intValue];

  v31 = [v4 objectForKeyedSubscript:@"media-type"];
  uint64_t v7 = [v32 objectForKeyedSubscript:@"y-dimension"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    BOOL v9 = [v7 objectAtIndexedSubscript:0];
    int v10 = [v9 intValue];

    v11 = [v7 objectAtIndexedSubscript:1];
    uint64_t v12 = [v11 intValue];
  }
  else
  {
    v11 = [v32 objectForKeyedSubscript:@"y-dimension"];
    uint64_t v12 = [v11 intValue];
    int v10 = v12;
  }
  uint64_t v13 = v12;

  v14 = 0;
  if ((int)v6 >= 1 && (int)v13 >= v10)
  {
    v15 = [v4 objectForKeyedSubscript:@"media-left-margin"];
    unsigned int v30 = [v15 intValue];

    uint64_t v16 = [v4 objectForKeyedSubscript:@"media-top-margin"];
    uint64_t v17 = [v16 intValue];

    v18 = [v4 objectForKeyedSubscript:@"media-right-margin"];
    id v19 = a1;
    uint64_t v20 = [v18 intValue];

    v21 = [v4 objectForKeyedSubscript:@"media-bottom-margin"];
    uint64_t v22 = [v21 intValue];

    if (isKindOfClass)
    {
      int v23 = [v19 useMetric];
      double v24 = (double)(int)v6;
      v25 = "";
      if (!(v30 | v17 | v20 | v22)) {
        v25 = "-fullbleed";
      }
      if (v23)
      {
        uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"roll_anon_%.1fx0mm%s", v24 / 100.0, v25);
        unint64_t v27 = 0x2649E1000;
      }
      else
      {
        uint64_t v26 = [NSString stringWithFormat:@"roll_anon_%.2fx0in%s", v24 / 2540.0, v25];
        unint64_t v27 = 0x2649E1000uLL;
      }
    }
    else
    {
      unint64_t v27 = 0x2649E1000uLL;
      uint64_t v26 = +[PKPaper mediaNameForWidth:v6 Height:v13 mediaType:v31 Borderless:(v30 | v17 | v20 | v22) == 0 Simplex:0];
    }
    v28 = (void *)v26;
    v14 = (void *)[objc_alloc(*(Class *)(v27 + 1192)) initWithWidth:v6 Height:v13 Left:v30 Top:v17 Right:v20 Bottom:v22 localizedName:0 codeName:v26 mediaInfo:v4];
  }

  return v14;
}

- (unint64_t)topMarginInPoints
{
  return (unint64_t)((double)[(PKPaper *)self topMargin] * 72.0 / 2540.0);
}

- (unint64_t)bottomMarginInPoints
{
  return (unint64_t)((double)[(PKPaper *)self bottomMargin] * 72.0 / 2540.0);
}

- (unint64_t)minCutLength
{
  return (unint64_t)((double)[(PKPaper *)self minHeight] * 72.0 / 2540.0);
}

- (unint64_t)maxCutLength
{
  return (unint64_t)((double)[(PKPaper *)self maxHeight] * 72.0 / 2540.0);
}

- (id)cutToLength:(double)a3
{
  LODWORD(v3) = llround(a3 * 2540.0 / 72.0);
  return [(PKPaper *)self cutToPWGLength:v3];
}

- (id)cutToPWGLength:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(PKPaper *)self topMargin];
  uint64_t v6 = [(PKPaper *)self bottomMargin];
  if ([(PKPaper *)self minHeight] <= (int)v3)
  {
    if ([(PKPaper *)self maxHeight] < (int)v3) {
      uint64_t v3 = [(PKPaper *)self maxHeight];
    }
  }
  else
  {
    int v7 = [(PKPaper *)self minHeight] - v3;
    int v8 = [(PKPaper *)self topMargin];
    int v9 = [(PKPaper *)self bottomMargin];
    uint64_t v3 = [(PKPaper *)self minHeight];
    uint64_t v6 = (v6 + (v8 + v7 - v9) / 2);
    uint64_t v5 = (v7 + v5 - (v8 + v7 - v9) / 2);
  }
  if ([(PKPaper *)self isRoll])
  {
    int v10 = [PKPaper alloc];
    uint64_t v11 = [(PKPaper *)self width];
    uint64_t v12 = [(PKPaper *)self leftMargin];
    uint64_t v13 = [(PKPaper *)self rightMargin];
    v14 = [(PKPaper *)self name];
    v15 = [(PKPaper *)self mediaInfo];
    uint64_t v16 = [(PKPaper *)v10 initWithWidth:v11 Height:v3 Left:v12 Top:v5 Right:v13 Bottom:v6 localizedName:0 codeName:v14 mediaInfo:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (PKPaper)initWithWidth:(int)a3 Height:(int)a4 Left:(int)a5 Top:(int)a6 Right:(int)a7 Bottom:(int)a8 localizedName:(id)a9 codeName:(id)a10 mediaInfo:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  uint64_t v16 = *(void *)&a3;
  v37[2] = *MEMORY[0x263EF8340];
  id v32 = a10;
  id v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)PKPaper;
  id v19 = [(PKPaper *)&v33 init];
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_width = v16;
    v19->_height = v15;
    v19->_leftMargin = v14;
    v19->_topMargin = v13;
    v19->_rightMargin = v12;
    v19->_bottomMargin = v11;
    objc_storeStrong((id *)&v19->_name, a10);
    if (v18)
    {
      v21 = (NSDictionary *)v18;
      mediaInfo = v20->_mediaInfo;
      v20->_mediaInfo = v21;
    }
    else
    {
      v36[0] = @"x-dimension";
      int v23 = [NSNumber numberWithInt:v16];
      v37[0] = v23;
      v36[1] = @"y-dimension";
      double v24 = [NSNumber numberWithInt:v15];
      v37[1] = v24;
      mediaInfo = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

      v35[0] = mediaInfo;
      v34[0] = @"media-size";
      v34[1] = @"media-left-margin";
      v25 = [NSNumber numberWithInt:v14];
      v35[1] = v25;
      v34[2] = @"media-top-margin";
      uint64_t v26 = [NSNumber numberWithInt:v13];
      v35[2] = v26;
      v34[3] = @"media-right-margin";
      unint64_t v27 = [NSNumber numberWithInt:v12];
      v35[3] = v27;
      v34[4] = @"media-bottom-margin";
      v28 = [NSNumber numberWithInt:v11];
      v35[4] = v28;
      uint64_t v29 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5];
      unsigned int v30 = v20->_mediaInfo;
      v20->_mediaInfo = (NSDictionary *)v29;
    }
  }

  return v20;
}

- (CGSize)paperSize
{
  double v3 = (double)[(PKPaper *)self width] * 72.0 / 2540.0;
  double v4 = (double)[(PKPaper *)self height] * 72.0 / 2540.0;
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGRect)imageableAreaRect
{
  double v3 = (double)[(PKPaper *)self leftMargin] * 72.0 / 2540.0;
  double v4 = (double)[(PKPaper *)self topMargin] * 72.0 / 2540.0;
  int v5 = [(PKPaper *)self width];
  int v6 = [(PKPaper *)self leftMargin];
  double v7 = (double)(v5 - (v6 + [(PKPaper *)self rightMargin])) * 72.0 / 2540.0;
  int v8 = [(PKPaper *)self height];
  int v9 = [(PKPaper *)self topMargin];
  double v10 = (double)(v8 - (v9 + [(PKPaper *)self bottomMargin])) * 72.0 / 2540.0;
  double v11 = v3;
  double v12 = v4;
  double v13 = v7;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)imageableArea
{
  int v3 = [(PKPaper *)self width];
  int v4 = [(PKPaper *)self leftMargin];
  double v5 = (double)(v3 - (v4 + [(PKPaper *)self rightMargin])) * 72.0 / 2540.0;
  int v6 = [(PKPaper *)self height];
  int v7 = [(PKPaper *)self topMargin];
  return v5 * ((double)(v6 - (v7 + [(PKPaper *)self bottomMargin])) * 72.0 / 2540.0);
}

- (BOOL)isBorderless
{
  return ![(PKPaper *)self leftMargin]
      && ![(PKPaper *)self rightMargin]
      && ![(PKPaper *)self topMargin]
      && [(PKPaper *)self bottomMargin] == 0;
}

- (id)nameWithoutSuffixes:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaper *)self name];
  id v6 = v4;
  int v7 = v6;
  double v13 = (id *)&v15;
  if (v6)
  {
    int v8 = v6;
    while (![v5 hasSuffix:v8])
    {
      int v9 = v13++;
      id v10 = *v9;

      int v8 = v10;
      if (!v10) {
        goto LABEL_7;
      }
    }
    double v11 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v8, "length"));
  }
  else
  {
    int v8 = 0;
LABEL_7:
    double v11 = v5;
  }

  return v11;
}

- (id)baseName
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_cachedBaseName)
  {
    uint64_t v3 = [(PKPaper *)v2 nameWithoutSuffixes:@"-fullbleed", @"-simplex", @"-transverse", 0];
    cachedBaseName = v2->_cachedBaseName;
    v2->_cachedBaseName = (NSString *)v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_cachedBaseName;

  return v5;
}

- (int)minHeight
{
  double v3 = (double)[(PKPaper *)self height];
  id v4 = [(PKPaper *)self mediaInfo];

  if (v4)
  {
    id v5 = [(PKPaper *)self mediaInfo];
    id v6 = [v5 objectForKey:@"media-size"];

    int v7 = [v6 objectForKey:@"y-dimension"];
    int v8 = [v7 objectAtIndexedSubscript:0];
    int v9 = v8;
    if (v8) {
      double v3 = (double)(int)[v8 intValue];
    }
  }
  return (int)v3;
}

- (int)maxHeight
{
  double v3 = (double)[(PKPaper *)self height];
  id v4 = [(PKPaper *)self mediaInfo];

  if (v4)
  {
    id v5 = [(PKPaper *)self mediaInfo];
    id v6 = [v5 objectForKey:@"media-size"];

    int v7 = [v6 objectForKey:@"y-dimension"];
    int v8 = [v7 objectAtIndexedSubscript:1];
    int v9 = v8;
    if (v8) {
      double v3 = (double)(int)[v8 intValue];
    }
  }
  return (int)v3;
}

- (BOOL)isRoll
{
  v2 = [(PKPaper *)self mediaInfo];
  double v3 = [v2 objectForKeyedSubscript:@"media-size"];
  id v4 = [v3 objectForKeyedSubscript:@"y-dimension"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)mediaType
{
  v2 = [(PKPaper *)self mediaInfo];
  double v3 = [v2 objectForKeyedSubscript:@"media-type"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_26E251B90;
  }
  id v5 = v4;

  return v5;
}

- (NSString)mediaTypeName
{
  double v3 = [(PKPaper *)self mediaInfo];
  id v4 = [v3 objectForKeyedSubscript:@"media-type"];

  if (v4)
  {
    id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
    id v6 = [v5 localizedStringForKey:v4 value:v4 table:@"MediaTypeNames"];

    if (v6 && ![(__CFString *)v6 isEqualToString:v4])
    {
LABEL_7:
      if (![(__CFString *)v6 isEqualToString:v4]) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
  }
  int v7 = [(PKPaper *)self mediaInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"_vendor_media-type"];

  id v6 = (__CFString *)v8;
  if (v8) {
    goto LABEL_7;
  }
LABEL_8:

  id v6 = &stru_26E251B90;
LABEL_9:

  return (NSString *)v6;
}

- (void)addToMediaCol:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaper *)self mediaInfo];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__PKPaper_addToMediaCol___block_invoke;
  v7[3] = &unk_2649EE4B0;
  id v6 = v4;
  id v8 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __25__PKPaper_addToMediaCol___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

- (id)createMediaColAndDoMargins:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_new();
  id v6 = +[PKMediaSize mediaSizeWithWidth:[(PKPaper *)self width] height:[(PKPaper *)self height]];
  [v5 setMediaSize:v6];

  int v7 = [(PKPaper *)self mediaInfo];

  if (v7)
  {
    [(PKPaper *)self addToMediaCol:v5];
  }
  else if (v3)
  {
    objc_msgSend(v5, "setMarginsTop:left:bottom:right:", -[PKPaper topMargin](self, "topMargin"), -[PKPaper leftMargin](self, "leftMargin"), -[PKPaper bottomMargin](self, "bottomMargin"), -[PKPaper rightMargin](self, "rightMargin"));
  }

  return v5;
}

- (id)localizedNameFromDimensions
{
  BOOL v3 = [(PKPaper *)self baseName];
  id v4 = +[PKMediaName pkMediaNameWithString:v3];

  id v5 = [v4 unitStr];
  char v6 = [v5 isEqualToString:@"in"];

  if (v6)
  {
    BOOL v7 = 0;
    id v8 = @"%@ x %@ inches";
    double v9 = 2540.0;
  }
  else
  {
    id v10 = [v4 unitStr];
    int v11 = [v10 isEqualToString:@"mm"];

    BOOL v12 = v11 == 0;
    if (v11) {
      double v9 = 100.0;
    }
    else {
      double v9 = 1.0;
    }
    BOOL v7 = v11 == 0;
    if (v12) {
      id v8 = 0;
    }
    else {
      id v8 = @"%@ x %@ mm";
    }
  }
  if ([(PKPaper *)self isRoll])
  {
    double v13 = (double)[(PKPaper *)self width] / v9;
    double v14 = (double)[(PKPaper *)self height] / v9;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    [v4 widthInUnits];
    double v13 = v24;
    [v4 heightInUnits];
    double v14 = v25;
    if (!v7)
    {
LABEL_11:
      uint64_t v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
      uint64_t v16 = [v15 localizedStringForKey:v8 value:v8 table:@"PaperNames"];
      uint64_t v17 = [NSNumber numberWithDouble:v13];
      id v18 = [NSNumber numberWithDouble:v14];
      id v19 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v19 setMaximumFractionDigits:1];
      uint64_t v20 = [v19 stringFromNumber:v17];
      v21 = [v19 stringFromNumber:v18];
      uint64_t v22 = [NSString stringWithValidatedFormat:v16, @"%@ %@", 0, v20, v21 validFormatSpecifiers error];

      int v23 = v16;
      if (v22) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  int v23 = 0;
LABEL_15:
  uint64_t v22 = [(PKPaper *)self baseName];
  uint64_t v16 = v23;
LABEL_16:

  return v22;
}

- (BOOL)isEqualSizeAndMediaType:(id)a3
{
  id v4 = a3;
  if (v4
    && (int v5 = -[PKPaper height](self, "height"), v5 == [v4 height])
    && (int v6 = -[PKPaper width](self, "width"), v6 == [v4 width]))
  {
    BOOL v7 = [(PKPaper *)self mediaType];
    id v8 = [v4 mediaType];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualSize:(id)a3
{
  id v4 = a3;
  if (v4 && (int v5 = -[PKPaper height](self, "height"), v5 == [v4 height]))
  {
    int v6 = [(PKPaper *)self width];
    BOOL v7 = v6 == [v4 width];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)sizeAndImageableCompare:(id)a3
{
  id v4 = a3;
  int v5 = [(PKPaper *)self width];
  int v6 = [v4 width];
  int v7 = v5 - v6;
  if (v5 == v6)
  {
    int v8 = [(PKPaper *)self height];
    int v9 = [v4 height];
    int v7 = v8 - v9;
    if (v8 == v9)
    {
      [(PKPaper *)self imageableArea];
      double v11 = v10;
      [v4 imageableArea];
      int v7 = (int)(v11 - v12);
    }
  }
  BOOL v13 = v7 < 0;
  BOOL v14 = v7 != 0;
  if (v13) {
    int64_t v15 = -1;
  }
  else {
    int64_t v15 = v14;
  }

  return v15;
}

- (int64_t)sizeMediaTypeAndImageableCompare:(id)a3
{
  id v4 = a3;
  int v5 = [(PKPaper *)self width];
  int v6 = [v4 width];
  int v7 = v5 - v6;
  if (v5 == v6)
  {
    int v8 = [(PKPaper *)self height];
    int v9 = [v4 height];
    int v7 = v8 - v9;
    if (v8 == v9)
    {
      double v10 = [(PKPaper *)self mediaType];
      double v11 = [v4 mediaType];
      int v7 = [v10 compare:v11];

      if (!v7)
      {
        [(PKPaper *)self imageableArea];
        double v13 = v12;
        [v4 imageableArea];
        int v7 = (int)(v13 - v14);
      }
    }
  }
  if (v7 < 0) {
    int64_t v15 = -1;
  }
  else {
    int64_t v15 = v7 != 0;
  }

  return v15;
}

- (NSString)localizedName
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.PrintKit"];
  id v4 = [(PKPaper *)self baseName];
  int v5 = [v3 localizedStringForKey:v4 value:@"." table:@"PaperNames"];

  if ([v5 isEqualToString:@"."])
  {
    uint64_t v6 = [(PKPaper *)self localizedNameFromDimensions];

    int v5 = (void *)v6;
  }

  return (NSString *)v5;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKPaper;
  id v4 = [(PKPaper *)&v8 description];
  int v5 = [(PKPaper *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"%@ { %@ }", v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  [(PKPaper *)self imageableAreaRect];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  double v11 = NSString;
  double v12 = [(PKPaper *)self name];
  int v13 = [(PKPaper *)self width];
  int v14 = [(PKPaper *)self height];
  int64_t v15 = [(PKPaper *)self mediaType];
  uint64_t v16 = [v11 stringWithFormat:@"%@ width = %.2f height = %.2f imageableAreaRect origin = (%.2f, %.2f), size = (%.2f, %.2f) media-type=%@", v12, (double)v13 * 72.0 / 2540.0, (double)v14 * 72.0 / 2540.0, v4, v6, v8, v10, v15];

  return (NSString *)v16;
}

+ (id)genericA4Paper
{
  return genericSize(&cfstr_IsoA4210x297mm.isa, 21000, 29700, 1411);
}

+ (id)genericLetterPaper
{
  return genericSize(&cfstr_NaLetter85x11i.isa, 21590, 27940, 1411);
}

+ (id)genericLegalPaper
{
  return genericSize(&cfstr_NaLegal85x14in.isa, 21590, 35560, 1411);
}

+ (id)generic3_5x5Paper
{
  v2 = [[PKPaper alloc] initWithWidth:8890 Height:12700 Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:@"oe_photo-l_3.5x5in" mediaInfo:0];

  return v2;
}

+ (id)generic4x6Paper
{
  v2 = [[PKPaper alloc] initWithWidth:10160 Height:15240 Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:@"na_index-4x6_4x6in" mediaInfo:0];

  return v2;
}

+ (id)genericA6Paper
{
  v2 = [[PKPaper alloc] initWithWidth:10500 Height:14800 Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:@"iso_a6_105x148mm" mediaInfo:0];

  return v2;
}

+ (id)genericHagakiPaper
{
  v2 = [[PKPaper alloc] initWithWidth:10000 Height:14800 Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:@"jpn_hagaki_100x148mm" mediaInfo:0];

  return v2;
}

+ (id)genericPRC32KPaper
{
  v2 = [[PKPaper alloc] initWithWidth:9700 Height:15100 Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:@"prc_32k_97x151mm" mediaInfo:0];

  return v2;
}

+ (id)genericWithName:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSString *)a3;
  uint64_t v4 = v3;
  if (v3 && (uint64_t v5 = pwgMediaForPWG(v3, v12)) != 0)
  {
    uint64_t v6 = *((unsigned int *)v5 + 6);
    uint64_t v7 = *((unsigned int *)v5 + 7);
    if ((int)v6 <= 20319 || (int)v7 <= 20319) {
      uint64_t v9 = 635;
    }
    else {
      uint64_t v9 = 1411;
    }
    uint64_t v10 = genericSize(v4, v6, v7, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)genericBorderlessWithName:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (PKPaper *)pwgMediaForPWG(v3, v7);
    if (v5) {
      uint64_t v5 = [[PKPaper alloc] initWithWidth:v5->_width Height:v5->_height Left:0 Top:0 Right:0 Bottom:0 localizedName:0 codeName:v4 mediaInfo:0];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)willAdjustMarginsForDuplexMode:(id)a3
{
  return [a3 isEqualToString:@"one-sided"] ^ 1;
}

- (PKPaper)paperWithMarginsAdjustedForDuplexMode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if (([v4 isEqualToString:@"one-sided"] & 1) == 0)
  {
    uint64_t v6 = [(PKPaper *)v5 topMargin];
    uint64_t v7 = [(PKPaper *)v5 bottomMargin];
    int v8 = [(PKPaper *)v5 leftMargin];
    if (v8 <= [(PKPaper *)v5 rightMargin]) {
      uint64_t v9 = [(PKPaper *)v5 rightMargin];
    }
    else {
      uint64_t v9 = [(PKPaper *)v5 leftMargin];
    }
    uint64_t v10 = v9;
    if ([v4 isEqualToString:@"two-sided-short-edge"])
    {
      int v11 = [(PKPaper *)v5 topMargin];
      if (v11 <= [(PKPaper *)v5 bottomMargin]) {
        uint64_t v12 = [(PKPaper *)v5 bottomMargin];
      }
      else {
        uint64_t v12 = [(PKPaper *)v5 topMargin];
      }
      uint64_t v6 = v12;
      uint64_t v7 = v12;
    }
    uint64_t v13 = [PKPaper alloc];
    uint64_t v14 = [(PKPaper *)v5 width];
    uint64_t v15 = [(PKPaper *)v5 height];
    uint64_t v16 = [(PKPaper *)v5 localizedName];
    uint64_t v17 = [(PKPaper *)v5 name];
    uint64_t v18 = [(PKPaper *)v13 initWithWidth:v14 Height:v15 Left:v10 Top:v6 Right:v10 Bottom:v7 localizedName:v16 codeName:v17 mediaInfo:0];

    uint64_t v5 = (PKPaper *)v18;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaper *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [(PKPaper *)self name];
    uint64_t v7 = [(PKPaper *)v5 name];
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
  v2 = [(PKPaper *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (id)photoPapers
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  unint64_t v3 = +[PKPaper genericA6Paper];
  id v4 = +[PKPaper generic4x6Paper];
  uint64_t v5 = +[PKPaper generic3_5x5Paper];
  uint64_t v6 = +[PKPaper genericPRC32KPaper];
  uint64_t v7 = +[PKPaper genericHagakiPaper];
  char v8 = +[PKPaper genericBorderlessWithName:@"na_5x7_5x7in"];
  uint64_t v9 = +[PKPaper genericBorderlessWithName:@"na_govt-letter_8x10in"];
  uint64_t v10 = +[PKPaper genericBorderlessWithName:@"om_small-photo_100x150mm"];
  int v11 = +[PKPaper genericBorderlessWithName:@"om_large-photo_200x300"];
  uint64_t v12 = objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  return v12;
}

+ (id)documentPapers
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  unint64_t v3 = +[PKPaper genericA4Paper];
  id v4 = +[PKPaper genericLetterPaper];
  uint64_t v5 = objc_msgSend(v2, "arrayWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)mediaNameForWidth:(int)a3 height:(int)a4 borderless:(BOOL)a5 simplex:(BOOL)a6
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a4)
  {
    BOOL v7 = a6;
    BOOL v8 = a5;
    uint64_t v9 = *(void *)&a4;
    uint64_t v10 = pwgMediaForSize(*(const char **)&a3, *(uint64_t *)&a4, v14);
    int v11 = "";
    if (v7) {
      int v11 = "-simplex";
    }
    if (v8) {
      int v11 = "-fullbleed";
    }
    if (v10 && *(void *)v10)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s%s", *(void *)v10, v11);
    }
    else
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"media-%dx%d%s", v6, v9, v11);
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"roll-%dx0", *(void *)&a4, a5, a6, *(void *)&a3);
  }

  return v12;
}

- (NSDictionary)mediaInfo
{
  return self->_mediaInfo;
}

- (id)name
{
  return self->_name;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)leftMargin
{
  return self->_leftMargin;
}

- (int)topMargin
{
  return self->_topMargin;
}

- (int)rightMargin
{
  return self->_rightMargin;
}

- (int)bottomMargin
{
  return self->_bottomMargin;
}

- (PKPaper)initWithCoder:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaper;
  uint64_t v5 = [(PKPaper *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_width = [v4 decodeIntegerForKey:@"_width"];
    v5->_height = [v4 decodeIntegerForKey:@"_height"];
    v5->_leftMargin = [v4 decodeIntegerForKey:@"_leftMargin"];
    v5->_topMargin = [v4 decodeIntegerForKey:@"_topMargin"];
    v5->_rightMargin = [v4 decodeIntegerForKey:@"_rightMargin"];
    v5->_bottomMargin = [v4 decodeIntegerForKey:@"_bottomMargin"];
    BOOL v8 = (void *)MEMORY[0x263EFFA08];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    uint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_mediaInfo"];
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"_name"];
  [v4 encodeInteger:self->_width forKey:@"_width"];
  [v4 encodeInteger:self->_height forKey:@"_height"];
  [v4 encodeInteger:self->_leftMargin forKey:@"_leftMargin"];
  [v4 encodeInteger:self->_topMargin forKey:@"_topMargin"];
  [v4 encodeInteger:self->_rightMargin forKey:@"_rightMargin"];
  [v4 encodeInteger:self->_bottomMargin forKey:@"_bottomMargin"];
  [v4 encodeObject:self->_mediaInfo forKey:@"_mediaInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userCodableDictionary
{
  unint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__PKPaper_userCodableDictionary__block_invoke;
  v6[3] = &unk_2649EE4D8;
  id v4 = v3;
  id v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __32__PKPaper_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (*a5)
  {
    uint64_t v10 = (*((void (**)(id))v8 + 2))(v8);
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v11];
  }
}

- (PKPaper)initWithUserCodableDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaper;
  uint64_t v5 = [(PKPaper *)&v9 init];
  if (v5)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__PKPaper_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_2649EE4D8;
    id v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);
  }
  return v5;
}

void __41__PKPaper_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  id v12 = a2;
  id v8 = a4;
  objc_super v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
  if (v9)
  {
    uint64_t v10 = v8[2](v8, v9);
    id v11 = *a5;
    *a5 = (void *)v10;
  }
}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, __CFString *, NSString **))a3->var0 + 7))(a3, @"name", &self->_name);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"width", &self->_width);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"height", &self->_height);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"leftMargin", &self->_leftMargin);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"topMargin", &self->_topMargin);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"rightMargin", &self->_rightMargin);
  (*((void (**)(Visitor *, __CFString *, int *))a3->var0 + 4))(a3, @"bottomMargin", &self->_bottomMargin);
  id v24 = (id)objc_opt_new();
  id v23 = (id)objc_opt_new();
  uint64_t v5 = [(PKPaper *)self mediaInfo];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __27__PKPaper_visitProperties___block_invoke;
  v20[3] = &unk_2649EE500;
  id v21 = v24;
  id v22 = v23;
  [v5 enumerateKeysAndObjectsUsingBlock:v20];

  (*((void (**)(Visitor *, __CFString *, id *))a3->var0 + 12))(a3, @"_strMediaInfo", &v24);
  (*((void (**)(Visitor *, __CFString *, id *))a3->var0 + 18))(a3, @"_numMediaInfo", &v23);
  mediaInfo = self->_mediaInfo;
  p_mediaInfo = &self->_mediaInfo;
  id v8 = (void *)[(NSDictionary *)mediaInfo mutableCopy];
  id v9 = v24;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __27__PKPaper_visitProperties___block_invoke_197;
  v18[3] = &unk_2649EE528;
  id v10 = v8;
  id v19 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v18];
  id v11 = objc_opt_new();
  id v12 = v23;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __27__PKPaper_visitProperties___block_invoke_2;
  v15[3] = &unk_2649EE550;
  id v13 = v10;
  id v16 = v13;
  id v14 = v11;
  id v17 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v15];
  if ([v14 count] == 2) {
    [v13 setObject:v14 forKeyedSubscript:@"media-size"];
  }
  objc_storeStrong((id *)p_mediaInfo, v8);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

void __27__PKPaper_visitProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id *)(a1 + 32);
LABEL_5:
    [*v7 setObject:v6 forKeyedSubscript:v5];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id *)(a1 + 40);
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"media-size"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v6;
    id v9 = [v8 objectForKeyedSubscript:@"x-dimension"];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"media-size:x-dimension"];

    id v10 = [v8 objectForKeyedSubscript:@"y-dimension"];
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"media-size:y-dimension"];
  }
  else
  {
    id v11 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_22EA54000, v11, OS_LOG_TYPE_DEFAULT, "Unknown mediaInfo type for %@", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_6:
}

uint64_t __27__PKPaper_visitProperties___block_invoke_197(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __27__PKPaper_visitProperties___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 hasPrefix:@"media-size:"])
  {
    id v6 = [v7 substringFromIndex:objc_msgSend(@"media-size:", "length")];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_cachedBaseName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end