@interface PUIStyleConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStyleColorConfiguration:(id)a3;
- (BOOL)isForTitleStylePicker;
- (BOOL)showsSuggestedContentStyleItem;
- (NSString)description;
- (NSString)identifier;
- (NSString)prompt;
- (PUIStyle)selectedStyle;
- (PUIStyle)suggestedStyle;
- (PUIStyleConfiguration)init;
- (PUIStyleConfiguration)initWithBSXPCCoder:(id)a3;
- (PUIStyleConfiguration)initWithCoder:(id)a3;
- (PUIStyleConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7;
- (PUIStylePalette)stylePalette;
- (UIPopoverPresentationControllerSourceItem)contentStylePickerSourceItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)colorWellDisplayMode;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColorWellDisplayMode:(unint64_t)a3;
- (void)setContentStylePickerSourceItem:(id)a3;
- (void)setForTitleStylePicker:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setSelectedStyle:(id)a3;
- (void)setShowsSuggestedContentStyleItem:(BOOL)a3;
- (void)setStylePalette:(id)a3;
- (void)setSuggestedStyle:(id)a3;
@end

@implementation PUIStyleConfiguration

- (PUIStyleConfiguration)init
{
  return [(PUIStyleConfiguration *)self initWithIdentifier:0 prompt:0 selectedStyle:0 stylePalette:0 colorWellDisplayMode:2];
}

- (PUIStyleConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PUIStyleConfiguration;
  v16 = [(PUIStyleConfiguration *)&v24 init];
  if (v16)
  {
    if (v12) {
      v17 = (NSString *)v12;
    }
    else {
      v17 = (NSString *)[@"default" copy];
    }
    identifier = v16->_identifier;
    v16->_identifier = v17;

    if (v13)
    {
      v19 = (NSString *)v13;
      prompt = v16->_prompt;
      v16->_prompt = v19;
    }
    else
    {
      prompt = PUIBundle();
      uint64_t v21 = [prompt localizedStringForKey:@"EDIT_COLOR_PICKER_DEFAULT_PROMPT" value:&stru_270801C00 table:0];
      v22 = v16->_prompt;
      v16->_prompt = (NSString *)v21;
    }
    objc_storeStrong((id *)&v16->_selectedStyle, a5);
    objc_storeStrong((id *)&v16->_stylePalette, a6);
    v16->_colorWellDisplayMode = a7;
  }

  return v16;
}

- (void)setSuggestedStyle:(id)a3
{
  v5 = (PUIStyle *)a3;
  p_suggestedStyle = &self->_suggestedStyle;
  if (self->_suggestedStyle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_suggestedStyle, a3);
    self->_showsSuggestedContentStyleItem = v7 != 0;
  }
  MEMORY[0x270F9A758](p_suggestedStyle);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUIStyleConfiguration *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4
  }
      && (self,
          v6 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v6,
          (isKindOfClass & 1) != 0)
      && [(PUIStyleConfiguration *)self isEqualToStyleColorConfiguration:v5];

  return v8;
}

- (BOOL)isEqualToStyleColorConfiguration:(id)a3
{
  v4 = (PUIStyleConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v23 = 1;
  }
  else if (v4)
  {
    v6 = v4;
    v7 = [(PUIStyleConfiguration *)self identifier];
    BOOL v8 = [(PUIStyleConfiguration *)v6 identifier];
    int v9 = BSEqualStrings();

    if (!v9) {
      goto LABEL_9;
    }
    v10 = [(PUIStyleConfiguration *)self prompt];
    v11 = [(PUIStyleConfiguration *)v6 prompt];
    int v12 = BSEqualStrings();

    if (!v12) {
      goto LABEL_9;
    }
    id v13 = [(PUIStyleConfiguration *)self stylePalette];
    id v14 = [(PUIStyleConfiguration *)v6 stylePalette];
    int v15 = BSEqualObjects();

    if (!v15) {
      goto LABEL_9;
    }
    v16 = [(PUIStyleConfiguration *)self selectedStyle];
    v17 = [(PUIStyleConfiguration *)v6 selectedStyle];
    int v18 = BSEqualObjects();

    if (!v18) {
      goto LABEL_9;
    }
    v19 = [(PUIStyleConfiguration *)self suggestedStyle];
    v20 = [(PUIStyleConfiguration *)v6 suggestedStyle];
    int v21 = BSEqualObjects();

    if (v21)
    {
      unint64_t v22 = [(PUIStyleConfiguration *)self colorWellDisplayMode];
      BOOL v23 = v22 == [(PUIStyleConfiguration *)v6 colorWellDisplayMode];
    }
    else
    {
LABEL_9:
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  v4 = [(PUIStyleConfiguration *)self identifier];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(PUIStyleConfiguration *)self prompt];
  id v7 = (id)[v3 appendString:v6];

  BOOL v8 = [(PUIStyleConfiguration *)self stylePalette];
  id v9 = (id)[v3 appendObject:v8];

  v10 = [(PUIStyleConfiguration *)self selectedStyle];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  unint64_t v13 = [v3 hash];

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __36__PUIStyleConfiguration_description__block_invoke;
  v10 = &unk_265471108;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __36__PUIStyleConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(PUIStyleConfiguration *)self identifier];
  v6 = [(PUIStyleConfiguration *)self prompt];
  uint64_t v7 = [(PUIStyleConfiguration *)self selectedStyle];
  uint64_t v8 = [(PUIStyleConfiguration *)self stylePalette];
  id v9 = objc_msgSend(v4, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v5, v6, v7, v8, -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PUIMutableStyleConfiguration alloc];
  id v5 = [(PUIStyleConfiguration *)self identifier];
  v6 = [(PUIStyleConfiguration *)self prompt];
  uint64_t v7 = [(PUIStyleConfiguration *)self selectedStyle];
  uint64_t v8 = [(PUIStyleConfiguration *)self stylePalette];
  id v9 = [(PUIStyleConfiguration *)v4 initWithIdentifier:v5 prompt:v6 selectedStyle:v7 stylePalette:v8 colorWellDisplayMode:[(PUIStyleConfiguration *)self colorWellDisplayMode]];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PUIStyleConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PUIStyleConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  v6 = [(PUIStyleConfiguration *)self selectedStyle];
  uint64_t v7 = [v6 type];

  if (v7 != 999)
  {
    uint64_t v8 = [(PUIStyleConfiguration *)self selectedStyle];
    [v11 encodeObject:v8 forKey:@"selectedStyle"];
  }
  id v9 = [(PUIStyleConfiguration *)self stylePalette];
  [v11 encodeObject:v9 forKey:@"palette"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v10 forKey:@"colorWellDisplayMode"];
}

