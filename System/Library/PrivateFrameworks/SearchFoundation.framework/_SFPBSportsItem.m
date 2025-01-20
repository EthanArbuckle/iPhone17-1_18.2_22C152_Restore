@interface _SFPBSportsItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)identifier;
- (_SFPBSportsItem)initWithDictionary:(id)a3;
- (_SFPBSportsItem)initWithFacade:(id)a3;
- (_SFPBSportsItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSportsItem

- (_SFPBSportsItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBSportsItem *)self init];
  if (v5)
  {
    if ([v4 hasType]) {
      -[_SFPBSportsItem setType:](v5, "setType:", [v4 type]);
    }
    v6 = [v4 identifier];

    if (v6)
    {
      v7 = [v4 identifier];
      [(_SFPBSportsItem *)v5 setIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)type
{
  return self->_type;
}

- (_SFPBSportsItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBSportsItem;
  v5 = [(_SFPBSportsItem *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSportsItem setType:](v5, "setType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(_SFPBSportsItem *)v5 setIdentifier:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBSportsItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSportsItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSportsItem *)self dictionaryRepresentation];
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
  if (self->_identifier)
  {
    id v4 = [(_SFPBSportsItem *)self identifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"identifier"];
  }
  if (self->_type)
  {
    uint64_t v6 = [(_SFPBSportsItem *)self type];
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2F070[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_type;
  return [(NSString *)self->_identifier hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int type = self->_type;
    if (type == [v4 type])
    {
      uint64_t v6 = [(_SFPBSportsItem *)self identifier];
      uint64_t v7 = [v4 identifier];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(_SFPBSportsItem *)self identifier];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        objc_super v11 = [(_SFPBSportsItem *)self identifier];
        v12 = [v4 identifier];
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
  if ([(_SFPBSportsItem *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_SFPBSportsItem *)self identifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSportsItemReadFrom(self, (uint64_t)a3);
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

@end