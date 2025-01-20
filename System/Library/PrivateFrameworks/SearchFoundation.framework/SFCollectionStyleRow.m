@interface SFCollectionStyleRow
+ (BOOL)supportsSecureCoding;
- (BOOL)drawPlattersIfNecessary;
- (BOOL)hasDrawPlattersIfNecessary;
- (BOOL)hasIsInsetGrouped;
- (BOOL)hasRowStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsetGrouped;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFCollectionStyleRow)initWithCoder:(id)a3;
- (SFCollectionStyleRow)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)rowStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDrawPlattersIfNecessary:(BOOL)a3;
- (void)setIsInsetGrouped:(BOOL)a3;
- (void)setRowStyle:(int)a3;
@end

@implementation SFCollectionStyleRow

- (int)rowStyle
{
  return self->_rowStyle;
}

- (BOOL)isInsetGrouped
{
  return self->_isInsetGrouped;
}

- (BOOL)drawPlattersIfNecessary
{
  return self->_drawPlattersIfNecessary;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCollectionStyleRow;
  unint64_t v3 = [(SFCollectionStyle *)&v7 hash];
  uint64_t v4 = [(SFCollectionStyleRow *)self drawPlattersIfNecessary];
  uint64_t v5 = v4 ^ [(SFCollectionStyleRow *)self isInsetGrouped];
  return v3 ^ v5 ^ [(SFCollectionStyleRow *)self rowStyle];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFCollectionStyleRow *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(SFCollectionStyleRow *)v4 isMemberOfClass:objc_opt_class()] {
         && (v11.receiver = self,
  }
             v11.super_class = (Class)SFCollectionStyleRow,
             [(SFCollectionStyle *)&v11 isEqual:v4]))
  {
    uint64_t v5 = v4;
    BOOL v6 = [(SFCollectionStyleRow *)self drawPlattersIfNecessary];
    if (v6 == [(SFCollectionStyleRow *)v5 drawPlattersIfNecessary]
      && (BOOL v7 = [(SFCollectionStyleRow *)self isInsetGrouped],
          v7 == [(SFCollectionStyleRow *)v5 isInsetGrouped]))
    {
      int v9 = [(SFCollectionStyleRow *)self rowStyle];
      BOOL v8 = v9 == [(SFCollectionStyleRow *)v5 rowStyle];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFCollectionStyleRow;
  id v4 = [(SFCollectionStyle *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setDrawPlattersIfNecessary:", -[SFCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
  objc_msgSend(v4, "setIsInsetGrouped:", -[SFCollectionStyleRow isInsetGrouped](self, "isInsetGrouped"));
  objc_msgSend(v4, "setRowStyle:", -[SFCollectionStyleRow rowStyle](self, "rowStyle"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCollectionStyleRow alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleRow *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCollectionStyleRow alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCollectionStyleRow *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v6 = [[_SFPBCollectionStyleRow alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCollectionStyleRow *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCollectionStyleRow)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v6 = [[_SFPBCollectionStyleRow alloc] initWithData:v5];
  BOOL v7 = [(SFCollectionStyleRow *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasRowStyle
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRowStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rowStyle = a3;
}

- (BOOL)hasIsInsetGrouped
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsInsetGrouped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isInsetGrouped = a3;
}

- (BOOL)hasDrawPlattersIfNecessary
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_drawPlattersIfNecessary = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCollectionStyleRow)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFCollectionStyleRow;
  uint64_t v5 = [(SFCollectionStyleRow *)&v8 init];
  if (v5)
  {
    if ([v4 drawPlattersIfNecessary]) {
      -[SFCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", [v4 drawPlattersIfNecessary]);
    }
    if ([v4 isInsetGrouped]) {
      -[SFCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", [v4 isInsetGrouped]);
    }
    if ([v4 rowStyle]) {
      -[SFCollectionStyleRow setRowStyle:](v5, "setRowStyle:", [v4 rowStyle]);
    }
    objc_super v6 = v5;
  }

  return v5;
}

@end