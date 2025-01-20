@interface OCFont
+ (id)fontWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5;
- (BOOL)bold;
- (BOOL)italic;
- (OCFont)initWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5;
- (OCFontSubfamily)subfamily;
- (void)setBold:(BOOL)a3;
- (void)setItalic:(BOOL)a3;
@end

@implementation OCFont

- (OCFont)initWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OCFont;
  v10 = [(OCFont *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_subfamily, a3);
    v11->_bold = a4;
    v11->_italic = a5;
  }

  return v11;
}

+ (id)fontWithSubfamily:(id)a3 bold:(BOOL)a4 italic:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[OCFont alloc] initWithSubfamily:v7 bold:v6 italic:v5];

  return v8;
}

- (OCFontSubfamily)subfamily
{
  return self->_subfamily;
}

- (BOOL)bold
{
  return self->_bold;
}

- (void)setBold:(BOOL)a3
{
  self->_bold = a3;
}

- (BOOL)italic
{
  return self->_italic;
}

- (void)setItalic:(BOOL)a3
{
  self->_italic = a3;
}

- (void).cxx_destruct
{
}

@end