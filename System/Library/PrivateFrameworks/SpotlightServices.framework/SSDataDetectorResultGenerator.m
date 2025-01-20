@interface SSDataDetectorResultGenerator
- (id)buildCardSectionForEmail:(id)a3;
- (id)buildCardSectionForPhoneNumber:(id)a3;
- (id)buildPersonBasedSubtitleButtonItemWithTitle:(id)a3 person:(id)a4;
- (id)buildResultSectionForTrackingNumber:(id)a3 carrier:(id)a4 url:(id)a5 queryId:(unint64_t)a6;
- (id)buildResultSectionWithCardSections:(id)a3 queryId:(unint64_t)a4 resultBundleId:(id)a5 sectionTitle:(id)a6 completion:(id)a7;
- (id)buttonItemWithTitle:(id)a3 symbol:(id)a4 command:(id)a5;
- (id)personWithPhoneNumber:(id)a3 email:(id)a4;
- (void)buildResultSectionsForDateTimeFromResult:(id)a3 querString:(id)a4 completion:(id)a5 queryId:(unint64_t)a6 searchString:(id)a7;
- (void)buildResultSectionsForEmailFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5;
- (void)buildResultSectionsForPhoneNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5;
- (void)buildResultSectionsForTrackingNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5;
- (void)cancel;
- (void)getResultSections:(id)a3 queryId:(unint64_t)a4 completion:(id)a5;
@end

@implementation SSDataDetectorResultGenerator

- (void)cancel
{
  if (self) {
    int64_t ddJobIdentifier = self->_ddJobIdentifier;
  }
  else {
    int64_t ddJobIdentifier = 0;
  }
  [MEMORY[0x1E4F5F158] cancelJob:ddJobIdentifier];
}

- (void)getResultSections:(id)a3 queryId:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F5F160]) initWithScannerType:0 passiveIntent:1];
  objc_msgSend(v10, "setResultsOptions:", objc_msgSend(v10, "resultsOptions") | 0x1000);
  uint64_t v11 = [v8 length];
  v12 = (void *)MEMORY[0x1E4F5F158];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__SSDataDetectorResultGenerator_getResultSections_queryId_completion___block_invoke;
  v16[3] = &unk_1E634CB38;
  id v18 = v9;
  uint64_t v19 = 0;
  uint64_t v20 = v11;
  unint64_t v21 = a4;
  v16[4] = self;
  id v17 = v8;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = objc_msgSend(v12, "scanString:range:configuration:completionBlock:", v13, 0, v11, v10, v16);
  if (self) {
    self->_int64_t ddJobIdentifier = v15;
  }
}

