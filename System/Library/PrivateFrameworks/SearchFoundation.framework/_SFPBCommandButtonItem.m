@interface _SFPBCommandButtonItem
- (BOOL)isDestructive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)previewButtonItems;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBCommand)command;
- (_SFPBCommandButtonItem)initWithDictionary:(id)a3;
- (_SFPBCommandButtonItem)initWithFacade:(id)a3;
- (_SFPBCommandButtonItem)initWithJSON:(id)a3;
- (_SFPBImage)image;
- (id)dictionaryRepresentation;
- (id)previewButtonItemsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)previewButtonItemsCount;
- (unint64_t)uniqueId;
- (void)addPreviewButtonItems:(id)a3;
- (void)clearPreviewButtonItems;
- (void)setCommand:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsDestructive:(BOOL)a3;
- (void)setPreviewButtonItems:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCommandButtonItem

- (_SFPBCommandButtonItem)initWithFacade:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCommandButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 image];

    if (v6)
    {
      v7 = [_SFPBImage alloc];
      v8 = [v4 image];
      v9 = [(_SFPBImage *)v7 initWithFacade:v8];
      [(_SFPBCommandButtonItem *)v5 setImage:v9];
    }
    v10 = [v4 title];

    if (v10)
    {
      v11 = [v4 title];
      [(_SFPBCommandButtonItem *)v5 setTitle:v11];
    }
    v12 = [v4 command];

    if (v12)
    {
      v13 = [_SFPBCommand alloc];
      v14 = [v4 command];
      v15 = [(_SFPBCommand *)v13 initWithFacade:v14];
      [(_SFPBCommandButtonItem *)v5 setCommand:v15];
    }
    v16 = [v4 previewButtonItems];
    if (v16) {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v17 = 0;
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18 = objc_msgSend(v4, "previewButtonItems", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [(_SFPBCommandButtonItem *)v5 setPreviewButtonItems:v17];
    if ([v4 hasIsDestructive]) {
      -[_SFPBCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", [v4 isDestructive]);
    }
    if ([v4 hasUniqueId]) {
      -[_SFPBCommandButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v24 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (_SFPBCommand)command
{
  return self->_command;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (_SFPBCommandButtonItem)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SFPBCommandButtonItem;
  v5 = [(_SFPBCommandButtonItem *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBImage alloc] initWithDictionary:v6];
      [(_SFPBCommandButtonItem *)v5 setImage:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBCommandButtonItem *)v5 setTitle:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"command"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBCommand alloc] initWithDictionary:v10];
      [(_SFPBCommandButtonItem *)v5 setCommand:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"previewButtonItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v10;
      v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [[_SFPBButtonItem alloc] initWithDictionary:v18];
              [(_SFPBCommandButtonItem *)v5 addPreviewButtonItems:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v15);
      }

      v6 = v25;
      v10 = v24;
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"isDestructive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCommandButtonItem setIsDestructive:](v5, "setIsDestructive:", [v20 BOOLValue]);
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCommandButtonItem setUniqueId:](v5, "setUniqueId:", [v21 unsignedLongLongValue]);
    }
    v22 = v5;
  }
  return v5;
}

- (_SFPBCommandButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCommandButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCommandButtonItem *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_command)
  {
    id v4 = [(_SFPBCommandButtonItem *)self command];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"command"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"command"];
    }
  }
  if (self->_image)
  {
    uint64_t v7 = [(_SFPBCommandButtonItem *)self image];
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
  if (self->_isDestructive)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCommandButtonItem isDestructive](self, "isDestructive"));
    [v3 setObject:v10 forKeyedSubscript:@"isDestructive"];
  }
  if ([(NSArray *)self->_previewButtonItems count])
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = self->_previewButtonItems;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"previewButtonItems"];
  }
  if (self->_title)
  {
    uint64_t v19 = [(_SFPBCommandButtonItem *)self title];
    uint64_t v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"title"];
  }
  if (self->_uniqueId)
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBCommandButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v21 forKeyedSubscript:@"uniqueId"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBImage *)self->_image hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  unint64_t v5 = [(_SFPBCommand *)self->_command hash];
  uint64_t v6 = [(NSArray *)self->_previewButtonItems hash];
  if (self->_isDestructive) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_SFPBCommandButtonItem *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_SFPBCommandButtonItem *)self image];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBCommandButtonItem *)self image];
    v10 = [v4 image];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommandButtonItem *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_SFPBCommandButtonItem *)self title];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBCommandButtonItem *)self title];
    uint64_t v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommandButtonItem *)self command];
  uint64_t v6 = [v4 command];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_SFPBCommandButtonItem *)self command];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBCommandButtonItem *)self command];
    uint64_t v20 = [v4 command];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBCommandButtonItem *)self previewButtonItems];
  uint64_t v6 = [v4 previewButtonItems];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(_SFPBCommandButtonItem *)self previewButtonItems];
  if (v22)
  {
    long long v23 = (void *)v22;
    long long v24 = [(_SFPBCommandButtonItem *)self previewButtonItems];
    long long v25 = [v4 previewButtonItems];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int isDestructive = self->_isDestructive;
  if (isDestructive == [v4 isDestructive])
  {
    unint64_t uniqueId = self->_uniqueId;
    BOOL v27 = uniqueId == [v4 uniqueId];
    goto LABEL_23;
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBCommandButtonItem *)self image];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBCommandButtonItem *)self title];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBCommandButtonItem *)self command];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  v8 = [(_SFPBCommandButtonItem *)self previewButtonItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ([(_SFPBCommandButtonItem *)self isDestructive]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCommandButtonItem *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCommandButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (void)setIsDestructive:(BOOL)a3
{
  self->_int isDestructive = a3;
}

- (id)previewButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_previewButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)previewButtonItemsCount
{
  return [(NSArray *)self->_previewButtonItems count];
}

- (void)addPreviewButtonItems:(id)a3
{
  id v4 = a3;
  previewButtonItems = self->_previewButtonItems;
  id v8 = v4;
  if (!previewButtonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_previewButtonItems;
    self->_previewButtonItems = v6;

    id v4 = v8;
    previewButtonItems = self->_previewButtonItems;
  }
  [(NSArray *)previewButtonItems addObject:v4];
}

- (void)clearPreviewButtonItems
{
}

- (void)setPreviewButtonItems:(id)a3
{
  self->_previewButtonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCommand:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setImage:(id)a3
{
}

@end