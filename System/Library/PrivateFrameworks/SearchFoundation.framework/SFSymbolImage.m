@interface SFSymbolImage
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBackgroundColor;
- (BOOL)hasFillStyle;
- (BOOL)hasPrimaryColor;
- (BOOL)hasPunchThroughBackground;
- (BOOL)hasSecondaryColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)punchThroughBackground;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)symbolName;
- (SFSymbolImage)initWithCoder:(id)a3;
- (SFSymbolImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)backgroundColor;
- (int)fillStyle;
- (int)primaryColor;
- (int)secondaryColor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(int)a3;
- (void)setFillStyle:(int)a3;
- (void)setPrimaryColor:(int)a3;
- (void)setPunchThroughBackground:(BOOL)a3;
- (void)setSecondaryColor:(int)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation SFSymbolImage

- (void).cxx_destruct
{
}

- (int)fillStyle
{
  return self->_fillStyle;
}

- (int)secondaryColor
{
  return self->_secondaryColor;
}

- (int)primaryColor
{
  return self->_primaryColor;
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)punchThroughBackground
{
  return self->_punchThroughBackground;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFSymbolImage;
  unint64_t v3 = [(SFImage *)&v12 hash];
  v4 = [(SFSymbolImage *)self symbolName];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFSymbolImage *)self punchThroughBackground];
  uint64_t v7 = v6 ^ [(SFSymbolImage *)self backgroundColor];
  unint64_t v8 = v7 ^ [(SFSymbolImage *)self primaryColor] ^ v3;
  uint64_t v9 = [(SFSymbolImage *)self secondaryColor];
  unint64_t v10 = v8 ^ v9 ^ [(SFSymbolImage *)self fillStyle];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFSymbolImage *)a3;
  if (self == v6)
  {
    BOOL v12 = 1;
  }
  else
  {
    if ([(SFSymbolImage *)v6 isMemberOfClass:objc_opt_class()])
    {
      v19.receiver = self;
      v19.super_class = (Class)SFSymbolImage;
      if ([(SFImage *)&v19 isEqual:v6])
      {
        uint64_t v7 = v6;
        unint64_t v8 = [(SFSymbolImage *)self symbolName];
        uint64_t v9 = [(SFSymbolImage *)v7 symbolName];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
        unint64_t v10 = [(SFSymbolImage *)self symbolName];
        if (!v10
          || ([(SFSymbolImage *)self symbolName],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFSymbolImage *)v7 symbolName],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v13 = [(SFSymbolImage *)self punchThroughBackground];
          if (v13 == [(SFSymbolImage *)v7 punchThroughBackground]
            && (int v14 = [(SFSymbolImage *)self backgroundColor],
                v14 == [(SFSymbolImage *)v7 backgroundColor])
            && (int v15 = [(SFSymbolImage *)self primaryColor],
                v15 == [(SFSymbolImage *)v7 primaryColor])
            && (int v16 = [(SFSymbolImage *)self secondaryColor],
                v16 == [(SFSymbolImage *)v7 secondaryColor]))
          {
            int v17 = [(SFSymbolImage *)self fillStyle];
            BOOL v11 = v17 == [(SFSymbolImage *)v7 fillStyle];
            BOOL v12 = v11;
            if (!v10) {
              goto LABEL_19;
            }
          }
          else
          {
            BOOL v11 = 0;
            BOOL v12 = 0;
            if (!v10)
            {
LABEL_19:

              goto LABEL_20;
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        BOOL v12 = v11;
        goto LABEL_19;
      }
    }
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFSymbolImage;
  id v4 = [(SFImage *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFSymbolImage *)self symbolName];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setSymbolName:v6];

  objc_msgSend(v4, "setPunchThroughBackground:", -[SFSymbolImage punchThroughBackground](self, "punchThroughBackground"));
  objc_msgSend(v4, "setBackgroundColor:", -[SFSymbolImage backgroundColor](self, "backgroundColor"));
  objc_msgSend(v4, "setPrimaryColor:", -[SFSymbolImage primaryColor](self, "primaryColor"));
  objc_msgSend(v4, "setSecondaryColor:", -[SFSymbolImage secondaryColor](self, "secondaryColor"));
  objc_msgSend(v4, "setFillStyle:", -[SFSymbolImage fillStyle](self, "fillStyle"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSymbolImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSymbolImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSymbolImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSymbolImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSymbolImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFSymbolImage;
  uint64_t v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasFillStyle
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFillStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_fillStyle = a3;
}

- (BOOL)hasSecondaryColor
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSecondaryColor:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_secondaryColor = a3;
}

- (BOOL)hasPrimaryColor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPrimaryColor:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_primaryColor = a3;
}

- (BOOL)hasBackgroundColor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBackgroundColor:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_backgroundColor = a3;
}

- (BOOL)hasPunchThroughBackground
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPunchThroughBackground:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_punchThroughBackground = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSymbolImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSymbolImage;
  uint64_t v5 = [(SFSymbolImage *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 symbolName];

    if (v6)
    {
      uint64_t v7 = [v4 symbolName];
      [(SFSymbolImage *)v5 setSymbolName:v7];
    }
    if ([v4 punchThroughBackground]) {
      -[SFSymbolImage setPunchThroughBackground:](v5, "setPunchThroughBackground:", [v4 punchThroughBackground]);
    }
    if ([v4 backgroundColor]) {
      -[SFSymbolImage setBackgroundColor:](v5, "setBackgroundColor:", [v4 backgroundColor]);
    }
    if ([v4 primaryColor]) {
      -[SFSymbolImage setPrimaryColor:](v5, "setPrimaryColor:", [v4 primaryColor]);
    }
    if ([v4 secondaryColor]) {
      -[SFSymbolImage setSecondaryColor:](v5, "setSecondaryColor:", [v4 secondaryColor]);
    }
    if ([v4 fillStyle]) {
      -[SFSymbolImage setFillStyle:](v5, "setFillStyle:", [v4 fillStyle]);
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end