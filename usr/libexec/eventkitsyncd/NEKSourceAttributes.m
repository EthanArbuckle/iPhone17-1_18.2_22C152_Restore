@interface NEKSourceAttributes
+ (BOOL)configureAccount:(id)a3 accountChangeItemProvider:(id)a4 withAttributes:(id)a5;
+ (BOOL)configureAccount:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5;
+ (BOOL)configureSource:(id)a3 inStore:(id)a4 withAttributes:(id)a5;
+ (void)createAccountWithSaveRequest:(id)a3 withAttributes:(id)a4;
+ (void)deleteSourcesEventCalendars:(id)a3 inStore:(id)a4;
+ (void)deleteSourcesTaskCalendars:(id)a3 inStore:(id)a4;
+ (void)deleteWhatever:(unint64_t)a3 calendarsInSource:(id)a4 inStore:(id)a5;
- (BOOL)allowsCalendarAddDeleteModify;
- (BOOL)allowsEvents;
- (BOOL)allowsTasks;
- (BOOL)isBirthdayStore;
- (BOOL)isEnabled;
- (BOOL)isFacebook;
- (BOOL)isLocalStore;
- (BOOL)onlyCreatorCanModify;
- (BOOL)snoozeAlarmRequiresDetach;
- (BOOL)supportsAlarmAcknowledgedDate;
- (BOOL)supportsSharedCalendars;
- (BOOL)usesSelfAttendee;
- (NEKSourceAttributes)initWithAccount:(id)a3;
- (NEKSourceAttributes)initWithSource:(id)a3;
- (NSNumber)defaultAlarmOffset;
- (NSString)accountPersistentID;
- (NSString)constraintsDescriptionPath;
- (NSString)creatorBundleID;
- (NSString)creatorCodeSigningIdentity;
- (NSString)externalID;
- (NSString)externalModificationTag;
- (NSString)name;
- (id)description;
- (int64_t)type;
- (void)setAccountPersistentID:(id)a3;
- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setAllowsEvents:(BOOL)a3;
- (void)setAllowsTasks:(BOOL)a3;
- (void)setConstraintsDescriptionPath:(id)a3;
- (void)setCreatorBundleID:(id)a3;
- (void)setCreatorCodeSigningIdentity:(id)a3;
- (void)setDefaultAlarmOffset:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setIsBirthdayStore:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setIsFacebook:(BOOL)a3;
- (void)setIsLocalStore:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOnlyCreatorCanModify:(BOOL)a3;
- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3;
- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3;
- (void)setSupportsSharedCalendars:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setUsesSelfAttendee:(BOOL)a3;
@end

@implementation NEKSourceAttributes

- (NEKSourceAttributes)initWithSource:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 sourceIdentifier];
    if ([v5 sourceType])
    {
      if ([v5 sourceType] == (id)5)
      {

        v6 = @"F519C070-44C7-467D-B560-7FEABDF9D3AC";
        id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F519C070-44C7-467D-B560-7FEABDF9D3AC"];
        v8 = +[REMAccount objectIDWithUUID:v7];

        uint64_t v9 = 1;
        goto LABEL_12;
      }
      v11 = [v5 sourceIdentifier];
      id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
      if (!v12)
      {
        v13 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          sub_10006E49C((uint64_t)v11, v13);
        }
      }
      v8 = +[REMAccount objectIDWithUUID:v12];
    }
    else
    {
      v8 = +[REMAccount localAccountID];
    }
    uint64_t v9 = 0;
