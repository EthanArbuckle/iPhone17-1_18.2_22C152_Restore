@interface MFMailboxUid
+ (BOOL)isDraftsMailboxType:(int64_t)a3;
+ (BOOL)isOutgoingMailboxType:(int64_t)a3;
+ (BOOL)isSentMailboxType:(int64_t)a3;
+ (BOOL)isStandardizedMailboxUidType:(int64_t)a3;
+ (BOOL)typeIsValidTransferDestination:(int64_t)a3;
+ (id)defaultScheduler;
+ (id)fileURLForMailboxURL:(id)a3;
+ (id)fullPathForAccount:(id)a3 mailbox:(id)a4;
+ (id)log;
+ (id)specialNameForType:(int64_t)a3;
- (BOOL)alwaysWriteFullMessageFile;
- (BOOL)hasChildren;
- (BOOL)isContainer;
- (BOOL)isDescendantOfMailbox:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotesMailboxUid;
- (BOOL)isOutgoingMailboxUid;
- (BOOL)isRootMailbox;
- (BOOL)isSendLaterMailbox;
- (BOOL)isSentMailboxUid;
- (BOOL)isShared;
- (BOOL)isSpecialMailboxUid;
- (BOOL)isStandardizedMailboxUid;
- (BOOL)isStore;
- (BOOL)isValid;
- (BOOL)isVisible;
- (BOOL)setChildren:(id)a3;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)shouldUseNonDeletedForUnreadCount;
- (BOOL)userInfoBoolForKey:(id)a3;
- (EDMailboxPersistence)mailboxPersistence;
- (EMMailboxObjectID)objectID;
- (MFInvocationQueue)attachmentDownloadQueue;
- (MFMailboxUid)init;
- (MFMailboxUid)initWithAccount:(id)a3;
- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6;
- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6 type:(int64_t)a7;
- (MFMailboxUid)parent;
- (MFMailboxUserInfo)userInfo;
- (MailAccount)account;
- (NSArray)extraAttributes;
- (NSEnumerator)childEnumerator;
- (NSEnumerator)depthFirstEnumerator;
- (NSString)URLString;
- (NSString)accountRelativePath;
- (NSString)debugDescription;
- (NSString)decodedName;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSString)name;
- (NSString)persistentID;
- (NSURL)URL;
- (double)suggestionsLostMessageSearchTimestamp;
- (id)URLStringNonNil;
- (id)URLWithAccount:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5;
- (id)_mutableChildren;
- (id)_privacySafeDescription;
- (id)accountDisplayName;
- (id)ancestralAccount;
- (id)childAtIndex:(unint64_t)a3;
- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3;
- (id)childWithExtraAttribute:(id)a3;
- (id)childWithName:(id)a3;
- (id)criterion;
- (id)descendantWithExtraAttribute:(id)a3;
- (id)displayNameUsingSpecialNames;
- (id)fullPath;
- (id)fullPathNonNil;
- (id)mutableCopyOfChildren;
- (id)oldURLString;
- (id)pathComponent;
- (id)pathRelativeToMailbox:(id)a3;
- (id)pathRelativeToMailboxForDisplay:(id)a3;
- (id)realFullPath;
- (id)redactedName:(id)a3;
- (id)representedAccount;
- (id)rootMailbox;
- (id)store;
- (id)topMailbox;
- (id)uniqueId;
- (id)userInfoFileURL;
- (id)userInfoObjectForKey:(id)a3;
- (int64_t)compareWithMailboxUid:(id)a3;
- (int64_t)databaseID;
- (int64_t)mailboxType;
- (int64_t)type;
- (unint64_t)attributes;
- (unint64_t)indexOfChild:(id)a3;
- (unint64_t)numberOfChildren;
- (unint64_t)numberOfDescendants;
- (unint64_t)serverUnreadOnlyOnServerCount;
- (unint64_t)suggestionsLostMessageSearchResultCount;
- (unint64_t)unreadCount;
- (void)addToPostOrderTraversal:(id)a3;
- (void)dealloc;
- (void)flushCriteria;
- (void)invalidate;
- (void)removeChild:(id)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setMailboxType:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
- (void)setRepresentedAccount:(id)a3;
- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)sortChildren;
- (void)updateMostRecentStatusCount:(unint64_t)a3;
- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3;
@end

@implementation MFMailboxUid

- (id)URLStringNonNil
{
  id v2 = [(MFMailboxUid *)self URLString];
  if (!v2) {
    id v2 = (id)*MEMORY[0x1E4F1D260];
  }
  return v2;
}

