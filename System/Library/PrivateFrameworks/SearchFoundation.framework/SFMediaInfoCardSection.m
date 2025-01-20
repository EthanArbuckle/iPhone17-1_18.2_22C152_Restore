@interface SFMediaInfoCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsMediaContainer;
- (BOOL)hasWatchListItemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaContainer;
- (NSArray)details;
- (NSArray)offers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (NSString)watchListButtonLabel;
- (NSString)watchListConfirmationText;
- (NSString)watchListContinuationText;
- (NSString)watchListIdentifier;
- (SFActionItem)playAction;
- (SFMediaInfoCardSection)initWithCoder:(id)a3;
- (SFMediaInfoCardSection)initWithProtobuf:(id)a3;
- (SFMediaItem)mediaItem;
- (SFRichText)specialOfferButtonLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (int)watchListItemType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDetails:(id)a3;
- (void)setIsMediaContainer:(BOOL)a3;
- (void)setMediaItem:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPlayAction:(id)a3;
- (void)setSpecialOfferButtonLabel:(id)a3;
- (void)setType:(id)a3;
- (void)setWatchListButtonLabel:(id)a3;
- (void)setWatchListConfirmationText:(id)a3;
- (void)setWatchListContinuationText:(id)a3;
- (void)setWatchListIdentifier:(id)a3;
- (void)setWatchListItemType:(int)a3;
@end

@implementation SFMediaInfoCardSection

