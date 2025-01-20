@interface NTKPigmentEditOption
+ (BOOL)hasInlineCollectionInOptionName:(id)a3;
+ (BOOL)isMultitoneOptionWithOptionName:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (double)defaultFraction;
+ (id)duotoneNameWithName:(id)a3 otherName:(id)a4;
+ (id)fullnameWithCollectionName:(id)a3 optionName:(id)a4;
+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4;
+ (id)multitoneColorNames:(id)a3;
+ (id)multitonePigmentAtIndex:(unint64_t)a3 forColorName:(id)a4 groupName:(id)a5;
+ (id)pigmentNamed:(id)a3;
+ (void)effectiveNamesFromName:(id)a3 effectiveCollectionName:(id *)a4 effectiveOptionName:(id *)a5;
+ (void)parseFullname:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 fraction:(double *)a6;
+ (void)parserIdentifier:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 colorFraction:(double *)a6 separator:(id)a7;
- (BOOL)isAddable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringFraction:(id)a3;
- (BOOL)isEquivalentToOption:(id)a3;
- (BOOL)isFromStore;
- (BOOL)isMultiColor;
- (BOOL)isMultitoneOption;
- (BOOL)isRainbowColor;
- (BOOL)isSensitiveUI;
- (BOOL)isValidOption;
- (BOOL)isVisible;
- (BOOL)isWhiteColor;
- (BOOL)loadedBundleFromClass;
- (BOOL)sortedByHue;
- (BOOL)supportsSlider;
- (NSBundle)mainBundle;
- (NSBundle)sourceBundle;
- (NSNumber)desiredPosition;
- (NSString)alternativeLocalizedStringTableName;
- (NSString)bundlePrincipalClassName;
- (NSString)collectionName;
- (NSString)effectiveCollectionName;
- (NSString)effectiveOptionName;
- (NSString)fullname;
- (NSString)optionName;
- (NTKPigmentEditOption)initWithCoder:(id)a3;
- (NTKPigmentEditOption)initWithDevice:(id)a3;
- (NTKPigmentEditOption)initWithFullname:(id)a3;
- (NTKPigmentEditOption)initWithFullname:(id)a3 fraction:(double)a4;
- (NTKPigmentEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4;
- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4 colorFraction:(double)a5;
- (NTKPigmentEditOption)initWithProtoBuffer:(id)a3;
- (double)colorFraction;
- (id)JSONObjectRepresentationForFace:(id)a3;
- (id)_buildFullname;
- (id)_resolveBundleWithBundlePrincipalClassName:(id)a3;
- (id)copyWithCollectionOverride:(id)a3;
- (id)copyWithColorFraction:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullnameIncludingFraction;
- (id)json;
- (id)legacyJSONRepresentationForFace:(id)a3;
- (id)localizationTableNames;
- (id)localizedCollectionName;
- (id)localizedName;
- (id)localizedNameForKey:(id)a3;
- (id)localizedNameForKey:(id)a3 fromTable:(id)a4 separatorString:(id)a5;
- (id)localizedNameForKey:(id)a3 table:(id)a4;
- (id)multitoneNamesWithoutCollection;
- (id)protoBuffer;
- (int64_t)swatchStyle;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)extractEffectiveCollectionName:(id *)a3 effectiveOptionName:(id *)a4;
- (void)loadEffectiveNames;
- (void)setAlternativeLocalizedStringTableName:(id)a3;
- (void)setBundlePrincipalClassName:(id)a3;
- (void)setDesiredPosition:(id)a3;
- (void)setEffectiveCollectionName:(id)a3;
- (void)setEffectiveOptionName:(id)a3;
- (void)setFromStore:(BOOL)a3;
- (void)setFullname:(id)a3;
- (void)setIsAddable:(BOOL)a3;
- (void)setIsSensitiveUI:(BOOL)a3;
- (void)setLoadedBundleFromClass:(BOOL)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setSortedByHue:(BOOL)a3;
- (void)setSourceBundle:(id)a3;
- (void)setSupportsSlider:(BOOL)a3;
@end

@implementation NTKPigmentEditOption

- (NTKPigmentEditOption)initWithDevice:(id)a3
{
  return 0;
}

