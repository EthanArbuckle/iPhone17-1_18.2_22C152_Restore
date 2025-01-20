@interface _SFPBWatchListItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaContainer;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)addToUpNextText;
- (NSString)addedToUpNextText;
- (NSString)continueInTextFormat;
- (NSString)inUpNextText;
- (NSString)installButtonTitle;
- (NSString)openButtonTitle;
- (NSString)purchaseOfferTextFormat;
- (NSString)seasonEpisodeTextFormat;
- (NSString)watchListIdentifier;
- (NSString)watchLiveTextFormat;
- (_SFPBWatchListItem)initWithDictionary:(id)a3;
- (_SFPBWatchListItem)initWithFacade:(id)a3;
- (_SFPBWatchListItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)setAddToUpNextText:(id)a3;
- (void)setAddedToUpNextText:(id)a3;
- (void)setContinueInTextFormat:(id)a3;
- (void)setInUpNextText:(id)a3;
- (void)setInstallButtonTitle:(id)a3;
- (void)setIsMediaContainer:(BOOL)a3;
- (void)setOpenButtonTitle:(id)a3;
- (void)setPurchaseOfferTextFormat:(id)a3;
- (void)setSeasonEpisodeTextFormat:(id)a3;
- (void)setType:(int)a3;
- (void)setWatchListIdentifier:(id)a3;
- (void)setWatchLiveTextFormat:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBWatchListItem

- (_SFPBWatchListItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBWatchListItem *)self init];
  if (v5)
  {
    v6 = [v4 watchListIdentifier];

    if (v6)
    {
      v7 = [v4 watchListIdentifier];
      [(_SFPBWatchListItem *)v5 setWatchListIdentifier:v7];
    }
    v8 = [v4 seasonEpisodeTextFormat];

    if (v8)
    {
      v9 = [v4 seasonEpisodeTextFormat];
      [(_SFPBWatchListItem *)v5 setSeasonEpisodeTextFormat:v9];
    }
    v10 = [v4 continueInTextFormat];

    if (v10)
    {
      v11 = [v4 continueInTextFormat];
      [(_SFPBWatchListItem *)v5 setContinueInTextFormat:v11];
    }
    v12 = [v4 openButtonTitle];

    if (v12)
    {
      v13 = [v4 openButtonTitle];
      [(_SFPBWatchListItem *)v5 setOpenButtonTitle:v13];
    }
    v14 = [v4 installButtonTitle];

    if (v14)
    {
      v15 = [v4 installButtonTitle];
      [(_SFPBWatchListItem *)v5 setInstallButtonTitle:v15];
    }
    v16 = [v4 purchaseOfferTextFormat];

    if (v16)
    {
      v17 = [v4 purchaseOfferTextFormat];
      [(_SFPBWatchListItem *)v5 setPurchaseOfferTextFormat:v17];
    }
    v18 = [v4 inUpNextText];

    if (v18)
    {
      v19 = [v4 inUpNextText];
      [(_SFPBWatchListItem *)v5 setInUpNextText:v19];
    }
    v20 = [v4 addToUpNextText];

    if (v20)
    {
      v21 = [v4 addToUpNextText];
      [(_SFPBWatchListItem *)v5 setAddToUpNextText:v21];
    }
    v22 = [v4 addedToUpNextText];

    if (v22)
    {
      v23 = [v4 addedToUpNextText];
      [(_SFPBWatchListItem *)v5 setAddedToUpNextText:v23];
    }
    v24 = [v4 watchLiveTextFormat];

    if (v24)
    {
      v25 = [v4 watchLiveTextFormat];
      [(_SFPBWatchListItem *)v5 setWatchLiveTextFormat:v25];
    }
    if ([v4 hasIsMediaContainer]) {
      -[_SFPBWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", [v4 isMediaContainer]);
    }
    if ([v4 hasType]) {
      -[_SFPBWatchListItem setType:](v5, "setType:", [v4 type]);
    }
    v26 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchLiveTextFormat, 0);
  objc_storeStrong((id *)&self->_addedToUpNextText, 0);
  objc_storeStrong((id *)&self->_addToUpNextText, 0);
  objc_storeStrong((id *)&self->_inUpNextText, 0);
  objc_storeStrong((id *)&self->_purchaseOfferTextFormat, 0);
  objc_storeStrong((id *)&self->_installButtonTitle, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_continueInTextFormat, 0);
  objc_storeStrong((id *)&self->_seasonEpisodeTextFormat, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
}

- (int)type
{
  return self->_type;
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (NSString)watchLiveTextFormat
{
  return self->_watchLiveTextFormat;
}

- (NSString)addedToUpNextText
{
  return self->_addedToUpNextText;
}

- (NSString)addToUpNextText
{
  return self->_addToUpNextText;
}

- (NSString)inUpNextText
{
  return self->_inUpNextText;
}

- (NSString)purchaseOfferTextFormat
{
  return self->_purchaseOfferTextFormat;
}

- (NSString)installButtonTitle
{
  return self->_installButtonTitle;
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (NSString)continueInTextFormat
{
  return self->_continueInTextFormat;
}

- (NSString)seasonEpisodeTextFormat
{
  return self->_seasonEpisodeTextFormat;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (_SFPBWatchListItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_SFPBWatchListItem;
  v5 = [(_SFPBWatchListItem *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"watchListIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBWatchListItem *)v5 setWatchListIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"seasonEpisodeTextFormat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBWatchListItem *)v5 setSeasonEpisodeTextFormat:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"continueInTextFormat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBWatchListItem *)v5 setContinueInTextFormat:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"openButtonTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBWatchListItem *)v5 setOpenButtonTitle:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"installButtonTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBWatchListItem *)v5 setInstallButtonTitle:v15];
    }
    v32 = v14;
    v16 = [v4 objectForKeyedSubscript:@"purchaseOfferTextFormat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBWatchListItem *)v5 setPurchaseOfferTextFormat:v17];
    }
    v31 = v16;
    v18 = [v4 objectForKeyedSubscript:@"inUpNextText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(_SFPBWatchListItem *)v5 setInUpNextText:v19];
    }
    v34 = v6;
    v20 = [v4 objectForKeyedSubscript:@"addToUpNextText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(_SFPBWatchListItem *)v5 setAddToUpNextText:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"addedToUpNextText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBWatchListItem *)v5 setAddedToUpNextText:v23];
    }
    v33 = v12;
    v24 = [v4 objectForKeyedSubscript:@"watchLiveTextFormat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBWatchListItem *)v5 setWatchLiveTextFormat:v25];
    }
    v26 = v8;
    v27 = [v4 objectForKeyedSubscript:@"isMediaContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", [v27 BOOLValue]);
    }
    v28 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBWatchListItem setType:](v5, "setType:", [v28 intValue]);
    }
    v29 = v5;
  }
  return v5;
}

