size_t ffi_java_raw_size(ffi_cif *cif)
{
  unsigned int nargs;
  size_t result;
  ffi_type **i;
  unsigned int type;
  uint64_t v6;

  nargs = cif->nargs;
  if ((int)(nargs - 1) >= 0)
  {
    result = 0;
    for (i = cif->arg_types; ; ++i)
    {
      type = (*i)->type;
      if (type <= 0xA)
      {
        v6 = 16;
        if (type != 3) {
          goto LABEL_9;
        }
      }
      else
      {
        v6 = 16;
        if (type - 11 >= 2)
        {
          if (type == 15 || type == 13) {
            abort();
          }
LABEL_9:
          v6 = 8;
        }
      }
      result += v6;
      if ((int)--nargs <= 0) {
        return result;
      }
    }
  }
  return 0;
}

void ffi_java_raw_to_ptrarray(ffi_cif *cif, ffi_java_raw *raw, void **args)
{
  unsigned int nargs = cif->nargs;
  if (nargs)
  {
    arg_types = cif->arg_types;
    do
    {
      int type = (*arg_types)->type;
      if ((type - 11) < 2 || type == 3)
      {
        *args = raw;
        raw += 2;
      }
      else
      {
        if (type == 15) {
          abort();
        }
        *args = raw++;
      }
      ++arg_types;
      ++args;
      --nargs;
    }
    while (nargs);
  }
}

void ffi_java_ptrarray_to_raw(ffi_cif *cif, void **args, ffi_java_raw *raw)
{
  if (cif->nargs)
  {
    uint64_t v3 = 0;
    arg_types = cif->arg_types;
    do
    {
      switch(arg_types[v3]->type)
      {
        case 2u:
          raw->flt = *(float *)args[v3];
          ++raw;
          break;
        case 3u:
        case 0xBu:
        case 0xCu:
          raw->sint = *(ffi_sarg *)args[v3];
          raw += 2;
          break;
        case 5u:
          ffi_sarg v5 = *(unsigned __int8 *)args[v3];
          goto LABEL_13;
        case 6u:
          ffi_sarg v5 = *(char *)args[v3];
          goto LABEL_13;
        case 7u:
          ffi_sarg v5 = *(unsigned __int16 *)args[v3];
          goto LABEL_13;
        case 8u:
          ffi_sarg v5 = *(__int16 *)args[v3];
          goto LABEL_13;
        case 9u:
          ffi_sarg v5 = *(unsigned int *)args[v3];
          goto LABEL_13;
        case 0xAu:
          ffi_sarg v5 = *(int *)args[v3];
          goto LABEL_13;
        case 0xEu:
          ffi_sarg v5 = *(void *)args[v3];
LABEL_13:
          raw->sint = v5;
          ++raw;
          break;
        default:
          break;
      }
      ++v3;
    }
    while (v3 < cif->nargs);
  }
}

