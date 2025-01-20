@interface SLDHighlightPillSlotTag
+ (BOOL)supportsSecureCoding;
+ (id)tagForHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)sendersToDisplay;
- (NSNumber)allSendersNumber;
- (NSNumber)widthNumber;
- (NSString)groupID;
- (NSString)groupName;
- (NSURL)groupPhotoPath;
- (SLDHighlightPillSlotTag)initWithCoder:(id)a3;
- (SLDHighlightPillSlotTag)initWithHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6;
- (SLPerson)meSender;
- (SLPerson)pinnedSender;
- (double)maxWidth;
- (id)_personOtherThanPerson:(id)a3 inArray:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)allSendersCount;
- (unint64_t)hash;
- (unint64_t)maxPossibleImageCount;
- (unint64_t)variant;
- (void)_generateCollaborationSendersForMultipleAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4;
- (void)_generateCollaborationSendersForSingleAttribution:(id)a3 maxSendersToDisplay:(unint64_t)a4;
- (void)_generateSendersWithDisplayPolicyForAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllSendersNumber:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupPhotoPath:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setMeSender:(id)a3;
- (void)setPinnedSender:(id)a3;
- (void)setSendersToDisplay:(id)a3;
- (void)setVariant:(unint64_t)a3;
- (void)setWidthNumber:(id)a3;
@end

@implementation SLDHighlightPillSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tagForHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6
{
  id v9 = a3;
  v10 = [[SLDHighlightPillSlotTag alloc] initWithHighlightAttributions:v9 maxWidth:a5 maxSendersToDisplay:a6 variant:a4];

  return v10;
}

- (SLDHighlightPillSlotTag)initWithHighlightAttributions:(id)a3 maxWidth:(double)a4 maxSendersToDisplay:(unint64_t)a5 variant:(unint64_t)a6
{
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLDHighlightPillSlotTag;
  v11 = [(SLDHighlightPillSlotTag *)&v18 init];
  v13 = v11;
  if (v11)
  {
    v11->_maxWidth = a4;
    *(float *)&double v12 = a4;
    uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithFloat:v12];
    widthNumber = v13->_widthNumber;
    v13->_widthNumber = (NSNumber *)v14;

    v13->_variant = a6;
    if (a6 <= 0xA && ((1 << a6) & 0x4AA) != 0)
    {
      if ([v10 count] == 1)
      {
        v16 = [v10 firstObject];
        [(SLDHighlightPillSlotTag *)v13 _generateCollaborationSendersForSingleAttribution:v16 maxSendersToDisplay:a5];
      }
      else
      {
        [(SLDHighlightPillSlotTag *)v13 _generateCollaborationSendersForMultipleAttributions:v10 maxSendersToDisplay:a5];
      }
    }
    else
    {
      [(SLDHighlightPillSlotTag *)v13 _generateSendersWithDisplayPolicyForAttributions:v10 maxSendersToDisplay:a5];
    }
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SLDHighlightPillSlotTag *)self widthNumber];
  v5 = [v3 stringWithFormat:@"<SLDHighlightPillSlotTag: %p> maxWidth:[%@]", self, v4];

  return v5;
}

- (id)resolvedStyleForStyle:(id)a3
{
  v15 = (void *)MEMORY[0x1E4FB3490];
  id v3 = a3;
  uint64_t v4 = [v3 accessibilityButtonShapes];
  uint64_t v5 = [v3 accessibilityContrast];
  uint64_t v6 = [v3 displayScale];
  uint64_t v7 = [v3 layoutDirection];
  v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68]);
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  v13 = [v15 slotStyleWithAccessibilityButtonShapes:v4 accessibilityContrast:v5 displayRange:1 displayScale:v6 layoutDirection:v7 legibilityWeight:0 localization:v8 preferredContentSizeCategory:v9 tintColor:ConstantColor userInterfaceIdiom:v11 userInterfaceStyle:v12];

  return v13;
}

