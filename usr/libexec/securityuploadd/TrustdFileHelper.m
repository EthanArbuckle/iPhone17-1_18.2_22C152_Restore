@interface TrustdFileHelper
- (BOOL)allowTrustdToReadFilesForMigration:(id *)a3;
- (BOOL)changeOwnerOfValidFile:(id)a3 error:(id *)a4;
- (BOOL)changePermissionsOfKeychainDirectoryFile:(id)a3 error:(id *)a4;
- (BOOL)fixTrustSettingsPermissions:(id *)a3;
- (BOOL)fixValidPermissions:(id *)a3;
- (void)allowTrustdToWriteAnalyticsFiles;
- (void)deleteOldFiles;
- (void)deleteSupplementalsAssetsDir;
- (void)deleteSystemDbFiles:(__CFString *)a3;
- (void)fixFiles:(id)a3;
@end

@implementation TrustdFileHelper

- (void)fixFiles:(id)a3
{
  v4 = (void (**)(id, BOOL, id))a3;
  [(TrustdFileHelper *)self deleteOldFiles];
  [(TrustdFileHelper *)self allowTrustdToWriteAnalyticsFiles];
  id v9 = 0;
  BOOL v5 = [(TrustdFileHelper *)self allowTrustdToReadFilesForMigration:&v9];
  id v6 = v9;
  if (!v5)
  {
    v7 = sub_1000106A0("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "failed to change permissions so trustd can read files for migration", v8, 2u);
    }
  }
  v4[2](v4, v5, v6);
}

- (void)deleteOldFiles
{
  [(TrustdFileHelper *)self deleteSystemDbFiles:@"crls/valid.sqlite3"];
  CFURLRef v3 = sub_1000107C0(@"Library/Keychains", @"crls");
  sub_1000108AC(v3, (uint64_t)&stru_100018B88);
  [(TrustdFileHelper *)self deleteSystemDbFiles:@"pinningrules.sqlite3"];
  [(TrustdFileHelper *)self deleteSupplementalsAssetsDir];
  sub_100010950(@"caissuercache.sqlite3", (uint64_t)&stru_100018BA8);
  [(TrustdFileHelper *)self deleteSystemDbFiles:@"ocspcache.sqlite3"];

  sub_100010950(@"PriorMitmRoots.plist", (uint64_t)&stru_100018BC8);
}

- (void)deleteSupplementalsAssetsDir
{
  CFURLRef v2 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets/OTAPKIContext.plist");
  sub_1000108AC(v2, (uint64_t)&stru_100018AC8);
  CFURLRef v3 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets/TrustedCTLogs.plist");
  sub_1000108AC(v3, (uint64_t)&stru_100018AE8);
  CFURLRef v4 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets/TrustedCTLogs_nonTLS.plist");
  sub_1000108AC(v4, (uint64_t)&stru_100018B08);
  CFURLRef v5 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets/AnalyticsSamplingRates.plist");
  sub_1000108AC(v5, (uint64_t)&stru_100018B28);
  CFURLRef v6 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets/AppleCertificateAuthorities.plist");
  sub_1000108AC(v6, (uint64_t)&stru_100018B48);
  CFURLRef v7 = sub_1000107C0(@"Library/Keychains", @"SupplementalsAssets");

  sub_1000108AC(v7, (uint64_t)&stru_100018B68);
}

- (void)deleteSystemDbFiles:(__CFString *)a3
{
  CFURLRef v4 = sub_1000107C0(@"Library/Keychains", (uint64_t)a3);
  sub_1000108AC(v4, (uint64_t)&stru_100018A48);
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"%@-shm", a3);
  CFURLRef v6 = sub_1000107C0(@"Library/Keychains", (uint64_t)v5);
  sub_1000108AC(v6, (uint64_t)&stru_100018A68);
  if (v5) {
    CFRelease(v5);
  }
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@-wal", a3);
  CFURLRef v8 = sub_1000107C0(@"Library/Keychains", (uint64_t)v7);
  sub_1000108AC(v8, (uint64_t)&stru_100018A88);
  if (v7) {
    CFRelease(v7);
  }
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%@-journal", a3);
  CFURLRef v10 = sub_1000107C0(@"Library/Keychains", (uint64_t)v9);
  sub_1000108AC(v10, (uint64_t)&stru_100018AA8);
  if (v9)
  {
    CFRelease(v9);
  }
}

- (void)allowTrustdToWriteAnalyticsFiles
{
}

- (BOOL)allowTrustdToReadFilesForMigration:(id *)a3
{
  unsigned __int8 v5 = [(TrustdFileHelper *)self changePermissionsOfKeychainDirectoryFile:@"TrustStore.sqlite3" error:a3];
  unsigned __int8 v6 = [(TrustdFileHelper *)self changePermissionsOfKeychainDirectoryFile:@"com.apple.security.exception_reset_counter.plist" error:a3];
  unsigned __int8 v7 = [(TrustdFileHelper *)self changePermissionsOfKeychainDirectoryFile:@"CTExceptions.plist" error:a3];
  unsigned __int8 v8 = [(TrustdFileHelper *)self changePermissionsOfKeychainDirectoryFile:@"CARevocation.plist" error:a3];
  return [(TrustdFileHelper *)self changePermissionsOfKeychainDirectoryFile:@"TransparentConnectionPins.plist" error:a3] & v8 & v7 & v6 & v5;
}

