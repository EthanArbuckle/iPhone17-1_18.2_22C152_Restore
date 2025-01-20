@interface _SFPBRFPrimaryHeaderRichCardSection
- (BOOL)addTint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFPrimaryHeaderRichCardSection)initWithDictionary:(id)a3;
- (_SFPBRFPrimaryHeaderRichCardSection)initWithFacade:(id)a3;
- (_SFPBRFPrimaryHeaderRichCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFTextProperty)text_3;
- (_SFPBRFTextProperty)text_4;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setText_3:(id)a3;
- (void)setText_4:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFPrimaryHeaderRichCardSection

- (_SFPBRFPrimaryHeaderRichCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_3:v17];
    }
    v18 = [v4 text];

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      v20 = [v4 text];
      v21 = [(_SFPBRFTextProperty *)v19 initWithFacade:v20];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_4:v21];
    }
    v22 = [v4 thumbnail];

    if (v22)
    {
      v23 = [_SFPBRFVisualProperty alloc];
      v24 = [v4 thumbnail];
      v25 = [(_SFPBRFVisualProperty *)v23 initWithFacade:v24];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setThumbnail:v25];
    }
    if ([v4 hasAddTint]) {
      -[_SFPBRFPrimaryHeaderRichCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v26 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_text_4, 0);
  objc_storeStrong((id *)&self->_text_3, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (BOOL)addTint
{
  return self->_addTint;
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

- (_SFPBRFPrimaryHeaderRichCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBRFPrimaryHeaderRichCardSection;
  v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text3"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_3:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"text4"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFTextProperty alloc] initWithDictionary:v12];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setText_4:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v14];
      [(_SFPBRFPrimaryHeaderRichCardSection *)v5 setThumbnail:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"addTint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFPrimaryHeaderRichCardSection setAddTint:](v5, "setAddTint:", [v16 BOOLValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (_SFPBRFPrimaryHeaderRichCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFPrimaryHeaderRichCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFPrimaryHeaderRichCardSection *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFPrimaryHeaderRichCardSection addTint](self, "addTint"));
    [v3 setObject:v4 forKeyedSubscript:@"addTint"];
  }
  if (self->_text_1)
  {
    v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
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
  if (self->_text_2)
  {
    v8 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"text2"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"text2"];
    }
  }
  if (self->_text_3)
  {
    v11 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"text3"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"text3"];
    }
  }
  if (self->_text_4)
  {
    v14 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"text4"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"text4"];
    }
  }
  if (self->_thumbnail)
  {
    v17 = [(_SFPBRFPrimaryHeaderRichCardSection *)self thumbnail];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash];
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_3 hash];
  unint64_t v6 = [(_SFPBRFTextProperty *)self->_text_4 hash];
  unint64_t v7 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  uint64_t v8 = 2654435761;
  if (!self->_addTint) {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
    v25 = [v4 text];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self thumbnail];
  unint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBRFPrimaryHeaderRichCardSection *)self thumbnail];
    if (!v27)
    {

LABEL_30:
      int addTint = self->_addTint;
      BOOL v32 = addTint == [v4 addTint];
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_SFPBRFPrimaryHeaderRichCardSection *)self thumbnail];
    v30 = [v4 thumbnail];
    int v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFPrimaryHeaderRichCardSection *)self text];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v8 = [(_SFPBRFPrimaryHeaderRichCardSection *)self thumbnail];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFPrimaryHeaderRichCardSection *)self addTint]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPrimaryHeaderRichCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAddTint:(BOOL)a3
{
  self->_int addTint = a3;
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