- (SLDHighlightPillSlotTag)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SLDHighlightPillSlotTag;
  uint64_t v5 = [(SLDHighlightPillSlotTag *)&v28 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"maxWidth"];
    v5->_maxWidth = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidthNumber"];
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allSendersCount"];
    id v10 = (void *)v9;
    if (v9)
    {
      v5->_allSendersNumber = (NSNumber *)v9;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:0];
      v5->_allSendersNumber = v11;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sendersToDisplay"];
    sendersToDisplay = v5->_sendersToDisplay;
    v5->_sendersToDisplay = (NSArray *)v15;

    v5->_variant = [v4 decodeIntegerForKey:@"variant"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedSender"];
    pinnedSender = v5->_pinnedSender;
    v5->_pinnedSender = (SLPerson *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"meSender"];
    meSender = v5->_meSender;
    v5->_meSender = (SLPerson *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupPhotoPath"];
    groupPhotoPath = v5->_groupPhotoPath;
    v5->_groupPhotoPath = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SLDHighlightPillSlotTag *)self maxWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxWidth");
  uint64_t v5 = [(SLDHighlightPillSlotTag *)self widthNumber];
  [v4 encodeObject:v5 forKey:@"maxWidthNumber"];

  double v6 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
  [v4 encodeObject:v6 forKey:@"allSendersCount"];

  uint64_t v7 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
  [v4 encodeObject:v7 forKey:@"sendersToDisplay"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDHighlightPillSlotTag variant](self, "variant"), @"variant");
  v8 = [(SLDHighlightPillSlotTag *)self pinnedSender];
  [v4 encodeObject:v8 forKey:@"pinnedSender"];

  uint64_t v9 = [(SLDHighlightPillSlotTag *)self meSender];
  [v4 encodeObject:v9 forKey:@"meSender"];

  id v10 = [(SLDHighlightPillSlotTag *)self groupID];
  [v4 encodeObject:v10 forKey:@"groupID"];

  uint64_t v11 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
  [v4 encodeObject:v11 forKey:@"groupPhotoPath"];

  id v12 = [(SLDHighlightPillSlotTag *)self groupName];
  [v4 encodeObject:v12 forKey:@"groupName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SLDHighlightPillSlotTag *)self maxWidth];
  objc_msgSend(v4, "setMaxWidth:");
  uint64_t v5 = [(SLDHighlightPillSlotTag *)self widthNumber];
  [v4 setWidthNumber:v5];

  double v6 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
  [v4 setSendersToDisplay:v6];

  uint64_t v7 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
  [v4 setAllSendersNumber:v7];

  objc_msgSend(v4, "setVariant:", -[SLDHighlightPillSlotTag variant](self, "variant"));
  v8 = [(SLDHighlightPillSlotTag *)self pinnedSender];
  [v4 setPinnedSender:v8];

  uint64_t v9 = [(SLDHighlightPillSlotTag *)self meSender];
  [v4 setMeSender:v9];

  id v10 = [(SLDHighlightPillSlotTag *)self groupID];
  [v4 setGroupID:v10];

  uint64_t v11 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
  [v4 setGroupPhotoPath:v11];

  id v12 = [(SLDHighlightPillSlotTag *)self groupName];
  [v4 setGroupName:v12];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = (SLDHighlightPillSlotTag *)v5;
    uint64_t v7 = v6;
    if (v6 == self)
    {
      char v19 = 1;
LABEL_61:

      goto LABEL_62;
    }
    [(SLDHighlightPillSlotTag *)v6 maxWidth];
    double v9 = v8;
    [(SLDHighlightPillSlotTag *)self maxWidth];
    if (!SL_CGFloatApproximatelyEqualToFloat(v9, v10)) {
      goto LABEL_60;
    }
    uint64_t v11 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
    if (v11
      || ([(SLDHighlightPillSlotTag *)v7 allSendersNumber],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
      if (!v12) {
        goto LABEL_22;
      }
      v13 = (void *)v12;
      uint64_t v14 = [(SLDHighlightPillSlotTag *)v7 allSendersNumber];
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v15 = (void *)v14;
      v16 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
      uint64_t v17 = [(SLDHighlightPillSlotTag *)v7 allSendersNumber];
      int v18 = [v16 isEqualToNumber:v17];

      if (v11)
      {

        if (!v18) {
          goto LABEL_60;
        }
      }
      else
      {

        if ((v18 & 1) == 0) {
          goto LABEL_60;
        }
      }
    }
    uint64_t v11 = [(SLDHighlightPillSlotTag *)self widthNumber];
    if (!v11)
    {
      id v3 = [(SLDHighlightPillSlotTag *)v7 widthNumber];
      if (!v3)
      {
LABEL_26:
        v26 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
        if (v26
          || ([(SLDHighlightPillSlotTag *)v7 sendersToDisplay],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v27 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
          objc_super v28 = [(SLDHighlightPillSlotTag *)v7 sendersToDisplay];
          int v29 = SLPersonArrayisEqualToArray(v27, v28);

          if (v26)
          {

            if (!v29) {
              goto LABEL_60;
            }
          }
          else
          {

            if ((v29 & 1) == 0) {
              goto LABEL_60;
            }
          }
        }
        v30 = [(SLDHighlightPillSlotTag *)self pinnedSender];
        if (v30
          || ([(SLDHighlightPillSlotTag *)v7 pinnedSender],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v31 = [(SLDHighlightPillSlotTag *)self pinnedSender];
          v32 = [(SLDHighlightPillSlotTag *)v7 pinnedSender];
          int IsEqualToPerson = SLPersonIsEqualToPerson(v31, v32);

          if (v30)
          {

            if (!IsEqualToPerson) {
              goto LABEL_60;
            }
          }
          else
          {

            if ((IsEqualToPerson & 1) == 0) {
              goto LABEL_60;
            }
          }
        }
        v34 = [(SLDHighlightPillSlotTag *)self meSender];
        if (v34
          || ([(SLDHighlightPillSlotTag *)v7 meSender],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v35 = [(SLDHighlightPillSlotTag *)self meSender];
          v36 = [(SLDHighlightPillSlotTag *)v7 meSender];
          int v37 = SLPersonIsEqualToPerson(v35, v36);

          if (v34)
          {

            if (!v37) {
              goto LABEL_60;
            }
          }
          else
          {

            if ((v37 & 1) == 0) {
              goto LABEL_60;
            }
          }
        }
        unint64_t v38 = [(SLDHighlightPillSlotTag *)self variant];
        if (v38 == [(SLDHighlightPillSlotTag *)v7 variant])
        {
          v39 = [(SLDHighlightPillSlotTag *)self groupID];
          if (v39
            || ([(SLDHighlightPillSlotTag *)v7 groupID],
                (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v40 = [(SLDHighlightPillSlotTag *)self groupID];
            v41 = [(SLDHighlightPillSlotTag *)v7 groupID];
            int v42 = [v40 isEqualToString:v41];

            if (v39)
            {

              if (!v42) {
                goto LABEL_60;
              }
            }
            else
            {

              if ((v42 & 1) == 0) {
                goto LABEL_60;
              }
            }
          }
          v43 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
          if (!v43)
          {
            id v3 = [(SLDHighlightPillSlotTag *)v7 groupPhotoPath];
            if (!v3)
            {
LABEL_55:
              uint64_t v11 = [(SLDHighlightPillSlotTag *)self groupName];
              if (v11
                || ([(SLDHighlightPillSlotTag *)v7 groupName],
                    (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                v47 = [(SLDHighlightPillSlotTag *)self groupName];
                v48 = [(SLDHighlightPillSlotTag *)v7 groupName];
                char v19 = [v47 isEqual:v48];

                if (v11)
                {
LABEL_24:

                  goto LABEL_61;
                }
              }
              else
              {
                char v19 = 1;
              }

              goto LABEL_24;
            }
          }
          v44 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
          v45 = [(SLDHighlightPillSlotTag *)v7 groupPhotoPath];
          int v46 = [v44 isEqual:v45];

          if (v43)
          {

            if (v46) {
              goto LABEL_55;
            }
          }
          else
          {

            if (v46) {
              goto LABEL_55;
            }
          }
        }
LABEL_60:
        char v19 = 0;
        goto LABEL_61;
      }
    }
    uint64_t v20 = [(SLDHighlightPillSlotTag *)self widthNumber];
    if (!v20)
    {
LABEL_22:
      char v19 = 0;
      if (!v11) {
        uint64_t v11 = v3;
      }
      goto LABEL_24;
    }
    v13 = (void *)v20;
    uint64_t v21 = [(SLDHighlightPillSlotTag *)v7 widthNumber];
    if (v21)
    {
      v22 = (void *)v21;
      uint64_t v23 = [(SLDHighlightPillSlotTag *)self widthNumber];
      v24 = [(SLDHighlightPillSlotTag *)v7 widthNumber];
      int v25 = [v23 isEqualToNumber:v24];

      if (v11)
      {

        if (!v25) {
          goto LABEL_60;
        }
      }
      else
      {

        if ((v25 & 1) == 0) {
          goto LABEL_60;
        }
      }
      goto LABEL_26;
    }
LABEL_21:

    goto LABEL_22;
  }
  char v19 = 0;
LABEL_62:

  return v19;
}

- (unint64_t)hash
{
  id v3 = [(SLDHighlightPillSlotTag *)self widthNumber];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
  uint64_t v8 = [v7 hash];
  double v9 = [(SLDHighlightPillSlotTag *)self pinnedSender];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(SLDHighlightPillSlotTag *)self meSender];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v12 ^ [(SLDHighlightPillSlotTag *)self variant];
  uint64_t v14 = [(SLDHighlightPillSlotTag *)self groupID];
  uint64_t v15 = v10 ^ v13 ^ [v14 hash];
  v16 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
  uint64_t v17 = [v16 hash];
  int v18 = [(SLDHighlightPillSlotTag *)self groupName];
  unint64_t v19 = v15 ^ v17 ^ [v18 hash];

  return v19;
}

- (unint64_t)maxPossibleImageCount
{
  uint64_t v3 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(SLDHighlightPillSlotTag *)self groupID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [(SLDHighlightPillSlotTag *)self sendersToDisplay];
    unint64_t v6 = [v7 count];
  }
  uint64_t v8 = [(SLDHighlightPillSlotTag *)self pinnedSender];

  if (v8) {
    return v6 + 1;
  }
  else {
    return v6;
  }
}

- (unint64_t)allSendersCount
{
  uint64_t v3 = [(SLDHighlightPillSlotTag *)self allSendersNumber];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(SLDHighlightPillSlotTag *)self allSendersNumber];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)_generateCollaborationSendersForSingleAttribution:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  unint64_t v42 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v44 = [MEMORY[0x1E4F1C978] array];
  v47 = +[SLPerson fetchMeContact];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v4 relatedPersons];
  uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  v48 = v5;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    id v9 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v4, "isFromMe", v42))
        {
          uint64_t v12 = [v4 sender];
          char IsEqualToPerson = SLPersonIsEqualToPerson(v12, v11);
        }
        else
        {
          char IsEqualToPerson = 0;
        }
        uint64_t v14 = [v11 contact];
        uint64_t v15 = [v14 identifier];
        v16 = [v47 identifier];
        char v17 = [v15 isEqualToString:v16];

        unint64_t v5 = v48;
        if ((SLPersonArrayContainsPerson(v48, v11) & 1) == 0 && (IsEqualToPerson & 1) == 0 && (v17 & 1) == 0) {
          [v48 addObject:v11];
        }
        id v4 = v9;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v7);
  }

  if (![v5 count])
  {
    int v18 = [v4 relatedPersons];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = [v4 relatedPersons];
      uint64_t v21 = [v20 firstObject];
      [v48 addObject:v21];
    }
  }
  v22 = objc_msgSend(v4, "groupPhotoPath", v42);
  [(SLDHighlightPillSlotTag *)self setGroupPhotoPath:v22];

  uint64_t v23 = [v4 groupID];
  v24 = [v23 UUIDString];
  [(SLDHighlightPillSlotTag *)self setGroupID:v24];

  int v25 = [v4 groupDisplayName];
  uint64_t v26 = [v25 length];

  if (v26)
  {
    v27 = [v4 groupDisplayName];
    [(SLDHighlightPillSlotTag *)self setGroupName:v27];

    uint64_t v28 = [(SLDHighlightPillSlotTag *)self groupPhotoPath];
    if (v28)
    {
      int v29 = (void *)v28;
      v30 = [(SLDHighlightPillSlotTag *)self groupID];

      if (v30)
      {
        unint64_t v31 = 1;
        v32 = v48;
        v33 = (void *)v44;
        goto LABEL_31;
      }
    }
    v32 = v48;
    if (v43)
    {
      id v34 = v48;
    }
    else
    {
      objc_msgSend(v48, "subarrayWithRange:", 0, 0);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v37 = v34;
    unint64_t v31 = 1;
    v35 = (void *)v44;
  }
  else
  {
    v32 = v48;
    unint64_t v31 = [v48 count];
    v35 = (void *)v44;
    if (v31 >= v43)
    {
      id v36 = [v48 subarrayWithRange:0];
    }
    else
    {
      id v36 = v48;
    }
    id v37 = v36;
  }

  v33 = v37;
LABEL_31:
  self->_allSendersNumber = (NSNumber *)(id)[MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v31];
  unint64_t v38 = (NSArray *)[v33 copy];
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v38;

  int v40 = [v4 isPinned];
  if (v40)
  {
    v41 = [v4 sender];
  }
  else
  {
    v41 = 0;
  }
  objc_storeStrong((id *)&self->_pinnedSender, v41);
  if (v40) {
}
  }

- (void)_generateCollaborationSendersForMultipleAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
  uint64_t v7 = [v4 sortedArrayUsingDescriptors:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  int v46 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
  unint64_t v43 = (void *)v5;
  uint64_t v44 = v4;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v59;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if ([v14 isPinned])
        {
          uint64_t v15 = [v14 sender];
          if ([v14 isFromMe])
          {
            v16 = [v14 sender];
            char v17 = [v14 relatedPersons];
            uint64_t v18 = [(SLDHighlightPillSlotTag *)self _personOtherThanPerson:v16 inArray:v17];
            uint64_t v19 = (void *)v18;
            if (v18) {
              uint64_t v20 = (void *)v18;
            }
            else {
              uint64_t v20 = v15;
            }
            uint64_t v21 = v20;

            uint64_t v15 = v21;
          }
          [v46 addObject:v15];
          [v8 addObject:v15];
          goto LABEL_16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_16:
  unint64_t v42 = v15;

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v9;
  uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        if ((objc_msgSend(v23, "isPinned", v42, v43, v44) & 1) == 0)
        {
          v24 = [v23 sender];
          if ([v23 isFromMe])
          {
            int v25 = [v23 sender];
            uint64_t v26 = [v23 relatedPersons];
            uint64_t v27 = [(SLDHighlightPillSlotTag *)self _personOtherThanPerson:v25 inArray:v26];
            uint64_t v28 = (void *)v27;
            if (v27) {
              int v29 = (void *)v27;
            }
            else {
              int v29 = v24;
            }
            id v30 = v29;

            v24 = v30;
          }
          if ((SLPersonArrayContainsPerson(v8, v24) & 1) == 0)
          {
            [v46 addObject:v24];
            [v8 addObject:v24];
          }
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        unint64_t v31 = [v23 relatedPersons];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v51 != v34) {
                objc_enumerationMutation(v31);
              }
              id v36 = *(void **)(*((void *)&v50 + 1) + 8 * k);
              if ([v23 isFromMe])
              {
                id v37 = [v23 sender];
                char IsEqualToPerson = SLPersonIsEqualToPerson(v37, v36);

                if (IsEqualToPerson) {
                  continue;
                }
              }
              if ((SLPersonArrayContainsPerson(v8, v36) & 1) == 0) {
                [v8 addObject:v36];
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v62 count:16];
          }
          while (v33);
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v49);
  }

  self->_allSendersNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v39 = (NSArray *)[v46 copy];
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v39;

  pinnedSender = self->_pinnedSender;
  self->_pinnedSender = v42;
}

