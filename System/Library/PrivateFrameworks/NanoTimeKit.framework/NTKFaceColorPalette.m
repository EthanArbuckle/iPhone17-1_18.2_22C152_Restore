@interface NTKFaceColorPalette
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (id)colorWithName:(id)a3 inDomain:(id)a4;
- (BOOL)hasPrimaryColorRange;
- (BOOL)isBlackColor;
- (BOOL)isCompositePalette;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEvergreenCollection;
- (BOOL)isMulticolor;
- (BOOL)isNotFoundColor:(id)a3;
- (BOOL)isRainbowColor;
- (BOOL)isSeasonalCollection;
- (BOOL)isSiriColor;
- (BOOL)isTritium;
- (BOOL)isUnityColor;
- (BOOL)isVictory;
- (BOOL)isWhite;
- (BOOL)isWhiteColor;
- (BOOL)isZeus;
- (NSBundle)domainBundle;
- (NSCache)colorCache;
- (NSCache)swatchImageCache;
- (NSMutableArray)bundleList;
- (NSString)description;
- (NSString)faceSpecificNamespace;
- (NTKFaceColorPalette)init;
- (NTKFaceColorPalette)initWithDomainName:(id)a3 inBundle:(id)a4;
- (NTKFaceColorPalette)initWithFaceClass:(Class)a3;
- (NTKFaceColorPalette)tritiumPalette;
- (NTKFaceColorPaletteConfiguration)configuration;
- (NTKInterpolatedColorPalette)interpolatedTritiumPalette;
- (NTKPigmentEditOption)pigmentEditOption;
- (UIColor)swatch;
- (id)_loadColorFromAssetCatalogForKey:(id)a3 namespace:(id)a4 collectionName:(id)a5 bundle:(id)a6 colorFraction:(double)a7 ignoringOptionAndCollection:(BOOL)a8 inspector:(id)a9;
- (id)_notFoundColor;
- (id)_primaryShiftedColor;
- (id)_secondaryColor;
- (id)_secondaryShiftedColor;
- (id)_unityMiddleColor;
- (id)_unitySwatchImageForSize:(CGSize)a3;
- (id)_unitySwatchImageForSize:(CGSize)a3 redColor:(id)a4 blackColor:(id)a5 greenColor:(id)a6;
- (id)copyWithOption:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entryNameForKey:(id)a3;
- (id)identifier;
- (id)multitoneColorNames;
- (id)paletteAtIndex:(unint64_t)a3;
- (id)primaryColorWithFraction:(double)a3;
- (id)swatchImageForSize:(CGSize)a3;
- (id)swatchPrimaryColor;
- (id)tritiumPaletteWithProgress:(double)a3;
- (id)valueForKey:(id)a3;
- (void)colorBundleContentChanged;
- (void)configurationDidChange:(id)a3;
- (void)executeWithOption:(id)a3 block:(id)a4;
- (void)resetColorCache;
- (void)setBundleList:(id)a3;
- (void)setColorCache:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDomainBundle:(id)a3;
- (void)setFaceSpecificNamespace:(id)a3;
- (void)setIdentifier:(void *)a1;
- (void)setInterpolatedTritiumPalette:(id)a3;
- (void)setPigmentEditOption:(id)a3;
- (void)setSwatchImageCache:(id)a3;
- (void)setTritium:(uint64_t)a1;
- (void)setTritiumPalette:(id)a3;
@end

@implementation NTKFaceColorPalette

- (BOOL)isSiriColor
{
  v2 = [(NTKFaceColorPalette *)self configuration];
  v3 = [v2 colorOption];
  char v4 = [v3 isEqualToString:@"siri"];

  return v4;
}

- (BOOL)isWhite
{
  v2 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 identifier];
  char v4 = [v3 isEqual:@"seasons.spring2015.white"];

  return v4;
}

- (BOOL)isZeus
{
  v2 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 identifier];
  char v4 = [v3 isEqual:@"zeus.orange"];

  return v4;
}

- (BOOL)isVictory
{
  v2 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 identifier];
  char v4 = [v3 isEqual:@"victory.volt"];

  return v4;
}

- (NTKFaceColorPalette)init
{
  return [(NTKFaceColorPalette *)self initWithDomainName:0 inBundle:0];
}

- (NTKFaceColorPalette)initWithFaceClass:(Class)a3
{
  v5 = [(objc_class *)a3 pigmentFaceDomain];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:a3];
  v7 = [(NTKFaceColorPalette *)self initWithDomainName:v5 inBundle:v6];

  return v7;
}

