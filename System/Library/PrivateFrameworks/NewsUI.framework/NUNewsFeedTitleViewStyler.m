@interface NUNewsFeedTitleViewStyler
- (NUNewsFeedTitleViewStyler)init;
- (NUNewsFeedTitleViewStyler)initWithTextAlignment:(int64_t)a3;
- (UIColor)textColor;
- (id)messageLargeFont;
- (id)messageSmallFont;
- (id)styleTextAsMessage:(id)a3 boundingSize:(CGSize)a4;
- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4;
- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5;
- (id)titleExtraLargeFont;
- (id)titleParagraphStyleWithWrapping:(BOOL)a3;
- (int64_t)textAlignment;
- (void)setTextColor:(id)a3;
@end

@implementation NUNewsFeedTitleViewStyler

- (NUNewsFeedTitleViewStyler)init
{
  return [(NUNewsFeedTitleViewStyler *)self initWithTextAlignment:1];
}

- (NUNewsFeedTitleViewStyler)initWithTextAlignment:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUNewsFeedTitleViewStyler;
  v4 = [(NUNewsFeedTitleViewStyler *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F1C550], "nu_defaultTitleTextColor");
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v5;

    v4->_textAlignment = a3;
  }
  return v4;
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
      -[NUNewsFeedTitleViewStyler styleTextAsMessage:boundingSize:](self, "styleTextAsMessage:boundingSize:", v9, width, height);
      v10 = (NUNewsFeedTitleViewStyler *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 2) {
        goto LABEL_8;
      }
      v10 = (NUNewsFeedTitleViewStyler *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v9];
    }
  }
  else
  {
    -[NUNewsFeedTitleViewStyler styleTextAsTitle:boundingSize:](self, "styleTextAsTitle:boundingSize:", v9, width, height);
    v10 = (NUNewsFeedTitleViewStyler *)objc_claimAutoreleasedReturnValue();
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
  objc_super v8 = [(NUNewsFeedTitleViewStyler *)self messageLargeFont];
  v21[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v6 sizeWithAttributes:v9];
  double v11 = v10;

  v18[0] = v7;
  if (v11 <= width) {
    [(NUNewsFeedTitleViewStyler *)self messageLargeFont];
  }
  else {
  v12 = [(NUNewsFeedTitleViewStyler *)self messageSmallFont];
  }
  v19[0] = v12;
  v18[1] = *MEMORY[0x263F1C268];
  v13 = [(NUNewsFeedTitleViewStyler *)self titleParagraphStyleWithWrapping:v11 > width];
  v19[1] = v13;
  v18[2] = *MEMORY[0x263F1C240];
  v14 = [(NUNewsFeedTitleViewStyler *)self textColor];
  v19[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v15];

  return v16;
}

- (id)styleTextAsTitle:(id)a3 boundingSize:(CGSize)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = *MEMORY[0x263F1C238];
  id v5 = a3;
  id v6 = [(NUNewsFeedTitleViewStyler *)self titleExtraLargeFont];
  v13[0] = v6;
  v12[1] = *MEMORY[0x263F1C268];
  uint64_t v7 = [(NUNewsFeedTitleViewStyler *)self titleParagraphStyleWithWrapping:0];
  v13[1] = v7;
  v12[2] = *MEMORY[0x263F1C240];
  objc_super v8 = [(NUNewsFeedTitleViewStyler *)self textColor];
  v12[3] = *MEMORY[0x263F1C248];
  v13[2] = v8;
  v13[3] = &unk_26D4A8D18;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  double v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v9];

  return v10;
}

- (id)messageLargeFont
{
  if (messageLargeFont_onceToken != -1) {
    dispatch_once(&messageLargeFont_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)messageLargeFont_largeFont;

  return v2;
}

void __45__NUNewsFeedTitleViewStyler_messageLargeFont__block_invoke()
{
  id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  uint64_t v0 = [v2 fontWithSize:15.0];
  v1 = (void *)messageLargeFont_largeFont;
  messageLargeFont_largeFont = v0;
}

- (id)messageSmallFont
{
  if (messageSmallFont_onceToken != -1) {
    dispatch_once(&messageSmallFont_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)messageSmallFont_smallFont;

  return v2;
}

void __45__NUNewsFeedTitleViewStyler_messageSmallFont__block_invoke()
{
  id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  uint64_t v0 = [v2 fontWithSize:13.0];
  v1 = (void *)messageSmallFont_smallFont;
  messageSmallFont_smallFont = v0;
}

- (id)titleExtraLargeFont
{
  if (titleExtraLargeFont_onceToken != -1) {
    dispatch_once(&titleExtraLargeFont_onceToken, &__block_literal_global_8);
  }
  id v2 = (void *)titleExtraLargeFont_extraLargeFont;

  return v2;
}

uint64_t __48__NUNewsFeedTitleViewStyler_titleExtraLargeFont__block_invoke()
{
  titleExtraLargeFont_extraLargeFont = [MEMORY[0x263F1C658] systemFontOfSize:29.0 weight:*MEMORY[0x263F1D310]];

  return MEMORY[0x270F9A758]();
}

- (id)titleParagraphStyleWithWrapping:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F1C350] defaultParagraphStyle];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setLineBreakMode:4];
  objc_msgSend(v6, "setAlignment:", -[NUNewsFeedTitleViewStyler textAlignment](self, "textAlignment"));
  if (v3)
  {
    [v6 setMinimumLineHeight:20.0];
    [v6 setMaximumLineHeight:20.0];
  }
  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void).cxx_destruct
{
}

@end