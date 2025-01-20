@interface MSDContentInstaller
+ (id)sharedInstance;
- (BOOL)adjustContentUnder:(id)a3;
- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3;
- (BOOL)finishInstallContent;
- (BOOL)hasInheritanceACL:(id)a3;
- (BOOL)hasXattr:(id)a3 path:(id)a4;
- (BOOL)isContentRoot:(id)a3;
- (BOOL)isContentRootToRemove:(id)a3;
- (BOOL)isNotExtracted:(id)a3;
- (BOOL)removeXattr:(id)a3;
- (MSDContentInstaller)init;
- (id)originalPathFor:(id)a3;
@end

@implementation MSDContentInstaller

+ (id)sharedInstance
{
  if (qword_10000C768 != -1) {
    dispatch_once(&qword_10000C768, &stru_1000083D0);
  }
  v2 = (void *)qword_10000C760;

  return v2;
}

- (MSDContentInstaller)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDContentInstaller;
  v2 = [(MSDContentInstaller *)&v8 init];
  if (v2)
  {
    v3 = [@"/private/var/logs/demod" stringByAppendingPathComponent:@"demod-finish-demo-restore.log"];
    v4 = +[MSDLogModel sharedInstance];
    [v4 enableLogToFile:v3];

    v5 = +[MSDLogModel sharedInstance];
    [v5 logMessage:1 prefix:@"[INF]" message:@"MSDContentInstaller launched!"];

    v6 = v2;
  }

  return v2;
}

- (BOOL)finishInstallContent
{
  v3 = +[NSFileManager defaultManager];
  v4 = +[MSDDemoVolumeManager sharedInstance];
  [v4 mountDemoVolume];

  v5 = +[MSDDemoVolumeManager sharedInstance];
  [v5 moveDataFromShelterToFinal];

  if ([v3 fileExistsAtPath:@"/var/demo_backup/Metadata/.Content.plist"])
  {
    v6 = +[NSURL fileURLWithPath:@"/var/demo_backup/Metadata/Content.plist"];
    v7 = +[NSURL fileURLWithPath:@"/var/demo_backup/Metadata/.Content.plist"];
    objc_super v8 = +[MSDLogModel sharedInstance];
    [v8 logMessage:1, @"[INF]", @"Restoring secure cookie file from %@ to %@", @"/var/demo_backup/Metadata/.Content.plist", @"/var/demo_backup/Metadata/Content.plist" prefix message];

    id v23 = 0;
    unsigned __int8 v9 = [v3 replaceItemAtURL:v6 withItemAtURL:v7 backupItemName:0 options:0 resultingItemURL:0 error:&v23];
    id v10 = v23;
    if ((v9 & 1) == 0)
    {
      v11 = +[MSDLogModel sharedInstance];
      [v11 logMessage:1, @"[INF]", @"Cannot restore secure cookie with error: %@", v10 prefix message];
    }
  }
  else
  {
    v12 = +[MSDLogModel sharedInstance];
    [v12 logMessage:1, @"[INF]", @"Skipping secure cookie restore as Content.plist does not exist at %@", @"/var/demo_backup/Metadata/.Content.plist" prefix message];

    id v10 = 0;
  }
  unsigned int v13 = [v3 fileExistsAtPath:@"/private/var/demo_backup/backup"];
  v14 = +[MSDLogModel sharedInstance];
  v15 = v14;
  if (!v13)
  {
    [v14 logMessage:1 prefix:@"[INF]" message:@"Skipping demo content restore as staging folder does not exist."];
    id v19 = v10;
    goto LABEL_12;
  }
  [v14 logMessage:1 prefix:@"[INF]" message:@"Starting to move staged demo content..."];

  if (![(MSDContentInstaller *)self adjustContentUnder:@"/private/var/demo_backup/backup"])
  {
    v16 = +[MSDLogModel sharedInstance];
    [v16 logMessage:1 prefix:@"[INF]" message:@"Cannot move staged demo content."];
  }
  v17 = +[MSDLogModel sharedInstance];
  [v17 logMessage:1, @"[INF]", @"Removing staging folder %@...", @"/private/var/demo_backup/backup" prefix message];

  id v22 = v10;
  unsigned __int8 v18 = [v3 removeItemAtPath:@"/private/var/demo_backup/backup" error:&v22];
  id v19 = v22;

  if ((v18 & 1) == 0)
  {
    v15 = +[MSDLogModel sharedInstance];
    v20 = [v19 localizedDescription];
    [v15 logMessage:1, @"[INF]", @"Cannot remove staging folder: %@", v20 prefix message];

LABEL_12:
  }

  return 1;
}

