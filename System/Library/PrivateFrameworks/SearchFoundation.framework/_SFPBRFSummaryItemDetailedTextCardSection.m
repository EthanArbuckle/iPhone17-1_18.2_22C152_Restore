@interface _SFPBRFSummaryItemDetailedTextCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFSummaryItemDetailedTextCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemDetailedTextCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemDetailedTextCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFTextProperty)text_5;
- (_SFPBRFTextProperty)text_6;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setText_5:(id)a3;
- (void)setText_6:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemDetailedTextCardSection

- (_SFPBRFSummaryItemDetailedTextCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(_SFPBRFTextProperty *)v19 initWithFacade:v20];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_4:v21];
    }
    v22 = [v4 text];

    if (v22)
    {
      v23 = [_SFPBRFTextProperty alloc];
      v24 = [v4 text];
      v25 = [(_SFPBRFTextProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_5:v25];
    }
    v26 = [v4 text];

    if (v26)
    {
      v27 = [_SFPBRFTextProperty alloc];
      v28 = [v4 text];
      v29 = [(_SFPBRFTextProperty *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_6:v29];
    }
    v30 = [v4 thumbnail];

    if (v30)
    {
      v31 = [_SFPBRFVisualProperty alloc];
      v32 = [v4 thumbnail];
      v33 = [(_SFPBRFVisualProperty *)v31 initWithFacade:v32];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setThumbnail:v33];
    }
    v34 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_6, 0);
  objc_storeStrong((id *)&self->_text_5, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRFTextProperty)text_6
{
  return self->_text_6;
}

- (_SFPBRFTextProperty)text_5
{
  return self->_text_5;
}

- (_SFPBRFTextProperty)text_4
{
  return self->_text_4;
}

- (_SFPBRFTextProperty)text_3
{
  return self->_text_3;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFSummaryItemDetailedTextCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBRFSummaryItemDetailedTextCardSection;
  v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_3:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFTextProperty alloc] initWithDictionary:v12];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_4:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"text5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFTextProperty alloc] initWithDictionary:v14];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_5:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"text6"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBRFTextProperty alloc] initWithDictionary:v16];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setText_6:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v18];
      [(_SFPBRFSummaryItemDetailedTextCardSection *)v5 setThumbnail:v19];
    }
    v20 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemDetailedTextCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemDetailedTextCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self dictionaryRepresentation];
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
  if (self->_text_1)
  {
    id v4 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"text1"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    uint64_t v7 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"text2"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"text2"];
    }
  }
  if (self->_text_3)
  {
    v10 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text3"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text3"];
    }
  }
  if (self->_text_4)
  {
    v13 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"text4"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_text_5)
  {
    v16 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"text5"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"text5"];
    }
  }
  if (self->_text_6)
  {
    v19 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"text6"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"text6"];
    }
  }
  if (self->_thumbnail)
  {
    objc_super v22 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self thumbnail];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_3 hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v7 = [(_SFPBRFTextProperty *)self->_text_5 hash];
  unint64_t v8 = v7 ^ [(_SFPBRFTextProperty *)self->_text_6 hash];
  return v6 ^ v8 ^ [(_SFPBRFVisualProperty *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v30 = [v4 text];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
    v35 = [v4 text];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self thumbnail];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    v39 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self thumbnail];
    v40 = [v4 thumbnail];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v8 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  v9 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self text];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  v10 = [(_SFPBRFSummaryItemDetailedTextCardSection *)self thumbnail];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemDetailedTextCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (void)setText_6:(id)a3
{
}

- (void)setText_5:(id)a3
{
}

- (void)setText_4:(id)a3
{
}

- (void)setText_3:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end