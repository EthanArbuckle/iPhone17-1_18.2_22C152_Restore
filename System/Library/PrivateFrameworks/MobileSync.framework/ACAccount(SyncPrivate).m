@interface ACAccount(SyncPrivate)
- (uint64_t)_usernameFromProperties:()SyncPrivate;
- (uint64_t)applySyncProperties:()SyncPrivate;
- (uint64_t)isMobileMeAccount;
- (uint64_t)syncIdentityString;
- (void)setPasswordFromSync:()SyncPrivate;
@end

@implementation ACAccount(SyncPrivate)

- (uint64_t)isMobileMeAccount
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  uint64_t result = [v2 isEqualToString:*MEMORY[0x263EFAF10]];
  if (result)
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "parentAccount"), "accountType"), "identifier");
    uint64_t v5 = *MEMORY[0x263EFAE58];
    return [v4 isEqualToString:v5];
  }
  return result;
}

- (uint64_t)syncIdentityString
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  v3 = (__CFString *)[a1 username];
  if (!v3) {
    v3 = (__CFString *)[a1 accountPropertyForKey:@"Username"];
  }
  v4 = (__CFString *)[a1 accountPropertyForKey:@"Hostname"];
  return _identityStringWithInfo(v2, v3, v4);
}

- (uint64_t)_usernameFromProperties:()SyncPrivate
{
  uint64_t v5 = (void *)[a3 objectForKey:@"Username"];
  v6 = objc_msgSend((id)objc_msgSend(a1, "accountType"), "identifier");
  if (![v6 isEqualToString:*MEMORY[0x263EFAE58]]) {
    return (uint64_t)v5;
  }
  v7 = (void *)[a3 objectForKey:@"EmailAddresses"];
  return _bestiCloudUsernameFromEmails(v5, v7);
}

- (uint64_t)applySyncProperties:()SyncPrivate
{
  if (applySyncProperties__onceToken != -1) {
    dispatch_once(&applySyncProperties__onceToken, &__block_literal_global_13);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke_2;
  v6[3] = &unk_264DC6FC0;
  v6[4] = a1;
  v6[5] = a3;
  return [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)setPasswordFromSync:()SyncPrivate
{
  if ([a3 length])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263EFB200]) initWithPassword:a3];
    [a1 setCredential:v5];
    objc_msgSend(a1, "setCredentialType:", objc_msgSend((id)objc_msgSend(a1, "credential"), "credentialType"));
    [a1 setAuthenticated:1];
  }
}

@end