- (NTKFaceColorPalette)initWithDomainName:(id)a3 inBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKFaceColorPalette;
  v9 = [(NTKFaceColorPalette *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceSpecificNamespace, a3);
    objc_storeStrong((id *)&v10->_domainBundle, a4);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    colorCache = v10->_colorCache;
    v10->_colorCache = v11;

    v13 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    swatchImageCache = v10->_swatchImageCache;
    v10->_swatchImageCache = v13;

    if (initWithDomainName_inBundle__onceToken != -1) {
      dispatch_once(&initWithDomainName_inBundle__onceToken, &__block_literal_global_169);
    }
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel_colorBundleContentChanged name:@"NTKColorBundleContentChangedNotificationName" object:0];
  }
  return v10;
}

void __51__NTKFaceColorPalette_initWithDomainName_inBundle___block_invoke()
{
  uint64_t v0 = NSStringFromSelector(sel_primaryColor);
  v1 = (void *)kPrimaryColorSelectorName;
  kPrimaryColorSelectorName = v0;

  uint64_t v2 = NSStringFromSelector(sel_primaryShiftedColor);
  v3 = (void *)kPrimaryShiftedColorSelectorName;
  kPrimaryShiftedColorSelectorName = v2;

  uint64_t v4 = NSStringFromSelector(sel_secondaryColor);
  v5 = (void *)kSecondaryColorSelectorName;
  kSecondaryColorSelectorName = v4;

  uint64_t v6 = NSStringFromSelector(sel_secondaryShiftedColor);
  id v7 = (void *)kSecondaryShiftedColorSelectorName;
  kSecondaryShiftedColorSelectorName = v6;
}

- (void)setTritium:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 8) != a2)
    {
      *(unsigned char *)(a1 + 8) = a2;
      uint64_t v2 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = 0;
    }
  }
}

- (NSMutableArray)bundleList
{
  bundleList = self->_bundleList;
  if (!bundleList)
  {
    uint64_t v4 = self->_domainBundle;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
    id v7 = self->_bundleList;
    self->_bundleList = v6;

    if (v4)
    {
      id v8 = [(NSBundle *)v4 bundlePath];
      v9 = [v5 bundlePath];
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0) {
        [(NSMutableArray *)self->_bundleList addObject:v4];
      }
    }
    v11 = +[NTKColorBundleLoader sharedInstance];
    v12 = [v11 loadColorBundles];

    if (v12) {
      [(NSMutableArray *)self->_bundleList addObjectsFromArray:v12];
    }

    bundleList = self->_bundleList;
  }
  return bundleList;
}

- (void)colorBundleContentChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NTKFaceColorPalette_colorBundleContentChanged__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__NTKFaceColorPalette_colorBundleContentChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 resetColorCache];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = [(NTKFaceColorPalette *)self configuration];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setConfiguration:v6];

  objc_storeStrong(v4 + 7, self->_domainBundle);
  objc_storeStrong(v4 + 4, self->_faceSpecificNamespace);
  id v7 = [(NTKFaceColorPalette *)self colorCache];
  [v4 setColorCache:v7];

  id v8 = [(NTKFaceColorPalette *)self swatchImageCache];
  [v4 setSwatchImageCache:v8];

  v9 = [(NTKFaceColorPalette *)self configuration];
  char v10 = (void *)[v9 copy];
  [v4 setConfiguration:v10];

  int tritium = self->_tritium;
  if (*((unsigned __int8 *)v4 + 8) != tritium)
  {
    *((unsigned char *)v4 + 8) = tritium;
    id v12 = v4[9];
    v4[9] = 0;
  }
  return v4;
}

- (id)copyWithOption:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(NTKFaceColorPalette *)self copy];
  [v5 setPigmentEditOption:v4];

  return v5;
}

- (NTKFaceColorPalette)tritiumPalette
{
  tritiumPalette = self->_tritiumPalette;
  if (!tritiumPalette)
  {
    id v4 = (NTKFaceColorPalette *)[(NTKFaceColorPalette *)self copy];
    v5 = self->_tritiumPalette;
    self->_tritiumPalette = v4;

    tritiumPalette = self->_tritiumPalette;
    if (tritiumPalette)
    {
      if (!tritiumPalette->_tritium)
      {
        tritiumPalette->_int tritium = 1;
        identifier = tritiumPalette->_identifier;
        tritiumPalette->_identifier = 0;

        tritiumPalette = self->_tritiumPalette;
      }
    }
  }
  return tritiumPalette;
}

