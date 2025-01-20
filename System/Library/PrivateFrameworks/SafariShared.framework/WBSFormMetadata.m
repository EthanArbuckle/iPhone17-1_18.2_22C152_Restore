@interface WBSFormMetadata
+ (BOOL)supportsSecureCoding;
+ (id)formMetadataFromSerializedData:(id)a3;
- (BOOL)allowsAutocomplete;
- (BOOL)containsActiveElement;
- (BOOL)containsAtLeastOneSecureTextField;
- (BOOL)containsClassifications;
- (BOOL)isBestForPageLevelAutoFill;
- (BOOL)isBestForStreamlinedLogin;
- (BOOL)isEligibleForAutomaticLogin;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSearchForm;
- (BOOL)isVisible;
- (BOOL)usesGeneratedPassword;
- (BOOL)usesRelAsync;
- (NSArray)controls;
- (NSData)serializedData;
- (NSDictionary)annotations;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)passwordRequirements;
- (NSString)confirmPasswordElementUniqueID;
- (NSString)firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
- (NSString)logicalFormElementSelector;
- (NSString)oldPasswordElementUniqueID;
- (NSString)passwordElementUniqueID;
- (NSString)passwordFieldValue;
- (NSString)textSample;
- (NSString)userNameElementUniqueID;
- (NSString)userNameFieldValue;
- (NSURL)action;
- (WBSFormMetadata)initWithCoder:(id)a3;
- (WBSFormMetadata)initWithJSValue:(id)a3;
- (id)_init;
- (id)_valueOfControlWithUniqueID:(id)a3;
- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3 withKnownSensitiveValues:(id)a4;
- (id)formMetadataByReplacingControlsWith:(id)a3;
- (int64_t)uniqueID;
- (unint64_t)hash;
- (unint64_t)requestType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)serializedData;
- (void)setPasswordRequirements:(id)a3;
@end

@implementation WBSFormMetadata

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (WBSFormMetadata *)v4;
    v6 = v5;
    if (self != v5)
    {
      if (self->_uniqueID != v5->_uniqueID) {
        goto LABEL_35;
      }
      if (self->_allowsAutocomplete != v5->_allowsAutocomplete) {
        goto LABEL_35;
      }
      if (self->_type != v5->_type) {
        goto LABEL_35;
      }
      if (self->_containsActiveElement != v5->_containsActiveElement) {
        goto LABEL_35;
      }
      if (!WBSIsEqual()) {
        goto LABEL_35;
      }
      if (self->_bestForPageLevelAutoFill != v6->_bestForPageLevelAutoFill) {
        goto LABEL_35;
      }
      if (self->_bestForStreamlinedLogin != v6->_bestForStreamlinedLogin) {
        goto LABEL_35;
      }
      if (self->_eligibleForAutomaticLogin != v6->_eligibleForAutomaticLogin) {
        goto LABEL_35;
      }
      if (self->_visible != v6->_visible) {
        goto LABEL_35;
      }
      if (self->_usesRelAsync != v6->_usesRelAsync) {
        goto LABEL_35;
      }
      if (self->_usesGeneratedPassword != v6->_usesGeneratedPassword) {
        goto LABEL_35;
      }
      if (self->_requestType != v6->_requestType) {
        goto LABEL_35;
      }
      if (self->_isSearchForm != v6->_isSearchForm) {
        goto LABEL_35;
      }
      annotations = self->_annotations;
      if (annotations != v6->_annotations && !-[NSDictionary isEqualToDictionary:](annotations, "isEqualToDictionary:")) {
        goto LABEL_35;
      }
      if ((confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID,
            confirmPasswordElementUniqueID != v6->_confirmPasswordElementUniqueID)
        && !-[NSString isEqualToString:](confirmPasswordElementUniqueID, "isEqualToString:")
        || (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID,
            firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID != v6->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID)
        && !-[NSString isEqualToString:](firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, "isEqualToString:")|| (action = self->_action, action != v6->_action) && !-[NSURL isEqual:](action, "isEqual:")|| (controls = self->_controls, controls != v6->_controls)&& !-[NSArray isEqualToArray:](controls, "isEqualToArray:")|| (oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID, oldPasswordElementUniqueID != v6->_oldPasswordElementUniqueID)&& !-[NSString isEqualToString:](oldPasswordElementUniqueID, "isEqualToString:")|| (passwordElementUniqueID = self->_passwordElementUniqueID, passwordElementUniqueID != v6->_passwordElementUniqueID)&& !-[NSString isEqualToString:](passwordElementUniqueID, "isEqualToString:")|| (textSample = self->_textSample, textSample != v6->_textSample)&& !-[NSString isEqualToString:](textSample, "isEqualToString:"))
      {
LABEL_35:
        char v16 = 0;
        goto LABEL_37;
      }
      userNameElementUniqueID = self->_userNameElementUniqueID;
      if (userNameElementUniqueID != v6->_userNameElementUniqueID)
      {
        char v16 = -[NSString isEqualToString:](userNameElementUniqueID, "isEqualToString:");
LABEL_37:

        goto LABEL_38;
      }
    }
    char v16 = 1;
    goto LABEL_37;
  }
  char v16 = 0;
