@interface PREditorContentStylePickerConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForTitleStylePicker;
- (BOOL)showsSuggestedContentStyleItem;
- (NSString)description;
- (NSString)identifier;
- (NSString)prompt;
- (PREditorContentStylePalette)stylePalette;
- (PREditorContentStylePickerConfiguration)init;
- (PREditorContentStylePickerConfiguration)initWithBSXPCCoder:(id)a3;
- (PREditorContentStylePickerConfiguration)initWithCoder:(id)a3;
- (PREditorContentStylePickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7;
- (PRPosterContentStyle)selectedStyle;
- (PRPosterContentStyle)suggestedStyle;
- (UIPopoverPresentationControllerSourceItem)contentStylePickerSourceItem;
- (id)copyWithZone:(_NSZone *)a3;
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

@implementation PREditorContentStylePickerConfiguration

- (PREditorContentStylePickerConfiguration)init
{
  return [(PREditorContentStylePickerConfiguration *)self initWithIdentifier:0 prompt:0 selectedStyle:0 stylePalette:0 colorWellDisplayMode:2];
}

- (PREditorContentStylePickerConfiguration)initWithIdentifier:(id)a3 prompt:(id)a4 selectedStyle:(id)a5 stylePalette:(id)a6 colorWellDisplayMode:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PREditorContentStylePickerConfiguration;
  v16 = [(PREditorContentStylePickerConfiguration *)&v24 init];
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
      prompt = PRBundle();
      uint64_t v21 = [prompt localizedStringForKey:@"EDIT_COLOR_PICKER_DEFAULT_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];
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
  v5 = (PRPosterContentStyle *)a3;
  p_suggestedStyle = &self->_suggestedStyle;
  if (self->_suggestedStyle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_suggestedStyle, a3);
    v5 = v7;
    self->_showsSuggestedContentStyleItem = v7 != 0;
  }
  MEMORY[0x1F41817F8](p_suggestedStyle, v5);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREditorContentStylePickerConfiguration *)a3;
  if (self == v4)
  {
    BOOL v24 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(PREditorContentStylePickerConfiguration *)self identifier];
      v9 = [(PREditorContentStylePickerConfiguration *)v7 identifier];
      int v10 = BSEqualStrings();

      if (!v10) {
        goto LABEL_11;
      }
      v11 = [(PREditorContentStylePickerConfiguration *)self prompt];
      id v12 = [(PREditorContentStylePickerConfiguration *)v7 prompt];
      int v13 = BSEqualStrings();

      if (!v13) {
        goto LABEL_11;
      }
      id v14 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
      id v15 = [(PREditorContentStylePickerConfiguration *)v7 stylePalette];
      int v16 = BSEqualObjects();

      if (!v16) {
        goto LABEL_11;
      }
      v17 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
      v18 = [(PREditorContentStylePickerConfiguration *)v7 selectedStyle];
      int v19 = BSEqualObjects();

      if (!v19) {
        goto LABEL_11;
      }
      v20 = [(PREditorContentStylePickerConfiguration *)self suggestedStyle];
      uint64_t v21 = [(PREditorContentStylePickerConfiguration *)v7 suggestedStyle];
      int v22 = BSEqualObjects();

      if (v22)
      {
        unint64_t v23 = [(PREditorContentStylePickerConfiguration *)self colorWellDisplayMode];
        BOOL v24 = v23 == [(PREditorContentStylePickerConfiguration *)v7 colorWellDisplayMode];
      }
      else
      {
LABEL_11:
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(PREditorContentStylePickerConfiguration *)self identifier];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(PREditorContentStylePickerConfiguration *)self prompt];
  id v7 = (id)[v3 appendString:v6];

  v8 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
  id v9 = (id)[v3 appendObject:v8];

  int v10 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  unint64_t v13 = [v3 hash];

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __54__PREditorContentStylePickerConfiguration_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __54__PREditorContentStylePickerConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(PREditorContentStylePickerConfiguration *)self identifier];
  v6 = [(PREditorContentStylePickerConfiguration *)self prompt];
  uint64_t v7 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
  uint64_t v8 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
  id v9 = objc_msgSend(v4, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v5, v6, v7, v8, -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PREditorContentStylePickerConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PREditorContentStylePickerConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  v6 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
  uint64_t v7 = [v6 type];

  if (v7 != 999)
  {
    uint64_t v8 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
    [v11 encodeObject:v8 forKey:@"selectedStyle"];
  }
  id v9 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
  [v11 encodeObject:v9 forKey:@"palette"];

  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v10 forKey:@"colorWellDisplayMode"];
}

