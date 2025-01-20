@interface SXSystemFontFace
- (NSDictionary)fontDescriptorAttributes;
- (NSString)description;
- (NSString)fontName;
- (SXFontAttributes)fontAttributes;
- (SXSystemFontFace)initWithMetadata:(id)a3;
- (id)fontAttributesForMetadata:(id)a3;
- (int64_t)fontStyleForValue:(id)a3;
- (int64_t)fontWeightForValue:(id)a3;
- (int64_t)fontWidthForValue:(id)a3;
@end

@implementation SXSystemFontFace

- (SXSystemFontFace)initWithMetadata:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXSystemFontFace;
  v5 = [(SXSystemFontFace *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"ps"];
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v6;

    uint64_t v8 = [(SXSystemFontFace *)v5 fontAttributesForMetadata:v4];
    fontAttributes = v5->_fontAttributes;
    v5->_fontAttributes = (SXFontAttributes *)v8;
  }
  return v5;
}

- (NSDictionary)fontDescriptorAttributes
{
  v26[2] = *MEMORY[0x263EF8340];
  v25[0] = *MEMORY[0x263F1D1F0];
  v3 = [(SXSystemFontFace *)self fontName];
  v26[0] = v3;
  v25[1] = *MEMORY[0x263F1D210];
  v23[0] = *MEMORY[0x263F1D350];
  id v4 = NSNumber;
  v5 = [(SXSystemFontFace *)self fontAttributes];
  uint64_t v6 = [v5 weight];
  if (v6 <= 499)
  {
    if (v6 > 299)
    {
      if (v6 == 300)
      {
        v7 = (double *)MEMORY[0x263F1D328];
        goto LABEL_21;
      }
    }
    else
    {
      if (v6 == 100)
      {
        v7 = (double *)MEMORY[0x263F1D348];
        goto LABEL_21;
      }
      if (v6 == 200)
      {
        v7 = (double *)MEMORY[0x263F1D358];
        goto LABEL_21;
      }
    }
LABEL_15:
    v7 = (double *)MEMORY[0x263F1D338];
    goto LABEL_21;
  }
  if (v6 <= 699)
  {
    if (v6 == 500)
    {
      v7 = (double *)MEMORY[0x263F1D330];
      goto LABEL_21;
    }
    if (v6 == 600)
    {
      v7 = (double *)MEMORY[0x263F1D340];
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  if (v6 == 700)
  {
    v7 = (double *)MEMORY[0x263F1D318];
    goto LABEL_21;
  }
  if (v6 == 800)
  {
    v7 = (double *)MEMORY[0x263F1D320];
    goto LABEL_21;
  }
  if (v6 != 900) {
    goto LABEL_15;
  }
  v7 = (double *)MEMORY[0x263F1D310];
LABEL_21:
  uint64_t v8 = [v4 numberWithDouble:*v7];
  v24[0] = v8;
  v23[1] = *MEMORY[0x263F1D360];
  v9 = NSNumber;
  v10 = [(SXSystemFontFace *)self fontAttributes];
  uint64_t v11 = [v10 width];
  double v12 = 0.4;
  switch(v11)
  {
    case 0:
      v13 = (double *)MEMORY[0x263F03C58];
      goto LABEL_32;
    case 1:
    case 2:
      v13 = (double *)MEMORY[0x263F03C20];
      goto LABEL_32;
    case 3:
      v13 = (double *)MEMORY[0x263F03C08];
      goto LABEL_32;
    case 4:
      v13 = (double *)MEMORY[0x263F03C28];
      goto LABEL_32;
    case 5:
      v13 = (double *)MEMORY[0x263F03C10];
      goto LABEL_32;
    case 6:
      v13 = (double *)MEMORY[0x263F03C38];
      goto LABEL_32;
    case 8:
      v13 = (double *)MEMORY[0x263F03C40];
      goto LABEL_32;
    case 9:
      v13 = (double *)MEMORY[0x263F03C18];
      goto LABEL_32;
    case 10:
      v13 = (double *)MEMORY[0x263F03C30];
      goto LABEL_32;
    case 11:
      goto LABEL_33;
    default:
      v13 = (double *)MEMORY[0x263F03C48];
LABEL_32:
      double v12 = *v13;
LABEL_33:
      v14 = [v9 numberWithDouble:v12];
      v24[1] = v14;
      v23[2] = *MEMORY[0x263F1D228];
      v15 = NSNumber;
      v16 = [(SXSystemFontFace *)self fontAttributes];
      uint64_t v17 = [v16 style];
      double v18 = 0.06944444;
      if ((unint64_t)(v17 - 1) >= 2) {
        double v18 = 0.0;
      }
      v19 = [v15 numberWithDouble:v18];
      v24[2] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
      v26[1] = v20;
      v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

      return (NSDictionary *)v21;
  }
}

- (id)fontAttributesForMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"f"];
  uint64_t v6 = [v4 objectForKey:@"wi"];
  v7 = [v4 objectForKey:@"we"];
  uint64_t v8 = [v4 objectForKey:@"s"];

  v9 = [[SXFontAttributes alloc] initWithFamilyName:v5 weight:[(SXSystemFontFace *)self fontWeightForValue:v7] width:[(SXSystemFontFace *)self fontWidthForValue:v6] style:[(SXSystemFontFace *)self fontStyleForValue:v8] grade:0];
  return v9;
}

- (int64_t)fontWidthForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t v4 = [v3 integerValue], v4 <= 9)) {
    int64_t v5 = qword_222BEF430[v4];
  }
  else {
    int64_t v5 = 7;
  }

  return v5;
}

- (int64_t)fontWeightForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v4 = [v3 integerValue];
  int64_t v5 = v4;
  if (v4 <= 499)
  {
    if (v4 > 299)
    {
      if (v4 != 300 && v4 != 400) {
        goto LABEL_17;
      }
    }
    else if (v4 != 100 && v4 != 200)
    {
      goto LABEL_17;
    }
  }
  else if (v4 <= 699)
  {
    if (v4 != 500 && v4 != 600) {
      goto LABEL_17;
    }
  }
  else if (v4 != 700 && v4 != 800 && v4 != 900)
  {
LABEL_17:
    int64_t v5 = 400;
  }

  return v5;
}

- (int64_t)fontStyleForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || ([v3 isEqualToString:@"n"]) {
    goto LABEL_7;
  }
  if (([v3 isEqualToString:@"i"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"o"])
    {
      int64_t v4 = 2;
      goto LABEL_8;
    }
LABEL_7:
    int64_t v4 = 0;
    goto LABEL_8;
  }
  int64_t v4 = 1;
LABEL_8:

  return v4;
}

- (NSString)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  int64_t v4 = [(SXSystemFontFace *)self fontName];
  [v3 appendFormat:@"; PostScript name: %@", v4];

  int64_t v5 = [(SXSystemFontFace *)self fontAttributes];
  [v3 appendFormat:@"; attributes: %@", v5];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (SXFontAttributes)fontAttributes
{
  return self->_fontAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end