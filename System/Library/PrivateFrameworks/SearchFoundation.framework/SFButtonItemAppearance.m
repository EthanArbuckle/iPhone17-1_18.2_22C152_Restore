@interface SFButtonItemAppearance
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPreferNoFallbackImage;
- (BOOL)hasRenderingMode;
- (BOOL)hasRole;
- (BOOL)hasStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferNoFallbackImage;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFButtonItemAppearance)initWithCoder:(id)a3;
- (SFButtonItemAppearance)initWithProtobuf:(id)a3;
- (SFColor)tintColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int)renderingMode;
- (int)role;
- (int)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPreferNoFallbackImage:(BOOL)a3;
- (void)setRenderingMode:(int)a3;
- (void)setRole:(int)a3;
- (void)setStyle:(int)a3;
- (void)setTintColor:(id)a3;
@end

@implementation SFButtonItemAppearance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)preferNoFallbackImage
{
  return self->_preferNoFallbackImage;
}

- (int)renderingMode
{
  return self->_renderingMode;
}

- (void)setTintColor:(id)a3
{
}

- (SFColor)tintColor
{
  return self->_tintColor;
}

- (int)role
{
  return self->_role;
}

- (int)style
{
  return self->_style;
}

- (unint64_t)hash
{
  int v3 = [(SFButtonItemAppearance *)self style];
  uint64_t v4 = [(SFButtonItemAppearance *)self role] ^ v3;
  v5 = [(SFButtonItemAppearance *)self tintColor];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = v6 ^ [(SFButtonItemAppearance *)self renderingMode] ^ v4;
  unint64_t v8 = v7 ^ [(SFButtonItemAppearance *)self preferNoFallbackImage];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFButtonItemAppearance *)a3;
  if (self == v6)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if ([(SFButtonItemAppearance *)v6 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v7 = v6;
      int v8 = [(SFButtonItemAppearance *)self style];
      if (v8 != [(SFButtonItemAppearance *)v7 style]
        || (int v9 = [(SFButtonItemAppearance *)self role], v9 != [(SFButtonItemAppearance *)v7 role]))
      {
        LOBYTE(v13) = 0;
LABEL_20:

        goto LABEL_21;
      }
      v10 = [(SFButtonItemAppearance *)self tintColor];
      v11 = [(SFButtonItemAppearance *)v7 tintColor];
      if ((v10 == 0) == (v11 != 0))
      {
        LOBYTE(v13) = 0;
LABEL_19:

        goto LABEL_20;
      }
      v12 = [(SFButtonItemAppearance *)self tintColor];
      if (!v12
        || ([(SFButtonItemAppearance *)self tintColor],
            int v3 = objc_claimAutoreleasedReturnValue(),
            [(SFButtonItemAppearance *)v7 tintColor],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int v14 = [(SFButtonItemAppearance *)self renderingMode];
        if (v14 == [(SFButtonItemAppearance *)v7 renderingMode])
        {
          BOOL v15 = [(SFButtonItemAppearance *)self preferNoFallbackImage];
          BOOL v13 = v15 ^ [(SFButtonItemAppearance *)v7 preferNoFallbackImage] ^ 1;
          if (!v12) {
            goto LABEL_18;
          }
        }
        else
        {
          LOBYTE(v13) = 0;
          if (!v12)
          {
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      else
      {
        LOBYTE(v13) = 0;
      }

      goto LABEL_18;
    }
    LOBYTE(v13) = 0;
  }
LABEL_21:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStyle:", -[SFButtonItemAppearance style](self, "style"));
  objc_msgSend(v4, "setRole:", -[SFButtonItemAppearance role](self, "role"));
  v5 = [(SFButtonItemAppearance *)self tintColor];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setTintColor:v6];

  objc_msgSend(v4, "setRenderingMode:", -[SFButtonItemAppearance renderingMode](self, "renderingMode"));
  objc_msgSend(v4, "setPreferNoFallbackImage:", -[SFButtonItemAppearance preferNoFallbackImage](self, "preferNoFallbackImage"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBButtonItemAppearance alloc] initWithFacade:self];
  int v3 = [(_SFPBButtonItemAppearance *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBButtonItemAppearance alloc] initWithFacade:self];
  int v3 = [(_SFPBButtonItemAppearance *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBButtonItemAppearance alloc] initWithFacade:self];
  v5 = [(_SFPBButtonItemAppearance *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFButtonItemAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBButtonItemAppearance alloc] initWithData:v5];
  uint64_t v7 = [(SFButtonItemAppearance *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasPreferNoFallbackImage
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPreferNoFallbackImage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_preferNoFallbackImage = a3;
}

- (BOOL)hasRenderingMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRenderingMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_renderingMode = a3;
}

- (BOOL)hasRole
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRole:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_role = a3;
}

- (BOOL)hasStyle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_style = a3;
}

- (SFButtonItemAppearance)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFButtonItemAppearance;
  v5 = [(SFButtonItemAppearance *)&v12 init];
  if (v5)
  {
    if ([v4 style]) {
      -[SFButtonItemAppearance setStyle:](v5, "setStyle:", [v4 style]);
    }
    if ([v4 role]) {
      -[SFButtonItemAppearance setRole:](v5, "setRole:", [v4 role]);
    }
    uint64_t v6 = [v4 tintColor];

    if (v6)
    {
      uint64_t v7 = [SFColor alloc];
      int v8 = [v4 tintColor];
      int v9 = [(SFColor *)v7 initWithProtobuf:v8];
      [(SFButtonItemAppearance *)v5 setTintColor:v9];
    }
    if ([v4 renderingMode]) {
      -[SFButtonItemAppearance setRenderingMode:](v5, "setRenderingMode:", [v4 renderingMode]);
    }
    if ([v4 preferNoFallbackImage]) {
      -[SFButtonItemAppearance setPreferNoFallbackImage:](v5, "setPreferNoFallbackImage:", [v4 preferNoFallbackImage]);
    }
    v10 = v5;
  }

  return v5;
}

@end