@interface WBSPasswordEvaluation
+ (BOOL)supportsSecureCoding;
- (BOOL)_shouldShowUserFeedbackStringsForWordListPatternMatch:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)userShouldBeShownActiveWarning;
- (BOOL)userShouldBeShownPassiveWarning;
- (NSArray)patternMatches;
- (NSDictionary)dictionaryRepresentation;
- (NSString)password;
- (WBSPasswordEvaluation)initWithCoder:(id)a3;
- (WBSPasswordEvaluation)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordEvaluation)initWithEvaluationType:(int64_t)a3 password:(id)a4 patternMatches:(id)a5 guessesRequired:(double)a6;
- (WBSPasswordPatternMatch)bestPatternMatchForUserFeedback;
- (double)guessesRequired;
- (id)_bestPatternMatchOfType:(unint64_t)a3;
- (id)_passwordFeedbackStringWithPasswordVisibility:(unint64_t)a3;
- (id)compactDescriptionWithPasswordColumnWidth:(unint64_t)a3 includePatternMatches:(BOOL)a4;
- (id)userFeedbackStringWithPasswordVisibility:(unint64_t)a3;
- (int64_t)evaluationType;
- (unint64_t)_userFeedbackLengthScoreForPatternMatch:(id)a3;
- (unint64_t)hash;
- (unint64_t)strength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSPasswordEvaluation

- (WBSPasswordEvaluation)initWithEvaluationType:(int64_t)a3 password:(id)a4 patternMatches:(id)a5 guessesRequired:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordEvaluation;
  v12 = [(WBSPasswordEvaluation *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_evaluationType = a3;
    uint64_t v14 = [v10 copy];
    password = v13->_password;
    v13->_password = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    patternMatches = v13->_patternMatches;
    v13->_patternMatches = (NSArray *)v16;

    v13->_guessesRequired = a6;
    v18 = v13;
  }

  return v13;
}

- (WBSPasswordEvaluation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_numberForKey:", @"evaluationType");
  v6 = objc_msgSend(v4, "safari_numberForKey:", @"guessesRequired");
  v7 = objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"patternMatches");
  uint64_t v8 = [v4 objectForKeyedSubscript:@"password"];

  v9 = 0;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1F105D3F0;
  }
  if (v5 && v6 && v7)
  {
    id v11 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_43);
    uint64_t v12 = [v5 integerValue];
    [v6 doubleValue];
    self = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:](self, "initWithEvaluationType:password:patternMatches:guessesRequired:", v12, v10, v11);

    v9 = self;
  }

  return v9;
}

WBSPasswordPatternMatch *__58__WBSPasswordEvaluation_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WBSPasswordPatternMatch alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSPasswordEvaluation *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_evaluationType == v5->_evaluationType
        && [(NSString *)self->_password isEqual:v5->_password]
        && [(NSArray *)self->_patternMatches isEqualToArray:v5->_patternMatches]
        && self->_guessesRequired == v5->_guessesRequired;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t evaluationType = self->_evaluationType;
  NSUInteger v4 = [(NSString *)self->_password hash] ^ evaluationType;
  return v4 ^ [(NSArray *)self->_patternMatches hash] ^ (unint64_t)self->_guessesRequired;
}

- (unint64_t)strength
{
  int64_t evaluationType = self->_evaluationType;
  if (evaluationType == 1)
  {
    double guessesRequired = self->_guessesRequired;
    double v5 = 1000.0;
  }
  else
  {
    if (evaluationType) {
      return 3;
    }
    double guessesRequired = self->_guessesRequired;
    if (guessesRequired < 1000000.0) {
      return 0;
    }
    double v5 = 99999999.0;
  }
  if (guessesRequired < v5) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)userShouldBeShownPassiveWarning
{
  return [(WBSPasswordEvaluation *)self strength] < 2;
}

- (BOOL)userShouldBeShownActiveWarning
{
  return [(WBSPasswordEvaluation *)self strength] == 0;
}

- (double)guessesRequired
{
  double result = 0.0;
  if (self->_evaluationType != 2) {
    return self->_guessesRequired;
  }
  return result;
}

- (NSDictionary)dictionaryRepresentation
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"evaluationType";
  v3 = [NSNumber numberWithInteger:self->_evaluationType];
  password = self->_password;
  patternMatches = self->_patternMatches;
  v11[0] = v3;
  v11[1] = password;
  v10[1] = @"password";
  v10[2] = @"patternMatches";
  BOOL v6 = [(NSArray *)patternMatches safari_mapObjectsUsingBlock:&__block_literal_global_19_1];
  v11[2] = v6;
  v10[3] = @"guessesRequired";
  v7 = [NSNumber numberWithDouble:self->_guessesRequired];
  v11[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return (NSDictionary *)v8;
}