+ (id)pigmentNamed:(id)a3
{
  id v3 = a3;
  v4 = [[NTKPigmentEditOption alloc] initWithFullname:v3];

  return v4;
}

- (NTKPigmentEditOption)initWithFullname:(id)a3
{
  return [(NTKPigmentEditOption *)self initWithFullname:a3 fraction:0.5];
}

- (NTKPigmentEditOption)initWithFullname:(id)a3 fraction:(double)a4
{
  double v12 = a4;
  id v5 = a3;
  id v10 = 0;
  id v11 = 0;
  [(id)objc_opt_class() parseFullname:v5 collectionName:&v11 optionName:&v10 fraction:&v12];

  id v6 = v11;
  id v7 = v10;
  v8 = [(NTKPigmentEditOption *)self initWithOptionName:v7 collectionName:v6 colorFraction:v12];

  return v8;
}

- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4
{
  return [(NTKPigmentEditOption *)self initWithOptionName:a3 collectionName:a4 colorFraction:0.5];
}

- (NTKPigmentEditOption)initWithOptionName:(id)a3 collectionName:(id)a4 colorFraction:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  double v12 = 0;
  if (v9 && v10)
  {
    v13 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v14 = [v13 device];

    v20.receiver = self;
    v20.super_class = (Class)NTKPigmentEditOption;
    v15 = [(NTKEditOption *)&v20 initWithDevice:v14];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_optionName, a3);
      objc_storeStrong((id *)&v16->_collectionName, a4);
      v16->_colorFraction = a5;
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      mainBundle = v16->_mainBundle;
      v16->_mainBundle = (NSBundle *)v17;

      [(NTKPigmentEditOption *)v16 loadEffectiveNames];
      v16->_lock._os_unfair_lock_opaque = 0;
    }
    self = v16;

    double v12 = self;
  }

  return v12;
}

- (NTKPigmentEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"NTKPigmentEditOption json value must be a string - invalid value: %@", v5 format];
  }
  double v12 = 0.5;
  id v10 = 0;
  id v11 = 0;
  [(id)objc_opt_class() parseFullname:v5 collectionName:&v11 optionName:&v10 fraction:&v12];
  id v6 = v11;
  id v7 = v10;
  v8 = [(NTKPigmentEditOption *)self initWithOptionName:v7 collectionName:v6 colorFraction:v12];

  return v8;
}

- (BOOL)isVisible
{
  id v3 = +[NTKPigmentEditOptionStore sharedInstance];
  LOBYTE(self) = [v3 isOptionVisible:self];

  return (char)self;
}

+ (double)defaultFraction
{
  return 0.5;
}

- (BOOL)isRainbowColor
{
  v2 = [(NTKPigmentEditOption *)self fullname];
  char v3 = [v2 isEqualToString:@"special.rainbow"];

  return v3;
}

- (BOOL)isMultiColor
{
  v2 = [(NTKPigmentEditOption *)self fullname];
  char v3 = [v2 isEqualToString:@"special.multicolor"];

  return v3;
}

- (BOOL)isWhiteColor
{
  v2 = [(NTKPigmentEditOption *)self fullname];
  char v3 = [v2 isEqualToString:@"seasons.spring2015.white"];

  return v3;
}

- (id)fullnameIncludingFraction
{
  if (vabdd_f64(0.5, self->_colorFraction) >= 0.00000011920929)
  {
    v4 = NSString;
    id v5 = [(NTKPigmentEditOption *)self fullname];
    char v3 = [v4 stringWithFormat:@"%@%@%0.2f", v5, @":", *(void *)&self->_colorFraction];
  }
  else
  {
    char v3 = [(NTKPigmentEditOption *)self fullname];
  }

  return v3;
}

