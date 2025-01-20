@interface WFTextFieldConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsNegativeNumbers;
- (BOOL)autoPeriodsDisabled;
- (BOOL)dateHintPrefersDateOnly;
- (BOOL)doesRelativeDateFormatting;
- (BOOL)focusImmediatelyWhenPresented;
- (BOOL)isMultiline;
- (BOOL)isSecureTextEntry;
- (BOOL)showsDateFormattingHint;
- (BOOL)smartDashesDisabled;
- (BOOL)smartQuotesDisabled;
- (BOOL)textReplacementDisabled;
- (NSString)autocapitalizationType;
- (NSString)autocorrectionType;
- (NSString)clearButtonMode;
- (NSString)keyboardType;
- (NSString)localizedIncompleteHintString;
- (NSString)placeholder;
- (NSString)prefix;
- (NSString)returnKeyType;
- (NSString)text;
- (NSString)textAlignment;
- (NSString)textContentType;
- (WFTextFieldConfiguration)init;
- (WFTextFieldConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)initialInsertionIndex;
- (unint64_t)dateFormatStyle;
- (unint64_t)timeFormatStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNegativeNumbers:(BOOL)a3;
- (void)setAutoPeriodsDisabled:(BOOL)a3;
- (void)setAutocapitalizationType:(id)a3;
- (void)setAutocorrectionType:(id)a3;
- (void)setClearButtonMode:(id)a3;
- (void)setDateFormatStyle:(unint64_t)a3;
- (void)setDateHintPrefersDateOnly:(BOOL)a3;
- (void)setDoesRelativeDateFormatting:(BOOL)a3;
- (void)setFocusImmediatelyWhenPresented:(BOOL)a3;
- (void)setInitialInsertionIndex:(int64_t)a3;
- (void)setKeyboardType:(id)a3;
- (void)setLocalizedIncompleteHintString:(id)a3;
- (void)setMultiline:(BOOL)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setReturnKeyType:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setShowsDateFormattingHint:(BOOL)a3;
- (void)setSmartDashesDisabled:(BOOL)a3;
- (void)setSmartQuotesDisabled:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(id)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextReplacementDisabled:(BOOL)a3;
- (void)setTimeFormatStyle:(unint64_t)a3;
@end

@implementation WFTextFieldConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedIncompleteHintString, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_returnKeyType, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_clearButtonMode, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (void)setLocalizedIncompleteHintString:(id)a3
{
}

- (NSString)localizedIncompleteHintString
{
  return self->_localizedIncompleteHintString;
}

- (void)setDoesRelativeDateFormatting:(BOOL)a3
{
  self->_doesRelativeDateFormatting = a3;
}

- (BOOL)doesRelativeDateFormatting
{
  return self->_doesRelativeDateFormatting;
}

- (void)setDateHintPrefersDateOnly:(BOOL)a3
{
  self->_dateHintPrefersDateOnly = a3;
}

- (BOOL)dateHintPrefersDateOnly
{
  return self->_dateHintPrefersDateOnly;
}

- (void)setTimeFormatStyle:(unint64_t)a3
{
  self->_timeFormatStyle = a3;
}

- (unint64_t)timeFormatStyle
{
  return self->_timeFormatStyle;
}

- (void)setDateFormatStyle:(unint64_t)a3
{
  self->_dateFormatStyle = a3;
}

