@interface _SFPBMediaInfoCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaContainer;
- (BOOL)readFrom:(id)a3;
- (NSArray)details;
- (NSArray)offers;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (NSString)watchListButtonLabel;
- (NSString)watchListConfirmationText;
- (NSString)watchListContinuationText;
- (NSString)watchListIdentifier;
- (_SFPBActionItem)playAction;
- (_SFPBColor)backgroundColor;
- (_SFPBMediaInfoCardSection)initWithDictionary:(id)a3;
- (_SFPBMediaInfoCardSection)initWithFacade:(id)a3;
- (_SFPBMediaInfoCardSection)initWithJSON:(id)a3;
- (_SFPBMediaItem)mediaItem;
- (_SFPBRichText)specialOfferButtonLabel;
- (id)detailsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)offersAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (int)watchListItemType;
- (unint64_t)detailsCount;
- (unint64_t)hash;
- (unint64_t)offersCount;
- (unint64_t)punchoutOptionsCount;
- (void)addDetails:(id)a3;
- (void)addOffers:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearDetails;
- (void)clearOffers;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setDetails:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIsMediaContainer:(BOOL)a3;
- (void)setMediaItem:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPlayAction:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSpecialOfferButtonLabel:(id)a3;
- (void)setType:(id)a3;
- (void)setWatchListButtonLabel:(id)a3;
- (void)setWatchListConfirmationText:(id)a3;
- (void)setWatchListContinuationText:(id)a3;
- (void)setWatchListIdentifier:(id)a3;
- (void)setWatchListItemType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaInfoCardSection

