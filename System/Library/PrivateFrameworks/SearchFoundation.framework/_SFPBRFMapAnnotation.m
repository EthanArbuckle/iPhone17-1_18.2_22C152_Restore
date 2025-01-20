@interface _SFPBRFMapAnnotation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBLatLng)coordinate;
- (_SFPBRFMapAnnotation)initWithDictionary:(id)a3;
- (_SFPBRFMapAnnotation)initWithFacade:(id)a3;
- (_SFPBRFMapAnnotation)initWithJSON:(id)a3;
- (_SFPBRFMapPoint)anchor;
- (_SFPBRFTextProperty)label;
- (_SFPBRFVisualProperty)content;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAnchor:(id)a3;
- (void)setContent:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFMapAnnotation

- (_SFPBRFMapAnnotation)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFMapAnnotation *)self init];
  if (v5)
  {
    v6 = [v4 coordinate];

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      v8 = [v4 coordinate];
      v9 = [(_SFPBLatLng *)v7 initWithFacade:v8];
      [(_SFPBRFMapAnnotation *)v5 setCoordinate:v9];
    }
    v10 = [v4 content];

    if (v10)
    {
      v11 = [_SFPBRFVisualProperty alloc];
      v12 = [v4 content];
      v13 = [(_SFPBRFVisualProperty *)v11 initWithFacade:v12];
      [(_SFPBRFMapAnnotation *)v5 setContent:v13];
    }
    v14 = [v4 title];

    if (v14)
    {
      v15 = [v4 title];
      [(_SFPBRFMapAnnotation *)v5 setTitle:v15];
    }
    v16 = [v4 anchor];

    if (v16)
    {
      v17 = [_SFPBRFMapPoint alloc];
      v18 = [v4 anchor];
      v19 = [(_SFPBRFMapPoint *)v17 initWithFacade:v18];
      [(_SFPBRFMapAnnotation *)v5 setAnchor:v19];
    }
    v20 = [v4 label];

    if (v20)
    {
      v21 = [_SFPBRFTextProperty alloc];
      v22 = [v4 label];
      v23 = [(_SFPBRFTextProperty *)v21 initWithFacade:v22];
      [(_SFPBRFMapAnnotation *)v5 setLabel:v23];
    }
    v24 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (_SFPBRFTextProperty)label
{
  return self->_label;
}

- (_SFPBRFMapPoint)anchor
{
  return self->_anchor;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBRFVisualProperty)content
{
  return self->_content;
}

- (_SFPBLatLng)coordinate
{
  return self->_coordinate;
}

- (_SFPBRFMapAnnotation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBRFMapAnnotation;
  v5 = [(_SFPBRFMapAnnotation *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coordinate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBLatLng alloc] initWithDictionary:v6];
      [(_SFPBRFMapAnnotation *)v5 setCoordinate:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v8];
      [(_SFPBRFMapAnnotation *)v5 setContent:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBRFMapAnnotation *)v5 setTitle:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"anchor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBRFMapPoint alloc] initWithDictionary:v12];
      [(_SFPBRFMapAnnotation *)v5 setAnchor:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[_SFPBRFTextProperty alloc] initWithDictionary:v14];
      [(_SFPBRFMapAnnotation *)v5 setLabel:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBRFMapAnnotation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFMapAnnotation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFMapAnnotation *)self dictionaryRepresentation];
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
  if (self->_anchor)
  {
    id v4 = [(_SFPBRFMapAnnotation *)self anchor];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"anchor"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"anchor"];
    }
  }
  if (self->_content)
  {
    uint64_t v7 = [(_SFPBRFMapAnnotation *)self content];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"content"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"content"];
    }
  }
  if (self->_coordinate)
  {
    v10 = [(_SFPBRFMapAnnotation *)self coordinate];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"coordinate"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"coordinate"];
    }
  }
  if (self->_label)
  {
    v13 = [(_SFPBRFMapAnnotation *)self label];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"label"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"label"];
    }
  }
  if (self->_title)
  {
    v16 = [(_SFPBRFMapAnnotation *)self title];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBLatLng *)self->_coordinate hash];
  unint64_t v4 = [(_SFPBRFVisualProperty *)self->_content hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_title hash];
  unint64_t v6 = v4 ^ v5 ^ [(_SFPBRFMapPoint *)self->_anchor hash];
  return v6 ^ [(_SFPBRFTextProperty *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self coordinate];
  unint64_t v6 = [v4 coordinate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBRFMapAnnotation *)self coordinate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFMapAnnotation *)self coordinate];
    v10 = [v4 coordinate];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self content];
  unint64_t v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBRFMapAnnotation *)self content];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFMapAnnotation *)self content];
    v15 = [v4 content];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self title];
  unint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBRFMapAnnotation *)self title];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    v19 = [(_SFPBRFMapAnnotation *)self title];
    v20 = [v4 title];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self anchor];
  unint64_t v6 = [v4 anchor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBRFMapAnnotation *)self anchor];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBRFMapAnnotation *)self anchor];
    v25 = [v4 anchor];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self label];
  unint64_t v6 = [v4 label];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBRFMapAnnotation *)self label];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_SFPBRFMapAnnotation *)self label];
    v30 = [v4 label];
    char v31 = [v29 isEqual:v30];

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
  id v4 = [(_SFPBRFMapAnnotation *)self coordinate];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v5 = [(_SFPBRFMapAnnotation *)self content];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v6 = [(_SFPBRFMapAnnotation *)self title];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBRFMapAnnotation *)self anchor];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  v8 = [(_SFPBRFMapAnnotation *)self label];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)setLabel:(id)a3
{
}

- (void)setAnchor:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContent:(id)a3
{
}

- (void)setCoordinate:(id)a3
{
}

@end