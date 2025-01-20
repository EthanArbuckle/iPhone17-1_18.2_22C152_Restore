void MSUCleanupUUIDTextFolder(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = +[NSURL fileURLWithPath:a1 isDirectory:1];
  [v1 URLByAppendingPathComponent:@"var/db/uuidtext"];
}

void debug(char *a1, ...)
{
  va_start(va, a1);
  if (serialLogLevel >= 2) {
    vfprintf(__stderrp, a1, va);
  }
  debugv((uint64_t)a1, (uint64_t)va);
}

void debugv(uint64_t a1, uint64_t a2)
{
  if (log_file)
  {
    v4 = +[NSDate date];
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    [v5 setDateFormat:@"HH:mm:ss"];
    v6 = [v5 stringFromDate:v4];
    id v7 = objc_alloc((Class)NSString);
    v8 = +[NSString stringWithUTF8String:a1];
    id v9 = [v7 initWithFormat:v8 arguments:a2];

    bzero(v11, 0x400uLL);
    v10 = +[NSString stringWithFormat:@"%@: %@", v6, v9];
    [v10 getCString:v11 maxLength:1023 encoding:4];

    fputs(v11, (FILE *)log_file);
  }
}

void error(char *a1, ...)
{
  va_start(va, a1);
  if (serialLogLevel) {
    vfprintf(__stderrp, a1, va);
  }
  debugv((uint64_t)a1, (uint64_t)va);
}

FILE *init_log(int a1, int a2)
{
  serialLogLevel = a2;
  mkdir("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  int v3 = MSUEarlyBootTaskSetupACLForPath(@"/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask");
  if (v3)
  {
    debug("MSUEarlyBootTask: Set up ACL on log folder\n");
  }
  else
  {
    error("MSUEarlyBootTask: Failed to set up ACL on log folder\n");
    v4 = getpwnam("mobile");
    if (v4)
    {
      uid_t pw_uid = v4->pw_uid;
      gid_t pw_gid = v4->pw_gid;
    }
    else
    {
      gid_t pw_gid = 501;
      uid_t pw_uid = 501;
    }
    lchown("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", pw_uid, pw_gid);
    lchmod("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask", 0x1EDu);
  }
  if (a1) {
    id v7 = "a+";
  }
  else {
    id v7 = "w+";
  }
  result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", v7);
  log_file = (uint64_t)result;
  if (v3)
  {
    fclose(result);
    if (MSUEarlyBootTaskSetupACLForPath(@"/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log")) {
      debug("MSUEarlyBootTas: Set up ACL on log file\n");
    }
    else {
      error("MSUEarlyBootTask: Failed to set up acl on log file\n");
    }
    result = fopen("/var/MobileSoftwareUpdate/Controller/MSUEarlyBootTask/MSUEarlyBootTask.log", "a+");
    log_file = (uint64_t)result;
  }
  return result;
}

uint64_t MSUEarlyBootTaskSetupACLForPath(void *a1)
{
  id v1 = a1;
  char v18 = 0;
  v2 = +[NSFileManager defaultManager];
  if ([v2 fileExistsAtPath:v1 isDirectory:&v18])
  {
    int v3 = [v2 attributesOfItemAtPath:v1 error:0];
    v4 = v3;
    if (!v3)
    {
      [v1 fileSystemRepresentation];
      error("Failed to read attributes of item at path: %s\n");
      goto LABEL_19;
    }
    NSFileAttributeType v5 = [v3 fileType];
    NSFileAttributeType v6 = v5;
    if (v5 == NSFileTypeDirectory)
    {
    }
    else
    {
      NSFileAttributeType v7 = [v4 fileType];

      if (v7 != NSFileTypeRegular)
      {
        memset(v19, 0, sizeof(v19));
        v8 = [v4 fileType];
        [v8 getCString:v19 maxLength:127 encoding:4];

        [v1 fileSystemRepresentation];
        error("File %s is a unsupported type(%s)");
LABEL_19:
        uint64_t v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    if (v18)
    {
      uint64_t v9 = MSUEarlyBootTaskSetupACLForPath_dirAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_dirAcl)
      {
        uint64_t v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(1);
        MSUEarlyBootTaskSetupACLForPath_dirAcl = v9;
        if (!v9)
        {
LABEL_22:
          error("%s: Failed to alloc acl..bailing\n", "MSUEarlyBootTaskSetupACLForPath");
          goto LABEL_23;
        }
      }
    }
    else
    {
      uint64_t v9 = MSUEarlyBootTaskSetupACLForPath_fileAcl;
      if (!MSUEarlyBootTaskSetupACLForPath_fileAcl)
      {
        uint64_t v9 = (uint64_t)MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(0);
        MSUEarlyBootTaskSetupACLForPath_fileAcl = v9;
        if (!v9) {
          goto LABEL_22;
        }
      }
    }
    v10 = getpwnam("nobody");
    if (v10)
    {
      uid_t pw_uid = v10->pw_uid;
      gid_t pw_gid = v10->pw_gid;
      id v13 = v1;
      if (acl_set_link_np((const char *)[v13 fileSystemRepresentation], ACL_TYPE_EXTENDED, (acl_t)v9))
      {
        v14 = __error();
        v15 = strerror(*v14);
        error("%s: Call to acl_set_file failed(%s)\n", "MSUEarlyBootTaskSetupACLForPath", v15);
      }
      else
      {
        id v16 = v13;
        lchown((const char *)[v16 fileSystemRepresentation], pw_uid, pw_gid);
        lchmod((const char *)[v16 fileSystemRepresentation], 0);
      }
      uint64_t v9 = 1;
      goto LABEL_23;
    }
    error("%s: Failed to get uid to set up acl\n");
    goto LABEL_19;
  }
  uint64_t v9 = 1;
LABEL_24:

  return v9;
}

uint64_t flush_log()
{
  uint64_t result = log_file;
  if (log_file)
  {
    fflush((FILE *)log_file);
    id v1 = (FILE *)log_file;
    return fclose(v1);
  }
  return result;
}

char *copy_path_for_booted_os_data()
{
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (!v0)
  {
    printf("%s: Failed to query gestalt for the BootManifestHash\n", "copy_path_for_booted_os_data");
    return 0;
  }
  CFDataRef v1 = v0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v12 = 0u;
  CFIndex Length = CFDataGetLength(v0);
  BytePtr = CFDataGetBytePtr(v1);
  if (!BytePtr)
  {
    printf("%s: Failed to get byte pointer from bootManifestHash data returned by gestalt\n");
LABEL_12:
    CFRelease(v1);
    return 0;
  }
  v4 = BytePtr;
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    printf("%s: Failed to create bootManifestHashString\n");
    goto LABEL_12;
  }
  NSFileAttributeType v6 = Mutable;
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *v4++;
      CFStringAppendFormat(v6, 0, @"%02x", v7);
      --Length;
    }
    while (Length);
  }
  CFStringGetCString(v6, buffer, 512, 0x8000100u);
  if (buffer[0])
  {
    v8 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    uint64_t v9 = v8;
    if (v8)
    {
      bzero(v8, 0x400uLL);
      snprintf(v9, 0x3FFuLL, "%s/%s-MSUData", "/private/var/MobileSoftwareUpdate/", buffer);
    }
    else
    {
      printf("%s: Failed to allocate memory for storing the path to the bootedOSData folder\n", "copy_path_for_booted_os_data");
    }
  }
  else
  {
    printf("%s: Failed to get C string representation of bootManifestHash\n", "copy_path_for_booted_os_data");
    uint64_t v9 = 0;
  }
  CFRelease(v1);
  CFRelease(v6);
  return v9;
}

