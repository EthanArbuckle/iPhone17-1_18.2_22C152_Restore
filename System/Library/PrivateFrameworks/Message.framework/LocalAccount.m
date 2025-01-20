@interface LocalAccount
+ (LocalAccount)localAccount;
+ (id)accountTypeIdentifier;
+ (id)accountTypeString;
+ (id)csAccountTypeString;
+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4;
- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4;
- (BOOL)_shouldConfigureMailboxCache;
- (BOOL)canFetch;
- (BOOL)canGoOffline;
- (BOOL)deleteInPlaceForMailbox:(id)a3;
- (BOOL)isActive;
- (BOOL)isLocalAccount;
- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5;
- (BOOL)supportsAppend;
- (BOOL)supportsArchiving;
- (BOOL)supportsPurge;
- (Class)storeClass;
- (id)_URLScheme;
- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7;
- (id)_infoForMatchingURL:(id)a3;
- (id)displayName;
- (id)identifier;
- (id)legacySQLExpressionToMatchAllMailboxes;
- (id)mailboxPathExtension;
- (id)mailboxUidForFileSystemPath:(id)a3;
- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5;
- (id)primaryMailboxUid;
- (id)pushedMailboxUids;
- (id)sendLaterFolder;
- (id)sendLaterFolderShouldCreate:(BOOL)a3;
- (id)transientDraftsFolder;
- (id)transientDraftsFolderShouldCreate:(BOOL)a3;
- (id)uniqueID;
- (void)_synchronouslyLoadListingForParent:(id)a3;
- (void)resetSpecialMailboxes;
@end

@implementation LocalAccount

- (id)uniqueID
{
  return @"LocalAccountId";
}

- (id)_URLScheme
{
  return (id)*MEMORY[0x1E4F5FC40];
}

- (id)identifier
{
  return @"LocalAccount";
}

- (id)sendLaterFolderShouldCreate:(BOOL)a3
{
  BOOL v3 = a3;
  [(LocalAccount *)self mf_lock];
  v5 = [(MailAccount *)self mailboxUidForRelativePath:@"x-apple-send-later" create:v3];
  [v5 setMailboxType:0];
  if ([v5 isValid])
  {
    v6 = [v5 account];
    [v6 saveState];
  }
  [(LocalAccount *)self mf_unlock];
  return v5;
}

- (id)displayName
{
  return MFLookupLocalizedString(@"PERSONAL_MAILBOXES", @"Local Mailboxes", @"Message");
}

- (id)mailboxPathExtension
{
  return @"mbox";
}

- (BOOL)_shouldConfigureMailboxCache
{
  return 1;
}

- (id)mailboxUidForRelativePath:(id)a3 create:(BOOL)a4 withOption:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [v8 pathComponents];
  unint64_t v10 = [v9 count];

  if (v10 < 2)
  {
    v14.receiver = self;
    v14.super_class = (Class)LocalAccount;
    v12 = [(MailAccount *)&v14 mailboxUidForRelativePath:v8 create:v6 withOption:a5];
  }
  else
  {
    v11 = [v8 lastPathComponent];
    v15.receiver = self;
    v15.super_class = (Class)LocalAccount;
    v12 = [(MailAccount *)&v15 mailboxUidForRelativePath:v11 create:v6 withOption:a5];
  }
  return v12;
}

- (id)_infoForMatchingURL:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v6 = [v4 resourceSpecifier];
  v7 = [v6 stringByRemovingPercentEncoding];

  [v5 setObject:self forKey:@"Account"];
  uint64_t v9 = [v7 rangeOfString:@"/" options:8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = objc_msgSend(v7, "substringWithRange:", v9 + v8, objc_msgSend(v7, "length") - (v9 + v8));

    v7 = (void *)v10;
  }
  if (v7 && ([v7 isEqualToString:&stru_1EFF11268] & 1) == 0) {
    [v5 setObject:v7 forKey:@"RelativePath"];
  }

  return v5;
}

- (BOOL)_setChildren:(id)a3 forMailboxUid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  BOOL v8 = [(MailAccount *)&v10 _setChildren:v6 forMailboxUid:v7];
  if (([v7 isContainer] & 1) == 0 && objc_msgSend(v6, "count")) {
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") & 0xFFFFFFFFFFFFFFFELL);
  }

  return v8;
}

- (BOOL)isLocalAccount
{
  return 1;
}

- (id)transientDraftsFolder
{
  return [(LocalAccount *)self transientDraftsFolderShouldCreate:1];
}

- (BOOL)isActive
{
  return 1;
}

+ (LocalAccount)localAccount
{
  +[MailAccount lockMailAccount];
  BOOL v3 = (void *)localAccount_sLocalAccount;
  if (!localAccount_sLocalAccount)
  {
    id v4 = [a1 defaultAccountDirectory];
    v5 = [v4 stringByAppendingPathComponent:@"LocalAccountId"];

    id v6 = [(MailAccount *)[LocalAccount alloc] initWithPath:v5];
    id v7 = (void *)localAccount_sLocalAccount;
    localAccount_sLocalAccount = (uint64_t)v6;

    if (+[MFMailMessageLibrary canUsePersistence])
    {
      BOOL v8 = (void *)localAccount_sLocalAccount;
      uint64_t v9 = +[MFMailMessageLibrary defaultInstance];
      [v8 setLibrary:v9];
    }
    BOOL v3 = (void *)localAccount_sLocalAccount;
  }
  id v10 = v3;
  +[MailAccount unlockMailAccount];
  return (LocalAccount *)v10;
}