- (id)tritiumPaletteWithProgress:(double)a3
{
  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (!interpolatedTritiumPalette)
  {
    uint64_t v6 = [NTKInterpolatedColorPalette alloc];
    id v7 = [(NTKFaceColorPalette *)self tritiumPalette];
    id v8 = [(NTKInterpolatedColorPalette *)v6 initWithFromPalette:self toPalette:v7];
    v9 = self->_interpolatedTritiumPalette;
    self->_interpolatedTritiumPalette = v8;

    interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  }
  char v10 = [(NTKInterpolatedColorPalette *)interpolatedTritiumPalette fromPalette];
  v11 = [v10 identifier];
  id v12 = [(NTKFaceColorPalette *)self identifier];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    [(NTKInterpolatedColorPalette *)self->_interpolatedTritiumPalette setFromPalette:self];
    v14 = [(NTKFaceColorPalette *)self tritiumPalette];
    [(NTKInterpolatedColorPalette *)self->_interpolatedTritiumPalette setToPalette:v14];
  }
  [(NTKInterpolatedColorPalette *)self->_interpolatedTritiumPalette setTransitionFraction:a3];
  v15 = self->_interpolatedTritiumPalette;
  return v15;
}

- (void)executeWithOption:(id)a3 block:(id)a4
{
  if (a4)
  {
    uint64_t v6 = (void (**)(id, NTKFaceColorPalette *))a4;
    id v7 = a3;
    id v8 = [(NTKFaceColorPalette *)self configuration];
    id v9 = (id)[v8 copy];

    [(NTKFaceColorPalette *)self setPigmentEditOption:v7];
    v6[2](v6, self);

    [(NTKFaceColorPalette *)self setConfiguration:v9];
  }
}

- (void)configurationDidChange:(id)a3
{
  id v9 = a3;
  identifier = self->_identifier;
  self->_identifier = 0;

  tritiumPalette = self->_tritiumPalette;
  self->_tritiumPalette = 0;

  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (interpolatedTritiumPalette)
  {
    id v7 = [(NTKInterpolatedColorPalette *)interpolatedTritiumPalette fromPalette];
    [v7 configurationDidChange:v9];

    id v8 = [(NTKInterpolatedColorPalette *)self->_interpolatedTritiumPalette toPalette];
    [v8 configurationDidChange:v9];
  }
}

+ (id)colorWithName:(id)a3 inDomain:(id)a4
{
  id v4 = [NSString stringWithFormat:@"%@/%@", a4, a3];
  v5 = (void *)MEMORY[0x1E4FB1618];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v5 colorNamed:v4 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

- (void)setPigmentEditOption:(id)a3
{
  id v4 = a3;
  v5 = [(NTKFaceColorPalette *)self configuration];

  if (v5)
  {
    uint64_t v6 = [(NTKFaceColorPalette *)self configuration];
    [(NTKFaceColorPaletteConfiguration *)v6 setPigmentEditOption:v4];
  }
  else
  {
    uint64_t v6 = [[NTKFaceColorPaletteConfiguration alloc] initWithPigmentEditOption:v4];

    [(NTKFaceColorPalette *)self setConfiguration:v6];
  }
}

- (NTKPigmentEditOption)pigmentEditOption
{
  uint64_t v2 = [(NTKFaceColorPalette *)self configuration];
  v3 = [v2 pigmentEditOption];

  return (NTKPigmentEditOption *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  [(NTKFaceColorPaletteConfiguration *)self->_configuration setDelegate:self];
  interpolatedTritiumPalette = self->_interpolatedTritiumPalette;
  if (interpolatedTritiumPalette)
  {
    uint64_t v6 = [(NTKInterpolatedColorPalette *)interpolatedTritiumPalette fromPalette];
    objc_storeStrong(v6 + 2, a3);

    id v7 = [(NTKInterpolatedColorPalette *)self->_interpolatedTritiumPalette toPalette];
    objc_storeStrong(v7 + 2, a3);
  }
  [(NTKFaceColorPalette *)self configurationDidChange:v8];
}

- (void)resetColorCache
{
  [(NSCache *)self->_colorCache removeAllObjects];
  swatchImageCache = self->_swatchImageCache;
  [(NSCache *)swatchImageCache removeAllObjects];
}

- (BOOL)isEvergreenCollection
{
  uint64_t v2 = [(NTKFaceColorPalette *)self configuration];
  v3 = [v2 collectionName];
  char v4 = [v3 hasPrefix:@"evergreen"];

  return v4;
}

- (BOOL)isSeasonalCollection
{
  uint64_t v2 = [(NTKFaceColorPalette *)self configuration];
  v3 = [v2 collectionName];
  char v4 = [v3 hasPrefix:@"seasons"];

  return v4;
}

- (BOOL)isNotFoundColor:(id)a3
{
  return !a3 || NTKFaceColorPaletteNotFoundColor == (void)a3;
}

- (BOOL)isMulticolor
{
  uint64_t v2 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 identifier];
  char v4 = [v3 isEqual:@"special.multicolor"];

  return v4;
}

- (BOOL)isRainbowColor
{
  uint64_t v2 = [(NTKFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 identifier];
  char v4 = [v3 isEqual:@"special.rainbow"];

  return v4;
}

- (BOOL)isWhiteColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  uint64_t v2 = [(NTKFaceColorPalette *)self primaryColor];
  [v2 getRed:&v7 green:&v6 blue:&v5 alpha:0];

  return v7 == 1.0 && v6 == 1.0 && v5 == 1.0;
}

- (BOOL)isBlackColor
{
  if ([(NTKFaceColorPalette *)self isEvergreenCollection])
  {
    v3 = [(NTKFaceColorPalette *)self pigmentEditOption];
    char v4 = [v3 identifier];
    char v5 = [v4 isEqual:@"evergreen.black"];
  }
  else
  {
    v3 = [(NTKFaceColorPalette *)self primaryColor];
    char v5 = CLKIsBlackColor();
  }

  return v5;
}

- (BOOL)isUnityColor
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
    char v4 = [v3 configuration];
    char v5 = [v4 collectionName];
    if ([v5 isEqualToString:@"unity"])
    {
      double v6 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
      double v7 = [v6 configuration];
      id v8 = [v7 collectionName];
      char v9 = [v8 isEqualToString:@"unity"];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    v3 = [(NTKFaceColorPalette *)self configuration];
    char v4 = [v3 collectionName];
    char v9 = [v4 isEqualToString:@"unity"];
  }

  return v9;
}

