@interface WBSPasswordGenerationManager
+ (BOOL)passwordLooksLikePasswordManagerGeneratedMoreTypablePassword:(id)a3;
+ (BOOL)passwordLooksLikePasswordManagerGeneratedPassword:(id)a3;
+ (id)requirementsForPasswordRuleSet:(id)a3 respectingMinLength:(id)a4 maxLength:(id)a5;
+ (unint64_t)minimumPasswordLength;
- (BOOL)_tokensContainUnwantedWords:(id)a3;
- (BOOL)manualPasswordGenerationIsDisallowedByRequirements:(id)a3;
- (BOOL)passwordGenerationIsDisallowedByRequirements:(id)a3;
- (NSDictionary)passwordRequirementsByDomain;
- (WBSPasswordGenerationManager)init;
- (WBSPasswordGenerationManager)initWithPasswordRequirementsByDomain:(id)a3;
- (id)_generated15CharacterAlphanumericPasswordRejectingUnwantedWords:(BOOL)a3;
- (id)_generatedPasswordMatchingRequirements:(id)a3 rejectUnwantedWords:(BOOL)a4;
- (id)_moreTypeablePassword;
- (id)defaultRequirementsForDomain:(id)a3;
- (id)defaultRequirementsForURL:(id)a3;
- (id)generated15CharacterAlphanumericPassword;
- (id)generatedPasswordMatchingRequirements:(id)a3;
- (id)protectionSpaceForGeneratedPasswordsInProtectionSpace:(id)a3;
- (id)updatedRequirements:(id)a3 respectingMaxLength:(unint64_t)a4;
- (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)setPasswordRequirementsByDomain:(id)a3;
@end

@implementation WBSPasswordGenerationManager

+ (id)requirementsForPasswordRuleSet:(id)a3 respectingMinLength:(id)a4 maxLength:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a4;
  id v8 = a5;
  id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v8)
  {
    if (v7) {
      goto LABEL_6;
    }
LABEL_5:
    v10 = objc_msgSend(v25, "minLengthRule", v25);
    id v7 = [v10 value];

    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v9 = [v25 maxLengthRule];
  id v8 = [v9 value];

  if (!v7) {
    goto LABEL_5;
  }
LABEL_6:
  if (!v8)
  {
    if ((unint64_t)[v7 unsignedIntegerValue] > 0x13)
    {
      id v8 = v7;
      goto LABEL_12;
    }
    id v8 = [NSNumber numberWithUnsignedInteger:20];
  }
LABEL_9:
  if (v8) {
LABEL_12:
  }
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, @"PasswordMaxLength", v25);
  if (v7) {
    [v27 setObject:v7 forKeyedSubscript:@"PasswordMinLength"];
  }
  v11 = objc_msgSend(v25, "allowedRule", v25);
  v12 = [v11 value];
  v13 = appendedCanonicalizedCharactersFromCharacterClasses(v12);

  if ([v13 length])
  {
    [v27 setObject:v13 forKeyedSubscript:@"PasswordAllowedCharacters"];
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = [v26 requiredRules];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = [*(id *)(*((void *)&v28 + 1) + 8 * i) value];
          v20 = appendedCanonicalizedCharactersFromCharacterClasses(v19);

          if ([v20 length]) {
            [v14 addObject:v20];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v27 setObject:v14 forKeyedSubscript:@"PasswordRequiredCharacters"];
    v21 = [v26 maxConsecutiveRule];
    v22 = [v21 value];

    if (v22) {
      [v27 setObject:v22 forKeyedSubscript:@"PasswordConsecutiveCharacterLimit"];
    }

    v23 = 0;
  }
  else
  {
    v23 = v27;
    id v27 = 0;
  }

  return v27;
}

- (WBSPasswordGenerationManager)init
{
  return 0;
}

+ (unint64_t)minimumPasswordLength
{
  return 5;
}

- (WBSPasswordGenerationManager)initWithPasswordRequirementsByDomain:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSPasswordGenerationManager;
  v5 = [(WBSPasswordGenerationManager *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    passwordRequirementsByDomain = v5->_passwordRequirementsByDomain;
    v5->_passwordRequirementsByDomain = (NSDictionary *)v6;

    id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    v9 = [v8 localeIdentifier];

    int v10 = [(__CFString *)v9 hasPrefix:@"en"];
    char v11 = v10;
    if (v10) {
      v12 = v9;
    }
    else {
      v12 = @"en";
    }
    v13 = v12;
    v5->_lexiconForEnglish = (_LXLexicon *)createLexiconWithLocale(v13);
    if ((v11 & 1) == 0) {
      v5->_lexiconForUserLocale = (_LXLexicon *)createLexiconWithLocale(&v9->isa);
    }
    v14 = v5;
  }
  return v5;
}

