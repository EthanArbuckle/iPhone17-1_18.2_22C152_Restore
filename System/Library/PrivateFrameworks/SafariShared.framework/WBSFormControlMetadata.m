@interface WBSFormControlMetadata
+ (BOOL)supportsSecureCoding;
+ (id)formControlMetadataFromSerializedData:(id)a3;
- (BOOL)claimsToBeCurrentPasswordViaAutocompleteAttribute;
- (BOOL)claimsToBeNewPasswordViaAutocompleteAttribute;
- (BOOL)claimsToBeUsernameViaAutocompleteAttribute;
- (BOOL)disallowsAutocomplete;
- (BOOL)isActive;
- (BOOL)isAutoFilledTextField;
- (BOOL)isDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLabeledUsernameField;
- (BOOL)isReadOnly;
- (BOOL)isSecureTextField;
- (BOOL)isTextField;
- (BOOL)isUserEditedTextField;
- (BOOL)isVerticalWritingMode;
- (BOOL)isVisible;
- (BOOL)looksLikeCreditCardCardholderField;
- (BOOL)looksLikeCreditCardCompositeExpirationDateField;
- (BOOL)looksLikeCreditCardNumberField;
- (BOOL)looksLikeCreditCardSecurityCodeField;
- (BOOL)looksLikeCreditCardTypeField;
- (BOOL)looksLikeDayField;
- (BOOL)looksLikeEIDField;
- (BOOL)looksLikeIMEIField;
- (BOOL)looksLikeIgnoredDataTypeField;
- (BOOL)looksLikeMonthField;
- (BOOL)looksLikeOneTimeCodeField;
- (BOOL)looksLikePasswordCredentialField;
- (BOOL)looksLikeYearField;
- (BOOL)oneTimeCodeIsEligibleForAutomaticLogin;
- (CGRect)frame;
- (NSArray)ancestorFrameURLs;
- (NSArray)autocompleteTokens;
- (NSArray)classificationHints;
- (NSArray)orderedParts;
- (NSArray)selectElementInfo;
- (NSData)serializedData;
- (NSDictionary)annotations;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)radioButtonInfo;
- (NSString)addressBookLabel;
- (NSString)associatedUsername;
- (NSString)classification;
- (NSString)fieldClass;
- (NSString)fieldID;
- (NSString)fieldName;
- (NSString)nextControlUniqueID;
- (NSString)passwordRules;
- (NSString)placeholder;
- (NSString)requiredFormatForDateTimeInput;
- (NSString)tagName;
- (NSString)uniqueID;
- (NSString)value;
- (WBSFormControlMetadata)init;
- (WBSFormControlMetadata)initWithCoder:(id)a3;
- (WBSFormControlMetadata)initWithDictionary:(id)a3;
- (WBSFormControlMetadata)initWithMetadata:(id)a3;
- (double)rectHeight;
- (double)rectLeft;
- (double)rectTop;
- (double)rectWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)autoFillButtonType;
- (int64_t)lastAutoFillButtonType;
- (int64_t)oneTimeCodeFieldClassification;
- (unint64_t)continuationID;
- (unint64_t)continuationIndex;
- (unint64_t)hash;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (unint64_t)selectionLength;
- (unint64_t)selectionStart;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)serializedData;
- (void)setValue:(id)a3;
@end

