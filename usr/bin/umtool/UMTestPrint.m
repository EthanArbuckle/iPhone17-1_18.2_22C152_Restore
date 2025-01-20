@interface UMTestPrint
+ (BOOL)printInfoForUMLUser:(id)a3 outError:(id *)a4;
+ (BOOL)printInfoForUser:(id)a3 outError:(id *)a4;
+ (BOOL)printInfoForUsers:(id)a3 outError:(id *)a4;
+ (BOOL)printPersonaAttributesInfo:(id)a3 outError:(id *)a4;
+ (BOOL)printPersonaInfo:(id)a3 outError:(id *)a4;
+ (BOOL)printSyncBubbleInfoForUser:(id)a3 outError:(id *)a4;
+ (BOOL)printSyncBubbleInfoForUsers:(id)a3 outError:(id *)a4;
+ (id)_dataSizeStringFromBytes:(unint64_t)a3;
+ (void)_printDivider;
+ (void)_printInfoForUser:(id)a3;
+ (void)_printSyncBubbleInfoForUser:(id)a3;
+ (void)printTable:(id)a3 withColumns:(id)a4 rows:(id)a5;
+ (void)println;
+ (void)println:(id)a3;
@end

@implementation UMTestPrint

+ (void)println
{
}

+ (void)println:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:v3 arguments:&v6];

  id v5 = v4;
  puts((const char *)[v5 UTF8String]);
}

+ (void)printTable:(id)a3 withColumns:(id)a4 rows:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  printf("%s:\n\n", (const char *)[a3 UTF8String]);
  if ([v8 count])
  {
    v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1000075A4;
    v77[3] = &unk_10000C2D0;
    id v47 = v7;
    id v10 = v7;
    id v78 = v10;
    v54 = [v8 sortedArrayUsingComparator:v77];

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
    v56 = v9;
    if (v11)
    {
      id v12 = v11;
      id v52 = *(id *)v74;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(id *)v74 != v52) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          id v15 = [v14 length];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v16 = v54;
          id v17 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v70;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v70 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)j) objectForKeyedSubscript:v14];
                id v22 = [v21 length];

                if (v22 > v15) {
                  id v15 = v22;
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v69 objects:v82 count:16];
            }
            while (v18);
          }

          v23 = +[NSNumber numberWithUnsignedInteger:v15];
          v9 = v56;
          [v56 setObject:v23 forKeyedSubscript:v14];

          printf("%-*s ", (int)v15, (const char *)[v14 UTF8String]);
        }
        id v12 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v12);
    }

    putchar(10);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v53 = obj;
    id v24 = [v53 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v66;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v66 != v26) {
            objc_enumerationMutation(v53);
          }
          uint64_t v28 = *(void *)(*((void *)&v65 + 1) + 8 * (void)k);
          v29 = [v9 objectForKeyedSubscript:v28];
          int v30 = [v29 intValue];

          if (v30 >= 1)
          {
            signed int v31 = 0;
            do
            {
              putchar(45);
              ++v31;
              v32 = [v9 objectForKeyedSubscript:v28];
              signed int v33 = [v32 intValue];
            }
            while (v31 < v33);
          }
          putchar(32);
        }
        id v25 = [v53 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v25);
    }

    putchar(10);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v48 = v54;
    id obja = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
    if (obja)
    {
      uint64_t v49 = *(void *)v62;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v62 != v49) {
            objc_enumerationMutation(v48);
          }
          uint64_t v55 = v34;
          v35 = *(void **)(*((void *)&v61 + 1) + 8 * v34);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v36 = v53;
          id v37 = [v36 countByEnumeratingWithState:&v57 objects:v79 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v58;
            do
            {
              for (m = 0; m != v38; m = (char *)m + 1)
              {
                if (*(void *)v58 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v57 + 1) + 8 * (void)m);
                uint64_t v42 = [v35 objectForKeyedSubscript:v41];
                if (v42) {
                  v43 = (__CFString *)v42;
                }
                else {
                  v43 = &stru_10000C850;
                }
                v44 = [v56 objectForKeyedSubscript:v41];
                unsigned int v45 = [v44 intValue];
                v46 = v43;
                printf("%-*s ", v45, (const char *)[(__CFString *)v46 UTF8String]);
              }
              id v38 = [v36 countByEnumeratingWithState:&v57 objects:v79 count:16];
            }
            while (v38);
          }

          putchar(10);
          uint64_t v34 = v55 + 1;
        }
        while ((id)(v55 + 1) != obja);
        id obja = [v48 countByEnumeratingWithState:&v61 objects:v80 count:16];
      }
      while (obja);
    }
    id v8 = v48;

    puts("\n");
    id v7 = v47;
  }
  else
  {
    puts("None\n\n");
  }
}

