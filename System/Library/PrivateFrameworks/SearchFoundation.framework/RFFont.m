@interface RFFont
+ (BOOL)supportsSecureCoding;
- (BOOL)applySmallCaps;
- (BOOL)hasApplySmallCaps;
- (BOOL)hasName;
- (BOOL)hasSystem;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFFont)initWithCoder:(id)a3;
- (RFFont)initWithProtobuf:(id)a3;
- (RFSystemFont)system;
- (id)copyWithZone:(_NSZone *)a3;
- (int)name;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplySmallCaps:(BOOL)a3;
- (void)setName:(int)a3;
- (void)setSystem:(id)a3;
@end

@implementation RFFont

- (RFFont)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RFFont;
  v5 = [(RFFont *)&v12 init];
  if (v5)
  {
    if ([v4 name]) {
      -[RFFont setName:](v5, "setName:", [v4 name]);
    }
    v6 = [v4 system];

    if (v6)
    {
      v7 = [RFSystemFont alloc];
      v8 = [v4 system];
      v9 = [(RFSystemFont *)v7 initWithProtobuf:v8];
      [(RFFont *)v5 setSystem:v9];
    }
    if ([v4 applySmallCaps]) {
      -[RFFont setApplySmallCaps:](v5, "setApplySmallCaps:", [v4 applySmallCaps]);
    }
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (RFSystemFont)system
{
  return self->_system;
}

- (int)name
{
  return self->_name;
}

- (unint64_t)hash
{
  uint64_t v3 = [(RFFont *)self name];
  id v4 = [(RFFont *)self system];
  uint64_t v5 = [v4 hash] ^ v3;
  unint64_t v6 = v5 ^ [(RFFont *)self applySmallCaps];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (RFFont *)a3;
  if (self == v6)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if ([(RFFont *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      int v8 = [(RFFont *)self name];
      if (v8 != [(RFFont *)v7 name])
      {
        LOBYTE(v12) = 0;
LABEL_16:

        goto LABEL_17;
      }
      v9 = [(RFFont *)self system];
      v10 = [(RFFont *)v7 system];
      if ((v9 == 0) == (v10 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_15:

        goto LABEL_16;
      }
      v11 = [(RFFont *)self system];
      if (!v11
        || ([(RFFont *)self system],
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [(RFFont *)v7 system],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        BOOL v13 = [(RFFont *)self applySmallCaps];
        BOOL v12 = v13 ^ [(RFFont *)v7 applySmallCaps] ^ 1;
        if (!v11)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }

      goto LABEL_14;
    }
    LOBYTE(v12) = 0;
  }
LABEL_17:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFFont *)self hasName]) {
    objc_msgSend(v4, "setName:", -[RFFont name](self, "name"));
  }
  if ([(RFFont *)self hasSystem])
  {
    uint64_t v5 = [(RFFont *)self system];
    unint64_t v6 = (void *)[v5 copy];
    [v4 setSystem:v6];
  }
  objc_msgSend(v4, "setApplySmallCaps:", -[RFFont applySmallCaps](self, "applySmallCaps"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFFont alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFFont *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFFont alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFFont *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBRFFont alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBRFFont *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFFont)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBRFFont alloc] initWithData:v5];
  v7 = [(RFFont *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasApplySmallCaps
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_applySmallCaps = a3;
}

- (BOOL)hasSystem
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSystem:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_system, a3);
  *(unsigned char *)&self->_has &= ~1u;
  self->_name = 0;
}

- (BOOL)hasName
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setName:(int)a3
{
  char has = (char)self->_has;
  self->_name = a3;
  *(unsigned char *)&self->_char has = has & 0xFC | 1;
  self->_system = 0;
  MEMORY[0x1F41817F8]();
}

@end