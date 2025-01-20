@interface _SFPBRFPreviewList
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)previews;
- (NSData)jsonData;
- (_SFPBRFPreviewList)initWithDictionary:(id)a3;
- (_SFPBRFPreviewList)initWithFacade:(id)a3;
- (_SFPBRFPreviewList)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)previewsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)previewsCount;
- (void)addPreviews:(id)a3;
- (void)clearPreviews;
- (void)setPreviews:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFPreviewList

- (_SFPBRFPreviewList)initWithFacade:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFPreviewList *)self init];
  if (v5)
  {
    v6 = [v4 previews];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "previews", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFPreview alloc] initWithFacade:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(_SFPBRFPreviewList *)v5 setPreviews:v7];
    v14 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)previews
{
  return self->_previews;
}

- (_SFPBRFPreviewList)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFPBRFPreviewList;
  v5 = [(_SFPBRFPreviewList *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"previews"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [_SFPBRFPreview alloc];
              v14 = -[_SFPBRFPreview initWithDictionary:](v13, "initWithDictionary:", v12, (void)v17);
              [(_SFPBRFPreviewList *)v5 addPreviews:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v9);
      }
    }
    v15 = v5;
  }
  return v5;
}

- (_SFPBRFPreviewList)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFPreviewList *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFPreviewList *)self dictionaryRepresentation];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_previews count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_previews;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"previews"];
  }
  return v3;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_previews hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFPreviewList *)self previews];
    uint64_t v6 = [v4 previews];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFPreviewList *)self previews];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(_SFPBRFPreviewList *)self previews];
      uint64_t v11 = [v4 previews];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFPreviewList *)self previews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPreviewListReadFrom(self, (uint64_t)a3);
}

- (id)previewsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_previews objectAtIndexedSubscript:a3];
}

- (unint64_t)previewsCount
{
  return [(NSArray *)self->_previews count];
}

- (void)addPreviews:(id)a3
{
  id v4 = a3;
  previews = self->_previews;
  id v8 = v4;
  if (!previews)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_previews;
    self->_previews = v6;

    id v4 = v8;
    previews = self->_previews;
  }
  [(NSArray *)previews addObject:v4];
}

- (void)clearPreviews
{
}

- (void)setPreviews:(id)a3
{
  self->_previews = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end