+ (void)_printDivider
{
}

+ (void)_printInfoForUser:(id)a3
{
  id v4 = a3;
  [a1 println:@"UID                        : %d" , [v4 uid]];
  [a1 println: @"GID                        : %d", [v4 gid]];
  id v5 = [v4 alternateDSID];
  [a1 println:@"Alternate DSID             : %@", v5];

  uint64_t v6 = [v4 homeDirectoryURL];
  [a1 println:@"Home Directory URL         : %@", v6];

  [a1 println];
  id v7 = [v4 username];
  [a1 println:@"Username                   : %@", v7];

  id v8 = [v4 givenName];
  [a1 println:@"Given Name                 : %@", v8];

  v9 = [v4 familyName];
  [a1 println:@"Family Name                : %@", v9];

  id v10 = [v4 displayName];
  [a1 println:@"Display Name               : %@", v10];

  id v11 = [v4 photoURL];
  [a1 println:@"Photo URL                  : %@", v11];

  id v12 = [v4 userAuxiliaryString];
  [a1 println:@"User AuxString             : %@", v12];

  [a1 println];
  v13 = [v4 creationDate];
  [a1 println:@"Creation Date              : %@", v13];

  v14 = [v4 lastLoginDate];
  [a1 println:@"Last Login Date            : %@", v14];

  id v15 = [v4 lastRemoteAuthDate];
  [a1 println:@"Last Remote Auth Date      : %@", v15];

  [a1 println];
  id v16 = [v4 firstLoginStartDate];
  [a1 println:@"FirstLogin Start Date       : %@", v16];

  id v17 = [v4 firstLoginEndDate];
  [a1 println:@"FirstLogin End Date         : %@", v17];

  id v18 = [v4 lastCachedLoginStartDate];
  [a1 println:@"CachedLogin Start Date      : %@", v18];

  uint64_t v19 = [v4 lastCachedLoginEndDate];
  [a1 println:@"CachedLogin End Date        : %@", v19];

  [a1 println];
  id v20 = [v4 userType];
  CFStringRef v21 = @"Permanent";
  if (v20) {
    CFStringRef v21 = 0;
  }
  if (v20 == (id)1) {
    CFStringRef v21 = @"Ephemeral";
  }
  [a1 println:@"User Type                  : %@", v21];
  id v22 = [v4 passcodeType];
  uint64_t v23 = 0;
  if ((unint64_t)v22 <= 3) {
    uint64_t v23 = (uint64_t)*(&off_10000C2F0 + (void)v22);
  }
  [a1 println:@"Passcode Type              : %@", v23];
  [a1 println];
  if ([v4 isLoginUser]) {
    CFStringRef v24 = @"true";
  }
  else {
    CFStringRef v24 = @"false";
  }
  [a1 println:@"Is Login User              : %@", v24];
  if ([v4 isAuditor]) {
    CFStringRef v25 = @"true";
  }
  else {
    CFStringRef v25 = @"false";
  }
  [a1 println:@"Is Auditor                 : %@", v25];
  if ([v4 isDisabled]) {
    CFStringRef v26 = @"true";
  }
  else {
    CFStringRef v26 = @"false";
  }
  [a1 println:@"Is Disabled                : %@", v26];
  if ([v4 isTransientUser]) {
    CFStringRef v27 = @"true";
  }
  else {
    CFStringRef v27 = @"false";
  }
  [a1 println:@"Is TransientUser           : %@", v27];
  if ([v4 isPrimaryUser]) {
    CFStringRef v28 = @"true";
  }
  else {
    CFStringRef v28 = @"false";
  }
  [a1 println:@"Is PrimaryUser              : %@", v28];
  if ([v4 isAdminUser]) {
    CFStringRef v29 = @"true";
  }
  else {
    CFStringRef v29 = @"false";
  }
  [a1 println:@"Is AdminUser               : %@", v29];
  [a1 println];
  [a1 println: @"Passcode Lock Grace Period : %lu", [v4 passcodeLockGracePeriod]];
  int v30 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  signed int v31 = [v4 languages];
  id v32 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v43;
    CFStringRef v35 = &stru_10000C850;
    do
    {
      id v36 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        [v30 appendFormat:@"%@%@", v35, *(void *)(*((void *)&v42 + 1) + 8 * (void)v36)];
        id v36 = (char *)v36 + 1;
        CFStringRef v35 = @", ";
      }
      while (v33 != v36);
      id v33 = [v31 countByEnumeratingWithState:&v42 objects:v46 count:16];
      CFStringRef v35 = @", ";
    }
    while (v33);
  }

  [a1 println:@"Languages                  : [%@]", v30];
  [a1 println];
  id v37 = [a1 _dataSizeStringFromBytes:[v4 dataQuota]];
  [a1 println:@"Data Quota                 : %@", v37];

  id v38 = [a1 _dataSizeStringFromBytes:[v4 dataUsed]];
  [a1 println:@"Data Used                  : %@", v38];

  [a1 println];
  unsigned int v39 = [v4 hasDataToSync];
  CFStringRef v40 = @"false";
  if (v39) {
    CFStringRef v40 = @"true";
  }
  [a1 println:@"Has Data to Sync           : %@", v40];
  [a1 println];
  uint64_t v41 = [v4 debugErrorCausingLogout];
  [a1 println:@"Error Causing Logout       : %@", v41];
}

