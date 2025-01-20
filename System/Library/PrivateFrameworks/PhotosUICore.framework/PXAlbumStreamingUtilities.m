@interface PXAlbumStreamingUtilities
+ (id)contactsViewControllerForRecipient:(id)a3 resendInvitationSelector:(SEL)a4 removeSubscriberSelector:(SEL)a5 target:(id)a6;
@end

@implementation PXAlbumStreamingUtilities

+ (id)contactsViewControllerForRecipient:(id)a3 resendInvitationSelector:(SEL)a4 removeSubscriberSelector:(SEL)a5 target:(id)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a6;
  unint64_t v9 = 0x1E4F1B000uLL;
  v10 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v47[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  id v43 = 0;
  id v44 = 0;
  v12 = [v7 matchingContactWithKeysToFetch:v11 outMatchingKey:&v44 outMatchingIdentifier:&v43];
  id v13 = v44;
  id v14 = v43;

  v15 = PLServicesLocalizedFrameworkString();
  v16 = PLServicesLocalizedFrameworkString();
  id v42 = v14;
  if (v12)
  {
    v17 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v12];
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1) {
      [v17 setDisplayMode:1];
    }
    [v17 setAllowsEditing:0];
    [v17 setAllowsActions:0];
    if (v13 && v14) {
      [v17 highlightPropertyWithKey:v13 identifier:v14];
    }
    id v18 = [v17 contentViewController];
    v19 = [v18 cardFooterGroup];
    if (a4) {
      [v18 addActionWithTitle:v15 target:v8 selector:a4 inGroup:v19 destructive:0];
    }
    if (a5) {
      [v18 addActionWithTitle:v16 target:v8 selector:a5 inGroup:v19 destructive:1];
    }
LABEL_25:

    id v14 = v42;
    goto LABEL_26;
  }
  v39 = v15;
  v20 = [v7 emailAddressString];
  if (v20)
  {

LABEL_14:
    id v18 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v22 = [v7 firstName];
    [v18 setGivenName:v22];

    v23 = [v7 lastName];
    [v18 setFamilyName:v23];

    v24 = [v7 emailAddressString];

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1BA20]);
      uint64_t v26 = *MEMORY[0x1E4F1B6F8];
      v27 = [v7 emailAddressString];
      v28 = (void *)[v25 initWithLabel:v26 value:v27];

      v46 = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [v18 setEmailAddresses:v29];

      unint64_t v9 = 0x1E4F1B000;
    }
    v30 = [v7 phoneNumberString];

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E4F1BA70];
      v32 = [v7 phoneNumberString];
      v33 = [v31 phoneNumberWithStringValue:v32];

      id v34 = objc_alloc(MEMORY[0x1E4F1BA20]);
      v35 = (void *)[v34 initWithLabel:*MEMORY[0x1E4F1B758] value:v33];
      v45 = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      [v18 setPhoneNumbers:v36];

      unint64_t v9 = 0x1E4F1B000uLL;
    }
    v17 = [*(id *)(v9 + 2984) viewControllerForUnknownContact:v18];
    if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1) {
      [v17 setDisplayMode:1];
    }
    [v17 setAllowsActions:1];
    v19 = [v17 contentViewController];
    [v19 setAllowsAddingToAddressBook:1];
    v37 = [v19 cardFooterGroup];
    if (a4) {
      [v19 addActionWithTitle:v39 target:v8 selector:a4 inGroup:v37 destructive:0];
    }
    if (a5) {
      [v19 addActionWithTitle:v16 target:v8 selector:a5 inGroup:v37 destructive:1];
    }

    v15 = v39;
    goto LABEL_25;
  }
  v21 = [v7 phoneNumberString];

  if (v21) {
    goto LABEL_14;
  }
  v17 = 0;
  v15 = v39;
LABEL_26:

  return v17;
}

@end