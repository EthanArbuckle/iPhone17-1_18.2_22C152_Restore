@interface PKPaymentSetupField
+ (Class)classForIdentifier:(id)a3 type:(unint64_t)a4;
+ (id)newRandomlyGeneratedField;
+ (id)paymentSetupFieldWithDIAttribute:(id)a3;
+ (id)paymentSetupFieldWithIdentifier:(id)a3;
+ (id)paymentSetupFieldWithIdentifier:(id)a3 configuration:(id)a4;
+ (id)paymentSetupFieldWithIdentifier:(id)a3 type:(unint64_t)a4;
+ (id)sampleCustomPaymentSetupFields;
- (BOOL)_shouldStripDiacritics;
- (BOOL)isBuiltIn;
- (BOOL)isCurrentValueFromCameraCapture;
- (BOOL)isFieldTypeDate;
- (BOOL)isFieldTypeFooter;
- (BOOL)isFieldTypeLabel;
- (BOOL)isFieldTypePicker;
- (BOOL)isFieldTypeText;
- (BOOL)isHidden;
- (BOOL)isOptional;
- (BOOL)isReadonly;
- (BOOL)populateFromMeCard;
- (BOOL)preventVoiceOver;
- (BOOL)requiresSecureSubmission;
- (BOOL)submissionStringMeetsAllRequirements;
- (BOOL)submissionStringMeetsValidationRegex;
- (BOOL)supportsAddressAutofill;
- (DIAttribute)attribute;
- (NSArray)requirements;
- (NSDictionary)rawConfigurationDictionary;
- (NSObject)currentValue;
- (NSObject)originalCameraCaptureValue;
- (NSString)defaultValue;
- (NSString)displayFormat;
- (NSString)identifier;
- (NSString)localizedDisplayName;
- (NSString)localizedPlaceholder;
- (NSString)odiAttribute;
- (NSString)submissionDestination;
- (NSString)submissionKey;
- (PKPaymentSetupField)init;
- (PKPaymentSetupField)initWithIdentifier:(id)a3;
- (PKPaymentSetupField)initWithIdentifier:(id)a3 configuration:(id)a4;
- (PKPaymentSetupField)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)_submissionStringForValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateFieldObject;
- (id)displayString;
- (id)footerFieldObject;
- (id)labelFieldObject;
- (id)pickerFieldObject;
- (id)submissionString;
- (id)textFieldObject;
- (int64_t)groupNumber;
- (unint64_t)fieldType;
- (unint64_t)source;
- (void)_setLocalizedDisplayName:(id)a3;
- (void)noteCurrentValueChanged;
- (void)setAttribute:(id)a3;
- (void)setCurrentValue:(id)a3;
- (void)setCurrentValueFromCameraCapture:(BOOL)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDisplayFormat:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setLocalizedPlaceholder:(id)a3;
- (void)setOptional:(BOOL)a3;
- (void)setOriginalCameraCaptureValue:(id)a3;
- (void)setPopulateFromMeCard:(BOOL)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setRequiresSecureSubmission:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
- (void)setSubmissionDestination:(id)a3;
- (void)setSubmissionKey:(id)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupField

+ (id)paymentSetupFieldWithIdentifier:(id)a3
{
  return (id)[a1 paymentSetupFieldWithIdentifier:a3 configuration:0];
}

+ (id)paymentSetupFieldWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  v6 = +[PKPaymentSetupField classForIdentifier:v5 type:a4];
  if (v6) {
    v7 = (void *)[[v6 alloc] initWithIdentifier:v5 type:a4];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)paymentSetupFieldWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 PKStringForKey:@"fieldType"];
  v9 = [a1 paymentSetupFieldWithIdentifier:v7 type:PKPaymentSetupFieldTypeFromString(v8)];

  if (v6 && v9) {
    [v9 updateWithConfiguration:v6];
  }

  return v9;
}

+ (id)paymentSetupFieldWithDIAttribute:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  id v5 = [v3 identifier];
  unint64_t v6 = [v3 attributeType] - 1;
  if (v6 > 7) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_191673378[v6];
  }
  v8 = [v4 paymentSetupFieldWithIdentifier:v5 type:v7];

  [v8 updateWithAttribute:v3];
  return v8;
}

- (PKPaymentSetupField)init
{
  return [(PKPaymentSetupField *)self initWithIdentifier:0];
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3
{
  return [(PKPaymentSetupField *)self initWithIdentifier:a3 configuration:0];
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[PKPaymentSetupField classForIdentifier:v6 type:a4];
  if (!v7)
  {
    v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Error: Attempted to directly init the PKPaymentSetupField base class. This is not supported.", buf, 2u);
    }

    goto LABEL_14;
  }
  v8 = v7;
  if (v7 != (objc_class *)objc_opt_class())
  {
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (a4 - 1 > 4) {
      v12 = @"unknown";
    }
    else {
      v12 = off_1E56DBFC8[a4 - 1];
    }
    v17 = NSStringFromClass(v8);
    v18 = [v9 stringWithFormat:@"Error: Attempted to init %@ with identifier:%@ and type:%@ which actually requires %@. Give +[PKPaymentSetupField paymentSetupFieldWithIdentifier: type:] a go instead!", v11, v6, v12, v17];

    v19 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v18 format];
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupField;
  v14 = [(PKPaymentSetupField *)&v21 init];
  if (v14)
  {
    uint64_t v15 = [v6 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    [(PKPaymentSetupField *)v14 setSubmissionKey:v6];
    [(PKPaymentSetupField *)v14 setOptional:0];
    [(PKPaymentSetupField *)v14 setReadonly:0];
    [(PKPaymentSetupField *)v14 setSubmissionDestination:@"enable"];
    *(_WORD *)&v14->_requiresSecureSubmission = 256;
  }
LABEL_15:

  return v14;
}

- (PKPaymentSetupField)initWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 PKStringForKey:@"fieldType"];
  v9 = [(PKPaymentSetupField *)self initWithIdentifier:v7 type:PKPaymentSetupFieldTypeFromString(v8)];

  if (v6 && v9) {
    [(PKPaymentSetupField *)v9 updateWithConfiguration:v6];
  }

  return v9;
}

