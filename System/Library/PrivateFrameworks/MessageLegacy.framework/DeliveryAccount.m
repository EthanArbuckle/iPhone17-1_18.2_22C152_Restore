@interface DeliveryAccount
+ (id)accountTypeIdentifier;
+ (id)accountWithHostname:(id)a3 username:(id)a4;
+ (id)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5;
+ (id)accountWithIdentifier:(id)a3;
+ (id)accountWithUniqueId:(id)a3;
+ (id)carrierDeliveryAccount;
+ (id)deliveryAccounts;
+ (id)existingAccountForUniqueID:(id)a3;
+ (id)existingAccountWithHostname:(id)a3 username:(id)a4;
+ (id)existingAccountWithIdentifier:(id)a3;
+ (id)newDefaultInstance;
+ (void)_postDeliveryAccountsHaveChanged;
+ (void)addDeliveryAccount:(id)a3;
+ (void)reloadDeliveryAccounts;
+ (void)removeDeliveryAccount:(id)a3;
- (BOOL)canBeFallbackAccount;
- (BOOL)hasEnoughInformationForEasySetup;
- (BOOL)hasNoReferences;
- (BOOL)shouldUseAuthentication;
- (BOOL)shouldUseSaveSentForAccount:(id)a3;
- (BOOL)supportsOutboxCopy;
- (Class)deliveryClass;
- (id)identifier;
- (id)mailAccountIfAvailable;
- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7;
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

+ (id)existingAccountWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[DeliveryAccount mf_lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = (void *)_deliveryAccounts;
  uint64_t v5 = [(id)_deliveryAccounts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  +[DeliveryAccount mf_unlock];
  return v9;
}

- (id)identifier
{
  v3 = [(MFAccount *)self hostname];
  if ([(MFAccount *)self username]) {
    return (id)[NSString stringWithFormat:@"%@:%@", v3, -[MFAccount username](self, "username")];
  }
  else {
    return v3;
  }
}

+ (id)existingAccountForUniqueID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  +[DeliveryAccount mf_lock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = (void *)_deliveryAccounts;
  uint64_t v5 = [(id)_deliveryAccounts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "uniqueId"), "isEqualToString:", a3)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  +[DeliveryAccount mf_unlock];
  return v9;
}

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F17850];
}

+ (void)_postDeliveryAccountsHaveChanged
{
  +[DeliveryAccount mf_lock];
  id v2 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v4 = (id)[v2 initWithArray:_deliveryAccounts];
  +[DeliveryAccount mf_unlock];
  v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v3, "postNotification:", objc_msgSend(MEMORY[0x1E4F28EA0], "notificationWithName:object:userInfo:", @"DeliveryAccountsDidChange", v4, 0));
}

+ (void)reloadDeliveryAccounts
{
  +[DeliveryAccount mf_lock];

  _deliveryAccounts = 0;
  getDeliveryAccounts();
  +[DeliveryAccount mf_unlock];
  [a1 _postDeliveryAccountsHaveChanged];
}

+ (id)deliveryAccounts
{
  +[DeliveryAccount mf_lock];
  id v2 = (id)[(id)getDeliveryAccounts() copy];
  +[DeliveryAccount mf_unlock];
  return v2;
}

+ (void)addDeliveryAccount:(id)a3
{
  if (a3)
  {
    +[DeliveryAccount mf_lock];
    [(id)getDeliveryAccounts() addObject:a3];
    [a3 savePersistentAccount];
    +[DeliveryAccount mf_unlock];
  }
}

+ (void)removeDeliveryAccount:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EA0] notificationWithName:@"DeliveryAccountWillBeRemoved" object:a3];
    id v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      [v4 postNotification:v3];
    }
    else {
      [v4 performSelectorOnMainThread:sel_postNotification_ withObject:v3 waitUntilDone:0];
    }
    id v5 = a3;
    +[DeliveryAccount mf_lock];
    [(id)getDeliveryAccounts() removeObject:a3];
    [a3 removePersistentAccount];
    +[DeliveryAccount mf_unlock];
  }
}

+ (id)accountWithUniqueId:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a1 deliveryAccounts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v9, "uniqueId"))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

+ (id)accountWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a1 deliveryAccounts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if (objc_msgSend((id)objc_msgSend(v9, "identifier"), "isEqualToString:", a3)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  return v9;
}

+ (id)existingAccountWithHostname:(id)a3 username:(id)a4
{
  if (a4 && ([a4 isEqualToString:&stru_1F265CF90] & 1) == 0) {
    a3 = (id)[NSString stringWithFormat:@"%@:%@", a3, a4];
  }
  return (id)[a1 accountWithIdentifier:a3];
}

+ (id)accountWithHostname:(id)a3 username:(id)a4
{
  return (id)[a1 accountWithHostname:a3 username:a4 lookForExistingAccounts:1];
}

