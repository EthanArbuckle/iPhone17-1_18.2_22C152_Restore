@interface BRCTLDiagnoseCommand
- (BOOL)_collectFilesAtPath:(id)a3 dstPath:(id)a4;
- (BOOL)_collectFilesWithPredicate:(id)a3 srcPath:(id)a4 dstPath:(id)a5;
- (BOOL)_execTask:(id)a3 withLabel:(id)a4;
- (BOOL)_isNoSuchFileError:(id)a3;
- (BOOL)_moveContentsOfDirSrcDist:(id)a3 dstDir:(id)a4;
- (BOOL)_moveMobileLogs;
- (BOOL)_moveSecuredDiagnoseDirToTargetPath:(id)a3 targetPath:(id)a4;
- (BOOL)_removeDirectoryIfNecessaryAtPath:(id)a3;
- (BOOL)_tar_c:(id)a3 withContentsOfDirectory:(id)a4 error:(id *)a5;
- (BRCTLDiagnoseCommand)init;
- (id)_createSecureDiagnoseDirectory;
- (id)_diagnoseParentPath;
- (id)_generateDiagnoseDirectoryNameWithDeviceName:(id)a3;
- (id)_generateHelperDiagnoseDirName;
- (id)_prepareTargetDiagnoseDirPath:(id)a3;
- (id)appSupportPathForPersona:(id)a3;
- (id)cloudDocsLogPath;
- (id)cloudKitLogPath;
- (id)containersPathForPersona:(id)a3;
- (id)coreSpotlightLogPath;
- (id)crashLogsPaths;
- (id)deviceName;
- (id)libraryPathForPersona:(id)a3;
- (void)_collectCrashesAndSpinsAtPath:(id)a3 processes:(id)a4;
- (void)_collectDefaultsAtPath:(id)a3;
- (void)_collectDefaultsAtPathForDomain:(id)a3 path:(id)a4;
- (void)_collectFileCoordinationDumpAtPath:(id)a3;
- (void)_collectLogs:(id)a3 diagnosePath:(id)a4;
- (void)_collectMobileDocumentsAtPath:(id)a3 containerID:(id)a4;
- (void)_listFoldersUnderPath:(id)a3 withOutPath:(id)a4 listAsPlainFile:(BOOL)a5 label:(id)a6;
- (void)_listSyncedFoldersWithDiagnosePath:(id)a3;
- (void)_postOrderChmodWithPath:(id)a3;
- (void)_printActionEnd;
- (void)_printActionFailed;
- (void)_printActionFailedWithError:(id)a3;
- (void)_printActionStartWithLabel:(id)a3;
- (void)_sampleTaskAtPath:(id)a3 cmd:(id)a4 process:(id)a5 pid:(int)a6;
- (void)_truncateFileForiOSSysdiagnose:(id)a3;
- (void)diagnoseWithPath:(id)a3;
- (void)parseOption:(int)a3 arg:(const char *)a4;
- (void)prepareDiagnose;
@end

@implementation BRCTLDiagnoseCommand

