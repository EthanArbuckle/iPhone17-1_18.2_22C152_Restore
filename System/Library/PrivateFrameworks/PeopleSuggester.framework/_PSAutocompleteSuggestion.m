@interface _PSAutocompleteSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)chatHandles;
- (NSArray)recipients;
- (NSString)chatGuid;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)handle;
- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9;
- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9 recipients:(id)a10;
- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 displayName:(id)a4 handle:(id)a5 contactIdentifier:(id)a6 resultSourceType:(unint64_t)a7 autocompleteResult:(id)a8;
- (_PSAutocompleteSuggestion)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)resultSourceType;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setResultSourceType:(unint64_t)a3;
@end

@implementation _PSAutocompleteSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 displayName:(id)a4 handle:(id)a5 contactIdentifier:(id)a6 resultSourceType:(unint64_t)a7 autocompleteResult:(id)a8
{
  return [(_PSAutocompleteSuggestion *)self initWithChatGuid:a3 chatHandles:0 displayName:a4 handle:a5 contactIdentifier:a6 resultSourceType:a7 autocompleteResult:a8 recipients:0];
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9
{
  return [(_PSAutocompleteSuggestion *)self initWithChatGuid:a3 chatHandles:a4 displayName:a5 handle:a6 contactIdentifier:a7 resultSourceType:a8 autocompleteResult:a9 recipients:0];
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9 recipients:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)_PSAutocompleteSuggestion;
  v22 = [(_PSAutocompleteSuggestion *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    chatGuid = v22->_chatGuid;
    v22->_chatGuid = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    chatHandles = v22->_chatHandles;
    v22->_chatHandles = (NSArray *)v25;

    uint64_t v27 = [v18 copy];
    displayName = v22->_displayName;
    v22->_displayName = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    handle = v22->_handle;
    v22->_handle = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    contactIdentifier = v22->_contactIdentifier;
    v22->_contactIdentifier = (NSString *)v31;

    v22->_resultSourceType = a8;
    uint64_t v33 = [v21 copy];
    recipients = v22->_recipients;
    v22->_recipients = (NSArray *)v33;
  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  id v5 = v4;
  uint64_t v6 = [(_PSAutocompleteSuggestion *)self chatGuid];
  if (!v6)
  {
LABEL_7:
    v13 = [v5 handle];
    v14 = [(_PSAutocompleteSuggestion *)self handle];
    char v15 = [v13 isEqualToString:v14];

    if (v15) {
      goto LABEL_8;
    }
LABEL_9:
    BOOL v16 = 0;
    goto LABEL_10;
  }
  v7 = (void *)v6;
  uint64_t v8 = [v5 chatGuid];
  if (!v8)
  {

    goto LABEL_7;
  }
  v9 = (void *)v8;
  v10 = [v5 chatGuid];
  v11 = [(_PSAutocompleteSuggestion *)self chatGuid];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0) {
    goto LABEL_7;
  }

LABEL_8:
  BOOL v16 = 1;
LABEL_10:

  return v16;
}

- (unint64_t)hash
{
  v3 = [(_PSAutocompleteSuggestion *)self chatGuid];
  if (v3) {
    [(_PSAutocompleteSuggestion *)self chatGuid];
  }
  else {
  id v4 = [(_PSAutocompleteSuggestion *)self handle];
  }
  unint64_t v5 = [v4 hash];

  return v5;
}

- (_PSAutocompleteSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_PSAutocompleteSuggestion;
  unint64_t v5 = [(_PSAutocompleteSuggestion *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chatGuid"];
    chatGuid = v5->_chatGuid;
    v5->_chatGuid = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    char v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"chatHandles"];
    chatHandles = v5->_chatHandles;
    v5->_chatHandles = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v17;

    v5->_resultSourceType = [v4 decodeIntegerForKey:@"resultSourceType"];
    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"handle"];
  [v5 encodeObject:self->_chatGuid forKey:@"chatGuid"];
  [v5 encodeObject:self->_chatHandles forKey:@"chatHandles"];
  [v5 encodeInteger:self->_resultSourceType forKey:@"resultSourceType"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_PSAutocompleteSuggestion *)self chatGuid];
  uint64_t v6 = [(_PSAutocompleteSuggestion *)self chatHandles];
  v7 = [(_PSAutocompleteSuggestion *)self handle];
  uint64_t v8 = [(_PSAutocompleteSuggestion *)self displayName];
  v9 = [(_PSAutocompleteSuggestion *)self contactIdentifier];
  v10 = [v3 stringWithFormat:@"<%@ %p> chatGuid: %@, chatHandles: %@, handle: %@, displayName: %@, contactIdentifier: %@", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)chatGuid
{
  return self->_chatGuid;
}

- (NSArray)chatHandles
{
  return self->_chatHandles;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)resultSourceType
{
  return self->_resultSourceType;
}

- (void)setResultSourceType:(unint64_t)a3
{
  self->_resultSourceType = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_chatHandles, 0);

  objc_storeStrong((id *)&self->_chatGuid, 0);
}

@end