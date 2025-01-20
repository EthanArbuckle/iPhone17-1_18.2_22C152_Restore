@interface WBSFormTelemetryDataMonitor
+ (int64_t)formFieldTypeForFormControlMetadata:(id)a3 formMetadata:(id)a4;
- (BOOL)_isMonitoringTextFieldWithID:(id)a3 forFormID:(int64_t)a4;
- (BOOL)_wasAutoFillUsedForModificationType:(unint64_t)a3;
- (NSString)webpageLocale;
- (WBSFormTelemetryDataMonitor)initWithWebpageLocale:(id)a3;
- (unint64_t)_elementTypeForFormControlMetadata:(id)a3;
- (void)_sendModificationTelemetryEventsPerForm;
- (void)_sendModificationTelemetryEventsPerFormField;
- (void)_sendUsageTelemetryEventsPerForm;
- (void)_updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormID:(int64_t)a5;
- (void)_updateMonitorDataWithFormMetadata:(id)a3;
- (void)_updateMonitorDataWithTextFieldMetadata:(id)a3 textFieldValueLength:(unint64_t)a4 forFormID:(int64_t)a5;
- (void)_updateTelemetryFieldData:(id)a3 withTextFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5;
- (void)sendTelemetryEventsOnFormSubmission;
- (void)updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5;
- (void)updateFormTelemetryWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5;
@end

@implementation WBSFormTelemetryDataMonitor

- (WBSFormTelemetryDataMonitor)initWithWebpageLocale:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormTelemetryDataMonitor;
  v5 = [(WBSFormTelemetryDataMonitor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    webpageLocale = v5->_webpageLocale;
    v5->_webpageLocale = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)updateFormTelemetryWithFormMetadata:(id)a3 textFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_super v10 = [v8 uniqueID];
    BOOL v11 = -[WBSFormTelemetryDataMonitor _isMonitoringTextFieldWithID:forFormID:](self, "_isMonitoringTextFieldWithID:forFormID:", v10, [v12 uniqueID]);

    if (!v11) {
      [(WBSFormTelemetryDataMonitor *)self _updateMonitorDataWithFormMetadata:v12];
    }
    -[WBSFormTelemetryDataMonitor _updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:](self, "_updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:", v9, a5, [v12 uniqueID]);
  }
  else
  {
    [(WBSFormTelemetryDataMonitor *)self _updateMonitorDataWithFormMetadata:v12];
  }
}

- (void)_updateMonitorDataWithFormMetadata:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_formIDToFormData)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    formIDToFormData = self->_formIDToFormData;
    self->_formIDToFormData = v5;
  }
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "uniqueID"));
  id v8 = [(NSMutableDictionary *)self->_formIDToFormData objectForKeyedSubscript:v7];

  if (!v8)
  {
    v9 = -[WBSFormTelemetryData initWithFormType:formID:]([WBSFormTelemetryData alloc], "initWithFormType:formID:", [v4 type], (int)objc_msgSend(v7, "intValue"));
    [(NSMutableDictionary *)self->_formIDToFormData setObject:v9 forKeyedSubscript:v7];
  }
  objc_super v10 = [v4 controls];
  uint64_t v11 = [v10 count];
  id v12 = [(NSMutableDictionary *)self->_formIDToFormData objectForKeyedSubscript:v7];
  v13 = [v12 fieldIDToSingleFieldData];
  uint64_t v14 = [v13 count];

  if (v11 == v14)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v15 = [v4 controls];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v21 = [v20 value];
          -[WBSFormTelemetryDataMonitor _updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:](self, "_updateMonitorDataWithTextFieldMetadata:textFieldValueLength:forFormID:", v20, [v21 length], (int)objc_msgSend(v7, "intValue"));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v4;
    obuint64_t j = [v4 controls];
    uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          v26 = [v25 uniqueID];
          v27 = v7;
          v28 = [(NSMutableDictionary *)self->_formIDToFormData objectForKeyedSubscript:v7];
          v29 = [v28 fieldIDToSingleFieldData];
          v30 = [v29 objectForKeyedSubscript:v26];

          if (v30)
          {
            [v15 setObject:v30 forKeyedSubscript:v26];
          }
          else
          {
            v31 = -[WBSSingleFieldTelemetryData initWithFieldType:fieldID:elementType:]([WBSSingleFieldTelemetryData alloc], "initWithFieldType:fieldID:elementType:", [(id)objc_opt_class() formFieldTypeForFormControlMetadata:v25 formMetadata:v35], v26, -[WBSFormTelemetryDataMonitor _elementTypeForFormControlMetadata:](self, "_elementTypeForFormControlMetadata:", v25));
            [v15 setObject:v31 forKeyedSubscript:v26];
          }
          v32 = [v15 objectForKeyedSubscript:v26];
          v33 = [v25 value];
          -[WBSFormTelemetryDataMonitor _updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:](self, "_updateTelemetryFieldData:withTextFieldMetadata:textFieldValueLength:", v32, v25, [v33 length]);

          v7 = v27;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v23);
    }

    v34 = [(NSMutableDictionary *)self->_formIDToFormData objectForKeyedSubscript:v7];
    [v34 setFieldIDToSingleFieldData:v15];

    id v4 = v35;
  }
}