- (_SFPBMediaInfoCardSection)initWithFacade:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMediaInfoCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v72 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v10);
    }

    [(_SFPBMediaInfoCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMediaInfoCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMediaInfoCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMediaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMediaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMediaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMediaInfoCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMediaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMediaInfoCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 mediaItem];

    if (v24)
    {
      v25 = [_SFPBMediaItem alloc];
      v26 = [v4 mediaItem];
      v27 = [(_SFPBMediaItem *)v25 initWithFacade:v26];
      [(_SFPBMediaInfoCardSection *)v5 setMediaItem:v27];
    }
    v28 = [v4 details];
    if (v28) {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v29 = 0;
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v30 = [v4 details];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v68 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [[_SFPBMediaDetail alloc] initWithFacade:*(void *)(*((void *)&v67 + 1) + 8 * j)];
          if (v35) {
            [v29 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v32);
    }

    [(_SFPBMediaInfoCardSection *)v5 setDetails:v29];
    v36 = [v4 playAction];

    if (v36)
    {
      v37 = [_SFPBActionItem alloc];
      v38 = [v4 playAction];
      v39 = [(_SFPBActionItem *)v37 initWithFacade:v38];
      [(_SFPBMediaInfoCardSection *)v5 setPlayAction:v39];
    }
    v40 = [v4 offers];
    v62 = v5;
    if (v40) {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v41 = 0;
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v42 = [v4 offers];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v64 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [[_SFPBMediaOffer alloc] initWithFacade:*(void *)(*((void *)&v63 + 1) + 8 * k)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v44);
    }

    v5 = v62;
    [(_SFPBMediaInfoCardSection *)v62 setOffers:v41];
    v48 = [v4 watchListIdentifier];

    if (v48)
    {
      v49 = [v4 watchListIdentifier];
      [(_SFPBMediaInfoCardSection *)v62 setWatchListIdentifier:v49];
    }
    v50 = [v4 watchListButtonLabel];

    if (v50)
    {
      v51 = [v4 watchListButtonLabel];
      [(_SFPBMediaInfoCardSection *)v62 setWatchListButtonLabel:v51];
    }
    v52 = [v4 watchListContinuationText];

    if (v52)
    {
      v53 = [v4 watchListContinuationText];
      [(_SFPBMediaInfoCardSection *)v62 setWatchListContinuationText:v53];
    }
    v54 = [v4 watchListConfirmationText];

    if (v54)
    {
      v55 = [v4 watchListConfirmationText];
      [(_SFPBMediaInfoCardSection *)v62 setWatchListConfirmationText:v55];
    }
    if ([v4 hasIsMediaContainer]) {
      -[_SFPBMediaInfoCardSection setIsMediaContainer:](v62, "setIsMediaContainer:", [v4 isMediaContainer]);
    }
    v56 = [v4 specialOfferButtonLabel];

    if (v56)
    {
      v57 = [_SFPBRichText alloc];
      v58 = [v4 specialOfferButtonLabel];
      v59 = [(_SFPBRichText *)v57 initWithFacade:v58];
      [(_SFPBMediaInfoCardSection *)v62 setSpecialOfferButtonLabel:v59];
    }
    if ([v4 hasWatchListItemType]) {
      -[_SFPBMediaInfoCardSection setWatchListItemType:](v62, "setWatchListItemType:", [v4 watchListItemType]);
    }
    v60 = v62;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialOfferButtonLabel, 0);
  objc_storeStrong((id *)&self->_watchListConfirmationText, 0);
  objc_storeStrong((id *)&self->_watchListContinuationText, 0);
  objc_storeStrong((id *)&self->_watchListButtonLabel, 0);
  objc_storeStrong((id *)&self->_watchListIdentifier, 0);
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_playAction, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (int)watchListItemType
{
  return self->_watchListItemType;
}

- (_SFPBRichText)specialOfferButtonLabel
{
  return self->_specialOfferButtonLabel;
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (NSString)watchListConfirmationText
{
  return self->_watchListConfirmationText;
}

- (NSString)watchListContinuationText
{
  return self->_watchListContinuationText;
}

- (NSString)watchListButtonLabel
{
  return self->_watchListButtonLabel;
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (NSArray)offers
{
  return self->_offers;
}

- (_SFPBActionItem)playAction
{
  return self->_playAction;
}

- (NSArray)details
{
  return self->_details;
}

- (_SFPBMediaItem)mediaItem
{
  return self->_mediaItem;
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

- (_SFPBMediaInfoCardSection)initWithDictionary:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)_SFPBMediaInfoCardSection;
  v5 = [(_SFPBMediaInfoCardSection *)&v84 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    long long v71 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v81 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v80 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMediaInfoCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v80 objects:v87 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMediaInfoCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMediaInfoCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    long long v70 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    long long v63 = v18;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    long long v69 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMediaInfoCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v61 = v23;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    long long v68 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMediaInfoCardSection *)v5 setBackgroundColor:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"mediaItem"];
    objc_opt_class();
    long long v67 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBMediaItem alloc] initWithDictionary:v26];
      [(_SFPBMediaInfoCardSection *)v5 setMediaItem:v27];
    }
    v62 = v19;
    long long v64 = v16;
    long long v65 = v14;
    v28 = [v4 objectForKeyedSubscript:@"details"];
    objc_opt_class();
    long long v66 = v28;
    if (objc_opt_isKindOfClass())
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v76 objects:v86 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v77 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v76 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v35 = [[_SFPBMediaDetail alloc] initWithDictionary:v34];
              [(_SFPBMediaInfoCardSection *)v5 addDetails:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v76 objects:v86 count:16];
        }
        while (v31);
      }
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"playAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBActionItem alloc] initWithDictionary:v36];
      [(_SFPBMediaInfoCardSection *)v5 setPlayAction:v37];
    }
    v38 = objc_msgSend(v4, "objectForKeyedSubscript:", @"offers", v36);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v39 = v38;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v72 objects:v85 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v73;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v73 != v42) {
              objc_enumerationMutation(v39);
            }
            uint64_t v44 = *(void *)(*((void *)&v72 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v45 = [[_SFPBMediaOffer alloc] initWithDictionary:v44];
              [(_SFPBMediaInfoCardSection *)v5 addOffers:v45];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v72 objects:v85 count:16];
        }
        while (v41);
      }
    }
    v46 = [v4 objectForKeyedSubscript:@"watchListIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = (void *)[v46 copy];
      [(_SFPBMediaInfoCardSection *)v5 setWatchListIdentifier:v47];
    }
    v48 = [v4 objectForKeyedSubscript:@"watchListButtonLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = (void *)[v48 copy];
      [(_SFPBMediaInfoCardSection *)v5 setWatchListButtonLabel:v49];
    }
    v50 = [v4 objectForKeyedSubscript:@"watchListContinuationText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v51 = (void *)[v50 copy];
      [(_SFPBMediaInfoCardSection *)v5 setWatchListContinuationText:v51];
    }
    v52 = [v4 objectForKeyedSubscript:@"watchListConfirmationText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v53 = (void *)[v52 copy];
      [(_SFPBMediaInfoCardSection *)v5 setWatchListConfirmationText:v53];
    }
    v54 = [v4 objectForKeyedSubscript:@"isMediaContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setIsMediaContainer:](v5, "setIsMediaContainer:", [v54 BOOLValue]);
    }
    v55 = [v4 objectForKeyedSubscript:@"specialOfferButtonLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = [[_SFPBRichText alloc] initWithDictionary:v55];
      [(_SFPBMediaInfoCardSection *)v5 setSpecialOfferButtonLabel:v56];
    }
    v57 = [v4 objectForKeyedSubscript:@"watchListItemType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaInfoCardSection setWatchListItemType:](v5, "setWatchListItemType:", [v57 intValue]);
    }
    v58 = v5;
  }
  return v5;
}

