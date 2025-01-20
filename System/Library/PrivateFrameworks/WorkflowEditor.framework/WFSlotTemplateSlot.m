@interface WFSlotTemplateSlot
+ (id)addingSlotWithKey:(id)a3;
+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 key:(id)a5;
+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 key:(id)a6;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalid;
- (BOOL)isPopulated;
- (BOOL)preferContextMenu;
- (BOOL)prefersNoWrapping;
- (BOOL)standaloneTextAttachment;
- (NSAttributedString)contentAttributedString;
- (NSString)languageCode;
- (NSString)localizedName;
- (NSString)localizedPlaceholder;
- (WFSlotIdentifier)identifier;
- (WFSlotTemplateSlot)initWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 identifier:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)userInputInsertionIndex;
- (unint64_t)hash;
- (void)populateWithAttributedString:(id)a3;
- (void)populateWithIcon:(id)a3 string:(id)a4;
- (void)populateWithString:(id)a3;
- (void)populateWithVariable:(id)a3;
- (void)populateWithVariableString:(id)a3 askVariableName:(id)a4;
- (void)setContentAttributedString:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setLocalizedPlaceholder:(id)a3;
- (void)setPreferContextMenu:(BOOL)a3;
- (void)setPrefersNoWrapping:(BOOL)a3;
- (void)setStandaloneTextAttachment:(BOOL)a3;
- (void)setUserInputInsertionIndex:(int64_t)a3;
@end

@implementation WFSlotTemplateSlot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAttributedString, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setPreferContextMenu:(BOOL)a3
{
  self->_preferContextMenu = a3;
}

- (BOOL)preferContextMenu
{
  return self->_preferContextMenu;
}

- (void)setUserInputInsertionIndex:(int64_t)a3
{
  self->_userInputInsertionIndex = a3;
}

- (int64_t)userInputInsertionIndex
{
  return self->_userInputInsertionIndex;
}

- (void)setStandaloneTextAttachment:(BOOL)a3
{
  self->_standaloneTextAttachment = a3;
}

- (BOOL)standaloneTextAttachment
{
  return self->_standaloneTextAttachment;
}

- (void)setPrefersNoWrapping:(BOOL)a3
{
  self->_prefersNoWrapping = a3;
}

- (BOOL)prefersNoWrapping
{
  return self->_prefersNoWrapping;
}

