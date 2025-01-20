@interface PUINumberingSystem
+ (BOOL)supportsSecureCoding;
+ (id)allNumberingSystemTypes;
+ (id)allNumberingSystems;
+ (id)numberingSystemDisplayFontForFont:(id)a3;
+ (id)numberingSystemForType:(id)a3;
+ (id)supportedNumberingSystemTypes;
+ (id)supportedNumberingSystems;
+ (id)systemDefaultNumberingSystem;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (NSString)localizedDisplayName;
- (NSString)systemName;
- (NSString)type;
- (PUINumberingSystem)init;
- (PUINumberingSystem)initWithCoder:(id)a3;
- (PUINumberingSystem)initWithNumberingSystemType:(id)a3;
- (UIImage)image;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUINumberingSystem

+ (id)systemDefaultNumberingSystem
{
  v3 = PUISystemDefaultNumberingSystemType();
  v4 = [a1 numberingSystemForType:v3];

  return v4;
}

+ (id)allNumberingSystemTypes
{
  if (allNumberingSystemTypes_onceToken != -1) {
    dispatch_once(&allNumberingSystemTypes_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)allNumberingSystemTypes_allNumberingSystems;
  return v2;
}

void __45__PUINumberingSystem_allNumberingSystemTypes__block_invoke()
{
  v6[16] = *MEMORY[0x263EF8340];
  v6[0] = @"latn";
  v6[1] = @"arab";
  v6[2] = @"deva";
  v6[3] = @"khmr";
  v6[4] = @"mymr";
  v6[5] = @"beng";
  v6[6] = @"guru";
  v6[7] = @"gujr";
  v6[8] = @"taml";
  v6[9] = @"telu";
  v6[10] = @"mlym";
  v6[11] = @"knda";
  v6[12] = @"orya";
  v6[13] = @"olck";
  v6[14] = @"mtei";
  v6[15] = @"arabext";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:16];
  v1 = (void *)[v0 sortedArrayUsingComparator:&__block_literal_global_19];
  v2 = (objc_class *)MEMORY[0x263EFF9D8];
  id v3 = v1;
  uint64_t v4 = [[v2 alloc] initWithArray:v3];

  v5 = (void *)allNumberingSystemTypes_allNumberingSystems;
  allNumberingSystemTypes_allNumberingSystems = v4;
}

+ (id)allNumberingSystems
{
  id v3 = [a1 allNumberingSystemTypes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__PUINumberingSystem_allNumberingSystems__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  uint64_t v4 = objc_msgSend(v3, "bs_map:", v6);

  return v4;
}

uint64_t __41__PUINumberingSystem_allNumberingSystems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberingSystemForType:a2];
}

+ (id)supportedNumberingSystemTypes
{
  if (supportedNumberingSystemTypes_onceToken != -1) {
    dispatch_once(&supportedNumberingSystemTypes_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)supportedNumberingSystemTypes_allNumberingSystems;
  return v2;
}

void __51__PUINumberingSystem_supportedNumberingSystemTypes__block_invoke()
{
  v10[5] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263EFF980]);
  v10[0] = @"latn";
  v10[1] = @"arab";
  v10[2] = @"deva";
  v10[3] = @"khmr";
  v10[4] = @"mymr";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:5];
  v2 = (void *)[v0 initWithArray:v1];

  if (_os_feature_enabled_impl())
  {
    v9[0] = @"beng";
    v9[1] = @"guru";
    v9[2] = @"gujr";
    v9[3] = @"telu";
    v9[4] = @"mlym";
    v9[5] = @"knda";
    v9[6] = @"orya";
    v9[7] = @"olck";
    v9[8] = @"mtei";
    v9[9] = @"arabext";
    id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:10];
    [v2 addObjectsFromArray:v3];
  }
  uint64_t v4 = (void *)[v2 sortedArrayUsingComparator:&__block_literal_global_19];
  v5 = (objc_class *)MEMORY[0x263EFF9D8];
  id v6 = v4;
  uint64_t v7 = [[v5 alloc] initWithArray:v6];

  v8 = (void *)supportedNumberingSystemTypes_allNumberingSystems;
  supportedNumberingSystemTypes_allNumberingSystems = v7;
}

