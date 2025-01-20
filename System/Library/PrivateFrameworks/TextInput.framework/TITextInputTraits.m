@interface TITextInputTraits
+ (BOOL)supportsSecureCoding;
- (BOOL)disablePrediction;
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)isEqual:(id)a3;
- (BOOL)secureTextEntry;
- (BOOL)smartDashesEnabled;
- (BOOL)smartInsertDeleteEnabled;
- (BOOL)smartQuotesEnabled;
- (NSString)recentInputIdentifier;
- (NSString)textContentType;
- (TITextInputTraits)init;
- (TITextInputTraits)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)allowsTextAnimationsType;
- (int64_t)mathExpressionCompletionType;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)inlineCompletionType;
- (unint64_t)keyboardAppearance;
- (unint64_t)keyboardType;
- (unint64_t)returnKeyType;
- (unint64_t)smartDashesType;
- (unint64_t)smartInsertDeleteType;
- (unint64_t)smartQuotesType;
- (unint64_t)spellCheckingType;
- (unint64_t)textScriptType;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsTextAnimationsType:(int64_t)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setDisablePrediction:(BOOL)a3;
- (void)setEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)setInlineCompletionType:(unint64_t)a3;
- (void)setKeyboardAppearance:(unint64_t)a3;
- (void)setKeyboardType:(unint64_t)a3;
- (void)setMathExpressionCompletionType:(int64_t)a3;
- (void)setRecentInputIdentifier:(id)a3;
- (void)setReturnKeyType:(unint64_t)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSmartDashesEnabled:(BOOL)a3;
- (void)setSmartDashesType:(unint64_t)a3;
- (void)setSmartInsertDeleteEnabled:(BOOL)a3;
- (void)setSmartInsertDeleteType:(unint64_t)a3;
- (void)setSmartQuotesEnabled:(BOOL)a3;
- (void)setSmartQuotesType:(unint64_t)a3;
- (void)setSpellCheckingType:(unint64_t)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextScriptType:(unint64_t)a3;
@end

@implementation TITextInputTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInputIdentifier, 0);

  objc_storeStrong((id *)&self->_textContentType, 0);
}

- (void)setKeyboardType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFF83F | ((a3 & 0x1F) << 6));
}

- (void)setTextContentType:(id)a3
{
}

- (void)setRecentInputIdentifier:(id)a3
{
}

- (void)setAllowsTextAnimationsType:(int64_t)a3
{
  self->_allowsTextAnimationsType = a3;
}

- (void)setTextScriptType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFF87FFFF | ((a3 & 0xF) << 19));
}

- (void)setSpellCheckingType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFCF | (16 * (a3 & 3)));
}

- (void)setReturnKeyType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFF83FFF | ((a3 & 0x1F) << 14));
}

- (void)setKeyboardAppearance:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFC7FF | ((a3 & 7) << 11));
}

- (void)setInlineCompletionType:(unint64_t)a3
{
  LOBYTE(self->_auxMask.integerValue) = self->_auxMask.integerValue & 0xFC | a3 & 3;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFF3 | (4 * (a3 & 3)));
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFFFFFFFC | a3 & 3);
}

- (void)setMathExpressionCompletionType:(int64_t)a3
{
  LOBYTE(self->_auxMask.integerValue) = self->_auxMask.integerValue & 0xF3 | (4 * (a3 & 3));
}

- (void)setSmartDashesEnabled:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0x40000000;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(v3 & 0xC0000000 | self->_mask.integerValue & 0x3FFFFFFF);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (void)setDisablePrediction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (void)setSmartQuotesEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0x10000000;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xCFFFFFFF | v3);
}

- (void)setSmartInsertDeleteEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0x4000000;
  }
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xF3FFFFFF | v3);
}

