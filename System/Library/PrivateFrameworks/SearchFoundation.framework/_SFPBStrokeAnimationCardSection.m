@interface _SFPBStrokeAnimationCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)characters;
- (NSArray)pronunciations;
- (NSArray)punchoutOptions;
- (NSArray)strokeNames;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)strokeAnimationRepresentation;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBStrokeAnimationCardSection)initWithDictionary:(id)a3;
- (_SFPBStrokeAnimationCardSection)initWithFacade:(id)a3;
- (_SFPBStrokeAnimationCardSection)initWithJSON:(id)a3;
- (id)charactersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)pronunciationsAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)strokeNamesAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)charactersCount;
- (unint64_t)hash;
- (unint64_t)pronunciationsCount;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)strokeNamesCount;
- (void)addCharacters:(id)a3;
- (void)addPronunciations:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)addStrokeNames:(id)a3;
- (void)clearCharacters;
- (void)clearPronunciations;
- (void)clearPunchoutOptions;
- (void)clearStrokeNames;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCharacters:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPronunciations:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setStrokeAnimationRepresentation:(id)a3;
- (void)setStrokeNames:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBStrokeAnimationCardSection

- (_SFPBStrokeAnimationCardSection)initWithFacade:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBStrokeAnimationCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
      }
      while (v10);
    }

    [(_SFPBStrokeAnimationCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBStrokeAnimationCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBStrokeAnimationCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBStrokeAnimationCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBStrokeAnimationCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBStrokeAnimationCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBStrokeAnimationCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBStrokeAnimationCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBStrokeAnimationCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 strokeAnimationRepresentation];

    if (v24)
    {
      v25 = [v4 strokeAnimationRepresentation];
      [(_SFPBStrokeAnimationCardSection *)v5 setStrokeAnimationRepresentation:v25];
    }
    v26 = [v4 strokeNames];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v28 = [v4 strokeNames];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v58 != v31) {
            objc_enumerationMutation(v28);
          }
          if (*(void *)(*((void *)&v57 + 1) + 8 * j)) {
            objc_msgSend(v27, "addObject:");
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v30);
    }

    [(_SFPBStrokeAnimationCardSection *)v5 setStrokeNames:v27];
    v33 = [v4 characters];
    if (v33) {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v34 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v35 = [v4 characters];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          if (*(void *)(*((void *)&v53 + 1) + 8 * k)) {
            objc_msgSend(v34, "addObject:");
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v37);
    }

    [(_SFPBStrokeAnimationCardSection *)v5 setCharacters:v34];
    v40 = [v4 pronunciations];
    if (v40) {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v41 = 0;
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v42 = objc_msgSend(v4, "pronunciations", 0);
    uint64_t v43 = [v42 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v50;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(v42);
          }
          if (*(void *)(*((void *)&v49 + 1) + 8 * m)) {
            objc_msgSend(v41, "addObject:");
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v49 objects:v65 count:16];
      }
      while (v44);
    }

    [(_SFPBStrokeAnimationCardSection *)v5 setPronunciations:v41];
    v47 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_characters, 0);
  objc_storeStrong((id *)&self->_strokeNames, 0);
  objc_storeStrong((id *)&self->_strokeAnimationRepresentation, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)pronunciations
{
  return self->_pronunciations;
}

- (NSArray)characters
{
  return self->_characters;
}

- (NSArray)strokeNames
{
  return self->_strokeNames;
}