- (NSString)URLString
{
  id v2 = [(MFMailboxUid *)self criterion];
  if ([v2 criterionType] == 23)
  {
    v3 = [v2 expression];
    v4 = (void *)[v3 copy];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)criterion
{
  [(MFMailboxUid *)self mf_lock];
  p_criterion = &self->_criterion;
  criterion = self->_criterion;
  if (criterion) {
    v5 = criterion;
  }
  [(MFMailboxUid *)self mf_unlock];
  if (!criterion)
  {
    v6 = [(MFMailboxUid *)self ancestralAccount];
    v7 = [(MFMailboxUid *)self URLWithAccount:v6];
    v8 = [v7 absoluteString];

    [(MFMailboxUid *)self mf_lock];
    if (*p_criterion || !v8)
    {
      criterion = *p_criterion;
    }
    else
    {
      v9 = +[MFMessageCriterion criterionForMailboxURL:v8];
      objc_storeStrong((id *)&self->_criterion, v9);
      criterion = v9;
    }
    [(MFMailboxUid *)self mf_unlock];
  }
  return criterion;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t mailboxID = self->_mailboxID;
    uint64_t v6 = v4[2];
    if (mailboxID == *MEMORY[0x1E4F5FCC8] || v6 == *MEMORY[0x1E4F5FCC8])
    {
      v8 = [(MFMailboxUid *)self URL];
      v9 = [v4 URL];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = mailboxID == v6;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSURL)URL
{
  v3 = [(MFMailboxUid *)self account];
  v4 = [(MFMailboxUid *)self URLWithAccount:v3];

  return (NSURL *)v4;
}

- (id)URLWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = [(MFMailboxUid *)self accountRelativePath];
  v7 = objc_msgSend(v5, "initWithObjectsAndKeys:", v4, @"Account", v6, @"RelativePath", 0);

  v8 = +[MailAccount URLForInfo:v7];

  return v8;
}

- (int64_t)type
{
  uint64_t v2 = [(MFMailboxUid *)self mailboxType];
  return ECMailboxTypeFromMailboxUidType(v2);
}

- (NSString)accountRelativePath
{
  v3 = [(MFMailboxUid *)self account];
  id v4 = [v3 _mailboxPathPrefix];
  [(MFMailboxUid *)self mf_lock];
  id v5 = _stringByAppendingPathComponents(self, v3, 0, &stru_1EFF11268, v4, 0);
  [(MFMailboxUid *)self mf_unlock];

  return (NSString *)v5;
}

- (id)topMailbox
{
  for (i = self; ; i = v4)
  {
    v3 = [(MFMailboxUid *)i parent];

    if (!v3) {
      break;
    }
    id v4 = v3;
  }
  return i;
}

- (MFMailboxUid)parent
{
  return (MFMailboxUid *)[(MFWeakReferenceHolder *)self->_parent reference];
}

- (MailAccount)account
{
  uint64_t v2 = [(MFMailboxUid *)self rootMailbox];
  v3 = (void *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }

  return (MailAccount *)WeakRetained;
}

- (id)rootMailbox
{
  uint64_t v2 = [(MFMailboxUid *)self topMailbox];
  if ((v2[144] & 0x10) == 0)
  {

    uint64_t v2 = 0;
  }
  return v2;
}

- (int64_t)mailboxType
{
  return (int)atomic_load((unsigned int *)&self->_type);
}

- (NSString)name
{
  if ((self->_attributes & 0x10) != 0)
  {
    v3 = [(MFMailboxUid *)self account];
    uint64_t v4 = [v3 displayName];
    goto LABEL_5;
  }
  v3 = (void *)[(MFWeakReferenceHolder *)self->_parent retainedReference];
  if (v3)
  {
    uint64_t v4 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_6;
  }
  v7 = NSString;
  v8 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
  id v5 = [v7 stringWithFormat:@"*** Orphaned mailbox %@", v8];

  parent = self->_parent;
  self->_parent = 0;

LABEL_6:
  return (NSString *)v5;
}

- (id)pathComponent
{
  v1 = (id *)a1;
  if (a1)
  {
    uint64_t v2 = a1 + 35;
    os_unfair_lock_lock(a1 + 35);
    v1 = (id *)[v1[4] copy];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)representedAccount
{
  [(MFMailboxUid *)self mf_lock];
  representedAccount = self->_representedAccount;
  if (representedAccount)
  {
    uint64_t v4 = representedAccount;
  }
  else
  {
    uint64_t v4 = [(MFMailboxUid *)self account];
  }
  id v5 = v4;
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (id)_mutableChildren
{
  [(MFMailboxUid *)self mf_lock];
  v3 = (void *)[(NSMutableArray *)self->_children mutableCopy];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (EMMailboxObjectID)objectID
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  p_objectID = &self->_objectID;
  objectID = self->_objectID;
  if (objectID)
  {
    uint64_t v6 = objectID;
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
    v7 = [(MFMailboxUid *)self URLString];
    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
      uint64_t v6 = (EMMailboxObjectID *)[objc_alloc(MEMORY[0x1E4F60310]) initWithURL:v8];
      os_unfair_lock_lock(p_ivarLock);
      objc_storeStrong((id *)p_objectID, v6);
      os_unfair_lock_unlock(p_ivarLock);
    }
    else
    {
      v9 = +[MFMailboxUid log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        char v10 = [(MFMailboxUid *)self account];
        v11 = objc_msgSend(v10, "ef_publicDescription");
        v12 = [(MFMailboxUid *)self ef_publicDescription];
        int v14 = 138412546;
        v15 = v11;
        __int16 v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "No URL for mailbox. Account: %@ Mailbox: %@", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)displayNameUsingSpecialNames
{
  int64_t v3 = [(MFMailboxUid *)self mailboxType];
  uint64_t v4 = [(MFMailboxUid *)self account];
  id v5 = [v4 displayNameUsingSpecialNamesForMailboxUid:self];

  if (!v5)
  {
    id v5 = [(id)objc_opt_class() specialNameForType:v3];
    if (!v5)
    {
      id v5 = [(MFMailboxUid *)self displayName];
    }
  }
  return v5;
}

- (NSString)displayName
{
  [(MFMailboxUid *)self mf_lock];
  int64_t v3 = [(MailAccount *)self->_representedAccount displayName];
  [(MFMailboxUid *)self mf_unlock];
  if (v3 && ([v3 isEqualToString:&stru_1EFF11268] & 1) == 0)
  {
    id v7 = v3;
  }
  else
  {
    uint64_t v4 = [(MFMailboxUid *)self account];
    id v5 = v4;
    if ((self->_attributes & 0x10) != 0)
    {
      id v7 = [v4 displayName];
    }
    else
    {
      if (v4)
      {
        uint64_t v6 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
        [v5 _pathComponentForUidName:v6];
      }
      else
      {
        v8 = NSString;
        uint64_t v6 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
        [v8 stringWithFormat:@"*** Orphaned mailbox %@", v6];
      }
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v7;
}

+ (id)specialNameForType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v4 = @"JUNK_SPECIAL_MAILBOX_NAME";
      id v5 = @"Junk";
      goto LABEL_12;
    case 2:
      uint64_t v4 = @"ARCHIVE_SPECIAL_MAILBOX_NAME";
      id v5 = @"Archive";
      goto LABEL_12;
    case 3:
      uint64_t v4 = @"TRASH_SPECIAL_MAILBOX_NAME";
      id v5 = @"Trash";
      goto LABEL_12;
    case 4:
      uint64_t v4 = @"SENT_MESSAGES_SPECIAL_MAILBOX_NAME";
      id v5 = @"Sent";
      goto LABEL_12;
    case 5:
      uint64_t v4 = @"DRAFTS_SPECIAL_MAILBOX_NAME";
      id v5 = @"Drafts";
      goto LABEL_12;
    case 6:
      uint64_t v4 = @"OUTBOX_SPECIAL_MAILBOX_NAME";
      id v5 = @"Outbox";
      goto LABEL_12;
    case 7:
      uint64_t v4 = @"INBOX_SPECIAL_MAILBOX_NAME";
      id v5 = @"Inbox";
LABEL_12:
      uint64_t v6 = MFLookupLocalizedString(v4, v5, @"Message");
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

- (BOOL)isSendLaterMailbox
{
  unint64_t v2 = atomic_load(&self->_isSendLater);
  if (!v2)
  {
    id v5 = +[LocalAccount localAccount];
    uint64_t v6 = [(MFMailboxUid *)self account];

    if (v6 == v5)
    {
      id v7 = [v5 sendLaterFolderShouldCreate:0];
      v8 = [v7 URL];
      v9 = [(MFMailboxUid *)self URL];
      if ([v8 isEqual:v9]) {
        unint64_t v2 = 2;
      }
      else {
        unint64_t v2 = 1;
      }
    }
    else
    {
      unint64_t v2 = 1;
    }
    atomic_store(v2, &self->_isSendLater);
  }
  return v2 == 2;
}

- (NSArray)extraAttributes
{
  return self->_extraAttributes;
}

- (id)uniqueId
{
  return self->uniqueId;
}

- (NSEnumerator)childEnumerator
{
  return (NSEnumerator *)[(MFMailboxUid *)self childEnumeratorIncludingHiddenChildren:1];
}

- (id)fullPathNonNil
{
  id v2 = [(MFMailboxUid *)self fullPath];
  if (!v2) {
    id v2 = (id)*MEMORY[0x1E4F1D260];
  }
  return v2;
}

- (id)fullPath
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MFMailboxUid *)self account];
  id v5 = [v3 fullPathForAccount:v4 mailbox:self];

  return v5;
}

- (id)descendantWithExtraAttribute:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = _MFDescendantWithPredicate(self, (uint64_t (*)(void *, uint64_t))mailboxHasExtraAttribute, (uint64_t)v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSEnumerator)depthFirstEnumerator
{
  [(MFMailboxUid *)self mf_lock];
  uint64_t v3 = (void *)[objc_allocWithZone((Class)_MFMailboxUidEnumerator) initWithMailbox:self];
  [(MFMailboxUid *)self mf_unlock];
  return (NSEnumerator *)v3;
}

- (void)addToPostOrderTraversal:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MFMailboxUid *)self mf_lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "addToPostOrderTraversal:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(MFMailboxUid *)self mf_unlock];
  [v4 addObject:self];
}

- (void)setMailboxType:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(MFMailboxUid *)self mailboxType];
  if (!a3 && v5 == 7)
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      [(MFMailboxUid *)v7 setMailboxType:v6];
    }
  }
  atomic_store(a3, (unsigned int *)&self->_type);
}

