@interface TVRCKeyboardAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)_enablesReturnKeyAutomatically;
- (BOOL)_isLikelyPINEntry;
- (BOOL)_isSecure;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributes:(id)a3;
- (NSString)prompt;
- (NSString)title;
- (RTIDataPayload)rtiDataPayload;
- (TVRCKeyboardAttributes)initWithCoder:(id)a3;
- (TVRCPINEntryAttributes)PINEntryAttributes;
- (id)_init;
- (id)description;
- (int64_t)_autocapitalizationType;
- (int64_t)_autocorrectionType;
- (int64_t)_keyboardType;
- (int64_t)_returnKeyType;
- (int64_t)_spellCheckingType;
- (unint64_t)hash;
- (void)_setAutocapitalizationType:(int64_t)a3;
- (void)_setAutocorrectionType:(int64_t)a3;
- (void)_setEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)_setKeyboardType:(int64_t)a3;
- (void)_setLikelyPINEntry:(BOOL)a3;
- (void)_setReturnKeyType:(int64_t)a3;
- (void)_setSecure:(BOOL)a3;
- (void)_setSpellCheckingType:(int64_t)a3;
- (void)applyToTextField:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPINEntryAttributes:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setRtiDataPayload:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVRCKeyboardAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRCKeyboardAttributes;
  id result = [(TVRCKeyboardAttributes *)&v3 init];
  if (result) {
    *((void *)result + 8) = 2;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; title='%@'; PINEntryAttributes=%@; secure=%d; enablesReturnKeyAutomatically=%d; keyboardType=%d; returnKeyType=%d; autocapitalizationType=%d; autocorrectionType=%d; spellCheckingType=%d>",
               objc_opt_class(),
               self,
               self->_title,
               self->_PINEntryAttributes,
               self->_secure,
               self->_enablesReturnKeyAutomatically,
               self->_keyboardType,
               self->_returnKeyType,
               self->_autocapitalizationType,
               self->_autocorrectionType,
               self->_spellCheckingType);
}

