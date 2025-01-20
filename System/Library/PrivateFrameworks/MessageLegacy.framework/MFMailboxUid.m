@interface MFMailboxUid
+ (BOOL)isDraftsMailboxType:(int)a3;
+ (BOOL)isOutgoingMailboxType:(int)a3;
+ (BOOL)isSentMailboxType:(int)a3;
+ (BOOL)isStandardizedMailboxUidType:(int)a3;
+ (BOOL)typeIsValidTransferDestination:(int)a3;
+ (id)fileURLForMailboxURL:(id)a3;
+ (id)specialNameForType:(int)a3;
- (BOOL)alwaysWriteFullMessageFile;
- (BOOL)hasChildren;
- (BOOL)isContainer;
- (BOOL)isDescendantOfMailbox:(id)a3;
- (BOOL)isNotesMailboxUid;
- (BOOL)isOutgoingMailboxUid;
- (BOOL)isSentMailboxUid;
- (BOOL)isShared;
- (BOOL)isSpecialMailboxUid;
- (BOOL)isStandardizedMailboxUid;
- (BOOL)isStore;
- (BOOL)isValid;
- (BOOL)isVisible;
- (BOOL)mergeWithUserInfo:(id)a3;
- (BOOL)setChildren:(id)a3;
- (BOOL)shouldRestoreMessagesAfterFailedDelete;
- (BOOL)shouldUseNonDeletedForUnreadCount;
- (BOOL)userInfoBoolForKey:(id)a3;
- (MFInvocationQueue)attachmentDownloadQueue;
- (MFMailboxUid)init;
- (MFMailboxUid)initWithAccount:(id)a3;
- (MFMailboxUid)initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5 extraAttributes:(id)a6;
- (NSArray)extraAttributes;
- (NSString)description;
- (NSString)ef_publicDescription;
- (double)suggestionsLostMessageSearchTimestamp;
- (id)URL;
- (id)URLString;
- (id)URLStringNonNil;
- (id)URLStringWithAccount:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5;
- (id)_loadUserInfo;
- (id)_mutableChildren;
- (id)_privacySafeDescription;
- (id)account;
- (id)accountDisplayName;
- (id)accountRelativePath;
- (id)ancestralAccount;
- (id)childAtIndex:(unint64_t)a3;
- (id)childEnumerator;
- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3;
- (id)childWithExtraAttribute:(id)a3;
- (id)childWithName:(id)a3;
- (id)criterion;
- (id)depthFirstEnumerator;
- (id)descendantWithExtraAttribute:(id)a3;
- (id)displayName;
- (id)displayNameUsingSpecialNames;
- (id)fullPath;
- (id)fullPathNonNil;
- (id)lastViewedMessageDate;
- (id)lastViewedMessageID;
- (id)mutableCopyOfChildren;
- (id)name;
- (id)oldURLString;
- (id)parent;
- (id)pathRelativeToMailbox:(id)a3;
- (id)pathRelativeToMailboxForDisplay:(id)a3;
- (id)realFullPath;
- (id)representedAccount;
- (id)rootMailbox;
- (id)store;
- (id)tildeAbbreviatedPath;
- (id)topMailbox;
- (id)uniqueId;
- (id)userInfoDictionary;
- (id)userInfoForSerialization;
- (id)userInfoObjectForKey:(id)a3;
- (int)type;
- (int64_t)compareWithMailboxUid:(id)a3;
- (int64_t)indexToInsertChildMailboxUid:(id)a3;
- (int64_t)statusCountDelta;
- (unint64_t)indexOfChild:(id)a3;
- (unint64_t)nonDeletedCount;
- (unint64_t)numberOfChildren;
- (unint64_t)numberOfDescendants;
- (unint64_t)serverUnreadOnlyOnServerCount;
- (unint64_t)suggestionsLostMessageSearchResultCount;
- (unint64_t)unreadCount;
- (unint64_t)unreadCountMatchingCriterion:(id)a3;
- (unsigned)attributes;
- (unsigned)mailboxID;
- (void)addToPostOrderTraversal:(id)a3;
- (void)dealloc;
- (void)flushCriteria;
- (void)invalidate;
- (void)removeChild:(id)a3;
- (void)saveUserInfo;
- (void)setAttributes:(unsigned int)a3;
- (void)setCriterion:(id)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setLastViewedMessageID:(id)a3;
- (void)setName:(id)a3;
- (void)setParent:(id)a3;
- (void)setRepresentedAccount:(id)a3;
- (void)setType:(int)a3;
- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
- (void)setUserInfoWithDictionary:(id)a3;
- (void)sortChildren;
- (void)updateMostRecentStatusCount:(unint64_t)a3;
- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3;
@end

@implementation MFMailboxUid

- (NSArray)extraAttributes
{
  return self->_extraAttributes;
}

- (id)URLStringNonNil
{
  id result = [(MFMailboxUid *)self URLString];
  if (!result) {
    return (id)*MEMORY[0x1E4F1D260];
  }
  return result;
}

