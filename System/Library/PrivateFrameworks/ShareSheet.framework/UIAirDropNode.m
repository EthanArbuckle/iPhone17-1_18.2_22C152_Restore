@interface UIAirDropNode
+ (BOOL)supportsSecureCoding;
+ (UIAirDropNode)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7;
+ (UIAirDropNode)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4;
+ (UIAirDropNode)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4;
+ (id)TTRAirDropNode;
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
- (void)load;
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

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 suggestionNode:(id)a4
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

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 displayName:(id)a4 subtitle:(id)a5 avatarImageSlotID:(unsigned int)a6 transportImageSlotID:(unsigned int)a7
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

+ (UIAirDropNode)nodeWithIdentifier:(id)a3 peopleSuggestion:(id)a4
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
  v3 = [MEMORY[0x1E4F9F6F0] TTRPeopleSuggestion];
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = [v3 identifier];
  id v6 = (void *)[v4 initWithUUIDString:v5];
  [(UIAirDropNode *)v2 setIdentifier:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F9F6F8]);
  uint64_t v8 = [v3 displayName];
  v9 = (void *)[v7 initWithText:v8];
  [(UIAirDropNode *)v2 setDisplayName:v9];

  [(UIAirDropNode *)v2 setPeopleSuggestion:v3];
  return v2;
}

- (BOOL)isTapToRadar
{
  v2 = [(UIAirDropNode *)self peopleSuggestion];
  char v3 = [v2 isTapToRadar];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAirDropNode)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIAirDropNode *)self init];
  if (v5)
  {
    -[UIAirDropNode setAvatarImageSlotID:](v5, "setAvatarImageSlotID:", [v4 decodeInt32ForKey:@"avatarImageSlotID"]);
    -[UIAirDropNode setTransportImageSlotID:](v5, "setTransportImageSlotID:", [v4 decodeInt32ForKey:@"transportImageSlotID"]);
    -[UIAirDropNode setMainLabelSlotID:](v5, "setMainLabelSlotID:", [v4 decodeInt32ForKey:@"mainLabelSlotID"]);
    [v4 decodeDoubleForKey:@"mainLabelSlotHeight"];
    -[UIAirDropNode setMainLabelSlotHeight:](v5, "setMainLabelSlotHeight:");
    -[UIAirDropNode setBottomLabelSlotID:](v5, "setBottomLabelSlotID:", [v4 decodeInt32ForKey:@"bottomLabelSlotID"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionNodeReason"];
    [(UIAirDropNode *)v5 setSuggestionReason:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (SFProxyText *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (SFProxyText *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v5->_isMagicHead = [v4 decodeBoolForKey:@"isMagicHead"];
    v5->_selectionReason = [v4 decodeInt64ForKey:@"selectionReason"];
    v5->_hasSquareImage = [v4 decodeBoolForKey:@"hasSquareImage"];
    v5->_isDisabled = [v4 decodeBoolForKey:@"isDisabled"];
    v5->_isRestricted = [v4 decodeBoolForKey:@"isRestricted"];
    v5->_isPlaceholder = [v4 decodeBoolForKey:@"isPlaceholder"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peopleSuggestion"];
    peopleSuggestion = v5->_peopleSuggestion;
    v5->_peopleSuggestion = (SFPeopleSuggestion *)v13;

    if ([(UIAirDropNode *)v5 mainLabelSlotID])
    {
      double v15 = [(UIAirDropNode *)v5 displayName];
      int v16 = [v15 slotIdentifier];

      if (!v16)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F9F6F8]);
        uint64_t v18 = [(UIAirDropNode *)v5 mainLabelSlotID];
        [(UIAirDropNode *)v5 mainLabelSlotHeight];
        v19 = objc_msgSend(v17, "initWithSlotIdentifier:slotTextHeight:", v18);
        [(UIAirDropNode *)v5 setDisplayName:v19];
      }
    }
    if ([(UIAirDropNode *)v5 bottomLabelSlotID])
    {
      v20 = [(UIAirDropNode *)v5 subtitle];
      int v21 = [v20 slotIdentifier];

      if (!v21)
      {
        v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F9F6F8]), "initWithSlotIdentifier:", -[UIAirDropNode bottomLabelSlotID](v5, "bottomLabelSlotID"));
        [(UIAirDropNode *)v5 setSubtitle:v22];
      }
    }
    if ([(UIAirDropNode *)v5 isRestricted])
    {
      v23 = share_sheet_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[UIAirDropNode initWithCoder:]((uint64_t)v5, v23);
      }

      id v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode avatarImageSlotID](self, "avatarImageSlotID"), @"avatarImageSlotID");
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode transportImageSlotID](self, "transportImageSlotID"), @"transportImageSlotID");
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode mainLabelSlotID](self, "mainLabelSlotID"), @"mainLabelSlotID");
  [(UIAirDropNode *)self mainLabelSlotHeight];
  objc_msgSend(v6, "encodeDouble:forKey:", @"mainLabelSlotHeight");
  objc_msgSend(v6, "encodeInt32:forKey:", -[UIAirDropNode bottomLabelSlotID](self, "bottomLabelSlotID"), @"bottomLabelSlotID");
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
  char v3 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)UIAirDropNode;
  id v4 = [(UIAirDropNode *)&v18 description];
  id v5 = [(UIAirDropNode *)self identifier];
  uint64_t v6 = [(UIAirDropNode *)self avatarImageSlotID];
  uint64_t v7 = [(UIAirDropNode *)self transportImageSlotID];
  uint64_t v8 = [(UIAirDropNode *)self mainLabelSlotID];
  [(UIAirDropNode *)self mainLabelSlotHeight];
  if (self->_isDisabled) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if (self->_isRestricted) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_isPlaceholder) {
    id v12 = @"YES";
  }
  else {
    id v12 = @"NO";
  }
  uint64_t v13 = [v3 stringWithFormat:@"<%@: identifier:%@ avatarImageSlotID:%u, transportImageSlotID:%u, textSlotID:%u, textSlotHeight:%f, peopleSuggestion:%@, isDisabled:%@, isRestricted:%@ displayName:%@ subtitle:%@ isPlaceholder:%@", v4, v5, v6, v7, v8, v9, self->_peopleSuggestion, v10, v11, self->_displayName, self->_subtitle, v12];

  if (self->_isMagicHead) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  double v15 = [v13 stringByAppendingFormat:@", isMagicHead:%@, selectionReason:%ld", v14, self->_selectionReason];

  int v16 = [v15 stringByAppendingFormat:@">"];

  return (NSString *)v16;
}