- (SFMediaInfoCardSection)initWithProtobuf:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)SFMediaInfoCardSection;
  v5 = [(SFCardSection *)&v75 init];
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
    uint64_t v9 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
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
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v71 objects:v78 count:16];
      }
      while (v10);
    }

    [(SFCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(SFCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(SFCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 canBeHidden]) {
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasTopPadding]) {
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasBottomPadding]) {
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(SFMediaInfoCardSection *)v5 setType:v19];
    }
    if ([v4 separatorStyle]) {
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [SFColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(SFColor *)v21 initWithProtobuf:v22];
      [(SFCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 mediaItem];

    if (v24)
    {
      v25 = [SFMediaItem alloc];
      v26 = [v4 mediaItem];
      v27 = [(SFMediaItem *)v25 initWithProtobuf:v26];
      [(SFMediaInfoCardSection *)v5 setMediaItem:v27];
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
    uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
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
          v35 = [[SFMediaDetail alloc] initWithProtobuf:*(void *)(*((void *)&v67 + 1) + 8 * j)];
          if (v35) {
            [v29 addObject:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v67 objects:v77 count:16];
      }
      while (v32);
    }

    [(SFMediaInfoCardSection *)v5 setDetails:v29];
    v36 = [v4 playAction];

    if (v36)
    {
      v37 = [SFActionItem alloc];
      v38 = [v4 playAction];
      v39 = [(SFActionItem *)v37 initWithProtobuf:v38];
      [(SFMediaInfoCardSection *)v5 setPlayAction:v39];
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
    uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v76 count:16];
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
          v47 = [[SFMediaOffer alloc] initWithProtobuf:*(void *)(*((void *)&v63 + 1) + 8 * k)];
          if (v47) {
            [v41 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v44);
    }

    v5 = v62;
    [(SFMediaInfoCardSection *)v62 setOffers:v41];
    v48 = [v4 watchListIdentifier];

    if (v48)
    {
      v49 = [v4 watchListIdentifier];
      [(SFMediaInfoCardSection *)v62 setWatchListIdentifier:v49];
    }
    v50 = [v4 watchListButtonLabel];

    if (v50)
    {
      v51 = [v4 watchListButtonLabel];
      [(SFMediaInfoCardSection *)v62 setWatchListButtonLabel:v51];
    }
    v52 = [v4 watchListContinuationText];

    if (v52)
    {
      v53 = [v4 watchListContinuationText];
      [(SFMediaInfoCardSection *)v62 setWatchListContinuationText:v53];
    }
    v54 = [v4 watchListConfirmationText];

    if (v54)
    {
      v55 = [v4 watchListConfirmationText];
      [(SFMediaInfoCardSection *)v62 setWatchListConfirmationText:v55];
    }
    if ([v4 isMediaContainer]) {
      -[SFMediaInfoCardSection setIsMediaContainer:](v62, "setIsMediaContainer:", [v4 isMediaContainer]);
    }
    v56 = [v4 specialOfferButtonLabel];

    if (v56)
    {
      v57 = [SFRichText alloc];
      v58 = [v4 specialOfferButtonLabel];
      v59 = [(SFRichText *)v57 initWithProtobuf:v58];
      [(SFMediaInfoCardSection *)v62 setSpecialOfferButtonLabel:v59];
    }
    if ([v4 watchListItemType]) {
      -[SFMediaInfoCardSection setWatchListItemType:](v62, "setWatchListItemType:", [v4 watchListItemType]);
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
  objc_storeStrong((id *)&self->_type, 0);
}

- (int)watchListItemType
{
  return self->_watchListItemType;
}

- (void)setSpecialOfferButtonLabel:(id)a3
{
}

- (SFRichText)specialOfferButtonLabel
{
  return self->_specialOfferButtonLabel;
}

- (BOOL)isMediaContainer
{
  return self->_isMediaContainer;
}

- (void)setWatchListConfirmationText:(id)a3
{
}

- (NSString)watchListConfirmationText
{
  return self->_watchListConfirmationText;
}

- (void)setWatchListContinuationText:(id)a3
{
}

- (NSString)watchListContinuationText
{
  return self->_watchListContinuationText;
}

- (void)setWatchListButtonLabel:(id)a3
{
}

- (NSString)watchListButtonLabel
{
  return self->_watchListButtonLabel;
}

- (void)setWatchListIdentifier:(id)a3
{
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (void)setOffers:(id)a3
{
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setPlayAction:(id)a3
{
}

- (SFActionItem)playAction
{
  return self->_playAction;
}

- (void)setDetails:(id)a3
{
}

- (NSArray)details
{
  return self->_details;
}

- (void)setMediaItem:(id)a3
{
}

- (SFMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)hash
{
  v39.receiver = self;
  v39.super_class = (Class)SFMediaInfoCardSection;
  unint64_t v3 = [(SFCardSection *)&v39 hash];
  v38 = [(SFCardSection *)self punchoutOptions];
  uint64_t v4 = [v38 hash];
  v37 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v5 = v4 ^ [v37 hash];
  v36 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = v5 ^ [v36 hash];
  uint64_t v7 = v6 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v8 = v7 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v9 = [(SFCardSection *)self hasBottomPadding];
  v35 = [(SFMediaInfoCardSection *)self type];
  uint64_t v10 = v9 ^ [v35 hash];
  uint64_t v11 = v10 ^ [(SFCardSection *)self separatorStyle];
  v34 = [(SFCardSection *)self backgroundColor];
  uint64_t v12 = v11 ^ [v34 hash];
  uint64_t v33 = [(SFMediaInfoCardSection *)self mediaItem];
  uint64_t v13 = v8 ^ v12 ^ [v33 hash];
  uint64_t v32 = [(SFMediaInfoCardSection *)self details];
  uint64_t v14 = [v32 hash];
  v15 = [(SFMediaInfoCardSection *)self playAction];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFMediaInfoCardSection *)self offers];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(SFMediaInfoCardSection *)self watchListIdentifier];
  uint64_t v20 = v18 ^ [v19 hash];
  v21 = [(SFMediaInfoCardSection *)self watchListButtonLabel];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFMediaInfoCardSection *)self watchListContinuationText];
  uint64_t v24 = v22 ^ [v23 hash];
  v25 = [(SFMediaInfoCardSection *)self watchListConfirmationText];
  uint64_t v26 = v13 ^ v24 ^ [v25 hash];
  uint64_t v27 = [(SFMediaInfoCardSection *)self isMediaContainer];
  v28 = [(SFMediaInfoCardSection *)self specialOfferButtonLabel];
  uint64_t v29 = v27 ^ [v28 hash];
  unint64_t v30 = v26 ^ v29 ^ [(SFMediaInfoCardSection *)self watchListItemType];

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (SFMediaInfoCardSection *)a3;
  if (self == v7)
  {
    BOOL v15 = 1;
    goto LABEL_99;
  }
  if (![(SFMediaInfoCardSection *)v7 isMemberOfClass:objc_opt_class()]
    || (v122.receiver = self,
        v122.super_class = (Class)SFMediaInfoCardSection,
        ![(SFCardSection *)&v122 isEqual:v7]))
  {
    BOOL v15 = 0;
    goto LABEL_99;
  }
  unint64_t v8 = v7;
  uint64_t v9 = [(SFCardSection *)self punchoutOptions];
  uint64_t v10 = [(SFCardSection *)v8 punchoutOptions];
  uint64_t v11 = v10 != 0;
  id v114 = v10;
  id v115 = v9;
  int v112 = v11;
  int v113 = v9 == 0;
  if (v113 == v11)
  {
    long long v121 = 0uLL;
    memset(v111, 0, sizeof(v111));
    memset(v109, 0, sizeof(v109));
    memset(v110, 0, sizeof(v110));
    int v107 = 0;
    int v101 = 0;
    int v106 = 0;
    BOOL v120 = 0;
    int v99 = 0;
    int v104 = 0;
    BOOL v119 = 0;
    int v98 = 0;
    int v103 = 0;
    BOOL v118 = 0;
    int v100 = 0;
    int v105 = 0;
    BOOL v117 = 0;
    int v102 = 0;
    uint64_t v108 = 0;
    uint64_t v116 = 0;
    int v12 = 0;
    int v13 = 0;
    BOOL v14 = 0;
    BOOL v15 = 0;
  }
  else
  {
    uint64_t v3 = [(SFCardSection *)self punchoutOptions];
    uint64_t v5 = v3 != 0;
    v97 = (void *)v3;
    if (!v3
      || ([(SFCardSection *)self punchoutOptions],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [(SFCardSection *)v8 punchoutOptions],
          v93 = objc_claimAutoreleasedReturnValue(),
          v94 = (void *)v4,
          objc_msgSend((id)v4, "isEqual:")))
    {
      uint64_t v4 = [(SFCardSection *)self punchoutPickerTitle];
      uint64_t v3 = v4 == 0;
      v95 = [(SFCardSection *)v8 punchoutPickerTitle];
      v96 = (void *)v4;
      *(_DWORD *)&v111[32] = v5;
      if (v3 == (v95 != 0))
      {
        long long v121 = 0uLL;
        *(void *)&v111[24] = 0;
        memset(v111, 0, 20);
        memset(v109, 0, sizeof(v109));
        memset(v110, 0, sizeof(v110));
        int v107 = 0;
        int v101 = 0;
        int v106 = 0;
        BOOL v120 = 0;
        int v99 = 0;
        int v104 = 0;
        BOOL v119 = 0;
        int v98 = 0;
        int v103 = 0;
        BOOL v118 = 0;
        int v100 = 0;
        int v105 = 0;
        BOOL v117 = 0;
        int v102 = 0;
        uint64_t v108 = 0;
        uint64_t v116 = 0;
        int v12 = 0;
        int v13 = 0;
        BOOL v14 = 0;
        BOOL v15 = 0;
        *(_DWORD *)&v111[20] = 1;
      }
      else
      {
        uint64_t v16 = [(SFCardSection *)self punchoutPickerTitle];
        HIDWORD(v121) = v16 != 0;
        v92 = (void *)v16;
        if (!v16
          || ([(SFCardSection *)self punchoutPickerTitle],
              uint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFCardSection *)v8 punchoutPickerTitle],
              v88 = objc_claimAutoreleasedReturnValue(),
              v89 = (void *)v3,
              objc_msgSend((id)v3, "isEqual:")))
        {
          v91 = [(SFCardSection *)self punchoutPickerDismissText];
          uint64_t v3 = v91 == 0;
          v90 = [(SFCardSection *)v8 punchoutPickerDismissText];
          if (v3 != (v90 != 0))
          {
            uint64_t v19 = [(SFCardSection *)self punchoutPickerDismissText];
            uint64_t v3 = v19 != 0;
            v87 = (void *)v19;
            if (v19)
            {
              uint64_t v20 = [(SFCardSection *)self punchoutPickerDismissText];
              v21 = v8;
              uint64_t v22 = (void *)v20;
              v34 = v21;
              v85 = [(SFCardSection *)v21 punchoutPickerDismissText];
              v86 = v22;
              if (!objc_msgSend(v22, "isEqual:"))
              {
                *(void *)&v111[4] = 0;
                *(void *)&v111[24] = 0x100000000;
                *(void *)v110 = 0;
                *(_DWORD *)v111 = 0;
                *(void *)((char *)&v121 + 4) = 0;
                memset(v109, 0, sizeof(v109));
                int v107 = 0;
                LODWORD(v121) = 0;
                int v101 = 0;
                int v106 = 0;
                BOOL v120 = 0;
                int v99 = 0;
                int v104 = 0;
                BOOL v119 = 0;
                int v98 = 0;
                int v103 = 0;
                BOOL v118 = 0;
                int v100 = 0;
                int v105 = 0;
                BOOL v117 = 0;
                int v102 = 0;
                uint64_t v108 = 0;
                uint64_t v116 = 0;
                int v12 = 0;
                int v13 = 0;
                BOOL v14 = 0;
                BOOL v15 = 0;
                *(void *)&v111[16] = 0x100000001;
                *(_DWORD *)&v111[12] = 1;
                *(_DWORD *)&v110[8] = 1;
                unint64_t v8 = v34;
                goto LABEL_16;
              }
              unint64_t v8 = v34;
            }
            uint64_t v4 = [(SFCardSection *)self canBeHidden];
            *(_DWORD *)&v111[28] = v3;
            if (v4 == [(SFCardSection *)v8 canBeHidden]
              && (uint64_t v4 = [(SFCardSection *)self hasTopPadding],
                  v4 == [(SFCardSection *)v8 hasTopPadding])
              && (uint64_t v4 = [(SFCardSection *)self hasBottomPadding],
                  v4 == [(SFCardSection *)v8 hasBottomPadding]))
            {
              v84 = [(SFMediaInfoCardSection *)self type];
              uint64_t v3 = v84 == 0;
              v83 = [(SFMediaInfoCardSection *)v8 type];
              if (v3 == (v83 != 0))
              {
                *(void *)v111 = 0;
                *(_DWORD *)&v111[24] = 0;
                *(void *)v110 = 0;
                *(void *)((char *)&v121 + 4) = 0;
                memset(v109, 0, sizeof(v109));
                int v107 = 0;
                LODWORD(v121) = 0;
                int v101 = 0;
                int v106 = 0;
                BOOL v120 = 0;
                int v99 = 0;
                int v104 = 0;
                BOOL v119 = 0;
                int v98 = 0;
                int v103 = 0;
                BOOL v118 = 0;
                int v100 = 0;
                int v105 = 0;
                BOOL v117 = 0;
                int v102 = 0;
                uint64_t v108 = 0;
                uint64_t v116 = 0;
                int v12 = 0;
                int v13 = 0;
                BOOL v14 = 0;
                BOOL v15 = 0;
                *(void *)&v111[16] = 0x100000001;
                *(_DWORD *)&v110[8] = 1;
                *(void *)&v111[8] = 0x100000001;
              }
              else
              {
                uint64_t v23 = [(SFMediaInfoCardSection *)self type];
                uint64_t v3 = v23 != 0;
                v82 = (void *)v23;
                if (!v23
                  || ([(SFMediaInfoCardSection *)self type],
                      uint64_t v4 = objc_claimAutoreleasedReturnValue(),
                      [(SFMediaInfoCardSection *)v8 type],
                      v80 = objc_claimAutoreleasedReturnValue(),
                      v81 = (void *)v4,
                      objc_msgSend((id)v4, "isEqual:")))
                {
                  *(_DWORD *)&v111[24] = v3;
                  uint64_t v4 = [(SFCardSection *)self separatorStyle];
                  if (v4 == [(SFCardSection *)v8 separatorStyle])
                  {
                    uint64_t v79 = [(SFCardSection *)self backgroundColor];
                    uint64_t v3 = v79 == 0;
                    v78 = [(SFCardSection *)v8 backgroundColor];
                    if (v3 == (v78 != 0))
                    {
                      *(void *)v111 = 0x100000000;
                      *(void *)((char *)&v121 + 4) = 0;
                      memset(v109, 0, sizeof(v109));
                      *(void *)v110 = 0x100000000;
                      int v107 = 0;
                      LODWORD(v121) = 0;
                      int v101 = 0;
                      int v106 = 0;
                      BOOL v120 = 0;
                      int v99 = 0;
                      int v104 = 0;
                      BOOL v119 = 0;
                      int v98 = 0;
                      int v103 = 0;
                      BOOL v118 = 0;
                      int v100 = 0;
                      int v105 = 0;
                      BOOL v117 = 0;
                      int v102 = 0;
                      uint64_t v108 = 0;
                      uint64_t v116 = 0;
                      int v12 = 0;
                      int v13 = 0;
                      BOOL v14 = 0;
                      BOOL v15 = 0;
                      *(void *)&v111[16] = 0x100000001;
                      *(void *)&v111[8] = 0x100000001;
                      *(_DWORD *)&v110[8] = 1;
                    }
                    else
                    {
                      uint64_t v24 = [(SFCardSection *)self backgroundColor];
                      DWORD2(v121) = v24 != 0;
                      v77 = (void *)v24;
                      if (!v24
                        || ([(SFCardSection *)self backgroundColor],
                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                            [(SFCardSection *)v8 backgroundColor],
                            long long v73 = objc_claimAutoreleasedReturnValue(),
                            long long v74 = (void *)v3,
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        v76 = [(SFMediaInfoCardSection *)self mediaItem];
                        uint64_t v3 = v76 == 0;
                        objc_super v75 = [(SFMediaInfoCardSection *)v8 mediaItem];
                        if (v3 == (v75 != 0))
                        {
                          *(_DWORD *)v110 = 0;
                          *(void *)&long long v121 = 0;
                          int v107 = 0;
                          *(_DWORD *)v109 = 0;
                          int v101 = 0;
                          int v106 = 0;
                          BOOL v120 = 0;
                          int v99 = 0;
                          int v104 = 0;
                          BOOL v119 = 0;
                          int v98 = 0;
                          int v103 = 0;
                          BOOL v118 = 0;
                          int v100 = 0;
                          int v105 = 0;
                          BOOL v117 = 0;
                          int v102 = 0;
                          uint64_t v108 = 0;
                          uint64_t v116 = 0;
                          int v12 = 0;
                          int v13 = 0;
                          BOOL v14 = 0;
                          BOOL v15 = 0;
                          *(_DWORD *)&v111[16] = 1;
                          *(_DWORD *)&v111[20] = 1;
                          *(_DWORD *)&v111[8] = 1;
                          *(_DWORD *)&v111[12] = 1;
                          *(_DWORD *)&v110[4] = 1;
                          *(_DWORD *)&v110[8] = 1;
                          *(_DWORD *)v111 = 1;
                          *(_DWORD *)&v111[4] = 1;
                          *(void *)&v109[4] = 1;
                        }
                        else
                        {
                          uint64_t v25 = [(SFMediaInfoCardSection *)self mediaItem];
                          DWORD1(v121) = v25 != 0;
                          long long v72 = (void *)v25;
                          if (!v25
                            || ([(SFMediaInfoCardSection *)self mediaItem],
                                uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                [(SFMediaInfoCardSection *)v8 mediaItem],
                                long long v68 = objc_claimAutoreleasedReturnValue(),
                                long long v69 = (void *)v3,
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            long long v71 = [(SFMediaInfoCardSection *)self details];
                            uint64_t v3 = v71 == 0;
                            long long v70 = [(SFMediaInfoCardSection *)v8 details];
                            if (v3 == (v70 != 0))
                            {
                              *(_DWORD *)v109 = 0;
                              LODWORD(v121) = 0;
                              int v101 = 0;
                              int v106 = 0;
                              BOOL v120 = 0;
                              int v99 = 0;
                              int v104 = 0;
                              BOOL v119 = 0;
                              int v98 = 0;
                              int v103 = 0;
                              BOOL v118 = 0;
                              int v100 = 0;
                              int v105 = 0;
                              BOOL v117 = 0;
                              int v102 = 0;
                              uint64_t v108 = 0;
                              uint64_t v116 = 0;
                              int v12 = 0;
                              int v13 = 0;
                              BOOL v14 = 0;
                              BOOL v15 = 0;
                              *(_DWORD *)&v111[16] = 1;
                              *(_DWORD *)&v111[20] = 1;
                              *(_DWORD *)&v111[8] = 1;
                              *(_DWORD *)&v111[12] = 1;
                              *(_DWORD *)&v110[4] = 1;
                              *(_DWORD *)&v110[8] = 1;
                              *(_DWORD *)v111 = 1;
                              *(_DWORD *)&v111[4] = 1;
                              *(_DWORD *)&v109[4] = 1;
                              *(_DWORD *)&v109[8] = 0;
                              *(_DWORD *)v110 = 1;
                              int v107 = 1;
                            }
                            else
                            {
                              uint64_t v26 = [(SFMediaInfoCardSection *)self details];
                              LODWORD(v121) = v26 != 0;
                              long long v67 = (void *)v26;
                              if (!v26
                                || ([(SFMediaInfoCardSection *)self details],
                                    uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                    [(SFMediaInfoCardSection *)v8 details],
                                    long long v63 = objc_claimAutoreleasedReturnValue(),
                                    long long v64 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                long long v66 = [(SFMediaInfoCardSection *)self playAction];
                                uint64_t v3 = v66 == 0;
                                long long v65 = [(SFMediaInfoCardSection *)v8 playAction];
                                if (v3 == (v65 != 0))
                                {
                                  int v106 = 0;
                                  BOOL v120 = 0;
                                  int v99 = 0;
                                  int v104 = 0;
                                  BOOL v119 = 0;
                                  int v98 = 0;
                                  int v103 = 0;
                                  BOOL v118 = 0;
                                  int v100 = 0;
                                  int v105 = 0;
                                  BOOL v117 = 0;
                                  int v102 = 0;
                                  uint64_t v108 = 0;
                                  uint64_t v116 = 0;
                                  int v12 = 0;
                                  int v13 = 0;
                                  BOOL v14 = 0;
                                  BOOL v15 = 0;
                                  *(_DWORD *)&v111[16] = 1;
                                  *(_DWORD *)&v111[20] = 1;
                                  *(_DWORD *)&v111[8] = 1;
                                  *(_DWORD *)&v111[12] = 1;
                                  *(_DWORD *)&v110[4] = 1;
                                  *(_DWORD *)&v110[8] = 1;
                                  *(_DWORD *)v111 = 1;
                                  *(_DWORD *)&v111[4] = 1;
                                  *(_DWORD *)&v109[4] = 1;
                                  *(_DWORD *)&v109[8] = 0;
                                  *(_DWORD *)v110 = 1;
                                  int v107 = 1;
                                  *(_DWORD *)v109 = 1;
                                  int v101 = 1;
                                }
                                else
                                {
                                  uint64_t v27 = [(SFMediaInfoCardSection *)self playAction];
                                  BOOL v120 = v27 != 0;
                                  v62 = (void *)v27;
                                  if (!v27
                                    || ([(SFMediaInfoCardSection *)self playAction],
                                        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                        [(SFMediaInfoCardSection *)v8 playAction],
                                        v58 = objc_claimAutoreleasedReturnValue(),
                                        v59 = (void *)v3,
                                        objc_msgSend((id)v3, "isEqual:")))
                                  {
                                    v61 = [(SFMediaInfoCardSection *)self offers];
                                    uint64_t v3 = v61 == 0;
                                    v60 = [(SFMediaInfoCardSection *)v8 offers];
                                    if (v3 == (v60 != 0))
                                    {
                                      int v104 = 0;
                                      BOOL v119 = 0;
                                      int v98 = 0;
                                      int v103 = 0;
                                      BOOL v118 = 0;
                                      int v100 = 0;
                                      int v105 = 0;
                                      BOOL v117 = 0;
                                      int v102 = 0;
                                      uint64_t v108 = 0;
                                      uint64_t v116 = 0;
                                      int v12 = 0;
                                      int v13 = 0;
                                      BOOL v14 = 0;
                                      BOOL v15 = 0;
                                      *(_DWORD *)&v111[16] = 1;
                                      *(_DWORD *)&v111[20] = 1;
                                      *(_DWORD *)&v111[8] = 1;
                                      *(_DWORD *)&v111[12] = 1;
                                      *(_DWORD *)&v110[4] = 1;
                                      *(_DWORD *)&v110[8] = 1;
                                      *(_DWORD *)v111 = 1;
                                      *(_DWORD *)&v111[4] = 1;
                                      *(_DWORD *)&v109[4] = 1;
                                      *(_DWORD *)&v109[8] = 0;
                                      *(_DWORD *)v110 = 1;
                                      int v107 = 1;
                                      *(_DWORD *)v109 = 1;
                                      int v101 = 1;
                                      int v106 = 1;
                                      int v99 = 1;
                                    }
                                    else
                                    {
                                      uint64_t v28 = [(SFMediaInfoCardSection *)self offers];
                                      BOOL v119 = v28 != 0;
                                      v57 = (void *)v28;
                                      if (!v28
                                        || ([(SFMediaInfoCardSection *)self offers],
                                            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                            [(SFMediaInfoCardSection *)v8 offers],
                                            v53 = objc_claimAutoreleasedReturnValue(),
                                            v54 = (void *)v3,
                                            objc_msgSend((id)v3, "isEqual:")))
                                      {
                                        v56 = [(SFMediaInfoCardSection *)self watchListIdentifier];
                                        uint64_t v3 = v56 == 0;
                                        v55 = [(SFMediaInfoCardSection *)v8 watchListIdentifier];
                                        if (v3 == (v55 != 0))
                                        {
                                          int v103 = 0;
                                          BOOL v118 = 0;
                                          int v100 = 0;
                                          int v105 = 0;
                                          BOOL v117 = 0;
                                          int v102 = 0;
                                          uint64_t v108 = 0;
                                          uint64_t v116 = 0;
                                          int v12 = 0;
                                          int v13 = 0;
                                          BOOL v14 = 0;
                                          BOOL v15 = 0;
                                          *(_DWORD *)&v111[16] = 1;
                                          *(_DWORD *)&v111[20] = 1;
                                          *(_DWORD *)&v111[8] = 1;
                                          *(_DWORD *)&v111[12] = 1;
                                          *(_DWORD *)&v110[4] = 1;
                                          *(_DWORD *)&v110[8] = 1;
                                          *(_DWORD *)v111 = 1;
                                          *(_DWORD *)&v111[4] = 1;
                                          *(_DWORD *)&v109[4] = 1;
                                          *(_DWORD *)&v109[8] = 0;
                                          *(_DWORD *)v110 = 1;
                                          int v107 = 1;
                                          *(_DWORD *)v109 = 1;
                                          int v101 = 1;
                                          int v106 = 1;
                                          int v99 = 1;
                                          int v104 = 1;
                                          int v98 = 1;
                                        }
                                        else
                                        {
                                          uint64_t v29 = [(SFMediaInfoCardSection *)self watchListIdentifier];
                                          BOOL v118 = v29 != 0;
                                          v52 = (void *)v29;
                                          if (!v29
                                            || (-[SFMediaInfoCardSection watchListIdentifier](self, "watchListIdentifier"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListIdentifier](v8, "watchListIdentifier"), v48 = objc_claimAutoreleasedReturnValue(), v49 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                          {
                                            v51 = [(SFMediaInfoCardSection *)self watchListButtonLabel];
                                            uint64_t v3 = v51 == 0;
                                            v50 = [(SFMediaInfoCardSection *)v8 watchListButtonLabel];
                                            if (v3 == (v50 != 0))
                                            {
                                              int v105 = 0;
                                              BOOL v117 = 0;
                                              int v102 = 0;
                                              uint64_t v108 = 0;
                                              uint64_t v116 = 0;
                                              int v12 = 0;
                                              int v13 = 0;
                                              BOOL v14 = 0;
                                              BOOL v15 = 0;
                                              *(_DWORD *)&v111[16] = 1;
                                              *(_DWORD *)&v111[20] = 1;
                                              *(_DWORD *)&v111[8] = 1;
                                              *(_DWORD *)&v111[12] = 1;
                                              *(_DWORD *)&v110[4] = 1;
                                              *(_DWORD *)&v110[8] = 1;
                                              *(_DWORD *)v111 = 1;
                                              *(_DWORD *)&v111[4] = 1;
                                              *(_DWORD *)&v109[4] = 1;
                                              *(_DWORD *)&v109[8] = 0;
                                              *(_DWORD *)v110 = 1;
                                              int v107 = 1;
                                              *(_DWORD *)v109 = 1;
                                              int v101 = 1;
                                              int v106 = 1;
                                              int v99 = 1;
                                              int v104 = 1;
                                              int v98 = 1;
                                              int v103 = 1;
                                              int v100 = 1;
                                            }
                                            else
                                            {
                                              uint64_t v30 = [(SFMediaInfoCardSection *)self watchListButtonLabel];
                                              BOOL v117 = v30 != 0;
                                              v47 = (void *)v30;
                                              if (!v30
                                                || (-[SFMediaInfoCardSection watchListButtonLabel](self, "watchListButtonLabel"), v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListButtonLabel](v8, "watchListButtonLabel"), uint64_t v43 = objc_claimAutoreleasedReturnValue(), v44 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                              {
                                                v46 = [(SFMediaInfoCardSection *)self watchListContinuationText];
                                                uint64_t v3 = v46 == 0;
                                                uint64_t v45 = [(SFMediaInfoCardSection *)v8 watchListContinuationText];
                                                if (v3 == (v45 != 0))
                                                {
                                                  uint64_t v108 = 0;
                                                  uint64_t v116 = 0;
                                                  int v12 = 0;
                                                  int v13 = 0;
                                                  BOOL v14 = 0;
                                                  BOOL v15 = 0;
                                                  *(_DWORD *)&v111[16] = 1;
                                                  *(_DWORD *)&v111[20] = 1;
                                                  *(_DWORD *)&v111[8] = 1;
                                                  *(_DWORD *)&v111[12] = 1;
                                                  *(_DWORD *)&v110[4] = 1;
                                                  *(_DWORD *)&v110[8] = 1;
                                                  *(_DWORD *)v111 = 1;
                                                  *(_DWORD *)&v111[4] = 1;
                                                  *(_DWORD *)&v109[4] = 1;
                                                  *(_DWORD *)&v109[8] = 0;
                                                  *(_DWORD *)v110 = 1;
                                                  int v107 = 1;
                                                  *(_DWORD *)v109 = 1;
                                                  int v101 = 1;
                                                  int v106 = 1;
                                                  int v99 = 1;
                                                  int v104 = 1;
                                                  int v98 = 1;
                                                  int v103 = 1;
                                                  int v100 = 1;
                                                  int v105 = 1;
                                                  int v102 = 1;
                                                }
                                                else
                                                {
                                                  uint64_t v31 = [(SFMediaInfoCardSection *)self watchListContinuationText];
                                                  HIDWORD(v116) = v31 != 0;
                                                  v42 = (void *)v31;
                                                  if (!v31
                                                    || (-[SFMediaInfoCardSection watchListContinuationText](self, "watchListContinuationText"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListContinuationText](v8, "watchListContinuationText"), v38 = objc_claimAutoreleasedReturnValue(), v39 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                  {
                                                    id v41 = [(SFMediaInfoCardSection *)self watchListConfirmationText];
                                                    uint64_t v3 = v41 == 0;
                                                    v40 = [(SFMediaInfoCardSection *)v8 watchListConfirmationText];
                                                    if (v3 == (v40 != 0))
                                                    {
                                                      LODWORD(v116) = 0;
                                                      int v12 = 0;
                                                      int v13 = 0;
                                                      BOOL v14 = 0;
                                                      BOOL v15 = 0;
                                                      *(void *)&v111[16] = 0x100000001;
                                                      *(void *)&v111[8] = 0x100000001;
                                                      *(_DWORD *)&v110[8] = 1;
                                                      *(void *)v111 = 0x100000001;
                                                      *(void *)&v109[4] = 1;
                                                      *(void *)v110 = 0x100000001;
                                                      int v107 = 1;
                                                      *(_DWORD *)v109 = 1;
                                                      int v101 = 1;
                                                      int v106 = 1;
                                                      int v99 = 1;
                                                      int v104 = 1;
                                                      int v98 = 1;
                                                      int v103 = 1;
                                                      int v100 = 1;
                                                      int v105 = 1;
                                                      int v102 = 1;
                                                      uint64_t v108 = 0x100000001;
                                                    }
                                                    else
                                                    {
                                                      uint64_t v32 = [(SFMediaInfoCardSection *)self watchListConfirmationText];
                                                      LODWORD(v116) = v32 != 0;
                                                      v37 = (void *)v32;
                                                      if (!v32
                                                        || (-[SFMediaInfoCardSection watchListConfirmationText](self, "watchListConfirmationText"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection watchListConfirmationText](v8, "watchListConfirmationText"), v35 = objc_claimAutoreleasedReturnValue(), v36 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                      {
                                                        uint64_t v4 = [(SFMediaInfoCardSection *)self isMediaContainer];
                                                        if (v4 == [(SFMediaInfoCardSection *)v8 isMediaContainer])
                                                        {
                                                          uint64_t v3 = [(SFMediaInfoCardSection *)self specialOfferButtonLabel];
                                                          uint64_t v4 = [(SFMediaInfoCardSection *)v8 specialOfferButtonLabel];
                                                          if ((v3 == 0) == (v4 != 0))
                                                          {
                                                            int v13 = 0;
                                                            BOOL v14 = 0;
                                                            BOOL v15 = 0;
                                                            *(void *)&v111[16] = 0x100000001;
                                                            *(void *)&v111[8] = 0x100000001;
                                                            *(_DWORD *)&v110[8] = 1;
                                                            *(void *)v111 = 0x100000001;
                                                            *(void *)v109 = 0x100000001;
                                                            *(void *)v110 = 0x100000001;
                                                            int v107 = 1;
                                                            int v101 = 1;
                                                            int v106 = 1;
                                                            int v99 = 1;
                                                            int v104 = 1;
                                                            int v98 = 1;
                                                            int v103 = 1;
                                                            int v100 = 1;
                                                            int v105 = 1;
                                                            int v102 = 1;
                                                            uint64_t v108 = 0x100000001;
                                                            *(_DWORD *)&v109[8] = 1;
                                                            int v12 = 1;
                                                          }
                                                          else
                                                          {
                                                            uint64_t v11 = [(SFMediaInfoCardSection *)self specialOfferButtonLabel];
                                                            if (!v11
                                                              || (-[SFMediaInfoCardSection specialOfferButtonLabel](self, "specialOfferButtonLabel"), uint64_t v10 = objc_claimAutoreleasedReturnValue(), -[SFMediaInfoCardSection specialOfferButtonLabel](v8, "specialOfferButtonLabel"), v5 = objc_claimAutoreleasedReturnValue(), [v10 isEqual:v5]))
                                                            {
                                                              int v33 = [(SFMediaInfoCardSection *)self watchListItemType];
                                                              BOOL v15 = v33 == [(SFMediaInfoCardSection *)v8 watchListItemType];
                                                              *(void *)&v111[16] = 0x100000001;
                                                              *(void *)&v111[8] = 0x100000001;
                                                              *(_DWORD *)&v110[8] = 1;
                                                              *(void *)v111 = 0x100000001;
                                                              *(void *)v109 = 0x100000001;
                                                              *(void *)v110 = 0x100000001;
                                                              int v107 = 1;
                                                              int v101 = 1;
                                                              int v106 = 1;
                                                              int v99 = 1;
                                                              int v104 = 1;
                                                              int v98 = 1;
                                                              int v103 = 1;
                                                              int v100 = 1;
                                                              int v105 = 1;
                                                              int v102 = 1;
                                                              uint64_t v108 = 0x100000001;
                                                              *(_DWORD *)&v109[8] = 1;
                                                              int v12 = 1;
                                                              int v13 = 1;
                                                              BOOL v14 = v11 != 0;
                                                            }
                                                            else
                                                            {
                                                              BOOL v15 = 0;
                                                              *(void *)&v111[16] = 0x100000001;
                                                              *(void *)&v111[8] = 0x100000001;
                                                              *(_DWORD *)&v110[8] = 1;
                                                              *(void *)v111 = 0x100000001;
                                                              *(void *)v109 = 0x100000001;
                                                              *(void *)v110 = 0x100000001;
                                                              int v107 = 1;
                                                              int v101 = 1;
                                                              int v106 = 1;
                                                              int v99 = 1;
                                                              int v104 = 1;
                                                              int v98 = 1;
                                                              int v103 = 1;
                                                              int v100 = 1;
                                                              int v105 = 1;
                                                              int v102 = 1;
                                                              uint64_t v108 = 0x100000001;
                                                              *(_DWORD *)&v109[8] = 1;
                                                              int v12 = 1;
                                                              int v13 = 1;
                                                              BOOL v14 = 1;
                                                            }
                                                          }
                                                        }
                                                        else
                                                        {
                                                          int v12 = 0;
                                                          int v13 = 0;
                                                          BOOL v14 = 0;
                                                          BOOL v15 = 0;
                                                          *(void *)&v111[16] = 0x100000001;
                                                          *(void *)&v111[8] = 0x100000001;
                                                          *(_DWORD *)&v110[8] = 1;
                                                          *(void *)v111 = 0x100000001;
                                                          *(void *)v109 = 0x100000001;
                                                          *(void *)v110 = 0x100000001;
                                                          int v107 = 1;
                                                          int v101 = 1;
                                                          int v106 = 1;
                                                          int v99 = 1;
                                                          int v104 = 1;
                                                          int v98 = 1;
                                                          int v103 = 1;
                                                          int v100 = 1;
                                                          int v105 = 1;
                                                          int v102 = 1;
                                                          uint64_t v108 = 0x100000001;
                                                          *(_DWORD *)&v109[8] = 1;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        int v12 = 0;
                                                        int v13 = 0;
                                                        BOOL v14 = 0;
                                                        BOOL v15 = 0;
                                                        *(void *)&v111[16] = 0x100000001;
                                                        *(void *)&v111[8] = 0x100000001;
                                                        *(_DWORD *)&v110[8] = 1;
                                                        *(void *)v111 = 0x100000001;
                                                        *(void *)v109 = 0x100000001;
                                                        *(void *)v110 = 0x100000001;
                                                        int v107 = 1;
                                                        int v101 = 1;
                                                        int v106 = 1;
                                                        int v99 = 1;
                                                        int v104 = 1;
                                                        int v98 = 1;
                                                        int v103 = 1;
                                                        int v100 = 1;
                                                        int v105 = 1;
                                                        int v102 = 1;
                                                        uint64_t v108 = 0x100000001;
                                                        *(_DWORD *)&v109[8] = 1;
                                                        LODWORD(v116) = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v116 = 0x100000000;
                                                    int v12 = 0;
                                                    int v13 = 0;
                                                    BOOL v14 = 0;
                                                    BOOL v15 = 0;
                                                    *(void *)&v111[16] = 0x100000001;
                                                    *(void *)&v111[8] = 0x100000001;
                                                    *(_DWORD *)&v110[8] = 1;
                                                    *(void *)v111 = 0x100000001;
                                                    *(_DWORD *)&v109[8] = 0;
                                                    *(void *)v110 = 0x100000001;
                                                    int v107 = 1;
                                                    uint64_t v108 = 0x100000000;
                                                    *(void *)v109 = 0x100000001;
                                                    int v101 = 1;
                                                    int v106 = 1;
                                                    int v99 = 1;
                                                    int v104 = 1;
                                                    int v98 = 1;
                                                    int v103 = 1;
                                                    int v100 = 1;
                                                    int v105 = 1;
                                                    int v102 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                int v102 = 0;
                                                uint64_t v108 = 0;
                                                uint64_t v116 = 0;
                                                int v12 = 0;
                                                int v13 = 0;
                                                BOOL v14 = 0;
                                                BOOL v15 = 0;
                                                *(_DWORD *)&v111[16] = 1;
                                                *(_DWORD *)&v111[20] = 1;
                                                *(_DWORD *)&v111[8] = 1;
                                                *(_DWORD *)&v111[12] = 1;
                                                *(_DWORD *)&v110[4] = 1;
                                                *(_DWORD *)&v110[8] = 1;
                                                *(_DWORD *)v111 = 1;
                                                *(_DWORD *)&v111[4] = 1;
                                                *(_DWORD *)&v109[4] = 1;
                                                *(_DWORD *)&v109[8] = 0;
                                                *(_DWORD *)v110 = 1;
                                                int v107 = 1;
                                                *(_DWORD *)v109 = 1;
                                                int v101 = 1;
                                                int v106 = 1;
                                                int v99 = 1;
                                                int v104 = 1;
                                                int v98 = 1;
                                                int v103 = 1;
                                                int v100 = 1;
                                                int v105 = 1;
                                                BOOL v117 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            int v100 = 0;
                                            int v105 = 0;
                                            BOOL v117 = 0;
                                            int v102 = 0;
                                            uint64_t v108 = 0;
                                            uint64_t v116 = 0;
                                            int v12 = 0;
                                            int v13 = 0;
                                            BOOL v14 = 0;
                                            BOOL v15 = 0;
                                            *(_DWORD *)&v111[16] = 1;
                                            *(_DWORD *)&v111[20] = 1;
                                            *(_DWORD *)&v111[8] = 1;
                                            *(_DWORD *)&v111[12] = 1;
                                            *(_DWORD *)&v110[4] = 1;
                                            *(_DWORD *)&v110[8] = 1;
                                            *(_DWORD *)v111 = 1;
                                            *(_DWORD *)&v111[4] = 1;
                                            *(_DWORD *)&v109[4] = 1;
                                            *(_DWORD *)&v109[8] = 0;
                                            *(_DWORD *)v110 = 1;
                                            int v107 = 1;
                                            *(_DWORD *)v109 = 1;
                                            int v101 = 1;
                                            int v106 = 1;
                                            int v99 = 1;
                                            int v104 = 1;
                                            int v98 = 1;
                                            int v103 = 1;
                                            BOOL v118 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        int v98 = 0;
                                        int v103 = 0;
                                        BOOL v118 = 0;
                                        int v100 = 0;
                                        int v105 = 0;
                                        BOOL v117 = 0;
                                        int v102 = 0;
                                        uint64_t v108 = 0;
                                        uint64_t v116 = 0;
                                        int v12 = 0;
                                        int v13 = 0;
                                        BOOL v14 = 0;
                                        BOOL v15 = 0;
                                        *(_DWORD *)&v111[16] = 1;
                                        *(_DWORD *)&v111[20] = 1;
                                        *(_DWORD *)&v111[8] = 1;
                                        *(_DWORD *)&v111[12] = 1;
                                        *(_DWORD *)&v110[4] = 1;
                                        *(_DWORD *)&v110[8] = 1;
                                        *(_DWORD *)v111 = 1;
                                        *(_DWORD *)&v111[4] = 1;
                                        *(_DWORD *)&v109[4] = 1;
                                        *(_DWORD *)&v109[8] = 0;
                                        *(_DWORD *)v110 = 1;
                                        int v107 = 1;
                                        *(_DWORD *)v109 = 1;
                                        int v101 = 1;
                                        int v106 = 1;
                                        int v99 = 1;
                                        int v104 = 1;
                                        BOOL v119 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    int v99 = 0;
                                    int v104 = 0;
                                    BOOL v119 = 0;
                                    int v98 = 0;
                                    int v103 = 0;
                                    BOOL v118 = 0;
                                    int v100 = 0;
                                    int v105 = 0;
                                    BOOL v117 = 0;
                                    int v102 = 0;
                                    uint64_t v108 = 0;
                                    uint64_t v116 = 0;
                                    int v12 = 0;
                                    int v13 = 0;
                                    BOOL v14 = 0;
                                    BOOL v15 = 0;
                                    *(_DWORD *)&v111[16] = 1;
                                    *(_DWORD *)&v111[20] = 1;
                                    *(_DWORD *)&v111[8] = 1;
                                    *(_DWORD *)&v111[12] = 1;
                                    *(_DWORD *)&v110[4] = 1;
                                    *(_DWORD *)&v110[8] = 1;
                                    *(_DWORD *)v111 = 1;
                                    *(_DWORD *)&v111[4] = 1;
                                    *(_DWORD *)&v109[4] = 1;
                                    *(_DWORD *)&v109[8] = 0;
                                    *(_DWORD *)v110 = 1;
                                    int v107 = 1;
                                    *(_DWORD *)v109 = 1;
                                    int v101 = 1;
                                    int v106 = 1;
                                    BOOL v120 = 1;
                                  }
                                }
                              }
                              else
                              {
                                int v101 = 0;
                                int v106 = 0;
                                BOOL v120 = 0;
                                int v99 = 0;
                                int v104 = 0;
                                BOOL v119 = 0;
                                int v98 = 0;
                                int v103 = 0;
                                BOOL v118 = 0;
                                int v100 = 0;
                                int v105 = 0;
                                BOOL v117 = 0;
                                int v102 = 0;
                                uint64_t v108 = 0;
                                uint64_t v116 = 0;
                                int v12 = 0;
                                int v13 = 0;
                                BOOL v14 = 0;
                                BOOL v15 = 0;
                                *(_DWORD *)&v111[16] = 1;
                                *(_DWORD *)&v111[20] = 1;
                                *(_DWORD *)&v111[8] = 1;
                                *(_DWORD *)&v111[12] = 1;
                                *(_DWORD *)&v110[4] = 1;
                                *(_DWORD *)&v110[8] = 1;
                                *(_DWORD *)v111 = 1;
                                *(_DWORD *)&v111[4] = 1;
                                *(_DWORD *)&v109[4] = 1;
                                *(_DWORD *)&v109[8] = 0;
                                *(_DWORD *)v110 = 1;
                                int v107 = 1;
                                *(_DWORD *)v109 = 1;
                                LODWORD(v121) = 1;
                              }
                            }
                          }
                          else
                          {
                            int v107 = 0;
                            *(void *)v109 = 0x100000000;
                            *(void *)&long long v121 = 0x100000000;
                            int v101 = 0;
                            int v106 = 0;
                            BOOL v120 = 0;
                            int v99 = 0;
                            int v104 = 0;
                            BOOL v119 = 0;
                            int v98 = 0;
                            int v103 = 0;
                            BOOL v118 = 0;
                            int v100 = 0;
                            int v105 = 0;
                            BOOL v117 = 0;
                            int v102 = 0;
                            uint64_t v108 = 0;
                            uint64_t v116 = 0;
                            int v12 = 0;
                            int v13 = 0;
                            BOOL v14 = 0;
                            BOOL v15 = 0;
                            *(void *)&v111[16] = 0x100000001;
                            *(void *)&v111[8] = 0x100000001;
                            *(_DWORD *)&v110[8] = 1;
                            *(void *)v111 = 0x100000001;
                            *(_DWORD *)&v109[8] = 0;
                            *(void *)v110 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        memset(v109, 0, sizeof(v109));
                        *(void *)v110 = 0x100000000;
                        *(void *)&long long v121 = 0;
                        int v107 = 0;
                        int v101 = 0;
                        int v106 = 0;
                        BOOL v120 = 0;
                        int v99 = 0;
                        int v104 = 0;
                        BOOL v119 = 0;
                        int v98 = 0;
                        int v103 = 0;
                        BOOL v118 = 0;
                        int v100 = 0;
                        int v105 = 0;
                        BOOL v117 = 0;
                        int v102 = 0;
                        uint64_t v108 = 0;
                        uint64_t v116 = 0;
                        int v12 = 0;
                        int v13 = 0;
                        BOOL v14 = 0;
                        BOOL v15 = 0;
                        *(void *)&v111[16] = 0x100000001;
                        *(void *)&v111[8] = 0x100000001;
                        *(_DWORD *)&v110[8] = 1;
                        *(void *)v111 = 0x100000001;
                        DWORD2(v121) = 1;
                      }
                    }
                  }
                  else
                  {
                    *(void *)v110 = 0;
                    *(void *)v111 = 0x100000000;
                    *(void *)((char *)&v121 + 4) = 0;
                    memset(v109, 0, sizeof(v109));
                    int v107 = 0;
                    LODWORD(v121) = 0;
                    int v101 = 0;
                    int v106 = 0;
                    BOOL v120 = 0;
                    int v99 = 0;
                    int v104 = 0;
                    BOOL v119 = 0;
                    int v98 = 0;
                    int v103 = 0;
                    BOOL v118 = 0;
                    int v100 = 0;
                    int v105 = 0;
                    BOOL v117 = 0;
                    int v102 = 0;
                    uint64_t v108 = 0;
                    uint64_t v116 = 0;
                    int v12 = 0;
                    int v13 = 0;
                    BOOL v14 = 0;
                    BOOL v15 = 0;
                    *(void *)&v111[16] = 0x100000001;
                    *(void *)&v111[8] = 0x100000001;
                    *(_DWORD *)&v110[8] = 1;
                  }
                }
                else
                {
                  *(void *)v110 = 0;
                  *(void *)v111 = 0x100000000;
                  *(void *)((char *)&v121 + 4) = 0;
                  memset(v109, 0, sizeof(v109));
                  int v107 = 0;
                  LODWORD(v121) = 0;
                  int v101 = 0;
                  int v106 = 0;
                  BOOL v120 = 0;
                  int v99 = 0;
                  int v104 = 0;
                  BOOL v119 = 0;
                  int v98 = 0;
                  int v103 = 0;
                  BOOL v118 = 0;
                  int v100 = 0;
                  int v105 = 0;
                  BOOL v117 = 0;
                  int v102 = 0;
                  uint64_t v108 = 0;
                  uint64_t v116 = 0;
                  int v12 = 0;
                  int v13 = 0;
                  BOOL v14 = 0;
                  BOOL v15 = 0;
                  *(void *)&v111[16] = 0x100000001;
                  *(void *)&v111[8] = 0x100000001;
                  *(_DWORD *)&v110[8] = 1;
                  *(_DWORD *)&v111[24] = 1;
                }
              }
            }
            else
            {
              *(void *)&v111[4] = 0;
              *(_DWORD *)&v111[24] = 0;
              *(void *)v110 = 0;
              *(_DWORD *)v111 = 0;
              *(void *)((char *)&v121 + 4) = 0;
              memset(v109, 0, sizeof(v109));
              int v107 = 0;
              LODWORD(v121) = 0;
              int v101 = 0;
              int v106 = 0;
              BOOL v120 = 0;
              int v99 = 0;
              int v104 = 0;
              BOOL v119 = 0;
              int v98 = 0;
              int v103 = 0;
              BOOL v118 = 0;
              int v100 = 0;
              int v105 = 0;
              BOOL v117 = 0;
              int v102 = 0;
              uint64_t v108 = 0;
              uint64_t v116 = 0;
              int v12 = 0;
              int v13 = 0;
              BOOL v14 = 0;
              BOOL v15 = 0;
              *(void *)&v111[16] = 0x100000001;
              *(_DWORD *)&v111[12] = 1;
              *(_DWORD *)&v110[8] = 1;
            }
            goto LABEL_16;
          }
          *(void *)&v111[24] = 0;
          *(void *)&v111[4] = 0;
          *(_DWORD *)v111 = 0;
          *(void *)((char *)&v121 + 4) = 0;
          memset(v109, 0, sizeof(v109));
          memset(v110, 0, sizeof(v110));
          int v107 = 0;
          LODWORD(v121) = 0;
          int v101 = 0;
          int v106 = 0;
          BOOL v120 = 0;
          int v99 = 0;
          int v104 = 0;
          BOOL v119 = 0;
          int v98 = 0;
          int v103 = 0;
          BOOL v118 = 0;
          int v100 = 0;
          int v105 = 0;
          BOOL v117 = 0;
          int v102 = 0;
          uint64_t v108 = 0;
          uint64_t v116 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          BOOL v15 = 0;
          *(void *)&v111[16] = 0x100000001;
          *(_DWORD *)&v111[12] = 1;
        }
        else
        {
          *(void *)&v111[24] = 0;
          *(_OWORD *)v111 = 0uLL;
          *(void *)((char *)&v121 + 4) = 0;
          memset(v109, 0, sizeof(v109));
          memset(v110, 0, sizeof(v110));
          int v107 = 0;
          LODWORD(v121) = 0;
          int v101 = 0;
          int v106 = 0;
          BOOL v120 = 0;
          int v99 = 0;
          int v104 = 0;
          BOOL v119 = 0;
          int v98 = 0;
          int v103 = 0;
          BOOL v118 = 0;
          int v100 = 0;
          int v105 = 0;
          BOOL v117 = 0;
          int v102 = 0;
          uint64_t v108 = 0;
          uint64_t v116 = 0;
          int v12 = 0;
          int v13 = 0;
          BOOL v14 = 0;
          BOOL v15 = 0;
          *(void *)&v111[16] = 0x100000001;
          HIDWORD(v121) = 1;
        }
      }
    }
    else
    {
      long long v121 = 0uLL;
      memset(v111, 0, 32);
      memset(v109, 0, sizeof(v109));
      memset(v110, 0, sizeof(v110));
      int v107 = 0;
      int v101 = 0;
      int v106 = 0;
      BOOL v120 = 0;
      int v99 = 0;
      int v104 = 0;
      BOOL v119 = 0;
      int v98 = 0;
      int v103 = 0;
      BOOL v118 = 0;
      int v100 = 0;
      int v105 = 0;
      BOOL v117 = 0;
      int v102 = 0;
      uint64_t v108 = 0;
      uint64_t v116 = 0;
      int v12 = 0;
      int v13 = 0;
      BOOL v14 = 0;
      BOOL v15 = 0;
      *(_DWORD *)&v111[32] = 1;
    }
  }
LABEL_16:
  if (v14)
  {
    int v17 = v13;

    int v13 = v17;
  }
  if (v13) {

  }
  if (v12)
  {
  }
  if (v116)
  {
  }
  if (*(_DWORD *)&v109[8]) {

  }
  if (v108)
  {
  }
  if (HIDWORD(v116))
  {
  }
  if (HIDWORD(v108)) {

  }
  if (v102)
  {
  }
  if (v117)
  {
  }
  if (v105) {

  }
  if (v100)
  {
  }
  if (v118)
  {
  }
  if (v103) {

  }
  if (v98)
  {
  }
  if (v119)
  {
  }
  if (v104) {

  }
  if (v99)
  {
  }
  if (v120)
  {
  }
  if (v106) {

  }
  if (v101)
  {
  }
  if (v121)
  {
  }
  if (*(_DWORD *)v109) {

  }
  if (v107)
  {
  }
  if (DWORD1(v121))
  {
  }
  if (*(_DWORD *)v110) {

  }
  if (*(_DWORD *)&v109[4])
  {
  }
  if (DWORD2(v121))
  {
  }
  if (*(_DWORD *)v111) {

  }
  if (*(_DWORD *)&v110[4])
  {
  }
  if (*(_DWORD *)&v111[24])
  {
  }
  if (*(_DWORD *)&v111[4]) {

  }
  if (*(_DWORD *)&v111[8])
  {
  }
  if (*(_DWORD *)&v111[28])
  {
  }
  if (*(_DWORD *)&v110[8]) {

  }
  if (*(_DWORD *)&v111[12])
  {
  }
  if (HIDWORD(v121))
  {
  }
  if (*(_DWORD *)&v111[16]) {

  }
  if (*(_DWORD *)&v111[20])
  {
  }
  if (*(_DWORD *)&v111[32])
  {
  }
  if (v113 != v112) {

  }
LABEL_99:
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v34.receiver = self;
  v34.super_class = (Class)SFMediaInfoCardSection;
  id v4 = [(SFCardSection *)&v34 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  unint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  uint64_t v11 = [(SFMediaInfoCardSection *)self type];
  int v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  int v13 = [(SFCardSection *)self backgroundColor];
  BOOL v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  BOOL v15 = [(SFMediaInfoCardSection *)self mediaItem];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setMediaItem:v16];

  int v17 = [(SFMediaInfoCardSection *)self details];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setDetails:v18];

  uint64_t v19 = [(SFMediaInfoCardSection *)self playAction];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setPlayAction:v20];

  v21 = [(SFMediaInfoCardSection *)self offers];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setOffers:v22];

  uint64_t v23 = [(SFMediaInfoCardSection *)self watchListIdentifier];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setWatchListIdentifier:v24];

  uint64_t v25 = [(SFMediaInfoCardSection *)self watchListButtonLabel];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setWatchListButtonLabel:v26];

  uint64_t v27 = [(SFMediaInfoCardSection *)self watchListContinuationText];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setWatchListContinuationText:v28];

  uint64_t v29 = [(SFMediaInfoCardSection *)self watchListConfirmationText];
  uint64_t v30 = (void *)[v29 copy];
  [v4 setWatchListConfirmationText:v30];

  objc_msgSend(v4, "setIsMediaContainer:", -[SFMediaInfoCardSection isMediaContainer](self, "isMediaContainer"));
  uint64_t v31 = [(SFMediaInfoCardSection *)self specialOfferButtonLabel];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setSpecialOfferButtonLabel:v32];

  objc_msgSend(v4, "setWatchListItemType:", -[SFMediaInfoCardSection watchListItemType](self, "watchListItemType"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMediaInfoCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMediaInfoCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMediaInfoCardSection alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBMediaInfoCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFMediaInfoCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFMediaInfoCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  unint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    uint64_t v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    int v12 = [(SFCardSection *)v8 type];
    [(SFMediaInfoCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    int v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    BOOL v14 = [(SFCardSection *)v8 mediaItem];
    [(SFMediaInfoCardSection *)v5 setMediaItem:v14];

    BOOL v15 = [(SFCardSection *)v8 details];
    [(SFMediaInfoCardSection *)v5 setDetails:v15];

    uint64_t v16 = [(SFCardSection *)v8 playAction];
    [(SFMediaInfoCardSection *)v5 setPlayAction:v16];

    int v17 = [(SFCardSection *)v8 offers];
    [(SFMediaInfoCardSection *)v5 setOffers:v17];

    uint64_t v18 = [(SFCardSection *)v8 watchListIdentifier];
    [(SFMediaInfoCardSection *)v5 setWatchListIdentifier:v18];

    uint64_t v19 = [(SFCardSection *)v8 watchListButtonLabel];
    [(SFMediaInfoCardSection *)v5 setWatchListButtonLabel:v19];

    uint64_t v20 = [(SFCardSection *)v8 watchListContinuationText];
    [(SFMediaInfoCardSection *)v5 setWatchListContinuationText:v20];

    v21 = [(SFCardSection *)v8 watchListConfirmationText];
    [(SFMediaInfoCardSection *)v5 setWatchListConfirmationText:v21];

    [(SFMediaInfoCardSection *)v5 setIsMediaContainer:[(SFCardSection *)v8 isMediaContainer]];
    uint64_t v22 = [(SFCardSection *)v8 specialOfferButtonLabel];
    [(SFMediaInfoCardSection *)v5 setSpecialOfferButtonLabel:v22];

    [(SFMediaInfoCardSection *)v5 setWatchListItemType:[(SFCardSection *)v8 watchListItemType]];
    uint64_t v23 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v23];

    uint64_t v24 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v24];

    uint64_t v25 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v25];

    uint64_t v26 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v26];

    uint64_t v27 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v27];

    uint64_t v28 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v28];

    uint64_t v29 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v29];

    uint64_t v30 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v30];

    uint64_t v31 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v31];

    uint64_t v32 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v32];

    int v33 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v33];

    objc_super v34 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v34];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    v35 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v35];

    v36 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v36];

    v37 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v37];

    v38 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v38];

    objc_super v39 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v39];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v40 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v40];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    id v41 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v41];

    v42 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v42];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v43 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v43];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasWatchListItemType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWatchListItemType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_watchListItemType = a3;
}

- (BOOL)hasIsMediaContainer
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsMediaContainer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isMediaContainer = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end