void __70__SSDataDetectorResultGenerator_getResultSections_queryId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v11 = [a2 firstObject];
  v3 = [v11 type];
  if (!v3
    || (uint64_t v4 = *(void *)(a1 + 32)) != 0 && (*(unsigned char *)(v4 + 8) & 1) != 0
    || (([v11 coreResult],
         char HasProperties = DDResultHasProperties(),
         [v11 range] == *(void *)(a1 + 56))
      ? (BOOL v7 = v6 == *(void *)(a1 + 64))
      : (BOOL v7 = 0),
        !v7 ? (char v8 = 0) : (char v8 = 1),
        (HasProperties & 1) == 0 && (v8 & 1) == 0))
  {
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  if (v8)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F5F0E8]])
    {
      [*(id *)(a1 + 32) buildResultSectionsForTrackingNumberFromResult:v11 completion:*(void *)(a1 + 48) queryId:*(void *)(a1 + 72)];
      goto LABEL_13;
    }
    if ([v3 isEqualToString:*MEMORY[0x1E4F5F088]])
    {
      [v11 coreResult];
      if (DDResultIsValidPhoneNumber())
      {
        [*(id *)(a1 + 32) buildResultSectionsForPhoneNumberFromResult:v11 completion:*(void *)(a1 + 48) queryId:*(void *)(a1 + 72)];
        goto LABEL_13;
      }
    }
  }
  else
  {
    [v3 isEqualToString:*MEMORY[0x1E4F5F088]];
  }
  if (![v3 isEqualToString:*MEMORY[0x1E4F5EFF8]])
  {
    if (([v3 isEqualToString:*MEMORY[0x1E4F5EFE0]] & 1) != 0
      || ([v3 isEqualToString:*MEMORY[0x1E4F5F0D0]] & 1) != 0
      || ([v3 isEqualToString:*MEMORY[0x1E4F5EFE8]] & 1) != 0
      || ([v3 isEqualToString:*MEMORY[0x1E4F5F0C8]] & 1) != 0
      || [v3 isEqualToString:*MEMORY[0x1E4F5EFD8]])
    {
      id v9 = [MEMORY[0x1E4F1C9C8] now];
      v10 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
      [v11 coreResult];
      if (DDResultIsPastDate()) {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else {
        [*(id *)(a1 + 32) buildResultSectionsForDateTimeFromResult:v11 querString:*(void *)(a1 + 40) completion:*(void *)(a1 + 48) queryId:*(void *)(a1 + 72) searchString:*(void *)(a1 + 40)];
      }

      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [*(id *)(a1 + 32) buildResultSectionsForEmailFromResult:v11 completion:*(void *)(a1 + 48) queryId:*(void *)(a1 + 72)];
LABEL_13:
}

- (void)buildResultSectionsForTrackingNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  char v8 = (void (**)(id, void *))a4;
  id v9 = a3;
  v10 = [v9 subResults];
  id v11 = [v10 firstObject];
  v12 = [v11 type];

  [v9 coreResult];
  id v13 = DDResultGetShipmentTrackingUrlString();
  id v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  int64_t v15 = [v9 value];

  v16 = [(SSDataDetectorResultGenerator *)self buildResultSectionForTrackingNumber:v15 carrier:v12 url:v14 queryId:a5];

  v18[0] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v8[2](v8, v17);
}

- (id)buildResultSectionForTrackingNumber:(id)a3 carrier:(id)a4 url:(id)a5 queryId:(unint64_t)a6
{
  v34[1] = *MEMORY[0x1E4F143B8];
  char v8 = (void *)MEMORY[0x1E4F9A378];
  id v9 = a5;
  id v10 = a4;
  v31 = [v8 textWithString:a3];
  id v11 = objc_opt_new();
  v12 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v9];

  v28 = v11;
  [v11 setPunchout:v12];

  id v13 = objc_opt_new();
  [v13 setSymbolName:@"shippingbox.fill"];
  v29 = v13;
  [v13 setIsTemplate:1];
  id v14 = objc_opt_new();
  [v14 setTitle:v31];
  int64_t v15 = [MEMORY[0x1E4F9A378] textWithString:v10];

  v34[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [v14 setDescriptions:v16];

  [v14 setThumbnail:v13];
  [v14 setCommand:v11];
  id v17 = objc_opt_new();
  [v17 setRedComponent:0.635294118];
  [v17 setGreenComponent:0.517647059];
  [v17 setBlueComponent:0.368627451];
  [v17 setColorTintStyle:1];
  [v14 setBackgroundColor:v17];
  v33 = v14;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v20 = [v19 localizedStringForKey:@"QUICK_ACTION_PACKAGE_TRACKING_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
  unint64_t v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"QUICK_ACTION_PACKAGE_TRACKING_COMPLETION" value:&stru_1F1824018 table:@"SpotlightServices"];
  v23 = [(SSDataDetectorResultGenerator *)self buildResultSectionWithCardSections:v18 queryId:a6 resultBundleId:@"com.apple.datadetector.quick_actions.tracking_number" sectionTitle:v20 completion:v22];

  v24 = [v28 punchout];
  v25 = [v23 results];
  v26 = [v25 firstObject];
  [v26 setPunchout:v24];

  return v23;
}

- (void)buildResultSectionsForPhoneNumberFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  char v8 = (void (**)(id, void))a4;
  id v27 = 0;
  char v9 = [a3 getPhoneValue:&v27 label:0];
  id v10 = v27;
  if (v9)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v10];
    v12 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v11];
    id v13 = objc_opt_new();
    v30[0] = *MEMORY[0x1E4F1AEE0];
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    int64_t v15 = [v13 unifiedContactsMatchingPredicate:v12 keysToFetch:v14 error:0];
    uint64_t v16 = [v15 count];

    if (!v10 || v16)
    {
      v8[2](v8, MEMORY[0x1E4F1CBF0]);
    }
    else
    {
      v25 = [(SSDataDetectorResultGenerator *)self buildCardSectionForPhoneNumber:v10];
      v29 = v25;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v18 = a5;
      [v17 localizedStringForKey:@"QUICK_ACTION_PHONE_NUMBER_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
      uint64_t v19 = v26 = v11;
      uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v21 = [v20 localizedStringForKey:@"QUICK_ACTION_PHONE_NUMBER_COMPLETION" value:&stru_1F1824018 table:@"SpotlightServices"];
      v22 = [(SSDataDetectorResultGenerator *)self buildResultSectionWithCardSections:v24 queryId:v18 resultBundleId:@"com.apple.datadetector.quick_actions.phone_number" sectionTitle:v19 completion:v21];

      v28 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      ((void (**)(id, void *))v8)[2](v8, v23);

      id v11 = v26;
    }
  }
  else
  {
    v8[2](v8, MEMORY[0x1E4F1CBF0]);
  }
}

