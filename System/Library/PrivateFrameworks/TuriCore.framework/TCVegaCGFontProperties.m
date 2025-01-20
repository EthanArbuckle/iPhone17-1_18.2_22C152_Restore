@interface TCVegaCGFontProperties
- (NSString)cssFontString;
- (NSString)fontFamily;
- (NSString)fontSize;
- (NSString)fontStyle;
- (NSString)fontVariant;
- (NSString)fontWeight;
- (NSString)lineHeight;
- (TCVegaCGFontProperties)initWithString:(id)a3;
- (void)setCssFontString:(id)a3;
- (void)setFontFamily:(id)a3;
- (void)setFontSize:(id)a3;
- (void)setFontStyle:(id)a3;
- (void)setFontVariant:(id)a3;
- (void)setFontWeight:(id)a3;
- (void)setLineHeight:(id)a3;
@end

@implementation TCVegaCGFontProperties

- (TCVegaCGFontProperties)initWithString:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TCVegaCGFontProperties;
  v5 = [(TCVegaCGFontProperties *)&v24 init];
  [(TCVegaCGFontProperties *)v5 setCssFontString:v4];
  [(TCVegaCGFontProperties *)v5 setFontFamily:0];
  [(TCVegaCGFontProperties *)v5 setFontSize:0];
  [(TCVegaCGFontProperties *)v5 setFontVariant:0];
  [(TCVegaCGFontProperties *)v5 setFontWeight:0];
  [(TCVegaCGFontProperties *)v5 setFontStyle:0];
  [(TCVegaCGFontProperties *)v5 setLineHeight:0];
  v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  if (![v7 count]) {
    goto LABEL_32;
  }
  unint64_t v8 = 1;
  while (1)
  {
    v9 = [v7 objectAtIndexedSubscript:v8 - 1];
    if (([v9 isEqualToString:@"normal"] & 1) == 0) {
      break;
    }
LABEL_7:

    if (v8++ >= [v7 count]) {
      goto LABEL_32;
    }
  }
  if (([v9 isEqualToString:@"italic"] & 1) != 0
    || [v9 isEqualToString:@"oblique"])
  {
    [(TCVegaCGFontProperties *)v5 setFontStyle:v9];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"small-caps"])
  {
    [(TCVegaCGFontProperties *)v5 setFontVariant:v9];
    goto LABEL_7;
  }
  if (([v9 isEqualToString:@"bold"] & 1) != 0
    || ([v9 isEqualToString:@"bolder"] & 1) != 0
    || ([v9 isEqualToString:@"lighter"] & 1) != 0
    || ([v9 isEqualToString:@"100"] & 1) != 0
    || ([v9 isEqualToString:@"200"] & 1) != 0
    || ([v9 isEqualToString:@"300"] & 1) != 0
    || ([v9 isEqualToString:@"400"] & 1) != 0
    || ([v9 isEqualToString:@"500"] & 1) != 0
    || ([v9 isEqualToString:@"600"] & 1) != 0
    || ([v9 isEqualToString:@"700"] & 1) != 0
    || ([v9 isEqualToString:@"800"] & 1) != 0
    || [v9 isEqualToString:@"900"])
  {
    [(TCVegaCGFontProperties *)v5 setFontWeight:v9];
    goto LABEL_7;
  }
  v22 = [(TCVegaCGFontProperties *)v5 fontSize];

  if (!v22)
  {
    v23 = [v9 componentsSeparatedByString:@"/"];
    v11 = [v23 objectAtIndexedSubscript:0];
    [(TCVegaCGFontProperties *)v5 setFontSize:v11];

    v12 = v23;
    if ((unint64_t)[v23 count] >= 2)
    {
      v13 = [v23 objectAtIndexedSubscript:1];
      [(TCVegaCGFontProperties *)v5 setLineHeight:v13];

      v12 = v23;
    }

    goto LABEL_7;
  }
  [(TCVegaCGFontProperties *)v5 setFontFamily:v9];
  if (v8 - 1 < [v7 count] - 1)
  {
    v14 = objc_msgSend(v7, "subarrayWithRange:", v8, objc_msgSend(v7, "count") - v8);
    v15 = [(TCVegaCGFontProperties *)v5 fontFamily];
    v16 = [v14 componentsJoinedByString:@" "];
    v17 = [@" " stringByAppendingString:v16];
    v18 = [v15 stringByAppendingString:v17];
    [(TCVegaCGFontProperties *)v5 setFontFamily:v18];
  }
LABEL_32:
  v19 = [(TCVegaCGFontProperties *)v5 fontFamily];
  int v20 = [v19 isEqualToString:@"sans-serif"];

  if (v20) {
    [(TCVegaCGFontProperties *)v5 setFontFamily:@"Helvetica"];
  }

  return v5;
}

- (NSString)cssFontString
{
  return self->cssFontString;
}

- (void)setCssFontString:(id)a3
{
}

- (NSString)fontFamily
{
  return self->fontFamily;
}

- (void)setFontFamily:(id)a3
{
}

- (NSString)fontSize
{
  return self->fontSize;
}

- (void)setFontSize:(id)a3
{
}

- (NSString)fontVariant
{
  return self->fontVariant;
}

- (void)setFontVariant:(id)a3
{
}

- (NSString)fontWeight
{
  return self->fontWeight;
}

- (void)setFontWeight:(id)a3
{
}

- (NSString)fontStyle
{
  return self->fontStyle;
}

- (void)setFontStyle:(id)a3
{
}

- (NSString)lineHeight
{
  return self->lineHeight;
}

- (void)setLineHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lineHeight, 0);
  objc_storeStrong((id *)&self->fontStyle, 0);
  objc_storeStrong((id *)&self->fontWeight, 0);
  objc_storeStrong((id *)&self->fontVariant, 0);
  objc_storeStrong((id *)&self->fontSize, 0);
  objc_storeStrong((id *)&self->fontFamily, 0);
  objc_storeStrong((id *)&self->cssFontString, 0);
}

@end