@interface DeliveryAccount
+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4;
+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5;
+ (DeliveryAccount)accountWithIdentifier:(id)a3;
+ (DeliveryAccount)accountWithUniqueId:(id)a3;
+ (id)accountTypeIdentifier;
+ (id)carrierDeliveryAccount;
+ (id)deliveryAccounts;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)existingAccountWithHostname:(id)a3 username:(id)a4;
+ (id)existingAccountWithIdentifier:(id)a3;
+ (void)_postDeliveryAccountsHaveChanged;
+ (void)addDeliveryAccount:(id)a3;
+ (void)reloadDeliveryAccounts;
+ (void)removeDeliveryAccount:(id)a3;
- (BOOL)canBeFallbackAccount;
- (BOOL)hasEnoughInformationForEasySetup;
- (BOOL)hasNoReferences;
- (BOOL)shouldUseAuthentication;
- (BOOL)supportsOutboxCopy;
- (Class)deliveryClass;
- (NSString)identifier;
- (id)mailAccountIfAvailable;
- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
- (id)newDeliveryWithMessage:(id)a3;
- (unint64_t)maximumMessageBytes;
- (void)_setAccountProperties:(id)a3;
- (void)_updateAccountDescriptionWithUsername:(id)a3 hostname:(id)a4;
- (void)setMaximumMessageBytes:(unint64_t)a3;
- (void)setShouldUseAuthentication:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation DeliveryAccount

+ (void)_postDeliveryAccountsHaveChanged
{
  +[DeliveryAccount mf_lock];
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v5 = (id)[v2 initWithArray:sDeliveryAccounts];
  +[DeliveryAccount mf_unlock];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"DeliveryAccountsDidChange" object:v5 userInfo:0];
  [v3 postNotification:v4];
}

+ (void)reloadDeliveryAccounts
{
  +[DeliveryAccount mf_lock];
  v3 = (void *)sDeliveryAccounts;
  sDeliveryAccounts = 0;

  id v4 = getDeliveryAccounts();
  +[DeliveryAccount mf_unlock];
  [a1 _postDeliveryAccountsHaveChanged];
}

+ (id)existingAccountForUniqueID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[DeliveryAccount mf_lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)sDeliveryAccounts;
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "uniqueID", (void)v12);
        int v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  +[DeliveryAccount mf_unlock];
  return v5;
}

+ (DeliveryAccount)accountWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 deliveryAccounts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (DeliveryAccount *)v6;
}

- (NSString)identifier
{
  id v3 = [(MFAccount *)self hostname];
  id v4 = [(MFAccount *)self username];
  if (v4)
  {
    id v5 = NSString;
    id v6 = [(MFAccount *)self username];
    id v7 = [v5 stringWithFormat:@"%@:%@", v3, v6];
  }
  else
  {
    id v7 = v3;
  }

  return (NSString *)v7;
}

+ (id)deliveryAccounts
{
  +[DeliveryAccount mf_lock];
  id v2 = getDeliveryAccounts();
  id v3 = (void *)[v2 copy];

  +[DeliveryAccount mf_unlock];
  return v3;
}

+ (id)existingAccountWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[DeliveryAccount mf_lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)sDeliveryAccounts;
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "identifier", (void)v12);
        int v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  +[DeliveryAccount mf_unlock];
  return v5;
}

- (unint64_t)maximumMessageBytes
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"MaxMessageBytes"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17850];
}

+ (void)addDeliveryAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    +[DeliveryAccount mf_lock];
    unint64_t v3 = getDeliveryAccounts();
    [v3 addObject:v4];
    [v4 savePersistentAccount];
    +[DeliveryAccount mf_unlock];
  }
}

+ (void)removeDeliveryAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"DeliveryAccountWillBeRemoved" object:v3];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    id v6 = v5;
    id v11 = v6;
    id v7 = v4;
    id v12 = v7;
    v8 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v10, 3221225472, __41__DeliveryAccount_removeDeliveryAccount___block_invoke, &unk_1E5D3B6E0);
    [v8 performBlock:&v10];

    +[DeliveryAccount mf_lock];
    v9 = getDeliveryAccounts();
    [v9 removeObject:v3];
    [v3 removePersistentAccount];
    +[DeliveryAccount mf_unlock];
  }
}

uint64_t __41__DeliveryAccount_removeDeliveryAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postNotification:*(void *)(a1 + 40)];
}

+ (DeliveryAccount)accountWithUniqueId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 deliveryAccounts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "uniqueID", (void)v13);
        int v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (DeliveryAccount *)v6;
}

+ (id)existingAccountWithHostname:(id)a3 username:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (v7)
  {
    v9 = v8;
    if (([v7 isEqualToString:&stru_1EFF11268] & 1) == 0)
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@:%@", v8, v7];

      v9 = (void *)v10;
    }
  }
  int v11 = [a1 accountWithIdentifier:v9];

  return v11;
}