- (BOOL)_isMonitoringTextFieldWithID:(id)a3 forFormID:(int64_t)a4
{
  id v6 = a3;
  formIDToFormData = self->_formIDToFormData;
  if (formIDToFormData)
  {
    id v8 = [NSNumber numberWithInteger:a4];
    v9 = [(NSMutableDictionary *)formIDToFormData objectForKeyedSubscript:v8];

    if (v9)
    {
      objc_super v10 = [v9 fieldIDToSingleFieldData];
      uint64_t v11 = [v10 objectForKeyedSubscript:v6];
      LOBYTE(formIDToFormData) = v11 != 0;
    }
    else
    {
      LOBYTE(formIDToFormData) = 0;
    }
  }
  return (char)formIDToFormData;
}

- (void)_updateMonitorDataWithTextFieldMetadata:(id)a3 textFieldValueLength:(unint64_t)a4 forFormID:(int64_t)a5
{
  formIDToFormData = self->_formIDToFormData;
  v9 = NSNumber;
  id v10 = a3;
  uint64_t v11 = [v9 numberWithInteger:a5];
  id v12 = [(NSMutableDictionary *)formIDToFormData objectForKeyedSubscript:v11];
  v13 = [v12 fieldIDToSingleFieldData];
  uint64_t v14 = [v10 uniqueID];
  id v15 = [v13 objectForKeyedSubscript:v14];

  [(WBSFormTelemetryDataMonitor *)self _updateTelemetryFieldData:v15 withTextFieldMetadata:v10 textFieldValueLength:a4];
}

- (void)_updateTelemetryFieldData:(id)a3 withTextFieldMetadata:(id)a4 textFieldValueLength:(unint64_t)a5
{
  id v15 = a3;
  id v7 = a4;
  int v8 = [v15 wasPreviouslyAutoFilled];
  uint64_t v9 = [v7 isAutoFilledTextField];
  unsigned int v10 = [v7 isUserEditedTextField];
  uint64_t v11 = 1;
  if (!v10) {
    uint64_t v11 = 2;
  }
  if (!a5) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = 4;
  if (a5) {
    uint64_t v12 = 5;
  }
  if (v8) {
    uint64_t v11 = v12;
  }
  if (v9) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v11;
  }
  [v15 setModificationType:v13];
  [v15 setIsAutoFilled:v9];
  if (a5) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }
  [v15 setIsManuallyFilledByUser:v14];
  if (![v15 fieldType] && objc_msgSend(v7, "looksLikeOneTimeCodeField")) {
    [v15 setFieldType:24];
  }
  if (v9 && [v15 fieldType] == 24) {
    [v15 setAutoFillOfferedType:2];
  }
}

- (void)updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormMetadata:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if (!-[WBSFormTelemetryDataMonitor _isMonitoringTextFieldWithID:forFormID:](self, "_isMonitoringTextFieldWithID:forFormID:", v9, [v8 uniqueID]))-[WBSFormTelemetryDataMonitor _updateMonitorDataWithFormMetadata:](self, "_updateMonitorDataWithFormMetadata:", v8); {
  -[WBSFormTelemetryDataMonitor _updateAutoFillOfferedType:forTextFieldWithID:forFormID:](self, "_updateAutoFillOfferedType:forTextFieldWithID:forFormID:", a3, v9, [v8 uniqueID]);
  }
}