uint64_t move_directory_hierarchy(char *a1, const char *a2)
{
  v19[0] = a1;
  v19[1] = 0;
  if (!a1 || !a2)
  {
    error("Invalid argument passed to %s", "move_directory_hierarchy");
    return 22;
  }
  v4 = fts_open(v19, 20, 0);
  if (!v4)
  {
    long long v13 = __error();
    long long v14 = strerror(*v13);
    error("Failed to open source directory hierarchy: %s\n", v14);
    return *__error();
  }
  NSFileAttributeType v5 = v4;
  NSFileAttributeType v6 = fts_read(v4);
  if (!v6)
  {
LABEL_21:
    uint64_t v17 = 0;
    goto LABEL_22;
  }
  unsigned int v7 = v6;
  while (1)
  {
    if (v7->fts_info == 7)
    {
      error("Got error while traversing source directory %s", a1);
      goto LABEL_21;
    }
    bzero(__str, 0x400uLL);
    size_t v8 = strlen(a1);
    snprintf(__str, 0x3FFuLL, "%s%s", a2, &v7->fts_path[v8]);
    int fts_info = v7->fts_info;
    if ((fts_info - 12) >= 2) {
      break;
    }
    if (copyfile(v7->fts_path, __str, 0, 0x12C000Fu))
    {
      uint64_t v17 = *__error();
      error("Failed to recreate symlink %s at %s: %d\n");
      goto LABEL_22;
    }
LABEL_16:
    unsigned int v7 = fts_read(v5);
    if (!v7) {
      goto LABEL_21;
    }
  }
  if (fts_info != 8)
  {
    if (fts_info == 1 && copyfile(v7->fts_path, __str, 0, 7u))
    {
      long long v16 = __error();
      uint64_t v17 = *v16;
      error("Failed to recreate folder %s at %s: %d\n", v7->fts_path, __str, *v16);
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  if (!copyfile(v7->fts_path, __str, 0, 0x13C000Fu))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    totalDataMoved += v7->fts_statp->st_size;
    *(double *)&totalTimeSpentInFileMoves = v12 - v11 + *(double *)&totalTimeSpentInFileMoves;
    goto LABEL_16;
  }
  uint64_t v17 = *__error();
  error("Failed to move regular file %s to %s: %d\n");
LABEL_22:
  fts_close(v5);
  return v17;
}

uint64_t moveFolderContentsIfItExists(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v13 = 0;
  NSFileAttributeType v5 = +[NSFileManager defaultManager];
  if (v3 && v4)
  {
    bzero(v16, 0x400uLL);
    bzero(v15, 0x400uLL);
    [v3 getCString:v16 maxLength:1023 encoding:4];
    [v4 getCString:v15 maxLength:1023 encoding:4];
    if (!v16[0] || !v15[0]) {
      error("%s: Unable to convert source/destination paths to C strings", "moveFolderContentsIfItExists");
    }
    debug("%s: Checking for source folder at: %s\n", "moveFolderContentsIfItExists", v16);
    [v5 fileExistsAtPath:v3 isDirectory:&v13];
    if (!v13)
    {
      debug("%s: Source folder %s does not exist\n");
      goto LABEL_18;
    }
    debug("%s: Folder exists..Attempting to move to %s\n", "moveFolderContentsIfItExists", v15);
    if ((move_directory_hierarchy(v16, v15) & 0x80000000) == 0)
    {
      id v12 = 0;
      [v5 removeItemAtPath:v3 error:&v12];
      id v6 = v12;
      if (v6)
      {
        unsigned int v7 = v6;
        memset(v14, 0, sizeof(v14));
        size_t v8 = [v6 description];
        [v8 getCString:v14 maxLength:511 encoding:4];

        if (LOBYTE(v14[0])) {
          uint64_t v9 = (const char *)v14;
        }
        else {
          uint64_t v9 = "Unable to parse error reason";
        }
        error("%s: Failed to remove %s folder(%s)\n", "moveFolderContentsIfItExists", v16, v9);

        goto LABEL_14;
      }
      debug("%s: Successfully moved %s to %s\n");
LABEL_18:
      uint64_t v10 = 1;
      goto LABEL_19;
    }
    error("%s: Failed to move folder contents\n");
  }
  else
  {
    error("%s: Invalid arguments passed to source/destination");
  }
LABEL_14:
  uint64_t v10 = 0;
LABEL_19:

  return v10;
}

int main(int argc, const char **argv, const char **envp)
{
  __chkstk_darwin(*(void *)&argc, argv, envp);
  bzero(&v206, 0x878uLL);
  if (statfs("/", &v206)) {
    main_cold_1();
  }
  if ((v206.f_flags & 0x40000000) == 0)
  {
    int v3 = access("/usr/appleinternal/bin/snapshottool", 0);
    id v4 = "/usr/local/bin/snapshottool";
    if (!v3) {
      id v4 = "/usr/appleinternal/bin/snapshottool";
    }
    *(void *)&v232[0] = v4;
    *((void *)&v232[0] + 1) = "golive";
    *(void *)&v232[1] = "cryptexes";
    *((void *)&v232[1] + 1) = 0;
    execForMSUEarlyBootTask((const char **)v232);
  }
  NSFileAttributeType v5 = +[NSFileManager defaultManager];
  char v196 = 0;
  puts("MSUEarlyBootTask: MSUEarlyBootTask running");
  time_t v195 = 0;
  time(&v195);
  id v6 = copy_path_for_booted_os_data();
  if (!v6)
  {
    printf("%s: Unable to get path for booted OS data\n", "main");
    goto LABEL_242;
  }
  unsigned int v7 = v6;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%s", v6];
  if (&_os_variant_uses_ephemeral_storage)
  {
    int v9 = os_variant_uses_ephemeral_storage();
    if (v9) {
      uint64_t v10 = "MSUEarlyBootTask running in limited env";
    }
    else {
      uint64_t v10 = "MSUEarlyBootTask running in normal env";
    }
    puts(v10);
    if (v9)
    {
      printf("%s: MSUEarlyBootTask running in a limited environment and is not supported..Goodbye!\n", "main");
      goto LABEL_241;
    }
  }
  else
  {
    puts("MSUEarlyBootTask is running in normal env(default)");
  }
  printf("%s: Content from the ramdisk will be present at %s if it exists\n", "main", v7);
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s", v8, "EarlyBootTaskHasCompleted.txt"];
  [v5 fileExistsAtPath:v8 isDirectory:&v196];
  if (!v196)
  {
    puts("MSUEarlyBootTask: I have nothing to do. Goodbye!!");
    goto LABEL_240;
  }
  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s", v8, "PluginHasCompleted.txt"];
  if ([v5 fileExistsAtPath:v12])
  {
    init_log(1, 3);
    char v13 = ctime(&v195);
    debug("MSUEarlyBootTask running. Found cookie written by DataMigrator indicating the first boot operations have already completed: %s\n", v13);
    id v194 = 0;
    [v5 removeItemAtPath:v8 error:&v194];
    id v14 = v194;
    long long v15 = v14;
    if (v14)
    {
      memset(v232, 0, 512);
      long long v16 = [v14 description];
      [v16 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        uint64_t v17 = (const char *)v232;
      }
      else {
        uint64_t v17 = "Unable to parse error reason";
      }
      error("%s: Failed to remove folder stashed by previous ramdisk : %s : Task exiting cleanly\n", "main", v17);
    }
    else
    {
      debug("%s: Successfully removed folder stashed by previous ramdisk\n", "main");
    }
    long long v19 = ctime(&v195);
    printf("%s: MSUDataMigrator has nothing more to do(%s)..Goodbye!!\n", "main", v19);

    goto LABEL_241;
  }
  init_log(0, 3);
  long long v18 = ctime(&v195);
  debug("%s: MSUEarlyBootTask running..Found data created by previous ramdisk. Assuming first boot after update at time %s\n", "main", v18);
  debug("%s: MSUEarlyBootTask: Enabling vnode rapid aging\n", "main");
  *(void *)&v232[0] = 0x4400000001;
  v208.st_dev = 1;
  if (sysctl((int *)v232, 2u, 0, 0, &v208, 0)) {
    error("%s: MSUEarlyBootTask: Failed to enable vnode rapid aging\n", "main");
  }
  else {
    debug("%s: MSUEarlyBootTask: Successfully enabled rapid vnode aging\n", "main");
  }
  if (MSUEarlyBootTaskSetupACLForPath(v8)) {
    debug("MSUEarlyBootTask: Successfully set up ACL for folder stashed by ramdisk\n");
  }
  else {
    error("MSUEarlyBootTask: Failed to set up ACL for folder stashed by ramdisk\n");
  }

  id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s", v8, "LOW_SPACE_CLEANUP_RUN.txt"];
  id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%s", v8, "SYSTEM_APPS_STAGE_FAILED.txt"];
  if ([v5 fileExistsAtPath:v20]) {
    debug("MSUEarlyBootTask: Low space cleanup was done on last restore\n");
  }
  if ([v5 fileExistsAtPath:v21]) {
    debug("MSUEarlyBootTask: Staging of staged_system_apps failed during the last restore\n");
  }
  debug("MSUEarlyBootTasks: Cleaning up stale stashed paths\n");
  id v193 = 0;
  long long v22 = [v5 contentsOfDirectoryAtPath:@"/private/var/MobileSoftwareUpdate/" error:&v193];
  id v23 = v193;
  v179 = v5;
  if (v23)
  {
    memset(v232, 0, 512);
    v183 = v23;
    long long v24 = [v23 description];
    [v24 getCString:v232 maxLength:511 encoding:4];

    if (LOBYTE(v232[0])) {
      long long v25 = (const char *)v232;
    }
    else {
      long long v25 = "Unable to parse error reason";
    }
    error("%s: Failed to search for stale stashed folders: %s\n", "main", v25);
  }
  else
  {
    id v170 = v21;
    id v173 = v20;
    v175 = v7;
    id v177 = v11;
    long long v191 = 0u;
    long long v192 = 0u;
    long long v189 = 0u;
    long long v190 = 0u;
    id v26 = v22;
    id v27 = [v26 countByEnumeratingWithState:&v189 objects:v205 count:16];
    if (v27)
    {
      id v28 = v27;
      v183 = 0;
      uint64_t v29 = *(void *)v190;
      long long v30 = &APFSOverProvModel_ptr;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v190 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v189 + 1) + 8 * i);
          bzero(v232, 0x400uLL);
          id v33 = [objc_alloc((Class)v30[122]) initWithFormat:@"%s/%@", "/private/var/MobileSoftwareUpdate/", v32];
          if ([v33 containsString:@"-MSUData"]
            && ([v33 isEqualToString:v8] & 1) == 0)
          {
            [v33 getCString:v232 maxLength:1023 encoding:1];
            debug("%s: Removing folder :%s:\n", "main", (const char *)v232);

            id v188 = 0;
            [v5 removeItemAtPath:v33 error:&v188];
            id v34 = v188;
            if (v34)
            {
              long long v231 = 0u;
              long long v230 = 0u;
              long long v229 = 0u;
              long long v228 = 0u;
              long long v227 = 0u;
              long long v226 = 0u;
              long long v225 = 0u;
              long long v224 = 0u;
              long long v223 = 0u;
              long long v222 = 0u;
              long long v221 = 0u;
              long long v220 = 0u;
              long long v219 = 0u;
              long long v218 = 0u;
              long long v217 = 0u;
              long long v216 = 0u;
              long long v215 = 0u;
              long long v214 = 0u;
              long long v213 = 0u;
              long long v212 = 0u;
              long long v211 = 0u;
              long long v210 = 0u;
              long long v209 = 0u;
              memset(&v208, 0, sizeof(v208));
              v183 = v34;
              long long v35 = [v34 description];
              [v35 getCString:&v208 maxLength:511 encoding:4];

              long long v36 = (const char *)&v208;
              if (!LOBYTE(v208.st_dev)) {
                long long v36 = "Unable to parse error reason";
              }
              error("%s: Failed to erase folder %s : %s\n", "main", (const char *)v232, v36);
            }
            else
            {
              v183 = 0;
            }
            long long v30 = &APFSOverProvModel_ptr;
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v189 objects:v205 count:16];
      }
      while (v28);
    }
    else
    {
      v183 = 0;
    }

    unsigned int v7 = v175;
    id v11 = v177;
    id v20 = v173;
    id v21 = v170;
  }
  if ([v5 fileExistsAtPath:v11])
  {
    debug("EarlyBootTask has already completed but DataMigrator plugin has not been run for this build\n");

    goto LABEL_241;
  }
  v171 = v21;
  v172 = v22;
  v174 = v20;
  v176 = (char *)v7;
  MSUCleanupUUIDTextFolder(@"/");
  debug("%s: Running fixup var operations\n", "main");
  debug("entering %s\n", "update_var_directory_hierarchy");
  if (mkdir("/private/var/MobileSoftwareUpdate/mnt1", 0x1C0u) && *__error() != 17)
  {
    long long v39 = __error();
    long long v40 = strerror(*v39);
    error("Failed to create system volume mount point at %s : %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v40);
    goto LABEL_129;
  }
  debug("Created system mount point at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if ((v206.f_flags & 0x40000000) != 0)
  {
    long long v38 = strrchr(v206.f_mntfromname, 64);
    if (v38) {
      f_mntfromname = v38 + 1;
    }
    else {
      f_mntfromname = v206.f_mntfromname;
    }
  }
  else
  {
    f_mntfromname = v206.f_mntfromname;
  }
  long long v41 = +[NSString stringWithUTF8String:f_mntfromname];
  if (!v41)
  {
    error("Failed to get bsd node for root dev...\n");
    goto LABEL_129;
  }
  if ((v206.f_flags & 0x40000000) == 0)
  {
    debug("System is currently rooted from a live filesystem\n");
    long long v42 = copy_root_snapshot_name_from_dt();
    if (!v42)
    {
      error("Failed to copy default boot snapshot name");

      goto LABEL_77;
    }
    v43 = v42;
    debug("Will attempt to mount snapshot %s at %s\n", v42, "/private/var/MobileSoftwareUpdate/mnt1");
    id v44 = v41;
    if (msuearlyboottask_mount_filesystem((const char *)[v44 fileSystemRepresentation], v43, 1))
    {
      free(v43);
      error("Failed to mount snapshot..\n");

      goto LABEL_129;
    }
    debug("Successfully mounted system snapshot..\n");
    msuearlyboottask_dump_mounted_filesystem_info();
    free(v43);
    goto LABEL_85;
  }
  debug("System is currently rooted from a snapshot\n");
  id v45 = v41;
  if (msuearlyboottask_mount_filesystem((const char *)[v45 fileSystemRepresentation], 0, 0))
  {
    error("Failed to mount system volume..\n");
LABEL_128:

    goto LABEL_129;
  }
  v46 = +[NSString stringWithUTF8String:v206.f_mntfromname];
  v47 = v46;
  if (v46)
  {
    id v48 = v46;
    *(void *)&v208.st_dev = 0;
    v49 = +[NSRegularExpression regularExpressionWithPattern:@"(.+@)?(\\/dev\\/.+$)" options:1 error:&v208];
    id v50 = *(id *)&v208.st_dev;
    v180 = v48;
    v168 = v49;
    if (v50)
    {
      bzero(v232, 0x400uLL);
      v51 = [v50 description];
      [v51 getCString:v232 maxLength:1024 encoding:4];

      if (LOBYTE(v232[0])) {
        v52 = (const char *)v232;
      }
      else {
        v52 = "Unknown";
      }
      error("Error %s encountered creating regular expression..\n", v52);
      v53 = &stru_10000C688;
    }
    else
    {
      v73 = [v49 firstMatchInString:v48 options:0 range:[v48 length]];
      v74 = v73;
      if (v73)
      {
        id v75 = [v73 rangeAtIndex:1];
        if (v76) {
          id v77 = v75;
        }
        else {
          id v77 = 0;
        }
        [v48 substringWithRange:v77, v76];
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = &stru_10000C688;
      }

      NSFileAttributeType v5 = v179;
    }

    if ([(__CFString *)v53 hasSuffix:@"@"])
    {
      uint64_t v78 = [(__CFString *)v53 substringToIndex:(char *)[(__CFString *)v53 length] - 1];

      v53 = (__CFString *)v78;
    }
  }
  else
  {
    error("could not create string from f_mntfromname %s\n", v206.f_mntfromname);
    v53 = &stru_10000C688;
  }

  bzero(v232, 0x400uLL);
  [(__CFString *)v53 getCString:v232 maxLength:1024 encoding:4];
  int v79 = open("/private/var/MobileSoftwareUpdate/mnt1", 0);
  if (v79 < 0)
  {
    v82 = __error();
    strerror(*v82);
    error("Failed to open system volume mount point(%s): %s\n");
LABEL_124:

    goto LABEL_128;
  }
  int v80 = v79;
  debug("Reverting to snapshot(%s)\n", (const char *)v232);
  if (fs_snapshot_revert(v80, (const char *)v232, 0))
  {
    v81 = __error();
    strerror(*v81);
    error("revert snapshot operation failed: %s\n");
LABEL_127:

    close(v80);
    goto LABEL_128;
  }
  debug("Reverting system snapshot succeeded. Remounting.\n");
  if (close(v80))
  {
    v83 = __error();
    strerror(*v83);
    error("Unable to close dir(%s): %s\n");
    goto LABEL_127;
  }
  debug("Unmounting system volume..\n");
  msuearlyboottask_unmount_filesystem();
  debug("Remounting system volume at %s\n", "/private/var/MobileSoftwareUpdate/mnt1");
  if (msuearlyboottask_mount_filesystem((const char *)[v45 fileSystemRepresentation], 0, 0))
  {
    error("Failed to mount system volume..\n");
    goto LABEL_124;
  }
  debug("Successfully re-mounted system volume...\n");
  msuearlyboottask_dump_mounted_filesystem_info();

LABEL_85:
  *(_OWORD *)v207 = off_10000C418;
  v54 = fts_open(v207, 84, 0);
  if (!v54)
  {
    v71 = __error();
    v72 = strerror(*v71);
    error("unable to open restored /private/var: %s\n", v72);
    int fts_errno = -1;
    goto LABEL_168;
  }
  v55 = v54;
  v56 = v5;
  v57 = fts_read(v54);
  if (!v57)
  {
LABEL_106:
    if (*__error())
    {
      int fts_errno = *__error();
      v69 = __error();
      v70 = strerror(*v69);
      error("fts_read failed: %s\n", v70);
    }
    else
    {
      int fts_errno = 0;
    }
    goto LABEL_167;
  }
  v58 = v57;
  while (1)
  {
    int fts_info = v58->fts_info;
    if (fts_info == 1)
    {
      memset(&v208, 0, sizeof(v208));
      memcpy(v232, "/private/var", sizeof(v232));
      __strlcat_chk();
      if (lstat((const char *)v232, &v208))
      {
        if (*__error() == 2)
        {
          if (ramrod_create_directory_with_class(v232, v58->fts_statp->st_mode, v58->fts_statp->st_uid, v58->fts_statp->st_gid, -1, 0))error("ramrod_create_directory failed for %s\n"); {
          else
          }
            debug("Successfully created directory %s\n");
        }
        else
        {
          v67 = __error();
          strerror(*v67);
          debug("stat failed on %s: %s\n");
        }
      }
      else if ((v208.st_mode & 0xF000) == 0x4000)
      {
        int st_mode = v58->fts_statp->st_mode;
        if (v208.st_mode != st_mode)
        {
          debug("fixing permissions on %s: %o -> %o\n", (const char *)v232, v208.st_mode, st_mode);
          if (chmod((const char *)v232, v58->fts_statp->st_mode))
          {
            v61 = __error();
            v62 = strerror(*v61);
            error("unable to fix permissions: %s\n", v62);
          }
        }
        fts_statp = v58->fts_statp;
        uid_t st_uid = fts_statp->st_uid;
        gid_t st_gid = fts_statp->st_gid;
        if (*(void *)&v208.st_uid != __PAIR64__(st_gid, st_uid))
        {
          debug("fixing ownership on %s: %d:%d -> %d:%d\n", (const char *)v232, v208.st_uid, v208.st_gid, st_uid, st_gid);
          if (chown((const char *)v232, v58->fts_statp->st_uid, v58->fts_statp->st_gid))
          {
            v66 = __error();
            strerror(*v66);
            error("unable to fix ownership: %s\n");
          }
        }
      }
      else
      {
        debug("%s is a directory in the new image but not on the existing partition\n");
      }
      goto LABEL_105;
    }
    if (fts_info == 7) {
      break;
    }
LABEL_105:
    v58 = fts_read(v55);
    if (!v58) {
      goto LABEL_106;
    }
  }
  v105 = strerror(v58->fts_errno);
  error("fts_read error %d: %s\n", 7, v105);
  int fts_errno = v58->fts_errno;
  if (!fts_errno) {
    goto LABEL_106;
  }
LABEL_167:
  fts_close(v55);
  NSFileAttributeType v5 = v56;
LABEL_168:
  debug("Unmounting system volume from %s.\n", "/private/var/MobileSoftwareUpdate/mnt1");
  msuearlyboottask_unmount_filesystem();
  msuearlyboottask_dump_mounted_filesystem_info();

  if (!fts_errno)
  {
LABEL_77:
    debug("%s: Successfully completed fixup_var operations\n", "main");
    goto LABEL_130;
  }
LABEL_129:
  error("%s: Failed to fixup var(Not fatal)..\n", "main");
LABEL_130:
  debug("%s: Checking for and creating overprovisioning file if needed\n", "main");
  int v84 = APFSOverProvModel();
  id v178 = v11;
  if (v84 != 1)
  {
    debug("%s: APFS overprovisioning model is %d. Not reserving space for overprovisioning file \n", "msu_reserve_space_for_overprovisioning", v84);
LABEL_141:
    debug("%s: Succesfully handled checks for overprovisioning file/volume\n", "main");
    goto LABEL_174;
  }
  long long v202 = 0u;
  memset(&v203, 0, sizeof(v203));
  long long v201 = 0u;
  uint64_t v199 = 0;
  off_t v200 = 0;
  v237[0] = @"IOParentMatch";
  CFStringRef v235 = @"IOPropertyMatch";
  CFStringRef v233 = @"EmbeddedDeviceTypeRoot";
  v234 = &__kCFBooleanTrue;
  v85 = +[NSDictionary dictionaryWithObjects:&v234 forKeys:&v233 count:1];
  v236 = v85;
  v86 = +[NSDictionary dictionaryWithObjects:&v236 forKeys:&v235 count:1];
  v237[1] = @"IOPropertyMatch";
  v238[0] = v86;
  v238[1] = &off_10000C7C0;
  v87 = +[NSDictionary dictionaryWithObjects:v238 forKeys:v237 count:2];

  if (!stat("/private/var/.overprovisioning_file", &v203))
  {
    debug("%s: Space already reserved for overprovisioning\n", "msu_reserve_space_for_overprovisioning");

    goto LABEL_141;
  }
  CFDictionaryRef v88 = v87;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v88);
  if (!MatchingService)
  {
    error("%s: Failed to get IOService for %s\n");
LABEL_144:

    goto LABEL_173;
  }
  io_registry_entry_t v90 = MatchingService;
  debug("%s: Successfully obtained ioService for %s\n", "msu_reserve_space_for_overprovisioning", "EmbeddedDeviceTypeRoot");
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v90, @"BSD Name", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    error("%s: no BSD device name for service %s");
    goto LABEL_144;
  }
  CFStringRef v92 = CFProperty;
  CFTypeID v93 = CFGetTypeID(CFProperty);
  if (v93 != CFStringGetTypeID())
  {
    error("%s: returnbed BSD device name for service %s is wrong type");
LABEL_147:
    int v94 = 5;
LABEL_171:
    CFRelease(v92);
    goto LABEL_172;
  }
  bzero(v232, 0x400uLL);
  if (!CFStringGetCString(v92, (char *)v232, 1023, 0x8000100u))
  {
    error("%s: failed to create C string from BSD name\n");
    goto LABEL_147;
  }
  bzero(&v208, 0x400uLL);
  snprintf((char *)&v208, 0x3FFuLL, "/dev/%s", (const char *)v232);
  debug("%s: Full path to device node for service %s is :%s:\n", "msu_reserve_space_for_overprovisioning", "EmbeddedDeviceTypeRoot", (const char *)&v208);
  bzero(v207, 0x400uLL);
  memset(&v204, 0, sizeof(v204));
  if (!stat((const char *)&v208, &v204))
  {
    if ((v204.st_mode & 0xF000) == 0x6000)
    {
      memset(buf, 0, sizeof(buf));
      devname_r(v204.st_rdev, 0x2000u, (char *)buf, 32);
      snprintf((char *)v207, 0x3FFuLL, "/dev/%s", (const char *)buf);
      goto LABEL_150;
    }
    error("%s: %s is not a block device\n", "msu_partition_raw_device_for_block_device", (const char *)&v208);
    int v94 = -1;
    goto LABEL_163;
  }
  int v94 = *__error();
  v95 = strerror(v94);
  error("%s: unable to stat block device %s: %s\n", "msu_partition_raw_device_for_block_device", (const char *)&v208, v95);
  if (v94)
  {
LABEL_163:
    error("%s: Failed to get raw device node for block device %s\n");
    goto LABEL_171;
  }