- (PREditorContentStylePickerConfiguration)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"identifier"];

  uint64_t v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"prompt"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:5];
  id v11 = objc_msgSend(v9, "setWithArray:", v10, v21, v22, v23, v24);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"selectedStyle"];

  unint64_t v13 = self;
  id v14 = [v4 decodeObjectOfClass:v13 forKey:@"palette"];

  id v15 = self;
  int v16 = [v4 decodeObjectOfClass:v15 forKey:@"colorWellDisplayMode"];

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
  int v19 = [(PREditorContentStylePickerConfiguration *)self initWithIdentifier:v6 prompt:v8 selectedStyle:v12 stylePalette:v14 colorWellDisplayMode:v18];

  return v19;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PREditorContentStylePickerConfiguration *)self identifier];
  [v11 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(PREditorContentStylePickerConfiguration *)self prompt];
  [v11 encodeObject:v5 forKey:@"prompt"];

  v6 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
  uint64_t v7 = [v6 type];

  if (v7 != 999)
  {
    uint64_t v8 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
    [v11 encodeObject:v8 forKey:@"selectedStyle"];
  }
  id v9 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
  [v11 encodeObject:v9 forKey:@"palette"];

  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorContentStylePickerConfiguration colorWellDisplayMode](self, "colorWellDisplayMode"));
  [v11 encodeObject:v10 forKey:@"colorWellDisplayMode"];
}

- (PREditorContentStylePickerConfiguration)initWithBSXPCCoder:(id)a3
{
  v29[5] = *MEMORY[0x1E4F143B8];
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
  [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
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
          id v15 = (void *)v14;
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
  id v15 = 0;
LABEL_11:

  int v16 = self;
  unint64_t v17 = [v4 decodeObjectOfClass:v16 forKey:@"palette"];

  uint64_t v18 = self;
  int v19 = [v4 decodeObjectOfClass:v18 forKey:@"colorWellDisplayMode"];

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
  uint64_t v22 = -[PREditorContentStylePickerConfiguration initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:](self, "initWithIdentifier:prompt:selectedStyle:stylePalette:colorWellDisplayMode:", v6, v8, v15, v17, v21, (void)v24);

  return v22;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v12 = a3;
  id v4 = [(PREditorContentStylePickerConfiguration *)self identifier];
  [v12 appendString:v4 withName:@"identifier"];

  id v5 = [(PREditorContentStylePickerConfiguration *)self prompt];
  [v12 appendString:v5 withName:@"prompt" skipIfEmpty:1];

  v6 = [(PREditorContentStylePickerConfiguration *)self selectedStyle];
  id v7 = (id)[v12 appendObject:v6 withName:@"selectedStyle" skipIfNil:1];

  uint64_t v8 = [(PREditorContentStylePickerConfiguration *)self stylePalette];
  id v9 = (id)[v12 appendObject:v8 withName:@"stylePalette"];

  unint64_t v10 = [(PREditorContentStylePickerConfiguration *)self colorWellDisplayMode];
  if (v10 > 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = off_1E54DB210[v10];
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

- (PREditorContentStylePalette)stylePalette
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

- (PRPosterContentStyle)suggestedStyle
{
  return self->_suggestedStyle;
}

- (PRPosterContentStyle)selectedStyle
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