- (unint64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (void)setShowsDateFormattingHint:(BOOL)a3
{
  self->_showsDateFormattingHint = a3;
}

- (BOOL)showsDateFormattingHint
{
  return self->_showsDateFormattingHint;
}

- (void)setInitialInsertionIndex:(int64_t)a3
{
  self->_initialInsertionIndex = a3;
}

- (int64_t)initialInsertionIndex
{
  return self->_initialInsertionIndex;
}

- (void)setFocusImmediatelyWhenPresented:(BOOL)a3
{
  self->_focusImmediatelyWhenPresented = a3;
}

- (BOOL)focusImmediatelyWhenPresented
{
  return self->_focusImmediatelyWhenPresented;
}

- (void)setTextAlignment:(id)a3
{
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextContentType:(id)a3
{
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setReturnKeyType:(id)a3
{
}

- (NSString)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setAutocorrectionType:(id)a3
{
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocapitalizationType:(id)a3
{
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setClearButtonMode:(id)a3
{
}

- (NSString)clearButtonMode
{
  return self->_clearButtonMode;
}

- (void)setKeyboardType:(id)a3
{
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setTextReplacementDisabled:(BOOL)a3
{
  self->_textReplacementDisabled = a3;
}

- (BOOL)textReplacementDisabled
{
  return self->_textReplacementDisabled;
}

- (void)setSmartDashesDisabled:(BOOL)a3
{
  self->_smartDashesDisabled = a3;
}

- (BOOL)smartDashesDisabled
{
  return self->_smartDashesDisabled;
}

- (void)setSmartQuotesDisabled:(BOOL)a3
{
  self->_smartQuotesDisabled = a3;
}

- (BOOL)smartQuotesDisabled
{
  return self->_smartQuotesDisabled;
}

- (void)setAutoPeriodsDisabled:(BOOL)a3
{
  self->_autoPeriodsDisabled = a3;
}

- (BOOL)autoPeriodsDisabled
{
  return self->_autoPeriodsDisabled;
}

- (void)setAllowsNegativeNumbers:(BOOL)a3
{
  self->_allowsNegativeNumbers = a3;
}

- (BOOL)allowsNegativeNumbers
{
  return self->_allowsNegativeNumbers;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setPlaceholder:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFTextFieldConfiguration *)self prefix];
  [v4 encodeObject:v5 forKey:@"prefix"];

  v6 = [(WFTextFieldConfiguration *)self text];
  [v4 encodeObject:v6 forKey:@"text"];

  v7 = [(WFTextFieldConfiguration *)self placeholder];
  [v4 encodeObject:v7 forKey:@"placeholder"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration isSecureTextEntry](self, "isSecureTextEntry"), @"secureTextEntry");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration isMultiline](self, "isMultiline"), @"multiline");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration allowsNegativeNumbers](self, "allowsNegativeNumbers"), @"allowsNegativeNumbers");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration smartQuotesDisabled](self, "smartQuotesDisabled"), @"smartQuotesDisabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration smartDashesDisabled](self, "smartDashesDisabled"), @"smartDashesDisabled");
  v8 = [(WFTextFieldConfiguration *)self keyboardType];
  [v4 encodeObject:v8 forKey:@"keyboardType"];

  v9 = [(WFTextFieldConfiguration *)self clearButtonMode];
  [v4 encodeObject:v9 forKey:@"clearButtonMode"];

  v10 = [(WFTextFieldConfiguration *)self autocapitalizationType];
  [v4 encodeObject:v10 forKey:@"autocapitalizationType"];

  v11 = [(WFTextFieldConfiguration *)self autocorrectionType];
  [v4 encodeObject:v11 forKey:@"autocorrectionType"];

  v12 = [(WFTextFieldConfiguration *)self returnKeyType];
  [v4 encodeObject:v12 forKey:@"returnKeyType"];

  v13 = [(WFTextFieldConfiguration *)self textContentType];
  [v4 encodeObject:v13 forKey:@"textContentType"];

  v14 = [(WFTextFieldConfiguration *)self textAlignment];
  [v4 encodeObject:v14 forKey:@"textAlignment"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"), @"focusImmediatelyWhenPresented");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration initialInsertionIndex](self, "initialInsertionIndex"), @"initialInsertionIndex");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration showsDateFormattingHint](self, "showsDateFormattingHint"), @"showsDateFormattingHint");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration dateFormatStyle](self, "dateFormatStyle"), @"dateFormatStyle");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFTextFieldConfiguration timeFormatStyle](self, "timeFormatStyle"), @"timeFormatStyle");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration dateHintPrefersDateOnly](self, "dateHintPrefersDateOnly"), @"dateHintPrefersDateOnly");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFTextFieldConfiguration doesRelativeDateFormatting](self, "doesRelativeDateFormatting"), @"doesRelativeDateFormatting");
  id v15 = [(WFTextFieldConfiguration *)self localizedIncompleteHintString];
  [v4 encodeObject:v15 forKey:@"localizedIncompleteHintString"];
}

