@interface _SFPBRFPrimaryHeaderStackedImageCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)images;
- (NSData)jsonData;
- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithDictionary:(id)a3;
- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithFacade:(id)a3;
- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithJSON:(id)a3;
- (_SFPBRFTextProperty)text_1;
- (_SFPBRFTextProperty)text_2;
- (id)dictionaryRepresentation;
- (id)imagesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)imagesCount;
- (void)addImages:(id)a3;
- (void)clearImages;
- (void)setImages:(id)a3;
- (void)setText_1:(id)a3;
- (void)setText_2:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFPrimaryHeaderStackedImageCardSection

- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithFacade:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self init];
  if (v5)
  {
    v6 = [v4 text];

    if (v6)
    {
      v7 = [_SFPBRFTextProperty alloc];
      v8 = [v4 text];
      v9 = [(_SFPBRFTextProperty *)v7 initWithFacade:v8];
      [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 setText_1:v9];
    }
    v10 = [v4 text];

    if (v10)
    {
      v11 = [_SFPBRFTextProperty alloc];
      v12 = [v4 text];
      v13 = [(_SFPBRFTextProperty *)v11 initWithFacade:v12];
      [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 setText_2:v13];
    }
    v14 = [v4 images];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v16 = objc_msgSend(v4, "images", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFVisualProperty alloc] initWithFacade:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 setImages:v15];
    v22 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_text_2, 0);
  objc_storeStrong((id *)&self->_text_1, 0);
}

- (NSArray)images
{
  return self->_images;
}

- (_SFPBRFTextProperty)text_2
{
  return self->_text_2;
}

- (_SFPBRFTextProperty)text_1
{
  return self->_text_1;
}

- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_SFPBRFPrimaryHeaderStackedImageCardSection;
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFTextProperty alloc] initWithDictionary:v6];
      [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 setText_1:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"text2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFTextProperty alloc] initWithDictionary:v8];
      [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 setText_2:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"images"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v17 = [[_SFPBRFVisualProperty alloc] initWithDictionary:v16];
              [(_SFPBRFPrimaryHeaderStackedImageCardSection *)v5 addImages:v17];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v8 = v20;
      v6 = v21;
    }
    uint64_t v18 = v5;
  }
  return v5;
}

- (_SFPBRFPrimaryHeaderStackedImageCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_images count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v5 = self->_images;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"images"];
  }
  if (self->_text_1)
  {
    uint64_t v12 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
    uint64_t v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"text1"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"text1"];
    }
  }
  if (self->_text_2)
  {
    uint64_t v15 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"text2"];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"text2"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBRFTextProperty *)self->_text_1 hash];
  unint64_t v4 = [(_SFPBRFTextProperty *)self->_text_2 hash] ^ v3;
  return v4 ^ [(NSArray *)self->_images hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
    v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
    uint64_t v15 = [v4 text];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self images];
  uint64_t v6 = [v4 images];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self images];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    uint64_t v18 = (void *)v17;
    long long v19 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self images];
    long long v20 = [v4 images];
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self text];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFPrimaryHeaderStackedImageCardSection *)self images];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFPrimaryHeaderStackedImageCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)imagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_images objectAtIndexedSubscript:a3];
}

- (unint64_t)imagesCount
{
  return [(NSArray *)self->_images count];
}

- (void)addImages:(id)a3
{
  id v4 = a3;
  images = self->_images;
  id v8 = v4;
  if (!images)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_images;
    self->_images = v6;

    id v4 = v8;
    images = self->_images;
  }
  [(NSArray *)images addObject:v4];
}

- (void)clearImages
{
}

- (void)setImages:(id)a3
{
  self->_images = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setText_2:(id)a3
{
}

- (void)setText_1:(id)a3
{
}

@end