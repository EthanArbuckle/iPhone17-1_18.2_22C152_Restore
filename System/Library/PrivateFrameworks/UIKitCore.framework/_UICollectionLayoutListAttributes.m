@interface _UICollectionLayoutListAttributes
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setSeparatorVisualEffect:(uint64_t)a1;
@end

@implementation _UICollectionLayoutListAttributes

- (BOOL)isEqual:(id)a3
{
  v4 = (_UICollectionLayoutListAttributes *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    p_isa = (void **)&v6->super.isa;
    if (self->_appearanceStyle == v6->_appearanceStyle
      && ($73E75C5D3991E8012C8D7E8A41E2786F flags = self->_flags, v9 = v6->_flags, ((*(_DWORD *)&v9 ^ *(_DWORD *)&flags) & 1) == 0)
      && (int v10 = (*(unsigned int *)&flags >> 1) & 1, v10 == ((*(unsigned int *)&v9 >> 1) & 1))
      && (!v10 || self->_backgroundMaskedCorners == v6->_backgroundMaskedCorners)
      && vabdd_f64(self->_maxWidth, v6->_maxWidth) <= 2.22044605e-16
      && UIEqual(self->_sectionData, v6->_sectionData)
      && UIEqual(self->_sectionBackgroundColor, p_isa[5])
      && UIEqual(self->_separatorBackgroundColor, p_isa[6]))
    {
      char v11 = UIEqual(self->_separatorVisualEffect, p_isa[7]);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sectionData, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    *($73E75C5D3991E8012C8D7E8A41E2786F *)(v4 + 8) = self->_flags;
    *(void *)(v4 + 16) = self->_appearanceStyle;
    *(void *)(v4 + 24) = self->_backgroundMaskedCorners;
    objc_storeStrong((id *)(v4 + 32), self->_sectionData);
    objc_storeStrong((id *)(v5 + 40), self->_sectionBackgroundColor);
    objc_storeStrong((id *)(v5 + 48), self->_separatorBackgroundColor);
    objc_storeStrong((id *)(v5 + 56), self->_separatorVisualEffect);
    *(double *)(v5 + 64) = self->_maxWidth;
  }
  return (id)v5;
}

- (void)setSeparatorVisualEffect:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (unint64_t)hash
{
  uint64_t v2 = 31;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    uint64_t v2 = 0;
  }
  return v2 ^ self->_appearanceStyle;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"appearanceStyle = %ld", self->_appearanceStyle);
  [v3 addObject:v4];

  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  v6 = [NSString stringWithFormat:@"stylesFirstItemAsHeader = %@", v5];
  [v3 addObject:v6];

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"backgroundMaskedCorners = %lu", self->_backgroundMaskedCorners);
    [v3 addObject:v7];
  }
  if (self->_sectionData)
  {
    v8 = [NSString stringWithFormat:@"sectionData = %@", self->_sectionData];
    [v3 addObject:v8];
  }
  if (self->_sectionBackgroundColor)
  {
    $73E75C5D3991E8012C8D7E8A41E2786F v9 = [NSString stringWithFormat:@"sectionBackgroundColor = %@", self->_sectionBackgroundColor];
    [v3 addObject:v9];
  }
  if (self->_separatorBackgroundColor)
  {
    int v10 = [NSString stringWithFormat:@"separatorBackgroundColor = %@", self->_separatorBackgroundColor];
    [v3 addObject:v10];
  }
  if (self->_separatorVisualEffect)
  {
    char v11 = [NSString stringWithFormat:@"separatorVisualEffect = %@", self->_separatorVisualEffect];
    [v3 addObject:v11];
  }
  if (self->_maxWidth != 0.0)
  {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"maxWidth = %g", *(void *)&self->_maxWidth);
    [v3 addObject:v12];
  }
  v13 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v16 = [v3 componentsJoinedByString:@"; "];
  v17 = [v13 stringWithFormat:@"<%@: %p; %@>", v15, self, v16];

  return v17;
}

@end