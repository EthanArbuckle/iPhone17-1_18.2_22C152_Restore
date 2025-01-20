@interface MDQueryStringCopyUserInput
@end

@implementation MDQueryStringCopyUserInput

uint64_t ____MDQueryStringCopyUserInput_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v3 + 24) && *(_WORD *)(a2 + 48) == 4)
  {
    uint64_t v4 = *(void *)(a2 + 16);
    if (v4)
    {
      v5 = *(const char **)v4;
      if (*(void *)v4)
      {
        v6 = *(const char **)(v4 + 72);
        if (v6)
        {
          if (*(_DWORD *)(v4 + 24) <= 8u && (!strcmp(v5, "**") || !strcmp(v5, "*"))) {
            *(void *)(v3 + 24) = strdup(v6);
          }
        }
      }
    }
  }
  return a2;
}

@end