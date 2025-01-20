@interface _SFPBAttributionFooterCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBAttributionFooterCardSection)initWithDictionary:(id)a3;
- (_SFPBAttributionFooterCardSection)initWithFacade:(id)a3;
- (_SFPBAttributionFooterCardSection)initWithJSON:(id)a3;
- (_SFPBColor)backgroundColor;
- (_SFPBCommand)trailingAttributionCommand;
- (_SFPBPunchout)leadingAttributionPunchout;
- (_SFPBPunchout)trailingAttributionPunchout;
- (_SFPBRichText)leadingAttribution;
- (_SFPBRichText)trailingAttribution;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setLeadingAttribution:(id)a3;
- (void)setLeadingAttributionPunchout:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTrailingAttribution:(id)a3;
- (void)setTrailingAttributionCommand:(id)a3;
- (void)setTrailingAttributionPunchout:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAttributionFooterCardSection

- (_SFPBAttributionFooterCardSection)initWithFacade:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBAttributionFooterCardSection *)self init];
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
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
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
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v10);
    }

    [(_SFPBAttributionFooterCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBAttributionFooterCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBAttributionFooterCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBAttributionFooterCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBAttributionFooterCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBAttributionFooterCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBAttributionFooterCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBAttributionFooterCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBAttributionFooterCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 leadingAttribution];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 leadingAttribution];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBAttributionFooterCardSection *)v5 setLeadingAttribution:v27];
    }
    v28 = [v4 leadingAttributionPunchout];

    if (v28)
    {
      v29 = [_SFPBPunchout alloc];
      v30 = [v4 leadingAttributionPunchout];
      v31 = [(_SFPBPunchout *)v29 initWithFacade:v30];
      [(_SFPBAttributionFooterCardSection *)v5 setLeadingAttributionPunchout:v31];
    }
    v32 = [v4 trailingAttribution];

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      v34 = [v4 trailingAttribution];
      v35 = [(_SFPBRichText *)v33 initWithFacade:v34];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttribution:v35];
    }
    v36 = [v4 trailingAttributionPunchout];

    if (v36)
    {
      v37 = [_SFPBPunchout alloc];
      v38 = [v4 trailingAttributionPunchout];
      v39 = [(_SFPBPunchout *)v37 initWithFacade:v38];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttributionPunchout:v39];
    }
    v40 = [v4 trailingAttributionCommand];

    if (v40)
    {
      v41 = [_SFPBCommand alloc];
      v42 = [v4 trailingAttributionCommand];
      v43 = [(_SFPBCommand *)v41 initWithFacade:v42];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttributionCommand:v43];
    }
    v44 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAttributionCommand, 0);
  objc_storeStrong((id *)&self->_trailingAttributionPunchout, 0);
  objc_storeStrong((id *)&self->_trailingAttribution, 0);
  objc_storeStrong((id *)&self->_leadingAttributionPunchout, 0);
  objc_storeStrong((id *)&self->_leadingAttribution, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBCommand)trailingAttributionCommand
{
  return self->_trailingAttributionCommand;
}

- (_SFPBPunchout)trailingAttributionPunchout
{
  return self->_trailingAttributionPunchout;
}

- (_SFPBRichText)trailingAttribution
{
  return self->_trailingAttribution;
}

- (_SFPBPunchout)leadingAttributionPunchout
{
  return self->_leadingAttributionPunchout;
}