+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4
{
  id v4 = [a1 accountWithHostname:a3 username:a4 lookForExistingAccounts:1];
  return (DeliveryAccount *)v4;
}

+ (DeliveryAccount)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v5
    || ([a1 existingAccountWithHostname:v8 username:v9],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v11 = [MEMORY[0x1E4F1C9E8] dictionary];
    uint64_t v10 = (void *)[a1 newAccountWithDictionary:v11];

    [v10 setHostname:v8];
    [v10 setUsername:v9];
    [v10 _updateAccountDescriptionWithUsername:v9 hostname:v8];
    +[DeliveryAccount addDeliveryAccount:v10];
  }

  return (DeliveryAccount *)v10;
}

+ (id)carrierDeliveryAccount
{
  id v3 = +[MFNetworkController sharedInstance];
  id v4 = (void *)[v3 copyCarrierBundleValue:@"SMTPServers"];

  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndex:0];
    uint64_t v6 = [v5 rangeOfString:@":"];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v5;
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v10 = [v5 substringToIndex:v6];
      int v11 = [v5 substringFromIndex:v6 + 1];
      if ([v11 length]) {
        uint64_t v8 = [v11 intValue];
      }
      else {
        uint64_t v8 = 0xFFFFFFFFLL;
      }

      id v7 = (id)v10;
    }
    if ([v7 length])
    {
      id v12 = [MEMORY[0x1E4F1C9E8] dictionary];
      id v9 = (void *)[a1 newAccountWithDictionary:v12];

      [v9 setHostname:v7];
      if ((int)v8 >= 1) {
        [v9 setPortNumber:v8];
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (Class)deliveryClass
{
  return 0;
}

- (id)newDeliveryWithMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithMessage:", v4);
  [v5 setAccount:self];

  return v5;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:mixedContent:textPartsAreHTML:", v8, v9, v5);
  [v10 setAccount:self];

  return v10;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:HTML:plainTextAlternative:other:", v10, v11, v12, v13);
  [v14 setAccount:self];

  return v14;
}

- (BOOL)shouldUseAuthentication
{
  id v3 = [(MFAccount *)self username];
  id v4 = [(MFAccount *)self accountPropertyForKey:@"ShouldUseAuthentication"];
  int v5 = [v4 BOOLValue];

  if (v3) {
    unsigned int v6 = v5 & ~[v3 isEqualToString:&stru_1EFF11268];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)setShouldUseAuthentication:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:");
}

- (void)setUsername:(id)a3
{
  id v4 = a3;
  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", [v4 length] != 0);
  v6.receiver = self;
  v6.super_class = (Class)DeliveryAccount;
  [(MFAccount *)&v6 setUsername:v4];
  int v5 = [(MFAccount *)self hostname];
  [(DeliveryAccount *)self _updateAccountDescriptionWithUsername:v4 hostname:v5];
}

- (void)_setAccountProperties:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DeliveryAccount;
  [(MFAccount *)&v7 _setAccountProperties:v4];
  uint64_t v5 = [v4 objectForKey:@"Username"];
  uint64_t v6 = [v4 objectForKey:@"Hostname"];
  if (v5 | v6) {
    [(DeliveryAccount *)self _updateAccountDescriptionWithUsername:v5 hostname:v6];
  }
}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  if ([(DeliveryAccount *)self maximumMessageBytes] != a3)
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
    [(MFAccount *)self setAccountProperty:v5 forKey:@"MaxMessageBytes"];

    [(MFAccount *)self savePersistentAccount];
  }
}

- (id)mailAccountIfAvailable
{
  return 0;
}

- (BOOL)hasNoReferences
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(DeliveryAccount *)self identifier];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = +[MailAccount mailAccounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) deliveryAccount];
        id v8 = [(id)v7 identifier];

        LOBYTE(v7) = [v8 isEqualToString:v2];
        if (v7)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)canBeFallbackAccount
{
  return 1;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  id v3 = [(MFAccount *)self hostname];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(MFAccount *)self username];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

- (BOOL)supportsOutboxCopy
{
  return 0;
}

- (void)_updateAccountDescriptionWithUsername:(id)a3 hostname:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [(MFAccount *)self persistentAccount];
  if (v7)
  {
    if ([v13 length])
    {
      uint64_t v8 = [v13 rangeOfString:@"@"];
      BOOL v9 = v13;
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 length])
        {
          uint64_t v10 = [NSString stringWithFormat:@"%@@%@", v13, v6];
LABEL_8:
          long long v12 = (void *)v10;
LABEL_10:
          [v7 setAccountDescription:v12];

          goto LABEL_11;
        }
LABEL_9:
        long long v12 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v11 = [v6 length];
      BOOL v9 = v6;
      if (!v11) {
        goto LABEL_9;
      }
    }
    uint64_t v10 = [v9 copy];
    goto LABEL_8;
  }
LABEL_11:
}

@end