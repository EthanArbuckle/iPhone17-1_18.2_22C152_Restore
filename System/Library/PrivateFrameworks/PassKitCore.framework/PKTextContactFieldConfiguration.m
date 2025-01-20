@interface PKTextContactFieldConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isNumeric;
- (BOOL)isValidCharacterSet;
- (BOOL)keepPaddingCharactersForSubmission;
- (NSCharacterSet)characterSet;
- (NSRegularExpression)validRegex;
- (NSString)displayFormat;
- (NSString)displayFormatPlaceholder;
- (PKTextContactFieldConfiguration)initWithCoder:(id)a3;
- (PKTextContactFieldConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)maxLength;
- (int64_t)minLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKTextContactFieldConfiguration

- (PKTextContactFieldConfiguration)initWithDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTextContactFieldConfiguration;
  v5 = [(PKContactFieldConfiguration *)&v34 initWithType:1];
  if (!v5) {
    goto LABEL_53;
  }
  v5->_minLength = [v4 PKIntegerForKey:@"minLength"];
  v5->_maxLength = [v4 PKIntegerForKey:@"maxLength"];
  v5->_numeric = [v4 PKBoolForKey:@"numeric"];
  uint64_t v6 = [v4 PKStringForKey:@"displayFormat"];
  displayFormat = v5->_displayFormat;
  v5->_displayFormat = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"displayFormatPlaceholder"];
  displayFormatPlaceholder = v5->_displayFormatPlaceholder;
  v5->_displayFormatPlaceholder = (NSString *)v8;

  v5->_keepPaddingCharactersForSubmission = [v4 PKBoolForKey:@"keepPaddingCharactersForSubmission"];
  v5->_isValidCharacterSet = [v4 PKBoolForKey:@"isValidCharacterSet"];
  v10 = [v4 PKArrayForKey:@"characterSetDescriptions"];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
    if ([v12 count])
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F28E58]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:buf count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v32 = v12;
        uint64_t v17 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(id *)(*((void *)&v35 + 1) + 8 * i);
            if ([v19 isEqualToString:@"alphanumericCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            }
            else if ([v19 isEqualToString:@"capitalizedLetterCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] capitalizedLetterCharacterSet];
            }
            else if ([v19 isEqualToString:@"controlCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] controlCharacterSet];
            }
            else if ([v19 isEqualToString:@"decimalDigitCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
            }
            else if ([v19 isEqualToString:@"decomposableCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] decomposableCharacterSet];
            }
            else if ([v19 isEqualToString:@"illegalCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] illegalCharacterSet];
            }
            else if ([v19 isEqualToString:@"letterCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] letterCharacterSet];
            }
            else if ([v19 isEqualToString:@"lowercaseLetterCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] lowercaseLetterCharacterSet];
            }
            else if ([v19 isEqualToString:@"newlineCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            }
            else if ([v19 isEqualToString:@"nonBaseCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] nonBaseCharacterSet];
            }
            else if ([v19 isEqualToString:@"punctuationCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
            }
            else if ([v19 isEqualToString:@"symbolCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
            }
            else if ([v19 isEqualToString:@"uppercaseLetterCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
            }
            else if ([v19 isEqualToString:@"whitespaceAndNewlineCharacterSet"])
            {
              uint64_t v20 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            }
            else
            {
              if (([v19 isEqualToString:@"whitespaceCharacterSet"] & 1) == 0)
              {

LABEL_45:
                id v13 = 0;
                goto LABEL_46;
              }
              uint64_t v20 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            }
            v21 = (void *)v20;

            if (!v21) {
              goto LABEL_45;
            }
            [v13 formUnionWithCharacterSet:v21];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:buf count:16];
          if (v16) {
            continue;
          }
          break;
        }
LABEL_46:
        id v12 = v32;
      }

      uint64_t v22 = [v13 copy];
    }
    else
    {
      uint64_t v22 = 0;
    }

    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v22;

    if (!v5->_characterSet)
    {
      v30 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v5;
        __int16 v41 = 2112;
        id v42 = v12;
        _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "%@: Failed to initialize validCharacterSet with array: %@", buf, 0x16u);
      }

      goto LABEL_60;
    }
  }
  v24 = [v4 PKStringForKey:@"validRegex"];
  if (v24)
  {
    id v33 = 0;
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v24 options:0 error:&v33];
    id v26 = v33;
    validRegex = v5->_validRegex;
    v5->_validRegex = (NSRegularExpression *)v25;

    if (!v5->_validRegex || v26)
    {
      v29 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v5;
        __int16 v41 = 2112;
        id v42 = v26;
        _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "%@: Failed to initialize validRegex: %@", buf, 0x16u);
      }

LABEL_60:
      v28 = 0;
      goto LABEL_61;
    }
  }

LABEL_53:
  v28 = v5;
LABEL_61:

  return v28;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: '%ld'; ", @"minLength", self->_minLength];
  [v3 appendFormat:@"%@: '%ld'; ", @"maxLength", self->_maxLength];
  if (self->_numeric) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"numeric", v4];
  [v3 appendFormat:@"%@: '%@'; ", @"displayFormat", self->_displayFormat];
  objc_msgSend(v3, "appendFormat:", @"%@: '%@'; ",
    @"displayFormatPlaceholder",
    self->_displayFormatPlaceholder);
  if (self->_keepPaddingCharactersForSubmission) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"keepPaddingCharactersForSubmission", v5];
  [v3 appendFormat:@"%@: '%@'; ", @"characterSet", self->_characterSet];
  if (self->_isValidCharacterSet) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"isValidCharacterSet", v6];
  [v3 appendFormat:@"%@: '%@'; ", @"validRegex", self->_validRegex];
  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextContactFieldConfiguration;
  id v4 = a3;
  [(PKContactFieldConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_minLength, @"minLength", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_maxLength forKey:@"maxLength"];
  [v4 encodeBool:self->_numeric forKey:@"numeric"];
  [v4 encodeObject:self->_displayFormat forKey:@"displayFormat"];
  [v4 encodeObject:self->_displayFormatPlaceholder forKey:@"displayFormatPlaceholder"];
  [v4 encodeBool:self->_keepPaddingCharactersForSubmission forKey:@"keepPaddingCharactersForSubmission"];
  [v4 encodeObject:self->_characterSet forKey:@"characterSet"];
  [v4 encodeBool:self->_isValidCharacterSet forKey:@"isValidCharacterSet"];
  [v4 encodeObject:self->_validRegex forKey:@"validRegex"];
}

- (PKTextContactFieldConfiguration)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKTextContactFieldConfiguration;
  objc_super v5 = [(PKContactFieldConfiguration *)&v21 initWithCoder:v4];
  if (v5)
  {
    v5->_minLength = [v4 decodeIntegerForKey:@"minLength"];
    v5->_maxLength = [v4 decodeIntegerForKey:@"maxLength"];
    v5->_numeric = [v4 decodeBoolForKey:@"numeric"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayFormat"];
    displayFormat = v5->_displayFormat;
    v5->_displayFormat = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayFormatPlaceholder"];
    displayFormatPlaceholder = v5->_displayFormatPlaceholder;
    v5->_displayFormatPlaceholder = (NSString *)v8;

    v5->_keepPaddingCharactersForSubmission = [v4 decodeBoolForKey:@"keepPaddingCharactersForSubmission"];
    v5->_isValidCharacterSet = [v4 decodeBoolForKey:@"isValidCharacterSet"];
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = (void *)[v10 initWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"characterSet"];
    characterSet = v5->_characterSet;
    v5->_characterSet = (NSCharacterSet *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v17 = (void *)[v15 initWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"validRegex"];
    validRegex = v5->_validRegex;
    v5->_validRegex = (NSRegularExpression *)v18;
  }
  return v5;
}

- (int64_t)minLength
{
  return self->_minLength;
}

- (int64_t)maxLength
{
  return self->_maxLength;
}

- (BOOL)isNumeric
{
  return self->_numeric;
}

- (NSString)displayFormat
{
  return self->_displayFormat;
}

- (NSString)displayFormatPlaceholder
{
  return self->_displayFormatPlaceholder;
}

- (BOOL)keepPaddingCharactersForSubmission
{
  return self->_keepPaddingCharactersForSubmission;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (BOOL)isValidCharacterSet
{
  return self->_isValidCharacterSet;
}

- (NSRegularExpression)validRegex
{
  return self->_validRegex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validRegex, 0);
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_displayFormatPlaceholder, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
}

@end