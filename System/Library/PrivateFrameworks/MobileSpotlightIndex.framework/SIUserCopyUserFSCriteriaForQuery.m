@interface SIUserCopyUserFSCriteriaForQuery
@end

@implementation SIUserCopyUserFSCriteriaForQuery

uint64_t ___SIUserCopyUserFSCriteriaForQuery_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1[4] + 8);
  if (!*(unsigned char *)(v3 + 24)) {
    return a2;
  }
  int v4 = *(unsigned __int16 *)(a2 + 48);
  if (v4 == 2 || v4 == 32) {
    return a2;
  }
  if (v4 != 4) {
    goto LABEL_29;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  int v6 = *(_DWORD *)(v5 + 24);
  if ((v6 | 4) != 5) {
    goto LABEL_29;
  }
  v7 = *(const char **)(v5 + 72);
  if (!v7) {
    goto LABEL_29;
  }
  v9 = *(const char **)v5;
  if (strncmp(*(const char **)v5, "kMDItemIsTrashed", 0x10uLL))
  {
    if (!strncmp(v9, "_kMDItemBundleID", 0x10uLL) || !strncmp(v9, "kMDItemFileProviderID", 0x15uLL))
    {
      if (!strcmp(v7, "*") || !strncmp(v7, "com.apple.filesystems.UserFS.FileProvider", 0x29uLL))
      {
        if (v6 == 1) {
          return a2;
        }
      }
      else if (v6 != 1)
      {
        return a2;
      }
    }
    else if (!*(void *)(*(void *)(a1[6] + 8) + 24) && !strncmp(v9, "kMDItemDisplayName", 0x12uLL))
    {
      size_t v10 = strlen(v7);
      if (v10)
      {
        CFIndex v11 = v7[v10 - 1] == 42 ? v10 - 1 : v10;
        if (v11)
        {
          CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
          v13 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)v7, v11, 0x8000100u, 0);
          values = v13;
          if (v13)
          {
            if ((*(unsigned char *)(*(void *)(a2 + 16) + 32) & 0x40) != 0)
            {
              v14 = v13;
              MutableCopy = CFStringCreateMutableCopy(v12, 0, v13);
              if (MutableCopy)
              {
                CFStringRef v20 = MutableCopy;
                CFStringTrimWhitespace(MutableCopy);
                *(void *)(*(void *)(a1[6] + 8) + 24) = CFStringCreateArrayBySeparatingStrings(v12, v20, @" ");
                CFRelease(v20);
              }
            }
            else
            {
              *(void *)(*(void *)(a1[6] + 8) + 24) = CFArrayCreate(v12, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
              v14 = values;
            }
            CFRelease(v14);
          }
        }
      }
      return a2;
    }
LABEL_29:
    *(unsigned char *)(v3 + 24) = 0;
    return a2;
  }
  if ((v6 | 4) == 5)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = *MEMORY[0x1E4F1CFC8];
    uint64_t v15 = *(void *)(a2 + 16);
    int v16 = atoi(*(const char **)(v15 + 72));
    int v17 = *(_DWORD *)(v15 + 24);
    if (v16)
    {
      if (v17 != 1) {
        return a2;
      }
    }
    else if (v17 != 5)
    {
      return a2;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = *MEMORY[0x1E4F1CFD0];
  }
  return a2;
}

@end