- (PUIStyleConfiguration)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"identifier"];

  uint64_t v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"prompt"];

  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:5];
  id v11 = objc_msgSend(v9, "setWithArray:", v10, v21, v22, v23, v24);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"selectedStyle"];

  unint64_t v13 = self;
  id v14 = [v4 decodeObjectOfClass:v13 forKey:@"palette"];

  int v15 = self;
  v16 = [v4 decodeObjectOfClass:v15 forKey:@"colorWellDisplayMode"];

  if (v16)
  {
    unint64_t v17 = [v16 unsignedIntegerValue];
    if (v17 >= 2) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = v17;
    }
  }
  else
  {
    uint64_t v18 = 2;
  }
  v19 = [(PUIStyleConfiguration *)self initWithIdentifier:v6 prompt:v8 selectedStyle:v12 stylePalette:v14 colorWellDisplayMode:v18];

  return v19;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PUIStyleConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PUIStyleConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  v6 = [(PUIStyleConfiguration *)self selectedStyle];
  uint64_t v7 = [v6 type];

  if (v7 != 999)
  {
    uint64_t v8 = [(PUIStyleConfiguration *)self selectedStyle];
    [v11 encodeObject:v8 forKey:@"selectedStyle"];
  }
  id v9 = [(PUIStyleConfiguration *)self stylePalette];
  [v11 encodeObject:v9 forKey:@"palette"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUIStyleConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v10 forKey:@"colorWellDisplayMode"];
}

- (PUIStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  v29[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"identifier"];

  uint64_t v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"prompt"];

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:5];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", *(void *)(*((void *)&v24 + 1) + 8 * i), @"selectedStyle", (void)v24);
        if (v14)
        {
          int v15 = (void *)v14;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  int v15 = 0;
LABEL_11:

  v16 = self;
  unint64_t v17 = [v4 decodeObjectOfClass:v16 forKey:@"palette"];

  uint64_t v18 = self;
  v19 = [v4 decodeObjectOfClass:v18 forKey:@"colorWellDisplayMode"];

  if (v19)
  {
    unint64_t v20 = [v19 unsignedIntegerValue];
    if (v20 >= 2) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = v20;
    }
  }
  else
  {
    uint64_t v21 = 2;
  }
  uint64_t v22 = -[PUIStyleConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v15, v17, v21, (void)v24);

  return v22;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v12 = a3;
  id v4 = [(PUIStyleConfiguration *)self identifier];
  [v12 appendString:v4 withName:@"identifier"];

  id v5 = [(PUIStyleConfiguration *)self prompt];
  [v12 appendString:v5 withName:@"prompt" skipIfEmpty:1];

  v6 = [(PUIStyleConfiguration *)self selectedStyle];
  id v7 = (id)[v12 appendObject:v6 withName:@"selectedStyle" skipIfNil:1];

  uint64_t v8 = [(PUIStyleConfiguration *)self stylePalette];
  id v9 = (id)[v12 appendObject:v8 withName:@"stylePalette"];

  unint64_t v10 = [(PUIStyleConfiguration *)self colorWellDisplayMode];
  if (v10 > 2) {
    uint64_t v11 = @"(null color well mode)";
  }
  else {
    uint64_t v11 = off_265471EF8[v10];
  }
  [v12 appendString:v11 withName:@"colorWellDisplayMode"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (PUIStylePalette)stylePalette
{
  return self->_stylePalette;
}

- (void)setStylePalette:(id)a3
{
}

- (BOOL)showsSuggestedContentStyleItem
{
  return self->_showsSuggestedContentStyleItem;
}

- (void)setShowsSuggestedContentStyleItem:(BOOL)a3
{
  self->_showsSuggestedContentStyleItem = a3;
}

- (PUIStyle)suggestedStyle
{
  return self->_suggestedStyle;
}

- (PUIStyle)selectedStyle
{
  return self->_selectedStyle;
}

- (void)setSelectedStyle:(id)a3
{
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

- (UIPopoverPresentationControllerSourceItem)contentStylePickerSourceItem
{
  return self->_contentStylePickerSourceItem;
}

- (void)setContentStylePickerSourceItem:(id)a3
{
}

- (BOOL)isForTitleStylePicker
{
  return self->_forTitleStylePicker;
}

- (void)setForTitleStylePicker:(BOOL)a3
{
  self->_forTitleStylePicker = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentStylePickerSourceItem, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_selectedStyle, 0);
  objc_storeStrong((id *)&self->_suggestedStyle, 0);
  objc_storeStrong((id *)&self->_stylePalette, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end