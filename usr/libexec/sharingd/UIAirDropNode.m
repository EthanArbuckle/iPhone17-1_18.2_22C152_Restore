@interface UIAirDropNode
+ (BOOL)supportsSecureCoding;
+ (id)TTRAirDropNode;
+ (id)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7;
+ (id)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4;
+ (id)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4;
- (BOOL)hasSquareImage;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagicHead;
- (BOOL)isPlaceholder;
- (BOOL)isRestricted;
- (BOOL)isTapToRadar;
- (BOOL)load;
- (NSString)description;
- (NSString)suggestionReason;
- (NSUUID)identifier;
- (SDSuggestionNode)suggestionNode;
- (SFPeopleSuggestion)peopleSuggestion;
- (SFProxyText)displayName;
- (SFProxyText)subtitle;
- (UIAirDropNode)initWithCoder:(id)a3;
- (double)mainLabelSlotHeight;
- (id)loadHandler;
- (int64_t)selectionReason;
- (unint64_t)hash;
- (unsigned)avatarImageSlotID;
- (unsigned)bottomLabelSlotID;
- (unsigned)mainLabelSlotID;
- (unsigned)transportImageSlotID;
- (void)encodeWithCoder:(id)a3;
- (void)setAvatarImageSlotID:(unsigned int)a3;
- (void)setBottomLabelSlotID:(unsigned int)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasSquareImage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setIsMagicHead:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setIsRestricted:(BOOL)a3;
- (void)setLoadHandler:(id)a3;
- (void)setMainLabelSlotHeight:(double)a3;
- (void)setMainLabelSlotID:(unsigned int)a3;
- (void)setPeopleSuggestion:(id)a3;
- (void)setSelectionReason:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuggestionNode:(id)a3;
- (void)setSuggestionReason:(id)a3;
- (void)setTransportImageSlotID:(unsigned int)a3;
@end

@implementation UIAirDropNode

+ (id)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(UIAirDropNode);
  [(UIAirDropNode *)v7 setIdentifier:v6];

  [(UIAirDropNode *)v7 setSuggestionNode:v5];
  v8 = [v5 suggestion];

  -[UIAirDropNode setIsPlaceholder:](v7, "setIsPlaceholder:", [v8 isPlaceholder]);

  return v7;
}

+ (id)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_alloc_init(UIAirDropNode);
  [(UIAirDropNode *)v14 setIdentifier:v13];

  [(UIAirDropNode *)v14 setDisplayName:v12];
  [(UIAirDropNode *)v14 setSubtitle:v11];

  [(UIAirDropNode *)v14 setAvatarImageSlotID:v8];
  [(UIAirDropNode *)v14 setTransportImageSlotID:v7];
  -[UIAirDropNode setMainLabelSlotID:](v14, "setMainLabelSlotID:", [v12 slotIdentifier]);
  [v12 slotTextHeight];
  double v16 = v15;

  [(UIAirDropNode *)v14 setMainLabelSlotHeight:v16];

  return v14;
}

+ (id)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(UIAirDropNode);
  [(UIAirDropNode *)v7 setIdentifier:v6];

  [(UIAirDropNode *)v7 setPeopleSuggestion:v5];

  return v7;
}

+ (id)TTRAirDropNode
{
  v2 = objc_alloc_init(UIAirDropNode);
  v3 = +[SFPeopleSuggestion TTRPeopleSuggestion];
  id v4 = objc_alloc((Class)NSUUID);
  id v5 = [v3 identifier];
  id v6 = [v4 initWithUUIDString:v5];
  [(UIAirDropNode *)v2 setIdentifier:v6];

  id v7 = objc_alloc((Class)SFProxyText);
  uint64_t v8 = [v3 displayName];
  id v9 = [v7 initWithText:v8];
  [(UIAirDropNode *)v2 setDisplayName:v9];

  [(UIAirDropNode *)v2 setPeopleSuggestion:v3];

  return v2;
}

