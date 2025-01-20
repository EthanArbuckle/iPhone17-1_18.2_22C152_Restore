@interface SFInfoCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasInitiallyVisibleTuples;
- (BOOL)isEqual:(id)a3;
- (NSArray)embeddedCards;
- (NSArray)infoTuples;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFInfoCardSection)initWithCoder:(id)a3;
- (SFInfoCardSection)initWithProtobuf:(id)a3;
- (id)cardsFromInfoTuple;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)initiallyVisibleTuples;
- (void)encodeWithCoder:(id)a3;
- (void)setInfoTuples:(id)a3;
- (void)setInitiallyVisibleTuples:(unint64_t)a3;
- (void)setType:(id)a3;
@end

@implementation SFInfoCardSection

- (SFInfoCardSection)initWithProtobuf:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SFInfoCardSection;
  v5 = [(SFCardSection *)&v42 init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
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
      [(SFInfoCardSection *)v5 setType:v19];
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
    v24 = [v4 infoTuples];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v26 = objc_msgSend(v4, "infoTuples", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[SFInfoTuple alloc] initWithProtobuf:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }

    [(SFInfoCardSection *)v5 setInfoTuples:v25];
    if ([v4 initiallyVisibleTuples]) {
      -[SFInfoCardSection setInitiallyVisibleTuples:](v5, "setInitiallyVisibleTuples:", [v4 initiallyVisibleTuples]);
    }
    v32 = v5;
  }
  return v5;
}

- (id)cardsFromInfoTuple
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(SFInfoCardSection *)self infoTuples];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(SFInfoCardSection *)self infoTuples];
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = [v10 values];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v20 + 1) + 8 * j) command];
              v17 = [v16 embeddedCards];
              [v5 addObjectsFromArray:v17];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  return v5;
}

