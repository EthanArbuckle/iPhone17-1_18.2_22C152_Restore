@interface _SFPBKeyValueDataCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)datas;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)accessoryImage;
- (_SFPBKeyValueDataCardSection)initWithDictionary:(id)a3;
- (_SFPBKeyValueDataCardSection)initWithFacade:(id)a3;
- (_SFPBKeyValueDataCardSection)initWithJSON:(id)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)dataCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addData:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearData;
- (void)clearPunchoutOptions;
- (void)setAccessoryImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDatas:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBKeyValueDataCardSection

- (_SFPBKeyValueDataCardSection)initWithFacade:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBKeyValueDataCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    [(_SFPBKeyValueDataCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBKeyValueDataCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBKeyValueDataCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBKeyValueDataCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBKeyValueDataCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBKeyValueDataCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBKeyValueDataCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBKeyValueDataCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBKeyValueDataCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 data];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v26 = objc_msgSend(v4, "data", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBKeyValueTuple alloc] initWithFacade:*(void *)(*((void *)&v38 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v28);
    }

    [(_SFPBKeyValueDataCardSection *)v5 setDatas:v25];
    v32 = [v4 accessoryImage];

    if (v32)
    {
      v33 = [_SFPBImage alloc];
      v34 = [v4 accessoryImage];
      v35 = [(_SFPBImage *)v33 initWithFacade:v34];
      [(_SFPBKeyValueDataCardSection *)v5 setAccessoryImage:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_datas, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setDatas:(id)a3
{
}

- (NSArray)datas
{
  return self->_datas;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (_SFPBKeyValueDataCardSection)initWithDictionary:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)_SFPBKeyValueDataCardSection;
  v5 = [(_SFPBKeyValueDataCardSection *)&v56 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v53 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBKeyValueDataCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBKeyValueDataCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBKeyValueDataCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBKeyValueDataCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v47 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBKeyValueDataCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBKeyValueDataCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    long long v45 = v21;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v46 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v19;
      v24 = (void *)[v46 copy];
      [(_SFPBKeyValueDataCardSection *)v5 setType:v24];

      v19 = v23;
    }
    id v25 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBKeyValueDataCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v25 intValue]);
    }
    long long v44 = v25;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBColor alloc] initWithDictionary:v26];
      [(_SFPBKeyValueDataCardSection *)v5 setBackgroundColor:v27];
    }
    long long v43 = (void *)v26;
    uint64_t v28 = [v4 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v40 = v19;
      long long v41 = v15;
      long long v42 = v6;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v49 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v48 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = [[_SFPBKeyValueTuple alloc] initWithDictionary:v34];
              [(_SFPBKeyValueDataCardSection *)v5 addData:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v57 count:16];
        }
        while (v31);
      }

      v15 = v41;
      v6 = v42;
      v19 = v40;
    }
    v36 = [v4 objectForKeyedSubscript:@"accessoryImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBImage alloc] initWithDictionary:v36];
      [(_SFPBKeyValueDataCardSection *)v5 setAccessoryImage:v37];
    }
    long long v38 = v5;
  }
  return v5;
}

- (_SFPBKeyValueDataCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBKeyValueDataCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBKeyValueDataCardSection *)self dictionaryRepresentation];
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
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accessoryImage)
  {
    id v4 = [(_SFPBKeyValueDataCardSection *)self accessoryImage];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accessoryImage"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accessoryImage"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v7 = [(_SFPBKeyValueDataCardSection *)self backgroundColor];
    id v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBKeyValueDataCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_datas count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v12 = self->_datas;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"data"];
  }
  if (self->_hasBottomPadding)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBKeyValueDataCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v19 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBKeyValueDataCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v20 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v22 = self->_punchoutOptions;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    id v29 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerDismissText];
    uint64_t v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v31 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerTitle];
    uint64_t v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v33 = [(_SFPBKeyValueDataCardSection *)self separatorStyle];
    if (v33 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v33);
      uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v34 = off_1E5A2F090[v33];
    }
    [v3 setObject:v34 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_type)
  {
    v35 = [(_SFPBKeyValueDataCardSection *)self type];
    v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v4 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v5 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v8 = 2654435761;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_type hash] ^ (2654435761 * self->_separatorStyle);
  unint64_t v10 = [(_SFPBColor *)self->_backgroundColor hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_datas hash];
  return v9 ^ v11 ^ [(_SFPBImage *)self->_accessoryImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(_SFPBKeyValueDataCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBKeyValueDataCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v12 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v17 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_41;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_41;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_41;
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v25 = [(_SFPBKeyValueDataCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBKeyValueDataCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_41;
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v31 = [(_SFPBKeyValueDataCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBKeyValueDataCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self datas];
  uint64_t v6 = [v4 datas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v36 = [(_SFPBKeyValueDataCardSection *)self datas];
  if (v36)
  {
    v37 = (void *)v36;
    long long v38 = [(_SFPBKeyValueDataCardSection *)self datas];
    long long v39 = [v4 datas];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self accessoryImage];
  uint64_t v6 = [v4 accessoryImage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v41 = [(_SFPBKeyValueDataCardSection *)self accessoryImage];
  if (!v41)
  {

LABEL_44:
    BOOL v46 = 1;
    goto LABEL_42;
  }
  long long v42 = (void *)v41;
  long long v43 = [(_SFPBKeyValueDataCardSection *)self accessoryImage];
  long long v44 = [v4 accessoryImage];
  char v45 = [v43 isEqual:v44];

  if (v45) {
    goto LABEL_44;
  }
LABEL_41:
  BOOL v46 = 0;
LABEL_42:

  return v46;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBKeyValueDataCardSection *)self punchoutOptions];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBKeyValueDataCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBKeyValueDataCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBKeyValueDataCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBKeyValueDataCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBKeyValueDataCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBKeyValueDataCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBKeyValueDataCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBKeyValueDataCardSection *)self datas];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  v19 = [(_SFPBKeyValueDataCardSection *)self accessoryImage];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBKeyValueDataCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAccessoryImage:(id)a3
{
}

- (id)dataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_datas objectAtIndexedSubscript:a3];
}

- (unint64_t)dataCount
{
  return [(NSArray *)self->_datas count];
}

- (void)addData:(id)a3
{
  id v4 = a3;
  datas = self->_datas;
  id v8 = v4;
  if (!datas)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_datas;
    self->_datas = v6;

    id v4 = v8;
    datas = self->_datas;
  }
  [(NSArray *)datas addObject:v4];
}

- (void)clearData
{
}

- (void)setData:(id)a3
{
  self->_datas = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_int hasBottomPadding = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_int hasTopPadding = a3;
}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_int canBeHidden = a3;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
  self->_punchoutPickerDismissText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchoutPickerTitle:(id)a3
{
  self->_punchoutPickerTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_punchoutOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)punchoutOptionsCount
{
  return [(NSArray *)self->_punchoutOptions count];
}

- (void)addPunchoutOptions:(id)a3
{
  id v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  id v8 = v4;
  if (!punchoutOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    id v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  [(NSArray *)punchoutOptions addObject:v4];
}

- (void)clearPunchoutOptions
{
}

- (void)setPunchoutOptions:(id)a3
{
  self->_punchoutOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end