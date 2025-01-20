@interface _SFPBRFBinaryButtonCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBButtonItem)primary_button;
- (_SFPBButtonItem)secondary_button;
- (_SFPBRFBinaryButtonCardSection)initWithDictionary:(id)a3;
- (_SFPBRFBinaryButtonCardSection)initWithFacade:(id)a3;
- (_SFPBRFBinaryButtonCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPrimary_button:(id)a3;
- (void)setSecondary_button:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFBinaryButtonCardSection

- (_SFPBRFBinaryButtonCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFBinaryButtonCardSection *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "primary_button");

    if (v6)
    {
      v7 = [_SFPBButtonItem alloc];
      v8 = objc_msgSend(v4, "primary_button");
      v9 = [(_SFPBButtonItem *)v7 initWithFacade:v8];
      [(_SFPBRFBinaryButtonCardSection *)v5 setPrimary_button:v9];
    }
    v10 = objc_msgSend(v4, "secondary_button");

    if (v10)
    {
      v11 = [_SFPBButtonItem alloc];
      v12 = objc_msgSend(v4, "secondary_button");
      v13 = [(_SFPBButtonItem *)v11 initWithFacade:v12];
      [(_SFPBRFBinaryButtonCardSection *)v5 setSecondary_button:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondary_button, 0);
  objc_storeStrong((id *)&self->_primary_button, 0);
}

- (_SFPBButtonItem)secondary_button
{
  return self->_secondary_button;
}

- (_SFPBButtonItem)primary_button
{
  return self->_primary_button;
}

- (_SFPBRFBinaryButtonCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFBinaryButtonCardSection;
  v5 = [(_SFPBRFBinaryButtonCardSection *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"primaryButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBButtonItem alloc] initWithDictionary:v6];
      [(_SFPBRFBinaryButtonCardSection *)v5 setPrimary_button:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"secondaryButton"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBButtonItem alloc] initWithDictionary:v8];
      [(_SFPBRFBinaryButtonCardSection *)v5 setSecondary_button:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFBinaryButtonCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFBinaryButtonCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFBinaryButtonCardSection *)self dictionaryRepresentation];
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
  if (self->_primary_button)
  {
    id v4 = [(_SFPBRFBinaryButtonCardSection *)self primary_button];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"primaryButton"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"primaryButton"];
    }
  }
  if (self->_secondary_button)
  {
    uint64_t v7 = [(_SFPBRFBinaryButtonCardSection *)self secondary_button];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"secondaryButton"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"secondaryButton"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBButtonItem *)self->_primary_button hash];
  return [(_SFPBButtonItem *)self->_secondary_button hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFBinaryButtonCardSection *)self primary_button];
  v6 = objc_msgSend(v4, "primary_button");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFBinaryButtonCardSection *)self primary_button];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFBinaryButtonCardSection *)self primary_button];
    v10 = objc_msgSend(v4, "primary_button");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFBinaryButtonCardSection *)self secondary_button];
  v6 = objc_msgSend(v4, "secondary_button");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFBinaryButtonCardSection *)self secondary_button];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRFBinaryButtonCardSection *)self secondary_button];
    v15 = objc_msgSend(v4, "secondary_button");
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBRFBinaryButtonCardSection *)self primary_button];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFBinaryButtonCardSection *)self secondary_button];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFBinaryButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setSecondary_button:(id)a3
{
}

- (void)setPrimary_button:(id)a3
{
}

@end