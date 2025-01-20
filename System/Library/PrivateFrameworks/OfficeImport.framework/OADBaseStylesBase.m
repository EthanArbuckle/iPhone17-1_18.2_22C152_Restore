@interface OADBaseStylesBase
- (OADColorScheme)colorScheme;
- (OADFontScheme)fontScheme;
- (OADStyleMatrix)styleMatrix;
- (id)description;
- (void)setColorScheme:(id)a3;
- (void)setFontScheme:(id)a3;
- (void)setStyleMatrix:(id)a3;
@end

@implementation OADBaseStylesBase

- (OADFontScheme)fontScheme
{
  return self->mFontScheme;
}

- (OADColorScheme)colorScheme
{
  return self->mColorScheme;
}

- (OADStyleMatrix)styleMatrix
{
  return self->mStyleMatrix;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADBaseStylesBase;
  v2 = [(OADBaseStylesBase *)&v4 description];
  return v2;
}

- (void)setColorScheme:(id)a3
{
}

- (void)setStyleMatrix:(id)a3
{
}

- (void)setFontScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontScheme, 0);
  objc_storeStrong((id *)&self->mStyleMatrix, 0);
  objc_storeStrong((id *)&self->mColorScheme, 0);
}

@end