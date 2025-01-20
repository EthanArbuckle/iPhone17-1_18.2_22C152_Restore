@interface SFCard
+ (BOOL)supportsSecureCoding;
- (BOOL)flexibleSectionOrder;
- (BOOL)hasFlexibleSectionOrder;
- (BOOL)hasQueryId;
- (BOOL)hasSource;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (NSArray)cardSections;
- (NSArray)dismissalCommands;
- (NSArray)entityProtobufMessages;
- (NSData)_originalCardData;
- (NSData)entityIdentifier;
- (NSData)intentMessageData;
- (NSData)intentResponseMessageData;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)cardId;
- (NSString)contextReferenceIdentifier;
- (NSString)fbr;
- (NSString)intentMessageName;
- (NSString)intentResponseMessageName;
- (NSString)resultIdentifier;
- (NSString)title;
- (NSURL)urlValue;
- (SFCard)initWithCoder:(id)a3;
- (SFCard)initWithProtobuf:(id)a3;
- (SFColor)backgroundColor;
- (SFDrillDownMetadata)drilldownMetadata;
- (SFDrillDownMetadata)metadata;
- (SFImage)backgroundImage;
- (SFImage)titleImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int)source;
- (int)type;
- (unint64_t)hash;
- (unint64_t)queryId;
- (void)_setOriginalCardData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadCardSectionsWithCompletionAndErrorHandler:(id)a3;
- (void)loadCardSectionsWithCompletionHandler:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setCardId:(id)a3;
- (void)setCardSections:(id)a3;
- (void)setContextReferenceIdentifier:(id)a3;
- (void)setDismissalCommands:(id)a3;
- (void)setDrilldownMetadata:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setEntityProtobufMessages:(id)a3;
- (void)setFbr:(id)a3;
- (void)setFlexibleSectionOrder:(BOOL)a3;
- (void)setIntentMessageData:(id)a3;
- (void)setIntentMessageName:(id)a3;
- (void)setIntentResponseMessageData:(id)a3;
- (void)setIntentResponseMessageName:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSource:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleImage:(id)a3;
- (void)setType:(int)a3;
- (void)setUrlValue:(id)a3;
@end

@implementation SFCard

- (SFCard)initWithProtobuf:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)SFCard;
  v5 = [(SFCard *)&v88 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFCard *)v5 setTitle:v7];
    }
    if ([v4 type]) {
      -[SFCard setType:](v5, "setType:", [v4 type]);
    }
    v8 = [v4 cardSections];
    v75 = v5;
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v10 = [v4 cardSections];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v85 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[SFCardSection alloc] initWithProtobuf:*(void *)(*((void *)&v84 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v12);
    }

    [(SFCard *)v5 setCardSections:v9];
    v16 = [v4 intentMessageData];

    if (v16)
    {
      v17 = [v4 intentMessageData];
      [(SFCard *)v5 setIntentMessageData:v17];
    }
    v18 = [v4 intentMessageName];

    if (v18)
    {
      v19 = [v4 intentMessageName];
      [(SFCard *)v5 setIntentMessageName:v19];
    }
    v20 = [v4 intentResponseMessageData];

    if (v20)
    {
      v21 = [v4 intentResponseMessageData];
      [(SFCard *)v5 setIntentResponseMessageData:v21];
    }
    v22 = [v4 intentResponseMessageName];

    if (v22)
    {
      v23 = [v4 intentResponseMessageName];
      [(SFCard *)v5 setIntentResponseMessageName:v23];
    }
    v24 = [v4 dismissalCommands];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v26 = [v4 dismissalCommands];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v80 objects:v90 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v81 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[SFAbstractCommand alloc] initWithProtobuf:*(void *)(*((void *)&v80 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v80 objects:v90 count:16];
      }
      while (v28);
    }

    [(SFCard *)v75 setDismissalCommands:v25];
    v32 = [v4 cardId];

    if (v32)
    {
      v33 = [v4 cardId];
      [(SFCard *)v75 setCardId:v33];
    }
    v34 = [v4 contextReferenceIdentifier];

    if (v34)
    {
      v35 = [v4 contextReferenceIdentifier];
      [(SFCard *)v75 setContextReferenceIdentifier:v35];
    }
    v36 = [v4 urlValue];

    if (v36)
    {
      v37 = [v4 urlValue];
      v38 = _SFPBURLHandwrittenTranslator(v37);
      [(SFCard *)v75 setUrlValue:v38];
    }
    if ([v4 source]) {
      -[SFCard setSource:](v75, "setSource:", [v4 source]);
    }
    v39 = [v4 entityIdentifier];

    if (v39)
    {
      v40 = [v4 entityIdentifier];
      [(SFCard *)v75 setEntityIdentifier:v40];
    }
    v41 = [v4 resultIdentifier];

    if (v41)
    {
      v42 = [v4 resultIdentifier];
      [(SFCard *)v75 setResultIdentifier:v42];
    }
    if ([v4 queryId]) {
      -[SFCard setQueryId:](v75, "setQueryId:", [v4 queryId]);
    }
    v43 = [v4 fbr];

    if (v43)
    {
      v44 = [v4 fbr];
      [(SFCard *)v75 setFbr:v44];
    }
    if ([v4 flexibleSectionOrder]) {
      -[SFCard setFlexibleSectionOrder:](v75, "setFlexibleSectionOrder:", [v4 flexibleSectionOrder]);
    }
    v45 = [v4 entityProtobufMessages];
    if (v45) {
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v46 = 0;
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v47 = [v4 entityProtobufMessages];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v76 objects:v89 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v77 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [[SFNamedProtobufMessage alloc] initWithProtobuf:*(void *)(*((void *)&v76 + 1) + 8 * k)];
          if (v52) {
            [v46 addObject:v52];
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v76 objects:v89 count:16];
      }
      while (v49);
    }

    v5 = v75;
    [(SFCard *)v75 setEntityProtobufMessages:v46];
    v53 = [v4 titleImage];

    if (v53)
    {
      v54 = [SFImage alloc];
      v55 = [v4 titleImage];
      v56 = [(SFImage *)v54 initWithProtobuf:v55];
      [(SFCard *)v75 setTitleImage:v56];
    }
    v57 = [v4 backgroundColor];

    if (v57)
    {
      v58 = [SFColor alloc];
      v59 = [v4 backgroundColor];
      v60 = [(SFColor *)v58 initWithProtobuf:v59];
      [(SFCard *)v75 setBackgroundColor:v60];
    }
    v61 = [v4 metadata];

    if (v61)
    {
      v62 = [SFDrillDownMetadata alloc];
      v63 = [v4 metadata];
      v64 = [(SFDrillDownMetadata *)v62 initWithProtobuf:v63];
      [(SFCard *)v75 setMetadata:v64];
    }
    v65 = [v4 drilldownMetadata];

    if (v65)
    {
      v66 = [SFDrillDownMetadata alloc];
      v67 = [v4 drilldownMetadata];
      v68 = [(SFDrillDownMetadata *)v66 initWithProtobuf:v67];
      [(SFCard *)v75 setDrilldownMetadata:v68];
    }
    v69 = [v4 backgroundImage];

    if (v69)
    {
      v70 = [SFImage alloc];
      v71 = [v4 backgroundImage];
      v72 = [(SFImage *)v70 initWithProtobuf:v71];
      [(SFCard *)v75 setBackgroundImage:v72];
    }
    v73 = v75;
  }
  return v5;
}

