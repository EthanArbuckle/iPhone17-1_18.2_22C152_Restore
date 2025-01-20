@interface WFProcessedContacts
@end

@implementation WFProcessedContacts

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke(uint64_t a1, void (**a2)(void))
{
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    objc_msgSend(v3, "allowContactsAccessWithCompletionHandler:");
  }
  else
  {
    v4 = a2;
    v5 = (void (**)(void))objc_opt_new();
    a2[2](v4);
  }
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 type])
  {
    if ([v6 type] == 1)
    {
      v8 = [v6 phoneNumber];
      uint64_t v9 = *(void *)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_3;
      v22[3] = &unk_1E6550F28;
      id v23 = v8;
      id v24 = v7;
      v10 = *(void (**)(uint64_t, void *))(v9 + 16);
      id v11 = v8;
      v10(v9, v22);

      v12 = v24;
LABEL_8:

      goto LABEL_9;
    }
    if ([v6 type] == 2)
    {
      v15 = [v6 emailAddress];
      uint64_t v16 = *(void *)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_4;
      v19[3] = &unk_1E6550F28;
      id v20 = v15;
      id v21 = v7;
      v17 = *(void (**)(uint64_t, void *))(v16 + 16);
      id v11 = v15;
      v17(v16, v19);

      v12 = v21;
      goto LABEL_8;
    }
    if ([v6 type] != 3)
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      goto LABEL_9;
    }
    v13 = [v6 customHandle];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F305B8]) initWithValue:0 type:0];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v14 nameComponents:0 displayName:v13 image:0 contactIdentifier:0 customIdentifier:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v18, 0);
  }
  else
  {
    v13 = [v6 contact];
    v14 = [v13 INPersonRepresentation];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v14, 0);
  }

LABEL_9:
}

uint64_t __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v13
      && ([v13 firstContactWithPhoneNumber:*(void *)(a1 + 32)],
          (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = v6;
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [v6 INPersonRepresentation];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F305B8]);
      id v11 = [*(id *)(a1 + 32) normalizedPhoneNumber];
      id v7 = (void *)[v10 initWithValue:v11 type:2];

      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v7 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
    }
    v12 = (void *)v9;
    (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, v9, 0);
  }
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v13
      && ([v13 firstContactWithEmailAddress:*(void *)(a1 + 32)],
          (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = v6;
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [v6 INPersonRepresentation];
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F305B8]);
      id v11 = [*(id *)(a1 + 32) address];
      id v7 = (void *)[v10 initWithValue:v11 type:1];

      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F305B0]) initWithPersonHandle:v7 nameComponents:0 displayName:0 image:0 contactIdentifier:0 customIdentifier:0];
    }
    v12 = (void *)v9;
    (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, v9, 0);
  }
}

@end