- (id)URLString
{
  id v2 = [(MFMailboxUid *)self criterion];
  if ([v2 criterionType] == 22) {
    v3 = objc_msgSend((id)objc_msgSend(v2, "expression"), "copy");
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (id)criterion
{
  [(MFMailboxUid *)self mf_lock];
  criterion = self->_criterion;
  if (criterion)
  {
    v4 = criterion;
    [(MFMailboxUid *)self mf_unlock];
    if (v4) {
      return v4;
    }
  }
  else
  {
    [(MFMailboxUid *)self mf_unlock];
  }
  id v5 = [(MFMailboxUid *)self URLStringWithAccount:[(MFMailboxUid *)self ancestralAccount]];
  [(MFMailboxUid *)self mf_lock];
  v6 = self->_criterion;
  if (v6 || !v5)
  {
    v4 = v6;
  }
  else
  {
    v4 = +[MFMessageCriterion criterionForMailboxURL:v5];
    self->_criterion = v4;
  }
  [(MFMailboxUid *)self mf_unlock];
  return v4;
}

- (id)ancestralAccount
{
  do
  {
    if (([(MFMailboxUid *)self attributes] & 0x10) != 0) {
      break;
    }
    self = [(MFMailboxUid *)self parent];
  }
  while (self);
  return [(MFMailboxUid *)self account];
}

- (unsigned)attributes
{
  return self->_attributes;
}

- (id)childWithName:(id)a3
{
  return (id)_MFChildWithPredicate(self, (uint64_t (*)(uint64_t, uint64_t))mailboxHasName, (uint64_t)a3);
}

- (id)childWithExtraAttribute:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    return (id)_MFChildWithPredicate(self, (uint64_t (*)(uint64_t, uint64_t))mailboxHasExtraAttribute, (uint64_t)a3);
  }
  return result;
}

- (id)displayNameUsingSpecialNames
{
  uint64_t v3 = [(MFMailboxUid *)self type];
  id result = (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "displayNameUsingSpecialNamesForMailboxUid:", self);
  if (!result)
  {
    id result = (id)[(id)objc_opt_class() specialNameForType:v3];
    if (!result)
    {
      return [(MFMailboxUid *)self displayName];
    }
  }
  return result;
}

- (id)displayName
{
  [(MFMailboxUid *)self mf_lock];
  id v3 = [(MailAccount *)self->_representedAccount displayName];
  [(MFMailboxUid *)self mf_unlock];
  if (v3 && ![v3 isEqualToString:&stru_1F265CF90]) {
    return v3;
  }
  id v4 = [(MFMailboxUid *)self account];
  if ((self->_attributes & 0x10) != 0)
  {
    return (id)[v4 displayName];
  }
  else if (v4)
  {
    pathComponent = self->_pathComponent;
    return (id)[v4 _pathComponentForUidName:pathComponent];
  }
  else
  {
    return (id)[NSString stringWithFormat:@"*** Orphaned mailbox %@", self->_pathComponent];
  }
}

+ (id)specialNameForType:(int)a3
{
  switch(a3)
  {
    case 1:
      id v3 = @"JUNK_SPECIAL_MAILBOX_NAME";
      id v4 = @"Junk";
      goto LABEL_10;
    case 2:
      id v3 = @"ARCHIVE_SPECIAL_MAILBOX_NAME";
      id v4 = @"Archive";
      goto LABEL_10;
    case 3:
      id v3 = @"TRASH_SPECIAL_MAILBOX_NAME";
      id v4 = @"Trash";
      goto LABEL_10;
    case 4:
      id v3 = @"SENT_MESSAGES_SPECIAL_MAILBOX_NAME";
      id v4 = @"Sent";
      goto LABEL_10;
    case 5:
      id v3 = @"DRAFTS_SPECIAL_MAILBOX_NAME";
      id v4 = @"Drafts";
      goto LABEL_10;
    case 6:
      id v3 = @"OUTBOX_SPECIAL_MAILBOX_NAME";
      id v4 = @"Outbox";
      goto LABEL_10;
    case 7:
      id v3 = @"INBOX_SPECIAL_MAILBOX_NAME";
      id v4 = @"Inbox";
LABEL_10:
      id result = (id)MFLookupLocalizedString((uint64_t)v3, (uint64_t)v4, 0);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)representedAccount
{
  [(MFMailboxUid *)self mf_lock];
  representedAccount = self->_representedAccount;
  if (representedAccount) {
    id v4 = representedAccount;
  }
  else {
    id v4 = [(MFMailboxUid *)self account];
  }
  id v5 = v4;
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (id)accountRelativePath
{
  id v3 = [(MFMailboxUid *)self account];
  id v4 = (void *)[v3 _mailboxPathPrefix];
  [(MFMailboxUid *)self mf_lock];
  id v5 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, &stru_1F265CF90, v4, 0, 0);
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (id)fullPathNonNil
{
  id result = [(MFMailboxUid *)self fullPath];
  if (!result) {
    return (id)*MEMORY[0x1E4F1D260];
  }
  return result;
}

- (id)fullPath
{
  id v3 = [(MFMailboxUid *)self account];
  id v4 = (void *)[v3 path];
  uint64_t v5 = [v3 mailboxPathExtension];
  v6 = (void *)[v3 _mailboxPathPrefix];
  [(MFMailboxUid *)self mf_lock];
  id v7 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, v4, v6, v5, 0);
  [(MFMailboxUid *)self mf_unlock];
  return v7;
}

- (BOOL)setChildren:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(MFMailboxUid *)self mf_lock];
  if ([(MFMailboxUid *)self isValid]) {
    id v5 = [(MFMailboxUid *)self mutableCopyOfChildren];
  }
  else {
    id v5 = 0;
  }
  [(NSMutableArray *)self->_children removeAllObjects];
  if ([a3 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(a3);
          }
          bindParentAndChild(self, *(id **)(*((void *)&v26 + 1) + 8 * i));
        }
        uint64_t v7 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }
    if (!v5 || ([v5 isEqualToArray:a3] & 1) == 0)
    {
      BOOL v10 = 1;
      goto LABEL_18;
    }
  }
  else if (v5)
  {
    BOOL v10 = [v5 count] != 0;
    goto LABEL_18;
  }
  BOOL v10 = 0;