- (WFTextFieldConfiguration)initWithCoder:(id)a3
{
  NSString *returnKeyType;
  uint64_t v22;
  NSString *textContentType;
  uint64_t v24;
  NSString *textAlignment;
  uint64_t v26;
  NSString *localizedIncompleteHintString;
  WFTextFieldConfiguration *v28;
  objc_super v30;

  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFTextFieldConfiguration;
  v5 = [(WFTextFieldConfiguration *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefix"];
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholder"];
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v10;

    v5->_secureTextEntry = [v4 decodeBoolForKey:@"secureTextEntry"];
    v5->_multiline = [v4 decodeBoolForKey:@"multiline"];
    v5->_allowsNegativeNumbers = [v4 decodeBoolForKey:@"allowsNegativeNumbers"];
    v5->_autoPeriodsDisabled = [v4 decodeBoolForKey:@"autoPeriodsDisabled"];
    v5->_smartQuotesDisabled = [v4 decodeBoolForKey:@"smartQuotesDisabled"];
    v5->_smartDashesDisabled = [v4 decodeBoolForKey:@"smartDashesDisabled"];
    v5->_textReplacementDisabled = [v4 decodeBoolForKey:@"textReplacementDisabled"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardType"];
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearButtonMode"];
    clearButtonMode = v5->_clearButtonMode;
    v5->_clearButtonMode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocapitalizationType"];
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autocorrectionType"];
    autocorrectionType = v5->_autocorrectionType;
    v5->_autocorrectionType = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"returnKeyType"];
    returnKeyType = v5->_returnKeyType;
    v5->_returnKeyType = (NSString *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textContentType"];
    textContentType = v5->_textContentType;
    v5->_textContentType = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textAlignment"];
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v24;

    v5->_focusImmediatelyWhenPresented = [v4 decodeBoolForKey:@"focusImmediatelyWhenPresented"];
    v5->_initialInsertionIndex = [v4 decodeIntegerForKey:@"initialInsertionIndex"];
    v5->_showsDateFormattingHint = [v4 decodeBoolForKey:@"showsDateFormattingHint"];
    v5->_dateFormatStyle = [v4 decodeIntegerForKey:@"dateFormatStyle"];
    v5->_timeFormatStyle = [v4 decodeIntegerForKey:@"timeFormatStyle"];
    v5->_dateHintPrefersDateOnly = [v4 decodeBoolForKey:@"dateHintPrefersDateOnly"];
    v5->_doesRelativeDateFormatting = [v4 decodeBoolForKey:@"doesRelativeDateFormatting"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedIncompleteHintString"];
    localizedIncompleteHintString = v5->_localizedIncompleteHintString;
    v5->_localizedIncompleteHintString = (NSString *)v26;

    v28 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFTextFieldConfiguration *)self prefix];
  [v4 setPrefix:v5];

  uint64_t v6 = [(WFTextFieldConfiguration *)self text];
  [v4 setText:v6];

  v7 = [(WFTextFieldConfiguration *)self placeholder];
  [v4 setPlaceholder:v7];

  objc_msgSend(v4, "setSecureTextEntry:", -[WFTextFieldConfiguration isSecureTextEntry](self, "isSecureTextEntry"));
  objc_msgSend(v4, "setMultiline:", -[WFTextFieldConfiguration isMultiline](self, "isMultiline"));
  objc_msgSend(v4, "setAllowsNegativeNumbers:", -[WFTextFieldConfiguration allowsNegativeNumbers](self, "allowsNegativeNumbers"));
  objc_msgSend(v4, "setAutoPeriodsDisabled:", -[WFTextFieldConfiguration autoPeriodsDisabled](self, "autoPeriodsDisabled"));
  objc_msgSend(v4, "setSmartQuotesDisabled:", -[WFTextFieldConfiguration smartQuotesDisabled](self, "smartQuotesDisabled"));
  objc_msgSend(v4, "setSmartDashesDisabled:", -[WFTextFieldConfiguration smartDashesDisabled](self, "smartDashesDisabled"));
  objc_msgSend(v4, "setTextReplacementDisabled:", -[WFTextFieldConfiguration textReplacementDisabled](self, "textReplacementDisabled"));
  uint64_t v8 = [(WFTextFieldConfiguration *)self keyboardType];
  [v4 setKeyboardType:v8];

  v9 = [(WFTextFieldConfiguration *)self clearButtonMode];
  [v4 setClearButtonMode:v9];

  uint64_t v10 = [(WFTextFieldConfiguration *)self autocapitalizationType];
  [v4 setAutocapitalizationType:v10];

  v11 = [(WFTextFieldConfiguration *)self autocorrectionType];
  [v4 setAutocorrectionType:v11];

  uint64_t v12 = [(WFTextFieldConfiguration *)self returnKeyType];
  [v4 setReturnKeyType:v12];

  v13 = [(WFTextFieldConfiguration *)self textContentType];
  [v4 setTextContentType:v13];

  uint64_t v14 = [(WFTextFieldConfiguration *)self textAlignment];
  [v4 setTextAlignment:v14];

  objc_msgSend(v4, "setFocusImmediatelyWhenPresented:", -[WFTextFieldConfiguration focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"));
  objc_msgSend(v4, "setInitialInsertionIndex:", -[WFTextFieldConfiguration initialInsertionIndex](self, "initialInsertionIndex"));
  objc_msgSend(v4, "setShowsDateFormattingHint:", -[WFTextFieldConfiguration showsDateFormattingHint](self, "showsDateFormattingHint"));
  objc_msgSend(v4, "setDateFormatStyle:", -[WFTextFieldConfiguration dateFormatStyle](self, "dateFormatStyle"));
  objc_msgSend(v4, "setTimeFormatStyle:", -[WFTextFieldConfiguration timeFormatStyle](self, "timeFormatStyle"));
  objc_msgSend(v4, "setDateHintPrefersDateOnly:", -[WFTextFieldConfiguration dateHintPrefersDateOnly](self, "dateHintPrefersDateOnly"));
  objc_msgSend(v4, "setDoesRelativeDateFormatting:", -[WFTextFieldConfiguration doesRelativeDateFormatting](self, "doesRelativeDateFormatting"));
  id v15 = [(WFTextFieldConfiguration *)self localizedIncompleteHintString];
  [v4 setLocalizedIncompleteHintString:v15];

  return v4;
}

- (WFTextFieldConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFTextFieldConfiguration;
  v2 = [(WFTextFieldConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsNegativeNumbers = 1;
    v2->_focusImmediatelyWhenPresented = 1;
    v2->_initialInsertionIndex = -1;
    clearButtonMode = v2->_clearButtonMode;
    v2->_clearButtonMode = (NSString *)@"Always";

    v5 = v3;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end