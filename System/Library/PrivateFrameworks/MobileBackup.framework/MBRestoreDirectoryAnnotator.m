@interface MBRestoreDirectoryAnnotator
+ (BOOL)isRestoredPath:(id)a3;
+ (NSString)backupAnnotationXattrKey;
+ (id)restoreDirectoryAnnotatorWithPersona:(id)a3 engineType:(int)a4 backupPolicy:(int64_t)a5 shouldRestoreSystemFiles:(BOOL)a6 encrypted:(BOOL)a7;
- (id)_annotateDomain:(id)a3 atDomainRoot:(id)a4;
- (id)_annotateNotBackedUpDomain:(id)a3 domainRoot:(id)a4 relativePath:(id)a5;
- (id)_annotatePath:(id)a3 value:(id)a4;
- (id)_annotateRestoredDomain:(id)a3 domainRoot:(id)a4 relativePath:(id)a5;
- (id)_baseRestorePathForDomain:(id)a3;
- (id)_initWithPersona:(id)a3 engineType:(int)a4 backupPolicy:(int64_t)a5 shouldRestoreSystemFiles:(BOOL)a6 encrypted:(BOOL)a7;
- (id)_makeAnnotatedIntermediatePaths:(id)a3;
- (id)_makeEmptyAnnotationFileWithPath:(id)a3 value:(id)a4;
- (id)annotateDomain:(id)a3 atDomainRoot:(id)a4;
- (id)annotateDomains:(id)a3;
@end

@implementation MBRestoreDirectoryAnnotator

+ (NSString)backupAnnotationXattrKey
{
  return (NSString *)@"MBRestoreAnnotation";
}

+ (BOOL)isRestoredPath:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = +[MBExtendedAttributes valueForKey:forPathFSR:error:](MBExtendedAttributes, "valueForKey:forPathFSR:error:", @"MBRestoreAnnotation", [v3 fileSystemRepresentation], 0);
    if (v6)
    {
      id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
      if ([v7 isEqual:@"NotRestored"]) {
        LOBYTE(v5) = 0;
      }
      else {
        unsigned int v5 = [v7 isEqual:@"NotBackedUp"] ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

+ (id)restoreDirectoryAnnotatorWithPersona:(id)a3 engineType:(int)a4 backupPolicy:(int64_t)a5 shouldRestoreSystemFiles:(BOOL)a6 encrypted:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = [[MBRestoreDirectoryAnnotator alloc] _initWithPersona:v11 engineType:v10 backupPolicy:a5 shouldRestoreSystemFiles:v8 encrypted:v7];

  return v12;
}

- (id)_initWithPersona:(id)a3 engineType:(int)a4 backupPolicy:(int64_t)a5 shouldRestoreSystemFiles:(BOOL)a6 encrypted:(BOOL)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBRestoreDirectoryAnnotator;
  v14 = [(MBRestoreDirectoryAnnotator *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persona, a3);
    v15->_engineType = a4;
    v15->_backupPolicy = a5;
    v15->_shouldRestoreSystemFiles = a6;
    v15->_encrypted = a7;
  }

  return v15;
}

- (id)annotateDomains:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
      id v11 = -[MBRestoreDirectoryAnnotator _annotateDomain:atDomainRoot:](self, "_annotateDomain:atDomainRoot:", v9, 0, (void)v13);
      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v11 = 0;
  }

  return v11;
}

- (id)annotateDomain:(id)a3 atDomainRoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBRestoreDirectoryAnnotator annotateDomain:atDomainRoot:]", "MBRestoreDirectoryAnnotator.m", 88, "domain");
  }
  uint64_t v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBRestoreDirectoryAnnotator annotateDomain:atDomainRoot:]", "MBRestoreDirectoryAnnotator.m", 89, "domainRoot");
  }
  uint64_t v9 = [(MBRestoreDirectoryAnnotator *)self _annotateDomain:v6 atDomainRoot:v7];

  return v9;
}

