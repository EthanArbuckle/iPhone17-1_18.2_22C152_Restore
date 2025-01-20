@interface SFTableColumnAlignment
+ (BOOL)supportsSecureCoding;
- (BOOL)hasColumnAlignment;
- (BOOL)hasDataAlignment;
- (BOOL)hasIsEqualWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWidth;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFTableColumnAlignment)initWithCoder:(id)a3;
- (SFTableColumnAlignment)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)columnAlignment;
- (int)dataAlignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setColumnAlignment:(int)a3;
- (void)setDataAlignment:(int)a3;
- (void)setIsEqualWidth:(BOOL)a3;
@end

@implementation SFTableColumnAlignment

- (SFTableColumnAlignment)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFTableColumnAlignment;
  v5 = [(SFTableColumnAlignment *)&v8 init];
  if (v5)
  {
    if ([v4 columnAlignment]) {
      -[SFTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", [v4 columnAlignment]);
    }
    if ([v4 dataAlignment]) {
      -[SFTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", [v4 dataAlignment]);
    }
    if ([v4 isEqualWidth]) {
      -[SFTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", [v4 isEqualWidth]);
    }
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualWidth
{
  return self->_isEqualWidth;
}

- (int)dataAlignment
{
  return self->_dataAlignment;
}

- (int)columnAlignment
{
  return self->_columnAlignment;
}

- (unint64_t)hash
{
  int v3 = [(SFTableColumnAlignment *)self columnAlignment];
  uint64_t v4 = [(SFTableColumnAlignment *)self dataAlignment] ^ v3;
  return v4 ^ [(SFTableColumnAlignment *)self isEqualWidth];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFTableColumnAlignment *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if ([(SFTableColumnAlignment *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int v6 = [(SFTableColumnAlignment *)self columnAlignment];
    if (v6 == [(SFTableColumnAlignment *)v5 columnAlignment]
      && (int v7 = [(SFTableColumnAlignment *)self dataAlignment],
          v7 == [(SFTableColumnAlignment *)v5 dataAlignment]))
    {
      BOOL v8 = [(SFTableColumnAlignment *)self isEqualWidth];
      BOOL v9 = v8 ^ [(SFTableColumnAlignment *)v5 isEqualWidth] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setColumnAlignment:", -[SFTableColumnAlignment columnAlignment](self, "columnAlignment"));
  objc_msgSend(v4, "setDataAlignment:", -[SFTableColumnAlignment dataAlignment](self, "dataAlignment"));
  objc_msgSend(v4, "setIsEqualWidth:", -[SFTableColumnAlignment isEqualWidth](self, "isEqualWidth"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTableColumnAlignment alloc] initWithFacade:self];
  int v3 = [(_SFPBTableColumnAlignment *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTableColumnAlignment alloc] initWithFacade:self];
  int v3 = [(_SFPBTableColumnAlignment *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBTableColumnAlignment alloc] initWithFacade:self];
  v5 = [(_SFPBTableColumnAlignment *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFTableColumnAlignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBTableColumnAlignment alloc] initWithData:v5];
  int v7 = [(SFTableColumnAlignment *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsEqualWidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsEqualWidth:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isEqualWidth = a3;
}

- (BOOL)hasDataAlignment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDataAlignment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dataAlignment = a3;
}

- (BOOL)hasColumnAlignment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setColumnAlignment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_columnAlignment = a3;
}

@end