LABEL_38:

  return v16;
}

- (NSArray)controls
{
  return self->_controls;
}

- (unint64_t)hash
{
  return self->_uniqueID;
}

- (WBSFormMetadata)initWithJSValue:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)WBSFormMetadata;
  v5 = [(WBSFormMetadata *)&v46 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 objectForKeyedSubscript:@"DisallowsAutocomplete"];
  v5->_allowsAutocomplete = [v6 toBool] ^ 1;

  v7 = [v4 objectForKeyedSubscript:@"Annotations"];
  uint64_t v8 = [v7 toDictionary];
  annotations = v5->_annotations;
  v5->_annotations = (NSDictionary *)v8;

  v10 = [v4 objectForKeyedSubscript:@"AutoFillFormType"];
  v5->_type = (int)[v10 toInt32];

  if (v5->_type > 5) {
    goto LABEL_5;
  }
  uint64_t v11 = stringForKey(v4, @"ConfirmPasswordElementUniqueID");
  confirmPasswordElementUniqueID = v5->_confirmPasswordElementUniqueID;
  v5->_confirmPasswordElementUniqueID = (NSString *)v11;

  v13 = [v4 objectForKeyedSubscript:@"ContainsActiveElement"];
  v5->_containsActiveElement = [v13 toBool];

  uint64_t v14 = stringForKey(v4, @"FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID");
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = (NSString *)v14;

  char v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = stringForKey(v4, @"FormAction");
  uint64_t v18 = objc_msgSend(v16, "safari_URLWithDataAsString:", v17);
  action = v5->_action;
  v5->_action = (NSURL *)v18;

  v20 = [v4 objectForKeyedSubscript:@"FormControls"];
  v21 = [v20 toArray];
  uint64_t v22 = objc_msgSend(v21, "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
  controls = v5->_controls;
  v5->_controls = (NSArray *)v22;

  v24 = [v4 objectForKeyedSubscript:@"FormID"];
  [v24 toDouble];
  v5->_uniqueID = (uint64_t)v25;

  uint64_t v26 = stringForKey(v4, @"LogicalFormElementSelector");
  logicalFormElementSelector = v5->_logicalFormElementSelector;
  v5->_logicalFormElementSelector = (NSString *)v26;

  v28 = [v4 objectForKeyedSubscript:@"FormIsBestForPageLevelAutoFill"];
  v5->_bestForPageLevelAutoFill = [v28 toBool];

  v29 = [v4 objectForKeyedSubscript:@"FormIsBestForStreamlinedLogin"];
  v5->_bestForStreamlinedLogin = [v29 toBool];

  v30 = [v4 objectForKeyedSubscript:@"FormIsEligibleForAutomaticLogin"];
  v5->_eligibleForAutomaticLogin = [v30 toBool];

  v31 = [v4 objectForKeyedSubscript:@"IsVisible"];
  v5->_visible = [v31 toBool];

  v32 = [v4 objectForKeyedSubscript:@"FormUsesRelAsync"];
  v5->_usesRelAsync = [v32 toBool];

  uint64_t v33 = stringForKey(v4, @"OldPasswordElementUniqueID");
  oldPasswordElementUniqueID = v5->_oldPasswordElementUniqueID;
  v5->_oldPasswordElementUniqueID = (NSString *)v33;

  uint64_t v35 = stringForKey(v4, @"PasswordElementUniqueID");
  passwordElementUniqueID = v5->_passwordElementUniqueID;
  v5->_passwordElementUniqueID = (NSString *)v35;

  uint64_t v37 = stringForKey(v4, @"TextSample");
  textSample = v5->_textSample;
  v5->_textSample = (NSString *)v37;

  uint64_t v39 = stringForKey(v4, @"UsernameElementUniqueID");
  userNameElementUniqueID = v5->_userNameElementUniqueID;
  v5->_userNameElementUniqueID = (NSString *)v39;

  v41 = [v4 objectForKeyedSubscript:@"UsesGeneratedPassword"];
  v5->_usesGeneratedPassword = [v41 toBool];

  v42 = [v4 objectForKeyedSubscript:@"RequestType"];
  v5->_requestType = (int)[v42 toInt32];

  if (v5->_requestType <= 4)
  {
    v43 = [v4 objectForKeyedSubscript:@"FormIsSearchForm"];
    v5->_isSearchForm = [v43 toBool];

    v44 = v5;
  }
  else
  {
LABEL_5:
    v44 = 0;
  }

  return v44;
}

