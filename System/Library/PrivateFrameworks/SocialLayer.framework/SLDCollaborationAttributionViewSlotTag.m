@interface SLDCollaborationAttributionViewSlotTag
+ (BOOL)supportsSecureCoding;
+ (id)_personOtherThanPerson:(id)a3 inArray:(id)a4;
+ (id)conversationDrawingMetadataForAttributions:(id)a3;
+ (id)displayNamesForPersons:(id)a3;
+ (id)placeholderTagForMaxWidth:(double)a3 placeholderGlyphConfiguration:(id)a4;
+ (id)recipientsForAttribution:(id)a3;
+ (id)tagForTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (NSArray)collaboratorDisplayNames;
- (NSArray)conversationDrawingMetadata;
- (NSNumber)widthNumber;
- (NSString)title;
- (SLDCollaborationAttributionViewSlotTag)initWithCoder:(id)a3;
- (SLDCollaborationAttributionViewSlotTag)initWithTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7 isPlaceholder:(BOOL)a8;
- (SLDImageSymbolConfiguration)placeholderGlyphConfiguration;
- (double)maxWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedStyleForStyle:(id)a3;
- (int64_t)variant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCollaboratorDisplayNames:(id)a3;
- (void)setConversationDrawingMetadata:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setPlaceholderGlyphConfiguration:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVariant:(int64_t)a3;
- (void)setWidthNumber:(id)a3;
@end

@implementation SLDCollaborationAttributionViewSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placeholderTagForMaxWidth:(double)a3 placeholderGlyphConfiguration:(id)a4
{
  id v5 = a4;
  v6 = [SLDCollaborationAttributionViewSlotTag alloc];
  v7 = [(SLDCollaborationAttributionViewSlotTag *)v6 initWithTitle:&stru_1EEC19158 attributions:MEMORY[0x1E4F1CBF0] placeholderGlyphConfiguration:v5 maxWidth:1 variant:1 isPlaceholder:a3];

  return v7;
}

+ (id)tagForTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[SLDCollaborationAttributionViewSlotTag alloc] initWithTitle:v13 attributions:v12 placeholderGlyphConfiguration:v11 maxWidth:a7 variant:0 isPlaceholder:a6];

  return v14;
}

- (SLDCollaborationAttributionViewSlotTag)initWithTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7 isPlaceholder:(BOOL)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v48.receiver = self;
  v48.super_class = (Class)SLDCollaborationAttributionViewSlotTag;
  v18 = [(SLDCollaborationAttributionViewSlotTag *)&v48 init];
  v19 = v18;
  if (v18)
  {
    id v42 = v17;
    id v43 = v15;
    v18->_isPlaceholder = a8;
    objc_storeStrong((id *)&v18->_placeholderGlyphConfiguration, a5);
    objc_storeStrong((id *)&v19->_title, a3);
    v19->_maxWidth = a6;
    *(float *)&double v20 = a6;
    uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithFloat:v20];
    widthNumber = v19->_widthNumber;
    v19->_widthNumber = (NSNumber *)v21;

    v19->_variant = a7;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v31 = objc_msgSend(v30, "groupDisplayName", v42, v43, (void)v44);

          if (v31)
          {
            v32 = [v30 groupDisplayName];
            [v23 addObject:v32];
          }
          else
          {
            v32 = [(id)objc_opt_class() recipientsForAttribution:v30];
            [v24 addObjectsFromArray:v32];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v27);
    }

    v33 = objc_opt_class();
    v34 = [v24 allObjects];
    v35 = [v33 displayNamesForPersons:v34];
    [v23 addObjectsFromArray:v35];

    v36 = SLDaemonLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v25;
      __int16 v51 = 2112;
      id v52 = v24;
      _os_log_impl(&dword_19BE17000, v36, OS_LOG_TYPE_DEFAULT, "SLDCollaborationAttributionViewSlotTag attributions: %@ Generated people %@", buf, 0x16u);
    }

    uint64_t v37 = [v23 copy];
    collaboratorDisplayNames = v19->_collaboratorDisplayNames;
    v19->_collaboratorDisplayNames = (NSArray *)v37;

    uint64_t v39 = [(id)objc_opt_class() conversationDrawingMetadataForAttributions:v25];
    conversationDrawingMetadata = v19->_conversationDrawingMetadata;
    v19->_conversationDrawingMetadata = (NSArray *)v39;

    id v17 = v42;
    id v15 = v43;
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
  id v5 = [v3 stringWithFormat:@"<SLDCollaborationAttributionViewSlotTag: %p> maxWidth:[%@]", self, v4];

  return v5;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v15 = (void *)MEMORY[0x1E4FB3490];
  id v3 = a3;
  uint64_t v4 = [v3 accessibilityButtonShapes];
  uint64_t v5 = [v3 accessibilityContrast];
  uint64_t v6 = [v3 displayScale];
  uint64_t v7 = [v3 layoutDirection];
  v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  uint64_t v10 = [v3 tintColor];
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  id v13 = [v15 slotStyleWithAccessibilityButtonShapes:v4 accessibilityContrast:v5 displayRange:1 displayScale:v6 layoutDirection:v7 legibilityWeight:0 localization:v8 preferredContentSizeCategory:v9 tintColor:v10 userInterfaceIdiom:v11 userInterfaceStyle:v12];

  return v13;
}

