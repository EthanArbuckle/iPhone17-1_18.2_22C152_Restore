@interface RFExpandingComponentContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLong_item_standard_card_section;
- (BOOL)hasReference_footnote_card_section;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFExpandingComponentContent)initWithCoder:(id)a3;
- (RFExpandingComponentContent)initWithProtobuf:(id)a3;
- (RFLongItemStandardCardSection)long_item_standard_card_section;
- (RFReferenceFootnoteCardSection)reference_footnote_card_section;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLong_item_standard_card_section:(id)a3;
- (void)setReference_footnote_card_section:(id)a3;
@end

@implementation RFExpandingComponentContent

- (RFExpandingComponentContent)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFExpandingComponentContent;
  v5 = [(RFExpandingComponentContent *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "long_item_standard_card_section");

    if (v6)
    {
      v7 = [RFLongItemStandardCardSection alloc];
      v8 = objc_msgSend(v4, "long_item_standard_card_section");
      v9 = [(RFLongItemStandardCardSection *)v7 initWithProtobuf:v8];
      [(RFExpandingComponentContent *)v5 setLong_item_standard_card_section:v9];
    }
    v10 = objc_msgSend(v4, "reference_footnote_card_section");

    if (v10)
    {
      v11 = [RFReferenceFootnoteCardSection alloc];
      v12 = objc_msgSend(v4, "reference_footnote_card_section");
      v13 = [(RFReferenceFootnoteCardSection *)v11 initWithProtobuf:v12];
      [(RFExpandingComponentContent *)v5 setReference_footnote_card_section:v13];
    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference_footnote_card_section, 0);
  objc_storeStrong((id *)&self->_long_item_standard_card_section, 0);
}

- (RFReferenceFootnoteCardSection)reference_footnote_card_section
{
  return self->_reference_footnote_card_section;
}

- (RFLongItemStandardCardSection)long_item_standard_card_section
{
  return self->_long_item_standard_card_section;
}

- (unint64_t)hash
{
  v3 = [(RFExpandingComponentContent *)self long_item_standard_card_section];
  uint64_t v4 = [v3 hash];
  v5 = [(RFExpandingComponentContent *)self reference_footnote_card_section];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFExpandingComponentContent *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFExpandingComponentContent *)v5 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v6 = v5;
      v7 = [(RFExpandingComponentContent *)self long_item_standard_card_section];
      v8 = [(RFExpandingComponentContent *)v6 long_item_standard_card_section];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v9 = [(RFExpandingComponentContent *)self long_item_standard_card_section];
      if (v9)
      {
        v3 = [(RFExpandingComponentContent *)self long_item_standard_card_section];
        v10 = [(RFExpandingComponentContent *)v6 long_item_standard_card_section];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      v12 = [(RFExpandingComponentContent *)self reference_footnote_card_section];
      v13 = [(RFExpandingComponentContent *)v6 reference_footnote_card_section];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
      }
      else
      {
        uint64_t v15 = [(RFExpandingComponentContent *)self reference_footnote_card_section];
        if (v15)
        {
          objc_super v16 = (void *)v15;
          v19 = [(RFExpandingComponentContent *)self reference_footnote_card_section];
          [(RFExpandingComponentContent *)v6 reference_footnote_card_section];
          v17 = v20 = v3;
          char v11 = [v19 isEqual:v17];

          v3 = v20;
        }
        else
        {

          char v11 = 1;
        }
      }
      v10 = v21;
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFExpandingComponentContent *)self hasLong_item_standard_card_section])
  {
    v5 = [(RFExpandingComponentContent *)self long_item_standard_card_section];
    unint64_t v6 = (void *)[v5 copy];
    objc_msgSend(v4, "setLong_item_standard_card_section:", v6);
  }
  if ([(RFExpandingComponentContent *)self hasReference_footnote_card_section])
  {
    v7 = [(RFExpandingComponentContent *)self reference_footnote_card_section];
    v8 = (void *)[v7 copy];
    objc_msgSend(v4, "setReference_footnote_card_section:", v8);
  }
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFExpandingComponentContent alloc] initWithFacade:self];
  v3 = [(_SFPBRFExpandingComponentContent *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFExpandingComponentContent alloc] initWithFacade:self];
  v3 = [(_SFPBRFExpandingComponentContent *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBRFExpandingComponentContent alloc] initWithFacade:self];
  v5 = [(_SFPBRFExpandingComponentContent *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFExpandingComponentContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBRFExpandingComponentContent alloc] initWithData:v5];
  v7 = [(RFExpandingComponentContent *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasReference_footnote_card_section
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReference_footnote_card_section:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_reference_footnote_card_section, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  long_item_standard_card_section = self->_long_item_standard_card_section;
  self->_long_item_standard_card_section = 0;
}

- (BOOL)hasLong_item_standard_card_section
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLong_item_standard_card_section:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_long_item_standard_card_section, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  reference_footnote_card_section = self->_reference_footnote_card_section;
  self->_reference_footnote_card_section = 0;
}

@end