WBSFormControlMetadata *__35__WBSFormMetadata_initWithJSValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WBSFormControlMetadata alloc] initWithDictionary:v2];

  return v3;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WBSFormMetadata;
  return [(WBSFormMetadata *)&v3 init];
}

- (id)formMetadataByReplacingControlsWith:(id)a3
{
  id v4 = a3;
  id v5 = [[WBSFormMetadata alloc] _init];
  *((unsigned char *)v5 + 24) = self->_allowsAutocomplete;
  *((void *)v5 + 6) = self->_type;
  *((unsigned char *)v5 + 25) = self->_containsActiveElement;
  *((void *)v5 + 10) = self->_uniqueID;
  objc_storeStrong((id *)v5 + 11, self->_logicalFormElementSelector);
  *((unsigned char *)v5 + 26) = self->_bestForPageLevelAutoFill;
  *((unsigned char *)v5 + 27) = self->_bestForStreamlinedLogin;
  *((unsigned char *)v5 + 28) = self->_eligibleForAutomaticLogin;
  *((unsigned char *)v5 + 29) = self->_visible;
  *((unsigned char *)v5 + 30) = self->_usesRelAsync;
  *((unsigned char *)v5 + 31) = self->_usesGeneratedPassword;
  *((void *)v5 + 16) = self->_requestType;
  *((unsigned char *)v5 + 32) = self->_isSearchForm;
  uint64_t v6 = [(NSDictionary *)self->_annotations copy];
  v7 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v6;

  uint64_t v8 = [(NSString *)self->_confirmPasswordElementUniqueID copy];
  v9 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v8;

  uint64_t v10 = [(NSString *)self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID copy];
  uint64_t v11 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v10;

  objc_storeStrong((id *)v5 + 9, self->_action);
  uint64_t v12 = [v4 mutableCopy];

  v13 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v12;

  uint64_t v14 = [(NSString *)self->_oldPasswordElementUniqueID copy];
  v15 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v14;

  uint64_t v16 = [(NSString *)self->_passwordElementUniqueID copy];
  v17 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v16;

  uint64_t v18 = [(NSString *)self->_textSample copy];
  v19 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v18;

  uint64_t v20 = [(NSString *)self->_userNameElementUniqueID copy];
  v21 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v20;

  uint64_t v22 = [(NSDictionary *)self->_passwordRequirements copy];
  v23 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v22;

  return v5;
}

- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3 withKnownSensitiveValues:(id)a4
{
  BOOL v27 = a3;
  id v28 = a4;
  uint64_t v26 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [NSNumber numberWithDouble:(double)self->_type];
  uint64_t v6 = [NSNumber numberWithBool:self->_containsActiveElement];
  v7 = [NSNumber numberWithDouble:(double)self->_uniqueID];
  uint64_t v8 = [NSNumber numberWithBool:self->_visible];
  v9 = [NSNumber numberWithBool:self->_usesGeneratedPassword];
  uint64_t v10 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v5, @"AutoFillFormType", v6, @"ContainsActiveElement", v7, @"FormID", v8, @"IsVisible", v9, @"UsesGeneratedPassword", 0);

  if (!self->_allowsAutocomplete) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DisallowsAutocomplete"];
  }
  if (self->_annotations && !v27) {
    objc_msgSend(v10, "setObject:forKeyedSubscript:");
  }
  confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID;
  if (confirmPasswordElementUniqueID) {
    [v10 setObject:confirmPasswordElementUniqueID forKeyedSubscript:@"ConfirmPasswordElementUniqueID"];
  }
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  if (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID) {
    [v10 setObject:firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID forKeyedSubscript:@"FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"];
  }
  action = self->_action;
  if (action && !v27)
  {
    uint64_t v14 = [(NSURL *)action safari_originalDataAsString];
    [v10 setObject:v14 forKeyedSubscript:@"FormAction"];
  }
  controls = self->_controls;
  if (controls)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __93__WBSFormMetadata_dictionaryRepresentationRedactingSensitiveValues_withKnownSensitiveValues___block_invoke;
    v29[3] = &__block_descriptor_33_e46___NSDictionary_16__0__WBSFormControlMetadata_8l;
    BOOL v30 = v27;
    uint64_t v16 = [(NSArray *)controls safari_mapObjectsUsingBlock:v29];
    [v10 setObject:v16 forKeyedSubscript:@"FormControls"];
  }
  oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID;
  if (oldPasswordElementUniqueID) {
    [v10 setObject:oldPasswordElementUniqueID forKeyedSubscript:@"OldPasswordElementUniqueID"];
  }
  passwordElementUniqueID = self->_passwordElementUniqueID;
  if (passwordElementUniqueID) {
    [v10 setObject:passwordElementUniqueID forKeyedSubscript:@"PasswordElementUniqueID"];
  }
  if (self->_textSample)
  {
    if (v28 && v27)
    {
      v19 = [(NSString *)self->_textSample safari_stringByRedactingStrings:v28 withReplacement:@"<redacted>"];
      [v10 setObject:v19 forKeyedSubscript:@"TextSample"];
    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:");
    }
  }
  userNameElementUniqueID = self->_userNameElementUniqueID;
  if (userNameElementUniqueID) {
    [v10 setObject:userNameElementUniqueID forKeyedSubscript:@"UsernameElementUniqueID"];
  }
  if (self->_usesRelAsync) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FormUsesRelAsync"];
  }
  if (self->_bestForPageLevelAutoFill) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FormIsBestForPageLevelAutoFill"];
  }
  if (self->_bestForStreamlinedLogin) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FormIsBestForStreamlinedLogin"];
  }
  if (self->_eligibleForAutomaticLogin) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FormIsEligibleForAutomaticLogin"];
  }
  unint64_t requestType = self->_requestType;
  if (requestType <= 4)
  {
    uint64_t v22 = [NSNumber numberWithDouble:(double)requestType];
    [v10 setObject:v22 forKeyedSubscript:@"RequestType"];
  }
  if (self->_isSearchForm) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FormIsSearchForm"];
  }
  passwordRequirements = self->_passwordRequirements;
  if (passwordRequirements) {
    [v10 setObject:passwordRequirements forKeyedSubscript:@"PasswordRequirements"];
  }
  logicalFormElementSelector = self->_logicalFormElementSelector;
  if (logicalFormElementSelector && [(NSString *)logicalFormElementSelector length]) {
    [v10 setObject:self->_logicalFormElementSelector forKeyedSubscript:@"LogicalFormElementSelector"];
  }

  return v10;
}

