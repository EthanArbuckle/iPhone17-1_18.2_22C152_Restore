@interface SFMapPlaceCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSearchDirectionsAlongCurrentRoute;
- (NSData)detourInfoData;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)type;
- (SFMapPlaceCardSection)initWithCoder:(id)a3;
- (SFMapPlaceCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDetourInfoData:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3;
- (void)setType:(id)a3;
@end

@implementation SFMapPlaceCardSection

- (SFMapPlaceCardSection)initWithProtobuf:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFMapPlaceCardSection;
  v5 = [(SFCardSection *)&v34 init];
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
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
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
          v13 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
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
      [(SFMapPlaceCardSection *)v5 setType:v19];
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
    v24 = [v4 mapsData];

    if (v24)
    {
      v25 = [v4 mapsData];
      [(SFMapPlaceCardSection *)v5 setMapsData:v25];
    }
    if ([v4 shouldSearchDirectionsAlongCurrentRoute]) {
      -[SFMapPlaceCardSection setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v4 shouldSearchDirectionsAlongCurrentRoute]);
    }
    v26 = [v4 detourInfoData];

    if (v26)
    {
      v27 = [v4 detourInfoData];
      [(SFMapPlaceCardSection *)v5 setDetourInfoData:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detourInfoData, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setDetourInfoData:(id)a3
{
}

- (NSData)detourInfoData
{
  return self->_detourInfoData;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (void)setMapsData:(id)a3
{
}

- (NSData)mapsData
{
  return self->_mapsData;
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
  v24.receiver = self;
  v24.super_class = (Class)SFMapPlaceCardSection;
  unint64_t v3 = [(SFCardSection *)&v24 hash];
  id v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 hash];
  v6 = [(SFCardSection *)self punchoutPickerTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v9 = v7 ^ [v8 hash];
  uint64_t v10 = v9 ^ [(SFCardSection *)self canBeHidden];
  unint64_t v11 = v10 ^ [(SFCardSection *)self hasTopPadding] ^ v3;
  uint64_t v12 = [(SFCardSection *)self hasBottomPadding];
  v13 = [(SFMapPlaceCardSection *)self type];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = v14 ^ [(SFCardSection *)self separatorStyle];
  v16 = [(SFCardSection *)self backgroundColor];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFMapPlaceCardSection *)self mapsData];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  uint64_t v20 = [(SFMapPlaceCardSection *)self shouldSearchDirectionsAlongCurrentRoute];
  v21 = [(SFMapPlaceCardSection *)self detourInfoData];
  unint64_t v22 = v19 ^ v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFMapPlaceCardSection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFMapPlaceCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v80.receiver = self;
      v80.super_class = (Class)SFMapPlaceCardSection;
      if ([(SFCardSection *)&v80 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFCardSection *)self punchoutOptions];
        v8 = [(SFCardSection *)v6 punchoutOptions];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
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
            char v11 = 0;
            goto LABEL_56;
          }
          v79 = v10;
        }
        uint64_t v12 = [(SFCardSection *)self punchoutPickerTitle];
        v13 = [(SFCardSection *)v6 punchoutPickerTitle];
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v14 = [(SFCardSection *)self punchoutPickerTitle];
          v76 = v3;
          if (v14)
          {
            v73 = v12;
            uint64_t v15 = [(SFCardSection *)self punchoutPickerTitle];
            v16 = [(SFCardSection *)v6 punchoutPickerTitle];
            if (([v15 isEqual:v16] & 1) == 0)
            {

LABEL_31:
              char v11 = 0;
              goto LABEL_32;
            }
            v71 = v16;
            v72 = v15;
            v77 = v6;
            v75 = v8;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            uint64_t v20 = v73;
            unint64_t v3 = v76;
            v21 = v14;
          }
          else
          {
            v77 = v6;
            v75 = v8;
            uint64_t v17 = v7;
            v18 = v9;
            uint64_t v19 = v13;
            uint64_t v20 = v12;
            v21 = 0;
          }
          unint64_t v22 = [(SFCardSection *)self punchoutPickerDismissText];
          v23 = [(SFCardSection *)v77 punchoutPickerDismissText];
          objc_super v24 = v21;
          uint64_t v12 = v20;
          v13 = v19;
          uint64_t v9 = v18;
          uint64_t v7 = v17;
          v8 = v75;
          if ((v22 == 0) != (v23 != 0))
          {
            v69 = v23;
            v70 = v22;
            v74 = [(SFCardSection *)self punchoutPickerDismissText];
            if (v74)
            {
              v25 = [(SFCardSection *)self punchoutPickerDismissText];
              v6 = v77;
              v66 = [(SFCardSection *)v77 punchoutPickerDismissText];
              v67 = v25;
              int v26 = objc_msgSend(v25, "isEqual:");
              v27 = v70;
              if (!v26) {
                goto LABEL_27;
              }
            }
            else
            {
              v6 = v77;
              v27 = v70;
            }
            v68 = v24;
            BOOL v28 = [(SFCardSection *)self canBeHidden];
            if (v28 != [(SFCardSection *)v6 canBeHidden]
              || (BOOL v29 = [(SFCardSection *)self hasTopPadding],
                  v29 != [(SFCardSection *)v6 hasTopPadding])
              || (BOOL v30 = [(SFCardSection *)self hasBottomPadding],
                  v30 != [(SFCardSection *)v6 hasBottomPadding]))
            {
              objc_super v24 = v68;
              if (!v74)
              {
LABEL_28:

                if (v24)
                {
                }
                goto LABEL_31;
              }
LABEL_27:

              goto LABEL_28;
            }
            v65 = v13;
            long long v31 = [(SFMapPlaceCardSection *)self type];
            long long v32 = [(SFMapPlaceCardSection *)v6 type];
            if ((v31 == 0) != (v32 != 0))
            {
              v78 = v31;
              id v64 = v32;
              long long v33 = [(SFMapPlaceCardSection *)self type];
              if (v33)
              {
                uint64_t v34 = [(SFMapPlaceCardSection *)self type];
                uint64_t v35 = [(SFMapPlaceCardSection *)v6 type];
                v62 = (void *)v34;
                uint64_t v36 = (void *)v34;
                long long v31 = (void *)v35;
                if (![v36 isEqual:v35])
                {
                  char v11 = 0;
                  goto LABEL_68;
                }
                v63 = v33;
              }
              else
              {
                v63 = 0;
              }
              int v37 = [(SFCardSection *)self separatorStyle];
              if (v37 != [(SFCardSection *)v6 separatorStyle])
              {
                char v11 = 0;
                goto LABEL_67;
              }
              v38 = [(SFCardSection *)self backgroundColor];
              v39 = [(SFCardSection *)v6 backgroundColor];
              if ((v38 == 0) != (v39 != 0))
              {
                v60 = v31;
                v61 = v39;
                v59 = v7;
                v40 = v12;
                v41 = [(SFCardSection *)self backgroundColor];
                if (v41)
                {
                  v42 = [(SFCardSection *)self backgroundColor];
                  v57 = [(SFCardSection *)v6 backgroundColor];
                  v58 = v42;
                  if (!objc_msgSend(v42, "isEqual:"))
                  {
                    char v11 = 0;
                    goto LABEL_65;
                  }
                }
                v44 = [(SFMapPlaceCardSection *)self mapsData];
                v45 = [(SFMapPlaceCardSection *)v6 mapsData];
                v46 = v45;
                if ((v44 == 0) == (v45 != 0))
                {

                  char v11 = 0;
                  if (!v41)
                  {
LABEL_66:

                    uint64_t v12 = v40;
                    uint64_t v7 = v59;
                    long long v31 = v60;
                    v8 = v75;
                    v27 = v70;
LABEL_67:
                    long long v33 = v63;
                    if (!v63)
                    {
LABEL_69:

                      if (v74)
                      {
                      }
                      if (v68)
                      {
                      }
LABEL_32:
                      uint64_t v10 = v79;
                      unint64_t v3 = v76;
                      if (!v9) {
                        goto LABEL_57;
                      }
                      goto LABEL_56;
                    }
LABEL_68:

                    goto LABEL_69;
                  }
LABEL_65:

                  goto LABEL_66;
                }
                v56 = [(SFMapPlaceCardSection *)self mapsData];
                if (v56)
                {
                  v47 = [(SFMapPlaceCardSection *)self mapsData];
                  v54 = [(SFMapPlaceCardSection *)v6 mapsData];
                  v55 = v47;
                  if (!objc_msgSend(v47, "isEqual:"))
                  {
                    char v11 = 0;
LABEL_81:

LABEL_82:
                    if (!v41) {
                      goto LABEL_66;
                    }
                    goto LABEL_65;
                  }
                }
                BOOL v48 = [(SFMapPlaceCardSection *)self shouldSearchDirectionsAlongCurrentRoute];
                if (v48 == [(SFMapPlaceCardSection *)v6 shouldSearchDirectionsAlongCurrentRoute])
                {
                  v53 = [(SFMapPlaceCardSection *)self detourInfoData];
                  v52 = [(SFMapPlaceCardSection *)v6 detourInfoData];
                  if ((v53 == 0) != (v52 != 0))
                  {
                    v51 = [(SFMapPlaceCardSection *)self detourInfoData];
                    if (v51)
                    {
                      v50 = [(SFMapPlaceCardSection *)self detourInfoData];
                      v49 = [(SFMapPlaceCardSection *)v6 detourInfoData];
                      char v11 = [v50 isEqual:v49];
                    }
                    else
                    {

                      char v11 = 1;
                    }
LABEL_80:
                    if (!v56) {
                      goto LABEL_82;
                    }
                    goto LABEL_81;
                  }
                }
                char v11 = 0;
                goto LABEL_80;
              }

              if (v63)
              {
              }
              long long v32 = v64;
              long long v31 = v78;
            }
            v77 = v6;

            objc_super v24 = v68;
            if (v74)
            {
            }
            v23 = v69;
            unint64_t v22 = v70;
            unint64_t v3 = v76;
            v13 = v65;
          }

          if (v24)
          {
          }
          v6 = v77;
        }

        char v11 = 0;
        uint64_t v10 = v79;
        if (!v9)
        {
LABEL_57:

          goto LABEL_58;
        }
