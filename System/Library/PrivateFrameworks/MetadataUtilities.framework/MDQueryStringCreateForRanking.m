@interface MDQueryStringCreateForRanking
@end

@implementation MDQueryStringCreateForRanking

uint64_t ____MDQueryStringCreateForRanking_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 48) == 4)
  {
    uint64_t v3 = *(void *)(a2 + 16);
    if (!v3)
    {
      *(_WORD *)(a2 + 48) = 16;
      goto LABEL_12;
    }
    v4 = *(char **)v3;
    if (!*(void *)v3
      || !*(void *)(v3 + 72)
      || *(_DWORD *)(v3 + 24) > 8u
      || strcmp(*(const char **)v3, "**")
      && strcmp(v4, "*")
      && ((v6 = *(const char **)(a1 + 40)) == 0 || strcmp(v4, v6)))
    {
      *(_WORD *)(a2 + 48) = 16;
      db_free_qp((int *)v3);
      *(void *)(a2 + 16) = 0;
LABEL_12:
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      return a2;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    if (v8)
    {
      free(v4);
      v9 = strdup(*(const char **)(a1 + 40));
      uint64_t v3 = *(void *)(a2 + 16);
      *(void *)uint64_t v3 = v9;
    }
    int v10 = *(_DWORD *)(a1 + 48);
    if (v10)
    {
      remove_outside_stars((const char **)(v3 + 72));
      int v10 = *(_DWORD *)(a1 + 48);
      if ((v10 & 0x100) == 0)
      {
LABEL_18:
        if ((v10 & 0x400) == 0) {
          goto LABEL_19;
        }
        goto LABEL_27;
      }
    }
    else if ((v10 & 0x100) == 0)
    {
      goto LABEL_18;
    }
    *(void *)(*(void *)(a2 + 16) + 32) |= 0x44uLL;
    if ((v10 & 0x400) == 0)
    {
LABEL_19:
      if ((v10 & 0x200) == 0) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
LABEL_27:
    remove_outside_stars((const char **)(*(void *)(a2 + 16) + 72));
    add_trailing_star((const char **)(*(void *)(a2 + 16) + 72));
    int v10 = *(_DWORD *)(a1 + 48);
    if ((v10 & 0x200) == 0)
    {
LABEL_20:
      if ((v10 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_28:
    *(void *)(*(void *)(a2 + 16) + 32) = *(void *)(*(void *)(a2 + 16) + 32) & 0xFFFFFFFFFFFFFFBBLL | 0x40;
    if ((v10 & 2) == 0)
    {
LABEL_22:
      uint64_t v11 = *(void *)(a2 + 16);
      *(void *)(v11 + 32) = *(void *)(v11 + 32) & 0xFFFFFFFFFF7FFFFFLL | (16 * v10) & 0x800000;
      if ((v10 & 0x40000) != 0)
      {
        remove_outside_stars((const char **)(v11 + 72));
      }
      else
      {
        if ((v10 & 0x20000) == 0) {
          return a2;
        }
        remove_leading_star((char **)(v11 + 72));
        add_trailing_star((const char **)(*(void *)(a2 + 16) + 72));
      }
      *(void *)(*(void *)(a2 + 16) + 32) &= 0xFFFFFFFFFFFFFFBBLL;
      return a2;
    }
LABEL_21:
    *(void *)(*(void *)(a2 + 16) + 32) &= 0xFFFFFFFFFEFFFFBBLL;
    goto LABEL_22;
  }
  return a2;
}

void *____MDQueryStringCreateForRanking_block_invoke_2(int a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  if (a2 && a3 && a4)
  {
    int v7 = *(unsigned __int16 *)(a3 + 48);
    if (v7 == 32 || v7 == 16)
    {
      *a2 = a3;
      a2[1] = 0;
      db_free_query_node(a2);
      return (void *)a4;
    }
    else
    {
      int v10 = *(unsigned __int16 *)(a4 + 48);
      if (v10 == 32 || v10 == 16)
      {
        *a2 = 0;
        a2[1] = a4;
        db_free_query_node(a2);
      }
      else
      {
        *a2 = a3;
        a2[1] = a4;
        return a2;
      }
    }
  }
  else
  {
    if (a3) {
      db_free_query_node((void *)a3);
    }
    if (a4) {
      db_free_query_node((void *)a4);
    }
    free(a2);
    return 0;
  }
  return (void *)v5;
}

@end