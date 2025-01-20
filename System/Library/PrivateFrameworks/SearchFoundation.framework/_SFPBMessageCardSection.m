@interface _SFPBMessageCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)messageText;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBMessageAttachment)messageAttachment;
- (_SFPBMessageCardSection)initWithDictionary:(id)a3;
- (_SFPBMessageCardSection)initWithFacade:(id)a3;
- (_SFPBMessageCardSection)initWithJSON:(id)a3;
- (_SFPBURL)audioMessageURL;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)messageServiceType;
- (int)messageStatus;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setAudioMessageURL:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setMessageAttachment:(id)a3;
- (void)setMessageServiceType:(int)a3;
- (void)setMessageStatus:(int)a3;
- (void)setMessageText:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMessageCardSection

- (_SFPBMessageCardSection)initWithFacade:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMessageCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    [(_SFPBMessageCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMessageCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMessageCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMessageCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMessageCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMessageCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMessageCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMessageCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMessageCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 messageText];

    if (v24)
    {
      v25 = [v4 messageText];
      [(_SFPBMessageCardSection *)v5 setMessageText:v25];
    }
    if ([v4 hasMessageStatus]) {
      -[_SFPBMessageCardSection setMessageStatus:](v5, "setMessageStatus:", [v4 messageStatus]);
    }
    if ([v4 hasMessageServiceType]) {
      -[_SFPBMessageCardSection setMessageServiceType:](v5, "setMessageServiceType:", [v4 messageServiceType]);
    }
    v26 = [v4 audioMessageURL];

    if (v26)
    {
      v27 = [_SFPBURL alloc];
      v28 = [v4 audioMessageURL];
      v29 = [(_SFPBURL *)v27 initWithNSURL:v28];
      [(_SFPBMessageCardSection *)v5 setAudioMessageURL:v29];
    }
    v30 = [v4 messageAttachment];

    if (v30)
    {
      v31 = [_SFPBMessageAttachment alloc];
      v32 = [v4 messageAttachment];
      v33 = [(_SFPBMessageAttachment *)v31 initWithFacade:v32];
      [(_SFPBMessageCardSection *)v5 setMessageAttachment:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAttachment, 0);
  objc_storeStrong((id *)&self->_audioMessageURL, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBMessageAttachment)messageAttachment
{
  return self->_messageAttachment;
}

- (_SFPBURL)audioMessageURL
{
  return self->_audioMessageURL;
}

- (int)messageServiceType
{
  return self->_messageServiceType;
}

- (int)messageStatus
{
  return self->_messageStatus;
}

- (NSString)messageText
{
  return self->_messageText;
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

- (_SFPBMessageCardSection)initWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)_SFPBMessageCardSection;
  v5 = [(_SFPBMessageCardSection *)&v47 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v44 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMessageCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMessageCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMessageCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v42 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    long long v38 = v18;
    uint64_t v41 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMessageCardSection *)v5 setType:v22];
    }
    v40 = v14;
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    long long v36 = v21;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMessageCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"messageText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBMessageCardSection *)v5 setMessageText:v27];
    }
    long long v39 = v16;
    v28 = [v4 objectForKeyedSubscript:@"messageStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setMessageStatus:](v5, "setMessageStatus:", [v28 intValue]);
    }
    long long v37 = v19;
    v29 = [v4 objectForKeyedSubscript:@"messageServiceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMessageCardSection setMessageServiceType:](v5, "setMessageServiceType:", [v29 intValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"audioMessageURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBURL alloc] initWithDictionary:v30];
      [(_SFPBMessageCardSection *)v5 setAudioMessageURL:v31];
    }
    v32 = [v4 objectForKeyedSubscript:@"messageAttachment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBMessageAttachment alloc] initWithDictionary:v32];
      [(_SFPBMessageCardSection *)v5 setMessageAttachment:v33];
    }
    v34 = v5;
  }
  return v5;
}

