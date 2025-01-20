@interface _SFPBRFLongItemStandardCardSection
- (BOOL)has_background_platter;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_quote;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFLongItemStandardCardSection)initWithDictionary:(id)a3;
- (_SFPBRFLongItemStandardCardSection)initWithFacade:(id)a3;
- (_SFPBRFLongItemStandardCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setHas_background_platter:(BOOL)a3;
- (void)setIs_quote:(BOOL)a3;
- (void)setText_1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFLongItemStandardCardSection

- (_SFPBRFLongItemStandardCardSection)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFLongItemStandardCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFLongItemStandardCardSection *)v5 setText_1:v9];
    }
    if (objc_msgSend(v4, "hasIs_quote")) {
      -[_SFPBRFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", objc_msgSend(v4, "is_quote"));
    }
    if (objc_msgSend(v4, "hasHas_background_platter")) {
      -[_SFPBRFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", objc_msgSend(v4, "has_background_platter"));
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)has_background_platter
{
  return self->_has_background_platter;
}

- (BOOL)is_quote
{
  return self->_is_quote;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFLongItemStandardCardSection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBRFLongItemStandardCardSection;
  v5 = [(_SFPBRFLongItemStandardCardSection *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFLongItemStandardCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isQuote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFLongItemStandardCardSection setIs_quote:](v5, "setIs_quote:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasBackgroundPlatter"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFLongItemStandardCardSection setHas_background_platter:](v5, "setHas_background_platter:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBRFLongItemStandardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFLongItemStandardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFLongItemStandardCardSection *)self dictionaryRepresentation];
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
  if (self->_has_background_platter)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFLongItemStandardCardSection has_background_platter](self, "has_background_platter"));
    [v3 setObject:v4 forKeyedSubscript:@"hasBackgroundPlatter"];
  }
  if (self->_is_quote)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFLongItemStandardCardSection is_quote](self, "is_quote"));
    [v3 setObject:v5 forKeyedSubscript:@"isQuote"];
  }
  if (self->_text_1)
  {
    v6 = [(_SFPBRFLongItemStandardCardSection *)self text];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"text1"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"text1"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  uint64_t v4 = 2654435761;
  if (self->_is_quote) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!self->_has_background_platter) {
    uint64_t v4 = 0;
  }
  return v5 ^ v3 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  uint64_t v5 = [(_SFPBRFLongItemStandardCardSection *)self text];
  v6 = [v4 text];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_10;
  }
  uint64_t v8 = [(_SFPBRFLongItemStandardCardSection *)self text];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(_SFPBRFLongItemStandardCardSection *)self text];
    v11 = [v4 text];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  int is_quote = self->_is_quote;
  if (is_quote != objc_msgSend(v4, "is_quote"))
  {
LABEL_10:
    BOOL v15 = 0;
    goto LABEL_11;
  }
  int has_background_platter = self->_has_background_platter;
  BOOL v15 = has_background_platter == objc_msgSend(v4, "has_background_platter");
LABEL_11:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBRFLongItemStandardCardSection *)self text];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFLongItemStandardCardSection *)self is_quote]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRFLongItemStandardCardSection *)self has_background_platter]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFLongItemStandardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setHas_background_platter:(BOOL)a3
{
  self->_int has_background_platter = a3;
}

- (void)setIs_quote:(BOOL)a3
{
  self->_int is_quote = a3;
}

- (void)setText_1:(id)a3
{
}

@end