- (BOOL)changePermissionsOfKeychainDirectoryFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  CFURLRef v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10000F35C;
  v13 = sub_10000F36C;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F374;
  v8[3] = &unk_1000189C8;
  v8[4] = &v9;
  v8[5] = &v15;
  sub_100010950((uint64_t)v5, (uint64_t)v8);
  if (a4 && !*a4) {
    *a4 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (BOOL)fixTrustSettingsPermissions:(id *)a3
{
  CFURLRef v4 = +[NSFileManager defaultManager];
  char v5 = 1;
  char v6 = +[NSURL fileURLWithPath:@"/Library/Security/Trust Settings" isDirectory:1];
  unsigned __int8 v7 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:");
  unsigned __int8 v8 = [v4 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:0 errorHandler:&stru_100018A08];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    v27 = a3;
    v28 = v7;
    v29 = v6;
    v30 = v4;
    id v11 = 0;
    uint64_t v12 = *(void *)v35;
    char v5 = 1;
    v31 = v8;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v32 = 0;
        id v33 = 0;
        unsigned int v15 = [v14 getResourceValue:&v33 forKey:NSURLIsDirectoryKey error:&v32];
        id v16 = v33;
        id v17 = v32;

        if (v15
          && ([v16 BOOLValue] & 1) == 0
          && ([v14 pathExtension],
              char v18 = objc_claimAutoreleasedReturnValue(),
              unsigned int v19 = [v18 isEqualToString:@"plist"],
              v18,
              v19)
          && (v20 = (const char *)[v14 fileSystemRepresentation],
              chmod(v20, 0x1A4u)))
        {
          int v21 = *__error();
          NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
          v22 = +[NSString localizedStringWithFormat:@"failed to change permissions of %s: %s", v20, strerror(v21)];
          v43 = v22;
          v23 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v21 userInfo:v23];

          v24 = sub_1000106A0("SecError");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = strerror(v21);
            *(_DWORD *)buf = 136315394;
            v39 = v20;
            __int16 v40 = 2080;
            v41 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
          }

          char v5 = 0;
          unsigned __int8 v8 = v31;
        }
        else
        {
          id v11 = v17;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v10);
    if ((v27 == 0) | v5 & 1)
    {
      char v6 = v29;
      CFURLRef v4 = v30;
      unsigned __int8 v7 = v28;
    }
    else
    {
      char v6 = v29;
      CFURLRef v4 = v30;
      unsigned __int8 v7 = v28;
      if (*v27)
      {
        char v5 = 0;
      }
      else
      {
        id v11 = v11;
        char v5 = 0;
        id *v27 = v11;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v5 & 1;
}

- (BOOL)fixValidPermissions:(id *)a3
{
  if (![(TrustdFileHelper *)self changeOwnerOfValidFile:@"valid.sqlite3" error:a3])goto LABEL_5; {
  char v5 = +[NSString stringWithFormat:@"%@-shm", @"valid.sqlite3"];
  }
  unsigned int v6 = [(TrustdFileHelper *)self changeOwnerOfValidFile:v5 error:a3];

  if (!v6) {
    goto LABEL_5;
  }
  unsigned __int8 v7 = +[NSString stringWithFormat:@"%@-wal", @"valid.sqlite3"];
  unsigned int v8 = [(TrustdFileHelper *)self changeOwnerOfValidFile:v7 error:a3];

  if (v8)
  {
    id v9 = +[NSString stringWithFormat:@"%@-journal", @"valid.sqlite3"];
    unsigned __int8 v10 = [(TrustdFileHelper *)self changeOwnerOfValidFile:v9 error:a3];
  }
  else
  {
LABEL_5:
    unsigned __int8 v10 = 0;
  }
  return [(TrustdFileHelper *)self changeOwnerOfValidFile:@".valid_replace" error:a3] & v10;
}

- (BOOL)changeOwnerOfValidFile:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000F35C;
  id v17 = sub_10000F36C;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000FD10;
  v12[3] = &unk_1000189C8;
  v12[4] = &v13;
  v12[5] = &v19;
  unsigned int v6 = v12;
  if (qword_10001DBC0 != -1)
  {
    dispatch_once(&qword_10001DBC0, &stru_100018C28);
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    unsigned __int8 v7 = @"trustd/";
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  unsigned __int8 v7 = +[NSString stringWithFormat:@"trustd/%@", v5];
LABEL_6:
  CFURLRef v8 = sub_1000107C0(@"private/var/protected/", (uint64_t)v7);

  sub_1000108AC(v8, (uint64_t)v6);
  int v9 = *((unsigned __int8 *)v20 + 24);
  if (a4 && !*((unsigned char *)v20 + 24))
  {
    if (*a4)
    {
      int v9 = 0;
    }
    else
    {
      *a4 = (id) v14[5];
      int v9 = *((unsigned __int8 *)v20 + 24);
    }
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

@end