+ (BOOL)printInfoForUser:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    unsigned __int8 v9 = [a1 printInfoForUsers:v8 outError:a4];
  }
  else
  {
    unsigned __int8 v9 = [a1 printInfoForUsers:&__NSArray0__struct outError:a4];
  }

  return v9;
}

+ (BOOL)printInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [a1 _printDivider:v16];
          [a1 println];
          [a1 _printInfoForUser:v13];
          [a1 println];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [a1 _printDivider];
    BOOL v14 = 1;
  }
  else if (a4)
  {
    +[UMTestError errorWithMessage:@"Nothing to print"];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)printInfoForUMLUser:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  +[UMTestPrint println:](UMTestPrint, "println:", @"UID                        : %d", [v5 uid]);
  +[UMTestPrint println:](UMTestPrint, "println:", @"GID                        : %d", [v5 gid]);
  id v6 = [v5 userUUID];
  +[UMTestPrint println:@"User UUID                  : %@", v6];

  id v7 = [v5 alternateDSID];

  if (v7)
  {
    id v8 = [v5 alternateDSID];
    +[UMTestPrint println:@"Alternate DSID                 : %@", v8];
  }
  +[UMTestPrint println];
  id v9 = [v5 userType];
  +[UMTestPrint println:@"UserType                   : %@", v9];

  id v10 = [v5 username];
  +[UMTestPrint println:@"Username                   : %@", v10];

  uint64_t v11 = [v5 firstName];
  +[UMTestPrint println:@"First Name                 : %@", v11];

  id v12 = [v5 lastName];
  +[UMTestPrint println:@"Last Name                  : %@", v12];

  uint64_t v13 = [v5 displayName];
  +[UMTestPrint println:@"Display Name               : %@", v13];

  BOOL v14 = [v5 fileInfoPath];

  if (v14)
  {
    id v15 = [v5 fileInfoPath];
    +[UMTestPrint println:@"FileInfo Path               : %@", v15];
  }
  long long v16 = [v5 libInfoPath];

  if (v16)
  {
    long long v17 = [v5 libInfoPath];
    +[UMTestPrint println:@"Libinfo Path               : %@", v17];
  }
  long long v18 = [v5 homeDirPath];

  if (v18)
  {
    long long v19 = [v5 homeDirPath];
    +[UMTestPrint println:@"HomeDir Path               : %@", v19];
  }
  id v20 = [v5 diskNode];

  if (v20)
  {
    CFStringRef v21 = [v5 diskNode];
    +[UMTestPrint println:@"Disk Node               : %@", v21];

    id v22 = [v5 volumeUUID];
    +[UMTestPrint println:@"Disk Vol UUID               : %@", v22];
  }
  [a1 println];
  uint64_t v23 = [v5 creationDate];
  +[UMTestPrint println:@"Creation Date              : %@", v23];

  +[UMTestPrint println];
  if ([v5 isLoginUser]) {
    CFStringRef v24 = @"true";
  }
  else {
    CFStringRef v24 = @"false";
  }
  [a1 println:@"Is Login User              : %@", v24];
  if ([v5 isAuditor]) {
    CFStringRef v25 = @"true";
  }
  else {
    CFStringRef v25 = @"false";
  }
  [a1 println:@"Is Auditor                 : %@", v25];
  if ([v5 isPrimaryUser]) {
    CFStringRef v26 = @"true";
  }
  else {
    CFStringRef v26 = @"false";
  }
  [a1 println:@"Is PrimaryUser             : %@", v26];
  if ([v5 isAdminUser]) {
    CFStringRef v27 = @"true";
  }
  else {
    CFStringRef v27 = @"false";
  }
  [a1 println:@"Is AdminUser               : %@", v27];
  [a1 println];
  if ([v5 gracePeriod]) {
    [a1 println:@"Passcode Lock Grace Period : %lu", (int)[v5 gracePeriod]];
  }

  return 1;
}

