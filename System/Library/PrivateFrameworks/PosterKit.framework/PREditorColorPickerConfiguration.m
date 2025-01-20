@interface PREditorColorPickerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)includesObjectsOfTypePRPickerColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsSlider;
- (BOOL)showsSuggestedColorItem;
- (NSArray)suggestedColors;
- (NSString)description;
- (NSString)identifier;
- (NSString)prompt;
- (PREditorColorPalette)colorPalette;
- (PREditorColorPickerConfiguration)init;
- (PREditorColorPickerConfiguration)initWithBSXPCCoder:(id)a3;
- (PREditorColorPickerConfiguration)initWithCoder:(id)a3;
- (PREditorColorPickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedColor:(id)a5 suggestedColors:(id)a6 colorPalette:(id)a7 colorWellDisplayMode:(unint64_t)a8 showsSlider:(BOOL)a9 context:(unint64_t)a10;
- (PRPosterColor)suggestedColor;
- (UIPopoverPresentationControllerSourceItem)colorPickerSourceItem;
- (UIView)colorPickerSourceView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectedColor;
- (unint64_t)colorWellDisplayMode;
- (unint64_t)context;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)didUpdateColors;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setColorPickerSourceItem:(id)a3;
- (void)setColorWellDisplayMode:(unint64_t)a3;
- (void)setContext:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setSelectedColor:(id)a3;
- (void)setShowsSlider:(BOOL)a3;
- (void)setShowsSuggestedColorItem:(BOOL)a3;
- (void)setSuggestedColor:(id)a3;
- (void)setSuggestedColors:(id)a3;
@end

@implementation PREditorColorPickerConfiguration

- (PREditorColorPickerConfiguration)init
{
  LOBYTE(v3) = 1;
  return [(PREditorColorPickerConfiguration *)self initWithIdentifier:0 prompt:0 selectedColor:0 suggestedColors:0 colorPalette:0 colorWellDisplayMode:2 showsSlider:v3 context:0];
}

