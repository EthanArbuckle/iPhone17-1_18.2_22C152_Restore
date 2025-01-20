@interface _SFPBPin
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSString)label;
- (NSString)pinText;
- (NSString)resultID;
- (_SFPBColor)pinColor;
- (_SFPBLatLng)location;
- (_SFPBPin)initWithDictionary:(id)a3;
- (_SFPBPin)initWithFacade:(id)a3;
- (_SFPBPin)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)pinBehavior;
- (unint64_t)hash;
- (void)setLabel:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setPinBehavior:(int)a3;
- (void)setPinColor:(id)a3;
- (void)setPinText:(id)a3;
- (void)setResultID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPin

- (_SFPBPin)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPin *)self init];
  if (v5)
  {
    v6 = [v4 location];

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      v8 = [v4 location];
      v9 = [(_SFPBLatLng *)v7 initWithFacade:v8];
      [(_SFPBPin *)v5 setLocation:v9];
    }
    v10 = [v4 pinColor];

    if (v10)
    {
      v11 = [_SFPBColor alloc];
      v12 = [v4 pinColor];
      v13 = [(_SFPBColor *)v11 initWithFacade:v12];
      [(_SFPBPin *)v5 setPinColor:v13];
    }
    v14 = [v4 label];

    if (v14)
    {
      v15 = [v4 label];
      [(_SFPBPin *)v5 setLabel:v15];
    }
    v16 = [v4 resultID];

    if (v16)
    {
      v17 = [v4 resultID];
      [(_SFPBPin *)v5 setResultID:v17];
    }
    v18 = [v4 mapsData];

    if (v18)
    {
      v19 = [v4 mapsData];
      [(_SFPBPin *)v5 setMapsData:v19];
    }
    if ([v4 hasPinBehavior]) {
      -[_SFPBPin setPinBehavior:](v5, "setPinBehavior:", [v4 pinBehavior]);
    }
    v20 = [v4 pinText];

    if (v20)
    {
      v21 = [v4 pinText];
      [(_SFPBPin *)v5 setPinText:v21];
    }
    v22 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinText, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (NSString)pinText
{
  return self->_pinText;
}

- (int)pinBehavior
{
  return self->_pinBehavior;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (NSString)resultID
{
  return self->_resultID;
}

- (NSString)label
{
  return self->_label;
}

- (_SFPBColor)pinColor
{
  return self->_pinColor;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBPin)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBPin;
  v5 = [(_SFPBPin *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBLatLng alloc] initWithDictionary:v6];
      [(_SFPBPin *)v5 setLocation:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"pinColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBColor alloc] initWithDictionary:v8];
      [(_SFPBPin *)v5 setPinColor:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBPin *)v5 setLabel:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"resultID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBPin *)v5 setResultID:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"mapsData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
      [(_SFPBPin *)v5 setMapsData:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"pinBehavior"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPin setPinBehavior:](v5, "setPinBehavior:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"pinText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBPin *)v5 setPinText:v18];
    }
    v19 = v5;
  }
  return v5;
}

- (_SFPBPin)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPin *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPin *)self dictionaryRepresentation];
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
  if (self->_label)
  {
    id v4 = [(_SFPBPin *)self label];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"label"];
  }
  if (self->_location)
  {
    v6 = [(_SFPBPin *)self location];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"location"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"location"];
    }
  }
  if (self->_mapsData)
  {
    v9 = [(_SFPBPin *)self mapsData];
    v10 = [v9 base64EncodedStringWithOptions:0];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"mapsData"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"mapsData"];
    }
  }
  if (self->_pinBehavior)
  {
    uint64_t v12 = [(_SFPBPin *)self pinBehavior];
    if (v12 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5A2F058[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"pinBehavior"];
  }
  if (self->_pinColor)
  {
    v14 = [(_SFPBPin *)self pinColor];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"pinColor"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"pinColor"];
    }
  }
  if (self->_pinText)
  {
    v17 = [(_SFPBPin *)self pinText];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"pinText"];
  }
  if (self->_resultID)
  {
    v19 = [(_SFPBPin *)self resultID];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"resultID"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBLatLng *)self->_location hash];
  unint64_t v4 = [(_SFPBColor *)self->_pinColor hash];
  NSUInteger v5 = [(NSString *)self->_label hash];
  NSUInteger v6 = [(NSString *)self->_resultID hash];
  uint64_t v7 = [(NSData *)self->_mapsData hash];
  uint64_t v8 = 2654435761 * self->_pinBehavior;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_pinText hash] ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  NSUInteger v5 = [(_SFPBPin *)self location];
  NSUInteger v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v7 = [(_SFPBPin *)self location];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_SFPBPin *)self location];
    v10 = [v4 location];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPin *)self pinColor];
  NSUInteger v6 = [v4 pinColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v12 = [(_SFPBPin *)self pinColor];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBPin *)self pinColor];
    v15 = [v4 pinColor];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPin *)self label];
  NSUInteger v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v17 = [(_SFPBPin *)self label];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBPin *)self label];
    v20 = [v4 label];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPin *)self resultID];
  NSUInteger v6 = [v4 resultID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v22 = [(_SFPBPin *)self resultID];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBPin *)self resultID];
    v25 = [v4 resultID];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPin *)self mapsData];
  NSUInteger v6 = [v4 mapsData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_32;
  }
  uint64_t v27 = [(_SFPBPin *)self mapsData];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBPin *)self mapsData];
    v30 = [v4 mapsData];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  int pinBehavior = self->_pinBehavior;
  if (pinBehavior != [v4 pinBehavior]) {
    goto LABEL_33;
  }
  NSUInteger v5 = [(_SFPBPin *)self pinText];
  NSUInteger v6 = [v4 pinText];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v33 = [(_SFPBPin *)self pinText];
  if (!v33)
  {

LABEL_36:
    BOOL v38 = 1;
    goto LABEL_34;
  }
  v34 = (void *)v33;
  v35 = [(_SFPBPin *)self pinText];
  v36 = [v4 pinText];
  char v37 = [v35 isEqual:v36];

  if (v37) {
    goto LABEL_36;
  }
LABEL_33:
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_SFPBPin *)self location];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v5 = [(_SFPBPin *)self pinColor];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v6 = [(_SFPBPin *)self label];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBPin *)self resultID];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBPin *)self mapsData];
  if (v8) {
    PBDataWriterWriteDataField();
  }

  if ([(_SFPBPin *)self pinBehavior]) {
    PBDataWriterWriteInt32Field();
  }
  v9 = [(_SFPBPin *)self pinText];
  if (v9) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPinReadFrom(self, (uint64_t)a3);
}

- (void)setPinText:(id)a3
{
  self->_pinText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPinBehavior:(int)a3
{
  self->_int pinBehavior = a3;
}

- (void)setMapsData:(id)a3
{
  self->_mapsData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setResultID:(id)a3
{
  self->_resultID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPinColor:(id)a3
{
}

- (void)setLocation:(id)a3
{
}

@end