+ (BOOL)printPersonaInfo:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 userPersonaUniqueString];

  if (v5)
  {
    id v6 = [v4 userPersonaUniqueString];
    +[UMTestPrint println:@"Persona identifier: %@", v6];
  }
  id v7 = [v4 userPersonaNickName];

  if (v7)
  {
    id v8 = [v4 userPersonaNickName];
    +[UMTestPrint println:@"Persona NickName: %@", v8];
  }
  id v9 = [v4 userPersonaType];
  CFStringRef v10 = @"Persona Type: Personal";
  switch((unint64_t)v9)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      CFStringRef v10 = @"Persona Type: Managed";
      goto LABEL_14;
    case 2uLL:
      CFStringRef v10 = @"Persona Type: Enterprise";
      goto LABEL_14;
    case 3uLL:
      CFStringRef v10 = @"Persona Type: System";
      goto LABEL_14;
    case 4uLL:
      CFStringRef v10 = @"Persona Type: Universal";
      goto LABEL_14;
    case 5uLL:
      CFStringRef v10 = @"Persona Type: Default";
      goto LABEL_14;
    case 6uLL:
      CFStringRef v10 = @"Persona Type: Guest";
      goto LABEL_14;
    default:
      if (v9 != (id)1000) {
        goto LABEL_15;
      }
      CFStringRef v10 = @"Persona Type: Invalid";
LABEL_14:
      +[UMTestPrint println:v10];
LABEL_15:

      return 1;
  }
}

+ (BOOL)printPersonaAttributesInfo:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  +[UMTestPrint println:@"************************************************************"];
  id v5 = [v4 userPersonaUniqueString];

  if (v5)
  {
    id v6 = [v4 userPersonaUniqueString];
    +[UMTestPrint println:@"Persona identifier: %@", v6];
  }
  else
  {
    +[UMTestPrint println:@"Persona identifier: NONE"];
  }
  id v7 = [v4 userPersonaType];
  CFStringRef v8 = @"Persona Type: Personal";
  switch((unint64_t)v7)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      CFStringRef v8 = @"Persona Type: Managed";
      goto LABEL_12;
    case 2uLL:
      CFStringRef v8 = @"Persona Type: Enterprise";
      goto LABEL_12;
    case 3uLL:
      CFStringRef v8 = @"Persona Type: System";
      goto LABEL_12;
    case 4uLL:
      CFStringRef v8 = @"Persona Type: Universal";
      goto LABEL_12;
    case 5uLL:
      CFStringRef v8 = @"Persona Type: Default";
      goto LABEL_12;
    default:
      if (v7 != (id)1000) {
        goto LABEL_13;
      }
      CFStringRef v8 = @"Persona Type: Invalid";