- (PREditorColorPickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedColor:(id)a5 suggestedColors:(id)a6 colorPalette:(id)a7 colorWellDisplayMode:(unint64_t)a8 showsSlider:(BOOL)a9 context:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v64.receiver = self;
  v64.super_class = (Class)PREditorColorPickerConfiguration;
  v22 = [(PREditorColorPickerConfiguration *)&v64 init];
  if (!v22) {
    goto LABEL_23;
  }
  if (v17) {
    v23 = (NSString *)v17;
  }
  else {
    v23 = (NSString *)[@"default" copy];
  }
  identifier = v22->_identifier;
  v22->_identifier = v23;

  unint64_t v55 = a8;
  v25 = a2;
  if (v18)
  {
    v26 = (NSString *)v18;
    prompt = v22->_prompt;
    v22->_prompt = v26;
  }
  else
  {
    prompt = PRBundle();
    uint64_t v28 = [prompt localizedStringForKey:@"EDIT_COLOR_PICKER_DEFAULT_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];
    v29 = v22->_prompt;
    v22->_prompt = (NSString *)v28;
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v31 = objc_opt_isKindOfClass();
  if (!v19)
  {
    v34 = 0;
    char v54 = 1;
LABEL_14:
    uint64_t v35 = [(PRPosterColor *)v34 copy];
    id selectedColor = v22->_selectedColor;
    v22->_id selectedColor = (id)v35;

    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 0;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __146__PREditorColorPickerConfiguration_initWithIdentifier_prompt_selectedColor_suggestedColors_colorPalette_colorWellDisplayMode_showsSlider_context___block_invoke;
    v56[3] = &unk_1E54DAB18;
    v58 = &v60;
    v59 = v25;
    v37 = v22;
    v57 = v37;
    v38 = objc_msgSend(v20, "bs_compactMap:", v56);
    uint64_t v39 = [v38 copy];
    suggestedColors = v37->_suggestedColors;
    v37->_suggestedColors = (NSArray *)v39;

    if (v21)
    {
      v41 = v21;
      id v42 = v18;
      id v43 = v17;
      id v44 = v20;
      v45 = v41;
      v46 = v41;
    }
    else
    {
      v46 = +[PREditorColorPalette extendedPalette];
      v45 = 0;
      id v42 = v18;
      id v43 = v17;
      id v44 = v20;
    }
    colorPalette = v37->_colorPalette;
    v37->_colorPalette = v46;

    v37->_colorWellDisplayMode = v55;
    v37->_showsSlider = a9;
    v37->_context = a10;
    if (v54)
    {
      char v48 = 1;
      id v20 = v44;
      id v17 = v43;
      id v18 = v42;
    }
    else
    {
      id v20 = v44;
      id v18 = v42;
      if (!*((unsigned char *)v61 + 24))
      {
        id v21 = v45;
        char v48 = [v45 includesObjectsOfTypePRPosterColor];
        id v17 = v43;
        goto LABEL_22;
      }
      char v48 = 1;
      id v17 = v43;
    }
    id v21 = v45;
LABEL_22:
    v37->_includesObjectsOfTypePRPickerColor = v48;
    colorPickerSourceView = v37->_colorPickerSourceView;
    v37->_colorPickerSourceView = 0;

    colorPickerSourceItem = v37->_colorPickerSourceItem;
    v37->_colorPickerSourceItem = 0;

    _Block_object_dispose(&v60, 8);
LABEL_23:

    return v22;
  }
  int v32 = v31;
  objc_opt_class();
  char v33 = objc_opt_isKindOfClass();
  if ((isKindOfClass | v32))
  {
    char v54 = v33;
    if (isKindOfClass) {
      v34 = (PRPosterColor *)v19;
    }
    else {
      v34 = [[PRPosterColor alloc] initWithColor:v19];
    }
    goto LABEL_14;
  }
  v52 = [NSString stringWithFormat:@"Unexpected object type provided for [PREditorColorPickerConfiguration selectedColor]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PREditorColorPickerConfiguration initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:](v25, (uint64_t)v22, (uint64_t)v52);
  }
  [v52 UTF8String];
  result = (PREditorColorPickerConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

PRPosterColor *__146__PREditorColorPickerConfiguration_initWithIdentifier_prompt_selectedColor_suggestedColors_colorPalette_colorWellDisplayMode_showsSlider_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v4 = (PRPosterColor *)v3;
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[PRPosterColor alloc] initWithColor:v3];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)setSelectedColor:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v6 = objc_opt_isKindOfClass();
  if (!v12)
  {
    v8 = 0;
LABEL_8:
    v9 = (void *)[(PRPosterColor *)v8 copy];
    id selectedColor = self->_selectedColor;
    self->_id selectedColor = v9;

    [(PREditorColorPickerConfiguration *)self didUpdateColors];

    return;
  }
  if ((isKindOfClass | v6))
  {
    if (isKindOfClass) {
      v7 = (PRPosterColor *)v12;
    }
    else {
      v7 = [[PRPosterColor alloc] initWithColor:v12];
    }
    v8 = v7;
    goto LABEL_8;
  }
  v11 = [NSString stringWithFormat:@"Unexpected object type provided for [PREditorColorPickerConfiguration selectedColor]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(PREditorColorPickerConfiguration *)a2 setSelectedColor:(uint64_t)v11];
  }
  [v11 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setSuggestedColor:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(PRPosterColor *)self->_suggestedColor isEquivalentToColor:v10];
  id v5 = v10;
  if (!v4)
  {
    int v6 = (PRPosterColor *)v10;
    v7 = v6;
    if (v6 && ![(PRPosterColor *)v6 isSuggested])
    {
      uint64_t v8 = [(PRPosterColor *)v7 copyAsSuggestedColor];

      v7 = (PRPosterColor *)v8;
    }
    suggestedColor = self->_suggestedColor;
    self->_suggestedColor = v7;

    self->_showsSuggestedColorItem = v7 != 0;
    id v5 = v10;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setSuggestedColors:(id)a3
{
  id v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PREditorColorPickerConfiguration_setSuggestedColors___block_invoke;
  v9[3] = &unk_1E54DAB18;
  v9[5] = v10;
  v9[6] = a2;
  v9[4] = self;
  int v6 = objc_msgSend(v5, "bs_compactMap:", v9);
  v7 = (NSArray *)[v6 copy];
  suggestedColors = self->_suggestedColors;
  self->_suggestedColors = v7;

  [(PREditorColorPickerConfiguration *)self didUpdateColors];
  _Block_object_dispose(v10, 8);
}

PRPosterColor *__55__PREditorColorPickerConfiguration_setSuggestedColors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    BOOL v4 = (PRPosterColor *)v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [[PRPosterColor alloc] initWithColor:v3];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)setColorPalette:(id)a3
{
  id v5 = (PREditorColorPalette *)a3;
  p_colorPalette = &self->_colorPalette;
  if (self->_colorPalette != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_colorPalette, a3);
    p_colorPalette = (PREditorColorPalette **)[(PREditorColorPickerConfiguration *)self didUpdateColors];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_colorPalette, v5);
}

- (void)didUpdateColors
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_selectedColor)
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    int isKindOfClass = 1;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = self->_suggestedColors;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        v7 |= objc_opt_isKindOfClass();
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }

  BOOL v10 = ((isKindOfClass | v7) & 1) != 0
     || [(PREditorColorPalette *)self->_colorPalette includesObjectsOfTypePRPosterColor];
  self->_includesObjectsOfTypePRPickerColor = v10;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PREditorColorPickerConfiguration *)a3;
  if (self == v4)
  {
    char v31 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v7 = v4;
      uint64_t v8 = [(PREditorColorPickerConfiguration *)self identifier];
      v9 = [(PREditorColorPickerConfiguration *)v7 identifier];
      int v10 = BSEqualStrings();

      if (!v10) {
        goto LABEL_15;
      }
      long long v11 = [(PREditorColorPickerConfiguration *)self prompt];
      long long v12 = [(PREditorColorPickerConfiguration *)v7 prompt];
      int v13 = BSEqualStrings();

      if (!v13) {
        goto LABEL_15;
      }
      long long v14 = [(PREditorColorPickerConfiguration *)self colorPalette];
      v15 = [(PREditorColorPickerConfiguration *)v7 colorPalette];
      int v16 = BSEqualObjects();

      if (!v16) {
        goto LABEL_15;
      }
      id v17 = [(PREditorColorPickerConfiguration *)self selectedColor];
      id v18 = [(PREditorColorPickerConfiguration *)v7 selectedColor];
      int v19 = BSEqualObjects();

      if (!v19) {
        goto LABEL_15;
      }
      id v20 = [(PREditorColorPickerConfiguration *)self suggestedColors];
      id v21 = [(PREditorColorPickerConfiguration *)v7 suggestedColors];
      int v22 = BSEqualObjects();

      if (!v22) {
        goto LABEL_15;
      }
      BOOL v23 = [(PREditorColorPickerConfiguration *)self showsSlider];
      if (v23 != [(PREditorColorPickerConfiguration *)v7 showsSlider]) {
        goto LABEL_15;
      }
      unint64_t v24 = [(PREditorColorPickerConfiguration *)self colorWellDisplayMode];
      if (v24 != [(PREditorColorPickerConfiguration *)v7 colorWellDisplayMode]) {
        goto LABEL_15;
      }
      unint64_t v25 = [(PREditorColorPickerConfiguration *)self context];
      if (v25 != [(PREditorColorPickerConfiguration *)v7 context]) {
        goto LABEL_15;
      }
      v26 = [(PREditorColorPickerConfiguration *)self colorPickerSourceView];
      v27 = [(PREditorColorPickerConfiguration *)v7 colorPickerSourceView];
      int v28 = BSEqualObjects();

      if (v28)
      {
        v29 = [(PREditorColorPickerConfiguration *)self colorPickerSourceItem];
        v30 = [(PREditorColorPickerConfiguration *)v7 colorPickerSourceItem];
        char v31 = BSEqualObjects();
      }
      else
      {
LABEL_15:
        char v31 = 0;
      }
    }
    else
    {
      char v31 = 0;
    }
  }

  return v31;
}

