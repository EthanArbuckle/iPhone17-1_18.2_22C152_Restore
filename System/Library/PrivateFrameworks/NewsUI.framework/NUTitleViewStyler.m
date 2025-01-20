@interface NUTitleViewStyler
- (NUTitleViewStyler)init;
- (NUTitleViewStyler)initWithTextColor:(id)a3;
- (UIColor)textColor;
- (id)messageLargeFont;
- (id)messageParagraphStyle;
- (id)messageSmallFont;
- (id)styleTextAsMessage:(id)a3 boundingSize:(CGSize)a4;
- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4;
- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5;
- (id)titleLargeFont;
- (id)titleParagraphStyleWithWrapping:(BOOL)a3;
- (id)titleSmallFont;
@end

@implementation NUTitleViewStyler

- (NUTitleViewStyler)init
{
  v3 = objc_msgSend(MEMORY[0x263F1C550], "nu_defaultTitleTextColor");
  v4 = [(NUTitleViewStyler *)self initWithTextColor:v3];

  return v4;
}

- (NUTitleViewStyler)initWithTextColor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUTitleViewStyler;
  v6 = [(NUTitleViewStyler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textColor, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      -[NUTitleViewStyler styleTextAsMessage:boundingSize:](self, "styleTextAsMessage:boundingSize:", v9, width, height);
      v10 = (NUTitleViewStyler *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_8;
      }
      v10 = (NUTitleViewStyler *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9];
    }
  }
  else
  {
    -[NUTitleViewStyler styleTextAsTitle:boundingSize:](self, "styleTextAsTitle:boundingSize:", v9, width, height);
    v10 = (NUTitleViewStyler *)objc_claimAutoreleasedReturnValue();
  }
  self = v10;
LABEL_8:

  return self;
}

- (id)styleTextAsMessage:(id)a3 boundingSize:(CGSize)a4
{
  double width = a4.width;
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v20 = *MEMORY[0x263F1C238];
  uint64_t v7 = v20;
  v8 = [(NUTitleViewStyler *)self messageLargeFont];
  v21[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v6 sizeWithAttributes:v9];
  double v11 = v10;

  v18[0] = v7;
  if (v11 > width) {
    [(NUTitleViewStyler *)self messageSmallFont];
  }
  else {
  v12 = [(NUTitleViewStyler *)self messageLargeFont];
  }
  v19[0] = v12;
  v18[1] = *MEMORY[0x263F1C268];
  v13 = [(NUTitleViewStyler *)self messageParagraphStyle];
  v19[1] = v13;
  v18[2] = *MEMORY[0x263F1C240];
  v14 = [(NUTitleViewStyler *)self textColor];
  v19[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v15];

  return v16;
}

- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4
{
  double width = a4.width;
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v20 = *MEMORY[0x263F1C238];
  uint64_t v7 = v20;
  v8 = [(NUTitleViewStyler *)self titleLargeFont];
  v21[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v6 sizeWithAttributes:v9];
  double v11 = v10;

  v18[0] = v7;
  if (v11 <= width) {
    [(NUTitleViewStyler *)self titleLargeFont];
  }
  else {
  v12 = [(NUTitleViewStyler *)self titleSmallFont];
  }
  v19[0] = v12;
  v18[1] = *MEMORY[0x263F1C268];
  v13 = [(NUTitleViewStyler *)self titleParagraphStyleWithWrapping:v11 > width];
  v19[1] = v13;
  v18[2] = *MEMORY[0x263F1C240];
  v14 = [(NUTitleViewStyler *)self textColor];
  void v18[3] = *MEMORY[0x263F1C248];
  v19[2] = v14;
  void v19[3] = &unk_26D4A8D28;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v15];

  return v16;
}

- (id)messageLargeFont
{
  if (messageLargeFont_onceToken_0 != -1) {
    dispatch_once(&messageLargeFont_onceToken_0, &__block_literal_global_16);
  }
  v2 = (void *)messageLargeFont_largeFont_0;

  return v2;
}

void __37__NUTitleViewStyler_messageLargeFont__block_invoke()
{
  id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  uint64_t v0 = [v2 fontWithSize:15.0];
  v1 = (void *)messageLargeFont_largeFont_0;
  messageLargeFont_largeFont_0 = v0;
}

- (id)messageSmallFont
{
  if (messageSmallFont_onceToken_0 != -1) {
    dispatch_once(&messageSmallFont_onceToken_0, &__block_literal_global_6_0);
  }
  id v2 = (void *)messageSmallFont_smallFont_0;

  return v2;
}

void __37__NUTitleViewStyler_messageSmallFont__block_invoke()
{
  id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  uint64_t v0 = [v2 fontWithSize:13.0];
  v1 = (void *)messageSmallFont_smallFont_0;
  messageSmallFont_smallFont_0 = v0;
}

- (id)messageParagraphStyle
{
  id v2 = [MEMORY[0x263F1C350] defaultParagraphStyle];
  v3 = (void *)[v2 mutableCopy];

  [v3 setAlignment:1];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)titleLargeFont
{
  if (titleLargeFont_onceToken != -1) {
    dispatch_once(&titleLargeFont_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)titleLargeFont_largeFont;

  return v2;
}

void __35__NUTitleViewStyler_titleLargeFont__block_invoke()
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C658] systemFontOfSize:24.0 weight:*MEMORY[0x263F1D318]];
  v1 = (void *)titleLargeFont_largeFont;
  titleLargeFont_largeFont = v0;

  id v2 = [(id)titleLargeFont_largeFont fontDescriptor];
  uint64_t v8 = *MEMORY[0x263F1D258];
  v9[0] = &unk_26D4A8E70;
  v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = (id)[v2 fontDescriptorByAddingAttributes:v3];

  id v5 = (void *)MEMORY[0x263F1C658];
  [(id)titleLargeFont_largeFont pointSize];
  uint64_t v6 = objc_msgSend(v5, "fontWithDescriptor:size:", v2);
  uint64_t v7 = (void *)titleLargeFont_largeFont;
  titleLargeFont_largeFont = v6;
}

- (id)titleSmallFont
{
  if (titleSmallFont_onceToken != -1) {
    dispatch_once(&titleSmallFont_onceToken, &__block_literal_global_12);
  }
  id v2 = (void *)titleSmallFont_smallFont;

  return v2;
}

void __35__NUTitleViewStyler_titleSmallFont__block_invoke()
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C658] systemFontOfSize:17.5 weight:*MEMORY[0x263F1D318]];
  v1 = (void *)titleSmallFont_smallFont;
  titleSmallFont_smallFont = v0;

  id v2 = [(id)titleSmallFont_smallFont fontDescriptor];
  uint64_t v8 = *MEMORY[0x263F1D258];
  v9[0] = &unk_26D4A8E70;
  v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = (id)[v2 fontDescriptorByAddingAttributes:v3];

  id v5 = (void *)MEMORY[0x263F1C658];
  [(id)titleSmallFont_smallFont pointSize];
  uint64_t v6 = objc_msgSend(v5, "fontWithDescriptor:size:", v2);
  uint64_t v7 = (void *)titleSmallFont_smallFont;
  titleSmallFont_smallFont = v6;
}

- (id)titleParagraphStyleWithWrapping:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F1C350] defaultParagraphStyle];
  id v5 = (void *)[v4 mutableCopy];

  [v5 setLineBreakMode:4];
  [v5 setAlignment:1];
  if (v3)
  {
    [v5 setMinimumLineHeight:20.0];
    [v5 setMaximumLineHeight:21.0];
  }
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (UIColor)textColor
{
  return self->_textColor;
}

@end