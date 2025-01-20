@interface PUIStylePickerConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultStylePickerConfigurationForRole:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStylePickerConfiguration:(id)a3;
- (NSDirectionalEdgeInsets)edgeInsets;
- (NSString)defaultRole;
- (NSString)description;
- (NSString)previewTextString;
- (PUIStyleConfiguration)styleConfiguration;
- (PUIStylePickerComponents)components;
- (PUIStylePickerConfiguration)init;
- (PUIStylePickerConfiguration)initWithCoder:(id)a3;
- (PUIStylePickerConfiguration)initWithPreviewTextString:(id)a3 defaultRole:(id)a4 components:(id)a5 defaultContentsLuminance:(double)a6 styleConfiguration:(id)a7 textLayoutConfiguration:(id)a8;
- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration;
- (PUITextLayoutConfiguration)textLayoutConfiguration;
- (double)defaultContentsLuminance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setComponents:(id)a3;
- (void)setDefaultContentsLuminance:(double)a3;
- (void)setDefaultRole:(id)a3;
- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setHomeScreenConfiguration:(id)a3;
- (void)setPreviewTextString:(id)a3;
- (void)setStyleConfiguration:(id)a3;
- (void)setTextLayoutConfiguration:(id)a3;
@end

@implementation PUIStylePickerConfiguration

+ (id)defaultStylePickerConfigurationForRole:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = (void *)[v4 initWithPreviewTextString:0 defaultRole:v3 components:v5 defaultContentsLuminance:v6 styleConfiguration:v7 textLayoutConfiguration:0.5];

  return v8;
}

