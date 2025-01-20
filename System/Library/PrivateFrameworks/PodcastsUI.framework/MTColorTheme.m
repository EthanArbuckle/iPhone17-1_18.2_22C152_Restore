@interface MTColorTheme
- (BOOL)isBackgroundDark;
- (BOOL)isBackgroundLight;
- (BOOL)isEqual:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (void)setBackgroundColor:(id)a3;
- (void)setIsBackgroundLight:(BOOL)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
@end

@implementation MTColorTheme

- (BOOL)isEqual:(id)a3
{
  v4 = (MTColorTheme *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    BOOL v5 = [(MTColorTheme *)self isBackgroundLight];
    if (v5 != [(MTColorTheme *)v4 isBackgroundLight]) {
      goto LABEL_6;
    }
    v6 = [(MTColorTheme *)self backgroundColor];
    v7 = [v6 description];
    v8 = [(MTColorTheme *)v4 backgroundColor];
    v9 = [v8 description];
    int v10 = [v7 isEqual:v9];

    if (!v10) {
      goto LABEL_6;
    }
    v11 = [(MTColorTheme *)self primaryTextColor];
    v12 = [v11 description];
    v13 = [(MTColorTheme *)v4 primaryTextColor];
    v14 = [v13 description];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      v16 = [(MTColorTheme *)self secondaryTextColor];
      v17 = [v16 description];
      v18 = [(MTColorTheme *)v4 secondaryTextColor];
      v19 = [v18 description];
      char v20 = [v17 isEqual:v19];
    }
    else
    {
LABEL_6:
      char v20 = 0;
    }
  }

  return v20;
}

- (BOOL)isBackgroundDark
{
  return ![(MTColorTheme *)self isBackgroundLight];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (BOOL)isBackgroundLight
{
  return self->_isBackgroundLight;
}

- (void)setIsBackgroundLight:(BOOL)a3
{
  self->_isBackgroundLight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end