- (_SFPBWatchListItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBWatchListItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBWatchListItem *)self dictionaryRepresentation];
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
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_addToUpNextText)
  {
    id v4 = [(_SFPBWatchListItem *)self addToUpNextText];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"addToUpNextText"];
  }
  if (self->_addedToUpNextText)
  {
    v6 = [(_SFPBWatchListItem *)self addedToUpNextText];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"addedToUpNextText"];
  }
  if (self->_continueInTextFormat)
  {
    v8 = [(_SFPBWatchListItem *)self continueInTextFormat];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"continueInTextFormat"];
  }
  if (self->_inUpNextText)
  {
    v10 = [(_SFPBWatchListItem *)self inUpNextText];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"inUpNextText"];
  }
  if (self->_installButtonTitle)
  {
    v12 = [(_SFPBWatchListItem *)self installButtonTitle];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"installButtonTitle"];
  }
  if (self->_isMediaContainer)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBWatchListItem isMediaContainer](self, "isMediaContainer"));
    [v3 setObject:v14 forKeyedSubscript:@"isMediaContainer"];
  }
  if (self->_openButtonTitle)
  {
    v15 = [(_SFPBWatchListItem *)self openButtonTitle];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"openButtonTitle"];
  }
  if (self->_purchaseOfferTextFormat)
  {
    v17 = [(_SFPBWatchListItem *)self purchaseOfferTextFormat];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"purchaseOfferTextFormat"];
  }
  if (self->_seasonEpisodeTextFormat)
  {
    v19 = [(_SFPBWatchListItem *)self seasonEpisodeTextFormat];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"seasonEpisodeTextFormat"];
  }
  if (self->_type)
  {
    uint64_t v21 = [(_SFPBWatchListItem *)self type];
    if (v21 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A2F090[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"type"];
  }
  if (self->_watchListIdentifier)
  {
    v23 = [(_SFPBWatchListItem *)self watchListIdentifier];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"watchListIdentifier"];
  }
  if (self->_watchLiveTextFormat)
  {
    v25 = [(_SFPBWatchListItem *)self watchLiveTextFormat];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"watchLiveTextFormat"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_watchListIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_seasonEpisodeTextFormat hash];
  NSUInteger v5 = [(NSString *)self->_continueInTextFormat hash];
  NSUInteger v6 = [(NSString *)self->_openButtonTitle hash];
  NSUInteger v7 = [(NSString *)self->_installButtonTitle hash];
  NSUInteger v8 = [(NSString *)self->_purchaseOfferTextFormat hash];
  NSUInteger v9 = [(NSString *)self->_inUpNextText hash];
  NSUInteger v10 = [(NSString *)self->_addToUpNextText hash];
  NSUInteger v11 = [(NSString *)self->_addedToUpNextText hash];
  NSUInteger v12 = [(NSString *)self->_watchLiveTextFormat hash];
  if (self->_isMediaContainer) {
    uint64_t v13 = 2654435761;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ (2654435761 * self->_type);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self watchListIdentifier];
  NSUInteger v6 = [v4 watchListIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(_SFPBWatchListItem *)self watchListIdentifier];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBWatchListItem *)self watchListIdentifier];
    NSUInteger v10 = [v4 watchListIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self seasonEpisodeTextFormat];
  NSUInteger v6 = [v4 seasonEpisodeTextFormat];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v12 = [(_SFPBWatchListItem *)self seasonEpisodeTextFormat];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_SFPBWatchListItem *)self seasonEpisodeTextFormat];
    v15 = [v4 seasonEpisodeTextFormat];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self continueInTextFormat];
  NSUInteger v6 = [v4 continueInTextFormat];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v17 = [(_SFPBWatchListItem *)self continueInTextFormat];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBWatchListItem *)self continueInTextFormat];
    v20 = [v4 continueInTextFormat];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self openButtonTitle];
  NSUInteger v6 = [v4 openButtonTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v22 = [(_SFPBWatchListItem *)self openButtonTitle];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBWatchListItem *)self openButtonTitle];
    v25 = [v4 openButtonTitle];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self installButtonTitle];
  NSUInteger v6 = [v4 installButtonTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v27 = [(_SFPBWatchListItem *)self installButtonTitle];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBWatchListItem *)self installButtonTitle];
    v30 = [v4 installButtonTitle];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self purchaseOfferTextFormat];
  NSUInteger v6 = [v4 purchaseOfferTextFormat];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v32 = [(_SFPBWatchListItem *)self purchaseOfferTextFormat];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_SFPBWatchListItem *)self purchaseOfferTextFormat];
    objc_super v35 = [v4 purchaseOfferTextFormat];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self inUpNextText];
  NSUInteger v6 = [v4 inUpNextText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v37 = [(_SFPBWatchListItem *)self inUpNextText];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBWatchListItem *)self inUpNextText];
    v40 = [v4 inUpNextText];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self addToUpNextText];
  NSUInteger v6 = [v4 addToUpNextText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v42 = [(_SFPBWatchListItem *)self addToUpNextText];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBWatchListItem *)self addToUpNextText];
    v45 = [v4 addToUpNextText];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self addedToUpNextText];
  NSUInteger v6 = [v4 addedToUpNextText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v47 = [(_SFPBWatchListItem *)self addedToUpNextText];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBWatchListItem *)self addedToUpNextText];
    v50 = [v4 addedToUpNextText];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBWatchListItem *)self watchLiveTextFormat];
  NSUInteger v6 = [v4 watchLiveTextFormat];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v52 = [(_SFPBWatchListItem *)self watchLiveTextFormat];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_SFPBWatchListItem *)self watchLiveTextFormat];
    v55 = [v4 watchLiveTextFormat];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int isMediaContainer = self->_isMediaContainer;
  if (isMediaContainer == [v4 isMediaContainer])
  {
    int type = self->_type;
    BOOL v57 = type == [v4 type];
    goto LABEL_53;
  }