uint64_t __49__WBSPasswordEvaluation_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (unint64_t)_userFeedbackLengthScoreForPatternMatch:(id)a3
{
  id v3 = a3;
  char v4 = [v3 type] == 3;
  [v3 range];
  uint64_t v6 = v5;

  return v6 << v4;
}

- (WBSPasswordPatternMatch)bestPatternMatchForUserFeedback
{
  id v3 = [(NSArray *)self->_patternMatches safari_filterObjectsUsingBlock:&__block_literal_global_22_1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke_2;
  v6[3] = &unk_1E615C2E8;
  v6[4] = self;
  char v4 = objc_msgSend(v3, "safari_reduceObjectsUsingBlock:", v6);

  return (WBSPasswordPatternMatch *)v4;
}

BOOL __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 type];
  if (v3)
  {
    if (v3 == 4)
    {
      [v2 range];
      BOOL v8 = v9 > 2;
    }
    else if (v3 == 3)
    {
      char v4 = [v2 userInfo];
      uint64_t v5 = objc_msgSend(v4, "safari_numberForKey:", @"WordListGuessesRequired");
      [v5 doubleValue];
      double v7 = v6;

      BOOL v8 = v7 <= 100000.0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v5;
  if (v6)
  {
    unint64_t v8 = [*(id *)(a1 + 32) _userFeedbackLengthScoreForPatternMatch:v5];
    unint64_t v9 = [*(id *)(a1 + 32) _userFeedbackLengthScoreForPatternMatch:v6];
    double v7 = v5;
    if (v8 <= v9)
    {
      double v7 = v6;
      if (v9 <= v8)
      {
        [v5 guessesRequired];
        double v11 = v10;
        [v6 guessesRequired];
        if (v11 >= v12) {
          double v7 = v6;
        }
        else {
          double v7 = v5;
        }
      }
    }
  }
  id v13 = v7;

  return v13;
}

- (id)_bestPatternMatchOfType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v4 = self->_patternMatches;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v16) == a3)
        {
          if (!v7 || ([v7 guessesRequired], double v12 = v11, objc_msgSend(v10, "guessesRequired"), v12 > v13))
          {
            id v14 = v10;

            double v7 = v14;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowUserFeedbackStringsForWordListPatternMatch:(id)a3
{
  uint64_t v3 = [a3 userInfo];
  char v4 = objc_msgSend(v3, "safari_numberForKey:", @"WordListGuessesRequired");
  [v4 doubleValue];
  double v6 = v5;

  return v6 <= 100000.0;
}

- (id)_passwordFeedbackStringWithPasswordVisibility:(unint64_t)a3
{
  double v5 = [(WBSPasswordEvaluation *)self bestPatternMatchForUserFeedback];
  double v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if ([v5 type] != 3
    || ![(WBSPasswordEvaluation *)self _shouldShowUserFeedbackStringsForWordListPatternMatch:v6])
  {
    goto LABEL_39;
  }
  double v7 = [v6 userInfo];
  uint64_t v8 = v7;
  if (a3 == 2)
  {
    uint64_t v9 = 1;
  }
  else if (a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend(v7, "safari_BOOLForKey:", @"IsSensitive");
  }
  double v10 = objc_msgSend(v8, "safari_stringForKey:", @"WordListIdentifier");
  double v11 = objc_msgSend(v8, "safari_stringForKey:", @"FirstSubstitutedCharacter");
  uint64_t v12 = objc_msgSend(v8, "safari_stringForKey:", @"FirstSubstitutionCharacter");
  double v13 = (void *)v12;
  if (!v11 || !v12) {
    goto LABEL_16;
  }
  if (![v10 isEqualToString:@"EnglishLexicon"])
  {
    if ([v10 isEqualToString:@"CommonPasswords"])
    {
      id v14 = @"This password is based on a common password, which makes it easy to guess.";
      goto LABEL_33;
    }
LABEL_16:
    if ([v10 isEqualToString:@"EnglishLexicon"])
    {
      [v6 range];
      if (v15 == [(NSString *)self->_password length]
        && ([v8 objectForKeyedSubscript:@"SubstitutionVariations"],
            long long v16 = objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        if (v9)
        {
          id v14 = @"This password is a common word, which makes it easy to guess.";
          goto LABEL_33;
        }
        objc_super v20 = NSString;
        uint64_t v21 = @"This password is a common word, “%@”, which makes it easy to guess.";
      }
      else
      {
        if (v9)
        {
          id v14 = @"This password contains a common word, which makes it easy to guess.";
          goto LABEL_33;
        }
        objc_super v20 = NSString;
        uint64_t v21 = @"This password contains a common word, “%@”, which makes it easy to guess.";
      }
    }
    else
    {
      if (![v10 isEqualToString:@"CommonPasswords"])
      {
        int v19 = 1;
        goto LABEL_38;
      }
      [v6 range];
      if (v17 == [(NSString *)self->_password length]
        && ([v8 objectForKeyedSubscript:@"SubstitutionVariations"],
            long long v18 = objc_claimAutoreleasedReturnValue(),
            v18,
            !v18))
      {
        if (v9)
        {
          id v14 = @"Many people use this password, which makes it easy to guess.";
          goto LABEL_33;
        }
        objc_super v20 = NSString;
        uint64_t v21 = @"Many people use the password “%@”, which makes it easy to guess.";
      }
      else
      {
        if (v9)
        {
          id v14 = @"This password contains a common password, which makes it easy to guess.";
          goto LABEL_33;
        }
        objc_super v20 = NSString;
        uint64_t v21 = @"This password contains a common password, “%@”, which makes it easy to guess.";
      }
    }
    v22 = _WBSLocalizedString(v21, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v23 = [v6 matchedSubstring];
    uint64_t v9 = objc_msgSend(v20, "stringWithFormat:", v22, v23);

    goto LABEL_37;
  }
  id v14 = @"This password is based on a common word, which makes it easy to guess.";
LABEL_33:
  uint64_t v9 = _WBSLocalizedString(v14, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
LABEL_37:
  int v19 = 0;
LABEL_38:

  if (!v19) {
    goto LABEL_45;
  }
LABEL_39:
  if ([v6 type] != 2)
  {
    if ([v6 type] == 1)
    {
      v24 = NSString;
      v25 = @"This password uses a pattern found on a keyboard, “%@”, which makes it easy to guess.";
      goto LABEL_43;
    }
    if ([v6 type] == 4)
    {
      v29 = NSString;
      v26 = _WBSLocalizedString(@"This password repeats part of the password, which makes it easy to guess.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      uint64_t v9 = [v29 stringWithFormat:v26];
      goto LABEL_44;
    }
LABEL_7:
    uint64_t v9 = _WBSLocalizedString(@"This password is easy to guess.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    goto LABEL_45;
  }
  v24 = NSString;
  v25 = @"This password uses a sequence, “%@”, which makes it easy to guess.";
LABEL_43:
  v26 = _WBSLocalizedString(v25, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v27 = [v6 matchedSubstring];
  uint64_t v9 = objc_msgSend(v24, "stringWithFormat:", v26, v27);

LABEL_44:
LABEL_45:

  return (id)v9;
}

- (id)userFeedbackStringWithPasswordVisibility:(unint64_t)a3
{
  if ([(WBSPasswordEvaluation *)self userShouldBeShownPassiveWarning])
  {
    if (self->_evaluationType) {
      _WBSLocalizedString(@"This password is easy to guess.", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    }
    else {
    double v5 = [(WBSPasswordEvaluation *)self _passwordFeedbackStringWithPasswordVisibility:a3];
    }
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)compactDescriptionWithPasswordColumnWidth:(unint64_t)a3 includePatternMatches:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v8 = [(WBSPasswordEvaluation *)self strength];
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = off_1E615C308[v8];
  }
  double v10 = [NSString stringWithFormat:@"%-*s | %12lg | %@", a3, -[NSString UTF8String](self->_password, "UTF8String"), *(void *)&self->_guessesRequired, v9];
  [v7 addObject:v10];

  if (v4)
  {
    [v7 addObject:&stru_1F105D3F0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v11 = self->_patternMatches;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) compactDescriptionWithMatchedStringColumnWidth:a3];
          [v7 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  uint64_t v17 = [v7 componentsJoinedByString:@"\n"];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPasswordEvaluation *)self dictionaryRepresentation];
  [v4 encodeObject:v5];
}

- (WBSPasswordEvaluation)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObject];
  id v5 = [(WBSPasswordEvaluation *)self initWithDictionaryRepresentation:v4];

  return v5;
}

- (NSString)password
{
  return self->_password;
}

- (NSArray)patternMatches
{
  return self->_patternMatches;
}

- (int64_t)evaluationType
{
  return self->_evaluationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternMatches, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end