LABEL_150:
  int v96 = open((const char *)v207, 0);
  if (v96 == -1)
  {
    int v94 = *__error();
    v106 = __error();
    strerror(*v106);
    error("%s: Unable to open device: %s\n");
    goto LABEL_171;
  }
  int v97 = v96;
  int v198 = 0;
  uint64_t v197 = 0;
  if (ioctl(v96, 0x40046418uLL, &v198) == -1)
  {
    int v94 = *__error();
    v152 = __error();
    strerror(*v152);
    error("%s: unable to get DKIOCGETBLOCKSIZE: %s\n");
LABEL_249:
    int v103 = -1;
    goto LABEL_259;
  }
  if (ioctl(v97, 0x40086419uLL, &v197) == -1)
  {
    int v94 = *__error();
    v153 = __error();
    strerror(*v153);
    error("%s: unable to get DKIOCGETBLOCKCOUNT: %s \n");
    goto LABEL_249;
  }
  id v181 = v8;
  v98 = v5;
  uint64_t v99 = v197 * v198;
  uint64_t v100 = v99 + 0x3FFFFFFF;
  if (v99 >= 0) {
    uint64_t v100 = v197 * v198;
  }
  debug("%s: device_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v197 * v198, v100 >> 30);
  if (v99 <= 0x1900000063) {
    off_t v101 = v99 / 100;
  }
  else {
    off_t v101 = 0x40000000;
  }
  debug("%s: file_size = %llu (%lld GB)\n", "msu_reserve_space_for_overprovisioning", v101, v101 / 0x40000000);
  int v102 = open_dprotected_np("/private/var/.overprovisioning_file", 2562, 4, 0, 384);
  int v103 = v102;
  if (v102 == -1)
  {
    int v94 = *__error();
    v154 = __error();
    strerror(*v154);
    error("%s: Could not open %s with error %s\n");
    goto LABEL_258;
  }
  long long v201 = 0x30000000EuLL;
  *(void *)&long long v202 = v101;
  if (fcntl(v102, 42, &v201) != -1) {
    goto LABEL_160;
  }
  if (*__error() != 28)
  {
    if (!*__error()) {
      goto LABEL_160;
    }
    v157 = __error();
    v158 = strerror(*v157);
    error("%s: fcntl(2) failed trying to allocate contiguous space all at once with error: %s", "msu_reserve_space_for_overprovisioning", v158);
    goto LABEL_266;
  }
  LODWORD(v201) = 10;
  if (fcntl(v103, 42, &v201) != -1) {
    goto LABEL_160;
  }
  if (*__error() == 28)
  {
    LODWORD(v201) = 8;
    if (fcntl(v103, 42, &v201) == -1)
    {
      int v94 = *__error();
      v155 = __error();
      strerror(*v155);
      error("%s: preallocation of %llu bytes failed with error: (%s). (Allocated %llu bytes)\n");
      goto LABEL_258;
    }
LABEL_160:
    if (ftruncate(v103, v101))
    {
      int v94 = *__error();
      v104 = __error();
      strerror(*v104);
      error("%s: failed to write to %s file to establish the size (%s).\n");
      goto LABEL_258;
    }
    if (fcntl(v103, 51, 0))
    {
      int v94 = *__error();
      v156 = __error();
      strerror(*v156);
      error("%s: failed to fullsync %s file with %s.\n");
      goto LABEL_258;
    }
    uint64_t v199 = 0;
    off_t v200 = v101;
    if (fcntl(v103, 100, &v199) == -1)
    {
      int v94 = *__error();
      v159 = __error();
      v160 = strerror(*v159);
      error("%s: F_TRIM_ACTIVE_FILE failed with: %s \n", "msu_reserve_space_for_overprovisioning", v160);
      close(v103);
      if (unlink("/private/var/.overprovisioning_file"))
      {
        v161 = __error();
        v162 = strerror(*v161);
        error("%s: failed to unlink %s: %s \n", "msu_reserve_space_for_overprovisioning", "/private/var/.overprovisioning_file", v162);
        int v94 = *__error();
      }
      int v103 = -1;
    }
    else
    {
LABEL_266:
      int v94 = 0;
    }
  }
  else
  {
    if (!*__error()) {
      goto LABEL_160;
    }
    int v94 = *__error();
    v163 = __error();
    strerror(*v163);
    error("%s: fcntl(2) failed trying to allocate contiguous space with error: %s");
  }
LABEL_258:
  NSFileAttributeType v5 = v98;
  id v8 = v181;
LABEL_259:
  CFRelease(v92);
  if ((v97 & 0x80000000) == 0) {
    close(v97);
  }
  if ((v103 & 0x80000000) == 0) {
    close(v103);
  }
LABEL_172:

  if (!v94) {
    goto LABEL_141;
  }
LABEL_173:
  error("%s: Unable to reserve space for overprovisioning. Continuing anyways\n", "main");
LABEL_174:
  debug("%s: Checking if clearing out of FIPS data file is needed\n", "main");
  id v107 = [objc_alloc((Class)NSString) initWithFormat:@"%@/ClearFIPSDataFile.txt", v8];
  if ([v5 fileExistsAtPath:v107])
  {
    id v108 = [objc_alloc((Class)NSString) initWithFormat:@"%s/db/FIPS/fips_data", "/private/var"];
    if (![v5 fileExistsAtPath:v108])
    {
      debug("%s: Nothing to do since no FIPS data file present at %s/db/FIPS/fips_data\n", "main", "/private/var");
      v110 = v183;
      goto LABEL_183;
    }
    debug("%s: Clearing out FIPS data file\n", "main");

    id v187 = 0;
    [v5 removeItemAtPath:v108 error:&v187];
    id v109 = v187;
    if (v109)
    {
      memset(v232, 0, 512);
      v110 = v109;
      v111 = [v109 description];
      [v111 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        v112 = (const char *)v232;
      }
      else {
        v112 = "Unable to parse error reason";
      }
      error("%s: Failed to clear fips data file: %s\n", "main", v112);
LABEL_183:
    }
    id v186 = 0;
    [v5 removeItemAtPath:v107 error:&v186];
    id v113 = v186;
    if (v113)
    {
      memset(v232, 0, 512);
      v183 = v113;
      v114 = [v113 description];
      [v114 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        v115 = (const char *)v232;
      }
      else {
        v115 = "Unable to parse error reason";
      }
      error("%s: Failed to clear fips data cookie: %s\n", "main", v115);
    }
    else
    {
      v183 = 0;
    }
  }
  else
  {
    debug("%s: Clearing of FIPS data file not required.\n", "main");
    id v108 = 0;
  }
  id v116 = [objc_alloc((Class)NSString) initWithFormat:@"%@/MobileAsset/PreinstalledAssetsV2", v8];
  id v165 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "/private/var/MobileAsset/PreinstalledAssetsV2"];
  v166 = v116;
  if (moveFolderContentsIfItExists(v116, v165)) {
    debug("Done moving of preinstalled MobileAssets to data volume\n");
  }
  else {
    error("Failed to move preinstalled MobileAssets to data volume\n");
  }
  id v117 = [objc_alloc((Class)NSString) initWithFormat:@"%@/wireless/Library/Logs", v8];
  id v118 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "/private/var/wireless/Library"];
  v164 = v117;
  if (moveFolderContentsIfItExists(v117, v118)) {
    debug("Done moving of Wireless/Library folder to data volume\n");
  }
  else {
    error("Failed to move Wireless/Library folder to data volume\n");
  }
  debug("Creating cookie file for earlyBootTaskHasCompletedOnce\n");
  id v167 = v107;
  v169 = v118;
  v182 = v108;
  if ([v5 createFileAtPath:v11 contents:0 attributes:0]) {
    debug("Successfully created earlyBootTaskHasCompletedOnceCookie\n");
  }
  else {
    error("Failed to create earlyBootTaskHasCompletedOnceCookie\n");
  }
  id v119 = v8;
  id v120 = [objc_alloc((Class)NSString) initWithFormat:@"%@/staged_system_apps", v8];
  unsigned int v121 = [v5 fileExistsAtPath:v120];
  id v122 = v120;
  v123 = (const char *)[v122 UTF8String];
  if (v123) {
    v124 = v123;
  }
  else {
    v124 = "(update volume MSUData staged_system_apps directory)";
  }
  id v125 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "/private/var/staged_system_apps"];
  v126 = v5;
  unsigned int v127 = [v5 fileExistsAtPath:v125];
  id v128 = v125;
  v129 = [v128 UTF8String];
  v130 = v129;
  if (v129) {
    v131 = v129;
  }
  else {
    v131 = "(data volume staged_system_apps directory)";
  }
  v132 = "does not exist";
  if (v127) {
    v133 = "exists";
  }
  else {
    v133 = "does not exist";
  }
  v134 = "Creating the latter.";
  if (v127) {
    v134 = "Clearing the latter.";
  }
  if (v121) {
    v132 = "exists";
  }
  v135 = "Skipping.";
  if (v121) {
    v135 = v134;
  }
  debug("%s: Datamigrator is supported on target. %s %s, and %s %s. %s\n", "main", v124, v132, v131, v133, v135);
  if (!v121)
  {
    NSFileAttributeType v5 = v126;
    id v8 = v119;
    goto LABEL_238;
  }
  if (v127)
  {

    id v185 = 0;
    [v126 removeItemAtPath:v128 error:&v185];
    id v136 = v185;
    id v8 = v119;
    if (v136)
    {
      memset(v232, 0, 512);
      v183 = v136;
      v137 = [v136 description];
      [v137 getCString:v232 maxLength:511 encoding:4];

      if (LOBYTE(v232[0])) {
        v138 = (const char *)v232;
      }
      else {
        v138 = "Unable to parse error reason";
      }
      error("%s: Failed to remove %s on the data volume: %s. Skipping.\n", "main", v131, v138);
    }
    else
    {
      v183 = 0;
    }
  }
  else
  {
    id v8 = v119;
  }
  v232[0] = (unint64_t)[v122 fileSystemRepresentation];
  v139 = fts_open((char *const *)v232, 84, 0);
  if (v139)
  {
    v140 = v139;
    debug("Setting up ACL's for the staged_system_apps on update volume\n");
    v141 = fts_read(v140);
    if (v141)
    {
      v142 = v141;
      while (2)
      {
        switch(v142->fts_info)
        {
          case 1u:
          case 8u:
            v144 = +[NSString stringWithUTF8String:v142->fts_path];
            MSUEarlyBootTaskSetupACLForPath(v144);

            goto LABEL_230;
          case 6u:
            goto LABEL_230;
          case 7u:
            v145 = strerror(v142->fts_errno);
            error("fts_read error %d: %s\n", 7, v145);
            error("Failed to setup ACL for staged system apps\n");
            break;
          default:
            error("fts_read found unsupported file type: %d\n", v142->fts_info);
LABEL_230:
            v142 = fts_read(v140);
            if (!v142) {
              break;
            }
            continue;
        }
        break;
      }
    }
    fts_close(v140);
  }
  debug("Done setting up ACL's for staged_system_apps\n");
  if (v130)
  {
    int directory_with_class = ramrod_create_directory_with_class(v130, 509, 0x1F5u, 0x1F5u, 4, 1);
    NSFileAttributeType v5 = v126;
    if (directory_with_class)
    {
      error("%s: Failed to create %s - ramrod_create_directory_with_class error %lld. Skipping\n", "main", v130, directory_with_class);
      goto LABEL_238;
    }
    debug("MSUEarlyBootTask: Created staged_system_apps folder. Updating permissions\n");
    v150 = +[NSString stringWithUTF8String:v130];
    char v151 = MSUEarlyBootTaskSetupACLForPath(v150);

    v147 = v178;
    if (v151) {
      debug("Successfully setup ACL for staged_system_apps folder\n");
    }
    else {
      error("Failed to setup ACL for staged_system_apps folder\n");
    }
  }
  else
  {
    error("%s: Failed to create %s - path was NULL. Skipping.\n", "main", "(data volume staged_system_apps directory)");
    NSFileAttributeType v5 = v126;
LABEL_238:
    v147 = v178;
  }
  id v11 = v167;
  time_t v184 = 0;
  time(&v184);
  v148 = ctime(&v184);
  debug("Operations completed at %s\n", v148);
  flush_log();
  free(v176);