- (NSAttributedString)contentAttributedString
{
  return self->_contentAttributedString;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLocalizedPlaceholder:(id)a3
{
}

- (NSString)localizedPlaceholder
{
  return self->_localizedPlaceholder;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setIdentifier:(id)a3
{
}

- (WFSlotIdentifier)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFSlotTemplateSlot *)self localizedName];
  v6 = [(WFSlotTemplateSlot *)self localizedPlaceholder];
  v7 = [(WFSlotTemplateSlot *)self languageCode];
  v8 = [(WFSlotTemplateSlot *)self identifier];
  v9 = (void *)[v4 initWithLocalizedName:v5 localizedPlaceholder:v6 languageCode:v7 identifier:v8];

  v10 = [(WFSlotTemplateSlot *)self contentAttributedString];
  [v9 setContentAttributedString:v10];

  objc_msgSend(v9, "setEnabled:", -[WFSlotTemplateSlot isEnabled](self, "isEnabled"));
  objc_msgSend(v9, "setInvalid:", -[WFSlotTemplateSlot isInvalid](self, "isInvalid"));
  objc_msgSend(v9, "setPrefersNoWrapping:", -[WFSlotTemplateSlot prefersNoWrapping](self, "prefersNoWrapping"));
  objc_msgSend(v9, "setStandaloneTextAttachment:", -[WFSlotTemplateSlot standaloneTextAttachment](self, "standaloneTextAttachment"));
  objc_msgSend(v9, "setUserInputInsertionIndex:", -[WFSlotTemplateSlot userInputInsertionIndex](self, "userInputInsertionIndex"));
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFSlotTemplateSlot *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v9 = 0;
    goto LABEL_10;
  }
  v5 = [(WFSlotTemplateSlot *)self identifier];
  v6 = [(WFSlotTemplateSlot *)v4 identifier];
  if ([v5 isEqual:v6])
  {
    BOOL v7 = [(WFSlotTemplateSlot *)self isEnabled];
    if (v7 == [(WFSlotTemplateSlot *)v4 isEnabled])
    {
      BOOL v8 = [(WFSlotTemplateSlot *)self isInvalid];
      if (v8 == [(WFSlotTemplateSlot *)v4 isInvalid])
      {
        v11 = [(WFSlotTemplateSlot *)self localizedName];
        v12 = [(WFSlotTemplateSlot *)v4 localizedName];
        if (v11 != v12)
        {
          v13 = [(WFSlotTemplateSlot *)self localizedName];
          v14 = [(WFSlotTemplateSlot *)v4 localizedName];
          if (![v13 isEqualToString:v14])
          {
            BOOL v9 = 0;
            goto LABEL_33;
          }
          v34 = v14;
          v35 = v13;
        }
        v15 = [(WFSlotTemplateSlot *)self localizedPlaceholder];
        v16 = [(WFSlotTemplateSlot *)v4 localizedPlaceholder];
        if (v15 != v16)
        {
          v17 = [(WFSlotTemplateSlot *)self localizedPlaceholder];
          v18 = [(WFSlotTemplateSlot *)v4 localizedPlaceholder];
          if (![v17 isEqualToString:v18])
          {
            BOOL v9 = 0;
LABEL_31:

LABEL_32:
            v14 = v34;
            v13 = v35;
            if (v11 == v12)
            {
LABEL_34:

              goto LABEL_7;
            }
LABEL_33:

            goto LABEL_34;
          }
          v31 = v18;
          v32 = v17;
        }
        v19 = [(WFSlotTemplateSlot *)self contentAttributedString];
        v20 = [(WFSlotTemplateSlot *)v4 contentAttributedString];
        v33 = v15;
        if (v19 != v20)
        {
          v28 = v19;
          v21 = v11;
          v22 = v16;
          v23 = [(WFSlotTemplateSlot *)self contentAttributedString];
          v29 = [(WFSlotTemplateSlot *)v4 contentAttributedString];
          v30 = v23;
          if (!objc_msgSend(v23, "isEqualToAttributedString:"))
          {
            BOOL v9 = 0;
            v16 = v22;
            v11 = v21;
            v19 = v28;
            goto LABEL_28;
          }
          v16 = v22;
          v11 = v21;
          v19 = v28;
        }
        BOOL v24 = [(WFSlotTemplateSlot *)self prefersNoWrapping];
        if (v24 == [(WFSlotTemplateSlot *)v4 prefersNoWrapping]
          && (BOOL v25 = [(WFSlotTemplateSlot *)self standaloneTextAttachment],
              v25 == [(WFSlotTemplateSlot *)v4 standaloneTextAttachment]))
        {
          int64_t v27 = [(WFSlotTemplateSlot *)self userInputInsertionIndex];
          BOOL v9 = v27 == [(WFSlotTemplateSlot *)v4 userInputInsertionIndex];
          BOOL v26 = v9;
        }
        else
        {
          BOOL v9 = 0;
          BOOL v26 = 0;
        }
        if (v19 == v20)
        {

          BOOL v9 = v26;
LABEL_30:
          v17 = v32;
          v15 = v33;
          v18 = v31;
          if (v33 == v16) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
LABEL_28:

        goto LABEL_30;
      }
    }
  }
  BOOL v9 = 0;
LABEL_7:

LABEL_10:
  return v9;
}

- (unint64_t)hash
{
  v2 = [(WFSlotTemplateSlot *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setContentAttributedString:(id)a3
{
  v4 = (void *)[a3 mutableCopy];
  uint64_t v5 = [v4 length];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke;
  v12 = &unk_264BFD0A0;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, &v9);
  BOOL v7 = (NSAttributedString *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  contentAttributedString = self->_contentAttributedString;
  self->_contentAttributedString = v7;
}

void __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke_2;
  v8[3] = &unk_264BFD078;
  BOOL v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  uint64_t v10 = a3;
  uint64_t v11 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v8];
}

void __49__WFSlotTemplateSlot_setContentAttributedString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F814A0];
  if ([v12 isEqualToString:*MEMORY[0x263F814A0]])
  {
    id v7 = v5;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v8 = v7;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    id v9 = v8;

    uint64_t v10 = (void *)[v9 copy];
    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) identifier];
      [v10 setContainingSlotIdentifier:v11];

      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v6, v10, *(void *)(a1 + 48), *(void *)(a1 + 56));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v12, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

- (BOOL)isPopulated
{
  v2 = [(WFSlotTemplateSlot *)self contentAttributedString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (WFSlotTemplateSlot)initWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    BOOL v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFSlotTemplateSlot.m", 82, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFSlotTemplateSlot;
  v15 = [(WFSlotTemplateSlot *)&v25 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    localizedName = v15->_localizedName;
    v15->_localizedName = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    localizedPlaceholder = v15->_localizedPlaceholder;
    v15->_localizedPlaceholder = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    languageCode = v15->_languageCode;
    v15->_languageCode = (NSString *)v20;

    objc_storeStrong((id *)&v15->_identifier, a6);
    v15->_userInputInsertionIndex = -1;
    v15->_enabled = 1;
    v22 = v15;
  }

  return v15;
}

+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 languageCode:(id)a5 key:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc((Class)a1);
  v15 = [[WFSlotIdentifier alloc] initWithKey:v10];

  uint64_t v16 = (void *)[v14 initWithLocalizedName:v13 localizedPlaceholder:v12 languageCode:v11 identifier:v15];
  return v16;
}

