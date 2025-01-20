@interface _SFPBCreateContactCommand
- (BOOL)addToExistingContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCreateContactCommand)initWithDictionary:(id)a3;
- (_SFPBCreateContactCommand)initWithFacade:(id)a3;
- (_SFPBCreateContactCommand)initWithJSON:(id)a3;
- (_SFPBPerson)person;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddToExistingContact:(BOOL)a3;
- (void)setPerson:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCreateContactCommand

- (_SFPBCreateContactCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCreateContactCommand *)self init];
  if (v5)
  {
    v6 = [v4 person];

    if (v6)
    {
      v7 = [_SFPBPerson alloc];
      v8 = [v4 person];
      v9 = [(_SFPBPerson *)v7 initWithFacade:v8];
      [(_SFPBCreateContactCommand *)v5 setPerson:v9];
    }
    if ([v4 hasAddToExistingContact]) {
      -[_SFPBCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", [v4 addToExistingContact]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)addToExistingContact
{
  return self->_addToExistingContact;
}

- (_SFPBPerson)person
{
  return self->_person;
}

- (_SFPBCreateContactCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBCreateContactCommand;
  v5 = [(_SFPBCreateContactCommand *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"person"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBPerson alloc] initWithDictionary:v6];
      [(_SFPBCreateContactCommand *)v5 setPerson:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"addToExistingContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCreateContactCommand setAddToExistingContact:](v5, "setAddToExistingContact:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBCreateContactCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCreateContactCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCreateContactCommand *)self dictionaryRepresentation];
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
  if (self->_addToExistingContact)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCreateContactCommand addToExistingContact](self, "addToExistingContact"));
    [v3 setObject:v4 forKeyedSubscript:@"addToExistingContact"];
  }
  if (self->_person)
  {
    v5 = [(_SFPBCreateContactCommand *)self person];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"person"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"person"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBPerson *)self->_person hash];
  uint64_t v4 = 2654435761;
  if (!self->_addToExistingContact) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBCreateContactCommand *)self person];
    v6 = [v4 person];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBCreateContactCommand *)self person];
      if (!v8)
      {

LABEL_10:
        int addToExistingContact = self->_addToExistingContact;
        BOOL v13 = addToExistingContact == [v4 addToExistingContact];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBCreateContactCommand *)self person];
      objc_super v11 = [v4 person];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBCreateContactCommand *)self person];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBCreateContactCommand *)self addToExistingContact]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCreateContactCommandReadFrom(self, (uint64_t)a3);
}

- (void)setAddToExistingContact:(BOOL)a3
{
  self->_int addToExistingContact = a3;
}

- (void)setPerson:(id)a3
{
}

@end