- (unint64_t)hash
{
  char v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(UIAirDropNode *)self identifier];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIAirDropNode *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
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
        char v19 = 0;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v13 = [(UIAirDropNode *)v5 identifier];
      v14 = [(UIAirDropNode *)self identifier];
      id v15 = v13;
      id v16 = v14;
      id v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          char v19 = 0;
          v27 = v16;
          id v28 = v15;
LABEL_26:

          goto LABEL_27;
        }
        int v18 = [v15 isEqual:v16];

        if (!v18)
        {
LABEL_24:
          char v19 = 0;
LABEL_27:

          goto LABEL_15;
        }
      }
      BOOL v21 = [(UIAirDropNode *)v5 isMagicHead];
      if (v21 != [(UIAirDropNode *)self isMagicHead]) {
        goto LABEL_24;
      }
      uint64_t v22 = [(UIAirDropNode *)v5 selectionReason];
      if (v22 != [(UIAirDropNode *)self selectionReason]) {
        goto LABEL_24;
      }
      BOOL v23 = [(UIAirDropNode *)v5 hasSquareImage];
      if (v23 != [(UIAirDropNode *)self hasSquareImage]) {
        goto LABEL_24;
      }
      BOOL v24 = [(UIAirDropNode *)v5 isDisabled];
      if (v24 != [(UIAirDropNode *)self isDisabled]) {
        goto LABEL_24;
      }
      BOOL v25 = [(UIAirDropNode *)v5 isRestricted];
      if (v25 != [(UIAirDropNode *)self isRestricted]) {
        goto LABEL_24;
      }
      BOOL v26 = [(UIAirDropNode *)v5 isPlaceholder];
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
          char v19 = 0;
          id v36 = v28;
          goto LABEL_47;
        }
        int v33 = [v28 isEqual:v31];

        if (!v33)
        {
          char v19 = 0;
LABEL_48:
          v27 = v44;
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
          char v19 = 0;
          v43 = v37;
          id v41 = v36;
LABEL_46:

          goto LABEL_47;
        }
        int v38 = [v36 isEqual:v37];

        if (!v38)
        {
          char v19 = 0;
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
        char v19 = 1;
      }
      else if ((v41 == 0) == (v42 != 0))
      {
        char v19 = 0;
      }
      else
      {
        char v19 = [v41 isEqual:v42];
      }

      goto LABEL_46;
    }
    char v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)load
{
  char v3 = [(UIAirDropNode *)self loadHandler];
  if (v3)
  {
    [(UIAirDropNode *)self setLoadHandler:0];
    id v4 = [(UIAirDropNode *)self peopleSuggestion];

    if (v4
      || ([(UIAirDropNode *)self suggestionNode],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 loadIcon],
          v5,
          v6))
    {
      char v7 = ((uint64_t (**)(void, UIAirDropNode *))v3)[2](v3, self);
    }
    else
    {
      double v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(UIAirDropNode *)self load];
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

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_FAULT, "UIAirDropNode:%@ is restricted.", (uint8_t *)&v2, 0xCu);
}

- (void)load
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 suggestionNode];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Failed to load icon for suggestionNode:%@", (uint8_t *)&v4, 0xCu);
}

@end