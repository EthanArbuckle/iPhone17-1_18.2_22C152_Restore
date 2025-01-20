@interface _SFPBPersonHeaderCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBPerson)person;
- (_SFPBPersonHeaderCardSection)initWithDictionary:(id)a3;
- (_SFPBPersonHeaderCardSection)initWithFacade:(id)a3;
- (_SFPBPersonHeaderCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPerson:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPersonHeaderCardSection

- (_SFPBPersonHeaderCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPersonHeaderCardSection *)self init];
  if (v5)
  {
    v6 = [v4 person];

    if (v6)
    {
      v7 = [_SFPBPerson alloc];
      v8 = [v4 person];
      v9 = [(_SFPBPerson *)v7 initWithFacade:v8];
      [(_SFPBPersonHeaderCardSection *)v5 setPerson:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (_SFPBPerson)person
{
  return self->_person;
}

- (_SFPBPersonHeaderCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBPersonHeaderCardSection;
  v5 = [(_SFPBPersonHeaderCardSection *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"person"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBPerson alloc] initWithDictionary:v6];
      [(_SFPBPersonHeaderCardSection *)v5 setPerson:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBPersonHeaderCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPersonHeaderCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPersonHeaderCardSection *)self dictionaryRepresentation];
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
  if (self->_person)
  {
    id v4 = [(_SFPBPersonHeaderCardSection *)self person];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"person"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"person"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  return [(_SFPBPerson *)self->_person hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBPersonHeaderCardSection *)self person];
    v6 = [v4 person];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBPersonHeaderCardSection *)self person];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(_SFPBPersonHeaderCardSection *)self person];
      v11 = [v4 person];
      char v12 = [v10 isEqual:v11];

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
  id v4 = [(_SFPBPersonHeaderCardSection *)self person];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPersonHeaderCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setPerson:(id)a3
{
}

@end