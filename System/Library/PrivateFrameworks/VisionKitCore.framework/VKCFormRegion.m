@interface VKCFormRegion
+ (id)autoFillContentTypeForCRContentType:(unint64_t)a3;
- (BOOL)autofillNewContextStart;
- (NSArray)children;
- (NSString)autoFillContentType;
- (NSString)labelText;
- (VKCFormRegion)initWithSourceRegion:(id)a3;
- (VKQuad)quad;
- (double)suggestedLineHeight;
- (id)crFormFieldWithSize:(CGSize)a3;
- (id)debugDescription;
- (int64_t)maxCharacterCount;
- (unint64_t)contentType;
- (unint64_t)fieldSource;
- (unint64_t)fieldType;
- (unint64_t)regionType;
- (void)setAutofillNewContextStart:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setFieldSource:(unint64_t)a3;
- (void)setFieldType:(unint64_t)a3;
- (void)setLabelText:(id)a3;
- (void)setMaxCharacterCount:(int64_t)a3;
- (void)setQuad:(id)a3;
- (void)setSuggestedLineHeight:(double)a3;
@end

@implementation VKCFormRegion

- (VKCFormRegion)initWithSourceRegion:(id)a3
{
  id v4 = a3;
  v5 = [(VKCFormRegion *)self init];
  -[VKCFormRegion setFieldType:](v5, "setFieldType:", [v4 fieldType]);
  v6 = [v4 boundingQuad];
  v7 = [v6 vkQuad];
  [(VKCFormRegion *)v5 setQuad:v7];

  uint64_t v8 = objc_opt_class();
  v9 = VKDynamicCast(v8, (uint64_t)v4);
  -[VKCFormRegion setContentType:](v5, "setContentType:", [v9 textContentType]);
  -[VKCFormRegion setFieldSource:](v5, "setFieldSource:", [v9 fieldSource]);
  -[VKCFormRegion setMaxCharacterCount:](v5, "setMaxCharacterCount:", [v9 maxCharacterCount]);
  [v9 suggestedLineHeight];
  -[VKCFormRegion setSuggestedLineHeight:](v5, "setSuggestedLineHeight:");
  v10 = [v9 labelRegion];
  v11 = [v10 text];
  [(VKCFormRegion *)v5 setLabelText:v11];

  if (!v9)
  {
    v12 = [(VKCFormRegion *)v5 quad];
    [v12 maxHeight];
    -[VKCFormRegion setSuggestedLineHeight:](v5, "setSuggestedLineHeight:");
  }
  v13 = [v4 contentsWithTypes:0x2000];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  if ([v13 count])
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = objc_opt_class();
      v17 = [v13 objectAtIndexedSubscript:v15];
      v18 = VKDynamicCast(v16, (uint64_t)v17);

      v19 = [[VKCFormRegion alloc] initWithSourceRegion:v18];
      [v14 addObject:v19];

      ++v15;
    }
    while ([v13 count] > v15);
  }
  [(VKCFormRegion *)v5 setChildren:v14];
  [(VKCFormRegion *)v5 setAutofillNewContextStart:0];
  if (objc_opt_respondsToSelector()) {
    -[VKCFormRegion setAutofillNewContextStart:](v5, "setAutofillNewContextStart:", [v9 autofillNewContextStart]);
  }

  return v5;
}

- (id)crFormFieldWithSize:(CGSize)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FAF188]);
  v5 = [(VKCFormRegion *)self quad];
  [v5 boundingBox];
  v6 = objc_msgSend(v4, "initWithNormalizedBoundingBox:size:");

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FAF138]), "initWithQuad:type:source:value:contentType:maxCharacterCount:", v6, -[VKCFormRegion fieldType](self, "fieldType"), -[VKCFormRegion fieldSource](self, "fieldSource"), &stru_1F35566F8, -[VKCFormRegion contentType](self, "contentType"), -[VKCFormRegion maxCharacterCount](self, "maxCharacterCount"));
  return v7;
}

- (unint64_t)regionType
{
  unint64_t v3 = [(VKCFormRegion *)self fieldType];
  if (v3 == 2) {
    return 3;
  }
  if (v3 != 1) {
    return v3 == 0;
  }
  if ([(VKCFormRegion *)self contentType] == 50) {
    return 4;
  }
  return 2;
}