- (BOOL)hasPrimaryColorRange
{
  v3 = [(NTKFaceColorPalette *)self primaryColorWithFraction:0.0];
  if (v3 == (void *)NTKFaceColorPaletteNotFoundColor)
  {
    BOOL v5 = 0;
  }
  else
  {
    char v4 = [(NTKFaceColorPalette *)self primaryColorWithFraction:1.0];
    BOOL v5 = v4 != (void *)NTKFaceColorPaletteNotFoundColor;
  }
  return v5;
}

- (id)primaryColorWithFraction:(double)a3
{
  BOOL v5 = [(NTKFaceColorPalette *)self configuration];
  [v5 colorFraction];
  double v7 = v6;

  id v8 = [(NTKFaceColorPalette *)self configuration];
  [v8 setColorFraction:a3];

  char v9 = [(NTKFaceColorPalette *)self valueForKey:kPrimaryColorSelectorName];
  char v10 = [(NTKFaceColorPalette *)self configuration];
  [v10 setColorFraction:v7];

  return v9;
}

- (BOOL)isCompositePalette
{
  uint64_t v2 = [(NTKFaceColorPalette *)self multitoneColorNames];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)paletteAtIndex:(unint64_t)a3
{
  if ([(NTKFaceColorPalette *)self isCompositePalette])
  {
    BOOL v5 = [(NTKFaceColorPalette *)self multitoneColorNames];
    if ([v5 count] > a3)
    {
      double v6 = [(NTKFaceColorPalette *)self configuration];
      double v7 = [v6 colorOption];
      id v8 = [(NTKFaceColorPalette *)self configuration];
      char v9 = [v8 collectionName];
      char v10 = +[NTKPigmentEditOption multitonePigmentAtIndex:a3 forColorName:v7 groupName:v9];

      v11 = [(NTKFaceColorPalette *)self copyWithOption:v10];
      [(NTKFaceColorPalette *)v11 setColorCache:0];

      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    v11 = self;
    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:
  return v11;
}

- (id)multitoneColorNames
{
  uint64_t v2 = [(NTKFaceColorPalette *)self configuration];
  BOOL v3 = [v2 colorOption];
  char v4 = +[NTKPigmentEditOption multitoneColorNames:v3];

  return v4;
}

- (id)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    char v4 = NSString;
    BOOL v5 = [(NTKFaceColorPaletteConfiguration *)self->_configuration uniqueId];
    double v6 = [v4 stringWithFormat:@"%@-%lu", v5, -[NTKFaceColorPalette isTritium](self, "isTritium")];
    double v7 = self->_identifier;
    self->_identifier = v6;

    identifier = self->_identifier;
  }
  return identifier;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"tritium_"])
  {
    BOOL v5 = 0;
  }
  else
  {
    double v6 = NSString;
    double v7 = [(NTKFaceColorPalette *)self identifier];
    id v8 = [v6 stringWithFormat:@"%@-%@", v7, v4];

    uint64_t v9 = [(NSCache *)self->_colorCache objectForKey:v8];
    if (v9)
    {
      id v10 = (id)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [(NTKFaceColorPalette *)self _notFoundColor];
      }
      else
      {
        id v11 = v10;
        id v10 = v11;
      }
      BOOL v5 = v11;
    }
    else
    {
      id v12 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

      if (v13)
      {
        v14 = objc_alloc_init(NTKFaceColorPaletteInspector);
        v15 = [(NTKFaceColorPalette *)self faceSpecificNamespace];
        [(NTKFaceColorPaletteInspector *)v14 setDomain:v15];

        [(NTKFaceColorPaletteInspector *)v14 setPropertyName:v4];
        v16 = [(NTKFaceColorPalette *)self configuration];
        objc_super v17 = [v16 colorOption];
        [(NTKFaceColorPaletteInspector *)v14 setPigmentName:v17];

        [(NTKFaceColorPaletteInspector *)v14 setIsTritium:[(NTKFaceColorPalette *)self isTritium]];
      }
      else
      {
        v14 = 0;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __35__NTKFaceColorPalette_valueForKey___block_invoke;
      aBlock[3] = &unk_1E62CB008;
      aBlock[4] = self;
      id v18 = v4;
      id v33 = v18;
      v19 = v14;
      v34 = v19;
      v20 = (void (**)(void *, void *, void))_Block_copy(aBlock);
      v21 = [(NTKFaceColorPaletteConfiguration *)self->_configuration formattedCollectionName];
      v22 = v20[2](v20, v21, 0);

      if (v22) {
        goto LABEL_16;
      }
      v22 = NTKFaceColorPalette_PerformFallbackPropertyAccessor(self, v18, v19);
      if (v22) {
        goto LABEL_16;
      }
      if ([v18 isEqualToString:kPrimaryColorSelectorName])
      {
        v23 = [(NTKFaceColorPaletteConfiguration *)self->_configuration colorOption];
        v22 = NTKFaceColorPalette_PerformFallbackPropertyAccessor(self, v23, v19);

        if (v22) {
          goto LABEL_16;
        }
      }
      v24 = [(NTKFaceColorPaletteConfiguration *)self->_configuration formattedCollectionName];
      v22 = v20[2](v20, v24, 1);

      if (v22) {
        goto LABEL_16;
      }
      if (![(NTKFaceColorPalette *)self isTritium]) {
        goto LABEL_30;
      }
      if (self->_tritium)
      {
        self->_int tritium = 0;
        identifier = self->_identifier;
        self->_identifier = 0;
      }
      v22 = [(NTKFaceColorPalette *)self valueForKey:v18];
      if (!self->_tritium)
      {
        self->_int tritium = 1;
        v28 = self->_identifier;
        self->_identifier = 0;
      }
      if (v22)
      {
LABEL_16:
        v25 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[NTKFaceColorPalette valueForKey:]((uint64_t)v19, v25);
        }

        [(NSCache *)self->_colorCache setObject:v22 forKey:v8];
        id v10 = v22;
        BOOL v5 = v10;
      }
      else
      {
LABEL_30:
        v29 = _NTKLoggingObjectForDomain(46, (uint64_t)"NTKLoggingDomainPigment");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[NTKFaceColorPalette valueForKey:]((uint64_t)v19, v29);
        }

        colorCache = self->_colorCache;
        v31 = [MEMORY[0x1E4F1CA98] null];
        [(NSCache *)colorCache setObject:v31 forKey:v8];

        BOOL v5 = [(NTKFaceColorPalette *)self _notFoundColor];
        id v10 = 0;
      }
    }
  }

  return v5;
}

