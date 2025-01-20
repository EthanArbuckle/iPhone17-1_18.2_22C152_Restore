@interface _SFPBRFMapMarkerText
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBLatLng)coordinate;
- (_SFPBRFMapMarkerText)initWithDictionary:(id)a3;
- (_SFPBRFMapMarkerText)initWithFacade:(id)a3;
- (_SFPBRFMapMarkerText)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)monogram;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCoordinate:(id)a3;
- (void)setMonogram:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFMapMarkerText

- (_SFPBRFMapMarkerText)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFMapMarkerText *)self init];
  if (v5)
  {
    v6 = [v4 coordinate];

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      v8 = [v4 coordinate];
      v9 = [(_SFPBLatLng *)v7 initWithFacade:v8];
      [(_SFPBRFMapMarkerText *)v5 setCoordinate:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      v11 = [v4 title];
      [(_SFPBRFMapMarkerText *)v5 setTitle:v11];
    }
    v12 = [v4 monogram];

    if (v12)
    {
      v13 = [_SFPBRFTextProperty alloc];
      v14 = [v4 monogram];
      v15 = [(_SFPBRFTextProperty *)v13 initWithFacade:v14];
      [(_SFPBRFMapMarkerText *)v5 setMonogram:v15];
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

- (_SFPBRFTextProperty)monogram
{
  return self->_monogram;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBLatLng)coordinate
{
  return self->_coordinate;
}

- (_SFPBRFMapMarkerText)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBRFMapMarkerText;
  v5 = [(_SFPBRFMapMarkerText *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coordinate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBLatLng alloc] initWithDictionary:v6];
      [(_SFPBRFMapMarkerText *)v5 setCoordinate:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBRFMapMarkerText *)v5 setTitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"monogram"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFTextProperty alloc] initWithDictionary:v10];
      [(_SFPBRFMapMarkerText *)v5 setMonogram:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBRFMapMarkerText)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFMapMarkerText *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFMapMarkerText *)self dictionaryRepresentation];
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
  if (self->_coordinate)
  {
    id v4 = [(_SFPBRFMapMarkerText *)self coordinate];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"coordinate"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"coordinate"];
    }
  }
  if (self->_monogram)
  {
    uint64_t v7 = [(_SFPBRFMapMarkerText *)self monogram];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"monogram"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"monogram"];
    }
  }
  if (self->_title)
  {
    v10 = [(_SFPBRFMapMarkerText *)self title];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBLatLng *)self->_coordinate hash];
  NSUInteger v4 = [(NSString *)self->_title hash] ^ v3;
  return v4 ^ [(_SFPBRFTextProperty *)self->_monogram hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBRFMapMarkerText *)self coordinate];
  v6 = [v4 coordinate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBRFMapMarkerText *)self coordinate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFMapMarkerText *)self coordinate];
    v10 = [v4 coordinate];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFMapMarkerText *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBRFMapMarkerText *)self title];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(_SFPBRFMapMarkerText *)self title];
    v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFMapMarkerText *)self monogram];
  v6 = [v4 monogram];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBRFMapMarkerText *)self monogram];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBRFMapMarkerText *)self monogram];
    v20 = [v4 monogram];
    char v21 = [v19 isEqual:v20];

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
  id v4 = [(_SFPBRFMapMarkerText *)self coordinate];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBRFMapMarkerText *)self title];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBRFMapMarkerText *)self monogram];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapMarkerTextReadFrom(self, (uint64_t)a3);
}

- (void)setMonogram:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCoordinate:(id)a3
{
}

@end