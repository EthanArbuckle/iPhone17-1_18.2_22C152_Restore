@interface SFRemoteTextSessionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)secureTextEntry;
- (NSDictionary)rtiPayload;
- (NSString)identifier;
- (NSString)prompt;
- (NSString)text;
- (NSString)title;
- (SFRemoteTextSessionInfo)initWithCoder:(id)a3;
- (SFRemoteTextSessionInfo)initWithDictionary:(id)a3;
- (SFRemoteTextSessionInfo)initWithRTIPayload:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPrompt:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setRtiPayload:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFRemoteTextSessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteTextSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = [(SFRemoteTextSessionInfo *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    if ([v7 containsValueForKey:@"keyboardType"]) {
      v5->_keyboardType = [v7 decodeIntegerForKey:@"keyboardType"];
    }

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    if ([v9 containsValueForKey:@"returnKeyType"]) {
      v5->_returnKeyType = [v9 decodeIntegerForKey:@"returnKeyType"];
    }

    id v10 = v9;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    id v11 = v10;
    if ([v11 containsValueForKey:@"secureTextEntry"]) {
      v5->_secureTextEntry = [v11 decodeBoolForKey:@"secureTextEntry"];
    }

    id v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t returnKeyType;
  NSDictionary *rtiPayload;
  NSString *text;
  NSString *title;
  id v12;
  uint64_t vars8;

  id v4 = a3;
  identifier = self->_identifier;
  id v12 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v12;
  }
  int64_t keyboardType = self->_keyboardType;
  if (keyboardType)
  {
    [v12 encodeInteger:keyboardType forKey:@"keyboardType"];
    id v4 = v12;
  }
  prompt = self->_prompt;
  if (prompt)
  {
    [v12 encodeObject:prompt forKey:@"prompt"];
    id v4 = v12;
  }
  returnKeyType = self->_returnKeyType;
  if (returnKeyType)
  {
    [v12 encodeInteger:returnKeyType forKey:@"returnKeyType"];
    id v4 = v12;
  }
  rtiPayload = self->_rtiPayload;
  if (rtiPayload)
  {
    [v12 encodeObject:rtiPayload forKey:@"rtiPayload"];
    id v4 = v12;
  }
  if (self->_secureTextEntry)
  {
    [v12 encodeBool:1 forKey:@"secureTextEntry"];
    id v4 = v12;
  }
  text = self->_text;
  if (text)
  {
    [v12 encodeObject:text forKey:@"text"];
    id v4 = v12;
  }
  title = self->_title;
  if (title)
  {
    [v12 encodeObject:title forKey:@"title"];
    id v4 = v12;
  }
}

- (SFRemoteTextSessionInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  int v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = [(SFRemoteTextSessionInfo *)&v16 init];
  if (v5)
  {
    CFStringGetTypeID();
    id v6 = CFDictionaryGetTypedValue();
    if (!v17) {
      objc_storeStrong((id *)&v5->_identifier, v6);
    }
    int Int64Ranged = CFDictionaryGetInt64Ranged();
    if (!v17) {
      v5->_int64_t keyboardType = Int64Ranged;
    }
    CFStringGetTypeID();
    id v8 = CFDictionaryGetTypedValue();

    if (!v17) {
      objc_storeStrong((id *)&v5->_prompt, v8);
    }
    int v9 = CFDictionaryGetInt64Ranged();
    if (!v17) {
      v5->_returnKeyType = v9;
    }
    CFDictionaryGetTypeID();
    id v10 = CFDictionaryGetTypedValue();

    if (!v17) {
      objc_storeStrong((id *)&v5->_rtiPayload, v10);
    }
    uint64_t Int64 = CFDictionaryGetInt64();
    if (!v17) {
      v5->_secureTextEntry = Int64 != 0;
    }
    CFStringGetTypeID();
    id v12 = CFDictionaryGetTypedValue();

    if (!v17) {
      objc_storeStrong((id *)&v5->_text, v12);
    }
    CFStringGetTypeID();
    id v13 = CFDictionaryGetTypedValue();

    if (!v17) {
      objc_storeStrong((id *)&v5->_title, v13);
    }
    v14 = v5;
  }
  return v5;
}

- (SFRemoteTextSessionInfo)initWithRTIPayload:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = [(SFRemoteTextSessionInfo *)&v23 init];
  if (v5
    && (Class v6 = (Class)getRTIInputSystemDataPayloadClass_0[0](),
        [v4 data],
        id v7 = objc_claimAutoreleasedReturnValue(),
        -[objc_class payloadWithData:version:](v6, "payloadWithData:version:", v7, [v4 version]),
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    int v9 = [v8 documentTraits];
    id v10 = [v9 textInputTraits];

    if (v10)
    {
      id v11 = [v8 documentTraits];
      id v12 = [v11 textInputTraits];
      uint64_t v13 = [v12 keyboardType];
      if ((unint64_t)(v13 - 1) > 0xA) {
        int64_t v14 = 0;
      }
      else {
        int64_t v14 = qword_1A56EB320[v13 - 1];
      }
      v5->_int64_t keyboardType = v14;

      v15 = [v8 documentTraits];
      objc_super v16 = [v15 textInputTraits];
      uint64_t v17 = [v16 returnKeyType];
      if ((unint64_t)(v17 - 1) >= 0xB) {
        int64_t v18 = 0;
      }
      else {
        int64_t v18 = v17;
      }
      v5->_returnKeyType = v18;

      v19 = [v8 documentTraits];
      v20 = [v19 textInputTraits];
      v5->_secureTextEntry = [v20 secureTextEntry];
    }
    v21 = v5;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:&unk_1EFA098F0];
  }
  if (self->_keyboardType)
  {
    Class v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v6 forKeyedSubscript:&unk_1EFA09908];
  }
  prompt = self->_prompt;
  if (prompt) {
    [v4 setObject:prompt forKeyedSubscript:&unk_1EFA09920];
  }
  if (self->_returnKeyType)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v8 forKeyedSubscript:&unk_1EFA09938];
  }
  rtiPayload = self->_rtiPayload;
  if (rtiPayload) {
    [v4 setObject:rtiPayload forKeyedSubscript:&unk_1EFA09950];
  }
  if (self->_secureTextEntry)
  {
    id v10 = [NSNumber numberWithBool:1];
    [v4 setObject:v10 forKeyedSubscript:&unk_1EFA09968];
  }
  text = self->_text;
  if (text) {
    [v4 setObject:text forKeyedSubscript:&unk_1EFA09980];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKeyedSubscript:&unk_1EFA09998];
  }

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SFRemoteTextSessionInfo (%@)", self->_identifier];
  [v3 appendFormat:@", kb=%ld", self->_keyboardType];
  [v3 appendFormat:@", ret=%ld", self->_returnKeyType];
  if (self->_secureTextEntry) {
    [v3 appendFormat:@", secure"];
  }
  if (self->_prompt) {
    [v3 appendFormat:@", prompt='%@'", self->_prompt];
  }
  if (self->_rtiPayload) {
    [v3 appendFormat:@", rtiPayload"];
  }
  if (self->_text) {
    [v3 appendFormat:@", text='%@'", self->_text];
  }
  if (self->_title) {
    [v3 appendFormat:@", title='%@'", self->_title];
  }

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_int64_t keyboardType = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSDictionary)rtiPayload
{
  return self->_rtiPayload;
}

- (void)setRtiPayload:(id)a3
{
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_rtiPayload, 0);
  objc_storeStrong((id *)&self->_prompt, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end