LABEL_18:
  [(MFMailboxUid *)self mf_unlock];
  if ([v5 count])
  {
    BOOL v23 = v10;
    v11 = (void *)[v5 arrayByApplyingSelector:sel_URLStringNonNil];
    v24 = (void *)[v5 arrayByApplyingSelector:sel_fullPathNonNil];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = [v5 count];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *MEMORY[0x1E4F1D260];
      do
      {
        v17 = (void *)[v5 objectAtIndex:v15];
        if (![v17 parent])
        {
          uint64_t v18 = [v11 objectAtIndex:v15];
          if (v18 != v16)
          {
            uint64_t v19 = v18;
            uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v18 forKey:@"URLString"];
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"MailboxUidDidBecomeInvalidNotification", v17, v20);
            if ([v17 isStore])
            {
              id v21 = +[MailAccount mailboxUidFromActiveAccountsForURL:v19];
              if (!v21 || ([v21 isValid] & 1) == 0)
              {
                [v12 addObject:v19];
                objc_msgSend(v25, "addObject:", objc_msgSend(v24, "objectAtIndex:", v15));
              }
            }
          }
        }
        ++v15;
      }
      while (v14 != v15);
    }
    if ([v12 count]) {
      objc_msgSend(-[MFMailboxUid account](self, "account"), "_mailboxesWereRemovedFromTree:withFileSystemPaths:", v12, v25);
    }

    BOOL v10 = v23;
  }

  return v10;
}

- (BOOL)isValid
{
  return [(MFMailboxUid *)self rootMailbox] != 0;
}

- (id)account
{
  id result = [(MFMailboxUid *)self rootMailbox];
  if (result)
  {
    id v3 = (void *)*((void *)result + 3);
    return (id)[v3 reference];
  }
  return result;
}

- (id)rootMailbox
{
  id result = [(MFMailboxUid *)self topMailbox];
  if ((*((unsigned char *)result + 40) & 0x10) == 0) {
    return 0;
  }
  return result;
}

- (id)topMailbox
{
  do
  {
    id v2 = self;
    self = [(MFMailboxUid *)self parent];
  }
  while (self);
  return v2;
}

- (id)parent
{
  return (id)[(MFWeakReferenceHolder *)self->_parent reference];
}

- (BOOL)isStore
{
  return (self->_attributes & 2) == 0;
}

- (id)name
{
  if ((self->_attributes & 0x10) != 0)
  {
    id v6 = [(MFMailboxUid *)self account];
    return (id)[v6 displayName];
  }
  else
  {
    id v3 = (void *)[(MFWeakReferenceHolder *)self->_parent retainedReference];
    if (v3)
    {
      pathComponent = self->_pathComponent;

      return pathComponent;
    }
    else
    {
      uint64_t v7 = (void *)[NSString stringWithFormat:@"*** Orphaned mailbox %@", self->_pathComponent];

      self->_parent = 0;
      return v7;
    }
  }
}

- (id)mutableCopyOfChildren
{
  [(MFMailboxUid *)self mf_lock];
  id v3 = (void *)[(NSMutableArray *)self->_children mutableCopy];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (id)depthFirstEnumerator
{
  [(MFMailboxUid *)self mf_lock];
  id v3 = (id)[objc_allocWithZone((Class)_MFMailboxUidEnumerator) initWithMailbox:self];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (void)addToPostOrderTraversal:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(MFMailboxUid *)self mf_lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  children = self->_children;
  uint64_t v6 = [(NSMutableArray *)children countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) addToPostOrderTraversal:a3];
      }
      uint64_t v7 = [(NSMutableArray *)children countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(MFMailboxUid *)self mf_unlock];
  [a3 addObject:self];
}

