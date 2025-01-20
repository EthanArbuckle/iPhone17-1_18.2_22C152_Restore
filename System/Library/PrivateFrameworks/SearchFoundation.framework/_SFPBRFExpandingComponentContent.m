@interface _SFPBRFExpandingComponentContent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFExpandingComponentContent)initWithDictionary:(id)a3;
- (_SFPBRFExpandingComponentContent)initWithFacade:(id)a3;
- (_SFPBRFExpandingComponentContent)initWithJSON:(id)a3;
- (_SFPBRFLongItemStandardCardSection)long_item_standard_card_section;
- (_SFPBRFReferenceFootnoteCardSection)reference_footnote_card_section;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setLong_item_standard_card_section:(id)a3;
- (void)setReference_footnote_card_section:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFExpandingComponentContent

- (_SFPBRFExpandingComponentContent)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFExpandingComponentContent *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasLong_item_standard_card_section"))
    {
      v6 = objc_msgSend(v4, "long_item_standard_card_section");

      if (v6)
      {
        v7 = [_SFPBRFLongItemStandardCardSection alloc];
        v8 = objc_msgSend(v4, "long_item_standard_card_section");
        v9 = [(_SFPBRFLongItemStandardCardSection *)v7 initWithFacade:v8];
        [(_SFPBRFExpandingComponentContent *)v5 setLong_item_standard_card_section:v9];
      }
    }
    if (objc_msgSend(v4, "hasReference_footnote_card_section"))
    {
      v10 = objc_msgSend(v4, "reference_footnote_card_section");

      if (v10)
      {
        v11 = [_SFPBRFReferenceFootnoteCardSection alloc];
        v12 = objc_msgSend(v4, "reference_footnote_card_section");
        v13 = [(_SFPBRFReferenceFootnoteCardSection *)v11 initWithFacade:v12];
        [(_SFPBRFExpandingComponentContent *)v5 setReference_footnote_card_section:v13];
      }
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference_footnote_card_section, 0);
  objc_storeStrong((id *)&self->_long_item_standard_card_section, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (_SFPBRFExpandingComponentContent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFExpandingComponentContent;
  v5 = [(_SFPBRFExpandingComponentContent *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"longItemStandardCardSection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFLongItemStandardCardSection alloc] initWithDictionary:v6];
      [(_SFPBRFExpandingComponentContent *)v5 setLong_item_standard_card_section:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"referenceFootnoteCardSection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFReferenceFootnoteCardSection alloc] initWithDictionary:v8];
      [(_SFPBRFExpandingComponentContent *)v5 setReference_footnote_card_section:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFExpandingComponentContent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFExpandingComponentContent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFExpandingComponentContent *)self dictionaryRepresentation];
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
  if (self->_long_item_standard_card_section)
  {
    id v4 = [(_SFPBRFExpandingComponentContent *)self long_item_standard_card_section];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"longItemStandardCardSection"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"longItemStandardCardSection"];
    }
  }
  if (self->_reference_footnote_card_section)
  {
    uint64_t v7 = [(_SFPBRFExpandingComponentContent *)self reference_footnote_card_section];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"referenceFootnoteCardSection"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"referenceFootnoteCardSection"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFLongItemStandardCardSection *)self->_long_item_standard_card_section hash];
  return [(_SFPBRFReferenceFootnoteCardSection *)self->_reference_footnote_card_section hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBRFExpandingComponentContent *)self long_item_standard_card_section];
  v6 = objc_msgSend(v4, "long_item_standard_card_section");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFExpandingComponentContent *)self long_item_standard_card_section];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFExpandingComponentContent *)self long_item_standard_card_section];
    v10 = objc_msgSend(v4, "long_item_standard_card_section");
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFExpandingComponentContent *)self reference_footnote_card_section];
  v6 = objc_msgSend(v4, "reference_footnote_card_section");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFExpandingComponentContent *)self reference_footnote_card_section];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBRFExpandingComponentContent *)self reference_footnote_card_section];
    v15 = objc_msgSend(v4, "reference_footnote_card_section");
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
  id v4 = [(_SFPBRFExpandingComponentContent *)self long_item_standard_card_section];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFExpandingComponentContent *)self reference_footnote_card_section];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFExpandingComponentContentReadFrom(self, (uint64_t)a3);
}

- (_SFPBRFReferenceFootnoteCardSection)reference_footnote_card_section
{
  if (self->_whichValue == 2) {
    v2 = self->_reference_footnote_card_section;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setReference_footnote_card_section:(id)a3
{
  id v4 = (_SFPBRFReferenceFootnoteCardSection *)a3;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = 0;

  self->_whichValue = 2 * (v4 != 0);
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = v4;
}

- (_SFPBRFLongItemStandardCardSection)long_item_standard_card_section
{
  if (self->_whichValue == 1) {
    v2 = self->_long_item_standard_card_section;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLong_item_standard_card_section:(id)a3
{
  id v4 = (_SFPBRFLongItemStandardCardSection *)a3;
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = 0;

  self->_whichValue = v4 != 0;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = v4;
}

@end