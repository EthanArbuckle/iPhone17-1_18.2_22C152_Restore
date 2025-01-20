@interface SFLinkPresentationCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsHighlighted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (NSArray)peopleToBadge;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)coreSpotlightIdentifier;
- (NSString)url;
- (SFLinkPresentationCardSection)initWithCoder:(id)a3;
- (SFLinkPresentationCardSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoreSpotlightIdentifier:(id)a3;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setPeopleToBadge:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFLinkPresentationCardSection

- (SFLinkPresentationCardSection)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFLinkPresentationCardSection;
  v5 = [(SFCardSection *)&v24 init];
  if (v5)
  {
    v6 = [v4 coreSpotlightIdentifier];

    if (v6)
    {
      v7 = [v4 coreSpotlightIdentifier];
      [(SFLinkPresentationCardSection *)v5 setCoreSpotlightIdentifier:v7];
    }
    v8 = [v4 url];

    if (v8)
    {
      v9 = [v4 url];
      [(SFLinkPresentationCardSection *)v5 setUrl:v9];
    }
    v10 = [v4 peopleToBadges];
    if (v10) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v11 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend(v4, "peopleToBadges", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[SFPerson alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    [(SFLinkPresentationCardSection *)v5 setPeopleToBadge:v11];
    if ([v4 isHighlighted]) {
      -[SFLinkPresentationCardSection setIsHighlighted:](v5, "setIsHighlighted:", [v4 isHighlighted]);
    }
    v18 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleToBadge, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_coreSpotlightIdentifier, 0);
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setPeopleToBadge:(id)a3
{
}

- (NSArray)peopleToBadge
{
  return self->_peopleToBadge;
}

- (void)setUrl:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setCoreSpotlightIdentifier:(id)a3
{
}

- (NSString)coreSpotlightIdentifier
{
  return self->_coreSpotlightIdentifier;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFLinkPresentationCardSection;
  unint64_t v3 = [(SFCardSection *)&v12 hash];
  id v4 = [(SFLinkPresentationCardSection *)self coreSpotlightIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFLinkPresentationCardSection *)self url];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFLinkPresentationCardSection *)self peopleToBadge];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFLinkPresentationCardSection *)self isHighlighted] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFLinkPresentationCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFLinkPresentationCardSection *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFLinkPresentationCardSection;
      if ([(SFCardSection *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFLinkPresentationCardSection *)self coreSpotlightIdentifier];
        v8 = [(SFLinkPresentationCardSection *)v6 coreSpotlightIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFLinkPresentationCardSection *)self coreSpotlightIdentifier];
        if (v9)
        {
          unint64_t v10 = [(SFLinkPresentationCardSection *)self coreSpotlightIdentifier];
          unint64_t v3 = [(SFLinkPresentationCardSection *)v6 coreSpotlightIdentifier];
          if (![v10 isEqual:v3])
          {
            LOBYTE(v11) = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFLinkPresentationCardSection *)self url];
        uint64_t v13 = [(SFLinkPresentationCardSection *)v6 url];
        uint64_t v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          LOBYTE(v11) = 0;
          goto LABEL_30;
        }
        uint64_t v15 = [(SFLinkPresentationCardSection *)self url];
        if (v15)
        {
          uint64_t v26 = v12;
          v16 = [(SFLinkPresentationCardSection *)self url];
          v29 = [(SFLinkPresentationCardSection *)v6 url];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            LOBYTE(v11) = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        v17 = [(SFLinkPresentationCardSection *)self peopleToBadge];
        v18 = [(SFLinkPresentationCardSection *)v6 peopleToBadge];
        if ((v17 == 0) == (v18 != 0))
        {

          LOBYTE(v11) = 0;
          uint64_t v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        objc_super v24 = v18;
        v25 = v17;
        [(SFLinkPresentationCardSection *)self peopleToBadge];
        v27 = uint64_t v15 = v31;
        if (!v27
          || ([(SFLinkPresentationCardSection *)self peopleToBadge],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFLinkPresentationCardSection *)v6 peopleToBadge],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              long long v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          BOOL v20 = [(SFLinkPresentationCardSection *)self isHighlighted];
          BOOL v11 = v20 ^ [(SFLinkPresentationCardSection *)v6 isHighlighted] ^ 1;
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFLinkPresentationCardSection;
  id v4 = [(SFCardSection *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFLinkPresentationCardSection *)self coreSpotlightIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setCoreSpotlightIdentifier:v6];

  uint64_t v7 = [(SFLinkPresentationCardSection *)self url];
  v8 = (void *)[v7 copy];
  [v4 setUrl:v8];

  uint64_t v9 = [(SFLinkPresentationCardSection *)self peopleToBadge];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setPeopleToBadge:v10];

  objc_msgSend(v4, "setIsHighlighted:", -[SFLinkPresentationCardSection isHighlighted](self, "isHighlighted"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBLinkPresentationCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLinkPresentationCardSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBLinkPresentationCardSection alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBLinkPresentationCardSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFLinkPresentationCardSection;
  [(SFCardSection *)&v3 encodeWithCoder:a3];
}

- (SFLinkPresentationCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFCardSection *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCardSection alloc] initWithData:v6];
  v8 = [[SFCardSection alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(SFCardSection *)v8 coreSpotlightIdentifier];
    [(SFLinkPresentationCardSection *)v5 setCoreSpotlightIdentifier:v9];

    unint64_t v10 = [(SFCardSection *)v8 url];
    [(SFLinkPresentationCardSection *)v5 setUrl:v10];

    BOOL v11 = [(SFCardSection *)v8 peopleToBadge];
    [(SFLinkPresentationCardSection *)v5 setPeopleToBadge:v11];

    [(SFLinkPresentationCardSection *)v5 setIsHighlighted:[(SFCardSection *)v8 isHighlighted]];
    objc_super v12 = [(SFCardSection *)v8 nextCard];
    [(SFCardSection *)v5 setNextCard:v12];

    uint64_t v13 = [(SFCardSection *)v8 commands];
    [(SFCardSection *)v5 setCommands:v13];

    uint64_t v14 = [(SFCardSection *)v8 parameterKeyPaths];
    [(SFCardSection *)v5 setParameterKeyPaths:v14];

    uint64_t v15 = [(SFCardSection *)v8 cardSectionId];
    [(SFCardSection *)v5 setCardSectionId:v15];

    v16 = [(SFCardSection *)v8 resultIdentifier];
    [(SFCardSection *)v5 setResultIdentifier:v16];

    v17 = [(SFCardSection *)v8 userReportRequest];
    [(SFCardSection *)v5 setUserReportRequest:v17];

    v18 = [(SFCardSection *)v8 command];
    [(SFCardSection *)v5 setCommand:v18];

    v19 = [(SFCardSection *)v8 previewCommand];
    [(SFCardSection *)v5 setPreviewCommand:v19];

    BOOL v20 = [(SFCardSection *)v8 previewButtonItems];
    [(SFCardSection *)v5 setPreviewButtonItems:v20];

    long long v21 = [(SFCardSection *)v8 cardSectionDetail];
    [(SFCardSection *)v5 setCardSectionDetail:v21];

    long long v22 = [(SFCardSection *)v8 previewButtonItemsTitle];
    [(SFCardSection *)v5 setPreviewButtonItemsTitle:v22];

    long long v23 = [(SFCardSection *)v8 backgroundColor];
    [(SFCardSection *)v5 setBackgroundColor:v23];

    [(SFCardSection *)v5 setShouldHideInAmbientMode:[(SFCardSection *)v8 shouldHideInAmbientMode]];
    objc_super v24 = [(SFCardSection *)v8 leadingSwipeButtonItems];
    [(SFCardSection *)v5 setLeadingSwipeButtonItems:v24];

    v25 = [(SFCardSection *)v8 trailingSwipeButtonItems];
    [(SFCardSection *)v5 setTrailingSwipeButtonItems:v25];

    uint64_t v26 = [(SFCardSection *)v8 punchoutOptions];
    [(SFCardSection *)v5 setPunchoutOptions:v26];

    v27 = [(SFCardSection *)v8 punchoutPickerTitle];
    [(SFCardSection *)v5 setPunchoutPickerTitle:v27];

    v28 = [(SFCardSection *)v8 punchoutPickerDismissText];
    [(SFCardSection *)v5 setPunchoutPickerDismissText:v28];

    [(SFCardSection *)v5 setCanBeHidden:[(SFCardSection *)v8 canBeHidden]];
    [(SFCardSection *)v5 setHasTopPadding:[(SFCardSection *)v8 hasTopPadding]];
    [(SFCardSection *)v5 setHasBottomPadding:[(SFCardSection *)v8 hasBottomPadding]];
    [(SFCardSection *)v5 setSeparatorStyle:[(SFCardSection *)v8 separatorStyle]];
    v29 = [(SFCardSection *)v8 referencedCommands];
    [(SFCardSection *)v5 setReferencedCommands:v29];

    [(SFCardSection *)v5 setForceEnable3DTouch:[(SFCardSection *)v8 forceEnable3DTouch]];
    [(SFCardSection *)v5 setShouldShowInSmartDialog:[(SFCardSection *)v8 shouldShowInSmartDialog]];
    v30 = [(SFCardSection *)v8 appEntityAnnotation];
    [(SFCardSection *)v5 setAppEntityAnnotation:v30];

    v31 = [(SFCardSection *)v8 emphasisSubjectId];
    [(SFCardSection *)v5 setEmphasisSubjectId:v31];

    [(SFCardSection *)v5 setIncreasedContrastMode:[(SFCardSection *)v8 increasedContrastMode]];
    v32 = [(SFCardSection *)v8 secondaryCommand];
    [(SFCardSection *)v5 setSecondaryCommand:v32];

    [(SFCardSection *)v5 setRequiredLevelOfDetail:[(SFCardSection *)v8 requiredLevelOfDetail]];
  }

  return v5;
}

- (BOOL)hasIsHighlighted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsHighlighted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isHighlighted = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end