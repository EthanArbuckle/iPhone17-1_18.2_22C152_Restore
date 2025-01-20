@interface NSString(MobileBackup)
+ (id)mb_stringWithFileSystemRepresentation:()MobileBackup;
- (BOOL)mb_pathComponentExistsInSet:()MobileBackup;
- (id)mb_backupIDByAddingCKPrefix;
- (id)mb_backupIDByRemovingCKPrefix;
- (id)mb_stringByAppendingGreenteaSuffix;
- (id)mb_stringByAppendingSlash;
- (uint64_t)mb_pathHasSQLiteJournalSuffix;
@end

@implementation NSString(MobileBackup)

+ (id)mb_stringWithFileSystemRepresentation:()MobileBackup
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v4 stringWithFileSystemRepresentation:a3 length:strlen(a3)];

  return v5;
}

- (id)mb_stringByAppendingSlash
{
  if ([a1 hasSuffix:@"/"])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [a1 stringByAppendingString:@"/"];
  }
  return v2;
}

- (BOOL)mb_pathComponentExistsInSet:()MobileBackup
{
  id v4 = a3;
  id v5 = a1;
  if ([v4 containsObject:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = v5;
    while (1)
    {
      uint64_t v8 = [v7 length];
      BOOL v6 = v8 != 0;
      if (!v8) {
        break;
      }
      id v5 = [v7 stringByDeletingLastPathComponent];

      v7 = v5;
      if ([v4 containsObject:v5]) {
        goto LABEL_8;
      }
    }
    id v5 = v7;
  }
LABEL_8:

  return v6;
}

- (uint64_t)mb_pathHasSQLiteJournalSuffix
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = MBSQLiteJournalSuffixes();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(a1, "hasSuffix:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9))
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (id)mb_stringByAppendingGreenteaSuffix
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NSString_MobileBackup__mb_stringByAppendingGreenteaSuffix__block_invoke;
  block[3] = &unk_1E6D00F78;
  block[4] = a1;
  block[5] = a2;
  if (mb_stringByAppendingGreenteaSuffix_once != -1) {
    dispatch_once(&mb_stringByAppendingGreenteaSuffix_once, block);
  }
  if (mb_stringByAppendingGreenteaSuffix_isGreenTea)
  {
    id v3 = [NSString stringWithFormat:@"%@_CH", a1];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)mb_backupIDByAddingCKPrefix
{
  if ([a1 hasPrefix:@"D:"])
  {
    id v2 = a1;
  }
  else
  {
    id v2 = [NSString stringWithFormat:@"%@%@", @"D:", a1];
  }
  return v2;
}

- (id)mb_backupIDByRemovingCKPrefix
{
  if ([a1 hasPrefix:@"D:"])
  {
    id v2 = [a1 substringFromIndex:objc_msgSend(@"D:", "length")];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

@end