id __35__NTKFaceColorPalette_valueForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v6 = [*(id *)(a1 + 32) bundleList];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    id obj = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = *(void *)(v12 + 32);
        [*(id *)(v12 + 16) colorFraction];
        v15 = objc_msgSend((id)v12, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", v13, v14, v5, v11, a3, *(void *)(a1 + 48));
        if (!v15)
        {
          v16 = *(id **)(a1 + 32);
          uint64_t v17 = *(void *)(a1 + 40);
          [v16[2] colorFraction];
          v15 = objc_msgSend(v16, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", v17, 0, v5, v11, a3, *(void *)(a1 + 48));
          if (!v15) {
            continue;
          }
        }
        id v18 = v15;

        double v6 = v18;
        goto LABEL_12;
      }
      double v6 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v18 = 0;
LABEL_12:

  return v18;
}

- (id)_notFoundColor
{
  if ([(NTKFaceColorPalette *)self isTritium])
  {
    id v2 = 0;
  }
  else
  {
    BOOL v3 = (void *)NTKFaceColorPaletteNotFoundColor;
    if (!NTKFaceColorPaletteNotFoundColor)
    {
      uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
      id v5 = (void *)NTKFaceColorPaletteNotFoundColor;
      NTKFaceColorPaletteNotFoundColor = v4;

      BOOL v3 = (void *)NTKFaceColorPaletteNotFoundColor;
    }
    id v2 = v3;
  }
  return v2;
}

