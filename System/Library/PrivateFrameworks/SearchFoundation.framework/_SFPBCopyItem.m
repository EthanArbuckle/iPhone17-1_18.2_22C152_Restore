@interface _SFPBCopyItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBContactCopyItem)contactCopyItem;
- (_SFPBCopyItem)initWithDictionary:(id)a3;
- (_SFPBCopyItem)initWithFacade:(id)a3;
- (_SFPBCopyItem)initWithJSON:(id)a3;
- (_SFPBCoreSpotlightCopyItem)spotlightCopyItem;
- (_SFPBImageCopyItem)imageCopyItem;
- (_SFPBTextCopyItem)textCopyItem;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichValue;
- (void)setContactCopyItem:(id)a3;
- (void)setImageCopyItem:(id)a3;
- (void)setSpotlightCopyItem:(id)a3;
- (void)setTextCopyItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCopyItem

- (_SFPBCopyItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBCopyItem *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [[_SFPBTextCopyItem alloc] initWithFacade:v4];
      [(_SFPBCopyItem *)v5 setTextCopyItem:v6];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBCoreSpotlightCopyItem alloc] initWithFacade:v4];
      [(_SFPBCopyItem *)v5 setSpotlightCopyItem:v7];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[_SFPBImageCopyItem alloc] initWithFacade:v4];
      [(_SFPBCopyItem *)v5 setImageCopyItem:v8];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBContactCopyItem alloc] initWithFacade:v4];
      [(_SFPBCopyItem *)v5 setContactCopyItem:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCopyItem, 0);
  objc_storeStrong((id *)&self->_imageCopyItem, 0);
  objc_storeStrong((id *)&self->_spotlightCopyItem, 0);
  objc_storeStrong((id *)&self->_textCopyItem, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (_SFPBCopyItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBCopyItem;
  v5 = [(_SFPBCopyItem *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"textCopyItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBTextCopyItem alloc] initWithDictionary:v6];
      [(_SFPBCopyItem *)v5 setTextCopyItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"spotlightCopyItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBCoreSpotlightCopyItem alloc] initWithDictionary:v8];
      [(_SFPBCopyItem *)v5 setSpotlightCopyItem:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"imageCopyItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBImageCopyItem alloc] initWithDictionary:v10];
      [(_SFPBCopyItem *)v5 setImageCopyItem:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"contactCopyItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[_SFPBContactCopyItem alloc] initWithDictionary:v12];
      [(_SFPBCopyItem *)v5 setContactCopyItem:v13];
    }
    v14 = v5;
  }
  return v5;
}

- (_SFPBCopyItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCopyItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCopyItem *)self dictionaryRepresentation];
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
  if (self->_contactCopyItem)
  {
    id v4 = [(_SFPBCopyItem *)self contactCopyItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contactCopyItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contactCopyItem"];
    }
  }
  if (self->_imageCopyItem)
  {
    uint64_t v7 = [(_SFPBCopyItem *)self imageCopyItem];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"imageCopyItem"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"imageCopyItem"];
    }
  }
  if (self->_spotlightCopyItem)
  {
    v10 = [(_SFPBCopyItem *)self spotlightCopyItem];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"spotlightCopyItem"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"spotlightCopyItem"];
    }
  }
  if (self->_textCopyItem)
  {
    v13 = [(_SFPBCopyItem *)self textCopyItem];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"textCopyItem"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"textCopyItem"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBTextCopyItem *)self->_textCopyItem hash];
  unint64_t v4 = [(_SFPBCoreSpotlightCopyItem *)self->_spotlightCopyItem hash] ^ v3;
  unint64_t v5 = [(_SFPBImageCopyItem *)self->_imageCopyItem hash];
  return v4 ^ v5 ^ [(_SFPBContactCopyItem *)self->_contactCopyItem hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_SFPBCopyItem *)self textCopyItem];
  v6 = [v4 textCopyItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBCopyItem *)self textCopyItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBCopyItem *)self textCopyItem];
    v10 = [v4 textCopyItem];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCopyItem *)self spotlightCopyItem];
  v6 = [v4 spotlightCopyItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBCopyItem *)self spotlightCopyItem];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBCopyItem *)self spotlightCopyItem];
    v15 = [v4 spotlightCopyItem];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCopyItem *)self imageCopyItem];
  v6 = [v4 imageCopyItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBCopyItem *)self imageCopyItem];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBCopyItem *)self imageCopyItem];
    v20 = [v4 imageCopyItem];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCopyItem *)self contactCopyItem];
  v6 = [v4 contactCopyItem];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_SFPBCopyItem *)self contactCopyItem];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_SFPBCopyItem *)self contactCopyItem];
    v25 = [v4 contactCopyItem];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_SFPBCopyItem *)self textCopyItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v5 = [(_SFPBCopyItem *)self spotlightCopyItem];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBCopyItem *)self imageCopyItem];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBCopyItem *)self contactCopyItem];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCopyItemReadFrom(self, (uint64_t)a3);
}

- (_SFPBContactCopyItem)contactCopyItem
{
  if (self->_whichValue == 4) {
    v2 = self->_contactCopyItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContactCopyItem:(id)a3
{
  id v4 = (_SFPBContactCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  self->_whichValue = 4 * (v4 != 0);
  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = v4;
}

- (_SFPBImageCopyItem)imageCopyItem
{
  if (self->_whichValue == 3) {
    v2 = self->_imageCopyItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setImageCopyItem:(id)a3
{
  id v4 = (_SFPBImageCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_whichValue = v8;
  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = v4;
}

- (_SFPBCoreSpotlightCopyItem)spotlightCopyItem
{
  if (self->_whichValue == 2) {
    v2 = self->_spotlightCopyItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSpotlightCopyItem:(id)a3
{
  id v4 = (_SFPBCoreSpotlightCopyItem *)a3;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  self->_whichValue = 2 * (v4 != 0);
  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = v4;
}

- (_SFPBTextCopyItem)textCopyItem
{
  if (self->_whichValue == 1) {
    v2 = self->_textCopyItem;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTextCopyItem:(id)a3
{
  id v4 = (_SFPBTextCopyItem *)a3;
  spotlightCopyItem = self->_spotlightCopyItem;
  self->_spotlightCopyItem = 0;

  imageCopyItem = self->_imageCopyItem;
  self->_imageCopyItem = 0;

  contactCopyItem = self->_contactCopyItem;
  self->_contactCopyItem = 0;

  self->_whichValue = v4 != 0;
  textCopyItem = self->_textCopyItem;
  self->_textCopyItem = v4;
}

@end