LABEL_12:
    v14 = +[REMStore eks_storeForSyncing];
    id v40 = 0;
    v15 = [v14 fetchAccountWithObjectID:v8 error:&v40];
    id v16 = v40;

    if (v15)
    {
      uint64_t v17 = [v15 inactive] ^ 1;
LABEL_21:
      if (!sub_10000BC90() && [v15 type] == (id)2)
      {
        unsigned int v21 = [v5 allowsEvents];
        v22 = *(void **)(qword_1000C6CA8 + 8);
        if (!v21)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_DEFAULT))
          {
            v37 = v22;
            v38 = [v15 objectID];
            *(_DWORD *)buf = 138543362;
            CFStringRef v42 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Attempting to send source wrapper for CloudKit reminders account %{public}@ with allowsEvents=NO but the other side does not support CloudKit. Dropping this source wrapper and it will not be sent.", buf, 0xCu);
          }
          v10 = 0;
          goto LABEL_38;
        }
        if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
          sub_10006E37C(v22, v15);
        }
        uint64_t v17 = 0;
      }
      if ([v5 allowsEvents])
      {
        v39.receiver = self;
        v39.super_class = (Class)NEKSourceAttributes;
        v23 = [(NEKSourceAttributes *)&v39 init];
        if (v23)
        {
          v24 = [v5 title];
          [(NEKSourceAttributes *)v23 setName:v24];

          v25 = [v5 defaultAlarmOffset];
          [(NEKSourceAttributes *)v23 setDefaultAlarmOffset:v25];

          -[NEKSourceAttributes setType:](v23, "setType:", [v5 sourceType]);
          -[NEKSourceAttributes setIsEnabled:](v23, "setIsEnabled:", [v5 isEnabled]);
          -[NEKSourceAttributes setIsFacebook:](v23, "setIsFacebook:", [v5 isFacebookSource]);
          -[NEKSourceAttributes setUsesSelfAttendee:](v23, "setUsesSelfAttendee:", [v5 usesSelfAttendee]);
          v26 = [v5 constraintsDescriptionPath];
          [(NEKSourceAttributes *)v23 setConstraintsDescriptionPath:v26];

          v27 = [v5 externalID];
          [(NEKSourceAttributes *)v23 setExternalID:v27];

          v28 = [v5 externalModificationTag];
          [(NEKSourceAttributes *)v23 setExternalModificationTag:v28];

          v29 = [v5 creatorBundleID];
          [(NEKSourceAttributes *)v23 setCreatorBundleID:v29];

          v30 = [v5 creatorCodeSigningIdentity];
          [(NEKSourceAttributes *)v23 setCreatorCodeSigningIdentity:v30];

          [(NEKSourceAttributes *)v23 setAccountPersistentID:v6];
          -[NEKSourceAttributes setSupportsSharedCalendars:](v23, "setSupportsSharedCalendars:", [v5 supportsSharedCalendars]);
          [(NEKSourceAttributes *)v23 setAllowsTasks:v17];
          -[NEKSourceAttributes setAllowsEvents:](v23, "setAllowsEvents:", [v5 allowsEvents] & (v9 ^ 1));
          -[NEKSourceAttributes setAllowsCalendarAddDeleteModify:](v23, "setAllowsCalendarAddDeleteModify:", [v5 allowsCalendarAddDeleteModify]);
          -[NEKSourceAttributes setOnlyCreatorCanModify:](v23, "setOnlyCreatorCanModify:", [v5 onlyCreatorCanModify]);
          -[NEKSourceAttributes setSnoozeAlarmRequiresDetach:](v23, "setSnoozeAlarmRequiresDetach:", [v5 snoozeAlarmRequiresDetach]);
          -[NEKSourceAttributes setSupportsAlarmAcknowledgedDate:](v23, "setSupportsAlarmAcknowledgedDate:", [v5 supportsAlarmAcknowledgedDate]);
          -[NEKSourceAttributes setIsLocalStore:](v23, "setIsLocalStore:", [v5 sourceType] == 0);
          [(NEKSourceAttributes *)v23 setIsBirthdayStore:v9];
        }
        v31 = v23;
      }
      else
      {
        v32 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v32;
          if ([v15 type] == (id)2) {
            CFStringRef v34 = @"CloudKit";
          }
          else {
            CFStringRef v34 = @"non-CloudKit";
          }
          v35 = [v5 sourceIdentifier];
          *(_DWORD *)buf = 138543874;
          CFStringRef v42 = v34;
          __int16 v43 = 2114;
          v44 = v35;
          __int16 v45 = 2114;
          v46 = v8;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Sending %{public}@ reminder-only EKSource %{public}@ with REMAccount %{public}@", buf, 0x20u);
        }
        v31 = [(NEKSourceAttributes *)self initWithAccount:v15];
      }
      self = v31;
      v10 = v31;
LABEL_38:

      goto LABEL_39;
    }
    v18 = [v16 domain];
    if ([v18 isEqualToString:REMErrorDomain])
    {
      id v19 = [v16 code];

      if (v19 == (id)-3000)
      {
LABEL_20:
        uint64_t v17 = 0;
        goto LABEL_21;
      }
    }
    else
    {
    }
    v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10006E424((uint64_t)v8, v20);
    }
    goto LABEL_20;
  }
  v10 = 0;
LABEL_39:

  return v10;
}

+ (void)deleteWhatever:(unint64_t)a3 calendarsInSource:(id)a4 inStore:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [v7 calendarsForEntityType:a3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        v14 = v11;
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v16 = [v15 calendarIdentifier];
        uint64_t v17 = *(NSObject **)(qword_1000C6CA8 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Performing a priori deletion of calendar %{public}@", buf, 0xCu);
        }
        [v15 setImmutable:0];
        id v24 = v14;
        [v8 removeCalendar:v15 commit:0 error:&v24];
        id v11 = v24;

        if (v11)
        {
          v18 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v16;
            __int16 v31 = 2114;
            id v32 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Deletion of calendar %{public}@ didn't go so well: %{public}@", buf, 0x16u);
          }
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  id v23 = v11;
  [v8 commit:&v23];
  id v20 = v23;

  unsigned int v21 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10006E528((uint64_t)v20, v21);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Successful save after deleting very suspicious calendars.", buf, 2u);
  }
}

+ (void)deleteSourcesTaskCalendars:(id)a3 inStore:(id)a4
{
}

+ (void)deleteSourcesEventCalendars:(id)a3 inStore:(id)a4
{
}

+ (BOOL)configureSource:(id)a3 inStore:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  BOOL v11 = 0;
  if (!v7 || !v8 || !v9) {
    goto LABEL_173;
  }
  id v135 = v8;
  uint64_t v12 = [v9 accountPersistentID];
  v13 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v141 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting configuration of source with persistent ID: [%{public}@].", buf, 0xCu);
  }

  v14 = [v7 title];
  uint64_t v15 = [v10 name];
  uint64_t v16 = v15;
  v133 = (void *)v15;
  v134 = v14;
  if (v14)
  {
    if ([(__CFString *)v14 isEqualToString:v15])
    {
LABEL_8:
      BOOL v11 = 0;
      goto LABEL_13;
    }
  }
  else if (!v15)
  {
    goto LABEL_8;
  }
  [v7 setTitle:v16];
  uint64_t v17 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v14;
    __int16 v142 = 2112;
    v143 = (__CFString *)v16;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Source's 'name' has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

  BOOL v11 = 1;