void ffi_java_raw_call(ffi_cif *cif, void (*fn)(void), void *rvalue, ffi_java_raw *avalue)
{
  v10[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  v9 = (char *)v10 - ((v8 + 15) & 0xFFFFFFFF0);
  bzero(v9, v8);
  ffi_java_raw_to_ptrarray(cif, avalue, (void **)v9);
  ffi_call(cif, fn, rvalue, (void **)v9);
}

ffi_status ffi_prep_java_raw_closure_loc(ffi_java_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_java_raw *, void *), void *user_data, void *codeloc)
{
  ffi_status result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_java_translate_args, codeloc, codeloc);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_java_translate_args(ffi_cif *a1, uint64_t a2, void **a3, uint64_t a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  ffi_java_raw_size(a1);
  size_t v8 = (ffi_java_raw *)((char *)v11 - ((MEMORY[0x270FA5388]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  ffi_java_ptrarray_to_raw(a1, a3, v8);
  return (*(uint64_t (**)(ffi_cif *, uint64_t, ffi_java_raw *, void))(a4 + 40))(a1, a2, v8, *(void *)(a4 + 48));
}

ffi_status ffi_prep_java_raw_closure(ffi_java_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_java_raw *, void *), void *user_data)
{
  ffi_status result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_java_translate_args, a1, a1);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

size_t ffi_raw_size(ffi_cif *cif)
{
  signed int nargs = cif->nargs;
  if (nargs - 1 < 0) {
    return 0;
  }
  size_t result = 0;
  arg_types = cif->arg_types;
  do
  {
    if ((*arg_types)->type == 13) {
      result += 8;
    }
    else {
      result += (((*arg_types)->size - 1) | 7) + 1;
    }
    ++arg_types;
    --nargs;
  }
  while (nargs > 0);
  return result;
}

void ffi_raw_to_ptrarray(ffi_cif *cif, ffi_raw *raw, void **args)
{
  unsigned int nargs = cif->nargs;
  if (nargs)
  {
    arg_types = cif->arg_types;
    do
    {
      int type = (*arg_types)->type;
      if (type == 15 || type == 13)
      {
        sint = (void *)raw->sint;
        ++raw;
        *args = sint;
      }
      else
      {
        *args = raw;
        raw = (ffi_raw *)((char *)raw + (((*arg_types)->size - 1) | 7) + 1);
      }
      ++arg_types;
      ++args;
      --nargs;
    }
    while (nargs);
  }
}

void ffi_ptrarray_to_raw(ffi_cif *cif, void **args, ffi_raw *raw)
{
  if (cif->nargs)
  {
    uint64_t v6 = 0;
    arg_types = cif->arg_types;
    do
    {
      size_t v8 = arg_types[v6];
      switch(v8->type)
      {
        case 5u:
          ffi_sarg v9 = *(unsigned __int8 *)args[v6];
          goto LABEL_13;
        case 6u:
          ffi_sarg v9 = *(char *)args[v6];
          goto LABEL_13;
        case 7u:
          ffi_sarg v9 = *(unsigned __int16 *)args[v6];
          goto LABEL_13;
        case 8u:
          ffi_sarg v9 = *(__int16 *)args[v6];
          goto LABEL_13;
        case 9u:
          ffi_sarg v9 = *(unsigned int *)args[v6];
          goto LABEL_13;
        case 0xAu:
          ffi_sarg v9 = *(int *)args[v6];
          goto LABEL_13;
        case 0xDu:
        case 0xFu:
          ffi_sarg v9 = (ffi_sarg)args[v6];
          goto LABEL_13;
        case 0xEu:
          ffi_sarg v9 = *(void *)args[v6];
LABEL_13:
          raw->sint = v9;
          ++raw;
          break;
        default:
          memcpy(raw, args[v6], v8->size);
          raw = (ffi_raw *)((char *)raw + ((arg_types[v6]->size - 1) | 7) + 1);
          break;
      }
      ++v6;
    }
    while (v6 < cif->nargs);
  }
}

void ffi_raw_call(ffi_cif *cif, void (*fn)(void), void *rvalue, ffi_raw *avalue)
{
  v10[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  ffi_sarg v9 = (char *)v10 - ((v8 + 15) & 0xFFFFFFFF0);
  bzero(v9, v8);
  ffi_raw_to_ptrarray(cif, avalue, (void **)v9);
  ffi_call(cif, fn, rvalue, (void **)v9);
}

ffi_status ffi_prep_raw_closure_loc(ffi_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_raw *, void *), void *user_data, void *codeloc)
{
  ffi_status result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_translate_args, codeloc, codeloc);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_translate_args(ffi_cif *a1, uint64_t a2, void **a3, uint64_t a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  ffi_raw_size(a1);
  size_t v8 = (ffi_raw *)((char *)v11 - ((MEMORY[0x270FA5388]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  ffi_ptrarray_to_raw(a1, a3, v8);
  return (*(uint64_t (**)(ffi_cif *, uint64_t, ffi_raw *, void))(a4 + 40))(a1, a2, v8, *(void *)(a4 + 48));
}

ffi_status ffi_prep_raw_closure(ffi_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_raw *, void *), void *user_data)
{
  ffi_status result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_translate_args, a1, a1);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_prep_cif_core(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t **a7)
{
  if ((a2 - 1) > 1) {
    return 2;
  }
  v7 = a7;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a5;
  *(void *)(a1 + 8) = a7;
  *(void *)(a1 + 16) = a6;
  *(_DWORD *)(a1 + 28) = 0;
  if (*(void *)a6)
  {
    int v11 = a5;
  }
  else
  {
    if (initialize_aggregate(a6, 0)) {
      return 1;
    }
    v7 = *(uint64_t ***)(a1 + 8);
    a6 = *(void *)(a1 + 16);
    int v11 = *(_DWORD *)(a1 + 4);
  }
  for (int i = 8 * (*(_WORD *)(a6 + 10) == 13); v11; --v11)
  {
    v13 = *v7;
    uint64_t v14 = **v7;
    if (!v14)
    {
      if (initialize_aggregate((uint64_t)v13, 0)) {
        return 1;
      }
      v13 = *v7;
      uint64_t v14 = **v7;
    }
    int v15 = *((unsigned __int16 *)v13 + 4) - 1;
    if ((v15 & i) != 0) {
      int v16 = (v15 | (i - 1)) + 1;
    }
    else {
      int v16 = i;
    }
    int i = ((v14 - 1) | 7) + v16 + 1;
    ++v7;
  }
  *(_DWORD *)(a1 + 24) = i;
  if (a3)
  {
    return ffi_prep_cif_machdep_var(a1, a4);
  }
  else
  {
    return ffi_prep_cif_machdep(a1);
  }
}

BOOL initialize_aggregate(uint64_t a1, uint64_t *a2)
{
  if (!a1) {
    return 1;
  }
  uint64_t v3 = *(uint64_t **)(a1 + 16);
  if (!v3) {
    return 1;
  }
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  uint64_t v4 = *v3;
  if (*v3)
  {
    uint64_t v6 = 0;
    v7 = v3 + 1;
    do
    {
      if (!*(void *)v4)
      {
        if (initialize_aggregate()) {
          return 1;
        }
        uint64_t v6 = *(void *)a1;
        uint64_t v4 = *(v7 - 1);
      }
      uint64_t v8 = *(unsigned __int16 *)(v4 + 8);
      uint64_t v9 = ((v8 - 1) | (v6 - 1)) + 1;
      *(void *)a1 = v9;
      if (a2)
      {
        *a2++ = v9;
        uint64_t v9 = *(void *)a1;
      }
      uint64_t v6 = v9 + *(void *)v4;
      *(void *)a1 = v6;
      if (*(unsigned __int16 *)(a1 + 8) <= v8) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = *(unsigned __int16 *)(a1 + 8);
      }
      *(_WORD *)(a1 + 8) = v8;
      uint64_t v10 = *v7++;
      uint64_t v4 = v10;
    }
    while (v10);
    uint64_t v11 = ((v8 - 1) | (v6 - 1)) + 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)a1 = v11;
  return v11 == 0;
}

ffi_status ffi_prep_cif (ffi_cif *cif, ffi_abi abi, unsigned int nargs, ffi_type *rtype, ffi_type **atypes)
{
  return ffi_prep_cif_core((uint64_t)cif, abi, 0, nargs, nargs, (uint64_t)rtype, (uint64_t **)atypes);
}

ffi_status ffi_prep_cif_var(ffi_cif *cif, ffi_abi abi, unsigned int nfixedargs, unsigned int ntotalargs, ffi_type *rtype, ffi_type **atypes)
{
  ffi_status result = ffi_prep_cif_core((uint64_t)cif, abi, 1, nfixedargs, ntotalargs, (uint64_t)rtype, (uint64_t **)atypes);
  if (result == FFI_OK)
  {
    if (ntotalargs < 2)
    {
      return 0;
    }
    else
    {
      uint64_t v9 = atypes + 1;
      uint64_t v10 = ntotalargs - 1;
      while (1)
      {
        uint64_t v11 = *v9;
        if (*v9 == &ffi_type_float || (v11->type | 2) != 0xF && v11->size < 4) {
          break;
        }
        ++v9;
        if (!--v10) {
          return 0;
        }
      }
      return 3;
    }
  }
  return result;
}

ffi_status ffi_get_struct_offsets(ffi_abi abi, ffi_type *struct_type, size_t *offsets)
{
  if (abi - 1 > 1) {
    return 2;
  }
  if (struct_type->type == 13) {
    return initialize_aggregate((uint64_t)struct_type, (uint64_t *)offsets);
  }
  return 1;
}

uint64_t ffi_call_SYSV(uint64_t a1, void *a2, uint64_t (*a3)(void, void, void, void, void, void, void, void), uint64_t a4, uint64_t a5)
{
  *a2 = v5;
  a2[1] = v6;
  a2[4] = v10;
  a2[2] = a4;
  a2[3] = a5;
  uint64_t v8 = a3(v10[16], v10[17], v10[18], v10[19], v10[20], v10[21], v10[22], v10[23]);
  return ((uint64_t (*)(uint64_t))((char *)sub_23788F080 + 8 * (a2[3] & 0x1FLL)))(v8);
}

void ffi_closure_SYSV_V()
{
}

void ffi_closure_SYSV(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  uint64_t v19 = a7;
  uint64_t v20 = a8;
  uint64_t v11 = (char *)sub_23788F200
      + 8
      * (ffi_closure_SYSV_inner(*(void *)(v10 + 16), *(void (**)(uint64_t, uint64_t, char *, uint64_t))(v10 + 24), *(void *)(v10 + 32), (uint64_t)v12, (uint64_t)&a10, (uint64_t)v21, a9) & 0x1F);
  __asm { BR              X1 }
}

void ffi_closure_trampoline_table_page()
{
  __asm { BR              X16 }
}

void sub_237893010()
{
  __asm { BR              X16 }
}

void sub_237893020()
{
  __asm { BR              X16 }
}

void sub_237893030()
{
  __asm { BR              X16 }
}

void sub_237893040()
{
  __asm { BR              X16 }
}

void sub_237893050()
{
  __asm { BR              X16 }
}

void sub_237893060()
{
  __asm { BR              X16 }
}

void sub_237893070()
{
}

void sub_237893080()
{
  __asm { BR              X16 }
}

void sub_237893090()
{
  __asm { BR              X16 }
}

void sub_2378930A0()
{
  __asm { BR              X16 }
}

void sub_2378930B0()
{
  __asm { BR              X16 }
}

void sub_2378930C0()
{
  __asm { BR              X16 }
}

void sub_2378930D0()
{
  __asm { BR              X16 }
}

void sub_2378930E0()
{
  __asm { BR              X16 }
}

void sub_2378930F0()
{
  __asm { BR              X16 }
}

void sub_237893100()
{
  __asm { BR              X16 }
}

void sub_237893110()
{
  __asm { BR              X16 }
}

void sub_237893120()
{
  __asm { BR              X16 }
}

void sub_237893130()
{
  __asm { BR              X16 }
}

void sub_237893140()
{
  __asm { BR              X16 }
}

void sub_237893150()
{
  __asm { BR              X16 }
}

void sub_237893160()
{
  __asm { BR              X16 }
}

void sub_237893170()
{
  __asm { BR              X16 }
}

void sub_237893180()
{
}

void sub_237893190()
{
  __asm { BR              X16 }
}

void sub_2378931A0()
{
  __asm { BR              X16 }
}

void sub_2378931B0()
{
  __asm { BR              X16 }
}

void sub_2378931C0()
{
  __asm { BR              X16 }
}

void sub_2378931D0()
{
  __asm { BR              X16 }
}

void sub_2378931E0()
{
  __asm { BR              X16 }
}

void sub_2378931F0()
{
  __asm { BR              X16 }
}

void sub_237893200()
{
  __asm { BR              X16 }
}

void sub_237893210()
{
  __asm { BR              X16 }
}

void sub_237893220()
{
  __asm { BR              X16 }
}

void sub_237893230()
{
  __asm { BR              X16 }
}

void sub_237893240()
{
  __asm { BR              X16 }
}

void sub_237893250()
{
  __asm { BR              X16 }
}

void sub_237893260()
{
  __asm { BR              X16 }
}

void sub_237893270()
{
  __asm { BR              X16 }
}

void sub_237893280()
{
  __asm { BR              X16 }
}

void sub_237893290()
{
  __asm { BR              X16 }
}

void sub_2378932A0()
{
  __asm { BR              X16 }
}

void sub_2378932B0()
{
  __asm { BR              X16 }
}

void sub_2378932C0()
{
  __asm { BR              X16 }
}

void sub_2378932D0()
{
  __asm { BR              X16 }
}

void sub_2378932E0()
{
  __asm { BR              X16 }
}

void sub_2378932F0()
{
  __asm { BR              X16 }
}

void sub_237893300()
{
  __asm { BR              X16 }
}

void sub_237893310()
{
  __asm { BR              X16 }
}

void sub_237893320()
{
  __asm { BR              X16 }
}

void sub_237893330()
{
  __asm { BR              X16 }
}

void sub_237893340()
{
  __asm { BR              X16 }
}

void sub_237893350()
{
  __asm { BR              X16 }
}

void sub_237893360()
{
  __asm { BR              X16 }
}

void sub_237893370()
{
  __asm { BR              X16 }
}

void sub_237893380()
{
  __asm { BR              X16 }
}

void sub_237893390()
{
  __asm { BR              X16 }
}

void sub_2378933A0()
{
  __asm { BR              X16 }
}

void sub_2378933B0()
{
  __asm { BR              X16 }
}

void sub_2378933C0()
{
  __asm { BR              X16 }
}

void sub_2378933D0()
{
  __asm { BR              X16 }
}

void sub_2378933E0()
{
  __asm { BR              X16 }
}

void sub_2378933F0()
{
  __asm { BR              X16 }
}

void sub_237893400()
{
  __asm { BR              X16 }
}

void sub_237893410()
{
  __asm { BR              X16 }
}

void sub_237893420()
{
  __asm { BR              X16 }
}

void sub_237893430()
{
  __asm { BR              X16 }
}

void sub_237893440()
{
  __asm { BR              X16 }
}

void sub_237893450()
{
  __asm { BR              X16 }
}

void sub_237893460()
{
  __asm { BR              X16 }
}

void sub_237893470()
{
  __asm { BR              X16 }
}

void sub_237893480()
{
  __asm { BR              X16 }
}

void sub_237893490()
{
  __asm { BR              X16 }
}

void sub_2378934A0()
{
  __asm { BR              X16 }
}

void sub_2378934B0()
{
  __asm { BR              X16 }
}

void sub_2378934C0()
{
  __asm { BR              X16 }
}

void sub_2378934D0()
{
  __asm { BR              X16 }
}

void sub_2378934E0()
{
  __asm { BR              X16 }
}

void sub_2378934F0()
{
  __asm { BR              X16 }
}

void sub_237893500()
{
  __asm { BR              X16 }
}

void sub_237893510()
{
  __asm { BR              X16 }
}

void sub_237893520()
{
  __asm { BR              X16 }
}

void sub_237893530()
{
  __asm { BR              X16 }
}

void sub_237893540()
{
  __asm { BR              X16 }
}

void sub_237893550()
{
  __asm { BR              X16 }
}

void sub_237893560()
{
  __asm { BR              X16 }
}

void sub_237893570()
{
  __asm { BR              X16 }
}

void sub_237893580()
{
  __asm { BR              X16 }
}

void sub_237893590()
{
  __asm { BR              X16 }
}

void sub_2378935A0()
{
  __asm { BR              X16 }
}

void sub_2378935B0()
{
  __asm { BR              X16 }
}

void sub_2378935C0()
{
  __asm { BR              X16 }
}

void sub_2378935D0()
{
  __asm { BR              X16 }
}

void sub_2378935E0()
{
  __asm { BR              X16 }
}

void sub_2378935F0()
{
  __asm { BR              X16 }
}

void sub_237893600()
{
  __asm { BR              X16 }
}

void sub_237893610()
{
  __asm { BR              X16 }
}

void sub_237893620()
{
  __asm { BR              X16 }
}

void sub_237893630()
{
  __asm { BR              X16 }
}

void sub_237893640()
{
  __asm { BR              X16 }
}

void sub_237893650()
{
  __asm { BR              X16 }
}

void sub_237893660()
{
  __asm { BR              X16 }
}

void sub_237893670()
{
  __asm { BR              X16 }
}

void sub_237893680()
{
  __asm { BR              X16 }
}

void sub_237893690()
{
  __asm { BR              X16 }
}

void sub_2378936A0()
{
  __asm { BR              X16 }
}

void sub_2378936B0()
{
  __asm { BR              X16 }
}

void sub_2378936C0()
{
  __asm { BR              X16 }
}

void sub_2378936D0()
{
  __asm { BR              X16 }
}

void sub_2378936E0()
{
  __asm { BR              X16 }
}

void sub_2378936F0()
{
  __asm { BR              X16 }
}

void sub_237893700()
{
  __asm { BR              X16 }
}

void sub_237893710()
{
  __asm { BR              X16 }
}

void sub_237893720()
{
  __asm { BR              X16 }
}

void sub_237893730()
{
  __asm { BR              X16 }
}

void sub_237893740()
{
  __asm { BR              X16 }
}

void sub_237893750()
{
  __asm { BR              X16 }
}

void sub_237893760()
{
  __asm { BR              X16 }
}

void sub_237893770()
{
  __asm { BR              X16 }
}

void sub_237893780()
{
  __asm { BR              X16 }
}

void sub_237893790()
{
  __asm { BR              X16 }
}

void sub_2378937A0()
{
  __asm { BR              X16 }
}

void sub_2378937B0()
{
  __asm { BR              X16 }
}

void sub_2378937C0()
{
  __asm { BR              X16 }
}

void sub_2378937D0()
{
  __asm { BR              X16 }
}

void sub_2378937E0()
{
  __asm { BR              X16 }
}

void sub_2378937F0()
{
  __asm { BR              X16 }
}

void sub_237893800()
{
  __asm { BR              X16 }
}

void sub_237893810()
{
  __asm { BR              X16 }
}

void sub_237893820()
{
  __asm { BR              X16 }
}

void sub_237893830()
{
  __asm { BR              X16 }
}

void sub_237893840()
{
  __asm { BR              X16 }
}

void sub_237893850()
{
  __asm { BR              X16 }
}

void sub_237893860()
{
  __asm { BR              X16 }
}

void sub_237893870()
{
  __asm { BR              X16 }
}

void sub_237893880()
{
  __asm { BR              X16 }
}

void sub_237893890()
{
  __asm { BR              X16 }
}

void sub_2378938A0()
{
  __asm { BR              X16 }
}

void sub_2378938B0()
{
  __asm { BR              X16 }
}

void sub_2378938C0()
{
  __asm { BR              X16 }
}

void sub_2378938D0()
{
  __asm { BR              X16 }
}

void sub_2378938E0()
{
  __asm { BR              X16 }
}

void sub_2378938F0()
{
  __asm { BR              X16 }
}

void sub_237893900()
{
  __asm { BR              X16 }
}

void sub_237893910()
{
  __asm { BR              X16 }
}

void sub_237893920()
{
  __asm { BR              X16 }
}

void sub_237893930()
{
  __asm { BR              X16 }
}

void sub_237893940()
{
  __asm { BR              X16 }
}

void sub_237893950()
{
  __asm { BR              X16 }
}

void sub_237893960()
{
  __asm { BR              X16 }
}

void sub_237893970()
{
  __asm { BR              X16 }
}

void sub_237893980()
{
  __asm { BR              X16 }
}

void sub_237893990()
{
  __asm { BR              X16 }
}

void sub_2378939A0()
{
  __asm { BR              X16 }
}

void sub_2378939B0()
{
  __asm { BR              X16 }
}

void sub_2378939C0()
{
  __asm { BR              X16 }
}

void sub_2378939D0()
{
  __asm { BR              X16 }
}

void sub_2378939E0()
{
  __asm { BR              X16 }
}

void sub_2378939F0()
{
  __asm { BR              X16 }
}

void sub_237893A00()
{
  __asm { BR              X16 }
}

void sub_237893A10()
{
  __asm { BR              X16 }
}

void sub_237893A20()
{
  __asm { BR              X16 }
}

void sub_237893A30()
{
  __asm { BR              X16 }
}

void sub_237893A40()
{
  __asm { BR              X16 }
}

void sub_237893A50()
{
  __asm { BR              X16 }
}

void sub_237893A60()
{
  __asm { BR              X16 }
}

void sub_237893A70()
{
  __asm { BR              X16 }
}

void sub_237893A80()
{
  __asm { BR              X16 }
}

void sub_237893A90()
{
  __asm { BR              X16 }
}

void sub_237893AA0()
{
  __asm { BR              X16 }
}

void sub_237893AB0()
{
  __asm { BR              X16 }
}

void sub_237893AC0()
{
  __asm { BR              X16 }
}

void sub_237893AD0()
{
  __asm { BR              X16 }
}

void sub_237893AE0()
{
  __asm { BR              X16 }
}

void sub_237893AF0()
{
  __asm { BR              X16 }
}

void sub_237893B00()
{
  __asm { BR              X16 }
}

void sub_237893B10()
{
  __asm { BR              X16 }
}

void sub_237893B20()
{
  __asm { BR              X16 }
}

void sub_237893B30()
{
  __asm { BR              X16 }
}

void sub_237893B40()
{
  __asm { BR              X16 }
}

void sub_237893B50()
{
  __asm { BR              X16 }
}

void sub_237893B60()
{
  __asm { BR              X16 }
}

void sub_237893B70()
{
  __asm { BR              X16 }
}

void sub_237893B80()
{
  __asm { BR              X16 }
}

void sub_237893B90()
{
  __asm { BR              X16 }
}

void sub_237893BA0()
{
  __asm { BR              X16 }
}

void sub_237893BB0()
{
  __asm { BR              X16 }
}

void sub_237893BC0()
{
  __asm { BR              X16 }
}

void sub_237893BD0()
{
  __asm { BR              X16 }
}

void sub_237893BE0()
{
  __asm { BR              X16 }
}

void sub_237893BF0()
{
  __asm { BR              X16 }
}

void sub_237893C00()
{
  __asm { BR              X16 }
}

void sub_237893C10()
{
  __asm { BR              X16 }
}

void sub_237893C20()
{
  __asm { BR              X16 }
}

void sub_237893C30()
{
  __asm { BR              X16 }
}

void sub_237893C40()
{
  __asm { BR              X16 }
}

void sub_237893C50()
{
  __asm { BR              X16 }
}

void sub_237893C60()
{
  __asm { BR              X16 }
}

void sub_237893C70()
{
  __asm { BR              X16 }
}

void sub_237893C80()
{
  __asm { BR              X16 }
}

void sub_237893C90()
{
  __asm { BR              X16 }
}

void sub_237893CA0()
{
  __asm { BR              X16 }
}

void sub_237893CB0()
{
  __asm { BR              X16 }
}

void sub_237893CC0()
{
  __asm { BR              X16 }
}

void sub_237893CD0()
{
  __asm { BR              X16 }
}

void sub_237893CE0()
{
  __asm { BR              X16 }
}

void sub_237893CF0()
{
  __asm { BR              X16 }
}

void sub_237893D00()
{
  __asm { BR              X16 }
}

void sub_237893D10()
{
  __asm { BR              X16 }
}

void sub_237893D20()
{
  __asm { BR              X16 }
}

void sub_237893D30()
{
  __asm { BR              X16 }
}

void sub_237893D40()
{
  __asm { BR              X16 }
}

void sub_237893D50()
{
  __asm { BR              X16 }
}

void sub_237893D60()
{
  __asm { BR              X16 }
}

void sub_237893D70()
{
  __asm { BR              X16 }
}

void sub_237893D80()
{
  __asm { BR              X16 }
}

void sub_237893D90()
{
  __asm { BR              X16 }
}

void sub_237893DA0()
{
  __asm { BR              X16 }
}

void sub_237893DB0()
{
  __asm { BR              X16 }
}

void sub_237893DC0()
{
  __asm { BR              X16 }
}

void sub_237893DD0()
{
  __asm { BR              X16 }
}

void sub_237893DE0()
{
  __asm { BR              X16 }
}

void sub_237893DF0()
{
  __asm { BR              X16 }
}

void sub_237893E00()
{
  __asm { BR              X16 }
}

void sub_237893E10()
{
  __asm { BR              X16 }
}

void sub_237893E20()
{
  __asm { BR              X16 }
}

void sub_237893E30()
{
  __asm { BR              X16 }
}

void sub_237893E40()
{
  __asm { BR              X16 }
}

void sub_237893E50()
{
  __asm { BR              X16 }
}

void sub_237893E60()
{
  __asm { BR              X16 }
}

void sub_237893E70()
{
  __asm { BR              X16 }
}

void sub_237893E80()
{
  __asm { BR              X16 }
}

void sub_237893E90()
{
  __asm { BR              X16 }
}

void sub_237893EA0()
{
  __asm { BR              X16 }
}

void sub_237893EB0()
{
  __asm { BR              X16 }
}

void sub_237893EC0()
{
  __asm { BR              X16 }
}

void sub_237893ED0()
{
  __asm { BR              X16 }
}

void sub_237893EE0()
{
  __asm { BR              X16 }
}

void sub_237893EF0()
{
  __asm { BR              X16 }
}

void sub_237893F00()
{
  __asm { BR              X16 }
}

void sub_237893F10()
{
  __asm { BR              X16 }
}

void sub_237893F20()
{
  __asm { BR              X16 }
}

void sub_237893F30()
{
  __asm { BR              X16 }
}

void sub_237893F40()
{
  __asm { BR              X16 }
}

void sub_237893F50()
{
  __asm { BR              X16 }
}

void sub_237893F60()
{
  __asm { BR              X16 }
}

void sub_237893F70()
{
  __asm { BR              X16 }
}

void sub_237893F80()
{
  __asm { BR              X16 }
}

void sub_237893F90()
{
  __asm { BR              X16 }
}

void sub_237893FA0()
{
  __asm { BR              X16 }
}

void sub_237893FB0()
{
  __asm { BR              X16 }
}

void sub_237893FC0()
{
  __asm { BR              X16 }
}

void sub_237893FD0()
{
  __asm { BR              X16 }
}

void sub_237893FE0()
{
  __asm { BR              X16 }
}

void sub_237893FF0()
{
  __asm { BR              X16 }
}

void sub_237894000()
{
  __asm { BR              X16 }
}

void sub_237894010()
{
  __asm { BR              X16 }
}

void sub_237894020()
{
  __asm { BR              X16 }
}

void sub_237894030()
{
  __asm { BR              X16 }
}

void sub_237894040()
{
  __asm { BR              X16 }
}

void sub_237894050()
{
  __asm { BR              X16 }
}

void sub_237894060()
{
  __asm { BR              X16 }
}

void sub_237894070()
{
  __asm { BR              X16 }
}

void sub_237894080()
{
  __asm { BR              X16 }
}

void sub_237894090()
{
  __asm { BR              X16 }
}

void sub_2378940A0()
{
  __asm { BR              X16 }
}

void sub_2378940B0()
{
  __asm { BR              X16 }
}

void sub_2378940C0()
{
  __asm { BR              X16 }
}

void sub_2378940D0()
{
  __asm { BR              X16 }
}

void sub_2378940E0()
{
  __asm { BR              X16 }
}

void sub_2378940F0()
{
  __asm { BR              X16 }
}

void sub_237894100()
{
  __asm { BR              X16 }
}

void sub_237894110()
{
  __asm { BR              X16 }
}

void sub_237894120()
{
  __asm { BR              X16 }
}

void sub_237894130()
{
  __asm { BR              X16 }
}

void sub_237894140()
{
  __asm { BR              X16 }
}

void sub_237894150()
{
  __asm { BR              X16 }
}

void sub_237894160()
{
  __asm { BR              X16 }
}

void sub_237894170()
{
  __asm { BR              X16 }
}

void sub_237894180()
{
  __asm { BR              X16 }
}

void sub_237894190()
{
  __asm { BR              X16 }
}

void sub_2378941A0()
{
  __asm { BR              X16 }
}

void sub_2378941B0()
{
  __asm { BR              X16 }
}

void sub_2378941C0()
{
  __asm { BR              X16 }
}

void sub_2378941D0()
{
  __asm { BR              X16 }
}

void sub_2378941E0()
{
  __asm { BR              X16 }
}

void sub_2378941F0()
{
  __asm { BR              X16 }
}

void sub_237894200()
{
  __asm { BR              X16 }
}

void sub_237894210()
{
  __asm { BR              X16 }
}

void sub_237894220()
{
  __asm { BR              X16 }
}

void sub_237894230()
{
  __asm { BR              X16 }
}

void sub_237894240()
{
  __asm { BR              X16 }
}

void sub_237894250()
{
  __asm { BR              X16 }
}

void sub_237894260()
{
  __asm { BR              X16 }
}

void sub_237894270()
{
  __asm { BR              X16 }
}

void sub_237894280()
{
  __asm { BR              X16 }
}

void sub_237894290()
{
  __asm { BR              X16 }
}

void sub_2378942A0()
{
  __asm { BR              X16 }
}

void sub_2378942B0()
{
  __asm { BR              X16 }
}

void sub_2378942C0()
{
  __asm { BR              X16 }
}

void sub_2378942D0()
{
  __asm { BR              X16 }
}

void sub_2378942E0()
{
  __asm { BR              X16 }
}

void sub_2378942F0()
{
  __asm { BR              X16 }
}

void sub_237894300()
{
  __asm { BR              X16 }
}

void sub_237894310()
{
  __asm { BR              X16 }
}

void sub_237894320()
{
  __asm { BR              X16 }
}

void sub_237894330()
{
  __asm { BR              X16 }
}

void sub_237894340()
{
  __asm { BR              X16 }
}

void sub_237894350()
{
  __asm { BR              X16 }
}

void sub_237894360()
{
  __asm { BR              X16 }
}

void sub_237894370()
{
  __asm { BR              X16 }
}

void sub_237894380()
{
  __asm { BR              X16 }
}

void sub_237894390()
{
  __asm { BR              X16 }
}

void sub_2378943A0()
{
  __asm { BR              X16 }
}

void sub_2378943B0()
{
  __asm { BR              X16 }
}

void sub_2378943C0()
{
  __asm { BR              X16 }
}

void sub_2378943D0()
{
  __asm { BR              X16 }
}

void sub_2378943E0()
{
  __asm { BR              X16 }
}

void sub_2378943F0()
{
  __asm { BR              X16 }
}

void sub_237894400()
{
  __asm { BR              X16 }
}

void sub_237894410()
{
  __asm { BR              X16 }
}

void sub_237894420()
{
  __asm { BR              X16 }
}

void sub_237894430()
{
  __asm { BR              X16 }
}

void sub_237894440()
{
  __asm { BR              X16 }
}

void sub_237894450()
{
  __asm { BR              X16 }
}

void sub_237894460()
{
  __asm { BR              X16 }
}

void sub_237894470()
{
  __asm { BR              X16 }
}

void sub_237894480()
{
  __asm { BR              X16 }
}

void sub_237894490()
{
  __asm { BR              X16 }
}

void sub_2378944A0()
{
  __asm { BR              X16 }
}

void sub_2378944B0()
{
  __asm { BR              X16 }
}

void sub_2378944C0()
{
  __asm { BR              X16 }
}

void sub_2378944D0()
{
  __asm { BR              X16 }
}

void sub_2378944E0()
{
  __asm { BR              X16 }
}

void sub_2378944F0()
{
  __asm { BR              X16 }
}

void sub_237894500()
{
  __asm { BR              X16 }
}

void sub_237894510()
{
  __asm { BR              X16 }
}

void sub_237894520()
{
  __asm { BR              X16 }
}

void sub_237894530()
{
  __asm { BR              X16 }
}

void sub_237894540()
{
  __asm { BR              X16 }
}

void sub_237894550()
{
  __asm { BR              X16 }
}

void sub_237894560()
{
  __asm { BR              X16 }
}

void sub_237894570()
{
  __asm { BR              X16 }
}

void sub_237894580()
{
  __asm { BR              X16 }
}

void sub_237894590()
{
  __asm { BR              X16 }
}

void sub_2378945A0()
{
  __asm { BR              X16 }
}

void sub_2378945B0()
{
  __asm { BR              X16 }
}

void sub_2378945C0()
{
  __asm { BR              X16 }
}

void sub_2378945D0()
{
  __asm { BR              X16 }
}

void sub_2378945E0()
{
  __asm { BR              X16 }
}

void sub_2378945F0()
{
  __asm { BR              X16 }
}

void sub_237894600()
{
  __asm { BR              X16 }
}

void sub_237894610()
{
  __asm { BR              X16 }
}

void sub_237894620()
{
  __asm { BR              X16 }
}

void sub_237894630()
{
  __asm { BR              X16 }
}

void sub_237894640()
{
  __asm { BR              X16 }
}

void sub_237894650()
{
  __asm { BR              X16 }
}

void sub_237894660()
{
  __asm { BR              X16 }
}

void sub_237894670()
{
  __asm { BR              X16 }
}

void sub_237894680()
{
  __asm { BR              X16 }
}

void sub_237894690()
{
  __asm { BR              X16 }
}

void sub_2378946A0()
{
  __asm { BR              X16 }
}

void sub_2378946B0()
{
  __asm { BR              X16 }
}

void sub_2378946C0()
{
  __asm { BR              X16 }
}

void sub_2378946D0()
{
  __asm { BR              X16 }
}

void sub_2378946E0()
{
  __asm { BR              X16 }
}

void sub_2378946F0()
{
  __asm { BR              X16 }
}

void sub_237894700()
{
  __asm { BR              X16 }
}

void sub_237894710()
{
  __asm { BR              X16 }
}

void sub_237894720()
{
  __asm { BR              X16 }
}

void sub_237894730()
{
  __asm { BR              X16 }
}

void sub_237894740()
{
  __asm { BR              X16 }
}

void sub_237894750()
{
  __asm { BR              X16 }
}

void sub_237894760()
{
  __asm { BR              X16 }
}

void sub_237894770()
{
  __asm { BR              X16 }
}

void sub_237894780()
{
  __asm { BR              X16 }
}

void sub_237894790()
{
  __asm { BR              X16 }
}

void sub_2378947A0()
{
  __asm { BR              X16 }
}

void sub_2378947B0()
{
  __asm { BR              X16 }
}

void sub_2378947C0()
{
  __asm { BR              X16 }
}

void sub_2378947D0()
{
  __asm { BR              X16 }
}

void sub_2378947E0()
{
  __asm { BR              X16 }
}

void sub_2378947F0()
{
  __asm { BR              X16 }
}

void sub_237894800()
{
  __asm { BR              X16 }
}

void sub_237894810()
{
  __asm { BR              X16 }
}

void sub_237894820()
{
  __asm { BR              X16 }
}

void sub_237894830()
{
  __asm { BR              X16 }
}

void sub_237894840()
{
  __asm { BR              X16 }
}

void sub_237894850()
{
  __asm { BR              X16 }
}

void sub_237894860()
{
  __asm { BR              X16 }
}

void sub_237894870()
{
  __asm { BR              X16 }
}

void sub_237894880()
{
  __asm { BR              X16 }
}

void sub_237894890()
{
  __asm { BR              X16 }
}

void sub_2378948A0()
{
  __asm { BR              X16 }
}

void sub_2378948B0()
{
  __asm { BR              X16 }
}

void sub_2378948C0()
{
  __asm { BR              X16 }
}

void sub_2378948D0()
{
  __asm { BR              X16 }
}

void sub_2378948E0()
{
  __asm { BR              X16 }
}

void sub_2378948F0()
{
  __asm { BR              X16 }
}

void sub_237894900()
{
  __asm { BR              X16 }
}

void sub_237894910()
{
  __asm { BR              X16 }
}

void sub_237894920()
{
  __asm { BR              X16 }
}

void sub_237894930()
{
  __asm { BR              X16 }
}

void sub_237894940()
{
  __asm { BR              X16 }
}

void sub_237894950()
{
  __asm { BR              X16 }
}

void sub_237894960()
{
  __asm { BR              X16 }
}

void sub_237894970()
{
  __asm { BR              X16 }
}

void sub_237894980()
{
  __asm { BR              X16 }
}

void sub_237894990()
{
  __asm { BR              X16 }
}

void sub_2378949A0()
{
  __asm { BR              X16 }
}

void sub_2378949B0()
{
  __asm { BR              X16 }
}

void sub_2378949C0()
{
  __asm { BR              X16 }
}

void sub_2378949D0()
{
  __asm { BR              X16 }
}

void sub_2378949E0()
{
  __asm { BR              X16 }
}

void sub_2378949F0()
{
  __asm { BR              X16 }
}

void sub_237894A00()
{
  __asm { BR              X16 }
}

void sub_237894A10()
{
  __asm { BR              X16 }
}

void sub_237894A20()
{
  __asm { BR              X16 }
}

void sub_237894A30()
{
  __asm { BR              X16 }
}

void sub_237894A40()
{
  __asm { BR              X16 }
}

void sub_237894A50()
{
  __asm { BR              X16 }
}

void sub_237894A60()
{
  __asm { BR              X16 }
}

void sub_237894A70()
{
  __asm { BR              X16 }
}

void sub_237894A80()
{
  __asm { BR              X16 }
}

void sub_237894A90()
{
  __asm { BR              X16 }
}

void sub_237894AA0()
{
  __asm { BR              X16 }
}

void sub_237894AB0()
{
  __asm { BR              X16 }
}

void sub_237894AC0()
{
  __asm { BR              X16 }
}

void sub_237894AD0()
{
  __asm { BR              X16 }
}

void sub_237894AE0()
{
  __asm { BR              X16 }
}

void sub_237894AF0()
{
  __asm { BR              X16 }
}

void sub_237894B00()
{
  __asm { BR              X16 }
}

void sub_237894B10()
{
  __asm { BR              X16 }
}

void sub_237894B20()
{
  __asm { BR              X16 }
}

void sub_237894B30()
{
  __asm { BR              X16 }
}

void sub_237894B40()
{
  __asm { BR              X16 }
}

void sub_237894B50()
{
  __asm { BR              X16 }
}

void sub_237894B60()
{
  __asm { BR              X16 }
}

void sub_237894B70()
{
  __asm { BR              X16 }
}

void sub_237894B80()
{
  __asm { BR              X16 }
}

void sub_237894B90()
{
  __asm { BR              X16 }
}

void sub_237894BA0()
{
  __asm { BR              X16 }
}

void sub_237894BB0()
{
  __asm { BR              X16 }
}

void sub_237894BC0()
{
  __asm { BR              X16 }
}

void sub_237894BD0()
{
  __asm { BR              X16 }
}

void sub_237894BE0()
{
  __asm { BR              X16 }
}

void sub_237894BF0()
{
  __asm { BR              X16 }
}

void sub_237894C00()
{
  __asm { BR              X16 }
}

void sub_237894C10()
{
  __asm { BR              X16 }
}

void sub_237894C20()
{
  __asm { BR              X16 }
}

void sub_237894C30()
{
  __asm { BR              X16 }
}

void sub_237894C40()
{
  __asm { BR              X16 }
}

void sub_237894C50()
{
  __asm { BR              X16 }
}

void sub_237894C60()
{
  __asm { BR              X16 }
}

void sub_237894C70()
{
  __asm { BR              X16 }
}

void sub_237894C80()
{
  __asm { BR              X16 }
}

void sub_237894C90()
{
  __asm { BR              X16 }
}

void sub_237894CA0()
{
  __asm { BR              X16 }
}

void sub_237894CB0()
{
  __asm { BR              X16 }
}

void sub_237894CC0()
{
  __asm { BR              X16 }
}

void sub_237894CD0()
{
  __asm { BR              X16 }
}

void sub_237894CE0()
{
  __asm { BR              X16 }
}

void sub_237894CF0()
{
  __asm { BR              X16 }
}

void sub_237894D00()
{
  __asm { BR              X16 }
}

void sub_237894D10()
{
  __asm { BR              X16 }
}

void sub_237894D20()
{
  __asm { BR              X16 }
}

void sub_237894D30()
{
  __asm { BR              X16 }
}

void sub_237894D40()
{
  __asm { BR              X16 }
}

void sub_237894D50()
{
  __asm { BR              X16 }
}

void sub_237894D60()
{
  __asm { BR              X16 }
}

void sub_237894D70()
{
  __asm { BR              X16 }
}

void sub_237894D80()
{
  __asm { BR              X16 }
}

void sub_237894D90()
{
  __asm { BR              X16 }
}

void sub_237894DA0()
{
  __asm { BR              X16 }
}

void sub_237894DB0()
{
  __asm { BR              X16 }
}

void sub_237894DC0()
{
  __asm { BR              X16 }
}

void sub_237894DD0()
{
  __asm { BR              X16 }
}

void sub_237894DE0()
{
  __asm { BR              X16 }
}

void sub_237894DF0()
{
  __asm { BR              X16 }
}

void sub_237894E00()
{
  __asm { BR              X16 }
}

void sub_237894E10()
{
  __asm { BR              X16 }
}

void sub_237894E20()
{
  __asm { BR              X16 }
}

void sub_237894E30()
{
  __asm { BR              X16 }
}

void sub_237894E40()
{
  __asm { BR              X16 }
}

void sub_237894E50()
{
  __asm { BR              X16 }
}

void sub_237894E60()
{
  __asm { BR              X16 }
}

void sub_237894E70()
{
  __asm { BR              X16 }
}

void sub_237894E80()
{
  __asm { BR              X16 }
}

void sub_237894E90()
{
  __asm { BR              X16 }
}

void sub_237894EA0()
{
  __asm { BR              X16 }
}

void sub_237894EB0()
{
  __asm { BR              X16 }
}

void sub_237894EC0()
{
  __asm { BR              X16 }
}

void sub_237894ED0()
{
  __asm { BR              X16 }
}

void sub_237894EE0()
{
  __asm { BR              X16 }
}

void sub_237894EF0()
{
  __asm { BR              X16 }
}

void sub_237894F00()
{
  __asm { BR              X16 }
}

void sub_237894F10()
{
  __asm { BR              X16 }
}

void sub_237894F20()
{
  __asm { BR              X16 }
}

void sub_237894F30()
{
  __asm { BR              X16 }
}

void sub_237894F40()
{
  __asm { BR              X16 }
}

void sub_237894F50()
{
  __asm { BR              X16 }
}

void sub_237894F60()
{
  __asm { BR              X16 }
}

void sub_237894F70()
{
  __asm { BR              X16 }
}

void sub_237894F80()
{
  __asm { BR              X16 }
}

void sub_237894F90()
{
  __asm { BR              X16 }
}

void sub_237894FA0()
{
  __asm { BR              X16 }
}

void sub_237894FB0()
{
  __asm { BR              X16 }
}

void sub_237894FC0()
{
  __asm { BR              X16 }
}

void sub_237894FD0()
{
  __asm { BR              X16 }
}

void sub_237894FE0()
{
  __asm { BR              X16 }
}

void sub_237894FF0()
{
  __asm { BR              X16 }
}

void sub_237895000()
{
  __asm { BR              X16 }
}

void sub_237895010()
{
  __asm { BR              X16 }
}

void sub_237895020()
{
  __asm { BR              X16 }
}

void sub_237895030()
{
  __asm { BR              X16 }
}

void sub_237895040()
{
  __asm { BR              X16 }
}

void sub_237895050()
{
  __asm { BR              X16 }
}

void sub_237895060()
{
  __asm { BR              X16 }
}

void sub_237895070()
{
  __asm { BR              X16 }
}

void sub_237895080()
{
  __asm { BR              X16 }
}

void sub_237895090()
{
  __asm { BR              X16 }
}

void sub_2378950A0()
{
  __asm { BR              X16 }
}

void sub_2378950B0()
{
  __asm { BR              X16 }
}

void sub_2378950C0()
{
  __asm { BR              X16 }
}

void sub_2378950D0()
{
  __asm { BR              X16 }
}

void sub_2378950E0()
{
  __asm { BR              X16 }
}

void sub_2378950F0()
{
  __asm { BR              X16 }
}

void sub_237895100()
{
  __asm { BR              X16 }
}

void sub_237895110()
{
  __asm { BR              X16 }
}

void sub_237895120()
{
  __asm { BR              X16 }
}

void sub_237895130()
{
  __asm { BR              X16 }
}

void sub_237895140()
{
  __asm { BR              X16 }
}

void sub_237895150()
{
  __asm { BR              X16 }
}

void sub_237895160()
{
  __asm { BR              X16 }
}

void sub_237895170()
{
  __asm { BR              X16 }
}

void sub_237895180()
{
  __asm { BR              X16 }
}

void sub_237895190()
{
  __asm { BR              X16 }
}

void sub_2378951A0()
{
  __asm { BR              X16 }
}

void sub_2378951B0()
{
  __asm { BR              X16 }
}

void sub_2378951C0()
{
  __asm { BR              X16 }
}

void sub_2378951D0()
{
  __asm { BR              X16 }
}

void sub_2378951E0()
{
  __asm { BR              X16 }
}

void sub_2378951F0()
{
  __asm { BR              X16 }
}

void sub_237895200()
{
  __asm { BR              X16 }
}

void sub_237895210()
{
  __asm { BR              X16 }
}

void sub_237895220()
{
  __asm { BR              X16 }
}

void sub_237895230()
{
  __asm { BR              X16 }
}

void sub_237895240()
{
  __asm { BR              X16 }
}

void sub_237895250()
{
  __asm { BR              X16 }
}

void sub_237895260()
{
  __asm { BR              X16 }
}

void sub_237895270()
{
  __asm { BR              X16 }
}

void sub_237895280()
{
  __asm { BR              X16 }
}

void sub_237895290()
{
  __asm { BR              X16 }
}

void sub_2378952A0()
{
  __asm { BR              X16 }
}

void sub_2378952B0()
{
  __asm { BR              X16 }
}

void sub_2378952C0()
{
  __asm { BR              X16 }
}

void sub_2378952D0()
{
  __asm { BR              X16 }
}

void sub_2378952E0()
{
  __asm { BR              X16 }
}

void sub_2378952F0()
{
  __asm { BR              X16 }
}

void sub_237895300()
{
  __asm { BR              X16 }
}

void sub_237895310()
{
  __asm { BR              X16 }
}

void sub_237895320()
{
  __asm { BR              X16 }
}

void sub_237895330()
{
  __asm { BR              X16 }
}

void sub_237895340()
{
  __asm { BR              X16 }
}

void sub_237895350()
{
  __asm { BR              X16 }
}

void sub_237895360()
{
  __asm { BR              X16 }
}

void sub_237895370()
{
  __asm { BR              X16 }
}

void sub_237895380()
{
  __asm { BR              X16 }
}

void sub_237895390()
{
  __asm { BR              X16 }
}

void sub_2378953A0()
{
  __asm { BR              X16 }
}

void sub_2378953B0()
{
  __asm { BR              X16 }
}

void sub_2378953C0()
{
  __asm { BR              X16 }
}

void sub_2378953D0()
{
  __asm { BR              X16 }
}

void sub_2378953E0()
{
  __asm { BR              X16 }
}

void sub_2378953F0()
{
  __asm { BR              X16 }
}

void sub_237895400()
{
  __asm { BR              X16 }
}

void sub_237895410()
{
  __asm { BR              X16 }
}

void sub_237895420()
{
  __asm { BR              X16 }
}

void sub_237895430()
{
  __asm { BR              X16 }
}

void sub_237895440()
{
  __asm { BR              X16 }
}

void sub_237895450()
{
  __asm { BR              X16 }
}

void sub_237895460()
{
  __asm { BR              X16 }
}

void sub_237895470()
{
  __asm { BR              X16 }
}

void sub_237895480()
{
  __asm { BR              X16 }
}

void sub_237895490()
{
  __asm { BR              X16 }
}

void sub_2378954A0()
{
  __asm { BR              X16 }
}

void sub_2378954B0()
{
  __asm { BR              X16 }
}

void sub_2378954C0()
{
  __asm { BR              X16 }
}

void sub_2378954D0()
{
  __asm { BR              X16 }
}

void sub_2378954E0()
{
  __asm { BR              X16 }
}

void sub_2378954F0()
{
  __asm { BR              X16 }
}

void sub_237895500()
{
  __asm { BR              X16 }
}

void sub_237895510()
{
  __asm { BR              X16 }
}

void sub_237895520()
{
  __asm { BR              X16 }
}

void sub_237895530()
{
  __asm { BR              X16 }
}

void sub_237895540()
{
  __asm { BR              X16 }
}

void sub_237895550()
{
  __asm { BR              X16 }
}

void sub_237895560()
{
  __asm { BR              X16 }
}

void sub_237895570()
{
  __asm { BR              X16 }
}

void sub_237895580()
{
  __asm { BR              X16 }
}

void sub_237895590()
{
  __asm { BR              X16 }
}

void sub_2378955A0()
{
  __asm { BR              X16 }
}

void sub_2378955B0()
{
  __asm { BR              X16 }
}

void sub_2378955C0()
{
  __asm { BR              X16 }
}

void sub_2378955D0()
{
  __asm { BR              X16 }
}

void sub_2378955E0()
{
  __asm { BR              X16 }
}

void sub_2378955F0()
{
  __asm { BR              X16 }
}

void sub_237895600()
{
  __asm { BR              X16 }
}

void sub_237895610()
{
  __asm { BR              X16 }
}

void sub_237895620()
{
  __asm { BR              X16 }
}

void sub_237895630()
{
  __asm { BR              X16 }
}

void sub_237895640()
{
  __asm { BR              X16 }
}

void sub_237895650()
{
  __asm { BR              X16 }
}

void sub_237895660()
{
  __asm { BR              X16 }
}

void sub_237895670()
{
  __asm { BR              X16 }
}

void sub_237895680()
{
  __asm { BR              X16 }
}

void sub_237895690()
{
  __asm { BR              X16 }
}

void sub_2378956A0()
{
  __asm { BR              X16 }
}

void sub_2378956B0()
{
  __asm { BR              X16 }
}

void sub_2378956C0()
{
  __asm { BR              X16 }
}

void sub_2378956D0()
{
  __asm { BR              X16 }
}

void sub_2378956E0()
{
  __asm { BR              X16 }
}

void sub_2378956F0()
{
  __asm { BR              X16 }
}

void sub_237895700()
{
  __asm { BR              X16 }
}

void sub_237895710()
{
  __asm { BR              X16 }
}

void sub_237895720()
{
  __asm { BR              X16 }
}

void sub_237895730()
{
  __asm { BR              X16 }
}

void sub_237895740()
{
  __asm { BR              X16 }
}

void sub_237895750()
{
  __asm { BR              X16 }
}

void sub_237895760()
{
  __asm { BR              X16 }
}

void sub_237895770()
{
  __asm { BR              X16 }
}

void sub_237895780()
{
  __asm { BR              X16 }
}

void sub_237895790()
{
  __asm { BR              X16 }
}

void sub_2378957A0()
{
  __asm { BR              X16 }
}

void sub_2378957B0()
{
  __asm { BR              X16 }
}

void sub_2378957C0()
{
  __asm { BR              X16 }
}

void sub_2378957D0()
{
  __asm { BR              X16 }
}

void sub_2378957E0()
{
  __asm { BR              X16 }
}

void sub_2378957F0()
{
  __asm { BR              X16 }
}

void sub_237895800()
{
  __asm { BR              X16 }
}

void sub_237895810()
{
  __asm { BR              X16 }
}

void sub_237895820()
{
  __asm { BR              X16 }
}

void sub_237895830()
{
  __asm { BR              X16 }
}

void sub_237895840()
{
  __asm { BR              X16 }
}

void sub_237895850()
{
  __asm { BR              X16 }
}

void sub_237895860()
{
  __asm { BR              X16 }
}

void sub_237895870()
{
  __asm { BR              X16 }
}

void sub_237895880()
{
  __asm { BR              X16 }
}

void sub_237895890()
{
  __asm { BR              X16 }
}

void sub_2378958A0()
{
  __asm { BR              X16 }
}

void sub_2378958B0()
{
  __asm { BR              X16 }
}

void sub_2378958C0()
{
  __asm { BR              X16 }
}

void sub_2378958D0()
{
  __asm { BR              X16 }
}

void sub_2378958E0()
{
  __asm { BR              X16 }
}

void sub_2378958F0()
{
  __asm { BR              X16 }
}

void sub_237895900()
{
  __asm { BR              X16 }
}

void sub_237895910()
{
  __asm { BR              X16 }
}

void sub_237895920()
{
  __asm { BR              X16 }
}

void sub_237895930()
{
  __asm { BR              X16 }
}

void sub_237895940()
{
  __asm { BR              X16 }
}

void sub_237895950()
{
  __asm { BR              X16 }
}

void sub_237895960()
{
  __asm { BR              X16 }
}

void sub_237895970()
{
  __asm { BR              X16 }
}

void sub_237895980()
{
  __asm { BR              X16 }
}

void sub_237895990()
{
  __asm { BR              X16 }
}

void sub_2378959A0()
{
  __asm { BR              X16 }
}

void sub_2378959B0()
{
  __asm { BR              X16 }
}

void sub_2378959C0()
{
  __asm { BR              X16 }
}

void sub_2378959D0()
{
  __asm { BR              X16 }
}

void sub_2378959E0()
{
  __asm { BR              X16 }
}

void sub_2378959F0()
{
  __asm { BR              X16 }
}

void sub_237895A00()
{
  __asm { BR              X16 }
}

void sub_237895A10()
{
  __asm { BR              X16 }
}

void sub_237895A20()
{
  __asm { BR              X16 }
}

void sub_237895A30()
{
  __asm { BR              X16 }
}

void sub_237895A40()
{
  __asm { BR              X16 }
}

void sub_237895A50()
{
  __asm { BR              X16 }
}

void sub_237895A60()
{
  __asm { BR              X16 }
}

void sub_237895A70()
{
  __asm { BR              X16 }
}

void sub_237895A80()
{
  __asm { BR              X16 }
}

void sub_237895A90()
{
  __asm { BR              X16 }
}

void sub_237895AA0()
{
  __asm { BR              X16 }
}

void sub_237895AB0()
{
  __asm { BR              X16 }
}

void sub_237895AC0()
{
  __asm { BR              X16 }
}

void sub_237895AD0()
{
  __asm { BR              X16 }
}

void sub_237895AE0()
{
  __asm { BR              X16 }
}

void sub_237895AF0()
{
  __asm { BR              X16 }
}

void sub_237895B00()
{
  __asm { BR              X16 }
}

void sub_237895B10()
{
  __asm { BR              X16 }
}

void sub_237895B20()
{
  __asm { BR              X16 }
}

void sub_237895B30()
{
  __asm { BR              X16 }
}

void sub_237895B40()
{
  __asm { BR              X16 }
}

void sub_237895B50()
{
  __asm { BR              X16 }
}

void sub_237895B60()
{
  __asm { BR              X16 }
}

void sub_237895B70()
{
  __asm { BR              X16 }
}

void sub_237895B80()
{
  __asm { BR              X16 }
}

void sub_237895B90()
{
  __asm { BR              X16 }
}

void sub_237895BA0()
{
  __asm { BR              X16 }
}

void sub_237895BB0()
{
  __asm { BR              X16 }
}

void sub_237895BC0()
{
  __asm { BR              X16 }
}

void sub_237895BD0()
{
  __asm { BR              X16 }
}

void sub_237895BE0()
{
  __asm { BR              X16 }
}

void sub_237895BF0()
{
  __asm { BR              X16 }
}

void sub_237895C00()
{
  __asm { BR              X16 }
}

void sub_237895C10()
{
  __asm { BR              X16 }
}

void sub_237895C20()
{
  __asm { BR              X16 }
}

void sub_237895C30()
{
  __asm { BR              X16 }
}

void sub_237895C40()
{
  __asm { BR              X16 }
}

void sub_237895C50()
{
  __asm { BR              X16 }
}

void sub_237895C60()
{
  __asm { BR              X16 }
}

void sub_237895C70()
{
  __asm { BR              X16 }
}

void sub_237895C80()
{
  __asm { BR              X16 }
}

void sub_237895C90()
{
  __asm { BR              X16 }
}

void sub_237895CA0()
{
  __asm { BR              X16 }
}

void sub_237895CB0()
{
  __asm { BR              X16 }
}

void sub_237895CC0()
{
  __asm { BR              X16 }
}

void sub_237895CD0()
{
  __asm { BR              X16 }
}

void sub_237895CE0()
{
  __asm { BR              X16 }
}

void sub_237895CF0()
{
  __asm { BR              X16 }
}

void sub_237895D00()
{
  __asm { BR              X16 }
}

void sub_237895D10()
{
  __asm { BR              X16 }
}

void sub_237895D20()
{
  __asm { BR              X16 }
}

void sub_237895D30()
{
  __asm { BR              X16 }
}

void sub_237895D40()
{
  __asm { BR              X16 }
}

void sub_237895D50()
{
  __asm { BR              X16 }
}

void sub_237895D60()
{
  __asm { BR              X16 }
}

void sub_237895D70()
{
  __asm { BR              X16 }
}

void sub_237895D80()
{
  __asm { BR              X16 }
}

void sub_237895D90()
{
  __asm { BR              X16 }
}

void sub_237895DA0()
{
  __asm { BR              X16 }
}

void sub_237895DB0()
{
  __asm { BR              X16 }
}

void sub_237895DC0()
{
  __asm { BR              X16 }
}

void sub_237895DD0()
{
  __asm { BR              X16 }
}

void sub_237895DE0()
{
  __asm { BR              X16 }
}

void sub_237895DF0()
{
  __asm { BR              X16 }
}

void sub_237895E00()
{
  __asm { BR              X16 }
}

void sub_237895E10()
{
  __asm { BR              X16 }
}

void sub_237895E20()
{
  __asm { BR              X16 }
}

void sub_237895E30()
{
  __asm { BR              X16 }
}

void sub_237895E40()
{
  __asm { BR              X16 }
}

void sub_237895E50()
{
  __asm { BR              X16 }
}

void sub_237895E60()
{
  __asm { BR              X16 }
}

void sub_237895E70()
{
  __asm { BR              X16 }
}

void sub_237895E80()
{
  __asm { BR              X16 }
}

void sub_237895E90()
{
  __asm { BR              X16 }
}

void sub_237895EA0()
{
  __asm { BR              X16 }
}

void sub_237895EB0()
{
  __asm { BR              X16 }
}

void sub_237895EC0()
{
  __asm { BR              X16 }
}

void sub_237895ED0()
{
  __asm { BR              X16 }
}

void sub_237895EE0()
{
  __asm { BR              X16 }
}

void sub_237895EF0()
{
  __asm { BR              X16 }
}

void sub_237895F00()
{
  __asm { BR              X16 }
}

void sub_237895F10()
{
  __asm { BR              X16 }
}

void sub_237895F20()
{
  __asm { BR              X16 }
}

void sub_237895F30()
{
  __asm { BR              X16 }
}

void sub_237895F40()
{
  __asm { BR              X16 }
}

void sub_237895F50()
{
  __asm { BR              X16 }
}

void sub_237895F60()
{
  __asm { BR              X16 }
}

void sub_237895F70()
{
  __asm { BR              X16 }
}

void sub_237895F80()
{
  __asm { BR              X16 }
}

void sub_237895F90()
{
  __asm { BR              X16 }
}

void sub_237895FA0()
{
  __asm { BR              X16 }
}

void sub_237895FB0()
{
  __asm { BR              X16 }
}

void sub_237895FC0()
{
  __asm { BR              X16 }
}

void sub_237895FD0()
{
  __asm { BR              X16 }
}

void sub_237895FE0()
{
  __asm { BR              X16 }
}

void sub_237895FF0()
{
  __asm { BR              X16 }
}

void sub_237896000()
{
  __asm { BR              X16 }
}

void sub_237896010()
{
  __asm { BR              X16 }
}

void sub_237896020()
{
  __asm { BR              X16 }
}

void sub_237896030()
{
  __asm { BR              X16 }
}

void sub_237896040()
{
  __asm { BR              X16 }
}

void sub_237896050()
{
  __asm { BR              X16 }
}

void sub_237896060()
{
  __asm { BR              X16 }
}

void sub_237896070()
{
  __asm { BR              X16 }
}

void sub_237896080()
{
  __asm { BR              X16 }
}

void sub_237896090()
{
  __asm { BR              X16 }
}

void sub_2378960A0()
{
  __asm { BR              X16 }
}

void sub_2378960B0()
{
  __asm { BR              X16 }
}

void sub_2378960C0()
{
  __asm { BR              X16 }
}

void sub_2378960D0()
{
  __asm { BR              X16 }
}

void sub_2378960E0()
{
  __asm { BR              X16 }
}

void sub_2378960F0()
{
  __asm { BR              X16 }
}

void sub_237896100()
{
  __asm { BR              X16 }
}

void sub_237896110()
{
  __asm { BR              X16 }
}

void sub_237896120()
{
  __asm { BR              X16 }
}

void sub_237896130()
{
  __asm { BR              X16 }
}

void sub_237896140()
{
  __asm { BR              X16 }
}

void sub_237896150()
{
  __asm { BR              X16 }
}

void sub_237896160()
{
  __asm { BR              X16 }
}

void sub_237896170()
{
  __asm { BR              X16 }
}

void sub_237896180()
{
  __asm { BR              X16 }
}

void sub_237896190()
{
  __asm { BR              X16 }
}

void sub_2378961A0()
{
  __asm { BR              X16 }
}

void sub_2378961B0()
{
  __asm { BR              X16 }
}

void sub_2378961C0()
{
  __asm { BR              X16 }
}

void sub_2378961D0()
{
  __asm { BR              X16 }
}

void sub_2378961E0()
{
  __asm { BR              X16 }
}

void sub_2378961F0()
{
  __asm { BR              X16 }
}

void sub_237896200()
{
  __asm { BR              X16 }
}

void sub_237896210()
{
  __asm { BR              X16 }
}

void sub_237896220()
{
  __asm { BR              X16 }
}

void sub_237896230()
{
  __asm { BR              X16 }
}

void sub_237896240()
{
  __asm { BR              X16 }
}

void sub_237896250()
{
  __asm { BR              X16 }
}

void sub_237896260()
{
  __asm { BR              X16 }
}

void sub_237896270()
{
  __asm { BR              X16 }
}

void sub_237896280()
{
  __asm { BR              X16 }
}

void sub_237896290()
{
  __asm { BR              X16 }
}

void sub_2378962A0()
{
  __asm { BR              X16 }
}

void sub_2378962B0()
{
  __asm { BR              X16 }
}

void sub_2378962C0()
{
  __asm { BR              X16 }
}

void sub_2378962D0()
{
  __asm { BR              X16 }
}

void sub_2378962E0()
{
  __asm { BR              X16 }
}

void sub_2378962F0()
{
  __asm { BR              X16 }
}

void sub_237896300()
{
  __asm { BR              X16 }
}

void sub_237896310()
{
  __asm { BR              X16 }
}

void sub_237896320()
{
  __asm { BR              X16 }
}

void sub_237896330()
{
  __asm { BR              X16 }
}

void sub_237896340()
{
  __asm { BR              X16 }
}

void sub_237896350()
{
  __asm { BR              X16 }
}

void sub_237896360()
{
  __asm { BR              X16 }
}

void sub_237896370()
{
  __asm { BR              X16 }
}

void sub_237896380()
{
  __asm { BR              X16 }
}

void sub_237896390()
{
  __asm { BR              X16 }
}

void sub_2378963A0()
{
  __asm { BR              X16 }
}

void sub_2378963B0()
{
  __asm { BR              X16 }
}

void sub_2378963C0()
{
  __asm { BR              X16 }
}

void sub_2378963D0()
{
  __asm { BR              X16 }
}

void sub_2378963E0()
{
  __asm { BR              X16 }
}

void sub_2378963F0()
{
  __asm { BR              X16 }
}

void sub_237896400()
{
  __asm { BR              X16 }
}

void sub_237896410()
{
  __asm { BR              X16 }
}

void sub_237896420()
{
  __asm { BR              X16 }
}

void sub_237896430()
{
  __asm { BR              X16 }
}

void sub_237896440()
{
  __asm { BR              X16 }
}

void sub_237896450()
{
  __asm { BR              X16 }
}

void sub_237896460()
{
  __asm { BR              X16 }
}

void sub_237896470()
{
  __asm { BR              X16 }
}

void sub_237896480()
{
  __asm { BR              X16 }
}

void sub_237896490()
{
  __asm { BR              X16 }
}

void sub_2378964A0()
{
  __asm { BR              X16 }
}

void sub_2378964B0()
{
  __asm { BR              X16 }
}

void sub_2378964C0()
{
  __asm { BR              X16 }
}

void sub_2378964D0()
{
  __asm { BR              X16 }
}

void sub_2378964E0()
{
  __asm { BR              X16 }
}

void sub_2378964F0()
{
  __asm { BR              X16 }
}

void sub_237896500()
{
  __asm { BR              X16 }
}

void sub_237896510()
{
  __asm { BR              X16 }
}

void sub_237896520()
{
  __asm { BR              X16 }
}

void sub_237896530()
{
  __asm { BR              X16 }
}

void sub_237896540()
{
  __asm { BR              X16 }
}

void sub_237896550()
{
  __asm { BR              X16 }
}

void sub_237896560()
{
  __asm { BR              X16 }
}

void sub_237896570()
{
  __asm { BR              X16 }
}

void sub_237896580()
{
  __asm { BR              X16 }
}

void sub_237896590()
{
  __asm { BR              X16 }
}

void sub_2378965A0()
{
  __asm { BR              X16 }
}

void sub_2378965B0()
{
  __asm { BR              X16 }
}

void sub_2378965C0()
{
  __asm { BR              X16 }
}

void sub_2378965D0()
{
  __asm { BR              X16 }
}

void sub_2378965E0()
{
  __asm { BR              X16 }
}

void sub_2378965F0()
{
  __asm { BR              X16 }
}

void sub_237896600()
{
  __asm { BR              X16 }
}

void sub_237896610()
{
  __asm { BR              X16 }
}

void sub_237896620()
{
  __asm { BR              X16 }
}

void sub_237896630()
{
  __asm { BR              X16 }
}

void sub_237896640()
{
  __asm { BR              X16 }
}

void sub_237896650()
{
  __asm { BR              X16 }
}

void sub_237896660()
{
  __asm { BR              X16 }
}

void sub_237896670()
{
  __asm { BR              X16 }
}

void sub_237896680()
{
  __asm { BR              X16 }
}

void sub_237896690()
{
  __asm { BR              X16 }
}

void sub_2378966A0()
{
  __asm { BR              X16 }
}

void sub_2378966B0()
{
  __asm { BR              X16 }
}

void sub_2378966C0()
{
  __asm { BR              X16 }
}

void sub_2378966D0()
{
  __asm { BR              X16 }
}

void sub_2378966E0()
{
  __asm { BR              X16 }
}

void sub_2378966F0()
{
  __asm { BR              X16 }
}

void sub_237896700()
{
  __asm { BR              X16 }
}

void sub_237896710()
{
  __asm { BR              X16 }
}

void sub_237896720()
{
  __asm { BR              X16 }
}

void sub_237896730()
{
  __asm { BR              X16 }
}

void sub_237896740()
{
  __asm { BR              X16 }
}

void sub_237896750()
{
  __asm { BR              X16 }
}

void sub_237896760()
{
  __asm { BR              X16 }
}

void sub_237896770()
{
  __asm { BR              X16 }
}

void sub_237896780()
{
  __asm { BR              X16 }
}

void sub_237896790()
{
  __asm { BR              X16 }
}

void sub_2378967A0()
{
  __asm { BR              X16 }
}

void sub_2378967B0()
{
  __asm { BR              X16 }
}

void sub_2378967C0()
{
  __asm { BR              X16 }
}

void sub_2378967D0()
{
  __asm { BR              X16 }
}

void sub_2378967E0()
{
  __asm { BR              X16 }
}

void sub_2378967F0()
{
  __asm { BR              X16 }
}

void sub_237896800()
{
  __asm { BR              X16 }
}

void sub_237896810()
{
  __asm { BR              X16 }
}

void sub_237896820()
{
  __asm { BR              X16 }
}

void sub_237896830()
{
  __asm { BR              X16 }
}

void sub_237896840()
{
  __asm { BR              X16 }
}

void sub_237896850()
{
  __asm { BR              X16 }
}

void sub_237896860()
{
  __asm { BR              X16 }
}

void sub_237896870()
{
  __asm { BR              X16 }
}

void sub_237896880()
{
  __asm { BR              X16 }
}

void sub_237896890()
{
  __asm { BR              X16 }
}

void sub_2378968A0()
{
  __asm { BR              X16 }
}

void sub_2378968B0()
{
  __asm { BR              X16 }
}

void sub_2378968C0()
{
  __asm { BR              X16 }
}

void sub_2378968D0()
{
  __asm { BR              X16 }
}

void sub_2378968E0()
{
  __asm { BR              X16 }
}

void sub_2378968F0()
{
  __asm { BR              X16 }
}

void sub_237896900()
{
  __asm { BR              X16 }
}

void sub_237896910()
{
  __asm { BR              X16 }
}

void sub_237896920()
{
  __asm { BR              X16 }
}

void sub_237896930()
{
  __asm { BR              X16 }
}

void sub_237896940()
{
  __asm { BR              X16 }
}

void sub_237896950()
{
  __asm { BR              X16 }
}

void sub_237896960()
{
  __asm { BR              X16 }
}

void sub_237896970()
{
  __asm { BR              X16 }
}

void sub_237896980()
{
  __asm { BR              X16 }
}

void sub_237896990()
{
  __asm { BR              X16 }
}

void sub_2378969A0()
{
  __asm { BR              X16 }
}

void sub_2378969B0()
{
  __asm { BR              X16 }
}

void sub_2378969C0()
{
  __asm { BR              X16 }
}

void sub_2378969D0()
{
  __asm { BR              X16 }
}

void sub_2378969E0()
{
  __asm { BR              X16 }
}

void sub_2378969F0()
{
  __asm { BR              X16 }
}

void sub_237896A00()
{
  __asm { BR              X16 }
}

void sub_237896A10()
{
  __asm { BR              X16 }
}

void sub_237896A20()
{
  __asm { BR              X16 }
}

void sub_237896A30()
{
  __asm { BR              X16 }
}

void sub_237896A40()
{
  __asm { BR              X16 }
}

void sub_237896A50()
{
  __asm { BR              X16 }
}

void sub_237896A60()
{
  __asm { BR              X16 }
}

void sub_237896A70()
{
  __asm { BR              X16 }
}

void sub_237896A80()
{
  __asm { BR              X16 }
}

void sub_237896A90()
{
  __asm { BR              X16 }
}

void sub_237896AA0()
{
  __asm { BR              X16 }
}

void sub_237896AB0()
{
  __asm { BR              X16 }
}

void sub_237896AC0()
{
  __asm { BR              X16 }
}

void sub_237896AD0()
{
  __asm { BR              X16 }
}

void sub_237896AE0()
{
  __asm { BR              X16 }
}

void sub_237896AF0()
{
  __asm { BR              X16 }
}

void sub_237896B00()
{
  __asm { BR              X16 }
}

void sub_237896B10()
{
  __asm { BR              X16 }
}

void sub_237896B20()
{
  __asm { BR              X16 }
}

void sub_237896B30()
{
  __asm { BR              X16 }
}

void sub_237896B40()
{
  __asm { BR              X16 }
}

void sub_237896B50()
{
  __asm { BR              X16 }
}

void sub_237896B60()
{
  __asm { BR              X16 }
}

void sub_237896B70()
{
  __asm { BR              X16 }
}

void sub_237896B80()
{
  __asm { BR              X16 }
}

void sub_237896B90()
{
  __asm { BR              X16 }
}

void sub_237896BA0()
{
  __asm { BR              X16 }
}

void sub_237896BB0()
{
  __asm { BR              X16 }
}

void sub_237896BC0()
{
  __asm { BR              X16 }
}

void sub_237896BD0()
{
  __asm { BR              X16 }
}

void sub_237896BE0()
{
  __asm { BR              X16 }
}

void sub_237896BF0()
{
  __asm { BR              X16 }
}

void sub_237896C00()
{
  __asm { BR              X16 }
}

void sub_237896C10()
{
  __asm { BR              X16 }
}

void sub_237896C20()
{
  __asm { BR              X16 }
}

void sub_237896C30()
{
  __asm { BR              X16 }
}

void sub_237896C40()
{
  __asm { BR              X16 }
}

void sub_237896C50()
{
  __asm { BR              X16 }
}

void sub_237896C60()
{
  __asm { BR              X16 }
}

void sub_237896C70()
{
  __asm { BR              X16 }
}

void sub_237896C80()
{
  __asm { BR              X16 }
}

void sub_237896C90()
{
  __asm { BR              X16 }
}

void sub_237896CA0()
{
  __asm { BR              X16 }
}

void sub_237896CB0()
{
  __asm { BR              X16 }
}

void sub_237896CC0()
{
  __asm { BR              X16 }
}

void sub_237896CD0()
{
  __asm { BR              X16 }
}

void sub_237896CE0()
{
  __asm { BR              X16 }
}

void sub_237896CF0()
{
  __asm { BR              X16 }
}

void sub_237896D00()
{
  __asm { BR              X16 }
}

void sub_237896D10()
{
  __asm { BR              X16 }
}

void sub_237896D20()
{
  __asm { BR              X16 }
}

void sub_237896D30()
{
  __asm { BR              X16 }
}

void sub_237896D40()
{
  __asm { BR              X16 }
}

void sub_237896D50()
{
  __asm { BR              X16 }
}

void sub_237896D60()
{
  __asm { BR              X16 }
}

void sub_237896D70()
{
  __asm { BR              X16 }
}

void sub_237896D80()
{
  __asm { BR              X16 }
}

void sub_237896D90()
{
  __asm { BR              X16 }
}

void sub_237896DA0()
{
  __asm { BR              X16 }
}

void sub_237896DB0()
{
  __asm { BR              X16 }
}

void sub_237896DC0()
{
  __asm { BR              X16 }
}

void sub_237896DD0()
{
  __asm { BR              X16 }
}

void sub_237896DE0()
{
  __asm { BR              X16 }
}

void sub_237896DF0()
{
  __asm { BR              X16 }
}

void sub_237896E00()
{
  __asm { BR              X16 }
}

void sub_237896E10()
{
  __asm { BR              X16 }
}

void sub_237896E20()
{
  __asm { BR              X16 }
}

void sub_237896E30()
{
  __asm { BR              X16 }
}

void sub_237896E40()
{
  __asm { BR              X16 }
}

void sub_237896E50()
{
  __asm { BR              X16 }
}

void sub_237896E60()
{
  __asm { BR              X16 }
}

void sub_237896E70()
{
  __asm { BR              X16 }
}

void sub_237896E80()
{
  __asm { BR              X16 }
}

void sub_237896E90()
{
  __asm { BR              X16 }
}

void sub_237896EA0()
{
  __asm { BR              X16 }
}

void sub_237896EB0()
{
  __asm { BR              X16 }
}

void sub_237896EC0()
{
  __asm { BR              X16 }
}

void sub_237896ED0()
{
  __asm { BR              X16 }
}

void sub_237896EE0()
{
  __asm { BR              X16 }
}

void sub_237896EF0()
{
  __asm { BR              X16 }
}

void sub_237896F00()
{
  __asm { BR              X16 }
}

void sub_237896F10()
{
  __asm { BR              X16 }
}

void sub_237896F20()
{
  __asm { BR              X16 }
}

void sub_237896F30()
{
  __asm { BR              X16 }
}

void sub_237896F40()
{
  __asm { BR              X16 }
}

void sub_237896F50()
{
  __asm { BR              X16 }
}

void sub_237896F60()
{
  __asm { BR              X16 }
}

void sub_237896F70()
{
  __asm { BR              X16 }
}

void sub_237896F80()
{
  __asm { BR              X16 }
}

void sub_237896F90()
{
  __asm { BR              X16 }
}

void sub_237896FA0()
{
  __asm { BR              X16 }
}

void sub_237896FB0()
{
  __asm { BR              X16 }
}

void sub_237896FC0()
{
  __asm { BR              X16 }
}

void sub_237896FD0()
{
  __asm { BR              X16 }
}

void sub_237896FE0()
{
  __asm { BR              X16 }
}

void sub_237896FF0()
{
  __asm { BR              X16 }
}

void *__cdecl ffi_closure_alloc(size_t size, void **code)
{
  uint64_t v3 = malloc_type_malloc(size, 0xDB544668uLL);
  if (v3)
  {
    pthread_mutex_lock(&ffi_trampoline_lock);
    uint64_t v4 = (void *)ffi_trampoline_tables;
    if (ffi_trampoline_tables)
    {
      uint64_t v5 = *(char **)(ffi_trampoline_tables + 16);
      if (v5)
      {
        LOWORD(v6) = *(_WORD *)(ffi_trampoline_tables + 8);
LABEL_5:
        v4[2] = *((void *)v5 + 1);
        *((_WORD *)v4 + 4) = v6 - 1;
        *((void *)v5 + 1) = 0;
        pthread_mutex_unlock(&ffi_trampoline_lock);
        *code = *(void **)v5;
        *uint64_t v3 = v4;
        v3[1] = v5;
        return v3;
      }
    }
    *(void *)cur_protection = 0;
    vm_address_t address = 0;
    v7 = (vm_map_t *)MEMORY[0x263EF8960];
    if (!vm_allocate(*MEMORY[0x263EF8960], &address, 0xC000uLL, 1))
    {
      if (ffi_trampoline_table_alloc_trampoline_template_init_once != -1) {
        dispatch_once(&ffi_trampoline_table_alloc_trampoline_template_init_once, &__block_literal_global);
      }
      vm_address_t target_address = address + 0x4000;
      if (!vm_remap(*v7, &target_address, 0x8000uLL, 0, 0x4000, *v7, ffi_trampoline_table_alloc_trampoline_table_page - 0x4000, 0, &cur_protection[1], cur_protection, 0)&& (cur_protection[1] & 4) != 0)
      {
        vm_address_t v9 = target_address;
        uint64_t v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x102004042DA13E7uLL);
        *((_WORD *)v4 + 4) = 1024;
        *uint64_t v4 = address;
        uint64_t v10 = (char *)malloc_type_calloc(0x400uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
        uint64_t v5 = v10;
        v4[3] = v10;
        uint64_t v6 = *((unsigned __int16 *)v4 + 4);
        if (*((_WORD *)v4 + 4))
        {
          uint64_t v11 = 0;
          unint64_t v12 = 0;
          do
          {
            *(void *)&v10[v11] = v9 + 0x4000 + v11;
            if ((v6 - 1) > v12) {
              *(void *)&v10[v11 + 8] = &v10[v11 + 16];
            }
            v11 += 16;
            ++v12;
          }
          while (16 * v6 != v11);
        }
        v4[2] = v10;
        uint64_t v13 = ffi_trampoline_tables;
        v4[5] = ffi_trampoline_tables;
        if (v13) {
          *(void *)(v13 + 32) = v4;
        }
        ffi_trampoline_tables = (uint64_t)v4;
        goto LABEL_5;
      }
      MEMORY[0x237E233C0](*v7, address, 49152);
    }
    pthread_mutex_unlock(&ffi_trampoline_lock);
    free(v3);
    return 0;
  }
  return v3;
}

void ffi_closure_free(void *a1)
{
  pthread_mutex_lock(&ffi_trampoline_lock);
  uint64_t v3 = *(void **)a1;
  uint64_t v2 = *((void *)a1 + 1);
  *(void *)(v2 + 8) = *(void *)(*(void *)a1 + 16);
  v3[2] = v2;
  int v4 = (unsigned __int16)(*((_WORD *)v3 + 4))++ + 1;
  uint64_t v5 = ffi_trampoline_tables;
  if (v4 != 1024 || ffi_trampoline_tables == (void)v3)
  {
    if ((void *)ffi_trampoline_tables != v3)
    {
      v3[4] = 0;
      v3[5] = v5;
      if (v5) {
        *(void *)(v5 + 32) = v3;
      }
      ffi_trampoline_tables = (uint64_t)v3;
    }
  }
  else
  {
    uint64_t v7 = v3[4];
    if (v7) {
      *(void *)(v7 + 40) = v3[5];
    }
    uint64_t v8 = v3[5];
    if (v8) {
      *(void *)(v8 + 32) = v7;
    }
    MEMORY[0x237E233C0](*MEMORY[0x263EF8960], *v3, 0x8000);
    free((void *)v3[3]);
    free(v3);
  }
  pthread_mutex_unlock(&ffi_trampoline_lock);

  free(a1);
}

void *__ffi_trampoline_table_alloc_block_invoke()
{
  v0 = dlopen("/usr/lib/libffi-trampolines.dylib", 262);
  if (!v0) {
    __ffi_trampoline_table_alloc_block_invoke_cold_1();
  }
  ffi_status result = dlsym(v0, "ffi_closure_trampoline_table_page");
  ffi_trampoline_table_alloc_trampoline_table_page = (uint64_t)result;
  if (!result) {
    __ffi_trampoline_table_alloc_block_invoke_cold_2();
  }
  return result;
}

uint64_t ffi_prep_cif_machdep(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int v2 = *(unsigned __int16 *)(v1 + 10);
  int v4 = *(_DWORD *)(a1 + 24);
  switch(*(_WORD *)(v1 + 10))
  {
    case 0:
      break;
    case 1:
    case 0xA:
      int v2 = 30;
      break;
    case 2:
    case 3:
    case 4:
    case 0xD:
    case 0xF:
      int v2 = is_vfp_type(*(unint64_t **)(a1 + 16));
      if (!v2)
      {
        unint64_t v5 = *(void *)v1;
        if (*(void *)v1 == 8) {
          int v6 = 1;
        }
        else {
          int v6 = 66;
        }
        if (v5 == 16) {
          int v7 = 2;
        }
        else {
          int v7 = v6;
        }
        if (v5 < 0x11)
        {
          int v2 = v7;
        }
        else
        {
          v4 += 8;
          int v2 = 32;
        }
      }
      break;
    case 5:
      int v2 = 20;
      break;
    case 6:
      int v2 = 26;
      break;
    case 7:
      int v2 = 22;
      break;
    case 8:
      int v2 = 28;
      break;
    case 9:
      int v2 = 24;
      break;
    case 0xB:
    case 0xC:
    case 0xE:
      int v2 = 1;
      break;
    default:
      abort();
  }
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  if ((int)v8 >= 1)
  {
    vm_address_t v9 = *(unint64_t ***)(a1 + 8);
    while (!is_vfp_type(*v9))
    {
      ++v9;
      if (!--v8) {
        goto LABEL_25;
      }
    }
    v2 |= 0x80u;
  }
LABEL_25:
  *(_DWORD *)(a1 + 24) = ((v4 - 1) | 0xF) + 1;
  *(_DWORD *)(a1 + 28) = v2;
  *(_DWORD *)(a1 + 32) = 0;
  return 0;
}

uint64_t is_vfp_type(unint64_t *a1)
{
  int v1 = *((unsigned __int16 *)a1 + 5);
  if ((v1 - 2) < 3)
  {
    LODWORD(v2) = 1;
    return (4 * v1 - v2 + 4);
  }
  if (v1 == 13)
  {
    unint64_t v4 = *a1;
    if (*a1 - 65 >= 0xFFFFFFFFFFFFFFC3)
    {
      unint64_t v5 = (uint64_t *)a1[2];
      uint64_t v6 = *v5;
      int v1 = *(unsigned __int16 *)(*v5 + 10);
      if ((v1 & 0xFFFFFFFD) == 0xD)
      {
        int v7 = (uint64_t *)a1[2];
        do
        {
          uint64_t v8 = *v7++;
          int v9 = is_hfa0(v8);
        }
        while (v9 < 0);
        int v1 = v9;
      }
      if (v1 == 4 || v1 == 3)
      {
        if ((v4 & 7) != 0) {
          return 0;
        }
        unint64_t v2 = v4 >> 3;
      }
      else
      {
        if (v1 != 2 || (v4 & 3) != 0) {
          return 0;
        }
        unint64_t v2 = v4 >> 2;
      }
      if (v2 <= 4)
      {
        if (v6)
        {
          uint64_t v10 = v5 + 1;
          do
          {
            int v11 = *(unsigned __int16 *)(v6 + 10);
            if ((v11 & 0xFFFFFFFD) == 0xD)
            {
              uint64_t result = is_hfa1(v6, v1);
              if (!result) {
                return result;
              }
            }
            else if (v1 != v11)
            {
              return 0;
            }
            uint64_t v12 = *v10++;
            uint64_t v6 = v12;
          }
          while (v12);
        }
        return (4 * v1 - v2 + 4);
      }
    }
  }
  else if (v1 == 15)
  {
    int v1 = *(unsigned __int16 *)(*(void *)a1[2] + 10);
    if ((v1 - 2) <= 2)
    {
      LODWORD(v2) = 2;
      return (4 * v1 - v2 + 4);
    }
  }
  return 0;
}

uint64_t ffi_prep_cif_machdep_var(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 32) = a2;
  return 0;
}

void *ffi_call_int(uint64_t a1, uint64_t (*a2)(void, void, void, void, void, void, void, void), void *a3, int **a4)
{
  v57 = a2;
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v7 = **(void **)(a1 + 16);
  uint64_t v9 = *(unsigned int *)(a1 + 24);
  unint64_t v8 = *(unsigned int *)(a1 + 28);
  int v10 = v8 & 0xFFFFFEFF;
  uint64_t v11 = (v8 >> 2) & 0x10;
  int v12 = *(_DWORD *)(a1 + 28) & 0x80;
  if (a3) {
    int v12 = v8 & 0xFFFFFEFF;
  }
  else {
    uint64_t v11 = 0;
  }
  size_t v52 = **(void **)(a1 + 16);
  if (a3) {
    uint64_t v7 = 0;
  }
  unint64_t v58 = v8;
  if ((v8 & 0x20) != 0) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = v11;
  }
  if ((v8 & 0x20) == 0) {
    int v10 = v12;
  }
  unsigned int v56 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v51 - v14;
  bzero((char *)&v51 - v14, v16);
  v59 = v15 + 192;
  v60 = v15;
  v53 = a3;
  v54 = &v15[v9 + 192];
  uint64_t v17 = v54 + 40;
  if (!v13) {
    uint64_t v17 = a3;
  }
  v55 = v17;
  uint64_t v18 = *(unsigned int *)(a1 + 4);
  if ((int)v18 >= 1)
  {
    uint64_t v19 = 0;
    unsigned int v20 = 0;
    int v21 = 0;
    size_t v61 = 0;
    int v22 = 0;
    while (1)
    {
      uint64_t v23 = *(void *)(a1 + 8);
      uint64_t v24 = *(void *)(v23 + 8 * v19);
      size_t v25 = *(void *)v24;
      v26 = *a4;
      switch(*(_WORD *)(v24 + 10))
      {
        case 0:
          goto LABEL_58;
        case 1:
        case 0xA:
          uint64_t v29 = *v26;
          goto LABEL_39;
        case 2:
        case 3:
        case 4:
        case 0xD:
        case 0xF:
          int v27 = is_vfp_type(*(unint64_t **)(v23 + 8 * v19));
          if (v27)
          {
            int v28 = 4 - (v27 & 3);
            if ((v58 & 0x100) != 0 && *(_DWORD *)a1 == 2)
            {
              if (v28 + v20 <= 8) {
                __asm { BR              X11 }
              }
            }
            else if ((v28 + v22) <= 8)
            {
              __asm { BR              X11 }
            }
            unint64_t v30 = *(unsigned __int16 *)(v24 + 8);
            uint64_t v31 = v30 - 1;
            BOOL v32 = v30 >= 8 || v21 == 0;
            uint64_t v33 = 7;
            if (v32) {
              uint64_t v33 = v31;
            }
            uint64_t v34 = (v33 | (v61 - 1)) + 1;
            size_t v61 = v34 + v25;
            v35 = &v59[v34];
            int v22 = 8;
LABEL_57:
            memcpy(v35, v26, v25);
            goto LABEL_58;
          }
          if (v25 <= 0x10)
          {
            unint64_t v42 = (v25 + 7) >> 3;
            if (v42 + v20 > 8)
            {
              unint64_t v43 = *(unsigned __int16 *)(v24 + 8);
              uint64_t v44 = v43 - 1;
              BOOL v45 = v43 >= 8 || v21 == 0;
              uint64_t v46 = 7;
              if (v45) {
                uint64_t v46 = v44;
              }
              uint64_t v47 = (v46 | (v61 - 1)) + 1;
              size_t v61 = v47 + v25;
              v35 = &v59[v47];
              unsigned int v20 = 8;
            }
            else
            {
              v35 = &v60[8 * v20 + 128];
              v20 += v42;
            }
            goto LABEL_57;
          }
          v26 = (int *)a4;
          size_t v25 = 8;
LABEL_24:
          uint64_t v29 = *(void *)v26;
LABEL_39:
          if (v20 > 7)
          {
            unint64_t v37 = *(unsigned __int16 *)(v24 + 8);
            uint64_t v38 = v37 - 1;
            BOOL v39 = v37 >= 8 || v21 == 0;
            uint64_t v40 = 7;
            if (v39) {
              uint64_t v40 = v38;
            }
            uint64_t v41 = (v40 | (v61 - 1)) + 1;
            size_t v61 = v41 + v25;
            memcpy(&v59[v41], v26, v25);
            unsigned int v20 = 8;
          }
          else
          {
            v36 = &v60[8 * v20++];
            *((void *)v36 + 16) = v29;
          }
LABEL_58:
          if (++v19 == *(_DWORD *)(a1 + 32))
          {
            int v22 = 8;
            int v21 = 1;
            unsigned int v20 = 8;
          }
          ++a4;
          if (v18 == v19) {
            goto LABEL_61;
          }
          break;
        case 5:
          uint64_t v29 = *(unsigned __int8 *)v26;
          goto LABEL_39;
        case 6:
          uint64_t v29 = *(char *)v26;
          goto LABEL_39;
        case 7:
          uint64_t v29 = *(unsigned __int16 *)v26;
          goto LABEL_39;
        case 8:
          uint64_t v29 = *(__int16 *)v26;
          goto LABEL_39;
        case 9:
          uint64_t v29 = *v26;
          goto LABEL_39;
        case 0xB:
        case 0xC:
        case 0xE:
          goto LABEL_24;
        default:
          abort();
      }
    }
  }
LABEL_61:
  v48 = v55;
  char v49 = v56;
  uint64_t result = (void *)ffi_call_SYSV((uint64_t)v60, v54, v57, (uint64_t)v55, v56);
  if ((v49 & 0x40) != 0) {
    return memcpy(v53, v48, v52);
  }
  return result;
}

ffi_status ffi_prep_closure_loc(ffi_closure *a1, ffi_cif *a2, void (__cdecl *fun)(ffi_cif *, void *, void **, void *), void *user_data, void *codeloc)
{
  if (a2->abi - 1 > 1) {
    return 2;
  }
  ffi_status result = FFI_OK;
  uint64_t v7 = ffi_closure_SYSV_V;
  if ((a2->flags & 0x80) == 0) {
    uint64_t v7 = ffi_closure_SYSV;
  }
  *((void *)codeloc - 4096) = a1;
  *((void *)codeloc - 4095) = v7;
  a1->cif = a2;
  a1->fun = fun;
  a1->user_data = user_data;
  return result;
}

ffi_closure *__cdecl ffi_find_closure_for_code_np(void *code)
{
  return (ffi_closure *)*((void *)code - 4096);
}

uint64_t ffi_closure_SYSV_inner(uint64_t a1, void (*a2)(uint64_t, uint64_t, char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v58 = a6;
  uint64_t v59 = a7;
  uint64_t v64 = a4;
  uint64_t v65 = a5;
  uint64_t v60 = a3;
  size_t v61 = a2;
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  MEMORY[0x270FA5388]();
  int v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFF0);
  bzero(v10, v9);
  uint64_t v11 = v8;
  int v62 = *(_DWORD *)(a1 + 28);
  if ((int)v8 >= 1)
  {
    uint64_t v12 = 0;
    unsigned int v13 = 0;
    int v14 = 0;
    unint64_t v15 = 0;
    unsigned int v16 = 0;
    uint64_t v63 = v11;
    while (1)
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 8) + 8 * v12);
      unsigned int v18 = *(unsigned __int16 *)(v17 + 10);
      if (v18 > 0xF) {
        abort();
      }
      unint64_t v19 = *(void *)v17;
      int v20 = 1 << v18;
      if ((v20 & 0x5FE2) != 0)
      {
        uint64_t v21 = v19 - 1;
        if (v19 < 8 && v14 != 0) {
          uint64_t v21 = 7;
        }
        uint64_t v23 = (v21 | (v15 - 1)) + 1;
        unint64_t v24 = v23 + v19;
        uint64_t v25 = v65 + v23;
        uint64_t v26 = v64 + 8 * v13 + 128;
        BOOL v27 = v13 > 7;
        if (v13 <= 7)
        {
          ++v13;
        }
        else
        {
          unint64_t v15 = v24;
          unsigned int v13 = 8;
        }
        if (!v27) {
          uint64_t v25 = v26;
        }
        *(void *)&v10[8 * v12] = v25;
        goto LABEL_50;
      }
      if ((v20 & 0xA01C) != 0) {
        break;
      }
LABEL_50:
      if (++v12 == *(_DWORD *)(a1 + 32))
      {
        unsigned int v16 = 8;
        int v14 = 1;
        unsigned int v13 = 8;
      }
      if (v11 == v12) {
        goto LABEL_61;
      }
    }
    int v28 = is_vfp_type(*(unint64_t **)(*(void *)(a1 + 8) + 8 * v12));
    if (!v28)
    {
      uint64_t v11 = v63;
      if (v19 < 0x11)
      {
        unint64_t v38 = (v19 + 7) >> 3;
        if (v38 + v13 > 8)
        {
          unint64_t v49 = *(unsigned __int16 *)(v17 + 8);
          uint64_t v50 = v49 - 1;
          BOOL v51 = v49 >= 8 || v14 == 0;
          uint64_t v52 = 7;
          if (v51) {
            uint64_t v52 = v50;
          }
          uint64_t v53 = (v52 | (v15 - 1)) + 1;
          unint64_t v15 = v53 + v19;
          *(void *)&v10[8 * v12] = v65 + v53;
          unsigned int v13 = 8;
        }
        else
        {
          *(void *)&v10[8 * v12] = v64 + 8 * v13 + 128;
          v13 += v38;
        }
      }
      else
      {
        uint64_t v32 = (v15 - 1) | 7;
        uint64_t v33 = v32 + v65;
        uint64_t v34 = v32 + 9;
        uint64_t v35 = v64 + 8 * v13 + 128;
        BOOL v36 = v13 > 7;
        if (v13 <= 7)
        {
          ++v13;
        }
        else
        {
          unint64_t v15 = v34;
          unsigned int v13 = 8;
        }
        if (v36) {
          unint64_t v37 = (void *)(v33 + 1);
        }
        else {
          unint64_t v37 = (void *)v35;
        }
        *(void *)&v10[8 * v12] = *v37;
      }
      goto LABEL_50;
    }
    int v29 = v28;
    uint64_t v30 = 4 - (v28 & 3u);
    if ((v62 & 0x100) != 0 && *(_DWORD *)a1 == 2)
    {
      if (v30 + (unint64_t)v13 > 8)
      {
        unint64_t v39 = *(unsigned __int16 *)(v17 + 8);
        uint64_t v40 = v39 - 1;
        BOOL v41 = v39 >= 8 || v14 == 0;
        uint64_t v42 = 7;
        if (v41) {
          uint64_t v42 = v40;
        }
        uint64_t v43 = (v42 | (v15 - 1)) + 1;
        unint64_t v15 = v43 + v19;
        *(void *)&v10[8 * v12] = v65 + v43;
        unsigned int v16 = 8;
        unsigned int v13 = 8;
        goto LABEL_49;
      }
      uint64_t v31 = (_DWORD *)(v64 + 8 * v13 + 128);
      v13 += v30;
    }
    else
    {
      if (v30 + (unint64_t)v16 > 8)
      {
        unint64_t v44 = *(unsigned __int16 *)(v17 + 8);
        uint64_t v45 = v44 - 1;
        BOOL v46 = v44 >= 8 || v14 == 0;
        uint64_t v47 = 7;
        if (v46) {
          uint64_t v47 = v45;
        }
        uint64_t v48 = (v47 | (v15 - 1)) + 1;
        unint64_t v15 = v48 + v19;
        *(void *)&v10[8 * v12] = v65 + v48;
        unsigned int v16 = 8;
        goto LABEL_49;
      }
      uint64_t v31 = (_DWORD *)(v64 + 16 * v16);
      v16 += v30;
    }
    *(void *)&v10[8 * v12] = compress_hfa_type(v31, v31, v29);