- (id)childEnumeratorIncludingHiddenChildren:(BOOL)a3
{
  id v3 = [[_MFMailboxUidChildrenEnumerator alloc] _initWithMailbox:self includeHiddenChildren:a3];
  return v3;
}

- (id)_mutableChildren
{
  [(MFMailboxUid *)self mf_lock];
  id v3 = (id)[(NSMutableArray *)self->_children copy];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (id)_initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5
{
  if (a3)
  {
    uint64_t v7 = [(MFMailboxUid *)self init];
    if (v7)
    {
      v7->_pathComponent = (NSString *)[a3 copy];
LABEL_5:
      v7->_attributes = a4;
    }
  }
  else
  {
    uint64_t v7 = [(MFMailboxUid *)self initWithAccount:a5];
    if (v7) {
      goto LABEL_5;
    }
  }
  return v7;
}

- (MFMailboxUid)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxUid;
  id v2 = [(MFMailboxUid *)&v7 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v4 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    CFStringRef v5 = CFUUIDCreateString(v3, v4);

    v2->uniqueId = &v5->isa;
    v2->_mailboxID = -1;
  }
  return v2;
}

- (BOOL)hasChildren
{
  [(MFMailboxUid *)self mf_lock];
  BOOL v3 = (self->_attributes & 0x10) != 0 || [(NSMutableArray *)self->_children count] != 0;
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (MFMailboxUid)initWithName:(id)a3 attributes:(unsigned int)a4 forAccount:(id)a5 extraAttributes:(id)a6
{
  objc_super v7 = [(MFMailboxUid *)self _initWithName:a3 attributes:*(void *)&a4 forAccount:a5];
  if (v7) {
    v7->_extraAttributes = (NSArray *)[a6 copy];
  }
  return v7;
}

- (void)setAttributes:(unsigned int)a3
{
  self->_attributes = a3;
}

- (BOOL)isContainer
{
  return (self->_attributes & 1) == 0;
}

+ (id)fileURLForMailboxURL:(id)a3
{
  CFUUIDRef v4 = +[MailAccount accountWithURL:](MailAccount, "accountWithURL:");
  id result = (id)objc_msgSend((id)objc_msgSend(-[MailAccount path](v4, "path"), "stringByAppendingPathComponent:", objc_msgSend(a3, "path")), "stringByAppendingPathExtension:", -[MailAccount mailboxPathExtension](v4, "mailboxPathExtension"));
  if (result)
  {
    id v6 = result;
    objc_super v7 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v7 fileURLWithPath:v6];
  }
  return result;
}

- (void)dealloc
{
  pathComponent = self->_pathComponent;
  if (pathComponent && self->_account)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MailboxUid.m", 162, @"should not have a path component and a account on the same mailboxuid.");
    pathComponent = self->_pathComponent;
  }

  v5.receiver = self;
  v5.super_class = (Class)MFMailboxUid;
  [(MFMailboxUid *)&v5 dealloc];
}

- (MFMailboxUid)initWithAccount:(id)a3
{
  CFUUIDRef v4 = [(MFMailboxUid *)self init];
  if (v4)
  {
    v4->_account = (MFWeakReferenceHolder *)(id)[MEMORY[0x1E4F73598] weakReferenceWithObject:a3];
    v4->_attributes = 18;
  }
  return v4;
}

- (id)_dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFMailboxUid *)self attributes];
  CFUUIDRef v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = [(MFMailboxUid *)self name];
  id v6 = objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, @"MailboxName", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3), @"MailboxAttributes", 0);
  if ((v3 & 1) == 0)
  {
    id v7 = [(MFMailboxUid *)self children];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13++), "dictionaryRepresentation"));
          }
          while (v11 != v13);
          uint64_t v11 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
      [v6 setObject:v9 forKeyedSubscript:@"MailboxChildren"];
    }
  }
  uint64_t v14 = [(MFMailboxUid *)self extraAttributes];
  if (v14) {
    [v6 setObject:v14 forKeyedSubscript:@"MailboxExtraAttributes"];
  }
  return v6;
}

- (id)uniqueId
{
  return self->uniqueId;
}

- (void)setName:(id)a3
{
  if (([a3 isEqual:self->_pathComponent] & 1) == 0)
  {
    [(MFMailboxUid *)self mf_lock];

    self->_pathComponent = (NSString *)a3;
    self->_realFullPath = 0;
    if ([(MFMailboxUid *)self URLString])
    {

      self->_criterion = 0;
    }
    [(MFMailboxUid *)self mf_unlock];
  }
}

- (id)accountDisplayName
{
  id v2 = [(MFMailboxUid *)self representedAccount];
  return (id)[v2 displayName];
}