@implementation WBSFormControlMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSFormControlMetadata)initWithCoder:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WBSFormControlMetadata *)self init];
  if (setUpEncodingClasses_onceToken != -1) {
    dispatch_once(&setUpEncodingClasses_onceToken, &__block_literal_global_50);
  }
  uint64_t v6 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"a"];
  addressBookLabel = v5->_addressBookLabel;
  v5->_addressBookLabel = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"d"];
  associatedUsername = v5->_associatedUsername;
  v5->_associatedUsername = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"f"];
  fieldClass = v5->_fieldClass;
  v5->_fieldClass = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"g"];
  fieldID = v5->_fieldID;
  v5->_fieldID = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"h"];
  fieldName = v5->_fieldName;
  v5->_fieldName = (NSString *)v14;

  uint64_t v16 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"i"];
  tagName = v5->_tagName;
  v5->_tagName = (NSString *)v16;

  uint64_t v18 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"j"];
  uniqueID = v5->_uniqueID;
  v5->_uniqueID = (NSString *)v18;

  uint64_t v20 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"k"];
  nextControlUniqueID = v5->_nextControlUniqueID;
  v5->_nextControlUniqueID = (NSString *)v20;

  uint64_t v22 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"1"];
  placeholder = v5->_placeholder;
  v5->_placeholder = (NSString *)v22;

  uint64_t v24 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"l"];
  value = v5->_value;
  v5->_value = (NSString *)v24;

  uint64_t v26 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"e"];
  passwordRules = v5->_passwordRules;
  v5->_passwordRules = (NSString *)v26;

  uint64_t v28 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"3"];
  requiredFormatForDateTimeInput = v5->_requiredFormatForDateTimeInput;
  v5->_requiredFormatForDateTimeInput = (NSString *)v28;

  uint64_t v30 = [v4 decodeObjectOfClasses:nsStringClassSet forKey:@"4"];
  classification = v5->_classification;
  v5->_classification = (NSString *)v30;

  v5->_size = [v4 decodeInt32ForKey:@"s"];
  v5->_maxLength = [v4 decodeInt32ForKey:@"t"];
  v5->_minLength = [v4 decodeInt32ForKey:@"u"];
  v5->_selectionStart = [v4 decodeInt32ForKey:@"v"];
  v5->_selectionLength = [v4 decodeInt32ForKey:@"w"];
  v5->_autoFillButtonType = [v4 decodeInt32ForKey:@"y"];
  v5->_lastAutoFillButtonType = [v4 decodeInt32ForKey:@"z"];
  v5->_continuationID = [v4 decodeInt32ForKey:@"5"];
  v5->_continuationIndex = [v4 decodeInt32ForKey:@"6"];
  [v4 decodeDoubleForKey:@"o"];
  v5->_rectLeft = v32;
  [v4 decodeDoubleForKey:@"p"];
  v5->_rectTop = v33;
  [v4 decodeDoubleForKey:@"q"];
  v5->_rectWidth = v34;
  [v4 decodeDoubleForKey:@"r"];
  v5->_rectHeight = v35;
  uint64_t v36 = [v4 decodeObjectOfClasses:stringDictionaryClasses forKey:@"b"];
  annotations = v5->_annotations;
  v5->_annotations = (NSDictionary *)v36;

  v38 = &off_1E96E3000;
  uint64_t v39 = [v4 decodeObjectOfClasses:stringArrayClasses forKey:@"c"];
  autocompleteTokens = v5->_autocompleteTokens;
  v5->_autocompleteTokens = (NSArray *)v39;

  uint64_t v41 = [v4 decodeObjectOfClasses:stringArrayDictionaryClasses forKey:@"m"];
  radioButtonInfo = v5->_radioButtonInfo;
  v5->_radioButtonInfo = (NSDictionary *)v41;

  uint64_t v43 = [v4 decodeObjectOfClasses:urlArrayDictionaryClasses forKey:@"2"];
  ancestorFrameURLs = v5->_ancestorFrameURLs;
  v5->_ancestorFrameURLs = (NSArray *)v43;

  v45 = [v4 decodeObjectOfClasses:selectElementInfoClasses forKey:@"n"];
  if (objc_opt_isKindOfClass())
  {
    id v63 = v4;
    v46 = [MEMORY[0x1E4F1CA48] array];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v62 = v45;
    id v47 = v45;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = 0;
      uint64_t v51 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v65 != v51) {
            objc_enumerationMutation(v47);
          }
          v53 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            uint64_t v50 = [v53 integerValue];
          }
          else
          {
            v54 = [NSNumber numberWithInteger:v50];
            v68[0] = v54;
            v68[1] = v53;
            v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
            [(NSArray *)v46 addObject:v55];

            ++v50;
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v64 objects:v69 count:16];
      }
      while (v49);
    }

    id v4 = v63;
    v38 = &off_1E96E3000;
    v45 = v62;
  }
  else
  {
    v46 = 0;
  }

  selectElementInfo = v5->_selectElementInfo;
  v5->_selectElementInfo = v46;

  v5->_flags.asInteger = [v4 decodeIntegerForKey:@"x"];
  uint64_t v57 = [v4 decodeObjectOfClasses:v38[483] forKey:@"7"];
  orderedParts = v5->_orderedParts;
  v5->_orderedParts = (NSArray *)v57;

  uint64_t v59 = [v4 decodeObjectOfClasses:v38[483] forKey:@"8"];
  classificationHints = v5->_classificationHints;
  v5->_classificationHints = (NSArray *)v59;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  addressBookLabel = self->_addressBookLabel;
  if (addressBookLabel) {
    [v4 encodeObject:addressBookLabel forKey:@"a"];
  }
  associatedUsername = self->_associatedUsername;
  if (associatedUsername) {
    [v5 encodeObject:associatedUsername forKey:@"d"];
  }
  fieldClass = self->_fieldClass;
  if (fieldClass) {
    [v5 encodeObject:fieldClass forKey:@"f"];
  }
  fieldID = self->_fieldID;
  if (fieldID) {
    [v5 encodeObject:fieldID forKey:@"g"];
  }
  fieldName = self->_fieldName;
  if (fieldName) {
    [v5 encodeObject:fieldName forKey:@"h"];
  }
  tagName = self->_tagName;
  if (tagName) {
    [v5 encodeObject:tagName forKey:@"i"];
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v5 encodeObject:uniqueID forKey:@"j"];
  }
  nextControlUniqueID = self->_nextControlUniqueID;
  if (nextControlUniqueID) {
    [v5 encodeObject:nextControlUniqueID forKey:@"k"];
  }
  placeholder = self->_placeholder;
  if (placeholder) {
    [v5 encodeObject:placeholder forKey:@"1"];
  }
  value = self->_value;
  if (value) {
    [v5 encodeObject:value forKey:@"l"];
  }
  passwordRules = self->_passwordRules;
  if (passwordRules) {
    [v5 encodeObject:passwordRules forKey:@"e"];
  }
  requiredFormatForDateTimeInput = self->_requiredFormatForDateTimeInput;
  if (requiredFormatForDateTimeInput) {
    [v5 encodeObject:requiredFormatForDateTimeInput forKey:@"3"];
  }
  classification = self->_classification;
  if (classification) {
    [v5 encodeObject:classification forKey:@"4"];
  }
  uint64_t size = self->_size;
  if (size) {
    [v5 encodeInt32:size forKey:@"s"];
  }
  uint64_t maxLength = self->_maxLength;
  if (maxLength) {
    [v5 encodeInt32:maxLength forKey:@"t"];
  }
  uint64_t minLength = self->_minLength;
  if (minLength) {
    [v5 encodeInt32:minLength forKey:@"u"];
  }
  uint64_t selectionStart = self->_selectionStart;
  if (selectionStart) {
    [v5 encodeInt32:selectionStart forKey:@"v"];
  }
  uint64_t selectionLength = self->_selectionLength;
  if (selectionLength) {
    [v5 encodeInt32:selectionLength forKey:@"w"];
  }
  uint64_t autoFillButtonType = self->_autoFillButtonType;
  if (autoFillButtonType) {
    [v5 encodeInt32:autoFillButtonType forKey:@"y"];
  }
  uint64_t lastAutoFillButtonType = self->_lastAutoFillButtonType;
  if (lastAutoFillButtonType) {
    [v5 encodeInt32:lastAutoFillButtonType forKey:@"z"];
  }
  uint64_t continuationID = self->_continuationID;
  if (continuationID) {
    [v5 encodeInt32:continuationID forKey:@"5"];
  }
  uint64_t continuationIndex = self->_continuationIndex;
  if (continuationIndex) {
    [v5 encodeInt32:continuationIndex forKey:@"6"];
  }
  if (self->_rectLeft != 0.0) {
    objc_msgSend(v5, "encodeDouble:forKey:", @"o");
  }
  if (self->_rectTop != 0.0) {
    objc_msgSend(v5, "encodeDouble:forKey:", @"p");
  }
  if (self->_rectWidth != 0.0) {
    objc_msgSend(v5, "encodeDouble:forKey:", @"q");
  }
  if (self->_rectHeight != 0.0) {
    objc_msgSend(v5, "encodeDouble:forKey:", @"r");
  }
  annotations = self->_annotations;
  if (annotations) {
    [v5 encodeObject:annotations forKey:@"b"];
  }
  autocompleteTokens = self->_autocompleteTokens;
  if (autocompleteTokens) {
    [v5 encodeObject:autocompleteTokens forKey:@"c"];
  }
  radioButtonInfo = self->_radioButtonInfo;
  if (radioButtonInfo) {
    [v5 encodeObject:radioButtonInfo forKey:@"m"];
  }
  selectElementInfo = self->_selectElementInfo;
  if (selectElementInfo)
  {
    id v32 = v5;
    double v33 = selectElementInfo;
    if ([(NSArray *)v33 count])
    {
      uint64_t v50 = v32;
      uint64_t v51 = v5;
      double v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v33, "count"));
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v49 = v33;
      double v35 = v33;
      uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = 0;
        uint64_t v39 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v53 != v39) {
              objc_enumerationMutation(v35);
            }
            uint64_t v41 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            v42 = [v41 objectAtIndexedSubscript:0];
            uint64_t v43 = [v42 integerValue];
            v44 = [v41 objectAtIndexedSubscript:1];
            if (v43 != v38)
            {
              [v34 addObject:v42];
              uint64_t v38 = v43;
            }
            [v34 addObject:v44];
            ++v38;
          }
          uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v37);
      }

      id v32 = v50;
      [v50 encodeObject:v34 forKey:@"n"];

      v5 = v51;
      double v33 = v49;
    }
  }
  ancestorFrameURLs = self->_ancestorFrameURLs;
  if (ancestorFrameURLs) {
    [v5 encodeObject:ancestorFrameURLs forKey:@"2"];
  }
  int64_t asInteger = self->_flags.asInteger;
  if (asInteger) {
    [v5 encodeInteger:asInteger forKey:@"x"];
  }
  orderedParts = self->_orderedParts;
  if (orderedParts) {
    [v5 encodeObject:orderedParts forKey:@"7"];
  }
  classificationHints = self->_classificationHints;
  if (classificationHints) {
    [v5 encodeObject:classificationHints forKey:@"8"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[WBSFormControlMetadata allocWithZone:a3];
  return [(WBSFormControlMetadata *)v4 initWithMetadata:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[WBSMutableFormControlMetadata allocWithZone:a3];
  return [(WBSFormControlMetadata *)v4 initWithMetadata:self];
}

- (WBSFormControlMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)WBSFormControlMetadata;
  result = [(WBSFormControlMetadata *)&v3 init];
  result->_uint64_t maxLength = 0x80000;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSFormControlMetadata *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v6 = 1;
    }
    else
    {
      v5 = v4;
      if (self->_flags.asInteger == v5->_flags.asInteger
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_rectLeft == v5->_rectLeft
        && self->_rectTop == v5->_rectTop
        && self->_rectWidth == v5->_rectWidth
        && self->_rectHeight == v5->_rectHeight
        && self->_size == v5->_size
        && self->_maxLength == v5->_maxLength
        && self->_minLength == v5->_minLength
        && self->_selectionStart == v5->_selectionStart
        && self->_selectionLength == v5->_selectionLength
        && self->_autoFillButtonType == v5->_autoFillButtonType
        && self->_lastAutoFillButtonType == v5->_lastAutoFillButtonType
        && self->_continuationID == v5->_continuationID
        && self->_continuationIndex == v5->_continuationIndex
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual())
      {
        char v6 = WBSIsEqual();
      }
      else
      {
        char v6 = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  NSUInteger v4 = [(NSString *)self->_nextControlUniqueID hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_value hash];
  char v6 = [NSNumber numberWithInteger:self->_flags.asInteger];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (WBSFormControlMetadata)initWithMetadata:(id)a3
{
  NSUInteger v4 = (id *)a3;
  NSUInteger v5 = [(WBSFormControlMetadata *)self init];
  char v6 = v5;
  if (v4)
  {
    objc_storeStrong((id *)&v5->_addressBookLabel, v4[1]);
    objc_storeStrong((id *)&v6->_associatedUsername, v4[2]);
    objc_storeStrong((id *)&v6->_fieldClass, v4[3]);
    objc_storeStrong((id *)&v6->_fieldID, v4[4]);
    objc_storeStrong((id *)&v6->_fieldName, v4[5]);
    objc_storeStrong((id *)&v6->_tagName, v4[6]);
    objc_storeStrong((id *)&v6->_uniqueID, v4[7]);
    objc_storeStrong((id *)&v6->_nextControlUniqueID, v4[8]);
    objc_storeStrong((id *)&v6->_placeholder, v4[9]);
    objc_storeStrong((id *)&v6->_value, v4[10]);
    objc_storeStrong((id *)&v6->_passwordRules, v4[11]);
    objc_storeStrong((id *)&v6->_requiredFormatForDateTimeInput, v4[12]);
    objc_storeStrong((id *)&v6->_classification, v4[13]);
    v6->_uint64_t size = *((_DWORD *)v4 + 52);
    v6->_uint64_t maxLength = *((_DWORD *)v4 + 53);
    v6->_uint64_t minLength = *((_DWORD *)v4 + 54);
    v6->_uint64_t selectionStart = *((_DWORD *)v4 + 55);
    v6->_uint64_t selectionLength = *((_DWORD *)v4 + 56);
    v6->_uint64_t autoFillButtonType = *((_DWORD *)v4 + 57);
    v6->_uint64_t lastAutoFillButtonType = *((_DWORD *)v4 + 58);
    v6->_uint64_t continuationID = *((_DWORD *)v4 + 59);
    v6->_uint64_t continuationIndex = *((_DWORD *)v4 + 60);
    *(void *)&v6->_rectLeft = v4[21];
    *(void *)&v6->_rectTop = v4[22];
    *(void *)&v6->_rectWidth = v4[23];
    *(void *)&v6->_rectHeight = v4[24];
    objc_storeStrong((id *)&v6->_annotations, v4[15]);
    objc_storeStrong((id *)&v6->_autocompleteTokens, v4[17]);
    objc_storeStrong((id *)&v6->_radioButtonInfo, v4[14]);
    objc_storeStrong((id *)&v6->_selectElementInfo, v4[16]);
    objc_storeStrong((id *)&v6->_ancestorFrameURLs, v4[18]);
    v6->_flags.int64_t asInteger = (int64_t)v4[25];
    objc_storeStrong((id *)&v6->_orderedParts, v4[19]);
    objc_storeStrong((id *)&v6->_classificationHints, v4[20]);
  }

  return v6;
}

- (WBSFormControlMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(WBSFormControlMetadata *)self init];
  if ([v4 count])
  {
    if (getPropertyMap_onceToken != -1) {
      dispatch_once(&getPropertyMap_onceToken, &__block_literal_global_465);
    }
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    id v32 = __45__WBSFormControlMetadata_initWithDictionary___block_invoke;
    double v33 = &unk_1E5C9B498;
    uint64_t v35 = getPropertyMap_map;
    char v6 = v5;
    double v34 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:&v30];
    if (objc_msgSend(MEMORY[0x1E4F97EA0], "isInternalInstall", v30, v31, v32, v33))
    {
      unint64_t v7 = objc_msgSend(v4, "safari_numberForKey:", @"ControlRectLeft");
      [v7 doubleValue];
      v6->_rectLeft = v8;

      v9 = objc_msgSend(v4, "safari_numberForKey:", @"ControlRectTop");
      [v9 doubleValue];
      v6->_rectTop = v10;

      v11 = objc_msgSend(v4, "safari_numberForKey:", @"ControlRectWidth");
      [v11 doubleValue];
      v6->_rectWidth = v12;

      v13 = objc_msgSend(v4, "safari_numberForKey:", @"ControlRectHeight");
      [v13 doubleValue];
      v6->_rectHeight = v14;
    }
    v15 = objc_msgSend(v4, "safari_numberForKey:", @"ControlSize");
    v6->_uint64_t size = [v15 integerValue];

    uint64_t v16 = objc_msgSend(v4, "safari_numberForKey:", @"ControlMaxLength");
    int v17 = [v16 integerValue];
    if (v17 > 0x80000 || v17 < 0 || v16 == 0) {
      int v20 = 0x80000;
    }
    else {
      int v20 = v17;
    }
    v6->_uint64_t maxLength = v20;
    v21 = objc_msgSend(v4, "safari_numberForKey:", @"ControlMinLength");
    v6->_uint64_t minLength = [v21 integerValue];

    uint64_t v22 = objc_msgSend(v4, "safari_numberForKey:", @"SelectionStart");
    v6->_uint64_t selectionStart = [v22 integerValue];

    v23 = objc_msgSend(v4, "safari_numberForKey:", @"SelectionLength");
    v6->_uint64_t selectionLength = [v23 integerValue];

    uint64_t v24 = objc_msgSend(v4, "safari_numberForKey:", @"ControlAutoFillButtonType");
    v6->_uint64_t autoFillButtonType = [v24 integerValue];

    v25 = objc_msgSend(v4, "safari_numberForKey:", @"ControlLastAutoFillButtonType");
    v6->_uint64_t lastAutoFillButtonType = [v25 integerValue];

    uint64_t v26 = objc_msgSend(v4, "safari_numberForKey:", @"ControlContinuationID");
    v6->_uint64_t continuationID = [v26 integerValue];

    v27 = objc_msgSend(v4, "safari_numberForKey:", @"ControlContinuationIndex");
    v6->_uint64_t continuationIndex = [v27 integerValue];

    uint64_t v28 = v6;
  }

  return v5;
}

void __45__WBSFormControlMetadata_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSUInteger v5 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  if (v5)
  {
    char v6 = v5;
    uint64_t v7 = v5[1];
    if (v7 == 2)
    {
      double v8 = ((void (*)(void *))v5[4])(a3);
      if (v8)
      {
        v11 = v8;
        object_setIvar(*(id *)(a1 + 32), (Ivar)v6[2], v8);
        double v8 = v11;
      }
    }
    else if (v7 == 1)
    {
      if (objc_opt_isKindOfClass())
      {
        v9 = *(void **)(a1 + 32);
        double v10 = (objc_ivar *)v6[2];
        object_setIvar(v9, v10, a3);
      }
    }
    else if (!v7 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if ([a3 BOOLValue]) {
        *(void *)(*(void *)(a1 + 32) + 200) |= v6[3];
      }
    }
  }
}

- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3
{
  BOOL v3 = a3;
  NSUInteger v5 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = v5;
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if (*(unsigned char *)&flags)
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DisallowsAutocomplete"];
    $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_107;
    }
  }
  else if ((*(unsigned char *)&flags & 2) == 0)
  {
    goto LABEL_3;
  }
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlClaimsToBeCurrentPasswordViaAutocompleteAttribute"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlClaimsToBeNewPasswordViaAutocompleteAttribute"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlClaimsToBeUsernameViaAutocompleteAttribute"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeCreditCardCardholderField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeCreditCardCompositeExpirationDateField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_112;
  }
LABEL_111:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeCreditCardNumberField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_113;
  }
LABEL_112:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeCreditCardSecurityCodeField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_114;
  }
LABEL_113:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeCreditCardTypeField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_115;
  }
LABEL_114:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeEIDField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_116;
  }
LABEL_115:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeIMEIField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_117;
  }
LABEL_116:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeDayField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_118;
  }
LABEL_117:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeMonthField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_119;
  }
LABEL_118:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeYearField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_120;
  }
LABEL_119:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeIgnoredDataTypeField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_WORD *)&flags & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_121;
  }
LABEL_120:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikePasswordCredentialField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_122;
  }
LABEL_121:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlLooksLikeOneTimeCodeField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_123;
  }