- (BOOL)setChildren:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  [(MFMailboxUid *)self mf_lock];
  if ([(MFMailboxUid *)self isValid]) {
    id v4 = [(MFMailboxUid *)self mutableCopyOfChildren];
  }
  else {
    id v4 = 0;
  }
  [(NSMutableArray *)self->_children removeAllObjects];
  if ([v23 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v23;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          bindParentAndChild(self, *(void **)(*((void *)&v28 + 1) + 8 * i));
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v6);
    }

    if (!v4 || ([v4 isEqualToArray:v5] & 1) == 0)
    {
      BOOL v9 = 1;
LABEL_17:
      BOOL v22 = v9;
      goto LABEL_19;
    }
  }
  else if (v4)
  {
    BOOL v9 = [v4 count] != 0;
    goto LABEL_17;
  }
  BOOL v22 = 0;
LABEL_19:
  [(MFMailboxUid *)self mf_unlock];
  if ([v4 count])
  {
    long long v10 = [v4 arrayByApplyingSelector:sel_URLStringNonNil];
    v24 = [v4 arrayByApplyingSelector:sel_fullPathNonNil];
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [v4 count];
    v27 = [(MFMailboxUid *)self account];
    if (v11)
    {
      uint64_t v12 = 0;
      v13 = (void *)*MEMORY[0x1E4F1D260];
      do
      {
        uint64_t v14 = [v4 objectAtIndex:v12];
        v15 = [v10 objectAtIndex:v12];
        if (v15 != v13)
        {
          __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"URLString"];
          v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v17 postNotificationName:@"MailboxUidDidBecomeInvalidNotification" object:v14 userInfo:v16];

          if ([v14 isStore])
          {
            uint64_t v18 = [v27 mailboxUidForURL:v15];
            v19 = v18;
            if (!v18 || ([v18 isValid] & 1) == 0)
            {
              [v26 addObject:v15];
              v20 = [v24 objectAtIndex:v12];
              [v25 addObject:v20];
            }
          }
        }
        ++v12;
      }
      while (v11 != v12);
    }
    if ([v26 count]) {
      [v27 _mailboxesWereRemovedFromTree:v26 withFileSystemPaths:v25];
    }
  }
  return v22;
}