- (_SFPBMediaInfoCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaInfoCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaInfoCardSection *)self dictionaryRepresentation];
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
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBMediaInfoCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaInfoCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_details count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v9 = self->_details;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v72 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v71 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"details"];
  }
  if (self->_hasBottomPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaInfoCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaInfoCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v17 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_isMediaContainer)
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaInfoCardSection isMediaContainer](self, "isMediaContainer"));
    [v3 setObject:v18 forKeyedSubscript:@"isMediaContainer"];
  }
  if (self->_mediaItem)
  {
    v19 = [(_SFPBMediaInfoCardSection *)self mediaItem];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"mediaItem"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"mediaItem"];
    }
  }
  if ([(NSArray *)self->_offers count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v23 = self->_offers;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v68 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v67 + 1) + 8 * j) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            id v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"offers"];
  }
  if (self->_playAction)
  {
    uint64_t v30 = [(_SFPBMediaInfoCardSection *)self playAction];
    uint64_t v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"playAction"];
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"playAction"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v34 = self->_punchoutOptions;
    uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v64 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = [*(id *)(*((void *)&v63 + 1) + 8 * k) dictionaryRepresentation];
          if (v39)
          {
            [v33 addObject:v39];
          }
          else
          {
            uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
            [v33 addObject:v40];
          }
        }
        uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v36);
    }

    [v3 setObject:v33 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    uint64_t v41 = [(_SFPBMediaInfoCardSection *)self punchoutPickerDismissText];
    uint64_t v42 = (void *)[v41 copy];
    [v3 setObject:v42 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v43 = [(_SFPBMediaInfoCardSection *)self punchoutPickerTitle];
    uint64_t v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v45 = [(_SFPBMediaInfoCardSection *)self separatorStyle];
    if (v45 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E5A2F090[v45];
    }
    [v3 setObject:v46 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_specialOfferButtonLabel)
  {
    v47 = [(_SFPBMediaInfoCardSection *)self specialOfferButtonLabel];
    v48 = [v47 dictionaryRepresentation];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"specialOfferButtonLabel"];
    }
    else
    {
      v49 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v49 forKeyedSubscript:@"specialOfferButtonLabel"];
    }
  }
  if (self->_type)
  {
    v50 = [(_SFPBMediaInfoCardSection *)self type];
    v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"type"];
  }
  if (self->_watchListButtonLabel)
  {
    v52 = [(_SFPBMediaInfoCardSection *)self watchListButtonLabel];
    v53 = (void *)[v52 copy];
    [v3 setObject:v53 forKeyedSubscript:@"watchListButtonLabel"];
  }
  if (self->_watchListConfirmationText)
  {
    v54 = [(_SFPBMediaInfoCardSection *)self watchListConfirmationText];
    v55 = (void *)[v54 copy];
    [v3 setObject:v55 forKeyedSubscript:@"watchListConfirmationText"];
  }
  if (self->_watchListContinuationText)
  {
    v56 = [(_SFPBMediaInfoCardSection *)self watchListContinuationText];
    v57 = (void *)[v56 copy];
    [v3 setObject:v57 forKeyedSubscript:@"watchListContinuationText"];
  }
  if (self->_watchListIdentifier)
  {
    v58 = [(_SFPBMediaInfoCardSection *)self watchListIdentifier];
    v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"watchListIdentifier"];
  }
  if (self->_watchListItemType)
  {
    uint64_t v60 = [(_SFPBMediaInfoCardSection *)self watchListItemType];
    if (v60 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v60);
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v61 = off_1E5A2F090[v60];
    }
    [v3 setObject:v61 forKeyedSubscript:@"watchListItemType"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v26 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v25 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v23 = v4;
  NSUInteger v24 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v21 = v6;
  uint64_t v22 = v5;
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v19 = 2654435761 * self->_separatorStyle;
  NSUInteger v20 = v7;
  unint64_t v18 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v17 = [(_SFPBMediaItem *)self->_mediaItem hash];
  uint64_t v8 = [(NSArray *)self->_details hash];
  unint64_t v9 = [(_SFPBActionItem *)self->_playAction hash];
  uint64_t v10 = [(NSArray *)self->_offers hash];
  NSUInteger v11 = [(NSString *)self->_watchListIdentifier hash];
  NSUInteger v12 = [(NSString *)self->_watchListButtonLabel hash];
  NSUInteger v13 = [(NSString *)self->_watchListContinuationText hash];
  NSUInteger v14 = [(NSString *)self->_watchListConfirmationText hash];
  if (self->_isMediaContainer) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(_SFPBRichText *)self->_specialOfferButtonLabel hash] ^ (2654435761 * self->_watchListItemType);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v7 = [(_SFPBMediaInfoCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBMediaInfoCardSection *)self punchoutOptions];
    uint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v12 = [(_SFPBMediaInfoCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBMediaInfoCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v17 = [(_SFPBMediaInfoCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBMediaInfoCardSection *)self punchoutPickerDismissText];
    NSUInteger v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_77;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_77;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v25 = [(_SFPBMediaInfoCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBMediaInfoCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v31 = [(_SFPBMediaInfoCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBMediaInfoCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self mediaItem];
  uint64_t v6 = [v4 mediaItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v36 = [(_SFPBMediaInfoCardSection *)self mediaItem];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    v38 = [(_SFPBMediaInfoCardSection *)self mediaItem];
    id v39 = [v4 mediaItem];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self details];
  uint64_t v6 = [v4 details];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v41 = [(_SFPBMediaInfoCardSection *)self details];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    uint64_t v43 = [(_SFPBMediaInfoCardSection *)self details];
    uint64_t v44 = [v4 details];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self playAction];
  uint64_t v6 = [v4 playAction];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v46 = [(_SFPBMediaInfoCardSection *)self playAction];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(_SFPBMediaInfoCardSection *)self playAction];
    v49 = [v4 playAction];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self offers];
  uint64_t v6 = [v4 offers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v51 = [(_SFPBMediaInfoCardSection *)self offers];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_SFPBMediaInfoCardSection *)self offers];
    v54 = [v4 offers];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self watchListIdentifier];
  uint64_t v6 = [v4 watchListIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v56 = [(_SFPBMediaInfoCardSection *)self watchListIdentifier];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(_SFPBMediaInfoCardSection *)self watchListIdentifier];
    v59 = [v4 watchListIdentifier];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self watchListButtonLabel];
  uint64_t v6 = [v4 watchListButtonLabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v61 = [(_SFPBMediaInfoCardSection *)self watchListButtonLabel];
  if (v61)
  {
    v62 = (void *)v61;
    long long v63 = [(_SFPBMediaInfoCardSection *)self watchListButtonLabel];
    long long v64 = [v4 watchListButtonLabel];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self watchListContinuationText];
  uint64_t v6 = [v4 watchListContinuationText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v66 = [(_SFPBMediaInfoCardSection *)self watchListContinuationText];
  if (v66)
  {
    long long v67 = (void *)v66;
    long long v68 = [(_SFPBMediaInfoCardSection *)self watchListContinuationText];
    long long v69 = [v4 watchListContinuationText];
    int v70 = [v68 isEqual:v69];

    if (!v70) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self watchListConfirmationText];
  uint64_t v6 = [v4 watchListConfirmationText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v71 = [(_SFPBMediaInfoCardSection *)self watchListConfirmationText];
  if (v71)
  {
    long long v72 = (void *)v71;
    long long v73 = [(_SFPBMediaInfoCardSection *)self watchListConfirmationText];
    long long v74 = [v4 watchListConfirmationText];
    int v75 = [v73 isEqual:v74];

    if (!v75) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int isMediaContainer = self->_isMediaContainer;
  if (isMediaContainer != [v4 isMediaContainer]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self specialOfferButtonLabel];
  uint64_t v6 = [v4 specialOfferButtonLabel];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_76:

    goto LABEL_77;
  }
  uint64_t v77 = [(_SFPBMediaInfoCardSection *)self specialOfferButtonLabel];
  if (!v77)
  {

LABEL_80:
    int watchListItemType = self->_watchListItemType;
    BOOL v82 = watchListItemType == [v4 watchListItemType];
    goto LABEL_78;
  }
  uint64_t v78 = (void *)v77;
  long long v79 = [(_SFPBMediaInfoCardSection *)self specialOfferButtonLabel];
  long long v80 = [v4 specialOfferButtonLabel];
  int v81 = [v79 isEqual:v80];

  if (v81) {
    goto LABEL_80;
  }
LABEL_77:
  BOOL v82 = 0;
LABEL_78:

  return v82;
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBMediaInfoCardSection *)self punchoutOptions];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBMediaInfoCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMediaInfoCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaInfoCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMediaInfoCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMediaInfoCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMediaInfoCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaInfoCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBMediaInfoCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v14 = [(_SFPBMediaInfoCardSection *)self mediaItem];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v15 = [(_SFPBMediaInfoCardSection *)self details];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v17);
  }

  NSUInteger v20 = [(_SFPBMediaInfoCardSection *)self playAction];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBMediaInfoCardSection *)self offers];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v23);
  }

  uint64_t v26 = [(_SFPBMediaInfoCardSection *)self watchListIdentifier];
  if (v26) {
    PBDataWriterWriteStringField();
  }

  v27 = [(_SFPBMediaInfoCardSection *)self watchListButtonLabel];
  if (v27) {
    PBDataWriterWriteStringField();
  }

  v28 = [(_SFPBMediaInfoCardSection *)self watchListContinuationText];
  if (v28) {
    PBDataWriterWriteStringField();
  }

  int v29 = [(_SFPBMediaInfoCardSection *)self watchListConfirmationText];
  if (v29) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaInfoCardSection *)self isMediaContainer]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v30 = [(_SFPBMediaInfoCardSection *)self specialOfferButtonLabel];
  if (v30) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBMediaInfoCardSection *)self watchListItemType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaInfoCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setWatchListItemType:(int)a3
{
  self->_int watchListItemType = a3;
}