+ (id)conversationDrawingMetadataForAttributions:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v4;
  uint64_t v45 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v53;
    *(void *)&long long v6 = 138412546;
    long long v40 = v6;
    id v41 = v5;
    id v42 = a1;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(a1, "recipientsForAttribution:", v8, v40);
        if (![v9 count])
        {
          uint64_t v10 = SLDaemonLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v35 = [v8 uniqueIdentifier];
            *(_DWORD *)buf = v40;
            id v58 = a1;
            __int16 v59 = 2112;
            v60 = v35;
            _os_log_error_impl(&dword_19BE17000, v10, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag Found no recipients for attribution with identifier %@", buf, 0x16u);
          }
        }
        uint64_t v11 = SLDaemonLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [v8 uniqueIdentifier];
          *(_DWORD *)buf = 138412802;
          id v58 = a1;
          __int16 v59 = 2112;
          v60 = v12;
          __int16 v61 = 2112;
          v62 = v9;
          _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "[%@] SLDCollaborationAttributionViewSlotTag ID: %@ found recipients %@", buf, 0x20u);
        }
        long long v46 = v8;
        long long v47 = v9;
        if ([v8 isGroupConversation] && (unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v14 = v9;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v49;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v49 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                double v20 = [SLCollaborationAttributionRecipientDrawingMetadata alloc];
                uint64_t v21 = [v19 contact];
                v22 = [v19 thumbnailImageData];
                id v23 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v20 initWithContact:v21 contactImageData:v22];

                [v13 addObject:v23];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v56 count:16];
            }
            while (v16);
          }

          id v24 = [SLCollaborationAttributionConversationDrawingMetadata alloc];
          id v25 = [v46 groupPhotoPath];
          uint64_t v26 = [v46 groupID];
          uint64_t v27 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v26 UUIDString];
          uint64_t v28 = [(SLCollaborationAttributionConversationDrawingMetadata *)v24 initWithGroupPhotoFileURL:v25 recipientDrawingMetadata:v13 groupID:v27];

          id v5 = v41;
          a1 = v42;
        }
        else
        {
          if ((unint64_t)[v9 count] >= 2)
          {
            v29 = SLDaemonLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v36 = [v8 uniqueIdentifier];
              *(_DWORD *)buf = v40;
              id v58 = a1;
              __int16 v59 = 2112;
              v60 = v36;
              _os_log_error_impl(&dword_19BE17000, v29, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag Found more than one recipient, but attribution.isGroupConversation was NO. attribution.uniqueIdentifier: %@", buf, 0x16u);
            }
          }
          id v13 = [v9 firstObject];
          v30 = [v13 contact];
          id v25 = [v30 thumbnailImageData];

          if (!v25)
          {
            id v25 = [v13 thumbnailImageData];
          }
          v31 = [SLCollaborationAttributionRecipientDrawingMetadata alloc];
          v32 = [v13 contact];
          uint64_t v26 = [(SLCollaborationAttributionRecipientDrawingMetadata *)v31 initWithContact:v32 contactImageData:v25];

          uint64_t v28 = [[SLCollaborationAttributionConversationDrawingMetadata alloc] initWithRecipientDrawingMetadata:v26];
        }

        if (v28)
        {
          [v5 addObject:v28];
          v33 = v47;
        }
        else
        {
          v34 = SLDaemonLogHandle();
          v33 = v47;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = [v46 uniqueIdentifier];
            *(_DWORD *)buf = v40;
            id v58 = a1;
            __int16 v59 = 2112;
            v60 = v37;
            _os_log_error_impl(&dword_19BE17000, v34, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata was nil! Skipping. attribution.uniqueIdentifier: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v45);
  }

  v38 = (void *)[v5 copy];
  return v38;
}

