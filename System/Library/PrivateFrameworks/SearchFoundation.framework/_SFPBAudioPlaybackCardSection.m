@interface _SFPBAudioPlaybackCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)playCommands;
- (NSArray)punchoutOptions;
- (NSArray)stopCommands;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBAudioPlaybackCardSection)initWithDictionary:(id)a3;
- (_SFPBAudioPlaybackCardSection)initWithFacade:(id)a3;
- (_SFPBAudioPlaybackCardSection)initWithJSON:(id)a3;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)thumbnail;
- (_SFPBRichText)detailText;
- (_SFPBRichText)subtitle;
- (_SFPBRichText)title;
- (id)dictionaryRepresentation;
- (id)playCommandsAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)stopCommandsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (int)state;
- (unint64_t)hash;
- (unint64_t)playCommandsCount;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)stopCommandsCount;
- (void)addPlayCommands:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)addStopCommands:(id)a3;
- (void)clearPlayCommands;
- (void)clearPunchoutOptions;
- (void)clearStopCommands;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setDetailText:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPlayCommands:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setState:(int)a3;
- (void)setStopCommands:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAudioPlaybackCardSection

- (_SFPBAudioPlaybackCardSection)initWithFacade:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBAudioPlaybackCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v68 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v67 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v10);
    }

    [(_SFPBAudioPlaybackCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBAudioPlaybackCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBAudioPlaybackCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBAudioPlaybackCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBAudioPlaybackCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBAudioPlaybackCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBAudioPlaybackCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBAudioPlaybackCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBAudioPlaybackCardSection *)v5 setBackgroundColor:v23];
    }
    if ([v4 hasState]) {
      -[_SFPBAudioPlaybackCardSection setState:](v5, "setState:", [v4 state]);
    }
    v24 = [v4 playCommands];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v26 = [v4 playCommands];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v64 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBAbstractCommand alloc] initWithFacade:*(void *)(*((void *)&v63 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }
      while (v28);
    }

    [(_SFPBAudioPlaybackCardSection *)v5 setPlayCommands:v25];
    v32 = [v4 stopCommands];
    v58 = v5;
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v34 = [v4 stopCommands];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v60 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[_SFPBAbstractCommand alloc] initWithFacade:*(void *)(*((void *)&v59 + 1) + 8 * k)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v71 count:16];
      }
      while (v36);
    }

    v5 = v58;
    [(_SFPBAudioPlaybackCardSection *)v58 setStopCommands:v33];
    v40 = [v4 detailText];

    if (v40)
    {
      v41 = [_SFPBRichText alloc];
      v42 = [v4 detailText];
      v43 = [(_SFPBRichText *)v41 initWithFacade:v42];
      [(_SFPBAudioPlaybackCardSection *)v58 setDetailText:v43];
    }
    v44 = [v4 title];

    if (v44)
    {
      v45 = [_SFPBRichText alloc];
      v46 = [v4 title];
      v47 = [(_SFPBRichText *)v45 initWithFacade:v46];
      [(_SFPBAudioPlaybackCardSection *)v58 setTitle:v47];
    }
    v48 = [v4 subtitle];

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      v50 = [v4 subtitle];
      v51 = [(_SFPBRichText *)v49 initWithFacade:v50];
      [(_SFPBAudioPlaybackCardSection *)v58 setSubtitle:v51];
    }
    v52 = [v4 thumbnail];

    if (v52)
    {
      v53 = [_SFPBImage alloc];
      v54 = [v4 thumbnail];
      v55 = [(_SFPBImage *)v53 initWithFacade:v54];
      [(_SFPBAudioPlaybackCardSection *)v58 setThumbnail:v55];
    }
    v56 = v58;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_stopCommands, 0);
  objc_storeStrong((id *)&self->_playCommands, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRichText)subtitle
{
  return self->_subtitle;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBRichText)detailText
{
  return self->_detailText;
}

- (NSArray)stopCommands
{
  return self->_stopCommands;
}

- (NSArray)playCommands
{
  return self->_playCommands;
}