- (BRCTLDiagnoseCommand)init
{
  v20.receiver = self;
  v20.super_class = (Class)BRCTLDiagnoseCommand;
  v2 = [(BRCTLDiagnoseCommand *)&v20 init];
  if (v2)
  {
    v3 = +[NSProcessInfo processInfo];
    v4 = [v3 environment];

    v5 = [v4 objectForKeyedSubscript:@"SUDO_USER"];
    v2->_sudoed = v5 != 0;

    v2->_rootUser = geteuid() == 0;
    v2->_shouldCollectEnterpriseData = 0;
    uint64_t v6 = +[BRAccountDescriptor allLoggedInAccountDescriptors];
    allAccounts = v2->_allAccounts;
    v2->_allAccounts = (NSArray *)v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = v2->_allAccounts;
    v9 = (char *)[(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = v2;
          id v15 = v4;
          BRPerformWithAccountDescriptor();
        }
        v10 = (char *)[(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
  return v2;
}

- (id)libraryPathForPersona:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_libraryPath objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_libraryPath objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = [(NSMutableDictionary *)self->_homePath objectForKeyedSubscript:v4];

    if (v7)
    {
      v8 = [(NSMutableDictionary *)self->_homePath objectForKeyedSubscript:v4];
      uint64_t v6 = [v8 stringByAppendingPathComponent:@"Library"];

      [(NSMutableDictionary *)self->_libraryPath setObject:v6 forKey:v4];
    }
    else
    {
      uint64_t v6 = @"/var/mobile/Library";
    }
  }

  return v6;
}

- (id)cloudDocsLogPath
{
  cloudDocsLogPath = self->_cloudDocsLogPath;
  if (!cloudDocsLogPath)
  {
    BRLogsAbsolutePath();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cloudDocsLogPath;
    self->_cloudDocsLogPath = v4;

    cloudDocsLogPath = self->_cloudDocsLogPath;
  }
  uint64_t v6 = cloudDocsLogPath;

  return v6;
}

- (id)cloudKitLogPath
{
  cloudKitLogPath = self->_cloudKitLogPath;
  if (!cloudKitLogPath)
  {
    id v4 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
    v5 = [v4 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs/com.apple.cloudkit"];
    uint64_t v6 = self->_cloudKitLogPath;
    self->_cloudKitLogPath = v5;

    cloudKitLogPath = self->_cloudKitLogPath;
  }
  v7 = cloudKitLogPath;

  return v7;
}

- (id)coreSpotlightLogPath
{
  return @"Logs/CrashReporter/DiagnosticLogs/com.apple.corespotlight.asl" br_pathRelativeToDirectory:5;
}

- (id)appSupportPathForPersona:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_appSupportPath objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_appSupportPath objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = [(NSMutableDictionary *)self->_libraryPath objectForKeyedSubscript:v4];
    uint64_t v6 = [v7 stringByAppendingPathComponent:@"Application Support"];

    [(NSMutableDictionary *)self->_appSupportPath setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)containersPathForPersona:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_containersPath objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_containersPath objectForKeyedSubscript:v4];
  }
  else
  {
    v7 = [(NSMutableDictionary *)self->_libraryPath objectForKeyedSubscript:v4];
    uint64_t v6 = [v7 stringByAppendingPathComponent:BRUbiquitousContainersRootFolderName];

    [(NSMutableDictionary *)self->_containersPath setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)crashLogsPaths
{
  v2 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
  v3 = [v2 stringByAppendingPathComponent:@"Logs/CrashReporter"];
  v6[0] = v3;
  v6[1] = @"/Library/Logs/CrashReporter";
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (id)deviceName
{
  deviceName = self->_deviceName;
  if (!deviceName)
  {
    id v4 = (NSString *)MGCopyAnswer();
    v5 = self->_deviceName;
    self->_deviceName = v4;

    uint64_t v6 = self->_deviceName;
    if (!v6)
    {
      memset(v13, 0, 255);
      if (gethostname((char *)v13, 0xFFuLL))
      {
        v7 = @"local";
      }
      else
      {
        v7 = +[NSString stringWithCString:v13 encoding:4];
      }
      v8 = self->_deviceName;
      self->_deviceName = &v7->isa;

      uint64_t v6 = self->_deviceName;
    }
    v9 = +[BRTask sanitizeStringForFilename:v6];
    v10 = self->_deviceName;
    self->_deviceName = v9;

    deviceName = self->_deviceName;
  }
  uint64_t v11 = deviceName;

  return v11;
}

- (id)_generateDiagnoseDirectoryNameWithDeviceName:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  id v4 = +[NSDate date];
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setDateFormat:@"yy.MM.dd-HH.mm.ss"];
  uint64_t v6 = [v5 stringFromDate:v4];
  v7 = +[NSString stringWithFormat:@"clouddocs-%@-%@", v3, v6];

  return v7;
}

- (BOOL)_removeDirectoryIfNecessaryAtPath:(id)a3
{
  id v3 = a3;
  if (!v3) {
    sub_1000170BC();
  }
  id v4 = v3;
  id v5 = +[NSFileManager defaultManager];
  char v15 = 0;
  if (![v5 fileExistsAtPath:v4 isDirectory:&v15]) {
    goto LABEL_6;
  }
  if (!v15)
  {
    fprintf(__stderrp, "No directory to remove at path '%s'.", (const char *)[v4 fileSystemRepresentation]);
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  id v14 = 0;
  unsigned __int8 v6 = [v5 removeItemAtPath:v4 error:&v14];
  id v7 = v14;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    v10 = __stderrp;
    uint64_t v11 = (const char *)[v4 fileSystemRepresentation];
    id v12 = [v8 description];
    fprintf(v10, "Unable to remove directory at path '%s' (error: %s).\n", v11, (const char *)[v12 UTF8String]);

    goto LABEL_9;
  }

LABEL_6:
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (id)_diagnoseParentPath
{
  return @"Logs/CrashReporter/Cloud";
}

- (id)_generateHelperDiagnoseDirName
{
  id v3 = [(BRCTLDiagnoseCommand *)self deviceName];
  id v4 = [(BRCTLDiagnoseCommand *)self _generateDiagnoseDirectoryNameWithDeviceName:v3];

  id v5 = [(BRCTLDiagnoseCommand *)self _diagnoseParentPath];
  unsigned __int8 v6 = [v4 stringByAppendingString:@"_helper"];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (id)_prepareTargetDiagnoseDirPath:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v4 lastPathComponent];
  if (![v4 length])
  {
    char v15 = [(BRCTLDiagnoseCommand *)self deviceName];
    id v10 = [(BRCTLDiagnoseCommand *)self _generateDiagnoseDirectoryNameWithDeviceName:v15];

    v13 = [(BRCTLDiagnoseCommand *)self _diagnoseParentPath];
    uint64_t v14 = [v13 stringByAppendingPathComponent:v10];
    id v8 = v4;
    goto LABEL_10;
  }
  id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v8 = [v4 stringByTrimmingCharactersInSet:v7];

  if (![v8 length])
  {
    long long v17 = __stderrp;
    id v8 = v8;
    fprintf(v17, "Invalid output path (path: '%s').\n", (const char *)[v8 UTF8String]);
LABEL_28:
    id v25 = 0;
    goto LABEL_34;
  }
  BOOL v9 = [(BRCTLDiagnoseCommand *)self _diagnoseParentPath];
  id v10 = [v9 stringByAppendingPathComponent:v6];

  if ([v5 fileExistsAtPath:v10] && !self->continueExecution)
  {
    v30 = __stderrp;
    id v10 = v10;
    [v10 UTF8String];
    fprintf(v30, "Invalid output path (path: '%s'); already exists.\n");
    goto LABEL_27;
  }
  if (([v10 isEqualToString:v8] & 1) == 0)
  {
    uint64_t v11 = [@"/private" stringByAppendingPathComponent:v10];
    unsigned __int8 v12 = [v11 isEqualToString:v8];

    if ((v12 & 1) == 0)
    {
      v26 = __stderrp;
      id v8 = v8;
      [v8 UTF8String];
      fprintf(v26, "Invalid output path (path: '%s'); does not match expected path\n");
LABEL_27:

      goto LABEL_28;
    }
  }
  if (objc_msgSend(v10, "br_isAbsolutePath")) {
    goto LABEL_11;
  }
  v13 = [(BRCTLDiagnoseCommand *)self _diagnoseParentPath];
  uint64_t v14 = [v13 stringByAppendingPathComponent:v10];
LABEL_10:

  id v10 = (id)v14;
LABEL_11:
  if (!self->_isSysdiagnose)
  {
    long long v18 = [v10 stringByDeletingLastPathComponent];
    long long v19 = [v18 br_realpath];

    if ([v5 fileExistsAtPath:v19])
    {
      if ([v5 isWritableFileAtPath:v19])
      {
        id v16 = 0;
LABEL_18:

        goto LABEL_19;
      }
      fprintf(__stderrp, "Path is not writable '%s'\n", (const char *)[v19 fileSystemRepresentation]);
      id v16 = 0;
    }
    else
    {
      NSFileAttributeKey v39 = NSFilePosixPermissions;
      v40 = &off_100027FD8;
      objc_super v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v36 = 0;
      unsigned __int8 v21 = [v5 createDirectoryAtPath:v19 withIntermediateDirectories:0 attributes:v20 error:&v36];
      id v16 = v36;

      if (v21) {
        goto LABEL_18;
      }
      v31 = __stderrp;
      v32 = (const char *)[v19 fileSystemRepresentation];
      id v33 = [v16 description];
      fprintf(v31, "Unable to create directory at path '%s'; %s.\n", v32, (const char *)[v33 UTF8String]);
    }
    id v25 = 0;
    goto LABEL_32;
  }
  id v16 = 0;
LABEL_19:
  if (!self->continueExecution || ([v5 fileExistsAtPath:v10] & 1) != 0) {
    goto LABEL_23;
  }
  NSFileAttributeKey v37 = NSFilePosixPermissions;
  v38 = &off_100027FD8;
  v22 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v35 = v16;
  unsigned __int8 v23 = [v5 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:v22 error:&v35];
  id v24 = v35;

  if (v23)
  {
    id v16 = v24;
LABEL_23:
    id v25 = v10;
LABEL_32:
    id v24 = v16;
    goto LABEL_33;
  }
  v27 = __stderrp;
  v28 = (const char *)[v10 fileSystemRepresentation];
  id v29 = [v24 description];
  fprintf(v27, "Unable to create directory at path '%s'; %s.\n", v28, (const char *)[v29 UTF8String]);

  id v25 = 0;
LABEL_33:

LABEL_34:

  return v25;
}

- (BOOL)_isNoSuchFileError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:NSCocoaErrorDomain]) {
    BOOL v5 = [v3 code] == (id)4 || [v3 code] == (id)260;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_collectFilesWithPredicate:(id)a3 srcPath:(id)a4 dstPath:(id)a5
{
  id v50 = a3;
  id v7 = a4;
  id v8 = a5;
  char v59 = 1;
  BOOL v9 = +[NSFileManager defaultManager];
  id v47 = v7;
  if (![v9 fileExistsAtPath:v7 isDirectory:&v59])
  {
LABEL_27:
    uint64_t v11 = 0;
    id v13 = 0;
    BOOL v33 = 0;
    goto LABEL_33;
  }
  if (v59)
  {
    uint64_t v10 = [v9 enumeratorAtPath:v7];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v57 = 0;
      unsigned __int8 v12 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v57];
      id v13 = v57;
      if (v12)
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v14 = v11;
        id v49 = [v14 countByEnumeratingWithState:&v53 objects:v60 count:16];
        if (!v49) {
          goto LABEL_22;
        }
        uint64_t v48 = *(void *)v54;
        id obj = v14;
        id v46 = v8;
        v44 = v9;
        while (1)
        {
          for (i = 0; i != v49; i = (char *)i + 1)
          {
            if (*(void *)v54 != v48) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            if (!v50 || [v50 evaluateWithObject:v16])
            {
              long long v18 = [v47 stringByAppendingPathComponent:v16];
              long long v19 = [v8 stringByAppendingPathComponent:v16];
              objc_super v20 = [v19 stringByDeletingLastPathComponent];
              id v52 = v13;
              unsigned __int8 v21 = [v9 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v52];
              v22 = v9;
              unsigned __int8 v23 = v8;
              unsigned __int8 v24 = v21;
              id v25 = v52;

              if (v24)
              {
                id v51 = v25;
                unsigned __int8 v26 = [v22 copyItemAtPath:v18 toPath:v19 error:&v51];
                id v13 = v51;

                BOOL v9 = v22;
                if ((v26 & 1) != 0 || [(BRCTLDiagnoseCommand *)self _isNoSuchFileError:v13])
                {
                  id v8 = v46;
LABEL_19:

                  goto LABEL_20;
                }
                v30 = __stderrp;
                v31 = (const char *)[v18 fileSystemRepresentation];
                v32 = (const char *)[v19 fileSystemRepresentation];
                id v29 = [v13 description];
                fprintf(v30, "can't copy item from \"%s\" to \"%s\": %s\n", v31, v32, (const char *)[v29 UTF8String]);
              }
              else
              {
                v27 = __stderrp;
                v28 = (const char *)[v23 fileSystemRepresentation];
                id v29 = [v25 description];
                fprintf(v27, "can't create destination dir at \"%s\": %s\n", v28, (const char *)[v29 UTF8String]);
                id v13 = v25;
              }

              id v8 = v46;
              BOOL v9 = v44;
              goto LABEL_19;
            }
LABEL_20:
          }
          id v14 = obj;
          id v49 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
          if (!v49)
          {
LABEL_22:
            BOOL v33 = 1;
            uint64_t v11 = v14;
            goto LABEL_32;
          }
        }
      }
      id v35 = __stderrp;
      id v36 = (const char *)[v8 fileSystemRepresentation];
      id v14 = [v13 description];
      fprintf(v35, "can't create destination dir at \"%s\": %s\n", v36, (const char *)[v14 UTF8String]);
      goto LABEL_30;
    }
    if (![(BRCTLDiagnoseCommand *)self _isNoSuchFileError:0])
    {
      NSFileAttributeKey v37 = __stderrp;
      v38 = (const char *)[v7 fileSystemRepresentation];
      id v14 = [0 description];
      fprintf(v37, "can't get the contents of dir at \"%s\": %s\n", v38, (const char *)[v14 UTF8String]);
      uint64_t v11 = 0;
      id v13 = 0;
LABEL_30:
      BOOL v33 = 0;
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_27;
  }
  id v58 = 0;
  unsigned __int8 v34 = [v9 copyItemAtPath:v7 toPath:v8 error:&v58];
  id v13 = v58;
  if ((v34 & 1) == 0 && ![(BRCTLDiagnoseCommand *)self _isNoSuchFileError:v13])
  {
    NSFileAttributeKey v39 = __stderrp;
    v40 = (const char *)[v7 fileSystemRepresentation];
    v41 = (const char *)[v8 fileSystemRepresentation];
    id v14 = [v13 description];
    fprintf(v39, "can't copy item from \"%s\" to \"%s\": %s\n", v40, v41, (const char *)[v14 UTF8String]);
    uint64_t v11 = 0;
    BOOL v33 = 1;
    goto LABEL_32;
  }
  uint64_t v11 = 0;
  BOOL v33 = 1;