- (id)_copyMailboxUidWithParent:(id)a3 name:(id)a4 attributes:(unint64_t)a5 existingMailboxUid:(id)a6 dictionary:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)LocalAccount;
  id v7 = [(MailAccount *)&v10 _copyMailboxUidWithParent:a3 name:a4 attributes:a5 existingMailboxUid:a6 dictionary:a7];
  BOOL v8 = v7;
  if (v7 && ([v7 isContainer] & 1) == 0) {
    objc_msgSend(v8, "setAttributes:", objc_msgSend(v8, "attributes") & 0xFFFFFFFFFFFFFFFELL);
  }
  return v8;
}

- (Class)storeClass
{
  return (Class)objc_opt_class();
}

- (id)sendLaterFolder
{
  return [(LocalAccount *)self sendLaterFolderShouldCreate:1];
}

- (BOOL)canFetch
{
  return 0;
}

- (id)transientDraftsFolderShouldCreate:(BOOL)a3
{
  BOOL v3 = a3;
  [(LocalAccount *)self mf_lock];
  v5 = [(MailAccount *)self mailboxUidForRelativePath:@"x-apple-transient-drafts" create:v3];
  [v5 setMailboxType:5];
  if ([v5 isValid])
  {
    id v6 = [v5 account];
    [v6 saveState];
  }
  [(LocalAccount *)self mf_unlock];
  return v5;
}

+ (id)accountTypeIdentifier
{
  return 0;
}

+ (id)legacyPathNameForAccountWithHostname:(id)a3 username:(id)a4
{
  return @"Mailboxes";
}

- (id)legacySQLExpressionToMatchAllMailboxes
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"url"];
  BOOL v3 = [v2 beginsWith:@"local:" caseSensitive:0];

  return v3;
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
  return (id)*MEMORY[0x1E4F22760];
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
  id v4 = a3;
  v5 = self;
  id v12 = v4;
  id v6 = [v12 fullPath];
  id v7 = (void *)[v6 mutableCopyWithZone:0];

  if (v7)
  {
    if ([v12 isStore])
    {
      BOOL v8 = [(LocalAccount *)v5 mailboxPathExtension];
      unint64_t v9 = [v7 rangeOfString:v8 options:12];
      uint64_t v11 = v10;

      if (v9 >= 2 && v9 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v7, "deleteCharactersInRange:", v9 - 1, v11 + 1);
      }
    }

    [(MailAccount *)v5 _loadEntriesFromFileSystemPath:v7 parent:v12];
  }
  else
  {
  }
}

- (BOOL)renameMailbox:(id)a3 newName:(id)a4 parent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 childWithName:v9];
  id v12 = [v8 name];
  if (objc_msgSend(v9, "mf_isSubdirectoryOfPath:", v12)) {
    goto LABEL_7;
  }
  if (v11)
  {
    int v13 = [v11 isStore];
    if (v13 == [v8 isStore]
      || (int v14 = [v11 isContainer], v14 == objc_msgSend(v8, "isContainer")))
    {
      v16 = +[MFActivityMonitor currentMonitor];
      v17 = NSString;
      v18 = MFLookupLocalizedString(@"MAILBOX_EXISTS_FORMAT", @"The mailbox “%@” already exists.", @"Delayed");
      v19 = [v11 fullPath];
      v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);
      v21 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 localizedDescription:v20];
      [v16 setError:v21];

LABEL_7:
      BOOL v15 = 0;
      goto LABEL_8;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)LocalAccount;
  BOOL v15 = [(MailAccount *)&v23 renameMailbox:v8 newName:v9 parent:v10];
LABEL_8:

  return v15;
}

- (id)mailboxUidForFileSystemPath:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathExtension];
  unsigned __int8 v14 = -86;
  id v6 = objc_msgSend(v4, "mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath");

  if (![v5 isEqualToString:@"mbox"]) {
    goto LABEL_8;
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v7 fileExistsAtPath:v6 isDirectory:&v14])
  {
    int v8 = v14;

    if (v8)
    {
      id v9 = [(id)mailboxUidForFileSystemPath___rootlessMailboxRoot childWithName:v6];
      if (v9) {
        goto LABEL_11;
      }
      id v9 = (void *)[objc_allocWithZone((Class)_MFRootlessMailboxUid) initWithName:v6 attributes:1 forAccount:0 extraAttributes:0];
      [v9 setMailboxType:-100];
      id v10 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
      if (!mailboxUidForFileSystemPath___rootlessMailboxRoot)
      {
        uint64_t v11 = [[MFMailboxUid alloc] initWithAccount:self];
        id v12 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
        mailboxUidForFileSystemPath___rootlessMailboxRoot = (uint64_t)v11;

        id v10 = (void *)mailboxUidForFileSystemPath___rootlessMailboxRoot;
      }
      id v7 = (void *)[v10 mutableCopyOfChildren];
      [v7 addObject:v9];
      [(id)mailboxUidForFileSystemPath___rootlessMailboxRoot setChildren:v7];
      goto LABEL_10;
    }
LABEL_8:
    id v9 = 0;
    goto LABEL_11;
  }
  id v9 = 0;
LABEL_10:

LABEL_11:
  return v9;
}

- (void)resetSpecialMailboxes
{
  v4.receiver = self;
  v4.super_class = (Class)LocalAccount;
  [(MailAccount *)&v4 resetSpecialMailboxes];
  id v3 = [(LocalAccount *)self transientDraftsFolderShouldCreate:0];
}

- (BOOL)deleteInPlaceForMailbox:(id)a3
{
  return [a3 mailboxType] == 6;
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