LABEL_122:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"OneTimeCodeIsEligibleForAutomaticLogin"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_124;
  }
LABEL_123:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsVisible"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_125;
  }
LABEL_124:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsActiveElement"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_126;
  }
LABEL_125:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsDisabled"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_127;
  }
LABEL_126:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsReadOnly"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&flags & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_128;
  }
LABEL_127:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsTextField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_129;
  }
LABEL_128:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsSecureTextField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&flags & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_130;
  }
LABEL_129:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsAutoFilledTextField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&flags & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_131;
  }
LABEL_130:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsUserEditedTextField"];
  $A7F5D94CC3E8F3FBDC6125808ECD2078 flags = self->_flags.flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&flags & 0x8000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_131:
  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsLabeledUsernameField"];
  if ((*(_DWORD *)&self->_flags.flags & 0x8000000) != 0) {
LABEL_29:
  }
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ControlIsVerticalWritingMode"];
LABEL_30:
  addressBookLabel = self->_addressBookLabel;
  if (addressBookLabel) {
    [v6 setObject:addressBookLabel forKeyedSubscript:@"AddressBookLabel"];
  }
  associatedUsername = self->_associatedUsername;
  if (associatedUsername) {
    [v6 setObject:associatedUsername forKeyedSubscript:@"ControlAssociatedUsername"];
  }
  fieldClass = self->_fieldClass;
  if (fieldClass) {
    [v6 setObject:fieldClass forKeyedSubscript:@"ControlFieldClass"];
  }
  fieldID = self->_fieldID;
  if (fieldID) {
    [v6 setObject:fieldID forKeyedSubscript:@"ControlFieldID"];
  }
  fieldName = self->_fieldName;
  if (fieldName) {
    [v6 setObject:fieldName forKeyedSubscript:@"ControlFieldName"];
  }
  tagName = self->_tagName;
  if (tagName) {
    [v6 setObject:tagName forKeyedSubscript:@"ControlTagName"];
  }
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v6 setObject:uniqueID forKeyedSubscript:@"ControlUniqueID"];
  }
  nextControlUniqueID = self->_nextControlUniqueID;
  if (nextControlUniqueID) {
    [v6 setObject:nextControlUniqueID forKeyedSubscript:@"ControlNextFieldUniqueID"];
  }
  placeholder = self->_placeholder;
  if (placeholder) {
    [v6 setObject:placeholder forKeyedSubscript:@"ControlPlaceholder"];
  }
  value = self->_value;
  if (value) {
    [v6 setObject:value forKeyedSubscript:@"ControlValue"];
  }
  passwordRules = self->_passwordRules;
  if (passwordRules) {
    [v6 setObject:passwordRules forKeyedSubscript:@"ControlPasswordRules"];
  }
  requiredFormatForDateTimeInput = self->_requiredFormatForDateTimeInput;
  if (requiredFormatForDateTimeInput) {
    [v6 setObject:requiredFormatForDateTimeInput forKeyedSubscript:@"ControlRequiredFormatForDateTimeInput"];
  }
  classification = self->_classification;
  if (classification) {
    [v6 setObject:classification forKeyedSubscript:@"ControlClassification"];
  }
  annotations = self->_annotations;
  if (annotations) {
    [v6 setObject:annotations forKeyedSubscript:@"Annotations"];
  }
  autocompleteTokens = self->_autocompleteTokens;
  if (autocompleteTokens) {
    [v6 setObject:autocompleteTokens forKeyedSubscript:@"AutocompleteTokens"];
  }
  radioButtonInfo = self->_radioButtonInfo;
  if (radioButtonInfo) {
    [v6 setObject:radioButtonInfo forKeyedSubscript:@"RadioButtonInfo"];
  }
  selectElementInfo = self->_selectElementInfo;
  if (selectElementInfo) {
    [v6 setObject:selectElementInfo forKeyedSubscript:@"SelectElementInfo"];
  }
  ancestorFrameURLs = self->_ancestorFrameURLs;
  if (ancestorFrameURLs) {
    [v6 setObject:ancestorFrameURLs forKeyedSubscript:@"AncestorFrameURLs"];
  }
  orderedParts = self->_orderedParts;
  if (orderedParts) {
    [v6 setObject:orderedParts forKeyedSubscript:@"ControlOrderedParts"];
  }
  classificationHints = self->_classificationHints;
  if (classificationHints) {
    [v6 setObject:classificationHints forKeyedSubscript:@"ControlClassificationHints"];
  }
  if (self->_rectLeft != 0.0)
  {
    uint64_t v28 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v28 forKeyedSubscript:@"ControlRectLeft"];
  }
  if (self->_rectTop != 0.0)
  {
    v29 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v29 forKeyedSubscript:@"ControlRectTop"];
  }
  if (self->_rectWidth != 0.0)
  {
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v30 forKeyedSubscript:@"ControlRectWidth"];
  }
  if (self->_rectHeight != 0.0)
  {
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v6 setObject:v31 forKeyedSubscript:@"ControlRectHeight"];
  }
  if (self->_size)
  {
    id v32 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v32 forKeyedSubscript:@"ControlSize"];
  }
  if (self->_maxLength)
  {
    double v33 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v33 forKeyedSubscript:@"ControlMaxLength"];
  }
  if (self->_minLength)
  {
    double v34 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v34 forKeyedSubscript:@"ControlMinLength"];
  }
  if (self->_selectionStart)
  {
    uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v35 forKeyedSubscript:@"SelectionStart"];
  }
  if (self->_selectionLength)
  {
    uint64_t v36 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v36 forKeyedSubscript:@"SelectionLength"];
  }
  if (self->_autoFillButtonType)
  {
    uint64_t v37 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v37 forKeyedSubscript:@"ControlAutoFillButtonType"];
  }
  if (self->_lastAutoFillButtonType)
  {
    uint64_t v38 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v38 forKeyedSubscript:@"ControlLastAutoFillButtonType"];
  }
  if (self->_continuationID)
  {
    uint64_t v39 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v39 forKeyedSubscript:@"ControlContinuationID"];
  }
  if (self->_continuationIndex)
  {
    v40 = objc_msgSend(NSNumber, "numberWithInt:");
    [v6 setObject:v40 forKeyedSubscript:@"ControlContinuationIndex"];
  }
  if (self->_maxLength == 0x80000) {
    [v6 removeObjectForKey:@"ControlMaxLength"];
  }
  if (!self->_continuationID || self->_continuationIndex)
  {
    if (!v3) {
      goto LABEL_102;
    }
    goto LABEL_101;
  }
  [v6 setObject:&unk_1EFC22648 forKeyedSubscript:@"ControlContinuationIndex"];
  if (v3)
  {
LABEL_101:
    [v6 removeObjectForKey:@"ControlValue"];
    [v6 removeObjectForKey:@"ControlAssociatedUsername"];
  }