- (void)setSpecialOfferButtonLabel:(id)a3
{
}

- (void)setIsMediaContainer:(BOOL)a3
{
  self->_int isMediaContainer = a3;
}

- (void)setWatchListConfirmationText:(id)a3
{
  self->_watchListConfirmationText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setWatchListContinuationText:(id)a3
{
  self->_watchListContinuationText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setWatchListButtonLabel:(id)a3
{
  self->_watchListButtonLabel = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setWatchListIdentifier:(id)a3
{
  self->_watchListIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)offersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_offers objectAtIndexedSubscript:a3];
}

- (unint64_t)offersCount
{
  return [(NSArray *)self->_offers count];
}

- (void)addOffers:(id)a3
{
  id v4 = a3;
  offers = self->_offers;
  id v8 = v4;
  if (!offers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_offers;
    self->_offers = v6;

    id v4 = v8;
    offers = self->_offers;
  }
  [(NSArray *)offers addObject:v4];
}

- (void)clearOffers
{
}

- (void)setOffers:(id)a3
{
  self->_offers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPlayAction:(id)a3
{
}

- (id)detailsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_details objectAtIndexedSubscript:a3];
}

- (unint64_t)detailsCount
{
  return [(NSArray *)self->_details count];
}

- (void)addDetails:(id)a3
{
  id v4 = a3;
  details = self->_details;
  id v8 = v4;
  if (!details)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_details;
    self->_details = v6;

    id v4 = v8;
    details = self->_details;
  }
  [(NSArray *)details addObject:v4];
}

- (void)clearDetails
{
}

- (void)setDetails:(id)a3
{
  self->_details = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMediaItem:(id)a3
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