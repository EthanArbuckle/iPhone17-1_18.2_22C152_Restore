@interface WFProcessedContacts(INPerson)
- (void)getRecipientsWithPermissionRequestor:()INPerson completionHandler:;
@end

@implementation WFProcessedContacts(INPerson)

- (void)getRecipientsWithPermissionRequestor:()INPerson completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 entries];
  v9 = objc_msgSend(v8, "if_firstObjectWithIntValue:forKey:", 4, @"type");

  if (v9)
  {
    v10 = [v9 messageGroup];
    (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v10, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6550F00;
    id v19 = v6;
    v11 = _Block_copy(aBlock);
    v12 = [a1 entries];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6550F50;
    id v17 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_5;
    v14[3] = &unk_1E65586C8;
    id v15 = v7;
    id v13 = v11;
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v16, v14);
  }
}

@end