LABEL_102:
  uint64_t v41 = (void *)[v6 copy];

  return v41;
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)[(WBSFormControlMetadata *)self dictionaryRepresentationRedactingSensitiveValues:0];
}

- (NSData)serializedData
{
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(WBSFormControlMetadata *)v4 serializedData];
    }
  }

  return (NSData *)v2;
}

+ (id)formControlMetadataFromSerializedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = 0;
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
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v19 = 0;
  double v14 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v13 fromData:v3 error:&v19];
  id v15 = v19;
  if (v15)
  {
    uint64_t v16 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[WBSFormControlMetadata formControlMetadataFromSerializedData:](v16, v15);
    }
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    id v17 = 0;
    goto LABEL_9;
  }
  id v17 = v14;
LABEL_9:

LABEL_10:
  return v17;
}

- (BOOL)disallowsAutocomplete
{
  return *(_DWORD *)&self->_flags.flags & 1;
}

- (BOOL)claimsToBeCurrentPasswordViaAutocompleteAttribute
{
  return (*(unsigned char *)&self->_flags.flags >> 1) & 1;
}

- (BOOL)claimsToBeNewPasswordViaAutocompleteAttribute
{
  return (*(unsigned char *)&self->_flags.flags >> 2) & 1;
}

- (BOOL)claimsToBeUsernameViaAutocompleteAttribute
{
  return (*(unsigned char *)&self->_flags.flags >> 3) & 1;
}