- (void)loadCardSectionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SFCard_Handwritten__loadCardSectionsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5A2E6C8;
  id v7 = v4;
  id v5 = v4;
  [(SFCard *)self loadCardSectionsWithCompletionAndErrorHandler:v6];
}

uint64_t __61__SFCard_Handwritten__loadCardSectionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadCardSectionsWithCompletionAndErrorHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SFCard_Handwritten__loadCardSectionsWithCompletionAndErrorHandler___block_invoke;
  v6[3] = &unk_1E5A2E6A0;
  id v7 = v4;
  id v5 = v4;
  SFResourceLoaderLoadCard(self, v6);
}

void __69__SFCard_Handwritten__loadCardSectionsWithCompletionAndErrorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 cardSections];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCardData, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageName, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageData, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_entityProtobufMessages, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_contextReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_cardId, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)_setOriginalCardData:(id)a3
{
}

- (NSData)_originalCardData
{
  return self->_originalCardData;
}

- (void)setBackgroundImage:(id)a3
{
}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setUrlValue:(id)a3
{
}

- (NSURL)urlValue
{
  return self->_urlValue;
}

- (int)type
{
  return self->_type;
}

- (void)setTitleImage:(id)a3
{
}

- (SFImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (int)source
{
  return self->_source;
}

- (void)setResultIdentifier:(id)a3
{
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setDrilldownMetadata:(id)a3
{
}

- (SFDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (void)setMetadata:(id)a3
{
}

- (SFDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (void)setIntentResponseMessageName:(id)a3
{
}

- (NSString)intentResponseMessageName
{
  return self->_intentResponseMessageName;
}

- (void)setIntentResponseMessageData:(id)a3
{
}

- (NSData)intentResponseMessageData
{
  return self->_intentResponseMessageData;
}

- (void)setIntentMessageName:(id)a3
{
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (void)setIntentMessageData:(id)a3
{
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (BOOL)flexibleSectionOrder
{
  return self->_flexibleSectionOrder;
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setEntityProtobufMessages:(id)a3
{
}

- (NSArray)entityProtobufMessages
{
  return self->_entityProtobufMessages;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSData)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setDismissalCommands:(id)a3
{
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (void)setContextReferenceIdentifier:(id)a3
{
}

- (NSString)contextReferenceIdentifier
{
  return self->_contextReferenceIdentifier;
}

- (void)setCardSections:(id)a3
{
}

- (NSArray)cardSections
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCardId:(id)a3
{
}

- (NSString)cardId
{
  return self->_cardId;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (unint64_t)hash
{
  v45 = [(SFCard *)self title];
  uint64_t v3 = [v45 hash];
  uint64_t v4 = v3 ^ [(SFCard *)self type];
  v44 = [(SFCard *)self cardSections];
  uint64_t v5 = [v44 hash];
  v43 = [(SFCard *)self intentMessageData];
  uint64_t v6 = v4 ^ v5 ^ [v43 hash];
  v42 = [(SFCard *)self intentMessageName];
  uint64_t v7 = [v42 hash];
  v41 = [(SFCard *)self intentResponseMessageData];
  uint64_t v8 = v7 ^ [v41 hash];
  v40 = [(SFCard *)self intentResponseMessageName];
  uint64_t v9 = v6 ^ v8 ^ [v40 hash];
  v39 = [(SFCard *)self dismissalCommands];
  uint64_t v10 = [v39 hash];
  v38 = [(SFCard *)self cardId];
  uint64_t v11 = v10 ^ [v38 hash];
  v37 = [(SFCard *)self contextReferenceIdentifier];
  uint64_t v12 = v11 ^ [v37 hash];
  v36 = [(SFCard *)self urlValue];
  uint64_t v13 = v9 ^ v12 ^ [v36 hash];
  uint64_t v14 = [(SFCard *)self source];
  v35 = [(SFCard *)self entityIdentifier];
  uint64_t v15 = v14 ^ [v35 hash];
  v34 = [(SFCard *)self resultIdentifier];
  uint64_t v16 = v15 ^ [v34 hash];
  unint64_t v17 = v16 ^ [(SFCard *)self queryId];
  v18 = [(SFCard *)self fbr];
  uint64_t v19 = v13 ^ v17 ^ [v18 hash];
  uint64_t v20 = [(SFCard *)self flexibleSectionOrder];
  v21 = [(SFCard *)self entityProtobufMessages];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [(SFCard *)self titleImage];
  uint64_t v24 = v22 ^ [v23 hash];
  id v25 = [(SFCard *)self backgroundColor];
  uint64_t v26 = v24 ^ [v25 hash];
  uint64_t v27 = [(SFCard *)self metadata];
  uint64_t v28 = v19 ^ v26 ^ [v27 hash];
  uint64_t v29 = [(SFCard *)self drilldownMetadata];
  uint64_t v30 = [v29 hash];
  v31 = [(SFCard *)self backgroundImage];
  unint64_t v32 = v28 ^ v30 ^ [v31 hash];

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFCard *)a3;
  if (self == v5)
  {
    char v10 = 1;
    goto LABEL_86;
  }
  if (![(SFCard *)v5 isMemberOfClass:objc_opt_class()])
  {
    char v10 = 0;
    goto LABEL_86;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(SFCard *)self title];
  uint64_t v8 = [(SFCard *)v6 title];
  if (v7 != v8
    && ([(SFCard *)self title],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(SFCard *)v6 title],
        v139 = objc_claimAutoreleasedReturnValue(),
        v140 = v9,
        !objc_msgSend(v9, "isEqual:"))
    || (int v11 = [(SFCard *)self type], v11 != [(SFCard *)v6 type]))
  {
    int v14 = 0;
    memset(v143, 0, sizeof(v143));
    uint64_t v141 = 0;
    memset(v142, 0, sizeof(v142));
    memset(v144, 0, sizeof(v144));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v10 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = [(SFCard *)self cardSections];
  v137 = [(SFCard *)v6 cardSections];
  v138 = (void *)v12;
  uint64_t v3 = v12 != (void)v137;
  if ((void *)v12 != v137)
  {
    uint64_t v13 = [(SFCard *)self cardSections];
    [(SFCard *)v6 cardSections];
    v133 = v134 = v13;
    if (!objc_msgSend(v13, "isEqual:"))
    {
      int v14 = 0;
      memset(v143, 0, 32);
      uint64_t v141 = 0;
      *(_OWORD *)&v143[36] = 0uLL;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_DWORD *)&v143[52] = 1;
      goto LABEL_13;
    }
  }
  uint64_t v26 = [(SFCard *)self intentMessageData];
  [(SFCard *)v6 intentMessageData];
  v135 = v136 = (void *)v26;
  BOOL v27 = v26 != (void)v135;
  *(_DWORD *)&v143[52] = v3;
  if ((void *)v26 != v135)
  {
    uint64_t v28 = [(SFCard *)self intentMessageData];
    v129 = [(SFCard *)v6 intentMessageData];
    v130 = v28;
    if (!objc_msgSend(v28, "isEqual:"))
    {
      int v14 = 0;
      memset(v143, 0, 28);
      uint64_t v141 = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_OWORD *)&v143[32] = 1uLL;
      *(_DWORD *)&v143[28] = 1;
      *(_DWORD *)&v143[48] = 1;
      goto LABEL_13;
    }
  }
  uint64_t v29 = [(SFCard *)self intentMessageName];
  v131 = [(SFCard *)v6 intentMessageName];
  BOOL v30 = v29 != (void)v131;
  *(_DWORD *)&v143[48] = v27;
  v132 = (void *)v29;
  if ((void *)v29 != v131)
  {
    v31 = [(SFCard *)self intentMessageName];
    v125 = [(SFCard *)v6 intentMessageName];
    v126 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      int v14 = 0;
      memset(v143, 0, 24);
      uint64_t v141 = 0;
      *(void *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, sizeof(v144));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(_DWORD *)&v143[44] = 1;
      goto LABEL_13;
    }
    BOOL v30 = 1;
  }
  uint64_t v32 = [(SFCard *)self intentResponseMessageData];
  v127 = [(SFCard *)v6 intentResponseMessageData];
  v128 = (void *)v32;
  HIDWORD(v144[5]) = v32 != (void)v127;
  *(_DWORD *)&v143[44] = v30;
  if ((void *)v32 != v127)
  {
    v33 = [(SFCard *)self intentResponseMessageData];
    v121 = [(SFCard *)v6 intentResponseMessageData];
    v122 = v33;
    if (!objc_msgSend(v33, "isEqual:"))
    {
      int v14 = 0;
      memset(v143, 0, 20);
      uint64_t v141 = 0;
      *(void *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      int v15 = 0;
      int v16 = 0;
      memset(v144, 0, 44);
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(_DWORD *)&v143[20] = 1;
      *(void *)&v143[24] = 0x100000001;
      HIDWORD(v144[5]) = 1;
      goto LABEL_13;
    }
  }
  uint64_t v34 = [(SFCard *)self intentResponseMessageName];
  v123 = [(SFCard *)v6 intentResponseMessageName];
  v124 = (void *)v34;
  LODWORD(v144[5]) = v34 != (void)v123;
  if ((void *)v34 != v123)
  {
    v35 = [(SFCard *)self intentResponseMessageName];
    v117 = [(SFCard *)v6 intentResponseMessageName];
    v118 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      int v14 = 0;
      *(void *)v143 = 0;
      *(void *)&v143[8] = 0;
      uint64_t v141 = 0;
      *(void *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      int v15 = 0;
      memset(v144, 0, 40);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      LODWORD(v144[5]) = 1;
      goto LABEL_13;
    }
  }
  uint64_t v36 = [(SFCard *)self dismissalCommands];
  v119 = [(SFCard *)v6 dismissalCommands];
  v120 = (void *)v36;
  HIDWORD(v144[4]) = v36 != (void)v119;
  if ((void *)v36 != v119)
  {
    v37 = [(SFCard *)self dismissalCommands];
    v113 = [(SFCard *)v6 dismissalCommands];
    v114 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(void *)v143 = 0;
      *(void *)&v143[8] = 0;
      uint64_t v141 = 0;
      *(void *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      int v15 = 0;
      int v16 = 0;
      memset(v144, 0, 36);
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      HIDWORD(v144[4]) = 1;
      goto LABEL_13;
    }
  }
  uint64_t v38 = [(SFCard *)self cardId];
  v115 = [(SFCard *)v6 cardId];
  LODWORD(v144[4]) = v38 != (void)v115;
  v116 = (void *)v38;
  if ((void *)v38 != v115)
  {
    v39 = [(SFCard *)self cardId];
    v109 = [(SFCard *)v6 cardId];
    v110 = v39;
    if (!objc_msgSend(v39, "isEqual:"))
    {
      *(void *)v143 = 0;
      uint64_t v141 = 0;
      *(void *)&v143[36] = 0;
      memset(v142, 0, sizeof(v142));
      memset(v144, 0, 32);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      LODWORD(v144[4]) = 1;
      goto LABEL_13;
    }
  }
  uint64_t v40 = [(SFCard *)self contextReferenceIdentifier];
  v111 = [(SFCard *)v6 contextReferenceIdentifier];
  HIDWORD(v144[3]) = v40 != (void)v111;
  v112 = (void *)v40;
  if ((void *)v40 != v111)
  {
    v41 = [(SFCard *)self contextReferenceIdentifier];
    v105 = [(SFCard *)v6 contextReferenceIdentifier];
    v106 = v41;
    if (!objc_msgSend(v41, "isEqual:"))
    {
      uint64_t v141 = 0;
      *(void *)v142 = 0;
      *(void *)&v143[36] = 0;
      *(void *)v143 = 0;
      int v15 = 0;
      int v16 = 0;
      memset(v144, 0, 28);
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      HIDWORD(v144[3]) = 1;
      goto LABEL_13;
    }
  }
  uint64_t v42 = [(SFCard *)self urlValue];
  v107 = [(SFCard *)v6 urlValue];
  LODWORD(v144[3]) = v42 != (void)v107;
  v108 = (void *)v42;
  if ((void *)v42 != v107)
  {
    v43 = [(SFCard *)self urlValue];
    v103 = [(SFCard *)v6 urlValue];
    v104 = v43;
    if (!objc_msgSend(v43, "isEqual:"))
    {
      *(void *)v142 = 0;
      *(void *)&v143[36] = 0;
      *(void *)v143 = 0;
      int v15 = 0;
      memset(v144, 0, 24);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      uint64_t v141 = 0x100000000;
      LODWORD(v144[3]) = 1;
      goto LABEL_13;
    }
  }
  int v44 = [(SFCard *)self source];
  if (v44 != [(SFCard *)v6 source])
  {
    *(void *)v142 = 0;
    *(void *)&v143[36] = 0;
    uint64_t v141 = 0x100000000;
    *(void *)v143 = 0;
    int v15 = 0;
    memset(v144, 0, 24);
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v10 = 0;
    *(_DWORD *)&v143[32] = 1;
    *(void *)&v143[24] = 0x100000001;
    *(void *)&v143[16] = 0x100000001;
    int v14 = 1;
    *(void *)&v143[8] = 0x100000000;
    *(_DWORD *)&v142[8] = 1;
    goto LABEL_13;
  }
  uint64_t v45 = [(SFCard *)self entityIdentifier];
  v101 = [(SFCard *)v6 entityIdentifier];
  v102 = (void *)v45;
  BOOL v46 = v45 != (void)v101;
  if ((void *)v45 != v101)
  {
    v47 = [(SFCard *)self entityIdentifier];
    v97 = [(SFCard *)v6 entityIdentifier];
    v98 = v47;
    if (!objc_msgSend(v47, "isEqual:"))
    {
      uint64_t v141 = 0x100000000;
      *(void *)v143 = 0;
      int v15 = 0;
      memset(v144, 0, 24);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[36] = 0x100000000;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      *(void *)v142 = 0x100000000;
      goto LABEL_13;
    }
  }
  uint64_t v48 = [(SFCard *)self resultIdentifier];
  v99 = [(SFCard *)v6 resultIdentifier];
  v100 = (void *)v48;
  BOOL v49 = v48 == (void)v99;
  BOOL v50 = v48 != (void)v99;
  *(_DWORD *)&v143[40] = v46;
  if (v49)
  {
    *(_DWORD *)&v143[36] = v50;
  }
  else
  {
    v51 = [(SFCard *)self resultIdentifier];
    v95 = [(SFCard *)v6 resultIdentifier];
    v96 = v51;
    if (!objc_msgSend(v51, "isEqual:"))
    {
      *(void *)v143 = 0;
      int v15 = 0;
      memset(v144, 0, 24);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(void *)&v143[32] = 0x100000001;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      *(void *)v142 = 0x100000000;
      uint64_t v141 = 0x100000001;
      goto LABEL_13;
    }
    *(_DWORD *)&v143[36] = v50;
  }
  unint64_t v52 = [(SFCard *)self queryId];
  if (v52 == [(SFCard *)v6 queryId])
  {
    uint64_t v53 = [(SFCard *)self fbr];
    v93 = [(SFCard *)v6 fbr];
    HIDWORD(v144[2]) = v53 != (void)v93;
    v94 = (void *)v53;
    if ((void *)v53 == v93
      || ([(SFCard *)self fbr],
          v54 = objc_claimAutoreleasedReturnValue(),
          [(SFCard *)v6 fbr],
          v91 = objc_claimAutoreleasedReturnValue(),
          uint64_t v92 = v54,
          objc_msgSend(v54, "isEqual:")))
    {
      BOOL v55 = [(SFCard *)self flexibleSectionOrder];
      if (v55 == [(SFCard *)v6 flexibleSectionOrder])
      {
        uint64_t v56 = [(SFCard *)self entityProtobufMessages];
        v89 = [(SFCard *)v6 entityProtobufMessages];
        LODWORD(v144[2]) = v56 != (void)v89;
        v90 = (void *)v56;
        if ((void *)v56 == v89
          || ([(SFCard *)self entityProtobufMessages],
              v57 = objc_claimAutoreleasedReturnValue(),
              [(SFCard *)v6 entityProtobufMessages],
              long long v85 = objc_claimAutoreleasedReturnValue(),
              long long v86 = v57,
              objc_msgSend(v57, "isEqual:")))
        {
          uint64_t v58 = [(SFCard *)self titleImage];
          long long v87 = [(SFCard *)v6 titleImage];
          objc_super v88 = (void *)v58;
          HIDWORD(v144[1]) = v58 != (void)v87;
          if ((void *)v58 == v87
            || ([(SFCard *)self titleImage],
                v59 = objc_claimAutoreleasedReturnValue(),
                [(SFCard *)v6 titleImage],
                long long v81 = objc_claimAutoreleasedReturnValue(),
                long long v82 = v59,
                objc_msgSend(v59, "isEqual:")))
          {
            uint64_t v60 = [(SFCard *)self backgroundColor];
            long long v83 = [(SFCard *)v6 backgroundColor];
            long long v84 = (void *)v60;
            LODWORD(v144[1]) = v60 != (void)v83;
            if ((void *)v60 == v83
              || ([(SFCard *)self backgroundColor],
                  v61 = objc_claimAutoreleasedReturnValue(),
                  [(SFCard *)v6 backgroundColor],
                  long long v77 = objc_claimAutoreleasedReturnValue(),
                  long long v78 = v61,
                  objc_msgSend(v61, "isEqual:")))
            {
              uint64_t v62 = [(SFCard *)self metadata];
              long long v79 = [(SFCard *)v6 metadata];
              long long v80 = (void *)v62;
              HIDWORD(v144[0]) = v62 != (void)v79;
              if ((void *)v62 == v79
                || ([(SFCard *)self metadata],
                    v63 = objc_claimAutoreleasedReturnValue(),
                    [(SFCard *)v6 metadata],
                    v71 = objc_claimAutoreleasedReturnValue(),
                    v72 = v63,
                    objc_msgSend(v63, "isEqual:")))
              {
                uint64_t v64 = [(SFCard *)self drilldownMetadata];
                v75 = [(SFCard *)v6 drilldownMetadata];
                long long v76 = (void *)v64;
                LODWORD(v144[0]) = v64 != (void)v75;
                if ((void *)v64 == v75
                  || ([(SFCard *)self drilldownMetadata],
                      v65 = objc_claimAutoreleasedReturnValue(),
                      [(SFCard *)v6 drilldownMetadata],
                      v69 = objc_claimAutoreleasedReturnValue(),
                      v70 = v65,
                      objc_msgSend(v65, "isEqual:")))
                {
                  uint64_t v66 = [(SFCard *)self backgroundImage];
                  v73 = [(SFCard *)v6 backgroundImage];
                  v74 = (void *)v66;
                  if ((void *)v66 == v73)
                  {
                    int v18 = 0;
                    *(_DWORD *)&v143[32] = 1;
                    *(void *)&v143[24] = 0x100000001;
                    *(void *)&v143[16] = 0x100000001;
                    int v14 = 1;
                    *(_DWORD *)&v142[8] = 1;
                    uint64_t v141 = 0x100000001;
                    *(void *)v142 = 0x100000001;
                    *(void *)v143 = 0x100000001;
                    *(void *)&v143[8] = 0x100000001;
                    int v15 = 1;
                    int v16 = 1;
                    v73 = (void *)v66;
                    int v17 = 1;
                    char v10 = 1;
                  }
                  else
                  {
                    v67 = [(SFCard *)self backgroundImage];
                    uint64_t v3 = [(SFCard *)v6 backgroundImage];
                    v68 = v67;
                    char v10 = [v67 isEqual:v3];
                    int v18 = 1;
                    *(_DWORD *)&v143[32] = 1;
                    *(void *)&v143[24] = 0x100000001;
                    *(void *)&v143[16] = 0x100000001;
                    int v14 = 1;
                    *(_DWORD *)&v142[8] = 1;
                    uint64_t v141 = 0x100000001;
                    *(void *)v142 = 0x100000001;
                    *(void *)v143 = 0x100000001;
                    *(void *)&v143[8] = 0x100000001;
                    int v15 = 1;
                    int v16 = 1;
                    int v17 = 1;
                  }
                }
                else
                {
                  int v17 = 0;
                  int v18 = 0;
                  char v10 = 0;
                  *(_DWORD *)&v143[32] = 1;
                  *(void *)&v143[24] = 0x100000001;
                  *(void *)&v143[16] = 0x100000001;
                  int v14 = 1;
                  *(_DWORD *)&v142[8] = 1;
                  uint64_t v141 = 0x100000001;
                  *(void *)v142 = 0x100000001;
                  *(void *)v143 = 0x100000001;
                  *(void *)&v143[8] = 0x100000001;
                  int v15 = 1;
                  int v16 = 1;
                  LODWORD(v144[0]) = 1;
                }
              }
              else
              {
                int v16 = 0;
                v144[0] = 0x100000000;
                int v17 = 0;
                int v18 = 0;
                char v10 = 0;
                *(_DWORD *)&v143[32] = 1;
                *(void *)&v143[24] = 0x100000001;
                *(void *)&v143[16] = 0x100000001;
                int v14 = 1;
                *(_DWORD *)&v142[8] = 1;
                uint64_t v141 = 0x100000001;
                *(void *)v142 = 0x100000001;
                *(void *)v143 = 0x100000001;
                *(void *)&v143[8] = 0x100000001;
                int v15 = 1;
              }
            }
            else
            {
              int v15 = 0;
              v144[0] = 0;
              int v16 = 0;
              int v17 = 0;
              int v18 = 0;
              char v10 = 0;
              *(_DWORD *)&v143[32] = 1;
              *(void *)&v143[24] = 0x100000001;
              *(void *)&v143[16] = 0x100000001;
              int v14 = 1;
              *(_DWORD *)&v142[8] = 1;
              uint64_t v141 = 0x100000001;
              *(void *)v142 = 0x100000001;
              *(void *)v143 = 0x100000001;
              *(void *)&v143[8] = 0x100000001;
              LODWORD(v144[1]) = 1;
            }
          }
          else
          {
            *(void *)((char *)v144 + 4) = 0;
            int v15 = 0;
            int v16 = 0;
            LODWORD(v144[0]) = 0;
            int v17 = 0;
            int v18 = 0;
            char v10 = 0;
            *(_DWORD *)&v143[32] = 1;
            *(void *)&v143[24] = 0x100000001;
            *(void *)&v143[16] = 0x100000001;
            int v14 = 1;
            *(void *)&v143[8] = 0x100000000;
            *(_DWORD *)&v142[8] = 1;
            uint64_t v141 = 0x100000001;
            *(void *)v142 = 0x100000001;
            *(void *)v143 = 0x100000001;
            HIDWORD(v144[1]) = 1;
          }
        }
        else
        {
          *(void *)&v143[4] = 0;
          v144[0] = 0;
          v144[1] = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          char v10 = 0;
          *(_DWORD *)&v143[32] = 1;
          *(void *)&v143[24] = 0x100000001;
          *(_DWORD *)&v143[12] = 1;
          *(void *)&v143[16] = 0x100000001;
          int v14 = 1;
          *(_DWORD *)&v142[8] = 1;
          uint64_t v141 = 0x100000001;
          *(void *)v142 = 0x100000001;
          *(_DWORD *)v143 = 1;
          LODWORD(v144[2]) = 1;
        }
      }
      else
      {
        *(void *)v143 = 0;
        int v15 = 0;
        int v16 = 0;
        memset(v144, 0, 20);
        int v17 = 0;
        int v18 = 0;
        char v10 = 0;
        *(_DWORD *)&v143[32] = 1;
        *(void *)&v143[24] = 0x100000001;
        *(void *)&v143[16] = 0x100000001;
        int v14 = 1;
        *(void *)&v143[8] = 0x100000000;
        *(_DWORD *)&v142[8] = 1;
        uint64_t v141 = 0x100000001;
        *(void *)v142 = 0x100000001;
      }
    }
    else
    {
      *(void *)v143 = 0;
      int v15 = 0;
      int v16 = 0;
      memset(v144, 0, 20);
      int v17 = 0;
      int v18 = 0;
      char v10 = 0;
      *(_DWORD *)&v143[32] = 1;
      *(void *)&v143[24] = 0x100000001;
      *(void *)&v143[16] = 0x100000001;
      int v14 = 1;
      *(void *)&v143[8] = 0x100000000;
      *(_DWORD *)&v142[8] = 1;
      uint64_t v141 = 0x100000001;
      *(void *)v142 = 0x100000001;
      HIDWORD(v144[2]) = 1;
    }
  }
  else
  {
    *(void *)v143 = 0;
    int v15 = 0;
    memset(v144, 0, 24);
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    char v10 = 0;
    *(_DWORD *)&v143[32] = 1;
    *(void *)&v143[24] = 0x100000001;
    *(void *)&v143[16] = 0x100000001;
    int v14 = 1;
    *(void *)&v143[8] = 0x100000000;
    *(_DWORD *)&v142[8] = 1;
    *(void *)v142 = 0x100000000;
    uint64_t v141 = 0x100000001;
  }
LABEL_13:
  if (v18)
  {
    int v19 = v15;
    uint64_t v20 = v8;
    v21 = v7;
    int v22 = v16;
    int v23 = v14;
    int v24 = v17;

    int v17 = v24;
    int v14 = v23;
    int v16 = v22;
    uint64_t v7 = v21;
    uint64_t v8 = v20;
    int v15 = v19;
  }
  if (v17)
  {
  }
  if (LODWORD(v144[0]))
  {
  }
  if (v16)
  {
  }
  if (HIDWORD(v144[0]))
  {
  }
  if (v15)
  {
  }
  if (LODWORD(v144[1]))
  {
  }
  if (*(_DWORD *)&v143[8])
  {
  }
  if (HIDWORD(v144[1]))
  {
  }
  if (*(_DWORD *)&v143[4])
  {
  }
  if (LODWORD(v144[2]))
  {
  }
  if (*(_DWORD *)v143)
  {
  }
  if (HIDWORD(v144[2]))
  {
  }
  if (*(_DWORD *)v142)
  {
  }
  if (*(_DWORD *)&v143[36])
  {
  }
  if (v141)
  {
  }
  if (*(_DWORD *)&v143[40])
  {
  }
  if (*(_DWORD *)&v142[4])
  {
  }
  if (LODWORD(v144[3]))
  {
  }
  if (HIDWORD(v141))
  {
  }
  if (HIDWORD(v144[3]))
  {
  }
  if (*(_DWORD *)&v142[8])
  {
  }
  if (LODWORD(v144[4]))
  {
  }
  if (*(_DWORD *)&v143[12])
  {
  }
  if (!HIDWORD(v144[4]))
  {
    if (!v14) {
      goto LABEL_63;
    }
LABEL_88:

    if (!LODWORD(v144[5])) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }

  if (v14) {
    goto LABEL_88;
  }
LABEL_63:
  if (LODWORD(v144[5]))
  {
LABEL_64:
  }
LABEL_65:
  if (*(_DWORD *)&v143[16])
  {
  }
  if (HIDWORD(v144[5]))
  {
  }
  if (*(_DWORD *)&v143[20])
  {
  }
  if (*(_DWORD *)&v143[44])
  {
  }
  if (*(_DWORD *)&v143[24])
  {
  }
  if (*(_DWORD *)&v143[48])
  {
  }
  if (*(_DWORD *)&v143[28])
  {
  }
  if (*(_DWORD *)&v143[52])
  {
  }
  if (*(_DWORD *)&v143[32])
  {
  }
  if (v7 != v8)
  {
  }
LABEL_86:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFCard *)self title];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  objc_msgSend(v4, "setType:", -[SFCard type](self, "type"));
  uint64_t v7 = [(SFCard *)self cardSections];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setCardSections:v8];

  uint64_t v9 = [(SFCard *)self intentMessageData];
  char v10 = (void *)[v9 copy];
  [v4 setIntentMessageData:v10];

  int v11 = [(SFCard *)self intentMessageName];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setIntentMessageName:v12];

  uint64_t v13 = [(SFCard *)self intentResponseMessageData];
  int v14 = (void *)[v13 copy];
  [v4 setIntentResponseMessageData:v14];

  int v15 = [(SFCard *)self intentResponseMessageName];
  int v16 = (void *)[v15 copy];
  [v4 setIntentResponseMessageName:v16];

  int v17 = [(SFCard *)self dismissalCommands];
  int v18 = (void *)[v17 copy];
  [v4 setDismissalCommands:v18];

  int v19 = [(SFCard *)self cardId];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setCardId:v20];

  v21 = [(SFCard *)self contextReferenceIdentifier];
  int v22 = (void *)[v21 copy];
  [v4 setContextReferenceIdentifier:v22];

  int v23 = [(SFCard *)self urlValue];
  int v24 = (void *)[v23 copy];
  [v4 setUrlValue:v24];

  objc_msgSend(v4, "setSource:", -[SFCard source](self, "source"));
  id v25 = [(SFCard *)self entityIdentifier];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setEntityIdentifier:v26];

  BOOL v27 = [(SFCard *)self resultIdentifier];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setResultIdentifier:v28];

  objc_msgSend(v4, "setQueryId:", -[SFCard queryId](self, "queryId"));
  uint64_t v29 = [(SFCard *)self fbr];
  BOOL v30 = (void *)[v29 copy];
  [v4 setFbr:v30];

  objc_msgSend(v4, "setFlexibleSectionOrder:", -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder"));
  v31 = [(SFCard *)self entityProtobufMessages];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setEntityProtobufMessages:v32];

  v33 = [(SFCard *)self titleImage];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setTitleImage:v34];

  v35 = [(SFCard *)self backgroundColor];
  uint64_t v36 = (void *)[v35 copy];
  [v4 setBackgroundColor:v36];

  v37 = [(SFCard *)self metadata];
  uint64_t v38 = (void *)[v37 copy];
  [v4 setMetadata:v38];

  v39 = [(SFCard *)self drilldownMetadata];
  uint64_t v40 = (void *)[v39 copy];
  [v4 setDrilldownMetadata:v40];

  v41 = [(SFCard *)self backgroundImage];
  uint64_t v42 = (void *)[v41 copy];
  [v4 setBackgroundImage:v42];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCard alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCard *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCard alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCard *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [(SFCard *)self backgroundColor];
  [v24 encodeObject:v4 forKey:@"_backgroundColor"];

  uint64_t v5 = [(SFCard *)self cardId];
  [v24 encodeObject:v5 forKey:@"_cardId"];

  uint64_t v6 = [(SFCard *)self cardSections];
  [v24 encodeObject:v6 forKey:@"_cardSections"];

  uint64_t v7 = [(SFCard *)self contextReferenceIdentifier];
  [v24 encodeObject:v7 forKey:@"_contextReferenceIdentifier"];

  uint64_t v8 = [(SFCard *)self dismissalCommands];
  [v24 encodeObject:v8 forKey:@"_dismissalCommands"];

  uint64_t v9 = [(SFCard *)self entityIdentifier];
  [v24 encodeObject:v9 forKey:@"_entityIdentifier"];

  char v10 = [(SFCard *)self entityProtobufMessages];
  [v24 encodeObject:v10 forKey:@"_entityProtobufMessages"];

  int v11 = [(SFCard *)self fbr];
  [v24 encodeObject:v11 forKey:@"_fbr"];

  if ([(SFCard *)self hasFlexibleSectionOrder])
  {
    [v24 encodeBool:1 forKey:@"_hasFlexibleSectionOrder"];
    objc_msgSend(v24, "encodeBool:forKey:", -[SFCard flexibleSectionOrder](self, "flexibleSectionOrder"), @"_flexibleSectionOrder");
  }
  uint64_t v12 = [(SFCard *)self intentMessageData];
  [v24 encodeObject:v12 forKey:@"_intentMessageData"];

  uint64_t v13 = [(SFCard *)self intentMessageName];
  [v24 encodeObject:v13 forKey:@"_intentMessageName"];

  int v14 = [(SFCard *)self intentResponseMessageData];
  [v24 encodeObject:v14 forKey:@"_intentResponseMessageData"];

  int v15 = [(SFCard *)self intentResponseMessageName];
  [v24 encodeObject:v15 forKey:@"_intentResponseMessageName"];

  int v16 = [(SFCard *)self metadata];
  [v24 encodeObject:v16 forKey:@"_metadata"];

  int v17 = [(SFCard *)self drilldownMetadata];
  [v24 encodeObject:v17 forKey:@"_drilldownMetadata"];

  if ([(SFCard *)self hasQueryId])
  {
    [v24 encodeBool:1 forKey:@"_hasQueryId"];
    int v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SFCard queryId](self, "queryId"));
    [v24 encodeObject:v18 forKey:@"_queryId"];
  }
  int v19 = [(SFCard *)self resultIdentifier];
  [v24 encodeObject:v19 forKey:@"_resultIdentifier"];

  if ([(SFCard *)self hasSource])
  {
    [v24 encodeBool:1 forKey:@"_hasSource"];
    objc_msgSend(v24, "encodeInt32:forKey:", -[SFCard source](self, "source"), @"_source");
  }
  uint64_t v20 = [(SFCard *)self title];
  [v24 encodeObject:v20 forKey:@"_title"];

  v21 = [(SFCard *)self titleImage];
  [v24 encodeObject:v21 forKey:@"_titleImage"];

  if ([(SFCard *)self hasType])
  {
    [v24 encodeBool:1 forKey:@"_hasType"];
    objc_msgSend(v24, "encodeInt32:forKey:", -[SFCard type](self, "type"), @"_type");
  }
  int v22 = [(SFCard *)self urlValue];
  [v24 encodeObject:v22 forKey:@"_urlValue"];

  int v23 = [(SFCard *)self backgroundImage];
  [v24 encodeObject:v23 forKey:@"_backgroundImage"];
}