- (NSString)strokeAnimationRepresentation
{
  return self->_strokeAnimationRepresentation;
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

- (_SFPBStrokeAnimationCardSection)initWithDictionary:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)_SFPBStrokeAnimationCardSection;
  v5 = [(_SFPBStrokeAnimationCardSection *)&v82 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    v65 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v79 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v78 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBStrokeAnimationCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v78 objects:v86 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBStrokeAnimationCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBStrokeAnimationCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    long long v64 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStrokeAnimationCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    long long v63 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStrokeAnimationCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    long long v62 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStrokeAnimationCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    long long v61 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBStrokeAnimationCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    long long v60 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBStrokeAnimationCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    long long v59 = v14;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBStrokeAnimationCardSection *)v5 setBackgroundColor:v25];
    }
    long long v57 = (void *)v24;
    long long v58 = v16;
    v26 = [v4 objectForKeyedSubscript:@"strokeAnimationRepresentation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = (void *)[v26 copy];
      [(_SFPBStrokeAnimationCardSection *)v5 setStrokeAnimationRepresentation:v27];
    }
    long long v56 = v26;
    v28 = [v4 objectForKeyedSubscript:@"strokeNames"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v74 objects:v85 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v75 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = *(void **)(*((void *)&v74 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = (void *)[v34 copy];
              [(_SFPBStrokeAnimationCardSection *)v5 addStrokeNames:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v74 objects:v85 count:16];
        }
        while (v31);
      }
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"characters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = v4;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v38 = v36;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v84 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v71 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void **)(*((void *)&v70 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v44 = (void *)[v43 copy];
              [(_SFPBStrokeAnimationCardSection *)v5 addCharacters:v44];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v84 count:16];
        }
        while (v40);
      }

      id v4 = v37;
    }
    uint64_t v45 = [v4 objectForKeyedSubscript:@"pronunciations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v55 = v4;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v83 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v67;
        do
        {
          for (uint64_t m = 0; m != v48; ++m)
          {
            if (*(void *)v67 != v49) {
              objc_enumerationMutation(v46);
            }
            long long v51 = *(void **)(*((void *)&v66 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v52 = (void *)[v51 copy];
              [(_SFPBStrokeAnimationCardSection *)v5 addPronunciations:v52];
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:v83 count:16];
        }
        while (v48);
      }

      id v4 = v55;
    }
    long long v53 = v5;
  }
  return v5;
}

- (_SFPBStrokeAnimationCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBStrokeAnimationCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBStrokeAnimationCardSection *)self dictionaryRepresentation];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBStrokeAnimationCardSection *)self backgroundColor];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBStrokeAnimationCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_characters)
  {
    uint64_t v8 = [(_SFPBStrokeAnimationCardSection *)self characters];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"characters"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBStrokeAnimationCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v10 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBStrokeAnimationCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v11 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_pronunciations)
  {
    uint64_t v12 = [(_SFPBStrokeAnimationCardSection *)self pronunciations];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"pronunciations"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v15 = self->_punchoutOptions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v22 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerDismissText];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v24 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerTitle];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v26 = [(_SFPBStrokeAnimationCardSection *)self separatorStyle];
    if (v26 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
      id v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v27 = off_1E5A2F090[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_strokeAnimationRepresentation)
  {
    v28 = [(_SFPBStrokeAnimationCardSection *)self strokeAnimationRepresentation];
    id v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"strokeAnimationRepresentation"];
  }
  if (self->_strokeNames)
  {
    uint64_t v30 = [(_SFPBStrokeAnimationCardSection *)self strokeNames];
    uint64_t v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"strokeNames"];
  }
  if (self->_type)
  {
    uint64_t v32 = [(_SFPBStrokeAnimationCardSection *)self type];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"type"];
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
  NSUInteger v11 = v10 ^ [(NSString *)self->_strokeAnimationRepresentation hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_strokeNames hash];
  uint64_t v13 = v12 ^ [(NSArray *)self->_characters hash];
  return v9 ^ v13 ^ [(NSArray *)self->_pronunciations hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v7 = [(_SFPBStrokeAnimationCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBStrokeAnimationCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v12 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v17 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_51;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_51;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_51;
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v25 = [(_SFPBStrokeAnimationCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    id v27 = [(_SFPBStrokeAnimationCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_51;
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v31 = [(_SFPBStrokeAnimationCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    v33 = [(_SFPBStrokeAnimationCardSection *)self backgroundColor];
    id v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self strokeAnimationRepresentation];
  uint64_t v6 = [v4 strokeAnimationRepresentation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v36 = [(_SFPBStrokeAnimationCardSection *)self strokeAnimationRepresentation];
  if (v36)
  {
    long long v37 = (void *)v36;
    long long v38 = [(_SFPBStrokeAnimationCardSection *)self strokeAnimationRepresentation];
    uint64_t v39 = [v4 strokeAnimationRepresentation];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self strokeNames];
  uint64_t v6 = [v4 strokeNames];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v41 = [(_SFPBStrokeAnimationCardSection *)self strokeNames];
  if (v41)
  {
    v42 = (void *)v41;
    uint64_t v43 = [(_SFPBStrokeAnimationCardSection *)self strokeNames];
    uint64_t v44 = [v4 strokeNames];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self characters];
  uint64_t v6 = [v4 characters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v46 = [(_SFPBStrokeAnimationCardSection *)self characters];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    uint64_t v48 = [(_SFPBStrokeAnimationCardSection *)self characters];
    uint64_t v49 = [v4 characters];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self pronunciations];
  uint64_t v6 = [v4 pronunciations];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v51 = [(_SFPBStrokeAnimationCardSection *)self pronunciations];
  if (!v51)
  {

LABEL_54:
    BOOL v56 = 1;
    goto LABEL_52;
  }
  long long v52 = (void *)v51;
  long long v53 = [(_SFPBStrokeAnimationCardSection *)self pronunciations];
  long long v54 = [v4 pronunciations];
  char v55 = [v53 isEqual:v54];

  if (v55) {
    goto LABEL_54;
  }
LABEL_51:
  BOOL v56 = 0;
LABEL_52:

  return v56;
}

- (void)writeTo:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBStrokeAnimationCardSection *)self punchoutOptions];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBStrokeAnimationCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBStrokeAnimationCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBStrokeAnimationCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBStrokeAnimationCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBStrokeAnimationCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBStrokeAnimationCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBStrokeAnimationCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  v14 = [(_SFPBStrokeAnimationCardSection *)self strokeAnimationRepresentation];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  v15 = [(_SFPBStrokeAnimationCardSection *)self strokeNames];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v17);
  }

  v20 = [(_SFPBStrokeAnimationCardSection *)self characters];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v22);
  }

  uint64_t v25 = [(_SFPBStrokeAnimationCardSection *)self pronunciations];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v27);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStrokeAnimationCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)pronunciationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_pronunciations objectAtIndexedSubscript:a3];
}