- (BOOL)isStore
{
  return (self->_attributes & 2) == 0;
}

- (BOOL)isValid
{
  id v2 = [(MFMailboxUid *)self rootMailbox];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)fullPathForAccount:(id)a3 mailbox:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 path];
  uint64_t v8 = [v5 mailboxPathExtension];
  BOOL v9 = [v5 _mailboxPathPrefix];
  objc_msgSend(v6, "mf_lock");
  long long v10 = _stringByAppendingPathComponents(v6, v5, 0, v7, v9, v8);
  objc_msgSend(v6, "mf_unlock");

  return v10;
}

- (id)childWithName:(id)a3
{
  BOOL v3 = _MFChildWithPredicate(self, (unsigned int (*)(void *, uint64_t))mailboxHasName, (uint64_t)a3);
  return v3;
}

- (id)mutableCopyOfChildren
{
  [(MFMailboxUid *)self mf_lock];
  BOOL v3 = (void *)[(NSMutableArray *)self->_children mutableCopy];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (id)childWithExtraAttribute:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = _MFChildWithPredicate(self, (unsigned int (*)(void *, uint64_t))mailboxHasExtraAttribute, (uint64_t)v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isContainer
{
  return (self->_attributes & 1) == 0;
}

- (BOOL)hasChildren
{
  [(MFMailboxUid *)self mf_lock];
  if ((self->_attributes & 0x10) != 0) {
    unint64_t v3 = self->_attributes & 0x10;
  }
  else {
    unint64_t v3 = [(NSMutableArray *)self->_children count];
  }
  BOOL v4 = v3 != 0;
  [(MFMailboxUid *)self mf_unlock];
  return v4;
}

- (id)ancestralAccount
{
  id v2 = self;
  do
  {
    if (([(MFMailboxUid *)v2 attributes] & 0x10) != 0) {
      break;
    }
    uint64_t v3 = [(MFMailboxUid *)v2 parent];

    id v2 = (MFMailboxUid *)v3;
  }
  while (v3);
  BOOL v4 = [(MFMailboxUid *)v2 account];

  return v4;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6 type:(int64_t)a7
{
  unsigned int v7 = a7;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = [(MFMailboxUid *)self _initWithName:v12 attributes:a4 forAccount:v13];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    extraAttributes = v15->_extraAttributes;
    v15->_extraAttributes = (NSArray *)v16;

    atomic_store(v7, (unsigned int *)&v15->_type);
    uint64_t v18 = v15;
  }

  return v15;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5 extraAttributes:(id)a6
{
  return [(MFMailboxUid *)self initWithName:a3 attributes:a4 forAccount:a5 extraAttributes:a6 type:0];
}

- (id)_initWithName:(id)a3 attributes:(unint64_t)a4 forAccount:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    long long v10 = [(MFMailboxUid *)self init];
    if (v10)
    {
      uint64_t v11 = [v8 copy];
      pathComponent = v10->_pathComponent;
      v10->_pathComponent = (NSString *)v11;

LABEL_5:
      v10->_attributes = a4;
    }
  }
  else
  {
    long long v10 = [(MFMailboxUid *)self initWithAccount:v9];
    if (v10) {
      goto LABEL_5;
    }
  }

  return v10;
}

- (MFMailboxUid)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxUid;
  id v2 = [(MFMailboxUid *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    uniqueId = v2->uniqueId;
    v2->uniqueId = (NSString *)v4;

    v2->_int64_t mailboxID = *MEMORY[0x1E4F5FCC8];
    atomic_store(0, (unsigned int *)&v2->_type);
    atomic_store(0, &v2->_isSendLater);
    v2->_ivarLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (MFMailboxUid)initWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailboxUid *)self init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_account, v4);
    v6->_attributes = 18;
  }

  return v6;
}

- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3
{
  id v3 = [[_MFMailboxUidChildrenEnumerator alloc] _initWithMailbox:self includeHiddenChildren:a3];
  return v3;
}

- (NSString)persistentID
{
  [(MFMailboxUid *)self databaseID];
  return (NSString *)EFStringWithInt64();
}

- (int64_t)databaseID
{
  int64_t result = self->_mailboxID;
  if (result == *MEMORY[0x1E4F5FCC8])
  {
    id v4 = [(MFMailboxUid *)self URLString];
    if ([v4 length])
    {
      id v5 = [(MFMailboxUid *)self account];
      id v6 = [v5 library];
      self->_int64_t mailboxID = [v6 mailboxIDForURLString:v4];
    }
    return self->_mailboxID;
  }
  return result;
}

- (NSString)ef_publicDescription
{
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  int v4 = [v3 isInternal];

  id v5 = [(MFMailboxUid *)self _privacySafeDescription];
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F60E00];
    objc_super v7 = [(MFMailboxUid *)self accountRelativePath];
    id v8 = [v6 partiallyRedactedStringForString:v7];
    uint64_t v9 = [v5 stringByAppendingFormat:@" relativePath=%@", v8];

    id v5 = (void *)v9;
  }
  return (NSString *)v5;
}

- (id)_privacySafeDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t mailboxID = self->_mailboxID;
  id v6 = NSStringFromMailboxUidType([(MFMailboxUid *)self mailboxType]);
  objc_super v7 = [v3 stringWithFormat:@"<%@ %p> ID=%lld type=%@ attributes=%lu", v4, self, mailboxID, v6, -[MFMailboxUid attributes](self, "attributes")];

  return v7;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__MFMailboxUid_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  id v2 = (void *)log_log_5;
  return v2;
}

void __19__MFMailboxUid_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

+ (id)defaultScheduler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MFMailboxUid_defaultScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultScheduler_onceToken != -1) {
    dispatch_once(&defaultScheduler_onceToken, block);
  }
  id v2 = (void *)defaultScheduler_scheduler;
  return v2;
}

void __32__MFMailboxUid_defaultScheduler__block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)MEMORY[0x1E4F60F28];
  NSStringFromClass(*(Class *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(v1, "serialDispatchQueueSchedulerWithName:qualityOfService:");
  id v3 = (void *)defaultScheduler_scheduler;
  defaultScheduler_scheduler = v2;
}

+ (id)fileURLForMailboxURL:(id)a3
{
  id v3 = a3;
  id v4 = +[MailAccount accountWithURL:v3];
  id v5 = [v4 path];
  id v6 = [v3 path];
  objc_super v7 = [v5 stringByAppendingPathComponent:v6];
  id v8 = [v4 mailboxPathExtension];
  uint64_t v9 = [v7 stringByAppendingPathExtension:v8];

  if (v9)
  {
    long long v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MFMailboxUid *)self attributes];
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [(MFMailboxUid *)self name];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3];
  objc_super v7 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"MailboxName", v6, @"MailboxAttributes", 0);

  if ((v3 & 1) == 0)
  {
    id v8 = [(MFMailboxUid *)self children];
    uint64_t v9 = [v8 count];
    if (v9)
    {
      long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
            [v10 addObject:v15];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      [v7 setObject:v10 forKeyedSubscript:@"MailboxChildren"];
    }
  }
  uint64_t v16 = [(MFMailboxUid *)self extraAttributes];
  if (v16) {
    [v7 setObject:v16 forKeyedSubscript:@"MailboxExtraAttributes"];
  }

  return v7;
}