LABEL_240:
LABEL_241:

LABEL_242:
  return 0;
}

uint64_t execForMSUEarlyBootTask(const char **a1)
{
  pid_t v24 = 0;
  *(void *)id v26 = -1;
  if (pipe(v26))
  {
    v2 = *a1;
    int v3 = __error();
    id v4 = strerror(*v3);
    error("%s: pipe failed while preparing to execute %s: %s\n", "execForMSUEarlyBootTask", v2, v4);
    return 0xFFFFFFFFLL;
  }
  posix_spawn_file_actions_t v23 = 0;
  posix_spawn_file_actions_init(&v23);
  posix_spawn_file_actions_adddup2(&v23, v26[1], 1);
  posix_spawn_file_actions_addclose(&v23, v26[0]);
  uint64_t v6 = posix_spawn(&v24, *a1, &v23, 0, (char *const *)a1, 0);
  if (v6)
  {
    uint64_t v5 = v6;
    unsigned int v7 = *a1;
    id v8 = strerror(v6);
    error("%s: posix_spawn %s failed: %s\n", "execForMSUEarlyBootTask", v7, v8);
    close(v26[0]);
    goto LABEL_5;
  }
  bzero(v25, 0x400uLL);
  int v10 = v26[0];
  close(v26[1]);
  v26[1] = -1;
  ssize_t v11 = read(v10, v25, 0x400uLL);
  if (v11 >= 1)
  {
    do
    {
      execlogfunction(v11, v12, v13, v14, v15, v16, v17, v18, v11);
      ssize_t v11 = read(v10, v25, 0x400uLL);
    }
    while (v11 > 0);
  }
  int v22 = 0;
  if (waitpid(v24, &v22, 0) == -1)
  {
    uint64_t v5 = *__error();
    long long v19 = *a1;
    id v20 = __error();
    id v21 = strerror(*v20);
    error("%s: waitpid failed for %s: %s\n", "execForMSUEarlyBootTask", v19, v21);
  }
  else
  {
    if ((v22 & 0x7F) == 0x7F)
    {
      printf("%s: %s was stopped by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 >> 8);
    }
    else
    {
      if ((v22 & 0x7F) == 0)
      {
        uint64_t v5 = BYTE1(v22);
        goto LABEL_5;
      }
      error("%s: %s was terminated by signal %d\n", "execForMSUEarlyBootTask", *a1, v22 & 0x7F);
    }
    uint64_t v5 = 0xFFFFFFFFLL;
  }
LABEL_5:
  posix_spawn_file_actions_destroy(&v23);
  if (v26[1] != -1) {
    close(v26[1]);
  }
  return v5;
}

uint64_t ramrod_create_directory_with_class(unsigned char *a1, int a2, uid_t a3, gid_t a4, int a5, int a6)
{
  if (!a1 || *a1 != 47) {
    return 22;
  }
  bzero(&v25, 0x400uLL);
  ssize_t v11 = v26;
  __strlcpy_chk();
  while (1)
  {
    uint64_t v12 = strchr(v11, 47);
    uint64_t v13 = v12;
    if (v12) {
      *uint64_t v12 = 0;
    }
    memset(&v24, 0, sizeof(v24));
    if (lstat(&v25, &v24))
    {
      if (*__error() != 2)
      {
        uint64_t v14 = *__error();
        uint64_t v15 = __error();
        strerror(*v15);
        error("lstat %s failed: %s\n");
        return v14;
      }
      if (a6) {
        error("creating directory (owner=%d group=%d mode=%o, class=%d) %s\n", a3, a4, a2, a5, &v25);
      }
      if (mkdir(&v25, a2 & 0x1FF))
      {
        uint64_t v14 = *__error();
        uint64_t v16 = __error();
        strerror(*v16);
        error("mkdir failed: %s\n");
        return v14;
      }
      if (chmod(&v25, a2))
      {
        uint64_t v14 = *__error();
        uint64_t v17 = __error();
        strerror(*v17);
        error("chmod failed: %s\n");
        return v14;
      }
      if (chown(&v25, a3, a4))
      {
        uint64_t v14 = *__error();
        uint64_t v18 = __error();
        strerror(*v18);
        error("chown failed: %s\n");
        return v14;
      }
      if ((a5 & 0x80000000) == 0)
      {
        uint64_t v23 = 0;
        long long v22 = xmmword_10000BC2C;
        int v21 = a5;
        if (setattrlist(&v25, &v22, &v21, 4uLL, 0)) {
          break;
        }
      }
    }
    if (!v13) {
      return 0;
    }
    *uint64_t v13 = 47;
    ssize_t v11 = v13 + 1;
  }
  uint64_t v14 = *__error();
  long long v19 = __error();
  strerror(*v19);
  error("setattrlist failed: %s\n");
  return v14;
}

void execlogfunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%.*s" arguments:&a9];
  bzero(v10, 0x400uLL);
  [v9 getCString:v10 maxLength:1023 encoding:134217984];
  debug("MSUEarlyBootTaskExecLog: %s\n", v10);
}