- (id)_annotateDomain:(id)a3 atDomainRoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isUninstalledAppDomain])
  {
    if (!v7)
    {
      id v7 = [(MBRestoreDirectoryAnnotator *)self _baseRestorePathForDomain:v6];
    }
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v6 name];
      *(_DWORD *)buf = 138543618;
      v61 = v13;
      __int16 v62 = 2112;
      id v63 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Annotating domain: %{public}@ at %@", buf, 0x16u);

      v48 = [v6 name];
      id v49 = v7;
      _MBLog();
    }
    unsigned int v14 = [v6 isAppDomain];
    uint64_t v8 = +[NSMutableSet set];
    if (!self->_shouldRestoreSystemFiles && !v14) {
      goto LABEL_23;
    }
    long long v15 = objc_msgSend(v6, "relativePathsNotToBackup", v48, v49);
    [v8 unionSet:v15];

    if (self->_backupPolicy == 1)
    {
      long long v16 = [v6 relativePathsNotToBackupToDrive];
      [v8 unionSet:v16];

      uint64_t v17 = [v6 relativePathsNotToBackupInMegaBackup];
    }
    else
    {
      int engineType = self->_engineType;
      if ((engineType - 2) < 2)
      {
        uint64_t v17 = [v6 relativePathsNotToBackupToService];
      }
      else
      {
        if (engineType != 4 && engineType != 1)
        {
          +[NSException raise:NSInvalidArgumentException, @"Unexpected engine type: %d", self->_engineType format];
LABEL_19:
          if (!self->_encrypted && self->_engineType != 4)
          {
            v20 = [v6 relativePathsToOnlyBackupEncrypted];
            [v8 unionSet:v20];
          }
          v21 = [v6 relativePathsToRemoveOnRestore];
          [v8 mb_minusPathSet:v21];

LABEL_23:
          v22 = [v8 allObjects];
          v23 = [v22 sortedArrayUsingComparator:&stru_100418178];

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v10 = v23;
          id v24 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v55;
            while (2)
            {
              for (i = 0; i != v25; i = (char *)i + 1)
              {
                if (*(void *)v55 != v26) {
                  objc_enumerationMutation(v10);
                }
                v28 = [(MBRestoreDirectoryAnnotator *)self _annotateNotBackedUpDomain:v6 domainRoot:v7 relativePath:*(void *)(*((void *)&v54 + 1) + 8 * i)];
                if (v28)
                {
                  id v11 = v28;
                  v29 = v10;
                  goto LABEL_51;
                }
              }
              id v25 = [v10 countByEnumeratingWithState:&v54 objects:v59 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }

          v29 = +[NSMutableSet set];
          if (self->_shouldRestoreSystemFiles) {
            int v30 = 1;
          }
          else {
            int v30 = v14;
          }
          if (v30 == 1)
          {
            v31 = [v6 relativePathsToBackupAndRestore];
            [v29 unionSet:v31];

            v32 = [v6 relativePathsToRestoreOnly];
            [v29 unionSet:v32];

            if ((self->_engineType & 0xFFFFFFFE) == 2)
            {
              v33 = [v6 relativePathsToRestoreOnlyFromService];
              [v29 unionSet:v33];
            }
            uint64_t v34 = [v6 relativePathsToRemoveOnRestore];
          }
          else
          {
            v35 = [v6 relativePathsOfSystemFilesToAlwaysRestore];
            [v29 unionSet:v35];

            uint64_t v34 = [v6 relativePathsOfSystemFilesToAlwaysRemoveOnRestore];
          }
          v36 = (void *)v34;
          [v29 unionSet:v34];

          v37 = [v6 relativePathsNotToRemoveIfNotRestored];
          [v29 unionSet:v37];

          v38 = [v6 relativePathsToBackupToDriveAndStandardAccount];
          [v29 unionSet:v38];

          objc_msgSend(v29, "mb_minusPathSet:", v8);
          v39 = [v29 allObjects];
          v40 = [v39 sortedArrayUsingComparator:&stru_100418198];

          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v41 = v40;
          id v42 = [v41 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v51;
            while (2)
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v51 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = [(MBRestoreDirectoryAnnotator *)self _annotateRestoredDomain:v6 domainRoot:v7 relativePath:*(void *)(*((void *)&v50 + 1) + 8 * (void)j)];
                if (v46)
                {
                  id v11 = v46;
                  goto LABEL_50;
                }
              }
              id v43 = [v41 countByEnumeratingWithState:&v50 objects:v58 count:16];
              if (v43) {
                continue;
              }
              break;
            }
          }
          id v11 = 0;
LABEL_50:

LABEL_51:
          goto LABEL_52;
        }
        uint64_t v17 = [v6 relativePathsNotToBackupToDrive];
      }
    }
    v19 = (void *)v17;
    [v8 unionSet:v17];

    goto LABEL_19;
  }
  uint64_t v8 = MBGetDefaultLog();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = 0;
    goto LABEL_53;
  }
  uint64_t v9 = [v6 name];
  *(_DWORD *)buf = 138543362;
  v61 = v9;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping annotating uninstalled app domain: %{public}@", buf, 0xCu);

  id v10 = [v6 name];
  _MBLog();
  id v11 = 0;
