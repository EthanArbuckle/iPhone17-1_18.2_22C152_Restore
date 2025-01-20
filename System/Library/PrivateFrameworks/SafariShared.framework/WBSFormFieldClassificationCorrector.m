@interface WBSFormFieldClassificationCorrector
- (NSDictionary)formValues;
- (NSString)domain;
- (WBSFormFieldClassificationCorrector)init;
- (WBSFormFieldClassificationCorrector)initWithDomain:(id)a3 formMetadata:(id)a4 formValues:(id)a5 uniqueIDsOfControlsThatWereAutoFilled:(id)a6;
- (WBSFormFieldClassificationCorrectorDelegate)delegate;
- (WBSFormMetadata)formMetadata;
- (id)_classificationCorrectionsForControlWithMetadata:(id)a3 wasIdentifiedAsAddressBookField:(BOOL *)a4;
- (void)processCorrections;
- (void)setDelegate:(id)a3;
@end

@implementation WBSFormFieldClassificationCorrector

- (WBSFormFieldClassificationCorrector)initWithDomain:(id)a3 formMetadata:(id)a4 formValues:(id)a5 uniqueIDsOfControlsThatWereAutoFilled:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WBSFormFieldClassificationCorrector;
  v14 = [(WBSFormFieldClassificationCorrector *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    domain = v14->_domain;
    v14->_domain = (NSString *)v15;

    objc_storeStrong((id *)&v14->_formMetadata, a4);
    uint64_t v17 = [v12 copy];
    formValues = v14->_formValues;
    v14->_formValues = (NSDictionary *)v17;

    uint64_t v19 = [v13 copy];
    uniqueIDsOfControlsThatWereAutoFilled = v14->_uniqueIDsOfControlsThatWereAutoFilled;
    v14->_uniqueIDsOfControlsThatWereAutoFilled = (NSSet *)v19;

    v21 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
    classificationToCorrectionsTransformer = v14->_classificationToCorrectionsTransformer;
    v14->_classificationToCorrectionsTransformer = v21;

    v23 = v14;
  }

  return v14;
}

- (WBSFormFieldClassificationCorrector)init
{
  return [(WBSFormFieldClassificationCorrector *)self initWithDomain:0 formMetadata:0 formValues:0 uniqueIDsOfControlsThatWereAutoFilled:0];
}

- (void)processCorrections
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Processing AutoFill corrections for %lu fields", buf, 0xCu);
}

- (id)_classificationCorrectionsForControlWithMetadata:(id)a3 wasIdentifiedAsAddressBookField:(BOOL *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isTextField] & 1) != 0
    || ([v6 selectElementInfo], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = [v6 addressBookLabel];
    BOOL v9 = ([v6 isLabeledUsernameField] & 1) == 0 && objc_msgSend(v8, "length") != 0;
    *a4 = v9;
    if ([v6 isAutoFilledTextField])
    {
      id v10 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)self->_classificationToCorrectionsTransformer transformedValue:0];
    }
    else
    {
      id v11 = [v6 fieldName];
      if ([v11 length])
      {
        id v12 = [(NSDictionary *)self->_formValues safari_stringForKey:v11];
      }
      else
      {
        id v12 = 0;
      }
      if (![v12 length])
      {
        uint64_t v15 = [v6 value];

        id v12 = (void *)v15;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uniqueIDsOfControlsThatWereAutoFilled = self->_uniqueIDsOfControlsThatWereAutoFilled;
      if (uniqueIDsOfControlsThatWereAutoFilled)
      {
        v18 = [v6 uniqueID];
        int v19 = [(NSSet *)uniqueIDsOfControlsThatWereAutoFilled containsObject:v18];
      }
      else
      {
        int v19 = 1;
      }
      if ([v12 length])
      {
        v20 = [WeakRetained formFieldClassificationCorrector:self bestAddressBookLabelForControlValue:v12];
        v21 = v20;
        if (v8 && [v20 isEqualToString:v8])
        {

          v21 = 0;
        }
        if (v9)
        {
          if (([WeakRetained formFieldClassificationCorrector:self hasAddressBookDataForAddressBookLabel:v8] & 1) == 0&& (objc_msgSend(WeakRetained, "formFieldClassificationCorrector:hasAddressBookDataForAddressBookLabel:", self, v21) & 1) == 0)
          {

            v21 = 0;
            *a4 = 0;
          }
        }
        else if ([v21 isEqualToString:&stru_1EFBE3CF8])
        {

          v21 = 0;
        }
        if ((v19 & 1) == 0 && ![v21 length])
        {

          v21 = 0;
          *a4 = 0;
        }
        id v10 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)self->_classificationToCorrectionsTransformer transformedValue:v21];
      }
      else
      {
        if (v19
          && v9
          && [WeakRetained formFieldClassificationCorrector:self hasAddressBookDataForAddressBookLabel:v8])
        {
          uint64_t v22 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)self->_classificationToCorrectionsTransformer transformedValue:&stru_1EFBE3CF8];
        }
        else
        {
          *a4 = 0;
          uint64_t v22 = [(WBSFormAutoFillClassificationToCorrectionsTransformer *)self->_classificationToCorrectionsTransformer transformedValue:0];
        }
        id v10 = (void *)v22;
      }
    }
  }
  else
  {
    id v13 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v6 fieldName];
      -[WBSFormFieldClassificationCorrector _classificationCorrectionsForControlWithMetadata:wasIdentifiedAsAddressBookField:](v14, v24, v13);
    }

    id v10 = 0;
    *a4 = 0;
  }

  return v10;
}

- (WBSFormFieldClassificationCorrectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSFormFieldClassificationCorrectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (WBSFormMetadata)formMetadata
{
  return self->_formMetadata;
}

- (NSDictionary)formValues
{
  return self->_formValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formValues, 0);
  objc_storeStrong((id *)&self->_formMetadata, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniqueIDsOfControlsThatWereAutoFilled, 0);
  objc_storeStrong((id *)&self->_classificationToCorrectionsTransformer, 0);
}

- (void)_classificationCorrectionsForControlWithMetadata:(os_log_t)log wasIdentifiedAsAddressBookField:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_DEBUG, "Field named '%@' is ineligible for AutoFill correction; returning nil corrections",
    buf,
    0xCu);
}

@end