LABEL_12:
      +[UMTestPrint println:v8];
LABEL_13:
      if (objc_msgSend(v4, "userPersona_id")) {
        +[UMTestPrint println:](UMTestPrint, @"Kernel Persona ID is: %d", [v4 userPersona_id]);
      }
      id v9 = [v4 personaLayoutPathURL];

      if (v9)
      {
        CFStringRef v10 = [v4 personaLayoutPathURL];
        +[UMTestPrint println:@"Persona Volume Path is: %@", v10];
      }
      if ([v4 isEnterprisePersona]) {
        +[UMTestPrint println:@"isEnterprisePersona:true"];
      }
      if ([v4 isDataSeparatedPersona]) {
        +[UMTestPrint println:@"isDataSeparatedPersona:true"];
      }
      if ([v4 isPersonalPersona]) {
        +[UMTestPrint println:@"isPersonalPersona:true"];
      }
      if ([v4 isUniversalPersona]) {
        +[UMTestPrint println:@"isUniversalPersona:true"];
      }
      if ([v4 isSystemPersona]) {
        +[UMTestPrint println:@"isSystemPersona:true"];
      }
      if ([v4 isDefaultPersona]) {
        +[UMTestPrint println:@"isDefaultPersona:true"];
      }
      if ([v4 isDisabled]) {
        +[UMTestPrint println:@"isDisabled:true"];
      }
      uint64_t v11 = [v4 userPersonaDisplayName];

      if (v11)
      {
        id v12 = [v4 userPersonaDisplayName];
        +[UMTestPrint println:@"Persona Display String: %@", v12];
      }
      uint64_t v13 = [v4 userPersonaBundleIDList];

      if (v13)
      {
        BOOL v14 = [v4 userPersonaBundleIDList];
        +[UMTestPrint println:@"Persona Associated BundleIDs are: %@", v14];
      }
      +[UMTestPrint println:@"************************************************************"];

      return 1;
  }
}

+ (void)_printSyncBubbleInfoForUser:(id)a3
{
  id v4 = a3;
  [a1 println: @"UID           : %d", [v4 uid]];
  id v5 = [v4 username];
  [a1 println:@"Username      : %@", v5];

  [a1 println];
  [a1 println:@"Mach Services :"];
  [a1 println];
  id v6 = +[UMMobileKeyBag syncBubbleMachServiceNamesForUser:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [a1 println:@"\t%@", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (BOOL)printSyncBubbleInfoForUser:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    unsigned __int8 v9 = [a1 printSyncBubbleInfoForUsers:v8 outError:a4];
  }
  else
  {
    unsigned __int8 v9 = [a1 printSyncBubbleInfoForUsers:&__NSArray0__struct outError:a4];
  }

  return v9;
}

+ (BOOL)printSyncBubbleInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [a1 _printDivider:v16];
          [a1 println];
          [a1 _printSyncBubbleInfoForUser:v13];
          [a1 println];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [a1 _printDivider];
    BOOL v14 = 1;
  }
  else if (a4)
  {
    +[UMTestError errorWithMessage:@"Nothing to print"];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)_dataSizeStringFromBytes:(unint64_t)a3
{
  double v5 = (double)a3;
  double v6 = (double)a3 * 0.0009765625;
  if (v6 <= 1.0)
  {
    CFStringRef v8 = @"bytes";
  }
  else
  {
    double v5 = v6 * 0.0009765625;
    if (v6 * 0.0009765625 <= 1.0)
    {
      CFStringRef v8 = @"KB";
      double v5 = (double)a3 * 0.0009765625;
    }
    else
    {
      BOOL v7 = v5 * 0.0009765625 <= 1.0;
      if (v5 * 0.0009765625 > 1.0) {
        double v5 = v5 * 0.0009765625;
      }
      CFStringRef v8 = @"MB";
      if (!v7) {
        CFStringRef v8 = @"GB";
      }
    }
  }
  return +[NSString stringWithFormat:@"%f %@", *(void *)&v5, v8, v3, v4];
}

@end