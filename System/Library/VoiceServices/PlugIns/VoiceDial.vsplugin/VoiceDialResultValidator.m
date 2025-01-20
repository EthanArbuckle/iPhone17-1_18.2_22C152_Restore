@interface VoiceDialResultValidator
- (id)_nameSource;
- (id)validRecognitionResultFromRecognitionResult:(id)a3;
- (id)validRecognitionResultFromRecognitionResult:(id)a3 knownDisambiguationValues:(id)a4;
- (void)_addressBook;
- (void)dealloc;
@end

@implementation VoiceDialResultValidator

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)VoiceDialResultValidator;
  [(VoiceDialResultValidator *)&v4 dealloc];
}

- (void)_addressBook
{
  result = self->_addressBook;
  if (!result)
  {
    CFErrorRef error = 0;
    objc_super v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (!v4)
    {
      v5 = PHDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        [(VoiceDialResultHandler *)(uint64_t *)&error _addressBook];
      }
    }
    if (error) {
      CFRelease(error);
    }
    return self->_addressBook;
  }
  return result;
}

- (id)_nameSource
{
  nameSource = self->_nameSource;
  if (!nameSource)
  {
    objc_super v4 = VSPreferencesCopySpokenLanguageIdentifier();
    v5 = +[VoiceDialNameDataSource nameDataSourceForLanguageIdentifier:v4];
    v6 = self->_nameSource;
    self->_nameSource = v5;

    nameSource = self->_nameSource;
  }

  return nameSource;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3
{
  id v4 = a3;
  char v19 = 0;
  VoiceDialConfigureSpokenLocalizedLabel(1);
  id v17 = 0;
  id v18 = 0;
  id v16 = 0;
  VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v4, &v18, &v17, &v16, 0);
  id v5 = v18;
  id v6 = v17;
  v7 = (__CFString *)v16;
  v8 = [v4 valueOfFirstElementWithClassIdentifier:@"command"];
  if (v8)
  {
    v9 = @"labeltype-phone";

    v7 = v9;
  }
  if (v6)
  {
    if (v5)
    {
      v10 = [(VoiceDialResultValidator *)self _addressBook];
      if (v10)
      {
        v11 = v10;
        v12 = [(VoiceDialResultValidator *)self _nameSource];
        VoiceDialSendNameAndExtendedLabelMatches(v11, v12, 0, 1, v5, v6, v7, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultValidationAddressBookCallback, (uint64_t)&v19);

        if (!v19)
        {
          v13 = [v4 recognitionResultByReplacingValueForClassIdentifier:@"label" withValue:0];

          v14 = [v13 recognitionResultByReplacingValueForClassIdentifier:@"labeltype-phone" withValue:0];

          id v4 = [v14 recognitionResultByReplacingValueForClassIdentifier:@"labeltype-email" withValue:0];
        }
      }
    }
  }

  return v4;
}

- (id)validRecognitionResultFromRecognitionResult:(id)a3 knownDisambiguationValues:(id)a4
{
  id v6 = a3;
  id location = v6;
  id v7 = a4;
  v8 = objc_alloc_init(VoiceDialDisambiguationAddressBookContext);
  v40 = v8;
  VoiceDialConfigureSpokenLocalizedLabel(1);
  if (!v7) {
    goto LABEL_28;
  }
  uint64_t v9 = [v7 objectForKey:@"firstname"];
  if (v9)
  {
    v10 = (void *)v9;
    uint64_t v11 = *MEMORY[0x263F24408];
  }
  else
  {
    v10 = [v7 objectForKey:@"lastname"];
    if (v10) {
      uint64_t v11 = *MEMORY[0x263F244D0];
    }
    else {
      uint64_t v11 = 0xFFFFFFFFLL;
    }
  }
  uint64_t v12 = [v10 count];
  if (!v12)
  {

LABEL_28:
    v33 = [(VoiceDialResultValidator *)self validRecognitionResultFromRecognitionResult:v6];
    id location = v33;

    id v15 = 0;
    id v17 = 0;
    id v16 = 0;
    goto LABEL_31;
  }
  unint64_t v13 = v12;
  id v36 = v7;
  v14 = [(VoiceDialResultValidator *)self _addressBook];
  id v38 = 0;
  id v39 = 0;
  id v37 = 0;
  VoiceDialCopyNameLabelAndTypeFromRecognitionResult(v6, &v39, &v38, &v37, 0);
  id v15 = v39;
  id v16 = v38;
  id v17 = v37;
  if (v14)
  {
    [(VoiceDialDisambiguationAddressBookContext *)v8 setPreviousNameProperty:v11];
    [(VoiceDialDisambiguationAddressBookContext *)v8 setMatchedName:v15];
    [(VoiceDialDisambiguationAddressBookContext *)v8 setResult:&location];
    [(VoiceDialDisambiguationAddressBookContext *)v8 setResultFound:0];
    id v18 = [(VoiceDialResultValidator *)self _nameSource];
    if (![(VoiceDialDisambiguationAddressBookContext *)v8 resultFound])
    {
      unint64_t v19 = 1;
      do
      {
        v20 = [v10 objectAtIndex:v19 - 1];
        [(VoiceDialDisambiguationAddressBookContext *)v40 setPreviousName:v20];

        [(VoiceDialDisambiguationAddressBookContext *)v40 setResultFound:0];
        VoiceDialSendNameAndExtendedLabelMatches(v14, v18, 1, 1, v15, v16, v17, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)v40);
        if (![(VoiceDialDisambiguationAddressBookContext *)v40 resultFound] && v17)
        {
          id v21 = location;
          id v22 = location;
          v23 = [v22 recognitionResultByReplacingValueForClassIdentifier:@"labeltype-phone" withValue:0];
          id v24 = location;
          id location = v23;

          v25 = [location recognitionResultByReplacingValueForClassIdentifier:@"labeltype-email" withValue:0];
          id v26 = location;
          id location = v25;

          VoiceDialSendNameAndExtendedLabelMatches(v14, v18, 1, 1, v15, v16, 0, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)v40);
          if (![(VoiceDialDisambiguationAddressBookContext *)v40 resultFound]) {
            objc_storeStrong(&location, v21);
          }
        }
        if (![(VoiceDialDisambiguationAddressBookContext *)v40 resultFound] && v16)
        {
          id v27 = location;
          id v28 = location;
          v29 = [v28 recognitionResultByReplacingValueForClassIdentifier:@"label" withValue:0];
          id v30 = location;
          id location = v29;

          VoiceDialSendNameAndExtendedLabelMatches(v14, v18, 1, 1, v15, 0, 0, (uint64_t (*)(id, __CFString *, const void *, uint64_t, void, void, uint64_t))_ResultDisambiguationAddressBookCallback, (uint64_t)&v40);
          if (![(VoiceDialDisambiguationAddressBookContext *)v40 resultFound]) {
            objc_storeStrong(&location, v27);
          }
        }
        if ([(VoiceDialDisambiguationAddressBookContext *)v40 resultFound]) {
          break;
        }
      }
      while (v19++ < v13);
      v8 = v40;
    }
    if (![(VoiceDialDisambiguationAddressBookContext *)v8 resultFound])
    {
      id v32 = location;
      id location = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v7 = v36;

  v33 = location;
LABEL_31:
  id v34 = v33;

  return v34;
}

- (void).cxx_destruct
{
}

@end