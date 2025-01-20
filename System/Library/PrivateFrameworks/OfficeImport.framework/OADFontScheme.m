@interface OADFontScheme
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (OADFontCollection)majorFont;
- (OADFontCollection)minorFont;
- (OADFontScheme)init;
- (id)fontForId:(int)a3;
- (unint64_t)hash;
- (void)setName:(id)a3;
- (void)validateFontScheme;
@end

@implementation OADFontScheme

- (OADFontScheme)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADFontScheme;
  v2 = [(OADFontScheme *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    majorFont = v2->_majorFont;
    v2->_majorFont = (OADFontCollection *)v3;

    uint64_t v5 = objc_opt_new();
    minorFont = v2->_minorFont;
    v2->_minorFont = (OADFontCollection *)v5;
  }
  return v2;
}

- (OADFontCollection)majorFont
{
  return self->_majorFont;
}

- (OADFontCollection)minorFont
{
  return self->_minorFont;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    if ([(OADFontCollection *)self->_majorFont isEqualToFontCollection:v7[2]]) {
      BOOL v6 = [(OADFontCollection *)self->_minorFont isEqualToFontCollection:v7[3]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  id v4 = [(OADBaseFontCollection *)self->_majorFont latinFont];
  uint64_t v5 = [v4 hash];
  BOOL v6 = [(OADBaseFontCollection *)self->_minorFont latinFont];
  unint64_t v7 = (v5 << 8) + (v3 << 16) + [v6 hash];

  return v7;
}

- (BOOL)isEmpty
{
  BOOL v3 = [(OADFontCollection *)self->_majorFont isEmpty];
  if (v3)
  {
    minorFont = self->_minorFont;
    LOBYTE(v3) = [(OADFontCollection *)minorFont isEmpty];
  }
  return v3;
}

- (id)fontForId:(int)a3
{
  if (a3 == 1)
  {
    BOOL v3 = [(OADFontScheme *)self minorFont];
  }
  else if (a3)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(OADFontScheme *)self majorFont];
  }
  return v3;
}

- (void)validateFontScheme
{
  if (!self->_name)
  {
    self->_name = (NSString *)@"Office";
  }
  BOOL v3 = [(OADBaseFontCollection *)self->_majorFont latinFont];
  uint64_t v4 = [v3 length];

  if (!v4) {
    [(OADBaseFontCollection *)self->_majorFont setLatinFont:@"Calibri"];
  }
  uint64_t v5 = [(OADBaseFontCollection *)self->_minorFont latinFont];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    minorFont = self->_minorFont;
    [(OADBaseFontCollection *)minorFont setLatinFont:@"Cambria"];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end