- (id)buildCardSectionForPhoneNumber:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SSDataDetectorResultGenerator *)self personWithPhoneNumber:v4 email:0];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"ADD_NUMBER" value:&stru_1F1824018 table:@"SpotlightServices"];
  char v8 = [(SSDataDetectorResultGenerator *)self buildPersonBasedSubtitleButtonItemWithTitle:v7 person:v5];

  char v9 = objc_opt_new();
  [v9 setPerson:v5];
  id v10 = TUNetworkCountryCode();
  id v11 = TUFormattedPhoneNumber();

  v12 = objc_opt_new();
  id v13 = [MEMORY[0x1E4F9A378] textWithString:v11];
  [v12 setTitle:v13];

  [v12 setSubtitleButtonItem:v8];
  v17[0] = v9;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v12 setTrailingButtonItems:v14];

  int64_t v15 = objc_opt_new();
  [v15 setPhoneNumber:v4];

  [v12 setCommand:v15];
  return v12;
}

- (void)buildResultSectionsForEmailFromResult:(id)a3 completion:(id)a4 queryId:(unint64_t)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  char v8 = (void (**)(id, void))a4;
  id v25 = 0;
  char v9 = [a3 getMailValue:&v25 label:0];
  id v10 = v25;
  if (v9)
  {
    id v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v10];
    v12 = objc_opt_new();
    v28[0] = *MEMORY[0x1E4F1ADC8];
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v14 = [v12 unifiedContactsMatchingPredicate:v11 keysToFetch:v13 error:0];
    uint64_t v15 = [v14 count];

    if (!v10 || v15)
    {
      v8[2](v8, MEMORY[0x1E4F1CBF0]);
    }
    else
    {
      v24 = [(SSDataDetectorResultGenerator *)self buildCardSectionForEmail:v10];
      id v27 = v24;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      unint64_t v22 = a5;
      uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = [v16 localizedStringForKey:@"QUICK_ACTION_EMAIL_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
      unint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v19 = [v18 localizedStringForKey:@"QUICK_ACTION_EMAIL_COMPLETION" value:&stru_1F1824018 table:@"SpotlightServices"];
      uint64_t v20 = [(SSDataDetectorResultGenerator *)self buildResultSectionWithCardSections:v23 queryId:v22 resultBundleId:@"com.apple.datadetector.quick_actions.email" sectionTitle:v17 completion:v19];

      v26 = v20;
      unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      ((void (**)(id, void *))v8)[2](v8, v21);
    }
  }
  else
  {
    v8[2](v8, MEMORY[0x1E4F1CBF0]);
  }
}

- (id)buildCardSectionForEmail:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SSDataDetectorResultGenerator *)self personWithPhoneNumber:0 email:v4];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"ADD_EMAIL" value:&stru_1F1824018 table:@"SpotlightServices"];
  char v8 = [(SSDataDetectorResultGenerator *)self buildPersonBasedSubtitleButtonItemWithTitle:v7 person:v5];

  char v9 = objc_opt_new();
  [v9 setPerson:v5];
  id v10 = objc_opt_new();
  id v11 = [MEMORY[0x1E4F9A378] textWithString:v4];
  [v10 setTitle:v11];

  [v10 setSubtitleButtonItem:v8];
  v15[0] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v10 setTrailingButtonItems:v12];

  id v13 = objc_opt_new();
  [v13 setEmail:v4];

  [v10 setCommand:v13];
  return v10;
}

- (id)buildPersonBasedSubtitleButtonItemWithTitle:(id)a3 person:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  char v8 = objc_opt_new();
  [v8 setAddToExistingContact:0];
  [v8 setPerson:v6];
  char v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"CREATE_NEW_CONTACT" value:&stru_1F1824018 table:@"SpotlightServices"];
  id v11 = [(SSDataDetectorResultGenerator *)self buttonItemWithTitle:v10 symbol:@"person.crop.circle" command:v8];

  v12 = objc_opt_new();
  [v12 setAddToExistingContact:1];
  [v12 setPerson:v6];

  id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = [v13 localizedStringForKey:@"ADD_TO_EXISTING_CONTACT" value:&stru_1F1824018 table:@"SpotlightServices"];
  uint64_t v15 = [(SSDataDetectorResultGenerator *)self buttonItemWithTitle:v14 symbol:@"person.crop.circle.badge.plus" command:v12];

  uint64_t v16 = [(SSDataDetectorResultGenerator *)self buttonItemWithTitle:v7 symbol:0 command:0];

  v19[0] = v11;
  v19[1] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v16 setPreviewButtonItems:v17];

  return v16;
}