LABEL_52:
  BOOL v57 = 0;
LABEL_53:

  return v57;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(_SFPBWatchListItem *)self watchListIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v5 = [(_SFPBWatchListItem *)self seasonEpisodeTextFormat];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v6 = [(_SFPBWatchListItem *)self continueInTextFormat];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBWatchListItem *)self openButtonTitle];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBWatchListItem *)self installButtonTitle];
  if (v8) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v9 = [(_SFPBWatchListItem *)self purchaseOfferTextFormat];
  if (v9) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v10 = [(_SFPBWatchListItem *)self inUpNextText];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBWatchListItem *)self addToUpNextText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  uint64_t v12 = [(_SFPBWatchListItem *)self addedToUpNextText];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  uint64_t v13 = [(_SFPBWatchListItem *)self watchLiveTextFormat];
  if (v13) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBWatchListItem *)self isMediaContainer]) {
    PBDataWriterWriteBOOLField();
  }
  int v14 = [(_SFPBWatchListItem *)self type];
  v15 = v16;
  if (v14)
  {
    PBDataWriterWriteInt32Field();
    v15 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBWatchListItemReadFrom(self, (uint64_t)a3);
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (void)setIsMediaContainer:(BOOL)a3
{
  self->_int isMediaContainer = a3;
}

- (void)setWatchLiveTextFormat:(id)a3
{
  self->_watchLiveTextFormat = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAddedToUpNextText:(id)a3
{
  self->_addedToUpNextText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAddToUpNextText:(id)a3
{
  self->_addToUpNextText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setInUpNextText:(id)a3
{
  self->_inUpNextText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPurchaseOfferTextFormat:(id)a3
{
  self->_purchaseOfferTextFormat = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setInstallButtonTitle:(id)a3
{
  self->_installButtonTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setOpenButtonTitle:(id)a3
{
  self->_openButtonTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContinueInTextFormat:(id)a3
{
  self->_continueInTextFormat = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSeasonEpisodeTextFormat:(id)a3
{
  self->_seasonEpisodeTextFormat = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setWatchListIdentifier:(id)a3
{
  self->_watchListIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end