- (void)dealloc
{
  lexiconForEnglish = self->_lexiconForEnglish;
  if (lexiconForEnglish) {
    CFRelease(lexiconForEnglish);
  }
  lexiconForUserLocale = self->_lexiconForUserLocale;
  if (lexiconForUserLocale) {
    CFRelease(lexiconForUserLocale);
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSPasswordGenerationManager;
  [(WBSPasswordGenerationManager *)&v5 dealloc];
}

+ (BOOL)passwordLooksLikePasswordManagerGeneratedPassword:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    BOOL v4 = passwordMatchesFormatOfGenerationStyle(v3, 2) || passwordMatchesFormatOfGenerationStyle(v3, 0);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)passwordLooksLikePasswordManagerGeneratedMoreTypablePassword:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    BOOL v4 = passwordMatchesFormatOfGenerationStyle(v3, 2);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)updatedRequirements:(id)a3 respectingMaxLength:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4
    && (objc_msgSend(v5, "safari_numberForKey:", @"PasswordMaxLength"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 unsignedIntegerValue],
        v7,
        v8 - 1 >= a4))
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    int v10 = [NSNumber numberWithUnsignedInteger:a4];
    [v9 setObject:v10 forKey:@"PasswordMaxLength"];
  }
  else
  {
    v9 = v6;
  }
  return v9;
}

- (id)_moreTypeablePassword
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  id v3 = randomSyllable();
  BOOL v4 = randomSyllable();
  id v5 = randomSyllable();
  uint64_t v6 = randomSyllable();
  id v7 = randomSyllable();
  unsigned int v8 = randomConsonant();
  v9 = [v2 stringWithFormat:@"%@%@%@%@%@%C%C", v3, v4, v5, v6, v7, v8, randomVowel()];

  uint32_t v10 = [v9 length];
  while (1)
  {
    do
    {
      uint64_t v11 = arc4random_uniform(v10);
      __darwin_ct_rune_t v12 = [v9 characterAtIndex:v11];
    }
    while (v12 == 111);
    __int16 v32 = 0;
    __int16 v32 = __toupper(v12);
    v13 = [NSString stringWithCharacters:&v32 length:1];
    objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, 1, v13);

    uint32_t v14 = arc4random_uniform(5u);
    v15 = objc_msgSend(v9, "substringWithRange:", 0, 6);
    objc_super v16 = objc_msgSend(v9, "substringWithRange:", 6, 6);
    uint64_t v17 = objc_msgSend(v9, "substringWithRange:", 12, 5);
    v18 = v17;
    if (!(!v20 & v19)) {
      break;
    }
  }
  switch(v14)
  {
    case 0u:
      v21 = NSString;
      unsigned int v22 = randomNumber();
      v23 = v18;
      v24 = v15;
      goto LABEL_9;
    case 1u:
      v21 = NSString;
      unsigned int v22 = randomNumber();
      v23 = v15;
      v24 = v18;
LABEL_9:
      uint64_t v25 = [v21 stringWithFormat:@"%@%C%@%@", v23, v22, v24, v16];
      break;
    case 2u:
      v26 = NSString;
      unsigned int v27 = randomNumber();
      long long v28 = v18;
      long long v29 = v16;
      goto LABEL_12;
    case 3u:
      v26 = NSString;
      unsigned int v27 = randomNumber();
      long long v28 = v16;
      long long v29 = v18;
LABEL_12:
      uint64_t v25 = [v26 stringWithFormat:@"%@%@%C%@", v15, v28, v27, v29];
      break;
    case 4u:
      uint64_t v25 = [NSString stringWithFormat:@"%@%@%@%C", v15, v16, v17, randomNumber()];
      break;
    default:
      JUMPOUT(0);
  }
  long long v30 = (void *)v25;

  return v30;
}

- (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v5 = v6;
  LXLexiconEnumerateEntriesForString();
}