- (_SFPBRichText)leadingAttribution
{
  return self->_leadingAttribution;
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

- (_SFPBAttributionFooterCardSection)initWithDictionary:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBAttributionFooterCardSection;
  v5 = [(_SFPBAttributionFooterCardSection *)&v49 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v46;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v46 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBAttributionFooterCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBAttributionFooterCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v43 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBAttributionFooterCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v42 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAttributionFooterCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAttributionFooterCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAttributionFooterCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v41 = v18;
    v44 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBAttributionFooterCardSection *)v5 setType:v22];
    }
    v38 = v21;
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAttributionFooterCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v39 = v20;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBAttributionFooterCardSection *)v5 setBackgroundColor:v25];
    }
    v40 = v19;
    v26 = [v4 objectForKeyedSubscript:@"leadingAttribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRichText alloc] initWithDictionary:v26];
      [(_SFPBAttributionFooterCardSection *)v5 setLeadingAttribution:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"leadingAttributionPunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBPunchout alloc] initWithDictionary:v28];
      [(_SFPBAttributionFooterCardSection *)v5 setLeadingAttributionPunchout:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"trailingAttribution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBRichText alloc] initWithDictionary:v30];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttribution:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"trailingAttributionPunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBPunchout alloc] initWithDictionary:v32];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttributionPunchout:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"trailingAttributionCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBCommand alloc] initWithDictionary:v34];
      [(_SFPBAttributionFooterCardSection *)v5 setTrailingAttributionCommand:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (_SFPBAttributionFooterCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAttributionFooterCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAttributionFooterCardSection *)self dictionaryRepresentation];
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBAttributionFooterCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAttributionFooterCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAttributionFooterCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAttributionFooterCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_leadingAttribution)
  {
    uint64_t v10 = [(_SFPBAttributionFooterCardSection *)self leadingAttribution];
    uint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"leadingAttribution"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"leadingAttribution"];
    }
  }
  if (self->_leadingAttributionPunchout)
  {
    v13 = [(_SFPBAttributionFooterCardSection *)self leadingAttributionPunchout];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"leadingAttributionPunchout"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"leadingAttributionPunchout"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v17 = self->_punchoutOptions;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          if (v22)
          {
            [v16 addObject:v22];
          }
          else
          {
            v23 = [MEMORY[0x1E4F1CA98] null];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v24 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerDismissText];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v26 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerTitle];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v28 = [(_SFPBAttributionFooterCardSection *)self separatorStyle];
    if (v28 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E5A2F090[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_trailingAttribution)
  {
    v30 = [(_SFPBAttributionFooterCardSection *)self trailingAttribution];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"trailingAttribution"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"trailingAttribution"];
    }
  }
  if (self->_trailingAttributionCommand)
  {
    v33 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionCommand];
    v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"trailingAttributionCommand"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"trailingAttributionCommand"];
    }
  }
  if (self->_trailingAttributionPunchout)
  {
    v36 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionPunchout];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"trailingAttributionPunchout"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"trailingAttributionPunchout"];
    }
  }
  if (self->_type)
  {
    v39 = [(_SFPBAttributionFooterCardSection *)self type];
    v40 = (void *)[v39 copy];
    [v3 setObject:v40 forKeyedSubscript:@"type"];
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
  unint64_t v11 = v10 ^ [(_SFPBRichText *)self->_leadingAttribution hash];
  unint64_t v12 = v11 ^ [(_SFPBPunchout *)self->_leadingAttributionPunchout hash];
  unint64_t v13 = v12 ^ [(_SFPBRichText *)self->_trailingAttribution hash];
  unint64_t v14 = v13 ^ [(_SFPBPunchout *)self->_trailingAttributionPunchout hash];
  return v9 ^ v14 ^ [(_SFPBCommand *)self->_trailingAttributionCommand hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v7 = [(_SFPBAttributionFooterCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBAttributionFooterCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v12 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v17 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerDismissText];
    uint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_56;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_56;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v25 = [(_SFPBAttributionFooterCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBAttributionFooterCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v31 = [(_SFPBAttributionFooterCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBAttributionFooterCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self leadingAttribution];
  uint64_t v6 = [v4 leadingAttribution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v36 = [(_SFPBAttributionFooterCardSection *)self leadingAttribution];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBAttributionFooterCardSection *)self leadingAttribution];
    v39 = [v4 leadingAttribution];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self leadingAttributionPunchout];
  uint64_t v6 = [v4 leadingAttributionPunchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v41 = [(_SFPBAttributionFooterCardSection *)self leadingAttributionPunchout];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBAttributionFooterCardSection *)self leadingAttributionPunchout];
    long long v44 = [v4 leadingAttributionPunchout];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self trailingAttribution];
  uint64_t v6 = [v4 trailingAttribution];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v46 = [(_SFPBAttributionFooterCardSection *)self trailingAttribution];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    long long v48 = [(_SFPBAttributionFooterCardSection *)self trailingAttribution];
    objc_super v49 = [v4 trailingAttribution];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionPunchout];
  uint64_t v6 = [v4 trailingAttributionPunchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v51 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionPunchout];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionPunchout];
    v54 = [v4 trailingAttributionPunchout];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionCommand];
  uint64_t v6 = [v4 trailingAttributionCommand];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_55:

    goto LABEL_56;
  }
  uint64_t v56 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionCommand];
  if (!v56)
  {

LABEL_59:
    BOOL v61 = 1;
    goto LABEL_57;
  }
  v57 = (void *)v56;
  v58 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionCommand];
  v59 = [v4 trailingAttributionCommand];
  char v60 = [v58 isEqual:v59];

  if (v60) {
    goto LABEL_59;
  }
LABEL_56:
  BOOL v61 = 0;
LABEL_57:

  return v61;
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBAttributionFooterCardSection *)self punchoutOptions];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBAttributionFooterCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAttributionFooterCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBAttributionFooterCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBAttributionFooterCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBAttributionFooterCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAttributionFooterCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v13 = [(_SFPBAttributionFooterCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBAttributionFooterCardSection *)self leadingAttribution];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  v15 = [(_SFPBAttributionFooterCardSection *)self leadingAttributionPunchout];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBAttributionFooterCardSection *)self trailingAttribution];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionPunchout];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBAttributionFooterCardSection *)self trailingAttributionCommand];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAttributionFooterCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setTrailingAttributionCommand:(id)a3
{
}

- (void)setTrailingAttributionPunchout:(id)a3
{
}

- (void)setTrailingAttribution:(id)a3
{
}

- (void)setLeadingAttributionPunchout:(id)a3
{
}

- (void)setLeadingAttribution:(id)a3
{
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