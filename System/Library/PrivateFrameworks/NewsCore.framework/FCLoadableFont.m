@interface FCLoadableFont
+ (FCLoadableFont)loadableFontWithName:(id)a3 url:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)fontName;
- (NSURL)fontURL;
- (id)description;
- (unint64_t)hash;
- (void)setFontName:(id)a3;
- (void)setFontURL:(id)a3;
@end

@implementation FCLoadableFont

- (NSString)fontName
{
  return self->_fontName;
}

+ (FCLoadableFont)loadableFontWithName:(id)a3 url:(id)a4
{
  v4 = (FCLoadableFont *)a3;
  if (a3)
  {
    id v5 = a4;
    v6 = v4;
    v4 = objc_alloc_init(FCLoadableFont);
    [(FCLoadableFont *)v4 setFontName:v6];

    [(FCLoadableFont *)v4 setFontURL:v5];
  }
  return v4;
}

- (void)setFontURL:(id)a3
{
}

- (void)setFontName:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  v7 = [(FCLoadableFont *)self fontName];
  v8 = [v6 fontName];
  if ([v7 isEqualToString:v8])
  {
    v9 = (void *)MEMORY[0x1E4FBA8A8];
    v10 = [(FCLoadableFont *)self fontURL];
    v11 = [v6 fontURL];
    char v12 = objc_msgSend(v9, "nf_object:isEqualToObject:", v10, v11);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(FCLoadableFont *)self fontName];
  uint64_t v4 = [v3 hash];
  id v5 = [(FCLoadableFont *)self fontURL];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  uint64_t v4 = [(FCLoadableFont *)self fontName];
  [(FCDescription *)v3 addField:@"fontName" value:v4];

  id v5 = [(FCLoadableFont *)self fontURL];
  unint64_t v6 = [v5 absoluteString];
  [(FCDescription *)v3 addField:@"fontURL" value:v6];

  v7 = [(FCDescription *)v3 descriptionString];

  return v7;
}

- (NSURL)fontURL
{
  return self->_fontURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontURL, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end