- (id)personWithPhoneNumber:(id)a3 email:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if (v5)
  {
    v12[0] = v5;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setPhoneNumbers:v8];
  }
  if (v6)
  {
    id v11 = v6;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v7 setEmailAddresses:v9];
  }
  return v7;
}

- (void)buildResultSectionsForDateTimeFromResult:(id)a3 querString:(id)a4 completion:(id)a5 queryId:(unint64_t)a6 searchString:(id)a7
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v75 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unsigned __int8 v79 = 0;
  id v13 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v15 = [v10 type];
  uint64_t v16 = *MEMORY[0x1E4F5F0C8];
  v74 = (void *)v14;
  v76 = v10;
  id v17 = self;
  if ([v15 isEqualToString:*MEMORY[0x1E4F5F0C8]])
  {
  }
  else
  {
    unint64_t v18 = [v10 type];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F5EFD8]];

    if (!v19)
    {
      uint64_t v25 = [v10 dateFromReferenceDate:v14 referenceTimezone:v13 timezoneRef:0 allDayRef:&v79];
      id v22 = 0;
      v73 = v13;
      uint64_t v70 = v16;
      if (v79 || !v25)
      {
        id v23 = (id)v25;
      }
      else
      {
        id v23 = (id)v25;
        objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 32, 1);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_11:
      v26 = NSString;
      id v27 = [v76 value];
      v28 = [v26 stringWithFormat:@"%@ ", v27];
      v29 = [v75 stringByReplacingOccurrencesOfString:v28 withString:&stru_1F1824018];

      v30 = [v76 value];
      v31 = [v29 stringByReplacingOccurrencesOfString:v30 withString:&stru_1F1824018];

      id v21 = v23;
      if (!v23 || (v32 = v17) != 0 && v17->_canceled)
      {
        v24 = (void (**)(void, void))v11;
        (*((void (**)(id, void))v11 + 2))(v11, MEMORY[0x1E4F1CBF0]);

LABEL_31:
        id v13 = v73;
        goto LABEL_32;
      }
      v24 = (void (**)(void, void))v11;
      if (v22)
      {
        uint64_t v33 = [v22 compare:v23];
        uint64_t v34 = v70;
        if (v33 == -1)
        {
          id v35 = v22;

          id v22 = v21;
          id v21 = v35;
        }
      }
      else
      {
        uint64_t v34 = v70;
      }
      v69 = v12;
      if ([v21 compare:v74] == -1 && objc_msgSend(v12, "isDateInToday:", v21))
      {
        v36 = [v76 type];
        if ([v36 isEqualToString:*MEMORY[0x1E4F5F0D0]])
        {

LABEL_24:
          uint64_t v39 = [v12 dateByAddingUnit:16 value:1 toDate:v21 options:0];

          if (v22)
          {
            uint64_t v40 = [v12 dateByAddingUnit:16 value:1 toDate:v22 options:0];

            id v22 = (id)v40;
          }
          id v21 = (id)v39;
          goto LABEL_27;
        }
        v37 = [v76 type];
        int v38 = [v37 isEqualToString:v34];

        if (v38) {
          goto LABEL_24;
        }
      }
LABEL_27:
      v41 = objc_opt_new();
      v68 = v31;
      if ([v31 length])
      {
        [v41 setTitle:v31];
      }
      else
      {
        v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v43 = [v42 localizedStringForKey:@"NEW_EVENT" value:&stru_1F1824018 table:@"SpotlightServices"];
        [v41 setTitle:v43];
      }
      [v41 setStartDate:v21];
      [v41 setEndDate:v22];
      [v41 setIsAllDay:v79];
      v44 = objc_opt_new();
      [v44 setEvent:v41];
      id v71 = v22;
      v45 = objc_opt_new();
      v46 = (void *)MEMORY[0x1E4F9A378];
      v47 = [v41 title];
      v48 = [v46 textWithString:v47];
      [v45 setTitle:v48];

      v49 = (void *)[objc_alloc(MEMORY[0x1E4F99F10]) initWithDate:v21];
      [v45 setThumbnail:v49];

      v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v51 = [v50 localizedStringForKey:@"ADD" value:&stru_1F1824018 table:@"SpotlightServices"];
      [(SSDataDetectorResultGenerator *)v32 buttonItemWithTitle:v51 symbol:0 command:v44];
      v52 = v67 = v41;
      v83[0] = v52;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
      v53 = v66 = v32;
      [v45 setButtonItems:v53];

      [v45 setButtonItemsAreTrailing:1];
      [v45 setCommand:v44];
      v54 = (void *)MEMORY[0x1E4F9A378];
      v55 = +[SSDateFormatManager stringsFromDate:v21 toDate:v22 isAllDay:v79];
      v56 = [v55 componentsJoinedByString:@" · "];
      v65 = [v54 textWithString:v56];

      v82 = v65;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
      [v45 setDescriptions:v57];

      v81 = v45;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      v59 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v60 = [v59 localizedStringForKey:@"QUICK_ACTION_CALENDAR_EVENT_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
      v61 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v62 = [v61 localizedStringForKey:@"QUICK_ACTION_CALENDAR_EVENT_COMPLETION" value:&stru_1F1824018 table:@"SpotlightServices"];
      v63 = [(SSDataDetectorResultGenerator *)v66 buildResultSectionWithCardSections:v58 queryId:a6 resultBundleId:@"com.apple.datadetector.quick_actions.calendar" sectionTitle:v60 completion:v62];

      v80 = v63;
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
      ((void (**)(void, void *))v24)[2](v24, v64);

      id v22 = v71;
      v12 = v69;
      goto LABEL_31;
    }
  }
  id v77 = 0;
  id v78 = 0;
  char v20 = [v10 extractStartDate:&v78 startTimezone:0 endDate:&v77 endTimezone:0 allDayRef:&v79 referenceDate:v14 referenceTimezone:v13];
  id v21 = v78;
  id v22 = v77;
  if (v20)
  {
    uint64_t v70 = v16;
    id v23 = v21;
    v73 = v13;
    goto LABEL_11;
  }
  v24 = (void (**)(void, void))v11;
  (*((void (**)(id, void))v11 + 2))(v11, MEMORY[0x1E4F1CBF0]);
