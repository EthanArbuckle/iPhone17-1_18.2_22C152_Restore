@interface _SFPBMediaRemoteControlCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)playbackRouteUniqueIdentifierIsEncrypted;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)playbackBundleIdentifier;
- (NSString)playbackRouteUniqueIdentifier;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBMediaRemoteControlCardSection)initWithDictionary:(id)a3;
- (_SFPBMediaRemoteControlCardSection)initWithFacade:(id)a3;
- (_SFPBMediaRemoteControlCardSection)initWithJSON:(id)a3;
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
- (void)setPlaybackBundleIdentifier:(id)a3;
- (void)setPlaybackRouteUniqueIdentifier:(id)a3;
- (void)setPlaybackRouteUniqueIdentifierIsEncrypted:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaRemoteControlCardSection

- (_SFPBMediaRemoteControlCardSection)initWithFacade:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMediaRemoteControlCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    [(_SFPBMediaRemoteControlCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMediaRemoteControlCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMediaRemoteControlCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMediaRemoteControlCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMediaRemoteControlCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMediaRemoteControlCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMediaRemoteControlCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 playbackRouteUniqueIdentifier];

    if (v24)
    {
      v25 = [v4 playbackRouteUniqueIdentifier];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPlaybackRouteUniqueIdentifier:v25];
    }
    if ([v4 hasPlaybackRouteUniqueIdentifierIsEncrypted]) {
      -[_SFPBMediaRemoteControlCardSection setPlaybackRouteUniqueIdentifierIsEncrypted:](v5, "setPlaybackRouteUniqueIdentifierIsEncrypted:", [v4 playbackRouteUniqueIdentifierIsEncrypted]);
    }
    v26 = [v4 playbackBundleIdentifier];

    if (v26)
    {
      v27 = [v4 playbackBundleIdentifier];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPlaybackBundleIdentifier:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackRouteUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSString)playbackBundleIdentifier
{
  return self->_playbackBundleIdentifier;
}

- (BOOL)playbackRouteUniqueIdentifierIsEncrypted
{
  return self->_playbackRouteUniqueIdentifierIsEncrypted;
}

- (NSString)playbackRouteUniqueIdentifier
{
  return self->_playbackRouteUniqueIdentifier;
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

- (_SFPBMediaRemoteControlCardSection)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_SFPBMediaRemoteControlCardSection;
  v5 = [(_SFPBMediaRemoteControlCardSection *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v39;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v39 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMediaRemoteControlCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaRemoteControlCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaRemoteControlCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    long long v33 = v19;
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaRemoteControlCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v34 = v18;
    v37 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMediaRemoteControlCardSection *)v5 setType:v22];
    }
    v36 = v14;
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaRemoteControlCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v35 = v16;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMediaRemoteControlCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"playbackRouteUniqueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPlaybackRouteUniqueIdentifier:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"playbackRouteUniqueIdentifierIsEncrypted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaRemoteControlCardSection setPlaybackRouteUniqueIdentifierIsEncrypted:](v5, "setPlaybackRouteUniqueIdentifierIsEncrypted:", [v28 BOOLValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"playbackBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v30 = (void *)[v29 copy];
      [(_SFPBMediaRemoteControlCardSection *)v5 setPlaybackBundleIdentifier:v30];
    }
    long long v31 = v5;
  }
  return v5;
}

- (_SFPBMediaRemoteControlCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaRemoteControlCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaRemoteControlCardSection *)self dictionaryRepresentation];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBMediaRemoteControlCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaRemoteControlCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaRemoteControlCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaRemoteControlCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_playbackBundleIdentifier)
  {
    uint64_t v10 = [(_SFPBMediaRemoteControlCardSection *)self playbackBundleIdentifier];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"playbackBundleIdentifier"];
  }
  if (self->_playbackRouteUniqueIdentifier)
  {
    uint64_t v12 = [(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"playbackRouteUniqueIdentifier"];
  }
  if (self->_playbackRouteUniqueIdentifierIsEncrypted)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaRemoteControlCardSection playbackRouteUniqueIdentifierIsEncrypted](self, "playbackRouteUniqueIdentifierIsEncrypted"));
    [v3 setObject:v14 forKeyedSubscript:@"playbackRouteUniqueIdentifierIsEncrypted"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = self->_punchoutOptions;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dictionaryRepresentation];
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v23 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerDismissText];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v25 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerTitle];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v27 = [(_SFPBMediaRemoteControlCardSection *)self separatorStyle];
    if (v27 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E5A2F090[v27];
    }
    [v3 setObject:v28 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_type)
  {
    v29 = [(_SFPBMediaRemoteControlCardSection *)self type];
    long long v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v14 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v4 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_type hash];
  uint64_t v9 = 2654435761 * self->_separatorStyle;
  unint64_t v10 = [(_SFPBColor *)self->_backgroundColor hash];
  NSUInteger v11 = [(NSString *)self->_playbackRouteUniqueIdentifier hash];
  if (self->_playbackRouteUniqueIdentifierIsEncrypted) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(NSString *)self->_playbackBundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_SFPBMediaRemoteControlCardSection *)self punchoutOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBMediaRemoteControlCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_42;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_42;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v25 = [(_SFPBMediaRemoteControlCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    uint64_t v27 = [(_SFPBMediaRemoteControlCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v31 = [(_SFPBMediaRemoteControlCardSection *)self backgroundColor];
  if (v31)
  {
    long long v32 = (void *)v31;
    long long v33 = [(_SFPBMediaRemoteControlCardSection *)self backgroundColor];
    long long v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifier];
  uint64_t v6 = [v4 playbackRouteUniqueIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v36 = [(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifier];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    long long v38 = [(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifier];
    long long v39 = [v4 playbackRouteUniqueIdentifier];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int playbackRouteUniqueIdentifierIsEncrypted = self->_playbackRouteUniqueIdentifierIsEncrypted;
  if (playbackRouteUniqueIdentifierIsEncrypted != [v4 playbackRouteUniqueIdentifierIsEncrypted])goto LABEL_42; {
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self playbackBundleIdentifier];
  }
  uint64_t v6 = [v4 playbackBundleIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v42 = [(_SFPBMediaRemoteControlCardSection *)self playbackBundleIdentifier];
  if (!v42)
  {

LABEL_45:
    BOOL v47 = 1;
    goto LABEL_43;
  }
  v43 = (void *)v42;
  uint64_t v44 = [(_SFPBMediaRemoteControlCardSection *)self playbackBundleIdentifier];
  v45 = [v4 playbackBundleIdentifier];
  char v46 = [v44 isEqual:v45];

  if (v46) {
    goto LABEL_45;
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBMediaRemoteControlCardSection *)self punchoutOptions];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMediaRemoteControlCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaRemoteControlCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMediaRemoteControlCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMediaRemoteControlCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMediaRemoteControlCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaRemoteControlCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  v13 = [(_SFPBMediaRemoteControlCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifier];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaRemoteControlCardSection *)self playbackRouteUniqueIdentifierIsEncrypted])
  {
    PBDataWriterWriteBOOLField();
  }
  v15 = [(_SFPBMediaRemoteControlCardSection *)self playbackBundleIdentifier];
  if (v15) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaRemoteControlCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setPlaybackBundleIdentifier:(id)a3
{
  self->_playbackBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPlaybackRouteUniqueIdentifierIsEncrypted:(BOOL)a3
{
  self->_int playbackRouteUniqueIdentifierIsEncrypted = a3;
}

- (void)setPlaybackRouteUniqueIdentifier:(id)a3
{
  self->_playbackRouteUniqueIdentifier = (NSString *)[a3 copy];
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