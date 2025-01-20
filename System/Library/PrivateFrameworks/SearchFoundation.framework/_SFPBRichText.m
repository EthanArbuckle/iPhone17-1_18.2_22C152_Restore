@interface _SFPBRichText
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)formattedTextPieces;
- (NSArray)icons;
- (NSData)jsonData;
- (NSString)contentAdvisory;
- (_SFPBGraphicalFloat)starRating;
- (_SFPBRichText)initWithDictionary:(id)a3;
- (_SFPBRichText)initWithFacade:(id)a3;
- (_SFPBRichText)initWithJSON:(id)a3;
- (_SFPBText)text;
- (id)dictionaryRepresentation;
- (id)formattedTextPiecesAtIndex:(unint64_t)a3;
- (id)iconsAtIndex:(unint64_t)a3;
- (unint64_t)formattedTextPiecesCount;
- (unint64_t)hash;
- (unint64_t)iconsCount;
- (void)addFormattedTextPieces:(id)a3;
- (void)addIcons:(id)a3;
- (void)clearFormattedTextPieces;
- (void)clearIcons;
- (void)setContentAdvisory:(id)a3;
- (void)setFormattedTextPieces:(id)a3;
- (void)setIcons:(id)a3;
- (void)setStarRating:(id)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRichText

- (_SFPBRichText)initWithFacade:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRichText *)self init];
  if (v5)
  {
    v6 = [[_SFPBText alloc] initWithFacade:v4];
    [(_SFPBRichText *)v5 setText:v6];

    if ([v4 hasStarRating])
    {
      v7 = [_SFPBGraphicalFloat alloc];
      [v4 starRating];
      v8 = -[_SFPBGraphicalFloat initWithCGFloat:](v7, "initWithCGFloat:");
      [(_SFPBRichText *)v5 setStarRating:v8];
    }
    v9 = [v4 contentAdvisory];

    if (v9)
    {
      v10 = [v4 contentAdvisory];
      [(_SFPBRichText *)v5 setContentAdvisory:v10];
    }
    v11 = [v4 icons];
    if (v11) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v12 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v13 = [v4 icons];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[_SFPBImage alloc] initWithFacade:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          if (v18) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);
    }

    [(_SFPBRichText *)v5 setIcons:v12];
    v19 = [v4 formattedTextPieces];
    if (v19) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v20 = 0;
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v21 = objc_msgSend(v4, "formattedTextPieces", 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [[_SFPBFormattedText alloc] initWithFacade:*(void *)(*((void *)&v29 + 1) + 8 * j)];
          if (v26) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }

    [(_SFPBRichText *)v5 setFormattedTextPieces:v20];
    v27 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedTextPieces, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSArray)formattedTextPieces
{
  return self->_formattedTextPieces;
}

- (NSArray)icons
{
  return self->_icons;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (_SFPBGraphicalFloat)starRating
{
  return self->_starRating;
}

- (_SFPBText)text
{
  return self->_text;
}

- (_SFPBRichText)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBRichText;
  v5 = [(_SFPBRichText *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBText alloc] initWithDictionary:v6];
      [(_SFPBRichText *)v5 setText:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"starRating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v8];
      [(_SFPBRichText *)v5 setStarRating:v9];
    }
    long long v34 = (void *)v8;
    v10 = [v4 objectForKeyedSubscript:@"contentAdvisory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = v6;
      id v12 = (void *)[v10 copy];
      [(_SFPBRichText *)v5 setContentAdvisory:v12];

      v6 = v11;
    }
    v13 = [v4 objectForKeyedSubscript:@"icons"];
    objc_opt_class();
    long long v32 = v13;
    long long v33 = v10;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v40;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v40 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v20 = [[_SFPBImage alloc] initWithDictionary:v19];
              [(_SFPBRichText *)v5 addIcons:v20];
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v16);
      }

      v13 = v32;
      v10 = v33;
    }
    v21 = [v4 objectForKeyedSubscript:@"formattedTextPieces"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = v6;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v36;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * v26);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = [[_SFPBFormattedText alloc] initWithDictionary:v27];
              [(_SFPBRichText *)v5 addFormattedTextPieces:v28];
            }
            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v24);
      }

      v6 = v31;
      v13 = v32;
      v10 = v33;
    }
    long long v29 = v5;
  }
  return v5;
}