uint64_t msuearlyboottask_mount_filesystem(const char *a1, const char *a2, int a3)
{
  if (!a1)
  {
    error("%s: Invalid arguments passed\n", "msuearlyboottask_mount_filesystem");
    return 0xFFFFFFFFLL;
  }
  debug("%s: Attempting to mount %s at %s\n", "msuearlyboottask_mount_filesystem", a1, "/private/var/MobileSoftwareUpdate/mnt1");
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  v9[0] = "/sbin/mount_apfs";
  v9[1] = "-o";
  v9[2] = "nobrowse";
  if (a3)
  {
    debug("%s: Mounting read-only\n", "msuearlyboottask_mount_filesystem");
    *(void *)&long long v10 = "-o";
    *((void *)&v10 + 1) = "rdonly";
    int v6 = 5;
    if (!a2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v6 = 3;
  if (a2)
  {
LABEL_7:
    debug("%s: Mounting snapshot %s\n", "msuearlyboottask_mount_filesystem", a2);
    int v8 = v6 + 1;
    v9[v6] = "-s";
    v6 += 2;
    v9[v8] = a2;
  }
LABEL_8:
  v9[v6] = a1;
  v9[v6 + 1] = "/private/var/MobileSoftwareUpdate/mnt1";
  v9[v6 + 2] = 0;
  return execForMSUEarlyBootTask(v9);
}

void msuearlyboottask_unmount_filesystem()
{
  int v0 = -3;
  do
  {
    if (!unmount("/private/var/MobileSoftwareUpdate/mnt1", 0x80000)) {
      break;
    }
    int v1 = *__error();
    BOOL v2 = v1 == 35 || v1 == 16;
    BOOL v3 = v2;
    if (v1 == 22)
    {
      debug("MSUEarlyBootTask: Tried to unmount a volume at '%s' that wasn't mounted. Ignoring the error.\n", "/private/var/MobileSoftwareUpdate/mnt1");
    }
    else
    {
      id v4 = __error();
      uint64_t v5 = strerror(*v4);
      error("MSUEarlyBootTask: error unmounting '%s': %s\n", "/private/var/MobileSoftwareUpdate/mnt1", v5);
      if (v1 == 35 || v1 == 16)
      {
        int v6 = strerror(v1);
        error("Unmounting %s failed with %d: %s. Will retry in %d seconds", "/private/var/MobileSoftwareUpdate/mnt1", v1, v6, 3);
        sleep(3u);
      }
    }
  }
  while (v0++ && v3);
}

void msuearlyboottask_dump_mounted_filesystem_info()
{
  debug("%s:**********DUMPING MOUNTED FILESYSTEMS********\n", "msuearlyboottask_dump_mounted_filesystem_info");
  BOOL v2 = 0;
  int v0 = getmntinfo(&v2, 2);
  debug("%s: %d filesystems are mounted\n", "msuearlyboottask_dump_mounted_filesystem_info", v0);
  if (v2)
  {
    if (v0 >= 1)
    {
      unint64_t v1 = v0 + 1;
      do
      {
        debug("%s is mounted at %s\n", v2[(v1 - 2)].f_mntfromname, v2[(v1 - 2)].f_mntonname);
        --v1;
      }
      while (v1 > 1);
    }
  }
  else
  {
    debug("Failed to get info regarding mounted filesystems\n");
  }
  debug("%s: *********DONE DUMPING MOUNTED FILESYSTEMS********\n", "msuearlyboottask_dump_mounted_filesystem_info");
}

acl_t MSUEarlyBootTaskCopySystemContainerACLWithNumACEs(int a1)
{
  acl_t acl_p = acl_init(1);
  if (!acl_p)
  {
    id v4 = __error();
    uint64_t v5 = strerror(*v4);
    error("MSUEarlyBootTask: acl_init() failed: %s", v5);
    return 0;
  }
  if (a1) {
    acl_perm_t v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_DELETE_CHILD|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  }
  else {
    acl_perm_t v2 = ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_SEARCH|ACL_ADD_FILE|ACL_LIST_DIRECTORY;
  }
  acl_entry_t entry_p = 0;
  if (a1) {
    acl_flag_t v3 = ACL_ENTRY_DIRECTORY_INHERIT|ACL_ENTRY_FILE_INHERIT;
  }
  else {
    acl_flag_t v3 = ACL_ENTRY_INHERITED;
  }
  acl_flagset_t flagset_p = 0;
  acl_permset_t permset_p = 0;
  if (acl_create_entry(&acl_p, &entry_p))
  {
    error("MSUEarlyBootTask: Unable to create acl entry(%d)\n");
  }
  else
  {
    int v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    if (v6)
    {
      unsigned int v7 = v6;
      int v8 = mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, v6);
      if (v8)
      {
        strerror(v8);
        error("MSUEarlyBootTask: Failed to convert mbr identifier to uuid : %d (%s)\n");
      }
      else
      {
        int permset = acl_get_permset(entry_p, &permset_p);
        if (permset)
        {
          strerror(permset);
          error("acl_get_permset() failed: %d: %s\n");
        }
        else
        {
          int v10 = acl_add_perm(permset_p, v2);
          if (v10)
          {
            strerror(v10);
            error("acl_add_perm() failed to set perms %x: %d: %s\n");
          }
          else if (acl_set_permset(entry_p, permset_p))
          {
            strerror(0);
            error("acl_set_permset() failed: %d: %s");
          }
          else
          {
            int flagset_np = acl_get_flagset_np(entry_p, &flagset_p);
            if (flagset_np)
            {
              strerror(flagset_np);
              error("MSUEarlyBootTask: acl_get_flagset_np() failed: %d: %s");
            }
            else
            {
              int v12 = acl_add_flag_np(flagset_p, v3);
              if (v12)
              {
                strerror(v12);
                error("MSUEarlyBootTask: acl_add_flag_np() failed to set flags %x: %d %s\n");
              }
              else
              {
                int v13 = acl_set_flagset_np(entry_p, flagset_p);
                if (v13)
                {
                  strerror(v13);
                  error("acl_set_flagset_np() failed: %d: %s\n");
                }
                else
                {
                  int v14 = acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW);
                  if (v14)
                  {
                    strerror(v14);
                    error("acl_set_tag_type() failed: %d: %s");
                  }
                  else
                  {
                    int v15 = acl_set_qualifier(entry_p, v7);
                    if (!v15)
                    {
                      free(v7);
                      return acl_p;
                    }
                    strerror(v15);
                    error("acl_set_qualifier() failed: %d: %s");
                  }
                }
              }
            }
          }
        }
      }
      free(v7);
    }
    else
    {
      error("MSUEarlyBootTask: Unable to allocate nameUUID\n");
    }
  }
  error("MSUEarlyBootTask: Failed in call to MSUEarlyBootTaskCreateSystemUserACEInACL\n");
  acl_t result = acl_p;
  if (acl_p)
  {
    acl_free(acl_p);
    return 0;
  }
  return result;
}

