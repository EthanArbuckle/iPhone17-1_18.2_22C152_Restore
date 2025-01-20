uint64_t sub_1000031F8()
{
  uint64_t result;
  passwd *v1;
  gid_t pw_gid;
  uid_t pw_uid;
  uint64_t vars8;

  result = access("/AppleInternal", 0);
  dword_10000C000 = result == 0;
  if (!result)
  {
    v1 = getpwnam("mobile");
    if (v1)
    {
      pw_uid = v1->pw_uid;
      pw_gid = v1->pw_gid;
    }
    else
    {
      pw_gid = 501;
      pw_uid = 501;
    }
    mkdir("/var/mobile/Library/Logs/MobileBackup", 0x1C0u);
    chown("/var/mobile/Library/Logs/MobileBackup", pw_uid, pw_gid);
    qword_10000C008 = (uint64_t)fopen("/var/mobile/Library/Logs/MobileBackup/FinishRestoreFromBackup.log", "a");
    return chown("/var/mobile/Library/Logs/MobileBackup/FinishRestoreFromBackup.log", pw_uid, pw_gid);
  }
  return result;
}

uint64_t sub_1000032D0()
{
  uint64_t result = qword_10000C008;
  if (qword_10000C008) {
    return fflush((FILE *)qword_10000C008);
  }
  return result;
}

uint64_t sub_1000032E4(char *a1, ...)
{
  va_start(va, a1);
  uint64_t result = qword_10000C008;
  if (qword_10000C008) {
    return vfprintf((FILE *)qword_10000C008, a1, va);
  }
  return result;
}

uint64_t sub_100003320(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, ...)
{
  va_start(va, a6);
  if (!result)
  {
    if (qword_10000C008) {
      vfprintf((FILE *)qword_10000C008, a6, va);
    }
    sub_1000032E4("\n");
    if (qword_10000C008) {
      fflush((FILE *)qword_10000C008);
    }
    vfprintf(__stderrp, a6, va);
    fputc(10, __stderrp);
    if (dword_10000C000)
    {
      vsnprintf(byte_10000C1A0, 0xC8uLL, a6, va);
      byte_10000C267 = 0;
      snprintf(byte_10000C010, 0x190uLL, "FinishRestoreFromBackup, %s:%d/%s failed with error %d (%s)");
    }
    else
    {
      snprintf(byte_10000C010, 0x190uLL, "FinishRestoreFromBackup, %s:%d/%s failed with error %d");
    }
    byte_10000C19F = 0;
    fprintf(__stderrp, "%s\n\n", byte_10000C010);
    fflush(__stderrp);
    sub_1000034C0();
    sleep(1u);
    if (reboot_np(2048, byte_10000C010))
    {
      v7 = __stderrp;
      v8 = __error();
      v9 = strerror(*v8);
      v10 = __error();
      fprintf(v7, "reboot_np failed: %s (%d)\n\n", v9, *v10);
      fflush(__stderrp);
    }
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000034C0()
{
  kern_return_t v3;
  const char *v4;
  const char *v5;
  mach_port_t mainPort;

  mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort)) {
    return sub_1000032E4("Could not get main port\n");
  }
  io_registry_entry_t v1 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v1) {
    return sub_1000032E4("Could not get options entry from the device tree\n");
  }
  io_registry_entry_t v2 = v1;
  v3 = IORegistryEntrySetCFProperty(v1, @"oblit-inprogress", @"0");
  if (v3) {
    v4 = "Failed";
  }
  else {
    v4 = "Succeeded";
  }
  sub_1000032E4("%s setting the property %s to value %s", v4, "oblit-inprogress", "0");
  if (!v3)
  {
    if (IORegistryEntrySetCFProperty(v2, @"IONVRAM-FORCESYNCNOW-PROPERTY", @"0")) {
      v5 = "Failed";
    }
    else {
      v5 = "Succeeded";
    }
    sub_1000032E4("%s setting the property %s to value %s", v5, "IONVRAM-FORCESYNCNOW-PROPERTY", "0");
  }
  return IOObjectRelease(v2);
}

char *sub_1000035E0(const char *a1, const char *a2)
{
  sub_100003320(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"copy_string_by_appending_path", 172, (uint64_t)"copy_string_by_appending_path", "base cannot be NULL");
  sub_100003320(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"copy_string_by_appending_path", 173, (uint64_t)"copy_string_by_appending_path", "extra cannot be NULL");
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  v6 = (char *)malloc_type_malloc(v4 + v5 + 2, 0x49D4F125uLL);
  v7 = __error();
  sub_100003320(v6 != 0, *v7, (uint64_t)"copy_string_by_appending_path", 179, (uint64_t)"malloc", "malloc failed");
  if (!v6) {
    sub_1000060E8();
  }
  v8 = strcpy(v6, a1);
  *(_WORD *)&v6[strlen(v8)] = 47;

  return strcat(v6, a2);
}

void *sub_1000036F8()
{
  v0 = malloc_type_calloc(0x80uLL, 8uLL, 0x10040436913F5uLL);
  io_registry_entry_t v1 = __error();
  sub_100003320(v0 != 0, *v1, (uint64_t)"name_list_new", 195, (uint64_t)"calloc", "calloc failed");
  io_registry_entry_t v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004019856BD9uLL);
  v3 = __error();
  sub_100003320(v2 != 0, *v3, (uint64_t)"name_list_new", 198, (uint64_t)"calloc", "calloc failed");
  if (!v2) {
    sub_100006114();
  }
  v2[3] = v0;
  *io_registry_entry_t v2 = 128;
  return v2;
}