- (BOOL)looksLikeCreditCardCardholderField
{
  return (*(unsigned char *)&self->_flags.flags >> 4) & 1;
}

- (BOOL)looksLikeCreditCardCompositeExpirationDateField
{
  return (*(unsigned char *)&self->_flags.flags >> 5) & 1;
}

- (BOOL)looksLikeCreditCardNumberField
{
  return (*(unsigned char *)&self->_flags.flags >> 6) & 1;
}

- (BOOL)looksLikeCreditCardSecurityCodeField
{
  return *(unsigned char *)&self->_flags.flags >> 7;
}

- (BOOL)looksLikeCreditCardTypeField
{
  return *((unsigned char *)&self->_flags.flags + 1) & 1;
}

- (BOOL)looksLikeEIDField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 1) & 1;
}

- (BOOL)looksLikeIMEIField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 2) & 1;
}

- (BOOL)looksLikeDayField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 3) & 1;
}

- (BOOL)looksLikeMonthField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 4) & 1;
}

- (BOOL)looksLikeYearField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 5) & 1;
}

- (BOOL)looksLikeIgnoredDataTypeField
{
  return (*((unsigned __int8 *)&self->_flags.flags + 1) >> 6) & 1;
}

- (BOOL)looksLikePasswordCredentialField
{
  return *((unsigned __int8 *)&self->_flags.flags + 1) >> 7;
}