LABEL_52:

LABEL_53:
  return v11;
}

- (id)_baseRestorePathForDomain:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 shouldRestoreToSharedVolume];
  persona = self->_persona;
  if (v5) {
    [(MBPersona *)persona sharedIncompleteRestoreDirectory];
  }
  else {
  id v7 = [(MBPersona *)persona userIncompleteRestoreDirectory];
  }
  uint64_t v8 = [v4 rootPath];

  uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

- (id)_annotateNotBackedUpDomain:(id)a3 domainRoot:(id)a4 relativePath:(id)a5
{
  id v6 = [a4 stringByAppendingPathComponent:a5];
  id v7 = [(MBRestoreDirectoryAnnotator *)self _makeEmptyAnnotationFileWithPath:v6 value:@"NotBackedUp"];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }

  return v8;
}

- (id)_annotateRestoredDomain:(id)a3 domainRoot:(id)a4 relativePath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 stringByAppendingPathComponent:v9];
  id v11 = +[NSFileManager defaultManager];
  id v23 = 0;
  id v12 = [v11 attributesOfItemAtPath:v10 error:&v23];
  id v13 = v23;

  if (!v12)
  {
    if (+[MBError codeForNSError:v13] == 4)
    {
      uint64_t v17 = [v8 relativePathsNotToRemoveIfNotRestored];
      unsigned int v18 = objc_msgSend(v9, "mb_pathComponentExistsInSet:", v17);

      if (v18) {
        CFStringRef v19 = @"NotBackedUp";
      }
      else {
        CFStringRef v19 = @"NotRestored";
      }
      uint64_t v16 = [(MBRestoreDirectoryAnnotator *)self _makeEmptyAnnotationFileWithPath:v10 value:v19];
      goto LABEL_9;
    }
    if (+[MBError codeForNSError:v13] != 5)
    {
      id v21 = +[MBError errorWithCode:100 error:v13 path:v10 format:@"Error getting restored file attributes"];
      goto LABEL_15;
    }
LABEL_12:
    v20 = 0;
    goto LABEL_16;
  }
  unsigned int v14 = [v12 fileType];
  unsigned int v15 = [v14 isEqualToString:NSFileTypeDirectory];

  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v16 = [(MBRestoreDirectoryAnnotator *)self _annotatePath:v10 value:@"RestoreRoot"];
LABEL_9:
  v20 = (void *)v16;

  if (!v20)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  id v21 = v20;
  id v13 = v21;
LABEL_15:
  v20 = v21;
LABEL_16:

  return v20;
}

- (id)_annotatePath:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Annotating with '%@': %@", buf, 0x16u);
    _MBLog();
  }

  id v8 = v5;
  id v9 = [v8 fileSystemRepresentation];
  id v10 = [v6 dataUsingEncoding:4];
  id v15 = 0;
  unsigned __int8 v11 = +[MBExtendedAttributes setValue:v10 forKey:@"MBRestoreAnnotation" forPathFSR:v9 error:&v15];
  id v12 = v15;
  id v13 = 0;
  if ((v11 & 1) == 0)
  {
    id v13 = +[MBError errorWithCode:100, v12, @"Error setting %@ extended attribute", v6 error format];
  }

  return v13;
}