+ (id)_personOtherThanPerson:(id)a3 inArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((SLPersonIsEqualToPerson(v10, v5) & 1) == 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)displayNamesForPersons:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "shortDisplayName", (void)v14);
        if (v11)
        {
          [v4 addObject:v11];
        }
        else
        {
          long long v12 = [v10 displayName];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)recipientsForAttribution:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = +[SLPerson fetchMeContact];
  if ([v3 isFromMe])
  {
    uint64_t v6 = [v3 sender];
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = v3;
  uint64_t v7 = [v3 relatedPersons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [v12 contact];
        if ([v13 isEqual:v5])
        {
        }
        else
        {
          char IsEqualToPerson = SLPersonIsEqualToPerson(v6, v12);

          if ((IsEqualToPerson & 1) == 0) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (SLDCollaborationAttributionViewSlotTag)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLDCollaborationAttributionViewSlotTag;
  id v5 = [(SLDCollaborationAttributionViewSlotTag *)&v21 init];
  if (v5)
  {
    v5->_isPlaceholder = [v4 decodeBoolForKey:@"isPlaceholder"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"collaboratorDisplayNames"];
    collaboratorDisplayNames = v5->_collaboratorDisplayNames;
    v5->_collaboratorDisplayNames = (NSArray *)v11;

    [v4 decodeDoubleForKey:@"maxWidth"];
    v5->_maxWidth = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidthNumber"];
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v14;

    v5->_variant = [v4 decodeIntegerForKey:@"variant"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationMetadata"];
    conversationDrawingMetadata = v5->_conversationDrawingMetadata;
    v5->_conversationDrawingMetadata = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolConfigKey"];
    placeholderGlyphConfiguration = v5->_placeholderGlyphConfiguration;
    v5->_placeholderGlyphConfiguration = (SLDImageSymbolConfiguration *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder"), @"isPlaceholder");
  id v5 = [(SLDCollaborationAttributionViewSlotTag *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(SLDCollaborationAttributionViewSlotTag *)self collaboratorDisplayNames];
  [v4 encodeObject:v6 forKey:@"collaboratorDisplayNames"];

  [(SLDCollaborationAttributionViewSlotTag *)self maxWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxWidth");
  uint64_t v7 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
  [v4 encodeObject:v7 forKey:@"maxWidthNumber"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDCollaborationAttributionViewSlotTag variant](self, "variant"), @"variant");
  uint64_t v8 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
  [v4 encodeObject:v8 forKey:@"conversationMetadata"];

  id v9 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
  [v4 encodeObject:v9 forKey:@"symbolConfigKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIsPlaceholder:", -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder"));
  id v5 = [(SLDCollaborationAttributionViewSlotTag *)self title];
  [v4 setTitle:v5];

  uint64_t v6 = [(SLDCollaborationAttributionViewSlotTag *)self collaboratorDisplayNames];
  [v4 setCollaboratorDisplayNames:v6];

  [(SLDCollaborationAttributionViewSlotTag *)self maxWidth];
  objc_msgSend(v4, "setMaxWidth:");
  uint64_t v7 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
  [v4 setWidthNumber:v7];

  objc_msgSend(v4, "setVariant:", -[SLDCollaborationAttributionViewSlotTag variant](self, "variant"));
  uint64_t v8 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
  [v4 setConversationDrawingMetadata:v8];

  id v9 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
  [v4 setPlaceholderGlyphConfiguration:v9];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (SLDCollaborationAttributionViewSlotTag *)v5;
    uint64_t v7 = v6;
    if (v6 == self)
    {
      char v20 = 1;
LABEL_48:

      goto LABEL_49;
    }
    BOOL v8 = [(SLDCollaborationAttributionViewSlotTag *)v6 isPlaceholder];
    if (v8 != [(SLDCollaborationAttributionViewSlotTag *)self isPlaceholder]) {
      goto LABEL_47;
    }
    [(SLDCollaborationAttributionViewSlotTag *)v7 maxWidth];
    double v10 = v9;
    [(SLDCollaborationAttributionViewSlotTag *)self maxWidth];
    if (!SL_CGFloatApproximatelyEqualToFloat(v10, v11)) {
      goto LABEL_47;
    }
    long long v12 = [(SLDCollaborationAttributionViewSlotTag *)self title];
    if (v12
      || ([(SLDCollaborationAttributionViewSlotTag *)v7 title],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v13 = [(SLDCollaborationAttributionViewSlotTag *)self title];
      if (!v13) {
        goto LABEL_43;
      }
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [(SLDCollaborationAttributionViewSlotTag *)v7 title];
      if (!v15) {
        goto LABEL_42;
      }
      uint64_t v16 = (void *)v15;
      long long v17 = [(SLDCollaborationAttributionViewSlotTag *)self title];
      uint64_t v18 = [(SLDCollaborationAttributionViewSlotTag *)v7 title];
      int v19 = [v17 isEqualToString:v18];

      if (v12)
      {

        if (!v19) {
          goto LABEL_47;
        }
      }
      else
      {

        if ((v19 & 1) == 0) {
          goto LABEL_47;
        }
      }
    }
    objc_super v21 = [(SLDCollaborationAttributionViewSlotTag *)self collaboratorDisplayNames];
    if (v21
      || ([(SLDCollaborationAttributionViewSlotTag *)v7 collaboratorDisplayNames],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v22 = [(SLDCollaborationAttributionViewSlotTag *)self collaboratorDisplayNames];
      id v23 = [(SLDCollaborationAttributionViewSlotTag *)v7 collaboratorDisplayNames];
      int v24 = [v22 isEqualToArray:v23];

      if (v21)
      {

        if (!v24) {
          goto LABEL_47;
        }
      }
      else
      {

        if ((v24 & 1) == 0) {
          goto LABEL_47;
        }
      }
    }
    long long v12 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
    if (v12
      || ([(SLDCollaborationAttributionViewSlotTag *)v7 widthNumber],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v25 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
      if (!v25) {
        goto LABEL_43;
      }
      uint64_t v14 = (void *)v25;
      uint64_t v26 = [(SLDCollaborationAttributionViewSlotTag *)v7 widthNumber];
      if (!v26) {
        goto LABEL_42;
      }
      uint64_t v27 = (void *)v26;
      uint64_t v28 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
      v29 = [(SLDCollaborationAttributionViewSlotTag *)v7 widthNumber];
      int v30 = [v28 isEqualToNumber:v29];

      if (v12)
      {

        if (!v30) {
          goto LABEL_47;
        }
      }
      else
      {

        if ((v30 & 1) == 0) {
          goto LABEL_47;
        }
      }
    }
    int64_t v31 = [(SLDCollaborationAttributionViewSlotTag *)self variant];
    if (v31 != [(SLDCollaborationAttributionViewSlotTag *)v7 variant]) {
      goto LABEL_47;
    }
    long long v12 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
    if (!v12)
    {
      id v3 = [(SLDCollaborationAttributionViewSlotTag *)v7 conversationDrawingMetadata];
      if (!v3)
      {
LABEL_36:
        long long v12 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
        if (!v12)
        {
          id v3 = [(SLDCollaborationAttributionViewSlotTag *)v7 placeholderGlyphConfiguration];
          if (!v3)
          {
            char v20 = 1;
LABEL_54:

            goto LABEL_45;
          }
        }
        uint64_t v38 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
        if (v38)
        {
          uint64_t v39 = (void *)v38;
          uint64_t v40 = [(SLDCollaborationAttributionViewSlotTag *)v7 placeholderGlyphConfiguration];
          if (v40)
          {
            id v41 = (void *)v40;
            id v42 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
            id v43 = [(SLDCollaborationAttributionViewSlotTag *)v7 placeholderGlyphConfiguration];
            char v20 = [v42 isEqual:v43];

            if (!v12) {
              goto LABEL_54;
            }
LABEL_45:

            goto LABEL_48;
          }
        }
        char v20 = 0;
        if (!v12) {
          goto LABEL_54;
        }
        goto LABEL_45;
      }
    }
    uint64_t v32 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
    if (!v32)
    {
LABEL_43:
      char v20 = 0;
      if (!v12) {
        long long v12 = v3;
      }
      goto LABEL_45;
    }
    uint64_t v14 = (void *)v32;
    uint64_t v33 = [(SLDCollaborationAttributionViewSlotTag *)v7 conversationDrawingMetadata];
    if (v33)
    {
      v34 = (void *)v33;
      v35 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
      v36 = [(SLDCollaborationAttributionViewSlotTag *)v7 conversationDrawingMetadata];
      int v37 = [v35 isEqualToArray:v36];

      if (v12)
      {

        if (v37) {
          goto LABEL_36;
        }
      }
      else
      {

        if (v37) {
          goto LABEL_36;
        }
      }
LABEL_47:
      char v20 = 0;
      goto LABEL_48;
    }
LABEL_42:

    goto LABEL_43;
  }
  char v20 = 0;
LABEL_49:

  return v20;
}

- (unint64_t)hash
{
  id v3 = [(SLDCollaborationAttributionViewSlotTag *)self widthNumber];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLDCollaborationAttributionViewSlotTag *)self collaboratorDisplayNames];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = v6 ^ [(SLDCollaborationAttributionViewSlotTag *)self variant];
  uint64_t v8 = [(SLDCollaborationAttributionViewSlotTag *)self isPlaceholder];
  double v9 = [(SLDCollaborationAttributionViewSlotTag *)self conversationDrawingMetadata];
  uint64_t v10 = v7 ^ v8 ^ [v9 hash];
  double v11 = [(SLDCollaborationAttributionViewSlotTag *)self title];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(SLDCollaborationAttributionViewSlotTag *)self placeholderGlyphConfiguration];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (SLDImageSymbolConfiguration)placeholderGlyphConfiguration
{
  return self->_placeholderGlyphConfiguration;
}

- (void)setPlaceholderGlyphConfiguration:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (NSArray)collaboratorDisplayNames
{
  return self->_collaboratorDisplayNames;
}

- (void)setCollaboratorDisplayNames:(id)a3
{
}

- (NSArray)conversationDrawingMetadata
{
  return self->_conversationDrawingMetadata;
}

- (void)setConversationDrawingMetadata:(id)a3
{
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_conversationDrawingMetadata, 0);
  objc_storeStrong((id *)&self->_collaboratorDisplayNames, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_placeholderGlyphConfiguration, 0);
}

@end