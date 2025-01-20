uint64_t _citrus_iconv_none_iconv_init_shared(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return 0;
}

uint64_t _citrus_iconv_none_iconv_init_context(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return 0;
}

uint64_t _citrus_iconv_none_iconv_convert(_DWORD *a1, const void **a2, unint64_t *a3, void **a4, unint64_t *a5, uint64_t a6, void *a7)
{
  unint64_t v7 = 0;
  if (a3 && a2 && a4)
  {
    v8 = (int *)*a2;
    if (!*a2) {
      return 0;
    }
    v9 = *a4;
    if (!*a4) {
      return 0;
    }
    unint64_t v7 = *a3;
    if (!*a3) {
      return v7;
    }
    unint64_t v12 = *a5;
    if (!*a5) {
      return 0;
    }
    int v14 = a1[6];
    if (v14 == 3) {
      unint64_t v15 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    }
    else {
      unint64_t v15 = *a3;
    }
    unint64_t v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
    if (v14 != 3) {
      unint64_t v16 = *a5;
    }
    if (v12 >= v15) {
      size_t v17 = v15;
    }
    else {
      size_t v17 = v16;
    }
    if (v14 == 3 && (uint64_t v18 = *(void *)(*(void *)a1 + 80)) != 0 && *(void *)(v18 + 8))
    {
      if (v17 >= 4)
      {
        size_t v19 = v17 >> 2;
        do
        {
          int v20 = *v8++;
          *v9++ = v20;
          (*(void (**)(void))(v18 + 8))();
          --v19;
        }
        while (v19);
      }
    }
    else
    {
      memcpy(*a4, *a2, v17);
    }
    *a3 -= v17;
    *a5 = v12 - v17;
    *a7 = 0;
    if (v12 >= v15) {
      return 0;
    }
    else {
      return 7;
    }
  }
  return v7;
}

uint64_t _citrus_iconv_none_iconv_getops(uint64_t a1)
{
  long long v1 = _citrus_iconv_none_iconv_ops;
  long long v2 = *(_OWORD *)&off_26BD2F1D8;
  *(void *)(a1 + 32) = off_26BD2F1E8;
  *(_OWORD *)a1 = v1;
  *(_OWORD *)(a1 + 16) = v2;
  return 0;
}