- (id)_buildFullname
{
  if ([(NTKPigmentEditOption *)self isMultitoneOption])
  {
    char v3 = [(NTKPigmentEditOption *)self collectionName];
    v4 = objc_opt_class();
    id v5 = [(NTKPigmentEditOption *)self optionName];
    id v6 = [v4 multitoneColorNames:v5];

    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__NTKPigmentEditOption__buildFullname__block_invoke;
    v15[3] = &unk_1E62C0160;
    id v8 = v7;
    id v16 = v8;
    uint64_t v17 = v3;
    id v9 = v3;
    [v6 enumerateObjectsUsingBlock:v15];
    id v10 = v17;
    id v11 = v8;
  }
  else
  {
    double v12 = [(NTKPigmentEditOption *)self effectiveCollectionName];
    v13 = [(NTKPigmentEditOption *)self effectiveOptionName];
    id v11 = +[NTKPigmentEditOption fullnameWithCollectionName:v12 optionName:v13];
  }

  return v11;
}

void __38__NTKPigmentEditOption__buildFullname__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendFormat:@" %@ ", @"&"];
  }
  int v3 = [v6 containsString:@"."];
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) appendString:v6];
  }
  else
  {
    id v5 = +[NTKPigmentEditOption fullnameWithCollectionName:*(void *)(a1 + 40) optionName:v6];
    [v4 appendString:v5];
  }
}

+ (id)multitonePigmentAtIndex:(unint64_t)a3 forColorName:(id)a4 groupName:(id)a5
{
  id v7 = a5;
  id v8 = +[NTKPigmentEditOption multitoneColorNames:a4];
  if ((unint64_t)[v8 count] < 2 || objc_msgSend(v8, "count") <= a3)
  {
    v13 = 0;
  }
  else
  {
    id v9 = [v8 objectAtIndexedSubscript:a3];
    id v16 = v7;
    uint64_t v17 = 0;
    id v15 = 0;
    id v10 = v7;
    +[NTKPigmentEditOption parseFullname:v9 collectionName:&v16 optionName:&v15 fraction:&v17];
    id v11 = v16;

    id v12 = v15;
    v13 = [[NTKPigmentEditOption alloc] initWithOptionName:v12 collectionName:v11];
  }

  return v13;
}

