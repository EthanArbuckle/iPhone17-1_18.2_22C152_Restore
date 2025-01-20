@interface _SFPBRFSummaryItemPlayerCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBButtonItem)player;
- (_SFPBRFSummaryItemPlayerCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSummaryItemPlayerCardSection)initWithFacade:(id)a3;
- (_SFPBRFSummaryItemPlayerCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPlayer:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSummaryItemPlayerCardSection

- (_SFPBRFSummaryItemPlayerCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(_SFPBRFTextProperty *)v19 initWithFacade:v20];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_4:v21];
    }
    v22 = [v4 thumbnail];

    if (v22)
    {
      v23 = [_SFPBRFVisualProperty alloc];
      v24 = [v4 thumbnail];
      v25 = [(_SFPBRFVisualProperty *)v23 initWithFacade:v24];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setThumbnail:v25];
    }
    v26 = [v4 player];

    if (v26)
    {
      v27 = [_SFPBButtonItem alloc];
      v28 = [v4 player];
      v29 = [(_SFPBButtonItem *)v27 initWithFacade:v28];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setPlayer:v29];
    }
    v30 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (_SFPBButtonItem)player
{
  return self->_player;
}

- (_SFPBRFVisualProperty)thumbnail
{
  return self->_thumbnail;
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

- (_SFPBRFSummaryItemPlayerCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFPBRFSummaryItemPlayerCardSection;
  v5 = [(_SFPBRFSummaryItemPlayerCardSection *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_3:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFTextProperty alloc] initWithDictionary:v12];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setText_4:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v14];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setThumbnail:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"player"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[_SFPBButtonItem alloc] initWithDictionary:v16];
      [(_SFPBRFSummaryItemPlayerCardSection *)v5 setPlayer:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBRFSummaryItemPlayerCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSummaryItemPlayerCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSummaryItemPlayerCardSection *)self dictionaryRepresentation];
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
  if (self->_player)
  {
    id v4 = [(_SFPBRFSummaryItemPlayerCardSection *)self player];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"player"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"player"];
    }
  }
  if (self->_text_1)
  {
    uint64_t v7 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"text1"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    v10 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"text2"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"text2"];
    }
  }
  if (self->_text_3)
  {
    v13 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"text3"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"text3"];
    }
  }
  if (self->_text_4)
  {
    v16 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"text4"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail)
  {
    v19 = [(_SFPBRFSummaryItemPlayerCardSection *)self thumbnail];
    objc_super v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"thumbnail"];
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
  unint64_t v7 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  return v6 ^ v7 ^ [(_SFPBButtonItem *)self->_player hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    objc_super v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBRFSummaryItemPlayerCardSection *)self thumbnail];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBRFSummaryItemPlayerCardSection *)self thumbnail];
    v30 = [v4 thumbnail];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self player];
  unint64_t v6 = [v4 player];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_SFPBRFSummaryItemPlayerCardSection *)self player];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_SFPBRFSummaryItemPlayerCardSection *)self player];
    v35 = [v4 player];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSummaryItemPlayerCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  v8 = [(_SFPBRFSummaryItemPlayerCardSection *)self thumbnail];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  v9 = [(_SFPBRFSummaryItemPlayerCardSection *)self player];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSummaryItemPlayerCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setPlayer:(id)a3
{
}

- (void)setThumbnail:(id)a3
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