LABEL_33:

  return v33;
}

- (BOOL)_collectFilesAtPath:(id)a3 dstPath:(id)a4
{
  return [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:0 srcPath:a3 dstPath:a4];
}

- (void)_printActionStartWithLabel:(id)a3
{
  printf("- %s... ", (const char *)[a3 UTF8String]);
  id v3 = __stdoutp;

  fflush(v3);
}

- (void)_printActionEnd
{
  puts("done");
  v2 = __stdoutp;

  fflush(v2);
}

- (void)_printActionFailedWithError:(id)a3
{
  id v3 = [a3 localizedDescription];
  printf("failed: %s\n", (const char *)[v3 UTF8String]);

  id v4 = __stdoutp;

  fflush(v4);
}

- (void)_printActionFailed
{
  puts("failed");
  v2 = __stdoutp;

  fflush(v2);
}

- (BOOL)_execTask:(id)a3 withLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:v7];
    if ([v6 exec])
    {
      [(BRCTLDiagnoseCommand *)self _printActionFailed];
    }
    else
    {
      unsigned __int16 v10 = (unsigned __int16)[v6 waitStatus];
      if ((v10 & 0x7F) != 0x7F)
      {
        if ((v10 & 0x7F) == 0)
        {
          unsigned __int16 v11 = v10;
          [(BRCTLDiagnoseCommand *)self _printActionEnd];
          BOOL v8 = (v11 & 0xFF00) == 0;
          goto LABEL_6;
        }
        puts("aborted");
      }
    }
  }
  else
  {
    [v6 exec];
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)_moveMobileLogs
{
  v2 = +[NSArray arrayWithObjects:@"ips", 0];
  id v3 = +[NSDictionary dictionaryWithObject:v2 forKey:@"Extensions"];
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100013180;
  long long v17 = sub_100013190;
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
  BOOL v5 = (_xpc_connection_s *)v14[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013198;
  handler[3] = &unk_100025830;
  handler[4] = &v13;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_resume((xpc_connection_t)v14[5]);
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v14[5], v4);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary
    && (xpc_dictionary_get_value(v6, "Success"), BOOL v9 = objc_claimAutoreleasedReturnValue(), (v10 = v9) != 0)
    && (BOOL value = xpc_BOOL_get_value(v9), v10, value))
  {
    BOOL v7 = 1;
  }
  else
  {
    fwrite("crash_mover xpc service failed.\n", 0x20uLL, 1uLL, __stderrp);
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)_collectCrashesAndSpinsAtPath:(id)a3 processes:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"collecting crashes and spins"];
  [(BRCTLDiagnoseCommand *)self _moveMobileLogs];
  long long v17 = v6;
  BOOL v7 = [v6 stringByAppendingPathComponent:@"crashes_and_spins"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(BRCTLDiagnoseCommand *)self crashLogsPaths];
  id v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v8;
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
        v22 = +[NSPredicate predicateWithFormat:@"SELF LIKE 'stacks*'"];
        -[BRCTLDiagnoseCommand _collectFilesWithPredicate:srcPath:dstPath:](self, "_collectFilesWithPredicate:srcPath:dstPath:");
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = v20;
        id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            id v14 = 0;
            do
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = +[NSString stringWithFormat:@"^(ExcResource_|Sandbox-)?%@.*\\.(crash|ips|spin|hang|diag)(\\.synced)?$", *(void *)(*((void *)&v24 + 1) + 8 * (void)v14)];
              uint64_t v16 = +[NSPredicate predicateWithFormat:@"SELF MATCHES %@", v15];
              [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v16 srcPath:v9 dstPath:v7];

              id v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v23 + 1;
      }
      while ((id)(v23 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }

  [(BRCTLDiagnoseCommand *)self _printActionEnd];
}

- (void)_sampleTaskAtPath:(id)a3 cmd:(id)a4 process:(id)a5 pid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)BRTask);
  uint64_t v13 = [v9 componentsSeparatedByString:@" "];
  id v14 = [v13 objectAtIndexedSubscript:0];

  uint64_t v15 = +[NSString stringWithFormat:@"%@.%@.%i.txt", v14, v10, v6];

  uint64_t v16 = [v11 stringByAppendingPathComponent:v15];

  if ([v14 isEqualToString:@"sample"])
  {
    long long v17 = +[NSString stringWithFormat:@"-f \"%@\" @@", v16];
    uint64_t v18 = [v9 stringByReplacingOccurrencesOfString:@"@@" withString:v17];

    [v12 setRedirectStdoutToFileAtPath:@"/dev/null"];
    id v9 = (id)v18;
  }
  else
  {
    [v12 setRedirectStdoutToFileAtPath:v16];
  }
  [v12 setRedirectStderrToFileDescriptor:1];
  uint64_t v19 = +[NSNumber numberWithInt:v6];
  id v20 = [v19 stringValue];
  id v21 = [v9 stringByReplacingOccurrencesOfString:@"@@" withString:v20];

  [v12 setCommandWithArguments:v21];
  [v12 exec];
}

- (void)_postOrderChmodWithPath:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v21 = v3;
  id v20 = +[NSURL URLWithString:v3];
  BOOL v5 = [v4 enumeratorAtURL:x0 includingPropertiesForKeys:x1 options:x2 errorHandler:x3];
  id v6 = objc_alloc_init((Class)BRTask);
  [v6 setRedirectStderrToFileDescriptor:1];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
        unsigned __int8 v22 = 0;
        uint64_t v13 = [v12 path];
        unsigned int v14 = [v4 fileExistsAtPath:v13 isDirectory:&v22];
        int v15 = v22;

        if (v14) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16 || [v7 isEnumeratingDirectoryPostOrder])
        {
          long long v17 = [v12 path];
          uint64_t v18 = +[NSString stringWithFormat:@"/bin/chmod 777 \"%@\"", v17];

          [v6 setCommandWithArguments:v18];
          [v6 exec];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  uint64_t v19 = +[NSString stringWithFormat:@"/bin/chmod 777 \"%@\"", v21];
  [v6 setCommandWithArguments:v19];
  [v6 exec];
}