+ (void)parseFullname:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 fraction:(double *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0.5;
  }
  id v10 = v9;
  id v11 = v10;
  if ([v10 containsString:@":"])
  {
    id v12 = [v10 componentsSeparatedByString:@":"];
    v13 = (void *)[v12 mutableCopy];

    v14 = [v13 lastObject];
    id v15 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    [v15 setLocale:v16];

    uint64_t v17 = [v15 numberFromString:v14];
    id v11 = v10;
    if (v17)
    {
      id v11 = [v13 firstObject];

      if (a6)
      {
        [v17 floatValue];
        *a6 = v18;
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__NTKPigmentEditOption_parseFullname_collectionName_optionName_fraction___block_invoke;
  aBlock[3] = &unk_1E62C8930;
  id v19 = v11;
  id v22 = v19;
  objc_super v20 = (void (**)(void *, __CFString *, id *, id *))_Block_copy(aBlock);
  if ([v19 containsString:@":"])
  {
    v20[2](v20, @":", a4, a5);
  }
  else if ([v19 containsString:@"."])
  {
    v20[2](v20, @".", a4, a5);
  }
  else if (a5)
  {
    *a5 = v19;
  }
}

void __73__NTKPigmentEditOption_parseFullname_collectionName_optionName_fraction___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByString:");
  id v8 = (void *)[v7 mutableCopy];

  if (a4)
  {
    *a4 = [v8 lastObject];
  }
  if (a3)
  {
    [v8 removeLastObject];
    if ([v8 count])
    {
      *a3 = [v8 componentsJoinedByString:v9];
    }
  }
}

- (void)loadEffectiveNames
{
  id v11 = 0;
  id v12 = 0;
  [(NTKPigmentEditOption *)self extractEffectiveCollectionName:&v12 effectiveOptionName:&v11];
  int v3 = (NSString *)v12;
  v4 = (NSString *)v11;
  effectiveOptionName = self->_effectiveOptionName;
  self->_effectiveOptionName = v4;
  id v6 = v4;

  effectiveCollectionName = self->_effectiveCollectionName;
  self->_effectiveCollectionName = v3;
  id v8 = v3;

  id v9 = [(NTKPigmentEditOption *)self _buildFullname];
  fullname = self->_fullname;
  self->_fullname = v9;
}

+ (void)parserIdentifier:(id)a3 collectionName:(id *)a4 optionName:(id *)a5 colorFraction:(double *)a6 separator:(id)a7
{
  id v10 = [a3 componentsSeparatedByString:a7];
  if (a6) {
    *a6 = 0.5;
  }
  id v21 = v10;
  if ([v10 count] != 3)
  {
    if ([v21 count] == 2)
    {
      if (a4)
      {
        uint64_t v17 = [v21 firstObject];
        float v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        *a4 = [v17 stringByTrimmingCharactersInSet:v18];
      }
      if (!a5) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v19 = [v21 count];
      if (!a5 || v19 != 1) {
        goto LABEL_19;
      }
    }
    id v15 = [v21 lastObject];
    objc_super v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    *a5 = [v15 stringByTrimmingCharactersInSet:v20];

    goto LABEL_18;
  }
  if (a4)
  {
    id v11 = [v21 firstObject];
    id v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    *a4 = [v11 stringByTrimmingCharactersInSet:v12];
  }
  if (a5)
  {
    v13 = [v21 objectAtIndexedSubscript:1];
    v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    *a5 = [v13 stringByTrimmingCharactersInSet:v14];
  }
  if (a6)
  {
    id v15 = [v21 lastObject];
    [v15 floatValue];
    *a6 = v16;
LABEL_18:
  }
LABEL_19:
}

- (void)extractEffectiveCollectionName:(id *)a3 effectiveOptionName:(id *)a4
{
  id v7 = [(NTKPigmentEditOption *)self collectionName];
  id v8 = [(NTKPigmentEditOption *)self optionName];
  id v9 = objc_opt_class();
  id v10 = [(NTKPigmentEditOption *)self optionName];
  id v13 = v8;
  id v14 = v7;
  [v9 effectiveNamesFromName:v10 effectiveCollectionName:&v14 effectiveOptionName:&v13];
  id v11 = v14;

  id v12 = v13;
  if (a3) {
    *a3 = v11;
  }
  if (a4) {
    *a4 = v12;
  }
}

- (id)multitoneNamesWithoutCollection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(NTKPigmentEditOption *)self isMultitoneOption])
  {
    int v3 = objc_opt_class();
    v4 = [(NTKPigmentEditOption *)self optionName];
    id v5 = [v3 multitoneColorNames:v4];

    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v13 = objc_opt_class();
          id v16 = 0;
          [v13 effectiveNamesFromName:v12 effectiveCollectionName:0 effectiveOptionName:&v16];
          id v14 = v16;
          if (v14)
          {
            if ([v6 length]) {
              [v6 appendFormat:@" %@ ", @"&"];
            }
            [v6 appendString:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)effectiveNamesFromName:(id)a3 effectiveCollectionName:(id *)a4 effectiveOptionName:(id *)a5
{
  id v8 = a3;
  if ([a1 hasInlineCollectionInOptionName:v8]
    && ([a1 isMultitoneOptionWithOptionName:v8] & 1) == 0)
  {
    id v11 = v8;
    id v12 = 0;
    +[NTKPigmentEditOption parseFullname:v8 collectionName:&v12 optionName:&v11 fraction:0];
    id v9 = v12;
    id v10 = v11;

    if (a4 && v9)
    {
      id v9 = v9;
      *a4 = v9;
    }
  }
  else
  {
    id v9 = 0;
    id v10 = v8;
  }
  if (a5 && v10) {
    *a5 = v10;
  }
}

+ (BOOL)isMultitoneOptionWithOptionName:(id)a3
{
  return [a3 containsString:@"&"];
}

+ (id)fullnameWithCollectionName:(id)a3 optionName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = [NSString stringWithFormat:@"%@%@%@", v5, @".", v6];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (id)JSONObjectRepresentationForFace:(id)a3
{
  v4 = [(NTKPigmentEditOption *)self legacyJSONRepresentationForFace:a3];
  if (!v4)
  {
    v4 = [(NTKPigmentEditOption *)self json];
  }

  return v4;
}

- (id)json
{
  int v3 = [(NTKPigmentEditOption *)self optionName];
  if ([v3 containsString:@"."])
  {

LABEL_4:
    id v5 = [(NTKPigmentEditOption *)self identifier];
    goto LABEL_6;
  }
  BOOL v4 = [(NTKPigmentEditOption *)self isMultitoneOption];

  if (v4) {
    goto LABEL_4;
  }
  id v5 = [(NTKPigmentEditOption *)self fullnameIncludingFraction];
LABEL_6:
  id v6 = v5;
  id v7 = (void *)[v5 copy];

  return v7;
}

- (BOOL)isValidOption
{
  return 1;
}

- (NTKPigmentEditOption)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"optionName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionName"];
  [v4 decodeFloatForKey:@"colorFraction"];
  id v8 = [(NTKPigmentEditOption *)self initWithOptionName:v5 collectionName:v6 colorFraction:v7];
  if (v8)
  {
    v8->_isAddable = [v4 decodeBoolForKey:@"isAddable"];
    v8->_supportsSlider = [v4 decodeBoolForKey:@"supportsSlider"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternativeLocalizedStringTableName"];
    alternativeLocalizedStringTableName = v8->_alternativeLocalizedStringTableName;
    v8->_alternativeLocalizedStringTableName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePrincipalClassName"];
    bundlePrincipalClassName = v8->_bundlePrincipalClassName;
    v8->_bundlePrincipalClassName = (NSString *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  optionName = self->_optionName;
  id v6 = a3;
  [v6 encodeObject:optionName forKey:@"optionName"];
  [v6 encodeObject:self->_collectionName forKey:@"collectionName"];
  double colorFraction = self->_colorFraction;
  *(float *)&double colorFraction = colorFraction;
  [v6 encodeFloat:@"colorFraction" forKey:colorFraction];
  [v6 encodeBool:self->_isAddable forKey:@"isAddable"];
  [v6 encodeBool:self->_supportsSlider forKey:@"supportsSlider"];
  [v6 encodeObject:self->_alternativeLocalizedStringTableName forKey:@"alternativeLocalizedStringTableName"];
  [v6 encodeObject:self->_bundlePrincipalClassName forKey:@"bundlePrincipalClassName"];
}

- (NTKPigmentEditOption)initWithProtoBuffer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [NTKPigmentEditOption alloc];
    id v6 = [v4 optionName];
    float v7 = [v4 collectionName];
    id v8 = [(NTKPigmentEditOption *)v5 initWithOptionName:v6 collectionName:v7];

    if (v8)
    {
      [v4 colorFraction];
      v8->_double colorFraction = v9;
      v8->_isAddable = [v4 isAddable];
      v8->_supportsSlider = [v4 supportsSlider];
      uint64_t v10 = [v4 alternativeLocalizedStringTableName];
      alternativeLocalizedStringTableName = v8->_alternativeLocalizedStringTableName;
      v8->_alternativeLocalizedStringTableName = (NSString *)v10;

      uint64_t v12 = [v4 bundlePrincipalClassName];
      bundlePrincipalClassName = v8->_bundlePrincipalClassName;
      v8->_bundlePrincipalClassName = (NSString *)v12;

      -[NTKPigmentEditOption setFromStore:](v8, "setFromStore:", [v4 fromStore]);
      id v14 = v8;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)protoBuffer
{
  int v3 = objc_alloc_init(NTKProtoPigment);
  [(NTKProtoPigment *)v3 setOptionName:self->_optionName];
  [(NTKProtoPigment *)v3 setCollectionName:self->_collectionName];
  double colorFraction = self->_colorFraction;
  *(float *)&double colorFraction = colorFraction;
  [(NTKProtoPigment *)v3 setColorFraction:colorFraction];
  [(NTKProtoPigment *)v3 setIsAddable:self->_isAddable];
  [(NTKProtoPigment *)v3 setSupportsSlider:self->_supportsSlider];
  [(NTKProtoPigment *)v3 setBundlePrincipalClassName:self->_bundlePrincipalClassName];
  [(NTKProtoPigment *)v3 setAlternativeLocalizedStringTableName:self->_alternativeLocalizedStringTableName];
  [(NTKProtoPigment *)v3 setFromStore:self->_fromStore];

  return v3;
}

- (id)localizationTableNames
{
  int v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(NTKPigmentEditOption *)self alternativeLocalizedStringTableName];

  if (v4)
  {
    id v5 = NSString;
    id v6 = [(NTKPigmentEditOption *)self alternativeLocalizedStringTableName];
    float v7 = [v5 stringWithFormat:@"%@-%@", @"FaceColors", v6];
    [v3 addObject:v7];
  }
  [v3 addObject:@"FaceColors"];

  return v3;
}

- (id)localizedName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  localizedName = self->_localizedName;
  if (!localizedName)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [(NTKPigmentEditOption *)self localizationTableNames];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = [(NTKPigmentEditOption *)self identifier];
        uint64_t v11 = [(NTKPigmentEditOption *)self localizedNameForKey:v10 table:v9];
        uint64_t v12 = self->_localizedName;
        self->_localizedName = v11;

        if (self->_localizedName) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    localizedName = self->_localizedName;
    if (!localizedName)
    {
      id v13 = [(NTKPigmentEditOption *)self fullname];
      id v14 = [(NTKPigmentEditOption *)self localizedNameForKey:v13];
      id v15 = self->_localizedName;
      self->_localizedName = v14;

      localizedName = self->_localizedName;
    }
  }

  return localizedName;
}

