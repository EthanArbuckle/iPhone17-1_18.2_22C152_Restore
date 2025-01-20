@interface _SFPBTableHeaderRowCardSection
- (BOOL)alignRowsToHeader;
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubHeader;
- (BOOL)readFrom:(id)a3;
- (BOOL)reducedRowHeight;
- (NSArray)datas;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)tabGroupIdentifier;
- (NSString)tableIdentifier;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBTableAlignmentSchema)alignmentSchema;
- (_SFPBTableHeaderRowCardSection)initWithDictionary:(id)a3;
- (_SFPBTableHeaderRowCardSection)initWithFacade:(id)a3;
- (_SFPBTableHeaderRowCardSection)initWithJSON:(id)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (int)verticalAlign;
- (unint64_t)dataCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addData:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearData;
- (void)clearPunchoutOptions;
- (void)setAlignRowsToHeader:(BOOL)a3;
- (void)setAlignmentSchema:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDatas:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIsSubHeader:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setReducedRowHeight:(BOOL)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTabGroupIdentifier:(id)a3;
- (void)setTableIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)setVerticalAlign:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTableHeaderRowCardSection

- (_SFPBTableHeaderRowCardSection)initWithFacade:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTableHeaderRowCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v10);
    }

    [(_SFPBTableHeaderRowCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBTableHeaderRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBTableHeaderRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBTableHeaderRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBTableHeaderRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBTableHeaderRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBTableHeaderRowCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBTableHeaderRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBTableHeaderRowCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 tableIdentifier];

    if (v24)
    {
      v25 = [v4 tableIdentifier];
      [(_SFPBTableHeaderRowCardSection *)v5 setTableIdentifier:v25];
    }
    v26 = [v4 alignmentSchema];

    if (v26)
    {
      v27 = [_SFPBTableAlignmentSchema alloc];
      v28 = [v4 alignmentSchema];
      v29 = [(_SFPBTableAlignmentSchema *)v27 initWithFacade:v28];
      [(_SFPBTableHeaderRowCardSection *)v5 setAlignmentSchema:v29];
    }
    v30 = [v4 data];
    if (v30) {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v31 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v32 = objc_msgSend(v4, "data", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [[_SFPBFormattedText alloc] initWithFacade:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          if (v37) {
            [v31 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v34);
    }

    [(_SFPBTableHeaderRowCardSection *)v5 setDatas:v31];
    if ([v4 hasIsSubHeader]) {
      -[_SFPBTableHeaderRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", [v4 isSubHeader]);
    }
    v38 = [v4 tabGroupIdentifier];

    if (v38)
    {
      v39 = [v4 tabGroupIdentifier];
      [(_SFPBTableHeaderRowCardSection *)v5 setTabGroupIdentifier:v39];
    }
    if ([v4 hasReducedRowHeight]) {
      -[_SFPBTableHeaderRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", [v4 reducedRowHeight]);
    }
    if ([v4 hasVerticalAlign]) {
      -[_SFPBTableHeaderRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", [v4 verticalAlign]);
    }
    if ([v4 hasAlignRowsToHeader]) {
      -[_SFPBTableHeaderRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", [v4 alignRowsToHeader]);
    }
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_datas, 0);
  objc_storeStrong((id *)&self->_alignmentSchema, 0);
  objc_storeStrong((id *)&self->_tableIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (BOOL)alignRowsToHeader
{
  return self->_alignRowsToHeader;
}

- (int)verticalAlign
{
  return self->_verticalAlign;
}

- (BOOL)reducedRowHeight
{
  return self->_reducedRowHeight;
}

- (NSString)tabGroupIdentifier
{
  return self->_tabGroupIdentifier;
}

- (BOOL)isSubHeader
{
  return self->_isSubHeader;
}

- (void)setDatas:(id)a3
{
}

- (NSArray)datas
{
  return self->_datas;
}

- (_SFPBTableAlignmentSchema)alignmentSchema
{
  return self->_alignmentSchema;
}

- (NSString)tableIdentifier
{
  return self->_tableIdentifier;
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

- (_SFPBTableHeaderRowCardSection)initWithDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_SFPBTableHeaderRowCardSection;
  v5 = [(_SFPBTableHeaderRowCardSection *)&v65 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
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
            uint64_t v13 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBTableHeaderRowCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v61 objects:v67 count:16];
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
      [(_SFPBTableHeaderRowCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBTableHeaderRowCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v56 = v21;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v55 = v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBTableHeaderRowCardSection *)v5 setType:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v54 = v24;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v24 intValue]);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    v53 = (void *)v25;
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBColor alloc] initWithDictionary:v25];
      [(_SFPBTableHeaderRowCardSection *)v5 setBackgroundColor:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"tableIdentifier"];
    objc_opt_class();
    uint64_t v52 = v27;
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      [(_SFPBTableHeaderRowCardSection *)v5 setTableIdentifier:v28];
    }
    v50 = v19;
    v51 = v17;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"alignmentSchema"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBTableAlignmentSchema alloc] initWithDictionary:v29];
      [(_SFPBTableHeaderRowCardSection *)v5 setAlignmentSchema:v30];
    }
    long long v48 = (void *)v29;
    long long v49 = v20;
    id v31 = [v4 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v47 = v15;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v58 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = [[_SFPBFormattedText alloc] initWithDictionary:v37];
              [(_SFPBTableHeaderRowCardSection *)v5 addData:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v34);
      }

      v15 = v47;
    }
    v39 = [v4 objectForKeyedSubscript:@"isSubHeader"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", [v39 BOOLValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"tabGroupIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(_SFPBTableHeaderRowCardSection *)v5 setTabGroupIdentifier:v41];
    }
    long long v42 = [v4 objectForKeyedSubscript:@"reducedRowHeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", [v42 BOOLValue]);
    }
    long long v43 = [v4 objectForKeyedSubscript:@"verticalAlign"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", [v43 intValue]);
    }
    long long v44 = [v4 objectForKeyedSubscript:@"alignRowsToHeader"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTableHeaderRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", [v44 BOOLValue]);
    }
    long long v45 = v5;
  }
  return v5;
}

- (_SFPBTableHeaderRowCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTableHeaderRowCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTableHeaderRowCardSection *)self dictionaryRepresentation];
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_alignRowsToHeader)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
    [v3 setObject:v4 forKeyedSubscript:@"alignRowsToHeader"];
  }
  if (self->_alignmentSchema)
  {
    v5 = [(_SFPBTableHeaderRowCardSection *)self alignmentSchema];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"alignmentSchema"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"alignmentSchema"];
    }
  }
  if (self->_backgroundColor)
  {
    id v8 = [(_SFPBTableHeaderRowCardSection *)self backgroundColor];
    uint64_t v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v11 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_datas count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v13 = self->_datas;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v52 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v51 + 1) + 8 * i) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"data"];
  }
  if (self->_hasBottomPadding)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v20 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v21 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_isSubHeader)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection isSubHeader](self, "isSubHeader"));
    [v3 setObject:v22 forKeyedSubscript:@"isSubHeader"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v24 = self->_punchoutOptions;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v48 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v47 + 1) + 8 * j) dictionaryRepresentation];
          if (v29)
          {
            [v23 addObject:v29];
          }
          else
          {
            v30 = [MEMORY[0x1E4F1CA98] null];
            [v23 addObject:v30];
          }
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    id v31 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerDismissText];
    id v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v33 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerTitle];
    uint64_t v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_reducedRowHeight)
  {
    uint64_t v35 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTableHeaderRowCardSection reducedRowHeight](self, "reducedRowHeight"));
    [v3 setObject:v35 forKeyedSubscript:@"reducedRowHeight"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v36 = [(_SFPBTableHeaderRowCardSection *)self separatorStyle];
    if (v36 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
      uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v37 = off_1E5A2F090[v36];
    }
    [v3 setObject:v37 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_tabGroupIdentifier)
  {
    v38 = [(_SFPBTableHeaderRowCardSection *)self tabGroupIdentifier];
    v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"tabGroupIdentifier"];
  }
  if (self->_tableIdentifier)
  {
    v40 = [(_SFPBTableHeaderRowCardSection *)self tableIdentifier];
    v41 = (void *)[v40 copy];
    [v3 setObject:v41 forKeyedSubscript:@"tableIdentifier"];
  }
  if (self->_type)
  {
    long long v42 = [(_SFPBTableHeaderRowCardSection *)self type];
    long long v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"type"];
  }
  if (self->_verticalAlign)
  {
    uint64_t v44 = [(_SFPBTableHeaderRowCardSection *)self verticalAlign];
    if ((v44 + 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v44);
      long long v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v45 = off_1E5A2EFC0[(v44 + 1)];
    }
    [v3 setObject:v45 forKeyedSubscript:@"verticalAlign"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v22 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v21 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v19 = v4;
  NSUInteger v20 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v18 = v5;
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v8 = 2654435761 * self->_separatorStyle;
  unint64_t v9 = [(_SFPBColor *)self->_backgroundColor hash];
  NSUInteger v10 = [(NSString *)self->_tableIdentifier hash];
  unint64_t v11 = [(_SFPBTableAlignmentSchema *)self->_alignmentSchema hash];
  uint64_t v12 = [(NSArray *)self->_datas hash];
  if (self->_isSubHeader) {
    uint64_t v13 = 2654435761;
  }
  else {
    uint64_t v13 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_tabGroupIdentifier hash];
  if (self->_reducedRowHeight) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  if (self->_alignRowsToHeader) {
    uint64_t v16 = 2654435761;
  }
  else {
    uint64_t v16 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (2654435761
                                                                                              * self->_verticalAlign) ^ v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(_SFPBTableHeaderRowCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBTableHeaderRowCardSection *)self punchoutOptions];
    NSUInteger v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v12 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v17 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerDismissText];
    NSUInteger v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_52;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_52;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v25 = [(_SFPBTableHeaderRowCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBTableHeaderRowCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v31 = [(_SFPBTableHeaderRowCardSection *)self backgroundColor];
  if (v31)
  {
    id v32 = (void *)v31;
    uint64_t v33 = [(_SFPBTableHeaderRowCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self tableIdentifier];
  uint64_t v6 = [v4 tableIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v36 = [(_SFPBTableHeaderRowCardSection *)self tableIdentifier];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    v38 = [(_SFPBTableHeaderRowCardSection *)self tableIdentifier];
    v39 = [v4 tableIdentifier];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self alignmentSchema];
  uint64_t v6 = [v4 alignmentSchema];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v41 = [(_SFPBTableHeaderRowCardSection *)self alignmentSchema];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBTableHeaderRowCardSection *)self alignmentSchema];
    uint64_t v44 = [v4 alignmentSchema];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self datas];
  uint64_t v6 = [v4 datas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v46 = [(_SFPBTableHeaderRowCardSection *)self datas];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_SFPBTableHeaderRowCardSection *)self datas];
    long long v49 = [v4 datas];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int isSubHeader = self->_isSubHeader;
  if (isSubHeader != [v4 isSubHeader]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self tabGroupIdentifier];
  uint64_t v6 = [v4 tabGroupIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v52 = [(_SFPBTableHeaderRowCardSection *)self tabGroupIdentifier];
  if (v52)
  {
    long long v53 = (void *)v52;
    long long v54 = [(_SFPBTableHeaderRowCardSection *)self tabGroupIdentifier];
    v55 = [v4 tabGroupIdentifier];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int reducedRowHeight = self->_reducedRowHeight;
  if (reducedRowHeight == [v4 reducedRowHeight])
  {
    int verticalAlign = self->_verticalAlign;
    if (verticalAlign == [v4 verticalAlign])
    {
      int alignRowsToHeader = self->_alignRowsToHeader;
      BOOL v57 = alignRowsToHeader == [v4 alignRowsToHeader];
      goto LABEL_53;
    }
  }
LABEL_52:
  BOOL v57 = 0;
LABEL_53:

  return v57;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBTableHeaderRowCardSection *)self punchoutOptions];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  NSUInteger v10 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBTableHeaderRowCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTableHeaderRowCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTableHeaderRowCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTableHeaderRowCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBTableHeaderRowCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTableHeaderRowCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBTableHeaderRowCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v14 = [(_SFPBTableHeaderRowCardSection *)self tableIdentifier];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBTableHeaderRowCardSection *)self alignmentSchema];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBTableHeaderRowCardSection *)self datas];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }

  if ([(_SFPBTableHeaderRowCardSection *)self isSubHeader]) {
    PBDataWriterWriteBOOLField();
  }
  int v21 = [(_SFPBTableHeaderRowCardSection *)self tabGroupIdentifier];
  if (v21) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTableHeaderRowCardSection *)self reducedRowHeight]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTableHeaderRowCardSection *)self verticalAlign]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBTableHeaderRowCardSection *)self alignRowsToHeader]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTableHeaderRowCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setAlignRowsToHeader:(BOOL)a3
{
  self->_int alignRowsToHeader = a3;
}

- (void)setVerticalAlign:(int)a3
{
  self->_int verticalAlign = a3;
}

- (void)setReducedRowHeight:(BOOL)a3
{
  self->_int reducedRowHeight = a3;
}

- (void)setTabGroupIdentifier:(id)a3
{
  self->_tabGroupIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsSubHeader:(BOOL)a3
{
  self->_int isSubHeader = a3;
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

- (void)setAlignmentSchema:(id)a3
{
}

- (void)setTableIdentifier:(id)a3
{
  self->_tableIdentifier = (NSString *)[a3 copy];
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