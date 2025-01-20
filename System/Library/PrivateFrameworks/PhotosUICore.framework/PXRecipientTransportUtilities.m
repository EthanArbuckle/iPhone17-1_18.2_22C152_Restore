@interface PXRecipientTransportUtilities
+ (BOOL)px_IsEmailAddress:(id)a3 equalToEmailAddress:(id)a4;
+ (BOOL)px_IsValidEmailAddress:(id)a3;
+ (id)px_bestMessagingTransportForContact:(id)a3;
+ (id)px_validPhoneNumberFromString:(id)a3;
+ (int64_t)px_recipientKindFromString:(id)a3;
@end

@implementation PXRecipientTransportUtilities

+ (id)px_bestMessagingTransportForContact:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXRecipientTransportUtilities.m", 76, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v4 = [[PXRecipient alloc] initWithContact:v3 address:0 nameComponents:0 recipientKind:0];
  v5 = [(PXRecipient *)v4 allEmails];
  v6 = [(PXRecipient *)v4 unformattedAllPhones];
  v7 = [v5 setByAddingObjectsFromSet:v6];
  if ((unint64_t)[v7 count] < 2)
  {
    v19 = [(PXRecipient *)v4 suggestedTransport];
    goto LABEL_19;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v8 = (void *)get_CDInteractionAdvisorClass_softClass;
  uint64_t v29 = get_CDInteractionAdvisorClass_softClass;
  if (!get_CDInteractionAdvisorClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CDInteractionAdvisorClass_block_invoke;
    v31 = &unk_1E5DD2B08;
    v32 = &v26;
    __get_CDInteractionAdvisorClass_block_invoke((uint64_t)buf);
    v8 = (void *)v27[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v26, 8);
  v10 = [v9 interactionAdvisor];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v11 = (void *)get_CDInteractionAdvisorSettingsClass_softClass;
  uint64_t v29 = get_CDInteractionAdvisorSettingsClass_softClass;
  if (!get_CDInteractionAdvisorSettingsClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CDInteractionAdvisorSettingsClass_block_invoke;
    v31 = &unk_1E5DD2B08;
    v32 = &v26;
    __get_CDInteractionAdvisorSettingsClass_block_invoke((uint64_t)buf);
    v11 = (void *)v27[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v26, 8);
  v13 = [v12 interactionAdvisorSettingsDefault];
  [v13 setConstrainIdentifiers:v7];
  v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F02D93E8, &unk_1F02D9400, &unk_1F02D9418, 0);
  [v13 setConstrainMechanisms:v14];

  v15 = [v7 allObjects];
  v16 = [v10 rankCandidateContacts:v15 usingSettings:v13];

  v17 = [v16 firstObject];
  if ([v5 containsObject:v17])
  {
    uint64_t v18 = 1;
    if (!v17)
    {
LABEL_22:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"PXRecipientTransportUtilities.m", 105, @"Invalid parameter not satisfying: %@", @"bestAddress" object file lineNumber description];
    }
  }
  else
  {
    if (([v6 containsObject:v17] & 1) == 0)
    {
      v20 = PLUIGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v3;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "The result for best messaging transport address:%@ for contact:%@ is invalid", buf, 0x16u);
      }

      v19 = 0;
      goto LABEL_18;
    }
    uint64_t v18 = 2;
    if (!v17) {
      goto LABEL_22;
    }
  }
  v19 = [[PXRecipientTransport alloc] initWithAddress:v17 addressKind:v18];
LABEL_18:

LABEL_19:
  return v19;
}

+ (int64_t)px_recipientKindFromString:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "px_validPhoneNumberFromString:", v4);

  if (v5) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = objc_msgSend(a1, "px_IsValidEmailAddress:", v4);
  }

  return v6;
}

+ (id)px_validPhoneNumberFromString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (px_validPhoneNumberFromString__onceToken != -1)
  {
    dispatch_once(&px_validPhoneNumberFromString__onceToken, &__block_literal_global_217958);
    if (v4) {
      goto LABEL_3;
    }
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  if (!v3) {
    goto LABEL_16;
  }
LABEL_3:
  v5 = objc_msgSend((id)px_validPhoneNumberFromString__phoneDetector, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 resultType] == 2048)
        {
          uint64_t v12 = [v11 phoneNumber];

          v8 = (void *)v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

LABEL_17:
  return v8;
}

void __63__PXRecipientTransportUtilities_px_validPhoneNumberFromString___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:2048 error:&v4];
  id v1 = v4;
  v2 = (void *)px_validPhoneNumberFromString__phoneDetector;
  px_validPhoneNumberFromString__phoneDetector = v0;

  if (!px_validPhoneNumberFromString__phoneDetector)
  {
    id v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v1;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_ERROR, "Invitation Recipient can't instantiate detector for phone %@", buf, 0xCu);
    }
  }
}

+ (BOOL)px_IsEmailAddress:(id)a3 equalToEmailAddress:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F607F8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithString:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v6];
  if (v8 == v9) {
    char v10 = 1;
  }
  else {
    char v10 = [v8 isEqual:v9];
  }

  return v10;
}

+ (BOOL)px_IsValidEmailAddress:(id)a3
{
  return [MEMORY[0x1E4F60810] parseEmailAddressString:a3 displayName:0 localPart:0 domain:0 groupList:0];
}

@end