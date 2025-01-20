@interface SFPeopleSuggestionProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)disabled;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)load;
- (NSString)description;
- (NSUUID)identifier;
- (SDSuggestionNode)suggestionNode;
- (SFPeopleSuggestion)peopleSuggestion;
- (SFPeopleSuggestionProxy)initWithCoder:(id)a3;
- (SFPeopleSuggestionProxy)initWithPeopleSuggestion:(id)a3;
- (SFPeopleSuggestionProxy)initWithSuggestionNode:(id)a3;
- (SFProxyText)displayName;
- (SFProxyText)subtitle;
- (id)loadHandler;
- (unint64_t)hash;
- (unsigned)avatarImageSlotID;
- (unsigned)transportImageSlotID;
- (void)encodeWithCoder:(id)a3;
- (void)load;
- (void)setAvatarImageSlotID:(unsigned int)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setLoadHandler:(id)a3;
- (void)setPeopleSuggestion:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuggestionNode:(id)a3;
- (void)setTransportImageSlotID:(unsigned int)a3;
@end

@implementation SFPeopleSuggestionProxy

- (SFPeopleSuggestionProxy)initWithPeopleSuggestion:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  v6 = [(SFPeopleSuggestionProxy *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peopleSuggestion, a3);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [SFProxyText alloc];
    v11 = [v5 displayName];
    uint64_t v12 = [(SFProxyText *)v10 initWithText:v11];
    displayName = v7->_displayName;
    v7->_displayName = (SFProxyText *)v12;

    v7->_disabled = 0;
  }

  return v7;
}

- (SFPeopleSuggestionProxy)initWithSuggestionNode:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  v6 = [(SFPeopleSuggestionProxy *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionNode, a3);
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [SFProxyText alloc];
    v11 = [v5 displayName];
    uint64_t v12 = [(SFProxyText *)v10 initWithText:v11];
    displayName = v7->_displayName;
    v7->_displayName = (SFProxyText *)v12;

    v7->_disabled = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggestionProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SFPeopleSuggestionProxy *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (SFProxyText *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (SFProxyText *)v10;

    -[SFPeopleSuggestionProxy setAvatarImageSlotID:](v5, "setAvatarImageSlotID:", [v4 decodeInt32ForKey:@"avatarImageSlotID"]);
    -[SFPeopleSuggestionProxy setTransportImageSlotID:](v5, "setTransportImageSlotID:", [v4 decodeInt32ForKey:@"transportImageSlotID"]);
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peopleSuggestion"];
    peopleSuggestion = v5->_peopleSuggestion;
    v5->_peopleSuggestion = (SFPeopleSuggestion *)v12;

    v5->_disabled = [v4 decodeBoolForKey:@"disabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_subtitle forKey:@"subtitle"];
  objc_msgSend(v5, "encodeInt32:forKey:", -[SFPeopleSuggestionProxy avatarImageSlotID](self, "avatarImageSlotID"), @"avatarImageSlotID");
  objc_msgSend(v5, "encodeInt32:forKey:", -[SFPeopleSuggestionProxy transportImageSlotID](self, "transportImageSlotID"), @"transportImageSlotID");
  [v5 encodeObject:self->_peopleSuggestion forKey:@"peopleSuggestion"];
  [v5 encodeBool:self->_disabled forKey:@"disabled"];
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

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)description
{
  v14 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)SFPeopleSuggestionProxy;
  v3 = [(SFPeopleSuggestionProxy *)&v15 description];
  id v4 = [(SFPeopleSuggestionProxy *)self identifier];
  id v5 = [(SFPeopleSuggestionProxy *)self displayName];
  uint64_t v6 = [(SFPeopleSuggestionProxy *)self subtitle];
  uint64_t v7 = [(SFPeopleSuggestionProxy *)self avatarImageSlotID];
  uint64_t v8 = [(SFPeopleSuggestionProxy *)self transportImageSlotID];
  if ([(SFPeopleSuggestionProxy *)self isDisabled]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  uint64_t v10 = [(SFPeopleSuggestionProxy *)self peopleSuggestion];
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  uint64_t v12 = [v14 stringWithFormat:@"<%@: identifier:%@, displayName:%@, subtitle:%@, avatarImageSlotID:%u, transportImageSlotID:%u, disabled:%@ peopleSuggestion:%@>", v3, v4, v5, v6, v7, v8, v9, v11];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(SFPeopleSuggestionProxy *)self identifier];
  uint64_t v7 = [v6 hash];

  uint64_t v8 = [(SFPeopleSuggestionProxy *)self displayName];
  unint64_t v9 = v7 ^ [v8 hash] ^ v5;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 identifier];
    uint64_t v6 = [(SFPeopleSuggestionProxy *)self identifier];
    id v7 = v5;
    id v8 = v6;
    unint64_t v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
        v13 = v8;
        uint64_t v12 = v7;
LABEL_17:

        goto LABEL_18;
      }
      int v10 = [v7 isEqual:v8];

      if (!v10)
      {
        LOBYTE(v11) = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    uint64_t v12 = [v4 displayName];
    v13 = [(SFPeopleSuggestionProxy *)self displayName];
    if ([v12 isEqual:v13])
    {
      v14 = [v4 subtitle];
      objc_super v15 = [(SFPeopleSuggestionProxy *)self subtitle];
      if ([v14 isEqual:v15]
        && (int v16 = [v4 avatarImageSlotID],
            v16 == [(SFPeopleSuggestionProxy *)self avatarImageSlotID])
        && (int v17 = [v4 transportImageSlotID],
            v17 == [(SFPeopleSuggestionProxy *)self transportImageSlotID]))
      {
        int v18 = [v4 isDisabled];
        int v11 = v18 ^ [(SFPeopleSuggestionProxy *)self isDisabled] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
    goto LABEL_17;
  }
  LOBYTE(v11) = 0;
LABEL_19:

  return v11;
}

- (BOOL)load
{
  v3 = [(SFPeopleSuggestionProxy *)self loadHandler];
  if (v3)
  {
    [(SFPeopleSuggestionProxy *)self setLoadHandler:0];
    id v4 = [(SFPeopleSuggestionProxy *)self suggestionNode];
    int v5 = [v4 loadIcon];

    if (v5)
    {
      char v6 = ((uint64_t (**)(void, SFPeopleSuggestionProxy *))v3)[2](v3, self);
    }
    else
    {
      id v7 = share_sheet_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(SFPeopleSuggestionProxy *)self load];
      }

      char v6 = 0;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (SDSuggestionNode)suggestionNode
{
  return self->_suggestionNode;
}

- (void)setSuggestionNode:(id)a3
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

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (id)loadHandler
{
  return self->_loadHandler;
}

- (void)setLoadHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadHandler, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_peopleSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestionNode, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)load
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 suggestionNode];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Failed to load icon for suggestionNode:%@", (uint8_t *)&v4, 0xCu);
}

@end