@interface _SFPBScoreboardCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)accessibilityDescription;
- (NSString)eventStatus;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBScoreboardCardSection)initWithDictionary:(id)a3;
- (_SFPBScoreboardCardSection)initWithFacade:(id)a3;
- (_SFPBScoreboardCardSection)initWithJSON:(id)a3;
- (_SFPBSportsTeam)team1;
- (_SFPBSportsTeam)team2;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setAccessibilityDescription:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setEventStatus:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTeam1:(id)a3;
- (void)setTeam2:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBScoreboardCardSection

- (_SFPBScoreboardCardSection)initWithFacade:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBScoreboardCardSection *)self init];
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
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
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
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v10);
    }

    [(_SFPBScoreboardCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBScoreboardCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBScoreboardCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBScoreboardCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBScoreboardCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBScoreboardCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBScoreboardCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBScoreboardCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBScoreboardCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBScoreboardCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(_SFPBScoreboardCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 team1];

    if (v28)
    {
      v29 = [_SFPBSportsTeam alloc];
      v30 = [v4 team1];
      v31 = [(_SFPBSportsTeam *)v29 initWithFacade:v30];
      [(_SFPBScoreboardCardSection *)v5 setTeam1:v31];
    }
    v32 = [v4 team2];

    if (v32)
    {
      v33 = [_SFPBSportsTeam alloc];
      v34 = [v4 team2];
      v35 = [(_SFPBSportsTeam *)v33 initWithFacade:v34];
      [(_SFPBScoreboardCardSection *)v5 setTeam2:v35];
    }
    v36 = [v4 accessibilityDescription];

    if (v36)
    {
      v37 = [v4 accessibilityDescription];
      [(_SFPBScoreboardCardSection *)v5 setAccessibilityDescription:v37];
    }
    v38 = [v4 eventStatus];

    if (v38)
    {
      v39 = [v4 eventStatus];
      [(_SFPBScoreboardCardSection *)v5 setEventStatus:v39];
    }
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStatus, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_team2, 0);
  objc_storeStrong((id *)&self->_team1, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSString)eventStatus
{
  return self->_eventStatus;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (_SFPBSportsTeam)team2
{
  return self->_team2;
}

- (_SFPBSportsTeam)team1
{
  return self->_team1;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
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

- (_SFPBScoreboardCardSection)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)_SFPBScoreboardCardSection;
  v5 = [(_SFPBScoreboardCardSection *)&v52 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v49;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v49 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v48 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBScoreboardCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v9);
      }
    }
    uint64_t v47 = v6;
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBScoreboardCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v46 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBScoreboardCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v45 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScoreboardCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScoreboardCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScoreboardCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    long long v44 = v18;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBScoreboardCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScoreboardCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    long long v43 = v19;
    v24 = objc_msgSend(v4, "objectForKeyedSubscript:", @"backgroundColor", v23);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBScoreboardCardSection *)v5 setBackgroundColor:v25];
    }
    long long v42 = v20;
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBScoreboardCardSection *)v5 setTitle:v27];
    }
    v41 = v21;
    v28 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBScoreboardCardSection *)v5 setSubtitle:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"team1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBSportsTeam alloc] initWithDictionary:v30];
      [(_SFPBScoreboardCardSection *)v5 setTeam1:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"team2"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBSportsTeam alloc] initWithDictionary:v32];
      [(_SFPBScoreboardCardSection *)v5 setTeam2:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"accessibilityDescription"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = (void *)[v34 copy];
      [(_SFPBScoreboardCardSection *)v5 setAccessibilityDescription:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"eventStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = (void *)[v36 copy];
      [(_SFPBScoreboardCardSection *)v5 setEventStatus:v37];
    }
    v38 = v5;
  }
  return v5;
}