- (TVRCKeyboardAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TVRCKeyboardAttributes *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rtiDataPayload"];
    rtiDataPayload = v5->_rtiDataPayload;
    v5->_rtiDataPayload = (RTIDataPayload *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_likelyPINEntry = [v4 decodeBoolForKey:@"likelyPINEntry"];
    v5->_secure = [v4 decodeBoolForKey:@"secure"];
    v5->_enablesReturnKeyAutomatically = [v4 decodeBoolForKey:@"enablesReturnKeyAutomatically"];
    v5->_keyboardType = [v4 decodeIntegerForKey:@"keyboardType"];
    v5->_returnKeyType = [v4 decodeIntegerForKey:@"returnKeyType"];
    v5->_autocapitalizationType = [v4 decodeIntegerForKey:@"autocapitalizationType"];
    v5->_autocorrectionType = [v4 decodeIntegerForKey:@"autocorrectionType"];
    v5->_spellCheckingType = [v4 decodeIntegerForKey:@"spellCheckingType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PINEntryAttributes"];
    PINEntryAttributes = v5->_PINEntryAttributes;
    v5->_PINEntryAttributes = (TVRCPINEntryAttributes *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rtiDataPayload = self->_rtiDataPayload;
  id v5 = a3;
  [v5 encodeObject:rtiDataPayload forKey:@"rtiDataPayload"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeBool:self->_likelyPINEntry forKey:@"likelyPINEntry"];
  [v5 encodeBool:self->_secure forKey:@"secure"];
  [v5 encodeBool:self->_enablesReturnKeyAutomatically forKey:@"enablesReturnKeyAutomatically"];
  [v5 encodeInteger:self->_keyboardType forKey:@"keyboardType"];
  [v5 encodeInteger:self->_returnKeyType forKey:@"returnKeyType"];
  [v5 encodeInteger:self->_autocapitalizationType forKey:@"autocapitalizationType"];
  [v5 encodeInteger:self->_autocorrectionType forKey:@"autocorrectionType"];
  [v5 encodeInteger:self->_spellCheckingType forKey:@"spellCheckingType"];
  [v5 encodeObject:self->_PINEntryAttributes forKey:@"PINEntryAttributes"];
}

- (BOOL)isEqualToAttributes:(id)a3
{
  id v4 = a3;
  rtiDataPayload = self->_rtiDataPayload;
  if (!rtiDataPayload)
  {
    title = self->_title;
    if (!title) {
      goto LABEL_23;
    }
    if (!v4[2] || !-[NSString isEqualToString:](title, "isEqualToString:")) {
      goto LABEL_19;
    }
    if (self->_title)
    {
      if (!v4[2]) {
        goto LABEL_19;
      }
    }
    else
    {
LABEL_23:
      if (v4[2]) {
        goto LABEL_19;
      }
    }
    if (self->_likelyPINEntry == *((unsigned __int8 *)v4 + 8)
      && self->_secure == *((unsigned __int8 *)v4 + 9)
      && self->_enablesReturnKeyAutomatically == *((unsigned __int8 *)v4 + 10)
      && self->_keyboardType == v4[6]
      && self->_returnKeyType == v4[7]
      && self->_autocapitalizationType == v4[8]
      && self->_autocorrectionType == v4[9])
    {
      char v6 = self->_spellCheckingType == v4[10];
      goto LABEL_20;
    }
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if (!v4) {
    goto LABEL_19;
  }
  char v6 = [(RTIDataPayload *)rtiDataPayload isEqual:v4[5]];
LABEL_20:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TVRCKeyboardAttributes *)self isEqualToAttributes:v4];

  return v5;
}

- (unint64_t)hash
{
  return 1;
}

- (void)applyToTextField:(id)a3
{
  int64_t returnKeyType;
  int64_t autocapitalizationType;
  uint64_t v9;
  int64_t spellCheckingType;
  uint64_t v11;
  id v12;
  uint64_t vars8;

  v12 = a3;
  id v4 = [v12 _rtiSourceSession];
  BOOL v5 = v4;
  if (v4 && self->_rtiDataPayload)
  {
    objc_msgSend(v4, "handleTextActionPayload:");
  }
  else
  {
    [v12 setSecureTextEntry:self->_secure];
    [v12 setEnablesReturnKeyAutomatically:self->_enablesReturnKeyAutomatically];
    int64_t keyboardType = self->_keyboardType;
    switch(keyboardType)
    {
      case 1:
      case 2:
      case 3:
      case 6:
      case 7:
      case 9:
      case 10:
        break;
      case 4:
      case 5:
      case 8:
        int64_t keyboardType = 2;
        break;
      case 11:
        if (self->_likelyPINEntry) {
          int64_t keyboardType = 11;
        }
        else {
          int64_t keyboardType = 2;
        }
        break;
      default:
        int64_t keyboardType = 0;
        break;
    }
    [v12 setKeyboardType:keyboardType];
    if ((unint64_t)(self->_returnKeyType - 1) >= 0xB) {
      returnKeyType = 0;
    }
    else {
      returnKeyType = self->_returnKeyType;
    }
    [v12 setReturnKeyType:returnKeyType];
    if ((unint64_t)(self->_autocapitalizationType - 1) >= 3) {
      autocapitalizationType = 0;
    }
    else {
      autocapitalizationType = self->_autocapitalizationType;
    }
    [v12 setAutocapitalizationType:autocapitalizationType];
    if (self->_autocorrectionType == 2) {
      v9 = 2;
    }
    else {
      v9 = 1;
    }
    [v12 setAutocorrectionType:v9];
    spellCheckingType = self->_spellCheckingType;
    if (spellCheckingType == 2) {
      v11 = 2;
    }
    else {
      v11 = spellCheckingType == 1;
    }
    [v12 setSpellCheckingType:v11];
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (TVRCPINEntryAttributes)PINEntryAttributes
{
  return self->_PINEntryAttributes;
}

- (void)setPINEntryAttributes:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (RTIDataPayload)rtiDataPayload
{
  return self->_rtiDataPayload;
}

- (void)setRtiDataPayload:(id)a3
{
}

- (BOOL)_isLikelyPINEntry
{
  return self->_likelyPINEntry;
}

- (void)_setLikelyPINEntry:(BOOL)a3
{
  self->_likelyPINEntry = a3;
}

- (BOOL)_isSecure
{
  return self->_secure;
}

- (void)_setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)_enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (void)_setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->_enablesReturnKeyAutomatically = a3;
}

- (int64_t)_keyboardType
{
  return self->_keyboardType;
}

- (void)_setKeyboardType:(int64_t)a3
{
  self->_int64_t keyboardType = a3;
}

- (int64_t)_returnKeyType
{
  return self->_returnKeyType;
}

- (void)_setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (int64_t)_autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)_setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)_autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)_setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)_spellCheckingType
{
  return self->_spellCheckingType;
}

- (void)_setSpellCheckingType:(int64_t)a3
{
  self->_spellCheckingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtiDataPayload, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_PINEntryAttributes, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end