- (NSString)decodedName
{
  unint64_t v3 = [(MFMailboxUid *)self account];
  id v4 = v3;
  if ((self->_attributes & 0x10) != 0)
  {
    id v6 = [v3 displayName];
  }
  else
  {
    if (v3)
    {
      id v5 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
      [v4 _pathComponentForUidName:v5];
    }
    else
    {
      objc_super v7 = NSString;
      id v5 = -[MFMailboxUid pathComponent]((os_unfair_lock_s *)self);
      [v7 stringWithFormat:@"*** Orphaned mailbox %@", v5];
    id v6 = };
  }
  return (NSString *)v6;
}

- (BOOL)isRootMailbox
{
  return (LOBYTE(self->_attributes) >> 4) & 1;
}

- (void)setName:(id)a3
{
  id v9 = a3;
  [(MFMailboxUid *)self mf_lock];
  os_unfair_lock_lock(&self->_ivarLock);
  if ([v9 isEqual:self->_pathComponent])
  {
    os_unfair_lock_unlock(&self->_ivarLock);
  }
  else
  {
    id v4 = (NSString *)[v9 copy];
    pathComponent = self->_pathComponent;
    self->_pathComponent = v4;

    realFullPath = self->_realFullPath;
    self->_realFullPath = 0;

    os_unfair_lock_unlock(&self->_ivarLock);
    objc_super v7 = [(MFMailboxUid *)self URLString];

    if (v7)
    {
      criterion = self->_criterion;
      self->_criterion = 0;
    }
  }
  [(MFMailboxUid *)self mf_unlock];
}

- (id)accountDisplayName
{
  uint64_t v2 = [(MFMailboxUid *)self representedAccount];
  unint64_t v3 = [v2 displayName];

  return v3;
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  unint64_t v3 = [(MFMailboxUid *)self account];
  id v4 = [v3 library];
  id v5 = [(MFMailboxUid *)self URLString];
  unint64_t v6 = [v4 serverUnreadOnlyOnServerCountForMailbox:v5];

  return v6;
}

- (unint64_t)unreadCount
{
  unint64_t v3 = [(MFMailboxUid *)self account];
  id v4 = [v3 library];
  id v5 = [(MFMailboxUid *)self URLString];
  unint64_t v6 = [v4 unreadCountForMailbox:v5];

  return v6;
}

- (void)updateMostRecentStatusCount:(unint64_t)a3
{
  id v5 = [(id)objc_opt_class() defaultScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MFMailboxUid_updateMostRecentStatusCount___block_invoke;
  v6[3] = &unk_1E5D3C388;
  v6[4] = self;
  v6[5] = a3;
  [v5 performBlock:v6];
}

void __44__MFMailboxUid_updateMostRecentStatusCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) account];
  id v4 = [v2 library];

  unint64_t v3 = [*(id *)(a1 + 32) URLString];
  if ([v4 mostRecentStatusCountForMailbox:v3] != *(void *)(a1 + 40)) {
    objc_msgSend(v4, "setMostRecentStatusCount:forMailbox:");
  }
}

- (BOOL)shouldUseNonDeletedForUnreadCount
{
  int64_t v2 = [(MFMailboxUid *)self mailboxType];
  return (unint64_t)(v2 - 5) < 2 || (unint64_t)(v2 - 105) < 2;
}

- (unint64_t)numberOfChildren
{
  [(MFMailboxUid *)self mf_lock];
  unint64_t v3 = [(NSMutableArray *)self->_children count];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (unint64_t)numberOfDescendants
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MFMailboxUid *)self mf_lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v3 = self->_children;
  unint64_t v4 = 0;
  uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "numberOfDescendants", (void)v9) + 1;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(MFMailboxUid *)self mf_unlock];
  return v4;
}