- (id)_loadColorFromAssetCatalogForKey:(id)a3 namespace:(id)a4 collectionName:(id)a5 bundle:(id)a6 colorFraction:(double)a7 ignoringOptionAndCollection:(BOOL)a8 inspector:(id)a9
{
  BOOL v10 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  [(NTKFaceColorPalette *)self entryNameForKey:v15];
  v59 = v58 = v16;
  if (v16)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%@/", v16];
    long long v21 = (__CFString *)v20;
    if (v10)
    {
      id v56 = v15;
      v57 = v17;
      long long v22 = (__CFString *)v20;
      long long v23 = NSString;
      long long v24 = colorEntryName(0, v59, [(NTKFaceColorPalette *)self isTritium]);
      v25 = [v23 stringWithFormat:@"%@%@", v22, v24];
      id v26 = v18;
      long long v21 = v22;
      id v15 = v56;
      v27 = colorWithName(v25, v18, v19);
LABEL_18:

      id v17 = v57;
      id v18 = v26;
      goto LABEL_19;
    }
  }
  else
  {
    long long v21 = &stru_1F1635E90;
    if (v10)
    {
      v27 = 0;
      goto LABEL_19;
    }
  }
  v57 = v17;
  if (!v17)
  {
LABEL_17:
    v44 = NSString;
    long long v24 = [(NTKFaceColorPaletteConfiguration *)self->_configuration colorOption];
    v25 = colorEntryName(v24, v59, [(NTKFaceColorPalette *)self isTritium]);
    v45 = [v44 stringWithFormat:@"%@%@", v21, v25];
    id v26 = v18;
    v27 = colorWithName(v45, v18, v19);

    goto LABEL_18;
  }
  v28 = NSString;
  [(NTKFaceColorPaletteConfiguration *)self->_configuration colorOption];
  v29 = v21;
  id v30 = v19;
  v32 = id v31 = v17;
  id v33 = colorEntryName(v32, v59, [(NTKFaceColorPalette *)self isTritium]);
  id v55 = v31;
  id v19 = v30;
  long long v21 = v29;
  v34 = [v28 stringWithFormat:@"%@%@/%@", v29, v55, v33];
  v27 = colorWithName(v34, v18, v19);

  if (!v27 && v59)
  {
    v35 = NSString;
    id v17 = v57;
    v36 = colorEntryName(v57, v59, [(NTKFaceColorPalette *)self isTritium]);
    v37 = [v35 stringWithFormat:@"%@%@", v29, v36];
    v27 = colorWithName(v37, v18, v19);

    if (v27) {
      goto LABEL_19;
    }
    v38 = [v57 componentsSeparatedByString:@"/"];
    v39 = (void *)[v38 mutableCopy];

    [v39 removeLastObject];
    while ([v39 count])
    {
      v40 = [v39 componentsJoinedByString:@"/"];
      v41 = NSString;
      v42 = colorEntryName(v40, v59, [(NTKFaceColorPalette *)self isTritium]);
      v43 = [v41 stringWithFormat:@"%@%@", v21, v42];
      v27 = colorWithName(v43, v18, v19);

      [v39 removeLastObject];
      if (v27) {
        goto LABEL_15;
      }
    }
    v27 = 0;
LABEL_15:
  }
  id v17 = v57;
  if (!v27) {
    goto LABEL_17;
  }
LABEL_19:
  if ([v15 isEqualToString:kPrimaryColorSelectorName]
    && (CLKFloatEqualsFloat() & 1) == 0)
  {
    id v47 = v15;
    uint64_t v48 = [(NTKFaceColorPalette *)self _loadColorFromAssetCatalogForKey:@"from" namespace:v58 collectionName:v17 bundle:v18 colorFraction:0 ignoringOptionAndCollection:0 inspector:0.5];
    id v49 = v17;
    v50 = (void *)v48;
    v51 = v49;
    uint64_t v52 = -[NTKFaceColorPalette _loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:](self, "_loadColorFromAssetCatalogForKey:namespace:collectionName:bundle:colorFraction:ignoringOptionAndCollection:inspector:", @"to", v58, 0.5);
    v53 = (void *)v52;
    id v46 = 0;
    if (v50 && v52)
    {
      if (v27) {
        CLKCompressFraction();
      }
      NTKInterpolateBetweenColors();
      id v46 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v17 = v51;
    id v15 = v47;
  }
  else
  {
    id v46 = v27;
  }

  return v46;
}

- (id)entryNameForKey:(id)a3
{
  BOOL v3 = (__CFString *)a3;
  if ([(__CFString *)v3 isEqualToString:kPrimaryColorSelectorName])
  {
    uint64_t v4 = 0;
  }
  else if ([(__CFString *)v3 isEqualToString:kPrimaryShiftedColorSelectorName])
  {
    uint64_t v4 = @"shifted";
  }
  else if ([(__CFString *)v3 isEqualToString:kSecondaryColorSelectorName])
  {
    uint64_t v4 = @"secondary";
  }
  else
  {
    if (![(__CFString *)v3 isEqualToString:kSecondaryShiftedColorSelectorName]) {
      goto LABEL_10;
    }
    uint64_t v4 = @"secondaryShifted";
  }

  BOOL v3 = v4;
LABEL_10:
  return v3;
}