- (SFCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SFCard;
  uint64_t v5 = [(SFCard *)&v27 init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundColor"];
  [(SFCard *)v5 setBackgroundColor:v6];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cardId"];
  [(SFCard *)v5 setCardId:v7];

  uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_cardSections"];
  [(SFCard *)v5 setCardSections:v8];

  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contextReferenceIdentifier"];
  [(SFCard *)v5 setContextReferenceIdentifier:v9];

  char v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_dismissalCommands"];
  [(SFCard *)v5 setDismissalCommands:v10];

  int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_entityIdentifier"];
  [(SFCard *)v5 setEntityIdentifier:v11];

  uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_entityProtobufMessages"];
  [(SFCard *)v5 setEntityProtobufMessages:v12];

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fbr"];
  [(SFCard *)v5 setFbr:v13];

  if ([v4 decodeBoolForKey:@"_hasFlexibleSectionOrder"]) {
    -[SFCard setFlexibleSectionOrder:](v5, "setFlexibleSectionOrder:", [v4 decodeBoolForKey:@"_flexibleSectionOrder"]);
  }
  int v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentMessageData"];
  [(SFCard *)v5 setIntentMessageData:v14];

  int v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentMessageName"];
  [(SFCard *)v5 setIntentMessageName:v15];

  int v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentResponseMessageData"];
  [(SFCard *)v5 setIntentResponseMessageData:v16];

  int v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_intentResponseMessageName"];
  [(SFCard *)v5 setIntentResponseMessageName:v17];

  int v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metadata"];
  [(SFCard *)v5 setMetadata:v18];

  int v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_drilldownMetadata"];
  [(SFCard *)v5 setDrilldownMetadata:v19];

  if ([v4 decodeBoolForKey:@"_hasQueryId"])
  {
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_queryId"];
    -[SFCard setQueryId:](v5, "setQueryId:", [v20 unsignedIntegerValue]);
  }
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultIdentifier"];
  [(SFCard *)v5 setResultIdentifier:v21];

  if ([v4 decodeBoolForKey:@"_hasSource"]) {
    -[SFCard setSource:](v5, "setSource:", [v4 decodeInt32ForKey:@"_source"]);
  }
  int v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
  [(SFCard *)v5 setTitle:v22];

  int v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_titleImage"];
  [(SFCard *)v5 setTitleImage:v23];

  if ([v4 decodeBoolForKey:@"_hasType"]) {
    -[SFCard setType:](v5, "setType:", [v4 decodeInt32ForKey:@"_type"]);
  }
  id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlValue"];
  [(SFCard *)v5 setUrlValue:v24];

  id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundImage"];
  [(SFCard *)v5 setBackgroundImage:v25];

  return v5;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_source = a3;
}

- (BOOL)hasQueryId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setQueryId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_queryId = a3;
}

- (BOOL)hasFlexibleSectionOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFlexibleSectionOrder:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flexibleSectionOrder = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end