- (id)childAtIndex:(unint64_t)a3
{
  [(MFMailboxUid *)self mf_lock];
  uint64_t v5 = [(NSMutableArray *)self->_children objectAtIndex:a3];
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (unint64_t)indexOfChild:(id)a3
{
  id v4 = a3;
  [(MFMailboxUid *)self mf_lock];
  unint64_t v5 = [(NSMutableArray *)self->_children indexOfObject:v4];
  [(MFMailboxUid *)self mf_unlock];

  return v5;
}

- (void)sortChildren
{
  [(MFMailboxUid *)self mf_lock];
  [(NSMutableArray *)self->_children sortUsingFunction:MFCompareMailboxUids context:[(MFMailboxUid *)self account]];
  [(MFMailboxUid *)self mf_unlock];
}

- (void)removeChild:(id)a3
{
  id v4 = a3;
  [(MFMailboxUid *)self mf_lock];
  [(NSMutableArray *)self->_children removeObject:v4];
  [(MFMailboxUid *)self mf_unlock];
}

- (void)setParent:(id)a3
{
  id v7 = a3;
  id v4 = [(MFMailboxUid *)self parent];

  if (v4 != v7)
  {
    bindParentAndChild(v7, self);
    [(MFMailboxUid *)self mf_lock];
    unint64_t v5 = [(MFMailboxUid *)self URLString];

    if (v5)
    {
      criterion = self->_criterion;
      self->_criterion = 0;
    }
    [(MFMailboxUid *)self mf_unlock];
  }
}

- (void)flushCriteria
{
  [(MFMailboxUid *)self mf_lock];
  criterion = self->_criterion;
  self->_criterion = 0;

  objectID = self->_objectID;
  self->_objectID = 0;

  [(MFMailboxUid *)self mf_unlock];
}

- (void)setRepresentedAccount:(id)a3
{
  unint64_t v5 = (MailAccount *)a3;
  [(MFMailboxUid *)self mf_lock];
  if (self->_representedAccount != v5) {
    objc_storeStrong((id *)&self->_representedAccount, a3);
  }
  [(MFMailboxUid *)self mf_unlock];
}

- (void)invalidate
{
  id v7 = [(MFMailboxUid *)self rootMailbox];
  if (v7 == self)
  {
    objc_storeWeak((id *)&self->_account, 0);
    self->_attributes &= ~0x10uLL;
  }
  unint64_t v3 = [(MFMailboxUid *)self parent];
  [v3 removeChild:self];

  if (v7)
  {
    id v4 = [(MFMailboxUid *)self URLString];
    if (v4)
    {
      unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"URLString"];
    }
    else
    {
      unint64_t v5 = 0;
    }
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MailboxUidDidBecomeInvalidNotification" object:self userInfo:v5];
  }
}

+ (BOOL)isStandardizedMailboxUidType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 7;
}

- (BOOL)isStandardizedMailboxUid
{
  int64_t v2 = [(MFMailboxUid *)self mailboxType];
  return +[MFMailboxUid isStandardizedMailboxUidType:v2];
}

- (BOOL)isSpecialMailboxUid
{
  int64_t v2 = self;
  unint64_t v3 = [(MFMailboxUid *)self account];
  LOBYTE(v2) = [v3 isSpecialMailbox:v2];

  return (char)v2;
}

- (BOOL)isSentMailboxUid
{
  unint64_t v3 = objc_opt_class();
  int64_t v4 = [(MFMailboxUid *)self mailboxType];
  return [v3 isSentMailboxType:v4];
}

+ (BOOL)isOutgoingMailboxType:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 3 || (unint64_t)(a3 - 104) < 3;
}

+ (BOOL)isDraftsMailboxType:(int64_t)a3
{
  return a3 == 5 || a3 == 105;
}

+ (BOOL)isSentMailboxType:(int64_t)a3
{
  return a3 == 4 || a3 == 104;
}

+ (BOOL)typeIsValidTransferDestination:(int64_t)a3
{
  char v4 = [(id)objc_opt_class() isOutgoingMailboxType:a3];
  BOOL v5 = a3 != 8;
  if (a3 == -100) {
    BOOL v5 = 0;
  }
  if (a3 == -500) {
    BOOL v5 = 0;
  }
  return (v4 & 1) == 0 && v5;
}

- (BOOL)isOutgoingMailboxUid
{
  int64_t v2 = [(MFMailboxUid *)self mailboxType];
  unint64_t v3 = objc_opt_class();
  return [v3 isOutgoingMailboxType:v2];
}

- (BOOL)isNotesMailboxUid
{
  unint64_t v3 = [(MFMailboxUid *)self name];
  if ([v3 isEqualToString:@"Notes"])
  {
    char v4 = [(MFMailboxUid *)self parent];
    BOOL v5 = [(MFMailboxUid *)self account];
    uint64_t v6 = [v5 rootMailbox];
    BOOL v7 = v4 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  EFAtomicSetOnceObjectRelease();
  v3.receiver = self;
  v3.super_class = (Class)MFMailboxUid;
  [(MFMailboxUid *)&v3 dealloc];
}

- (MFMailboxUserInfo)userInfo
{
  if (([(MFMailboxUid *)self attributes] & 0x10) != 0)
  {
    int64_t v2 = 0;
  }
  else
  {
    int64_t v2 = EFAtomicSetOnceObjectLoad();
  }
  return (MFMailboxUserInfo *)v2;
}

MFMailboxUserInfo *__24__MFMailboxUid_userInfo__block_invoke(uint64_t a1)
{
  int64_t v2 = [MFMailboxUserInfo alloc];
  objc_super v3 = [*(id *)(a1 + 32) userInfoFileURL];
  char v4 = [(MFMailboxUserInfo *)v2 initWithFileURL:v3];

  return v4;
}

- (id)userInfoFileURL
{
  int64_t v2 = [(MFMailboxUid *)self fullPath];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
    char v4 = [v3 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)realFullPath
{
  [(MFMailboxUid *)self mf_lock];
  realFullPath = self->_realFullPath;
  if (!realFullPath)
  {
    char v4 = [(MFMailboxUid *)self fullPath];
    objc_msgSend(v4, "mf_betterStringByResolvingSymlinksInPath");
    BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_realFullPath;
    self->_realFullPath = v5;

    realFullPath = self->_realFullPath;
  }
  BOOL v7 = realFullPath;
  [(MFMailboxUid *)self mf_unlock];
  return v7;
}

- (id)pathRelativeToMailbox:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MFMailboxUid *)self account];
    uint64_t v6 = _stringByAppendingPathComponents(self, v5, v4, &stru_1EFF11268, 0, 0);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pathRelativeToMailboxForDisplay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MFMailboxUid *)self account];
    uint64_t v6 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v5, v4, &stru_1EFF11268, 0, 0, 1);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)oldURLString
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(MFMailboxUid *)self ancestralAccount];
  BOOL v5 = [(MFMailboxUid *)self accountRelativePath];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  BOOL v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"Account", v5, @"RelativePath", v6, @"IncludeDefaultSecurePortNumber", 0);

  id v8 = +[MailAccount URLForInfo:v7];
  long long v9 = [v8 absoluteString];

  return v9;
}