LABEL_49:
    uint64_t v11 = v63;
    goto LABEL_50;
  }
LABEL_61:
  int v54 = v62;
  if ((v62 & 0x20) != 0) {
    uint64_t v55 = v59;
  }
  else {
    uint64_t v55 = v58;
  }
  v61(a1, v55, v10, v60);
  return v54 & 0xFFFFFEFF;
}

_DWORD *compress_hfa_type(_DWORD *__dst, _OWORD *a2, int a3)
{
  switch(a3)
  {
    case 8:
      long long v4 = a2[1];
      long long v5 = a2[2];
      long long v6 = a2[3];
      *__dst = *a2;
      __dst[1] = v4;
      __dst[2] = v5;
      __dst[3] = v6;
      break;
    case 9:
      long long v7 = a2[1];
      long long v8 = a2[2];
      *__dst = *a2;
      __dst[1] = v7;
      __dst[2] = v8;
      break;
    case 10:
      long long v9 = a2[1];
      *__dst = *a2;
      __dst[1] = v9;
      break;
    case 11:
      if (__dst != (_DWORD *)a2) {
        *__dst = *(_DWORD *)a2;
      }
      break;
    case 12:
      long long v10 = a2[1];
      long long v11 = a2[2];
      long long v12 = a2[3];
      *(void *)__dst = *(void *)a2;
      *((void *)__dst + 1) = v10;
      *((void *)__dst + 2) = v11;
      *((void *)__dst + 3) = v12;
      break;
    case 13:
      long long v13 = a2[1];
      long long v14 = a2[2];
      *(void *)__dst = *(void *)a2;
      *((void *)__dst + 1) = v13;
      *((void *)__dst + 2) = v14;
      break;
    case 14:
      long long v15 = a2[1];
      *(void *)__dst = *(void *)a2;
      *((void *)__dst + 1) = v15;
      break;
    case 15:
      if (__dst != (_DWORD *)a2) {
        *(void *)__dst = *(void *)a2;
      }
      break;
    default:
      if (__dst != (_DWORD *)a2) {
        memcpy(__dst, a2, 64 - 16 * (a3 & 3u));
      }
      break;
  }
  return __dst;
}

