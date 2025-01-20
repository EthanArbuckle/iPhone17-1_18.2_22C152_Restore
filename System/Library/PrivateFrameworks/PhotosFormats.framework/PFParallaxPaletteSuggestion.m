@interface PFParallaxPaletteSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)dictionaryWithPaletteSuggestion:(id)a3;
+ (id)paletteSuggestionWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSuggestion:(id)a3;
- (PFParallaxColor)primaryColor;
- (PFParallaxColor)secondaryColor;
- (PFParallaxPaletteSuggestion)initWithCoder:(id)a3;
- (PFParallaxPaletteSuggestion)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFParallaxPaletteSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);

  objc_storeStrong((id *)&self->_primaryColor, 0);
}

- (PFParallaxColor)secondaryColor
{
  return self->_secondaryColor;
}

- (PFParallaxColor)primaryColor
{
  return self->_primaryColor;
}

- (PFParallaxPaletteSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryColor"];
  if ([v4 decodeBoolForKey:@"hasSecondaryColor"])
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryColor"];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(PFParallaxPaletteSuggestion *)self initWithPrimaryColor:v5 secondaryColor:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(PFParallaxPaletteSuggestion *)self secondaryColor];

  v5 = [(PFParallaxPaletteSuggestion *)self primaryColor];
  [v7 encodeObject:v5 forKey:@"primaryColor"];

  [v7 encodeBool:v4 != 0 forKey:@"hasSecondaryColor"];
  if (v4)
  {
    v6 = [(PFParallaxPaletteSuggestion *)self secondaryColor];
    [v7 encodeObject:v6 forKey:@"secondaryColor"];
  }
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [(PFParallaxPaletteSuggestion *)self primaryColor];
  v6 = [v4 primaryColor];
  int v7 = [v5 isEqualToParallaxColor:v6];

  if (!v7) {
    goto LABEL_7;
  }
  v8 = [(PFParallaxPaletteSuggestion *)self secondaryColor];
  if (v8)
  {

    goto LABEL_4;
  }
  v14 = [v4 secondaryColor];

  if (v14)
  {
LABEL_7:
    char v13 = 0;
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v9 = [(PFParallaxPaletteSuggestion *)self secondaryColor];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(PFParallaxPaletteSuggestion *)self secondaryColor];
    v12 = [v4 secondaryColor];
    char v13 = [v11 isEqualToParallaxColor:v12];
  }
  else
  {
    char v13 = 1;
  }
LABEL_9:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PFParallaxPaletteSuggestion *)self isEqualToSuggestion:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(PFParallaxPaletteSuggestion *)self primaryColor];
  v6 = [(PFParallaxPaletteSuggestion *)self secondaryColor];
  int v7 = [v3 stringWithFormat:@"<%@: %p, primary: %@, secondary: %@>", v4, self, v5, v6];

  return v7;
}

- (PFParallaxPaletteSuggestion)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4
{
  v6 = (PFParallaxColor *)a3;
  int v7 = (PFParallaxColor *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFParallaxPaletteSuggestion;
  v8 = [(PFParallaxPaletteSuggestion *)&v13 init];
  primaryColor = v8->_primaryColor;
  v8->_primaryColor = v6;
  v10 = v6;

  secondaryColor = v8->_secondaryColor;
  v8->_secondaryColor = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)paletteSuggestionWithDictionary:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"primaryColor"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_20;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    int v7 = [NSString stringWithFormat:@"Invalid primary color array: %@", v5];
    v18[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [v10 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v8];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  int v7 = +[PFParallaxColor colorWithRGBValues:v6 error:a4];
  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"secondaryColor"];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
LABEL_17:
          v11 = 0;
          goto LABEL_18;
        }
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v9 = [NSString stringWithFormat:@"Invalid secondary color array: %@", v5, *MEMORY[0x1E4F28228]];
        v16 = v9;
        objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        *a4 = [v12 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v13];

        v11 = 0;
LABEL_16:

LABEL_18:
        goto LABEL_19;
      }
      uint64_t v9 = +[PFParallaxColor colorWithRGBValues:v8 error:a4];
      if (!v9) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    v11 = [[PFParallaxPaletteSuggestion alloc] initWithPrimaryColor:v7 secondaryColor:v9];
    goto LABEL_16;
  }
  v11 = 0;
LABEL_19:

LABEL_20:

  return v11;
}

+ (id)dictionaryWithPaletteSuggestion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  id v5 = [v3 primaryColor];
  v6 = [v5 RGBValues];
  [v4 setObject:v6 forKeyedSubscript:@"primaryColor"];

  int v7 = [v3 secondaryColor];

  if (v7)
  {
    v8 = [v3 secondaryColor];
    uint64_t v9 = [v8 RGBValues];
    [v4 setObject:v9 forKeyedSubscript:@"secondaryColor"];
  }

  return v4;
}

@end