@interface _SFPBTableColumnAlignment
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWidth;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBTableColumnAlignment)initWithDictionary:(id)a3;
- (_SFPBTableColumnAlignment)initWithFacade:(id)a3;
- (_SFPBTableColumnAlignment)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)columnAlignment;
- (int)dataAlignment;
- (unint64_t)hash;
- (void)setColumnAlignment:(int)a3;
- (void)setDataAlignment:(int)a3;
- (void)setIsEqualWidth:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTableColumnAlignment

- (_SFPBTableColumnAlignment)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBTableColumnAlignment *)self init];
  if (v5)
  {
    if ([v4 hasColumnAlignment]) {
      -[_SFPBTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", [v4 columnAlignment]);
    }
    if ([v4 hasDataAlignment]) {
      -[_SFPBTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", [v4 dataAlignment]);
    }
    if ([v4 hasIsEqualWidth]) {
      -[_SFPBTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", [v4 isEqualWidth]);
    }
    v6 = v5;
  }

  return v5;
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

- (_SFPBTableColumnAlignment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBTableColumnAlignment;
  v5 = [(_SFPBTableColumnAlignment *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"columnAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableColumnAlignment setColumnAlignment:](v5, "setColumnAlignment:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"dataAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableColumnAlignment setDataAlignment:](v5, "setDataAlignment:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isEqualWidth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableColumnAlignment setIsEqualWidth:](v5, "setIsEqualWidth:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBTableColumnAlignment)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTableColumnAlignment *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTableColumnAlignment *)self dictionaryRepresentation];
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
  if (self->_columnAlignment)
  {
    uint64_t v4 = [(_SFPBTableColumnAlignment *)self columnAlignment];
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F058[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"columnAlignment"];
  }
  if (self->_dataAlignment)
  {
    uint64_t v6 = [(_SFPBTableColumnAlignment *)self dataAlignment];
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2F058[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"dataAlignment"];
  }
  if (self->_isEqualWidth)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableColumnAlignment isEqualWidth](self, "isEqualWidth"));
    [v3 setObject:v8 forKeyedSubscript:@"isEqualWidth"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761;
  if (!self->_isEqualWidth) {
    uint64_t v2 = 0;
  }
  return (2654435761 * self->_dataAlignment) ^ (2654435761 * self->_columnAlignment) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int columnAlignment = self->_columnAlignment, columnAlignment == [v4 columnAlignment])
    && (int dataAlignment = self->_dataAlignment, dataAlignment == [v4 dataAlignment]))
  {
    int isEqualWidth = self->_isEqualWidth;
    BOOL v8 = isEqualWidth == [v4 isEqualWidth];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBTableColumnAlignment *)self columnAlignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBTableColumnAlignment *)self dataAlignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBTableColumnAlignment *)self isEqualWidth]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTableColumnAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)setIsEqualWidth:(BOOL)a3
{
  self->_int isEqualWidth = a3;
}

- (void)setDataAlignment:(int)a3
{
  self->_int dataAlignment = a3;
}

- (void)setColumnAlignment:(int)a3
{
  self->_int columnAlignment = a3;
}

@end