- (void)_generateSendersWithDisplayPolicyForAttributions:(id)a3 maxSendersToDisplay:(unint64_t)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"timestamp" ascending:0];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:");
  v41 = v5;
  uint64_t v7 = [v5 sortedArrayUsingDescriptors:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v11)
  {

    unint64_t v38 = 0;
    uint64_t v14 = 0;
    goto LABEL_30;
  }
  uint64_t v12 = v11;
  unint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v48;
  id obj = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(obj);
      }
      char v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      if (v14 && v13)
      {
        id v10 = obj;

LABEL_23:
        if ((SLPersonArrayContainsPerson(v8, v14) & 1) == 0)
        {
          [v8 addObject:v14];
          [v9 addObject:v14];
        }
        goto LABEL_25;
      }
      uint64_t v18 = [*(id *)(*((void *)&v47 + 1) + 8 * i) sender];

      if (v18)
      {
        if (!v14)
        {
          if (![v17 isPinned])
          {
            uint64_t v14 = 0;
            if (v13) {
              continue;
            }
            goto LABEL_13;
          }
          uint64_t v14 = [v17 sender];
        }
        if (v13) {
          continue;
        }
LABEL_13:
        if ([v17 isFromMe])
        {
          unint64_t v13 = [v17 sender];
        }
        else
        {
          unint64_t v13 = 0;
        }
        continue;
      }
    }
    id v10 = obj;
    uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v12) {
      continue;
    }
    break;
  }

  if (v14) {
    goto LABEL_23;
  }