uint64_t __85__WBSPasswordGenerationManager__lexiconEnumerateEntries_forString_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = LXEntryCopyString();
  uint64_t MetaFlags = LXEntryGetMetaFlags();
  uint64_t CategoryFlags = LXEntryGetCategoryFlags();
  unsigned int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v8(v4, v5, MetaFlags, CategoryFlags, a3);
}

- (BOOL)_tokensContainUnwantedWords:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v19 = 0;
    char v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __60__WBSPasswordGenerationManager__tokensContainUnwantedWords___block_invoke;
          aBlock[3] = &unk_1E615C358;
          aBlock[4] = v8;
          aBlock[5] = &v19;
          v9 = _Block_copy(aBlock);
          [(WBSPasswordGenerationManager *)self _lexiconEnumerateEntries:self->_lexiconForEnglish forString:v8 completionHandler:v9];
          if (*((unsigned char *)v20 + 24)
            || (lexiconForUserLocale = self->_lexiconForUserLocale) != 0
            && ([(WBSPasswordGenerationManager *)self _lexiconEnumerateEntries:lexiconForUserLocale forString:v8 completionHandler:v9], *((unsigned char *)v20 + 24)))
          {

            BOOL v11 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v23 count:16];
        BOOL v11 = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
LABEL_16:

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __60__WBSPasswordGenerationManager__tokensContainUnwantedWords___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "safari_isCaseAndDiacriticInsensitiveEqualToString:", a2);
  if (result)
  {
    if ((a3 & 0x3800000) != 0 || (*(void *)&a4 & 0x3FD00) != 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    *a5 = 1;
  }
  return result;
}

- (id)generatedPasswordMatchingRequirements:(id)a3
{
  id v3 = [(WBSPasswordGenerationManager *)self _generatedPasswordMatchingRequirements:a3 rejectUnwantedWords:1];
  return v3;
}

