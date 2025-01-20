@interface _SFPBDynamicURLImageResource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsResizing;
- (NSArray)imageOptions;
- (NSData)jsonData;
- (NSString)formatURL;
- (_SFPBDynamicURLImageResource)initWithDictionary:(id)a3;
- (_SFPBDynamicURLImageResource)initWithFacade:(id)a3;
- (_SFPBDynamicURLImageResource)initWithJSON:(id)a3;
- (_SFPBGraphicalFloat)pixelHeight;
- (_SFPBGraphicalFloat)pixelWidth;
- (id)dictionaryRepresentation;
- (id)imageOptionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)imageOptionsCount;
- (void)addImageOptions:(id)a3;
- (void)clearImageOptions;
- (void)setFormatURL:(id)a3;
- (void)setImageOptions:(id)a3;
- (void)setPixelHeight:(id)a3;
- (void)setPixelWidth:(id)a3;
- (void)setSupportsResizing:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDynamicURLImageResource

- (_SFPBDynamicURLImageResource)initWithFacade:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBDynamicURLImageResource *)self init];
  if (v5)
  {
    if ([v4 hasPixelWidth])
    {
      v6 = [_SFPBGraphicalFloat alloc];
      [v4 pixelWidth];
      v7 = -[_SFPBGraphicalFloat initWithCGFloat:](v6, "initWithCGFloat:");
      [(_SFPBDynamicURLImageResource *)v5 setPixelWidth:v7];
    }
    if ([v4 hasPixelHeight])
    {
      v8 = [_SFPBGraphicalFloat alloc];
      [v4 pixelHeight];
      v9 = -[_SFPBGraphicalFloat initWithCGFloat:](v8, "initWithCGFloat:");
      [(_SFPBDynamicURLImageResource *)v5 setPixelHeight:v9];
    }
    v10 = [v4 formatURL];

    if (v10)
    {
      v11 = [v4 formatURL];
      [(_SFPBDynamicURLImageResource *)v5 setFormatURL:v11];
    }
    if ([v4 hasSupportsResizing]) {
      -[_SFPBDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", [v4 supportsResizing]);
    }
    v12 = [v4 imageOptions];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v14 = objc_msgSend(v4, "imageOptions", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[_SFPBImageOption alloc] initWithFacade:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }

    [(_SFPBDynamicURLImageResource *)v5 setImageOptions:v13];
    v20 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_formatURL, 0);
  objc_storeStrong((id *)&self->_pixelHeight, 0);
  objc_storeStrong((id *)&self->_pixelWidth, 0);
}

- (NSArray)imageOptions
{
  return self->_imageOptions;
}

- (BOOL)supportsResizing
{
  return self->_supportsResizing;
}

- (NSString)formatURL
{
  return self->_formatURL;
}

- (_SFPBGraphicalFloat)pixelHeight
{
  return self->_pixelHeight;
}

- (_SFPBGraphicalFloat)pixelWidth
{
  return self->_pixelWidth;
}

- (_SFPBDynamicURLImageResource)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SFPBDynamicURLImageResource;
  v5 = [(_SFPBDynamicURLImageResource *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pixelWidth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v6];
      [(_SFPBDynamicURLImageResource *)v5 setPixelWidth:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"pixelHeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v8];
      [(_SFPBDynamicURLImageResource *)v5 setPixelHeight:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"formatURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBDynamicURLImageResource *)v5 setFormatURL:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"supportsResizing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", [v12 BOOLValue]);
    }
    id v13 = [v4 objectForKeyedSubscript:@"imageOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = v12;
      long long v24 = v8;
      long long v25 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [[_SFPBImageOption alloc] initWithDictionary:v19];
              [(_SFPBDynamicURLImageResource *)v5 addImageOptions:v20];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v16);
      }

      v8 = v24;
      v6 = v25;
      v12 = v23;
    }
    v21 = v5;
  }
  return v5;
}