- (PUIStylePickerConfiguration)initWithPreviewTextString:(id)a3 defaultRole:(id)a4 components:(id)a5 defaultContentsLuminance:(double)a6 styleConfiguration:(id)a7 textLayoutConfiguration:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  char v20 = [v17 containsComponent:4];
  if (v18 && (v20 & 1) == 0)
  {
    uint64_t v21 = [v17 componentsByAddingComponent:4];

    id v17 = (id)v21;
  }
  char v22 = [v17 containsComponent:1];
  if (v19 && (v22 & 1) == 0)
  {
    uint64_t v23 = [v17 componentsByAddingComponent:1];

    id v17 = (id)v23;
  }
  if (v17)
  {
    v33.receiver = self;
    v33.super_class = (Class)PUIStylePickerConfiguration;
    v24 = [(PUIStylePickerConfiguration *)&v33 init];
    if (v24)
    {
      uint64_t v25 = [v15 copy];
      previewTextString = v24->_previewTextString;
      v24->_previewTextString = (NSString *)v25;

      v24->_defaultContentsLuminance = a6;
      uint64_t v27 = [v18 copy];
      styleConfiguration = v24->_styleConfiguration;
      v24->_styleConfiguration = (PUIStyleConfiguration *)v27;

      uint64_t v29 = [v19 copy];
      textLayoutConfiguration = v24->_textLayoutConfiguration;
      v24->_textLayoutConfiguration = (PUITextLayoutConfiguration *)v29;

      objc_storeStrong((id *)&v24->_components, v17);
      *(_OWORD *)&v24->_edgeInsets.top = 0u;
      *(_OWORD *)&v24->_edgeInsets.bottom = 0u;
    }

    return v24;
  }
  else
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"components != 0"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIStylePickerConfiguration initWithPreviewTextString:defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:](a2, (uint64_t)self, (uint64_t)v32);
    }
    [v32 UTF8String];
    result = (PUIStylePickerConfiguration *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIStylePickerConfiguration)init
{
  id v3 = objc_opt_new();
  id v4 = [(PUIStylePickerConfiguration *)self initWithPreviewTextString:0 defaultRole:0 components:v3 defaultContentsLuminance:0 styleConfiguration:0 textLayoutConfiguration:0.5];

  return v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __42__PUIStylePickerConfiguration_description__block_invoke;
  v10 = &unk_265471108;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __42__PUIStylePickerConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToStream:*(void *)(a1 + 40)];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIStylePickerConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PUIStylePickerConfiguration *)self isEqualToStylePickerConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToStylePickerConfiguration:(id)a3
{
  id v4 = (PUIStylePickerConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v37 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_19;
    }
    BOOL v6 = [(PUIStylePickerConfiguration *)v4 components];
    uint64_t v7 = [(PUIStylePickerConfiguration *)self components];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_19;
    }
    v9 = [(PUIStylePickerConfiguration *)v5 previewTextString];
    v10 = [(PUIStylePickerConfiguration *)self previewTextString];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_19;
    }
    [(PUIStylePickerConfiguration *)v5 defaultContentsLuminance];
    double v13 = v12 == 0.0 ? 1.0 : 0.0;
    [(PUIStylePickerConfiguration *)self defaultContentsLuminance];
    if (v14 == v13) {
      goto LABEL_19;
    }
    id v15 = [(PUIStylePickerConfiguration *)v5 textLayoutConfiguration];
    id v16 = [(PUIStylePickerConfiguration *)self textLayoutConfiguration];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
    id v18 = [(PUIStylePickerConfiguration *)v5 styleConfiguration];
    id v19 = [(PUIStylePickerConfiguration *)self styleConfiguration];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_19;
    }
    uint64_t v21 = [(PUIStylePickerConfiguration *)v5 homeScreenConfiguration];
    char v22 = [(PUIStylePickerConfiguration *)self homeScreenConfiguration];
    int v23 = [v21 isEqual:v22];

    if (v23)
    {
      [(PUIStylePickerConfiguration *)v5 edgeInsets];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      [(PUIStylePickerConfiguration *)self edgeInsets];
      BOOL v35 = v27 == v34;
      if (v25 != v36) {
        BOOL v35 = 0;
      }
      if (v31 != v33) {
        BOOL v35 = 0;
      }
      BOOL v37 = v29 == v32 && v35;
    }
    else
    {
LABEL_19:
      BOOL v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PUIStylePickerComponents *)self->_components hash];
  id v4 = [NSNumber numberWithDouble:self->_defaultContentsLuminance];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v3 ^ [(PUITextLayoutConfiguration *)self->_textLayoutConfiguration hash];
  unint64_t v7 = v5 ^ v6 ^ [(PUIStyleConfiguration *)self->_styleConfiguration hash];
  NSUInteger v8 = [(NSString *)self->_previewTextString hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_defaultRole hash];
  v10 = NSStringFromDirectionalEdgeInsets(self->_edgeInsets);
  uint64_t v11 = v9 ^ [v10 hash];
  unint64_t v12 = v7 ^ v11 ^ [(PUIStylePickerHomeScreenConfiguration *)self->_homeScreenConfiguration hash];

  return v12;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v17 = a3;
  id v4 = (id)[v17 appendObject:self->_previewTextString withName:@"_previewTextString"];
  id v5 = (id)[v17 appendObject:self->_components withName:@"_components"];
  id v6 = (id)[v17 appendDouble:@"_defaultContentsLuminance" withName:5 decimalPrecision:self->_defaultContentsLuminance];
  id v7 = (id)[v17 appendObject:self->_textLayoutConfiguration withName:@"_textLayoutConfiguration"];
  id v8 = (id)[v17 appendObject:self->_styleConfiguration withName:@"_styleConfiguration"];
  float64x2_t v9 = *(float64x2_t *)&self->_edgeInsets.top;
  float64x2_t v10 = *(float64x2_t *)&self->_edgeInsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*MEMORY[0x263F1C228], v9), (int32x4_t)vceqq_f64(*(float64x2_t *)(MEMORY[0x263F1C228] + 16), v10))), 0xFuLL))) & 1) == 0)
  {
    CGFloat leading = self->_edgeInsets.leading;
    CGFloat trailing = self->_edgeInsets.trailing;
    double v13 = NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)v9.f64);
    id v14 = (id)[v17 appendObject:v13 withName:@"_edgeInsets"];
  }
  id v15 = (id)[v17 appendObject:self->_styleConfiguration withName:@"_styleConfiguration"];
  if ([(PUIStylePickerComponents *)self->_components containsComponent:32]) {
    id v16 = (id)[v17 appendObject:self->_homeScreenConfiguration withName:@"_homeScreenConfiguration"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(PUIStylePickerConfiguration *)self previewTextString];
  [v4 setPreviewTextString:v5];

  [(PUIStylePickerConfiguration *)self defaultContentsLuminance];
  objc_msgSend(v4, "setDefaultContentsLuminance:");
  id v6 = [(PUIStylePickerConfiguration *)self styleConfiguration];
  [v4 setStyleConfiguration:v6];

  id v7 = [(PUIStylePickerConfiguration *)self textLayoutConfiguration];
  [v4 setTextLayoutConfiguration:v7];

  id v8 = [(PUIStylePickerConfiguration *)self defaultRole];
  [v4 setDefaultRole:v8];

  float64x2_t v9 = [(PUIStylePickerConfiguration *)self components];
  [v4 setComponents:v9];

  [(PUIStylePickerConfiguration *)self edgeInsets];
  objc_msgSend(v4, "setEdgeInsets:");
  float64x2_t v10 = [(PUIStylePickerConfiguration *)self homeScreenConfiguration];
  [v4 setHomeScreenConfiguration:v10];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(PUIStylePickerConfiguration *)+[PUIMutableStylePickerConfiguration allocWithZone:a3] init];
  id v5 = [(PUIStylePickerConfiguration *)self previewTextString];
  [(PUIStylePickerConfiguration *)v4 setPreviewTextString:v5];

  [(PUIStylePickerConfiguration *)self defaultContentsLuminance];
  -[PUIStylePickerConfiguration setDefaultContentsLuminance:](v4, "setDefaultContentsLuminance:");
  id v6 = [(PUIStylePickerConfiguration *)self styleConfiguration];
  [(PUIStylePickerConfiguration *)v4 setStyleConfiguration:v6];

  id v7 = [(PUIStylePickerConfiguration *)self textLayoutConfiguration];
  [(PUIStylePickerConfiguration *)v4 setTextLayoutConfiguration:v7];

  id v8 = [(PUIStylePickerConfiguration *)self defaultRole];
  [(PUIStylePickerConfiguration *)v4 setDefaultRole:v8];

  float64x2_t v9 = [(PUIStylePickerConfiguration *)self components];
  [(PUIStylePickerConfiguration *)v4 setComponents:v9];

  [(PUIStylePickerConfiguration *)self edgeInsets];
  -[PUIStylePickerConfiguration setEdgeInsets:](v4, "setEdgeInsets:");
  float64x2_t v10 = [(PUIStylePickerConfiguration *)self homeScreenConfiguration];
  [(PUIStylePickerConfiguration *)v4 setHomeScreenConfiguration:v10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStylePickerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_ui_decodeCGFloatForKey:", @"_defaultContentsLuminance");
  double v6 = v5;
  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"_defaultRole"];

  float64x2_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_components"];
  float64x2_t v10 = self;
  uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"_previewTextString"];

  unint64_t v12 = self;
  double v13 = [v4 decodeObjectOfClass:v12 forKey:@"_styleConfiguration"];

  id v14 = self;
  id v15 = [v4 decodeObjectOfClass:v14 forKey:@"_textLayoutConfiguration"];

  id v16 = self;
  id v17 = [v4 decodeObjectOfClass:v16 forKey:@"_homeScreenConfiguration"];

  id v18 = [(PUIStylePickerConfiguration *)self initWithPreviewTextString:v11 defaultRole:v8 components:v9 defaultContentsLuminance:v13 styleConfiguration:v15 textLayoutConfiguration:v6];
  if (v18)
  {
    id v19 = self;
    int v20 = [v4 decodeObjectOfClass:v19 forKey:@"_edgeInsets"];
    v18->_edgeInsets = NSDirectionalEdgeInsetsFromString(v20);

    objc_storeStrong((id *)&v18->_homeScreenConfiguration, v17);
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  double defaultContentsLuminance = self->_defaultContentsLuminance;
  id v5 = a3;
  objc_msgSend(v5, "_ui_encodeCGFloat:forKey:", @"_defaultContentsLuminance", defaultContentsLuminance);
  double v6 = [(PUIStylePickerConfiguration *)self defaultRole];
  [v5 encodeObject:v6 forKey:@"_defaultRole"];

  id v7 = [(PUIStylePickerConfiguration *)self previewTextString];
  [v5 encodeObject:v7 forKey:@"_previewTextString"];

  [v5 encodeObject:self->_components forKey:@"_components"];
  id v8 = [(PUIStylePickerConfiguration *)self styleConfiguration];
  [v5 encodeObject:v8 forKey:@"_styleConfiguration"];

  float64x2_t v9 = [(PUIStylePickerConfiguration *)self textLayoutConfiguration];
  [v5 encodeObject:v9 forKey:@"_textLayoutConfiguration"];

  [(PUIStylePickerConfiguration *)self edgeInsets];
  float64x2_t v10 = NSStringFromDirectionalEdgeInsets(v13);
  [v5 encodeObject:v10 forKey:@"_edgeInsets"];

  id v11 = [(PUIStylePickerConfiguration *)self homeScreenConfiguration];
  [v5 encodeObject:v11 forKey:@"_homeScreenConfiguration"];
}