- (BOOL)adjustContentUnder:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  char v77 = 0;
  if ([v5 fileExistsAtPath:v4 isDirectory:&v77]) {
    BOOL v6 = v77 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  v63 = v5;
  v60 = self;
  if (v6)
  {
    v7 = 0;
    objc_super v8 = 0;
    unsigned __int8 v9 = 0;
    id v10 = 0;
    goto LABEL_35;
  }
  id v76 = 0;
  v11 = [v5 contentsOfDirectoryAtPath:v4 error:&v76];
  id v12 = v76;
  id v13 = v12;
  if (!v11)
  {
    v41 = +[MSDLogModel sharedInstance];
    v53 = [v13 localizedDescription];
    [v41 logMessage:1, @"[INF]", @"%s: Cannot find files/dirs under %@ - %@", "-[MSDContentInstaller adjustContentUnder:]", v4, v53 prefix message];

    v7 = 0;
    objc_super v8 = 0;
    unsigned __int8 v9 = 0;
LABEL_61:
    v43 = 0;
    goto LABEL_66;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v14 = v11;
  id v15 = [v14 countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (!v15)
  {
    v7 = 0;
    v59 = 0;
    unsigned __int8 v9 = 0;
    goto LABEL_34;
  }
  id v16 = v15;
  v7 = 0;
  v59 = 0;
  unsigned __int8 v9 = 0;
  uint64_t v62 = *(void *)v73;
  id v61 = v4;
  id obj = v14;
  do
  {
    v17 = 0;
    do
    {
      unsigned __int8 v18 = v9;
      id v19 = v7;
      if (*(void *)v73 != v62) {
        objc_enumerationMutation(obj);
      }
      v7 = [v4 stringByAppendingPathComponent:*(void *)(*((void *)&v72 + 1) + 8 * (void)v17)];

      id v71 = v13;
      unsigned __int8 v9 = [v5 attributesOfItemAtPath:v7 error:&v71];
      id v20 = v71;

      if (!v9)
      {
        v50 = +[MSDLogModel sharedInstance];
        v51 = [v20 localizedDescription];
        [v50 logMessage:1, @"[INF]", @"%s: Cannot get attribute from %@ - %@", "-[MSDContentInstaller adjustContentUnder:]", v7, v51 prefix message];
        objc_super v8 = v59;
LABEL_55:

        v41 = obj;
        v43 = 0;
        BOOL v42 = 0;
        id v13 = v20;
        goto LABEL_56;
      }
      v21 = [v9 fileType];
      unsigned int v22 = [v21 isEqualToString:NSFileTypeSymbolicLink];

      if (v22)
      {
        id v23 = +[MSDDemoVolumeManager sharedInstance];
        v24 = [v23 userHomePath];
        v25 = [@"/private/var/demo_backup/backup" stringByAppendingPathComponent:v24];

        if (!v25 || [v7 caseInsensitiveCompare:v25])
        {

          id v13 = v20;
          goto LABEL_25;
        }
        v26 = +[MSDLogModel sharedInstance];
        [v26 logMessage:1, @"[INF]", @"Found wormhole in staging to user volume: %@", v25 prefix message];

        id v4 = v61;
      }
      if (![(MSDContentInstaller *)v60 isNotExtracted:v7])
      {
        [(MSDContentInstaller *)v60 adjustContentUnder:v7];
        id v13 = v20;
        goto LABEL_27;
      }
      uint64_t v27 = [(MSDContentInstaller *)v60 originalPathFor:v7];

      uint64_t v28 = +[MSDLogModel sharedInstance];
      [(id)v28 logMessage:1, @"[INF]", @"%@ is not extracted (under a content root), should use the original content.", v7 prefix message];

      id v70 = v20;
      v5 = v63;
      LOBYTE(v28) = [v63 removeItemAtPath:v7 error:&v70];
      id v29 = v70;

      if ((v28 & 1) == 0)
      {
        v50 = +[MSDLogModel sharedInstance];
        v51 = [v29 localizedDescription];
        [v50 logMessage:1, @"[INF]", @"%s: Cannot remove item: %@ - Error:  %@", "-[MSDContentInstaller adjustContentUnder:]", v7, v51 prefix message];
        objc_super v8 = (void *)v27;
        id v20 = v29;
        id v4 = v61;
        goto LABEL_55;
      }
      if ([v63 fileExistsAtPath:v27])
      {
        id v69 = v29;
        unsigned __int8 v30 = [v63 moveItemAtPath:v27 toPath:v7 error:&v69];
        id v13 = v69;

        if ((v30 & 1) == 0)
        {
          v31 = +[MSDLogModel sharedInstance];
          v32 = [v13 localizedDescription];
          [v31 logMessage:1, @"[INF]", @"%s: Could not move item %@ to %@.  Error:  %@", "-[MSDContentInstaller adjustContentUnder:]", v27, v7, v32 prefix message];
        }
        v59 = (void *)v27;
LABEL_25:
        id v4 = v61;
LABEL_27:
        v5 = v63;
        goto LABEL_28;
      }
      v59 = (void *)v27;
      id v13 = v29;
      id v4 = v61;
LABEL_28:
      v17 = (char *)v17 + 1;
    }
    while (v16 != v17);
    id v14 = obj;
    id v33 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
    id v16 = v33;
  }
  while (v33);
LABEL_34:

  id v10 = v13;
  objc_super v8 = v59;
  self = v60;
LABEL_35:
  if (![(MSDContentInstaller *)self isContentRoot:v4])
  {
    v43 = 0;
LABEL_44:
    BOOL v42 = 1;
    goto LABEL_58;
  }
  unsigned __int8 v34 = [(MSDContentInstaller *)self isContentRootToRemove:v4];
  [(MSDContentInstaller *)self removeXattr:v4];
  uint64_t v35 = [(MSDContentInstaller *)self originalPathFor:v4];
  v36 = v8;
  objc_super v8 = (void *)v35;

  if (![v63 fileExistsAtPath:v8]) {
    goto LABEL_39;
  }
  id v68 = v10;
  unsigned __int8 v37 = [v63 removeItemAtPath:v8 error:&v68];
  id v13 = v68;

  if ((v37 & 1) == 0)
  {
    v54 = +[MSDLogModel sharedInstance];
    v55 = [v13 localizedDescription];
    [v54 logMessage:1, @"[INF]", @"Cannot remove %@ - %@", v8, v55 prefix message];

    v41 = v54;
    goto LABEL_61;
  }
  id v10 = v13;
LABEL_39:
  if ((v34 & 1) == 0)
  {
    v44 = +[MSDLogModel sharedInstance];
    [v44 logMessage:1, @"[INF]", @"Moving content root item %@ to %@.", v4, v8 prefix message];

    v43 = [v8 stringByDeletingLastPathComponent];
    if (([v63 fileExistsAtPath:v43 isDirectory:&v77] & 1) == 0
      && ![(MSDContentInstaller *)v60 createIntermdediateDirectoriesInPathAndRestoreAttributes:v43])
    {
      BOOL v42 = 0;
      goto LABEL_58;
    }
    if ([(MSDContentInstaller *)v60 hasInheritanceACL:v43])
    {
      v45 = +[MSDLogModel sharedInstance];
      [v45 logMessage:1, @"[INF]", @"Parent folder of content root item has inheritance ACL: %@", v43 prefix message];

      id v67 = v10;
      unsigned __int8 v46 = [v63 copyItemAtPath:v4 toPath:v8 error:&v67];
      id v13 = v67;

      if (v46)
      {
        id v66 = v13;
        unsigned __int8 v47 = [v63 removeItemAtPath:v4 error:&v66];
        id v10 = v66;

        if ((v47 & 1) == 0)
        {
          v41 = +[MSDLogModel sharedInstance];
          v48 = [v10 localizedDescription];
          [v41 logMessage:1, @"[INF]", @"Cannot remove item %@.  Error:  %@", v4, v48 prefix message];

          BOOL v42 = 0;
          id v13 = v10;
          goto LABEL_56;
        }
        goto LABEL_44;
      }
      v56 = +[MSDLogModel sharedInstance];
      v57 = [v13 localizedDescription];
      [v56 logMessage:1, @"[INF]", @"Cannot copy %@ to %@.  Error:  %@", v4, v8, v57 prefix message];
    }
    else
    {
      id v65 = v10;
      unsigned __int8 v49 = [v63 moveItemAtPath:v4 toPath:v8 error:&v65];
      id v13 = v65;

      if (v49)
      {
        BOOL v42 = 1;
        goto LABEL_57;
      }
      v56 = +[MSDLogModel sharedInstance];
      v57 = [v13 localizedDescription];
      [v56 logMessage:1, @"[INF]", @"Cannot move %@ to %@.  Error:  %@", v4, v8, v57 prefix message];
    }

    v41 = v56;
LABEL_66:
    BOOL v42 = 0;
    goto LABEL_56;
  }
  id v64 = v10;
  unsigned __int8 v38 = [v63 removeItemAtPath:v4 error:&v64];
  id v13 = v64;

  if ((v38 & 1) == 0)
  {
    v39 = +[MSDLogModel sharedInstance];
    v40 = [v13 localizedDescription];
    [v39 logMessage:1, @"[INF]", @"Failed to remove:  %@ - Error:  %@", v4, v40 prefix message];
  }
  v41 = +[MSDLogModel sharedInstance];
  BOOL v42 = 1;
  [v41 logMessage:1, @"[INF]", @"Removed %@.", v8 prefix message];
  v43 = 0;
LABEL_56:

LABEL_57:
  id v10 = v13;
LABEL_58:

  return v42;
}

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDLogModel sharedInstance];
  [v4 logMessage:1, @"[INF]", @"%s - fullPath:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]", v3 prefix message];

  v5 = +[NSFileManager defaultManager];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100004C1C;
  v13[4] = sub_100004C2C;
  id v14 = +[NSString string];
  BOOL v6 = [v3 pathComponents];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004C34;
  v9[3] = &unk_1000083F8;
  v11 = v13;
  id v7 = v5;
  id v10 = v7;
  id v12 = &v15;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (BOOL)isNotExtracted:(id)a3
{
  return [(MSDContentInstaller *)self hasXattr:@"NotExtracted" path:a3];
}

- (BOOL)isContentRoot:(id)a3
{
  id v4 = a3;
  if ([(MSDContentInstaller *)self hasXattr:@"ContentRoot" path:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(MSDContentInstaller *)self hasXattr:@"ContentRootToRemove" path:v4];
  }

  return v5;
}

- (BOOL)isContentRootToRemove:(id)a3
{
  return [(MSDContentInstaller *)self hasXattr:@"ContentRootToRemove" path:a3];
}

- (BOOL)hasXattr:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  objc_super v8 = (const char *)[@"MSDAnnotation" UTF8String];
  id v9 = v6;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  ssize_t v11 = getxattr(v10, v8, 0, 0, 0, 1);
  if (v11 < 0)
  {
    if (*__error() != 93)
    {
      uint64_t v15 = +[MSDLogModel sharedInstance];
      [v15 logMessage:1, @"[INF]", @"Could not extract extended file attributes from %@, returned %ld", v9, v11 prefix message];
      BOOL v16 = 0;
      id v14 = 0;
      id v12 = 0;
      goto LABEL_9;
    }
    BOOL v16 = 0;
    id v14 = 0;
    id v12 = 0;
  }
  else
  {
    id v12 = +[NSMutableData dataWithLength:v11];
    ssize_t v13 = getxattr(v10, v8, [v12 mutableBytes], v11, 0, 1);
    if (v13 < 0)
    {
      uint64_t v15 = +[MSDLogModel sharedInstance];
      [v15 logMessage:1, @"[INF]", @"Coud not extract extended file attributes from %@. File is expected to have extended attributes.", v9 prefix message];
      BOOL v16 = 0;
      id v14 = 0;
      goto LABEL_9;
    }
    [v12 setLength:v13];
    id v14 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
    if ([v14 isEqualToString:v7])
    {
      uint64_t v15 = +[MSDLogModel sharedInstance];
      BOOL v16 = 1;
      [v15 logMessage:1, @"[INF]", @"%@: Has expected xattr %@", v9, v7 prefix message];
LABEL_9:

      goto LABEL_10;
    }
    BOOL v16 = 0;
  }
LABEL_10:

  return v16;
}

