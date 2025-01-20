@interface SFWatchListItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsMediaContainer;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaContainer;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
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
- (SFWatchListItem)initWithCoder:(id)a3;
- (SFWatchListItem)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
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
@end

@implementation SFWatchListItem

- (SFWatchListItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFWatchListItem;
  v5 = [(SFWatchListItem *)&v28 init];
  if (v5)
  {
    v6 = [v4 watchListIdentifier];

    if (v6)
    {
      v7 = [v4 watchListIdentifier];
      [(SFWatchListItem *)v5 setWatchListIdentifier:v7];
    }
    v8 = [v4 seasonEpisodeTextFormat];

    if (v8)
    {
      v9 = [v4 seasonEpisodeTextFormat];
      [(SFWatchListItem *)v5 setSeasonEpisodeTextFormat:v9];
    }
    v10 = [v4 continueInTextFormat];

    if (v10)
    {
      v11 = [v4 continueInTextFormat];
      [(SFWatchListItem *)v5 setContinueInTextFormat:v11];
    }
    v12 = [v4 openButtonTitle];

    if (v12)
    {
      v13 = [v4 openButtonTitle];
      [(SFWatchListItem *)v5 setOpenButtonTitle:v13];
    }
    v14 = [v4 installButtonTitle];

    if (v14)
    {
      v15 = [v4 installButtonTitle];
      [(SFWatchListItem *)v5 setInstallButtonTitle:v15];
    }
    v16 = [v4 purchaseOfferTextFormat];

    if (v16)
    {
      v17 = [v4 purchaseOfferTextFormat];
      [(SFWatchListItem *)v5 setPurchaseOfferTextFormat:v17];
    }
    v18 = [v4 inUpNextText];

    if (v18)
    {
      v19 = [v4 inUpNextText];
      [(SFWatchListItem *)v5 setInUpNextText:v19];
    }
    v20 = [v4 addToUpNextText];

    if (v20)
    {
      v21 = [v4 addToUpNextText];
      [(SFWatchListItem *)v5 setAddToUpNextText:v21];
    }
    v22 = [v4 addedToUpNextText];

    if (v22)
    {
      v23 = [v4 addedToUpNextText];
      [(SFWatchListItem *)v5 setAddedToUpNextText:v23];
    }
    v24 = [v4 watchLiveTextFormat];

    if (v24)
    {
      v25 = [v4 watchLiveTextFormat];
      [(SFWatchListItem *)v5 setWatchLiveTextFormat:v25];
    }
    if ([v4 isMediaContainer]) {
      -[SFWatchListItem setIsMediaContainer:](v5, "setIsMediaContainer:", [v4 isMediaContainer]);
    }
    if ([v4 type]) {
      -[SFWatchListItem setType:](v5, "setType:", [v4 type]);
    }
    v26 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setWatchLiveTextFormat:(id)a3
{
}

- (NSString)watchLiveTextFormat
{
  return self->_watchLiveTextFormat;
}

- (void)setAddedToUpNextText:(id)a3
{
}

- (NSString)addedToUpNextText
{
  return self->_addedToUpNextText;
}

- (void)setAddToUpNextText:(id)a3
{
}

- (NSString)addToUpNextText
{
  return self->_addToUpNextText;
}

- (void)setInUpNextText:(id)a3
{
}

- (NSString)inUpNextText
{
  return self->_inUpNextText;
}

- (void)setPurchaseOfferTextFormat:(id)a3
{
}

- (NSString)purchaseOfferTextFormat
{
  return self->_purchaseOfferTextFormat;
}

- (void)setInstallButtonTitle:(id)a3
{
}

- (NSString)installButtonTitle
{
  return self->_installButtonTitle;
}

- (void)setOpenButtonTitle:(id)a3
{
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (void)setContinueInTextFormat:(id)a3
{
}

- (NSString)continueInTextFormat
{
  return self->_continueInTextFormat;
}

- (void)setSeasonEpisodeTextFormat:(id)a3
{
}

- (NSString)seasonEpisodeTextFormat
{
  return self->_seasonEpisodeTextFormat;
}

- (void)setWatchListIdentifier:(id)a3
{
}

- (NSString)watchListIdentifier
{
  return self->_watchListIdentifier;
}

- (unint64_t)hash
{
  v25 = [(SFWatchListItem *)self watchListIdentifier];
  uint64_t v3 = [v25 hash];
  v24 = [(SFWatchListItem *)self seasonEpisodeTextFormat];
  uint64_t v4 = [v24 hash] ^ v3;
  v23 = [(SFWatchListItem *)self continueInTextFormat];
  uint64_t v5 = [v23 hash];
  v6 = [(SFWatchListItem *)self openButtonTitle];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(SFWatchListItem *)self installButtonTitle];
  uint64_t v9 = [v8 hash];
  v10 = [(SFWatchListItem *)self purchaseOfferTextFormat];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFWatchListItem *)self inUpNextText];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [(SFWatchListItem *)self addToUpNextText];
  uint64_t v15 = [v14 hash];
  v16 = [(SFWatchListItem *)self addedToUpNextText];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFWatchListItem *)self watchLiveTextFormat];
  uint64_t v19 = v17 ^ [v18 hash];
  uint64_t v20 = v13 ^ v19 ^ [(SFWatchListItem *)self isMediaContainer];
  unint64_t v21 = v20 ^ [(SFWatchListItem *)self type];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFWatchListItem *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
    goto LABEL_112;
  }
  if (![(SFWatchListItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v18 = 0;
    goto LABEL_112;
  }
  uint64_t v5 = v4;
  v6 = [(SFWatchListItem *)self watchListIdentifier];
  id v95 = [(SFWatchListItem *)v5 watchListIdentifier];
  id v96 = v6;
  int v93 = v95 != 0;
  int v94 = v6 == 0;
  if (v94 == v93)
  {
    memset(v92, 0, sizeof(v92));
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    memset(v97, 0, 28);
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    goto LABEL_121;
  }
  uint64_t v7 = [(SFWatchListItem *)self watchListIdentifier];
  BOOL v8 = v7 != 0;
  v91 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = [(SFWatchListItem *)self watchListIdentifier];
    v86 = [(SFWatchListItem *)v5 watchListIdentifier];
    v87 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
    {
      int v10 = 0;
      memset(v92, 0, 44);
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v97, 0, 28);
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      HIDWORD(v92[5]) = 1;
      goto LABEL_121;
    }
  }
  v89 = [(SFWatchListItem *)self seasonEpisodeTextFormat];
  v88 = [(SFWatchListItem *)v5 seasonEpisodeTextFormat];
  HIDWORD(v92[5]) = v8;
  if ((v89 == 0) == (v88 != 0))
  {
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    memset(v92, 0, 36);
    int v14 = 0;
    int v15 = 0;
    memset(v97, 0, 28);
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    *(void *)((char *)&v92[4] + 4) = 1;
    goto LABEL_121;
  }
  uint64_t v19 = [(SFWatchListItem *)self seasonEpisodeTextFormat];
  LODWORD(v97[3]) = v19 != 0;
  v85 = (void *)v19;
  if (v19)
  {
    uint64_t v20 = [(SFWatchListItem *)self seasonEpisodeTextFormat];
    v81 = [(SFWatchListItem *)v5 seasonEpisodeTextFormat];
    v82 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v92, 0, 32);
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v97, 0, 24);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      LODWORD(v97[3]) = 1;
      goto LABEL_121;
    }
  }
  v84 = [(SFWatchListItem *)self continueInTextFormat];
  v83 = [(SFWatchListItem *)v5 continueInTextFormat];
  if ((v84 == 0) == (v83 != 0))
  {
    int v10 = 0;
    memset(v92, 0, 24);
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    memset(v97, 0, 24);
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 1;
    goto LABEL_121;
  }
  v80 = [(SFWatchListItem *)self continueInTextFormat];
  HIDWORD(v97[2]) = v80 != 0;
  if (v80)
  {
    unint64_t v21 = [(SFWatchListItem *)self continueInTextFormat];
    v76 = [(SFWatchListItem *)v5 continueInTextFormat];
    v77 = v21;
    if (!objc_msgSend(v21, "isEqual:"))
    {
      int v10 = 0;
      memset(v92, 0, 24);
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      memset(v97, 0, 20);
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      HIDWORD(v97[2]) = 1;
      goto LABEL_121;
    }
  }
  v79 = [(SFWatchListItem *)self openButtonTitle];
  v78 = [(SFWatchListItem *)v5 openButtonTitle];
  if ((v79 == 0) == (v78 != 0))
  {
    v92[0] = 0;
    v92[1] = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    memset(v97, 0, 20);
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 1;
    goto LABEL_121;
  }
  uint64_t v22 = [(SFWatchListItem *)self openButtonTitle];
  LODWORD(v97[2]) = v22 != 0;
  v75 = (void *)v22;
  if (v22)
  {
    v23 = [(SFWatchListItem *)self openButtonTitle];
    v71 = [(SFWatchListItem *)v5 openButtonTitle];
    v72 = v23;
    if (!objc_msgSend(v23, "isEqual:"))
    {
      v92[0] = 0;
      v92[1] = 0;
      int v10 = 0;
      v97[1] = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      v97[0] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      LODWORD(v92[5]) = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      LODWORD(v97[2]) = 1;
      goto LABEL_121;
    }
  }
  uint64_t v24 = [(SFWatchListItem *)self installButtonTitle];
  v73 = [(SFWatchListItem *)v5 installButtonTitle];
  v74 = (void *)v24;
  if ((v24 == 0) == (v73 != 0))
  {
    int v10 = 0;
    v92[0] = 0;
    v97[1] = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    v97[0] = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    LODWORD(v92[5]) = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 1;
    goto LABEL_121;
  }
  uint64_t v25 = [(SFWatchListItem *)self installButtonTitle];
  BOOL v26 = v25 != 0;
  v70 = (void *)v25;
  if (v25)
  {
    v27 = [(SFWatchListItem *)self installButtonTitle];
    v66 = [(SFWatchListItem *)v5 installButtonTitle];
    v67 = v27;
    if (!objc_msgSend(v27, "isEqual:"))
    {
      int v10 = 0;
      v92[0] = 0;
      v97[1] = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      v97[0] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      LODWORD(v92[5]) = 1;
      goto LABEL_121;
    }
    LODWORD(v92[5]) = v26;
  }
  else
  {
    LODWORD(v92[5]) = 0;
  }
  uint64_t v28 = [(SFWatchListItem *)self purchaseOfferTextFormat];
  v68 = [(SFWatchListItem *)v5 purchaseOfferTextFormat];
  v69 = (void *)v28;
  if ((v28 == 0) == (v68 != 0))
  {
    v92[0] = 0;
    v97[1] = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    v97[0] = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    goto LABEL_121;
  }
  v65 = [(SFWatchListItem *)self purchaseOfferTextFormat];
  HIDWORD(v97[1]) = v65 != 0;
  if (v65)
  {
    v29 = [(SFWatchListItem *)self purchaseOfferTextFormat];
    v61 = [(SFWatchListItem *)v5 purchaseOfferTextFormat];
    v62 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      int v11 = 0;
      int v12 = 0;
      *(void *)((char *)v97 + 4) = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      LODWORD(v97[0]) = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      int v10 = 1;
      v92[0] = 0x100000000;
      HIDWORD(v97[1]) = 1;
      goto LABEL_121;
    }
  }
  v64 = [(SFWatchListItem *)self inUpNextText];
  v63 = [(SFWatchListItem *)v5 inUpNextText];
  if ((v64 == 0) == (v63 != 0))
  {
    int v12 = 0;
    *(void *)((char *)v97 + 4) = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    LODWORD(v97[0]) = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    v92[0] = 0x100000000;
    int v11 = 1;
    goto LABEL_121;
  }
  v60 = [(SFWatchListItem *)self inUpNextText];
  LODWORD(v97[1]) = v60 != 0;
  if (v60)
  {
    v30 = [(SFWatchListItem *)self inUpNextText];
    v56 = [(SFWatchListItem *)v5 inUpNextText];
    v57 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      int v13 = 0;
      v97[0] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      int v10 = 1;
      v92[0] = 0x100000000;
      int v11 = 1;
      int v12 = 1;
      LODWORD(v97[1]) = 1;
      goto LABEL_121;
    }
  }
  uint64_t v31 = [(SFWatchListItem *)self addToUpNextText];
  v58 = [(SFWatchListItem *)v5 addToUpNextText];
  v59 = (void *)v31;
  if ((v31 == 0) == (v58 != 0))
  {
    v97[0] = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    v92[0] = 0x100000000;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    goto LABEL_121;
  }
  uint64_t v32 = [(SFWatchListItem *)self addToUpNextText];
  HIDWORD(v97[0]) = v32 != 0;
  v55 = (void *)v32;
  v43 = v5;
  if (v32)
  {
    v33 = [(SFWatchListItem *)self addToUpNextText];
    v51 = [(SFWatchListItem *)v5 addToUpNextText];
    v52 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      int v14 = 0;
      int v15 = 0;
      v97[0] = 0x100000000;
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      int v10 = 1;
      v92[0] = 0x100000001;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
LABEL_57:
      uint64_t v5 = v43;
      goto LABEL_121;
    }
  }
  v54 = [(SFWatchListItem *)self addedToUpNextText];
  v53 = [(SFWatchListItem *)v5 addedToUpNextText];
  if ((v54 == 0) == (v53 != 0))
  {
    int v15 = 0;
    LODWORD(v97[0]) = 0;
    int v16 = 0;
    int v17 = 0;
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    v92[0] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    goto LABEL_57;
  }
  uint64_t v34 = [(SFWatchListItem *)self addedToUpNextText];
  LODWORD(v97[0]) = v34 != 0;
  v50 = (void *)v34;
  if (v34)
  {
    v35 = [(SFWatchListItem *)self addedToUpNextText];
    v46 = [(SFWatchListItem *)v43 addedToUpNextText];
    v47 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      int v16 = 0;
      int v17 = 0;
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      int v10 = 1;
      v92[0] = 0x100000001;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      LODWORD(v97[0]) = 1;
      goto LABEL_57;
    }
  }
  v49 = [(SFWatchListItem *)self watchLiveTextFormat];
  v48 = [(SFWatchListItem *)v43 watchLiveTextFormat];
  if ((v49 == 0) == (v48 != 0))
  {
    int v17 = 0;
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    v92[0] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    goto LABEL_57;
  }
  uint64_t v36 = [(SFWatchListItem *)self watchLiveTextFormat];
  BOOL v90 = v36 != 0;
  v45 = (void *)v36;
  if (v36)
  {
    v37 = [(SFWatchListItem *)self watchLiveTextFormat];
    [(SFWatchListItem *)v43 watchLiveTextFormat];
    v42 = v44 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      BOOL v18 = 0;
      v92[4] = 0x100000001;
      v92[3] = 0x100000001;
      v92[2] = 0x100000001;
      v92[1] = 0x100000001;
      int v10 = 1;
      v92[0] = 0x100000001;
      int v11 = 1;
      int v12 = 1;
      int v13 = 1;
      int v14 = 1;
      int v15 = 1;
      int v16 = 1;
      int v17 = 1;
      int v38 = 1;
LABEL_118:
      uint64_t v5 = v43;
      goto LABEL_120;
    }
  }
  BOOL v40 = [(SFWatchListItem *)self isMediaContainer];
  if (v40 != [(SFWatchListItem *)v43 isMediaContainer])
  {
    BOOL v18 = 0;
    v92[4] = 0x100000001;
    v92[3] = 0x100000001;
    v92[2] = 0x100000001;
    v92[1] = 0x100000001;
    int v10 = 1;
    v92[0] = 0x100000001;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    int v14 = 1;
    int v15 = 1;
    int v16 = 1;
    int v17 = 1;
    int v38 = v90;
    goto LABEL_118;
  }
  int v41 = [(SFWatchListItem *)self type];
  uint64_t v5 = v43;
  BOOL v18 = v41 == [(SFWatchListItem *)v43 type];
  v92[4] = 0x100000001;
  v92[3] = 0x100000001;
  v92[2] = 0x100000001;
  v92[1] = 0x100000001;
  int v10 = 1;
  v92[0] = 0x100000001;
  int v11 = 1;
  int v12 = 1;
  int v13 = 1;
  int v14 = 1;
  int v15 = 1;
  int v16 = 1;
  int v17 = 1;
  int v38 = v90;