LABEL_32:
}

- (id)buildResultSectionWithCardSections:(id)a3 queryId:(unint64_t)a4 resultBundleId:(id)a5 sectionTitle:(id)a6 completion:(id)a7
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = objc_opt_new();
  [v15 setCardSections:v14];

  uint64_t v16 = objc_alloc_init(SFSearchResult_SpotlightExtras);
  [(SFSearchResult_SpotlightExtras *)v16 setInlineCard:v15];
  [(SFSearchResult_SpotlightExtras *)v16 setTopHit:SSSetTopHitWithReasonString(2, v16, @"SSDataDetectorResultGenerator direct", 1)];
  [(SFSearchResult_SpotlightExtras *)v16 setResultBundleId:v13];

  [(SFSearchResult_SpotlightExtras *)v16 setSectionBundleIdentifier:@"com.apple.datadetector.quick_actions"];
  [(SFSearchResult_SpotlightExtras *)v16 setSectionHeader:v12];
  [(SFSearchResult_SpotlightExtras *)v16 setQueryId:a4];
  id v17 = [NSString stringWithFormat:@"%@-%llu", @"com.apple.datadetector.quick_actions", a4];
  [(SFSearchResult_SpotlightExtras *)v16 setIdentifier:v17];

  [(SFSearchResult_SpotlightExtras *)v16 setCompletion:v11];
  [(SFSearchResult_SpotlightExtras *)v16 setApplicationBundleIdentifier:@"com.apple.datadetector.quick_actions"];
  [(SFSearchResult_SpotlightExtras *)v16 setType:2];
  unint64_t v18 = objc_alloc_init(SFMutableResultSection);
  v21[0] = v16;
  int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(SFMutableResultSection *)v18 setResults:v19];

  [(SFResultSection *)v18 setBundleIdentifier:@"com.apple.datadetector.quick_actions"];
  [(SFMutableResultSection *)v18 setDomain:10];
  [(SFResultSection *)v18 setTitle:v12];

  return v18;
}

- (id)buttonItemWithTitle:(id)a3 symbol:(id)a4 command:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setTitle:v9];

  if (v7)
  {
    id v11 = objc_opt_new();
    [v11 setIsTemplate:1];
    [v11 setSymbolName:v7];
    [v10 setImage:v11];
  }
  [v10 setCommand:v8];

  return v10;
}

@end