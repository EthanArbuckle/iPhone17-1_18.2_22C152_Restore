@interface OADBaseFontCollection
- (BOOL)isEmpty;
- (BOOL)isEqualToBaseFontCollection:(id)a3;
- (NSString)complexScriptFont;
- (NSString)eastAsianFont;
- (NSString)latinFont;
- (id)baseFontForId:(int)a3;
- (void)setBaseFont:(id)a3 forId:(int)a4;
- (void)setComplexScriptFont:(id)a3;
- (void)setEastAsianFont:(id)a3;
- (void)setLatinFont:(id)a3;
@end

@implementation OADBaseFontCollection

- (id)baseFontForId:(int)a3
{
  if (a3 == 2)
  {
    v3 = [(OADBaseFontCollection *)self complexScriptFont];
  }
  else if (a3 == 1)
  {
    v3 = [(OADBaseFontCollection *)self eastAsianFont];
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(OADBaseFontCollection *)self latinFont];
  }
  return v3;
}

- (void)setBaseFont:(id)a3 forId:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 2:
      [(OADBaseFontCollection *)self setComplexScriptFont:v6];
      break;
    case 1:
      [(OADBaseFontCollection *)self setEastAsianFont:v6];
      break;
    case 0:
      [(OADBaseFontCollection *)self setLatinFont:v6];
      break;
  }
}

- (BOOL)isEqualToBaseFontCollection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(OADBaseFontCollection *)self latinFont];
    id v6 = [v4 latinFont];
    if (TCObjectEqual(v5, v6))
    {
      id v7 = [(OADBaseFontCollection *)self eastAsianFont];
      v8 = [v4 eastAsianFont];
      if (TCObjectEqual(v7, v8))
      {
        v9 = [(OADBaseFontCollection *)self complexScriptFont];
        v10 = [v4 complexScriptFont];
        char v11 = TCObjectEqual(v9, v10);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEmpty
{
  v3 = [(OADBaseFontCollection *)self latinFont];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(OADBaseFontCollection *)self eastAsianFont];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(OADBaseFontCollection *)self complexScriptFont];
      BOOL v4 = v6 == 0;
    }
  }

  return v4;
}

- (NSString)latinFont
{
  return self->_latinFont;
}

- (void)setLatinFont:(id)a3
{
}

- (NSString)eastAsianFont
{
  return self->_eastAsianFont;
}

- (void)setEastAsianFont:(id)a3
{
}

- (NSString)complexScriptFont
{
  return self->_complexScriptFont;
}

- (void)setComplexScriptFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complexScriptFont, 0);
  objc_storeStrong((id *)&self->_eastAsianFont, 0);
  objc_storeStrong((id *)&self->_latinFont, 0);
}

@end