uint64_t is_hfa0(uint64_t a1)
{
  int v1 = *(uint64_t **)(a1 + 16);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *v1;
  if (!*v1) {
    return 0xFFFFFFFFLL;
  }
  for (int i = v1 + 1; ; ++i)
  {
    uint64_t result = *(unsigned __int16 *)(v2 + 10);
    if ((result & 0xFFFFFFFD) != 0xD) {
      break;
    }
    uint64_t result = is_hfa0(v2);
    if ((result & 0x80000000) == 0) {
      break;
    }
    uint64_t v5 = *i;
    uint64_t v2 = v5;
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t is_hfa1(uint64_t a1, int a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 16);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = *v2;
  if (!*v2) {
    return 1;
  }
  for (int i = v2 + 1; ; ++i)
  {
    int v6 = *(unsigned __int16 *)(v3 + 10);
    if ((v6 & 0xFFFFFFFD) == 0xD)
    {
      uint64_t result = is_hfa1();
      if (!result) {
        return result;
      }
      goto LABEL_8;
    }
    if (v6 != a2) {
      break;
    }
LABEL_8:
    uint64_t v8 = *i;
    uint64_t v3 = v8;
    if (!v8) {
      return 1;
    }
  }
  return 0;
}

int ffi_tramp_is_supported(void)
{
  return 0;
}

void *__cdecl ffi_tramp_alloc(int flags)
{
  return 0;
}

void *__cdecl ffi_tramp_get_addr(void *tramp)
{
  return 0;
}

void __ffi_trampoline_table_alloc_block_invoke_cold_1()
{
}

void __ffi_trampoline_table_alloc_block_invoke_cold_2()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}