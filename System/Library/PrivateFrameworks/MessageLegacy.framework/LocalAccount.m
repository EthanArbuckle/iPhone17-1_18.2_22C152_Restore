@interface LocalAccount
+ (id)accountTypeIdentifier;
+ (id)accountTypeString;
+ (id)csAccountTypeString;
+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4;
+ (id)localAccount;
- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4;
- (BOOL)_shouldConfigureMailboxCache;
- (BOOL)canFetch;
- (BOOL)canGoOffline;
- (BOOL)deleteInPlaceForMailbox:(id)a3;
- (BOOL)isActive;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)supportsAppend;
- (BOOL)supportsArchiving;
- (BOOL)supportsPurge;
- (Class)storeClass;
- (LocalAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4;
- (id)_URLScheme;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_infoForMatchingURL:(id)a3;
- (id)displayName;
- (id)mailboxPathExtension;
- (id)mailboxUidForFileSystemPath:(id)a3;
- (id)primaryMailboxUid;
- (id)pushedMailboxUids;
- (id)transientDraftsFolder;
- (id)transientDraftsFolderShouldCreate:(BOOL)a3;
- (id)uniqueId;
- (void)_synchronouslyLoadListingForParent:(id)a3;
- (void)resetSpecialMailboxes;
@end

@implementation LocalAccount

- (void)resetSpecialMailboxes
{
  v3.receiver = self;
  v3.super_class = (Class)LocalAccount;
  [(MailAccount *)&v3 resetSpecialMailboxes];
  [(LocalAccount *)self transientDraftsFolderShouldCreate:0];
}

- (id)transientDraftsFolderShouldCreate:(BOOL)a3
{
  BOOL v3 = a3;
  [(LocalAccount *)self mf_lock];
  id v5 = [(MailAccount *)self mailboxUidForRelativePath:@"x-apple-transient-drafts" create:v3];
  [v5 setType:5];
  if ([v5 isValid]) {
    objc_msgSend((id)objc_msgSend(v5, "account"), "saveState");
  }
  [(LocalAccount *)self mf_unlock];
  return v5;
}

- (id)mailboxPathExtension
{
  return @"mbox";
}

- (BOOL)isActive
{
  return 1;
}

- (id)displayName
{
  return (id)MFLookupLocalizedString(@"PERSONAL_MAILBOXES", @"Local Mailboxes", 0);
}

- (id)_URLScheme
{
  return @"local";
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (LocalAccount)initWithLibrary:(id)a3 persistentAccount:(id)a4
{
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    +[MailAccount mf_lock];
    if (localAccount)
    {
      [(MailAccount *)self dealloc];
      v8 = (LocalAccount *)(id)localAccount;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)LocalAccount;
      v8 = [(MailAccount *)&v11 initWithLibrary:a3 persistentAccount:a4];
      localAccount = (uint64_t)v8;
    }
    +[MailAccount mf_unlock];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)LocalAccount;
    return [(MailAccount *)&v10 initWithLibrary:a3 persistentAccount:a4];
  }
  return v8;
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unsigned int)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  id v7 = [(MailAccount *)&v10 _copyMailboxUidWithParent:a3 name:a4 attributes:*(void *)&a5 existingMailboxUid:a6 dictionary:a7];
  v8 = v7;
  if (v7 && ([v7 isContainer] & 1) == 0) {
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") & 0xFFFFFFFELL);
  }
  return v8;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)LocalAccount;
  BOOL v6 = -[MailAccount _setChildren:forMailboxUid:](&v8, sel__setChildren_forMailboxUid_);
  if (([a4 isContainer] & 1) == 0 && objc_msgSend(a3, "count")) {
    objc_msgSend(a4, "setAttributes:", objc_msgSend(a4, "attributes") & 0xFFFFFFFELL);
  }
  return v6;
}

+ (id)localAccount
{
  if (!localAccount) {
    localAccount = -[MailAccount initWithPath:]([LocalAccount alloc], "initWithPath:", objc_msgSend((id)objc_msgSend(a1, "defaultAccountDirectory"), "stringByAppendingPathComponent:", @"Mailboxes"));
  }
  +[MailAccount mf_unlock];
  return (id)localAccount;
}

+ (id)defaultPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return @"Mailboxes";
}

