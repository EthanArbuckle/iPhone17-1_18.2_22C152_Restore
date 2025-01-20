@interface MFMailboxUid(NNMKAdditions)
+ (uint64_t)nano_toMailboxType:()NNMKAdditions;
- (NNMKMailbox)nano_mailbox;
- (id)nano_displayName;
- (id)nano_mailboxId;
- (uint64_t)nano_mailboxType;
- (void)nano_mailboxId;
@end

@implementation MFMailboxUid(NNMKAdditions)

- (id)nano_mailboxId
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D8A5B9F1-722E-436E-B616-1398AEB94F1B"];
  int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    v6 = [a1 URL];
    v7 = [v6 absoluteString];

    if (v7 && [v7 length])
    {
      v8 = v7;
    }
    else
    {
      v12 = [a1 account];
      v13 = objc_msgSend(v12, "nano_accountId");
      v14 = [a1 name];
      v8 = +[NNMKMailbox generateLegacyMailboxIdWithAccountId:v13 mailboxName:v14];

      v15 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        [(MFMailboxUid(NNMKAdditions) *)(uint64_t)v8 nano_mailboxId];
      }
    }
  }
  else
  {
    v9 = [a1 account];
    v10 = objc_msgSend(v9, "nano_accountId");
    v11 = [a1 name];
    v8 = +[NNMKMailbox generateLegacyMailboxIdWithAccountId:v10 mailboxName:v11];
  }
  return v8;
}

+ (uint64_t)nano_toMailboxType:()NNMKAdditions
{
  if (a3 > 9) {
    return 1;
  }
  else {
    return qword_23D460698[a3];
  }
}

- (id)nano_displayName
{
  if ([a1 type] == 7) {
    [a1 displayNameUsingSpecialNames];
  }
  else {
  v2 = [a1 displayName];
  }
  return v2;
}

- (NNMKMailbox)nano_mailbox
{
  v2 = objc_alloc_init(NNMKMailbox);
  v3 = [a1 displayName];
  [(NNMKMailbox *)v2 setCustomName:v3];

  v4 = objc_msgSend(a1, "nano_mailboxId");
  [(NNMKMailbox *)v2 setMailboxId:v4];

  -[NNMKMailbox setType:](v2, "setType:", objc_msgSend(a1, "nano_mailboxType"));
  int v5 = [a1 URL];
  [(NNMKMailbox *)v2 setUrl:v5];

  if ([(NNMKMailbox *)v2 type] == 1)
  {
    v6 = [a1 account];
    v7 = [v6 displayName];
    [(NNMKMailbox *)v2 setCustomName:v7];
  }
  v8 = [a1 account];
  v9 = objc_msgSend(v8, "nano_accountId");
  [(NNMKMailbox *)v2 setAccountId:v9];

  return v2;
}

- (uint64_t)nano_mailboxType
{
  uint64_t v2 = [a1 type];
  uint64_t result = 5;
  switch(v2)
  {
    case 0:
      if ([a1 isNotesMailboxUid]) {
        uint64_t result = 0;
      }
      else {
        uint64_t result = 9;
      }
      break;
    case 1:
      return result;
    case 2:
LABEL_7:
      uint64_t result = 3;
      break;
    case 3:
LABEL_8:
      uint64_t result = 4;
      break;
    case 4:
LABEL_9:
      uint64_t result = 2;
      break;
    case 5:
LABEL_10:
      uint64_t result = 6;
      break;
    case 6:
LABEL_11:
      uint64_t result = 7;
      break;
    case 7:
LABEL_6:
      uint64_t result = 1;
      break;
    case 8:
      uint64_t result = 8;
      break;
    default:
      switch(v2)
      {
        case 'd':
          goto LABEL_6;
        case 'e':
          return result;
        case 'f':
          goto LABEL_7;
        case 'g':
          goto LABEL_8;
        case 'h':
          goto LABEL_9;
        case 'i':
          goto LABEL_10;
        case 'j':
          goto LABEL_11;
        default:
          uint64_t result = 0;
          break;
      }
      break;
  }
  return result;
}

- (void)nano_mailboxId
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Missing mailbox url and falling back to legacy id: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end