- (unint64_t)hash
{
  int v19 = [(PREditorColorPickerConfiguration *)self identifier];
  uint64_t v3 = [v19 hash];
  BOOL v4 = [(PREditorColorPickerConfiguration *)self prompt];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(PREditorColorPickerConfiguration *)self colorPalette];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(PREditorColorPickerConfiguration *)self selectedColor];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  int v10 = [(PREditorColorPickerConfiguration *)self suggestedColors];
  uint64_t v11 = v9 ^ [v10 hash];
  long long v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  uint64_t v13 = v11 ^ [v12 hash];
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"));
  uint64_t v15 = [v14 hash];
  int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __47__PREditorColorPickerConfiguration_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __47__PREditorColorPickerConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(PREditorColorPickerConfiguration *)self identifier];
  uint64_t v6 = [(PREditorColorPickerConfiguration *)self prompt];
  uint64_t v7 = [(PREditorColorPickerConfiguration *)self selectedColor];
  uint64_t v8 = [(PREditorColorPickerConfiguration *)self suggestedColors];
  uint64_t v9 = [(PREditorColorPickerConfiguration *)self colorPalette];
  unint64_t v10 = [(PREditorColorPickerConfiguration *)self colorWellDisplayMode];
  LOBYTE(v13) = [(PREditorColorPickerConfiguration *)self showsSlider];
  uint64_t v11 = objc_msgSend(v4, "initWithIdentifier:prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:", v5, v6, v7, v8, v9, v10, v13, -[PREditorColorPickerConfiguration context](self, "context"));

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PREditorColorPickerConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(PREditorColorPickerConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  uint64_t v6 = [(PREditorColorPickerConfiguration *)self selectedColor];
  [v11 encodeObject:v6 forKey:@"selectedColor"];

  uint64_t v7 = [(PREditorColorPickerConfiguration *)self suggestedColors];
  if (v7) {
    [v11 encodeObject:v7 forKey:@"suggestedColors"];
  }
  uint64_t v8 = [(PREditorColorPickerConfiguration *)self colorPalette];
  [v11 encodeObject:v8 forKey:@"palette"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v9 forKey:@"colorWellDisplayMode"];

  objc_msgSend(v11, "encodeBool:forKey:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), @"showsSlider");
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  [v11 encodeObject:v10 forKey:@"context"];
}

- (PREditorColorPickerConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = self;
  uint64_t v35 = [v3 decodeObjectOfClass:v4 forKey:@"identifier"];

  uint64_t v5 = self;
  uint64_t v6 = [v3 decodeObjectOfClass:v5 forKey:@"prompt"];

  uint64_t v7 = self;
  uint64_t v8 = [v3 decodeObjectOfClass:v7 forKey:@"selectedColor"];

  if (!v8)
  {
    uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selectedColor"];
    if (v9) {
      uint64_t v8 = [[PRPosterColor alloc] initWithColor:v9];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = self;
  id v12 = self;
  uint64_t v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, 0);
  long long v14 = [v3 decodeObjectOfClasses:v13 forKey:@"suggestedColors"];

  if (!v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    int v16 = self;
    unint64_t v17 = self;
    id v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, 0);
    int v19 = [v3 decodeObjectOfClasses:v18 forKey:@"suggestedColors"];

    if (v19)
    {
      long long v14 = objc_msgSend(v19, "bs_map:", &__block_literal_global_0);
    }
    else
    {
      long long v14 = 0;
    }
  }
  id v20 = self;
  id v21 = [v3 decodeObjectOfClass:v20 forKey:@"palette"];

  int v22 = self;
  BOOL v23 = [v3 decodeObjectOfClass:v22 forKey:@"colorWellDisplayMode"];

  if (v23)
  {
    unint64_t v24 = [v23 unsignedIntegerValue];
    if (v24 >= 2) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = v24;
    }
  }
  else
  {
    uint64_t v25 = 2;
  }
  char v26 = [v3 decodeBoolForKey:@"showsSlider"];
  v27 = self;
  int v28 = [v3 decodeObjectOfClass:v27 forKey:@"context"];

  if (v28)
  {
    unint64_t v29 = [v28 unsignedIntegerValue];
    if (v29 >= 3) {
      unint64_t v30 = 0;
    }
    else {
      unint64_t v30 = v29;
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  LOBYTE(v33) = v26;
  char v31 = [(PREditorColorPickerConfiguration *)self initWithIdentifier:v35 prompt:v6 selectedColor:v8 suggestedColors:v14 colorPalette:v21 colorWellDisplayMode:v25 showsSlider:v33 context:v30];

  return v31;
}

PRPosterColor *__50__PREditorColorPickerConfiguration_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRPosterColor alloc] initWithColor:v2];

  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PREditorColorPickerConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  uint64_t v5 = [(PREditorColorPickerConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  uint64_t v6 = [(PREditorColorPickerConfiguration *)self selectedColor];
  [v11 encodeObject:v6 forKey:@"selectedColor"];

  uint64_t v7 = [(PREditorColorPickerConfiguration *)self suggestedColors];
  if (v7) {
    [v11 encodeObject:v7 forKey:@"suggestedColors"];
  }
  uint64_t v8 = [(PREditorColorPickerConfiguration *)self colorPalette];
  [v11 encodeObject:v8 forKey:@"palette"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v9 forKey:@"colorWellDisplayMode"];

  objc_msgSend(v11, "encodeBool:forKey:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), @"showsSlider");
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPickerConfiguration context](self, "context"));
  [v11 encodeObject:v10 forKey:@"context"];
}

