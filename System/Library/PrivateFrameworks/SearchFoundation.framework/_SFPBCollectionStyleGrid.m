@interface _SFPBCollectionStyleGrid
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCollectionStyleGrid)initWithDictionary:(id)a3;
- (_SFPBCollectionStyleGrid)initWithFacade:(id)a3;
- (_SFPBCollectionStyleGrid)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)gridStyle;
- (unint64_t)hash;
- (unint64_t)numberOfColumns;
- (void)setGridStyle:(int)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCollectionStyleGrid

- (_SFPBCollectionStyleGrid)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCollectionStyleGrid *)self init];
  if (v5)
  {
    if ([v4 hasNumberOfColumns]) {
      -[_SFPBCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", [v4 numberOfColumns]);
    }
    if ([v4 hasGridStyle]) {
      -[_SFPBCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", [v4 gridStyle]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)gridStyle
{
  return self->_gridStyle;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (_SFPBCollectionStyleGrid)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBCollectionStyleGrid;
  v5 = [(_SFPBCollectionStyleGrid *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfColumns"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleGrid setNumberOfColumns:](v5, "setNumberOfColumns:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"gridStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleGrid setGridStyle:](v5, "setGridStyle:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBCollectionStyleGrid)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCollectionStyleGrid *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCollectionStyleGrid *)self dictionaryRepresentation];
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
  if (self->_gridStyle)
  {
    uint64_t v4 = [(_SFPBCollectionStyleGrid *)self gridStyle];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F058[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"gridStyle"];
  }
  if (self->_numberOfColumns)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBCollectionStyleGrid numberOfColumns](self, "numberOfColumns"));
    [v3 setObject:v6 forKeyedSubscript:@"numberOfColumns"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_gridStyle) ^ (2654435761u * self->_numberOfColumns);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t numberOfColumns = self->_numberOfColumns, numberOfColumns == [v4 numberOfColumns]))
  {
    int gridStyle = self->_gridStyle;
    BOOL v7 = gridStyle == [v4 gridStyle];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBCollectionStyleGrid *)self numberOfColumns]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_SFPBCollectionStyleGrid *)self gridStyle]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleGridReadFrom(self, (uint64_t)a3);
}

- (void)setGridStyle:(int)a3
{
  self->_int gridStyle = a3;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_unint64_t numberOfColumns = a3;
}

@end