- (id)_generatedPasswordMatchingRequirements:(id)a3 rejectUnwantedWords:(BOOL)a4
{
  BOOL v115 = a4;
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v122 = a3;
  id v4 = objc_msgSend(v122, "safari_numberForKey:", @"PasswordMinLength");
  unint64_t v120 = [v4 unsignedIntegerValue];

  uint64_t v5 = objc_msgSend(v122, "safari_numberForKey:", @"PasswordMaxLength");
  unint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v116 = v6;
  if (v120 > v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:](v7);
    }
    unint64_t v120 = 0;
  }
  uint64_t v8 = objc_msgSend(v122, "safari_stringForKey:", @"PasswordAllowedCharacters");
  v126 = v8;
  objc_msgSend(v122, "safari_arrayForKey:", @"PasswordRequiredCharacters");
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  v119 = v9;
  if (v9)
  {
    v123 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    uint32_t v10 = v119;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v128 objects:__p count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v129;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v129 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v128 + 1) + 8 * i);
          id v15 = v8;
          long long v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v14];
          BOOL v17 = [v15 rangeOfCharacterFromSet:v16] == 0x7FFFFFFFFFFFFFFFLL;

          if (!v17)
          {
            long long v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v14];
            [v123 addObject:v18];
          }
          uint64_t v8 = v126;
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v128 objects:__p count:16];
      }
      while (v11);
    }

    uint64_t v19 = v123;
    uint64_t v8 = v126;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v127 = v8;
  id v124 = v19;
  unint64_t v20 = v6 - 1;
  if (v6 - 1 >= 0x13
    && v120 <= 0x14
    && (!v127
     || (-[__CFString safari_containsAllCharactersInString:](v127, "safari_containsAllCharactersInString:", @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789") & 1) != 0)&& (unint64_t)[v124 count] <= 0x14)
  {
    long long v140 = 0u;
    long long v141 = 0u;
    *(_OWORD *)v138 = 0u;
    long long v139 = 0u;
    id obj = v124;
    uint64_t v98 = [obj countByEnumeratingWithState:v138 objects:&v142 count:16];
    if (v98)
    {
      unsigned __int8 v99 = 0;
      unsigned __int8 v100 = 0;
      uint64_t v113 = *(void *)v139;
      while (2)
      {
        for (uint64_t j = 0; j != v98; ++j)
        {
          if (*(void *)v139 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v102 = *((void *)v138[1] + j);
          uint64_t v103 = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" rangeOfCharacterFromSet:v102];
          if (((v103 != 0x7FFFFFFFFFFFFFFFLL) & v100) != 0
            || (uint64_t v104 = [@"0123456789" rangeOfCharacterFromSet:v102],
                BOOL v105 = v104 != 0x7FFFFFFFFFFFFFFFLL,
                ((v104 != 0x7FFFFFFFFFFFFFFFLL) & v99) != 0)
            || (v103 == 0x7FFFFFFFFFFFFFFFLL ? (BOOL v106 = v104 == 0x7FFFFFFFFFFFFFFFLL) : (BOOL v106 = 0),
                v106
             && [@"abcdefghijkmnopqrstuvwxyz-" rangeOfCharacterFromSet:v102] == 0x7FFFFFFFFFFFFFFFLL))
          {

            goto LABEL_23;
          }
          v100 |= v103 != 0x7FFFFFFFFFFFFFFFLL;
          v99 |= v105;
        }
        uint64_t v98 = [obj countByEnumeratingWithState:v138 objects:&v142 count:16];
        if (v98) {
          continue;
        }
        break;
      }
    }

    if (v127)
    {
      if ([(__CFString *)v127 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v107 = 3;
      }
      else {
        uint64_t v107 = 2;
      }
    }
    else
    {
LABEL_182:
      uint64_t v107 = 2;
    }
    v138[0] = @"PasswordGenerationStyle";
    v35 = [NSNumber numberWithInteger:v107];
    v142 = v35;
    v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:v138 count:1];
    goto LABEL_58;
  }

LABEL_23:
  uint64_t v21 = 12;
  if (v120 <= 0xF)
  {
    BOOL v22 = v20 < 0xE;
  }
  else
  {
    uint64_t v21 = v120;
    BOOL v22 = 1;
  }
  if (v20 >= 0xE) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = v116;
  }
  if (v127)
  {
    if ([(__CFString *)v127 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL || v22) {
      goto LABEL_32;
    }
  }
  else
  {
    v127 = @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789";
    if (v22)
    {
LABEL_32:
      uint64_t v24 = 15;
      if (v120 > 0xF) {
        uint64_t v24 = v120;
      }
      if (v20 >= 0xE) {
        unint64_t v23 = v24;
      }
      else {
        unint64_t v23 = v116;
      }
      uint64_t v25 = 1;
      goto LABEL_40;
    }
  }
  uint64_t v26 = [(__CFString *)v127 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F105D3F0];

  uint64_t v25 = 0;
  v127 = (__CFString *)v26;
LABEL_40:
  id v27 = v124;
  if (!v124)
  {
    {
      v108 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
      v142 = v108;
      v109 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
      v143 = v109;
      v110 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      v144 = v110;
      defaultRequiredCharacterSets(void)::requiredCharacterSets = [MEMORY[0x1E4F1C978] arrayWithObjects:&v142 count:3];
    }
    id v27 = (id)defaultRequiredCharacterSets(void)::requiredCharacterSets;
  }
  if ([v27 count] > v23)
  {

    long long v28 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:](v28);
    }
    id v27 = 0;
  }
  long long v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v119, "count"));
  long long v140 = 0u;
  long long v141 = 0u;
  *(_OWORD *)v138 = 0u;
  long long v139 = 0u;
  id v30 = v27;
  uint64_t v31 = [v30 countByEnumeratingWithState:v138 objects:&v142 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v139;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v139 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = *((void *)v138[1] + k);
        if ([(__CFString *)v127 rangeOfCharacterFromSet:v34] != 0x7FFFFFFFFFFFFFFFLL) {
          [v29 addObject:v34];
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:v138 objects:&v142 count:16];
    }
    while (v31);
  }

  v35 = v29;
  v132[0] = @"PasswordGenerationStyle";
  v36 = [NSNumber numberWithInteger:v25];
  v133[0] = v36;
  v132[1] = @"NumberOfRequiredRandomCharacters";
  v37 = [NSNumber numberWithUnsignedInteger:v23];
  v133[1] = v37;
  v133[2] = v127;
  v132[2] = @"AllowedCharacters";
  v132[3] = @"RequiredCharacterSets";
  v133[3] = v35;
  v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:4];

  id obj = v35;
