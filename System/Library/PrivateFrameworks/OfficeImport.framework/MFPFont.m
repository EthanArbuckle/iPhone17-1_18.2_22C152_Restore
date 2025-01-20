@interface MFPFont
- (__CTFont)createCTFontWithGraphics:(id)a3;
- (float)size;
- (id)name;
- (int)unit;
- (unsigned)flags;
- (void)setFlags:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setSize:(float)a3;
- (void)setUnit:(int)a3;
@end

@implementation MFPFont

- (float)size
{
  return self->mSize;
}

- (void)setSize:(float)a3
{
  self->mSize = a3;
}

- (int)unit
{
  return self->mUnit;
}

- (void)setUnit:(int)a3
{
  self->mUnit = a3;
}

- (unsigned)flags
{
  return self->mFlags;
}

- (void)setFlags:(unsigned int)a3
{
  self->mFlags = a3;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
}

- (__CTFont)createCTFontWithGraphics:(id)a3
{
  id v4 = a3;
  v5 = self->mName;
  if ([(NSString *)v5 isEqualToString:@"ZAPFDINGBATS"])
  {

    v5 = (NSString *)@"ZAPF DINGBATS";
  }
  v6 = [v4 fontNameForUppercaseFontName:v5];
  if (![(NSString *)v6 length])
  {

    v6 = (NSString *)@"Helvetica";
  }
  float v7 = fabsf(self->mSize) * 4.0 / 3.0;
  v8 = TCCreateFontWithFamilyName(v6, self->mFlags & 1, (self->mFlags >> 1) & 1, v7);

  return v8;
}

- (void).cxx_destruct
{
}

@end