- (void)updateWithAttribute:(id)a3
{
  id v7 = a3;
  [(PKPaymentSetupField *)self setAttribute:v7];
  v4 = [v7 localizedDisplayName];
  if ([v4 length]) {
    [(PKPaymentSetupField *)self _setLocalizedDisplayName:v4];
  }
  id v5 = [v7 localizedPlaceholder];
  if ([v5 length]) {
    [(PKPaymentSetupField *)self setLocalizedPlaceholder:v5];
  }
  id v6 = [v7 displayFormat];
  if ([v6 length]) {
    [(PKPaymentSetupField *)self setDisplayFormat:v6];
  }
  -[PKPaymentSetupField setOptional:](self, "setOptional:", [v7 optional]);
}

- (void)updateWithConfiguration:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = (NSDictionary *)a3;
  uint64_t v5 = [(NSDictionary *)v4 PKStringForKey:@"localizedDisplayName"];
  if (v5) {
    [(PKPaymentSetupField *)self _setLocalizedDisplayName:v5];
  }
  uint64_t v6 = [(NSDictionary *)v4 PKStringForKey:@"localizedPlaceholder"];
  if (v6) {
    [(PKPaymentSetupField *)self setLocalizedPlaceholder:v6];
  }
  v48 = (void *)v5;
  id v7 = [(NSDictionary *)v4 PKStringForKey:@"displayFormat"];
  if ([v7 length]) {
    [(PKPaymentSetupField *)self setDisplayFormat:v7];
  }
  v46 = v7;
  BOOL v8 = [(PKPaymentSetupField *)self _shouldStripDiacritics];
  v9 = [(NSDictionary *)v4 PKStringForKey:@"defaultValue"];
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];

    v10 = (void *)v11;
  }
  if (v10) {
    [(PKPaymentSetupField *)self setDefaultValue:v10];
  }
  v12 = [(NSDictionary *)v4 PKNumberForKey:@"optional"];
  v13 = v12;
  if (v12) {
    -[PKPaymentSetupField setOptional:](self, "setOptional:", [v12 BOOLValue]);
  }
  v14 = [(NSDictionary *)v4 PKNumberForKey:@"readonly"];
  uint64_t v15 = v14;
  if (v14) {
    -[PKPaymentSetupField setReadonly:](self, "setReadonly:", [v14 BOOLValue]);
  }
  v16 = [(NSDictionary *)v4 PKNumberForKey:@"hidden"];
  v17 = v16;
  if (v16) {
    -[PKPaymentSetupField setHidden:](self, "setHidden:", [v16 BOOLValue]);
  }
  uint64_t v18 = [(NSDictionary *)v4 PKStringForKey:@"submissionKey"];
  if (v18) {
    [(PKPaymentSetupField *)self setSubmissionKey:v18];
  }
  v47 = (void *)v6;
  uint64_t v19 = [(NSDictionary *)v4 PKStringForKey:@"submissionDestination"];
  if (v19) {
    [(PKPaymentSetupField *)self setSubmissionDestination:v19];
  }
  v41 = (void *)v19;
  v45 = v10;
  v20 = [(NSDictionary *)v4 PKNumberForKey:@"requiresSecureSubmission"];
  objc_super v21 = v20;
  if (v20) {
    -[PKPaymentSetupField setRequiresSecureSubmission:](self, "setRequiresSecureSubmission:", [v20 BOOLValue]);
  }
  v44 = v13;
  v22 = [(NSDictionary *)v4 PKStringForKey:@"odiAttribute"];
  odiAttribute = self->_odiAttribute;
  self->_odiAttribute = v22;

  uint64_t v24 = [(NSDictionary *)v4 objectForKey:@"populateFromMeCard"];

  if (v24) {
    self->_populateFromMeCard = [(NSDictionary *)v4 PKBoolForKey:@"populateFromMeCard"];
  }
  v42 = (void *)v18;
  v25 = [(NSDictionary *)v4 PKStringForKey:@"groupNumber"];
  self->_groupNumber = [v25 integerValue];

  rawConfigurationDictionary = self->_rawConfigurationDictionary;
  if (rawConfigurationDictionary != v4)
  {
    if (rawConfigurationDictionary)
    {
      v27 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_rawConfigurationDictionary];
      [(NSDictionary *)v27 addEntriesFromDictionary:v4];
      v28 = (NSDictionary *)[(NSDictionary *)v27 copy];
      v29 = self->_rawConfigurationDictionary;
      self->_rawConfigurationDictionary = v28;
    }
    else
    {
      v30 = (NSDictionary *)[(NSDictionary *)v4 copy];
      v27 = self->_rawConfigurationDictionary;
      self->_rawConfigurationDictionary = v30;
    }
  }
  v43 = v17;
  v31 = [(NSDictionary *)v4 PKArrayContaining:objc_opt_class() forKey:@"requirements"];
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v31, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v33 = v31;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = [[PKPaymentSetupFieldRequirement alloc] initWithDictionary:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        if ([(PKPaymentSetupFieldRequirement *)v38 type]) {
          [v32 addObject:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v35);
  }

  v39 = (NSArray *)[v32 copy];
  requirements = self->_requirements;
  self->_requirements = v39;
}