- (id)uniqueId
{
  return @"LocalAccountId";
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (id)primaryMailboxUid
{
  return self->super._inboxMailboxUid;
}

- (id)pushedMailboxUids
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

+ (id)accountTypeString
{
  return @"Local";
}

+ (id)csAccountTypeString
{
  return (id)getCSAccountTypeLocal();
}

- (BOOL)canFetch
{
  return 0;
}

- (BOOL)canGoOffline
{
  return 1;
}

- (BOOL)supportsPurge
{
  return 0;
}

- (void)_synchronouslyLoadListingForParent:(id)a3
{
  id v7 = (id)objc_msgSend((id)objc_msgSend(a3, "fullPath"), "mutableCopyWithZone:", 0);
  if (v7)
  {
    if ([a3 isStore])
    {
      unint64_t v5 = objc_msgSend(v7, "rangeOfString:options:", -[LocalAccount mailboxPathExtension](self, "mailboxPathExtension"), 12);
      if (v5 >= 2 && v5 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v7, "deleteCharactersInRange:", v5 - 1, v6 + 1);
      }
    }
    [(MailAccount *)self _loadEntriesFromFileSystemPath:v7 parent:a3];
  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  v9 = (void *)[a5 childWithName:a4];
  if ((objc_msgSend(a4, "mf_isSubdirectoryOfPath:", objc_msgSend(a3, "name")) & 1) == 0)
  {
    if (!v9
      || (int v10 = [v9 isStore], v10 != objc_msgSend(a3, "isStore"))
      && (int v11 = [v9 isContainer], v11 != objc_msgSend(a3, "isContainer")))
    {
      v14.receiver = self;
      v14.super_class = (Class)LocalAccount;
      return [(MailAccount *)&v14 renameMailbox:a3 newName:a4 parent:a5];
    }
    id v13 = +[MFActivityMonitor currentMonitor];
    [v13 setError:+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", @"MFMessageErrorDomain", 1030, objc_msgSend(NSString, "stringWithFormat:", MFLookupLocalizedString(@"MAILBOX_EXISTS_FORMAT", @"The mailbox “%@” already exists.", @"Delayed", objc_msgSend(v9, "tildeAbbreviatedPath")))];
  }
  return 0;
}

- (id)mailboxUidForFileSystemPath:(id)a3
{
  unint64_t v5 = (void *)[a3 pathExtension];
  uint64_t v6 = objc_msgSend(a3, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");
  if (![v5 isEqualToString:@"mbox"]) {
    return 0;
  }
  char v13 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", v6, &v13)|| v13 == 0)
  {
    return 0;
  }
  uint64_t v10 = [(id)mailboxUidForFileSystemPath___rootlessMailboxRoot childWithName:v6];
  objc_super v8 = (void *)v10;
  if (!v10)
  {
    objc_super v8 = (void *)[objc_allocWithZone((Class)_MFRootlessMailboxUid) initWithName:v6 attributes:1 forAccount:0 extraAttributes:0];
    [v8 setType:4294967196];
    int v11 = (MFMailboxUid *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
    if (!mailboxUidForFileSystemPath___rootlessMailboxRoot)
    {
      int v11 = [[MFMailboxUid alloc] initWithAccount:self];
      mailboxUidForFileSystemPath___rootlessMailboxRoot = (uint64_t)v11;
    }
    id v12 = [(MFMailboxUid *)v11 mutableCopyOfChildren];
    [v12 addObject:v8];
    [(id)mailboxUidForFileSystemPath___rootlessMailboxRoot setChildren:v12];
  }
  return v8;
}

- (id)transientDraftsFolder
{
  return [(LocalAccount *)self transientDraftsFolderShouldCreate:1];
}

- (id)_infoForMatchingURL:(id)a3
{
  unint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "resourceSpecifier"), "stringByRemovingPercentEncoding");
  [v5 setObject:self forKey:@"Account"];
  uint64_t v7 = [v6 rangeOfString:@"/" options:8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = objc_msgSend(v6, "substringWithRange:", v7 + v8, objc_msgSend(v6, "length") - (v7 + v8));
  }
  if (v6 && ([v6 isEqualToString:&stru_1F265CF90] & 1) == 0) {
    [v5 setObject:v6 forKey:@"RelativePath"];
  }
  return v5;
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return [a3 type] == 6;
}

- (BOOL)supportsAppend
{
  return 1;
}

- (BOOL)supportsArchiving
{
  return 0;
}

@end