- (_SFPBMessageCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMessageCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMessageCardSection *)self dictionaryRepresentation];
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
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_audioMessageURL)
  {
    id v4 = [(_SFPBMessageCardSection *)self audioMessageURL];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioMessageURL"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioMessageURL"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v7 = [(_SFPBMessageCardSection *)self backgroundColor];
    uint64_t v8 = [v7 dictionaryRepresentation];
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
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMessageCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMessageCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v11 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMessageCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_messageAttachment)
  {
    v13 = [(_SFPBMessageCardSection *)self messageAttachment];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"messageAttachment"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"messageAttachment"];
    }
  }
  if (self->_messageServiceType)
  {
    uint64_t v16 = [(_SFPBMessageCardSection *)self messageServiceType];
    if (v16 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5A2F070[v16];
    }
    [v3 setObject:v17 forKeyedSubscript:@"messageServiceType"];
  }
  if (self->_messageStatus)
  {
    uint64_t v18 = [(_SFPBMessageCardSection *)self messageStatus];
    if (v18 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E5A2F070[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"messageStatus"];
  }
  if (self->_messageText)
  {
    v20 = [(_SFPBMessageCardSection *)self messageText];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"messageText"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v23 = self->_punchoutOptions;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v30 = [(_SFPBMessageCardSection *)self punchoutPickerDismissText];
    v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v32 = [(_SFPBMessageCardSection *)self punchoutPickerTitle];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v34 = [(_SFPBMessageCardSection *)self separatorStyle];
    if (v34 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E5A2F090[v34];
    }
    [v3 setObject:v35 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_type)
  {
    long long v36 = [(_SFPBMessageCardSection *)self type];
    long long v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v16 = [(NSArray *)self->_punchoutOptions hash];
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
  NSUInteger v11 = [(NSString *)self->_messageText hash];
  uint64_t v12 = 2654435761 * self->_messageServiceType;
  uint64_t v13 = v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (2654435761 * self->_messageStatus);
  unint64_t v14 = v12 ^ [(_SFPBURL *)self->_audioMessageURL hash];
  return v13 ^ v14 ^ [(_SFPBMessageAttachment *)self->_messageAttachment hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v7 = [(_SFPBMessageCardSection *)self punchoutOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBMessageCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v12 = [(_SFPBMessageCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBMessageCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v17 = [(_SFPBMessageCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_SFPBMessageCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_48;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_48;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_48;
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v25 = [(_SFPBMessageCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBMessageCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_48;
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v31 = [(_SFPBMessageCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBMessageCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self messageText];
  uint64_t v6 = [v4 messageText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v36 = [(_SFPBMessageCardSection *)self messageText];
  if (v36)
  {
    long long v37 = (void *)v36;
    long long v38 = [(_SFPBMessageCardSection *)self messageText];
    long long v39 = [v4 messageText];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  int messageStatus = self->_messageStatus;
  if (messageStatus != [v4 messageStatus]) {
    goto LABEL_48;
  }
  int messageServiceType = self->_messageServiceType;
  if (messageServiceType != [v4 messageServiceType]) {
    goto LABEL_48;
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self audioMessageURL];
  uint64_t v6 = [v4 audioMessageURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_47;
  }
  uint64_t v43 = [(_SFPBMessageCardSection *)self audioMessageURL];
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    long long v45 = [(_SFPBMessageCardSection *)self audioMessageURL];
    long long v46 = [v4 audioMessageURL];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMessageCardSection *)self messageAttachment];
  uint64_t v6 = [v4 messageAttachment];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_47:

    goto LABEL_48;
  }
  uint64_t v48 = [(_SFPBMessageCardSection *)self messageAttachment];
  if (!v48)
  {

LABEL_51:
    BOOL v53 = 1;
    goto LABEL_49;
  }
  uint64_t v49 = (void *)v48;
  v50 = [(_SFPBMessageCardSection *)self messageAttachment];
  v51 = [v4 messageAttachment];
  char v52 = [v50 isEqual:v51];

  if (v52) {
    goto LABEL_51;
  }
LABEL_48:
  BOOL v53 = 0;
LABEL_49:

  return v53;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBMessageCardSection *)self punchoutOptions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBMessageCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMessageCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMessageCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMessageCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMessageCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMessageCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMessageCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBMessageCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBMessageCardSection *)self messageText];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMessageCardSection *)self messageStatus]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBMessageCardSection *)self messageServiceType]) {
    PBDataWriterWriteInt32Field();
  }
  v15 = [(_SFPBMessageCardSection *)self audioMessageURL];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBMessageCardSection *)self messageAttachment];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMessageCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setMessageAttachment:(id)a3
{
}

- (void)setAudioMessageURL:(id)a3
{
}

- (void)setMessageServiceType:(int)a3
{
  self->_int messageServiceType = a3;
}

- (void)setMessageStatus:(int)a3
{
  self->_int messageStatus = a3;
}

- (void)setMessageText:(id)a3
{
  self->_messageText = (NSString *)[a3 copy];
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