- (id)localizedNameForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSBundle *)self->_mainBundle localizedStringForKey:@"MULTITONE_NAMES_SEPARATOR" value:&stru_1F1635E90 table:@"FaceColors"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NTKPigmentEditOption *)self localizationTableNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(NTKPigmentEditOption *)self localizedNameForKey:v4 fromTable:*(void *)(*((void *)&v14 + 1) + 8 * i) separatorString:v5];
        if (v11)
        {
          id v12 = (id)v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = v4;
LABEL_11:

  return v12;
}

- (id)localizedCollectionName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  localizedCollectionName = self->_localizedCollectionName;
  if (!localizedCollectionName)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = [(NTKPigmentEditOption *)self localizationTableNames];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
          uint64_t v10 = [(NTKPigmentEditOption *)self collectionName];
          uint64_t v11 = [(NTKPigmentEditOption *)self localizedNameForKey:v10 table:v9];

          if (v11) {
            goto LABEL_12;
          }
          id v12 = [(NTKPigmentEditOption *)self collectionName];
          id v13 = [v12 componentsSeparatedByString:@"."];
          long long v14 = [v13 lastObject];

          uint64_t v11 = [(NTKPigmentEditOption *)self localizedNameForKey:v14 table:v9];

          if (v11)
          {
LABEL_12:

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = [(NTKPigmentEditOption *)self collectionName];
LABEL_13:
    long long v15 = self->_localizedCollectionName;
    self->_localizedCollectionName = v11;

    localizedCollectionName = self->_localizedCollectionName;
  }

  return localizedCollectionName;
}

