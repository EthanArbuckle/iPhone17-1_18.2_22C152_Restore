@interface _SFPBRFFactItemHeroButtonCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBButtonItem)button;
- (_SFPBRFFactItemHeroButtonCardSection)initWithDictionary:(id)a3;
- (_SFPBRFFactItemHeroButtonCardSection)initWithFacade:(id)a3;
- (_SFPBRFFactItemHeroButtonCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)number;
- (_SFPBRFTextProperty)text_1;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setButton:(id)a3;
- (void)setNumber:(id)a3;
- (void)setText_1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFactItemHeroButtonCardSection

- (_SFPBRFFactItemHeroButtonCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)self init];
  if (v5)
  {
    v6 = [v4 number];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 number];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setNumber:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setText_1:v13];
    }
    v14 = [v4 button];

    if (v14)
    {
      v15 = [_SFPBButtonItem alloc];
      v16 = [v4 button];
      v17 = [(_SFPBButtonItem *)v15 initWithFacade:v16];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setButton:v17];
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_number, 0);
}

- (_SFPBButtonItem)button
{
  return self->_button;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFTextProperty)number
{
  return self->_number;
}

- (_SFPBRFFactItemHeroButtonCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBRFFactItemHeroButtonCardSection;
  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"number"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setNumber:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"button"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBButtonItem alloc] initWithDictionary:v10];
      [(_SFPBRFFactItemHeroButtonCardSection *)v5 setButton:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBRFFactItemHeroButtonCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFactItemHeroButtonCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFactItemHeroButtonCardSection *)self dictionaryRepresentation];
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
  if (self->_button)
  {
    id v4 = [(_SFPBRFFactItemHeroButtonCardSection *)self button];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"button"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"button"];
    }
  }
  if (self->_number)
  {
    uint64_t v7 = [(_SFPBRFFactItemHeroButtonCardSection *)self number];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"number"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"number"];
    }
  }
  if (self->_text_1)
  {
    v10 = [(_SFPBRFFactItemHeroButtonCardSection *)self text];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text1"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text1"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_number hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_1 hash] ^ v3;
  return v4 ^ [(_SFPBButtonItem *)self->_button hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)self number];
  v6 = [v4 number];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBRFFactItemHeroButtonCardSection *)self number];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFFactItemHeroButtonCardSection *)self number];
    v10 = [v4 number];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBRFFactItemHeroButtonCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBRFFactItemHeroButtonCardSection *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)self button];
  v6 = [v4 button];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBRFFactItemHeroButtonCardSection *)self button];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBRFFactItemHeroButtonCardSection *)self button];
    v20 = [v4 button];
    char v21 = [v19 isEqual:v20];

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
  id v7 = a3;
  id v4 = [(_SFPBRFFactItemHeroButtonCardSection *)self number];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFFactItemHeroButtonCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBRFFactItemHeroButtonCardSection *)self button];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFactItemHeroButtonCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setButton:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

- (void)setNumber:(id)a3
{
}

@end