LABEL_58:

  v38 = objc_msgSend(v117, "safari_numberForKey:", @"PasswordGenerationStyle");
  unint64_t v39 = [v38 unsignedIntegerValue];

  v40 = objc_msgSend(v117, "safari_numberForKey:", @"NumberOfRequiredRandomCharacters");
  v119 = (char *)[v40 unsignedIntegerValue];

  std::vector<unsigned short>::vector(v138, (uint64_t)v119);
  objc_msgSend(v117, "safari_stringForKey:", @"AllowedCharacters");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v122, "safari_numberForKey:", @"PasswordRepeatedCharacterLimit");
  BOOL v125 = v112 != 0;
  uint64_t v111 = 0;
  while (1)
  {
    if (v39 < 2)
    {
      objc_msgSend(v122, "safari_stringForKey:", @"PasswordFirstCharacterCandidates");
      v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v119 && [(__CFString *)v127 length])
      {
        id v45 = obj;
        v46 = v127;
        v47 = operator new(2uLL);
        _WORD *v47 = 0;
        v143 = v47 + 1;
        v144 = v47 + 1;
        v142 = v47;
        std::vector<unsigned short>::vector(__p, (uint64_t)(v119 - 1));
        getPasswordRandomCharacters((uint64_t *)&v142, v46);
        getPasswordRandomCharacters((uint64_t *)__p, v45);
        v48 = (char *)v138[0];
        int64_t v49 = (char *)v138[1] - (char *)v138[0];
        if (v138[1] == v138[0]) {
          goto LABEL_181;
        }
        *(_WORD *)v138[0] = *v47;
        v50 = __p[0];
        if ((unint64_t)v119 >= 2)
        {
          unint64_t v51 = v49 >> 1;
          int64_t v52 = ((char *)__p[1] - (char *)__p[0]) >> 1;
          if (v51 <= 1) {
            unint64_t v51 = 1;
          }
          v53 = v48 + 2;
          unint64_t v54 = v51 - 1;
          v55 = (__int16 *)__p[0];
          v56 = v119 - 1;
          while (v52 && v54)
          {
            __int16 v57 = *v55++;
            *v53++ = v57;
            --v54;
            --v52;
            if (!--v56) {
              goto LABEL_93;
            }
          }
LABEL_181:
          __break(1u);
          goto LABEL_182;
        }
        if (__p[0])
        {
LABEL_93:
          __p[1] = v50;
          operator delete(v50);
        }
        operator delete(v47);
      }
      else
      {
        getPasswordRandomCharacters((uint64_t *)v138, obj);
      }
      if (v39)
      {
        uint64_t v63 = [NSString stringWithCharacters:v138[0] length:v119];
      }
      else
      {
        id v64 = [NSString alloc];
        if (v138[1] == v138[0] || (void *)((char *)v138[1] - (char *)v138[0]) <= (void *)0x16) {
          goto LABEL_181;
        }
        uint64_t v63 = objc_msgSend(v64, "initWithFormat:", @"%C%C%C-%C%C%C-%C%C%C-%C%C%C", *(unsigned __int16 *)v138[0], *((unsigned __int16 *)v138[0] + 1), *((unsigned __int16 *)v138[0] + 2), *((unsigned __int16 *)v138[0] + 3), *((unsigned __int16 *)v138[0] + 4), *((unsigned __int16 *)v138[0] + 5), *((unsigned __int16 *)v138[0] + 6), *((unsigned __int16 *)v138[0] + 7), *((unsigned __int16 *)v138[0] + 8), *((unsigned __int16 *)v138[0] + 9), *((unsigned __int16 *)v138[0] + 10), *((unsigned __int16 *)v138[0] + 11));
      }
      v65 = (void *)v63;
      v66 = objc_msgSend(v117, "safari_arrayForKey:", @"RequiredCharacterSets");
      id v42 = v65;
      id v67 = v66;
      *(_OWORD *)__p = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v68 = v67;
      uint64_t v69 = [v68 countByEnumeratingWithState:__p objects:&v142 count:16];
      v70 = v42;
      if (v69)
      {
        uint64_t v71 = *(void *)v135;
        v70 = v42;
        do
        {
          uint64_t v72 = 0;
          v73 = v70;
          do
          {
            if (*(void *)v135 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v75 = [v73 rangeOfCharacterFromSet:*((void *)__p[1] + v72)];
            if (v75 == 0x7FFFFFFFFFFFFFFFLL)
            {

              goto LABEL_154;
            }
            v70 = objc_msgSend(v73, "stringByReplacingCharactersInRange:withString:", v75, v74, &stru_1F105D3F0);

            ++v72;
            v73 = v70;
          }
          while (v69 != v72);
          uint64_t v69 = [v68 countByEnumeratingWithState:__p objects:&v142 count:16];
        }
        while (v69);
      }

      if (v115)
      {
        v76 = tokenizedPassword(v42, v39);
        BOOL v77 = [(WBSPasswordGenerationManager *)self _tokensContainUnwantedWords:v76];

        if (v77) {
          goto LABEL_154;
        }
      }

      goto LABEL_111;
    }
    if (v39 - 2 >= 2)
    {
      id v42 = 0;
LABEL_111:
      if (!v125)
      {
        BOOL v125 = 0;
        goto LABEL_125;
      }
      goto LABEL_112;
    }
    v41 = [(WBSPasswordGenerationManager *)self _moreTypeablePassword];
    id v42 = v41;
    if (v115)
    {
      tokenizedPassword(v41, v39);
      v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[WBSPasswordGenerationManager _tokensContainUnwantedWords:](self, "_tokensContainUnwantedWords:"))
      {
        unint64_t v43 = v111 + 1;
        if (v39 == 2) {
          uint64_t v44 = 0;
        }
        else {
          uint64_t v44 = v39;
        }
        if (v44 == 3) {
          uint64_t v44 = 1;
        }
        ++v111;
        if (v43 > 0x64) {
          unint64_t v39 = v44;
        }
LABEL_154:

        goto LABEL_155;
      }
    }
    if (v39 == 2)
    {
      v58 = NSString;
      v59 = objc_msgSend(v42, "substringWithRange:", 0, 6);
      v60 = objc_msgSend(v42, "substringWithRange:", 6, 6);
      v61 = objc_msgSend(v42, "substringWithRange:", 12, 6);
      uint64_t v62 = [v58 stringWithFormat:@"%@-%@-%@", v59, v60, v61];
    }
    else
    {
      uint64_t v62 = (uint64_t)v42;
    }
    if (!v125 || [v112 integerValue] != 1)
    {
      BOOL v125 = 0;
      id v42 = (id)v62;
      goto LABEL_125;
    }
    id v42 = (id)v62;