- (id)_primaryShiftedColor
{
  id v2 = [(NTKFaceColorPalette *)self primaryColor];
  BOOL v3 = objc_msgSend(v2, "ntk_colorByBoostingSaturation:lightness:", 0.2, 0.5);

  return v3;
}

- (id)_secondaryColor
{
  id v2 = [(NTKFaceColorPalette *)self primaryColor];
  BOOL v3 = NTKColorByPremultiplyingAlpha(v2, 0.18);

  return v3;
}

- (id)_secondaryShiftedColor
{
  id v2 = [(NTKFaceColorPalette *)self primaryColor];
  BOOL v3 = NTKColorByPremultiplyingAlpha(v2, 0.15);

  return v3;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___NTKFaceColorPalette;
  if (objc_msgSendSuper2(&v10, sel_resolveInstanceMethod_)) {
    return 1;
  }
  double v6 = NSStringFromSelector(a3);
  uint64_t v7 = [v6 componentsSeparatedByString:@":"];
  uint64_t v8 = [v7 count];

  if ([v6 hasPrefix:@"_"])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
    if (([v6 hasPrefix:@"tritium_"] & 1) == 0 && v8 == 1) {
      BOOL v5 = class_addMethod((Class)a1, a3, (IMP)NTKFaceColorPalette_DefaultPropertAccessor, "@@:");
    }
  }

  return v5;
}

- (UIColor)swatch
{
  if ([(NTKFaceColorPalette *)self isCompositePalette]
    || [(NTKFaceColorPalette *)self isUnityColor])
  {
    BOOL v3 = 0;
  }
  else if (![(NTKFaceColorPalette *)self isBlackColor] {
         || ([(NTKFaceColorPalette *)self valueForKey:@"softBlack"],
  }
             (BOOL v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v3 = [(NTKFaceColorPalette *)self primaryColor];
  }
  return (UIColor *)v3;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = NSString;
  uint64_t v7 = [(NTKFaceColorPalette *)self configuration];
  uint64_t v8 = [v7 uniqueId];
  v19.double width = width;
  v19.double height = height;
  uint64_t v9 = NSStringFromCGSize(v19);
  objc_super v10 = [v6 stringWithFormat:@"%@-%@", v8, v9];

  uint64_t v11 = [(NSCache *)self->_swatchImageCache objectForKey:v10];
  if (!v11)
  {
    if ([(NTKFaceColorPalette *)self isRainbowColor])
    {
      uint64_t v12 = @"Swatch-Multicolor-Pride";
      goto LABEL_6;
    }
    if ([(NTKFaceColorPalette *)self isMulticolor])
    {
      uint64_t v12 = @"Swatch-Multicolor";
LABEL_6:
      NTKImageNamed(v12);
    }
    if ([(NTKFaceColorPalette *)self isUnityColor])
    {
      uint64_t v11 = -[NTKFaceColorPalette _unitySwatchImageForSize:](self, "_unitySwatchImageForSize:", width, height);
      if (!v11) {
        goto LABEL_7;
      }
    }
    else
    {
      if (![(NTKFaceColorPalette *)self isCompositePalette])
      {
        uint64_t v11 = 0;
        goto LABEL_7;
      }
      uint64_t v14 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
      id v15 = [v14 swatch];

      id v16 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
      id v17 = [v16 swatch];

      uint64_t v11 = NTKSwatchTwoColorImage(v15, v17, width, height);

      if (!v11) {
        goto LABEL_7;
      }
    }
    [(NSCache *)self->_swatchImageCache setObject:v11 forKey:v10];
  }
LABEL_7:

  return v11;
}

- (id)swatchPrimaryColor
{
  if ([(NTKFaceColorPalette *)self isRainbowColor]
    || [(NTKFaceColorPalette *)self isMulticolor])
  {
    BOOL v3 = 0;
  }
  else
  {
    if ([(NTKFaceColorPalette *)self isUnityColor])
    {
      uint64_t v4 = [(NTKFaceColorPalette *)self _unityMiddleColor];
    }
    else
    {
      if ([(NTKFaceColorPalette *)self isCompositePalette])
      {
        BOOL v5 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
        [v5 swatch];
        objc_claimAutoreleasedReturnValue();

        double v6 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
        [v6 swatch];
        objc_claimAutoreleasedReturnValue();

        CLKUICompareColorsByLightness();
      }
      uint64_t v4 = [(NTKFaceColorPalette *)self primaryColor];
    }
    BOOL v3 = (void *)v4;
  }
  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  faceSpecificNamespace = self->_faceSpecificNamespace;
  configuration = self->_configuration;
  BOOL v7 = [(NTKFaceColorPalette *)self isTritium];
  uint64_t v8 = &stru_1F1635E90;
  if (v7) {
    uint64_t v8 = @"(tritium)";
  }
  return (NSString *)[v3 stringWithFormat:@"%@ [domain:%@, configuration: %@] %@", v4, faceSpecificNamespace, configuration, v8];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NTKFaceColorPalette *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    BOOL v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      double v6 = [(NTKFaceColorPalette *)self faceSpecificNamespace];
      BOOL v7 = [(NTKFaceColorPalette *)v4 faceSpecificNamespace];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(NTKFaceColorPalette *)self configuration];
        uint64_t v9 = [(NTKFaceColorPalette *)v4 configuration];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NTKFaceColorPaletteConfiguration)configuration
{
  return self->_configuration;
}

- (NSCache)swatchImageCache
{
  return self->_swatchImageCache;
}

- (void)setSwatchImageCache:(id)a3
{
}

- (BOOL)isTritium
{
  return self->_tritium;
}

- (NSString)faceSpecificNamespace
{
  return self->_faceSpecificNamespace;
}

- (void)setFaceSpecificNamespace:(id)a3
{
}

- (void)setBundleList:(id)a3
{
}

- (NSCache)colorCache
{
  return self->_colorCache;
}

- (void)setColorCache:(id)a3
{
}

- (NSBundle)domainBundle
{
  return self->_domainBundle;
}

- (void)setDomainBundle:(id)a3
{
}

- (NTKInterpolatedColorPalette)interpolatedTritiumPalette
{
  return self->_interpolatedTritiumPalette;
}

- (void)setInterpolatedTritiumPalette:(id)a3
{
}

- (void)setIdentifier:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
  }
}