LABEL_120:
  if (v38)
  {

    int v16 = 1;
    int v15 = 1;
    int v12 = 1;
    int v10 = 1;
    int v14 = 1;
    int v11 = 1;
    int v13 = 1;
    goto LABEL_122;
  }
LABEL_121:
  if (!v17)
  {
    if (!v16) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_122:

  if (v16)
  {
LABEL_60:
  }
LABEL_61:
  if (LODWORD(v97[0]))
  {

    if (!v15) {
      goto LABEL_63;
    }
LABEL_114:

    if (!v14) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  if (v15) {
    goto LABEL_114;
  }
LABEL_63:
  if (v14)
  {
LABEL_64:
  }
LABEL_65:
  if (HIDWORD(v97[0]))
  {
  }
  if (LODWORD(v92[0])) {

  }
  if (v13)
  {
  }
  if (LODWORD(v97[1]))
  {
  }
  if (v12) {

  }
  if (v11)
  {
  }
  if (HIDWORD(v97[1]))
  {
  }
  if (HIDWORD(v92[0])) {

  }
  if (v10)
  {
  }
  if (LODWORD(v92[5]))
  {
  }
  if (HIDWORD(v92[1])) {

  }
  if (LODWORD(v92[1]))
  {
  }
  if (LODWORD(v97[2]))
  {
  }
  if (HIDWORD(v92[2])) {

  }
  if (LODWORD(v92[2]))
  {
  }
  if (HIDWORD(v97[2]))
  {
  }
  if (HIDWORD(v92[3])) {

  }
  if (LODWORD(v92[3]))
  {
  }
  if (LODWORD(v97[3]))
  {
  }
  if (LODWORD(v92[4])) {

  }
  if (HIDWORD(v92[4]))
  {
  }
  if (HIDWORD(v92[5]))
  {
  }
  if (v94 != v93) {

  }
LABEL_112:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFWatchListItem *)self watchListIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setWatchListIdentifier:v6];

  uint64_t v7 = [(SFWatchListItem *)self seasonEpisodeTextFormat];
  BOOL v8 = (void *)[v7 copy];
  [v4 setSeasonEpisodeTextFormat:v8];

  uint64_t v9 = [(SFWatchListItem *)self continueInTextFormat];
  int v10 = (void *)[v9 copy];
  [v4 setContinueInTextFormat:v10];

  int v11 = [(SFWatchListItem *)self openButtonTitle];
  int v12 = (void *)[v11 copy];
  [v4 setOpenButtonTitle:v12];

  int v13 = [(SFWatchListItem *)self installButtonTitle];
  int v14 = (void *)[v13 copy];
  [v4 setInstallButtonTitle:v14];

  int v15 = [(SFWatchListItem *)self purchaseOfferTextFormat];
  int v16 = (void *)[v15 copy];
  [v4 setPurchaseOfferTextFormat:v16];

  int v17 = [(SFWatchListItem *)self inUpNextText];
  BOOL v18 = (void *)[v17 copy];
  [v4 setInUpNextText:v18];

  uint64_t v19 = [(SFWatchListItem *)self addToUpNextText];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setAddToUpNextText:v20];

  unint64_t v21 = [(SFWatchListItem *)self addedToUpNextText];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setAddedToUpNextText:v22];

  v23 = [(SFWatchListItem *)self watchLiveTextFormat];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setWatchLiveTextFormat:v24];

  objc_msgSend(v4, "setIsMediaContainer:", -[SFWatchListItem isMediaContainer](self, "isMediaContainer"));
  objc_msgSend(v4, "setType:", -[SFWatchListItem type](self, "type"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBWatchListItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBWatchListItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBWatchListItem alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBWatchListItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBWatchListItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBWatchListItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFWatchListItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBWatchListItem alloc] initWithData:v5];
  uint64_t v7 = [(SFWatchListItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
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

@end