uint64_t _partition_log(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (_loggingPtr) {
    return _loggingPtr(result, &a9);
  }
  return result;
}

char *copy_root_snapshot_name_from_dt()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (!v0)
  {
    _partition_log((uint64_t)"uanble to find chosen node", v1, v2, v3, v4, v5, v6, v7, v30);
    return 0;
  }
  io_object_t v8 = v0;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"root-snapshot-name", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    _partition_log((uint64_t)"unable to look up root-snapshot-name on chosen node", v10, v11, v12, v13, v14, v15, v16, v30);
    IOObjectRelease(v8);
    return 0;
  }
  CFDataRef v17 = CFProperty;
  CFTypeID v18 = CFGetTypeID(CFProperty);
  if (v18 == CFDataGetTypeID())
  {
    BytePtr = (const char *)CFDataGetBytePtr(v17);
    size_t Length = CFDataGetLength(v17);
    id v28 = strndup(BytePtr, Length);
  }
  else
  {
    _partition_log((uint64_t)"device tree root-snapshot-name type mismatch", v19, v20, v21, v22, v23, v24, v25, v30);
    id v28 = 0;
  }
  IOObjectRelease(v8);
  CFRelease(v17);
  return v28;
}

void main_cold_1()
{
}

uint64_t APFSOverProvModel()
{
  return _APFSOverProvModel();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return _acl_add_flag_np(flagset_d, flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return _acl_add_perm(permset_d, perm);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return _acl_create_entry(acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return _acl_get_flagset_np(obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return _acl_get_permset(entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_flagset_np(void *obj_p, acl_flagset_t flagset_d)
{
  return _acl_set_flagset_np(obj_p, flagset_d);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return _acl_set_link_np(path_p, type, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return _acl_set_permset(entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return _acl_set_qualifier(entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return _acl_set_tag_type(entry_d, tag_type);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

char *__cdecl devname_r(dev_t a1, mode_t a2, char *buf, int len)
{
  return _devname_r(a1, a2, buf, len);
}

void err(int a1, const char *a2, ...)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_revert(a1, a2, a3);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return _mbr_identifier_to_uuid(id_type, identifier, identifier_size, uu);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}