- (int64_t)compareWithMailboxUid:(id)a3
{
  return MFCompareMailboxUids(self, a3, 0);
}

- (BOOL)isDescendantOfMailbox:(id)a3
{
  id v4 = (MFMailboxUid *)a3;
  BOOL v5 = self;
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      BOOL v7 = [(MFMailboxUid *)v6 parent];

      BOOL v8 = v6 == v4;
      if (v6 == v4) {
        break;
      }
      uint64_t v6 = v7;
    }
    while (v7);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)debugDescription
{
  id v3 = [(MFMailboxUid *)self _privacySafeDescription];
  id v4 = [(MFMailboxUid *)self accountRelativePath];
  BOOL v5 = [v3 stringByAppendingFormat:@" relativePath=%@", v4];

  return (NSString *)v5;
}

- (BOOL)isVisible
{
  return [(MFMailboxUid *)self mailboxType] == 0;
}

- (id)userInfoObjectForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMailboxUid *)self userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int add = atomic_fetch_add(&self->_isChangingUserInfo, 1u);
  BOOL v8 = [(MFMailboxUid *)self userInfo];
  [v8 setObject:v9 forKeyedSubscript:v6];

  if (!add) {
    [(MFMailboxUid *)self didChangeUserInfo];
  }
  atomic_fetch_add(&self->_isChangingUserInfo, 0xFFFFFFFF);
}

- (BOOL)userInfoBoolForKey:(id)a3
{
  id v3 = [(MFMailboxUid *)self userInfoObjectForKey:a3];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
  [(MFMailboxUid *)self setUserInfoObject:v6 forKey:v7];
}

- (id)store
{
  id v3 = [(MFMailboxUid *)self account];
  BOOL v4 = [v3 storeForMailboxUid:self];

  if (!v4)
  {
    BOOL v4 = +[MFLibraryStore storeWithMailbox:self];
  }
  return v4;
}

- (BOOL)isShared
{
  return LOBYTE(self->_attributes) >> 7;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  int64_t v2 = [(MFMailboxUid *)self account];
  char v3 = [v2 shouldRestoreMessagesAfterFailedDelete];

  return v3;
}

- (BOOL)alwaysWriteFullMessageFile
{
  return [(MFMailboxUid *)self isSendLaterMailbox]
      || [(MFMailboxUid *)self mailboxType] == 6;
}

- (unint64_t)suggestionsLostMessageSearchResultCount
{
  int64_t v2 = [(MFMailboxUid *)self userInfoObjectForKey:@"suggestionsLostMessageSearchResultCount"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)suggestionsLostMessageSearchTimestamp
{
  int64_t v2 = [(MFMailboxUid *)self userInfoObjectForKey:@"suggestionsLostMessageSearchTimestamp"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");

  double v4 = (void *)MEMORY[0x1E4F28ED0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:");
}

- (id)redactedName:(id)a3
{
  id v4 = a3;
  if ([(MFMailboxUid *)self isStandardizedMailboxUid])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:v4];
  }
  id v6 = v5;

  return v6;
}

- (void)setExtraAttributes:(id)a3
{
}

- (EDMailboxPersistence)mailboxPersistence
{
  return (EDMailboxPersistence *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_pendingLevel, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_realFullPath, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_representedAccount, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_pathComponent, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->uniqueId, 0);
}

- (MFInvocationQueue)attachmentDownloadQueue
{
  objc_getAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue);
  double v3 = (MFInvocationQueue *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    double v3 = objc_alloc_init(MFInvocationQueue);
    objc_setAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue, v3, (void *)0x301);
  }
  return v3;
}

- (void)setMailboxType:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "change in mailbox type [Inbox -> Generic]: %@", buf, 0xCu);
}

@end