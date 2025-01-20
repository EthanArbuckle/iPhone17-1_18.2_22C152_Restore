@interface PencilEducationElementData
+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4;
+ (id)prefixForElementType:(int64_t)a3;
- (NSString)languageID;
- (NSString)placeholderTextContent;
- (NSString)subtitle;
- (NSString)textContent;
- (NSString)title;
- (int64_t)type;
- (void)setLanguageID:(id)a3;
- (void)setPlaceholderTextContent:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextContent:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PencilEducationElementData

+ (id)elementDataForType:(int64_t)a3 languageID:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(PencilEducationElementData);
  v8 = [a1 prefixForElementType:a3];
  if (v8)
  {
    v9 = v8;
    v10 = [v8 stringByAppendingString:@"_"];

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [(PencilEducationElementData *)v7 setLanguageID:v6];
    v12 = [v10 stringByAppendingString:@"TITLE"];
    v13 = [v11 localizedStringForKey:v12 value:&stru_26ECD9920 table:@"PencilSettings"];
    [(PencilEducationElementData *)v7 setTitle:v13];

    v14 = [v10 stringByAppendingString:@"TEXT_CONTENT"];
    v15 = PKLocalizedStringForLanguageInBundle(v14, v6, v11, @"PencilSettings");
    [(PencilEducationElementData *)v7 setTextContent:v15];

    v16 = [v10 stringByAppendingString:@"PLACEHOLDER_TEXT_CONTENT"];
    v17 = PKLocalizedStringForLanguageInBundle(v16, v6, v11, @"PencilSettings");
    [(PencilEducationElementData *)v7 setPlaceholderTextContent:v17];

    [(PencilEducationElementData *)v7 setType:a3];
  }

  return v7;
}

+ (id)prefixForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_264DA59D8[a3];
  }
}

- (NSString)title
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