- (void)_updateAutoFillOfferedType:(unint64_t)a3 forTextFieldWithID:(id)a4 forFormID:(int64_t)a5
{
  formIDToFormData = self->_formIDToFormData;
  id v8 = NSNumber;
  id v9 = a4;
  unsigned int v10 = [v8 numberWithInteger:a5];
  uint64_t v11 = [(NSMutableDictionary *)formIDToFormData objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 fieldIDToSingleFieldData];
  id v13 = [v12 objectForKeyedSubscript:v9];

  [v13 setAutoFillOfferedType:a3];
}

- (void)sendTelemetryEventsOnFormSubmission
{
  [(WBSFormTelemetryDataMonitor *)self _sendModificationTelemetryEventsPerFormField];
  [(WBSFormTelemetryDataMonitor *)self _sendModificationTelemetryEventsPerForm];
  [(WBSFormTelemetryDataMonitor *)self _sendUsageTelemetryEventsPerForm];
}

- (void)_sendModificationTelemetryEventsPerForm
{
  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke;
  v3[3] = &unk_1E5C9BCE0;
  v3[4] = self;
  [(NSMutableDictionary *)formIDToFormData enumerateKeysAndObjectsUsingBlock:v3];
}

void __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v59[7] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 formType] != 2 && objc_msgSend(v6, "formType"))
  {
    v28 = [v6 fieldIDToSingleFieldData];
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    long long v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v38 = 0;
    long long v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke_2;
    v29[3] = &unk_1E5C9BCB8;
    v29[4] = &v54;
    v29[5] = &v50;
    v29[6] = &v30;
    v29[7] = &v34;
    v29[8] = &v42;
    v29[9] = &v46;
    v29[10] = &v38;
    [v28 enumerateKeysAndObjectsUsingBlock:v29];
    if (v55[3])
    {
      uint64_t v7 = [v6 formType];
      unint64_t v8 = v51[3];
      unint64_t v9 = v55[3];
      unint64_t v10 = v31[3];
      unint64_t v11 = v35[3];
      unint64_t v12 = v10 + v8 + v11;
      if (v12)
      {
        uint64_t v13 = (uint64_t)((double)v11 * 100.0 / (double)v12);
        uint64_t v14 = (uint64_t)((double)v10 * 100.0 / (double)v12);
      }
      else
      {
        uint64_t v13 = -1;
        uint64_t v14 = -1;
      }
      unint64_t v15 = v43[3];
      unint64_t v16 = v47[3];
      unint64_t v17 = v39[3];
      v58[0] = @"totalNumberOfFields";
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v9, v7);
      v59[0] = v27;
      v58[1] = @"percentageOfFieldsAutoFilled";
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:(unint64_t)((double)v8 * 100.0 / (double)v9)];
      v59[1] = v18;
      v58[2] = @"percentageOfFieldsManuallyFilledByUser";
      v19 = [NSNumber numberWithUnsignedInteger:(unint64_t)((double)v15 * 100.0 / (double)v9)];
      v59[2] = v19;
      v58[3] = @"percentageOfFieldsManuallyFilledByWebsite";
      v20 = [NSNumber numberWithUnsignedInteger:(unint64_t)((double)v16 * 100.0 / (double)v9)];
      v59[3] = v20;
      v58[4] = @"percentageOfBlankFields";
      v21 = [NSNumber numberWithUnsignedInteger:(unint64_t)((double)v17 * 100.0 / (double)v9)];
      v59[4] = v21;
      v58[5] = @"percentageOfFieldsAutofilledThenModifiedOverFieldsEverAutoFilled";
      uint64_t v22 = [NSNumber numberWithInteger:v13];
      v59[5] = v22;
      v58[6] = @"percentageOfFieldsAutoFilledThenClearedOverFieldsEverAutoFilled";
      uint64_t v23 = [NSNumber numberWithInteger:v14];
      v59[6] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:7];

      v25 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v25 didSubmitFormOfType:v26 withPerFormModificationsDictionary:v24 webpageLocale:*(void *)(*(void *)(a1 + 32) + 16)];
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
  }
}

void __70__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerForm__block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [v8 elementType];
  id v5 = v8;
  if (v4 == 3)
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v6 = [v8 modificationType];
    id v5 = v8;
    switch(v6)
    {
      case 0:
        uint64_t v7 = a1[10];
        goto LABEL_9;
      case 1:
        uint64_t v7 = a1[8];
        goto LABEL_9;
      case 2:
        uint64_t v7 = a1[9];
        goto LABEL_9;
      case 3:
        uint64_t v7 = a1[5];
        goto LABEL_9;
      case 4:
        uint64_t v7 = a1[6];
        goto LABEL_9;
      case 5:
        uint64_t v7 = a1[7];
LABEL_9:
        ++*(void *)(*(void *)(v7 + 8) + 24);
        break;
      default:
        break;
    }
  }
}

