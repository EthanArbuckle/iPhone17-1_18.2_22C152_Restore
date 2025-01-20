@interface SFFormattedText
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEncapsulationStyle;
- (BOOL)hasIsBold;
- (BOOL)hasIsEmphasized;
- (BOOL)hasTextColor;
- (BOOL)isBold;
- (BOOL)isEmphasized;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFFormattedText)initWithCoder:(id)a3;
- (SFFormattedText)initWithProtobuf:(id)a3;
- (SFImage)glyph;
- (id)copyWithZone:(_NSZone *)a3;
- (int)encapsulationStyle;
- (int)textColor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEncapsulationStyle:(int)a3;
- (void)setGlyph:(id)a3;
- (void)setIsBold:(BOOL)a3;
- (void)setIsEmphasized:(BOOL)a3;
- (void)setTextColor:(int)a3;
@end

@implementation SFFormattedText

- (SFFormattedText)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 text];
  v13.receiver = self;
  v13.super_class = (Class)SFFormattedText;
  v6 = [(SFText *)&v13 initWithProtobuf:v5];

  if (v6)
  {
    v7 = [v4 glyph];

    if (v7)
    {
      v8 = [SFImage alloc];
      v9 = [v4 glyph];
      v10 = [(SFImage *)v8 initWithProtobuf:v9];
      [(SFFormattedText *)v6 setGlyph:v10];
    }
    if ([v4 isEmphasized]) {
      -[SFFormattedText setIsEmphasized:](v6, "setIsEmphasized:", [v4 isEmphasized]);
    }
    if ([v4 isBold]) {
      -[SFFormattedText setIsBold:](v6, "setIsBold:", [v4 isBold]);
    }
    if ([v4 textColor]) {
      -[SFFormattedText setTextColor:](v6, "setTextColor:", [v4 textColor]);
    }
    if ([v4 encapsulationStyle]) {
      -[SFFormattedText setEncapsulationStyle:](v6, "setEncapsulationStyle:", [v4 encapsulationStyle]);
    }
    v11 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (int)encapsulationStyle
{
  return self->_encapsulationStyle;
}

- (int)textColor
{
  return self->_textColor;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (void)setGlyph:(id)a3
{
}

- (SFImage)glyph
{
  return self->_glyph;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFFormattedText;
  unint64_t v3 = [(SFText *)&v11 hash];
  id v4 = [(SFFormattedText *)self glyph];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFFormattedText *)self isEmphasized];
  uint64_t v7 = v6 ^ [(SFFormattedText *)self isBold];
  unint64_t v8 = v7 ^ [(SFFormattedText *)self textColor] ^ v3;
  unint64_t v9 = v8 ^ [(SFFormattedText *)self encapsulationStyle];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFFormattedText *)a3;
  if (self == v6)
  {
    BOOL v12 = 1;
  }
  else
  {
    if ([(SFFormattedText *)v6 isMemberOfClass:objc_opt_class()])
    {
      v18.receiver = self;
      v18.super_class = (Class)SFFormattedText;
      if ([(SFText *)&v18 isEqual:v6])
      {
        uint64_t v7 = v6;
        unint64_t v8 = [(SFFormattedText *)self glyph];
        unint64_t v9 = [(SFFormattedText *)v7 glyph];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v10 = [(SFFormattedText *)self glyph];
        if (!v10
          || ([(SFFormattedText *)self glyph],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFFormattedText *)v7 glyph],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v13 = [(SFFormattedText *)self isEmphasized];
          if (v13 == [(SFFormattedText *)v7 isEmphasized]
            && (BOOL v14 = [(SFFormattedText *)self isBold], v14 == [(SFFormattedText *)v7 isBold])
            && (int v15 = [(SFFormattedText *)self textColor],
                v15 == [(SFFormattedText *)v7 textColor]))
          {
            int v16 = [(SFFormattedText *)self encapsulationStyle];
            BOOL v11 = v16 == [(SFFormattedText *)v7 encapsulationStyle];
            BOOL v12 = v11;
            if (!v10) {
              goto LABEL_18;
            }
          }
          else
          {
            BOOL v11 = 0;
            BOOL v12 = 0;
            if (!v10)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        BOOL v12 = v11;
        goto LABEL_18;
      }
    }
    BOOL v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFFormattedText;
  id v4 = [(SFText *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFFormattedText *)self glyph];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setGlyph:v6];

  objc_msgSend(v4, "setIsEmphasized:", -[SFFormattedText isEmphasized](self, "isEmphasized"));
  objc_msgSend(v4, "setIsBold:", -[SFFormattedText isBold](self, "isBold"));
  objc_msgSend(v4, "setTextColor:", -[SFFormattedText textColor](self, "textColor"));
  objc_msgSend(v4, "setEncapsulationStyle:", -[SFFormattedText encapsulationStyle](self, "encapsulationStyle"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBFormattedText alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBFormattedText *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBFormattedText alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBFormattedText *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBFormattedText alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBFormattedText *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFFormattedText)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBFormattedText alloc] initWithData:v5];
  uint64_t v7 = [(SFFormattedText *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasEncapsulationStyle
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEncapsulationStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_encapsulationStyle = a3;
}

- (BOOL)hasTextColor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTextColor:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_textColor = a3;
}

- (BOOL)hasIsBold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsBold:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isBold = a3;
}

- (BOOL)hasIsEmphasized
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEmphasized:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isEmphasized = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end