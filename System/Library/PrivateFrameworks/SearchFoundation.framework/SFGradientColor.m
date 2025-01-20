@interface SFGradientColor
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGradientType;
- (BOOL)isEqual:(id)a3;
- (NSArray)colors;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFGradientColor)initWithCoder:(id)a3;
- (SFGradientColor)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)gradientType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setColors:(id)a3;
- (void)setGradientType:(int)a3;
@end

@implementation SFGradientColor

- (void).cxx_destruct
{
}

- (int)gradientType
{
  return self->_gradientType;
}

- (void)setColors:(id)a3
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFGradientColor;
  unint64_t v3 = [(SFColor *)&v8 hash];
  v4 = [(SFGradientColor *)self colors];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFGradientColor *)self gradientType] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFGradientColor *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFGradientColor *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFGradientColor;
      if ([(SFColor *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFGradientColor *)self colors];
        v9 = [(SFGradientColor *)v7 colors];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFGradientColor *)self colors];
        if (!v10
          || ([(SFGradientColor *)self colors],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFGradientColor *)v7 colors],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(SFGradientColor *)self gradientType];
          BOOL v11 = v12 == [(SFGradientColor *)v7 gradientType];
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFGradientColor;
  id v4 = [(SFColor *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFGradientColor *)self colors];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setColors:v6];

  objc_msgSend(v4, "setGradientType:", -[SFGradientColor gradientType](self, "gradientType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBGradientColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBGradientColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBGradientColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBGradientColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFGradientColor;
  [(SFColor *)&v3 encodeWithCoder:a3];
}

- (SFGradientColor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFGradientColor *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBColor alloc] initWithData:v6];
  objc_super v8 = [[SFColor alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFColor *)v8 colors];
    [(SFGradientColor *)v5 setColors:v9];

    [(SFGradientColor *)v5 setGradientType:[(SFColor *)v8 gradientType]];
    [(SFColor *)v8 redComponent];
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    [(SFColor *)v8 greenComponent];
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    [(SFColor *)v8 blueComponent];
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    [(SFColor *)v8 alphaComponent];
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    [(SFColor *)v5 setColorTintStyle:[(SFColor *)v8 colorTintStyle]];
    v10 = [(SFColor *)v8 darkModeColor];
    [(SFColor *)v5 setDarkModeColor:v10];
  }
  return v5;
}

- (BOOL)hasGradientType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setGradientType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_gradientType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFGradientColor)initWithProtobuf:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFGradientColor;
  uint64_t v5 = [(SFGradientColor *)&v20 init];
  if (v5)
  {
    unint64_t v6 = [v4 colors];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v8 = objc_msgSend(v4, "colors", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFColor alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(SFGradientColor *)v5 setColors:v7];
    if ([v4 gradientType]) {
      -[SFGradientColor setGradientType:](v5, "setGradientType:", [v4 gradientType]);
    }
    objc_super v14 = v5;
  }
  return v5;
}

@end