- (BOOL)isBuiltIn
{
  return 0;
}

- (BOOL)supportsAddressAutofill
{
  return 0;
}

- (BOOL)isFieldTypeText
{
  return [(PKPaymentSetupField *)self fieldType] == 1;
}

- (BOOL)isFieldTypeDate
{
  return [(PKPaymentSetupField *)self fieldType] == 2;
}

- (BOOL)isFieldTypeLabel
{
  return [(PKPaymentSetupField *)self fieldType] == 3;
}

- (BOOL)isFieldTypeFooter
{
  return [(PKPaymentSetupField *)self fieldType] == 4;
}

- (BOOL)isFieldTypePicker
{
  return [(PKPaymentSetupField *)self fieldType] == 5;
}

- (BOOL)preventVoiceOver
{
  return 0;
}

- (BOOL)_shouldStripDiacritics
{
  if ([(PKPaymentSetupField *)self isFieldTypeLabel]) {
    return 0;
  }
  else {
    return ![(PKPaymentSetupField *)self isFieldTypeFooter];
  }
}

- (id)textFieldObject
{
  if ([(PKPaymentSetupField *)self isFieldTypeText]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)dateFieldObject
{
  if ([(PKPaymentSetupField *)self isFieldTypeDate]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)labelFieldObject
{
  if ([(PKPaymentSetupField *)self isFieldTypeLabel]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)footerFieldObject
{
  if ([(PKPaymentSetupField *)self isFieldTypeFooter]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (id)pickerFieldObject
{
  if ([(PKPaymentSetupField *)self isFieldTypePicker]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (NSString)localizedPlaceholder
{
  id v3 = self->_localizedPlaceholder;
  if (!v3)
  {
    if (self->_optional) {
      v4 = @"OPTIONAL";
    }
    else {
      v4 = @"REQUIRED";
    }
    PKLocalizedPaymentString(&v4->isa, 0);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)displayString
{
  id v3 = [(PKPaymentSetupField *)self currentValue];
  if (!v3)
  {
    id v3 = [(PKPaymentSetupField *)self defaultValue];
  }
  return v3;
}

- (id)submissionString
{
  id v3 = [(PKPaymentSetupField *)self currentValue];
  v4 = [(PKPaymentSetupField *)self _submissionStringForValue:v3];

  return v4;
}

- (id)_submissionStringForValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = [(PKPaymentSetupField *)self defaultValue];
  }

  return v5;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  return 1;
}

- (BOOL)submissionStringMeetsValidationRegex
{
  return 1;
}

- (void)setLocalizedDisplayName:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = @"localizedDisplayName";
    v8[0] = a3;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    uint64_t v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

    [(PKPaymentSetupField *)self updateWithConfiguration:v6];
  }
}

- (void)_setLocalizedDisplayName:(id)a3
{
  if (self->_localizedDisplayName != a3)
  {
    id v4 = (NSString *)[a3 copy];
    localizedDisplayName = self->_localizedDisplayName;
    self->_localizedDisplayName = v4;
  }
}

- (void)setDefaultValue:(id)a3
{
  if (self->_defaultValue != a3)
  {
    id v4 = (NSString *)[a3 copy];
    defaultValue = self->_defaultValue;
    self->_defaultValue = v4;

    [(PKPaymentSetupField *)self noteCurrentValueChanged];
  }
}

- (void)setCurrentValue:(id)a3
{
  if (self->_currentValue != a3)
  {
    id v4 = [a3 copyWithZone:0];
    currentValue = self->_currentValue;
    self->_currentValue = v4;

    [(DIAttribute *)self->_attribute setCurrentValue:self->_currentValue];
    [(PKPaymentSetupField *)self noteCurrentValueChanged];
  }
}

- (void)setOriginalCameraCaptureValue:(id)a3
{
  if (self->_originalCameraCaptureValue != a3)
  {
    id v4 = [a3 copyWithZone:0];
    originalCameraCaptureValue = self->_originalCameraCaptureValue;
    self->_originalCameraCaptureValue = v4;
  }
}

- (BOOL)isCurrentValueFromCameraCapture
{
  return self->_source == 1;
}

- (void)setSource:(unint64_t)a3
{
  if (self->_source != a3)
  {
    self->_source = a3;
    [(PKPaymentSetupField *)self noteCurrentValueChanged];
  }
}

- (unint64_t)fieldType
{
  return 0;
}

+ (Class)classForIdentifier:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [@"cardholderName" isEqualToString:v5];
    if (a4 > 1 || (v7 & 1) == 0)
    {
      char v8 = [@"primaryAccountNumber" isEqualToString:v6];
      if (a4 > 1 || (v8 & 1) == 0)
      {
        char v9 = [@"cardExpiration" isEqualToString:v6];
        if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 || (v9 & 1) == 0)
        {
          char v10 = [@"cardSecurityCode" isEqualToString:v6];
          if (a4 > 1 || (v10 & 1) == 0)
          {
            char v11 = [@"cardOnFilePrimaryAccountNumber" isEqualToString:v6];
            if (a4 > 1 || (v11 & 1) == 0)
            {
              char v12 = [@"firstName" isEqualToString:v6];
              if (a4 > 1 || (v12 & 1) == 0)
              {
                char v13 = [@"lastName" isEqualToString:v6];
                if (a4 > 1 || (v13 & 1) == 0)
                {
                  char v14 = [@"email" isEqualToString:v6];
                  if (a4 > 1 || (v14 & 1) == 0)
                  {
                    if ([@"addressLine1" isEqualToString:v6])
                    {
                      if (a4 >= 2)
                      {
                        if (([@"addressLine2" isEqualToString:v6] & 1) == 0) {
                          [@"street2" isEqualToString:v6];
                        }
                        goto LABEL_27;
                      }
                    }
                    else
                    {
                      char v15 = [@"street1" isEqualToString:v6];
                      if (a4 > 1 || (v15 & 1) == 0)
                      {
                        if ([@"addressLine2" isEqualToString:v6])
                        {
                          if (a4 >= 2)
                          {
LABEL_27:
                            [@"postalCode" isEqualToString:v6];
                            goto LABEL_28;
                          }
                        }
                        else
                        {
                          char v18 = [@"street2" isEqualToString:v6];
                          if (a4 > 1 || (v18 & 1) == 0)
                          {
                            char v20 = [@"postalCode" isEqualToString:v6];
                            if (a4 > 1 || (v20 & 1) == 0)
                            {
LABEL_28:
                              char v16 = [@"dateOfBirth" isEqualToString:v6];
                              if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 || (v16 & 1) == 0)
                              {
                                char v17 = [@"subLocality" isEqualToString:v6];
                                if (a4 > 1 || (v17 & 1) == 0)
                                {
                                  char v19 = [@"administrativeArea" isEqualToString:v6];
                                  if ((a4 > 1 || (v19 & 1) == 0)
                                    && (![@"state" isEqualToString:v6]
                                     || a4 && a4 != 5))
                                  {
                                    char v21 = [@"city" isEqualToString:v6];
                                    if ((a4 > 1 || (v21 & 1) == 0)
                                      && (![@"countryCode" isEqualToString:v6]
                                       || a4 && a4 != 5))
                                    {
                                      char v22 = [@"phoneNumber" isEqualToString:v6];
                                      if ((a4 > 1 || (v22 & 1) == 0)
                                        && (![@"citizenship" isEqualToString:v6]
                                         || a4 && a4 != 5))
                                      {
                                        char v23 = [@"yearlyIncome" isEqualToString:v6];
                                        if (a4 > 1 || (v23 & 1) == 0)
                                        {
                                          char v24 = [@"totalIncome" isEqualToString:v6];
                                          if (a4 > 1 || (v24 & 1) == 0)
                                          {
                                            char v25 = [@"totalAssets" isEqualToString:v6];
                                            if ((a4 > 1 || (v25 & 1) == 0)
                                              && (![@"totalAssetsPicker" isEqualToString:v6]|| a4 && a4 != 5)&& (!objc_msgSend(@"yearlyIncomeLabel", "isEqualToString:", v6)|| a4 && a4 != 3))
                                            {
                                              char v28 = [@"ssnFull" isEqualToString:v6];
                                              if (a4 > 1 || (v28 & 1) == 0)
                                              {
                                                char v29 = [@"ssnSuffix" isEqualToString:v6];
                                                if (a4 > 1 || (v29 & 1) == 0)
                                                {
                                                  char v30 = [@"transactionLimit" isEqualToString:v6];
                                                  if (a4 > 1 || (v30 & 1) == 0)
                                                  {
                                                    char v31 = [@"monthlySpendLimit" isEqualToString:v6];
                                                    if ((a4 > 1 || (v31 & 1) == 0)
                                                      && (![@"aboutCreditReporting" isEqualToString:v6]|| a4 && a4 != 3))
                                                    {
                                                      char v32 = [@"balance" isEqualToString:v6];
                                                      if (a4 > 1 || (v32 & 1) == 0)
                                                      {
                                                        char v33 = [@"otpCode" isEqualToString:v6];
                                                        if ((a4 > 1 || (v33 & 1) == 0) && a4 - 1 > 4)
                                                        {
                                                          id v5 = 0;
                                                          goto LABEL_62;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    id v5 = (id)objc_opt_class();
  }
LABEL_62:
  v26 = (objc_class *)v5;

  return v26;
}

- (void)noteCurrentValueChanged
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"PKPaymentSetupFieldCurrentValueChangedNotification" object:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_localizedPlaceholder copyWithZone:a3];
  char v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_displayFormat copyWithZone:a3];
  char v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  *(unsigned char *)(v5 + 24) = self->_optional;
  *(unsigned char *)(v5 + 25) = self->_readonly;
  *(unsigned char *)(v5 + 26) = self->_hidden;
  uint64_t v10 = [(NSString *)self->_submissionKey copyWithZone:a3];
  char v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  uint64_t v12 = [(NSString *)self->_submissionDestination copyWithZone:a3];
  char v13 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v12;

  *(unsigned char *)(v5 + 28) = self->_requiresSecureSubmission;
  objc_storeStrong((id *)(v5 + 128), self->_rawConfigurationDictionary);
  uint64_t v14 = [(NSString *)self->_defaultValue copyWithZone:a3];
  char v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  *(unsigned char *)(v5 + 29) = self->_populateFromMeCard;
  objc_storeStrong((id *)(v5 + 32), self->_attribute);
  uint64_t v16 = [(NSString *)self->_identifier copyWithZone:a3];
  char v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_localizedDisplayName copyWithZone:a3];
  char v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  uint64_t v20 = [self->_currentValue copyWithZone:a3];
  char v21 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v20;

  uint64_t v22 = [self->_originalCameraCaptureValue copyWithZone:a3];
  char v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  *(void *)(v5 + 88) = self->_source;
  uint64_t v24 = [(NSString *)self->_odiAttribute copyWithZone:a3];
  char v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  uint64_t v26 = [(NSArray *)self->_requirements copyWithZone:a3];
  v27 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v26;

  return (id)v5;
}

- (NSObject)currentValue
{
  return self->_currentValue;
}

- (DIAttribute)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedPlaceholder:(id)a3
{
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (void)setDisplayFormat:(id)a3
{
}

- (NSString)defaultValue
{
  return self->_defaultValue;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int64_t)groupNumber
{
  return self->_groupNumber;
}

- (NSObject)originalCameraCaptureValue
{
  return self->_originalCameraCaptureValue;
}

- (void)setCurrentValueFromCameraCapture:(BOOL)a3
{
  self->_currentValueFromCameraCapture = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (NSString)submissionKey
{
  return self->_submissionKey;
}

- (void)setSubmissionKey:(id)a3
{
}

- (NSString)submissionDestination
{
  return self->_submissionDestination;
}

- (void)setSubmissionDestination:(id)a3
{
}

- (BOOL)requiresSecureSubmission
{
  return self->_requiresSecureSubmission;
}

- (void)setRequiresSecureSubmission:(BOOL)a3
{
  self->_requiresSecureSubmission = a3;
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (NSArray)requirements
{
  return self->_requirements;
}

- (NSDictionary)rawConfigurationDictionary
{
  return self->_rawConfigurationDictionary;
}

- (BOOL)populateFromMeCard
{
  return self->_populateFromMeCard;
}

- (void)setPopulateFromMeCard:(BOOL)a3
{
  self->_populateFromMeCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_odiAttribute, 0);
  objc_storeStrong((id *)&self->_submissionDestination, 0);
  objc_storeStrong((id *)&self->_submissionKey, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
  objc_storeStrong((id *)&self->_originalCameraCaptureValue, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
}

+ (id)newRandomlyGeneratedField
{
  uint64_t v2 = arc4random_uniform(0x64u);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"identifier-%i", v2);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  switch(arc4random_uniform(5u))
  {
    case 0u:
      uint64_t v5 = @"First";
      break;
    case 1u:
      uint64_t v5 = @"Second";
      break;
    case 2u:
      uint64_t v5 = @"Second Name";
      break;
    case 3u:
      uint64_t v5 = @"Oh, Why So Long!";
      break;
    case 4u:
      objc_msgSend(NSString, "stringWithFormat:", @"Field %i", v2);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v5 = &stru_1EE0F5368;
      break;
  }
  [v4 setObject:v5 forKey:@"localizedDisplayName"];

  if (arc4random_uniform(2u))
  {
    uint32_t v6 = arc4random_uniform(4u);
    if (v6 > 3) {
      char v7 = &stru_1EE0F5368;
    }
    else {
      char v7 = off_1E56DC018[v6];
    }
    [v4 setObject:v7 forKey:@"defaultValue"];
  }
  uint32_t v8 = arc4random_uniform(3u);
  if (v8 == 2)
  {
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"rsub%i", arc4random_uniform(0x64u) + 100);
    [v4 setObject:v9 forKey:@"submissionKey"];
  }
  else if (v8 == 1)
  {
    [v4 setObject:v3 forKey:@"submissionKey"];
  }
  if (arc4random_uniform(2u)) {
    uint64_t v10 = @"eligibility";
  }
  else {
    uint64_t v10 = @"enable";
  }
  [v4 setObject:v10 forKey:@"submissionDestination"];
  char v11 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
  [v4 setObject:v11 forKey:@"requiresSecureSubmission"];

  if (!arc4random_uniform(2u))
  {
    [v4 setObject:@"date" forKey:@"fieldType"];
    uint64_t v18 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
    [v4 setObject:v18 forKey:@"showsDay"];

    char v19 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
    [v4 setObject:v19 forKey:@"showsMonth"];

    uint64_t v20 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
    [v4 setObject:v20 forKey:@"showsYear"];

    uint32_t v21 = arc4random_uniform(6u);
    if (v21 > 5) {
      uint64_t v22 = &stru_1EE0F5368;
    }
    else {
      uint64_t v22 = off_1E56DC038[v21];
    }
    [v4 setObject:v22 forKey:@"displayFormat"];
    if (arc4random_uniform(2u)) {
      uint64_t v16 = @"MM/yy";
    }
    else {
      uint64_t v16 = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    }
    char v17 = @"submissionFormat";
    goto LABEL_36;
  }
  [v4 setObject:@"text" forKey:@"fieldType"];
  uint64_t v12 = [NSNumber numberWithInt:arc4random_uniform(4u)];
  [v4 setObject:v12 forKey:@"minLength"];

  if (arc4random_uniform(2u))
  {
    char v13 = [NSNumber numberWithInt:arc4random_uniform(0xAu) + 3];
    [v4 setObject:v13 forKey:@"maxLength"];
  }
  if (arc4random_uniform(2u))
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
    uint64_t v14 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
    [v4 setObject:v14 forKey:@"secureVisibleText"];
  }
  if (arc4random_uniform(2u))
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"numeric"];
    char v15 = [NSNumber numberWithBool:arc4random_uniform(2u) != 0];
    [v4 setObject:v15 forKey:@"useLuhnCheck"];
  }
  if (arc4random_uniform(2u))
  {
    uint64_t v16 = @"XXX XX X  XXX";
    char v17 = @"displayFormat";
LABEL_36:
    [v4 setObject:v16 forKey:v17];
  }
  char v23 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v3 configuration:v4];

  return v23;
}

+ (id)sampleCustomPaymentSetupFields
{
  v70[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:@"label" forKey:@"fieldType"];
  [v3 setObject:@"The below fields are for testing purposes only. \nTheir values are not used!" forKey:@"defaultValue"];
  id v4 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"labelShort" configuration:v3];
  [v2 safelyAddObject:v4];

  [v3 removeAllObjects];
  [v3 setObject:@"date" forKey:@"fieldType"];
  [v3 setObject:@"Date of Birth" forKey:@"localizedDisplayName"];
  objc_msgSend(v3, "setObject:forKey:", @"enable");
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"showsDay"];
  [v3 setObject:v5 forKey:@"showsMonth"];
  [v3 setObject:v5 forKey:@"showsYear"];
  [v3 setObject:@"MM/dd/yy" forKey:@"displayFormat"];
  [v3 setObject:@"yyyy-MM-dd" forKey:@"submissionFormat"];
  [v3 setObject:@"1995-01-01" forKey:@"defaultValue"];
  [v3 setObject:v5 forKey:@"optional"];
  uint32_t v6 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"birthDate" configuration:v3];
  [v2 safelyAddObject:v6];

  [v3 removeAllObjects];
  [v3 setObject:@"date" forKey:@"fieldType"];
  [v3 setObject:@"Birth Year" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:@"Custom Placeholder" forKey:@"localizedPlaceholder"];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"showsDay"];
  [v3 setObject:v7 forKey:@"showsMonth"];
  [v3 setObject:v5 forKey:@"showsYear"];
  [v3 setObject:@"yyyy" forKey:@"displayFormat"];
  [v3 setObject:@"yyyy" forKey:@"submissionFormat"];
  [v3 setObject:@"1995" forKey:@"defaultValue"];
  uint32_t v8 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"birthYear" configuration:v3];
  [v2 safelyAddObject:v8];

  [v3 removeAllObjects];
  [v3 setObject:@"date" forKey:@"fieldType"];
  [v3 setObject:@"Birth Month" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"showsDay"];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  objc_msgSend(v3, "setObject:forKey:");
  uint64_t v11 = v9;
  [v3 setObject:v9 forKey:@"showsYear"];
  [v3 setObject:@"MMMM" forKey:@"displayFormat"];
  [v3 setObject:@"MM" forKey:@"submissionFormat"];
  [v3 setObject:@"12" forKey:@"defaultValue"];
  uint64_t v12 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"birthMonth" configuration:v3];
  [v2 safelyAddObject:v12];

  [v3 removeAllObjects];
  objc_msgSend(v3, "setObject:forKey:", @"date");
  objc_msgSend(v3, "setObject:forKey:", @"Birth Day");
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:v10 forKey:@"showsDay"];
  [v3 setObject:v11 forKey:@"showsMonth"];
  [v3 setObject:v11 forKey:@"showsYear"];
  [v3 setObject:@"dd" forKey:@"displayFormat"];
  [v3 setObject:@"dd" forKey:@"submissionFormat"];
  [v3 setObject:@"01" forKey:@"defaultValue"];
  char v13 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"birthDay" configuration:v3];
  [v2 safelyAddObject:v13];

  [v3 removeAllObjects];
  [v3 setObject:@"date" forKey:@"fieldType"];
  [v3 setObject:@"Birth Day Year" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"showsDay"];
  [v3 setObject:v11 forKey:@"showsMonth"];
  [v3 setObject:v14 forKey:@"showsYear"];
  [v3 setObject:@"dd/yyyy" forKey:@"displayFormat"];
  [v3 setObject:@"dd/yyyy" forKey:@"submissionFormat"];
  [v3 setObject:@"02/2012" forKey:@"defaultValue"];
  char v15 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"birthDayYear" configuration:v3];
  [v2 safelyAddObject:v15];

  [v3 removeAllObjects];
  [v3 setObject:@"picker" forKey:@"fieldType"];
  [v3 setObject:@"Color Picker" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:@"color_blue" forKey:@"defaultValue"];
  v68[0] = @"localizedDisplayName";
  v68[1] = @"submissionValue";
  v69[0] = @"Red!";
  v69[1] = @"color_red";
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v70[0] = v16;
  v66[0] = @"localizedDisplayName";
  v66[1] = @"submissionValue";
  v67[0] = @"Green!";
  v67[1] = @"color_green";
  char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  v70[1] = v17;
  v64[0] = @"localizedDisplayName";
  v64[1] = @"submissionValue";
  v65[0] = @"Blue!";
  v65[1] = @"color_blue";
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v70[2] = v18;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];

  [v3 setObject:v63 forKey:@"pickerItems"];
  char v19 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"colorPicker" configuration:v3];
  [v2 safelyAddObject:v19];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Phone" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B750 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B750 forKey:@"maxLength"];
  uint64_t v20 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"secureText"];
  [v3 setObject:v20 forKey:@"secureVisibleText"];
  uint64_t v21 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"numeric"];
  [v3 setObject:v20 forKey:@"useLuhnCheck"];
  [v3 setObject:@"(XXX) XXX-XXXX" forKey:@"displayFormat"];
  uint64_t v22 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"usaPhone" configuration:v3];
  [v2 safelyAddObject:v22];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"ZIP Code" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B768 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B768 forKey:@"maxLength"];
  uint64_t v23 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"secureText"];
  [v3 setObject:v23 forKey:@"secureVisibleText"];
  [v3 setObject:v21 forKey:@"numeric"];
  [v3 setObject:v23 forKey:@"useLuhnCheck"];
  [v3 setObject:&stru_1EE0F5368 forKey:@"displayFormat"];
  uint64_t v24 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"usaZIP" configuration:v3];
  [v2 safelyAddObject:v24];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Overly long ZIP Code (UK) and then some" forKey:@"localizedDisplayName"];
  [v3 setObject:@"Custom Placeholder" forKey:@"localizedPlaceholder"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B780 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B780 forKey:@"maxLength"];
  [v3 setObject:v23 forKey:@"secureText"];
  [v3 setObject:v23 forKey:@"secureVisibleText"];
  [v3 setObject:v23 forKey:@"numeric"];
  [v3 setObject:v23 forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXX-XXX" forKey:@"displayFormat"];
  char v25 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"ukZIP" configuration:v3];
  [v2 safelyAddObject:v25];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"SSN" forKey:@"localizedDisplayName"];
  objc_msgSend(v3, "setObject:forKey:");
  [v3 setObject:&unk_1EE22B798 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B798 forKey:@"maxLength"];
  uint64_t v26 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v26 forKey:@"secureVisibleText"];
  [v3 setObject:v26 forKey:@"numeric"];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXX-XX-XXXX" forKey:@"displayFormat"];
  v27 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"ssn" configuration:v3];
  [v2 safelyAddObject:v27];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"CURP (MX)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7B0 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7B0 forKey:@"maxLength"];
  uint64_t v28 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  uint64_t v29 = v28;
  [v3 setObject:v28 forKey:@"secureVisibleText"];
  uint64_t v30 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"numeric"];
  [v3 setObject:v30 forKey:@"useLuhnCheck"];
  [v3 setObject:&stru_1EE0F5368 forKey:@"displayFormat"];
  char v31 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"curp" configuration:v3];
  [v2 safelyAddObject:v31];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"HKID (HK)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7C8 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B798 forKey:@"maxLength"];
  uint64_t v32 = v29;
  [v3 setObject:v29 forKey:@"secureText"];
  [v3 setObject:v29 forKey:@"secureVisibleText"];
  uint64_t v33 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"numeric"];
  [v3 setObject:v33 forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXXXXXXXX" forKey:@"displayFormat"];
  uint64_t v34 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"hkid" configuration:v3];
  [v2 safelyAddObject:v34];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"NIR (FR)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7E0 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7E0 forKey:@"maxLength"];
  [v3 setObject:v32 forKey:@"secureText"];
  [v3 setObject:v32 forKey:@"secureVisibleText"];
  uint64_t v35 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"numeric"];
  [v3 setObject:v35 forKey:@"useLuhnCheck"];
  objc_msgSend(v3, "setObject:forKey:", @"XXXXXXXXXXXXX XX");
  uint64_t v36 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"nir" configuration:v3];
  [v2 safelyAddObject:v36];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"BSN (NL)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B798 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B798 forKey:@"maxLength"];
  [v3 setObject:v32 forKey:@"secureText"];
  [v3 setObject:v32 forKey:@"secureVisibleText"];
  [v3 setObject:v32 forKey:@"numeric"];
  [v3 setObject:v35 forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXXXXXXXX" forKey:@"displayFormat"];
  v37 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"bsn" configuration:v3];
  [v2 safelyAddObject:v37];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"AHV-Nr. (CH)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7B0 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7B0 forKey:@"maxLength"];
  [v3 setObject:v32 forKey:@"secureText"];
  [v3 setObject:v32 forKey:@"secureVisibleText"];
  [v3 setObject:v32 forKey:@"numeric"];
  uint64_t v38 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXX.XXXX.XXXX.XX" forKey:@"displayFormat"];
  v39 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"ahvnr" configuration:v3];
  [v2 safelyAddObject:v39];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"NINO (UK)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B798 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B798 forKey:@"maxLength"];
  uint64_t v40 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v40 forKey:@"secureVisibleText"];
  [v3 setObject:v38 forKey:@"numeric"];
  [v3 setObject:v38 forKey:@"useLuhnCheck"];
  [v3 setObject:@"XX XX XX XX X" forKey:@"displayFormat"];
  v41 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"nino" configuration:v3];
  [v2 safelyAddObject:v41];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"NHS No. (UK)" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B750 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B750 forKey:@"maxLength"];
  uint64_t v42 = MEMORY[0x1E4F1CC38];
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E4F1CC38]);
  [v3 setObject:v42 forKey:@"secureVisibleText"];
  [v3 setObject:v42 forKey:@"numeric"];
  uint64_t v43 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"useLuhnCheck"];
  [v3 setObject:@"XXX-XXX-XXXX" forKey:@"displayFormat"];
  v44 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"nhsno" configuration:v3];
  [v2 safelyAddObject:v44];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Kohl's PIN" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B780 forKey:@"maxLength"];
  uint64_t v45 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v43 forKey:@"secureVisibleText"];
  [v3 setObject:v45 forKey:@"numeric"];
  [v3 setObject:v43 forKey:@"useLuhnCheck"];
  [v3 setObject:&stru_1EE0F5368 forKey:@"displayFormat"];
  v46 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"kohlsPin" configuration:v3];
  [v2 safelyAddObject:v46];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Macy's PIN" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"maxLength"];
  uint64_t v47 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  uint64_t v48 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"secureVisibleText"];
  [v3 setObject:v47 forKey:@"numeric"];
  [v3 setObject:v48 forKey:@"useLuhnCheck"];
  [v3 setObject:&stru_1EE0F5368 forKey:@"displayFormat"];
  long long v49 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"macysPin" configuration:v3];
  [v2 safelyAddObject:v49];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Disc Sq. No." forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B810 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B810 forKey:@"maxLength"];
  uint64_t v50 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v50 forKey:@"secureVisibleText"];
  [v3 setObject:v50 forKey:@"numeric"];
  [v3 setObject:v48 forKey:@"useLuhnCheck"];
  [v3 setObject:@"AXXX" forKey:@"localizedPlaceholder"];
  [v3 setObject:@"AXXX" forKey:@"displayFormat"];
  [v3 setObject:@"X" forKey:@"displayFormatPlaceholder"];
  long long v51 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"disc" configuration:v3];
  [v2 safelyAddObject:v51];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"CVV 4 S" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"maxLength"];
  uint64_t v52 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v48 forKey:@"secureVisibleText"];
  [v3 setObject:v52 forKey:@"numeric"];
  [v3 setObject:v48 forKey:@"useLuhnCheck"];
  v53 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"ccvS4" configuration:v3];
  [v2 safelyAddObject:v53];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"CVV 4 SV" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B7F8 forKey:@"maxLength"];
  uint64_t v54 = MEMORY[0x1E4F1CC38];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"secureText"];
  [v3 setObject:v54 forKey:@"secureVisibleText"];
  [v3 setObject:v54 forKey:@"numeric"];
  uint64_t v55 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"useLuhnCheck"];
  v56 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"ccvSV4" configuration:v3];
  [v2 safelyAddObject:v56];

  [v3 removeAllObjects];
  [v3 setObject:@"text" forKey:@"fieldType"];
  [v3 setObject:@"Parens Check Card Last 5" forKey:@"localizedDisplayName"];
  [v3 setObject:@"enable" forKey:@"submissionDestination"];
  [v3 setObject:&unk_1EE22B768 forKey:@"minLength"];
  [v3 setObject:&unk_1EE22B768 forKey:@"maxLength"];
  [v3 setObject:v54 forKey:@"secureText"];
  [v3 setObject:v54 forKey:@"secureVisibleText"];
  [v3 setObject:v54 forKey:@"numeric"];
  [v3 setObject:v55 forKey:@"useLuhnCheck"];
  [v3 setObject:@"Last 5 digits" forKey:@"localizedPlaceholder"];
  [v3 setObject:@"XXXX (X)" forKey:@"displayFormat"];
  v57 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"parensCheck" configuration:v3];
  [v2 safelyAddObject:v57];

  [v3 removeAllObjects];
  [v3 setObject:@"label" forKey:@"fieldType"];
  [v3 setObject:@"This is a center label" forKey:@"defaultValue"];
  [v3 setObject:@"center" forKey:@"alignment"];
  v58 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"centerLabel" configuration:v3];
  [v2 safelyAddObject:v58];

  [v3 removeAllObjects];
  [v3 setObject:@"label" forKey:@"fieldType"];
  [v3 setObject:@"This is a left label" forKey:@"defaultValue"];
  [v3 setObject:@"left" forKey:@"alignment"];
  v59 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"leftLabel" configuration:v3];
  [v2 safelyAddObject:v59];

  [v3 removeAllObjects];
  [v3 setObject:@"label" forKey:@"fieldType"];
  [v3 setObject:@"This is a really long label. You should really not be reading this! Feel free to not read this in the future. Also, here is some more text for some more fun!", @"defaultValue" forKey];
  v60 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"labelLong" configuration:v3];
  [v2 safelyAddObject:v60];

  [v3 removeAllObjects];
  [v3 setObject:@"footer" forKey:@"fieldType"];
  [v3 setObject:@"Adding a Suica card will associate it with your Apple Account so it can be backed up. When you use your card, the station names from your recent transactions can be accessed.", @"defaultValue" forKey];
  v61 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"footerLong" configuration:v3];
  [v2 safelyAddObject:v61];

  [v3 removeAllObjects];
  return v2;
}

@end