- (unint64_t)pronunciationsCount
{
  return [(NSArray *)self->_pronunciations count];
}

- (void)addPronunciations:(id)a3
{
  id v4 = a3;
  pronunciations = self->_pronunciations;
  id v8 = v4;
  if (!pronunciations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_pronunciations;
    self->_pronunciations = v6;

    id v4 = v8;
    pronunciations = self->_pronunciations;
  }
  [(NSArray *)pronunciations addObject:v4];
}

- (void)clearPronunciations
{
}

- (void)setPronunciations:(id)a3
{
  self->_pronunciations = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)charactersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_characters objectAtIndexedSubscript:a3];
}

- (unint64_t)charactersCount
{
  return [(NSArray *)self->_characters count];
}

- (void)addCharacters:(id)a3
{
  id v4 = a3;
  characters = self->_characters;
  id v8 = v4;
  if (!characters)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_characters;
    self->_characters = v6;

    id v4 = v8;
    characters = self->_characters;
  }
  [(NSArray *)characters addObject:v4];
}

- (void)clearCharacters
{
}

- (void)setCharacters:(id)a3
{
  self->_characters = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)strokeNamesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_strokeNames objectAtIndexedSubscript:a3];
}

- (unint64_t)strokeNamesCount
{
  return [(NSArray *)self->_strokeNames count];
}

- (void)addStrokeNames:(id)a3
{
  id v4 = a3;
  strokeNames = self->_strokeNames;
  id v8 = v4;
  if (!strokeNames)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_strokeNames;
    self->_strokeNames = v6;

    id v4 = v8;
    strokeNames = self->_strokeNames;
  }
  [(NSArray *)strokeNames addObject:v4];
}

- (void)clearStrokeNames
{
}

- (void)setStrokeNames:(id)a3
{
  self->_strokeNames = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setStrokeAnimationRepresentation:(id)a3
{
  self->_strokeAnimationRepresentation = (NSString *)[a3 copy];
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