LABEL_112:
    uint64_t v78 = [v112 integerValue];
    if (v78 < 1) {
      break;
    }
    id v42 = v42;
    unsigned __int16 v79 = [v42 characterAtIndex:0];
    unint64_t v80 = 0;
    unint64_t v81 = 1;
    for (unint64_t m = 1; m < [v42 length]; ++m)
    {
      int v83 = [v42 characterAtIndex:m];
      unint64_t v84 = m - v80;
      if (m - v80 <= v81) {
        unint64_t v84 = v81;
      }
      if (v83 != v79)
      {
        unint64_t v81 = v84;
        unint64_t v80 = m;
      }
      unsigned __int16 v79 = v83;
    }

    BOOL v125 = 1;
    if (v81 <= v78) {
      goto LABEL_125;
    }
LABEL_155:
  }
  BOOL v125 = 1;
LABEL_125:
  objc_msgSend(v122, "safari_numberForKey:", @"PasswordConsecutiveCharacterLimit");
  v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v127) {
    goto LABEL_156;
  }
  uint64_t v85 = [(__CFString *)v127 integerValue];
  if (v85 < 1) {
    goto LABEL_156;
  }
  unint64_t v121 = v39;
  id v86 = v42;
  unint64_t v87 = 0;
  v88 = 0;
  unint64_t v89 = 1;
  unint64_t v90 = 1;
  while (2)
  {
    if (v90 < [v86 length])
    {
      int v91 = [v86 characterAtIndex:v90];
      int v92 = [v86 characterAtIndex:v90 - 1];
      int v93 = v92;
      if (v88)
      {
        if ([v88 BOOLValue] && v93 + 1 == v91) {
          goto LABEL_148;
        }
        char v94 = [v88 BOOLValue];
        char v95 = v93 - 1 == v91 ? v94 : 1;
        if ((v95 & 1) == 0) {
          goto LABEL_148;
        }
        if (v93 + 1 == v91)
        {
          unint64_t v87 = v90 - 1;
          goto LABEL_139;
        }
        if (v93 - 1 == v91)
        {
          unint64_t v87 = v90 - 1;
LABEL_144:
          v88 = (void *)MEMORY[0x1E4F1CC28];
LABEL_148:
          ++v90;
          continue;
        }
      }
      else
      {
        if (v92 + 1 == v91)
        {
LABEL_139:
          v88 = (void *)MEMORY[0x1E4F1CC38];
          goto LABEL_148;
        }
        if (v92 - 1 == v91) {
          goto LABEL_144;
        }
      }
      v88 = 0;
      if (v90 - v87 > v89) {
        unint64_t v89 = v90 - v87;
      }
      unint64_t v87 = v90;
      goto LABEL_148;
    }
    break;
  }
  if (v88)
  {
    uint64_t v96 = [v86 length];
    if (v96 - v87 > v89) {
      unint64_t v89 = v96 - v87;
    }
  }

  unint64_t v39 = v121;
  if (v89 > v85)
  {
    id v42 = v86;
    goto LABEL_154;
  }