- (id)_makeAnnotatedIntermediatePaths:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByDeletingLastPathComponent];
  id v6 = +[NSFileManager defaultManager];
  id v18 = 0;
  id v7 = [v6 attributesOfItemAtPath:v5 error:&v18];
  id v8 = v18;

  if (v7) {
    goto LABEL_2;
  }
  if (+[MBError codeForNSError:v8] != 4)
  {
    CFStringRef v12 = @"Error getting restored file attributes";
    goto LABEL_8;
  }
  id v10 = [(MBRestoreDirectoryAnnotator *)self _makeAnnotatedIntermediatePaths:v5];

  if (!v10)
  {
    unsigned int v14 = +[NSFileManager defaultManager];
    id v17 = 0;
    unsigned __int8 v15 = [v14 createDirectoryAtPath:v5 withIntermediateDirectories:0 attributes:0 error:&v17];
    id v8 = v17;

    if (v15)
    {
      uint64_t v16 = [(MBRestoreDirectoryAnnotator *)self _annotatePath:v5 value:@"Intermediate"];

      if (!v16)
      {
        id v8 = 0;
LABEL_2:
        id v9 = 0;
        goto LABEL_10;
      }
      id v11 = v16;
      goto LABEL_6;
    }
    CFStringRef v12 = @"Error creating annotated parent directory";
LABEL_8:
    id v11 = +[MBError errorWithCode:100 error:v8 path:v4 format:v12];
    goto LABEL_9;
  }
  id v11 = v10;
LABEL_6:
  id v8 = v11;
LABEL_9:
  id v9 = v11;
LABEL_10:

  return v9;
}

- (id)_makeEmptyAnnotationFileWithPath:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBRestoreDirectoryAnnotator *)self _makeAnnotatedIntermediatePaths:v6];
  if (!v8)
  {
    id v10 = v6;
    int v11 = open((const char *)[v10 fileSystemRepresentation], 1793, 420);
    if (v11 < 0)
    {
      if (*__error() == 17 || *__error() == 21)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v7;
          __int16 v30 = 2112;
          id v31 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not creating %@ empty annotation file at path since it already exists: %@", buf, 0x16u);
          _MBLog();
        }

        id v8 = 0;
      }
      else if (*__error() == 1)
      {
        unsigned int v14 = [v10 stringByDeletingLastPathComponent];
        id v27 = 0;
        unsigned __int8 v15 = +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:v14 identifiedBy:@"annotation-temp" error:&v27];
        id v16 = v27;
        id v17 = v16;
        if (v15)
        {
          id v18 = [v15 makeTemporaryFilePath];
          int v19 = open((const char *)[v18 fileSystemRepresentation], 1793, 420);
          if (v19 < 0)
          {
            id v8 = +[MBError posixErrorWithCode:100 path:v10 format:@"Error creating empty annotation file to rename"];
            id v21 = 0;
          }
          else
          {
            v20 = [(MBRestoreDirectoryAnnotator *)self _annotatePath:v18 value:v7];
            if (v20)
            {
              id v21 = v20;
              id v8 = v21;
            }
            else
            {
              v22 = (const std::__fs::filesystem::path *)[v18 fileSystemRepresentation];
              id v23 = v10;
              id v24 = (const std::__fs::filesystem::path *)[v23 fileSystemRepresentation];
              rename(v22, v24, v25);
              if (v26)
              {
                id v8 = +[MBError posixErrorWithPath:v23 format:@"Error renaming empty annotation file into place"];
                id v21 = 0;
              }
              else
              {
                id v21 = 0;
                id v8 = 0;
              }
            }
            [v15 dispose];
            if (v19) {
              close(v19);
            }
          }
        }
        else
        {
          id v8 = v16;
        }
      }
      else
      {
        id v8 = +[MBError posixErrorWithCode:100 path:v10 format:@"Error creating empty annotation file"];
      }
    }
    else
    {
      int v12 = v11;
      id v8 = [(MBRestoreDirectoryAnnotator *)self _annotatePath:v10 value:v7];
      if (!v8) {
        close(v12);
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end