- (void)_sendModificationTelemetryEventsPerFormField
{
  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke;
  v3[3] = &unk_1E5C9BCE0;
  v3[4] = self;
  [(NSMutableDictionary *)formIDToFormData enumerateKeysAndObjectsUsingBlock:v3];
}

void __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 fieldIDToSingleFieldData];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke_2;
  v8[3] = &unk_1E5C9BD08;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
}

void __75__WBSFormTelemetryDataMonitor__sendModificationTelemetryEventsPerFormField__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 elementType] == 3)
  {
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v4, "didSubmitFormOfType:withFieldType:elementType:isAutoFilled:isManuallyFilledByUser:modificationType:autoFillOfferedType:webpageLocale:", objc_msgSend(*(id *)(a1 + 32), "formType"), objc_msgSend(v5, "fieldType"), objc_msgSend(v5, "elementType"), objc_msgSend(v5, "isAutoFilled"), objc_msgSend(v5, "isManuallyFilledByUser"), objc_msgSend(v5, "modificationType"), objc_msgSend(v5, "autoFillOfferedType"), *(void *)(*(void *)(a1 + 40) + 16));
  }
}

- (void)_sendUsageTelemetryEventsPerForm
{
  formIDToFormData = self->_formIDToFormData;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke;
  v3[3] = &unk_1E5C9BCE0;
  v3[4] = self;
  [(NSMutableDictionary *)formIDToFormData enumerateKeysAndObjectsUsingBlock:v3];
}

void __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v75[7] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 formType] != 2 && objc_msgSend(v6, "formType"))
  {
    v28 = [v6 fieldIDToSingleFieldData];
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    long long v43 = &v42;
    uint64_t v44 = 0x2020000000;
    uint64_t v45 = 0;
    uint64_t v38 = 0;
    long long v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke_2;
    v29[3] = &unk_1E5C9BD30;
    v29[4] = *(void *)(a1 + 32);
    v29[5] = &v70;
    v29[6] = &v62;
    v29[7] = &v66;
    v29[8] = &v50;
    v29[9] = &v34;
    v29[10] = &v46;
    void v29[11] = &v30;
    v29[12] = &v58;
    v29[13] = &v42;
    v29[14] = &v54;
    v29[15] = &v38;
    [v28 enumerateKeysAndObjectsUsingBlock:v29];
    if (v67[3])
    {
      uint64_t v7 = [v6 formType];
      unint64_t v8 = v51[3];
      if (v8) {
        uint64_t v9 = (uint64_t)((double)(unint64_t)v35[3] * 100.0 / (double)v8);
      }
      else {
        uint64_t v9 = -1;
      }
      unint64_t v10 = v47[3];
      if (v10) {
        uint64_t v11 = (uint64_t)((double)(unint64_t)v31[3] * 100.0 / (double)v10);
      }
      else {
        uint64_t v11 = -1;
      }
      unint64_t v12 = v59[3];
      if (v12) {
        uint64_t v13 = (uint64_t)((double)(unint64_t)v43[3] * 100.0 / (double)v12);
      }
      else {
        uint64_t v13 = -1;
      }
      unint64_t v14 = v55[3];
      uint64_t v26 = v7;
      if (v14) {
        uint64_t v15 = (uint64_t)((double)(unint64_t)v39[3] * 100.0 / (double)v14);
      }
      else {
        uint64_t v15 = -1;
      }
      unint64_t v16 = v63[3];
      unint64_t v17 = v67[3];
      v74[0] = @"totalNumberOfFields";
      v27 = [NSNumber numberWithUnsignedInteger:v71[3]];
      v75[0] = v27;
      v74[1] = @"totalNumberOfFieldsWhereAutoFillWasOffered";
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:v67[3]];
      v75[1] = v18;
      v74[2] = @"percentageOfFieldsWhereAutoFillWasUsedOverOffered";
      v19 = [NSNumber numberWithInteger:(uint64_t)((double)v16 * 100.0 / (double)v17)];
      v75[2] = v19;
      v74[3] = @"percentageOfFieldsWherePasswordAutoFillWasUsedOverOffered";
      v20 = [NSNumber numberWithInteger:v9];
      v75[3] = v20;
      v74[4] = @"percentageOfFieldsWhereOneTimeCodeAutoFillWasUsedOverOffered";
      v21 = [NSNumber numberWithInteger:v11];
      v75[4] = v21;
      v74[5] = @"percentageOfFieldsWhereCreditCardAutoFillWasUsedOverOffered";
      uint64_t v22 = [NSNumber numberWithInteger:v13];
      v75[5] = v22;
      v74[6] = @"percentageOfFieldsWhereContactAutoFillWasUsedOverOffered";
      uint64_t v23 = [NSNumber numberWithInteger:v15];
      v75[6] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:7];

      v25 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v25 didSubmitFormOfType:v26 withPerFormUsageDictionary:v24 webpageLocale:*(void *)(*(void *)(a1 + 32) + 16)];
    }
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
  }
}

