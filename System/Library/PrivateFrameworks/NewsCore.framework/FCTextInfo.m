@interface FCTextInfo
+ (id)textInfoFromJSONValues:(id)a3 URLGenerator:(id)a4;
- (FCColor)color;
- (FCLoadableFont)font;
- (double)fontSizeWithInitialFontSize:(double)a3;
- (double)lineHeightMultiplier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)fontSizeAdjustment;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontSizeAdjustment:(int64_t)a3;
- (void)setLineHeightMultiplier:(double)a3;
@end

@implementation FCTextInfo

+ (id)textInfoFromJSONValues:(id)a3 URLGenerator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(FCTextInfo);
    v8 = [v5 objectForKeyedSubscript:@"lineHeightMultiplier"];
    [v8 floatValue];
    [(FCTextInfo *)v7 setLineHeightMultiplier:v9];

    v10 = [v5 objectForKeyedSubscript:@"fontSizeAdjustment"];
    [v10 floatValue];
    [(FCTextInfo *)v7 setFontSizeAdjustment:(uint64_t)v11];

    v12 = [v5 objectForKeyedSubscript:@"fontColor"];
    if ([v12 length])
    {
      v13 = +[FCColor colorWithHexString:v12];
      [(FCTextInfo *)v7 setColor:v13];
    }
    else
    {
      [(FCTextInfo *)v7 setColor:0];
    }
    v14 = [v5 objectForKeyedSubscript:@"fontResourceID"];
    if (v14)
    {
      v15 = [v6 generateURLForResourceID:v14];
    }
    else
    {
      v15 = 0;
    }
    v16 = [v5 objectForKeyedSubscript:@"fontName"];
    v17 = +[FCLoadableFont loadableFontWithName:v16 url:v15];
    [(FCTextInfo *)v7 setFont:v17];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[FCTextInfo allocWithZone:](FCTextInfo, "allocWithZone:") init];
  [(FCTextInfo *)self lineHeightMultiplier];
  -[FCTextInfo setLineHeightMultiplier:](v5, "setLineHeightMultiplier:");
  [(FCTextInfo *)v5 setFontSizeAdjustment:[(FCTextInfo *)self fontSizeAdjustment]];
  id v6 = [(FCTextInfo *)self color];
  v7 = (void *)[v6 copyWithZone:a3];
  [(FCTextInfo *)v5 setColor:v7];

  v8 = [(FCTextInfo *)self font];
  float v9 = (void *)[v8 copyWithZone:a3];
  [(FCTextInfo *)v5 setFont:v9];

  return v5;
}

- (void)setLineHeightMultiplier:(double)a3
{
  self->_lineHeightMultiplier = a3;
}

- (void)setFontSizeAdjustment:(int64_t)a3
{
  self->_fontSizeAdjustment = a3;
}

- (void)setFont:(id)a3
{
}

- (void)setColor:(id)a3
{
}

- (FCLoadableFont)font
{
  return self->_font;
}

- (double)lineHeightMultiplier
{
  return self->_lineHeightMultiplier;
}

- (int64_t)fontSizeAdjustment
{
  return self->_fontSizeAdjustment;
}

- (FCColor)color
{
  return self->_color;
}

- (double)fontSizeWithInitialFontSize:(double)a3
{
  return (double)[(FCTextInfo *)self fontSizeAdjustment] + a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end