- (void)_collectFileCoordinationDumpAtPath:(id)a3
{
  id v4 = a3;
  [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"collecting filecoordination dump"];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1000139DC;
  id v11 = &unk_100025858;
  id v12 = v4;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  BOOL v5 = v13;
  id v6 = v4;
  +[NSFileCoordinator _getDebugInfoWithCompletionHandler:&v8];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v5, v7);
  [(BRCTLDiagnoseCommand *)self _printActionEnd];
}

- (BOOL)_tar_c:(id)a3 withContentsOfDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)archive_write_new();
  id v10 = v8;
  v29[0] = (char *)[v10 fileSystemRepresentation];
  v29[1] = 0;
  archive_write_set_compression_gzip();
  archive_write_set_format_pax();
  id v11 = v7;
  [v11 fileSystemRepresentation];
  if (archive_write_open_filename())
  {
    if (a5)
    {
      *a5 = +[NSError br_errorFromErrno];
    }
    free(v9);
    BOOL v12 = 0;
    goto LABEL_47;
  }
  uint64_t disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  unsigned int v14 = fts_open(v29, 84, 0);
  int v15 = v14;
  if (a5 && !v14)
  {
    *a5 = +[NSError br_errorFromErrno];
  }
  id v16 = [v10 stringByDeletingLastPathComponent];
  strlen((const char *)[v16 fileSystemRepresentation]);

  if (v15)
  {
    uint64_t v27 = disk_new;
    long long v17 = fts_read(v15);
    BOOL v12 = 1;
    if (v17)
    {
      uint64_t v18 = v17;
      while (1)
      {
        unsigned int fts_info = v18->fts_info;
        if (fts_info > 0xE) {
          goto LABEL_16;
        }
        int v20 = 1 << fts_info;
        if ((v20 & 0x4266) == 0) {
          break;
        }
LABEL_13:
        uint64_t v18 = fts_read(v15);
        if (!v18)
        {
          BOOL v12 = 1;
          goto LABEL_29;
        }
      }
      if ((v20 & 0x490) == 0)
      {
LABEL_16:
        int v21 = open(v18->fts_accpath, 0, 0);
        if ((v21 & 0x80000000) == 0)
        {
          int v22 = v21;
          archive_entry_new();
          archive_entry_set_pathname();
          uint64_t disk_new = v27;
          if (archive_read_disk_entry_from_file() || archive_write_header())
          {
LABEL_27:
            if (!a5)
            {
LABEL_35:
              archive_entry_free();
              close(v22);
              goto LABEL_36;
            }
            long long v24 = +[NSError br_errorWithPOSIXCode:archive_errno()];
          }
          else
          {
            do
            {
              while (1)
              {
                ssize_t v23 = read(v22, v28, 0x4000uLL);
                if (v23 < 0) {
                  break;
                }
                if (!v23)
                {
                  archive_entry_free();
                  close(v22);
                  goto LABEL_13;
                }
                if (archive_write_data() == -1) {
                  goto LABEL_27;
                }
              }
            }
            while (*__error() == 35 || *__error() == 4);
            if (!a5) {
              goto LABEL_35;
            }
            long long v24 = +[NSError br_errorFromErrno];
          }
          *a5 = v24;
          goto LABEL_35;
        }
      }
      uint64_t disk_new = v27;
      if (!a5) {
        goto LABEL_36;
      }
      +[NSError br_errorFromErrno];
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_29:
      uint64_t disk_new = v27;
    }
  }
  else
  {
LABEL_36:
    BOOL v12 = 0;
  }
  if (v9)
  {
    int v25 = archive_write_finish();
    if (v25) {
      BOOL v12 = 0;
    }
    if (a5 && v25)
    {
      +[NSError br_errorWithPOSIXCode:archive_errno()];
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (disk_new) {
    archive_read_finish();
  }
  if (v15) {
    fts_close(v15);
  }
LABEL_47:

  return v12;
}

- (void)_collectMobileDocumentsAtPath:(id)a3 containerID:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_collectMobileDocs)
  {
    if (!v6) {
      goto LABEL_7;
    }
    if ([v6 hasPrefix:@"="])
    {
      uint64_t v8 = [v7 substringFromIndex:1];

      id v7 = (void *)v8;
    }
    if ([v7 containsString:@"."]) {
      id v9 = [objc_alloc((Class)BRMangledID) initWithAppLibraryName:v7];
    }
    else {
LABEL_7:
    }
      id v9 = 0;
    long long v28 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = self->_allAccounts;
    id v34 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    id v10 = 0;
    id v11 = 0;
    id v12 = 0;
    if (v34)
    {
      uint64_t v31 = *(void *)v38;
      dispatch_semaphore_t v13 = (void *)BRUbiquitousContainersRootFolderName;
      id v32 = v9;
      long long v30 = self;
      do
      {
        unsigned int v14 = 0;
        int v15 = v12;
        do
        {
          id v35 = v10;
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v14);
          homePath = self->_homePath;
          uint64_t v18 = [v16 accountIdentifier];
          uint64_t v19 = [(NSMutableDictionary *)homePath objectForKeyedSubscript:v18];
          int v20 = (void *)v19;
          if (v9)
          {
            v42[0] = v19;
            v42[1] = @"Library";
            v42[2] = v13;
            int v21 = [v9 mangledIDString];
            v42[3] = v21;
            int v22 = +[NSArray arrayWithObjects:v42 count:4];
            uint64_t v23 = +[NSString pathWithComponents:v22];

            id v11 = (void *)v23;
          }
          else
          {
            v41[0] = v19;
            v41[1] = @"Library";
            v41[2] = v13;
            int v21 = +[NSArray arrayWithObjects:v41 count:3];
            +[NSString pathWithComponents:v21];
            id v11 = v22 = v11;
          }

          long long v24 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_100026380];

          int v25 = [v16 accountIdentifier];
          long long v26 = [v24 stringByAppendingString:v25];

          uint64_t v27 = [v26 stringByAppendingPathExtension:@"tar.gz"];

          id v10 = [v33 stringByAppendingPathComponent:v27];

          self = v30;
          [(BRCTLDiagnoseCommand *)v30 _printActionStartWithLabel:@"creating root folder archive"];
          id v36 = v15;
          LODWORD(v27) = [(BRCTLDiagnoseCommand *)v30 _tar_c:v10 withContentsOfDirectory:v11 error:&v36];
          id v12 = v36;

          if (v27) {
            [(BRCTLDiagnoseCommand *)v30 _printActionEnd];
          }
          else {
            [(BRCTLDiagnoseCommand *)v30 _printActionFailedWithError:v12];
          }
          id v9 = v32;
          unsigned int v14 = (char *)v14 + 1;
          int v15 = v12;
        }
        while (v34 != v14);
        id v34 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v34);
    }

    id v7 = v28;
  }
}

- (void)_collectDefaultsAtPathForDomain:(id)a3 path:(id)a4
{
  applicationID = (__CFString *)a3;
  id v6 = a4;
  id v7 = +[NSString stringWithFormat:@"defaults-%@.txt", applicationID];
  uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

  id v9 = +[NSString stringWithFormat:@"reading defaults for %@", applicationID];
  [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:v9];

  if (self->_rootUser)
  {
    CFArrayRef v10 = CFPreferencesCopyKeyList(applicationID, @"mobile", kCFPreferencesCurrentHost);
    uint64_t v11 = (uint64_t)CFPreferencesCopyMultiple(v10, applicationID, @"mobile", kCFPreferencesCurrentHost);
  }
  else
  {
    CFArrayRef v10 = +[NSUserDefaults standardUserDefaults];
    uint64_t v11 = [(__CFArray *)v10 persistentDomainForName:applicationID];
  }
  id v12 = (void *)v11;

  if (v12)
  {
    if (![v12 writeToFile:v8 atomically:1])
    {
      [(BRCTLDiagnoseCommand *)self _printActionFailed];
      goto LABEL_9;
    }
  }
  else
  {
    [@"no default set\n" writeToFile:v8 atomically:1 encoding:4 error:0];
  }
  [(BRCTLDiagnoseCommand *)self _printActionEnd];
LABEL_9:
}