LABEL_13:
  v18 = [v7 defaultAlarmOffset];
  uint64_t v19 = [v10 defaultAlarmOffset];
  id v20 = (__CFString *)v19;
  if (v18)
  {
    if ([(__CFString *)v18 isEqual:v19]) {
      goto LABEL_20;
    }
  }
  else if (!v19)
  {
    goto LABEL_20;
  }
  [v7 setDefaultAlarmOffset:v20];
  unsigned int v21 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v18;
    __int16 v142 = 2112;
    v143 = v20;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Source's 'defaultAlarmOffset' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

  BOOL v11 = 1;
LABEL_20:
  v131 = v20;
  v132 = v18;
  id v22 = [v7 sourceType];
  id v23 = [v10 type];
  if (v22 != v23)
  {
    id v24 = v23;
    [v7 setSourceType:v23];
    long long v25 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = +[NSNumber numberWithInteger:v22];
      long long v27 = +[NSNumber numberWithInteger:v24];
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v26;
      __int16 v142 = 2112;
      v143 = v27;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Source's 'type' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v28 = [v7 isEnabled];
  id v29 = [v10 isEnabled];
  if (v28 != v29)
  {
    int v30 = (int)v29;
    [v7 setEnabled:v29];
    __int16 v31 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      if (v28) {
        id v32 = @"YES";
      }
      else {
        id v32 = @"NO";
      }
      v33 = v32;
      if (v30) {
        CFStringRef v34 = @"YES";
      }
      else {
        CFStringRef v34 = @"NO";
      }
      v35 = v34;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v33;
      __int16 v142 = 2112;
      v143 = v35;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Source's 'enabled' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v36 = [v7 isFacebook];
  id v37 = [v10 isFacebook];
  if (v36 != v37)
  {
    int v38 = (int)v37;
    [v7 setIsFacebook:v37];
    objc_super v39 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      if (v36) {
        id v40 = @"YES";
      }
      else {
        id v40 = @"NO";
      }
      v41 = v40;
      if (v38) {
        CFStringRef v42 = @"YES";
      }
      else {
        CFStringRef v42 = @"NO";
      }
      __int16 v43 = v42;
      *(_DWORD *)buf = 138413058;
      CFStringRef v141 = @"isFacebook";
      __int16 v142 = 2112;
      v143 = v41;
      __int16 v144 = 2112;
      v145 = v43;
      __int16 v146 = 2114;
      v147 = v12;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Source's '%@' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x2Au);
    }
    BOOL v11 = 1;
  }
  unsigned int v44 = [v7 usesSelfAttendee];
  id v45 = [v10 usesSelfAttendee];
  if (v44 != v45)
  {
    int v46 = (int)v45;
    [v7 setUsesSelfAttendee:v45];
    v47 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      if (v44) {
        v48 = @"YES";
      }
      else {
        v48 = @"NO";
      }
      v49 = v48;
      if (v46) {
        v50 = @"YES";
      }
      else {
        v50 = @"NO";
      }
      v51 = v50;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v49;
      __int16 v142 = 2112;
      v143 = v51;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Source's 'usesSelfAttendee' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  v52 = [v7 constraintsDescriptionPath];
  uint64_t v53 = [v10 constraintsDescriptionPath];
  v54 = (__CFString *)v53;
  if (v52)
  {
    if ([(__CFString *)v52 isEqualToString:v53]) {
      goto LABEL_61;
    }
  }
  else if (!v53)
  {
    goto LABEL_61;
  }
  v55 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v52;
    __int16 v142 = 2112;
    v143 = v54;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'constraintsDescriptionPath' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

LABEL_61:
  v56 = [v7 externalID];
  uint64_t v57 = [v10 externalID];
  v58 = (__CFString *)v57;
  if (v56)
  {
    if ([(__CFString *)v56 isEqualToString:v57]) {
      goto LABEL_68;
    }
  }
  else if (!v57)
  {
    goto LABEL_68;
  }
  [v7 setExternalID:v58];
  v59 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v56;
    __int16 v142 = 2112;
    v143 = v58;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Source's 'externalID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

  BOOL v11 = 1;
LABEL_68:
  v60 = [v7 creatorBundleID];
  uint64_t v61 = [v10 creatorBundleID];
  v137 = v60;
  v138 = (__CFString *)v61;
  if (v60)
  {
    if ([(__CFString *)v60 isEqualToString:v61]) {
      goto LABEL_75;
    }
  }
  else if (!v61)
  {
    goto LABEL_75;
  }
  [v7 setCreatorBundleID:v138];
  v62 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v137;
    __int16 v142 = 2112;
    v143 = v138;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Source's 'creatorBundleID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

  BOOL v11 = 1;
LABEL_75:
  v127 = v58;
  v128 = v56;
  v63 = [v7 creatorCodeSigningIdentity];
  uint64_t v64 = [v10 creatorCodeSigningIdentity];
  v65 = (__CFString *)v64;
  if (v63)
  {
    if ([(__CFString *)v63 isEqualToString:v64]) {
      goto LABEL_82;
    }
  }
  else if (!v64)
  {
    goto LABEL_82;
  }
  [v7 setCreatorCodeSigningIdentity:v65];
  v66 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v141 = v63;
    __int16 v142 = 2112;
    v143 = v65;
    __int16 v144 = 2114;
    v145 = v12;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Source's 'creatorCodeSigningIdentity' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

  BOOL v11 = 1;
LABEL_82:
  v67 = [v7 sourceIdentifier];
  v139 = [v10 accountPersistentID];
  v136 = v67;
  if (([v10 isBirthdayStore] & 1) == 0)
  {
    if (v67)
    {
      if ([(__CFString *)v67 isEqualToString:v139]) {
        goto LABEL_90;
      }
LABEL_87:
      [v7 setSourceIdentifier:v139];
      v68 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v141 = v136;
        __int16 v142 = 2112;
        v143 = v139;
        __int16 v144 = 2114;
        v145 = v12;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Source's 'accountPersistentID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
      }

      BOOL v11 = 1;
      goto LABEL_90;
    }
    if (v139) {
      goto LABEL_87;
    }
  }
LABEL_90:
  v129 = v54;
  v130 = v52;
  unsigned int v69 = [v7 supportsSharedCalendars];
  id v70 = [v10 supportsSharedCalendars];
  if (v69 != v70)
  {
    int v71 = (int)v70;
    [v7 setSupportsSharedCalendars:v70];
    v72 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      if (v69) {
        v73 = @"YES";
      }
      else {
        v73 = @"NO";
      }
      v74 = v73;
      if (v71) {
        v75 = @"YES";
      }
      else {
        v75 = @"NO";
      }
      v76 = v75;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v74;
      __int16 v142 = 2112;
      v143 = v76;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Source's 'supportsSharedCalendars' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v77 = [v7 allowsTasks];
  id v78 = [v10 allowsTasks];
  if (![v10 isBirthdayStore] && v77 != v78)
  {
    v79 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      if (v77) {
        v80 = @"YES";
      }
      else {
        v80 = @"NO";
      }
      v81 = v80;
      if (v78) {
        v82 = @"YES";
      }
      else {
        v82 = @"NO";
      }
      v83 = v82;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v81;
      __int16 v142 = 2112;
      v143 = v83;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Source's 'allowsTasks' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    if ((v78 & 1) == 0)
    {
      v84 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        sub_10006E5E4(v84);
      }
    }
    [v7 setAllowsTasks:v78];
    BOOL v11 = 1;
  }
  unsigned int v85 = [v7 allowsEvents];
  id v86 = [v10 allowsEvents];
  if (![v10 isBirthdayStore] && v85 != v86)
  {
    v87 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      if (v85) {
        v88 = @"YES";
      }
      else {
        v88 = @"NO";
      }
      v89 = v88;
      if (v86) {
        v90 = @"YES";
      }
      else {
        v90 = @"NO";
      }
      v91 = v90;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v89;
      __int16 v142 = 2112;
      v143 = v91;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Source's 'allowsEvents' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    if ((v86 & 1) == 0)
    {
      v92 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
        sub_10006E5A0(v92);
      }
    }
    [v7 setAllowsEvents:v86];
    BOOL v11 = 1;
  }
  unsigned int v93 = [v7 allowsCalendarAddDeleteModify];
  id v94 = [v10 allowsCalendarAddDeleteModify];
  if (v93 != v94)
  {
    int v95 = (int)v94;
    [v7 setAllowsCalendarAddDeleteModify:v94];
    v96 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      if (v93) {
        v97 = @"YES";
      }
      else {
        v97 = @"NO";
      }
      v98 = v97;
      if (v95) {
        v99 = @"YES";
      }
      else {
        v99 = @"NO";
      }
      v100 = v99;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v98;
      __int16 v142 = 2112;
      v143 = v100;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Source's 'allowsCalendarAddDeleteModify' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v101 = [v7 onlyCreatorCanModify];
  id v102 = [v10 onlyCreatorCanModify];
  if (v101 != v102)
  {
    int v103 = (int)v102;
    [v7 setOnlyCreatorCanModify:v102];
    v104 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      if (v101) {
        v105 = @"YES";
      }
      else {
        v105 = @"NO";
      }
      v106 = v105;
      if (v103) {
        v107 = @"YES";
      }
      else {
        v107 = @"NO";
      }
      v108 = v107;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v106;
      __int16 v142 = 2112;
      v143 = v108;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Source's 'onlyCreatorCanModify' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v109 = [v7 snoozeAlarmRequiresDetach];
  id v110 = [v10 snoozeAlarmRequiresDetach];
  if (v109 != v110)
  {
    int v111 = (int)v110;
    [v7 setSnoozeAlarmRequiresDetach:v110];
    v112 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
    {
      if (v109) {
        v113 = @"YES";
      }
      else {
        v113 = @"NO";
      }
      v114 = v113;
      if (v111) {
        v115 = @"YES";
      }
      else {
        v115 = @"NO";
      }
      v116 = v115;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v114;
      __int16 v142 = 2112;
      v143 = v116;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Source's 'snoozeAlarmRequiresDetach' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  unsigned int v117 = [v7 supportsAlarmAcknowledgedDate];
  id v118 = [v10 supportsAlarmAcknowledgedDate];
  if (v117 != v118)
  {
    int v119 = (int)v118;
    [v7 setSupportsAlarmAcknowledgedDate:v118];
    v120 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      if (v117) {
        v121 = @"YES";
      }
      else {
        v121 = @"NO";
      }
      v122 = v121;
      if (v119) {
        v123 = @"YES";
      }
      else {
        v123 = @"NO";
      }
      v124 = v123;
      *(_DWORD *)buf = 138412802;
      CFStringRef v141 = v122;
      __int16 v142 = 2112;
      v143 = v124;
      __int16 v144 = 2114;
      v145 = v12;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Source's 'supportsAlarmAcknowledgedDate' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    BOOL v11 = 1;
  }
  v125 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v141 = v12;
    _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Completed configuration of source with persistent ID: [%{public}@].", buf, 0xCu);
  }

  id v8 = v135;
LABEL_173:

  return v11;
}

- (NEKSourceAttributes)initWithAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)NEKSourceAttributes;
    v5 = [(NEKSourceAttributes *)&v16 init];
    if (v5)
    {
      v6 = [v4 name];
      [(NEKSourceAttributes *)v5 setName:v6];

      [(NEKSourceAttributes *)v5 setDefaultAlarmOffset:0];
      -[NEKSourceAttributes setType:](v5, "setType:", sub_10003720C((uint64_t)[v4 type]));
      [(NEKSourceAttributes *)v5 setIsEnabled:1];
      [(NEKSourceAttributes *)v5 setIsFacebook:0];
      [(NEKSourceAttributes *)v5 setUsesSelfAttendee:0];
      id v7 = [v4 daConstraintsDescriptionPath];
      id v8 = sub_100037288(v7);
      [(NEKSourceAttributes *)v5 setConstraintsDescriptionPath:v8];

      id v9 = [v4 externalIdentifier];
      [(NEKSourceAttributes *)v5 setExternalID:v9];

      id v10 = [v4 externalModificationTag];
      [(NEKSourceAttributes *)v5 setExternalModificationTag:v10];

      [(NEKSourceAttributes *)v5 setCreatorBundleID:0];
      [(NEKSourceAttributes *)v5 setCreatorCodeSigningIdentity:0];
      BOOL v11 = [v4 objectID];
      uint64_t v12 = [v11 uuid];
      v13 = [v12 UUIDString];
      [(NEKSourceAttributes *)v5 setAccountPersistentID:v13];

      -[NEKSourceAttributes setSupportsSharedCalendars:](v5, "setSupportsSharedCalendars:", [v4 daSupportsSharedCalendars]);
      -[NEKSourceAttributes setAllowsTasks:](v5, "setAllowsTasks:", [v4 inactive] ^ 1);
      [(NEKSourceAttributes *)v5 setAllowsEvents:0];
      [(NEKSourceAttributes *)v5 setAllowsCalendarAddDeleteModify:1];
      [(NEKSourceAttributes *)v5 setOnlyCreatorCanModify:0];
      [(NEKSourceAttributes *)v5 setSnoozeAlarmRequiresDetach:0];
      [(NEKSourceAttributes *)v5 setSupportsAlarmAcknowledgedDate:0];
      -[NEKSourceAttributes setIsLocalStore:](v5, "setIsLocalStore:", [v4 type] == (id)1);
      [(NEKSourceAttributes *)v5 setIsBirthdayStore:0];
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)createAccountWithSaveRequest:(id)a3 withAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (unint64_t)[v6 type];
  if (v8 > 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_10009BA88[v8];
  }
  id v10 = [v6 name];
  BOOL v11 = [v6 accountPersistentID];
  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];
  if (!v12)
  {
    v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10006EAA8((uint64_t)v11, v13);
    }
  }
  v14 = +[REMAccount objectIDWithUUID:v12];
  uint64_t v15 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v16 = v15;
    uint64_t v17 = +[NSNumber numberWithInteger:v9];
    *(_DWORD *)buf = 138543874;
    long long v25 = v14;
    __int16 v26 = 2112;
    long long v27 = v17;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating REMAccount with id:%{public}@ type:%@ name:%@", buf, 0x20u);
  }
  [v7 _addAccountWithType:v9 name:v10 accountObjectID:v14];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100037660;
  v22[3] = &unk_1000A96A8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v18;
  [a1 configureAccount:0 accountChangeItemProvider:v22 withAttributes:v6];
  id v21 = 0;
  [v7 saveSynchronouslyWithError:&v21];

  id v19 = v21;
  if (v19)
  {
    id v20 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10006EA30((uint64_t)v11, v20);
    }
  }
}