- (unint64_t)serverUnreadOnlyOnServerCount
{
  uint64_t v3 = objc_msgSend(-[MFMailboxUid account](self, "account"), "library");
  id v4 = [(MFMailboxUid *)self URLString];
  return [v3 serverUnreadOnlyOnServerCountForMailbox:v4];
}

- (unint64_t)unreadCount
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "unreadCountForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (unint64_t)unreadCountMatchingCriterion:(id)a3
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "unreadCountForMailbox:matchingCriterion:", -[MFMailboxUid URLString](self, "URLString"), a3);
}

- (unint64_t)nonDeletedCount
{
  return objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "nonDeletedCountForMailbox:", -[MFMailboxUid URLString](self, "URLString"));
}

- (int64_t)statusCountDelta
{
  uint64_t v3 = objc_msgSend(-[MFMailboxUid account](self, "account"), "library");
  id v4 = [(MFMailboxUid *)self URLString];
  return [v3 statusCountDeltaForMailbox:v4];
}

- (void)updateMostRecentStatusCount:(unint64_t)a3
{
  id v5 = objc_msgSend(-[MFMailboxUid account](self, "account"), "library");
  id v6 = [(MFMailboxUid *)self URLString];
  if ([v5 mostRecentStatusCountForMailbox:v6] != a3)
  {
    [v5 setMostRecentStatusCount:a3 forMailbox:v6];
    id v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"MailboxUserInfoDidChange" object:self];
  }
}

- (BOOL)shouldUseNonDeletedForUnreadCount
{
  int v2 = [(MFMailboxUid *)self type];
  return (v2 - 5) < 2 || (v2 - 105) < 2;
}

- (id)childEnumerator
{
  return [(MFMailboxUid *)self childEnumeratorIncludingHiddenChildren:1];
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(MFMailboxUid *)self mf_lock];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  children = self->_children;
  uint64_t v4 = [(NSMutableArray *)children countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(children);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) numberOfDescendants] + 1;
      }
      uint64_t v5 = [(NSMutableArray *)children countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }
  [(MFMailboxUid *)self mf_unlock];
  return v6;
}

- (id)childAtIndex:(unint64_t)a3
{
  [(MFMailboxUid *)self mf_lock];
  uint64_t v5 = (void *)[(NSMutableArray *)self->_children objectAtIndex:a3];
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (unint64_t)indexOfChild:(id)a3
{
  [(MFMailboxUid *)self mf_lock];
  unint64_t v5 = [(NSMutableArray *)self->_children indexOfObject:a3];
  [(MFMailboxUid *)self mf_unlock];
  return v5;
}

- (id)descendantWithExtraAttribute:(id)a3
{
  if (![a3 length]) {
    return 0;
  }
  [(MFMailboxUid *)self mf_lock];
  id v5 = [(MFMailboxUid *)self depthFirstEnumerator];
  do
  {
    unint64_t v6 = (void *)[v5 nextObject];
    uint64_t v7 = v6;
  }
  while (v6 && !objc_msgSend((id)objc_msgSend(v6, "extraAttributes"), "containsObject:", a3));
  [(MFMailboxUid *)self mf_unlock];
  return v7;
}

- (void)sortChildren
{
  [(MFMailboxUid *)self mf_lock];
  [(NSMutableArray *)self->_children sortUsingFunction:_MFCompareMailboxUidsNS context:[(MFMailboxUid *)self account]];
  [(MFMailboxUid *)self mf_unlock];
}

- (void)removeChild:(id)a3
{
  [(MFMailboxUid *)self mf_lock];
  [(NSMutableArray *)self->_children removeObject:a3];
  [(MFMailboxUid *)self mf_unlock];
}

- (void)setParent:(id)a3
{
  if ([(MFMailboxUid *)self parent] != a3)
  {
    bindParentAndChild(a3, (id *)&self->super.isa);
    [(MFMailboxUid *)self mf_lock];
    if ([(MFMailboxUid *)self URLString])
    {

      self->_criterion = 0;
    }
    [(MFMailboxUid *)self mf_unlock];
  }
}

- (void)flushCriteria
{
  [(MFMailboxUid *)self mf_lock];

  self->_criterion = 0;
  [(MFMailboxUid *)self mf_unlock];
}

- (void)setRepresentedAccount:(id)a3
{
  [(MFMailboxUid *)self mf_lock];
  representedAccount = self->_representedAccount;
  if (representedAccount != a3)
  {

    self->_representedAccount = (MailAccount *)a3;
  }
  [(MFMailboxUid *)self mf_unlock];
}

- (void)invalidate
{
  unint64_t v3 = [(MFMailboxUid *)self rootMailbox];
  [(MFMailboxUid *)self saveUserInfo];
  if (v3 == self)
  {

    self->_account = 0;
    self->_attributes &= ~0x10u;
  }
  objc_msgSend(-[MFMailboxUid parent](self, "parent"), "removeChild:", self);
  if (v3)
  {
    id v4 = [(MFMailboxUid *)self URLString];
    if (v4) {
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"URLString"];
    }
    else {
      uint64_t v5 = 0;
    }
    unint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MailboxUidDidBecomeInvalidNotification" object:self userInfo:v5];
  }
}

