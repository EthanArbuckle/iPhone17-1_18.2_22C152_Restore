@interface _SFPBRFSimpleItemVisualElementCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFSimpleItemVisualElementCardSection)initWithDictionary:(id)a3;
- (_SFPBRFSimpleItemVisualElementCardSection)initWithFacade:(id)a3;
- (_SFPBRFSimpleItemVisualElementCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)footnote;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (_SFPBRFVisualProperty)image;
- (id)dictionaryRepresentation;
- (int)attribution_style;
- (int)horizontal_alignment;
- (unint64_t)hash;
- (void)setAttribution_style:(int)a3;
- (void)setFootnote:(id)a3;
- (void)setHorizontal_alignment:(int)a3;
- (void)setImage:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFSimpleItemVisualElementCardSection

- (_SFPBRFSimpleItemVisualElementCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self init];
  if (v5)
  {
    v6 = [v4 image];

    if (v6)
    {
      v7 = [_SFPBRFVisualProperty alloc];
      v8 = [v4 image];
      v9 = [(_SFPBRFVisualProperty *)v7 initWithFacade:v8];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setImage:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setText_1:v13];
    }
    v14 = [v4 text];

    if (v14)
    {
      v15 = [_SFPBRFTextProperty alloc];
      v16 = [v4 text];
      v17 = [(_SFPBRFTextProperty *)v15 initWithFacade:v16];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setText_2:v17];
    }
    v18 = [v4 footnote];

    if (v18)
    {
      v19 = [_SFPBRFTextProperty alloc];
      v20 = [v4 footnote];
      v21 = [(_SFPBRFTextProperty *)v19 initWithFacade:v20];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setFootnote:v21];
    }
    if (objc_msgSend(v4, "hasHorizontal_alignment")) {
      -[_SFPBRFSimpleItemVisualElementCardSection setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    }
    if (objc_msgSend(v4, "hasAttribution_style")) {
      -[_SFPBRFSimpleItemVisualElementCardSection setAttribution_style:](v5, "setAttribution_style:", objc_msgSend(v4, "attribution_style"));
    }
    v22 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (int)attribution_style
{
  return self->_attribution_style;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (_SFPBRFTextProperty)footnote
{
  return self->_footnote;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFVisualProperty)image
{
  return self->_image;
}

- (_SFPBRFSimpleItemVisualElementCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBRFSimpleItemVisualElementCardSection;
  v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v6];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setImage:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setText_2:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFTextProperty alloc] initWithDictionary:v12];
      [(_SFPBRFSimpleItemVisualElementCardSection *)v5 setFootnote:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"horizontalAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSimpleItemVisualElementCardSection setHorizontal_alignment:](v5, "setHorizontal_alignment:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"attributionStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFSimpleItemVisualElementCardSection setAttribution_style:](v5, "setAttribution_style:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBRFSimpleItemVisualElementCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFSimpleItemVisualElementCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFSimpleItemVisualElementCardSection *)self dictionaryRepresentation];
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
  if (self->_attribution_style)
  {
    uint64_t v4 = [(_SFPBRFSimpleItemVisualElementCardSection *)self attribution_style];
    if (v4)
    {
      if (v4 == 1)
      {
        v5 = @"1";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"0";
    }
    [v3 setObject:v5 forKeyedSubscript:@"attributionStyle"];
  }
  if (self->_footnote)
  {
    v6 = [(_SFPBRFSimpleItemVisualElementCardSection *)self footnote];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"footnote"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"footnote"];
    }
  }
  if (self->_horizontal_alignment)
  {
    uint64_t v9 = [(_SFPBRFSimpleItemVisualElementCardSection *)self horizontal_alignment];
    if (v9 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E5A2F070[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"horizontalAlignment"];
  }
  if (self->_image)
  {
    v11 = [(_SFPBRFSimpleItemVisualElementCardSection *)self image];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"image"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"image"];
    }
  }
  if (self->_text_1)
  {
    v14 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"text1"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    v17 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
    objc_super v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"text2"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"text2"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFVisualProperty *)self->_image hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v5 = [(_SFPBRFTextProperty *)self->_text_2 hash];
  return v4 ^ v3 ^ v5 ^ [(_SFPBRFTextProperty *)self->_footnote hash] ^ (2654435761
                                                                              * self->_horizontal_alignment) ^ (2654435761 * self->_attribution_style);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self image];
  v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBRFSimpleItemVisualElementCardSection *)self image];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFSimpleItemVisualElementCardSection *)self image];
    v10 = [v4 image];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
    v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
    v20 = [v4 text];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self footnote];
  v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(_SFPBRFSimpleItemVisualElementCardSection *)self footnote];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFSimpleItemVisualElementCardSection *)self footnote];
    v25 = [v4 footnote];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int horizontal_alignment = self->_horizontal_alignment;
  if (horizontal_alignment == objc_msgSend(v4, "horizontal_alignment"))
  {
    int attribution_style = self->_attribution_style;
    BOOL v27 = attribution_style == objc_msgSend(v4, "attribution_style");
    goto LABEL_23;
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_SFPBRFSimpleItemVisualElementCardSection *)self image];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBRFSimpleItemVisualElementCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFSimpleItemVisualElementCardSection *)self footnote];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFSimpleItemVisualElementCardSection *)self horizontal_alignment]) {
    PBDataWriterWriteInt32Field();
  }
  int v8 = [(_SFPBRFSimpleItemVisualElementCardSection *)self attribution_style];
  uint64_t v9 = v10;
  if (v8)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFSimpleItemVisualElementCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAttribution_style:(int)a3
{
  self->_int attribution_style = a3;
}

- (void)setHorizontal_alignment:(int)a3
{
  self->_int horizontal_alignment = a3;
}

- (void)setFootnote:(id)a3
{
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

- (void)setImage:(id)a3
{
}

@end