+ (BOOL)configureAccount:(id)a3 withSaveRequest:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003773C;
  v12[3] = &unk_1000A96D0;
  id v13 = a4;
  id v14 = v8;
  id v9 = v8;
  id v10 = v13;
  LOBYTE(a5) = [a1 configureAccount:v9 accountChangeItemProvider:v12 withAttributes:a5];

  return (char)a5;
}

+ (BOOL)configureAccount:(id)a3 accountChangeItemProvider:(id)a4 withAttributes:(id)a5
{
  id v7 = a3;
  v89 = (void (**)(void))a4;
  id v8 = a5;
  id v9 = [v8 accountPersistentID];
  id v10 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v92 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting configuration of source with persistent ID: [%{public}@].", buf, 0xCu);
  }

  BOOL v11 = [v7 name];
  uint64_t v12 = [v8 name];
  id v13 = (void *)v12;
  id v14 = &stru_1000AB888;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  uint64_t v15 = v14;

  if (v11 && ([(__CFString *)v11 isEqualToString:v15] & 1) != 0)
  {
    v90 = 0;
  }
  else
  {
    if ([v7 type] == (id)1)
    {
      objc_super v16 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v92 = v11;
        __int16 v93 = 2112;
        CFStringRef v94 = v15;
        __int16 v95 = 2114;
        CFStringRef v96 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Local source's 'name' has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
      }
      v90 = 0;
    }
    else
    {
      v89[2]();
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      v90 = v17;
      [v17 setName:v15];
      objc_super v16 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v92 = v11;
        __int16 v93 = 2112;
        CFStringRef v94 = v15;
        __int16 v95 = 2114;
        CFStringRef v96 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Source's 'name' has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
      }
    }
  }
  uint64_t v18 = [v8 defaultAlarmOffset];
  if (v18)
  {
    id v19 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = 0;
      __int16 v93 = 2112;
      CFStringRef v94 = (const __CFString *)v18;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'defaultAlarmOffset' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  v81 = (void *)v18;
  uint64_t v20 = sub_10003720C((uint64_t)[v7 type]);
  id v21 = [v8 type];
  if ((id)v20 != v21)
  {
    id v22 = v21;
    id v23 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = +[NSNumber numberWithInteger:v20];
      long long v25 = +[NSNumber numberWithInteger:v22];
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = v24;
      __int16 v93 = 2112;
      CFStringRef v94 = v25;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'type' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  if (([v8 isEnabled] & 1) == 0)
  {
    __int16 v26 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"YES";
      __int16 v93 = 2112;
      CFStringRef v94 = @"NO";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'enabled' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v8 isFacebook])
  {
    long long v27 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v92 = @"isFacebook";
      __int16 v93 = 2112;
      CFStringRef v94 = @"NO";
      __int16 v95 = 2112;
      CFStringRef v96 = @"YES";
      __int16 v97 = 2114;
      v98 = v9;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's '%@' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x2Au);
    }
  }
  if ([v8 usesSelfAttendee])
  {
    __int16 v28 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"NO";
      __int16 v93 = 2112;
      CFStringRef v94 = @"YES";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'usesSelfAttendee' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  id v29 = [v7 daConstraintsDescriptionPath];
  sub_100037288(v29);
  int v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v31 = [v8 constraintsDescriptionPath];
  id v86 = (__CFString *)v31;
  if (v30)
  {
    if ([(__CFString *)v30 isEqualToString:v31]) {
      goto LABEL_42;
    }
  }
  else if (!v31)
  {
    goto LABEL_42;
  }
  id v32 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v92 = v30;
    __int16 v93 = 2112;
    CFStringRef v94 = v86;
    __int16 v95 = 2114;
    CFStringRef v96 = v9;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'constraintsDescriptionPath' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

LABEL_42:
  v33 = [v7 externalIdentifier];
  uint64_t v34 = [v8 externalID];
  v84 = (__CFString *)v34;
  unsigned int v85 = v33;
  if (v33)
  {
    if ([(__CFString *)v33 isEqualToString:v34]) {
      goto LABEL_49;
    }
  }
  else if (!v34)
  {
    goto LABEL_49;
  }
  v35 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v92 = v85;
    __int16 v93 = 2112;
    CFStringRef v94 = v84;
    __int16 v95 = 2114;
    CFStringRef v96 = v9;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'externalID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

LABEL_49:
  unsigned int v36 = [v7 externalModificationTag];
  uint64_t v37 = [v8 externalModificationTag];
  v82 = (__CFString *)v37;
  v83 = v36;
  if (v36)
  {
    if ([(__CFString *)v36 isEqualToString:v37]) {
      goto LABEL_56;
    }
  }
  else if (!v37)
  {
    goto LABEL_56;
  }
  int v38 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v92 = v83;
    __int16 v93 = 2112;
    CFStringRef v94 = v82;
    __int16 v95 = 2114;
    CFStringRef v96 = v9;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'externalModificationTag' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

LABEL_56:
  v88 = [v8 creatorBundleID];
  if (v88)
  {
    objc_super v39 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = 0;
      __int16 v93 = 2112;
      CFStringRef v94 = v88;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'creatorBundleID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  v87 = [v8 creatorCodeSigningIdentity];
  if (v87)
  {
    id v40 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = 0;
      __int16 v93 = 2112;
      CFStringRef v94 = v87;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'creatorCodeSigningIdentity' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  v80 = v30;
  v41 = [v7 objectID];
  CFStringRef v42 = [v41 uuid];
  uint64_t v43 = [v42 UUIDString];

  unsigned int v44 = (__CFString *)v43;
  uint64_t v45 = [v8 accountPersistentID];
  int v46 = (__CFString *)v45;
  if (v44)
  {
    if ([(__CFString *)v44 isEqualToString:v45]) {
      goto LABEL_71;
    }
  }
  else if (!v45)
  {
    goto LABEL_71;
  }
  v47 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v92 = v44;
    __int16 v93 = 2112;
    CFStringRef v94 = v46;
    __int16 v95 = 2114;
    CFStringRef v96 = v9;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'accountPersistentID' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
  }

LABEL_71:
  v79 = v44;
  unsigned int v48 = [v7 daSupportsSharedCalendars];
  unsigned int v49 = [v8 supportsSharedCalendars];
  if (v48 != v49)
  {
    unsigned int v50 = v49;
    v51 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (v48) {
        v52 = @"YES";
      }
      else {
        v52 = @"NO";
      }
      uint64_t v53 = v52;
      if (v50) {
        v54 = @"YES";
      }
      else {
        v54 = @"NO";
      }
      v55 = v54;
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = v53;
      __int16 v93 = 2112;
      CFStringRef v94 = v55;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'supportsSharedCalendars' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  unsigned int v56 = [v7 inactive];
  unsigned int v57 = [v8 allowsTasks];
  if (v56 == v57)
  {
    unsigned int v58 = v57;
    if (v90)
    {
      id v59 = v90;
    }
    else
    {
      v89[2]();
      id v59 = (id)objc_claimAutoreleasedReturnValue();
    }
    v90 = v59;

    v60 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      if (v56) {
        v73 = @"NO";
      }
      else {
        v73 = @"YES";
      }
      v74 = v73;
      id v78 = v74;
      if (v58) {
        v75 = @"YES";
      }
      else {
        v75 = @"NO";
      }
      v76 = v75;
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = v74;
      __int16 v93 = 2112;
      CFStringRef v94 = v76;
      unsigned int v77 = v76;
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "UNSUPPORTED: Source's 'allowsTasks' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
    if ([v7 type] == (id)1)
    {
      uint64_t v61 = *(id *)(qword_1000C6CA8 + 8);
      uint64_t v62 = v58 ^ 1;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v63 = +[NSNumber numberWithInt:v58 ^ 1];
        *(_DWORD *)buf = 138543362;
        CFStringRef v92 = v63;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Updating local account .inactive to %{public}@.", buf, 0xCu);
      }
      [v90 setInactive:v62];
    }
    else if ((v58 & 1) == 0)
    {
      uint64_t v64 = *(id *)(qword_1000C6CA8 + 8);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v92 = v9;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Deleting account with identifier %{public}@.", buf, 0xCu);
      }

      [v90 removeFromStore];
    }
  }
  if (objc_msgSend(v8, "allowsEvents", v78))
  {
    if (v90)
    {
      id v65 = v90;
    }
    else
    {
      v89[2]();
      id v65 = (id)objc_claimAutoreleasedReturnValue();
    }
    v90 = v65;

    v66 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_10006EB34((uint64_t)v9, v66);
    }
  }
  if (([v8 allowsCalendarAddDeleteModify] & 1) == 0)
  {
    v67 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"YES";
      __int16 v93 = 2112;
      CFStringRef v94 = @"NO";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'allowsCalendarAddDeleteModify' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v8 onlyCreatorCanModify])
  {
    v68 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"NO";
      __int16 v93 = 2112;
      CFStringRef v94 = @"YES";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'onlyCreatorCanModify' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v8 snoozeAlarmRequiresDetach])
  {
    unsigned int v69 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"NO";
      __int16 v93 = 2112;
      CFStringRef v94 = @"YES";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'snoozeAlarmRequiresDetach' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  if ([v8 supportsAlarmAcknowledgedDate])
  {
    id v70 = *(id *)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v92 = @"NO";
      __int16 v93 = 2112;
      CFStringRef v94 = @"YES";
      __int16 v95 = 2114;
      CFStringRef v96 = v9;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "UNSUPPORTED: Source's 'supportsAlarmAcknowledgedDate' property has changed from [%@] to [%@].  Source's persistent ID: [%{public}@]", buf, 0x20u);
    }
  }
  int v71 = *(id *)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v92 = v9;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Completed configuration of source with persistent ID: [%{public}@].", buf, 0xCu);
  }

  return v90 != 0;
}

