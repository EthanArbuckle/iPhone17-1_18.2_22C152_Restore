@interface PencilHandwritingEducationElementData
+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4;
+ (id)prefixForElementType:(int64_t)a3;
- (NSAttributedString)title;
- (NSString)languageID;
- (NSString)placeholderTextContent;
- (NSString)subtitle;
- (NSString)textContent;
- (int64_t)type;
- (void)setLanguageID:(id)a3;
- (void)setPlaceholderTextContent:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextContent:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PencilHandwritingEducationElementData

+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(PencilHandwritingEducationElementData);
  v8 = [a1 prefixForElementType:a3];
  if (v8)
  {
    v9 = v8;
    v10 = [v8 stringByAppendingString:@"_"];

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [(PencilHandwritingEducationElementData *)v7 setLanguageID:v6];
    if (a3)
    {
      id v12 = objc_alloc(MEMORY[0x263F086A0]);
      id v13 = [v10 stringByAppendingString:@"TITLE"];
      v14 = [v11 localizedStringForKey:v13 value:&stru_26ECD9920 table:@"PencilSettings"];
      v15 = (void *)[v12 initWithString:v14];
      [(PencilHandwritingEducationElementData *)v7 setTitle:v15];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x263F81678]);
      v16 = [MEMORY[0x263F1C6B0] systemImageNamed:@"ellipsis.circle"];
      v17 = [v16 imageWithRenderingMode:2];
      [v13 setImage:v17];

      id v18 = objc_alloc(MEMORY[0x263F089B8]);
      v19 = [v10 stringByAppendingString:@"TITLE_1"];
      v20 = [v11 localizedStringForKey:v19 value:&stru_26ECD9920 table:@"PencilSettings"];
      v14 = (void *)[v18 initWithString:v20];

      v21 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v13];
      [v14 appendAttributedString:v21];

      id v22 = objc_alloc(MEMORY[0x263F089B8]);
      v23 = [v10 stringByAppendingString:@"TITLE_2"];
      v24 = [v11 localizedStringForKey:v23 value:&stru_26ECD9920 table:@"PencilSettings"];
      v25 = (void *)[v22 initWithString:v24];
      [v14 appendAttributedString:v25];

      [(PencilHandwritingEducationElementData *)v7 setTitle:v14];
    }

    v26 = [v10 stringByAppendingString:@"TEXT_CONTENT"];
    v27 = PKLocalizedStringForLanguageInBundle(v26, v6, v11, @"PencilSettings");
    [(PencilHandwritingEducationElementData *)v7 setTextContent:v27];

    v28 = [v10 stringByAppendingString:@"PLACEHOLDER_TEXT_CONTENT"];
    v29 = PKLocalizedStringForLanguageInBundle(v28, v6, v11, @"PencilSettings");
    [(PencilHandwritingEducationElementData *)v7 setPlaceholderTextContent:v29];

    [(PencilHandwritingEducationElementData *)v7 setType:a3];
  }

  return v7;
}

+ (id)prefixForElementType:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"AUTO_REFINE";
  }
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
}

- (NSString)placeholderTextContent
{
  return self->_placeholderTextContent;
}

- (void)setPlaceholderTextContent:(id)a3
{
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setLanguageID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_placeholderTextContent, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end