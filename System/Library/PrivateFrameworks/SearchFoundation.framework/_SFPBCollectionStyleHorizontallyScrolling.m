@interface _SFPBCollectionStyleHorizontallyScrolling
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCollectionStyleHorizontallyScrolling)initWithDictionary:(id)a3;
- (_SFPBCollectionStyleHorizontallyScrolling)initWithFacade:(id)a3;
- (_SFPBCollectionStyleHorizontallyScrolling)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numberOfRows;
- (void)setNumberOfRows:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCollectionStyleHorizontallyScrolling

- (_SFPBCollectionStyleHorizontallyScrolling)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCollectionStyleHorizontallyScrolling *)self init];
  if (v5)
  {
    if ([v4 hasNumberOfRows]) {
      -[_SFPBCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", [v4 numberOfRows]);
    }
    v6 = v5;
  }

  return v5;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (_SFPBCollectionStyleHorizontallyScrolling)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBCollectionStyleHorizontallyScrolling;
  v5 = [(_SFPBCollectionStyleHorizontallyScrolling *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numberOfRows"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionStyleHorizontallyScrolling setNumberOfRows:](v5, "setNumberOfRows:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBCollectionStyleHorizontallyScrolling)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCollectionStyleHorizontallyScrolling *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCollectionStyleHorizontallyScrolling *)self dictionaryRepresentation];
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
  if (self->_numberOfRows)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBCollectionStyleHorizontallyScrolling numberOfRows](self, "numberOfRows"));
    [v3 setObject:v4 forKeyedSubscript:@"numberOfRows"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761u * self->_numberOfRows;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t numberOfRows = self->_numberOfRows;
    BOOL v6 = numberOfRows == [v4 numberOfRows];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBCollectionStyleHorizontallyScrolling *)self numberOfRows]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionStyleHorizontallyScrollingReadFrom(self, (uint64_t)a3);
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_unint64_t numberOfRows = a3;
}

@end