- (id)description
{
  v3 = objc_opt_new();
  [v3 appendFormat:@"<NEKSourceAttributes (%p)\n", self];
  id v4 = [(NEKSourceAttributes *)self name];
  [v3 appendFormat:@"  name: %@\n", v4];

  v5 = [(NEKSourceAttributes *)self defaultAlarmOffset];
  [v3 appendFormat:@"  defaultAlarmOffset: %@\n", v5];

  [v3 appendFormat:@"  type: %d\n", -[NEKSourceAttributes type](self, "type")];
  [v3 appendFormat:@"  isEnabled: %d\n", -[NEKSourceAttributes isEnabled](self, "isEnabled")];
  [v3 appendFormat:@"  isFacebook: %d\n", -[NEKSourceAttributes isFacebook](self, "isFacebook")];
  [v3 appendFormat:@"  usesSelfAttendee: %d\n", -[NEKSourceAttributes usesSelfAttendee](self, "usesSelfAttendee")];
  id v6 = [(NEKSourceAttributes *)self constraintsDescriptionPath];
  [v3 appendFormat:@"  constraintsDescriptionPath: %@\n", v6];

  id v7 = [(NEKSourceAttributes *)self externalID];
  [v3 appendFormat:@"  externalID: %@\n", v7];

  id v8 = [(NEKSourceAttributes *)self externalModificationTag];
  [v3 appendFormat:@"  externalModificationTag: %@\n", v8];

  id v9 = [(NEKSourceAttributes *)self creatorBundleID];
  [v3 appendFormat:@"  creatorBundleID: %@\n", v9];

  id v10 = [(NEKSourceAttributes *)self creatorCodeSigningIdentity];
  [v3 appendFormat:@"  creatorCodeSigningIdentity: %@\n", v10];

  BOOL v11 = [(NEKSourceAttributes *)self accountPersistentID];
  [v3 appendFormat:@"  accountPersistentID: %@\n", v11];

  [v3 appendFormat:@"  supportsSharedCalendars: %d\n", -[NEKSourceAttributes supportsSharedCalendars](self, "supportsSharedCalendars")];
  [v3 appendFormat:@"  allowsTasks: %d\n", -[NEKSourceAttributes allowsTasks](self, "allowsTasks")];
  [v3 appendFormat:@"  allowsEvents: %d\n", -[NEKSourceAttributes allowsEvents](self, "allowsEvents")];
  [v3 appendFormat:@"  allowsCalendarAddModifyDelete: %d\n", -[NEKSourceAttributes allowsCalendarAddDeleteModify](self, "allowsCalendarAddDeleteModify")];
  [v3 appendFormat:@"  onlyCreatorCanModify: %d\n", -[NEKSourceAttributes onlyCreatorCanModify](self, "onlyCreatorCanModify")];
  [v3 appendFormat:@"  snoozeAlarmRequiresDetach: %d\n", -[NEKSourceAttributes snoozeAlarmRequiresDetach](self, "snoozeAlarmRequiresDetach")];
  [v3 appendFormat:@"  supportsAlarmAcknowledgedDate: %d\n", -[NEKSourceAttributes supportsAlarmAcknowledgedDate](self, "supportsAlarmAcknowledgedDate")];
  [v3 appendFormat:@"  isLocalStore: %d\n", -[NEKSourceAttributes isLocalStore](self, "isLocalStore")];
  [v3 appendFormat:@"  isBirthdayStore: %d\n", -[NEKSourceAttributes isBirthdayStore](self, "isBirthdayStore")];
  [v3 appendString:@">"];
  id v12 = [v3 copy];

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)defaultAlarmOffset
{
  return self->_defaultAlarmOffset;
}

