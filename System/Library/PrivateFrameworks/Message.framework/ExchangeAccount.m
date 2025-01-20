@interface ExchangeAccount
+ (id)accountTypeString;
- (BOOL)_syncOnly_defaultValueForShouldStoreJunkOnServer;
- (BOOL)shouldFetchACEDBInfoForError:(id)a3;
- (BOOL)storeDraftsOnServer;
- (BOOL)storeSentMessagesOnServer;
- (Class)connectionClass;
- (id)_defaultSpecialMailboxNameForType:(int64_t)a3;
- (void)_filterMailboxList:(id)a3 forMailboxWithPath:(id)a4 iisServer:(id)a5;
- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5;
@end

@implementation ExchangeAccount

+ (id)accountTypeString
{
  return @"Exchange";
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_syncOnly_defaultValueForShouldStoreJunkOnServer
{
  return 1;
}

- (BOOL)storeDraftsOnServer
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"StoreDraftsOnServer" defaultValue:1];
}

- (BOOL)storeSentMessagesOnServer
{
  return [(MFAccount *)self _BOOLForAccountInfoKey:@"StoreSentMessagesOnServer" defaultValue:1];
}

- (id)_defaultSpecialMailboxNameForType:(int64_t)a3
{
  if (a3 == 4)
  {
    v5 = @"Sent Items";
  }
  else if (a3 == 3)
  {
    v5 = @"Deleted Items";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)ExchangeAccount;
    -[MailAccount _defaultSpecialMailboxNameForType:](&v7, sel__defaultSpecialMailboxNameForType_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)filterMailboxList:(id)a3 forMailbox:(id)a4 options:(int64_t)a5
{
  id v9 = a3;
  id v8 = a4;
  if ((unint64_t)(a5 - 1) <= 1) {
    [(ExchangeAccount *)self _filterMailboxList:v9 forMailboxWithPath:v8 iisServer:0];
  }
}

- (void)_filterMailboxList:(id)a3 forMailboxWithPath:(id)a4 iisServer:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v16 || ![v16 count]) {
    goto LABEL_22;
  }
  if (v7)
  {
    uint64_t v9 = [v7 length];
    BOOL v10 = v9 == 0;
    if (!v8)
    {
      if (v9) {
        goto LABEL_22;
      }
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (v8)
  {
    BOOL v10 = 1;
LABEL_9:
    if ([v8 length]) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
    if (!v11) {
      goto LABEL_22;
    }
  }
LABEL_13:
  uint64_t v12 = [v16 count];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    do
    {
      v14 = [v16 objectAtIndex:v13];
      v15 = [v14 objectForKey:@"MailboxName"];
      if (([@"Contacts" isEqualToString:v15] & 1) != 0
        || ([@"Calendar" isEqualToString:v15] & 1) != 0
        || ([@"Journal" isEqualToString:v15] & 1) != 0
        || ([@"Notes" isEqualToString:v15] & 1) != 0
        || [@"Tasks" isEqualToString:v15])
      {
        [v16 removeObjectAtIndex:v13];
      }

      --v13;
    }
    while (v13 != -1);
  }
LABEL_22:
}

- (BOOL)shouldFetchACEDBInfoForError:(id)a3
{
  return 0;
}

@end