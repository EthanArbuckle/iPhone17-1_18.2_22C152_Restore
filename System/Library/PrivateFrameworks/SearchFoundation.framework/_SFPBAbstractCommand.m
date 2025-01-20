@interface _SFPBAbstractCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBAbstractCommand)initWithDictionary:(id)a3;
- (_SFPBAbstractCommand)initWithFacade:(id)a3;
- (_SFPBAbstractCommand)initWithJSON:(id)a3;
- (_SFPBCommandValue)value;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAbstractCommand

- (_SFPBAbstractCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAbstractCommand *)self init];
  if (v5)
  {
    if ([v4 hasType]) {
      -[_SFPBAbstractCommand setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 value];

    if (v6)
    {
      v7 = [_SFPBCommandValue alloc];
      v8 = [v4 value];
      v9 = [(_SFPBCommandValue *)v7 initWithFacade:v8];
      [(_SFPBAbstractCommand *)v5 setValue:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (_SFPBCommandValue)value
{
  return self->_value;
}

- (int)type
{
  return self->_type;
}

- (_SFPBAbstractCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBAbstractCommand;
  v5 = [(_SFPBAbstractCommand *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAbstractCommand setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBCommandValue alloc] initWithDictionary:v7];
      [(_SFPBAbstractCommand *)v5 setValue:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBAbstractCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAbstractCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAbstractCommand *)self dictionaryRepresentation];
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
  if (self->_type)
  {
    uint64_t v4 = [(_SFPBAbstractCommand *)self type];
    if (v4)
    {
      if (v4 == 1)
      {
        v5 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"0";
    }
    [v3 setObject:v5 forKeyedSubscript:@"type"];
  }
  if (self->_value)
  {
    v6 = [(_SFPBAbstractCommand *)self value];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"value"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"value"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_type;
  return [(_SFPBCommandValue *)self->_value hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int type = self->_type;
    if (type == [v4 type])
    {
      v6 = [(_SFPBAbstractCommand *)self value];
      uint64_t v7 = [v4 value];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_SFPBAbstractCommand *)self value];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        objc_super v11 = [(_SFPBAbstractCommand *)self value];
        v12 = [v4 value];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ([(_SFPBAbstractCommand *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBAbstractCommand *)self value];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAbstractCommandReadFrom(self, (uint64_t)a3);
}

- (void)setValue:(id)a3
{
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

@end