- (BOOL)isTapToRadar
{
  v2 = [(UIAirDropNode *)self peopleSuggestion];
  unsigned __int8 v3 = [v2 isTapToRadar];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAirDropNode)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [(UIAirDropNode *)self init];
  if (v6)
  {
    -[UIAirDropNode setAvatarImageSlotID:](v6, "setAvatarImageSlotID:", [v5 decodeInt32ForKey:@"avatarImageSlotID"]);
    -[UIAirDropNode setTransportImageSlotID:](v6, "setTransportImageSlotID:", [v5 decodeInt32ForKey:@"transportImageSlotID"]);
    -[UIAirDropNode setMainLabelSlotID:](v6, "setMainLabelSlotID:", [v5 decodeInt32ForKey:@"mainLabelSlotID"]);
    [v5 decodeDoubleForKey:@"mainLabelSlotHeight"];
    -[UIAirDropNode setMainLabelSlotHeight:](v6, "setMainLabelSlotHeight:");
    -[UIAirDropNode setBottomLabelSlotID:](v6, "setBottomLabelSlotID:", [v5 decodeInt32ForKey:@"bottomLabelSlotID"]);
    id v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionNodeReason"];
    [(UIAirDropNode *)v6 setSuggestionReason:v7];

    uint64_t v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v6->_displayName;
    v6->_displayName = (SFProxyText *)v8;

    uint64_t v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v6->_subtitle;
    v6->_subtitle = (SFProxyText *)v10;

    uint64_t v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v12;

    v6->_isMagicHead = [v5 decodeBoolForKey:@"isMagicHead"];
    v6->_selectionReason = (int64_t)[v5 decodeInt64ForKey:@"selectionReason"];
    v6->_hasSquareImage = [v5 decodeBoolForKey:@"hasSquareImage"];
    v6->_isDisabled = [v5 decodeBoolForKey:@"isDisabled"];
    v6->_isRestricted = [v5 decodeBoolForKey:@"isRestricted"];
    v6->_isPlaceholder = [v5 decodeBoolForKey:@"isPlaceholder"];
    uint64_t v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"peopleSuggestion"];
    peopleSuggestion = v6->_peopleSuggestion;
    v6->_peopleSuggestion = (SFPeopleSuggestion *)v14;

    if ([(UIAirDropNode *)v6 mainLabelSlotID])
    {
      double v16 = [(UIAirDropNode *)v6 displayName];
      unsigned int v17 = [v16 slotIdentifier];

      if (!v17)
      {
        v18 = [(UIAirDropNode *)v6 displayName];
        v19 = [v18 text];

        if (v19)
        {
          v30 = +[NSAssertionHandler currentHandler];
          [v30 handleFailureInMethod:a2 object:v6 file:@"UIAirDropNode.m" lineNumber:117 description:@"using slot and text at the same time for displayName."];
        }
        id v20 = objc_alloc((Class)SFProxyText);
        id v21 = (id)[(UIAirDropNode *)v6 mainLabelSlotID];
        [(UIAirDropNode *)v6 mainLabelSlotHeight];
        id v22 = [v20 initWithSlotIdentifier:v21];
        [(UIAirDropNode *)v6 setDisplayName:v22];
      }
    }
    if ([(UIAirDropNode *)v6 bottomLabelSlotID])
    {
      v23 = [(UIAirDropNode *)v6 subtitle];
      unsigned int v24 = [v23 slotIdentifier];

      if (!v24)
      {
        v25 = [(UIAirDropNode *)v6 subtitle];
        v26 = [v25 text];

        if (v26)
        {
          v31 = +[NSAssertionHandler currentHandler];
          [v31 handleFailureInMethod:a2 object:v6 file:@"UIAirDropNode.m" lineNumber:121 description:@"using slot and text at the same time for subtitle."];
        }
        id v27 = [objc_alloc((Class)SFProxyText) initWithSlotIdentifier:-[UIAirDropNode bottomLabelSlotID](v6, "bottomLabelSlotID")];
        [(UIAirDropNode *)v6 setSubtitle:v27];
      }
    }
    if ([(UIAirDropNode *)v6 isRestricted])
    {
      v28 = share_sheet_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        sub_1000F2B9C((uint64_t)v6, v28);
      }

      id v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInt32:-[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID") forKey:@"avatarImageSlotID"];
  [v6 encodeInt32:-[UIAirDropNode transportImageSlotID](self, "transportImageSlotID") forKey:@"transportImageSlotID"];
  [v6 encodeInt32:-[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID") forKey:@"mainLabelSlotID"];
  [(UIAirDropNode *)self mainLabelSlotHeight];
  [v6 encodeDouble:@"mainLabelSlotHeight" forKey:@"mainLabelSlotHeight"];
  [v6 encodeInt32:-[UIAirDropNode bottomLabelSlotID](self, "bottomLabelSlotID") forKey:@"bottomLabelSlotID"];
  id v4 = [(UIAirDropNode *)self suggestionNode];
  id v5 = [v4 suggestionReason];
  [v6 encodeObject:v5 forKey:@"suggestionNodeReason"];

  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeBool:self->_isMagicHead forKey:@"isMagicHead"];
  [v6 encodeInt64:self->_selectionReason forKey:@"selectionReason"];
  [v6 encodeBool:self->_hasSquareImage forKey:@"hasSquareImage"];
  [v6 encodeBool:self->_isDisabled forKey:@"isDisabled"];
  [v6 encodeBool:self->_isRestricted forKey:@"isRestricted"];
  [v6 encodeBool:self->_isPlaceholder forKey:@"isPlaceholder"];
  [v6 encodeObject:self->_peopleSuggestion forKey:@"peopleSuggestion"];
}

- (void)setAvatarImageSlotID:(unsigned int)a3
{
}

- (unsigned)avatarImageSlotID
{
  return atomic_load(&self->_avatarImageSlotID);
}

- (void)setTransportImageSlotID:(unsigned int)a3
{
}

- (unsigned)transportImageSlotID
{
  return atomic_load(&self->_transportImageSlotID);
}

- (void)setMainLabelSlotID:(unsigned int)a3
{
}

- (unsigned)mainLabelSlotID
{
  return atomic_load(&self->_mainLabelSlotID);
}

- (void)setMainLabelSlotHeight:(double)a3
{
}

- (double)mainLabelSlotHeight
{
  return COERCE_DOUBLE(atomic_load((unint64_t *)&self->_mainLabelSlotHeight));
}

- (void)setBottomLabelSlotID:(unsigned int)a3
{
}

- (unsigned)bottomLabelSlotID
{
  return atomic_load(&self->_bottomLabelSlotID);
}

- (NSString)description
{
  v17.receiver = self;
  v17.super_class = (Class)UIAirDropNode;
  unsigned __int8 v3 = [(UIAirDropNode *)&v17 description];
  id v4 = [(UIAirDropNode *)self identifier];
  uint64_t v5 = [(UIAirDropNode *)self avatarImageSlotID];
  uint64_t v6 = [(UIAirDropNode *)self transportImageSlotID];
  uint64_t v7 = [(UIAirDropNode *)self mainLabelSlotID];
  [(UIAirDropNode *)self mainLabelSlotHeight];
  if (self->_isDisabled) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if (self->_isRestricted) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if (self->_isPlaceholder) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  uint64_t v12 = +[NSString stringWithFormat:@"<%@: identifier:%@ avatarImageSlotID:%u, transportImageSlotID:%u, textSlotID:%u, textSlotHeight:%f, peopleSuggestion:%@, isDisabled:%@, isRestricted:%@ displayName:%@ subtitle:%@ isPlaceholder:%@", v3, v4, v5, v6, v7, v8, self->_peopleSuggestion, v9, v10, self->_displayName, self->_subtitle, v11];

  if (self->_isMagicHead) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  uint64_t v14 = [v12 stringByAppendingFormat:@", isMagicHead:%@, selectionReason:%ld", v13, self->_selectionReason];

  double v15 = [v14 stringByAppendingFormat:@">"];

  return (NSString *)v15;
}

- (unint64_t)hash
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = (unint64_t)[v4 hash];

  uint64_t v6 = [(UIAirDropNode *)self identifier];
  unint64_t v7 = (unint64_t)[v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIAirDropNode *)a3;
  if (self == v4)
  {
    unsigned __int8 v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      unsigned int v6 = [(UIAirDropNode *)v5 avatarImageSlotID];
      if (v6 != [(UIAirDropNode *)self avatarImageSlotID]
        || (unsigned int v7 = [(UIAirDropNode *)v5 mainLabelSlotID],
            v7 != [(UIAirDropNode *)self mainLabelSlotID])
        || ([(UIAirDropNode *)v5 mainLabelSlotHeight],
            double v9 = v8,
            [(UIAirDropNode *)self mainLabelSlotHeight],
            v9 != v10)
        || (unsigned int v11 = [(UIAirDropNode *)v5 bottomLabelSlotID],
            v11 != [(UIAirDropNode *)self bottomLabelSlotID])
        || (unsigned int v12 = [(UIAirDropNode *)v5 transportImageSlotID],
            v12 != [(UIAirDropNode *)self transportImageSlotID]))
      {
        unsigned __int8 v19 = 0;
LABEL_15:

        goto LABEL_16;
      }
      CFStringRef v13 = [(UIAirDropNode *)v5 identifier];
      uint64_t v14 = [(UIAirDropNode *)self identifier];
      id v15 = v13;
      id v16 = v14;
      objc_super v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          unsigned __int8 v19 = 0;
          id v27 = v16;
          id v28 = v15;
LABEL_26:

          goto LABEL_27;
        }
        unsigned int v18 = [v15 isEqual:v16];

        if (!v18)
        {
LABEL_24:
          unsigned __int8 v19 = 0;
LABEL_27:

          goto LABEL_15;
        }
      }
      unsigned int v21 = [(UIAirDropNode *)v5 isMagicHead];
      if (v21 != [(UIAirDropNode *)self isMagicHead]) {
        goto LABEL_24;
      }
      id v22 = [(UIAirDropNode *)v5 selectionReason];
      if (v22 != (id)[(UIAirDropNode *)self selectionReason]) {
        goto LABEL_24;
      }
      unsigned int v23 = [(UIAirDropNode *)v5 hasSquareImage];
      if (v23 != [(UIAirDropNode *)self hasSquareImage]) {
        goto LABEL_24;
      }
      unsigned int v24 = [(UIAirDropNode *)v5 isDisabled];
      if (v24 != [(UIAirDropNode *)self isDisabled]) {
        goto LABEL_24;
      }
      unsigned int v25 = [(UIAirDropNode *)v5 isRestricted];
      if (v25 != [(UIAirDropNode *)self isRestricted]) {
        goto LABEL_24;
      }
      unsigned int v26 = [(UIAirDropNode *)v5 isPlaceholder];
      if (v26 != [(UIAirDropNode *)self isPlaceholder]) {
        goto LABEL_24;
      }
      v29 = [(UIAirDropNode *)v5 peopleSuggestion];
      v30 = [(UIAirDropNode *)self peopleSuggestion];
      id v28 = v29;
      id v31 = v30;
      id v44 = v31;
      if (v28 == v31)
      {
      }
      else
      {
        v32 = v31;
        if ((v28 == 0) == (v31 != 0))
        {
          unsigned __int8 v19 = 0;
          id v36 = v28;
          goto LABEL_47;
        }
        unsigned int v33 = [v28 isEqual:v31];

        if (!v33)
        {
          unsigned __int8 v19 = 0;
LABEL_48:
          id v27 = v44;
          goto LABEL_26;
        }
      }
      v34 = [(UIAirDropNode *)v5 displayName];
      v35 = [(UIAirDropNode *)self displayName];
      id v36 = v34;
      id v37 = v35;
      v32 = v37;
      if (v36 == v37)
      {
      }
      else
      {
        if ((v36 == 0) == (v37 != 0))
        {
          unsigned __int8 v19 = 0;
          v43 = v37;
          id v41 = v36;
LABEL_46:

          goto LABEL_47;
        }
        unsigned int v38 = [v36 isEqual:v37];

        if (!v38)
        {
          unsigned __int8 v19 = 0;
LABEL_47:

          goto LABEL_48;
        }
      }
      v39 = [(UIAirDropNode *)v5 subtitle];
      v40 = [(UIAirDropNode *)self subtitle];
      id v41 = v39;
      id v42 = v40;
      v43 = v42;
      if (v41 == v42)
      {
        unsigned __int8 v19 = 1;
      }
      else if ((v41 == 0) == (v42 != 0))
      {
        unsigned __int8 v19 = 0;
      }
      else
      {
        unsigned __int8 v19 = [v41 isEqual:v42];
      }

      goto LABEL_46;
    }
    unsigned __int8 v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)load
{
  unsigned __int8 v3 = [(UIAirDropNode *)self loadHandler];
  if (v3)
  {
    [(UIAirDropNode *)self setLoadHandler:0];
    id v4 = [(UIAirDropNode *)self peopleSuggestion];

    if (v4
      || ([(UIAirDropNode *)self suggestionNode],
          unint64_t v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 loadIcon],
          v5,
          v6))
    {
      char v7 = ((uint64_t (**)(void, UIAirDropNode *))v3)[2](v3, self);
    }
    else
    {
      double v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F2C14(self, v8);
      }

      char v7 = 0;
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (SDSuggestionNode)suggestionNode
{
  return self->_suggestionNode;
}

- (void)setSuggestionNode:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SFPeopleSuggestion)peopleSuggestion
{
  return self->_peopleSuggestion;
}

- (void)setPeopleSuggestion:(id)a3
{
}

- (SFProxyText)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (SFProxyText)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (void)setSuggestionReason:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isMagicHead
{
  return self->_isMagicHead;
}

- (void)setIsMagicHead:(BOOL)a3
{
  self->_isMagicHead = a3;
}

- (int64_t)selectionReason
{
  return self->_selectionReason;
}

- (void)setSelectionReason:(int64_t)a3
{
  self->_selectionReason = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
}

- (BOOL)hasSquareImage
{
  return self->_hasSquareImage;
}

- (void)setHasSquareImage:(BOOL)a3
{
  self->_hasSquareImage = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_suggestionNode, 0);
}

@end