+ (id)autoFillContentTypeForCRContentType:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      getAFTextContentTypeName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      getAFTextContentTypeNamePrefix();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      getAFTextContentTypeGivenName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      getAFTextContentTypeMiddleName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 6uLL:
      getAFTextContentTypeFamilyName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 7uLL:
      getAFTextContentTypeNameSuffix();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 8uLL:
      getAFTextContentTypeNickname();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 9uLL:
      getAFTextContentTypeJobTitle();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xAuLL:
      getAFTextContentTypeOrganizationName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBuLL:
      getAFTextContentTypeLocation();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCuLL:
      getAFTextContentTypeFullStreetAddress();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xDuLL:
      getAFTextContentTypeStreetAddressLine1();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xEuLL:
      getAFTextContentTypeStreetAddressLine2();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0xFuLL:
      getAFTextContentTypeAddressCity();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x10uLL:
      getAFTextContentTypeAddressState();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x11uLL:
      getAFTextContentTypeAddressCityAndState();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x13uLL:
      getAFTextContentTypeCountryName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x14uLL:
      getAFTextContentTypePostalCode();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x15uLL:
      getAFTextContentTypeEmailAddress();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x16uLL:
      getAFTextContentTypeURL();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x17uLL:
      getAFTextContentTypePassword();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x18uLL:
      getAFTextContentTypeCreditCardName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x19uLL:
      getAFTextContentTypeCreditCardGivenName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1AuLL:
      getAFTextContentTypeCreditCardMiddleName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1BuLL:
      getAFTextContentTypeCreditCardFamilyName();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1CuLL:
      getAFTextContentTypeCreditCardNumber();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1DuLL:
      getAFTextContentTypeCreditCardExpiration();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1EuLL:
      getAFTextContentTypeCreditCardExpirationMonth();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x1FuLL:
      getAFTextContentTypeCreditCardExpirationYear();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x20uLL:
      getAFTextContentTypeCreditCardSecurityCode();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x21uLL:
      getAFTextContentTypeCreditCardType();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x25uLL:
      getAFTextContentTypeBirthdate();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x26uLL:
      getAFTextContentTypeBirthdateDay();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x27uLL:
      getAFTextContentTypeBirthdateMonth();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x28uLL:
      getAFTextContentTypeBirthdateYear();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2AuLL:
      getAFTextContentTypeTelephoneNumber();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2BuLL:
      getAFTextContentTypeTelephoneCountryCode();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2CuLL:
      getAFTextContentTypeTelephoneNationalNumber();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2DuLL:
      getAFTextContentTypeTelephoneAreaCode();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
      goto LABEL_7;
    case 0x31uLL:
      getAFTextContentTypeTelephoneExtension();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      id v4 = (id *)getAFTextContentTypeDateTimeSymbolLoc_ptr;
      uint64_t v12 = getAFTextContentTypeDateTimeSymbolLoc_ptr;
      if (!getAFTextContentTypeDateTimeSymbolLoc_ptr)
      {
        v5 = (void *)AutoFillCoreLibrary();
        v10[3] = (uint64_t)dlsym(v5, "AFTextContentTypeDateTime");
        getAFTextContentTypeDateTimeSymbolLoc_ptr = v10[3];
        id v4 = (id *)v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v4)
      {
        getkDDRVInteractionDidFinishNotification_cold_1();
LABEL_7:
        uint64_t v9 = 0;
        v10 = &v9;
        uint64_t v11 = 0x2020000000;
        id v4 = (id *)getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr;
        uint64_t v12 = getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr;
        if (!getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr)
        {
          v6 = (void *)AutoFillCoreLibrary();
          v10[3] = (uint64_t)dlsym(v6, "AFTextContentTypeTelephoneLocalNumber");
          getAFTextContentTypeTelephoneLocalNumberSymbolLoc_ptr = v10[3];
          id v4 = (id *)v10[3];
        }
        _Block_object_dispose(&v9, 8);
        if (!v4)
        {
          uint64_t v8 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
          _Block_object_dispose(&v9, 8);
          _Unwind_Resume(v8);
        }
      }
      id v3 = *v4;
      break;
    default:
      getAFTextContentTypeNone();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (NSString)autoFillContentType
{
  return (NSString *)+[VKCFormRegion autoFillContentTypeForCRContentType:self->_contentType];
}

- (id)debugDescription
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = [(VKCFormRegion *)self autoFillContentType];
  v27 = NSString;
  unint64_t v26 = [(VKCFormRegion *)self regionType];
  unint64_t v5 = [(VKCFormRegion *)self fieldSource];
  unint64_t v6 = [(VKCFormRegion *)self contentType];
  int64_t v7 = [(VKCFormRegion *)self maxCharacterCount];
  if (v7 == -1)
  {
    uint64_t v8 = @"uint_max";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[VKCFormRegion maxCharacterCount](self, "maxCharacterCount"));
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [(VKCFormRegion *)self suggestedLineHeight];
  uint64_t v10 = v9;
  BOOL v11 = [(VKCFormRegion *)self autofillNewContextStart];
  uint64_t v12 = [(VKCFormRegion *)self children];
  BOOL v25 = v11;
  v13 = (void *)v4;
  v14 = [v27 stringWithFormat:@"[VKCFormRegion] regionType:%lu source:%lu contentType:%lu autoFillType:%@, maxCharacterCount:%@ suggestedLineHeight:%lf autofillNewContextStart:%d #children:%lu", v26, v5, v6, v4, v8, v10, v25, objc_msgSend(v12, "count")];
  [v3 addObject:v14];

  if (v7 != -1) {
  long long v30 = 0u;
  }
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v15 = [(VKCFormRegion *)self children];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = NSString;
        v21 = [*(id *)(*((void *)&v28 + 1) + 8 * i) debugDescription];
        v22 = [v20 stringWithFormat:@"- %@", v21];
        [v3 addObject:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  v23 = [v3 componentsJoinedByString:@"\n"];

  return v23;
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (void)setFieldSource:(unint64_t)a3
{
  self->_fieldSource = a3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (BOOL)autofillNewContextStart
{
  return self->_autofillNewContextStart;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_autofillNewContextStart = a3;
}

- (int64_t)maxCharacterCount
{
  return self->_maxCharacterCount;
}

- (void)setMaxCharacterCount:(int64_t)a3
{
  self->_maxCharacterCount = a3;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end