+ (id)supportedNumberingSystems
{
  id v3 = [a1 supportedNumberingSystemTypes];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__PUINumberingSystem_supportedNumberingSystems__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  uint64_t v4 = objc_msgSend(v3, "bs_map:", v6);

  return v4;
}

uint64_t __47__PUINumberingSystem_supportedNumberingSystems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberingSystemForType:a2];
}

+ (id)numberingSystemForType:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__PUINumberingSystem_numberingSystemForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = numberingSystemForType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&numberingSystemForType__onceToken, block);
  }
  v5 = [(id)numberingSystemForType__numberingSystemForType objectForKeyedSubscript:v4];

  return v5;
}

void __45__PUINumberingSystem_numberingSystemForType___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)numberingSystemForType__numberingSystemForType;
  numberingSystemForType__numberingSystemForType = v2;

  id v4 = [*(id *)(a1 + 32) allNumberingSystemTypes];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_76];
}

void __45__PUINumberingSystem_numberingSystemForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[PUINumberingSystem alloc] initWithNumberingSystemType:v2];
  [(id)numberingSystemForType__numberingSystemForType setObject:v3 forKeyedSubscript:v2];
}

+ (id)numberingSystemDisplayFontForFont:(id)a3
{
  if (a3) {
    [a3 fontWithSize:50.0];
  }
  else {
  uint64_t v3 = [MEMORY[0x263F1C658] systemFontOfSize:50.0];
  }
  return v3;
}