+ (id)accountWithHostname:(id)a3 username:(id)a4 lookForExistingAccounts:(BOOL)a5
{
  if (!a5 || (uint64_t v8 = (void *)[a1 existingAccountWithHostname:a3 username:a4]) == 0)
  {
    uint64_t v8 = objc_msgSend(a1, "newAccountWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary"));
    [v8 setHostname:a3];
    [v8 setUsername:a4];
    [v8 _updateAccountDescriptionWithUsername:a4 hostname:a3];
    +[DeliveryAccount addDeliveryAccount:v8];
  }
  return v8;
}

+ (id)carrierDeliveryAccount
{
  return 0;
}

+ (id)newDefaultInstance
{
  return 0;
}

- (Class)deliveryClass
{
  return 0;
}

- (id)newDeliveryWithMessage:(id)a3
{
  id v4 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithMessage:", a3);
  [v4 setAccount:self];
  return v4;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:mixedContent:textPartsAreHTML:", a3, a4, a5);
  [v6 setAccount:self];
  return v6;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  uint64_t v8 = objc_msgSend(objc_alloc(-[DeliveryAccount deliveryClass](self, "deliveryClass")), "initWithHeaders:HTML:plainTextAlternative:other:charsets:", a3, a4, a5, a6, a7);
  [v8 setAccount:self];
  return v8;
}

- (BOOL)shouldUseAuthentication
{
  uint64_t v3 = [(MFAccount *)self username];
  char v4 = objc_msgSend(-[MFAccount accountPropertyForKey:](self, "accountPropertyForKey:", @"ShouldUseAuthentication"), "BOOLValue");
  if (v3) {
    return v4 & ~[(NSString *)v3 isEqualToString:&stru_1F265CF90];
  }
  else {
    return 0;
  }
}

- (void)setShouldUseAuthentication:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(MFAccount *)self setAccountProperty:v4 forKey:@"ShouldUseAuthentication"];
}

- (void)setUsername:(id)a3
{
  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", [a3 length] != 0);
  v5.receiver = self;
  v5.super_class = (Class)DeliveryAccount;
  [(MFAccount *)&v5 setUsername:a3];
  [(DeliveryAccount *)self _updateAccountDescriptionWithUsername:a3 hostname:[(MFAccount *)self hostname]];
}

- (void)_setAccountProperties:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DeliveryAccount;
  -[MFAccount _setAccountProperties:](&v7, sel__setAccountProperties_);
  uint64_t v5 = [a3 objectForKey:@"Username"];
  uint64_t v6 = [a3 objectForKey:@"Hostname"];
  if (v5 | v6) {
    [(DeliveryAccount *)self _updateAccountDescriptionWithUsername:v5 hostname:v6];
  }
}

- (unint64_t)maximumMessageBytes
{
  id v2 = [(MFAccount *)self accountPropertyForKey:@"MaxMessageBytes"];
  return [v2 unsignedLongLongValue];
}

- (void)setMaximumMessageBytes:(unint64_t)a3
{
  if ([(DeliveryAccount *)self maximumMessageBytes] != a3)
  {
    -[MFAccount setAccountProperty:forKey:](self, "setAccountProperty:forKey:", [NSNumber numberWithUnsignedLongLong:a3], @"MaxMessageBytes");
    [(MFAccount *)self savePersistentAccount];
  }
}

- (id)mailAccountIfAvailable
{
  return 0;
}

- (BOOL)hasNoReferences
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(DeliveryAccount *)self identifier];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = +[MailAccount mailAccounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "deliveryAccount"), "identifier"), "isEqualToString:", v2))return 0; {
        ++v7;
        }
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (BOOL)canBeFallbackAccount
{
  return 1;
}

- (BOOL)hasEnoughInformationForEasySetup
{
  NSUInteger v3 = [(NSString *)[(MFAccount *)self hostname] length];
  if (v3) {
    LOBYTE(v3) = [(NSString *)[(MFAccount *)self username] length] != 0;
  }
  return v3;
}

- (BOOL)supportsOutboxCopy
{
  return 0;
}

- (BOOL)shouldUseSaveSentForAccount:(id)a3
{
  return 0;
}

- (void)_updateAccountDescriptionWithUsername:(id)a3 hostname:(id)a4
{
  uint64_t v6 = [(MFAccount *)self persistentAccount];
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if (![a3 length])
  {
    if (![a4 length]) {
      goto LABEL_12;
    }
    id v9 = a4;
LABEL_10:
    id v8 = (id)[v9 copy];
    goto LABEL_11;
  }
  if ([a3 rangeOfString:@"@"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = a3;
    goto LABEL_10;
  }
  if (![a4 length])
  {
LABEL_12:
    id v10 = 0;
    goto LABEL_13;
  }
  id v8 = (id)[NSString stringWithFormat:@"%@@%@", a3, a4];
LABEL_11:
  id v10 = v8;
LABEL_13:
  [(ACAccount *)v7 setAccountDescription:v10];
}

@end