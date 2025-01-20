@interface _SFPBRFOptionalBool
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)value;
- (NSData)jsonData;
- (_SFPBRFOptionalBool)initWithDictionary:(id)a3;
- (_SFPBRFOptionalBool)initWithFacade:(id)a3;
- (_SFPBRFOptionalBool)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFOptionalBool

- (_SFPBRFOptionalBool)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFOptionalBool *)self init];
  if (v5)
  {
    if ([v4 hasValue]) {
      -[_SFPBRFOptionalBool setValue:](v5, "setValue:", [v4 value]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)value
{
  return self->_value;
}

- (_SFPBRFOptionalBool)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBRFOptionalBool;
  v5 = [(_SFPBRFOptionalBool *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFOptionalBool setValue:](v5, "setValue:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBRFOptionalBool)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFOptionalBool *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFOptionalBool *)self dictionaryRepresentation];
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
  if (self->_value)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFOptionalBool value](self, "value"));
    [v3 setObject:v4 forKeyedSubscript:@"value"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_value) {
    return 2654435761;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int value = self->_value;
    BOOL v6 = value == [v4 value];
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
  if ([(_SFPBRFOptionalBool *)self value]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFOptionalBoolReadFrom(self, (uint64_t)a3);
}

- (void)setValue:(BOOL)a3
{
  self->_int value = a3;
}

@end