- (BOOL)removeXattr:(id)a3
{
  id v3 = a3;
  id v4 = (const char *)[@"MSDAnnotation" UTF8String];
  id v5 = v3;
  int v6 = removexattr((const char *)[v5 fileSystemRepresentation], v4, 1);
  if (v6)
  {
    objc_super v8 = +[MSDLogModel sharedInstance];
    [v8 logMessage:1, @"[INF]", @"Cannot remove xattr for %@", v5 prefix message];
  }
  return v6 == 0;
}

- (BOOL)hasInheritanceACL:(id)a3
{
  acl_flagset_t flagset_p = 0;
  acl_entry_t entry_p = 0;
  id v3 = a3;
  file = acl_get_file((const char *)[v3 fileSystemRepresentation], ACL_TYPE_EXTENDED);
  if (file)
  {
    objc_super v8 = file;
    BOOL v9 = 0;
    if (!acl_get_entry(file, 0, &entry_p))
    {
      while (1)
      {
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          id v10 = +[MSDLogModel sharedInstance];
          ssize_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[ERR] %s", "-[MSDContentInstaller hasInheritanceACL:]");
          id v12 = __error();
          [v10 logMessage:2, v11, @"Failed to read ACL flagset from %@: %s", v3, strerror(*v12) prefix message];
        }
        else if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT) == 1 {
               && acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT) == 1)
        }
        {
          BOOL v9 = 1;
          break;
        }
        if (entry_p) {
          int v13 = -1;
        }
        else {
          int v13 = 0;
        }
        if (acl_get_entry(v8, v13, &entry_p)) {
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    if (*__error() != 2)
    {
      id v5 = +[MSDLogModel sharedInstance];
      int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[ERR] %s", "-[MSDContentInstaller hasInheritanceACL:]");
      id v7 = __error();
      [v5 logMessage:2, v6, @"Could not read ACL from %@: %s", v3, strerror(*v7), flagset_p prefix message];
    }
LABEL_13:
    BOOL v9 = 0;
  }

  return v9;
}

- (id)originalPathFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"/private/var/demo_backup/backup"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v4 = [v3 rangeOfString:@"/var/demo_backup/backup"];
  }
  if (v4)
  {
    objc_super v8 = +[MSDLogModel sharedInstance];
    [v8 logMessage:1, @"[INF]", @"Cannot calculate original path for %@", v3 prefix message];

    int v6 = 0;
  }
  else
  {
    int v6 = [v3 substringFromIndex:v5];
  }

  return v6;
}

@end