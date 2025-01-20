@interface CIMatchLocalizedFields
@end

@implementation CIMatchLocalizedFields

void *___CIMatchLocalizedFields_block_invoke(void *result, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (a3)
  {
    v5 = a3;
    v6 = result;
    while ((*(unsigned char *)v5 & 1) == 0)
    {
      uint64_t v7 = *(void *)(v6[4] + 8);
      unsigned int v8 = *(_DWORD *)(v7 + 24);
      uint64_t v9 = *(void *)(v6[5] + 8);
      if (v8 >= *(_DWORD *)(v9 + 24))
      {
        if (v8) {
          int v11 = 2 * v8;
        }
        else {
          int v11 = 64;
        }
        *(_DWORD *)(v9 + 24) = v11;
        result = malloc_type_realloc(*(void **)(*(void *)(v6[6] + 8) + 24), 4 * *(unsigned int *)(*(void *)(v6[5] + 8) + 24), 0x1051303uLL);
        *(void *)(*(void *)(v6[6] + 8) + 24) = result;
        uint64_t v10 = *(void *)(*(void *)(v6[6] + 8) + 24);
        if (!v10)
        {
          v16 = __si_assert_copy_extra_329();
          v14 = v16;
          v17 = "";
          if (v16) {
            v17 = v16;
          }
          __message_assert("%s:%u: failed assertion '%s' %s ", "CIQuery.c", 1237, "fields", v17);
          goto LABEL_20;
        }
        uint64_t v7 = *(void *)(v6[4] + 8);
        unsigned int v8 = *(_DWORD *)(v7 + 24);
      }
      else
      {
        uint64_t v10 = *(void *)(*(void *)(v6[6] + 8) + 24);
      }
      int v12 = v5[2];
      *(_DWORD *)(v7 + 24) = v8 + 1;
      *(_DWORD *)(v10 + 4 * v8) = v12;
      if (*v5 >= 2u)
      {
        v5 = (_DWORD *)(a4 + 12 * (*v5 >> 1));
        if (a4) {
          continue;
        }
      }
      return result;
    }
    v13 = __si_assert_copy_extra_329();
    v14 = v13;
    v15 = "";
    if (v13) {
      v15 = v13;
    }
    __message_assert("%s:%u: failed assertion '%s' %s ", "CIQuery.c", 1232, "0", v15);
LABEL_20:
    free(v14);
    if (__valid_fs(-1)) {
      uint64_t v18 = 2989;
    }
    else {
      uint64_t v18 = 3072;
    }
    *(_DWORD *)uint64_t v18 = -559038737;
    abort();
  }
  return result;
}

@end