- (PUINumberingSystem)initWithNumberingSystemType:(id)a3
{
  id v4 = (__CFString *)a3;
  v70.receiver = self;
  v70.super_class = (Class)PUINumberingSystem;
  v5 = [(PUINumberingSystem *)&v70 init];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() allNumberingSystemTypes];
    char v7 = [v6 containsObject:v4];

    if ((v7 & 1) == 0)
    {

      id v4 = @"latn";
    }
    v8 = (void *)MEMORY[0x263F1C6B0];
    v9 = PUIBundle();
    uint64_t v10 = [v8 imageNamed:@"textformat.12" inBundle:v9 withConfiguration:0];
    image = v5->_image;
    v5->_image = (UIImage *)v10;

    v12 = PUIBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"ARABIC_NUMBERS" value:&stru_270801C00 table:0];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v13;

    objc_storeStrong((id *)&v5->_type, v4);
    objc_storeStrong((id *)&v5->_systemName, v4);
    v15 = [MEMORY[0x263EFF960] currentLocale];
    v16 = [v15 localeIdentifier];

    v17 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v16];
    v18 = (void *)[v17 mutableCopy];

    [v18 setObject:v5->_systemName forKey:@"numbers"];
    v19 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v18];
    uint64_t v20 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v19];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v20;

    if ([(__CFString *)v4 isEqualToString:@"latn"]) {
      goto LABEL_36;
    }
    if ([(__CFString *)v4 isEqualToString:@"arab"])
    {
      v22 = PUIBundle();
      v23 = v22;
      v24 = @"ARABIC_INDIC_NUMBERS";
    }
    else
    {
      if ([(__CFString *)v4 isEqualToString:@"deva"])
      {
        v29 = PUIBundle();
        uint64_t v30 = [v29 localizedStringForKey:@"DEVANAGARI_NUMBERS" value:&stru_270801C00 table:0];
        v31 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v30;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.hi";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"khmr"])
      {
        v32 = PUIBundle();
        uint64_t v33 = [v32 localizedStringForKey:@"KHMER_NUMBERS" value:&stru_270801C00 table:0];
        v34 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v33;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.km";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"mymr"])
      {
        v35 = PUIBundle();
        uint64_t v36 = [v35 localizedStringForKey:@"BURMESE_NUMBERS" value:&stru_270801C00 table:0];
        v37 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v36;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.my";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"beng"])
      {
        v38 = PUIBundle();
        uint64_t v39 = [v38 localizedStringForKey:@"BANGLA_NUMBERS" value:&stru_270801C00 table:0];
        v40 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v39;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.bn";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"guru"])
      {
        v41 = PUIBundle();
        uint64_t v42 = [v41 localizedStringForKey:@"GURMUKHI_NUMBERS" value:&stru_270801C00 table:0];
        v43 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v42;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.pa";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"gujr"])
      {
        v44 = PUIBundle();
        uint64_t v45 = [v44 localizedStringForKey:@"GUJARATI_NUMBERS" value:&stru_270801C00 table:0];
        v46 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v45;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.gu";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"taml"])
      {
        v47 = PUIBundle();
        uint64_t v48 = [v47 localizedStringForKey:@"TAMIL_NUMBERS" value:&stru_270801C00 table:0];
        v49 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v48;

LABEL_35:
LABEL_36:

        goto LABEL_37;
      }
      if ([(__CFString *)v4 isEqualToString:@"telu"])
      {
        v50 = PUIBundle();
        uint64_t v51 = [v50 localizedStringForKey:@"TELUGU_NUMBERS" value:&stru_270801C00 table:0];
        v52 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v51;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.te";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"mlym"])
      {
        v53 = PUIBundle();
        uint64_t v54 = [v53 localizedStringForKey:@"MALAYALAM_NUMBERS" value:&stru_270801C00 table:0];
        v55 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v54;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.ml";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"knda"])
      {
        v56 = PUIBundle();
        uint64_t v57 = [v56 localizedStringForKey:@"KANNADA_NUMBERS" value:&stru_270801C00 table:0];
        v58 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v57;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.kn";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"orya"])
      {
        v59 = PUIBundle();
        uint64_t v60 = [v59 localizedStringForKey:@"ODIA_NUMBERS" value:&stru_270801C00 table:0];
        v61 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v60;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.or";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"olck"])
      {
        v62 = PUIBundle();
        uint64_t v63 = [v62 localizedStringForKey:@"OLCHIKI_NUMBERS" value:&stru_270801C00 table:0];
        v64 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v63;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.sat";
        goto LABEL_34;
      }
      if ([(__CFString *)v4 isEqualToString:@"mtei"])
      {
        v65 = PUIBundle();
        uint64_t v66 = [v65 localizedStringForKey:@"MEITEI_NUMBERS" value:&stru_270801C00 table:0];
        v67 = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v66;

        v27 = (void *)MEMORY[0x263F1C6B0];
        v28 = @"textformat.numbers.mni";
        goto LABEL_34;
      }
      if (![(__CFString *)v4 isEqualToString:@"arabext"]) {
        goto LABEL_36;
      }
      v22 = PUIBundle();
      v23 = v22;
      v24 = @"URDU_NUMBERS";
    }
    uint64_t v25 = [v22 localizedStringForKey:v24 value:&stru_270801C00 table:0];
    v26 = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v25;

    v27 = (void *)MEMORY[0x263F1C6B0];
    v28 = @"textformat.numbers.ar";
LABEL_34:
    uint64_t v68 = [v27 systemImageNamed:v28];
    v47 = v5->_image;
    v5->_image = (UIImage *)v68;
    goto LABEL_35;
  }
LABEL_37:

  return v5;
}

- (PUINumberingSystem)init
{
  uint64_t v3 = objc_opt_class();
  id v4 = PUISystemDefaultNumberingSystemType();
  v5 = [v3 numberingSystemForType:v4];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NSLocale *)self->_locale hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUINumberingSystem *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v18 = 1;
  }
  else if (v4)
  {
    id v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v8 = v5;
    }
    else {
      v8 = 0;
    }
    v9 = v8;

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v10 = [(PUINumberingSystem *)v5 type];
    v11 = [(PUINumberingSystem *)self type];
    int v12 = [v10 isEqualToString:v11];

    if (!v12) {
      goto LABEL_11;
    }
    uint64_t v13 = [(PUINumberingSystem *)v5 localizedDisplayName];
    v14 = [(PUINumberingSystem *)self localizedDisplayName];
    int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      v16 = [(PUINumberingSystem *)v5 locale];
      v17 = [(PUINumberingSystem *)self locale];
      char v18 = [v16 isEqual:v17];
    }
    else
    {
LABEL_11:
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_type withName:@"type"];
  [v3 appendString:self->_localizedDisplayName withName:@"localizedDisplayName"];
  id v4 = (id)[v3 appendBool:self->_image != 0 withName:@"hasImage" ifEqualTo:0];
  id v5 = (id)[v3 appendObject:self->_locale withName:@"locale"];
  id v6 = [v3 build];

  return v6;
}

- (PUINumberingSystem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"_type"];

  char v7 = [(PUINumberingSystem *)self initWithNumberingSystemType:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)type
{
  return self->_type;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)systemName
{
  return self->_systemName;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end