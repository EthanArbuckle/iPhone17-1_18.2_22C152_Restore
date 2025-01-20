@interface _SFPBCollectionStyle
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCollectionStyle)initWithDictionary:(id)a3;
- (_SFPBCollectionStyle)initWithFacade:(id)a3;
- (_SFPBCollectionStyle)initWithJSON:(id)a3;
- (_SFPBCollectionStyleGrid)collectionStyleGrid;
- (_SFPBCollectionStyleHorizontallyScrolling)collectionStyleScrolling;
- (_SFPBCollectionStyleRow)collectionStyleRow;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (unsigned)initiallyVisibleCardSectionCount;
- (void)setCollectionStyleGrid:(id)a3;
- (void)setCollectionStyleRow:(id)a3;
- (void)setCollectionStyleScrolling:(id)a3;
- (void)setInitiallyVisibleCardSectionCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCollectionStyle

- (_SFPBCollectionStyle)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCollectionStyle *)self init];
  if (v5)
  {
    if ([v4 hasInitiallyVisibleCardSectionCount]) {
      -[_SFPBCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", [v4 initiallyVisibleCardSectionCount]);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [[_SFPBCollectionStyleRow alloc] initWithFacade:v4];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleRow:v6];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCollectionStyleGrid alloc] initWithFacade:v4];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleGrid:v7];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithFacade:v4];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleScrolling:v8];
    }
    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionStyleScrolling, 0);
  objc_storeStrong((id *)&self->_collectionStyleGrid, 0);
  objc_storeStrong((id *)&self->_collectionStyleRow, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (unsigned)initiallyVisibleCardSectionCount
{
  return self->_initiallyVisibleCardSectionCount;
}

- (_SFPBCollectionStyle)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBCollectionStyle;
  v5 = [(_SFPBCollectionStyle *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"collectionStyleRow"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCollectionStyleRow alloc] initWithDictionary:v6];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleRow:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"collectionStyleGrid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBCollectionStyleGrid alloc] initWithDictionary:v8];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleGrid:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"collectionStyleScrolling"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBCollectionStyleHorizontallyScrolling alloc] initWithDictionary:v10];
      [(_SFPBCollectionStyle *)v5 setCollectionStyleScrolling:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"initiallyVisibleCardSectionCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyle setInitiallyVisibleCardSectionCount:](v5, "setInitiallyVisibleCardSectionCount:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBCollectionStyle)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCollectionStyle *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCollectionStyle *)self dictionaryRepresentation];
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
  if (self->_collectionStyleGrid)
  {
    id v4 = [(_SFPBCollectionStyle *)self collectionStyleGrid];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"collectionStyleGrid"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"collectionStyleGrid"];
    }
  }
  if (self->_collectionStyleRow)
  {
    uint64_t v7 = [(_SFPBCollectionStyle *)self collectionStyleRow];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"collectionStyleRow"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"collectionStyleRow"];
    }
  }
  if (self->_collectionStyleScrolling)
  {
    v10 = [(_SFPBCollectionStyle *)self collectionStyleScrolling];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"collectionStyleScrolling"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"collectionStyleScrolling"];
    }
  }
  if (self->_initiallyVisibleCardSectionCount)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBCollectionStyle initiallyVisibleCardSectionCount](self, "initiallyVisibleCardSectionCount"));
    [v3 setObject:v13 forKeyedSubscript:@"initiallyVisibleCardSectionCount"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBCollectionStyleRow *)self->_collectionStyleRow hash];
  unint64_t v4 = [(_SFPBCollectionStyleGrid *)self->_collectionStyleGrid hash];
  return v4 ^ v3 ^ [(_SFPBCollectionStyleHorizontallyScrolling *)self->_collectionStyleScrolling hash] ^ (2654435761 * self->_initiallyVisibleCardSectionCount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBCollectionStyle *)self collectionStyleRow];
  v6 = [v4 collectionStyleRow];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBCollectionStyle *)self collectionStyleRow];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBCollectionStyle *)self collectionStyleRow];
    v10 = [v4 collectionStyleRow];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCollectionStyle *)self collectionStyleGrid];
  v6 = [v4 collectionStyleGrid];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBCollectionStyle *)self collectionStyleGrid];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBCollectionStyle *)self collectionStyleGrid];
    objc_super v15 = [v4 collectionStyleGrid];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBCollectionStyle *)self collectionStyleScrolling];
  v6 = [v4 collectionStyleScrolling];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBCollectionStyle *)self collectionStyleScrolling];
    if (!v17)
    {

LABEL_20:
      unsigned int initiallyVisibleCardSectionCount = self->_initiallyVisibleCardSectionCount;
      BOOL v22 = initiallyVisibleCardSectionCount == [v4 initiallyVisibleCardSectionCount];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBCollectionStyle *)self collectionStyleScrolling];
    v20 = [v4 collectionStyleScrolling];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBCollectionStyle *)self collectionStyleRow];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBCollectionStyle *)self collectionStyleGrid];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBCollectionStyle *)self collectionStyleScrolling];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  unsigned int v7 = [(_SFPBCollectionStyle *)self initiallyVisibleCardSectionCount];
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleReadFrom(self, (uint64_t)a3);
}

- (void)setInitiallyVisibleCardSectionCount:(unsigned int)a3
{
  self->_unsigned int initiallyVisibleCardSectionCount = a3;
}

- (_SFPBCollectionStyleHorizontallyScrolling)collectionStyleScrolling
{
  if (self->_whichValue == 3) {
    v2 = self->_collectionStyleScrolling;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCollectionStyleScrolling:(id)a3
{
  id v4 = (_SFPBCollectionStyleHorizontallyScrolling *)a3;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = 0;

  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_whichValue = v7;
  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = v4;
}

- (_SFPBCollectionStyleGrid)collectionStyleGrid
{
  if (self->_whichValue == 2) {
    v2 = self->_collectionStyleGrid;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCollectionStyleGrid:(id)a3
{
  id v4 = (_SFPBCollectionStyleGrid *)a3;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = 0;

  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = 0;

  self->_whichValue = 2 * (v4 != 0);
  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = v4;
}

- (_SFPBCollectionStyleRow)collectionStyleRow
{
  if (self->_whichValue == 1) {
    v2 = self->_collectionStyleRow;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCollectionStyleRow:(id)a3
{
  id v4 = (_SFPBCollectionStyleRow *)a3;
  collectionStyleGrid = self->_collectionStyleGrid;
  self->_collectionStyleGrid = 0;

  collectionStyleScrolling = self->_collectionStyleScrolling;
  self->_collectionStyleScrolling = 0;

  self->_whichValue = v4 != 0;
  collectionStyleRow = self->_collectionStyleRow;
  self->_collectionStyleRow = v4;
}

@end