- (void)_collectDefaultsAtPath:(id)a3
{
  id v4 = a3;
  [(BRCTLDiagnoseCommand *)self _collectDefaultsAtPathForDomain:@"com.apple.bird" path:v4];
  [(BRCTLDiagnoseCommand *)self _collectDefaultsAtPathForDomain:FPICloudDriveFeaturesUserDefaultsSuiteName path:v4];
}

- (void)_collectLogs:(id)a3 diagnosePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 lastPathComponent];
  id v9 = [v6 stringByAppendingPathComponent:v8];

  [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v7 dstPath:v9];
}

- (void)_truncateFileForiOSSysdiagnose:(id)a3
{
  if (self->_iOSSysdiagnose)
  {
    id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:a3];
    id v4 = [v7 seekToEndOfFile];
    if ((unint64_t)v4 >= 0x32000)
    {
      unint64_t trackedSize = self->_trackedSize;
      self->_unint64_t trackedSize = (unint64_t)v4 + trackedSize;
      if ((unint64_t)v4 + trackedSize > 0x500000)
      {
        [v7 truncateFileAtOffset:(5242880 - trackedSize) & ~((uint64_t)(5242880 - trackedSize) >> 63)];
        id v6 = [@"[truncated for sysdiagnose]" dataUsingEncoding:4];
        [v7 writeData:v6];

        puts(" > truncated for sysdiagnose");
      }
    }
  }
}

- (id)_createSecureDiagnoseDirectory
{
  id v3 = [(BRCTLDiagnoseCommand *)self deviceName];
  id v4 = [(BRCTLDiagnoseCommand *)self _generateDiagnoseDirectoryNameWithDeviceName:v3];

  BOOL v5 = NSTemporaryDirectory();
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = +[NSFileManager defaultManager];
  if ([v7 fileExistsAtPath:v6])
  {
    id v19 = 0;
    unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v19];
    id v9 = v19;
    if ((v8 & 1) == 0)
    {
      CFArrayRef v10 = __stderrp;
      [v6 UTF8String];
      id v11 = [v9 description];
      [v11 UTF8String];
      fprintf(v10, "Unable to remove directory at path '%s'; %s.\n");
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v12 = v9;
  NSFileAttributeKey v20 = NSFilePosixPermissions;
  int v21 = &off_100027FD8;
  dispatch_semaphore_t v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v18 = v9;
  unsigned __int8 v14 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v13 error:&v18];
  id v9 = v18;

  if (v14)
  {
    id v15 = v6;
    goto LABEL_9;
  }
  id v16 = __stderrp;
  [v6 fileSystemRepresentation];
  id v11 = [v9 description];
  [v11 UTF8String];
  fprintf(v16, "Unable to create directory at path '%s'; %s.\n");
LABEL_8:

  id v15 = 0;
LABEL_9:

  return v15;
}

- (BOOL)_moveSecuredDiagnoseDirToTargetPath:(id)a3 targetPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSFileAttributeKey v18 = NSFileOwnerAccountID;
  id v7 = +[NSNumber numberWithUnsignedInt:sub_10000D5F4()];
  id v19 = v7;
  unsigned __int8 v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  if (sub_10000D088(v5, v8))
  {
    id v9 = +[NSFileManager defaultManager];
    id v17 = 0;
    unsigned __int8 v10 = [v9 moveItemAtPath:v5 toPath:v6 error:&v17];
    id v11 = v17;
    if ((v10 & 1) == 0)
    {
      id v12 = __stderrp;
      dispatch_semaphore_t v13 = (const char *)[v5 fileSystemRepresentation];
      unsigned __int8 v14 = (const char *)[v6 fileSystemRepresentation];
      id v15 = [v11 description];
      fprintf(v12, "Unable to rename %s to '%s' (error: %s).\n", v13, v14, (const char *)[v15 UTF8String]);
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)_moveContentsOfDirSrcDist:(id)a3 dstDir:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  id v7 = +[NSFileManager defaultManager];
  id v39 = 0;
  unsigned __int8 v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v39];
  id v9 = v39;
  if (v8)
  {
    long long v30 = self;
    uint64_t v31 = v8;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v36;
      while (2)
      {
        dispatch_semaphore_t v13 = 0;
        unsigned __int8 v14 = v9;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v13);
          id v16 = [v6 stringByAppendingPathComponent:v15];
          id v17 = [v33 stringByAppendingPathComponent:v15];
          id v34 = v14;
          unsigned int v18 = [v7 moveItemAtPath:v16 toPath:v17 error:&v34];
          id v9 = v34;

          if (!v18)
          {
            NSFileAttributeKey v20 = __stderrp;
            id v21 = v16;
            int v22 = (const char *)[v21 fileSystemRepresentation];
            id v23 = v17;
            long long v24 = (const char *)[v23 fileSystemRepresentation];
            id v25 = [v9 description];
            fprintf(v20, "Unable to move %s to '%s' (error: %s).\n", v22, v24, (const char *)[v25 UTF8String]);

            BOOL v19 = 0;
            goto LABEL_12;
          }

          dispatch_semaphore_t v13 = (char *)v13 + 1;
          unsigned __int8 v14 = v9;
        }
        while (v11 != v13);
        id v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    [(BRCTLDiagnoseCommand *)v30 _removeDirectoryIfNecessaryAtPath:v6];
    BOOL v19 = 1;
LABEL_12:
    unsigned __int8 v8 = v31;
  }
  else
  {
    long long v26 = __stderrp;
    uint64_t v27 = (const char *)[v6 fileSystemRepresentation];
    id v28 = [v9 description];
    fprintf(v26, "Error listing contents of directory %s: %s", v27, (const char *)[v28 UTF8String]);

    BOOL v19 = 0;
  }

  return v19;
}

- (void)prepareDiagnose
{
  v2 = [(BRCTLDiagnoseCommand *)self _diagnoseParentPath];
  id v3 = +[NSFileManager defaultManager];
  if ([v3 fileExistsAtPath:v2])
  {
    id v4 = 0;
  }
  else
  {
    NSFileAttributeKey v11 = NSFilePosixPermissions;
    uint64_t v12 = &off_100027FD8;
    id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = 0;
    unsigned __int8 v6 = [v3 createDirectoryAtPath:v2 withIntermediateDirectories:0 attributes:v5 error:&v10];
    id v4 = v10;

    if ((v6 & 1) == 0)
    {
      id v7 = __stderrp;
      unsigned __int8 v8 = (const char *)[v2 fileSystemRepresentation];
      id v9 = [v4 description];
      fprintf(v7, "Unable to create directory at path '%s'; %s.\n", v8, (const char *)[v9 UTF8String]);
    }
  }
}

