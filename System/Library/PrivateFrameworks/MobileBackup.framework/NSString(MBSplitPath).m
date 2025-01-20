@interface NSString(MBSplitPath)
- (id)_mb_openatWithFlags:()MBSplitPath setupDir:itemAccessor:;
- (uint64_t)mb_openatWithFlags:()MBSplitPath error:setupDir:itemAccessor:;
- (void)mb_splitIntoBase:()MBSplitPath andRelativePath:;
@end

@implementation NSString(MBSplitPath)

- (void)mb_splitIntoBase:()MBSplitPath andRelativePath:
{
  v6 = (const char *)[a1 fileSystemRepresentation];
  if (strlen(v6) < 0x400) {
    goto LABEL_8;
  }
  v7 = v6 + 1023;
  while (*v7 != 47)
  {
    if (--v7 <= v6)
    {
      if (*v7 != 47) {
        goto LABEL_8;
      }
      break;
    }
  }
  v8 = malloc_type_malloc(v7 - v6 + 1, 0x2DF96AD7uLL);
  memcpy(v8, v6, v7 - v6);
  *((unsigned char *)v8 + v7 - v6) = 0;
  *a3 = open((const char *)v8, 0);
  free(v8);
  if (*a3 == -1) {
LABEL_8:
  }
    *a3 = -2;
  else {
    v6 = v7 + 1;
  }
  *a4 = v6;
}

- (id)_mb_openatWithFlags:()MBSplitPath setupDir:itemAccessor:
{
  v8 = a4;
  v9 = a5;
  int v14 = -1;
  v13 = 0;
  objc_msgSend(a1, "mb_splitIntoBase:andRelativePath:", &v14, &v13);
  if (!v8 || (v8[2](v8, v14, v13), (v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v11 = openat(v14, v13, a3);
    if ((v11 & 0x80000000) != 0)
    {
      v10 = +[MBError posixErrorWithCode:102 path:a1 format:@"openat() error"];
    }
    else
    {
      v10 = v9[2](v9, v11);
      close(v11);
    }
  }
  if ((v14 & 0x80000000) == 0) {
    close(v14);
  }

  return v10;
}

- (uint64_t)mb_openatWithFlags:()MBSplitPath error:setupDir:itemAccessor:
{
  v7 = objc_msgSend(a1, "_mb_openatWithFlags:setupDir:itemAccessor:", a3, a5, a6);
  v8 = v7;
  if (a4) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = v9;
  if (!v9) {
    *a4 = v7;
  }

  return v10;
}

@end