LABEL_25:
  if (v13)
  {
    unint64_t v38 = v13;
    if ((SLPersonArrayContainsPerson(v8, v13) & 1) == 0)
    {
      [v8 addObject:v13];
      [v9 addObject:v13];
    }
  }
  else
  {
    unint64_t v38 = 0;
  }
LABEL_30:
  id v37 = v14;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v10;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v25 = objc_msgSend(v24, "sender", v37);
        if (v25)
        {
          uint64_t v26 = (void *)v25;
          char v27 = [v24 isFromMe];

          if ((v27 & 1) == 0)
          {
            uint64_t v28 = [v24 sender];
            char v29 = SLPersonArrayContainsPerson(v8, v28);

            if ((v29 & 1) == 0)
            {
              id v30 = [v24 sender];
              [v8 addObject:v30];

              if ([v9 count] < a4)
              {
                unint64_t v31 = [v24 sender];
                [v9 addObject:v31];
              }
            }
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v21);
  }

  self->_allSendersNumber = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  uint64_t v32 = (NSArray *)[v9 copy];
  sendersToDisplay = self->_sendersToDisplay;
  self->_sendersToDisplay = v32;

  pinnedSender = self->_pinnedSender;
  self->_pinnedSender = v37;
  v35 = v37;

  meSender = self->_meSender;
  self->_meSender = v38;
}

- (id)_personOtherThanPerson:(id)a3 inArray:(id)a4
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
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
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

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (NSArray)sendersToDisplay
{
  return self->_sendersToDisplay;
}

- (void)setSendersToDisplay:(id)a3
{
}

- (SLPerson)pinnedSender
{
  return self->_pinnedSender;
}

- (void)setPinnedSender:(id)a3
{
}

- (SLPerson)meSender
{
  return self->_meSender;
}

- (void)setMeSender:(id)a3
{
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (void)setGroupPhotoPath:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
}

- (NSNumber)allSendersNumber
{
  return self->_allSendersNumber;
}

- (void)setAllSendersNumber:(id)a3
{
  self->_allSendersNumber = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_meSender, 0);
  objc_storeStrong((id *)&self->_pinnedSender, 0);
  objc_storeStrong((id *)&self->_sendersToDisplay, 0);
}

@end