+ (BOOL)isStandardizedMailboxUidType:(int)a3
{
  return (a3 - 1) < 7;
}

- (BOOL)isStandardizedMailboxUid
{
  uint64_t v2 = [(MFMailboxUid *)self type];
  return +[MFMailboxUid isStandardizedMailboxUidType:v2];
}

- (BOOL)isSpecialMailboxUid
{
  id v3 = [(MFMailboxUid *)self account];
  return [v3 isSpecialMailbox:self];
}

- (BOOL)isSentMailboxUid
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(MFMailboxUid *)self type];
  return [v3 isSentMailboxType:v4];
}

+ (BOOL)isOutgoingMailboxType:(int)a3
{
  return (a3 - 4) < 3 || (a3 - 104) < 3;
}

+ (BOOL)isDraftsMailboxType:(int)a3
{
  return a3 == 5 || a3 == 105;
}

+ (BOOL)isSentMailboxType:(int)a3
{
  return a3 == 4 || a3 == 104;
}

+ (BOOL)typeIsValidTransferDestination:(int)a3
{
  char v4 = [(id)objc_opt_class() isOutgoingMailboxType:*(void *)&a3];
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
  uint64_t v2 = [(MFMailboxUid *)self type];
  id v3 = objc_opt_class();
  return [v3 isOutgoingMailboxType:v2];
}

- (BOOL)isNotesMailboxUid
{
  int v3 = objc_msgSend(-[MFMailboxUid name](self, "name"), "isEqualToString:", @"Notes");
  if (v3)
  {
    id v4 = [(MFMailboxUid *)self parent];
    LOBYTE(v3) = v4 == (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "rootMailboxUid");
  }
  return v3;
}

- (id)realFullPath
{
  realFullPath = self->_realFullPath;
  if (!realFullPath)
  {
    id v4 = objc_msgSend(-[MFMailboxUid fullPath](self, "fullPath"), "mf_betterStringByResolvingSymlinksInPath");
    [(MFMailboxUid *)self mf_lock];
    if (!self->_realFullPath) {
      self->_realFullPath = (NSString *)v4;
    }
    [(MFMailboxUid *)self mf_unlock];
    realFullPath = self->_realFullPath;
  }
  BOOL v5 = realFullPath;
  return v5;
}

- (id)tildeAbbreviatedPath
{
  id v3 = [(MFMailboxUid *)self account];
  id v4 = (void *)[v3 tildeAbbreviatedPath];
  uint64_t v5 = [v3 mailboxPathExtension];
  unint64_t v6 = (void *)[v3 _mailboxPathPrefix];
  [(MFMailboxUid *)self mf_lock];
  id v7 = _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v3, 0, v4, v6, v5, 0);
  [(MFMailboxUid *)self mf_unlock];
  return v7;
}

- (id)pathRelativeToMailbox:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(MFMailboxUid *)self account];
  return _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v5, (uint64_t)a3, &stru_1F265CF90, 0, 0, 0);
}

- (id)pathRelativeToMailboxForDisplay:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(MFMailboxUid *)self account];
  return _stringByAppendingPathComponentsUsingSpecialDisplayNames(self, v5, (uint64_t)a3, &stru_1F265CF90, 0, 0, 1);
}

- (id)URL
{
  id v3 = [(MFMailboxUid *)self account];
  id v4 = [(MFMailboxUid *)self accountRelativePath];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, @"Account", v4, @"RelativePath", 0);
  return +[MailAccount URLForInfo:v5];
}

- (id)URLStringWithAccount:(id)a3
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a3, @"Account", -[MFMailboxUid accountRelativePath](self, "accountRelativePath"), @"RelativePath", 0);
  id v4 = +[MailAccount URLForInfo:v3];

  return (id)[v4 absoluteString];
}

- (id)oldURLString
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [(MFMailboxUid *)self ancestralAccount];
  id v5 = [(MFMailboxUid *)self accountRelativePath];
  unint64_t v6 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"Account", v5, @"RelativePath", objc_msgSend(NSNumber, "numberWithBool:", 1), @"IncludeDefaultSecurePortNumber", 0);
  id v7 = +[MailAccount URLForInfo:v6];

  return (id)[v7 absoluteString];
}

- (unsigned)mailboxID
{
  unsigned int result = self->_mailboxID;
  if (result == -1)
  {
    id v4 = [(MFMailboxUid *)self URLString];
    if ([v4 length])
    {
      unsigned int result = objc_msgSend((id)objc_msgSend(-[MFMailboxUid account](self, "account"), "library"), "mailboxIDForURLString:", v4);
      self->_mailboxID = result;
    }
    else
    {
      return self->_mailboxID;
    }
  }
  return result;
}