- (id)localizedNameForKey:(id)a3 fromTable:(id)a4 separatorString:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(NTKPigmentEditOption *)self localizedNameForKey:v8 table:v9];
  if (!v11)
  {
    if (([(id)objc_opt_class() isMultitoneOptionWithOptionName:v8] & 1) != 0
      || (id v25 = 0,
          +[NTKPigmentEditOption parseFullname:v8 collectionName:0 optionName:&v25 fraction:0], v13 = v25, [(NTKPigmentEditOption *)self localizedNameForKey:v13 table:v9], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v13, !v11))
    {
      if ([(id)objc_opt_class() isMultitoneOptionWithOptionName:v8])
      {
        [(id)objc_opt_class() multitoneColorNames:v8];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v11 = 0;
          uint64_t v17 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = -[NTKPigmentEditOption localizedNameForKey:](self, "localizedNameForKey:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
              if (!v19)
              {

                goto LABEL_22;
              }
              long long v20 = (void *)v19;
              if (v11)
              {
                [v11 appendString:v10];
              }
              else
              {
                uint64_t v11 = [MEMORY[0x1E4F28E78] string];
              }
              [v11 appendString:v20];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
        else
        {
LABEL_22:
          uint64_t v11 = 0;
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

- (BOOL)isMultitoneOption
{
  int v3 = objc_opt_class();
  id v4 = [(NTKPigmentEditOption *)self optionName];
  LOBYTE(v3) = [v3 isMultitoneOptionWithOptionName:v4];

  return (char)v3;
}

+ (BOOL)hasInlineCollectionInOptionName:(id)a3
{
  return [a3 containsString:@"."];
}

+ (id)multitoneColorNames:(id)a3
{
  int v3 = [a3 componentsSeparatedByString:@"&"];
  id v4 = (void *)[v3 mutableCopy];

  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v4 objectAtIndexedSubscript:v5];
      uint64_t v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      id v8 = [v6 stringByTrimmingCharactersInSet:v7];
      [v4 setObject:v8 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < [v4 count]);
  }

  return v4;
}

- (id)localizedNameForKey:(id)a3 table:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = v8;
  if (self->_mainBundle) {
    objc_msgSend(v8, "addObject:");
  }
  id v10 = [(NTKPigmentEditOption *)self sourceBundle];

  if (v10)
  {
    uint64_t v11 = [(NTKPigmentEditOption *)self sourceBundle];
    [v9 addObject:v11];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localizedStringForKey:value:table:", v6, 0, v7, (void)v19);
        if ([v17 isEqualToString:v6])
        {
        }
        else if (v17)
        {
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
  uint64_t v17 = 0;
LABEL_16:

  return v17;
}

- (NSBundle)sourceBundle
{
  v2 = self;
  objc_sync_enter(v2);
  sourceBundle = v2->_sourceBundle;
  if (!sourceBundle)
  {
    if (v2->_loadedBundleFromClass || !v2->_bundlePrincipalClassName)
    {
      sourceBundle = 0;
    }
    else
    {
      uint64_t v4 = -[NTKPigmentEditOption _resolveBundleWithBundlePrincipalClassName:](v2, "_resolveBundleWithBundlePrincipalClassName:");
      unint64_t v5 = v2->_sourceBundle;
      v2->_sourceBundle = (NSBundle *)v4;

      v2->_loadedBundleFromClass = 1;
      sourceBundle = v2->_sourceBundle;
    }
  }
  id v6 = sourceBundle;
  objc_sync_exit(v2);

  return v6;
}

- (id)_resolveBundleWithBundlePrincipalClassName:(id)a3
{
  int v3 = NSClassFromString((NSString *)a3);
  if (v3)
  {
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
  }

  return v3;
}

- (BOOL)isEquivalentToOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(NTKPigmentEditOption *)self effectiveCollectionName];
    id v6 = [v4 effectiveCollectionName];
    if ([v5 isEqual:v6])
    {
      id v7 = [(NTKPigmentEditOption *)self effectiveOptionName];
      id v8 = [v4 effectiveOptionName];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualIgnoringFraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(NTKPigmentEditOption *)self collectionName];
    id v6 = [v4 collectionName];
    if ([v5 isEqual:v6])
    {
      id v7 = [(NTKPigmentEditOption *)self optionName];
      id v8 = [v4 optionName];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(NTKPigmentEditOption *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(NTKPigmentEditOption *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithOptionName:self->_optionName collectionName:self->_collectionName colorFraction:self->_colorFraction];
  *(unsigned char *)(v4 + 32) = self->_isSensitiveUI;
  *(unsigned char *)(v4 + 33) = self->_isAddable;
  *(unsigned char *)(v4 + 34) = self->_supportsSlider;
  objc_storeStrong((id *)(v4 + 88), self->_bundlePrincipalClassName);
  objc_storeStrong((id *)(v4 + 104), self->_alternativeLocalizedStringTableName);
  objc_storeStrong((id *)(v4 + 80), self->_mainBundle);
  *(unsigned char *)(v4 + 36) = self->_sortedByHue;
  objc_storeStrong((id *)(v4 + 72), self->_desiredPosition);
  objc_msgSend((id)v4, "setFromStore:", -[NTKPigmentEditOption isFromStore](self, "isFromStore"));
  return (id)v4;
}

- (id)copyWithColorFraction:(double)a3
{
  id result = (id)[(NTKPigmentEditOption *)self copy];
  *((double *)result + 8) = a3;
  return result;
}

- (id)copyWithCollectionOverride:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)[(NTKPigmentEditOption *)self copy];
  char v6 = [v5 isMultitoneOption];
  char v7 = objc_opt_class();
  if (v6)
  {
    v26 = v5;
    id v8 = [v5 optionName];
    char v9 = [v7 multitoneColorNames:v8];

    id v10 = [MEMORY[0x1E4F28E78] string];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = (void *)MEMORY[0x1E4F28B88];
          id v17 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          long long v18 = [v16 whitespaceCharacterSet];
          long long v19 = [v17 stringByTrimmingCharactersInSet:v18];

          if ([v10 length]) {
            [v10 appendFormat:@" %@ ", @"&"];
          }
          if ([(id)objc_opt_class() hasInlineCollectionInOptionName:v19])
          {
            [v10 appendString:v19];
          }
          else
          {
            long long v20 = [(id)objc_opt_class() fullnameWithCollectionName:v4 optionName:v19];
            [v10 appendString:v20];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    unint64_t v5 = v26;
    long long v21 = (void *)v26[6];
    v26[6] = v10;
  }
  else
  {
    long long v22 = [(NTKPigmentEditOption *)self optionName];
    uint64_t v23 = [v7 fullnameWithCollectionName:v4 optionName:v22];
    uint64_t v24 = (void *)v5[6];
    v5[6] = v23;
  }
  [v5 loadEffectiveNames];

  return v5;
}

+ (id)duotoneNameWithName:(id)a3 otherName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@ %@ %@", a3, @"&", a4];
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  return 0;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (NSString)optionName
{
  return self->_optionName;
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (BOOL)isSensitiveUI
{
  return self->_isSensitiveUI;
}

- (void)setIsSensitiveUI:(BOOL)a3
{
  self->_isSensitiveUI = a3;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (void)setIsAddable:(BOOL)a3
{
  self->_isAddable = a3;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (void)setSupportsSlider:(BOOL)a3
{
  self->_supportsSlider = a3;
}

- (double)colorFraction
{
  return self->_colorFraction;
}

- (BOOL)isFromStore
{
  return self->_fromStore;
}

- (void)setFromStore:(BOOL)a3
{
  self->_fromStore = a3;
}

- (BOOL)sortedByHue
{
  return self->_sortedByHue;
}

- (void)setSortedByHue:(BOOL)a3
{
  self->_sortedByHue = a3;
}

- (NSNumber)desiredPosition
{
  return self->_desiredPosition;
}

- (void)setDesiredPosition:(id)a3
{
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (NSString)bundlePrincipalClassName
{
  return self->_bundlePrincipalClassName;
}

- (void)setBundlePrincipalClassName:(id)a3
{
}

- (void)setSourceBundle:(id)a3
{
}

- (BOOL)loadedBundleFromClass
{
  return self->_loadedBundleFromClass;
}

- (void)setLoadedBundleFromClass:(BOOL)a3
{
  self->_loadedBundleFromClass = a3;
}

- (NSString)alternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName;
}

- (void)setAlternativeLocalizedStringTableName:(id)a3
{
}

- (NSString)fullname
{
  return self->_fullname;
}

- (void)setFullname:(id)a3
{
}

- (NSString)effectiveOptionName
{
  return self->_effectiveOptionName;
}

- (void)setEffectiveOptionName:(id)a3
{
}

- (NSString)effectiveCollectionName
{
  return self->_effectiveCollectionName;
}

- (void)setEffectiveCollectionName:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveCollectionName, 0);
  objc_storeStrong((id *)&self->_effectiveOptionName, 0);
  objc_storeStrong((id *)&self->_fullname, 0);
  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, 0);
  objc_storeStrong((id *)&self->_sourceBundle, 0);
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_desiredPosition, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_optionName, 0);
  objc_storeStrong((id *)&self->_localizedCollectionName, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (id)legacyJSONRepresentationForFace:(id)a3
{
  id v4 = a3;
  if ([v4 requiresPigmentEditOption])
  {
    unint64_t v5 = 0;
  }
  else
  {
    char v6 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    char v7 = [v6 device];

    id v8 = objc_msgSend((id)objc_msgSend(v4, "_optionClassForCustomEditMode:", 10), "legacyOptionWithPigmentEditOption:forDevice:", self, v7);
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      unint64_t v5 = [v8 JSONObjectRepresentation];
    }
    else
    {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

@end