- (TITextInputTraits)init
{
  v3.receiver = self;
  v3.super_class = (Class)TITextInputTraits;
  result = [(TITextInputTraits *)&v3 init];
  if (result) {
    result->_version = 2;
  }
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)recentInputIdentifier
{
  return self->_recentInputIdentifier;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (id)description
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; version = %d", self->_version);
  unint64_t v4 = [(TITextInputTraits *)self autocapitalizationType];
  if (v4 <= 3) {
    [v3 appendString:off_1E555A830[v4]];
  }
  unint64_t v5 = [(TITextInputTraits *)self autocorrectionType];
  if (v5 <= 2) {
    [v3 appendString:off_1E555A850[v5]];
  }
  if ([(TITextInputTraits *)self disablePrediction]) {
    [v3 appendFormat:@"; disablePrediction = YES"];
  }
  unint64_t v6 = [(TITextInputTraits *)self spellCheckingType];
  if (v6 <= 2) {
    [v3 appendString:off_1E555A868[v6]];
  }
  objc_msgSend(v3, "appendFormat:", @"; keyboardType = %d",
    [(TITextInputTraits *)self keyboardType]);
  unint64_t v7 = [(TITextInputTraits *)self keyboardAppearance];
  if (v7 <= 2) {
    [v3 appendString:off_1E555A880[v7]];
  }
  objc_msgSend(v3, "appendFormat:", @"; returnKeyType = %d",
    [(TITextInputTraits *)self returnKeyType]);
  if ([(TITextInputTraits *)self enablesReturnKeyAutomatically]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; enablesReturnKeyAutomatically = %s", v8);
  if ([(TITextInputTraits *)self secureTextEntry]) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; secureTextEntry = %s", v9);
  objc_msgSend(v3, "appendFormat:", @"; smartInsertDeleteType = %d",
    [(TITextInputTraits *)self smartInsertDeleteType]);
  objc_msgSend(v3, "appendFormat:", @"; smartQuotesType = %d",
    [(TITextInputTraits *)self smartQuotesType]);
  objc_msgSend(v3, "appendFormat:", @"; smartDashesType = %d",
    [(TITextInputTraits *)self smartDashesType]);
  v10 = [(TITextInputTraits *)self recentInputIdentifier];

  if (v10)
  {
    v11 = [(TITextInputTraits *)self recentInputIdentifier];
    [v3 appendFormat:@"; recentInputIdentifier = %@", v11];
  }
  v12 = [(TITextInputTraits *)self textContentType];

  if (v12)
  {
    v13 = [(TITextInputTraits *)self textContentType];
    [v3 appendFormat:@"; textContentType = %@", v13];
  }
  if ([(TITextInputTraits *)self textScriptType])
  {
    unint64_t v14 = [(TITextInputTraits *)self textScriptType] - 1;
    if (v14 <= 3) {
      [v3 appendString:off_1E555A898[v14]];
    }
  }
  unint64_t v15 = [(TITextInputTraits *)self inlineCompletionType];
  if (v15 <= 2) {
    [v3 appendString:off_1E555A8B8[v15]];
  }
  unint64_t v16 = [(TITextInputTraits *)self mathExpressionCompletionType];
  if (v16 <= 2) {
    [v3 appendString:off_1E555A8D0[v16]];
  }
  unint64_t v17 = [(TITextInputTraits *)self allowsTextAnimationsType];
  if (v17 <= 2) {
    [v3 appendString:off_1E555A8E8[v17]];
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(TITextInputTraits *)self version];
    if (v6 != [v5 version]) {
      goto LABEL_22;
    }
    unint64_t v7 = [(TITextInputTraits *)self autocapitalizationType];
    if (v7 != [v5 autocapitalizationType]) {
      goto LABEL_22;
    }
    unint64_t v8 = [(TITextInputTraits *)self autocorrectionType];
    if (v8 != [v5 autocorrectionType]) {
      goto LABEL_22;
    }
    unint64_t v9 = [(TITextInputTraits *)self spellCheckingType];
    if (v9 != [v5 spellCheckingType]) {
      goto LABEL_22;
    }
    unint64_t v10 = [(TITextInputTraits *)self keyboardType];
    if (v10 != [v5 keyboardType]) {
      goto LABEL_22;
    }
    unint64_t v11 = [(TITextInputTraits *)self keyboardAppearance];
    if (v11 != [v5 keyboardAppearance]) {
      goto LABEL_22;
    }
    unint64_t v12 = [(TITextInputTraits *)self returnKeyType];
    if (v12 != [v5 returnKeyType]) {
      goto LABEL_22;
    }
    int v13 = [(TITextInputTraits *)self enablesReturnKeyAutomatically];
    if (v13 != [v5 enablesReturnKeyAutomatically]) {
      goto LABEL_22;
    }
    int v14 = [(TITextInputTraits *)self secureTextEntry];
    if (v14 != [v5 secureTextEntry]) {
      goto LABEL_22;
    }
    unint64_t v15 = NSString;
    unint64_t v16 = [(TITextInputTraits *)self recentInputIdentifier];
    unint64_t v17 = [v5 recentInputIdentifier];
    LODWORD(v15) = [v15 _string:v16 matchesString:v17];

    if (!v15) {
      goto LABEL_22;
    }
    v18 = NSString;
    v19 = [(TITextInputTraits *)self textContentType];
    v20 = [v5 textContentType];
    LODWORD(v18) = [v18 _string:v19 matchesString:v20];

    if (!v18) {
      goto LABEL_22;
    }
    unint64_t v21 = [(TITextInputTraits *)self textScriptType];
    if (v21 == [v5 textScriptType]
      && (unint64_t v22 = [(TITextInputTraits *)self smartInsertDeleteType],
          v22 == [v5 smartInsertDeleteType])
      && (unint64_t v23 = -[TITextInputTraits smartQuotesType](self, "smartQuotesType"), v23 == [v5 smartQuotesType])&& (v24 = -[TITextInputTraits smartDashesType](self, "smartDashesType"), v24 == objc_msgSend(v5, "smartDashesType"))&& (v25 = -[TITextInputTraits disablePrediction](self, "disablePrediction"), v25 == objc_msgSend(v5, "disablePrediction"))&& (v26 = -[TITextInputTraits inlineCompletionType](self, "inlineCompletionType"), v26 == objc_msgSend(v5, "inlineCompletionType"))&& (v27 = -[TITextInputTraits mathExpressionCompletionType](self, "mathExpressionCompletionType"), v27 == objc_msgSend(v5, "mathExpressionCompletionType")))
    {
      int64_t v28 = [(TITextInputTraits *)self allowsTextAnimationsType];
      BOOL v29 = v28 == [v5 allowsTextAnimationsType];
    }
    else
    {
LABEL_22:
      BOOL v29 = 0;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t version = [v19 tiVersion];
    self->_uint64_t version = version;
    if (!version) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t version = self->_version;
    if (!version)
    {
LABEL_19:
      int64_t integerValue = self->_mask.integerValue;
      goto LABEL_20;
    }
  }
  [v19 encodeInteger:version forKey:@"version"];
  if (self->_version != 1) {
    goto LABEL_19;
  }
  int64_t v5 = self->_mask.integerValue;
  int v6 = v5 & 0x3F;
  unsigned int v7 = (v5 >> 6) & 0x1F;
  unsigned int v8 = v7 - 16;
  BOOL v9 = v7 == 15;
  int v10 = v5 & 0x3FF;
  if (v9) {
    int v10 = v6 | 0x80;
  }
  if (v8 >= 2) {
    int v6 = v10;
  }
  unsigned int v11 = (v5 >> 11) & 7;
  int v12 = v6 | 0x400;
  if (v11 == 3) {
    unsigned int v13 = v6 | 0x400;
  }
  else {
    unsigned int v13 = v6 & 0xFFFFF3FF | (((v5 >> 11) & 3) << 10);
  }
  if (v11 != 4) {
    int v6 = v13;
  }
  if (v11 == 5) {
    int v6 = v12;
  }
  int64_t integerValue = v6 | (((v5 >> 3) & 0x3F0000 | v5 & 0xC2000000 | (((v5 & 0xC0000000) != 0x40000000) << 24) & 0xC3FFFFFF | (v5 >> 2) & 0xF000 | (((v5 >> 26) & 3) << 26) & 0xCFFFFFFF | (((v5 >> 28) & 3) << 28) | ((((v5 >> 26) & 3) != 1) << 22))
                     + ((((v5 >> 28) & 3) != 1) << 23));
LABEL_20:
  [v19 encodeInteger:integerValue forKey:@"flags"];
  [v19 encodeInteger:self->_auxMask.integerValue forKey:@"auxFlags"];
  recentInputIdentifier = self->_recentInputIdentifier;
  if (recentInputIdentifier) {
    [v19 encodeObject:recentInputIdentifier forKey:@"recentInputIdentifier"];
  }
  textContentType = self->_textContentType;
  if (textContentType) {
    [v19 encodeObject:textContentType forKey:@"textContentType"];
  }
  int64_t allowsTextAnimationsType = self->_allowsTextAnimationsType;
  v18 = v19;
  if (allowsTextAnimationsType)
  {
    [v19 encodeInteger:allowsTextAnimationsType forKey:@"allowsTextAnimationsType"];
    v18 = v19;
  }
}

- (TITextInputTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TITextInputTraits;
  int64_t v5 = [(TITextInputTraits *)&v19 init];
  if (!v5) {
    goto LABEL_19;
  }
  if ([v4 containsValueForKey:@"version"])
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"version"];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5->_uint64_t version = 1;
      goto LABEL_9;
    }
    uint64_t v6 = [v4 tiVersion];
  }
  v5->_uint64_t version = v6;
  if (v6 == 1)
  {
LABEL_9:
    unint64_t v8 = [v4 decodeIntegerForKey:@"flags"];
    uint64_t v9 = v8 & 0xC000000;
    if ((v8 & 0x400000) != 0) {
      uint64_t v9 = 0x8000000;
    }
    uint64_t v10 = v8 & 0x30000000;
    if ((v8 & 0x800000) != 0) {
      uint64_t v10 = 0x20000000;
    }
    uint64_t v11 = v8 & 0xC0000000;
    if ((v8 & 0x1000000) != 0) {
      uint64_t v11 = 0x80000000;
    }
    unint64_t v7 = v8 & 0x20003FF | (((v8 >> 10) & 3) << 11) & 0xFFFFFFFFFE043FFFLL | ((unint64_t)((unsigned __int16)v8 >> 12) << 14) & 0xFFFFFFFFFE07FFFFLL | (((v8 >> 16) & 0x3F) << 19) | v9 | v10 | v11;
    goto LABEL_16;
  }
  unint64_t v7 = [v4 decodeIntegerForKey:@"flags"];
