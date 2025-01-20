@interface SDSuggestionNode
- (BOOL)hasGroupImage;
- (BOOL)isGroup;
- (BOOL)isIntentsBased;
- (BOOL)loadIcon;
- (CGImage)icon;
- (NSArray)actualHandles;
- (NSArray)contactIDs;
- (NSArray)formattedHandles;
- (NSData)iconData;
- (NSString)bundleID;
- (NSString)derivedIntentIdentifier;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)suggestionReason;
- (SDSuggestion)suggestion;
- (SDSuggestionNode)initWithSuggestion:(id)a3;
- (id)description;
- (id)loadIconHandler;
- (int64_t)iconIndex;
- (void)dealloc;
- (void)setIcon:(CGImage *)a3;
- (void)setIconData:(id)a3;
- (void)setIconIndex:(int64_t)a3;
- (void)setLoadIconHandler:(id)a3;
@end

@implementation SDSuggestionNode

- (SDSuggestionNode)initWithSuggestion:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SDSuggestionNode;
  v6 = [(SDSuggestionNode *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestion, a3);
    uint64_t v8 = [v5 transportBundleIdentifier];
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    uint64_t v10 = [v5 displayName];
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v10;

    uint64_t v12 = [v5 formattedHandles];
    formattedHandles = v7->_formattedHandles;
    v7->_formattedHandles = (NSArray *)v12;

    uint64_t v14 = [v5 handles];
    actualHandles = v7->_actualHandles;
    v7->_actualHandles = (NSArray *)v14;

    v16 = [v5 conversationIdentifier];
    v17 = v16;
    if (v16)
    {
      v18 = v16;
      identifier = v7->_identifier;
      v7->_identifier = v18;
    }
    else
    {
      identifier = +[NSUUID UUID];
      v20 = [identifier UUIDString];
      v21 = [v20 substringWithRange:24, 12];
      uint64_t v22 = [v21 lowercaseString];
      v23 = v7->_identifier;
      v7->_identifier = (NSString *)v22;
    }
    uint64_t v24 = [v5 reason];
    suggestionReason = v7->_suggestionReason;
    v7->_suggestionReason = (NSString *)v24;

    v26 = [v5 recipients];
    v7->_hasGroupImage = (unint64_t)[v26 count] > 1;

    uint64_t v27 = [v5 contactsIdentifiers];
    contactIDs = v7->_contactIDs;
    v7->_contactIDs = (NSArray *)v27;

    uint64_t v29 = [v5 derivedIntentIdentifier];
    derivedIntentIdentifier = v7->_derivedIntentIdentifier;
    v7->_derivedIntentIdentifier = (NSString *)v29;

    v7->_iconIndex = -1;
  }

  return v7;
}

- (void)dealloc
{
  icon = self->_icon;
  if (icon) {
    CFRelease(icon);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDSuggestionNode;
  [(SDSuggestionNode *)&v4 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SDSuggestionNode;
  v3 = [(SDSuggestionNode *)&v6 description];
  objc_super v4 = +[NSString stringWithFormat:@"%@ bundleID:%@, displayName:%@, handles:%@, contactsIDs:%@, identifier:%@, suggestionreason:%@, iconIndex:%ld", v3, self->_bundleID, self->_displayName, self->_formattedHandles, self->_contactIDs, self->_identifier, self->_suggestionReason, self->_iconIndex];

  return v4;
}

- (BOOL)isGroup
{
  return [(NSArray *)self->_formattedHandles count] > 1;
}

- (BOOL)isIntentsBased
{
  v3 = self->_bundleID;
  objc_super v4 = v3;
  if (v3 == @"com.apple.MobileSMS")
  {
    unsigned __int8 v5 = 1;
  }
  else if (v3)
  {
    unsigned __int8 v5 = [(__CFString *)v3 isEqual:@"com.apple.MobileSMS"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  objc_super v6 = self->_bundleID;
  v7 = v6;
  if (v6 == @"com.apple.mobilemail")
  {
    unsigned __int8 v8 = 1;
  }
  else if (v6)
  {
    unsigned __int8 v8 = [(__CFString *)v6 isEqual:@"com.apple.mobilemail"];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return (v5 | v8) ^ 1;
}

- (void)setIcon:(CGImage *)a3
{
  icon = self->_icon;
  if (icon != a3)
  {
    if (icon) {
      CFRelease(icon);
    }
    self->_icon = (CGImage *)CFRetain(a3);
  }
}

- (BOOL)loadIcon
{
  if ([(SDSuggestionNode *)self icon]) {
    return 1;
  }
  v3 = [(SDSuggestionNode *)self iconData];

  if (v3) {
    return 1;
  }
  objc_super v6 = [(SDSuggestionNode *)self loadIconHandler];
  [(SDSuggestionNode *)self setLoadIconHandler:0];
  if (v6)
  {
    id v9 = 0;
    uint64_t v10 = 0;
    ((void (**)(void, SDSuggestionNode *, uint64_t *, id *))v6)[2](v6, self, &v10, &v9);
    v7 = v9;
    [(SDSuggestionNode *)self setIcon:v10];
    [(SDSuggestionNode *)self setIconData:v7];
  }
  else
  {
    v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100238FBC((uint64_t)self, v7);
    }
  }

  if ([(SDSuggestionNode *)self icon])
  {
    BOOL v4 = 1;
  }
  else
  {
    unsigned __int8 v8 = [(SDSuggestionNode *)self iconData];
    BOOL v4 = v8 != 0;
  }
  return v4;
}

- (SDSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)formattedHandles
{
  return self->_formattedHandles;
}

- (NSArray)actualHandles
{
  return self->_actualHandles;
}

- (NSString)suggestionReason
{
  return self->_suggestionReason;
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (BOOL)hasGroupImage
{
  return self->_hasGroupImage;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (CGImage)icon
{
  return self->_icon;
}

- (int64_t)iconIndex
{
  return self->_iconIndex;
}

- (void)setIconIndex:(int64_t)a3
{
  self->_iconIndex = a3;
}

- (id)loadIconHandler
{
  return self->_loadIconHandler;
}

- (void)setLoadIconHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadIconHandler, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_suggestionReason, 0);
  objc_storeStrong((id *)&self->_actualHandles, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end