- (int64_t)compareWithMailboxUid:(id)a3
{
  return (int)_MFCompareMailboxUidsWithResultCodes((uint64_t)self, (uint64_t)a3, 0, (CFComparisonResult)0xFFFFFFFFLL, 0, kCFCompareGreaterThan);
}

- (int64_t)indexToInsertChildMailboxUid:(id)a3
{
  if (-[MFMailboxUid childWithName:](self, "childWithName:", [a3 displayName])) {
    return -1;
  }
  id v6 = [(MFMailboxUid *)self mutableCopyOfChildren];
  if (!v6) {
    return -1;
  }
  id v7 = v6;
  [(MFMailboxUid *)self mf_lock];
  v9.length = [v7 count];
  v9.location = 0;
  CFIndex v8 = CFArrayBSearchValues((CFArrayRef)v7, v9, a3, (CFComparatorFunction)_MFCompareMailboxUids, 0);
  [(MFMailboxUid *)self mf_unlock];

  return v8;
}

- (BOOL)isDescendantOfMailbox:(id)a3
{
  if (self)
  {
    id v4 = self;
    do
    {
      uint64_t v5 = [(MFMailboxUid *)v4 parent];
      LOBYTE(self) = v4 == a3;
      if (v4 == a3) {
        break;
      }
      id v4 = (MFMailboxUid *)v5;
    }
    while (v5);
  }
  return (char)self;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(-[MFMailboxUid _privacySafeDescription](self, "_privacySafeDescription"), "stringByAppendingFormat:", @" relativePath=%@", -[MFMailboxUid accountRelativePath](self, "accountRelativePath"));
}

- (id)_privacySafeDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p> ID=%u type=%@ attributes=%d", v4, self, self->_mailboxID, NSStringFromMailboxUidType(-[MFMailboxUid type](self, "type")), -[MFMailboxUid attributes](self, "attributes")];
}

- (NSString)ef_publicDescription
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F60D58], "currentDevice"), "isInternal"))
  {
    return [(MFMailboxUid *)self description];
  }
  else
  {
    return (NSString *)[(MFMailboxUid *)self _privacySafeDescription];
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isVisible
{
  return [(MFMailboxUid *)self type] == 0;
}

- (id)_loadUserInfo
{
  id result = (id)objc_msgSend(-[MFMailboxUid fullPath](self, "fullPath"), "stringByAppendingPathComponent:", @"Info.plist");
  if (result)
  {
    id result = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:result];
    if (!result)
    {
      id v3 = (void *)MEMORY[0x1E4F1CA60];
      return (id)[v3 dictionary];
    }
  }
  return result;
}

- (id)userInfoObjectForKey:(id)a3
{
  [(MFMailboxUid *)self mf_lock];
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    [(MFMailboxUid *)self mf_unlock];
    id v6 = [(MFMailboxUid *)self _loadUserInfo];
    if (v6 && [(MFMailboxUid *)self mergeWithUserInfo:v6]) {
      [v6 setObject:@"YES" forKey:@"IsDirty"];
    }
    [(MFMailboxUid *)self mf_lock];
    userInfo = self->_userInfo;
    if (!userInfo)
    {
      userInfo = (NSMutableDictionary *)v6;
      self->_userInfo = userInfo;
    }
  }
  id v7 = (void *)[(NSMutableDictionary *)userInfo objectForKey:a3];
  [(MFMailboxUid *)self mf_unlock];
  return v7;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  [(MFMailboxUid *)self mf_lock];
  userInfo = self->_userInfo;
  if (userInfo)
  {
    BOOL v8 = 0;
  }
  else
  {
    [(MFMailboxUid *)self mf_unlock];
    id v9 = [(MFMailboxUid *)self _loadUserInfo];
    BOOL v8 = [(MFMailboxUid *)self mergeWithUserInfo:v9];
    [(MFMailboxUid *)self mf_lock];
    userInfo = self->_userInfo;
    if (!userInfo)
    {
      userInfo = (NSMutableDictionary *)v9;
      self->_userInfo = userInfo;
    }
  }
  long long v10 = (void *)[(NSMutableDictionary *)userInfo objectForKey:a4];
  if (!v10 || ([v10 isEqual:a3] & 1) == 0)
  {
    [(NSMutableDictionary *)self->_userInfo setObject:a3 forKey:a4];
    goto LABEL_10;
  }
  if (v8) {
LABEL_10:
  }
    [(NSMutableDictionary *)self->_userInfo setObject:@"YES" forKey:@"IsDirty"];
  [(MFMailboxUid *)self mf_unlock];
}

- (BOOL)userInfoBoolForKey:(id)a3
{
  id v3 = [(MFMailboxUid *)self userInfoObjectForKey:a3];
  if (v3)
  {
    LOBYTE(v3) = NSBOOLFromString();
  }
  return (char)v3;
}

