@interface SearchUIColorRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToColorRequest:(id)a3;
- (SFColor)sfColor;
- (TLKAppearance)appearance;
- (unint64_t)hash;
- (void)setAppearance:(id)a3;
- (void)setSfColor:(id)a3;
@end

@implementation SearchUIColorRequest

- (unint64_t)hash
{
  v3 = [(SearchUIColorRequest *)self sfColor];
  uint64_t v4 = [v3 hash];
  v5 = [(SearchUIColorRequest *)self appearance];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SearchUIColorRequest *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SearchUIColorRequest *)self isEqualToColorRequest:v5];

  return v6;
}

- (BOOL)isEqualToColorRequest:(id)a3
{
  uint64_t v4 = (SearchUIColorRequest *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v5 = [(SearchUIColorRequest *)self sfColor];
    BOOL v6 = [(SearchUIColorRequest *)v4 sfColor];
    if ([v5 isEqual:v6])
    {
      v7 = [(SearchUIColorRequest *)self appearance];
      v8 = [(SearchUIColorRequest *)v4 appearance];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (SFColor)sfColor
{
  return self->_sfColor;
}

- (void)setSfColor:(id)a3
{
}

- (TLKAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_sfColor, 0);
}

@end