- (NSArray)embeddedCards
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(SFInfoCardSection *)self infoTuples];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v9.receiver = self;
  v9.super_class = (Class)SFInfoCardSection;
  uint64_t v6 = [(SFCardSection *)&v9 embeddedCards];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [(SFInfoCardSection *)self cardsFromInfoTuple];
  [v5 addObjectsFromArray:v7];

  return (NSArray *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoTuples, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (unint64_t)initiallyVisibleTuples
{
  return self->_initiallyVisibleTuples;
}

- (void)setInfoTuples:(id)a3
{
}

- (NSArray)infoTuples
{
  return self->_infoTuples;
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
  v22.receiver = self;
  v22.super_class = (Class)SFInfoCardSection;
  unint64_t v3 = [(SFCardSection *)&v22 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  uint64_t v13 = [(SFInfoCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFInfoCardSection *)self infoTuples];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  unint64_t v20 = v19 ^ [(SFInfoCardSection *)self initiallyVisibleTuples];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFInfoCardSection *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFInfoCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v71.receiver = self;
      v71.super_class = (Class)SFInfoCardSection;
      if ([(SFCardSection *)&v71 isEqual:v5])
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        uint64_t v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v9 = [(SFCardSection *)self punchoutOptions];
        if (v9)
        {
          uint64_t v10 = [(SFCardSection *)self punchoutOptions];
          unint64_t v3 = [(SFCardSection *)v6 punchoutOptions];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_56;
          }
          v70 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        uint64_t v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
          if (v14)
          {
            v63 = v3;
            v65 = v12;
            uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
            v16 = [(SFCardSection *)v6 punchoutPickerTitle];
            if (([v15 isEqual:v16] & 1) == 0)
            {

              BOOL v11 = 0;
              uint64_t v10 = v70;
              unint64_t v3 = v63;
              if (!v9) {
                goto LABEL_57;
              }
              goto LABEL_56;
            }
            v61 = v16;
            v62 = v15;
            v67 = v8;
            v68 = v6;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            unint64_t v3 = v63;
            unint64_t v20 = v65;
            long long v21 = v14;
          }
          else
          {
            v67 = v8;
            v68 = v6;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            unint64_t v20 = v12;
            long long v21 = 0;
          }
          objc_super v22 = [(SFCardSection *)self punchoutPickerDismissText];
          long long v23 = [(SFCardSection *)v68 punchoutPickerDismissText];
          long long v24 = v21;
          uint64_t v12 = v20;
          uint64_t v13 = v19;
          uint64_t v9 = v18;
          uint64_t v7 = v17;
          uint64_t v8 = v67;
          if ((v22 == 0) != (v23 != 0))
          {
            v58 = v13;
            v59 = v23;
            v60 = v22;
            v64 = [(SFCardSection *)self punchoutPickerDismissText];
            if (v64)
            {
              uint64_t v13 = [(SFCardSection *)self punchoutPickerDismissText];
              uint64_t v6 = v68;
              v56 = [(SFCardSection *)v68 punchoutPickerDismissText];
              if (!objc_msgSend(v13, "isEqual:")) {
                goto LABEL_28;
              }
            }
            else
            {
              uint64_t v6 = v68;
            }
            v57 = v24;
            BOOL v25 = [(SFCardSection *)self canBeHidden];
            if (v25 != [(SFCardSection *)v6 canBeHidden]
              || (BOOL v26 = [(SFCardSection *)self hasTopPadding],
                  v26 != [(SFCardSection *)v6 hasTopPadding])
              || (BOOL v27 = [(SFCardSection *)self hasBottomPadding],
                  v27 != [(SFCardSection *)v6 hasBottomPadding]))
            {
              long long v24 = v57;
              if (!v64)
              {
LABEL_29:

                if (v24)
                {
                }
                goto LABEL_54;
              }
LABEL_28:

              goto LABEL_29;
            }
            uint64_t v28 = [(SFInfoCardSection *)self type];
            uint64_t v29 = [(SFInfoCardSection *)v6 type];
            if ((v28 == 0) != (v29 != 0))
            {
              id v55 = v29;
              v69 = v28;
              uint64_t v30 = [(SFInfoCardSection *)self type];
              if (v30)
              {
                v54 = [(SFInfoCardSection *)self type];
                v52 = [(SFInfoCardSection *)v6 type];
                if (!objc_msgSend(v54, "isEqual:"))
                {
                  BOOL v11 = 0;
                  goto LABEL_72;
                }
                v53 = v30;
              }
              else
              {
                v53 = 0;
              }
              int v31 = [(SFCardSection *)self separatorStyle];
              if (v31 != [(SFCardSection *)v6 separatorStyle])
              {
                BOOL v11 = 0;
                goto LABEL_71;
              }
              v51 = [(SFCardSection *)self backgroundColor];
              v32 = [(SFCardSection *)v6 backgroundColor];
              if ((v51 == 0) != (v32 != 0))
              {
                v33 = v32;
                v49 = v7;
                v50 = v13;
                v48 = v9;
                v66 = v12;
                long long v34 = v3;
                long long v35 = [(SFCardSection *)self backgroundColor];
                if (v35)
                {
                  long long v36 = [(SFCardSection *)self backgroundColor];
                  v46 = [(SFCardSection *)v6 backgroundColor];
                  v47 = v36;
                  if (!objc_msgSend(v36, "isEqual:"))
                  {
                    BOOL v11 = 0;
                    goto LABEL_69;
                  }
                }
                long long v38 = [(SFInfoCardSection *)self infoTuples];
                long long v39 = [(SFInfoCardSection *)v6 infoTuples];
                long long v40 = v39;
                if ((v38 == 0) == (v39 != 0))
                {

                  BOOL v11 = 0;
                  if (!v35) {
                    goto LABEL_70;
                  }
                  goto LABEL_69;
                }
                long long v41 = [(SFInfoCardSection *)self infoTuples];
                if (!v41
                  || ([(SFInfoCardSection *)self infoTuples],
                      objc_super v42 = objc_claimAutoreleasedReturnValue(),
                      [(SFInfoCardSection *)v6 infoTuples],
                      v44 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v45 = v42,
                      objc_msgSend(v42, "isEqual:")))
                {
                  unint64_t v43 = [(SFInfoCardSection *)self initiallyVisibleTuples];
                  BOOL v11 = v43 == [(SFInfoCardSection *)v6 initiallyVisibleTuples];
                  if (!v41) {
                    goto LABEL_68;
                  }
                }
                else
                {
                  BOOL v11 = 0;
                }

LABEL_68:
                if (!v35)
                {
LABEL_70:

                  unint64_t v3 = v34;
                  uint64_t v12 = v66;
                  uint64_t v8 = v67;
                  uint64_t v9 = v48;
                  uint64_t v7 = v49;
                  uint64_t v13 = v50;
LABEL_71:
                  uint64_t v30 = v53;
                  if (!v53)
                  {
LABEL_73:

                    if (v64)
                    {
                    }
                    if (v57)
                    {
                    }
LABEL_55:
                    uint64_t v10 = v70;
                    if (!v9)
                    {
LABEL_57:

                      goto LABEL_58;
                    }
LABEL_56:

                    goto LABEL_57;
                  }
LABEL_72:

                  goto LABEL_73;
                }
LABEL_69:

                goto LABEL_70;
              }

              if (v53)
              {
              }
              uint64_t v28 = v69;
              uint64_t v29 = v55;
            }
            v68 = v6;

            long long v24 = v57;
            if (v64)
            {
            }
            long long v23 = v59;
            objc_super v22 = v60;
            uint64_t v13 = v58;
          }

          if (v24)
          {
          }
          uint64_t v6 = v68;
        }

LABEL_54:
        BOOL v11 = 0;
        goto LABEL_55;
      }
    }
    BOOL v11 = 0;
  }
LABEL_59:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SFInfoCardSection;
  id v4 = [(SFCardSection *)&v18 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  BOOL v11 = [(SFInfoCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  uint64_t v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFInfoCardSection *)self infoTuples];
  v16 = (void *)[v15 copy];
  [v4 setInfoTuples:v16];

  objc_msgSend(v4, "setInitiallyVisibleTuples:", -[SFInfoCardSection initiallyVisibleTuples](self, "initiallyVisibleTuples"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBInfoCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBInfoCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBInfoCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBInfoCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFInfoCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFInfoCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  uint64_t v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    BOOL v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFInfoCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    uint64_t v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 infoTuples];
    [(SFInfoCardSection *)v5 setInfoTuples:v14];

    [(SFInfoCardSection *)v5 setInitiallyVisibleTuples:[(SFCardSection *)v8 initiallyVisibleTuples]];
    uint64_t v15 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v15];

    v16 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v16];

    uint64_t v17 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v17];

    objc_super v18 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v18];

    uint64_t v19 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v19];

    unint64_t v20 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v20];

    long long v21 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v21];

    objc_super v22 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v22];

    long long v23 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v23];

    long long v24 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v24];

    BOOL v25 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v25];

    BOOL v26 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v26];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    BOOL v27 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v27];

    uint64_t v28 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v28];

    uint64_t v29 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v29];

    uint64_t v30 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v30];

    int v31 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v31];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v32 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v32];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v33 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v33];

    long long v34 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v34];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    long long v35 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v35];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasInitiallyVisibleTuples
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInitiallyVisibleTuples:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_initiallyVisibleTuples = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end