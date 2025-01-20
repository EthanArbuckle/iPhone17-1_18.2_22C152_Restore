@interface _SFPBPlayWatchListItemButtonItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBImage)image;
- (_SFPBPlayWatchListItemButtonItem)initWithDictionary:(id)a3;
- (_SFPBPlayWatchListItemButtonItem)initWithFacade:(id)a3;
- (_SFPBPlayWatchListItemButtonItem)initWithJSON:(id)a3;
- (_SFPBWatchListItem)watchListItem;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)setWatchListItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPlayWatchListItemButtonItem

- (_SFPBPlayWatchListItemButtonItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPlayWatchListItemButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 watchListItem];

    if (v6)
    {
      v7 = [_SFPBWatchListItem alloc];
      v8 = [v4 watchListItem];
      v9 = [(_SFPBWatchListItem *)v7 initWithFacade:v8];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setWatchListItem:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      v11 = [v4 title];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setTitle:v11];
    }
    v12 = [v4 image];

    if (v12)
    {
      v13 = [_SFPBImage alloc];
      v14 = [v4 image];
      v15 = [(_SFPBImage *)v13 initWithFacade:v14];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setImage:v15];
    }
    if ([v4 hasUniqueId]) {
      -[_SFPBPlayWatchListItemButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (_SFPBPlayWatchListItemButtonItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFPBPlayWatchListItemButtonItem;
  v5 = [(_SFPBPlayWatchListItemButtonItem *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"watchListItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBWatchListItem alloc] initWithDictionary:v6];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setWatchListItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setTitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBImage alloc] initWithDictionary:v10];
      [(_SFPBPlayWatchListItemButtonItem *)v5 setImage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPlayWatchListItemButtonItem setUniqueId:](v5, "setUniqueId:", [v12 unsignedLongLongValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (_SFPBPlayWatchListItemButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPlayWatchListItemButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPlayWatchListItemButtonItem *)self dictionaryRepresentation];
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
  if (self->_image)
  {
    id v4 = [(_SFPBPlayWatchListItemButtonItem *)self image];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"image"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"image"];
    }
  }
  if (self->_title)
  {
    uint64_t v7 = [(_SFPBPlayWatchListItemButtonItem *)self title];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"title"];
  }
  if (self->_uniqueId)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBPlayWatchListItemButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v9 forKeyedSubscript:@"uniqueId"];
  }
  if (self->_watchListItem)
  {
    v10 = [(_SFPBPlayWatchListItemButtonItem *)self watchListItem];
    v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"watchListItem"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"watchListItem"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBWatchListItem *)self->_watchListItem hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  return v4 ^ v3 ^ [(_SFPBImage *)self->_image hash] ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBPlayWatchListItemButtonItem *)self watchListItem];
  v6 = [v4 watchListItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBPlayWatchListItemButtonItem *)self watchListItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBPlayWatchListItemButtonItem *)self watchListItem];
    v10 = [v4 watchListItem];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBPlayWatchListItemButtonItem *)self title];
  v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBPlayWatchListItemButtonItem *)self title];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBPlayWatchListItemButtonItem *)self title];
    objc_super v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBPlayWatchListItemButtonItem *)self image];
  v6 = [v4 image];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBPlayWatchListItemButtonItem *)self image];
    if (!v17)
    {

LABEL_20:
      unint64_t uniqueId = self->_uniqueId;
      BOOL v22 = uniqueId == [v4 uniqueId];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBPlayWatchListItemButtonItem *)self image];
    v20 = [v4 image];
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
  id v9 = a3;
  id v4 = [(_SFPBPlayWatchListItemButtonItem *)self watchListItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  v5 = [(_SFPBPlayWatchListItemButtonItem *)self title];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBPlayWatchListItemButtonItem *)self image];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v7 = [(_SFPBPlayWatchListItemButtonItem *)self uniqueId];
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteUint64Field();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPlayWatchListItemButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (void)setImage:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setWatchListItem:(id)a3
{
}

@end