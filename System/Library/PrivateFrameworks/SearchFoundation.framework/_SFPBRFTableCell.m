@interface _SFPBRFTableCell
- (BOOL)applySmallCaps;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFTableCell)initWithDictionary:(id)a3;
- (_SFPBRFTableCell)initWithFacade:(id)a3;
- (_SFPBRFTableCell)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text;
- (_SFPBRFVisualProperty)visual;
- (id)dictionaryRepresentation;
- (int)column_span;
- (int)horizontal_alignment;
- (unint64_t)hash;
- (unint64_t)whichContent;
- (void)setApplySmallCaps:(BOOL)a3;
- (void)setColumn_span:(int)a3;
- (void)setHorizontal_alignment:(int)a3;
- (void)setText:(id)a3;
- (void)setVisual:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTableCell

- (_SFPBRFTableCell)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFTableCell *)self init];
  if (v5)
  {
    if ([v4 hasText])
    {
      v6 = [v4 text];

      if (v6)
      {
        v7 = [_SFPBRFTextProperty alloc];
        v8 = [v4 text];
        v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
        [(_SFPBRFTableCell *)v5 setText:v9];
      }
    }
    if ([v4 hasVisual])
    {
      v10 = [v4 visual];

      if (v10)
      {
        v11 = [_SFPBRFVisualProperty alloc];
        v12 = [v4 visual];
        v13 = [(_SFPBRFVisualProperty *)v11 initWithFacade:v12];
        [(_SFPBRFTableCell *)v5 setVisual:v13];
      }
    }
    v14 = objc_msgSend(v4, "column_span");

    if (v14)
    {
      v15 = objc_msgSend(v4, "column_span");
      -[_SFPBRFTableCell setColumn_span:](v5, "setColumn_span:", [v15 intValue]);
    }
    if (objc_msgSend(v4, "hasHorizontal_alignment")) {
      -[_SFPBRFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    }
    if ([v4 hasApplySmallCaps]) {
      -[_SFPBRFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", [v4 applySmallCaps]);
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (unint64_t)whichContent
{
  return self->_whichContent;
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (int)column_span
{
  return self->_column_span;
}

- (_SFPBRFTableCell)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBRFTableCell;
  v5 = [(_SFPBRFTableCell *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFTableCell *)v5 setText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"visual"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v8];
      [(_SFPBRFTableCell *)v5 setVisual:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"columnSpan"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableCell setColumn_span:](v5, "setColumn_span:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"horizontalAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"applySmallCaps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", [v12 BOOLValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBRFTableCell)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableCell *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableCell *)self dictionaryRepresentation];
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
  if (self->_applySmallCaps)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFTableCell applySmallCaps](self, "applySmallCaps"));
    [v3 setObject:v4 forKeyedSubscript:@"applySmallCaps"];
  }
  if (self->_column_span)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRFTableCell column_span](self, "column_span"));
    [v3 setObject:v5 forKeyedSubscript:@"columnSpan"];
  }
  if (self->_horizontal_alignment)
  {
    uint64_t v6 = [(_SFPBRFTableCell *)self horizontal_alignment];
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = off_1E5A2F070[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"horizontalAlignment"];
  }
  if (self->_text)
  {
    v8 = [(_SFPBRFTableCell *)self text];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"text"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"text"];
    }
  }
  if (self->_visual)
  {
    v11 = [(_SFPBRFTableCell *)self visual];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"visual"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"visual"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text hash];
  unint64_t v4 = [(_SFPBRFVisualProperty *)self->_visual hash];
  uint64_t v5 = 2654435761;
  if (!self->_applySmallCaps) {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ (2654435761 * self->_column_span) ^ (2654435761 * self->_horizontal_alignment) ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_SFPBRFTableCell *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFTableCell *)self text];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFTableCell *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFTableCell *)self visual];
  uint64_t v6 = [v4 visual];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_SFPBRFTableCell *)self visual];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFTableCell *)self visual];
    objc_super v15 = [v4 visual];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int column_span = self->_column_span;
  if (column_span == objc_msgSend(v4, "column_span"))
  {
    int horizontal_alignment = self->_horizontal_alignment;
    if (horizontal_alignment == objc_msgSend(v4, "horizontal_alignment"))
    {
      int applySmallCaps = self->_applySmallCaps;
      BOOL v17 = applySmallCaps == [v4 applySmallCaps];
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBRFTableCell *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v5 = [(_SFPBRFTableCell *)self visual];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFTableCell *)self column_span]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableCell *)self horizontal_alignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableCell *)self applySmallCaps]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableCellReadFrom(self, (uint64_t)a3);
}

- (void)setApplySmallCaps:(BOOL)a3
{
  self->_int applySmallCaps = a3;
}

- (void)setHorizontal_alignment:(int)a3
{
  self->_int horizontal_alignment = a3;
}

- (void)setColumn_span:(int)a3
{
  self->_int column_span = a3;
}

- (_SFPBRFVisualProperty)visual
{
  if (self->_whichContent == 2) {
    v2 = self->_visual;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setVisual:(id)a3
{
  id v4 = (_SFPBRFVisualProperty *)a3;
  text = self->_text;
  self->_text = 0;

  self->_whichContent = 2 * (v4 != 0);
  visual = self->_visual;
  self->_visual = v4;
}

- (_SFPBRFTextProperty)text
{
  if (self->_whichContent == 1) {
    v2 = self->_text;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setText:(id)a3
{
  id v4 = (_SFPBRFTextProperty *)a3;
  visual = self->_visual;
  self->_visual = 0;

  self->_whichContent = v4 != 0;
  text = self->_text;
  self->_text = v4;
}

@end