- (_SFPBDynamicURLImageResource)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDynamicURLImageResource *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDynamicURLImageResource *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_formatURL)
  {
    id v4 = [(_SFPBDynamicURLImageResource *)self formatURL];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"formatURL"];
  }
  if ([(NSArray *)self->_imageOptions count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v7 = self->_imageOptions;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            id v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"imageOptions"];
  }
  if (self->_pixelHeight)
  {
    id v14 = [(_SFPBDynamicURLImageResource *)self pixelHeight];
    uint64_t v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"pixelHeight"];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"pixelHeight"];
    }
  }
  if (self->_pixelWidth)
  {
    uint64_t v17 = [(_SFPBDynamicURLImageResource *)self pixelWidth];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"pixelWidth"];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"pixelWidth"];
    }
  }
  if (self->_supportsResizing)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDynamicURLImageResource supportsResizing](self, "supportsResizing"));
    [v3 setObject:v20 forKeyedSubscript:@"supportsResizing"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBGraphicalFloat *)self->_pixelWidth hash];
  unint64_t v4 = [(_SFPBGraphicalFloat *)self->_pixelHeight hash];
  NSUInteger v5 = [(NSString *)self->_formatURL hash];
  if (self->_supportsResizing) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_imageOptions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  NSUInteger v5 = [(_SFPBDynamicURLImageResource *)self pixelWidth];
  uint64_t v6 = [v4 pixelWidth];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v7 = [(_SFPBDynamicURLImageResource *)self pixelWidth];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBDynamicURLImageResource *)self pixelWidth];
    uint64_t v10 = [v4 pixelWidth];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBDynamicURLImageResource *)self pixelHeight];
  uint64_t v6 = [v4 pixelHeight];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v12 = [(_SFPBDynamicURLImageResource *)self pixelHeight];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [(_SFPBDynamicURLImageResource *)self pixelHeight];
    uint64_t v15 = [v4 pixelHeight];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBDynamicURLImageResource *)self formatURL];
  uint64_t v6 = [v4 formatURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v17 = [(_SFPBDynamicURLImageResource *)self formatURL];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_SFPBDynamicURLImageResource *)self formatURL];
    v20 = [v4 formatURL];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int supportsResizing = self->_supportsResizing;
  if (supportsResizing != [v4 supportsResizing]) {
    goto LABEL_23;
  }
  NSUInteger v5 = [(_SFPBDynamicURLImageResource *)self imageOptions];
  uint64_t v6 = [v4 imageOptions];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v23 = [(_SFPBDynamicURLImageResource *)self imageOptions];
  if (!v23)
  {

LABEL_26:
    BOOL v28 = 1;
    goto LABEL_24;
  }
  long long v24 = (void *)v23;
  long long v25 = [(_SFPBDynamicURLImageResource *)self imageOptions];
  long long v26 = [v4 imageOptions];
  char v27 = [v25 isEqual:v26];

  if (v27) {
    goto LABEL_26;
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBDynamicURLImageResource *)self pixelWidth];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBDynamicURLImageResource *)self pixelHeight];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBDynamicURLImageResource *)self formatURL];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBDynamicURLImageResource *)self supportsResizing]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v8 = [(_SFPBDynamicURLImageResource *)self imageOptions];
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
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDynamicURLImageResourceReadFrom(self, (uint64_t)a3);
}

- (id)imageOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_imageOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)imageOptionsCount
{
  return [(NSArray *)self->_imageOptions count];
}

- (void)addImageOptions:(id)a3
{
  id v4 = a3;
  imageOptions = self->_imageOptions;
  id v8 = v4;
  if (!imageOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_imageOptions;
    self->_imageOptions = v6;

    id v4 = v8;
    imageOptions = self->_imageOptions;
  }
  [(NSArray *)imageOptions addObject:v4];
}

- (void)clearImageOptions
{
}

- (void)setImageOptions:(id)a3
{
  self->_imageOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSupportsResizing:(BOOL)a3
{
  self->_int supportsResizing = a3;
}

- (void)setFormatURL:(id)a3
{
  self->_formatURL = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPixelHeight:(id)a3
{
}

- (void)setPixelWidth:(id)a3
{
}

@end