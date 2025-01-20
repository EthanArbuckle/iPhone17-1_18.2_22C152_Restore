@interface SUUIEditorialComponent
- (BOOL)_usesLockupTitle;
- (NSArray)links;
- (NSAttributedString)bodyAttributedText;
- (NSString)bodyText;
- (NSString)titleText;
- (SUUIEditorialComponent)initWithBrickRoomText:(id)a3;
- (SUUIEditorialComponent)initWithCustomPageContext:(id)a3;
- (SUUIEditorialComponent)initWithUberText:(id)a3;
- (SUUIEditorialComponent)initWithViewElement:(id)a3;
- (SUUIEditorialStyle)editorialStyle;
- (int64_t)componentType;
- (int64_t)maximumBodyLines;
- (void)_setTitleText:(id)a3;
@end

@implementation SUUIEditorialComponent

- (SUUIEditorialComponent)initWithBrickRoomText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialComponent;
  v5 = [(SUUIEditorialComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v6;

    v5->_maximumBodyLines = 0;
    v5->_style.bodyFontSize = 14.0;
  }

  return v5;
}

- (SUUIEditorialComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SUUIEditorialComponent;
  v5 = [(SUUIPageComponent *)&v38 initWithCustomPageContext:v4];
  if (v5)
  {
    uint64_t v6 = [v4 componentDictionary];
    SUUIEditorialStyleForDictionary(v6, (uint64_t)v36);
    long long v7 = v36[1];
    *(_OWORD *)&v5->_style.alignment = v36[0];
    *(_OWORD *)&v5->_style.bodyFontSize = v7;
    *(void *)&v5->_style.titleFontSize = v37;
    if (v5->_style.alignment == 3 && ![v4 layoutStyle]) {
      v5->_style.alignment = 1;
    }
    v8 = [v6 objectForKey:@"maximumBodyLines"];
    if (objc_opt_respondsToSelector()) {
      v5->_maximumBodyLines = [v8 integerValue];
    }
    objc_super v9 = [v6 objectForKey:@"body"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      bodyText = v5->_bodyText;
      v5->_bodyText = (NSString *)v10;
    }
    v12 = [v6 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      titleText = v5->_titleText;
      v5->_titleText = (NSString *)v13;
    }
    v15 = [v6 objectForKey:@"useLockupTitle"];

    if (objc_opt_respondsToSelector()) {
      v5->_usesLockupTitle = [v15 BOOLValue];
    }
    v16 = [v6 objectForKey:@"links"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v6;
      id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v31 = v4;
      v18 = (void *)[v4 copy];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v29 = v16;
      id v19 = v16;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v18 setComponentDictionary:v24];
              v25 = [[SUUILink alloc] initWithComponentContext:v18];
              if (v25) {
                [v17 addObject:v25];
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v21);
      }

      uint64_t v26 = [v17 copy];
      links = v5->_links;
      v5->_links = (NSArray *)v26;

      uint64_t v6 = v30;
      id v4 = v31;
      v16 = v29;
    }
  }
  return v5;
}

- (SUUIEditorialComponent)initWithUberText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialComponent;
  v5 = [(SUUIEditorialComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v6;

    v5->_maximumBodyLines = 3;
    v5->_style.bodyFontSize = 14.0;
  }

  return v5;
}

- (SUUIEditorialComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialComponent;
  v5 = [(SUUIPageComponent *)&v9 initWithViewElement:v4];
  if (v5)
  {
    uint64_t v6 = [v4 style];
    uint64_t v7 = [v6 maxTextLines];
    if (!v6 || v7 == -1) {
      uint64_t v7 = [v4 numberOfLines];
    }
    v5->_maximumBodyLines = v7;
  }
  return v5;
}

- (NSAttributedString)bodyAttributedText
{
  v2 = [(SUUIPageComponent *)self viewElement];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 style];
    v5 = SUUIViewElementFontWithStyle(v4);
    if (!v5)
    {
      v5 = SUUIFontPreferredFontForTextStyle(5);
    }
    uint64_t v6 = [v4 ikColor];
    uint64_t v7 = [v6 color];

    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F825C8] blackColor];
    }
    uint64_t v8 = SUUIViewElementAlignmentForStyle(v4);
    if (v8) {
      uint64_t v9 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v8);
    }
    else {
      uint64_t v9 = 0;
    }
    v11 = [v3 text];
    v12 = [v11 attributedStringWithDefaultFont:v5 foregroundColor:v7 textAlignment:v9 style:v4];
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = *MEMORY[0x263F81540];
    uint64_t v15 = [v13 length];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__SUUIEditorialComponent_bodyAttributedText__block_invoke;
    v17[3] = &unk_265409588;
    id v10 = v13;
    id v18 = v10;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v15, 0, v17);
  }
  else
  {
    id v10 = 0;
  }

  return (NSAttributedString *)v10;
}

void __44__SUUIEditorialComponent_bodyAttributedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)[a2 mutableCopy];
  [v7 setLineBreakMode:0];
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x263F81540], v7, a3, a4);
}

- (void)_setTitleText:(id)a3
{
  if (self->_titleText != a3)
  {
    id v4 = (NSString *)[a3 copy];
    titleText = self->_titleText;
    self->_titleText = v4;
    MEMORY[0x270F9A758](v4, titleText);
  }
}

- (int64_t)componentType
{
  return 5;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (SUUIEditorialStyle)editorialStyle
{
  long long v3 = *(_OWORD *)&self[1].titleFontWeight;
  *(_OWORD *)&retstr->alignment = *(_OWORD *)&self[1].bodyFontWeight;
  *(_OWORD *)&retstr->bodyFontSize = v3;
  *(void *)&retstr->titleFontSize = self[2].alignment;
  return self;
}

- (NSArray)links
{
  return self->_links;
}

- (int64_t)maximumBodyLines
{
  return self->_maximumBodyLines;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (BOOL)_usesLockupTitle
{
  return self->_usesLockupTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
}

@end