- (void)setUserInfoBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = NSStringFromBOOL();
  [(MFMailboxUid *)self setUserInfoObject:v6 forKey:a4];
}

- (void)saveUserInfo
{
  if ([(MFMailboxUid *)self type] != 8)
  {
    [(MFMailboxUid *)self mf_lock];
    if ([(NSMutableDictionary *)self->_userInfo objectForKey:@"IsDirty"])
    {
      [(NSMutableDictionary *)self->_userInfo removeObjectForKey:@"IsDirty"];
      id v3 = [(MFMailboxUid *)self fullPath];
      if (v3)
      {
        uint64_t v4 = v3;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0) {
          objc_msgSend(v4, "mf_makeDirectoryWithMode:", 448);
        }
        uint64_t v5 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_userInfo format:100 options:0 error:0];
        if (v5) {
          objc_msgSend(v5, "writeToFile:options:error:", objc_msgSend(v4, "stringByAppendingPathComponent:", @"Info.plist"), 1073741825, 0);
        }
      }
    }
    [(MFMailboxUid *)self mf_unlock];
  }
}

- (BOOL)mergeWithUserInfo:(id)a3
{
  return 0;
}

- (id)userInfoDictionary
{
  [(MFMailboxUid *)self mf_lock];
  id v3 = (id)[(NSMutableDictionary *)self->_userInfo copy];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (void)setUserInfoWithDictionary:(id)a3
{
  uint64_t v5 = (void *)[a3 keyEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", [a3 objectForKey:v7], v7);
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
}

- (id)userInfoForSerialization
{
  if ([(MFMailboxUid *)self type] == 8) {
    return 0;
  }
  [(MFMailboxUid *)self mf_lock];
  id v3 = (id)[(NSMutableDictionary *)self->_userInfo mutableCopy];
  [v3 removeObjectForKey:@"IsDirty"];
  [(MFMailboxUid *)self mf_unlock];
  return v3;
}

- (void)setCriterion:(id)a3
{
  if (self->_criterion != a3)
  {
    [(MFMailboxUid *)self mf_lock];

    self->_criterion = (MFMessageCriterion *)a3;
    [(MFMailboxUid *)self mf_unlock];
  }
}

- (id)store
{
  id result = (id)objc_msgSend(-[MFMailboxUid account](self, "account"), "storeForMailboxUid:", self);
  if (!result)
  {
    return +[MFLibraryStore storeWithMailbox:self];
  }
  return result;
}

- (BOOL)isShared
{
  return LOBYTE(self->_attributes) >> 7;
}

- (BOOL)shouldRestoreMessagesAfterFailedDelete
{
  id v2 = [(MFMailboxUid *)self account];
  return [v2 shouldRestoreMessagesAfterFailedDelete];
}

- (BOOL)alwaysWriteFullMessageFile
{
  return self->_type == 6;
}

- (id)lastViewedMessageID
{
  return [(MFMailboxUid *)self userInfoObjectForKey:@"LastViewedMessageInMailbox"];
}

- (id)lastViewedMessageDate
{
  return [(MFMailboxUid *)self userInfoObjectForKey:@"LastViewedMessageInMailboxDate"];
}

- (void)setLastViewedMessageID:(id)a3
{
  [(MFMailboxUid *)self setUserInfoObject:a3 forKey:@"LastViewedMessageInMailbox"];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [(MFMailboxUid *)self setUserInfoObject:v4 forKey:@"LastViewedMessageInMailboxDate"];
}

- (unint64_t)suggestionsLostMessageSearchResultCount
{
  id v2 = [(MFMailboxUid *)self userInfoObjectForKey:@"suggestionsLostMessageSearchResultCount"];
  return [v2 unsignedIntegerValue];
}

- (double)suggestionsLostMessageSearchTimestamp
{
  id v2 = [(MFMailboxUid *)self userInfoObjectForKey:@"suggestionsLostMessageSearchTimestamp"];
  [v2 doubleValue];
  return result;
}

- (void)updateSuggestionsLostMessageSearchResultCount:(unint64_t)a3
{
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", [NSNumber numberWithUnsignedInteger:a3], @"suggestionsLostMessageSearchResultCount");
  uint64_t v4 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[MFMailboxUid setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", objc_msgSend(v4, "numberWithDouble:"), @"suggestionsLostMessageSearchTimestamp");
  [(MFMailboxUid *)self saveUserInfo];
}

- (void)setExtraAttributes:(id)a3
{
}

- (MFInvocationQueue)attachmentDownloadQueue
{
  AssociatedObject = (MFInvocationQueue *)objc_getAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue);
  if (!AssociatedObject)
  {
    AssociatedObject = objc_alloc_init(MFInvocationQueue);
    objc_setAssociatedObject(self, (const void *)MFMailboxUidAttachmentQueue, AssociatedObject, (void *)0x301);
  }
  return AssociatedObject;
}

@end