@interface _SFPBRFReferenceStandardCardSection
- (BOOL)addTint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFReferenceStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFReferenceStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFReferenceStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFReferenceStandardCardSection

- (_SFPBRFReferenceStandardCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFReferenceStandardCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFReferenceStandardCardSection *)v5 setText_1:v9];
    }
    if ([v4 hasAddTint]) {
      -[_SFPBRFReferenceStandardCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)addTint
{
  return self->_addTint;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFReferenceStandardCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBRFReferenceStandardCardSection;
  v5 = [(_SFPBRFReferenceStandardCardSection *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFReferenceStandardCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"addTint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFReferenceStandardCardSection setAddTint:](v5, "setAddTint:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBRFReferenceStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFReferenceStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFReferenceStandardCardSection *)self dictionaryRepresentation];
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
  if (self->_addTint)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFReferenceStandardCardSection addTint](self, "addTint"));
    [v3 setObject:v4 forKeyedSubscript:@"addTint"];
  }
  if (self->_text_1)
  {
    v5 = [(_SFPBRFReferenceStandardCardSection *)self text];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"text1"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"text1"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  uint64_t v4 = 2654435761;
  if (!self->_addTint) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFReferenceStandardCardSection *)self text];
    v6 = [v4 text];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFReferenceStandardCardSection *)self text];
      if (!v8)
      {

LABEL_10:
        int addTint = self->_addTint;
        BOOL v13 = addTint == [v4 addTint];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBRFReferenceStandardCardSection *)self text];
      objc_super v11 = [v4 text];
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
  id v4 = [(_SFPBRFReferenceStandardCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFReferenceStandardCardSection *)self addTint]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFReferenceStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAddTint:(BOOL)a3
{
  self->_int addTint = a3;
}

- (void)setText_1:(id)a3
{
}

@end