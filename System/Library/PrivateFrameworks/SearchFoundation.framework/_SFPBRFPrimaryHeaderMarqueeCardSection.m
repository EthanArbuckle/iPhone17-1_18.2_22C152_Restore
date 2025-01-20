@interface _SFPBRFPrimaryHeaderMarqueeCardSection
- (BOOL)addTint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithDictionary:(id)a3;
- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithFacade:(id)a3;
- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFVisualProperty)thumbnail;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAddTint:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFPrimaryHeaderMarqueeCardSection

- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 thumbnail];

    if (v14)
    {
      v15 = [_SFPBRFVisualProperty alloc];
      v16 = [v4 thumbnail];
      v17 = [(_SFPBRFVisualProperty *)v15 initWithFacade:v16];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setThumbnail:v17];
    }
    if ([v4 hasAddTint]) {
      -[_SFPBRFPrimaryHeaderMarqueeCardSection setAddTint:](v5, "setAddTint:", [v4 addTint]);
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
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

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBRFPrimaryHeaderMarqueeCardSection;
  v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v10];
      [(_SFPBRFPrimaryHeaderMarqueeCardSection *)v5 setThumbnail:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"addTint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFPrimaryHeaderMarqueeCardSection setAddTint:](v5, "setAddTint:", [v12 BOOLValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBRFPrimaryHeaderMarqueeCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFPrimaryHeaderMarqueeCardSection addTint](self, "addTint"));
    [v3 setObject:v4 forKeyedSubscript:@"addTint"];
  }
  if (self->_text_1)
  {
    v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
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
    v8 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
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
  if (self->_thumbnail)
  {
    v11 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self thumbnail];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"thumbnail"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash];
  unint64_t v5 = [(_SFPBRFVisualProperty *)self->_thumbnail hash];
  uint64_t v6 = 2654435761;
  if (!self->_addTint) {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
    objc_super v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self thumbnail];
    if (!v17)
    {

LABEL_20:
      int addTint = self->_addTint;
      BOOL v22 = addTint == [v4 addTint];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self thumbnail];
    v20 = [v4 thumbnail];
    int v21 = [v19 isEqual:v20];

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
  id v4 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFPrimaryHeaderMarqueeCardSection *)self thumbnail];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFPrimaryHeaderMarqueeCardSection *)self addTint]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPrimaryHeaderMarqueeCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAddTint:(BOOL)a3
{
  self->_int addTint = a3;
}

- (void)setThumbnail:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end