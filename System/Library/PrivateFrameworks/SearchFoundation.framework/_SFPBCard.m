@interface _SFPBCard
- (BOOL)flexibleSectionOrder;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)cardSections;
- (NSArray)dismissalCommands;
- (NSArray)entityProtobufMessages;
- (NSData)entityIdentifier;
- (NSData)intentMessageData;
- (NSData)intentResponseMessageData;
- (NSData)jsonData;
- (NSString)cardId;
- (NSString)contextReferenceIdentifier;
- (NSString)fbr;
- (NSString)intentMessageName;
- (NSString)intentResponseMessageName;
- (NSString)resultIdentifier;
- (NSString)title;
- (_SFPBCard)initWithDictionary:(id)a3;
- (_SFPBCard)initWithFacade:(id)a3;
- (_SFPBCard)initWithJSON:(id)a3;
- (_SFPBColor)backgroundColor;
- (_SFPBDrillDownMetadata)drilldownMetadata;
- (_SFPBDrillDownMetadata)metadata;
- (_SFPBImage)backgroundImage;
- (_SFPBImage)titleImage;
- (_SFPBURL)urlValue;
- (id)cardSectionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)dismissalCommandsAtIndex:(unint64_t)a3;
- (id)entityProtobufMessagesAtIndex:(unint64_t)a3;
- (int)source;
- (int)type;
- (unint64_t)cardSectionsCount;
- (unint64_t)dismissalCommandsCount;
- (unint64_t)entityProtobufMessagesCount;
- (unint64_t)hash;
- (unint64_t)queryId;
- (void)addCardSections:(id)a3;
- (void)addDismissalCommands:(id)a3;
- (void)addEntityProtobufMessages:(id)a3;
- (void)clearCardSections;
- (void)clearDismissalCommands;
- (void)clearEntityProtobufMessages;
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
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCard

- (_SFPBCard)initWithFacade:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCard *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBCard *)v5 setTitle:v7];
    }
    if ([v4 hasType]) {
      -[_SFPBCard setType:](v5, "setType:", [v4 type]);
    }
    v8 = [v4 cardSections];
    v76 = v5;
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v10 = [v4 cardSections];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v86 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[_SFPBCardSection alloc] initWithFacade:*(void *)(*((void *)&v85 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v12);
    }

    [(_SFPBCard *)v5 setCardSections:v9];
    v16 = [v4 intentMessageData];

    if (v16)
    {
      v17 = [v4 intentMessageData];
      [(_SFPBCard *)v5 setIntentMessageData:v17];
    }
    v18 = [v4 intentMessageName];

    if (v18)
    {
      v19 = [v4 intentMessageName];
      [(_SFPBCard *)v5 setIntentMessageName:v19];
    }
    v20 = [v4 intentResponseMessageData];

    if (v20)
    {
      v21 = [v4 intentResponseMessageData];
      [(_SFPBCard *)v5 setIntentResponseMessageData:v21];
    }
    v22 = [v4 intentResponseMessageName];

    if (v22)
    {
      v23 = [v4 intentResponseMessageName];
      [(_SFPBCard *)v5 setIntentResponseMessageName:v23];
    }
    v24 = [v4 dismissalCommands];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v26 = [v4 dismissalCommands];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v82 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBAbstractCommand alloc] initWithFacade:*(void *)(*((void *)&v81 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v28);
    }

    [(_SFPBCard *)v76 setDismissalCommands:v25];
    v32 = [v4 cardId];

    if (v32)
    {
      v33 = [v4 cardId];
      [(_SFPBCard *)v76 setCardId:v33];
    }
    v34 = [v4 contextReferenceIdentifier];

    if (v34)
    {
      v35 = [v4 contextReferenceIdentifier];
      [(_SFPBCard *)v76 setContextReferenceIdentifier:v35];
    }
    v36 = [v4 urlValue];

    if (v36)
    {
      v37 = [_SFPBURL alloc];
      v38 = [v4 urlValue];
      v39 = [(_SFPBURL *)v37 initWithNSURL:v38];
      [(_SFPBCard *)v76 setUrlValue:v39];
    }
    if ([v4 hasSource]) {
      -[_SFPBCard setSource:](v76, "setSource:", [v4 source]);
    }
    v40 = [v4 entityIdentifier];

    if (v40)
    {
      v41 = [v4 entityIdentifier];
      [(_SFPBCard *)v76 setEntityIdentifier:v41];
    }
    v42 = [v4 resultIdentifier];

    if (v42)
    {
      v43 = [v4 resultIdentifier];
      [(_SFPBCard *)v76 setResultIdentifier:v43];
    }
    if ([v4 hasQueryId]) {
      -[_SFPBCard setQueryId:](v76, "setQueryId:", [v4 queryId]);
    }
    v44 = [v4 fbr];

    if (v44)
    {
      v45 = [v4 fbr];
      [(_SFPBCard *)v76 setFbr:v45];
    }
    if ([v4 hasFlexibleSectionOrder]) {
      -[_SFPBCard setFlexibleSectionOrder:](v76, "setFlexibleSectionOrder:", [v4 flexibleSectionOrder]);
    }
    v46 = [v4 entityProtobufMessages];
    if (v46) {
      id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v47 = 0;
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v48 = [v4 entityProtobufMessages];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v78 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [[_SFPBNamedProtobufMessage alloc] initWithFacade:*(void *)(*((void *)&v77 + 1) + 8 * k)];
          if (v53) {
            [v47 addObject:v53];
          }
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v50);
    }

    v5 = v76;
    [(_SFPBCard *)v76 setEntityProtobufMessages:v47];
    v54 = [v4 titleImage];

    if (v54)
    {
      v55 = [_SFPBImage alloc];
      v56 = [v4 titleImage];
      v57 = [(_SFPBImage *)v55 initWithFacade:v56];
      [(_SFPBCard *)v76 setTitleImage:v57];
    }
    v58 = [v4 backgroundColor];

    if (v58)
    {
      v59 = [_SFPBColor alloc];
      v60 = [v4 backgroundColor];
      v61 = [(_SFPBColor *)v59 initWithFacade:v60];
      [(_SFPBCard *)v76 setBackgroundColor:v61];
    }
    v62 = [v4 metadata];

    if (v62)
    {
      v63 = [_SFPBDrillDownMetadata alloc];
      v64 = [v4 metadata];
      v65 = [(_SFPBDrillDownMetadata *)v63 initWithFacade:v64];
      [(_SFPBCard *)v76 setMetadata:v65];
    }
    v66 = [v4 drilldownMetadata];

    if (v66)
    {
      v67 = [_SFPBDrillDownMetadata alloc];
      v68 = [v4 drilldownMetadata];
      v69 = [(_SFPBDrillDownMetadata *)v67 initWithFacade:v68];
      [(_SFPBCard *)v76 setDrilldownMetadata:v69];
    }
    v70 = [v4 backgroundImage];

    if (v70)
    {
      v71 = [_SFPBImage alloc];
      v72 = [v4 backgroundImage];
      v73 = [(_SFPBImage *)v71 initWithFacade:v72];
      [(_SFPBCard *)v76 setBackgroundImage:v73];
    }
    v74 = v76;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_entityProtobufMessages, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_contextReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardId, 0);
  objc_storeStrong((id *)&self->_dismissalCommands, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageName, 0);
  objc_storeStrong((id *)&self->_intentResponseMessageData, 0);
  objc_storeStrong((id *)&self->_intentMessageName, 0);
  objc_storeStrong((id *)&self->_intentMessageData, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (_SFPBImage)backgroundImage
{
  return self->_backgroundImage;
}

- (_SFPBDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (_SFPBDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (_SFPBImage)titleImage
{
  return self->_titleImage;
}

- (NSArray)entityProtobufMessages
{
  return self->_entityProtobufMessages;
}

- (BOOL)flexibleSectionOrder
{
  return self->_flexibleSectionOrder;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (NSData)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int)source
{
  return self->_source;
}

- (_SFPBURL)urlValue
{
  return self->_urlValue;
}

- (NSString)contextReferenceIdentifier
{
  return self->_contextReferenceIdentifier;
}

- (NSString)cardId
{
  return self->_cardId;
}

- (NSArray)dismissalCommands
{
  return self->_dismissalCommands;
}

- (NSString)intentResponseMessageName
{
  return self->_intentResponseMessageName;
}

- (NSData)intentResponseMessageData
{
  return self->_intentResponseMessageData;
}

- (NSString)intentMessageName
{
  return self->_intentMessageName;
}

- (NSData)intentMessageData
{
  return self->_intentMessageData;
}

- (NSArray)cardSections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBCard)initWithDictionary:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)_SFPBCard;
  v5 = [(_SFPBCard *)&v97 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBCard *)v5 setTitle:v7];
    }
    v71 = v6;
    v8 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCard setType:](v5, "setType:", [v8 intValue]);
    }
    v70 = v8;
    id v9 = [v4 objectForKeyedSubscript:@"cardSections"];
    objc_opt_class();
    long long v84 = v9;
    if (objc_opt_isKindOfClass())
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v93 objects:v100 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v94;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v94 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v93 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[_SFPBCardSection alloc] initWithDictionary:v15];
              [(_SFPBCard *)v5 addCardSections:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v93 objects:v100 count:16];
        }
        while (v12);
      }
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"intentMessageData"];
    objc_opt_class();
    long long v83 = (void *)v17;
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
      [(_SFPBCard *)v5 setIntentMessageData:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"intentMessageName"];
    objc_opt_class();
    long long v82 = v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[v19 copy];
      [(_SFPBCard *)v5 setIntentMessageName:v20];
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"intentResponseMessageData"];
    objc_opt_class();
    long long v81 = (void *)v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v21 options:0];
      [(_SFPBCard *)v5 setIntentResponseMessageData:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"intentResponseMessageName"];
    objc_opt_class();
    long long v80 = v23;
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(_SFPBCard *)v5 setIntentResponseMessageName:v24];
    }
    id v25 = [v4 objectForKeyedSubscript:@"dismissalCommands"];
    objc_opt_class();
    long long v79 = v25;
    if (objc_opt_isKindOfClass())
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v89 objects:v99 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v90;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v90 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v89 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32 = [[_SFPBAbstractCommand alloc] initWithDictionary:v31];
              [(_SFPBCard *)v5 addDismissalCommands:v32];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v89 objects:v99 count:16];
        }
        while (v28);
      }
    }
    v33 = [v4 objectForKeyedSubscript:@"cardId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = (void *)[v33 copy];
      [(_SFPBCard *)v5 setCardId:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"contextReferenceIdentifier"];
    objc_opt_class();
    long long v78 = v35;
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[v35 copy];
      [(_SFPBCard *)v5 setContextReferenceIdentifier:v36];
    }
    uint64_t v37 = [v4 objectForKeyedSubscript:@"urlValue"];
    objc_opt_class();
    long long v77 = (void *)v37;
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBURL alloc] initWithDictionary:v37];
      [(_SFPBCard *)v5 setUrlValue:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    v76 = v39;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCard setSource:](v5, "setSource:", [v39 intValue]);
    }
    uint64_t v40 = [v4 objectForKeyedSubscript:@"entityIdentifier"];
    objc_opt_class();
    v75 = (void *)v40;
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v40 options:0];
      [(_SFPBCard *)v5 setEntityIdentifier:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"resultIdentifier"];
    objc_opt_class();
    v74 = v42;
    if (objc_opt_isKindOfClass())
    {
      v43 = (void *)[v42 copy];
      [(_SFPBCard *)v5 setResultIdentifier:v43];
    }
    v44 = [v4 objectForKeyedSubscript:@"queryId"];
    objc_opt_class();
    v73 = v44;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCard setQueryId:](v5, "setQueryId:", [v44 unsignedLongLongValue]);
    }
    v45 = [v4 objectForKeyedSubscript:@"fbr"];
    objc_opt_class();
    v72 = v45;
    if (objc_opt_isKindOfClass())
    {
      v46 = (void *)[v45 copy];
      [(_SFPBCard *)v5 setFbr:v46];
    }
    id v47 = [v4 objectForKeyedSubscript:@"flexibleSectionOrder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCard setFlexibleSectionOrder:](v5, "setFlexibleSectionOrder:", [v47 BOOLValue]);
    }
    v68 = v47;
    v69 = v33;
    v48 = [v4 objectForKeyedSubscript:@"entityProtobufMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v49 = v48;
      uint64_t v50 = [v49 countByEnumeratingWithState:&v85 objects:v98 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v86;
        do
        {
          for (uint64_t k = 0; k != v51; ++k)
          {
            if (*(void *)v86 != v52) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v85 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v55 = [[_SFPBNamedProtobufMessage alloc] initWithDictionary:v54];
              [(_SFPBCard *)v5 addEntityProtobufMessages:v55];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v85 objects:v98 count:16];
        }
        while (v51);
      }
    }
    v56 = [v4 objectForKeyedSubscript:@"titleImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = [[_SFPBImage alloc] initWithDictionary:v56];
      [(_SFPBCard *)v5 setTitleImage:v57];
    }
    v58 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v59 = [[_SFPBColor alloc] initWithDictionary:v58];
      [(_SFPBCard *)v5 setBackgroundColor:v59];
    }
    v60 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = [[_SFPBDrillDownMetadata alloc] initWithDictionary:v60];
      [(_SFPBCard *)v5 setMetadata:v61];
    }
    v62 = [v4 objectForKeyedSubscript:@"drilldownMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v63 = [[_SFPBDrillDownMetadata alloc] initWithDictionary:v62];
      [(_SFPBCard *)v5 setDrilldownMetadata:v63];
    }
    v64 = [v4 objectForKeyedSubscript:@"backgroundImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v65 = [[_SFPBImage alloc] initWithDictionary:v64];
      [(_SFPBCard *)v5 setBackgroundImage:v65];
    }
    v66 = v5;
  }
  return v5;
}