LABEL_156:

  if (v138[0])
  {
    v138[1] = v138[0];
    operator delete(v138[0]);
  }

  return v42;
}

- (id)generated15CharacterAlphanumericPassword
{
  return [(WBSPasswordGenerationManager *)self _generated15CharacterAlphanumericPasswordRejectingUnwantedWords:1];
}

- (id)_generated15CharacterAlphanumericPasswordRejectingUnwantedWords:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"PasswordAllowedCharacters";
  v10[0] = @"abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  unint64_t v6 = [(WBSPasswordGenerationManager *)self updatedRequirements:v5 respectingMaxLength:15];

  id v7 = [(WBSPasswordGenerationManager *)self _generatedPasswordMatchingRequirements:v6 rejectUnwantedWords:v3];

  return v7;
}

- (id)defaultRequirementsForDomain:(id)a3
{
  id v4 = objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  uint64_t v5 = [(NSDictionary *)self->_passwordRequirementsByDomain safari_dictionaryForKey:v4];
  if (!v5)
  {
    unint64_t v6 = objc_msgSend(v4, "safari_highLevelDomainFromHost");
    if (v6)
    {
      uint64_t v5 = [(NSDictionary *)self->_passwordRequirementsByDomain safari_dictionaryForKey:v6];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)defaultRequirementsForURL:(id)a3
{
  id v4 = [a3 host];
  if (v4)
  {
    uint64_t v5 = [(WBSPasswordGenerationManager *)self defaultRequirementsForDomain:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)protectionSpaceForGeneratedPasswordsInProtectionSpace:(id)a3
{
  BOOL v3 = objc_msgSend(a3, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  return v3;
}

- (BOOL)manualPasswordGenerationIsDisallowedByRequirements:(id)a3
{
  id v3 = a3;
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::once != -1) {
    dispatch_once(&ignorePasswordGenerationIsDisallowedByRequirements(void)::once, &__block_literal_global_163);
  }
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements) {
    char v4 = 0;
  }
  else {
    char v4 = objc_msgSend(v3, "safari_BOOLForKey:", @"ManualPasswordGenerationDisallowed");
  }

  return v4;
}

- (BOOL)passwordGenerationIsDisallowedByRequirements:(id)a3
{
  id v4 = a3;
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::once != -1) {
    dispatch_once(&ignorePasswordGenerationIsDisallowedByRequirements(void)::once, &__block_literal_global_163);
  }
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements)
  {
    char v5 = 0;
  }
  else if ([(WBSPasswordGenerationManager *)self manualPasswordGenerationIsDisallowedByRequirements:v4])
  {
    char v5 = 1;
  }
  else
  {
    char v5 = objc_msgSend(v4, "safari_BOOLForKey:", @"PasswordGenerationDisallowed");
  }

  return v5;
}

- (NSDictionary)passwordRequirementsByDomain
{
  return self->_passwordRequirementsByDomain;
}

- (void)setPasswordRequirementsByDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_generatedPasswordMatchingRequirements:(os_log_t)log rejectUnwantedWords:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Invalid password generation requirement: more character sets from each of which the password needs to contain at least one symbol than total required random characters in the password. Ignore the character sets.", v1, 2u);
}

- (void)_generatedPasswordMatchingRequirements:(os_log_t)log rejectUnwantedWords:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Invalid password generation requirement: min password length > max password length. Ignore min password length value.", v1, 2u);
}

@end