uint64_t sub_1000037E4(uint64_t *a1, const char *a2, uint64_t a3)
{
  sub_100003320(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", 207, (uint64_t)"name_list_add", "list cannot be NULL");
  sub_100003320(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", 208, (uint64_t)"name_list_add", "name cannot be NULL");
  sub_100003320(a3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", 209, (uint64_t)"name_list_add", "nameSize cannot be zero");
  if (!a1) {
    sub_10000616C();
  }
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if (v7 + 1 >= *a1)
  {
    uint64_t v8 = v6 + 128;
    v9 = malloc_type_realloc((void *)a1[3], 8 * (v6 + 128), 0x76080808uLL);
    v10 = __error();
    sub_100003320(v9 != 0, *v10, (uint64_t)"name_list_add", 219, (uint64_t)"realloc", "realloc failed");
    if (!v9) {
      sub_100006140();
    }
    a1[3] = (uint64_t)v9;
    *a1 = v8;
  }
  v11 = strndup(a2, a3 + 1);
  v12 = __error();
  uint64_t result = sub_100003320(v11 != 0, *v12, (uint64_t)"name_list_add", 227, (uint64_t)"strndup", "strndup failed");
  *(void *)(a1[3] + 8 * v7) = v11;
  a1[1] = v7 + 1;
  return result;
}

uint64_t sub_100003960(void *a1)
{
  sub_100003320(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_next_item", 234, (uint64_t)"name_list_next_item", "list cannot be NULL");
  if (!a1) {
    sub_100006198();
  }
  uint64_t v2 = a1[2];
  if (v2 >= a1[1]) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1[3] + 8 * v2);
  sub_100003320(v3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_next_item", 241, (uint64_t)"name_list_next_item", "couldn't find entry");
  ++a1[2];
  return v3;
}

void sub_100003A04(void *a1)
{
  sub_100003320(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_free", 248, (uint64_t)"name_list_free", "list cannot be NULL");
  if (!a1) {
    sub_1000061C4();
  }
  uint64_t v2 = a1[1];
  uint64_t v3 = (void **)a1[3];
  free(a1);
  if (v2)
  {
    size_t v4 = v3;
    do
    {
      size_t v5 = *v4++;
      free(v5);
      --v2;
    }
    while (v2);
  }

  free(v3);
}

uint64_t sub_100003A98(const char *a1, uint64_t *a2, uint64_t *a3)
{
  sub_100003320(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", 262, (uint64_t)"name_list_read_dir", "path cannot be NULL");
  sub_100003320(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", 263, (uint64_t)"name_list_read_dir", "dir_names cannot be NULL");
  sub_100003320(a3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", 264, (uint64_t)"name_list_read_dir", "file_names cannot be NULL");
  uint64_t v6 = opendir(a1);
  uint64_t v7 = *__error();
  uint64_t v8 = __error();
  v9 = strerror(*v8);
  v10 = __error();
  sub_100003320(v6 != 0, v7, (uint64_t)"name_list_read_dir", 267, (uint64_t)"opendir", "opendir(\"%s\") failed: %s (%d)", a1, v9, *v10);
  v11 = readdir(v6);
  if (v11)
  {
    v12 = v11;
    do
    {
      if (strcmp(v12->d_name, ".") && strcmp(v12->d_name, ".."))
      {
        if ((v12->d_type & 4) != 0) {
          v13 = a2;
        }
        else {
          v13 = a3;
        }
        sub_1000037E4(v13, v12->d_name, v12->d_namlen);
      }
      v12 = readdir(v6);
    }
    while (v12);
  }

  return closedir(v6);
}

uint64_t sub_100003C34(const char *a1)
{
  memset(&v30, 0, sizeof(v30));
  if (lstat(a1, &v30))
  {
    BOOL v2 = *__error() == 2;
    uint64_t v3 = *__error();
    size_t v4 = __error();
    strerror(*v4);
    __error();
    return sub_100003320(v2, v3, (uint64_t)"remove_item_at_path", 212, (uint64_t)"lstat", "lstat(\"%s\") failed: %s (%d)", a1);
  }
  uint64_t st_flags = v30.st_flags;
  sub_1000032E4("remove item \"%s\" (0x%lx)\n", a1, v30.st_flags);
  if ((st_flags & 0x20002) != 0)
  {
    unsigned int v7 = st_flags & 0xFFFDFFFD;
    sub_1000032E4("removing the immutable flag for \"%s\" (0x%lx)\n", a1, st_flags & 0xFFFDFFFDFFFDFFFDLL);
    BOOL v8 = (st_flags & 0x40004) == 0;
    LODWORD(st_flags) = st_flags & 0xFFFDFFFD;
    if (v8)
    {
LABEL_10:
      if (lchflags(a1, v7 & 0x3FFFFFFF))
      {
        v9 = __error();
        sub_1000032E4("lchflags failed at \"%s\" (0x%lx): %d", a1, v7, *v9);
      }
      goto LABEL_12;
    }
LABEL_9:
    unsigned int v7 = st_flags & 0xFFFBFFFB;
    sub_1000032E4("removing the append flag for \"%s\" (0x%lx)\n", a1, st_flags & 0xFFFBFFFB);
    goto LABEL_10;
  }
  unsigned int v7 = st_flags;
  if ((st_flags & 0x40004) != 0) {
    goto LABEL_9;
  }
LABEL_12:
  int v10 = v30.st_mode & 0xF000;
  if ((v7 & 0x40000000) != 0)
  {
    if (v10 == 0x4000)
    {
      BOOL v21 = rmdir(a1) == 0;
      uint64_t v22 = *__error();
      v23 = __error();
      strerror(*v23);
      __error();
      return sub_100003320(v21, v22, (uint64_t)"remove_item_at_path", 168, (uint64_t)"rmdir", "rmdir(\"%s\") failed (SF_DATALESS): %s (%d)", a1);
    }
    else
    {
      BOOL v27 = unlink(a1) == 0;
      uint64_t v28 = *__error();
      v29 = __error();
      strerror(*v29);
      __error();
      return sub_100003320(v27, v28, (uint64_t)"remove_item_at_path", 170, (uint64_t)"unlink", "unlink(\"%s\") failed (SF_DATALESS): %s (%d)", a1);
    }
  }
  else if (v10 == 0x4000)
  {
    v11 = sub_1000036F8();
    v12 = sub_1000036F8();
    sub_100003A98(a1, v11, v12);
    uint64_t v13 = sub_100003960(v11);
    if (v13)
    {
      v14 = (const char *)v13;
      do
      {
        v15 = sub_1000035E0(a1, v14);
        ((void (*)(void))sub_100003C34)();
        free(v15);
        v14 = (const char *)sub_100003960(v11);
      }
      while (v14);
    }
    uint64_t v16 = sub_100003960(v12);
    if (v16)
    {
      v17 = (const char *)v16;
      do
      {
        v18 = sub_1000035E0(a1, v17);
        if (unlink(v18)) {
          sub_100003C34(v18);
        }
        free(v18);
        v17 = (const char *)sub_100003960(v12);
      }
      while (v17);
    }
    sub_100003A04(v11);
    sub_100003A04(v12);
    uint64_t result = rmdir(a1);
    if (result)
    {
      v19 = __error();
      uint64_t v20 = *v19;
      sub_1000032E4("rmdir failed at %s: %d\n", a1, *v19);
      fprintf(__stderrp, "rmdir failed at %s: %d\n", a1, v20);
      if (v20 != 1
        || (uint64_t result = strcmp(a1, "/private/var/mobile/Library/Application Support/CloudDocs"), result))
      {
        strerror(v20);
        return sub_100003320(0, v20, (uint64_t)"remove_item_at_path", 205, (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)", a1);
      }
    }
  }
  else
  {
    BOOL v24 = unlink(a1) == 0;
    uint64_t v25 = *__error();
    v26 = __error();
    strerror(*v26);
    __error();
    return sub_100003320(v24, v25, (uint64_t)"remove_item_at_path", 209, (uint64_t)"unlink", "unlink(\"%s\") failed: %s (%d)", a1);
  }
  return result;
}

BOOL sub_100003FF0(const char *a1, const char *a2)
{
  *(void *)__s1 = 0;
  uint64_t v11 = 0;
  if (sub_1000040E0(a1, __s1)) {
    return strncmp(__s1, a2, 0x10uLL) == 0;
  }
  BOOL v5 = *__error() == 93;
  uint64_t v6 = *__error();
  unsigned int v7 = __error();
  BOOL v8 = strerror(*v7);
  v9 = __error();
  sub_100003320(v5, v6, (uint64_t)"item_has_annotation", 245, (uint64_t)"getxattr", "getxattr(\"%s\") failed: %s (%d)", a1, v8, *v9);
  return 0;
}

uint64_t sub_1000040E0(const char *a1, void *value)
{
  uint64_t v3 = 1;
  if (getxattr(a1, "MBRestoreAnnotation", value, 0x10uLL, 0, 1) < 0)
  {
    BOOL v4 = *__error() == 93;
    uint64_t v5 = *__error();
    uint64_t v6 = __error();
    unsigned int v7 = strerror(*v6);
    BOOL v8 = __error();
    sub_100003320(v4, v5, (uint64_t)"item_annotation", 235, (uint64_t)"getxattr", "getxattr(\"%s\") failed: %s (%d)", a1, v7, *v8);
    return 0;
  }
  return v3;
}

uint64_t sub_10000419C(const char *a1)
{
  BOOL v2 = removexattr(a1, "MBRestoreAnnotation", 1) == 0;
  uint64_t v3 = *__error();
  BOOL v4 = __error();
  uint64_t v5 = strerror(*v4);
  uint64_t v6 = __error();
  return sub_100003320(v2, v3, (uint64_t)"remove_annotation_from_item", 251, (uint64_t)"removexattr", "removexattr(\"%s\") failed: %s (%d)", a1, v5, *v6);
}

void sub_100004234(const char *a1, const char *a2, uint64_t a3)
{
  memset(&v50, 0, sizeof(v50));
  if (lstat(a1, &v50))
  {
    BOOL v6 = *__error() == 2;
    uint64_t v7 = *__error();
    BOOL v8 = __error();
    v9 = strerror(*v8);
    int v10 = __error();
    sub_100003320(v6, v7, (uint64_t)"merge_restore_path_to_root", 270, (uint64_t)"lstat", "lstat(\"%s\") failed: %s (%d)", a1, v9, *v10);
  }
  else if ((v50.st_flags & 0x80) != 0)
  {
    if (chflags(a2, v50.st_flags) < 0) {
      sub_1000032E4("Couldn't chflags datavault bits onto directory %s\n");
    }
    else {
      sub_1000032E4("Setting BSD flag bits 0x%x on root dir %s\n");
    }
  }
  sub_1000032E4("merge \"%s\" into \"%s\"\n", a1, a2);
  if (sub_100003FF0(a1, "RestoreRoot"))
  {
    sub_1000032E4("cleaning \"%s\"\n", a1);
    sub_10000419C(a1);
    a3 = 1;
  }
  else if (!a3)
  {
    goto LABEL_16;
  }
  uint64_t v11 = sub_1000036F8();
  sub_100003A98(a2, v11, v11);
  uint64_t v12 = sub_100003960(v11);
  if (v12)
  {
    uint64_t v13 = (const char *)v12;
    do
    {
      v14 = sub_1000035E0(a1, v13);
      v15 = sub_1000035E0(a2, v13);
      memset(&value, 0, sizeof(value));
      if (lstat(v14, &value))
      {
        sub_1000032E4("not restored \"%s\"\n", v15);
        sub_100003C34(v15);
      }
      free(v14);
      free(v15);
      uint64_t v13 = (const char *)sub_100003960(v11);
    }
    while (v13);
  }
  sub_100003A04(v11);
LABEL_16:
  uint64_t v16 = sub_1000036F8();
  v17 = sub_1000036F8();
  sub_100003A98(a1, v16, v17);
  uint64_t v18 = sub_100003960(v16);
  if (v18)
  {
    v19 = (const char *)v18;
    do
    {
      uint64_t v20 = sub_1000035E0(a1, v19);
      BOOL v21 = sub_1000035E0(a2, v19);
      memset(&value, 0, sizeof(value));
      if (lstat(v21, &value) || (value.st_mode & 0xF000) != 0x4000 || (value.st_flags & 0x40000000) != 0)
      {
        size_t v27 = strlen(v19);
        sub_1000037E4(v17, v19, v27);
      }
      else
      {
        sub_100004234(v20, v21, a3);
        BOOL v22 = rmdir(v20) == 0;
        uint64_t v23 = *__error();
        BOOL v24 = __error();
        uint64_t v25 = strerror(*v24);
        v26 = __error();
        sub_100003320(v22, v23, (uint64_t)"merge_restore_path_to_root", 316, (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)", v20, v25, *v26);
      }
      free(v20);
      free(v21);
      v19 = (const char *)sub_100003960(v16);
    }
    while (v19);
  }
  uint64_t v28 = sub_100003960(v17);
  if (v28)
  {
    v29 = (const char *)v28;
    while (1)
    {
      stat v30 = (std::__fs::filesystem::path *)sub_1000035E0(a1, v29);
      v31 = (std::__fs::filesystem::path *)sub_1000035E0(a2, v29);
      *(void *)&value.st_dev = 0;
      value.st_ino = 0;
      sub_1000040E0((const char *)v30, &value);
      if (*(void *)&value.st_dev == 0x6F74736552746F4ELL && LODWORD(value.st_ino) == 6579570) {
        break;
      }
      if (*(void *)&value.st_dev == 0x656B636142746F4ELL && LODWORD(value.st_ino) == 7361892)
      {
        sub_1000032E4("not backed up \"%s\"\n", (const char *)v31);
        BOOL v45 = unlink((const char *)v30) == 0;
        uint64_t v46 = *__error();
        v47 = __error();
        strerror(*v47);
        __error();
        v49 = v30;
        uint64_t v42 = v45;
        uint64_t v43 = v46;
        uint64_t v44 = 343;
        goto LABEL_44;
      }
      if (*(void *)&value.st_dev == 0x64656D7265746E49
        && *(void *)((char *)&value.st_mode + 1) == 0x6574616964656DLL)
      {
        sub_1000032E4("intermediate \"%s\"\n");
LABEL_48:
        sub_100003C34((const char *)v30);
        goto LABEL_45;
      }
      sub_1000032E4("restored \"%s\"\n", (const char *)v31);
      sub_100003C34((const char *)v31);
      sub_10000487C((const char *)v30);
      sub_1000032E4("move \"%s\" to \"%s\"\n", (const char *)v30, (const char *)v31);
      rename(v30, v31, v35);
      if (v36)
      {
        if (*__error() == 30 && !strncmp((const char *)v31, "/private/private", 0x10uLL))
        {
          v48 = __error();
          strerror(*v48);
          __error();
          sub_1000032E4("rename(\"%s\", \"%s\") failed: %s (%d), skipping\n");
          goto LABEL_48;
        }
        uint64_t v37 = *__error();
        v38 = __error();
        strerror(*v38);
        __error();
        sub_100003320(0, v37, (uint64_t)"move_item_to_path", 137, (uint64_t)"rename", "rename(\"%s\", \"%s\") failed: %s (%d)", v30, v31);
      }
LABEL_45:
      free(v30);
      free(v31);
      v29 = (const char *)sub_100003960(v17);
      if (!v29) {
        goto LABEL_50;
      }
    }
    sub_1000032E4("not restored \"%s\"\n", (const char *)v31);
    sub_100003C34((const char *)v31);
    BOOL v39 = unlink((const char *)v30) == 0;
    uint64_t v40 = *__error();
    v41 = __error();
    strerror(*v41);
    __error();
    v49 = v30;
    uint64_t v42 = v39;
    uint64_t v43 = v40;
    uint64_t v44 = 338;
LABEL_44:
    sub_100003320(v42, v43, (uint64_t)"merge_restore_path_to_root", v44, (uint64_t)"unlink", "unlink(\"%s\") failed: %s (%d)", v49);
    goto LABEL_45;
  }
LABEL_50:
  sub_100003A04(v16);
  sub_100003A04(v17);
}

void sub_10000487C(const char *a1)
{
  long long value = 0uLL;
  sub_1000040E0(a1, &value);
  BOOL v2 = (void)value == 0x6F74736552746F4ELL && DWORD2(value) == 6579570;
  if (v2 || ((void)value == 0x656B636142746F4ELL ? (BOOL v3 = DWORD2(value) == 7361892) : (BOOL v3 = 0), v3))
  {
    sub_1000032E4("removing empty annotation file \"%s\"\n", a1);
    BOOL v10 = unlink(a1) == 0;
    uint64_t v11 = *__error();
    uint64_t v12 = __error();
    uint64_t v13 = strerror(*v12);
    v14 = __error();
    sub_100003320(v10, v11, (uint64_t)"recursively_remove_annotations_from_item", 378, (uint64_t)"unlink", "unlink(\"%s\") failed: %s (%d)", a1, v13, *v14);
  }
  else if ((void)value == 0x64656D7265746E49 && *(void *)((char *)&value + 5) == 0x6574616964656DLL)
  {
    sub_1000032E4("removing intermediate annotation directory \"%s\"\n", a1);
    sub_100003C34(a1);
  }
  else
  {
    if ((void)value == 0x5265726F74736552 && DWORD2(value) == 7630703)
    {
      sub_1000032E4("removing restore root annotation \"%s\"\n", a1);
      sub_10000419C(a1);
    }
    memset(&v15, 0, sizeof(v15));
    if (!lstat(a1, &v15) && (v15.st_mode & 0xF000) == 0x4000)
    {
      BOOL v6 = sub_1000036F8();
      sub_100003A98(a1, v6, v6);
      uint64_t v7 = sub_100003960(v6);
      if (v7)
      {
        BOOL v8 = (const char *)v7;
        do
        {
          v9 = sub_1000035E0(a1, v8);
          sub_10000487C();
          free(v9);
          BOOL v8 = (const char *)sub_100003960(v6);
        }
        while (v8);
      }
      sub_100003A04(v6);
    }
  }
}

uint64_t start()
{
  kern_return_t v8;
  BOOL v9;
  NSObject *global_queue;
  NSObject *v11;
  dispatch_time_t v12;
  FILE *v13;
  int *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  char v20;
  time_t v21;
  BOOL v22;
  uint64_t v23;
  int *v24;
  char *v25;
  int *v26;
  time_t v27;
  int v28;
  std::error_code *v29;
  int *v30;
  time_t v31;
  time_t v33;
  int v34;
  stat v35;

  uint64_t v0 = 0;
  for (char i = 1; ; char i = 0)
  {
    BOOL v2 = (&off_1000082D0)[2 * v0];
    char v3 = i;
    memset(&v35, 0, sizeof(v35));
    if (!lstat(v2, &v35)) {
      break;
    }
    uint64_t v0 = 1;
    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  time_t v4 = time(0);
  sub_1000031F8();
  sub_1000032E4("Started at %lu\n", v4);
  if (qword_10000C268) {
    sub_10000621C();
  }
  if (dword_10000C270) {
    sub_1000061F0();
  }
  v33 = v4;
  CFDictionaryRef v5 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    BOOL v8 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_10000C270);
    IOObjectRelease(v7);
    if (v8) {
      v9 = 1;
    }
    else {
      v9 = dword_10000C270 == 0;
    }
    if (v9)
    {
      sub_1000032E4("IOServiceOpen(kIOWatchdogUserClientOpen) failed: %d\n");
    }
    else
    {
      global_queue = dispatch_get_global_queue(25, 0);
      uint64_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
      qword_10000C268 = (uint64_t)v11;
      uint64_t v12 = dispatch_time(0, 20000000000);
      dispatch_source_set_timer(v11, v12, 0x4A817C800uLL, 0);
      dispatch_source_set_event_handler((dispatch_source_t)qword_10000C268, &stru_100008310);
      dispatch_activate((dispatch_object_t)qword_10000C268);
      time(0);
      sub_1000032E4("Started the watchdog checkin timer at %lu (%llus/%llus)\n");
    }
  }
  else
  {
    sub_1000032E4("IOServiceGetMatchingService(kIOWatchdogMatchingDict) failed\n");
  }
  v34 = 1;
  if (sysctlbyname("kern.vfsnspace", 0, 0, &v34, 4uLL))
  {
    uint64_t v13 = __stderrp;
    v14 = __error();
    stat v15 = strerror(*v14);
    uint64_t v16 = __error();
    fprintf(v13, "sysctlbyname(\"kern.vfsnspace\") failed: %s (%d)\n", v15, *v16);
  }
  v17 = 0;
  uint64_t v18 = 1;
  do
  {
    v19 = (&off_1000082D0)[2 * v17];
    uint64_t v20 = v18;
    memset(&v35, 0, sizeof(v35));
    if (!lstat(v19, &v35))
    {
      BOOL v21 = time(0);
      sub_1000032E4("Starting to merge from %s to %s at %lu\n", v19, "/private", v21);
      sub_100004234(v19, "/private", 0);
      BOOL v22 = rmdir(v19) == 0;
      uint64_t v23 = *__error();
      BOOL v24 = __error();
      uint64_t v25 = strerror(*v24);
      v26 = __error();
      sub_100003320(v22, v23, (uint64_t)"main", 455, (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)", v19, v25, *v26);
      size_t v27 = time(0);
      sub_1000032E4("Finished merging from %s to %s at %lu (%lds)\n", v19, "/private", v27, v27 - v21);
    }
    uint64_t v18 = 0;
    v17 = 1;
  }
  while ((v20 & 1) != 0);
  sub_1000032D0();
  uint64_t v28 = sub_100005C10();
  if (v28) {
    sub_1000032E4("aks_setupallowlist_fs failed: %d\n", v28);
  }
  if (remove((const std::__fs::filesystem::path *)"/private/var/root/.aks_migrate", v29))
  {
    stat v30 = __error();
    strerror(*v30);
    __error();
    sub_1000032E4("Failed to remove %s: %s (%d)\n");
  }
  else
  {
    sub_1000032E4("Removed AKS migration file at %s\n");
  }
  v31 = time(0);
  sub_1000032E4("Finished at %lu (%lds)\n", v31, v31 - v33);
  return 0;
}

void sub_100004ED4(id a1)
{
  kern_return_t v1;

  if ((unint64_t)qword_10000C278 >= 0x5A) {
    sub_100004F58(20 * qword_10000C278);
  }
  io_registry_entry_t v1 = IOConnectCallScalarMethod(dword_10000C270, 1u, 0, 0, 0, 0);
  if (v1) {
    sub_1000032E4("IOConnectCallScalarMethod(kIOWatchdogDaemonCheckin) failed: %d\n", v1);
  }
  else {
    ++qword_10000C278;
  }
}

void sub_100004F58(uint64_t a1)
{
  snprintf(__str, 0x64uLL, "FinishRestoreFromBackup timed out after %llus", a1);
  fprintf(__stderrp, "%s\n", __str);
  if (reboot_np(3072, __str))
  {
    io_registry_entry_t v1 = __stderrp;
    BOOL v2 = __error();
    char v3 = strerror(*v2);
    time_t v4 = __error();
    fprintf(v1, "reboot_np failed: %s (%d)\n", v3, *v4);
  }
  _os_crash();
  __break(1u);
}

char *sub_100004FF4(char *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    uint64_t result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      CFDictionaryRef v5 = (FTS *)result;
      BOOL v6 = fts_read((FTS *)result);
      if (v6)
      {
        io_object_t v7 = v6;
        do
        {
          int fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0) {
                  fts_set(v5, v7, 4);
                }
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          io_object_t v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

uint64_t sub_100005104()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems");
  if (v0)
  {
    io_object_t v1 = v0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", kCFAllocatorDefault, 0);
    BOOL v3 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v1);
  }
  else
  {
    BOOL v3 = 0;
  }
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  if ((byte_10000C280 & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
      byte_10000C281 = 1;
    }
    byte_10000C280 = 1;
  }
  unsigned int v4 = byte_10000C281;
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", (const char *)&unk_100007523, (const char *)&unk_100007523, (const char *)&unk_100007523, "aks_fs_supports_enhanced_apfs", ":", 437, (const char *)&unk_100007523, 0, (const char *)&unk_100007523, v3, byte_10000C281, (const char *)&unk_100007523);
  return v3 | v4;
}

uint64_t sub_100005288(const char *a1)
{
  bzero(&v3, 0x878uLL);
  if (!statfs(a1, &v3) && (v3.f_flags & 0x80) != 0) {
    return 1;
  }
  fprintf(__stderrp, "mount point (%s) does not support Data Protection", a1);
  return 0;
}

uint64_t sub_100005328(const char *a1, const char *a2, char a3)
{
  uint64_t result = sub_100005288(a1);
  if (result)
  {
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "%s/%s", a1, a2);
    if (a3) {
      fprintf(__stdoutp, "checking path: %s\n", __str);
    }
    int v7 = access(__str, 4) | a3 & 2;
    uint64_t result = v7 != 0;
    if ((a3 & 1) != 0 && !v7)
    {
      fprintf(__stdoutp, "%s has already been bootstrapped\n", a1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005428()
{
  uint64_t v0 = __chkstk_darwin();
  char v31 = v1;
  gid_t v32 = v2;
  uid_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v9 = (const char *)v0;
  bzero(__str, 0x400uLL);
  uint64_t v10 = 0;
  if (v6)
  {
    uint64_t v11 = (unsigned __int16 *)(v8 + 20);
    do
    {
      if ((*(unsigned char *)(v11 - 2) & 8) == 0)
      {
        memset(&v33, 0, sizeof(v33));
        snprintf(__str, 0x400uLL, "%s%s", v9, *(const char **)(v11 - 10));
        if (!stat(__str, &v33)) {
          goto LABEL_19;
        }
        if (mkpath_np(__str, *v11))
        {
          uint64_t v12 = __stderrp;
          uint64_t v13 = __error();
          strerror(*v13);
          fprintf(v12, "failed to create: %s (%s)\n");
        }
        else
        {
          unsigned int v14 = *v11;
          if (v14 >= 0x200 && chmod(__str, v14))
          {
            stat v15 = __stderrp;
            uint64_t v16 = __error();
            v17 = strerror(*v16);
            fprintf(v15, "failed to change permissions on: %s (%s)\n", __str, v17);
          }
          uint64_t v18 = *(const char **)(v11 + 2);
          uid_t pw_uid = v4;
          if (v18)
          {
            bzero(v37, 0x1000uLL);
            v35 = 0;
            memset(&v34, 0, sizeof(v34));
            if (getpwnam_r(v18, &v34, v37, 0x1000uLL, &v35))
            {
              uid_t pw_uid = v4;
              if (*__error())
              {
                uint64_t v25 = __stderrp;
                v26 = __error();
                strerror(*v26);
                fprintf(v25, "failed to get uid for user '%s'(%s)\n");
                goto LABEL_25;
              }
            }
            else
            {
              uid_t pw_uid = v35->pw_uid;
            }
          }
          uint64_t v20 = *(const char **)(v11 + 6);
          gid_t v21 = v32;
          if (!v20) {
            goto LABEL_16;
          }
          bzero(v37, 0x1000uLL);
          memset(&v34, 0, 32);
          v35 = 0;
          if (!getgrnam_r(v20, (group *)&v34, v37, 0x1000uLL, (group **)&v35))
          {
            gid_t v21 = v35->pw_uid;
LABEL_16:
            if (chown(__str, pw_uid, v21))
            {
              BOOL v22 = __stderrp;
              uint64_t v23 = __error();
              BOOL v24 = strerror(*v23);
              fprintf(v22, "failed to change ownership on: %s (%s)\n", __str, v24);
            }
            stat(__str, &v33);
LABEL_19:
            if ((v33.st_mode & 0xF000) == 0x4000)
            {
              if (*(unsigned char *)(v11 - 2))
              {
                if (sub_100005E74(__str, -1, *((_DWORD *)v11 + 5), v31)) {
                  uint64_t v10 = 0xFFFFFFFFLL;
                }
                else {
                  uint64_t v10 = v10;
                }
              }
            }
            else
            {
              fprintf(__stderrp, "failed %s is not a directory\n");
            }
            goto LABEL_25;
          }
          size_t v27 = __error();
          gid_t v21 = v32;
          if (!*v27) {
            goto LABEL_16;
          }
          uint64_t v28 = __stderrp;
          v29 = __error();
          strerror(*v29);
          fprintf(v28, "failed to get gid for group '%s' (%s)\n");
        }
      }
LABEL_25:
      v11 += 24;
      --v6;
    }
    while (v6);
  }
  return v10;
}

uint64_t sub_100005750(const char *a1, const char *a2)
{
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/%s", a1, a2);
  int v4 = open(__str, 513, 420);
  if (v4 != -1) {
    return close(v4);
  }
  uint64_t v6 = __stderrp;
  uint64_t v7 = __error();
  uint64_t v8 = strerror(*v7);
  return fprintf(v6, "Could not create marker file: %s (%s)\n", __str, v8);
}

uint64_t sub_100005828(const char *a1, char a2)
{
  if (!a1) {
    return 22;
  }
  bzero(v6, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(a1, v6)) {
    return 0xFFFFFFFFLL;
  }
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/mobile", v6);
  uint64_t result = sub_100005328(v6, "root/.bootstrapped", a2);
  if (!result) {
    return result;
  }
  if (sub_100005428() || (sub_100005104() & 1) == 0 && sub_100005428()) {
    return 0xFFFFFFFFLL;
  }
  sub_100005750(v6, "root/.bootstrapped");
  return 0;
}

uint64_t sub_10000596C(const char *a1, char a2, const char *a3, int *a4)
{
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/%s", a1, a3);
  int v8 = open_dprotected_np(__str, 514, 4, 0, 420);
  if (v8 == -1) {
    return 0;
  }
  int v9 = v8;
  if ((a2 & 2) == 0)
  {
    if (!sub_100005FB4(v8, 0x34u))
    {
      if (qword_10000C288) {
        uint64_t v10 = (FILE *)qword_10000C288;
      }
      else {
        uint64_t v10 = __stdoutp;
      }
      fprintf(v10, "%s has different allowlist needed=%c\n", a1, 52);
      goto LABEL_8;
    }
    close(v9);
    return 0;
  }
LABEL_8:
  *a4 = v9;
  return 1;
}

void sub_100005A84(const char *a1, int a2, uint64_t a3, uint64_t a4)
{
  bzero(__str, 0x401uLL);
  if (a4)
  {
    for (char i = (_DWORD *)(a3 + 16); ; i += 12)
    {
      snprintf(__str, 0x401uLL, "%s%s", a1, *((const char **)i - 2));
      if ((*i & 2) != 0) {
        break;
      }
      if (qword_10000C288) {
        int v9 = (FILE *)qword_10000C288;
      }
      else {
        int v9 = __stdoutp;
      }
      if ((*i & 4) == 0) {
        goto LABEL_12;
      }
      fprintf(v9, "Traversing hierarchy: %s\n", __str);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 0x40000000;
      v10[2] = sub_1000060B8;
      v10[3] = &unk_100009740;
      int v11 = a2 | 3;
      sub_100004FF4(__str, (uint64_t)v10, 0);
LABEL_13:
      if (!--a4) {
        return;
      }
    }
    if (qword_10000C288) {
      int v9 = (FILE *)qword_10000C288;
    }
    else {
      int v9 = __stdoutp;
    }
LABEL_12:
    fprintf(v9, "SKIPPED: %s\n", __str);
    goto LABEL_13;
  }
}

uint64_t sub_100005C10()
{
  uint64_t v0 = __chkstk_darwin();
  int v2 = v1;
  uid_t v3 = (const char *)v0;
  int v13 = -1;
  bzero(&__to, 0x400uLL);
  bzero(&__from, 0x400uLL);
  bzero(v15, 0x400uLL);
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/mobile", v3);
  snprintf(v15, 0x400uLL, "%s/tmp", v3);
  if (sub_100005E74(v15, -1, 4, 0)) {
    fprintf(__stderrp, "Unable to set %s to class D!", v15);
  }
  int v4 = fopen("/var/logs/AKSSetup.log", "w+");
  uint64_t v5 = v4;
  uint64_t v6 = __stdoutp;
  if (v4) {
    uint64_t v6 = v4;
  }
  qword_10000C288 = (uint64_t)v6;
  sub_100005828(v3, v2 | 3);
  snprintf((char *)&__from, 0x400uLL, "%s/root/.aks_whitelist", v3);
  snprintf((char *)&__to, 0x400uLL, "%s/root/.aks_allowlist", v3);
  rename(&__from, &__to, v7);
  if (sub_10000596C(v3, v2, "root/.aks_allowlist", &v13))
  {
    sub_100005A84(v3, v2, (uint64_t)&off_100008330, 35);
    if ((sub_100005104() & 1) == 0) {
      sub_100005A84(__str, v2, (uint64_t)&off_1000089C0, 72);
    }
    int v8 = v13;
    int v9 = qword_10000C288 ? (FILE *)qword_10000C288 : __stdoutp;
    fprintf(v9, "%s has been allow listed with version:%c\n", v3, 52);
    uint64_t v10 = sub_10000603C(v8, 52);
    if (v10)
    {
      uint64_t v11 = v10;
      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  if (v5) {
LABEL_13:
  }
    fclose(v5);
LABEL_14:
  qword_10000C288 = (uint64_t)__stdoutp;
  return v11;
}

uint64_t sub_100005E74(const char *a1, int a2, int a3, char a4)
{
  uint64_t v16 = 0;
  long long v15 = xmmword_1000067A0;
  uint64_t v14 = 0;
  if (getattrlist(a1, &v15, &v14, 8uLL, 0)) {
    return *__error();
  }
  if (HIDWORD(v14) == a3 || a2 != -1 && HIDWORD(v14) != a2) {
    return 0;
  }
  if (a2 == -1)
  {
    if (a4) {
      fprintf(__stdoutp, "%s set %i\n");
    }
  }
  else if (a4)
  {
    fprintf(__stdoutp, "%s update %i -> %i\n");
  }
  int v13 = a3;
  if (!setattrlist(a1, &v15, &v13, 4uLL, 0)) {
    return 0;
  }
  int v8 = __error();
  uint64_t v9 = *v8;
  uint64_t v10 = __stderrp;
  uint64_t v11 = strerror(*v8);
  fprintf(v10, "failed (%s) to update class for %s\n", v11, a1);
  return v9;
}

BOOL sub_100005FB4(int a1, unsigned __int8 a2)
{
  unsigned __int8 v8 = a2;
  int v3 = read(a1, &v8, 1uLL);
  if (v3 == 1) {
    return (char)v8 == a2;
  }
  if (v3 == -1)
  {
    uint64_t v5 = __stderrp;
    uint64_t v6 = __error();
    uint64_t v7 = strerror(*v6);
    fprintf(v5, "failed to read version file (%s)\n", v7);
  }
  return 0;
}

uint64_t sub_10000603C(int a1, char a2)
{
  char __buf = a2;
  if (pwrite(a1, &__buf, 1uLL, 0) != -1) {
    return 0;
  }
  int v2 = __error();
  uint64_t v3 = *v2;
  int v4 = __stderrp;
  uint64_t v5 = strerror(*v2);
  fprintf(v4, "failed to read version file (%s)\n", v5);
  return v3;
}

uint64_t sub_1000060B8(uint64_t a1, uint64_t a2)
{
  return 1;
}

void sub_1000060E8()
{
}

void sub_100006114()
{
}

void sub_100006140()
{
}

void sub_10000616C()
{
}

void sub_100006198()
{
}

void sub_1000061C4()
{
}

void sub_1000061F0()
{
  __assert_rtn("start_watchdog_checkin_timer", "restore_main.c", 95, "watchdog_kext_connection == IO_OBJECT_NULL");
}

void sub_10000621C()
{
  __assert_rtn("start_watchdog_checkin_timer", "restore_main.c", 94, "watchdog_checkin_timer == NULL");
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
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

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_crash()
{
  return __os_crash();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int chflags(const char *a1, __uint32_t a2)
{
  return _chflags(a1, a2);
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

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
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

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return _getgrnam_r(a1, a2, a3, a4, a5);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int reboot_np(int howto, const char *message)
{
  return _reboot_np(howto, message);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
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

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}