void __63__WBSFormTelemetryDataMonitor__sendUsageTelemetryEventsPerForm__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  uint64_t v4 = [v9 elementType];
  id v5 = v9;
  if (v4 == 3)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v6 = objc_msgSend(*(id *)(a1 + 32), "_wasAutoFillUsedForModificationType:", objc_msgSend(v9, "modificationType"));
    if (v6) {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v7 = [v9 autoFillOfferedType] - 1;
    id v5 = v9;
    switch(v7)
    {
      case 0:
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        id v5 = v9;
        if (v6)
        {
          uint64_t v8 = *(void *)(a1 + 72);
          goto LABEL_13;
        }
        break;
      case 1:
        ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        id v5 = v9;
        if (v6)
        {
          uint64_t v8 = *(void *)(a1 + 88);
          goto LABEL_13;
        }
        break;
      case 2:
        ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        id v5 = v9;
        if (v6)
        {
          uint64_t v8 = *(void *)(a1 + 104);
          goto LABEL_13;
        }
        break;
      case 3:
        ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
        id v5 = v9;
        if (v6)
        {
          uint64_t v8 = *(void *)(a1 + 120);
LABEL_13:
          ++*(void *)(*(void *)(v8 + 8) + 24);
          id v5 = v9;
        }
        break;
      default:
        break;
    }
  }
}

- (BOOL)_wasAutoFillUsedForModificationType:(unint64_t)a3
{
  return a3 > 2;
}

