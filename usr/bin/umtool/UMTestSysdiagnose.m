@interface UMTestSysdiagnose
+ (BOOL)executeWithOutError:(id *)a3;
+ (id)description;
+ (id)examples;
+ (id)name;
+ (id)stringForUserType:(unint64_t)a3;
@end

@implementation UMTestSysdiagnose

+ (id)name
{
  return @"sysdiagnose";
}

+ (id)description
{
  return @"Dump sysdiagnose information";
}

+ (id)examples
{
  return &off_10000D830;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  uint32_t multiuser_flags = 0;
  mach_port_t v3 = mach_host_self();
  uint64_t multiuser_config_flags = host_get_multiuser_config_flags(v3, &multiuser_flags);
  if (multiuser_config_flags)
  {
    +[UMTestPrint println:@"Failed to get host config: %d\n", multiuser_config_flags];
  }
  else
  {
    +[UMTestPrint println:@"Host Config: 0x%08x", multiuser_flags];
    +[UMTestPrint println:@"Foreground UID: %u", multiuser_flags & 0x3FFFFFFF];
    if ((multiuser_flags & 0x80000000) != 0) {
      v5 = "Y";
    }
    else {
      v5 = "N";
    }
    +[UMTestPrint println:@"Shared iPad: %s", v5];
    if ((multiuser_flags & 0x40000000) != 0) {
      v6 = "Y";
    }
    else {
      v6 = "N";
    }
    +[UMTestPrint println:@"Secondary Users: %s", v6];
    +[UMTestPrint println:&stru_10000C850];
  }
  v7 = +[UMUserManager sharedManager];
  v8 = [v7 allUsersUnfiltered];

  v70 = +[NSMutableArray array];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v8;
  v71 = (__CFString *)[obj countByEnumeratingWithState:&v96 objects:v118 count:16];
  if (v71)
  {
    v68 = *(__CFString **)v97;
    do
    {
      for (i = 0; i != v71; i = (__CFString *)((char *)i + 1))
      {
        if (*(__CFString **)v97 != v68) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        v116[0] = @"UID";
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", [v10 uid]);
        v117[0] = v11;
        v116[1] = @"UUID";
        v12 = [v10 alternateDSID];
        if (v12)
        {
          v76 = [v10 alternateDSID];
          CFStringRef v13 = v76;
        }
        else
        {
          CFStringRef v13 = &stru_10000C850;
        }
        v117[1] = v13;
        v116[2] = @"GID";
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", [v10 gid]);
        v117[2] = v14;
        v116[3] = @"Type";
        v15 = [a1 stringForUserType:[v10 userType]];
        v117[3] = v15;
        v117[4] = @"(private)";
        v116[4] = @"Username";
        v116[5] = @"Display Name";
        v117[5] = @"(private)";
        v116[6] = @"Home Directory";
        v16 = [v10 homeDirectoryURL];
        if (v16)
        {
          v74 = [v10 homeDirectoryURL];
          v73 = [(__CFString *)v74 path];
          CFStringRef v17 = v73;
        }
        else
        {
          CFStringRef v17 = &stru_10000C850;
        }
        v117[6] = v17;
        v18 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:7];
        v19 = +[NSMutableDictionary dictionaryWithDictionary:v18];

        if (v16)
        {
        }
        if (v12) {

        }
        [(__CFString *)v70 addObject:v19];
        if (os_variant_has_internal_diagnostics())
        {
          v20 = [v10 username];
          if (v20)
          {
            v21 = [v10 username];
            [v19 setObject:v21 forKeyedSubscript:@"Username"];
          }
          else
          {
            [v19 setObject:&stru_10000C850 forKeyedSubscript:@"Username"];
          }

          v22 = [v10 displayName];
          if (v22)
          {
            v23 = [v10 displayName];
            [v19 setObject:v23 forKeyedSubscript:@"Display Name"];
          }
          else
          {
            [v19 setObject:&stru_10000C850 forKeyedSubscript:@"Display Name"];
          }
        }
      }
      v71 = (__CFString *)[obj countByEnumeratingWithState:&v96 objects:v118 count:16];
    }
    while (v71);
  }

  +[UMTestPrint printTable:@"Users" withColumns:&off_10000D848 rows:v70];
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = sub_100006DE8;
  v94 = sub_100006DF8;
  id v95 = 0;
  dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
  v25 = +[UMUserManager sharedManager];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100006E00;
  v87[3] = &unk_10000C2A8;
  v89 = &v90;
  dispatch_semaphore_t dsema = v24;
  dispatch_semaphore_t v88 = dsema;
  [v25 fetchAllPersonasForAllUsersWithCompletionHandler:v87];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v65 = +[NSMutableArray array];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v61 = (id)v91[5];
  id v26 = [v61 countByEnumeratingWithState:&v83 objects:v115 count:16];
  if (v26)
  {
    uint64_t v64 = *(void *)v84;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v84 != v64) {
          objc_enumerationMutation(v61);
        }
        v27 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
        v113[0] = @"User UUID";
        v28 = [v27 objectForKeyedSubscript:@"UserPersonaUserODUUID"];
        if (v28)
        {
          v74 = [v27 objectForKeyedSubscript:@"UserPersonaUserODUUID"];
          CFStringRef v29 = v74;
        }
        else
        {
          CFStringRef v29 = &stru_10000C850;
        }
        v114[0] = v29;
        v113[1] = @"Type";
        v30 = [v27 objectForKeyedSubscript:@"UserPersonaType"];
        if (v30)
        {
          v73 = [v27 objectForKeyedSubscript:@"UserPersonaType"];
          v71 = +[NSString stringWithFormat:@"%@", v73];
          CFStringRef v31 = v71;
        }
        else
        {
          CFStringRef v31 = &stru_10000C850;
        }
        v114[1] = v31;
        v113[2] = @"UUID";
        v32 = [v27 objectForKeyedSubscript:@"UserPersonaUniqueString"];
        if (v32)
        {
          v70 = [v27 objectForKeyedSubscript:@"UserPersonaUniqueString"];
          CFStringRef v33 = v70;
        }
        else
        {
          CFStringRef v33 = &stru_10000C850;
        }
        v114[2] = v33;
        v113[3] = @"ID";
        v34 = [v27 objectForKeyedSubscript:@"UserPersonaID"];
        if (v34)
        {
          a1 = [v27 objectForKeyedSubscript:@"UserPersonaID"];
          v68 = +[NSString stringWithFormat:@"%@", a1];
          CFStringRef v35 = v68;
        }
        else
        {
          CFStringRef v35 = &stru_10000C850;
        }
        v114[3] = v35;
        v114[4] = @"(private)";
        v113[4] = @"Nickname";
        v113[5] = @"Volume UUID";
        v36 = [v27 objectForKeyedSubscript:@"MKBUserSessionVolumeUUID"];
        if (v36)
        {
          v67 = [v27 objectForKeyedSubscript:@"MKBUserSessionVolumeUUID"];
          CFStringRef v37 = v67;
        }
        else
        {
          CFStringRef v37 = &stru_10000C850;
        }
        v114[5] = v37;
        v113[6] = @"Home Dir";
        v38 = [v27 objectForKeyedSubscript:@"MKBUserSessionHomeDir"];
        if (v38)
        {
          v66 = [v27 objectForKeyedSubscript:@"MKBUserSessionHomeDir"];
          CFStringRef v39 = v66;
        }
        else
        {
          CFStringRef v39 = &stru_10000C850;
        }
        v114[6] = v39;
        v40 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:7];
        v41 = +[NSMutableDictionary dictionaryWithDictionary:v40];

        if (v38) {
        if (v36)
        }

        if (v34)
        {
        }
        if (v32) {

        }
        if (v30)
        {
        }
        if (v28) {

        }
        [v65 addObject:v41];
        if (os_variant_has_internal_diagnostics())
        {
          v42 = [v27 objectForKeyedSubscript:@"UserPersonaNickName"];
          if (v42)
          {
            v63 = [v27 objectForKeyedSubscript:@"UserPersonaNickName"];
            CFStringRef v43 = v63;
          }
          else
          {
            CFStringRef v43 = &stru_10000C850;
          }
          [v41 setObject:v43 forKeyedSubscript:@"Nickname"];
          if (v42) {
        }
          }
      }
      id v26 = [v61 countByEnumeratingWithState:&v83 objects:v115 count:16];
    }
    while (v26);
  }

  +[UMTestPrint printTable:@"Personas" withColumns:&off_10000D860 rows:v65];
  v44 = +[NSMutableArray array];
  for (int k = 1; k != 8; ++k)
  {
    v101[0] = 0;
    if ((kpersona_find_by_type() & 0x80000000) == 0)
    {
      v46 = (unsigned int *)malloc_type_malloc(4 * v101[0], 0x100004052888210uLL);
      if ((kpersona_find_by_type() & 0x80000000) == 0 && v101[0])
      {
        unint64_t v47 = 0;
        do
        {
          v48 = +[NSNumber numberWithUnsignedInt:v46[v47]];
          [v44 addObject:v48];

          ++v47;
        }
        while (v101[0] > v47);
      }
      free(v46);
    }
  }
  v75 = +[NSMutableArray array];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v72 = v44;
  id v49 = [v72 countByEnumeratingWithState:&v79 objects:v112 count:16];
  if (v49)
  {
    uint64_t v78 = *(void *)v80;
    do
    {
      for (m = 0; m != v49; m = (char *)m + 1)
      {
        if (*(void *)v80 != v78) {
          objc_enumerationMutation(v72);
        }
        v51 = *(void **)(*((void *)&v79 + 1) + 8 * (void)m);
        uint64_t v111 = 0;
        memset(v110, 0, sizeof(v110));
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v105 = 0u;
        int v104 = 2;
        [v51 unsignedIntValue];
        if ((kpersona_info() & 0x80000000) == 0)
        {
          if (HIDWORD(v111) == -101)
          {
            v52 = @"-101";
          }
          else if (HIDWORD(v111) == -1)
          {
            v52 = @"-1";
          }
          else
          {
            v52 = +[NSString stringWithFormat:@"%u", HIDWORD(v111)];
          }
          v103[0] = v52;
          v102[0] = @"UID";
          v102[1] = @"ID";
          v53 = +[NSString stringWithFormat:@"%u", v105];
          v103[1] = v53;
          v102[2] = @"Type";
          v54 = +[NSString stringWithFormat:@"%u", DWORD1(v105)];
          v103[2] = v54;
          v102[3] = @"Name";
          v55 = +[NSString stringWithUTF8String:&v110[4]];
          v103[3] = v55;
          v56 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:4];
          v57 = +[NSMutableDictionary dictionaryWithDictionary:v56];

          [v75 addObject:v57];
          bzero(v101, 0x400uLL);
          [v51 unsignedIntValue];
          if (!kpersona_getpath())
          {
            v58 = +[NSString stringWithUTF8String:v101];
            [v57 setObject:v58 forKeyedSubscript:@"Path"];
          }
        }
      }
      id v49 = [v72 countByEnumeratingWithState:&v79 objects:v112 count:16];
    }
    while (v49);
  }

  +[UMTestPrint printTable:@"Kernel Personas" withColumns:&off_10000D878 rows:v75];
  _Block_object_dispose(&v90, 8);

  return 1;
}

+ (id)stringForUserType:(unint64_t)a3
{
  if (a3 == 1) {
    return @"E";
  }
  else {
    return @"P";
  }
}

@end