- (_SFPBScoreboardCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBScoreboardCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBScoreboardCardSection *)self dictionaryRepresentation];
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accessibilityDescription)
  {
    id v4 = [(_SFPBScoreboardCardSection *)self accessibilityDescription];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accessibilityDescription"];
  }
  if (self->_backgroundColor)
  {
    v6 = [(_SFPBScoreboardCardSection *)self backgroundColor];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBScoreboardCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v9 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_eventStatus)
  {
    uint64_t v10 = [(_SFPBScoreboardCardSection *)self eventStatus];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"eventStatus"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBScoreboardCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBScoreboardCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v13 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v15 = self->_punchoutOptions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v22 = [(_SFPBScoreboardCardSection *)self punchoutPickerDismissText];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v24 = [(_SFPBScoreboardCardSection *)self punchoutPickerTitle];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v26 = [(_SFPBScoreboardCardSection *)self separatorStyle];
    if (v26 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E5A2F090[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    v28 = [(_SFPBScoreboardCardSection *)self subtitle];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"subtitle"];
  }
  if (self->_team1)
  {
    v30 = [(_SFPBScoreboardCardSection *)self team1];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"team1"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"team1"];
    }
  }
  if (self->_team2)
  {
    v33 = [(_SFPBScoreboardCardSection *)self team2];
    v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"team2"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"team2"];
    }
  }
  if (self->_title)
  {
    v36 = [(_SFPBScoreboardCardSection *)self title];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"title"];
  }
  if (self->_type)
  {
    v38 = [(_SFPBScoreboardCardSection *)self type];
    v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"type"];
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
  NSUInteger v11 = v10 ^ [(NSString *)self->_title hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_subtitle hash];
  unint64_t v13 = v12 ^ [(_SFPBSportsTeam *)self->_team1 hash];
  unint64_t v14 = v13 ^ [(_SFPBSportsTeam *)self->_team2 hash];
  NSUInteger v15 = v9 ^ v14 ^ [(NSString *)self->_accessibilityDescription hash];
  return v15 ^ [(NSString *)self->_eventStatus hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_61;
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v7 = [(_SFPBScoreboardCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBScoreboardCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v12 = [(_SFPBScoreboardCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBScoreboardCardSection *)self punchoutPickerTitle];
    NSUInteger v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v17 = [(_SFPBScoreboardCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_SFPBScoreboardCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_61;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_61;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_61;
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v25 = [(_SFPBScoreboardCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBScoreboardCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_61;
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v31 = [(_SFPBScoreboardCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBScoreboardCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v36 = [(_SFPBScoreboardCardSection *)self title];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBScoreboardCardSection *)self title];
    v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v41 = [(_SFPBScoreboardCardSection *)self subtitle];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBScoreboardCardSection *)self subtitle];
    long long v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self team1];
  uint64_t v6 = [v4 team1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v46 = [(_SFPBScoreboardCardSection *)self team1];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    long long v48 = [(_SFPBScoreboardCardSection *)self team1];
    long long v49 = [v4 team1];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self team2];
  uint64_t v6 = [v4 team2];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v51 = [(_SFPBScoreboardCardSection *)self team2];
  if (v51)
  {
    objc_super v52 = (void *)v51;
    v53 = [(_SFPBScoreboardCardSection *)self team2];
    uint64_t v54 = [v4 team2];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self accessibilityDescription];
  uint64_t v6 = [v4 accessibilityDescription];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_60;
  }
  uint64_t v56 = [(_SFPBScoreboardCardSection *)self accessibilityDescription];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(_SFPBScoreboardCardSection *)self accessibilityDescription];
    v59 = [v4 accessibilityDescription];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_61;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self eventStatus];
  uint64_t v6 = [v4 eventStatus];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_60:

    goto LABEL_61;
  }
  uint64_t v61 = [(_SFPBScoreboardCardSection *)self eventStatus];
  if (!v61)
  {

LABEL_64:
    BOOL v66 = 1;
    goto LABEL_62;
  }
  v62 = (void *)v61;
  v63 = [(_SFPBScoreboardCardSection *)self eventStatus];
  v64 = [v4 eventStatus];
  char v65 = [v63 isEqual:v64];

  if (v65) {
    goto LABEL_64;
  }
LABEL_61:
  BOOL v66 = 0;
LABEL_62:

  return v66;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBScoreboardCardSection *)self punchoutOptions];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBScoreboardCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBScoreboardCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBScoreboardCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBScoreboardCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBScoreboardCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBScoreboardCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBScoreboardCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v13 = [(_SFPBScoreboardCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBScoreboardCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v15 = [(_SFPBScoreboardCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBScoreboardCardSection *)self team1];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBScoreboardCardSection *)self team2];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBScoreboardCardSection *)self accessibilityDescription];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  v19 = [(_SFPBScoreboardCardSection *)self eventStatus];
  if (v19) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBScoreboardCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setEventStatus:(id)a3
{
  self->_eventStatus = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAccessibilityDescription:(id)a3
{
  self->_accessibilityDescription = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTeam2:(id)a3
{
}

- (void)setTeam1:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
  self->_subtitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
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