- (_SFPBCard)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCard *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCard *)self dictionaryRepresentation];
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
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBCard *)self backgroundColor];
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
  if (self->_backgroundImage)
  {
    uint64_t v7 = [(_SFPBCard *)self backgroundImage];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backgroundImage"];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backgroundImage"];
    }
  }
  if (self->_cardId)
  {
    id v10 = [(_SFPBCard *)self cardId];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"cardId"];
  }
  if ([(NSArray *)self->_cardSections count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v13 = self->_cardSections;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v86 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v85 + 1) + 8 * i) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"cardSections"];
  }
  if (self->_contextReferenceIdentifier)
  {
    v20 = [(_SFPBCard *)self contextReferenceIdentifier];
    uint64_t v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"contextReferenceIdentifier"];
  }
  if ([(NSArray *)self->_dismissalCommands count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v23 = self->_dismissalCommands;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v82;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v82 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = [*(id *)(*((void *)&v81 + 1) + 8 * j) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"dismissalCommands"];
  }
  if (self->_drilldownMetadata)
  {
    v30 = [(_SFPBCard *)self drilldownMetadata];
    uint64_t v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"drilldownMetadata"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"drilldownMetadata"];
    }
  }
  if (self->_entityIdentifier)
  {
    v33 = [(_SFPBCard *)self entityIdentifier];
    v34 = [v33 base64EncodedStringWithOptions:0];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"entityIdentifier"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"entityIdentifier"];
    }
  }
  if ([(NSArray *)self->_entityProtobufMessages count])
  {
    v36 = [MEMORY[0x1E4F1CA48] array];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v37 = self->_entityProtobufMessages;
    uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v77 objects:v89 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v78 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [*(id *)(*((void *)&v77 + 1) + 8 * k) dictionaryRepresentation];
          if (v42)
          {
            [v36 addObject:v42];
          }
          else
          {
            v43 = [MEMORY[0x1E4F1CA98] null];
            [v36 addObject:v43];
          }
        }
        uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v77 objects:v89 count:16];
      }
      while (v39);
    }

    [v3 setObject:v36 forKeyedSubscript:@"entityProtobufMessages"];
  }
  if (self->_fbr)
  {
    v44 = [(_SFPBCard *)self fbr];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"fbr"];
  }
  if (self->_flexibleSectionOrder)
  {
    v46 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCard flexibleSectionOrder](self, "flexibleSectionOrder"));
    [v3 setObject:v46 forKeyedSubscript:@"flexibleSectionOrder"];
  }
  if (self->_intentMessageData)
  {
    id v47 = [(_SFPBCard *)self intentMessageData];
    v48 = [v47 base64EncodedStringWithOptions:0];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"intentMessageData"];
    }
    else
    {
      id v49 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v49 forKeyedSubscript:@"intentMessageData"];
    }
  }
  if (self->_intentMessageName)
  {
    uint64_t v50 = [(_SFPBCard *)self intentMessageName];
    uint64_t v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"intentMessageName"];
  }
  if (self->_intentResponseMessageData)
  {
    uint64_t v52 = [(_SFPBCard *)self intentResponseMessageData];
    v53 = [v52 base64EncodedStringWithOptions:0];
    if (v53)
    {
      [v3 setObject:v53 forKeyedSubscript:@"intentResponseMessageData"];
    }
    else
    {
      uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v54 forKeyedSubscript:@"intentResponseMessageData"];
    }
  }
  if (self->_intentResponseMessageName)
  {
    v55 = [(_SFPBCard *)self intentResponseMessageName];
    v56 = (void *)[v55 copy];
    [v3 setObject:v56 forKeyedSubscript:@"intentResponseMessageName"];
  }
  if (self->_metadata)
  {
    v57 = [(_SFPBCard *)self metadata];
    v58 = [v57 dictionaryRepresentation];
    if (v58)
    {
      [v3 setObject:v58 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v59 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v59 forKeyedSubscript:@"metadata"];
    }
  }
  if (self->_queryId)
  {
    v60 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBCard queryId](self, "queryId"));
    [v3 setObject:v60 forKeyedSubscript:@"queryId"];
  }
  if (self->_resultIdentifier)
  {
    v61 = [(_SFPBCard *)self resultIdentifier];
    v62 = (void *)[v61 copy];
    [v3 setObject:v62 forKeyedSubscript:@"resultIdentifier"];
  }
  if (self->_source)
  {
    uint64_t v63 = [(_SFPBCard *)self source];
    if (v63 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v63);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E5A2F058[v63];
    }
    [v3 setObject:v64 forKeyedSubscript:@"source"];
  }
  if (self->_title)
  {
    v65 = [(_SFPBCard *)self title];
    v66 = (void *)[v65 copy];
    [v3 setObject:v66 forKeyedSubscript:@"title"];
  }
  if (self->_titleImage)
  {
    v67 = [(_SFPBCard *)self titleImage];
    v68 = [v67 dictionaryRepresentation];
    if (v68)
    {
      [v3 setObject:v68 forKeyedSubscript:@"titleImage"];
    }
    else
    {
      v69 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v69 forKeyedSubscript:@"titleImage"];
    }
  }
  if (self->_type)
  {
    uint64_t v70 = [(_SFPBCard *)self type];
    if (v70 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v70);
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = off_1E5A2F070[v70];
    }
    [v3 setObject:v71 forKeyedSubscript:@"type"];
  }
  if (self->_urlValue)
  {
    v72 = [(_SFPBCard *)self urlValue];
    v73 = [v72 dictionaryRepresentation];
    if (v73)
    {
      [v3 setObject:v73 forKeyedSubscript:@"urlValue"];
    }
    else
    {
      v74 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v74 forKeyedSubscript:@"urlValue"];
    }
  }
  id v75 = v3;

  return v75;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  uint64_t v4 = 2654435761;
  uint64_t v26 = 2654435761 * self->_type;
  NSUInteger v27 = v3;
  uint64_t v25 = [(NSArray *)self->_cardSections hash];
  uint64_t v24 = [(NSData *)self->_intentMessageData hash];
  NSUInteger v23 = [(NSString *)self->_intentMessageName hash];
  uint64_t v22 = [(NSData *)self->_intentResponseMessageData hash];
  NSUInteger v21 = [(NSString *)self->_intentResponseMessageName hash];
  uint64_t v5 = [(NSArray *)self->_dismissalCommands hash];
  NSUInteger v6 = [(NSString *)self->_cardId hash];
  NSUInteger v7 = [(NSString *)self->_contextReferenceIdentifier hash];
  unint64_t v8 = [(_SFPBURL *)self->_urlValue hash];
  uint64_t v9 = 2654435761 * self->_source;
  uint64_t v10 = [(NSData *)self->_entityIdentifier hash];
  NSUInteger v11 = [(NSString *)self->_resultIdentifier hash];
  unint64_t v12 = 2654435761u * self->_queryId;
  NSUInteger v13 = [(NSString *)self->_fbr hash];
  if (!self->_flexibleSectionOrder) {
    uint64_t v4 = 0;
  }
  NSUInteger v14 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  uint64_t v15 = v4 ^ [(NSArray *)self->_entityProtobufMessages hash];
  unint64_t v16 = v15 ^ [(_SFPBImage *)self->_titleImage hash];
  unint64_t v17 = v16 ^ [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v18 = v17 ^ [(_SFPBDrillDownMetadata *)self->_metadata hash];
  unint64_t v19 = v18 ^ [(_SFPBDrillDownMetadata *)self->_drilldownMetadata hash];
  return v14 ^ v19 ^ [(_SFPBImage *)self->_backgroundImage hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_101;
  }
  uint64_t v5 = [(_SFPBCard *)self title];
  NSUInteger v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v7 = [(_SFPBCard *)self title];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBCard *)self title];
    uint64_t v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_101;
  }
  uint64_t v5 = [(_SFPBCard *)self cardSections];
  NSUInteger v6 = [v4 cardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v13 = [(_SFPBCard *)self cardSections];
  if (v13)
  {
    NSUInteger v14 = (void *)v13;
    uint64_t v15 = [(_SFPBCard *)self cardSections];
    unint64_t v16 = [v4 cardSections];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self intentMessageData];
  NSUInteger v6 = [v4 intentMessageData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v18 = [(_SFPBCard *)self intentMessageData];
  if (v18)
  {
    unint64_t v19 = (void *)v18;
    v20 = [(_SFPBCard *)self intentMessageData];
    NSUInteger v21 = [v4 intentMessageData];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self intentMessageName];
  NSUInteger v6 = [v4 intentMessageName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v23 = [(_SFPBCard *)self intentMessageName];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(_SFPBCard *)self intentMessageName];
    uint64_t v26 = [v4 intentMessageName];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self intentResponseMessageData];
  NSUInteger v6 = [v4 intentResponseMessageData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v28 = [(_SFPBCard *)self intentResponseMessageData];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    v30 = [(_SFPBCard *)self intentResponseMessageData];
    uint64_t v31 = [v4 intentResponseMessageData];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self intentResponseMessageName];
  NSUInteger v6 = [v4 intentResponseMessageName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v33 = [(_SFPBCard *)self intentResponseMessageName];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_SFPBCard *)self intentResponseMessageName];
    v36 = [v4 intentResponseMessageName];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self dismissalCommands];
  NSUInteger v6 = [v4 dismissalCommands];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v38 = [(_SFPBCard *)self dismissalCommands];
  if (v38)
  {
    uint64_t v39 = (void *)v38;
    uint64_t v40 = [(_SFPBCard *)self dismissalCommands];
    v41 = [v4 dismissalCommands];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self cardId];
  NSUInteger v6 = [v4 cardId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v43 = [(_SFPBCard *)self cardId];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(_SFPBCard *)self cardId];
    v46 = [v4 cardId];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self contextReferenceIdentifier];
  NSUInteger v6 = [v4 contextReferenceIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v48 = [(_SFPBCard *)self contextReferenceIdentifier];
  if (v48)
  {
    id v49 = (void *)v48;
    uint64_t v50 = [(_SFPBCard *)self contextReferenceIdentifier];
    uint64_t v51 = [v4 contextReferenceIdentifier];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self urlValue];
  NSUInteger v6 = [v4 urlValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v53 = [(_SFPBCard *)self urlValue];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    v55 = [(_SFPBCard *)self urlValue];
    v56 = [v4 urlValue];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  int source = self->_source;
  if (source != [v4 source]) {
    goto LABEL_101;
  }
  uint64_t v5 = [(_SFPBCard *)self entityIdentifier];
  NSUInteger v6 = [v4 entityIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v59 = [(_SFPBCard *)self entityIdentifier];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_SFPBCard *)self entityIdentifier];
    v62 = [v4 entityIdentifier];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self resultIdentifier];
  NSUInteger v6 = [v4 resultIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v64 = [(_SFPBCard *)self resultIdentifier];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(_SFPBCard *)self resultIdentifier];
    v67 = [v4 resultIdentifier];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  unint64_t queryId = self->_queryId;
  if (queryId != [v4 queryId]) {
    goto LABEL_101;
  }
  uint64_t v5 = [(_SFPBCard *)self fbr];
  NSUInteger v6 = [v4 fbr];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v70 = [(_SFPBCard *)self fbr];
  if (v70)
  {
    v71 = (void *)v70;
    v72 = [(_SFPBCard *)self fbr];
    v73 = [v4 fbr];
    int v74 = [v72 isEqual:v73];

    if (!v74) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  int flexibleSectionOrder = self->_flexibleSectionOrder;
  if (flexibleSectionOrder != [v4 flexibleSectionOrder]) {
    goto LABEL_101;
  }
  uint64_t v5 = [(_SFPBCard *)self entityProtobufMessages];
  NSUInteger v6 = [v4 entityProtobufMessages];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v76 = [(_SFPBCard *)self entityProtobufMessages];
  if (v76)
  {
    long long v77 = (void *)v76;
    long long v78 = [(_SFPBCard *)self entityProtobufMessages];
    long long v79 = [v4 entityProtobufMessages];
    int v80 = [v78 isEqual:v79];

    if (!v80) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self titleImage];
  NSUInteger v6 = [v4 titleImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v81 = [(_SFPBCard *)self titleImage];
  if (v81)
  {
    long long v82 = (void *)v81;
    long long v83 = [(_SFPBCard *)self titleImage];
    long long v84 = [v4 titleImage];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self backgroundColor];
  NSUInteger v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v86 = [(_SFPBCard *)self backgroundColor];
  if (v86)
  {
    long long v87 = (void *)v86;
    long long v88 = [(_SFPBCard *)self backgroundColor];
    long long v89 = [v4 backgroundColor];
    int v90 = [v88 isEqual:v89];

    if (!v90) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self metadata];
  NSUInteger v6 = [v4 metadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v91 = [(_SFPBCard *)self metadata];
  if (v91)
  {
    uint64_t v92 = (void *)v91;
    long long v93 = [(_SFPBCard *)self metadata];
    long long v94 = [v4 metadata];
    int v95 = [v93 isEqual:v94];

    if (!v95) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self drilldownMetadata];
  NSUInteger v6 = [v4 drilldownMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_100;
  }
  uint64_t v96 = [(_SFPBCard *)self drilldownMetadata];
  if (v96)
  {
    objc_super v97 = (void *)v96;
    v98 = [(_SFPBCard *)self drilldownMetadata];
    v99 = [v4 drilldownMetadata];
    int v100 = [v98 isEqual:v99];

    if (!v100) {
      goto LABEL_101;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBCard *)self backgroundImage];
  NSUInteger v6 = [v4 backgroundImage];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_100:

    goto LABEL_101;
  }
  uint64_t v101 = [(_SFPBCard *)self backgroundImage];
  if (!v101)
  {

LABEL_104:
    BOOL v106 = 1;
    goto LABEL_102;
  }
  v102 = (void *)v101;
  v103 = [(_SFPBCard *)self backgroundImage];
  v104 = [v4 backgroundImage];
  char v105 = [v103 isEqual:v104];

  if (v105) {
    goto LABEL_104;
  }
LABEL_101:
  BOOL v106 = 0;
LABEL_102:

  return v106;
}

- (void)writeTo:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBCard *)self title];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCard *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(_SFPBCard *)self cardSections];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v8);
  }

  int v11 = [(_SFPBCard *)self intentMessageData];
  if (v11) {
    PBDataWriterWriteDataField();
  }

  unint64_t v12 = [(_SFPBCard *)self intentMessageName];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  uint64_t v13 = [(_SFPBCard *)self intentResponseMessageData];
  if (v13) {
    PBDataWriterWriteDataField();
  }

  NSUInteger v14 = [(_SFPBCard *)self intentResponseMessageName];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBCard *)self dismissalCommands];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v41;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v17);
  }

  v20 = [(_SFPBCard *)self cardId];
  if (v20) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v21 = [(_SFPBCard *)self contextReferenceIdentifier];
  if (v21) {
    PBDataWriterWriteStringField();
  }

  int v22 = [(_SFPBCard *)self urlValue];
  if (v22) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBCard *)self source]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v23 = [(_SFPBCard *)self entityIdentifier];
  if (v23) {
    PBDataWriterWriteDataField();
  }

  uint64_t v24 = [(_SFPBCard *)self resultIdentifier];
  if (v24) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCard *)self queryId]) {
    PBDataWriterWriteUint64Field();
  }
  uint64_t v25 = [(_SFPBCard *)self fbr];
  if (v25) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCard *)self flexibleSectionOrder]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v26 = [(_SFPBCard *)self entityProtobufMessages];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v37;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v37 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v28);
  }

  uint64_t v31 = [(_SFPBCard *)self titleImage];
  if (v31) {
    PBDataWriterWriteSubmessage();
  }

  int v32 = [(_SFPBCard *)self backgroundColor];
  if (v32) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v33 = [(_SFPBCard *)self metadata];
  if (v33) {
    PBDataWriterWriteSubmessage();
  }

  v34 = [(_SFPBCard *)self drilldownMetadata];
  if (v34) {
    PBDataWriterWriteSubmessage();
  }

  v35 = [(_SFPBCard *)self backgroundImage];
  if (v35) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCardReadFrom(self, (uint64_t)a3);
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setDrilldownMetadata:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setTitleImage:(id)a3
{
}