- (void)setTritiumPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tritiumPalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_interpolatedTritiumPalette, 0);
  objc_storeStrong((id *)&self->_domainBundle, 0);
  objc_storeStrong((id *)&self->_colorCache, 0);
  objc_storeStrong((id *)&self->_bundleList, 0);
  objc_storeStrong((id *)&self->_faceSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_swatchImageCache, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)_unitySwatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(NTKFaceColorPalette *)self paletteAtIndex:0];
  BOOL v7 = [v6 primaryColor];

  uint64_t v8 = [(NTKFaceColorPalette *)self _unityMiddleColor];
  uint64_t v9 = [(NTKFaceColorPalette *)self paletteAtIndex:1];
  char v10 = [v9 primaryColor];

  uint64_t v11 = -[NTKFaceColorPalette _unitySwatchImageForSize:redColor:blackColor:greenColor:](self, "_unitySwatchImageForSize:redColor:blackColor:greenColor:", v7, v8, v10, width, height);

  return v11;
}

- (id)_unitySwatchImageForSize:(CGSize)a3 redColor:(id)a4 blackColor:(id)a5 greenColor:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    +[NTKEditOption sizeForSwatchStyle:0];
    double width = v14;
    double height = v15;
  }
  id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __103__NTKFaceColorPalette_NTKUnityColorUtilities___unitySwatchImageForSize_redColor_blackColor_greenColor___block_invoke;
  v22[3] = &unk_1E62CB2D8;
  double v26 = width;
  double v27 = height;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = [v16 imageWithActions:v22];

  return v20;
}

void __103__NTKFaceColorPalette_NTKUnityColorUtilities___unitySwatchImageForSize_redColor_blackColor_greenColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 format];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = (CGContext *)[v3 CGContext];
  CGContextTranslateCTM(v13, v10 * 0.5, v12 * 0.5);
  CGContextRotateCTM(v13, -0.785398163);
  CGContextTranslateCTM(v13, -(v10 * 0.5), -(v12 * 0.5));
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.double width = v10;
  v20.size.double height = v12;
  CGContextAddEllipseInRect(v13, v20);
  CGContextClip(v13);
  double v14 = *(double *)(a1 + 56) / 2.52;
  [*(id *)(a1 + 32) setFill];
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.double width = v10;
  v21.size.double height = v14 * 0.76;
  CGContextFillRect(v13, v21);
  [*(id *)(a1 + 40) setFill];
  v22.origin.x = 0.0;
  v22.origin.y = v14 * 0.76 + 0.0;
  v22.size.double width = v10;
  v22.size.double height = v14;
  CGContextFillRect(v13, v22);
  [*(id *)(a1 + 48) setFill];
  uint64_t v15 = 0;
  double v17 = v10;
  double v16 = v14 + v14 * 0.76 + 0.0;
  double v18 = v14 * 0.76;
  CGContextFillRect(v13, *(CGRect *)&v15);
}

- (id)_unityMiddleColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (void)valueForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "#palette %{public}@", (uint8_t *)&v2, 0xCu);
}

@end