- (void)diagnoseWithPath:(id)a3
{
  id v4 = a3;
  signal(2, (void (__cdecl *)(int))1);
  id v5 = objc_alloc_init((Class)BRTask);
  unsigned __int8 v6 = +[NSFileManager defaultManager];
  if ([v4 hasSuffix:@".tgz"])
  {
    CFStringRef v7 = @"tgz";
    uint64_t v8 = -4;
LABEL_5:
    uint64_t v9 = [v4 substringToIndex:((char *)[v4 length]) + v8];

    id v4 = (id)v9;
    goto LABEL_7;
  }
  if ([v4 hasSuffix:@".tar.gz"])
  {
    CFStringRef v7 = @"tar.gz";
    uint64_t v8 = -7;
    goto LABEL_5;
  }
  CFStringRef v7 = @"tgz";
LABEL_7:
  id v10 = [(BRCTLDiagnoseCommand *)self _prepareTargetDiagnoseDirPath:v4];

  if (!v10) {
    sub_1000170E8();
  }
  CFStringRef v114 = v7;
  if (self->continueExecution)
  {
    id v11 = v10;
  }
  else
  {
    id v11 = [(BRCTLDiagnoseCommand *)self _createSecureDiagnoseDirectory];

    if (!v11) {
      sub_100017104();
    }
  }
  id v12 = [v11 stringByAppendingPathComponent:@"diagnose-errors.log"];
  dispatch_semaphore_t v13 = (const char *)[v12 fileSystemRepresentation];
  if (self->continueExecution) {
    unsigned __int8 v14 = "w+";
  }
  else {
    unsigned __int8 v14 = "w";
  }
  uint64_t v15 = fopen(v13, v14);
  if (!v15) {
    sub_100017120(v12);
  }
  id v16 = v15;
  err_set_file(v15);
  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472;
  v139[2] = sub_100016294;
  v139[3] = &unk_100025878;
  v139[4] = v16;
  err_set_exit_b(v139);
  v117 = v16;
  v118 = v5;
  v124 = self;
  if (self->continueExecution)
  {
    v121 = v11;
    id v17 = 0;
  }
  else
  {
    id v18 = v10;
    printf("collecting logs at \"%s\"\n", (const char *)[v18 fileSystemRepresentation]);
    fflush(__stdoutp);
    puts("- sending SIGINFO to cloudd");
    sub_10000D2CC("cloudd", 29);
    documentPath = self->_documentPath;
    if (documentPath)
    {
      id v122 = v18;
      NSFileAttributeKey v20 = +[NSURL brctl_fileURLWithUserInput:[(NSString *)documentPath fileSystemRepresentation]];
      id v138 = 0;
      unsigned __int8 v21 = [v20 checkPromisedItemIsReachableAndReturnError:&v138];
      id v22 = v138;
      if (v21)
      {
        id v23 = [v20 lastPathComponent];
        printf("- collecting document-specific information for \"%s\"\n", (const char *)[v23 fileSystemRepresentation]);

        id v24 = v11;
        id v25 = [v11 stringByAppendingPathComponent:@"document-info.txt"];
        long long v26 = fopen((const char *)[v25 fileSystemRepresentation], "w");

        if (v26)
        {
          sub_100009ED8(v26, v20, 0xFFFFFFFFLL);
          fclose(v26);
        }
      }
      else
      {
        id v24 = v11;
        uint64_t v27 = __stderrp;
        id v28 = [(NSString *)self->_documentPath fileSystemRepresentation];
        id v29 = [v22 description];
        fprintf(v27, "can't collect document-specific information at \"%s\": %s\n", v28, (const char *)[v29 UTF8String]);

        self = v124;
      }

      id v11 = v24;
      id v18 = v122;
    }
    if ((self->_sudoed || self->_rootUser) && !self->_isSysdiagnose)
    {
      long long v30 = [v11 stringByAppendingPathComponent:@"taskinfo-threads.txt"];
      [v5 setRedirectStdoutToFileAtPath:v30];
      [v5 setRedirectStderrToFileDescriptor:1];
      [v5 setCommandWithArguments:@"/usr/bin/taskinfo --threads bird"];
      [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"collecting taskinfo"];
    }
    else
    {
      long long v30 = 0;
    }
    if (!self->_isSysdiagnose)
    {
      uint64_t v31 = [v11 stringByAppendingPathComponent:@"launchctl-print.txt"];

      [v5 setRedirectStdoutToFileAtPath:v31];
      [v5 setRedirectStderrToFileDescriptor:1];
      [v5 setCommand:@"/bin/launchctl print system/com.apple.bird"];
      [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"running launchctl print"];
      if (self->_isSysdiagnose
        || (WriteStackshotReport(), self->_isSysdiagnose)
        || ([(BRCTLDiagnoseCommand *)self _collectFileCoordinationDumpAtPath:v11], self->_isSysdiagnose)|| self->skipLogArchive|| self->_isUITests)
      {
        long long v30 = v31;
      }
      else
      {
        long long v30 = [v11 stringByAppendingPathComponent:@"system_logs.logarchive"];

        [v5 setRedirectStdoutToFileDescriptor:1];
        [v5 setRedirectStderrToFileDescriptor:2];
        [v5 setCommand:@"/usr/bin/log collect --output \"%@\"", v30];
        [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"collecting system logarchive"];
      }
    }
    if (([v11 isEqualToString:v18] & 1) == 0
      && ![(BRCTLDiagnoseCommand *)self _moveSecuredDiagnoseDirToTargetPath:v11 targetPath:v18])
    {
      fclose(__stderrp);
      goto LABEL_108;
    }
    id v32 = v30;
    sub_10000D5F4();
    if ((sub_10000D2C4() & 1) == 0) {
      sub_100017194();
    }
    [v5 resetRedirect];
    id v33 = v18;

    [v5 setRedirectStdoutToFileDescriptor:1];
    [v5 setRedirectStderrToFileDescriptor:2];
    if (self->_isSysdiagnose)
    {
      [v5 setCommand:@"/usr/bin/brctl diagnose -c %@", self->diagnoseArgs];
      [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"running userland diagnostics"];
    }
    if (!self->continueExecution && self->_isSysdiagnose)
    {
      id v110 = 0;
      v107 = 0;
      id v11 = v33;
      long long v30 = v32;
      goto LABEL_107;
    }
    v121 = v33;
    id v17 = v32;
  }
  id v115 = v12;
  v116 = v10;
  v123 = v6;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v135 = 0u;
  long long v134 = 0u;
  id obj = self->_allAccounts;
  id v34 = [(NSArray *)obj countByEnumeratingWithState:&v134 objects:v141 count:16];
  if (v34)
  {
    id v35 = v34;
    long long v36 = 0;
    uint64_t v37 = *(void *)v135;
    do
    {
      long long v38 = 0;
      id v39 = v36;
      do
      {
        if (*(void *)v135 != v37) {
          objc_enumerationMutation(obj);
        }
        long long v40 = *(void **)(*((void *)&v134 + 1) + 8 * (void)v38);
        v41 = [v40 accountIdentifier];
        [(BRCTLDiagnoseCommand *)self appSupportPathForPersona:v41];
        v43 = v42 = self;
        long long v36 = [v43 stringByAppendingPathComponent:@"CloudDocs/session/containers"];

        if ([v123 fileExistsAtPath:v36])
        {
          puts("- copying containers plists");
          v44 = [v40 accountIdentifier];
          v45 = +[NSString stringWithFormat:@"containers-%@", v44];
          uint64_t v46 = [v121 stringByAppendingPathComponent:v45];

          id v47 = +[NSString stringWithFormat:@"^.*\\.plist$"];
          uint64_t v48 = +[NSPredicate predicateWithFormat:@"SELF MATCHES %@", v47];
          [(BRCTLDiagnoseCommand *)v42 _collectFilesWithPredicate:v48 srcPath:v36 dstPath:v46];

          id v17 = (void *)v46;
        }
        long long v38 = (char *)v38 + 1;
        id v39 = v36;
        self = v124;
      }
      while (v35 != v38);
      id v35 = [(NSArray *)obj countByEnumeratingWithState:&v134 objects:v141 count:16];
    }
    while (v35);
  }
  else
  {
    long long v36 = 0;
  }

  id v49 = v121;
  id v50 = [v121 stringByAppendingPathComponent:@"brctl-dump.txt"];

  id v51 = v118;
  [v118 setRedirectStdoutToFileAtPath:v50];
  [v118 setRedirectStderrToFileDescriptor:1];
  [v118 setCommandWithArguments:@"/usr/bin/brctl dump -i"];
  [(BRCTLDiagnoseCommand *)self _execTask:v118 withLabel:@"dumping daemon state"];
  [(BRCTLDiagnoseCommand *)self _truncateFileForiOSSysdiagnose:v50];
  if (self->_shouldCollectEnterpriseData)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v52 = self->_allAccounts;
    id v53 = [(NSArray *)v52 countByEnumeratingWithState:&v130 objects:v140 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v131;
      do
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(void *)v131 != v55) {
            objc_enumerationMutation(v52);
          }
          id v57 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          if ([v57 isDataSeparated])
          {
            id v58 = [v57 accountIdentifier];
            char v59 = +[NSString stringWithFormat:@"brctl-dump-enterprise-%@.txt", v58];
            uint64_t v60 = [v121 stringByAppendingPathComponent:v59];

            id v51 = v118;
            [v118 setRedirectStdoutToFileAtPath:v60];
            [v118 setRedirectStderrToFileDescriptor:1];
            [v118 setCommandWithArguments:@"/usr/bin/brctl dump -i -e"];
            [(BRCTLDiagnoseCommand *)v124 _execTask:v118 withLabel:@"dumping enterprise daemon state"];
            [(BRCTLDiagnoseCommand *)v124 _truncateFileForiOSSysdiagnose:v60];
            id v50 = (void *)v60;
          }
        }
        id v54 = [(NSArray *)v52 countByEnumeratingWithState:&v130 objects:v140 count:16];
      }
      while (v54);
    }

    self = v124;
    id v49 = v121;
  }
  if (!self->_iOSSysdiagnose
    && (!fp_shouldObfuscateFilenames() || _brc_log_is_internal_install()))
  {
    uint64_t v61 = [v49 stringByAppendingPathComponent:@"db"];

    [v51 setRedirectStdoutToFileDescriptor:1];
    [v51 setCommand:@"/usr/bin/brctl backup \"%@\"", v61];
    [(BRCTLDiagnoseCommand *)self _execTask:v51 withLabel:@"copying client.db and server.db"];
    id v50 = (void *)v61;
  }
  v62 = [v49 stringByAppendingPathComponent:@"brctl-container-list.txt"];

  [v51 setRedirectStdoutToFileAtPath:v62];
  [v51 setRedirectStderrToFileDescriptor:1];
  [v51 setCommandWithArguments:@"/usr/bin/brctl container list"];
  [(BRCTLDiagnoseCommand *)self _execTask:v51 withLabel:@"listing containers"];
  v63 = [[@"Logs/CrashReporter/DiagnosticLogs/iCloudDriveApp.asl/" br_pathRelativeToDirectory:5];
  [(BRCTLDiagnoseCommand *)self _collectLogs:v63 diagnosePath:v49];

  [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"collecting clouddocs logs"];
  v64 = [v49 stringByAppendingPathComponent:@"com.apple.clouddocs.asl"];

  v65 = [(BRCTLDiagnoseCommand *)self cloudDocsLogPath];
  [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v65 dstPath:v64];

  [(BRCTLDiagnoseCommand *)self _printActionEnd];
  [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"collecting cloudkit logs"];
  v66 = [v49 stringByAppendingPathComponent:@"com.apple.cloudkit"];

  v67 = [(BRCTLDiagnoseCommand *)self cloudKitLogPath];
  [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v67 dstPath:v66];

  v68 = [v49 stringByAppendingPathComponent:@"com.apple.cloudkit.asl"];

  v69 = [(BRCTLDiagnoseCommand *)self cloudKitLogPath];
  v70 = [v69 stringByAppendingPathExtension:@"asl"];
  [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v70 dstPath:v68];

  [(BRCTLDiagnoseCommand *)self _printActionEnd];
  if (!self->_isSysdiagnose)
  {
    v71 = +[NSPredicate predicateWithFormat:@"SELF LIKE 'ProtectedCloudStorage*'"];
    v72 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
    uint64_t v73 = [v72 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs"];

    uint64_t v74 = [v49 stringByAppendingPathComponent:@"PCS"];

    [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v71 srcPath:v73 dstPath:v74];
    v68 = (void *)v74;
    long long v36 = (void *)v73;
  }
  if (!self->_iOSSysdiagnose)
  {
    v75 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
    v76 = [v75 stringByAppendingPathComponent:@"com.apple.nsurlsessiond"];

    v77 = [v49 stringByAppendingPathComponent:@"com.apple.nsurlsessiond"];

    v78 = +[NSPredicate predicateWithFormat:@"SELF LIKE '*.plist'"];
    [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v78 srcPath:v76 dstPath:v77];

    if (self->_iOSSysdiagnose)
    {
      v68 = v77;
      long long v36 = v76;
    }
    else
    {
      v79 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
      long long v36 = [v79 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs/com.apple.nsurlsessiond"];

      v68 = [v49 stringByAppendingPathComponent:@"com.apple.nsurlsessiond"];

      [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v36 dstPath:v68];
      if (!self->_iOSSysdiagnose)
      {
        v80 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
        uint64_t v81 = [v80 stringByAppendingPathComponent:@"Logs/com.apple.nsurlsessiond"];

        uint64_t v82 = [v49 stringByAppendingPathComponent:@"com.apple.nsurlsessiond.asl"];

        [(BRCTLDiagnoseCommand *)self _collectFilesAtPath:v81 dstPath:v82];
        v68 = (void *)v82;
        long long v36 = (void *)v81;
      }
    }
  }
  v83 = [@"Logs" br_pathRelativeToDirectory:5];
  v84 = [@"DuetLoggingDetailed.apsd" br_pathRelativeToPath:v83];
  [(BRCTLDiagnoseCommand *)self _collectLogs:v84 diagnosePath:v49];

  v85 = [@"DuetHeuristic-BM.log" br_pathRelativeToPath:v83];
  [(BRCTLDiagnoseCommand *)self _collectLogs:v85 diagnosePath:v49];

  v86 = @"CoreDuetAdmission.asl"[@"br_pathRelativeToPath:"];
  [(BRCTLDiagnoseCommand *)self _collectLogs:v86 diagnosePath:v49];

  v87 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
  id v88 = [v87 stringByAppendingPathComponent:@"Logs"];

  if (!self->_iOSSysdiagnose)
  {
    v89 = +[NSPredicate predicateWithFormat:@"SELF LIKE 'coreduetd.log*'"];
    [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v89 srcPath:v88 dstPath:v49];
  }
  if (!self->_isSysdiagnose)
  {
    uint64_t v90 = [v49 stringByAppendingPathComponent:@"syslog.txt"];

    [v118 setRedirectStdoutToFileAtPath:v90];
    [v118 setCommandWithArguments:@"/usr/bin/syslog"];
    [(BRCTLDiagnoseCommand *)self _execTask:v118 withLabel:@"collecting syslog"];
    v68 = (void *)v90;
  }
  v125 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/LaunchDaemons/com.apple.cloudd.plist"];
  v91 = [v125 objectForKeyedSubscript:@"EnvironmentVariables"];
  v92 = [v91 objectForKeyedSubscript:@"CFNETWORK_DIAGNOSTICS_LOG_FILE"];

  if (!self->_isSysdiagnose && v92 && [v123 fileExistsAtPath:v92])
  {
    uint64_t v93 = [v121 stringByAppendingPathComponent:@"cloudd-cfnetwork-log.txt"];

    [v118 setRedirectStdoutToFileDescriptor:1];
    [v118 setRedirectStderrToFileDescriptor:2];
    [v118 setCommand:@"/bin/cp \"%@\" \"%@\"", v92, v93];
    [(BRCTLDiagnoseCommand *)self _execTask:v118 withLabel:@"collecting CFNetwork log"];
    v68 = (void *)v93;
  }
  if (!self->_iOSSysdiagnose)
  {
    v94 = [(BRCTLDiagnoseCommand *)self libraryPathForPersona:0];
    v95 = [v94 stringByAppendingPathComponent:@"Logs/PersistentConnection"];

    if ([v123 fileExistsAtPath:v95])
    {
      uint64_t v96 = [v121 stringByAppendingPathComponent:@"PersistentConnection"];

      [v118 setCommand:@"/bin/mkdir \"%@\"", v96];
      [(BRCTLDiagnoseCommand *)self _execTask:v118 withLabel:@"collecting APSD logs"];
      v127[0] = _NSConcreteStackBlock;
      v127[1] = 3221225472;
      v127[2] = sub_10001629C;
      v127[3] = &unk_1000258A0;
      id v88 = v95;
      id v128 = v88;
      id v129 = v123;
      v97 = +[NSPredicate predicateWithBlock:v127];
      [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v97 srcPath:v88 dstPath:v96];

      v68 = (void *)v96;
    }
    else
    {
      id v88 = v95;
    }
  }
  if (self->_isSysdiagnose)
  {
    v98 = v88;
    long long v30 = v68;
    id v5 = v118;
  }
  else
  {
    v98 = [[@"Logs/CrashReporter/DiagnosticLogs/Accounts" br_pathRelativeToDirectory:5];

    v99 = +[NSString stringWithFormat:@"^(accounts\\.|appleaccount_|appleid\\.log\\.|authkit\\.log\\.).*$"];
    uint64_t v100 = [v121 stringByAppendingPathComponent:@"Accounts"];

    v101 = +[NSPredicate predicateWithFormat:@"SELF MATCHES %@", v99];
    [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:v101 srcPath:v98 dstPath:v100];

    if (self->_isSysdiagnose)
    {
      id v5 = v118;
    }
    else
    {
      id v5 = v118;
      if (!self->_isUITests) {
        [(BRCTLDiagnoseCommand *)self _collectCrashesAndSpinsAtPath:v121 processes:&off_100027FA8];
      }
    }
    long long v30 = (void *)v100;
  }
  [(BRCTLDiagnoseCommand *)self _collectMobileDocumentsAtPath:v121 containerID:self->_mobileDocsContainerID];
  [(BRCTLDiagnoseCommand *)self _collectDefaultsAtPath:v121];
  if (!self->_isSysdiagnose && !self->_isUITests)
  {
    uint64_t v102 = [v121 stringByAppendingPathComponent:@"pcs-status.txt"];

    [v5 setRedirectStdoutToFileAtPath:v102];
    [v5 setRedirectStderrToFileDescriptor:1];
    v103 = +[NSString stringWithFormat:@"%s/usr/libexec/pcsstatus", ""];
    [v5 setCommandWithArguments:v103];

    [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"running pcs status"];
    [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"collecting Wallet diagnostics"];
    v104 = [(objc_class *)off_10002A8F0() generateUbiquityDiagnosticsFile:1];
    v105 = [v104 path];
    [(BRCTLDiagnoseCommand *)self _collectLogs:v105 diagnosePath:v121];

    [(BRCTLDiagnoseCommand *)self _printActionEnd];
    long long v30 = (void *)v102;
  }
  printf("- collecting package extensions...");
  fflush(__stdoutp);
  v106 = [(BRCTLDiagnoseCommand *)self appSupportPathForPersona:0];
  v107 = [v106 stringByAppendingPathComponent:@"CloudDocs/pkg_extensions.plist"];

  unsigned __int8 v6 = v123;
  if ([v123 fileExistsAtPath:v107])
  {
    uint64_t v108 = [v121 stringByAppendingPathComponent:@"sharedPkgExtensions.plist"];

    [(BRCTLDiagnoseCommand *)self _collectFilesWithPredicate:0 srcPath:v107 dstPath:v108];
    long long v30 = (void *)v108;
  }
  puts(" done");
  fflush(__stdoutp);
  if (self->_full)
  {
    if (self->_isSysdiagnose) {
      goto LABEL_103;
    }
    v109 = [v121 stringByAppendingPathComponent:@"brctl-check-local.txt"];

    [v5 setRedirectStdoutToFileAtPath:v109];
    [v5 setRedirectStderrToFileDescriptor:1];
    [v5 setCommandWithArguments:@"/usr/bin/brctl check local"];
    [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"running local checks"];
    long long v30 = [v121 stringByAppendingPathComponent:@"brctl-check-server.txt"];

    [v5 setRedirectStdoutToFileAtPath:v30];
    [v5 setRedirectStderrToFileDescriptor:1];
    [v5 setCommandWithArguments:@"/usr/bin/brctl check server"];
    [(BRCTLDiagnoseCommand *)self _execTask:v5 withLabel:@"running server checks"];
  }
  if (!self->_isSysdiagnose)
  {
    id obja = v30;
    v111 = [v121 stringByAppendingPathExtension:v114];
    [v5 resetRedirect];
    [(BRCTLDiagnoseCommand *)self _printActionStartWithLabel:@"archiving diagnose"];
    id v126 = 0;
    unsigned int v112 = [(BRCTLDiagnoseCommand *)self _tar_c:v111 withContentsOfDirectory:v121 error:&v126];
    id v110 = v126;
    if (!v112) {
      sub_10001714C(self, v110);
    }
    [(BRCTLDiagnoseCommand *)self _printActionEnd];
    id v113 = v111;
    printf("\nplease attach the following file to your radar:\n%s\n\n", (const char *)[v113 fileSystemRepresentation]);
    [(BRCTLDiagnoseCommand *)self _removeDirectoryIfNecessaryAtPath:v121];

    long long v30 = obja;
    goto LABEL_106;
  }
LABEL_103:
  id v110 = 0;
LABEL_106:

  id v12 = v115;
  id v10 = v116;
  id v11 = v121;
LABEL_107:
  err_set_file(0);
  err_set_exit_b(0);
  fclose(v117);

LABEL_108:
}

- (void)_listFoldersUnderPath:(id)a3 withOutPath:(id)a4 listAsPlainFile:(BOOL)a5 label:(id)a6
{
  if (a5) {
    uint64_t v9 = "d";
  }
  else {
    uint64_t v9 = "";
  }
  id v10 = a6;
  id v11 = a4;
  id v12 = +[BRTask taskWithCommand:@"%@%s \"%@\", @"/bin/ls -laRie@T"", v9, a3];
  [v12 setRedirectStdoutToFileAtPath:v11];

  [v12 setRedirectStderrToFileDescriptor:1];
  [(BRCTLDiagnoseCommand *)self _execTask:v12 withLabel:v10];
}

- (void)_listSyncedFoldersWithDiagnosePath:(id)a3
{
  id v4 = [a3 stringByAppendingPathComponent:@"ls-synced-folders.txt"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_allAccounts;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 accountIdentifier];
        id v11 = [(BRCTLDiagnoseCommand *)self containersPathForPersona:v10];
        id v12 = [v9 accountIdentifier];
        dispatch_semaphore_t v13 = +[NSString stringWithFormat:@"listing containers files for account %@", v12];
        [(BRCTLDiagnoseCommand *)self _listFoldersUnderPath:v11 withOutPath:v4 listAsPlainFile:0 label:v13];
      }
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  [(BRCTLDiagnoseCommand *)self _truncateFileForiOSSysdiagnose:v4];
}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  switch(a3)
  {
    case 'c':
      self->continueExecution = 1;
      break;
    case 'd':
      self->_documentPath = +[NSString stringWithUTF8String:a4];
      _objc_release_x1();
      break;
    case 'e':
      self->_skipRevealInFinder = 1;
      break;
    case 'f':
      self->_full = 1;
      break;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'm':
    case 'o':
    case 'p':
    case 'q':
      return;
    case 'l':
      self->skipDarwinupList = 1;
      break;
    case 'n':
      id v9 = +[NSString stringWithUTF8String:a4];
      uint64_t v7 = +[BRTask sanitizeStringForFilename:v9];
      deviceName = self->_deviceName;
      self->_deviceName = v7;

      break;
    case 'r':
      self->skipLogArchive = 1;
      break;
    case 's':
      self->_isSysdiagnose = 1;
      self->_iOSSysdiagnose = 1;
      break;
    case 't':
      self->_isUITests = 1;
      break;
    default:
      if (a3 == 77)
      {
        if (a4)
        {
          id v5 = +[NSString stringWithUTF8String:a4];
          mobileDocsContainerID = self->_mobileDocsContainerID;
          self->_mobileDocsContainerID = v5;
        }
        else
        {
          mobileDocsContainerID = self->_mobileDocsContainerID;
          self->_mobileDocsContainerID = 0;
        }

        self->_collectMobileDocs = 1;
      }
      break;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPath, 0);
  objc_storeStrong((id *)&self->_mobileDocsContainerID, 0);
  objc_storeStrong((id *)&self->_containersPath, 0);
  objc_storeStrong((id *)&self->_appSupportPath, 0);
  objc_storeStrong((id *)&self->_cloudKitLogPath, 0);
  objc_storeStrong((id *)&self->_cloudDocsLogPath, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_homePath, 0);
  objc_storeStrong((id *)&self->_allAccounts, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->diagnoseArgs, 0);
}

@end