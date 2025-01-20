@interface TVRMSKeyboardInfo
- (BOOL)secureText;
- (NSString)subtitle;
- (NSString)text;
- (NSString)title;
- (TVRMSKeyboardInfo)initWithItemsArray:(id)a3;
- (int64_t)keyboardInputType;
- (int64_t)keyboardType;
- (int64_t)maximumCharacters;
- (int64_t)minimumCharacters;
- (void)setKeyboardInputType:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setMaximumCharacters:(int64_t)a3;
- (void)setMinimumCharacters:(int64_t)a3;
- (void)setSecureText:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVRMSKeyboardInfo

- (TVRMSKeyboardInfo)initWithItemsArray:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TVRMSKeyboardInfo;
  v5 = [(TVRMSKeyboardInfo *)&v31 init];
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v26 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (!v7) {
      goto LABEL_38;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        v12 = [v11 objectForKeyedSubscript:@"name"];
        if ([v12 isEqualToString:@"kKeybMsgKey_String"])
        {
          uint64_t v13 = [v11 objectForKeyedSubscript:@"value"];
          text = v5->_text;
          v5->_text = (NSString *)v13;
LABEL_13:

          goto LABEL_14;
        }
        if ([v12 isEqualToString:@"kKeybMsgKey_Title"])
        {
          uint64_t v15 = [v11 objectForKeyedSubscript:@"value"];
          text = v5->_title;
          v5->_title = (NSString *)v15;
          goto LABEL_13;
        }
        if ([v12 isEqualToString:@"kKeybMsgKey_SubText"])
        {
          uint64_t v16 = [v11 objectForKeyedSubscript:@"value"];
          text = v5->_subtitle;
          v5->_subtitle = (NSString *)v16;
          goto LABEL_13;
        }
        if ([v12 isEqualToString:@"kKeybMsgKey_SecureText"])
        {
          v17 = [v11 objectForKeyedSubscript:@"value"];
          v5->_secureText = [v17 BOOLValue];

          goto LABEL_14;
        }
        if ([v12 isEqualToString:@"kKeybMsgKey_KeyboardType"])
        {
          v18 = [v11 objectForKeyedSubscript:@"value"];
          uint64_t v19 = [v18 integerValue];

          switch(v19)
          {
            case 7:
              v5->_keyboardType = 3;
              goto LABEL_14;
            case 4:
              uint64_t v20 = 2;
              goto LABEL_30;
            case 3:
              uint64_t v20 = 1;
LABEL_30:
              v5->_keyboardType = v20;
              goto LABEL_14;
          }
          v5->_keyboardType = 0;
        }
        else if ([v12 isEqualToString:@"kKeybMsgKey_TextInputType"])
        {
          v21 = [v11 objectForKeyedSubscript:@"value"];
          uint64_t v22 = [v21 integerValue];

          v5->_keyboardInputType = v22 == 1;
        }
        else
        {
          if ([v12 isEqualToString:@"kKeybMsgKey_MinCharacters"])
          {
            v23 = [v11 objectForKeyedSubscript:@"value"];
            v5->_minimumCharacters = [v23 integerValue];
          }
          else
          {
            if (![v12 isEqualToString:@"kKeybMsgKey_MaxCharacters"]) {
              goto LABEL_14;
            }
            v23 = [v11 objectForKeyedSubscript:@"value"];
            v5->_maximumCharacters = [v23 integerValue];
          }
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v24 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      uint64_t v8 = v24;
      if (!v24)
      {
LABEL_38:

        id v4 = v26;
        break;
      }
    }
  }

  return v5;
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

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)secureText
{
  return self->_secureText;
}

- (void)setSecureText:(BOOL)a3
{
  self->_secureText = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardInputType
{
  return self->_keyboardInputType;
}

- (void)setKeyboardInputType:(int64_t)a3
{
  self->_keyboardInputType = a3;
}

- (int64_t)minimumCharacters
{
  return self->_minimumCharacters;
}

- (void)setMinimumCharacters:(int64_t)a3
{
  self->_minimumCharacters = a3;
}

- (int64_t)maximumCharacters
{
  return self->_maximumCharacters;
}

- (void)setMaximumCharacters:(int64_t)a3
{
  self->_maximumCharacters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end