LABEL_16:
  v5->_mask.int64_t integerValue = v7;
  if ([v4 containsValueForKey:@"auxFlags"]) {
    v5->_auxMask.int64_t integerValue = [v4 decodeIntegerForKey:@"auxFlags"];
  }
  int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recentInputIdentifier"];
  uint64_t v13 = [v12 copy];
  recentInputIdentifier = v5->_recentInputIdentifier;
  v5->_recentInputIdentifier = (NSString *)v13;

  unint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textContentType"];
  uint64_t v16 = [v15 copy];
  textContentType = v5->_textContentType;
  v5->_textContentType = (NSString *)v16;

  v5->_int64_t allowsTextAnimationsType = [v4 decodeIntegerForKey:@"allowsTextAnimationsType"];
LABEL_19:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TITextInputTraits);
  int64_t v5 = v4;
  if (v4)
  {
    v4->_uint64_t version = self->_version;
    v4->_mask.int64_t integerValue = self->_mask.integerValue;
    v4->_auxMask.int64_t integerValue = self->_auxMask.integerValue;
    uint64_t v6 = [(NSString *)self->_recentInputIdentifier copy];
    recentInputIdentifier = v5->_recentInputIdentifier;
    v5->_recentInputIdentifier = (NSString *)v6;

    uint64_t v8 = [(NSString *)self->_textContentType copy];
    textContentType = v5->_textContentType;
    v5->_textContentType = (NSString *)v8;

    v5->_int64_t allowsTextAnimationsType = self->_allowsTextAnimationsType;
  }
  return v5;
}