uint64_t __93__WBSFormMetadata_dictionaryRepresentationRedactingSensitiveValues_withKnownSensitiveValues___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationRedactingSensitiveValues:*(unsigned __int8 *)(a1 + 32)];
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)[(WBSFormMetadata *)self dictionaryRepresentationRedactingSensitiveValues:0 withKnownSensitiveValues:0];
}

- (NSData)serializedData
{
  id v6 = 0;
  id v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(WBSFormMetadata *)v4 serializedData];
    }
  }

  return (NSData *)v2;
}

+ (id)formMetadataFromSerializedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = 0;
    goto LABEL_10;
  }
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v18 = 0;
  v13 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v12 fromData:v3 error:&v18];
  id v14 = v18;
  if (v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[WBSFormMetadata formMetadataFromSerializedData:](v15, v14);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v16 = 0;
    goto LABEL_9;
  }
  id v16 = v13;
LABEL_9:

LABEL_10:
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  [v16 encodeInteger:self->_type forKey:@"AutoFillFormType"];
  [v16 encodeInteger:self->_uniqueID forKey:@"FormID"];
  if (!self->_allowsAutocomplete) {
    [v16 encodeBool:1 forKey:@"DisallowsAutocomplete"];
  }
  if (self->_containsActiveElement) {
    [v16 encodeBool:1 forKey:@"ContainsActiveElement"];
  }
  id v4 = v16;
  if (self->_visible)
  {
    [v16 encodeBool:1 forKey:@"IsVisible"];
    id v4 = v16;
  }
  if (self->_usesGeneratedPassword)
  {
    [v16 encodeBool:1 forKey:@"UsesGeneratedPassword"];
    id v4 = v16;
  }
  annotations = self->_annotations;
  if (annotations)
  {
    [v16 encodeObject:annotations forKey:@"Annotations"];
    id v4 = v16;
  }
  confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID;
  if (confirmPasswordElementUniqueID)
  {
    [v16 encodeObject:confirmPasswordElementUniqueID forKey:@"ConfirmPasswordElementUniqueID"];
    id v4 = v16;
  }
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  if (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID)
  {
    [v16 encodeObject:firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID forKey:@"FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"];
    id v4 = v16;
  }
  action = self->_action;
  if (action)
  {
    [v16 encodeObject:action forKey:@"FormAction"];
    id v4 = v16;
  }
  controls = self->_controls;
  if (controls)
  {
    [v16 encodeObject:controls forKey:@"FormControls"];
    id v4 = v16;
  }
  oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID;
  if (oldPasswordElementUniqueID)
  {
    [v16 encodeObject:oldPasswordElementUniqueID forKey:@"OldPasswordElementUniqueID"];
    id v4 = v16;
  }
  passwordElementUniqueID = self->_passwordElementUniqueID;
  if (passwordElementUniqueID)
  {
    [v16 encodeObject:passwordElementUniqueID forKey:@"PasswordElementUniqueID"];
    id v4 = v16;
  }
  textSample = self->_textSample;
  if (textSample)
  {
    [v16 encodeObject:textSample forKey:@"TextSample"];
    id v4 = v16;
  }
  userNameElementUniqueID = self->_userNameElementUniqueID;
  if (userNameElementUniqueID)
  {
    [v16 encodeObject:userNameElementUniqueID forKey:@"UsernameElementUniqueID"];
    id v4 = v16;
  }
  if (self->_usesRelAsync)
  {
    [v16 encodeBool:1 forKey:@"FormUsesRelAsync"];
    id v4 = v16;
  }
  if (self->_bestForPageLevelAutoFill)
  {
    [v16 encodeBool:1 forKey:@"FormIsBestForPageLevelAutoFill"];
    id v4 = v16;
  }
  if (self->_bestForStreamlinedLogin)
  {
    [v16 encodeBool:1 forKey:@"FormIsBestForStreamlinedLogin"];
    id v4 = v16;
  }
  if (self->_eligibleForAutomaticLogin)
  {
    [v16 encodeBool:1 forKey:@"FormIsEligibleForAutomaticLogin"];
    id v4 = v16;
  }
  if (self->_requestType <= 4)
  {
    objc_msgSend(v16, "encodeInteger:forKey:");
    id v4 = v16;
  }
  if (self->_isSearchForm)
  {
    [v16 encodeBool:1 forKey:@"FormIsSearchForm"];
    id v4 = v16;
  }
  passwordRequirements = self->_passwordRequirements;
  if (passwordRequirements)
  {
    [v16 encodeObject:passwordRequirements forKey:@"PasswordRequirements"];
    id v4 = v16;
  }
  logicalFormElementSelector = self->_logicalFormElementSelector;
  if (logicalFormElementSelector)
  {
    [v16 encodeObject:logicalFormElementSelector forKey:@"LogicalFormElementSelector"];
    id v4 = v16;
  }
}