- (_SFPBRichText)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRichText *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRichText *)self dictionaryRepresentation];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_contentAdvisory)
  {
    id v4 = [(_SFPBRichText *)self contentAdvisory];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"contentAdvisory"];
  }
  if ([(NSArray *)self->_formattedTextPieces count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v7 = self->_formattedTextPieces;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"formattedTextPieces"];
  }
  if ([(NSArray *)self->_icons count])
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v15 = self->_icons;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "dictionaryRepresentation", (void)v29);
          if (v20)
          {
            [v14 addObject:v20];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA98] null];
            [v14 addObject:v21];
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"icons"];
  }
  if (self->_starRating)
  {
    id v22 = [(_SFPBRichText *)self starRating];
    uint64_t v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"starRating"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"starRating"];
    }
  }
  if (self->_text)
  {
    uint64_t v25 = [(_SFPBRichText *)self text];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"text"];
    }
    else
    {
      uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"text"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBText *)self->_text hash];
  unint64_t v4 = [(_SFPBGraphicalFloat *)self->_starRating hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_contentAdvisory hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_icons hash];
  return v6 ^ [(NSArray *)self->_formattedTextPieces hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  NSUInteger v5 = [(_SFPBRichText *)self text];
  uint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_SFPBRichText *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRichText *)self text];
    uint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRichText *)self starRating];
  uint64_t v6 = [v4 starRating];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_SFPBRichText *)self starRating];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(_SFPBRichText *)self starRating];
    uint64_t v15 = [v4 starRating];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRichText *)self contentAdvisory];
  uint64_t v6 = [v4 contentAdvisory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_SFPBRichText *)self contentAdvisory];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRichText *)self contentAdvisory];
    id v20 = [v4 contentAdvisory];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRichText *)self icons];
  uint64_t v6 = [v4 icons];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_SFPBRichText *)self icons];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBRichText *)self icons];
    uint64_t v25 = [v4 icons];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBRichText *)self formattedTextPieces];
  uint64_t v6 = [v4 formattedTextPieces];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_SFPBRichText *)self formattedTextPieces];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    long long v29 = [(_SFPBRichText *)self formattedTextPieces];
    long long v30 = [v4 formattedTextPieces];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBRichText *)self text];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v6 = [(_SFPBRichText *)self starRating];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRichText *)self contentAdvisory];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  uint64_t v8 = [(_SFPBRichText *)self icons];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  v13 = [(_SFPBRichText *)self formattedTextPieces];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRichTextReadFrom(self, (uint64_t)a3);
}

- (id)formattedTextPiecesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_formattedTextPieces objectAtIndexedSubscript:a3];
}

- (unint64_t)formattedTextPiecesCount
{
  return [(NSArray *)self->_formattedTextPieces count];
}

- (void)addFormattedTextPieces:(id)a3
{
  id v4 = a3;
  formattedTextPieces = self->_formattedTextPieces;
  id v8 = v4;
  if (!formattedTextPieces)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_formattedTextPieces;
    self->_formattedTextPieces = v6;

    id v4 = v8;
    formattedTextPieces = self->_formattedTextPieces;
  }
  [(NSArray *)formattedTextPieces addObject:v4];
}

- (void)clearFormattedTextPieces
{
}

- (void)setFormattedTextPieces:(id)a3
{
  self->_formattedTextPieces = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)iconsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_icons objectAtIndexedSubscript:a3];
}

- (unint64_t)iconsCount
{
  return [(NSArray *)self->_icons count];
}

- (void)addIcons:(id)a3
{
  id v4 = a3;
  icons = self->_icons;
  id v8 = v4;
  if (!icons)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_icons;
    self->_icons = v6;

    id v4 = v8;
    icons = self->_icons;
  }
  [(NSArray *)icons addObject:v4];
}

- (void)clearIcons
{
}

- (void)setIcons:(id)a3
{
  self->_icons = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContentAdvisory:(id)a3
{
  self->_contentAdvisory = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setStarRating:(id)a3
{
}

- (void)setText:(id)a3
{
}

@end