- (void)setDefaultAlarmOffset:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isFacebook
{
  return self->_isFacebook;
}

- (void)setIsFacebook:(BOOL)a3
{
  self->_isFacebook = a3;
}

- (BOOL)usesSelfAttendee
{
  return self->_usesSelfAttendee;
}

- (void)setUsesSelfAttendee:(BOOL)a3
{
  self->_usesSelfAttendee = a3;
}

- (NSString)constraintsDescriptionPath
{
  return self->_constraintsDescriptionPath;
}

- (void)setConstraintsDescriptionPath:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)creatorBundleID
{
  return self->_creatorBundleID;
}

- (void)setCreatorBundleID:(id)a3
{
}

- (NSString)creatorCodeSigningIdentity
{
  return self->_creatorCodeSigningIdentity;
}

- (void)setCreatorCodeSigningIdentity:(id)a3
{
}

- (NSString)accountPersistentID
{
  return self->_accountPersistentID;
}

- (void)setAccountPersistentID:(id)a3
{
}

- (BOOL)supportsSharedCalendars
{
  return self->_supportsSharedCalendars;
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
  self->_supportsSharedCalendars = a3;
}

- (BOOL)allowsTasks
{
  return self->_allowsTasks;
}

- (void)setAllowsTasks:(BOOL)a3
{
  self->_allowsTasks = a3;
}