- (BOOL)looksLikeOneTimeCodeField
{
  return BYTE2(self->_flags.asInteger) & 1;
}

- (BOOL)oneTimeCodeIsEligibleForAutomaticLogin
{
  return (BYTE2(self->_flags.asInteger) >> 1) & 1;
}

- (BOOL)isVisible
{
  return (BYTE2(self->_flags.asInteger) >> 2) & 1;
}

- (BOOL)isActive
{
  return (BYTE2(self->_flags.asInteger) >> 3) & 1;
}

- (BOOL)isDisabled
{
  return (BYTE2(self->_flags.asInteger) >> 4) & 1;
}

- (BOOL)isReadOnly
{
  return (BYTE2(self->_flags.asInteger) >> 5) & 1;
}

- (BOOL)isTextField
{
  return (BYTE2(self->_flags.asInteger) >> 6) & 1;
}

- (BOOL)isSecureTextField
{
  return BYTE2(self->_flags.asInteger) >> 7;
}

- (BOOL)isAutoFilledTextField
{
  return BYTE3(self->_flags.asInteger) & 1;
}

- (BOOL)isUserEditedTextField
{
  return (BYTE3(self->_flags.asInteger) >> 1) & 1;
}

- (BOOL)isLabeledUsernameField
{
  return (BYTE3(self->_flags.asInteger) >> 2) & 1;
}

