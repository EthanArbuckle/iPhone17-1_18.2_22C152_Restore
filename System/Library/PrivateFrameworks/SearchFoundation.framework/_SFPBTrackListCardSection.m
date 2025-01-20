@interface _SFPBTrackListCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSArray)tracks;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBTrackListCardSection)initWithDictionary:(id)a3;
- (_SFPBTrackListCardSection)initWithFacade:(id)a3;
- (_SFPBTrackListCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)tracksAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)tracksCount;
- (void)addPunchoutOptions:(id)a3;
- (void)addTracks:(id)a3;
- (void)clearPunchoutOptions;
- (void)clearTracks;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTracks:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTrackListCardSection

- (_SFPBTrackListCardSection)initWithFacade:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTrackListCardSection *)self init];
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

    [(_SFPBTrackListCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBTrackListCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBTrackListCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBTrackListCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBTrackListCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBTrackListCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBTrackListCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBTrackListCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBTrackListCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBTrackListCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(_SFPBTrackListCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 tracks];
    if (v28) {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v29 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v30 = objc_msgSend(v4, "tracks", 0);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [[_SFPBTrack alloc] initWithFacade:*(void *)(*((void *)&v38 + 1) + 8 * j)];
          if (v35) {
            [v29 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v32);
    }

    [(_SFPBTrackListCardSection *)v5 setTracks:v29];
    v36 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)tracks
{
  return self->_tracks;
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

- (_SFPBTrackListCardSection)initWithDictionary:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_SFPBTrackListCardSection;
  v5 = [(_SFPBTrackListCardSection *)&v62 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v59 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBTrackListCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    v53 = v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBTrackListCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBTrackListCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    v52 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTrackListCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v51 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTrackListCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v50 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTrackListCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v49 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBTrackListCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTrackListCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    uint64_t v48 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBTrackListCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [v26 copy];
      v28 = v26;
      id v29 = v23;
      v30 = v16;
      uint64_t v31 = (void *)v27;
      [(_SFPBTrackListCardSection *)v5 setTitle:v27];

      v16 = v30;
      v23 = v29;
      v26 = v28;
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    v47 = v32;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = (void *)[v32 copy];
      [(_SFPBTrackListCardSection *)v5 setSubtitle:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"tracks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = v23;
      long long v45 = v16;
      v46 = v6;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v55 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v54 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v41 = [[_SFPBTrack alloc] initWithDictionary:v40];
              [(_SFPBTrackListCardSection *)v5 addTracks:v41];
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v37);
      }

      v16 = v45;
      v6 = v46;
      v23 = v44;
    }
    long long v42 = v5;
  }
  return v5;
}

- (_SFPBTrackListCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTrackListCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTrackListCardSection *)self dictionaryRepresentation];
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBTrackListCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTrackListCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTrackListCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTrackListCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v11 = self->_punchoutOptions;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v18 = [(_SFPBTrackListCardSection *)self punchoutPickerDismissText];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v20 = [(_SFPBTrackListCardSection *)self punchoutPickerTitle];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v22 = [(_SFPBTrackListCardSection *)self separatorStyle];
    if (v22 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E5A2F090[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    uint64_t v24 = [(_SFPBTrackListCardSection *)self subtitle];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"subtitle"];
  }
  if (self->_title)
  {
    v26 = [(_SFPBTrackListCardSection *)self title];
    uint64_t v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"title"];
  }
  if ([(NSArray *)self->_tracks count])
  {
    v28 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = self->_tracks;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
          if (v34)
          {
            [v28 addObject:v34];
          }
          else
          {
            id v35 = [MEMORY[0x1E4F1CA98] null];
            [v28 addObject:v35];
          }
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKeyedSubscript:@"tracks"];
  }
  if (self->_type)
  {
    uint64_t v36 = [(_SFPBTrackListCardSection *)self type];
    uint64_t v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"type"];
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
  return v9 ^ v12 ^ [(NSArray *)self->_tracks hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBTrackListCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBTrackListCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBTrackListCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBTrackListCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBTrackListCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBTrackListCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_46;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_46;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBTrackListCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    uint64_t v27 = [(_SFPBTrackListCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBTrackListCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBTrackListCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBTrackListCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBTrackListCardSection *)self title];
    long long v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBTrackListCardSection *)self subtitle];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBTrackListCardSection *)self subtitle];
    long long v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self tracks];
  uint64_t v6 = [v4 tracks];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBTrackListCardSection *)self tracks];
  if (!v46)
  {

LABEL_49:
    BOOL v51 = 1;
    goto LABEL_47;
  }
  v47 = (void *)v46;
  uint64_t v48 = [(_SFPBTrackListCardSection *)self tracks];
  uint64_t v49 = [v4 tracks];
  char v50 = [v48 isEqual:v49];

  if (v50) {
    goto LABEL_49;
  }
LABEL_46:
  BOOL v51 = 0;
LABEL_47:

  return v51;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBTrackListCardSection *)self punchoutOptions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBTrackListCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBTrackListCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTrackListCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTrackListCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTrackListCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBTrackListCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTrackListCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBTrackListCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBTrackListCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  v15 = [(_SFPBTrackListCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBTrackListCardSection *)self tracks];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTrackListCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)tracksAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_tracks objectAtIndexedSubscript:a3];
}

- (unint64_t)tracksCount
{
  return [(NSArray *)self->_tracks count];
}

- (void)addTracks:(id)a3
{
  id v4 = a3;
  tracks = self->_tracks;
  id v8 = v4;
  if (!tracks)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tracks;
    self->_tracks = v6;

    id v4 = v8;
    tracks = self->_tracks;
  }
  [(NSArray *)tracks addObject:v4];
}

- (void)clearTracks
{
}

- (void)setTracks:(id)a3
{
  self->_tracks = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
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