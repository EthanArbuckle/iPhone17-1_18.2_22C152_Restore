@interface _SFPBShareItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBCoreSpotlightShareItem)spotlightShareItem;
- (_SFPBShareItem)initWithDictionary:(id)a3;
- (_SFPBShareItem)initWithFacade:(id)a3;
- (_SFPBShareItem)initWithJSON:(id)a3;
- (_SFPBURLShareItem)urlShareItem;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setSpotlightShareItem:(id)a3;
- (void)setUrlShareItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBShareItem

- (_SFPBShareItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBShareItem *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [[_SFPBURLShareItem alloc] initWithFacade:v4];
      [(_SFPBShareItem *)v5 setUrlShareItem:v6];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCoreSpotlightShareItem alloc] initWithFacade:v4];
      [(_SFPBShareItem *)v5 setSpotlightShareItem:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightShareItem, 0);
  objc_storeStrong((id *)&self->_urlShareItem, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (_SFPBShareItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SFPBShareItem;
  v5 = [(_SFPBShareItem *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"urlShareItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBURLShareItem alloc] initWithDictionary:v6];
      [(_SFPBShareItem *)v5 setUrlShareItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"spotlightShareItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBCoreSpotlightShareItem alloc] initWithDictionary:v8];
      [(_SFPBShareItem *)v5 setSpotlightShareItem:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (_SFPBShareItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBShareItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBShareItem *)self dictionaryRepresentation];
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
  if (self->_spotlightShareItem)
  {
    id v4 = [(_SFPBShareItem *)self spotlightShareItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"spotlightShareItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"spotlightShareItem"];
    }
  }
  if (self->_urlShareItem)
  {
    uint64_t v7 = [(_SFPBShareItem *)self urlShareItem];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"urlShareItem"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"urlShareItem"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBURLShareItem *)self->_urlShareItem hash];
  return [(_SFPBCoreSpotlightShareItem *)self->_spotlightShareItem hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBShareItem *)self urlShareItem];
  v6 = [v4 urlShareItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBShareItem *)self urlShareItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBShareItem *)self urlShareItem];
    v10 = [v4 urlShareItem];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBShareItem *)self spotlightShareItem];
  v6 = [v4 spotlightShareItem];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBShareItem *)self spotlightShareItem];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_SFPBShareItem *)self spotlightShareItem];
    v15 = [v4 spotlightShareItem];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBShareItem *)self urlShareItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBShareItem *)self spotlightShareItem];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShareItemReadFrom(self, (uint64_t)a3);
}

- (_SFPBCoreSpotlightShareItem)spotlightShareItem
{
  if (self->_whichValue == 2) {
    v2 = self->_spotlightShareItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpotlightShareItem:(id)a3
{
  id v4 = (_SFPBCoreSpotlightShareItem *)a3;
  urlShareItem = self->_urlShareItem;
  self->_urlShareItem = 0;

  self->_whichValue = 2 * (v4 != 0);
  spotlightShareItem = self->_spotlightShareItem;
  self->_spotlightShareItem = v4;
}

- (_SFPBURLShareItem)urlShareItem
{
  if (self->_whichValue == 1) {
    v2 = self->_urlShareItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUrlShareItem:(id)a3
{
  id v4 = (_SFPBURLShareItem *)a3;
  spotlightShareItem = self->_spotlightShareItem;
  self->_spotlightShareItem = 0;

  self->_whichValue = v4 != 0;
  urlShareItem = self->_urlShareItem;
  self->_urlShareItem = v4;
}

@end