- (BOOL)isVerticalWritingMode
{
  return (BYTE3(self->_flags.asInteger) >> 3) & 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (unint64_t)selectionStart
{
  return self->_selectionStart;
}

- (unint64_t)selectionLength
{
  return self->_selectionLength;
}

- (int64_t)autoFillButtonType
{
  return self->_autoFillButtonType;
}

- (int64_t)lastAutoFillButtonType
{
  return self->_lastAutoFillButtonType;
}

- (unint64_t)continuationID
{
  return self->_continuationID;
}

- (unint64_t)continuationIndex
{
  return self->_continuationIndex;
}

- (int64_t)oneTimeCodeFieldClassification
{
  if ([(NSArray *)self->_autocompleteTokens containsObject:@"one-time-code"]) {
    return 2;
  }
  else {
    return ((unint64_t)self->_flags.flags >> 16) & 1;
  }
}

- (CGRect)frame
{
  double rectLeft = self->_rectLeft;
  double rectTop = self->_rectTop;
  double rectWidth = self->_rectWidth;
  double rectHeight = self->_rectHeight;
  result.size.height = rectHeight;
  result.size.width = rectWidth;
  result.origin.y = rectTop;
  result.origin.x = rectLeft;
  return result;
}

- (NSString)addressBookLabel
{
  return self->_addressBookLabel;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (NSArray)autocompleteTokens
{
  return self->_autocompleteTokens;
}

- (NSString)associatedUsername
{
  return self->_associatedUsername;
}

- (NSString)passwordRules
{
  return self->_passwordRules;
}

- (NSString)fieldClass
{
  return self->_fieldClass;
}

- (NSString)fieldID
{
  return self->_fieldID;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)nextControlUniqueID
{
  return self->_nextControlUniqueID;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSString)requiredFormatForDateTimeInput
{
  return self->_requiredFormatForDateTimeInput;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSDictionary)radioButtonInfo
{
  return self->_radioButtonInfo;
}

- (NSArray)selectElementInfo
{
  return self->_selectElementInfo;
}

- (double)rectLeft
{
  return self->_rectLeft;
}

- (double)rectTop
{
  return self->_rectTop;
}

- (double)rectWidth
{
  return self->_rectWidth;
}

- (double)rectHeight
{
  return self->_rectHeight;
}

- (NSArray)ancestorFrameURLs
{
  return self->_ancestorFrameURLs;
}

- (NSString)classification
{
  return self->_classification;
}

- (NSArray)classificationHints
{
  return self->_classificationHints;
}

- (NSArray)orderedParts
{
  return self->_orderedParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationHints, 0);
  objc_storeStrong((id *)&self->_orderedParts, 0);
  objc_storeStrong((id *)&self->_ancestorFrameURLs, 0);
  objc_storeStrong((id *)&self->_autocompleteTokens, 0);
  objc_storeStrong((id *)&self->_selectElementInfo, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_radioButtonInfo, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_requiredFormatForDateTimeInput, 0);
  objc_storeStrong((id *)&self->_passwordRules, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_nextControlUniqueID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_fieldID, 0);
  objc_storeStrong((id *)&self->_fieldClass, 0);
  objc_storeStrong((id *)&self->_associatedUsername, 0);
  objc_storeStrong((id *)&self->_addressBookLabel, 0);
}

- (void)serializedData
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to archive WBSFormControlMetadata: %{public}@", v7, v8, v9, v10, 2u);
}

+ (void)formControlMetadataFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to read from WBSFormControlMetadata data with exception: %{public}@", v7, v8, v9, v10, 2u);
}

@end