- (PREditorColorPickerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v3 = a3;
  id v4 = self;
  unint64_t v30 = [v3 decodeObjectOfClass:v4 forKey:@"identifier"];

  uint64_t v5 = self;
  uint64_t v6 = [v3 decodeObjectOfClass:v5 forKey:@"prompt"];

  uint64_t v7 = self;
  uint64_t v8 = [v3 decodeObjectOfClass:v7 forKey:@"selectedColor"];

  if (!v8)
  {
    uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selectedColor"];
    if (v9) {
      uint64_t v8 = [[PRPosterColor alloc] initWithColor:v9];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  uint64_t v10 = objc_opt_class();
  id v11 = [v3 decodeCollectionOfClass:v10 containingClass:objc_opt_class() forKey:@"suggestedColors"];
  if (!v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = self;
    long long v14 = [v3 decodeCollectionOfClass:v12 containingClass:v13 forKey:@"suggestedColors"];

    if (v14)
    {
      id v11 = objc_msgSend(v14, "bs_map:", &__block_literal_global_52);
    }
    else
    {
      id v11 = 0;
    }
  }
  uint64_t v15 = self;
  int v16 = [v3 decodeObjectOfClass:v15 forKey:@"palette"];

  unint64_t v17 = self;
  id v18 = [v3 decodeObjectOfClass:v17 forKey:@"colorWellDisplayMode"];

  if (v18)
  {
    unint64_t v19 = [v18 unsignedIntegerValue];
    if (v19 >= 2) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = v19;
    }
  }
  else
  {
    uint64_t v20 = 2;
  }
  char v21 = [v3 decodeBoolForKey:@"showsSlider"];
  int v22 = self;
  BOOL v23 = [v3 decodeObjectOfClass:v22 forKey:@"context"];

  if (v23)
  {
    unint64_t v24 = [v23 unsignedIntegerValue];
    if (v24 >= 3) {
      unint64_t v25 = 0;
    }
    else {
      unint64_t v25 = v24;
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  LOBYTE(v28) = v21;
  char v26 = [(PREditorColorPickerConfiguration *)self initWithIdentifier:v30 prompt:v6 selectedColor:v8 suggestedColors:v11 colorPalette:v16 colorWellDisplayMode:v20 showsSlider:v28 context:v25];

  return v26;
}

PRPosterColor *__55__PREditorColorPickerConfiguration_initWithBSXPCCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PRPosterColor alloc] initWithColor:v2];

  return v3;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v17 = a3;
  id v4 = [(PREditorColorPickerConfiguration *)self identifier];
  [v17 appendString:v4 withName:@"identifier"];

  uint64_t v5 = [(PREditorColorPickerConfiguration *)self prompt];
  [v17 appendString:v5 withName:@"prompt" skipIfEmpty:1];

  uint64_t v6 = [(PREditorColorPickerConfiguration *)self selectedColor];
  id v7 = (id)[v17 appendObject:v6 withName:@"selectedColor" skipIfNil:1];

  uint64_t v8 = [(PREditorColorPickerConfiguration *)self suggestedColors];
  id v9 = (id)[v17 appendObject:v8 withName:@"suggestedColors" skipIfNil:1];

  uint64_t v10 = [(PREditorColorPickerConfiguration *)self colorPalette];
  id v11 = (id)[v17 appendObject:v10 withName:@"colorPalette"];

  unint64_t v12 = [(PREditorColorPickerConfiguration *)self colorWellDisplayMode];
  if (v12 > 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = off_1E54DAB58[v12];
  }
  [v17 appendString:v13 withName:@"colorWellDisplayMode"];
  id v14 = (id)objc_msgSend(v17, "appendBool:withName:", -[PREditorColorPickerConfiguration showsSlider](self, "showsSlider"), @"showsSlider");
  unint64_t v15 = [(PREditorColorPickerConfiguration *)self context];
  if (v15 > 2) {
    int v16 = 0;
  }
  else {
    int v16 = off_1E54DAB70[v15];
  }
  [v17 appendString:v16 withName:@"context"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PREditorColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (BOOL)showsSuggestedColorItem
{
  return self->_showsSuggestedColorItem;
}

- (void)setShowsSuggestedColorItem:(BOOL)a3
{
  self->_showsSuggestedColorItem = a3;
}

- (PRPosterColor)suggestedColor
{
  return self->_suggestedColor;
}

- (NSArray)suggestedColors
{
  return self->_suggestedColors;
}

- (id)selectedColor
{
  return self->_selectedColor;
}

- (BOOL)showsSlider
{
  return self->_showsSlider;
}

- (void)setShowsSlider:(BOOL)a3
{
  self->_showsSlider = a3;
}

- (unint64_t)colorWellDisplayMode
{
  return self->_colorWellDisplayMode;
}

- (void)setColorWellDisplayMode:(unint64_t)a3
{
  self->_colorWellDisplayMode = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (UIView)colorPickerSourceView
{
  return self->_colorPickerSourceView;
}

- (UIPopoverPresentationControllerSourceItem)colorPickerSourceItem
{
  return self->_colorPickerSourceItem;
}

- (void)setColorPickerSourceItem:(id)a3
{
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)includesObjectsOfTypePRPickerColor
{
  return self->_includesObjectsOfTypePRPickerColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPickerSourceItem, 0);
  objc_storeStrong((id *)&self->_colorPickerSourceView, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong(&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_suggestedColors, 0);
  objc_storeStrong((id *)&self->_suggestedColor, 0);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(uint64_t)a3 prompt:selectedColor:suggestedColors:colorPalette:colorWellDisplayMode:showsSlider:context:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PREditorColorPickerConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 91;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)setSelectedColor:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"PREditorColorPickerConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 128;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end