- (BOOL)allowsEvents
{
  return self->_allowsEvents;
}

- (void)setAllowsEvents:(BOOL)a3
{
  self->_allowsEvents = a3;
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return self->_allowsCalendarAddDeleteModify;
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
  self->_allowsCalendarAddDeleteModify = a3;
}

- (BOOL)onlyCreatorCanModify
{
  return self->_onlyCreatorCanModify;
}

- (void)setOnlyCreatorCanModify:(BOOL)a3
{
  self->_onlyCreatorCanModify = a3;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return self->_snoozeAlarmRequiresDetach;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  self->_snoozeAlarmRequiresDetach = a3;
}

- (BOOL)supportsAlarmAcknowledgedDate
{
  return self->_supportsAlarmAcknowledgedDate;
}

- (void)setSupportsAlarmAcknowledgedDate:(BOOL)a3
{
  self->_supportsAlarmAcknowledgedDate = a3;
}

- (BOOL)isLocalStore
{
  return self->_isLocalStore;
}

- (void)setIsLocalStore:(BOOL)a3
{
  self->_isLocalStore = a3;
}

- (BOOL)isBirthdayStore
{
  return self->_isBirthdayStore;
}

- (void)setIsBirthdayStore:(BOOL)a3
{
  self->_isBirthdayStore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountPersistentID, 0);
  objc_storeStrong((id *)&self->_creatorCodeSigningIdentity, 0);
  objc_storeStrong((id *)&self->_creatorBundleID, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_constraintsDescriptionPath, 0);
  objc_storeStrong((id *)&self->_defaultAlarmOffset, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end