+ (id)slotWithLocalizedName:(id)a3 localizedPlaceholder:(id)a4 key:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [[WFSlotIdentifier alloc] initWithKey:v8];

  id v13 = (void *)[v11 initWithLocalizedName:v10 localizedPlaceholder:v9 languageCode:0 identifier:v12];
  return v13;
}

- (void)populateWithVariableString:(id)a3 askVariableName:(id)a4
{
  id v6 = a4;
  id v7 = [a3 attributedString];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = *MEMORY[0x263F814A0];
  uint64_t v10 = [v8 length];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __86__WFSlotTemplateSlot_WFVariableUtilities__populateWithVariableString_askVariableName___block_invoke;
  v15 = &unk_264BFD0C8;
  uint64_t v16 = self;
  id v17 = v6;
  id v11 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0, &v12);
  -[WFSlotTemplateSlot setContentAttributedString:](self, "setContentAttributedString:", v8, v12, v13, v14, v15, v16);
  [(WFSlotTemplateSlot *)self setStandaloneTextAttachment:0];
}

void __86__WFSlotTemplateSlot_WFVariableUtilities__populateWithVariableString_askVariableName___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [*(id *)(a1 + 32) identifier];
    [v7 setContainingSlotIdentifier:v3];

    v4 = [v7 variable];
    id v5 = [v4 type];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F874E8]];

    if (v6) {
      [v7 setOverrideVariableName:*(void *)(a1 + 40)];
    }
  }
}

- (void)populateWithVariable:(id)a3
{
  id v4 = a3;
  uint64_t v10 = [[WFVariableAttachment alloc] initWithVariable:v4];
  id v5 = [(WFSlotTemplateSlot *)self identifier];
  [(WFVariableAttachment *)v10 setContainingSlotIdentifier:v5];

  [(WFVariableAttachment *)v10 setStandalone:1];
  int v6 = [v4 type];

  if ([v6 isEqualToString:*MEMORY[0x263F874E8]])
  {
    id v7 = [(WFSlotTemplateSlot *)self localizedName];
    uint64_t v8 = [v7 length];

    if (!v8) {
      goto LABEL_5;
    }
    int v6 = [(WFSlotTemplateSlot *)self localizedName];
    [(WFVariableAttachment *)v10 setOverrideVariableName:v6];
  }

LABEL_5:
  uint64_t v9 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v10];
  [(WFSlotTemplateSlot *)self setContentAttributedString:v9];

  [(WFSlotTemplateSlot *)self setStandaloneTextAttachment:1];
}

- (void)populateWithIcon:(id)a3 string:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F089B8]);
  if (v13)
  {
    uint64_t v8 = [[WFSlotTemplateImageAttachment alloc] initWithData:0 ofType:0];
    uint64_t v9 = [v13 platformImage];
    [(WFSlotTemplateImageAttachment *)v8 setImage:v9];

    uint64_t v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
    [v7 appendAttributedString:v10];

    if (!v6) {
      goto LABEL_6;
    }
    id v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
    [v7 appendAttributedString:v11];
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6];
  [v7 appendAttributedString:v12];

LABEL_6:
  [(WFSlotTemplateSlot *)self setContentAttributedString:v7];
  [(WFSlotTemplateSlot *)self setStandaloneTextAttachment:0];
}

- (void)populateWithAttributedString:(id)a3
{
  [(WFSlotTemplateSlot *)self setContentAttributedString:a3];
  [(WFSlotTemplateSlot *)self setStandaloneTextAttachment:0];
}

- (void)populateWithString:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
    [(WFSlotTemplateSlot *)self populateWithAttributedString:v4];
  }
  else
  {
    [(WFSlotTemplateSlot *)self populateWithAttributedString:0];
  }
}

+ (id)addingSlotWithKey:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F81678];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithData:0 ofType:0];
  id v7 = [MEMORY[0x263F85318] configurationWithPointSize:20.0];
  uint64_t v8 = [MEMORY[0x263F85308] systemImageNamed:@"plus" configuration:v7 renderingMode:0];
  uint64_t v9 = [v8 imageWithRenderingMode:2];
  uint64_t v10 = [v9 platformImage];
  [v6 setImage:v10];

  id v11 = [a1 slotWithLocalizedName:0 localizedPlaceholder:0 languageCode:0 key:v5];

  uint64_t v12 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v6];
  [v11 setContentAttributedString:v12];

  return v11;
}

@end