- (WBSFormMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)WBSFormMetadata;
  uint64_t v5 = [(WBSFormMetadata *)&v52 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = [v4 decodeIntegerForKey:@"AutoFillFormType"];
    v5->_type = v7;
    if (v7 >= 6) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28460], @"Form type is invalid: %lu", v7);
    }
    v5->_uniqueID = [v4 decodeIntegerForKey:@"FormID"];
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:@"LogicalFormElementSelector"];
    logicalFormElementSelector = v5->_logicalFormElementSelector;
    v5->_logicalFormElementSelector = (NSString *)v8;

    v5->_allowsAutocomplete = [v4 decodeBoolForKey:@"DisallowsAutocomplete"] ^ 1;
    v5->_containsActiveElement = [v4 decodeBoolForKey:@"ContainsActiveElement"];
    v5->_visible = [v4 decodeBoolForKey:@"IsVisible"];
    v5->_usesGeneratedPassword = [v4 decodeBoolForKey:@"UsesGeneratedPassword"];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, v6, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"Annotations"];
    annotations = v5->_annotations;
    v5->_annotations = (NSDictionary *)v14;

    if (v5->_annotations)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460], @"Annotations is not a dictionary: %@", v5->_annotations format];
      }
    }
    uint64_t v16 = [v4 decodeObjectOfClass:v6 forKey:@"ConfirmPasswordElementUniqueID"];
    confirmPasswordElementUniqueID = v5->_confirmPasswordElementUniqueID;
    v5->_confirmPasswordElementUniqueID = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:v6 forKey:@"FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"];
    firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
    v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FormAction"];
    action = v5->_action;
    v5->_action = (NSURL *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    double v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"FormControls"];
    controls = v5->_controls;
    v5->_controls = (NSArray *)v26;

    if (v5->_controls)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v29 = v5->_controls;
      if ((isKindOfClass & 1) == 0)
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460], @"Controls is not an array: %@", v5->_controls format];
        v29 = v5->_controls;
      }
    }
    else
    {
      v29 = 0;
    }
    uint64_t v30 = [(NSArray *)v29 safari_mapObjectsUsingBlock:&__block_literal_global_28];
    v31 = v5->_controls;
    v5->_controls = (NSArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:v6 forKey:@"OldPasswordElementUniqueID"];
    oldPasswordElementUniqueID = v5->_oldPasswordElementUniqueID;
    v5->_oldPasswordElementUniqueID = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:v6 forKey:@"PasswordElementUniqueID"];
    passwordElementUniqueID = v5->_passwordElementUniqueID;
    v5->_passwordElementUniqueID = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:v6 forKey:@"TextSample"];
    textSample = v5->_textSample;
    v5->_textSample = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:v6 forKey:@"UsernameElementUniqueID"];
    userNameElementUniqueID = v5->_userNameElementUniqueID;
    v5->_userNameElementUniqueID = (NSString *)v38;

    v5->_usesRelAsync = [v4 decodeBoolForKey:@"FormUsesRelAsync"];
    v5->_bestForPageLevelAutoFill = [v4 decodeBoolForKey:@"FormIsBestForPageLevelAutoFill"];
    v5->_bestForStreamlinedLogin = [v4 decodeBoolForKey:@"FormIsBestForStreamlinedLogin"];
    v5->_eligibleForAutomaticLogin = [v4 decodeBoolForKey:@"FormIsEligibleForAutomaticLogin"];
    unint64_t v40 = [v4 decodeIntegerForKey:@"RequestType"];
    v5->_unint64_t requestType = v40;
    if (v40 >= 5) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28460], @"Request type is invalid: %lu", v40);
    }
    v5->_isSearchForm = [v4 decodeBoolForKey:@"FormIsSearchForm"];
    v41 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, v6, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"PasswordRequirements"];
    passwordRequirements = v5->_passwordRequirements;
    v5->_passwordRequirements = (NSDictionary *)v48;

    v50 = v5;
  }

  return v5;
}

