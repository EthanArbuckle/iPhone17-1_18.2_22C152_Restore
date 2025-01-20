@interface _SFPBCollectionStyleRow
- (BOOL)drawPlattersIfNecessary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsetGrouped;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCollectionStyleRow)initWithDictionary:(id)a3;
- (_SFPBCollectionStyleRow)initWithFacade:(id)a3;
- (_SFPBCollectionStyleRow)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)rowStyle;
- (unint64_t)hash;
- (void)setDrawPlattersIfNecessary:(BOOL)a3;
- (void)setIsInsetGrouped:(BOOL)a3;
- (void)setRowStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCollectionStyleRow

- (_SFPBCollectionStyleRow)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCollectionStyleRow *)self init];
  if (v5)
  {
    if ([v4 hasDrawPlattersIfNecessary]) {
      -[_SFPBCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", [v4 drawPlattersIfNecessary]);
    }
    if ([v4 hasIsInsetGrouped]) {
      -[_SFPBCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", [v4 isInsetGrouped]);
    }
    if ([v4 hasRowStyle]) {
      -[_SFPBCollectionStyleRow setRowStyle:](v5, "setRowStyle:", [v4 rowStyle]);
    }
    v6 = v5;
  }

  return v5;
}

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

- (_SFPBCollectionStyleRow)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBCollectionStyleRow;
  v5 = [(_SFPBCollectionStyleRow *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"drawPlattersIfNecessary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleRow setDrawPlattersIfNecessary:](v5, "setDrawPlattersIfNecessary:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isInsetGrouped"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleRow setIsInsetGrouped:](v5, "setIsInsetGrouped:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"rowStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleRow setRowStyle:](v5, "setRowStyle:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBCollectionStyleRow)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCollectionStyleRow *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCollectionStyleRow *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_drawPlattersIfNecessary)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCollectionStyleRow drawPlattersIfNecessary](self, "drawPlattersIfNecessary"));
    [v3 setObject:v4 forKeyedSubscript:@"drawPlattersIfNecessary"];
  }
  if (self->_isInsetGrouped)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCollectionStyleRow isInsetGrouped](self, "isInsetGrouped"));
    [v3 setObject:v5 forKeyedSubscript:@"isInsetGrouped"];
  }
  if (self->_rowStyle)
  {
    uint64_t v6 = [(_SFPBCollectionStyleRow *)self rowStyle];
    if (v6 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2EF58[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"rowStyle"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_drawPlattersIfNecessary) {
    uint64_t v2 = 2654435761;
  }
  else {
    uint64_t v2 = 0;
  }
  if (self->_isInsetGrouped) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 ^ v2 ^ (2654435761 * self->_rowStyle);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int drawPlattersIfNecessary = self->_drawPlattersIfNecessary,
        drawPlattersIfNecessary == [v4 drawPlattersIfNecessary])
    && (int isInsetGrouped = self->_isInsetGrouped, isInsetGrouped == [v4 isInsetGrouped]))
  {
    int rowStyle = self->_rowStyle;
    BOOL v8 = rowStyle == [v4 rowStyle];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBCollectionStyleRow *)self drawPlattersIfNecessary]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCollectionStyleRow *)self isInsetGrouped]) {
    PBDataWriterWriteBOOLField();
  }
  int v4 = [(_SFPBCollectionStyleRow *)self rowStyle];
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleRowReadFrom(self, (uint64_t)a3);
}

- (void)setRowStyle:(int)a3
{
  self->_int rowStyle = a3;
}

- (void)setIsInsetGrouped:(BOOL)a3
{
  self->_int isInsetGrouped = a3;
}

- (void)setDrawPlattersIfNecessary:(BOOL)a3
{
  self->_int drawPlattersIfNecessary = a3;
}

@end