LABEL_56:

        goto LABEL_57;
      }
    }
    char v11 = 0;
  }
LABEL_59:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SFMapPlaceCardSection;
  id v4 = [(SFCardSection *)&v20 copyWithZone:a3];
  uint64_t v5 = [(SFCardSection *)self punchoutOptions];
  v6 = (void *)[v5 copy];
  [v4 setPunchoutOptions:v6];

  uint64_t v7 = [(SFCardSection *)self punchoutPickerTitle];
  v8 = (void *)[v7 copy];
  [v4 setPunchoutPickerTitle:v8];

  uint64_t v9 = [(SFCardSection *)self punchoutPickerDismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setPunchoutPickerDismissText:v10];

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  char v11 = [(SFMapPlaceCardSection *)self type];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setType:v12];

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  v13 = [(SFCardSection *)self backgroundColor];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setBackgroundColor:v14];

  uint64_t v15 = [(SFMapPlaceCardSection *)self mapsData];
  v16 = (void *)[v15 copy];
  [v4 setMapsData:v16];

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFMapPlaceCardSection shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  uint64_t v17 = [(SFMapPlaceCardSection *)self detourInfoData];
  v18 = (void *)[v17 copy];
  [v4 setDetourInfoData:v18];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBMapPlaceCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMapPlaceCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBMapPlaceCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBMapPlaceCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFMapPlaceCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFMapPlaceCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v9];

    uint64_t v10 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v10];

    char v11 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v11];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    uint64_t v12 = [(SFCardSection *)v8 type];
    [(SFMapPlaceCardSection *)v5 setType:v12];

    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v13 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v13];

    uint64_t v14 = [(SFCardSection *)v8 mapsData];
    [(SFMapPlaceCardSection *)v5 setMapsData:v14];

    [(SFMapPlaceCardSection *)v5 setShouldSearchDirectionsAlongCurrentRoute:[(SFCardSection *)v8 shouldSearchDirectionsAlongCurrentRoute]];
    uint64_t v15 = [(SFCardSection *)v8 detourInfoData];
    [(SFMapPlaceCardSection *)v5 setDetourInfoData:v15];

    v16 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v16];

    uint64_t v17 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v17];

    v18 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v18];

    uint64_t v19 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v19];

    objc_super v20 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v20];

    v21 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v21];

    unint64_t v22 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v22];

    v23 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v23];

    objc_super v24 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v24];

    v25 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v25];

    int v26 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v26];

    v27 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v27];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    BOOL v28 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v28];

    BOOL v29 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v29];

    BOOL v30 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v30];

    long long v31 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v31];

    long long v32 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v32];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    long long v33 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v33];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    uint64_t v34 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v34];

    uint64_t v35 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v35];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    uint64_t v36 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v36];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end