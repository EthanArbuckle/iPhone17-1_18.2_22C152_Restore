@interface DigitDialResultHandler
- (TUContactsDataProvider)contactsDataProvider;
- (id)actionForRecognitionResult:(id)a3;
- (void)setContactsDataProvider:(id)a3;
@end

@implementation DigitDialResultHandler

- (id)actionForRecognitionResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = VoiceDialCopyErrorActionForResult(v4);
  if (v5)
  {
    v6 = (VoiceDialRecognitionAction *)v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    id v12 = 0;
    id v13 = 0;
  }
  else
  {
    id v38 = 0;
    id v39 = 0;
    DigitDialPhoneNumberFromResult(v4, &v39, &v38);
    id v13 = v39;
    id v12 = v38;
    v14 = objc_alloc_init(DigitDialResultValidator);
    uint64_t v15 = [(DigitDialResultValidator *)v14 indexOfValidPhoneNumber:v13];
    v7 = 0;
    v8 = 0;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = v15;
      v7 = [v13 objectAtIndex:v15];
      v8 = [v12 objectAtIndex:v16];
    }
    if ([v7 length])
    {
      v36 = v14;
      id v37 = v12;
      v17 = TUNetworkCountryCode();
      v9 = TUFormattedPhoneNumber();

      id v18 = objc_alloc(MEMORY[0x263F7E1D0]);
      v19 = [MEMORY[0x263F7E248] handleWithDestinationID:v9];
      uint64_t v20 = [v18 initWithHandle:v19];

      v21 = [(DigitDialResultHandler *)self contactsDataProvider];
      v35 = (void *)v20;
      v22 = [v21 executeFetchRequest:v20];

      v10 = [v22 localizedName];
      v23 = [v22 contactLabel];

      unint64_t v24 = 0x263F08000uLL;
      v34 = v22;
      if (v23)
      {
        v25 = NSString;
        v26 = VoiceDialBundle();
        v27 = [v26 localizedStringForKey:@"CONFIRMED_DISPLAY_NAME_LABEL_FORMAT_CALLING_%@" value:&stru_26DE2E3C8 table:@"Feedback"];
        v28 = [v22 contactLabel];
        v11 = objc_msgSend(v25, "stringWithFormat:", v27, v28);

        unint64_t v24 = 0x263F08000;
      }
      else
      {
        v26 = VoiceDialBundle();
        v11 = [v26 localizedStringForKey:@"CONFIRMED_DISPLAY_STRING" value:&stru_26DE2E3C8 table:@"Feedback"];
      }

      v6 = [[VoiceDialRecognitionAction alloc] initWithPhoneNumber:v7 uid:0xFFFFFFFFLL];
      [(VSRecognitionAction *)v6 setResultDisplayString:v10];
      v29 = *(void **)(v24 + 2880);
      v30 = VoiceDialSpokenLocalizedString(@"CONFIRMED_SPOKEN_DIGIT_DIAL_FORMAT");
      v31 = objc_msgSend(v29, "stringWithFormat:", v30, v8);
      [(VSRecognitionAction *)v6 setSpokenFeedbackString:v31];

      [(VSRecognitionAction *)v6 setStatusDisplayString:v11];
      v14 = v36;
      id v12 = v37;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v6 = 0;
    }
  }
  v32 = v6;

  return v32;
}

- (TUContactsDataProvider)contactsDataProvider
{
  contactsDataProvider = self->_contactsDataProvider;
  if (!contactsDataProvider)
  {
    id v4 = objc_alloc(MEMORY[0x263F7E1C8]);
    id v5 = objc_alloc_init(MEMORY[0x263EFEA58]);
    v6 = (TUContactsDataProvider *)[v4 initWithContactsDataSource:v5];
    v7 = self->_contactsDataProvider;
    self->_contactsDataProvider = v6;

    contactsDataProvider = self->_contactsDataProvider;
  }

  return contactsDataProvider;
}

- (void)setContactsDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end