- (NSString)previewTextString
{
  return self->_previewTextString;
}

- (void)setPreviewTextString:(id)a3
{
}

- (double)defaultContentsLuminance
{
  return self->_defaultContentsLuminance;
}

- (void)setDefaultContentsLuminance:(double)a3
{
  self->_double defaultContentsLuminance = a3;
}

- (NSString)defaultRole
{
  return self->_defaultRole;
}

- (void)setDefaultRole:(id)a3
{
}

- (PUIStylePickerComponents)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (PUIStyleConfiguration)styleConfiguration
{
  return self->_styleConfiguration;
}

- (void)setStyleConfiguration:(id)a3
{
}

- (PUITextLayoutConfiguration)textLayoutConfiguration
{
  return self->_textLayoutConfiguration;
}

- (void)setTextLayoutConfiguration:(id)a3
{
}

- (NSDirectionalEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double leading = self->_edgeInsets.leading;
  double bottom = self->_edgeInsets.bottom;
  double trailing = self->_edgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (void)setHomeScreenConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_textLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_styleConfiguration, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_defaultRole, 0);
  objc_storeStrong((id *)&self->_previewTextString, 0);
}

- (void)initWithPreviewTextString:(uint64_t)a3 defaultRole:components:defaultContentsLuminance:styleConfiguration:textLayoutConfiguration:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  float64x2_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"PUIStylePickerConfiguration.m";
  __int16 v16 = 1024;
  int v17 = 84;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A0AF000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end