id __33__WBSFormMetadata_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  return v2;
}

- (BOOL)containsAtLeastOneSecureTextField
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_containsAtLeastOneSecureTextField)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = self->_controls;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isSecureTextField", (void)v10))
          {
            containsAtLeastOneSecureTextField = self->_containsAtLeastOneSecureTextField;
            self->_containsAtLeastOneSecureTextField = (NSNumber *)MEMORY[0x1E4F1CC38];

            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return [(NSNumber *)self->_containsAtLeastOneSecureTextField BOOLValue];
}

- (BOOL)containsClassifications
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_controls;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "classification", (void)v8);

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)userNameFieldValue
{
  return (NSString *)[(WBSFormMetadata *)self _valueOfControlWithUniqueID:self->_userNameElementUniqueID];
}

- (NSString)passwordFieldValue
{
  return (NSString *)[(WBSFormMetadata *)self _valueOfControlWithUniqueID:self->_passwordElementUniqueID];
}

- (id)_valueOfControlWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    controls = self->_controls;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__WBSFormMetadata__valueOfControlWithUniqueID___block_invoke;
    v9[3] = &unk_1E5C9B890;
    id v10 = v4;
    uint64_t v6 = [(NSArray *)controls safari_firstObjectPassingTest:v9];
    unint64_t v7 = [v6 value];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

uint64_t __47__WBSFormMetadata__valueOfControlWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)allowsAutocomplete
{
  return self->_allowsAutocomplete;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)confirmPasswordElementUniqueID
{
  return self->_confirmPasswordElementUniqueID;
}

- (BOOL)containsActiveElement
{
  return self->_containsActiveElement;
}

- (NSString)firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID
{
  return self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
}

- (NSURL)action
{
  return self->_action;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (NSString)logicalFormElementSelector
{
  return self->_logicalFormElementSelector;
}

- (BOOL)isBestForPageLevelAutoFill
{
  return self->_bestForPageLevelAutoFill;
}

- (BOOL)isBestForStreamlinedLogin
{
  return self->_bestForStreamlinedLogin;
}

- (BOOL)isEligibleForAutomaticLogin
{
  return self->_eligibleForAutomaticLogin;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)usesRelAsync
{
  return self->_usesRelAsync;
}

- (NSString)oldPasswordElementUniqueID
{
  return self->_oldPasswordElementUniqueID;
}

- (NSString)passwordElementUniqueID
{
  return self->_passwordElementUniqueID;
}

- (NSString)textSample
{
  return self->_textSample;
}

- (NSString)userNameElementUniqueID
{
  return self->_userNameElementUniqueID;
}

- (BOOL)usesGeneratedPassword
{
  return self->_usesGeneratedPassword;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (BOOL)isSearchForm
{
  return self->_isSearchForm;
}

- (NSDictionary)passwordRequirements
{
  return self->_passwordRequirements;
}

- (void)setPasswordRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRequirements, 0);
  objc_storeStrong((id *)&self->_userNameElementUniqueID, 0);
  objc_storeStrong((id *)&self->_textSample, 0);
  objc_storeStrong((id *)&self->_passwordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_oldPasswordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_logicalFormElementSelector, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, 0);
  objc_storeStrong((id *)&self->_confirmPasswordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_containsAtLeastOneSecureTextField, 0);
}

- (void)serializedData
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to archive WBSFormMetadata: %{public}@", v7, v8, v9, v10, 2u);
}

+ (void)formMetadataFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to read from WBSFormMetadata data with exception: %{public}@", v7, v8, v9, v10, 2u);
}

@end