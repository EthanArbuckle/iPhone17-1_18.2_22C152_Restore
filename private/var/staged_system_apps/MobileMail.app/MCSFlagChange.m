@interface MCSFlagChange
- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5;
- (BOOL)willFlag;
- (BOOL)willMarkRead;
- (BOOL)willMarkUnread;
- (BOOL)willUnflag;
- (MCSFlagChange)initWithFlagsToSet:(id)a3 flagsToClear:(id)a4 reason:(int64_t)a5;
- (id)_applyFlagChange:(id)a3 toObjects:(id)a4;
- (id)applyPendingChangeToObjects:(id)a3;
- (id)description;
- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3;
- (id)localizedErrorTitleForMessageCount:(unint64_t)a3;
- (id)localizedShortOperationDescription;
- (void)_sortMessages:(id)a3 intoLibraryMesages:(id)a4 nonLibraryMessages:(id)a5;
- (void)setIsDeletion:(BOOL)a3;
@end

@implementation MCSFlagChange

- (MCSFlagChange)initWithFlagsToSet:(id)a3 flagsToClear:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 intersectsSet:v9];
  if (v10)
  {
    sub_10012D2F4((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)v8);
    if ([v8 intersectsSet:v9]) {
      __assert_rtn("-[MCSFlagChange initWithFlagsToSet:flagsToClear:reason:]", "MCSFlagChange.m", 43, "[flagsToSet intersectsSet:flagsToClear] == __objc_no");
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)MCSFlagChange;
  v18 = [(MCSFlagChange *)&v39 init];
  if (v18)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    flagChanges = v18->_flagChanges;
    v18->_flagChanges = v19;

    v21 = +[NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v18->_flagChanges setObject:v21 forKeyedSubscript:MFMessageChangeReason];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v8;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v36;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v22);
          }
          [(NSMutableDictionary *)v18->_flagChanges setObject:@"YES" forKey:*(void *)(*((void *)&v35 + 1) + 8 * (void)v25)];
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v23);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v9;
    id v27 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v26);
          }
          [(NSMutableDictionary *)v18->_flagChanges setObject:@"NO" forKey:*(void *)(*((void *)&v31 + 1) + 8 * (void)v29)];
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v27);
    }

    *((unsigned char *)&v18->super.super + 8) |= 1u;
  }

  return v18;
}

- (id)_applyFlagChange:(id)a3 toObjects:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (![(MCSOperation *)self isFinalized]) {
    __assert_rtn("-[MCSFlagChange _applyFlagChange:toObjects:]", "MCSFlagChange.m", 66, "[self isFinalized]");
  }
  id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
  id v8 = [v22 objectForKey:MFMessageIsFlagged];
  id v9 = [v22 objectForKey:MessageIsRead];
  v21 = [v22 objectForKey:MessageIsDeleted];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v9)
        {
          if ([v9 BOOLValue]) {
            CFStringRef v14 = @"MCSChangeSetReadMessages";
          }
          else {
            CFStringRef v14 = @"MCSChangeSetUnreadMessages";
          }
          [v7 addObject:v13 toSetForKey:v14];
        }
        if (v8)
        {
          if ([v8 BOOLValue]) {
            CFStringRef v15 = @"MCSChangeSetFlaggedMessages";
          }
          else {
            CFStringRef v15 = @"MCSChangeSetUnflaggedMessages";
          }
          [v7 addObject:v13 toSetForKey:v15];
        }
        if (v21) {
          [v7 addObject:v13 toSetForKey:@"MCSChangeSetDeletedMessages"];
        }
        id v16 = [v13 messageFlags];
        uint64_t v17 = MFMessageFlagsByApplyingDictionary();
        if ((id)v17 != v16) {
          [v13 setMessageFlagsWithoutCommitting:v17];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v10);
  }

  v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#ChangeSetActions flags applied to messages: %@", buf, 0xCu);
  }

  return v7;
}

- (id)applyPendingChangeToObjects:(id)a3
{
  v3 = [(MCSFlagChange *)self _applyFlagChange:self->_flagChanges toObjects:a3];

  return v3;
}

- (void)_sortMessages:(id)a3 intoLibraryMesages:(id)a4 nonLibraryMessages:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        CFStringRef v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "isLibraryMessage", (void)v16)) {
          CFStringRef v15 = v8;
        }
        else {
          CFStringRef v15 = v9;
        }
        [v15 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (BOOL)commitToMessages:(id)a3 failures:(id)a4 newMessages:(id)a5
{
  id v22 = a3;
  id v20 = a4;
  id v21 = a5;
  if (![(MCSOperation *)self isFinalized]) {
    __assert_rtn("-[MCSFlagChange commitToMessages:failures:newMessages:]", "MCSFlagChange.m", 125, "[self isFinalized]");
  }
  id v23 = objc_alloc_init((Class)NSMutableSet);
  id v8 = objc_alloc_init((Class)NSMutableSet);
  [(MCSFlagChange *)self _sortMessages:v22 intoLibraryMesages:v23 nonLibraryMessages:v8];
  if ([v23 count])
  {
    long long v19 = [v22 allObjects];
    [v19 mf_dictionaryWithMessagesSortedByStore];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          flagChanges = self->_flagChanges;
          CFStringRef v15 = [v9 objectForKey:v13];
          id v16 = [v13 setFlagsFromDictionary:flagChanges forMessages:v15];
        }
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }
  }
  if ([v8 count]) {
    id v17 = [(MCSFlagChange *)self applyPendingChangeToObjects:v8];
  }

  return 1;
}

- (id)description
{
  return [(NSMutableDictionary *)self->_flagChanges description];
}

- (BOOL)willMarkRead
{
  return [(NSMutableDictionary *)self->_flagChanges mf_BOOLForKey:MessageIsRead];
}

- (BOOL)willMarkUnread
{
  uint64_t v3 = MessageIsRead;
  v4 = [(NSMutableDictionary *)self->_flagChanges objectForKey:MessageIsRead];

  if (v4) {
    return [(NSMutableDictionary *)self->_flagChanges mf_BOOLForKey:v3] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)willUnflag
{
  uint64_t v3 = MFMessageIsFlagged;
  v4 = [(NSMutableDictionary *)self->_flagChanges objectForKey:MFMessageIsFlagged];

  if (v4) {
    return [(NSMutableDictionary *)self->_flagChanges mf_BOOLForKey:v3] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)willFlag
{
  return [(NSMutableDictionary *)self->_flagChanges mf_BOOLForKey:MFMessageIsFlagged];
}

- (id)localizedErrorDescriptionForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedErrorTitleForMessageCount:(unint64_t)a3
{
  return 0;
}

- (id)localizedShortOperationDescription
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"OPERATION_FLAG_DESC" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (void)setIsDeletion:(BOOL)a3
{
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFE | a3;
}

- (void).cxx_destruct
{
}

@end