+ (int64_t)formFieldTypeForFormControlMetadata:(id)a3 formMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 looksLikeOneTimeCodeField] & 1) == 0)
  {
    unint64_t v8 = [v6 type] - 3;
    if ([v5 isSecureTextField])
    {
      if (v8 >= 3) {
        goto LABEL_9;
      }
    }
    else
    {
      char v9 = [v5 looksLikePasswordCredentialField];
      if (v8 > 2 || (v9 & 1) == 0)
      {
LABEL_9:
        if (+[WBSFormDataController isFieldUnidentified:](WBSFormDataController, "isFieldUnidentified:", v5)|| +[WBSFormDataController textFieldLooksLikeCreditCardFormField:v5 inForm:v6])
        {
          if ([v5 looksLikeCreditCardNumberField])
          {
            int64_t v7 = 2;
            goto LABEL_62;
          }
          if ([v5 looksLikeCreditCardTypeField])
          {
            int64_t v7 = 6;
            goto LABEL_62;
          }
          if ([v5 looksLikeCreditCardCardholderField])
          {
            int64_t v7 = 4;
            goto LABEL_62;
          }
          if ([v5 looksLikeCreditCardCompositeExpirationDateField])
          {
            int64_t v7 = 3;
            goto LABEL_62;
          }
          if ([v5 looksLikeCreditCardSecurityCodeField])
          {
            int64_t v7 = 5;
            goto LABEL_62;
          }
        }
        unint64_t v10 = [v5 addressBookLabel];
        int v11 = [v10 isEqualToString:@"email"];

        int v12 = [v5 isLabeledUsernameField];
        if ([v6 type] == 4 && ((v11 | v12) & 1) != 0)
        {
          int64_t v7 = 23;
          goto LABEL_62;
        }
        uint64_t v13 = [v6 userNameElementUniqueID];
        unint64_t v14 = [v5 uniqueID];
        if ([v6 type] == 3 && (objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
        {
          int64_t v7 = 23;
LABEL_61:

          goto LABEL_62;
        }
        uint64_t v15 = [v5 addressBookLabel];
        unint64_t v16 = v15;
        if (v15)
        {
          unint64_t v17 = [v15 lowercaseString];
          uint64_t v18 = +[WBSFormDataController specifierForAddressBookLabel:v17];

          v19 = [v18 property];
          char v20 = [v19 isEqualToString:*MEMORY[0x1E4F98068]];

          if (v20)
          {
            int64_t v7 = 7;
LABEL_46:

LABEL_60:
            goto LABEL_61;
          }
          v21 = [v18 property];
          char v22 = [v21 isEqualToString:*MEMORY[0x1E4F98050]];

          if (v22)
          {
            int64_t v7 = 8;
            goto LABEL_46;
          }
          uint64_t v23 = [v18 property];
          char v24 = [v23 isEqualToString:*MEMORY[0x1E4F98060]];

          if (v24)
          {
            int64_t v7 = 9;
            goto LABEL_46;
          }
          v25 = [v18 property];
          char v26 = [v25 isEqualToString:*MEMORY[0x1E4F98058]];

          if (v26)
          {
            int64_t v7 = 10;
            goto LABEL_46;
          }
          v27 = [v18 property];
          char v28 = [v27 isEqualToString:*MEMORY[0x1E4F98030]];

          if (v28)
          {
            int64_t v7 = 18;
            goto LABEL_46;
          }
          v29 = [v18 property];
          char v30 = [v29 isEqualToString:*MEMORY[0x1E4F98048]];

          if (v30)
          {
            int64_t v7 = 19;
            goto LABEL_46;
          }
          v31 = [v18 property];
          char v32 = [v31 isEqualToString:*MEMORY[0x1E4F98028]];

          if (v32)
          {
            int64_t v7 = 17;
            goto LABEL_46;
          }
          uint64_t v33 = [v18 property];
          char v34 = [v33 isEqualToString:*MEMORY[0x1E4F98040]];

          if (v34)
          {
            int64_t v7 = 20;
            goto LABEL_46;
          }
          id v35 = [v18 property];
          char v36 = [v35 isEqualToString:@"URLs"];

          if (v36)
          {
            int64_t v7 = 21;
            goto LABEL_46;
          }
          uint64_t v37 = [v18 property];
          int v38 = [v37 isEqualToString:*MEMORY[0x1E4F98020]];

          if (v38)
          {
            long long v39 = [v18 component];
            char v40 = [v39 isEqualToString:@"Street"];

            if (v40)
            {
              int64_t v7 = 12;
              goto LABEL_46;
            }
            uint64_t v41 = [v18 component];
            char v42 = [v41 isEqualToString:@"City"];

            if (v42)
            {
              int64_t v7 = 13;
              goto LABEL_46;
            }
            long long v43 = [v18 component];
            char v44 = [v43 isEqualToString:@"State"];

            if (v44)
            {
              int64_t v7 = 14;
              goto LABEL_46;
            }
            uint64_t v45 = [v18 component];
            char v46 = [v45 isEqualToString:@"Country"];

            if (v46)
            {
              int64_t v7 = 15;
              goto LABEL_46;
            }
            v47 = [v18 component];
            int v48 = [v47 isEqualToString:@"ZIP"];

            if (v48)
            {
              int64_t v7 = 16;
              goto LABEL_46;
            }
          }
        }
        int64_t v7 = [v5 looksLikeIgnoredDataTypeField];
        goto LABEL_60;
      }
    }
    int64_t v7 = 22;
    goto LABEL_62;
  }
  int64_t v7 = 24;
LABEL_62:

  return v7;
}

- (unint64_t)_elementTypeForFormControlMetadata:(id)a3
{
  id v3 = a3;
  if ([v3 isTextField])
  {
    uint64_t v4 = [v3 tagName];
    if ([v4 isEqualToString:@"TEXTAREA"]) {
      unint64_t v5 = 4;
    }
    else {
      unint64_t v5 = 3;
    }
  }
  else
  {
    id v6 = [v3 radioButtonInfo];

    if (v6)
    {
      unint64_t v5 = 2;
    }
    else
    {
      int64_t v7 = [v3 selectElementInfo];

      unint64_t v5 = v7 != 0;
    }
  }

  return v5;
}

- (NSString)webpageLocale
{
  return self->_webpageLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webpageLocale, 0);
  objc_storeStrong((id *)&self->_formIDToFormData, 0);
}

@end