- (id)entityProtobufMessagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityProtobufMessages objectAtIndexedSubscript:a3];
}

- (unint64_t)entityProtobufMessagesCount
{
  return [(NSArray *)self->_entityProtobufMessages count];
}

- (void)addEntityProtobufMessages:(id)a3
{
  id v4 = a3;
  entityProtobufMessages = self->_entityProtobufMessages;
  id v8 = v4;
  if (!entityProtobufMessages)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_entityProtobufMessages;
    self->_entityProtobufMessages = v6;

    id v4 = v8;
    entityProtobufMessages = self->_entityProtobufMessages;
  }
  [(NSArray *)entityProtobufMessages addObject:v4];
}

- (void)clearEntityProtobufMessages
{
}

- (void)setEntityProtobufMessages:(id)a3
{
  self->_entityProtobufMessages = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setFlexibleSectionOrder:(BOOL)a3
{
  self->_int flexibleSectionOrder = a3;
}

- (void)setFbr:(id)a3
{
  self->_fbr = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setQueryId:(unint64_t)a3
{
  self->_unint64_t queryId = a3;
}

- (void)setResultIdentifier:(id)a3
{
  self->_resultIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setEntityIdentifier:(id)a3
{
  self->_entityIdentifier = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSource:(int)a3
{
  self->_int source = a3;
}

- (void)setUrlValue:(id)a3
{
}

- (void)setContextReferenceIdentifier:(id)a3
{
  self->_contextReferenceIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCardId:(id)a3
{
  self->_cardId = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)dismissalCommandsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dismissalCommands objectAtIndexedSubscript:a3];
}

- (unint64_t)dismissalCommandsCount
{
  return [(NSArray *)self->_dismissalCommands count];
}

- (void)addDismissalCommands:(id)a3
{
  id v4 = a3;
  dismissalCommands = self->_dismissalCommands;
  id v8 = v4;
  if (!dismissalCommands)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dismissalCommands;
    self->_dismissalCommands = v6;

    id v4 = v8;
    dismissalCommands = self->_dismissalCommands;
  }
  [(NSArray *)dismissalCommands addObject:v4];
}

- (void)clearDismissalCommands
{
}

- (void)setDismissalCommands:(id)a3
{
  self->_dismissalCommands = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIntentResponseMessageName:(id)a3
{
  self->_intentResponseMessageName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIntentResponseMessageData:(id)a3
{
  self->_intentResponseMessageData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIntentMessageName:(id)a3
{
  self->_intentMessageName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIntentMessageData:(id)a3
{
  self->_intentMessageData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)cardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)cardSectionsCount
{
  return [(NSArray *)self->_cardSections count];
}

- (void)addCardSections:(id)a3
{
  id v4 = a3;
  cardSections = self->_cardSections;
  id v8 = v4;
  if (!cardSections)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cardSections;
    self->_cardSections = v6;

    id v4 = v8;
    cardSections = self->_cardSections;
  }
  [(NSArray *)cardSections addObject:v4];
}

- (void)clearCardSections
{
}

- (void)setCardSections:(id)a3
{
  self->_cardSections = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end