- (int)state
{
  return self->_state;
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

- (_SFPBAudioPlaybackCardSection)initWithDictionary:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)_SFPBAudioPlaybackCardSection;
  v5 = [(_SFPBAudioPlaybackCardSection *)&v79 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v75 objects:v82 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v76 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBAudioPlaybackCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v75 objects:v82 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBAudioPlaybackCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v63 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBAudioPlaybackCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v62 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioPlaybackCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioPlaybackCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioPlaybackCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    long long v65 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBAudioPlaybackCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioPlaybackCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v6;
      v26 = v24;
      uint64_t v27 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBAudioPlaybackCardSection *)v5 setBackgroundColor:v27];

      v24 = v26;
      v6 = v25;
    }
    v58 = v23;
    long long v59 = v20;
    long long v60 = v19;
    long long v61 = v18;
    uint64_t v28 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioPlaybackCardSection setState:](v5, "setState:", [v28 intValue]);
    }
    v57 = v28;
    long long v64 = v6;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"playCommands"];
    objc_opt_class();
    id v66 = v4;
    if (objc_opt_isKindOfClass())
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v81 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v72 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v36 = [[_SFPBAbstractCommand alloc] initWithDictionary:v35];
              [(_SFPBAudioPlaybackCardSection *)v5 addPlayCommands:v36];
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v71 objects:v81 count:16];
        }
        while (v32);
      }
    }
    uint64_t v37 = [v4 objectForKeyedSubscript:@"stopCommands"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = v29;
      v38 = v24;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v39 = v37;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v67 objects:v80 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v68;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v68 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v67 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v45 = [[_SFPBAbstractCommand alloc] initWithDictionary:v44];
              [(_SFPBAudioPlaybackCardSection *)v5 addStopCommands:v45];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v67 objects:v80 count:16];
        }
        while (v41);
      }

      v24 = v38;
      uint64_t v29 = v56;
    }
    v46 = [v4 objectForKeyedSubscript:@"detailText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [[_SFPBRichText alloc] initWithDictionary:v46];
      [(_SFPBAudioPlaybackCardSection *)v5 setDetailText:v47];
    }
    v48 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[_SFPBRichText alloc] initWithDictionary:v48];
      [(_SFPBAudioPlaybackCardSection *)v5 setTitle:v49];
    }
    v50 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = [[_SFPBRichText alloc] initWithDictionary:v50];
      [(_SFPBAudioPlaybackCardSection *)v5 setSubtitle:v51];

      id v4 = v66;
    }
    v52 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v53 = [[_SFPBImage alloc] initWithDictionary:v52];
      [(_SFPBAudioPlaybackCardSection *)v5 setThumbnail:v53];
    }
    v54 = v5;

    id v4 = v66;
  }

  return v5;
}

- (_SFPBAudioPlaybackCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAudioPlaybackCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAudioPlaybackCardSection *)self dictionaryRepresentation];
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
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBAudioPlaybackCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAudioPlaybackCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_detailText)
  {
    uint64_t v8 = [(_SFPBAudioPlaybackCardSection *)self detailText];
    uint64_t v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"detailText"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"detailText"];
    }
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAudioPlaybackCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v11 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBAudioPlaybackCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_playCommands count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v14 = self->_playCommands;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v66 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v65 + 1) + 8 * i) dictionaryRepresentation];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v65 objects:v71 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"playCommands"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v22 = self->_punchoutOptions;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v62 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [*(id *)(*((void *)&v61 + 1) + 8 * j) dictionaryRepresentation];
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
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    uint64_t v29 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerDismissText];
    id v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v31 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerTitle];
    uint64_t v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v33 = [(_SFPBAudioPlaybackCardSection *)self separatorStyle];
    if (v33 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E5A2F090[v33];
    }
    [v3 setObject:v34 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_state)
  {
    uint64_t v35 = [(_SFPBAudioPlaybackCardSection *)self state];
    if (v35 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
      uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v36 = off_1E5A2F090[v35];
    }
    [v3 setObject:v36 forKeyedSubscript:@"state"];
  }
  if ([(NSArray *)self->_stopCommands count])
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v38 = self->_stopCommands;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v57 + 1) + 8 * k) dictionaryRepresentation];
          if (v43)
          {
            [v37 addObject:v43];
          }
          else
          {
            uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
            [v37 addObject:v44];
          }
        }
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKeyedSubscript:@"stopCommands"];
  }
  if (self->_subtitle)
  {
    v45 = [(_SFPBAudioPlaybackCardSection *)self subtitle];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"subtitle"];
    }
  }
  if (self->_thumbnail)
  {
    v48 = [(_SFPBAudioPlaybackCardSection *)self thumbnail];
    v49 = [v48 dictionaryRepresentation];
    if (v49)
    {
      [v3 setObject:v49 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v50 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v50 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_title)
  {
    v51 = [(_SFPBAudioPlaybackCardSection *)self title];
    v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"title"];
    }
    else
    {
      v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"title"];
    }
  }
  if (self->_type)
  {
    v54 = [(_SFPBAudioPlaybackCardSection *)self type];
    v55 = (void *)[v54 copy];
    [v3 setObject:v55 forKeyedSubscript:@"type"];
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
  NSUInteger v9 = [(NSString *)self->_type hash];
  uint64_t v10 = 2654435761 * self->_separatorStyle;
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(_SFPBColor *)self->_backgroundColor hash] ^ (2654435761 * self->_state);
  uint64_t v12 = [(NSArray *)self->_playCommands hash];
  uint64_t v13 = v12 ^ [(NSArray *)self->_stopCommands hash];
  unint64_t v14 = v13 ^ [(_SFPBRichText *)self->_detailText hash];
  unint64_t v15 = v14 ^ [(_SFPBRichText *)self->_title hash];
  unint64_t v16 = v15 ^ [(_SFPBRichText *)self->_subtitle hash];
  return v11 ^ v16 ^ [(_SFPBImage *)self->_thumbnail hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v7 = [(_SFPBAudioPlaybackCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBAudioPlaybackCardSection *)self punchoutOptions];
    uint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v12 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v17 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_62;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_62;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_62;
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v25 = [(_SFPBAudioPlaybackCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    uint64_t v27 = [(_SFPBAudioPlaybackCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_62;
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v31 = [(_SFPBAudioPlaybackCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBAudioPlaybackCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int state = self->_state;
  if (state != [v4 state]) {
    goto LABEL_62;
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self playCommands];
  uint64_t v6 = [v4 playCommands];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v37 = [(_SFPBAudioPlaybackCardSection *)self playCommands];
  if (v37)
  {
    v38 = (void *)v37;
    uint64_t v39 = [(_SFPBAudioPlaybackCardSection *)self playCommands];
    uint64_t v40 = [v4 playCommands];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self stopCommands];
  uint64_t v6 = [v4 stopCommands];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v42 = [(_SFPBAudioPlaybackCardSection *)self stopCommands];
  if (v42)
  {
    v43 = (void *)v42;
    uint64_t v44 = [(_SFPBAudioPlaybackCardSection *)self stopCommands];
    v45 = [v4 stopCommands];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self detailText];
  uint64_t v6 = [v4 detailText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v47 = [(_SFPBAudioPlaybackCardSection *)self detailText];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBAudioPlaybackCardSection *)self detailText];
    v50 = [v4 detailText];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v52 = [(_SFPBAudioPlaybackCardSection *)self title];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_SFPBAudioPlaybackCardSection *)self title];
    v55 = [v4 title];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v57 = [(_SFPBAudioPlaybackCardSection *)self subtitle];
  if (v57)
  {
    long long v58 = (void *)v57;
    long long v59 = [(_SFPBAudioPlaybackCardSection *)self subtitle];
    long long v60 = [v4 subtitle];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_61:

    goto LABEL_62;
  }
  uint64_t v62 = [(_SFPBAudioPlaybackCardSection *)self thumbnail];
  if (!v62)
  {

LABEL_65:
    BOOL v67 = 1;
    goto LABEL_63;
  }
  long long v63 = (void *)v62;
  long long v64 = [(_SFPBAudioPlaybackCardSection *)self thumbnail];
  long long v65 = [v4 thumbnail];
  char v66 = [v64 isEqual:v65];

  if (v66) {
    goto LABEL_65;
  }
LABEL_62:
  BOOL v67 = 0;
LABEL_63:

  return v67;
}

- (void)writeTo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBAudioPlaybackCardSection *)self punchoutOptions];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBAudioPlaybackCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAudioPlaybackCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBAudioPlaybackCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBAudioPlaybackCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBAudioPlaybackCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAudioPlaybackCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBAudioPlaybackCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBAudioPlaybackCardSection *)self state]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v14 = [(_SFPBAudioPlaybackCardSection *)self playCommands];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }

  v19 = [(_SFPBAudioPlaybackCardSection *)self stopCommands];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v21);
  }

  uint64_t v24 = [(_SFPBAudioPlaybackCardSection *)self detailText];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v25 = [(_SFPBAudioPlaybackCardSection *)self title];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }

  v26 = [(_SFPBAudioPlaybackCardSection *)self subtitle];
  if (v26) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v27 = [(_SFPBAudioPlaybackCardSection *)self thumbnail];
  if (v27) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAudioPlaybackCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setThumbnail:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setDetailText:(id)a3
{
}

- (id)stopCommandsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_stopCommands objectAtIndexedSubscript:a3];
}

- (unint64_t)stopCommandsCount
{
  return [(NSArray *)self->_stopCommands count];
}

- (void)addStopCommands:(id)a3
{
  id v4 = a3;
  stopCommands = self->_stopCommands;
  id v8 = v4;
  if (!stopCommands)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_stopCommands;
    self->_stopCommands = v6;

    id v4 = v8;
    stopCommands = self->_stopCommands;
  }
  [(NSArray *)stopCommands addObject:v4];
}

- (void)clearStopCommands
{
}

- (void)setStopCommands:(id)a3
{
  self->_stopCommands = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)playCommandsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_playCommands objectAtIndexedSubscript:a3];
}

- (unint64_t)playCommandsCount
{
  return [(NSArray *)self->_playCommands count];
}

- (void)addPlayCommands:(id)a3
{
  id v4 = a3;
  playCommands = self->_playCommands;
  id v8 = v4;
  if (!playCommands)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_playCommands;
    self->_playCommands = v6;

    id v4 = v8;
    playCommands = self->_playCommands;
  }
  [(NSArray *)playCommands addObject:v4];
}

- (void)clearPlayCommands
{
}

- (void)setPlayCommands:(id)a3
{
  self->_playCommands = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setState:(int)a3
{
  self->_int state = a3;
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