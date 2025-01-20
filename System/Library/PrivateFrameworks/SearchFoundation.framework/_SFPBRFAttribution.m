@interface _SFPBRFAttribution
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)locale;
- (NSString)localized_index;
- (NSString)localized_separator;
- (_SFPBCommandReference)commandReference;
- (_SFPBRFAttribution)initWithDictionary:(id)a3;
- (_SFPBRFAttribution)initWithFacade:(id)a3;
- (_SFPBRFAttribution)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)subtitle;
- (_SFPBRFTextProperty)title;
- (_SFPBRFVisualProperty)image;
- (id)dictionaryRepresentation;
- (int)index;
- (unint64_t)hash;
- (void)setCommandReference:(id)a3;
- (void)setImage:(id)a3;
- (void)setIndex:(int)a3;
- (void)setLocale:(id)a3;
- (void)setLocalized_index:(id)a3;
- (void)setLocalized_separator:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFAttribution

- (_SFPBRFAttribution)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFAttribution *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 title];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFAttribution *)v5 setTitle:v9];
    }
    v10 = [v4 subtitle];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 subtitle];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFAttribution *)v5 setSubtitle:v13];
    }
    v14 = [v4 image];

    if (v14)
    {
      v15 = [_SFPBRFVisualProperty alloc];
      v16 = [v4 image];
      v17 = [(_SFPBRFVisualProperty *)v15 initWithFacade:v16];
      [(_SFPBRFAttribution *)v5 setImage:v17];
    }
    v18 = [v4 index];

    if (v18)
    {
      v19 = [v4 index];
      -[_SFPBRFAttribution setIndex:](v5, "setIndex:", [v19 intValue]);
    }
    v20 = objc_msgSend(v4, "localized_index");

    if (v20)
    {
      v21 = objc_msgSend(v4, "localized_index");
      [(_SFPBRFAttribution *)v5 setLocalized_index:v21];
    }
    v22 = objc_msgSend(v4, "localized_separator");

    if (v22)
    {
      v23 = objc_msgSend(v4, "localized_separator");
      [(_SFPBRFAttribution *)v5 setLocalized_separator:v23];
    }
    v24 = [v4 locale];

    if (v24)
    {
      v25 = [v4 locale];
      [(_SFPBRFAttribution *)v5 setLocale:v25];
    }
    v26 = [v4 commandReference];

    if (v26)
    {
      v27 = [_SFPBCommandReference alloc];
      v28 = [v4 commandReference];
      v29 = [(_SFPBCommandReference *)v27 initWithFacade:v28];
      [(_SFPBRFAttribution *)v5 setCommandReference:v29];
    }
    v30 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandReference, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localized_separator, 0);
  objc_storeStrong((id *)&self->_localized_index, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (_SFPBCommandReference)commandReference
{
  return self->_commandReference;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)localized_separator
{
  return self->_localized_separator;
}

- (NSString)localized_index
{
  return self->_localized_index;
}

- (int)index
{
  return self->_index;
}

- (_SFPBRFVisualProperty)image
{
  return self->_image;
}

- (_SFPBRFTextProperty)subtitle
{
  return self->_subtitle;
}

- (_SFPBRFTextProperty)title
{
  return self->_title;
}

- (_SFPBRFAttribution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SFPBRFAttribution;
  v5 = [(_SFPBRFAttribution *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFAttribution *)v5 setTitle:v7];
    }
    v23 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFAttribution *)v5 setSubtitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v10];
      [(_SFPBRFAttribution *)v5 setImage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFAttribution setIndex:](v5, "setIndex:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"localizedIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(_SFPBRFAttribution *)v5 setLocalized_index:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"localizedSeparator"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBRFAttribution *)v5 setLocalized_separator:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBRFAttribution *)v5 setLocale:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"commandReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBCommandReference alloc] initWithDictionary:v19];
      [(_SFPBRFAttribution *)v5 setCommandReference:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (_SFPBRFAttribution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFAttribution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFAttribution *)self dictionaryRepresentation];
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
  if (self->_commandReference)
  {
    id v4 = [(_SFPBRFAttribution *)self commandReference];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"commandReference"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"commandReference"];
    }
  }
  if (self->_image)
  {
    uint64_t v7 = [(_SFPBRFAttribution *)self image];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"image"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"image"];
    }
  }
  if (self->_index)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRFAttribution index](self, "index"));
    [v3 setObject:v10 forKeyedSubscript:@"index"];
  }
  if (self->_locale)
  {
    v11 = [(_SFPBRFAttribution *)self locale];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"locale"];
  }
  if (self->_localized_index)
  {
    v13 = [(_SFPBRFAttribution *)self localized_index];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"localizedIndex"];
  }
  if (self->_localized_separator)
  {
    v15 = [(_SFPBRFAttribution *)self localized_separator];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"localizedSeparator"];
  }
  if (self->_subtitle)
  {
    v17 = [(_SFPBRFAttribution *)self subtitle];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"subtitle"];
    }
  }
  if (self->_title)
  {
    v20 = [(_SFPBRFAttribution *)self title];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"title"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"title"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_title hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_subtitle hash];
  unint64_t v5 = [(_SFPBRFVisualProperty *)self->_image hash];
  uint64_t v6 = 2654435761 * self->_index;
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_localized_index hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_localized_separator hash] ^ v6;
  NSUInteger v9 = [(NSString *)self->_locale hash];
  return v8 ^ v9 ^ [(_SFPBCommandReference *)self->_commandReference hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v7 = [(_SFPBRFAttribution *)self title];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBRFAttribution *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v12 = [(_SFPBRFAttribution *)self subtitle];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBRFAttribution *)self subtitle];
    v15 = [v4 subtitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v17 = [(_SFPBRFAttribution *)self image];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBRFAttribution *)self image];
    v20 = [v4 image];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  int index = self->_index;
  if (index != [v4 index]) {
    goto LABEL_38;
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self localized_index];
  uint64_t v6 = objc_msgSend(v4, "localized_index");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(_SFPBRFAttribution *)self localized_index];
  if (v23)
  {
    objc_super v24 = (void *)v23;
    v25 = [(_SFPBRFAttribution *)self localized_index];
    v26 = objc_msgSend(v4, "localized_index");
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self localized_separator];
  uint64_t v6 = objc_msgSend(v4, "localized_separator");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(_SFPBRFAttribution *)self localized_separator];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(_SFPBRFAttribution *)self localized_separator];
    v31 = objc_msgSend(v4, "localized_separator");
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self locale];
  uint64_t v6 = [v4 locale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(_SFPBRFAttribution *)self locale];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_SFPBRFAttribution *)self locale];
    v36 = [v4 locale];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFAttribution *)self commandReference];
  uint64_t v6 = [v4 commandReference];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_37:

    goto LABEL_38;
  }
  uint64_t v38 = [(_SFPBRFAttribution *)self commandReference];
  if (!v38)
  {

LABEL_41:
    BOOL v43 = 1;
    goto LABEL_39;
  }
  v39 = (void *)v38;
  v40 = [(_SFPBRFAttribution *)self commandReference];
  v41 = [v4 commandReference];
  char v42 = [v40 isEqual:v41];

  if (v42) {
    goto LABEL_41;
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFPBRFAttribution *)self title];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBRFAttribution *)self subtitle];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFAttribution *)self image];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFAttribution *)self index]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_SFPBRFAttribution *)self localized_index];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBRFAttribution *)self localized_separator];
  if (v8) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v9 = [(_SFPBRFAttribution *)self locale];
  if (v9) {
    PBDataWriterWriteStringField();
  }

  v10 = [(_SFPBRFAttribution *)self commandReference];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFAttributionReadFrom(self, (uint64_t)a3);
}

- (void)setCommandReference:(id)a3
{
}

- (void)setLocale:(id)a3
{
  self->_locale = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalized_separator:(id)a3
{
  self->_localized_separator = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalized_index:(id)a3
{
  self->_localized_int index = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIndex:(int)a3
{
  self->_int index = a3;
}

- (void)setImage:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

@end