- (int64_t)allowsTextAnimationsType
{
  return self->_allowsTextAnimationsType;
}

- (int64_t)mathExpressionCompletionType
{
  return (uint64_t)(char)(16 * LOBYTE(self->_auxMask.integerValue)) >> 6;
}

- (unint64_t)inlineCompletionType
{
  return self->_auxMask.integerValue & 3;
}

- (BOOL)disablePrediction
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (void)setSmartDashesType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0x3FFFFFFF | (a3 << 30));
}

- (unint64_t)smartDashesType
{
  return (unint64_t)LODWORD(self->_mask.integerValue) >> 30;
}

- (void)setSmartQuotesType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xCFFFFFFF | ((a3 & 3) << 28));
}

- (unint64_t)smartQuotesType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 28) & 3;
}

- (void)setSmartInsertDeleteType:(unint64_t)a3
{
  self->_mask.fields = ($A0FCF31916F15FB8ABACF812408D6DB1)(self->_mask.integerValue & 0xF3FFFFFF | ((a3 & 3) << 26));
}

- (unint64_t)smartInsertDeleteType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 26) & 3;
}

- (BOOL)smartDashesEnabled
{
  return (unint64_t)self->_mask.integerValue >> 30 != 1;
}

- (BOOL)smartQuotesEnabled
{
  return (self->_mask.integerValue & 0x30000000) != 0x10000000;
}

- (BOOL)smartInsertDeleteEnabled
{
  return (self->_mask.integerValue & 0xC000000) != 0x4000000;
}

- (unint64_t)textScriptType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 19) & 0xF;
}

- (BOOL)secureTextEntry
{
  return *((unsigned char *)&self->_mask.fields + 3) & 1;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (unint64_t)returnKeyType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 14) & 0x1F;
}

- (unint64_t)keyboardAppearance
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 11) & 7;
}

- (unint64_t)keyboardType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 6) & 0x1F;
}

- (unint64_t)spellCheckingType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 4) & 3;
}

- (unint64_t)autocorrectionType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 2) & 3;
}

- (unint64_t)autocapitalizationType
{
  return self->_mask.integerValue & 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end