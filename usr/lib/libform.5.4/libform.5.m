int set_fieldtype_arg(FIELDTYPE *a1, void *(__cdecl *const make_arg)(va_list *), void *(__cdecl *const copy_arg)(const void *), void (__cdecl *const free_arg)(void *))
{
  int v4;

  v4 = -2;
  if (a1 && make_arg)
  {
    v4 = 0;
    a1->status |= 2u;
    a1->makearg = make_arg;
    a1->copyarg = copy_arg;
    a1->freearg = free_arg;
  }
  *__error() = v4;
  return v4;
}

void *__cdecl field_arg(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->arg;
}

int set_field_fore(FIELD *a1, chtype a2)
{
  if ((_BYTE)a2) {
    goto LABEL_2;
  }
  if (!a1) {
    a1 = (FIELD *)_nc_Default_Field;
  }
  if (!a1)
  {
LABEL_2:
    int v2 = -2;
  }
  else if (a1->fore == a2)
  {
    int v2 = 0;
  }
  else
  {
    a1->fore = a2;
    int v2 = _nc_Synchronize_Attributes((uint64_t)a1);
  }
  *__error() = v2;
  return v2;
}

chtype field_fore(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->fore & 0xFFFFFF00;
}

int set_field_back(FIELD *a1, chtype a2)
{
  if ((_BYTE)a2) {
    goto LABEL_2;
  }
  if (!a1) {
    a1 = (FIELD *)_nc_Default_Field;
  }
  if (!a1)
  {
LABEL_2:
    int v2 = -2;
  }
  else if (a1->back == a2)
  {
    int v2 = 0;
  }
  else
  {
    a1->back = a2;
    int v2 = _nc_Synchronize_Attributes((uint64_t)a1);
  }
  *__error() = v2;
  return v2;
}

chtype field_back(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->back & 0xFFFFFF00;
}

int set_current_field(FORM *a1, FIELD *a2)
{
  int v2 = -2;
  if (a1 && a2)
  {
    if (a2->form != a1 || (~a2->opts & 3) != 0)
    {
      int v2 = -12;
    }
    else if (a1->status)
    {
      if ((a1->status & 2) != 0)
      {
        int v2 = -5;
      }
      else if (a1->current == a2)
      {
        int v2 = 0;
      }
      else if (_nc_Internal_Validation((uint64_t)a1))
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldterm)(a1);
          a1->status &= ~2u;
        }
        int page = (unsigned __int16)a2->page;
        if (page == (unsigned __int16)a1->curpage)
        {
          int v2 = _nc_Set_Current_Field((uint64_t)a1, (uint64_t)a2);
        }
        else
        {
          formterm = a1->formterm;
          if (formterm)
          {
            a1->status |= 2u;
            ((void (*)(FORM *))formterm)(a1);
            a1->status &= ~2u;
            LOWORD(page) = a2->page;
          }
          int v2 = _nc_Set_Form_Page((uint64_t)a1, (__int16)page, (uint64_t)a2);
          forminit = a1->forminit;
          if (forminit)
          {
            a1->status |= 2u;
            ((void (*)(FORM *))forminit)(a1);
            a1->status &= ~2u;
          }
        }
        fieldinit = a1->fieldinit;
        if (fieldinit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldinit)(a1);
          a1->status &= ~2u;
        }
        _nc_Refresh_Current_Field((uint64_t)a1);
      }
      else
      {
        int v2 = -13;
      }
    }
    else
    {
      int v2 = 0;
      a1->current = a2;
      a1->curint page = a2->page;
    }
  }
  *__error() = v2;
  return v2;
}

FIELD *__cdecl current_field(const FORM *a1)
{
  v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    v1 = a1;
  }
  return v1->current;
}

int field_index(const FIELD *a1)
{
  if (a1 && a1->form) {
    return a1->index;
  }
  else {
    return -1;
  }
}

void *_nc_Make_Argument(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a1 && (*(_WORD *)a1 & 2) != 0)
  {
    if (*(_WORD *)a1)
    {
      v4 = malloc(0x10uLL);
      if (v4)
      {
        void *v4 = _nc_Make_Argument(*(void *)(a1 + 16), a2, a3);
        v4[1] = _nc_Make_Argument(*(void *)(a1 + 24), a2, a3);
        return v4;
      }
    }
    else
    {
      v4 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
      if (v4) {
        return v4;
      }
    }
    ++*a3;
    return v4;
  }
  return 0;
}

void *_nc_Copy_Argument(uint64_t a1, void *a2, _DWORD *a3)
{
  if (!a1 || (*(_WORD *)a1 & 2) == 0) {
    return 0;
  }
  v4 = a2;
  if (*(_WORD *)a1)
  {
    v8 = malloc(0x10uLL);
    if (v8)
    {
      v9 = v8;
      void *v8 = _nc_Copy_Argument(a1, *v4, a3);
      v9[1] = _nc_Copy_Argument(a1, v4[1], a3);
      return v9;
    }
    v4 = 0;
LABEL_12:
    ++*a3;
    return v4;
  }
  v7 = *(uint64_t (**)(void *))(a1 + 40);
  if (v7)
  {
    v4 = (void *)v7(a2);
    if (!v4) {
      goto LABEL_12;
    }
  }
  return v4;
}

void _nc_Free_Argument(uint64_t a1, void *a2)
{
  if (a1 && (*(_WORD *)a1 & 2) != 0)
  {
    if (*(_WORD *)a1)
    {
      if (a2)
      {
        _nc_Free_Argument(*(void *)(a1 + 16), *a2);
        _nc_Free_Argument(*(void *)(a1 + 24), a2[1]);
        free(a2);
      }
    }
    else
    {
      v4 = *(void (**)(void *))(a1 + 48);
      if (v4)
      {
        v4(a2);
      }
    }
  }
}

BOOL _nc_Copy_Type(uint64_t a1, uint64_t a2)
{
  int v8 = 0;
  int v2 = *(void **)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  v3 = (uint64_t *)(a1 + 88);
  v4 = _nc_Copy_Argument(*(void *)(a2 + 88), v2, &v8);
  v3[1] = (uint64_t)v4;
  int v5 = v8;
  uint64_t v6 = *v3;
  if (v8)
  {
    _nc_Free_Argument(v6, v4);
    uint64_t *v3 = 0;
    v3[1] = 0;
  }
  else if (v6)
  {
    ++*(void *)(v6 + 8);
  }
  return v5 == 0;
}

void _nc_Free_Type(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2)
  {
    --*(void *)(v2 + 8);
    _nc_Free_Argument(v2, *(void **)(a1 + 96));
  }
}

FIELD *__cdecl new_field(int a1, int a2, int a3, int a4, int a5, int a6)
{
  int v6 = -2;
  if (a1 < 1) {
    goto LABEL_18;
  }
  if (a2 < 1) {
    goto LABEL_18;
  }
  __int16 v10 = a4;
  __int16 v11 = a3;
  if ((a4 | a3 | a5 | a6) < 0) {
    goto LABEL_18;
  }
  v13 = malloc(0x88uLL);
  if (!v13)
  {
LABEL_17:
    int v6 = -1;
LABEL_18:
    uint64_t v14 = 0;
    *__error() = v6;
    return (FIELD *)v14;
  }
  uint64_t v14 = (uint64_t)v13;
  long long v15 = xmmword_26840AFB0;
  v13[6] = xmmword_26840AFA0;
  v13[7] = v15;
  *((void *)v13 + 16) = qword_26840AFC0;
  long long v16 = xmmword_26840AF70;
  v13[2] = xmmword_26840AF60;
  v13[3] = v16;
  long long v17 = xmmword_26840AF90;
  v13[4] = xmmword_26840AF80;
  v13[5] = v17;
  long long v18 = xmmword_26840AF50;
  _OWORD *v13 = xmmword_26840AF40;
  v13[1] = v18;
  *((_WORD *)v13 + 1) = a1;
  *((_WORD *)v13 + 2) = a2;
  *((_DWORD *)v13 + 3) = a5 + a1;
  *((_DWORD *)v13 + 4) = a2;
  *((_WORD *)v13 + 3) = v11;
  *((_WORD *)v13 + 4) = v10;
  *((_DWORD *)v13 + 6) = a5;
  *((_WORD *)v13 + 14) = a6;
  *((void *)v13 + 9) = v13;
  *((void *)v13 + 16) = newpad(1, (a5 + a1) * a2 + 1);
  *(void *)(v14 + 120) = calloc((a6 + 1), 8uLL);
  if (!_nc_Copy_Type(v14, (uint64_t)&xmmword_26840AF40)
    || (uint64_t v19 = *(int *)(v14 + 16) * (uint64_t)*(int *)(v14 + 12),
        uint64_t v20 = v19 + 1,
        uint64_t v21 = *(__int16 *)(v14 + 28),
        v22 = malloc(28 * (v20 + v20 * v21)),
        (*(void *)(v14 + 104) = v22) == 0))
  {
    free_field((FIELD *)v14);
    goto LABEL_17;
  }
  if ((v21 & 0x80000000) == 0)
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    do
    {
      uint64_t v25 = *(void *)(v14 + 104);
      if ((int)v19 < 1)
      {
        unsigned int v28 = 0;
      }
      else
      {
        v26 = (_OWORD *)(v25 + v23);
        uint64_t v27 = v19;
        do
        {
          _OWORD *v26 = xmmword_22B843A50;
          *(_OWORD *)((char *)v26 + 12) = *(long long *)((char *)&xmmword_22B843A50 + 12);
          v26 = (_OWORD *)((char *)v26 + 28);
          --v27;
        }
        while (v27);
        unsigned int v28 = v19;
      }
      uint64_t v29 = v25 + 28 * v24 * v20 + 28 * v28;
      *(void *)uint64_t v29 = 0;
      *(void *)(v29 + 8) = 0;
      *(_DWORD *)(v29 + 24) = 0;
      *(void *)(v29 + 16) = 0;
      v23 += 28 * (int)v19 + 28;
    }
    while (v24++ < *(__int16 *)(v14 + 28));
  }
  return (FIELD *)v14;
}

int free_field(FIELD *a1)
{
  if (a1)
  {
    if (a1->form)
    {
      int v2 = -4;
    }
    else
    {
      link = a1->link;
      if (link == a1)
      {
        buf = a1->buf;
        if (buf) {
          free(buf);
        }
      }
      else
      {
        v4 = a1;
        do
        {
          int v5 = v4;
          v4 = v4->link;
        }
        while (v4 != a1);
        v5->link = link;
      }
      type = a1->type;
      if (type)
      {
        --type->ref;
        _nc_Free_Argument((uint64_t)type, (void *)a1->arg);
      }
      int v8 = *(void **)&a1[1].status;
      if (v8)
      {
        int nbuf = a1->nbuf;
        if ((nbuf & 0x80000000) == 0)
        {
          uint64_t v10 = 0;
          do
          {
            __int16 v11 = *(void **)(*(void *)&a1[1].status + 8 * v10);
            if (v11)
            {
              free(v11);
              LOWORD(nbuf) = a1->nbuf;
            }
          }
          while (v10++ < (__int16)nbuf);
          int v8 = *(void **)&a1[1].status;
        }
        free(v8);
        delwin(*(WINDOW **)&a1[1].fcol);
      }
      free(a1);
      int v2 = 0;
    }
  }
  else
  {
    int v2 = -2;
  }
  *__error() = v2;
  return v2;
}

FIELD *__cdecl dup_field(FIELD *a1, int a2, int a3)
{
  int v3 = -2;
  if (!a1) {
    goto LABEL_12;
  }
  __int16 v4 = a3;
  __int16 v5 = a2;
  if ((a3 | a2) < 0) {
    goto LABEL_12;
  }
  v7 = (char *)malloc(0x88uLL);
  if (!v7)
  {
LABEL_11:
    int v3 = -1;
LABEL_12:
    int v8 = 0;
    *__error() = v3;
    return v8;
  }
  int v8 = (FIELD *)v7;
  v9 = _nc_Default_Field;
  *(_OWORD *)v7 = *_nc_Default_Field;
  long long v10 = v9[1];
  long long v11 = v9[2];
  long long v12 = v9[3];
  *((_OWORD *)v7 + 4) = v9[4];
  long long v13 = v9[5];
  uint64_t v14 = *((void *)v9 + 16);
  long long v15 = v9[7];
  *((_OWORD *)v7 + 6) = v9[6];
  *((_OWORD *)v7 + 7) = v15;
  *((_OWORD *)v7 + 2) = v11;
  *((_OWORD *)v7 + 3) = v12;
  *((_OWORD *)v7 + 1) = v10;
  *((void *)v7 + 16) = v14;
  *((_OWORD *)v7 + 5) = v13;
  *((_WORD *)v7 + 3) = v5;
  *((_WORD *)v7 + 4) = v4;
  *((void *)v7 + 9) = v7;
  *(_DWORD *)(v7 + 2) = *(_DWORD *)&a1->rows;
  *(_OWORD *)(v7 + 12) = *(_OWORD *)&a1->drows;
  *((_DWORD *)v7 + 7) = *(_DWORD *)&a1->nbuf;
  *(_OWORD *)(v7 + 36) = *(_OWORD *)&a1->pad;
  *((void *)v7 + 14) = a1->usrptr;
  if (!_nc_Copy_Type((uint64_t)v7, (uint64_t)a1)
    || (size_t v16 = 28 * (v8->nbuf + 1 + (v8->nbuf + 1) * v8->dcols * (uint64_t)v8->drows),
        long long v17 = (FIELD_CELL *)malloc(v16),
        (v8->buf = v17) == 0))
  {
    free_field(v8);
    goto LABEL_11;
  }
  if (v16)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = (_OWORD *)((char *)v8->buf + v18);
      uint64_t v20 = (long long *)((char *)a1->buf + v18);
      long long v21 = *v20;
      *(_OWORD *)((char *)v19 + 12) = *(long long *)((char *)v20 + 12);
      *uint64_t v19 = v21;
      v18 += 28;
      --v16;
    }
    while (v16);
  }
  return v8;
}

int set_fieldtype_choice(FIELDTYPE *a1, BOOL (__cdecl *const next_choice)(FIELD *, const void *), BOOL (__cdecl *const prev_choice)(FIELD *, const void *))
{
  int v3 = -2;
  if (a1 && next_choice && prev_choice)
  {
    int v3 = 0;
    a1->status |= 4u;
    a1->next = next_choice;
    a1->prev = prev_choice;
  }
  *__error() = v3;
  return v3;
}

FIELDTYPE *__cdecl link_fieldtype(FIELDTYPE *a1, FIELDTYPE *a2)
{
  if (!a1 || !a2)
  {
    long long v11 = __error();
    result = 0;
    int v12 = -2;
LABEL_13:
    *long long v11 = v12;
    return result;
  }
  result = (FIELDTYPE *)malloc(0x58uLL);
  if (!result)
  {
    long long v11 = __error();
    result = 0;
    int v12 = -1;
    goto LABEL_13;
  }
  __int16 v5 = _nc_Default_FieldType;
  long long v6 = _nc_Default_FieldType[3];
  *(_OWORD *)&result->makearg = _nc_Default_FieldType[2];
  *(_OWORD *)&result->freearg = v6;
  *(_OWORD *)&result->ccheck = v5[4];
  result->prev = (BOOL (__cdecl *)(FIELD *, const void *))*((void *)v5 + 10);
  long long v7 = v5[1];
  *(_OWORD *)&result->unsigned __int16 status = *v5;
  *(_OWORD *)&result->left = v7;
  unsigned __int16 status = result->status;
  unsigned __int16 v9 = result->status | 1;
  result->unsigned __int16 status = v9;
  unsigned __int16 v10 = a1->status;
  if ((a1->status & 2) != 0 || (a2->status & 2) != 0)
  {
    unsigned __int16 v9 = status | 3;
    result->unsigned __int16 status = status | 3;
  }
  if ((v10 & 4) != 0 || (a2->status & 4) != 0) {
    result->unsigned __int16 status = v9 | 4;
  }
  result->left = a1;
  result->right = a2;
  ++a1->ref;
  ++a2->ref;
  return result;
}

int field_info(const FIELD *a1, int *a2, int *a3, int *a4, int *a5, int *a6, int *a7)
{
  if (a1)
  {
    if (a2) {
      *a2 = a1->rows;
    }
    if (a3) {
      *a3 = a1->cols;
    }
    if (a4) {
      *a4 = a1->frow;
    }
    if (a5) {
      *a5 = a1->fcol;
    }
    if (a6) {
      *a6 = a1->nrow;
    }
    int v7 = 0;
    if (a7) {
      *a7 = a1->nbuf;
    }
  }
  else
  {
    int v7 = -2;
  }
  *__error() = v7;
  return v7;
}

int dynamic_field_info(const FIELD *a1, int *a2, int *a3, int *a4)
{
  if (a1)
  {
    if (a2) {
      *a2 = a1->drows;
    }
    if (a3) {
      *a3 = a1->dcols;
    }
    int v4 = 0;
    if (a4) {
      *a4 = a1->maxgrow;
    }
  }
  else
  {
    int v4 = -2;
  }
  *__error() = v4;
  return v4;
}

int set_field_just(FIELD *a1, int a2)
{
  if (a2 > 3)
  {
    int v2 = -2;
  }
  else
  {
    if (!a1) {
      a1 = (FIELD *)_nc_Default_Field;
    }
    if (a1->just == a2)
    {
      int v2 = 0;
    }
    else
    {
      a1->just = a2;
      int v2 = _nc_Synchronize_Attributes((uint64_t)a1);
    }
  }
  *__error() = v2;
  return v2;
}

int field_just(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->just;
}

FIELD *__cdecl link_field(FIELD *a1, int a2, int a3)
{
  int v3 = -2;
  if (!a1) {
    goto LABEL_7;
  }
  __int16 v4 = a3;
  __int16 v5 = a2;
  if ((a3 | a2) < 0) {
    goto LABEL_7;
  }
  int v7 = (char *)malloc(0x88uLL);
  if (!v7)
  {
LABEL_6:
    int v3 = -1;
LABEL_7:
    int v8 = 0;
    *__error() = v3;
    return v8;
  }
  int v8 = (FIELD *)v7;
  unsigned __int16 v9 = _nc_Default_Field;
  *(_OWORD *)int v7 = *_nc_Default_Field;
  long long v11 = v9[1];
  long long v10 = v9[2];
  long long v12 = v9[4];
  *((_OWORD *)v7 + 3) = v9[3];
  *((_OWORD *)v7 + 4) = v12;
  *((_OWORD *)v7 + 1) = v11;
  *((_OWORD *)v7 + 2) = v10;
  uint64_t v13 = *((void *)v9 + 16);
  long long v14 = v9[5];
  long long v15 = v9[7];
  *((_OWORD *)v7 + 6) = v9[6];
  *((_OWORD *)v7 + 7) = v15;
  *((void *)v7 + 16) = v13;
  *((_OWORD *)v7 + 5) = v14;
  *((_WORD *)v7 + 3) = v5;
  *((_WORD *)v7 + 4) = v4;
  *((void *)v7 + 9) = a1->link;
  a1->link = (fieldnode *)v7;
  *(_DWORD *)(v7 + 2) = *(_DWORD *)&a1->rows;
  *((_DWORD *)v7 + 7) = *(_DWORD *)&a1->nbuf;
  *(_OWORD *)(v7 + 12) = *(_OWORD *)&a1->drows;
  *(_OWORD *)(v7 + 36) = *(_OWORD *)&a1->pad;
  *(_OWORD *)(v7 + 104) = *(_OWORD *)&a1->buf;
  if (!_nc_Copy_Type((uint64_t)v7, (uint64_t)a1))
  {
    free_field(v8);
    goto LABEL_6;
  }
  return v8;
}

int set_max_field(FIELD *a1, int a2)
{
  int v2 = -2;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    int v3 = a1->nrow + a1->rows;
    if (!a2 || (v3 != 1 ? (int dcols = a1->drows) : (int dcols = a1->dcols), dcols <= a2))
    {
      a1->maxgrow = a2;
      unsigned __int16 status = a1->status;
      a1->status &= ~8u;
      if ((a1->opts & 0x200) != 0 || a2 && (v3 != 1 ? (int drows = a1->drows) : (int drows = a1->dcols), drows >= a2))
      {
        int v2 = 0;
      }
      else
      {
        int v2 = 0;
        a1->unsigned __int16 status = status | 8;
      }
    }
  }
  *__error() = v2;
  return v2;
}

int move_field(FIELD *a1, int a2, int a3)
{
  int v3 = -2;
  if (a1 && ((a3 | a2) & 0x80000000) == 0)
  {
    if (a1->form)
    {
      int v3 = -4;
    }
    else
    {
      int v3 = 0;
      a1->frow = a2;
      a1->fcol = a3;
    }
  }
  *__error() = v3;
  return v3;
}

FIELDTYPE *__cdecl new_fieldtype(BOOL (__cdecl *const field_check)(FIELD *, const void *), BOOL (__cdecl *const char_check)(int, const void *))
{
  if ((unint64_t)field_check | (unint64_t)char_check)
  {
    result = (FIELDTYPE *)malloc(0x58uLL);
    if (result)
    {
      long long v5 = xmmword_26840B0F8;
      long long v6 = xmmword_26840B0D8;
      *(_OWORD *)&result->freearg = unk_26840B0E8;
      *(_OWORD *)&result->ccheck = v5;
      result->prev = (BOOL (__cdecl *)(FIELD *, const void *))qword_26840B108;
      long long v7 = unk_26840B0C8;
      *(_OWORD *)&result->unsigned __int16 status = xmmword_26840B0B8;
      *(_OWORD *)&result->left = v7;
      *(_OWORD *)&result->makearg = v6;
      result->fcheck = field_check;
      result->ccheck = char_check;
      return result;
    }
    int v8 = __error();
    result = 0;
    int v9 = -1;
  }
  else
  {
    int v8 = __error();
    result = 0;
    int v9 = -2;
  }
  int *v8 = v9;
  return result;
}

int free_fieldtype(FIELDTYPE *a1)
{
  if (a1)
  {
    if (a1->ref || (a1->status & 8) != 0)
    {
      int v3 = -4;
    }
    else
    {
      if (a1->status)
      {
        left = a1->left;
        if (left) {
          --left->ref;
        }
        right = a1->right;
        if (right) {
          --right->ref;
        }
      }
      free(a1);
      int v3 = 0;
    }
  }
  else
  {
    int v3 = -2;
  }
  *__error() = v3;
  return v3;
}

int set_field_opts(FIELD *a1, Field_Options a2)
{
  int v2 = a2 & 0x7FF;
  if (!a1) {
    a1 = (FIELD *)_nc_Default_Field;
  }
  int v3 = _nc_Synchronize_Options((uint64_t)a1, v2);
  *__error() = v3;
  return v3;
}

Field_Options field_opts(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->opts & 0x7FF;
}

int field_opts_on(FIELD *a1, Field_Options a2)
{
  if (!a1) {
    a1 = (FIELD *)_nc_Default_Field;
  }
  int v2 = _nc_Synchronize_Options((uint64_t)a1, a1->opts | a2 & 0x7FFu);
  *__error() = v2;
  return v2;
}

int field_opts_off(FIELD *a1, Field_Options a2)
{
  if (!a1) {
    a1 = (FIELD *)_nc_Default_Field;
  }
  int v2 = _nc_Synchronize_Options((uint64_t)a1, a1->opts & ((unsigned __int16)~(_WORD)a2 | 0xFFFFF800));
  *__error() = v2;
  return v2;
}

int set_field_pad(FIELD *a1, int a2)
{
  if (a1) {
    int v3 = a1;
  }
  else {
    int v3 = (FIELD *)_nc_Default_Field;
  }
  if (a2 <= 0x7Fu)
  {
    if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2 + 60) & 0x40000) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    int v4 = -2;
    goto LABEL_11;
  }
  if (!__maskrune(a2, 0x40000uLL)) {
    goto LABEL_9;
  }
LABEL_6:
  if (v3->pad == a2)
  {
    int v4 = 0;
  }
  else
  {
    v3->pad = a2;
    int v4 = _nc_Synchronize_Attributes((uint64_t)v3);
  }
LABEL_11:
  *__error() = v4;
  return v4;
}

int field_pad(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->pad;
}

int set_new_page(FIELD *a1, BOOL a2)
{
  int v2 = (FIELD *)_nc_Default_Field;
  if (a1) {
    int v2 = a1;
  }
  if (v2->form)
  {
    int v3 = -4;
  }
  else
  {
    int v3 = 0;
    if (a2) {
      __int16 v4 = 4;
    }
    else {
      __int16 v4 = 0;
    }
    v2->unsigned __int16 status = v2->status & 0xFFFB | v4;
  }
  *__error() = v3;
  return v3;
}

BOOL new_page(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return (v1->status >> 2) & 1;
}

int set_field_status(FIELD *a1, BOOL a2)
{
  int v2 = (FIELD *)_nc_Default_Field;
  if (a1) {
    int v2 = a1;
  }
  v2->unsigned __int16 status = v2->status & 0xFFFE | a2;
  *__error() = 0;
  return 0;
}

BOOL field_status(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->status & 1;
}

int set_field_type(FIELD *a1, FIELDTYPE *a2, ...)
{
  va_start(va, a2);
  int v9 = 0;
  va_copy(v10, va);
  if (a1) {
    int v3 = a1;
  }
  else {
    int v3 = (FIELD *)_nc_Default_Field;
  }
  _nc_Free_Type((uint64_t)v3);
  v3->type = a2;
  p_type = (uint64_t *)&v3->type;
  Argument = _nc_Make_Argument((uint64_t)a2, (uint64_t)&v10, &v9);
  p_type[1] = (uint64_t)Argument;
  uint64_t v6 = *p_type;
  if (v9)
  {
    _nc_Free_Argument(v6, Argument);
    uint64_t *p_type = 0;
    p_type[1] = 0;
    int v7 = -1;
  }
  else
  {
    int v7 = 0;
    if (v6) {
      ++*(void *)(v6 + 8);
    }
  }
  *__error() = v7;
  return v7;
}

FIELDTYPE *__cdecl field_type(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->type;
}

int set_field_userptr(FIELD *a1, void *a2)
{
  int v2 = (FIELD *)_nc_Default_Field;
  if (a1) {
    int v2 = a1;
  }
  v2->usrptr = a2;
  *__error() = 0;
  return 0;
}

void *__cdecl field_userptr(const FIELD *a1)
{
  v1 = (const FIELD *)_nc_Default_Field;
  if (a1) {
    v1 = a1;
  }
  return v1->usrptr;
}

int pos_form_cursor(FORM *a1)
{
  if (a1)
  {
    if (a1->status) {
      int v1 = _nc_Position_Form_Cursor((uint64_t)a1);
    }
    else {
      int v1 = -7;
    }
  }
  else
  {
    int v1 = -2;
  }
  *__error() = v1;
  return v1;
}

BOOL data_behind(const FORM *a1)
{
  if (a1)
  {
    if ((a1->status & 1) != 0 && (current = a1->current) != 0)
    {
      BOOL v2 = current->nrow + current->rows == 1;
      uint64_t v3 = 16;
      if (v2) {
        uint64_t v3 = 20;
      }
      LOBYTE(a1) = *(_DWORD *)((char *)&a1->status + v3) != 0;
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }
  return (char)a1;
}

BOOL data_ahead(const FORM *a1)
{
  if (!a1) {
    return 0;
  }
  if ((a1->status & 1) == 0) {
    return 0;
  }
  current = a1->current;
  if (!current) {
    return 0;
  }
  int rows = current->rows;
  if (current->nrow + rows != 1)
  {
    int v13 = a1->toprow + rows;
    if (v13 < current->drows)
    {
      do
      {
        wmove(a1->w, v13, 0);
        w = a1->w;
        if (w)
        {
          int v15 = *(__int16 *)w;
          int v16 = *((__int16 *)w + 1);
        }
        else
        {
          int v15 = -1;
          int v16 = -1;
        }
        int cols = current->cols;
        if (cols >= 1)
        {
          int pad_low = LOBYTE(current->pad);
          while (wmove(w, v15, v16) != -1)
          {
            if (win_wch() != -1 && pad_low)
            {
LABEL_34:
              BOOL v19 = 1;
              goto LABEL_35;
            }
            ++v16;
            if (!--cols) {
              break;
            }
          }
        }
        ++v13;
      }
      while (v13 < current->drows);
      goto LABEL_31;
    }
    return 0;
  }
  int v4 = current->cols;
  int v5 = a1->begincol + v4;
  int dcols = current->dcols;
  if (v5 >= dcols) {
    return 0;
  }
  do
  {
    int v7 = dcols - v5;
    if (v7 >= (__int16)v4) {
      int v8 = (__int16)v4;
    }
    else {
      int v8 = v7;
    }
    wmove(a1->w, 0, v5);
    int v9 = a1->w;
    if (v9)
    {
      int v10 = *(__int16 *)v9;
      int v11 = *((__int16 *)v9 + 1);
    }
    else
    {
      int v10 = -1;
      int v11 = -1;
    }
    if (v8 >= 1)
    {
      int v12 = LOBYTE(current->pad);
      while (wmove(v9, v10, v11) != -1)
      {
        if (win_wch() != -1 && v12) {
          goto LABEL_34;
        }
        ++v11;
        if (!--v8) {
          break;
        }
      }
    }
    LOWORD(v4) = current->cols;
    v5 += (__int16)v4;
    int dcols = current->dcols;
  }
  while (v5 < dcols);
LABEL_31:
  BOOL v19 = 0;
LABEL_35:
  wmove(a1->w, a1->currow, a1->curcol);
  return v19;
}

FORM *__cdecl new_form(FIELD **a1)
{
  uint64_t v1 = *MEMORY[0x263F8C610];
  if (!*MEMORY[0x263F8C610] || !*(void *)(v1 + 48) || *(unsigned char *)(v1 + 41) || (uint64_t v6 = (FORM *)malloc(0x80uLL)) == 0)
  {
    int v2 = -1;
LABEL_5:
    uint64_t v3 = 0;
    *__error() = v2;
    return v3;
  }
  uint64_t v3 = v6;
  int v7 = _nc_Default_Form;
  long long v8 = _nc_Default_Form[2];
  long long v9 = _nc_Default_Form[3];
  long long v10 = _nc_Default_Form[1];
  *(_OWORD *)&v6->unsigned __int16 status = *_nc_Default_Form;
  *(_OWORD *)&v6->toprow = v10;
  long long v11 = v7[4];
  long long v12 = v7[5];
  long long v13 = v7[7];
  *(_OWORD *)&v6->forminit = v7[6];
  *(_OWORD *)&v6->fieldinit = v13;
  *(_OWORD *)&v6->field = v11;
  *(_OWORD *)&v6->int page = v12;
  *(_OWORD *)&v6->opts = v8;
  *(_OWORD *)&v6->sub = v9;
  long long v14 = *(WINDOW **)(v1 + 152);
  v6->win = v14;
  v6->sub = v14;
  int v15 = sub_22B83C8B4((uint64_t)v6, a1);
  if (v15)
  {
    int v2 = v15;
    free_form(v3);
    goto LABEL_5;
  }
  if (v3->maxpage < 1)
  {
    v3->curint page = -1;
    v3->current = 0;
  }
  else
  {
    v3->curint page = 0;
    form_driver(v3, -291056);
  }
  return v3;
}

int free_form(FORM *a1)
{
  if (a1)
  {
    if (a1->status)
    {
      int v3 = -3;
    }
    else
    {
      sub_22B83C794((uint64_t)a1);
      int page = a1->page;
      if (page) {
        free(page);
      }
      free(a1);
      int v3 = 0;
    }
  }
  else
  {
    int v3 = -2;
  }
  *__error() = v3;
  return v3;
}

void sub_22B83C794(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 64);
  if (v1)
  {
    uint64_t v3 = *v1;
    if (*v1)
    {
      int v4 = v1 + 1;
      do
      {
        if (*(void *)(v3 + 80) == a1) {
          *(void *)(v3 + 80) = 0;
        }
        uint64_t v5 = *v4++;
        uint64_t v3 = v5;
      }
      while (v5);
    }
    *(_DWORD *)(a1 + 2) = 0;
    *(_DWORD *)(a1 + 24) = -1;
    *(void *)(a1 + 64) = 0;
    uint64_t v6 = *(void **)(a1 + 80);
    if (v6) {
      free(v6);
    }
    *(void *)(a1 + 80) = 0;
  }
}

int set_form_fields(FORM *a1, FIELD **a2)
{
  if (a1)
  {
    if (a1->status)
    {
      int v5 = -3;
    }
    else
    {
      field = a1->field;
      sub_22B83C794((uint64_t)a1);
      int v5 = sub_22B83C8B4((uint64_t)a1, a2);
      if (v5)
      {
        sub_22B83C8B4((uint64_t)a1, field);
      }
      else if (a1->maxpage < 1)
      {
        a1->curint page = -1;
        a1->current = 0;
      }
      else
      {
        a1->curint page = 0;
        form_driver(a1, -291056);
      }
    }
  }
  else
  {
    int v5 = -2;
  }
  *__error() = v5;
  return v5;
}

uint64_t sub_22B83C8B4(uint64_t a1, void *a2)
{
  *(void *)(a1 + 64) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  if (!a2) {
    goto LABEL_47;
  }
  uint64_t v3 = (_WORD *)*a2;
  if (!*a2) {
    goto LABEL_48;
  }
  uint64_t v5 = 0;
  int v6 = 0;
  do
  {
    if (*((void *)v3 + 10))
    {
      uint64_t v32 = 4294967292;
      goto LABEL_50;
    }
    if (!v5 || (*v3 & 4) != 0) {
      ++v6;
    }
    *((void *)v3 + 10) = a1;
    int v7 = v5 + 1;
    uint64_t v3 = (_WORD *)a2[++v5];
  }
  while (v3);
  if (!v7 || (v7 & 0x8000) != 0)
  {
LABEL_48:
    uint64_t v32 = 4294967294;
    goto LABEL_50;
  }
  long long v8 = malloc(8 * v6);
  if (!v8)
  {
    uint64_t v32 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  uint64_t v9 = 0;
  *(void *)(a1 + 80) = v8;
  __int16 v10 = *(_WORD *)(a1 + 2);
  long long v11 = v8;
  __int16 v12 = *(_WORD *)(a1 + 4);
  do
  {
    if (v9)
    {
      long long v13 = (_WORD *)a2[v9];
      if ((*v13 & 4) != 0)
      {
        v11[4] = v9;
        v11 += 4;
        *(v11 - 3) = v9 - 1;
      }
    }
    else
    {
      *long long v11 = 0;
      long long v13 = (_WORD *)*a2;
    }
    int v14 = (__int16)v13[1] + (__int16)v13[3];
    int v15 = (__int16)v13[4];
    int v16 = (__int16)v13[2];
    if (v14 > v10)
    {
      *(_WORD *)(a1 + 2) = v14;
      __int16 v10 = v14;
    }
    int v17 = v16 + v15;
    if (v17 > v12)
    {
      *(_WORD *)(a1 + 4) = v17;
      __int16 v12 = v17;
    }
    ++v9;
  }
  while (v7 != v9);
  v11[1] = v7 - 1;
  *(_WORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 26) = v6;
  if (v6 << 16 >= 1)
  {
    uint64_t v18 = 0;
    if ((unsigned __int16)v6 <= 1u) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = (unsigned __int16)v6;
    }
    do
    {
      uint64_t v20 = &v8[4 * v18];
      int v21 = v20[1];
      if (*v20 <= v21)
      {
        uint64_t v23 = 0;
        uint64_t v24 = *v20;
        do
        {
          uint64_t v25 = a2[v24];
          *(_WORD *)(v25 + 34) = v24;
          *(_WORD *)(v25 + 32) = v18;
          if (v23)
          {
            int v26 = *(__int16 *)(v25 + 6);
            uint64_t v27 = v23;
            while (1)
            {
              int v28 = *(__int16 *)(v27 + 6);
              if (v28 >= v26 && (v28 != v26 || *(__int16 *)(v27 + 8) >= *(__int16 *)(v25 + 8))) {
                break;
              }
              uint64_t v27 = *(void *)(v27 + 56);
              if (v27 == v23)
              {
                uint64_t v29 = 0;
                uint64_t v27 = v23;
                goto LABEL_38;
              }
            }
            uint64_t v29 = v23;
LABEL_38:
            uint64_t v30 = *(void *)(v27 + 64);
            *(void *)(v25 + 56) = v27;
            *(void *)(v25 + 64) = v30;
            *(void *)(v27 + 64) = v25;
            *(void *)(*(void *)(v25 + 64) + 56) = v25;
            if (v27 == v29) {
              uint64_t v23 = v25;
            }
          }
          else
          {
            *(void *)(v25 + 56) = v25;
            *(void *)(v25 + 64) = v25;
            uint64_t v23 = v25;
          }
        }
        while (v24++ != v21);
        if (v23)
        {
          __int16 v22 = *(_WORD *)(v23 + 34);
          LOWORD(v23) = *(_WORD *)(*(void *)(v23 + 64) + 34);
        }
        else
        {
          __int16 v22 = 0;
        }
      }
      else
      {
        __int16 v22 = 0;
        LOWORD(v23) = 0;
      }
      uint64_t v32 = 0;
      v20[2] = v22;
      v20[3] = v23;
      ++v18;
    }
    while (v18 != v19);
  }
  else
  {
LABEL_47:
    uint64_t v32 = 0;
  }
LABEL_50:
  *__error() = v32;
  return v32;
}

FIELD **__cdecl form_fields(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->field;
}

int field_count(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->maxfield;
}

uint64_t _nc_get_fieldbuffer(uint64_t result, _DWORD *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(result + 56);
  if (!v4 || (int v5 = *(__int16 *)(v4 + 4), v5 < 0))
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 24) = 0;
    *(void *)(a3 + 16) = 0;
  }
  else
  {
    int v21 = a2[9];
    result = ((uint64_t (*)(void))*MEMORY[0x263F8C618])();
    int v7 = (_DWORD *)result;
    int v8 = 0;
    int v9 = 0;
    do
    {
      if (v8 >= a2[3]) {
        break;
      }
      wmove((WINDOW *)v4, v8, 0);
      __int16 v10 = (_DWORD *)(a3 + 28 * v9);
      uint64_t v11 = a2[4];
      result = win_wchnstr();
      if ((int)v11 >= 1)
      {
        uint64_t v12 = v11;
        do
        {
          int v13 = *(unsigned __int8 *)v10;
          *__int16 v10 = v13;
          if (*v7 >= 0x60000u) {
            v10[6] = 0;
          }
          *__int16 v10 = v13;
          v10 += 7;
          --v12;
        }
        while (v12);
      }
      v9 += v11;
    }
    while (v8++ != v5);
    uint64_t v15 = a3 + 28 * v9;
    *(void *)uint64_t v15 = 0;
    *(void *)(v15 + 8) = 0;
    *(_DWORD *)(v15 + 24) = 0;
    *(void *)(v15 + 16) = 0;
    if (v21 != 32 && v9 >= 1)
    {
      int v16 = (_DWORD *)(a3 + 4);
      int v17 = (_DWORD *)(a3 + 4);
      do
      {
        int v18 = *v17;
        v17 += 7;
        if (v18 == v21 && !v16[1])
        {
          uint64_t v19 = (long long *)(v16 - 1);
          long long v20 = xmmword_26840B060;
          *(long long *)((char *)v19 + 12) = *(long long *)((char *)&xmmword_26840B060 + 12);
          *uint64_t v19 = v20;
        }
        int v16 = v17;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

uint64_t _nc_Position_Form_Cursor(uint64_t a1)
{
  if (!a1) {
    return 4294967294;
  }
  int v2 = *(WINDOW **)(a1 + 56);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = *(void *)(a1 + 72);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(WINDOW **)(a1 + 48);
  if (!v4)
  {
    uint64_t v4 = *(WINDOW **)(a1 + 40);
    if (!v4) {
      uint64_t v4 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
  }
  wmove(v2, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  if ((*(unsigned char *)(v3 + 48) & 4) != 0
    && *(_DWORD *)(v3 + 12) <= *(__int16 *)(v3 + 2)
    && *(_DWORD *)(v3 + 16) <= *(__int16 *)(v3 + 4))
  {
    uint64_t v4 = *(WINDOW **)(a1 + 56);
  }
  else
  {
    wmove(v4, *(_DWORD *)(a1 + 8) + *(__int16 *)(v3 + 6) - *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 12) + *(__int16 *)(v3 + 8) - *(_DWORD *)(a1 + 20));
  }
  wcursyncup(v4);
  return 0;
}

uint64_t _nc_Refresh_Current_Field(uint64_t a1)
{
  if (!a1)
  {
    __int16 v10 = __error();
    uint64_t result = 4294967294;
    goto LABEL_21;
  }
  int v2 = *(const WINDOW **)(a1 + 56);
  if (!v2 || (uint64_t v3 = *(__int16 **)(a1 + 72)) == 0)
  {
    __int16 v10 = __error();
    uint64_t result = 0xFFFFFFFFLL;
LABEL_21:
    *__int16 v10 = result;
    return result;
  }
  uint64_t v4 = *(WINDOW **)(a1 + 48);
  if (!v4)
  {
    uint64_t v4 = *(WINDOW **)(a1 + 40);
    if (!v4) {
      uint64_t v4 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
  }
  if ((v3[24] & 4) == 0) {
    goto LABEL_35;
  }
  int v5 = v3[1];
  if (*((_DWORD *)v3 + 3) > v5)
  {
    if (*((_DWORD *)v3 + 6) + v5 != 1)
    {
      int v6 = *(_DWORD *)(a1 + 16);
      int v7 = v6 + v5;
      int v8 = *(_DWORD *)(a1 + 8);
      __int16 v9 = *v3;
      if (v8 < v6)
      {
        *(_DWORD *)(a1 + 16) = v8;
        v9 |= 2u;
        __int16 *v3 = v9;
        int v6 = v8;
      }
      if (v8 >= v7)
      {
        int v6 = v8 - v5 + 1;
        *(_DWORD *)(a1 + 16) = v6;
        v9 |= 2u;
        __int16 *v3 = v9;
      }
      if ((v9 & 2) != 0)
      {
        int v15 = v6 + v5;
        __int16 *v3 = v9 & 0xFFFD;
      }
      else
      {
        if (v6 < v7)
        {
          while (!is_linetouched(*(WINDOW **)(a1 + 56), v6))
          {
            if (v7 == ++v6) {
              goto LABEL_33;
            }
          }
        }
        if (v6 >= v7) {
          goto LABEL_33;
        }
        int v15 = v6;
        while (is_linetouched(*(WINDOW **)(a1 + 56), v15))
        {
          if (v7 == ++v15)
          {
            int v15 = v7;
            goto LABEL_31;
          }
        }
      }
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (*((_DWORD *)v3 + 4) > v3[2])
  {
    if (*((_DWORD *)v3 + 6) + v5 != 1)
    {
      int v6 = *(_DWORD *)(a1 + 16);
      int v15 = v6 + v5;
LABEL_31:
      if (v15 != v6) {
        copywin(*(const WINDOW **)(a1 + 56), v4, v6, 0, v6 + v3[3] - *(_DWORD *)(a1 + 16), v3[4], v15 + v3[3] + ~*(_DWORD *)(a1 + 16), v3[4] + v3[2] - 1, 0);
      }
LABEL_33:
      int v2 = v4;
      goto LABEL_34;
    }
LABEL_24:
    int v12 = *(_DWORD *)(a1 + 12);
    int v13 = *(_DWORD *)(a1 + 20);
    if (v12 >= v13)
    {
      int v14 = v3[2];
      if (v12 >= v13 + v14)
      {
        int v13 = v12 - v14 + 1;
        *(_DWORD *)(a1 + 20) = v13;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 20) = v12;
      int v14 = v3[2];
      int v13 = v12;
    }
    copywin(v2, v4, 0, v13, v3[3], v3[4], v3[3], v3[4] + v14 - 1, 0);
    goto LABEL_33;
  }
LABEL_34:
  wsyncup(v2);
LABEL_35:
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    int v17 = *(__int16 *)(v16 + 4) + 1;
  }
  else {
    int v17 = -1;
  }
  wtouchln((WINDOW *)v16, 0, v17, 0);

  return _nc_Position_Form_Cursor(a1);
}

uint64_t _nc_Synchronize_Attributes(uint64_t a1)
{
  if (!a1) {
    return 4294967294;
  }
  uint64_t v2 = *(void *)(a1 + 80);
  if (!v2
    || (*(_WORD *)v2 & 1) == 0
    || (*(unsigned char *)(a1 + 48) & 1) == 0
    || *(unsigned __int16 *)(a1 + 32) != *(unsigned __int16 *)(v2 + 28))
  {
    return 0;
  }
  if (*(void *)(v2 + 72) == a1)
  {
    sub_22B83D1DC(*(void *)(a1 + 80));
    wbkgdset(*(WINDOW **)(v2 + 56), *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    uint64_t v4 = *(void *)(v2 + 56);
    if (v4)
    {
      int v5 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v4 + 116) = BYTE1(v5);
      *(_DWORD *)(v4 + 16) = v5;
    }
    werase((WINDOW *)v4);
    wmove(*(WINDOW **)(v2 + 56), *(_DWORD *)(v2 + 8), *(_DWORD *)(v2 + 12));
    int v6 = *(_DWORD *)(a1 + 48);
    if ((v6 & 4) == 0)
    {
      int v7 = *(WINDOW **)(v2 + 48);
      if (!v7)
      {
        int v7 = *(WINDOW **)(v2 + 40);
        if (!v7) {
          int v7 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
        }
      }
      copywin(*(const WINDOW **)(v2 + 56), v7, 0, 0, *(__int16 *)(a1 + 6), *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 2) - 1, *(__int16 *)(a1 + 4) - 1, 0);
      wsyncup(v7);
      sub_22B83D32C(a1, *(WINDOW **)(v2 + 56));
      *(_WORD *)a1 |= 2u;
      _nc_Refresh_Current_Field(v2);
      return 0;
    }
    if (*(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
    {
      if ((v6 & 0x200) != 0)
      {
        if ((v6 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4)) {
          goto LABEL_27;
        }
      }
      else if ((v6 & 0x400) != 0)
      {
LABEL_27:
        sub_22B83D240(a1, *(WINDOW **)(v2 + 56));
        return 0;
      }
    }
    sub_22B83D32C(a1, *(WINDOW **)(v2 + 56));
    return 0;
  }

  return sub_22B83D444(a1, 0);
}

uint64_t sub_22B83D1DC(uint64_t result)
{
  if ((*(_WORD *)result & 0x10) != 0)
  {
    uint64_t v1 = result;
    *(_WORD *)uint64_t result = *(_WORD *)result & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(result, *(_DWORD **)(result + 72), *(void *)(*(void *)(result + 72) + 104));
    uint64_t v2 = *(WINDOW **)(v1 + 56);
    int v3 = *(_DWORD *)(v1 + 8);
    int v4 = *(_DWORD *)(v1 + 12);
    return wmove(v2, v3, v4);
  }
  return result;
}

uint64_t sub_22B83D240(uint64_t result, WINDOW *a2)
{
  unint64_t v2 = *(void *)(result + 104);
  int v3 = *(_DWORD *)(result + 16) * *(_DWORD *)(result + 12);
  unint64_t v4 = v2 + 28 * v3;
  if (v3 >= 1)
  {
    unint64_t v5 = *(void *)(result + 104);
    do
    {
      if (*(_DWORD *)(v5 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v5 + 8)) {
        break;
      }
      v5 += 28;
    }
    while (v5 < v4);
    if (v5 == v4) {
      unint64_t v5 = *(void *)(result + 104);
    }
    do
    {
      if (*(_DWORD *)(v4 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v4 - 20)) {
        break;
      }
      v4 -= 28;
    }
    while (v4 > v2);
    unint64_t v2 = v5;
  }
  if ((int)(-1227133513 * ((v4 - v2) >> 2)) >= 1)
  {
    wmove(a2, 0, 0);
    return wadd_wchnstr();
  }
  return result;
}

uint64_t sub_22B83D32C(uint64_t a1, WINDOW *a2)
{
  if (a2)
  {
    int v3 = *(__int16 *)a2;
    int v4 = *((__int16 *)a2 + 1);
    int v5 = *((__int16 *)a2 + 2);
    if ((v5 & 0x80000000) == 0)
    {
      int v13 = v3;
      int v14 = *((__int16 *)a2 + 1);
      int v6 = 0;
      int v7 = *((__int16 *)a2 + 3);
      int v8 = v7 + 1;
      unint64_t v9 = *(void *)(a1 + 104);
      do
      {
        unint64_t v10 = v9 + 28 * v8;
        if ((v7 & 0x80000000) == 0)
        {
          unint64_t v10 = v9 + 28 * v8;
          do
          {
            if (*(_DWORD *)(v10 - 24) != 32) {
              break;
            }
            if (*(_DWORD *)(v10 - 20)) {
              break;
            }
            v10 -= 28;
          }
          while (v10 > v9);
        }
        if ((int)(-1227133513 * ((v10 - v9) >> 2)) >= 1)
        {
          wmove(a2, v6, 0);
          wadd_wchnstr();
        }
        v9 += 28 * v8;
      }
      while (v6++ != v5);
      int v3 = v13;
      int v4 = v14;
    }
  }
  else
  {
    int v4 = -1;
    int v3 = -1;
  }

  return wmove(a2, v3, v4);
}

uint64_t sub_22B83D444(uint64_t a1, char a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  int v5 = *(WINDOW **)(v4 + 48);
  if (!v5)
  {
    int v5 = *(WINDOW **)(v4 + 40);
    if (!v5) {
      int v5 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
  }
  int v6 = derwin(v5, *(__int16 *)(a1 + 2), *(__int16 *)(a1 + 4), *(__int16 *)(a1 + 6), *(__int16 *)(a1 + 8));
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  int v7 = v6;
  if (*(unsigned char *)(a1 + 48))
  {
    wbkgdset(v6, *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    int v8 = (int *)(a1 + 40);
  }
  else
  {
    int v8 = (int *)((char *)v5 + 16);
  }
  int v10 = *v8;
  *((_DWORD *)v7 + 29) = BYTE1(v10);
  *((_DWORD *)v7 + 4) = v10;
  werase(v7);
  if ((a2 & 1) == 0)
  {
    int v11 = *(_DWORD *)(a1 + 48);
    if ((v11 & 4) != 0)
    {
      if (*(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
      {
        if ((v11 & 0x200) != 0)
        {
          if ((v11 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4)) {
            goto LABEL_23;
          }
        }
        else if ((v11 & 0x400) != 0)
        {
LABEL_23:
          sub_22B83DA58(a1, v7);
          goto LABEL_21;
        }
      }
      sub_22B83D32C(a1, v7);
    }
LABEL_21:
    *(_WORD *)a1 &= ~2u;
  }
  wsyncup(v7);
  delwin(v7);
  return 0;
}

uint64_t _nc_Synchronize_Options(uint64_t a1, int a2)
{
  if (!a1) {
    return 4294967294;
  }
  __int16 v2 = a2;
  int v4 = *(_DWORD *)(a1 + 48);
  __int16 v5 = v4 ^ a2;
  *(_DWORD *)(a1 + 48) = a2;
  uint64_t v6 = *(void *)(a1 + 80);
  if (!v6 || (*(_WORD *)v6 & 1) == 0) {
    goto LABEL_10;
  }
  if (*(void *)(v6 + 72) == a1)
  {
    *(_DWORD *)(a1 + 48) = v4;
    return 4294967282;
  }
  if (*(unsigned __int16 *)(v6 + 28) != *(unsigned __int16 *)(a1 + 32)) {
    goto LABEL_10;
  }
  if (v5)
  {
    char v7 = (a2 & 1) == 0;
LABEL_34:
    uint64_t v8 = sub_22B83D444(a1, v7);
    if ((v5 & 0x200) == 0) {
      return v8;
    }
    goto LABEL_12;
  }
  if ((a2 & 1) == 0)
  {
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  char v7 = 0;
  uint64_t v8 = 0;
  if ((v5 & 4) != 0) {
    goto LABEL_34;
  }
LABEL_11:
  if ((v5 & 0x200) == 0) {
    return v8;
  }
LABEL_12:
  int v9 = *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2);
  if ((v2 & 0x200) != 0)
  {
    *(_WORD *)a1 &= ~8u;
    if (v9 != 1 || *(_DWORD *)(a1 + 16) != *(__int16 *)(a1 + 4)) {
      return v8;
    }
    goto LABEL_24;
  }
  int v10 = *(_DWORD *)(a1 + 20);
  if (!v10)
  {
    *(_WORD *)a1 |= 8u;
    if (v9 != 1) {
      return v8;
    }
LABEL_24:
    if (*(_WORD *)(a1 + 30))
    {
      int v12 = *(_WORD **)(a1 + 80);
      if (v12)
      {
        if ((*v12 & 1) != 0
          && (*(unsigned char *)(a1 + 48) & 1) != 0
          && *(unsigned __int16 *)(a1 + 32) == (unsigned __int16)v12[14]
          && sub_22B83D444(a1, 0))
        {
          return 0xFFFFFFFFLL;
        }
      }
    }
    return v8;
  }
  if (v9 == 1)
  {
    if (*(_DWORD *)(a1 + 16) >= v10) {
      return v8;
    }
    *(_WORD *)a1 |= 8u;
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 12) < v10) {
    *(_WORD *)a1 |= 8u;
  }
  return v8;
}

uint64_t _nc_Set_Current_Field(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294967294;
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 72);
      if (v5)
      {
        if (*(void *)(a2 + 80) == a1)
        {
          if ((*(_WORD *)a1 & 2) != 0) {
            return 4294967291;
          }
          if (!*(void *)(a1 + 64)) {
            return 4294967285;
          }
          if (v5 == a2 && (*(_WORD *)a1 & 1) != 0)
          {
LABEL_44:
            uint64_t result = 0;
            *(void *)(a1 + 8) = 0;
            *(void *)(a1 + 16) = 0;
            return result;
          }
          if (!*(void *)(a1 + 56)
            || (*(unsigned char *)(v5 + 48) & 1) == 0
            || *(unsigned __int16 *)(*(void *)(v5 + 80) + 28) != *(unsigned __int16 *)(v5 + 32))
          {
LABEL_26:
            int v10 = *(_DWORD *)(a2 + 12);
            if ((*(unsigned char *)(a2 + 48) & 4) != 0
              && (int v11 = *(__int16 *)(a2 + 2), v10 <= v11)
              && (int v12 = *(__int16 *)(a2 + 4), *(_DWORD *)(a2 + 16) <= v12))
            {
              uint64_t v24 = *(WINDOW **)(a1 + 48);
              if (!v24)
              {
                uint64_t v24 = *(WINDOW **)(a1 + 40);
                if (!v24) {
                  uint64_t v24 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
                }
              }
              int v13 = derwin(v24, v11, v12, *(__int16 *)(a2 + 6), *(__int16 *)(a2 + 8));
            }
            else
            {
              int v13 = newpad(v10, *(_DWORD *)(a2 + 16));
            }
            int v14 = v13;
            if (!v13) {
              return 0xFFFFFFFFLL;
            }
            *(void *)(a1 + 72) = a2;
            int v15 = *(WINDOW **)(a1 + 56);
            if (v15) {
              delwin(v15);
            }
            *(void *)(a1 + 56) = v14;
            *(_WORD *)a1 &= ~0x10u;
            wbkgdset(v14, *(_DWORD *)(a2 + 44) | *(_DWORD *)(a2 + 36));
            uint64_t v16 = *(void *)(a1 + 56);
            if (v16)
            {
              int v17 = *(_DWORD *)(a2 + 40);
              *(_DWORD *)(v16 + 116) = BYTE1(v17);
              *(_DWORD *)(v16 + 16) = v17;
            }
            int v18 = *(_DWORD *)(a2 + 48);
            if ((v18 & 4) != 0
              && (int v19 = *(__int16 *)(a2 + 2), *(_DWORD *)(a2 + 12) <= v19)
              && (int v20 = *(_DWORD *)(a2 + 16), v21 = *(__int16 *)(a2 + 4), v20 <= v21))
            {
              if (*(_WORD *)(a2 + 30) && *(_DWORD *)(a2 + 24) + v19 == 1)
              {
                BOOL v25 = (v18 & 0x200) != 0 && v20 == v21;
                BOOL v26 = !v25;
                if ((v18 & 0x400) != 0 || !v26)
                {
                  werase((WINDOW *)v16);
                  sub_22B83D240(a2, *(WINDOW **)(a1 + 56));
                  wsyncup(*(WINDOW **)(a1 + 56));
                }
              }
            }
            else
            {
              werase((WINDOW *)v16);
              sub_22B83D32C(a2, *(WINDOW **)(a1 + 56));
            }
            uint64_t v22 = *(void *)(a1 + 56);
            if (v22) {
              int v23 = *(__int16 *)(v22 + 4) + 1;
            }
            else {
              int v23 = -1;
            }
            wtouchln((WINDOW *)v22, 0, v23, 0);
            goto LABEL_44;
          }
          _nc_Refresh_Current_Field(a1);
          int v6 = *(_DWORD *)(v5 + 48);
          if ((v6 & 4) != 0)
          {
            int v7 = *(__int16 *)(v5 + 2);
            if (*(_DWORD *)(v5 + 12) > v7)
            {
              __int16 v8 = *(_WORD *)v5;
              if (*(_DWORD *)(a1 + 16)) {
                __int16 v9 = v8 | 2;
              }
              else {
                __int16 v9 = v8 & 0xFFFD;
              }
              *(_WORD *)uint64_t v5 = v9;
              goto LABEL_25;
            }
            if (*(_WORD *)(v5 + 30) && *(_DWORD *)(v5 + 24) + v7 == 1)
            {
              if ((v6 & 0x200) != 0)
              {
                if ((v6 & 0x400) == 0 && *(_DWORD *)(v5 + 16) != *(__int16 *)(v5 + 4)) {
                  goto LABEL_25;
                }
              }
              else if ((v6 & 0x400) == 0)
              {
                goto LABEL_25;
              }
              _nc_get_fieldbuffer(a1, (_DWORD *)v5, *(void *)(v5 + 104));
              werase(*(WINDOW **)(a1 + 56));
              sub_22B83DA58(v5, *(WINDOW **)(a1 + 56));
              uint64_t v27 = *(void *)(a1 + 56);
              if ((*(unsigned char *)(v5 + 49) & 4) != 0 && !*(void *)(v27 + 64))
              {
                int v28 = *(WINDOW **)(a1 + 48);
                if (!v28)
                {
                  int v28 = *(WINDOW **)(a1 + 40);
                  if (!v28) {
                    int v28 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
                  }
                }
                copywin((const WINDOW *)v27, v28, 0, 0, *(__int16 *)(v5 + 6), *(__int16 *)(v5 + 8), *(__int16 *)(v5 + 6), *(__int16 *)(v5 + 8) + *(__int16 *)(v5 + 4) - 1, 0);
                uint64_t v27 = *(void *)(a1 + 48);
                if (!v27)
                {
                  uint64_t v27 = *(void *)(a1 + 40);
                  if (!v27) {
                    uint64_t v27 = *(void *)(*MEMORY[0x263F8C610] + 152);
                  }
                }
              }
              wsyncup((WINDOW *)v27);
            }
          }
LABEL_25:
          delwin(*(WINDOW **)(a1 + 56));
          *(void *)(a1 + 56) = 0;
          goto LABEL_26;
        }
      }
    }
  }
  return result;
}

uint64_t sub_22B83DA58(uint64_t result, WINDOW *a2)
{
  unint64_t v2 = *(void *)(result + 104);
  int v3 = *(_DWORD *)(result + 16) * *(_DWORD *)(result + 12);
  unint64_t v4 = v2 + 28 * v3;
  if (v3 >= 1)
  {
    unint64_t v5 = *(void *)(result + 104);
    do
    {
      if (*(_DWORD *)(v5 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v5 + 8)) {
        break;
      }
      v5 += 28;
    }
    while (v5 < v4);
    if (v5 == v4) {
      unint64_t v5 = *(void *)(result + 104);
    }
    do
    {
      if (*(_DWORD *)(v4 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v4 - 20)) {
        break;
      }
      v4 -= 28;
    }
    while (v4 > v2);
    unint64_t v2 = v5;
  }
  int v6 = -1227133513 * ((v4 - v2) >> 2);
  if (v6 >= 1)
  {
    int v7 = *(__int16 *)(result + 4) - v6;
    if (v7 < 0)
    {
      int v10 = 0;
    }
    else
    {
      int v8 = *(__int16 *)(result + 30);
      unsigned int v9 = v7 >> 1;
      if (v8 != 2) {
        unsigned int v9 = 0;
      }
      if (v8 == 3) {
        int v10 = *(__int16 *)(result + 4) - v6;
      }
      else {
        int v10 = v9;
      }
    }
    wmove(a2, 0, v10);
    return wadd_wchnstr();
  }
  return result;
}

uint64_t _nc_Internal_Validation(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  __int16 v3 = *(_WORD *)a1;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = v3 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    __int16 v3 = *(_WORD *)a1;
  }
  if ((v3 & 0x20) != 0 || (*(unsigned char *)(v2 + 49) & 1) == 0)
  {
    uint64_t result = sub_22B83DC04(*(void *)(v2 + 88), v2, *(void **)(v2 + 96));
    if (!result) {
      return result;
    }
    *(_WORD *)a1 &= ~0x20u;
    *(_WORD *)v2 |= 1u;
    sub_22B83DCC4(v2);
  }
  return 1;
}

uint64_t sub_22B83DC04(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    uint64_t v5 = a1;
    while (1)
    {
      if ((*(unsigned char *)(a2 + 48) & 0x80) != 0)
      {
        int v6 = (int *)(*(void *)(a2 + 104) + 8);
        while (1)
        {
          int v7 = *(v6 - 1);
          if (v7 != 32) {
            break;
          }
          int v8 = *v6;
          v6 += 7;
          if (v8) {
            goto LABEL_9;
          }
        }
        if (!v7) {
          break;
        }
      }
LABEL_9:
      if ((*(_WORD *)v5 & 1) == 0)
      {
        unsigned int v9 = *(uint64_t (**)(uint64_t, void *))(v5 + 56);
        if (!v9) {
          return 1;
        }
        return v9(a2, a3);
      }
      if ((sub_22B83DC04(*(void *)(v5 + 16), a2, *a3) & 1) == 0)
      {
        uint64_t v5 = *(void *)(v5 + 24);
        a3 = (void *)a3[1];
        if (v5) {
          continue;
        }
      }
      return 1;
    }
  }
  return 1;
}

uint64_t sub_22B83DCC4(uint64_t a1)
{
  if (!a1) {
    return 4294967294;
  }
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  if (v2 == a1) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    unsigned int v4 = sub_22B83F480(v2);
    if (v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5) {
      uint64_t v3 = v3;
    }
    else {
      uint64_t v3 = v4;
    }
    uint64_t v2 = *(void *)(v2 + 72);
  }
  while (v2 != a1 && v2 != 0);
  return v3;
}

uint64_t _nc_First_Active_Field(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(__int16 *)(a1 + 28);
  unsigned int v4 = (uint64_t *)(v1 + 8 * *(__int16 *)(v2 + 8 * v3 + 2));
  uint64_t v5 = *v4;
  uint64_t v6 = *(void *)(*v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  int v8 = (uint64_t *)(v7 + 8 * *(__int16 *)(*v4 + 34));
  unsigned int v9 = (__int16 *)(*(void *)(v6 + 80) + 8 * *(__int16 *)(v6 + 28));
  int v10 = (uint64_t *)(v7 + 8 * *v9);
  int v11 = (uint64_t *)(v7 + 8 * v9[1]);
  do
  {
    if (v8 == v11) {
      int v8 = v10;
    }
    else {
      ++v8;
    }
    uint64_t result = *v8;
    int v13 = *(_DWORD *)(*v8 + 48) & 3;
  }
  while (*v8 != v5 && v13 != 3);
  if (v13 != 3 && result == v5)
  {
    uint64_t v16 = (uint64_t *)(v1 + 8 * *(__int16 *)(result + 34));
    int v17 = (uint64_t *)(v1 + 8 * *(__int16 *)(v2 + 8 * v3));
    do
    {
      if (v16 == v4) {
        uint64_t v16 = v17;
      }
      else {
        ++v16;
      }
      int v18 = *(_DWORD *)(*v16 + 48) & 1;
    }
    while (result != *v16 && v18 == 0);
    BOOL v20 = *v16 == v5 && v18 == 0;
    uint64_t result = *v16;
    if (v20) {
      return *v17;
    }
  }
  return result;
}

uint64_t _nc_Set_Form_Page(uint64_t a1, int a2, uint64_t a3)
{
  if (*(__int16 *)(a1 + 28) == a2) {
    return 0;
  }
  uint64_t v7 = *(WINDOW **)(a1 + 48);
  if (!v7)
  {
    uint64_t v7 = *(WINDOW **)(a1 + 40);
    if (!v7) {
      uint64_t v7 = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
  }
  werase(v7);
  *(_WORD *)(a1 + 28) = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * a2 + 4));
  uint64_t v9 = v8;
  do
  {
    if ((*(unsigned char *)(v9 + 48) & 1) != 0 && sub_22B83D444(v9, 0)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v9 = *(void *)(v9 + 56);
  }
  while (v9 != v8);
  if (a3)
  {
    return _nc_Set_Current_Field(a1, a3);
  }
  else
  {
    return sub_22B83DF04(a1);
  }
}

uint64_t sub_22B83DF04(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 2));
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v2 + 64);
  unsigned int v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  uint64_t v5 = (__int16 *)(*(void *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  uint64_t v6 = (uint64_t *)(v3 + 8 * *v5);
  uint64_t v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v7) {
      unsigned int v4 = v6;
    }
    else {
      ++v4;
    }
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

int form_driver(FORM *a1, int a2)
{
  if (!a1)
  {
    uint64_t v5 = __error();
    int v4 = -2;
LABEL_55:
    *uint64_t v5 = v4;
    return v4;
  }
  if (!a1->field)
  {
    uint64_t v5 = __error();
    int v4 = -11;
    goto LABEL_55;
  }
  if (a2 != -291056)
  {
    if ((a1->status & 2) != 0)
    {
      uint64_t v5 = __error();
      int v4 = -5;
      goto LABEL_55;
    }
    if ((a1->status & 1) == 0)
    {
      uint64_t v5 = __error();
      int v4 = -7;
      goto LABEL_55;
    }
    uint64_t v6 = (a2 - 512);
    if (v6 <= 0x38)
    {
      unint64_t v7 = *((unsigned int *)&unk_26DF16EB0 + 4 * (a2 - 512));
      if (a2 == (unsigned __int16)v7)
      {
        if (WORD1(v7) > 8u)
        {
          int v4 = -1;
LABEL_54:
          _nc_Refresh_Current_Field((uint64_t)a1);
          uint64_t v5 = __error();
          goto LABEL_55;
        }
        unint64_t v14 = v7 >> 16;
        int v15 = (uint64_t (*)(FORM *))*((void *)&unk_26DF16EB0 + 2 * v6 + 1);
        if ((0x1C4uLL >> v14)) {
          int v16 = v15(a1);
        }
        else {
          int v16 = ((uint64_t (*)(uint64_t (*)(FORM *), FORM *))off_26DF17240[v14])(v15, a1);
        }
LABEL_53:
        int v4 = v16;
        goto LABEL_54;
      }
      goto LABEL_36;
    }
    if (a2 != 409)
    {
      if (a2 <= 0xFF
        && !(a2 > 0x7F
           ? __maskrune(a2, 0x200uLL)
           : *(_DWORD *)(MEMORY[0x263EF8318] + 4 * a2 + 60) & 0x200))
      {
        int v16 = sub_22B83E6CC((uint64_t)a1, a2);
        goto LABEL_53;
      }
LABEL_36:
      int v4 = -8;
      goto LABEL_54;
    }
    memset(&v26, 0, sizeof(v26));
    win = a1->win;
    if (!win) {
      win = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
    if (a1->sub) {
      sub = a1->sub;
    }
    else {
      sub = win;
    }
    getmouse(&v26);
    if ((v26.bstate & 0x1C) != 0 && wenclose(win, v26.y, v26.x))
    {
      int x = v26.x;
      int y = v26.y;
      if (wmouse_trafo((const WINDOW *)*MEMORY[0x263F8C620], &y, &x, 0))
      {
        int v10 = *((__int16 *)sub + 4);
        if (y >= v10)
        {
          if (y <= *((__int16 *)sub + 2) + v10)
          {
            if (wenclose(sub, v26.y, v26.x))
            {
              int x = v26.x;
              int y = v26.y;
              if (wmouse_trafo(sub, &y, &x, 0))
              {
                int v17 = &a1->page[a1->curpage];
                int pmin = v17->pmin;
                int pmax = v17->pmax;
                if (pmin <= pmax)
                {
                  uint64_t v21 = pmin;
                  uint64_t v22 = pmax + 1;
                  while (1)
                  {
                    int v23 = a1->field[v21];
                    if ((~v23->opts & 3) == 0 && !sub_22B83E65C((__int16 *)a1->field[v21], y, x)) {
                      break;
                    }
                    ++v21;
                    int v4 = -12;
                    if (v22 == v21) {
                      goto LABEL_54;
                    }
                  }
                  int v4 = _nc_Set_Current_Field((uint64_t)a1, (uint64_t)v23);
                  if (!v4)
                  {
                    int v4 = _nc_Position_Form_Cursor((uint64_t)a1);
                    if (!v4) {
                      int v4 = (LOBYTE(v26.bstate) << 28 >> 31) & 0xFFFFFFF8;
                    }
                  }
                  goto LABEL_54;
                }
              }
            }
          }
          else
          {
            if ((v26.bstate & 4) != 0)
            {
              int v11 = a1;
              int v12 = 516;
              goto LABEL_52;
            }
            if ((v26.bstate & 8) != 0)
            {
              int v11 = a1;
              int v12 = 512;
              goto LABEL_52;
            }
            if ((v26.bstate & 0x10) != 0)
            {
              int v11 = a1;
              int v12 = 519;
              goto LABEL_52;
            }
          }
        }
        else
        {
          if ((v26.bstate & 4) != 0)
          {
            int v11 = a1;
            int v12 = 517;
            goto LABEL_52;
          }
          if ((v26.bstate & 8) != 0)
          {
            int v11 = a1;
            int v12 = 513;
            goto LABEL_52;
          }
          if ((v26.bstate & 0x10) != 0)
          {
            int v11 = a1;
            int v12 = 518;
LABEL_52:
            int v16 = form_driver(v11, v12);
            goto LABEL_53;
          }
        }
      }
    }
    int v4 = -12;
    goto LABEL_54;
  }
  a1->current = (FIELD *)_nc_First_Active_Field((uint64_t)a1);
  int v4 = 0;
  *__error() = 0;
  return v4;
}

uint64_t sub_22B83E2D8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if (!_nc_Internal_Validation(a2)) {
    return 4294967283;
  }
  if (a2)
  {
    uint64_t v3 = *(void (**)(uint64_t))(a2 + 120);
    if (v3)
    {
      *(_WORD *)a2 |= 2u;
      v3(a2);
      *(_WORD *)a2 &= ~2u;
    }
    int v4 = *(void (**)(uint64_t))(a2 + 104);
    if (v4)
    {
      *(_WORD *)a2 |= 2u;
      v4(a2);
      *(_WORD *)a2 &= ~2u;
    }
    uint64_t v5 = a1(a2);
    uint64_t v6 = *(void (**)(uint64_t))(a2 + 96);
    if (v6)
    {
      *(_WORD *)a2 |= 2u;
      v6(a2);
      *(_WORD *)a2 &= ~2u;
    }
    unint64_t v7 = *(void (**)(uint64_t))(a2 + 112);
    if (v7)
    {
      *(_WORD *)a2 |= 2u;
      v7(a2);
      *(_WORD *)a2 &= ~2u;
    }
    return v5;
  }

  return a1(0);
}

uint64_t sub_22B83E3F8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if (!_nc_Internal_Validation(a2)) {
    return 4294967283;
  }
  if (a2)
  {
    uint64_t v3 = *(void (**)(uint64_t))(a2 + 120);
    if (v3)
    {
      *(_WORD *)a2 |= 2u;
      v3(a2);
      *(_WORD *)a2 &= ~2u;
    }
    uint64_t v4 = a1(a2);
    uint64_t v5 = *(void (**)(uint64_t))(a2 + 112);
    if (v5)
    {
      *(_WORD *)a2 |= 2u;
      v5(a2);
      *(_WORD *)a2 &= ~2u;
    }
    return v4;
  }

  return a1(0);
}

uint64_t sub_22B83E4C8(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if (*(_DWORD *)(*(void *)(a2 + 72) + 24) + *(__int16 *)(*(void *)(a2 + 72) + 2) == 1) {
    return 4294967284;
  }
  uint64_t result = a1(a2);
  if (!result) {
    **(_WORD **)(a2 + 72) |= 2u;
  }
  return result;
}

uint64_t sub_22B83E528(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if (*(_DWORD *)(*(void *)(a2 + 72) + 24) + *(__int16 *)(*(void *)(a2 + 72) + 2) == 1) {
    return a1(a2);
  }
  else {
    return 4294967284;
  }
}

uint64_t sub_22B83E554(uint64_t (*a1)(uint64_t a1), uint64_t a2)
{
  if (a1 == sub_22B840BA4 && (*(unsigned char *)(a2 + 32) & 2) != 0 && !*(_DWORD *)(a2 + 8) && !*(_DWORD *)(a2 + 12))
  {
    uint64_t v4 = sub_22B83F958;
  }
  else
  {
    if (a1 != sub_22B8406DC)
    {
      if ((*(unsigned char *)(*(void *)(a2 + 72) + 48) & 8) == 0) {
        return 4294967284;
      }
      uint64_t result = a1(a2);
      if (!result) {
        *(_WORD *)a2 |= 0x10u;
      }
      return result;
    }
    if ((*(unsigned char *)(a2 + 32) & 1) == 0 || *(_DWORD *)(a2 + 8) || *(_DWORD *)(a2 + 12))
    {
      return sub_22B8406DC(a2);
    }
    uint64_t v4 = sub_22B83F900;
  }

  return sub_22B83E3F8(v4, a2);
}

uint64_t sub_22B83E65C(__int16 *a1, int a2, int a3)
{
  if (a1 && (int v3 = a1[3], v3 <= a2) && a1[1] + v3 > a2 && (v4 = a1[4], v4 <= a3) && a1[2] + v4 > a3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 4294967283;
  }
  *__error() = v5;
  return v5;
}

uint64_t sub_22B83E6CC(uint64_t a1, chtype a2)
{
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = *(_DWORD *)(v2 + 48);
  if ((~v3 & 0xA) != 0) {
    goto LABEL_23;
  }
  if ((v3 & 0x20) != 0 && !*(_DWORD *)(a1 + 8) && !*(_DWORD *)(a1 + 12) && (*(_WORD *)a1 & 0x30) == 0) {
    werase(*(WINDOW **)(a1 + 56));
  }
  uint64_t v6 = *(WINDOW **)(a1 + 56);
  if ((*(_WORD *)a1 & 4) != 0)
  {
    waddch(v6, a2);
  }
  else
  {
    wmove(v6, *(_DWORD *)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 72) + 16) - 1);
    int v7 = winch(*(WINDOW **)(a1 + 56));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    if (v7 != 32 && v7 != *(_DWORD *)(*(void *)(a1 + 72) + 36))
    {
      if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1 || (*(_WORD *)v2 & 8) == 0)
      {
LABEL_23:
        uint64_t v9 = 4294967284;
        goto LABEL_24;
      }
      if (!sub_22B83F09C(v2, 1))
      {
LABEL_32:
        uint64_t v9 = 0xFFFFFFFFLL;
        goto LABEL_24;
      }
    }
    winsch(*(WINDOW **)(a1 + 56), a2);
  }
  uint64_t v9 = sub_22B84147C(a1);
  if (!v9)
  {
    if (*(_DWORD *)(v2 + 12) - 1 == *(_DWORD *)(a1 + 8))
    {
      int v10 = *(_DWORD *)(v2 + 16) - 1;
      int v11 = *(_DWORD *)(a1 + 12);
      *(_WORD *)a1 |= 0x10u;
      if (v10 == v11)
      {
        if ((*(_WORD *)v2 & 8) != 0)
        {
          if (!sub_22B83F09C(v2, 1)) {
            goto LABEL_32;
          }
        }
        else if ((*(unsigned char *)(v2 + 48) & 0x40) != 0)
        {
          uint64_t v9 = sub_22B83E3F8(sub_22B83F900, a1);
          goto LABEL_24;
        }
      }
    }
    else
    {
      *(_WORD *)a1 |= 0x10u;
    }
    if (!*(_DWORD *)(*(void *)(a1 + 56) + 176)) {
      sub_22B83FC8C(a1);
    }
    uint64_t v9 = 0;
  }
LABEL_24:
  *__error() = v9;
  return v9;
}

uint64_t form_driver_w(uint64_t a1, int a2, int a3)
{
  if (!a1)
  {
    uint64_t v5 = __error();
    uint64_t v4 = 4294967294;
LABEL_52:
    *uint64_t v5 = v4;
    return v4;
  }
  if (!*(void *)(a1 + 64))
  {
    uint64_t v5 = __error();
    uint64_t v4 = 4294967285;
    goto LABEL_52;
  }
  if (a3 != -291056)
  {
    if ((*(_WORD *)a1 & 2) != 0)
    {
      uint64_t v5 = __error();
      uint64_t v4 = 4294967291;
      goto LABEL_52;
    }
    if ((*(_WORD *)a1 & 1) == 0)
    {
      uint64_t v5 = __error();
      uint64_t v4 = 4294967289;
      goto LABEL_52;
    }
    if (a2 == 256)
    {
      uint64_t v6 = (a3 - 512);
      if (v6 <= 0x38)
      {
        unint64_t v7 = *((unsigned int *)&unk_26DF16EB0 + 4 * (a3 - 512));
        if (a3 == (unsigned __int16)v7)
        {
          if (WORD1(v7) > 8u)
          {
            uint64_t v4 = 0xFFFFFFFFLL;
LABEL_51:
            _nc_Refresh_Current_Field(a1);
            uint64_t v5 = __error();
            goto LABEL_52;
          }
          unint64_t v13 = v7 >> 16;
          unint64_t v14 = (uint64_t (*)(uint64_t))*((void *)&unk_26DF16EB0 + 2 * v6 + 1);
          if ((0x1C4uLL >> v13)) {
            uint64_t v15 = v14(a1);
          }
          else {
            uint64_t v15 = ((uint64_t (*)(uint64_t (*)(uint64_t), uint64_t))off_26DF17240[v13])(v14, a1);
          }
LABEL_50:
          uint64_t v4 = v15;
          goto LABEL_51;
        }
        goto LABEL_31;
      }
    }
    if (a3 != 409)
    {
      if (!a2)
      {
        uint64_t v15 = sub_22B83EBC4(a1);
        goto LABEL_50;
      }
LABEL_31:
      uint64_t v4 = 4294967288;
      goto LABEL_51;
    }
    memset(&v25, 0, sizeof(v25));
    uint64_t v8 = *(const WINDOW **)(a1 + 40);
    if (!v8) {
      uint64_t v8 = *(const WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
    if (*(void *)(a1 + 48)) {
      uint64_t v9 = *(const WINDOW **)(a1 + 48);
    }
    else {
      uint64_t v9 = v8;
    }
    getmouse(&v25);
    if ((v25.bstate & 0x1C) != 0 && wenclose(v8, v25.y, v25.x))
    {
      int x = v25.x;
      int y = v25.y;
      if (wmouse_trafo((const WINDOW *)*MEMORY[0x263F8C620], &y, &x, 0))
      {
        int v10 = *((__int16 *)v9 + 4);
        if (y >= v10)
        {
          if (y <= *((__int16 *)v9 + 2) + v10)
          {
            if (wenclose(v9, v25.y, v25.x))
            {
              int x = v25.x;
              int y = v25.y;
              if (wmouse_trafo(v9, &y, &x, 0))
              {
                int v16 = (__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28));
                int v17 = *v16;
                int v18 = v16[1];
                if (v17 <= v18)
                {
                  uint64_t v20 = v17;
                  uint64_t v21 = v18 + 1;
                  while (1)
                  {
                    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8 * v20);
                    if ((~*(_DWORD *)(v22 + 48) & 3) == 0
                      && !sub_22B83E65C(*(__int16 **)(*(void *)(a1 + 64) + 8 * v20), y, x))
                    {
                      break;
                    }
                    ++v20;
                    uint64_t v4 = 4294967284;
                    if (v21 == v20) {
                      goto LABEL_51;
                    }
                  }
                  uint64_t v4 = _nc_Set_Current_Field(a1, v22);
                  if (!v4)
                  {
                    uint64_t v4 = _nc_Position_Form_Cursor(a1);
                    if (!v4) {
                      uint64_t v4 = (LOBYTE(v25.bstate) << 28 >> 31) & 0xFFFFFFF8;
                    }
                  }
                  goto LABEL_51;
                }
              }
            }
          }
          else
          {
            if ((v25.bstate & 4) != 0)
            {
              int v11 = (FORM *)a1;
              int v12 = 516;
              goto LABEL_49;
            }
            if ((v25.bstate & 8) != 0)
            {
              int v11 = (FORM *)a1;
              int v12 = 512;
              goto LABEL_49;
            }
            if ((v25.bstate & 0x10) != 0)
            {
              int v11 = (FORM *)a1;
              int v12 = 519;
              goto LABEL_49;
            }
          }
        }
        else
        {
          if ((v25.bstate & 4) != 0)
          {
            int v11 = (FORM *)a1;
            int v12 = 517;
            goto LABEL_49;
          }
          if ((v25.bstate & 8) != 0)
          {
            int v11 = (FORM *)a1;
            int v12 = 513;
            goto LABEL_49;
          }
          if ((v25.bstate & 0x10) != 0)
          {
            int v11 = (FORM *)a1;
            int v12 = 518;
LABEL_49:
            uint64_t v15 = form_driver(v11, v12);
            goto LABEL_50;
          }
        }
      }
    }
    uint64_t v4 = 4294967284;
    goto LABEL_51;
  }
  *(void *)(a1 + 72) = _nc_First_Active_Field(a1);
  uint64_t v4 = 0;
  *__error() = 0;
  return v4;
}

uint64_t sub_22B83EBC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  if ((~*(_DWORD *)(v1 + 48) & 0xA) != 0) {
    goto LABEL_12;
  }
  setcchar();
  if ((*(unsigned char *)(v1 + 48) & 0x20) != 0 && !*(_DWORD *)(a1 + 8) && !*(_DWORD *)(a1 + 12) && (*(_WORD *)a1 & 0x30) == 0) {
    werase(*(WINDOW **)(a1 + 56));
  }
  if ((*(_WORD *)a1 & 4) != 0)
  {
    wadd_wch();
  }
  else
  {
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 72) + 16) - 1);
    int v3 = winch(*(WINDOW **)(a1 + 56));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    if (v3 != 32 && v3 != *(_DWORD *)(*(void *)(a1 + 72) + 36))
    {
      if (*(_DWORD *)(v1 + 24) + *(__int16 *)(v1 + 2) != 1 || (*(_WORD *)v1 & 8) == 0)
      {
LABEL_12:
        uint64_t v4 = 4294967284;
        goto LABEL_26;
      }
      if (!sub_22B83F09C(v1, 1)) {
        goto LABEL_28;
      }
    }
    wins_wch();
  }
  uint64_t v4 = sub_22B84147C(a1);
  if (v4) {
    goto LABEL_26;
  }
  if (*(_DWORD *)(v1 + 12) - 1 == *(_DWORD *)(a1 + 8))
  {
    int v5 = *(_DWORD *)(v1 + 16) - 1;
    int v6 = *(_DWORD *)(a1 + 12);
    *(_WORD *)a1 |= 0x10u;
    if (v5 == v6)
    {
      if ((*(_WORD *)v1 & 8) == 0)
      {
        if ((*(unsigned char *)(v1 + 48) & 0x40) != 0)
        {
          uint64_t v4 = sub_22B83E3F8(sub_22B83F900, a1);
          goto LABEL_26;
        }
        goto LABEL_23;
      }
      if (!sub_22B83F09C(v1, 1))
      {
LABEL_28:
        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_26;
      }
    }
  }
  else
  {
    *(_WORD *)a1 |= 0x10u;
  }
LABEL_23:
  if (!*(_DWORD *)(*(void *)(a1 + 56) + 176)) {
    sub_22B83FC8C(a1);
  }
  uint64_t v4 = 0;
LABEL_26:
  *__error() = v4;
  return v4;
}

int set_field_buffer(FIELD *a1, int a2, const char *a3)
{
  int v3 = -2;
  if (a2 < 0 || !a1 || !a3 || a1->nbuf < a2) {
    goto LABEL_38;
  }
  int v7 = a1->dcols * a1->drows;
  if ((a1->status & 8) != 0)
  {
    int v8 = strlen(a3);
    if (v8 > v7)
    {
      if (!sub_22B83F09C((uint64_t)a1, (v8 - v7) / ((a1->nrow + a1->rows) * a1->cols) + 1))
      {
LABEL_31:
        int v3 = -1;
        goto LABEL_38;
      }
      int v7 = a1->dcols * a1->drows;
    }
  }
  int v9 = wresize(*(WINDOW **)&a1[1].fcol, 1, v7 + 1);
  int v10 = *(WINDOW **)&a1[1].fcol;
  if (v9 == -1)
  {
    delwin(v10);
    int v10 = newpad(1, a1->dcols * a1->drows + 1);
    *(void *)&a1[1].fcol = v10;
  }
  uint64_t v11 = (a1->dcols * a1->drows);
  wclear(v10);
  if (wmove(*(WINDOW **)&a1[1].fcol, 0, 0) != -1) {
    waddnstr(*(WINDOW **)&a1[1].fcol, a3, -1);
  }
  int v12 = (char *)calloc((int)v11 + 1, 0x1CuLL);
  if (!v12) {
    goto LABEL_31;
  }
  unint64_t v13 = v12;
  if (a1->drows >= 1)
  {
    int v14 = 0;
    do
    {
      if (wmove(*(WINDOW **)&a1[1].fcol, 0, a1->dcols * v14) != -1) {
        win_wchnstr();
      }
      ++v14;
    }
    while (v14 < a1->drows);
  }
  if ((int)v11 >= 1)
  {
    uint64_t v15 = (_DWORD *)((uint64_t (*)(void))*MEMORY[0x263F8C618])();
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      int v19 = &v13[v17];
      if (!*(_DWORD *)&v13[v17]
        && !*((_DWORD *)v19 + 1)
        && !*(_DWORD *)&v13[v17 + 8]
        && !*(void *)&v13[v17 + 12]
        && !*(_DWORD *)&v13[v17 + 20]
        && (*v15 < 0x60000u || !*(_DWORD *)&v13[v17 + 24]))
      {
        break;
      }
      uint64_t v20 = (_OWORD *)(v16 + v17);
      long long v21 = *(_OWORD *)v19;
      *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)(v19 + 12);
      *uint64_t v20 = v21;
      ++v18;
      v17 += 28;
      if (28 * v11 == v17) {
        goto LABEL_29;
      }
    }
    if ((int)v11 > (int)v18)
    {
      uint64_t v26 = v11 - v18;
      uint64_t v27 = (long long *)(v16 + v17);
      do
      {
        long long v28 = xmmword_26840B060;
        *(long long *)((char *)v27 + 12) = *(long long *)((char *)&xmmword_26840B060 + 12);
        *uint64_t v27 = v28;
        uint64_t v27 = (long long *)((char *)v27 + 28);
        --v26;
      }
      while (v26);
    }
  }
LABEL_29:
  free(v13);
  if (a2)
  {
    int v3 = 0;
  }
  else
  {
    int v22 = sub_22B83F480((uint64_t)a1);
    int v23 = sub_22B83DCC4((uint64_t)a1);
    if (v23) {
      BOOL v24 = v22 == 0;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24) {
      int v3 = v23;
    }
    else {
      int v3 = v22;
    }
  }
LABEL_38:
  *__error() = v3;
  return v3;
}

uint64_t sub_22B83F09C(uint64_t a1, int a2)
{
  if (!a1 || (*(_WORD *)a1 & 8) == 0) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2);
  int v51 = *(_DWORD *)(a1 + 16);
  int v52 = *(_DWORD *)(a1 + 12);
  int v7 = *(long long **)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 80);
  if (v8 && (__int16 v9 = *(_WORD *)v8, (*(_WORD *)v8 & 1) != 0) && *(void *)(v8 + 72) == a1)
  {
    if ((v9 & 0x10) != 0)
    {
      *(_WORD *)uint64_t v8 = v9 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(v8, (_DWORD *)a1, (uint64_t)v7);
      wmove(*(WINDOW **)(v8 + 56), *(_DWORD *)(v8 + 8), *(_DWORD *)(v8 + 12));
    }
    char v10 = 0;
  }
  else
  {
    char v10 = 1;
  }
  if (v6 == 1)
  {
    int v11 = *(__int16 *)(a1 + 4) * a2;
    int v12 = *(_DWORD *)(a1 + 16);
    int v13 = *(_DWORD *)(a1 + 20);
    int v14 = v13 - v12;
    if (v13 - v12 >= v11) {
      int v14 = *(__int16 *)(a1 + 4) * a2;
    }
    if (v13) {
      int v11 = v14;
    }
    int v15 = v12 + v11;
    *(_DWORD *)(a1 + 16) = v15;
  }
  else
  {
    int v13 = *(_DWORD *)(a1 + 20);
    int v16 = (*(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2)) * a2;
    int v17 = *(_DWORD *)(a1 + 12);
    int v18 = v13 - v17;
    if (v13 - v17 >= v16) {
      int v18 = (*(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2)) * a2;
    }
    if (v13) {
      int v16 = v18;
    }
    int v15 = v17 + v16;
    *(_DWORD *)(a1 + 12) = v15;
  }
  if (v15 == v13) {
    *(_WORD *)a1 &= ~8u;
  }
  uint64_t v19 = *(int *)(a1 + 16) * (uint64_t)*(int *)(a1 + 12);
  uint64_t v20 = v19 + 1;
  uint64_t v21 = *(__int16 *)(a1 + 28);
  int v22 = malloc(28 * (v20 + v20 * v21));
  if (!v22)
  {
    *(_DWORD *)(a1 + 12) = v52;
    *(_DWORD *)(a1 + 16) = v51;
    if (v6 == 1)
    {
      if (v51 != v13) {
        goto LABEL_55;
      }
    }
    else if (v52 != v13)
    {
LABEL_55:
      BOOL v3 = 0;
      *(_WORD *)a1 |= 8u;
      return v3;
    }
    return 0;
  }
  int v23 = v22;
  *(void *)(a1 + 104) = v22;
  if ((v21 & 0x80000000) == 0)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    int v26 = v51 * v52;
    uint64_t v27 = v7;
    do
    {
      uint64_t v28 = *(void *)(a1 + 104);
      uint64_t v29 = *(int *)(a1 + 16) * (uint64_t)*(int *)(a1 + 12) + 1;
      if (v26 < 1)
      {
        int v34 = 0;
      }
      else
      {
        uint64_t v30 = (_OWORD *)(v28 + v24 * v29);
        uint64_t v31 = (v51 * v52);
        uint64_t v32 = v27;
        do
        {
          long long v33 = *v32;
          *(_OWORD *)((char *)v30 + 12) = *(long long *)((char *)v32 + 12);
          *uint64_t v30 = v33;
          uint64_t v30 = (_OWORD *)((char *)v30 + 28);
          uint64_t v32 = (long long *)((char *)v32 + 28);
          --v31;
        }
        while (v31);
        int v34 = v51 * v52;
      }
      if (v34 < (int)v19)
      {
        v35 = (long long *)(v28 + 28 * (v26 & ~(v26 >> 31)) + v24 * v29);
        unint64_t v36 = v19 - (unint64_t)(v26 & ~(v26 >> 31));
        do
        {
          long long v37 = xmmword_26840B060;
          *(long long *)((char *)v35 + 12) = *(long long *)((char *)&xmmword_26840B060 + 12);
          long long *v35 = v37;
          v35 = (long long *)((char *)v35 + 28);
          --v36;
        }
        while (v36);
      }
      uint64_t v38 = v28 + 28 * v25 * v29 + 28 * (int)v19;
      *(void *)uint64_t v38 = 0;
      *(void *)(v38 + 8) = 0;
      *(_DWORD *)(v38 + 24) = 0;
      *(void *)(v38 + 16) = 0;
      uint64_t v27 = (long long *)((char *)v27 + 28 * v26 + 28);
      v24 += 28;
    }
    while (v25++ < *(__int16 *)(a1 + 28));
    LODWORD(v20) = *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 12) + 1;
  }
  int v40 = wresize(*(WINDOW **)(a1 + 128), 1, v20);
  BOOL v3 = v40 != -1;
  if (v40 == -1) {
    char v41 = 1;
  }
  else {
    char v41 = v10;
  }
  if (v41)
  {
    if (v40 == -1)
    {
LABEL_51:
      *(_DWORD *)(a1 + 12) = v52;
      *(_DWORD *)(a1 + 16) = v51;
      *(void *)(a1 + 104) = v7;
      int v49 = *(_DWORD *)(a1 + 20);
      if (v6 == 1)
      {
        if (v51 == v49) {
          goto LABEL_61;
        }
      }
      else if (v52 == v49)
      {
LABEL_61:
        free(v23);
        return 0;
      }
      *(_WORD *)a1 |= 8u;
      goto LABEL_61;
    }
  }
  else
  {
    v42 = newpad(*(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 16));
    if (!v42) {
      goto LABEL_51;
    }
    v43 = v42;
    v44 = *(WINDOW **)(v8 + 56);
    if (v44) {
      delwin(v44);
    }
    *(void *)(v8 + 56) = v43;
    wbkgdset(v43, *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    uint64_t v45 = *(void *)(v8 + 56);
    if (v45)
    {
      int v46 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v45 + 116) = BYTE1(v46);
      *(_DWORD *)(v45 + 16) = v46;
    }
    werase((WINDOW *)v45);
    sub_22B83D32C(a1, *(WINDOW **)(v8 + 56));
    uint64_t v47 = *(void *)(v8 + 56);
    if (v47) {
      int v48 = *(__int16 *)(v47 + 4) + 1;
    }
    else {
      int v48 = -1;
    }
    wtouchln((WINDOW *)v47, 0, v48, 0);
    wmove(*(WINDOW **)(v8 + 56), *(_DWORD *)(v8 + 8), *(_DWORD *)(v8 + 12));
  }
  free(v7);
  v50 = *(void **)(a1 + 72);
  if (v50 == (void *)a1) {
    return 1;
  }
  do
  {
    v50[13] = *(void *)(a1 + 104);
    *(void *)((char *)v50 + 12) = *(void *)(a1 + 12);
    v50 = (void *)v50[9];
  }
  while (v50 != (void *)a1);
  return v3;
}

uint64_t sub_22B83F480(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 80);
    if (!v2
      || (*(_WORD *)v2 & 1) == 0
      || (*(unsigned char *)(a1 + 48) & 1) == 0
      || *(unsigned __int16 *)(a1 + 32) != *(unsigned __int16 *)(v2 + 28))
    {
      uint64_t result = 0;
      goto LABEL_9;
    }
    if (*(void *)(v2 + 72) != a1)
    {
      uint64_t result = sub_22B83D444(a1, 0);
LABEL_9:
      *(_WORD *)a1 |= 1u;
      return result;
    }
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    werase(*(WINDOW **)(v2 + 56));
    int v4 = *(_DWORD *)(a1 + 48);
    if ((v4 & 4) != 0 && *(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
    {
      if ((v4 & 0x200) != 0)
      {
        if ((v4 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4)) {
          goto LABEL_21;
        }
      }
      else if ((v4 & 0x400) != 0)
      {
LABEL_21:
        sub_22B83D240(a1, *(WINDOW **)(v2 + 56));
        goto LABEL_20;
      }
    }
    sub_22B83D32C(a1, *(WINDOW **)(v2 + 56));
LABEL_20:
    *(_WORD *)a1 |= 2u;
    uint64_t result = _nc_Refresh_Current_Field(v2);
    goto LABEL_9;
  }
  return 4294967294;
}

char *__cdecl field_buffer(const FIELD *a1, int a2)
{
  uint64_t v2 = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (a1->nbuf >= a2)
    {
      buf = a1->buf;
      uint64_t v6 = (a1->dcols * a1->drows);
      int v7 = a2 + a2 * v6;
      if ((int)v6 < 1)
      {
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = 0;
        __int16 v9 = (_DWORD *)buf + 7 * v7 + 1;
        uint64_t v10 = (a1->dcols * a1->drows);
        do
        {
          if ((*(v9 - 1) & 0xFEu) - 2 >= 0x1E && *v9) {
            v8 += _nc_wcrtomb();
          }
          v9 += 7;
          --v10;
        }
        while (v10);
      }
      uint64_t v11 = *(void *)&a1[1].status;
      int v12 = *(void **)(v11 + 8 * a2);
      if (v12)
      {
        free(v12);
        uint64_t v11 = *(void *)&a1[1].status;
      }
      *(void *)(v11 + 8 * a2) = malloc(v8 + 1);
      uint64_t v2 = *(char **)(*(void *)&a1[1].status + 8 * a2);
      if (v2)
      {
        wclear(*(WINDOW **)&a1[1].fcol);
        wmove(*(WINDOW **)&a1[1].fcol, 0, 0);
        if ((int)v6 >= 1)
        {
          int v13 = (_DWORD *)buf + 7 * v7;
          do
          {
            if ((*v13 & 0xFEu) - 2 >= 0x1E && v13[1]) {
              wadd_wch();
            }
            v13 += 7;
            --v6;
          }
          while (v6);
        }
        wmove(*(WINDOW **)&a1[1].fcol, 0, 0);
        winnstr(*(WINDOW **)&a1[1].fcol, v2, v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

_DWORD *_nc_Widen_String(const char *a1, unsigned int *a2)
{
  __int32 v18 = 0;
  size_t v3 = strlen(a1);
  int v17 = 0;
  char v4 = 1;
  while (v3)
  {
    size_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      while (v3 == v5)
      {
LABEL_8:
        if ((v4 & 1) == 0)
        {
          v17[v6] = a1[v5];
          uint64_t v13 = 1;
          goto LABEL_15;
        }
        ++v5;
        ++v6;
        if (v5 >= v3) {
          goto LABEL_17;
        }
      }
      int v7 = &a1[v5];
      size_t v8 = 1;
      while (1)
      {
        char v9 = v7[v8];
        v7[v8] = 0;
        int v10 = mblen(0, 0);
        *__error() = v10;
        int v11 = mbtowc(0, 0, 0);
        *__error() = v11;
        int v12 = mbtowc(&v18, &a1[v5], v8);
        v7[v8] = v9;
        if (v12 >= 1) {
          break;
        }
        if (++v8 > v3 - v5) {
          goto LABEL_8;
        }
      }
      if ((v4 & 1) == 0) {
        v17[v6] = v18;
      }
      uint64_t v13 = v12;
LABEL_15:
      v5 += v13;
      ++v6;
    }
    while (v5 < v3);
    if ((v4 & 1) == 0) {
      return v17;
    }
LABEL_17:
    if (!v6) {
      return v17;
    }
    int v14 = calloc(v6, 4uLL);
    char v4 = 0;
    *a2 = v6;
    int v17 = v14;
    if (!v14) {
      return 0;
    }
  }
  return v17;
}

uint64_t sub_22B83F8AC(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, (*(__int16 *)(a1 + 28) + 1) % *(__int16 *)(a1 + 26), 0);
}

uint64_t sub_22B83F8C8(uint64_t a1)
{
  __int16 v1 = *(_WORD *)(a1 + 28);
  if (!v1) {
    __int16 v1 = *(_WORD *)(a1 + 26);
  }
  return _nc_Set_Form_Page(a1, v1 - 1, 0);
}

uint64_t sub_22B83F8E4(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, 0, 0);
}

uint64_t sub_22B83F8F0(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, *(__int16 *)(a1 + 26) - 1, 0);
}

uint64_t sub_22B83F900(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v2 + 64);
  char v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  size_t v5 = (__int16 *)(*(void *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  unsigned int v6 = (uint64_t *)(v3 + 8 * *v5);
  int v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v7) {
      char v4 = v6;
    }
    else {
      ++v4;
    }
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_22B83F958(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v2 + 64);
  char v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  size_t v5 = (__int16 *)(*(void *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  unsigned int v6 = (uint64_t *)(v3 + 8 * *v5);
  int v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v6) {
      char v4 = v7;
    }
    else {
      --v4;
    }
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_22B83F9B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28)));
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v2 + 64);
  char v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  size_t v5 = (__int16 *)(*(void *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  unsigned int v6 = (uint64_t *)(v3 + 8 * *v5);
  int v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v6) {
      char v4 = v7;
    }
    else {
      --v4;
    }
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_22B83FA1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  do
    uint64_t v1 = *(void *)(v1 + 56);
  while (v1 != *(void *)(a1 + 72) && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_22B83FA40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  do
    uint64_t v1 = *(void *)(v1 + 64);
  while (v1 != *(void *)(a1 + 72) && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_22B83FA64(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 6));
  do
    uint64_t v1 = *(void *)(v1 + 56);
  while (v1 != *(void *)(*(void *)(a1 + 64)
                          + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 6))
       && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_22B83FA9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 64) + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 4));
  do
    uint64_t v1 = *(void *)(v1 + 64);
  while (v1 != *(void *)(*(void *)(a1 + 64)
                          + 8 * *(__int16 *)(*(void *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 4))
       && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_22B83FAD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  int v2 = *(unsigned __int16 *)(v1 + 6);
  uint64_t v3 = v1;
  while (1)
  {
    uint64_t v3 = *(void *)(v3 + 64);
    if (v3 == v1 || (*(_DWORD *)(v3 + 48) & 3) == 3)
    {
      uint64_t v1 = v3;
      if (*(unsigned __int16 *)(v3 + 6) == v2) {
        break;
      }
    }
  }
  return _nc_Set_Current_Field(a1, v3);
}

uint64_t sub_22B83FB0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  int v2 = *(unsigned __int16 *)(v1 + 6);
  uint64_t v3 = v1;
  while (1)
  {
    uint64_t v3 = *(void *)(v3 + 56);
    if (v3 == v1 || (*(_DWORD *)(v3 + 48) & 3) == 3)
    {
      uint64_t v1 = v3;
      if (*(unsigned __int16 *)(v3 + 6) == v2) {
        break;
      }
    }
  }
  return _nc_Set_Current_Field(a1, v3);
}

uint64_t sub_22B83FB44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  int v2 = *(unsigned __int16 *)(v1 + 6);
  int v3 = *(unsigned __int16 *)(v1 + 8);
  uint64_t v4 = v1;
  while (1)
  {
    do
      uint64_t v4 = *(void *)(v4 + 64);
    while (v4 != v1 && (*(_DWORD *)(v4 + 48) & 3) != 3);
    int v6 = *(unsigned __int16 *)(v4 + 6);
    if (v6 != v2) {
      break;
    }
    uint64_t v1 = v4;
    if (*(unsigned __int16 *)(v4 + 8) == v3) {
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  while (*(__int16 *)(v4 + 8) > (__int16)v3)
  {
    uint64_t v7 = v4;
    do
      uint64_t v7 = *(void *)(v7 + 64);
    while (v7 != v4 && (*(_DWORD *)(v7 + 48) & 3) != 3);
    uint64_t v4 = v7;
    if (*(unsigned __int16 *)(v7 + 6) != v6)
    {
      uint64_t v4 = v7;
      do
        uint64_t v4 = *(void *)(v4 + 56);
      while (v4 != v7 && (*(_DWORD *)(v4 + 48) & 3) != 3);
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  return _nc_Set_Current_Field(a1, v4);
}

uint64_t sub_22B83FBE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  int v2 = *(unsigned __int16 *)(v1 + 6);
  int v3 = *(unsigned __int16 *)(v1 + 8);
  uint64_t v4 = v1;
  while (1)
  {
    do
      uint64_t v4 = *(void *)(v4 + 56);
    while (v4 != v1 && (*(_DWORD *)(v4 + 48) & 3) != 3);
    int v6 = *(unsigned __int16 *)(v4 + 6);
    if (v6 != v2) {
      break;
    }
    uint64_t v1 = v4;
    if (*(unsigned __int16 *)(v4 + 8) == v3) {
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  while (*(__int16 *)(v4 + 8) < (__int16)v3)
  {
    uint64_t v7 = v4;
    do
      uint64_t v7 = *(void *)(v7 + 56);
    while (v7 != v4 && (*(_DWORD *)(v7 + 48) & 3) != 3);
    uint64_t v4 = v7;
    if (*(unsigned __int16 *)(v7 + 6) != v6)
    {
      uint64_t v4 = v7;
      do
        uint64_t v4 = *(void *)(v4 + 64);
      while (v4 != v7 && (*(_DWORD *)(v4 + 48) & 3) != 3);
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  return _nc_Set_Current_Field(a1, v4);
}

uint64_t sub_22B83FC8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = sub_22B84136C(*(void *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  int v4 = *(_DWORD *)(a1 + 12) + v3;
  *(_DWORD *)(a1 + 12) = v4;
  if (v4 != *(_DWORD *)(v2 + 16)) {
    return 0;
  }
  int v5 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v5 + 1;
  if (v5 + 1 == *(_DWORD *)(v2 + 12))
  {
    int v6 = v3;
    int v7 = *(__int16 *)(v2 + 2);
    int v8 = *(_DWORD *)(v2 + 24);
    if (v8 + v7 != 1)
    {
      if (sub_22B83F09C(v2, 1)) {
        goto LABEL_5;
      }
      int v7 = *(__int16 *)(v2 + 2);
      int v8 = *(_DWORD *)(v2 + 24);
      int v5 = *(_DWORD *)(a1 + 8) - 1;
    }
    *(_DWORD *)(a1 + 8) = v5;
    if (v8 + v7 != 1 || (sub_22B83F09C(v2, 1) & 1) == 0)
    {
      int v9 = *(_DWORD *)(a1 + 12) - v6;
      uint64_t result = 4294967284;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_5:
  int v9 = 0;
  uint64_t result = 0;
LABEL_11:
  *(_DWORD *)(a1 + 12) = v9;
  return result;
}

uint64_t sub_22B83FD70(uint64_t a1)
{
  int v2 = sub_22B84136C(*(void *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12) - 1);
  int v3 = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(a1 + 12) = v3 - v2;
  if (v3 - v2 >= 0) {
    return 0;
  }
  int v5 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v5 - 1;
  if (v5 <= 0)
  {
    *(_DWORD *)(a1 + 8) = v5;
    uint64_t result = 4294967284;
  }
  else
  {
    uint64_t result = 0;
    int v3 = *(_DWORD *)(*(void *)(a1 + 72) + 16) - 1;
  }
  *(_DWORD *)(a1 + 12) = v3;
  return result;
}

uint64_t sub_22B83FDEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v3 + 1;
  if (v3 + 1 == *(_DWORD *)(v2 + 12))
  {
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1)
    {
      if (sub_22B83F09C(v2, 1)) {
        return 0;
      }
      int v3 = *(_DWORD *)(a1 + 8) - 1;
    }
    *(_DWORD *)(a1 + 8) = v3;
    return 4294967284;
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 12) = 0;
  }
  return result;
}

uint64_t sub_22B83FE6C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v1 - 1;
  if (v1 <= 0)
  {
    *(_DWORD *)(a1 + 8) = v1;
    return 4294967284;
  }
  else
  {
    uint64_t v2 = 0;
    *(_DWORD *)(a1 + 12) = 0;
  }
  return v2;
}

uint64_t sub_22B83FE9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(v2 + 104);
  int v4 = *(_DWORD *)(v2 + 16);
  uint64_t v5 = v3 + 28 * *(_DWORD *)(a1 + 8) * v4 + 28 * *(int *)(a1 + 12);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    int v4 = *(_DWORD *)(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 104);
  }
  int v6 = v4 * *(_DWORD *)(v2 + 12);
  int v7 = v6 + 1227133513 * ((unint64_t)(v5 - v3) >> 2);
  unint64_t v8 = v5 + 28 * v7;
  if (v7 < 1)
  {
    unint64_t v9 = v5;
  }
  else
  {
    unint64_t v9 = v5;
    do
    {
      if (*(_DWORD *)(v9 + 4) == 32 && !*(_DWORD *)(v9 + 8)) {
        break;
      }
      v9 += 28;
    }
    while (v9 < v8);
  }
  if (v9 == v8) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = v9;
  }
  int v11 = v6 + 1227133513 * ((unint64_t)(v10 - v3) >> 2);
  unint64_t v12 = v10 + 28 * v11;
  if (v11 < 1)
  {
    unint64_t v13 = v10;
  }
  else
  {
    unint64_t v13 = v10;
    do
    {
      if (*(_DWORD *)(v13 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v13 + 8)) {
        break;
      }
      v13 += 28;
    }
    while (v13 < v12);
  }
  if (v13 == v12) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = v13;
  }
  uint64_t v15 = *(void *)(a1 + 72);
  int v16 = -1227133513 * ((unint64_t)(v14 - *(void *)(v15 + 104)) >> 2);
  int v17 = *(_DWORD *)(v15 + 12);
  int v18 = v16 / *(_DWORD *)(v15 + 16);
  int v19 = v16 - v18 * *(__int16 *)(v15 + 4);
  *(_DWORD *)(a1 + 8) = v18;
  *(_DWORD *)(a1 + 12) = v19;
  if (v17 < v18) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B840008(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  unint64_t v3 = *(void *)(v2 + 104);
  uint64_t v4 = v3 + 28 * *(_DWORD *)(a1 + 8) * *(_DWORD *)(v2 + 16) + 28 * *(int *)(a1 + 12);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    unint64_t v3 = *(void *)(v2 + 104);
  }
  uint64_t v5 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v4 - v3) >> 2);
  unint64_t v6 = v3 + 28 * (int)v5;
  if ((int)v5 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v6 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v6 - 20)) {
        break;
      }
      v6 -= 28;
    }
    while (v6 > v3);
  }
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v3) >> 2);
  unint64_t v8 = v3 + 28 * (int)v7;
  if ((int)v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20)) {
        break;
      }
      v8 -= 28;
    }
    while (v8 > v3);
  }
  if (v6 == v4)
  {
    int v9 = -1227133513 * ((uint64_t)(v8 - v3) >> 2);
    unint64_t v10 = v3 + 28 * v9;
    if (v9 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v10 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v10 - 20)) {
          break;
        }
        v10 -= 28;
      }
      while (v10 > v3);
    }
    uint64_t v11 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v3) >> 2);
    unint64_t v8 = v3 + 28 * (int)v11;
    if ((int)v11 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20)) {
          break;
        }
        v8 -= 28;
      }
      while (v8 > v3);
    }
  }
  uint64_t v12 = *(void *)(a1 + 72);
  int v13 = -1227133513 * ((v8 - *(void *)(v12 + 104)) >> 2);
  int v14 = *(_DWORD *)(v12 + 12);
  int v15 = v13 / *(_DWORD *)(v12 + 16);
  int v16 = v13 - v15 * *(__int16 *)(v12 + 4);
  *(_DWORD *)(a1 + 8) = v15;
  *(_DWORD *)(a1 + 12) = v16;
  if (v14 < v15) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B8401D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  unint64_t v3 = *(void *)(v2 + 104);
  int v4 = *(_DWORD *)(v2 + 16) * *(_DWORD *)(v2 + 12);
  unint64_t v5 = v3 + 28 * v4;
  if (v4 < 1)
  {
    unint64_t v6 = *(void *)(v2 + 104);
  }
  else
  {
    unint64_t v6 = *(void *)(v2 + 104);
    do
    {
      if (*(_DWORD *)(v6 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v6 + 8)) {
        break;
      }
      v6 += 28;
    }
    while (v6 < v5);
  }
  if (v6 != v5) {
    unint64_t v3 = v6;
  }
  uint64_t v7 = *(void *)(a1 + 72);
  int v8 = -1227133513 * ((v3 - *(void *)(v7 + 104)) >> 2);
  int v9 = *(_DWORD *)(v7 + 12);
  int v10 = v8 / *(_DWORD *)(v7 + 16);
  int v11 = v8 - v10 * *(__int16 *)(v7 + 4);
  *(_DWORD *)(a1 + 8) = v10;
  *(_DWORD *)(a1 + 12) = v11;
  if (v9 < v10) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B8402B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  unint64_t v3 = *(void *)(v2 + 104);
  int v4 = *(_DWORD *)(v2 + 16) * *(_DWORD *)(v2 + 12);
  unint64_t v5 = v3 + 28 * v4;
  if (v4 < 1)
  {
    unint64_t v6 = v3 + 28 * v4;
  }
  else
  {
    unint64_t v6 = v3 + 28 * v4;
    do
    {
      if (*(_DWORD *)(v6 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v6 - 20)) {
        break;
      }
      v6 -= 28;
    }
    while (v6 > v3);
  }
  if (v6 == v5) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v6 + 28 * v7;
  uint64_t v9 = *(void *)(a1 + 72);
  LODWORD(v8) = -1227133513 * ((v8 - *(void *)(v9 + 104)) >> 2);
  int v10 = *(_DWORD *)(v9 + 12);
  int v11 = (int)v8 / *(_DWORD *)(v9 + 16);
  LODWORD(v8) = v8 - v11 * *(__int16 *)(v9 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v8;
  if (v10 < v11) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B8403A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = v2;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    uint64_t v3 = *(void *)(a1 + 72);
  }
  uint64_t v4 = *(void *)(v3 + 104);
  int v5 = *(_DWORD *)(v3 + 16);
  unint64_t v6 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  int v7 = *(_DWORD *)(v2 + 16);
  unint64_t v8 = v6 + 28 * v7;
  if (v7 < 1)
  {
    unint64_t v9 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  }
  else
  {
    unint64_t v9 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
    do
    {
      if (*(_DWORD *)(v9 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v9 + 8)) {
        break;
      }
      v9 += 28;
    }
    while (v9 < v8);
  }
  if (v9 != v8) {
    unint64_t v6 = v9;
  }
  int v10 = -1227133513 * ((v6 - v4) >> 2);
  int v11 = v10 / v5;
  int v12 = v10 - v11 * *(__int16 *)(v3 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v12;
  if (*(_DWORD *)(v3 + 12) < v11) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B840494(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = v2;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    uint64_t v3 = *(void *)(a1 + 72);
  }
  uint64_t v4 = *(void *)(v3 + 104);
  int v5 = *(_DWORD *)(v3 + 16);
  unint64_t v6 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  int v7 = *(_DWORD *)(v2 + 16);
  unint64_t v8 = v6 + 28 * v7;
  if (v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v8 - 20)) {
        break;
      }
      v8 -= 28;
    }
    while (v8 > v6);
  }
  if (v8 == v6 + 28 * v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = -1227133513 * ((v8 + 28 * v9 - v4) >> 2);
  int v11 = v10 / v5;
  int v12 = v10 - v11 * *(__int16 *)(v3 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v12;
  if (*(_DWORD *)(v3 + 12) < v11) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t sub_22B840584(uint64_t a1)
{
  int v2 = sub_22B84136C(*(void *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12) - 1);
  int v3 = *(_DWORD *)(a1 + 12);
  int v4 = v3 - v2;
  if (v3 >= v2) {
    v3 -= v2;
  }
  *(_DWORD *)(a1 + 12) = v3;
  return (v4 >> 31) & 0xFFFFFFF4;
}

uint64_t sub_22B8405CC(uint64_t a1)
{
  int v2 = sub_22B84136C(*(void *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  int v3 = *(_DWORD *)(a1 + 12);
  int v4 = v3 + v2;
  *(_DWORD *)(a1 + 12) = v3 + v2;
  uint64_t v5 = *(void *)(a1 + 72);
  if (v4 < *(_DWORD *)(v5 + 16) || *(_DWORD *)(v5 + 24) + *(__int16 *)(v5 + 2) == 1 && (sub_22B83F09C(v5, 1) & 1) != 0) {
    return 0;
  }
  *(_DWORD *)(a1 + 12) = v3;
  return 4294967284;
}

uint64_t sub_22B840644(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  if (v1 <= 0) {
    uint64_t v2 = 4294967284;
  }
  else {
    uint64_t v2 = 0;
  }
  *(_DWORD *)(a1 + 8) = v1 - (v1 > 0);
  return v2;
}

uint64_t sub_22B840668(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v3 + 1;
  if (v3 + 1 != *(_DWORD *)(v2 + 12)) {
    return 0;
  }
  if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1)
  {
    if (sub_22B83F09C(v2, 1)) {
      return 0;
    }
    int v3 = *(_DWORD *)(a1 + 8) - 1;
  }
  *(_DWORD *)(a1 + 8) = v3;
  return 4294967284;
}

uint64_t sub_22B8406DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = *(_DWORD *)(v2 + 12) - 1;
  int v4 = *(_DWORD *)(a1 + 8);
  __int16 v5 = *(_WORD *)a1;
  if ((*(_WORD *)a1 & 4) == 0)
  {
    if (v3 == v4)
    {
      if ((*(_WORD *)v2 & 8) == 0 || *(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1)
      {
        if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
          return 4294967284;
        }
        goto LABEL_12;
      }
LABEL_24:
      if (sub_22B83F09C(v2, 1))
      {
        int v7 = *(_DWORD *)(v2 + 16);
LABEL_26:
        int v10 = *(_DWORD *)(a1 + 8);
        int v11 = *(_DWORD *)(a1 + 12);
        unint64_t v12 = *(void *)(*(void *)(a1 + 72) + 104)
            + 28 * v10 * *(_DWORD *)(*(void *)(a1 + 72) + 16)
            + 28 * v11;
        int v13 = v7 - v11;
        unint64_t v14 = v12 + 28 * v13;
        if (v13 >= 1)
        {
          do
          {
            if (*(_DWORD *)(v14 - 24) != 32) {
              break;
            }
            if (*(_DWORD *)(v14 - 20)) {
              break;
            }
            v14 -= 28;
          }
          while (v14 > v12);
        }
        wmove(*(WINDOW **)(a1 + 56), v10, v11);
        wclrtoeol(*(WINDOW **)(a1 + 56));
        unsigned int v15 = *(_DWORD *)(a1 + 8) + 1;
        *(void *)(a1 + 8) = v15;
        wmove(*(WINDOW **)(a1 + 56), v15, 0);
        winsdelln(*(WINDOW **)(a1 + 56), 1);
        wadd_wchnstr();
        uint64_t result = 0;
        goto LABEL_34;
      }
      return 0xFFFFFFFFLL;
    }
    if ((v5 & 0x10) != 0)
    {
      *(_WORD *)a1 = v5 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(void *)(v2 + 104));
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
      int v3 = *(_DWORD *)(v2 + 12) - 1;
    }
    int v7 = *(_DWORD *)(v2 + 16);
    unint64_t v8 = *(void *)(v2 + 104) + 28 * v3 * v7;
    unint64_t v9 = v8 + 28 * v7;
    if (v7 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v9 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v9 - 20)) {
          break;
        }
        v9 -= 28;
      }
      while (v9 > v8);
    }
    if (v9 == v8) {
      goto LABEL_26;
    }
    if ((*(_WORD *)v2 & 8) != 0) {
      goto LABEL_24;
    }
    return 4294967284;
  }
  if (v3 != v4)
  {
LABEL_33:
    wmove(*(WINDOW **)(a1 + 56), v4, *(_DWORD *)(a1 + 12));
    wclrtoeol(*(WINDOW **)(a1 + 56));
    uint64_t result = 0;
    *(void *)(a1 + 8) = (*(_DWORD *)(a1 + 8) + 1);
LABEL_34:
    *(_WORD *)a1 |= 0x10u;
    return result;
  }
  if ((*(_WORD *)v2 & 8) != 0 && *(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1)
  {
    if (!sub_22B83F09C(*(void *)(a1 + 72), 1)) {
      return 0xFFFFFFFFLL;
    }
    int v4 = *(_DWORD *)(a1 + 8);
    goto LABEL_33;
  }
  if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
    return 4294967284;
  }
  wmove(*(WINDOW **)(a1 + 56), v3, *(_DWORD *)(a1 + 12));
  wclrtoeol(*(WINDOW **)(a1 + 56));
  *(_WORD *)a1 |= 0x10u;
LABEL_12:

  return sub_22B83E3F8(sub_22B83F900, a1);
}

uint64_t sub_22B84096C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (!sub_22B8413E4(*(void *)(v2 + 88), *(void **)(v2 + 96))) {
    return 4294967284;
  }
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(*(void *)(a1 + 72) + 16) - 1);
  int v3 = winch(*(WINDOW **)(a1 + 56));
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  if (v3 == 32 || v3 == *(_DWORD *)(*(void *)(a1 + 72) + 36)) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1 || (*(_WORD *)v2 & 8) == 0) {
    return 4294967284;
  }
  if (!sub_22B83F09C(v2, 1)) {
    return 0xFFFFFFFFLL;
  }
LABEL_7:
  winsch(*(WINDOW **)(a1 + 56), 0x20u);

  return sub_22B84147C(a1);
}

uint64_t sub_22B840A50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (!sub_22B8413E4(*(void *)(v2 + 88), *(void **)(v2 + 96))) {
    return 4294967284;
  }
  if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(v2 + 12) - 1)
  {
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1) {
      return 4294967284;
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 72);
    if ((*(_WORD *)a1 & 0x10) != 0)
    {
      *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v3, *(void *)(v3 + 104));
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    }
    int v4 = *(_DWORD *)(v3 + 16);
    unint64_t v5 = *(void *)(v3 + 104) + 28 * (*(_DWORD *)(v3 + 12) - 1) * v4;
    unint64_t v6 = v5 + 28 * v4;
    if (v4 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v6 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v6 - 20)) {
          break;
        }
        v6 -= 28;
      }
      while (v6 > v5);
    }
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1) {
      return 4294967284;
    }
    if (v6 == v5)
    {
LABEL_16:
      *(_DWORD *)(a1 + 12) = 0;
      winsdelln(*(WINDOW **)(a1 + 56), 1);
      return 0;
    }
  }
  if ((*(_WORD *)v2 & 8) == 0) {
    return 4294967284;
  }
  if (sub_22B83F09C(v2, 1)) {
    goto LABEL_16;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_22B840B88(uint64_t a1)
{
  return 0;
}

uint64_t sub_22B840BA4(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  int v1 = *(_DWORD *)(a1 + 12);
  if (!*(void *)(a1 + 8)) {
    return 4294967284;
  }
  uint64_t v5 = *(void *)(a1 + 72);
  *(_DWORD *)(a1 + 12) = v1 - 1;
  if (v1 <= 0)
  {
    *(_DWORD *)(a1 + 12) = v1;
    __int16 v6 = *(_WORD *)a1;
    if ((*(_WORD *)a1 & 4) != 0) {
      return 4294967284;
    }
    uint64_t v7 = *(void *)(v5 + 104);
    int v8 = *(_DWORD *)(v5 + 16);
    unint64_t v9 = v7 + 28 * v8 * (v2 - 1);
    int v10 = v8 * v2;
    if ((v6 & 0x10) != 0)
    {
      *(_WORD *)a1 = v6 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v5, v7);
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
      int v8 = *(_DWORD *)(v5 + 16);
    }
    unint64_t v11 = v7 + 28 * v10;
    unint64_t v12 = v9 + 28 * v8;
    if (v8 < 1)
    {
      unint64_t v13 = v11 + 28 * v8;
    }
    else
    {
      do
      {
        if (*(_DWORD *)(v12 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v12 - 20)) {
          break;
        }
        v12 -= 28;
      }
      while (v12 > v9);
      unint64_t v13 = v11 + 28 * v8;
      do
      {
        if (*(_DWORD *)(v13 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v13 - 20)) {
          break;
        }
        v13 -= 28;
      }
      while (v13 > v11);
    }
    if ((int)(*(__int16 *)(v5 + 4) + 1227133513 * ((v12 - v9) >> 2)) < (int)(-1227133513 * ((v13 - v11) >> 2))) {
      return 4294967284;
    }
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    winsdelln(*(WINDOW **)(a1 + 56), -1);
    uint64_t v14 = *(void *)(a1 + 72);
    int v15 = -1227133513 * ((v12 - *(void *)(v14 + 104)) >> 2);
    int v16 = *(_DWORD *)(v14 + 12);
    int v17 = v15 / *(_DWORD *)(v14 + 16);
    int v18 = v15 - v17 * *(__int16 *)(v14 + 4);
    *(_DWORD *)(a1 + 8) = v17;
    *(_DWORD *)(a1 + 12) = v18;
    if (v16 < v17)
    {
      int v17 = 0;
      *(_DWORD *)(a1 + 8) = 0;
    }
    if (v2 < 1 || v17 != v2)
    {
      wmove(*(WINDOW **)(a1 + 56), v17, v18);
      wadd_wchnstr();
      return 0;
    }
    int v19 = *(_DWORD *)(v5 + 16) - 1;
    *(_DWORD *)(a1 + 8) = v2 - 1;
    *(_DWORD *)(a1 + 12) = v19;
  }
  sub_22B841840(a1);
  return 0;
}

uint64_t sub_22B840D98(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  winsdelln(*(WINDOW **)(a1 + 56), -1);
  return 0;
}

uint64_t sub_22B840DC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(v2 + 104);
  int v4 = *(_DWORD *)(v2 + 16);
  int v5 = *(_DWORD *)(a1 + 12);
  unint64_t v6 = v3 + 28 * *(_DWORD *)(a1 + 8) * v4;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (*(_DWORD *)(v6 + 28 * v5 + 4) == 32 && !*(_DWORD *)(v6 + 28 * v5 + 8)) {
    return 4294967284;
  }
  int v7 = *(_DWORD *)(a1 + 12);
  unint64_t v8 = v6 + 28 * v7;
  if (v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20)) {
        break;
      }
      v8 -= 28;
    }
    while (v8 > v6);
  }
  unint64_t v9 = v6 + 28 * v5;
  unint64_t v10 = v6 + 28 * v4;
  uint64_t v11 = *(void *)(a1 + 72);
  int v12 = -1227133513 * ((v8 - *(void *)(v11 + 104)) >> 2);
  int v13 = *(_DWORD *)(v11 + 12);
  int v14 = v12 / *(_DWORD *)(v11 + 16);
  int v15 = v12 - v14 * *(__int16 *)(v11 + 4);
  *(_DWORD *)(a1 + 8) = v14;
  *(_DWORD *)(a1 + 12) = v15;
  if (v13 < v14)
  {
    int v14 = 0;
    *(_DWORD *)(a1 + 8) = 0;
  }
  wmove(*(WINDOW **)(a1 + 56), v14, v15);
  wclrtoeol(*(WINDOW **)(a1 + 56));
  uint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v9) >> 2);
  unint64_t v17 = v9 + 28 * (int)v16;
  if ((int)v16 < 1)
  {
    unint64_t v18 = v9;
  }
  else
  {
    unint64_t v18 = v9;
    do
    {
      if (*(_DWORD *)(v18 + 4) == 32 && !*(_DWORD *)(v18 + 8)) {
        break;
      }
      v18 += 28;
    }
    while (v18 < v17);
  }
  if (v18 == v17) {
    unint64_t v19 = v9;
  }
  else {
    unint64_t v19 = v18;
  }
  uint64_t v20 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v19) >> 2);
  unint64_t v21 = v19 + 28 * (int)v20;
  unint64_t v22 = v19;
  if ((int)v20 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v22 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v22 + 8)) {
        break;
      }
      v22 += 28;
    }
    while (v22 < v21);
  }
  if (v22 == v21) {
    unint64_t v23 = v19;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23 != v9 && (*(_DWORD *)(v23 + 4) != 32 || *(_DWORD *)(v23 + 8)))
  {
    uint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v23) >> 2);
    unint64_t v25 = v23 + 28 * (int)v24;
    if ((int)v24 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v25 - 24) != 32) {
          break;
        }
        if (*(_DWORD *)(v25 - 20)) {
          break;
        }
        v25 -= 28;
      }
      while (v25 > v23);
    }
    wadd_wchnstr();
  }
  return 0;
}

uint64_t sub_22B84101C(uint64_t a1)
{
  return 0;
}

uint64_t sub_22B841054(uint64_t a1)
{
  return 0;
}

uint64_t sub_22B84108C(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  werase(*(WINDOW **)(a1 + 56));
  return 0;
}

uint64_t sub_22B8410B0(_WORD *a1)
{
  *a1 |= 4u;
  return 0;
}

uint64_t sub_22B8410C4(_WORD *a1)
{
  *a1 &= ~4u;
  return 0;
}

uint64_t sub_22B8410D8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  int v2 = *(_DWORD *)(*(void *)(a1 + 72) + 12) - *(__int16 *)(*(void *)(a1 + 72) + 2);
  BOOL v3 = __OFSUB__(v2, v1);
  int v4 = v2 - v1;
  if ((v4 < 0) ^ v3 | (v4 == 0)) {
    int v5 = v4;
  }
  else {
    int v5 = 1;
  }
  if (v5 < 1) {
    return 4294967284;
  }
  uint64_t v6 = 0;
  *(_DWORD *)(a1 + 8) += v5;
  *(_DWORD *)(a1 + 16) = v5 + v1;
  return v6;
}

uint64_t sub_22B841124(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  BOOL v2 = __OFSUB__(v1, 1);
  int v3 = v1 - 1;
  if (v3 < 0 != v2) {
    return 4294967284;
  }
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_22B841154(uint64_t a1)
{
  return sub_22B841984(a1, *(__int16 *)(*(void *)(a1 + 72) + 2));
}

uint64_t sub_22B841160(uint64_t a1)
{
  return sub_22B841984(a1, -*(__int16 *)(*(void *)(a1 + 72) + 2));
}

uint64_t sub_22B841170(uint64_t a1)
{
  int v1 = *(__int16 *)(*(void *)(a1 + 72) + 2);
  if (v1 >= -1) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1 + 2;
  }
  return sub_22B841984(a1, v2 >> 1);
}

uint64_t sub_22B84118C(uint64_t a1)
{
  int v1 = *(__int16 *)(*(void *)(a1 + 72) + 2);
  if (v1 >= -1) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1 + 2;
  }
  return sub_22B841984(a1, -(v2 >> 1));
}

uint64_t sub_22B8411A8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  int v2 = *(_DWORD *)(*(void *)(a1 + 72) + 16) - *(__int16 *)(*(void *)(a1 + 72) + 4);
  BOOL v3 = __OFSUB__(v2, v1);
  int v4 = v2 - v1;
  if ((v4 < 0) ^ v3 | (v4 == 0)) {
    int v5 = v4;
  }
  else {
    int v5 = 1;
  }
  if (v5 < 1) {
    return 4294967284;
  }
  uint64_t v6 = 0;
  *(_DWORD *)(a1 + 12) += v5;
  *(_DWORD *)(a1 + 20) = v5 + v1;
  return v6;
}

uint64_t sub_22B8411F4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  BOOL v2 = __OFSUB__(v1, 1);
  int v3 = v1 - 1;
  if (v3 < 0 != v2) {
    return 4294967284;
  }
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 12);
  *(_DWORD *)(a1 + 20) = v3;
  return result;
}

uint64_t sub_22B841224(uint64_t a1)
{
  return sub_22B841A14(a1, *(__int16 *)(*(void *)(a1 + 72) + 4));
}

uint64_t sub_22B841230(uint64_t a1)
{
  return sub_22B841A14(a1, -*(__int16 *)(*(void *)(a1 + 72) + 4));
}

uint64_t sub_22B841240(uint64_t a1)
{
  int v1 = *(__int16 *)(*(void *)(a1 + 72) + 4);
  if (v1 >= -1) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1 + 2;
  }
  return sub_22B841A14(a1, v2 >> 1);
}

uint64_t sub_22B84125C(uint64_t a1)
{
  int v1 = *(__int16 *)(*(void *)(a1 + 72) + 4);
  if (v1 >= -1) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1 + 2;
  }
  return sub_22B841A14(a1, -(v2 >> 1));
}

uint64_t sub_22B841278(uint64_t a1)
{
  if (_nc_Internal_Validation(a1)) {
    return 0;
  }
  else {
    return 4294967283;
  }
}

uint64_t sub_22B84129C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(void *)(v1 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (sub_22B841AA4(*(void *)(v1 + 88), v1, *(void **)(v1 + 96))) {
    return 0;
  }
  else {
    return 4294967284;
  }
}

uint64_t sub_22B841304(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(void *)(v1 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (sub_22B841B3C(*(void *)(v1 + 88), v1, *(void **)(v1 + 96))) {
    return 0;
  }
  else {
    return 4294967284;
  }
}

uint64_t sub_22B84136C(uint64_t a1, unsigned int a2, int a3)
{
  if (a1 && (a3 & 0x80000000) == 0 && (a2 & 0x80000000) == 0)
  {
    int v3 = a3;
    while (*(__int16 *)(a1 + 6) >= a3 && *(__int16 *)(a1 + 4) >= (int)a2)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16 * a2);
      if ((*(_DWORD *)(v4 + 28 * v3) & 0xFEu) - 2 >= 0x1E) {
        return wcwidth(*(_DWORD *)(v4 + 28 * v3 + 4));
      }
      BOOL v5 = __OFSUB__(v3--, 1);
      if (v3 < 0 != v5) {
        return 1;
      }
    }
  }
  return 1;
}

uint64_t sub_22B8413E4(uint64_t a1, void *a2)
{
  if (!a1) {
    return (*(unsigned char *)(MEMORY[0x263EF8318] + 189) & 2) == 0;
  }
  uint64_t v3 = a1;
  while ((*(_WORD *)v3 & 1) != 0)
  {
    if (sub_22B8413E4(*(void *)(v3 + 16), *a2)) {
      return 1;
    }
    uint64_t v3 = *(void *)(v3 + 24);
    a2 = (void *)a2[1];
    if (!v3) {
      return (*(unsigned char *)(MEMORY[0x263EF8318] + 189) & 2) == 0;
    }
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, void *))(v3 + 64);
  if (!v4) {
    return (*(unsigned char *)(MEMORY[0x263EF8318] + 189) & 2) == 0;
  }

  return v4(32, a2);
}

uint64_t sub_22B84147C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  if ((*(unsigned char *)(v1 + 48) & 0x10) == 0 || *(_DWORD *)(v1 + 24) + *(__int16 *)(v1 + 2) == 1) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = *(_DWORD *)(v1 + 12);
  wmove(*(WINDOW **)(a1 + 56), v3, *(_DWORD *)(v1 + 16) - 1);
  int v5 = winch(*(WINDOW **)(a1 + 56));
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  uint64_t v6 = *(void *)(a1 + 72);
  if (v5 == 32 || v5 == *(_DWORD *)(v6 + 36)) {
    return 0;
  }
  if (v4 - 1 != v3)
  {
LABEL_11:
    unint64_t v8 = *(void *)(v6 + 104) + 28 * *(_DWORD *)(a1 + 8) * *(_DWORD *)(v6 + 16);
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(void *)(v1 + 104));
    int v9 = *(_DWORD *)(v1 + 16);
    unint64_t v10 = v8 + 28 * v9;
    if (v9 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v10 - 24) == 32 && !*(_DWORD *)(v10 - 20)) {
          break;
        }
        v10 -= 28;
      }
      while (v10 > v8);
    }
    int v11 = -1227133513 * ((v10 - v8) >> 2);
    if (v11 >= 1)
    {
      if (sub_22B841628(a1, *(_DWORD *)(a1 + 8) + 1, v10, v9 - v11))
      {
        sub_22B841840(a1);
        _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(void *)(v1 + 104));
        return 4294967284;
      }
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), v11);
      wclrtoeol(*(WINDOW **)(a1 + 56));
      int v13 = *(_DWORD *)(a1 + 12);
      BOOL v14 = __OFSUB__(v13, v11);
      int v15 = v13 - v11;
      if (v15 < 0 == v14)
      {
        uint64_t result = 0;
        ++*(_DWORD *)(a1 + 8);
        *(_DWORD *)(a1 + 12) = v15;
        return result;
      }
    }
    return 0;
  }
  if ((*(_WORD *)v1 & 8) == 0) {
    return 0;
  }
  if (sub_22B83F09C(v1, 1))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_22B841628(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 72);
  int v9 = *(_DWORD *)(v8 + 16);
  unint64_t v10 = *(void *)(v8 + 104) + 28 * v9 * a2;
  unint64_t v11 = v10 + 28 * v9;
  if (v9 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v11 - 24) != 32) {
        break;
      }
      if (*(_DWORD *)(v11 - 20)) {
        break;
      }
      v11 -= 28;
    }
    while (v11 > v10);
  }
  if ((int)(v9 + 1227133513 * ((v11 - v10) >> 2)) > a4)
  {
    int v12 = (WINDOW **)(a1 + 56);
LABEL_7:
    wmove(*v12, a2, 0);
    sub_22B8418F8((uint64_t)*v12, a3, a4);
    wmove(*v12, a2, a4);
    sub_22B8418F8((uint64_t)*v12, (uint64_t)&xmmword_26840B060, 1);
    return 0;
  }
  int v14 = *(_DWORD *)(v8 + 12) - 1;
  if (v14 == a2 && (*(_WORD *)v8 & 8) != 0)
  {
    if (!sub_22B83F09C(*(void *)(a1 + 72), 1)) {
      return 0xFFFFFFFFLL;
    }
    int v9 = *(_DWORD *)(v8 + 16);
    unint64_t v10 = *(void *)(v8 + 104) + 28 * v9 * a2;
    int v14 = *(_DWORD *)(v8 + 12) - 1;
  }
  if (v14 <= a2) {
    return 4294967284;
  }
  uint64_t v15 = v10 + 28 * v9 + 28 * ~a4;
  unint64_t v16 = v15 + 28 * (a4 + 1);
  unint64_t v17 = v15;
  if ((a4 & 0x80000000) == 0)
  {
    do
    {
      if (*(_DWORD *)(v17 + 4) != 32) {
        break;
      }
      if (*(_DWORD *)(v17 + 8)) {
        break;
      }
      v17 += 28;
    }
    while (v17 < v16);
  }
  if (v17 != v16) {
    uint64_t v15 = v17;
  }
  uint64_t v18 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - v10) >> 2);
  unint64_t v19 = v10 + 28 * (int)v18;
  if ((int)v18 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v19 - 24) == 32 && !*(_DWORD *)(v19 - 20)) {
        break;
      }
      v19 -= 28;
    }
    while (v19 > v10);
  }
  int v20 = -1227133513 * ((v19 - v10) >> 2);
  uint64_t result = sub_22B841628(a1, (a2 + 1));
  if (!result)
  {
    unint64_t v21 = *(WINDOW **)(a1 + 56);
    int v12 = (WINDOW **)(a1 + 56);
    wmove(v21, a2, v20);
    wclrtoeol(*v12);
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_22B841840(uint64_t a1)
{
  int v2 = sub_22B84136C(*(void *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  int v5 = *(_DWORD *)(a1 + 12);
  if (v3)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    while ((v6 & 0x80000000) == 0
         && (v4 & 0x80000000) == 0
         && (int)v6 <= *(__int16 *)(v3 + 6)
         && (int)v4 <= *(__int16 *)(v3 + 4))
    {
      unsigned int v7 = (*(_DWORD *)(*(void *)(*(void *)(v3 + 40) + 16 * v4) + 28 * v6--) & 0xFE) - 2;
      if (v7 >= 0x1E)
      {
        int v5 = v6 + 1;
        break;
      }
    }
  }
  *(_DWORD *)(a1 + 12) = v5;
  uint64_t result = wmove((WINDOW *)v3, v4, v5);
  if (v2 >= 1)
  {
    unsigned int v9 = v2 + 1;
    do
    {
      uint64_t result = wdelch(*(WINDOW **)(a1 + 56));
      --v9;
    }
    while (v9 > 1);
  }
  return result;
}

uint64_t sub_22B8418F8(uint64_t result, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    int v3 = a3;
    int v5 = (WINDOW *)result;
    do
    {
      if (v5)
      {
        int v6 = *(__int16 *)v5;
        int v7 = *((__int16 *)v5 + 1);
      }
      else
      {
        int v6 = -1;
        int v7 = -1;
      }
      uint64_t result = wins_wch();
      if (result) {
        break;
      }
      uint64_t result = wmove(v5, v6, v7 + 1);
      BOOL v8 = v3-- != 0;
      if (result) {
        break;
      }
      a2 += 28;
    }
    while (v3 != 0 && v8);
  }
  return result;
}

uint64_t sub_22B841984(uint64_t a1, int a2)
{
  if (a2 >= 0) {
    int v2 = a2;
  }
  else {
    int v2 = -a2;
  }
  if (a2 < 1)
  {
    int v8 = *(_DWORD *)(a1 + 16);
    if (v2 >= v8) {
      int v9 = *(_DWORD *)(a1 + 16);
    }
    else {
      int v9 = v2;
    }
    if (v9 >= 1)
    {
      uint64_t v6 = 0;
      *(_DWORD *)(a1 + 8) -= v9;
      int v7 = v8 - v9;
      goto LABEL_15;
    }
    return 4294967284;
  }
  int v3 = *(_DWORD *)(a1 + 16);
  int v4 = *(_DWORD *)(*(void *)(a1 + 72) + 12) - *(__int16 *)(*(void *)(a1 + 72) + 2);
  if (v3 + v2 <= v4) {
    int v5 = v2;
  }
  else {
    int v5 = v4 - v3;
  }
  if (v5 < 1) {
    return 4294967284;
  }
  uint64_t v6 = 0;
  *(_DWORD *)(a1 + 8) += v5;
  int v7 = v5 + v3;
LABEL_15:
  *(_DWORD *)(a1 + 16) = v7;
  return v6;
}

uint64_t sub_22B841A14(uint64_t a1, int a2)
{
  if (a2 >= 0) {
    int v2 = a2;
  }
  else {
    int v2 = -a2;
  }
  if (a2 < 1)
  {
    int v8 = *(_DWORD *)(a1 + 20);
    if (v2 >= v8) {
      int v9 = *(_DWORD *)(a1 + 20);
    }
    else {
      int v9 = v2;
    }
    if (v9 >= 1)
    {
      uint64_t v6 = 0;
      *(_DWORD *)(a1 + 12) -= v9;
      int v7 = v8 - v9;
      goto LABEL_15;
    }
    return 4294967284;
  }
  int v3 = *(_DWORD *)(a1 + 20);
  int v4 = *(_DWORD *)(*(void *)(a1 + 72) + 16) - *(__int16 *)(*(void *)(a1 + 72) + 4);
  if (v3 + v2 <= v4) {
    int v5 = v2;
  }
  else {
    int v5 = v4 - v3;
  }
  if (v5 < 1) {
    return 4294967284;
  }
  uint64_t v6 = 0;
  *(_DWORD *)(a1 + 12) += v5;
  int v7 = v5 + v3;
LABEL_15:
  *(_DWORD *)(a1 + 20) = v7;
  return v6;
}

uint64_t sub_22B841AA4(uint64_t result, uint64_t a2, void *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    while (1)
    {
      if ((*(_WORD *)v5 & 4) == 0) {
        return 0;
      }
      if ((*(_WORD *)v5 & 1) == 0) {
        break;
      }
      if (sub_22B841AA4(*(void *)(v5 + 16), a2, *a3)) {
        return 1;
      }
      uint64_t v5 = *(void *)(v5 + 24);
      a3 = (void *)a3[1];
      if (!v5) {
        return 0;
      }
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 72);
    return v6(a2, a3);
  }
  return result;
}

uint64_t sub_22B841B3C(uint64_t result, uint64_t a2, void *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    while (1)
    {
      if ((*(_WORD *)v5 & 4) == 0) {
        return 0;
      }
      if ((*(_WORD *)v5 & 1) == 0) {
        break;
      }
      if (sub_22B841B3C(*(void *)(v5 + 16), a2, *a3)) {
        return 1;
      }
      uint64_t v5 = *(void *)(v5 + 24);
      a3 = (void *)a3[1];
      if (!v5) {
        return 0;
      }
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t, void *))(v5 + 80);
    return v6(a2, a3);
  }
  return result;
}

int set_field_init(FORM *a1, Form_Hook a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->fieldinit = a2;
  *__error() = 0;
  return 0;
}

Form_Hook field_init(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->fieldinit;
}

int set_field_term(FORM *a1, Form_Hook a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->fieldterm = a2;
  *__error() = 0;
  return 0;
}

Form_Hook field_term(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->fieldterm;
}

int set_form_init(FORM *a1, Form_Hook a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->forminit = a2;
  *__error() = 0;
  return 0;
}

Form_Hook form_init(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->forminit;
}

int set_form_term(FORM *a1, Form_Hook a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->formterm = a2;
  *__error() = 0;
  return 0;
}

Form_Hook form_term(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->formterm;
}

int set_form_opts(FORM *a1, Form_Options a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->opts = a2 & 3;
  *__error() = 0;
  return 0;
}

Form_Options form_opts(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->opts & 3;
}

int form_opts_on(FORM *a1, Form_Options a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->opts |= a2 & 3;
  *__error() = 0;
  return 0;
}

int form_opts_off(FORM *a1, Form_Options a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->opts &= ~(_BYTE)a2 | 0xFFFFFFFC;
  *__error() = 0;
  return 0;
}

int set_form_page(FORM *a1, int a2)
{
  int v2 = -2;
  if (a1 && (a2 & 0x80000000) == 0 && a1->maxpage > a2)
  {
    if (a1->status)
    {
      if ((a1->status & 2) != 0)
      {
        int v2 = -5;
      }
      else if (a1->curpage == a2)
      {
        int v2 = 0;
      }
      else if (_nc_Internal_Validation((uint64_t)a1))
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldterm)(a1);
          a1->status &= ~2u;
        }
        formterm = a1->formterm;
        if (formterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))formterm)(a1);
          a1->status &= ~2u;
        }
        int v2 = _nc_Set_Form_Page((uint64_t)a1, a2, 0);
        forminit = a1->forminit;
        if (forminit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))forminit)(a1);
          a1->status &= ~2u;
        }
        fieldinit = a1->fieldinit;
        if (fieldinit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldinit)(a1);
          a1->status &= ~2u;
        }
        _nc_Refresh_Current_Field((uint64_t)a1);
      }
      else
      {
        int v2 = -13;
      }
    }
    else
    {
      a1->curint page = a2;
      int v2 = 0;
      a1->current = (FIELD *)_nc_First_Active_Field((uint64_t)a1);
    }
  }
  *__error() = v2;
  return v2;
}

int form_page(const FORM *a1)
{
  uint64_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    uint64_t v1 = a1;
  }
  return v1->curpage;
}

int post_form(FORM *a1)
{
  if (!a1)
  {
    int v5 = -2;
    goto LABEL_20;
  }
  if (a1->status)
  {
    int v5 = -3;
    goto LABEL_20;
  }
  if (!a1->field)
  {
    int v5 = -11;
    goto LABEL_20;
  }
  sub = a1->sub;
  if (sub || (sub = a1->win) != 0)
  {
    LOWORD(cols) = a1->cols;
  }
  else
  {
    sub = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    int cols = a1->cols;
    if (!sub)
    {
      if ((cols & 0x80000000) == 0) {
        goto LABEL_10;
      }
      int v4 = -1;
      goto LABEL_9;
    }
  }
  if (*((__int16 *)sub + 3) + 1 < (__int16)cols)
  {
LABEL_10:
    int v5 = -6;
    goto LABEL_20;
  }
  int v4 = *((__int16 *)sub + 2) + 1;
LABEL_9:
  if (v4 < a1->rows) {
    goto LABEL_10;
  }
  curint page = a1->curpage;
  a1->curint page = -1;
  int v5 = _nc_Set_Form_Page((uint64_t)a1, curpage, (uint64_t)a1->current);
  if (!v5)
  {
    unsigned __int16 status = a1->status;
    unsigned __int16 v8 = a1->status | 1;
    a1->unsigned __int16 status = v8;
    forminit = a1->forminit;
    if (forminit)
    {
      a1->unsigned __int16 status = status | 3;
      ((void (*)(FORM *))forminit)(a1);
      unsigned __int16 v8 = a1->status & 0xFFFD;
      a1->unsigned __int16 status = v8;
    }
    fieldinit = a1->fieldinit;
    if (fieldinit)
    {
      a1->unsigned __int16 status = v8 | 2;
      ((void (*)(FORM *))fieldinit)(a1);
      a1->status &= ~2u;
    }
    _nc_Refresh_Current_Field((uint64_t)a1);
    int v5 = 0;
  }
LABEL_20:
  *__error() = v5;
  return v5;
}

int unpost_form(FORM *a1)
{
  if (a1)
  {
    unsigned __int16 status = a1->status;
    if (a1->status)
    {
      if ((status & 2) != 0)
      {
        int v3 = -5;
      }
      else
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->unsigned __int16 status = status | 2;
          ((void (*)(FORM *))fieldterm)(a1);
          unsigned __int16 status = a1->status & 0xFFFD;
          a1->unsigned __int16 status = status;
        }
        formterm = a1->formterm;
        if (formterm)
        {
          a1->unsigned __int16 status = status | 2;
          ((void (*)(FORM *))formterm)(a1);
          a1->status &= ~2u;
        }
        sub = a1->sub;
        if (!sub)
        {
          sub = a1->win;
          if (!sub) {
            sub = *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
          }
        }
        werase(sub);
        delwin(a1->w);
        int v3 = 0;
        a1->w = 0;
        a1->status &= ~1u;
      }
    }
    else
    {
      int v3 = -7;
    }
  }
  else
  {
    int v3 = -2;
  }
  *__error() = v3;
  return v3;
}

const char *__cdecl form_request_name(int a1)
{
  if ((a1 - 569) > 0xFFFFFFC6) {
    return &aNextPage[13 * (a1 - 512)];
  }
  uint64_t v1 = __error();
  uint64_t result = 0;
  int *v1 = -2;
  return result;
}

int form_request_by_name(const char *a1)
{
  *(void *)&v12[15] = *MEMORY[0x263EF8340];
  if (a1 && (size_t v1 = strlen(a1)) != 0)
  {
    if (v1 >= 0xE) {
      uint64_t v2 = 14;
    }
    else {
      uint64_t v2 = v1;
    }
    __memcpy_chk();
    v12[v2 - 1] = 0;
    __darwin_ct_rune_t v3 = v11;
    if (v11)
    {
      int v4 = v12;
      do
      {
        *(v4 - 1) = __toupper(v3);
        __darwin_ct_rune_t v5 = *v4++;
        __darwin_ct_rune_t v3 = v5;
      }
      while (v5);
    }
    uint64_t v6 = -57;
    int v7 = "NEXT_PAGE";
    while (strcmp(v7, (const char *)&v11))
    {
      v7 += 13;
      if (__CFADD__(v6++, 1)) {
        goto LABEL_13;
      }
    }
    return v6 + 569;
  }
  else
  {
LABEL_13:
    int v9 = __error();
    int result = -9;
    int *v9 = -9;
  }
  return result;
}

int scale_form(const FORM *a1, int *a2, int *a3)
{
  if (a1)
  {
    if (a1->field)
    {
      if (a2) {
        *a2 = a1->rows;
      }
      int v3 = 0;
      if (a3) {
        *a3 = a1->cols;
      }
    }
    else
    {
      int v3 = -11;
    }
  }
  else
  {
    int v3 = -2;
  }
  *__error() = v3;
  return v3;
}

int set_form_sub(FORM *a1, WINDOW *a2)
{
  if (a1 && (a1->status & 1) != 0)
  {
    int v2 = -3;
  }
  else
  {
    int v2 = 0;
    int v3 = (FORM *)_nc_Default_Form;
    if (a1) {
      int v3 = a1;
    }
    v3->sub = a2;
  }
  *__error() = v2;
  return v2;
}

WINDOW *__cdecl form_sub(const FORM *a1)
{
  size_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    size_t v1 = a1;
  }
  int result = v1->sub;
  if (!result)
  {
    int result = v1->win;
    if (!result) {
      return *(WINDOW **)(*MEMORY[0x263F8C610] + 152);
    }
  }
  return result;
}

int set_form_userptr(FORM *a1, void *a2)
{
  int v2 = (FORM *)_nc_Default_Form;
  if (a1) {
    int v2 = a1;
  }
  v2->usrptr = a2;
  *__error() = 0;
  return 0;
}

void *__cdecl form_userptr(const FORM *a1)
{
  size_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    size_t v1 = a1;
  }
  return v1->usrptr;
}

int set_form_win(FORM *a1, WINDOW *a2)
{
  if (a1 && (a1->status & 1) != 0)
  {
    int v2 = -3;
  }
  else
  {
    int v2 = 0;
    int v3 = (FORM *)_nc_Default_Form;
    if (a1) {
      int v3 = a1;
    }
    v3->win = a2;
  }
  *__error() = v2;
  return v2;
}

WINDOW *__cdecl form_win(const FORM *a1)
{
  size_t v1 = (const FORM *)_nc_Default_Form;
  if (a1) {
    size_t v1 = a1;
  }
  win = v1->win;
  if (win) {
    return win;
  }
  else {
    return (WINDOW *)*MEMORY[0x263F8C620];
  }
}

_DWORD *sub_22B8424AC(int **a1)
{
  size_t v1 = *a1;
  *a1 += 2;
  int v2 = *v1;
  int result = malloc(4uLL);
  if (result) {
    _DWORD *result = v2;
  }
  return result;
}

_DWORD *sub_22B8424E8(_DWORD *a1)
{
  int result = malloc(4uLL);
  if (result) {
    _DWORD *result = *a1;
  }
  return result;
}

void sub_22B84251C(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t sub_22B842528(const FIELD *a1, int *a2)
{
  unint64_t v2 = *a2;
  int v3 = field_buffer(a1, 0) - 1;
  do
  {
    int v5 = *(unsigned __int8 *)++v3;
    int v4 = v5;
  }
  while (v5 == 32);
  uint64_t v6 = (v2 >> 31) & 1;
  if (!v4) {
    return v6;
  }
  int v15 = 0;
  int v7 = _nc_Widen_String(v3, (unsigned int *)&v15);
  if (!v7) {
    return v6 & 1;
  }
  unsigned __int16 v8 = v7;
  signed int v9 = v15;
  if (v15 < 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  char v11 = 0;
  uint64_t v12 = v2 - 1;
  LOBYTE(v6) = 1;
  while (1)
  {
    unsigned int v13 = v8[v10];
    if (v11)
    {
      if (v13 != 32) {
        goto LABEL_18;
      }
      goto LABEL_12;
    }
    if (v13 != 32) {
      break;
    }
    LOBYTE(v6) = v10 >= v12;
LABEL_12:
    char v11 = 1;
LABEL_15:
    if (++v10 >= v9) {
      goto LABEL_19;
    }
  }
  if (sub_22B842610(v13))
  {
    char v11 = 0;
    signed int v9 = v15;
    goto LABEL_15;
  }
LABEL_18:
  LOBYTE(v6) = 0;
LABEL_19:
  free(v8);
  return v6 & 1;
}

BOOL sub_22B842610(unsigned int a1)
{
  unsigned __int8 v1 = a1;
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL)) {
      return 1;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x500) != 0)
  {
    return 1;
  }
  if (v1 > 0x7Fu) {
    int v3 = __maskrune(v1, 0x500uLL);
  }
  else {
    int v3 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v1 + 60) & 0x500;
  }
  return v3 != 0;
}

_DWORD *sub_22B8426A4(int **a1)
{
  unsigned __int8 v1 = *a1;
  *a1 += 2;
  int v2 = *v1;
  int result = malloc(4uLL);
  if (result) {
    _DWORD *result = v2;
  }
  return result;
}

_DWORD *sub_22B8426E0(_DWORD *a1)
{
  int result = malloc(4uLL);
  if (result) {
    _DWORD *result = *a1;
  }
  return result;
}

void sub_22B842714(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t sub_22B842720(const FIELD *a1, int *a2)
{
  unint64_t v2 = *a2;
  int v3 = field_buffer(a1, 0) - 1;
  do
  {
    int v5 = *(unsigned __int8 *)++v3;
    int v4 = v5;
  }
  while (v5 == 32);
  uint64_t v6 = (v2 >> 31) & 1;
  if (!v4) {
    return v6;
  }
  int v15 = 0;
  int v7 = _nc_Widen_String(v3, (unsigned int *)&v15);
  if (!v7) {
    return v6 & 1;
  }
  unsigned __int16 v8 = v7;
  signed int v9 = v15;
  if (v15 < 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_19;
  }
  uint64_t v10 = 0;
  char v11 = 0;
  uint64_t v12 = v2 - 1;
  LOBYTE(v6) = 1;
  while (1)
  {
    unsigned int v13 = v8[v10];
    if (v11)
    {
      if (v13 != 32) {
        goto LABEL_18;
      }
      goto LABEL_12;
    }
    if (v13 != 32) {
      break;
    }
    LOBYTE(v6) = v10 >= v12;
LABEL_12:
    char v11 = 1;
LABEL_15:
    if (++v10 >= v9) {
      goto LABEL_19;
    }
  }
  if (sub_22B842808(v13))
  {
    char v11 = 0;
    signed int v9 = v15;
    goto LABEL_15;
  }
LABEL_18:
  LOBYTE(v6) = 0;
LABEL_19:
  free(v8);
  return v6 & 1;
}

BOOL sub_22B842808(unsigned int a1)
{
  unsigned __int8 v1 = a1;
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x100uLL)) {
      return 1;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x100) != 0)
  {
    return 1;
  }
  if (v1 > 0x7Fu) {
    int v3 = __maskrune(v1, 0x100uLL);
  }
  else {
    int v3 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v1 + 60) & 0x100;
  }
  return v3 != 0;
}

unsigned char *sub_22B842894(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 += 8;
  unint64_t v2 = *(const char ***)v1;
  *a1 = v1 + 16;
  int v3 = *(_DWORD *)(v1 + 8);
  *a1 = v1 + 24;
  int v4 = *(_DWORD *)(v1 + 16);
  int v5 = malloc(0x10uLL);
  uint64_t v6 = v5;
  if (v5)
  {
    v5[12] = v3 != 0;
    v5[13] = v4 != 0;
    *(void *)int v5 = 0;
    if (v2 && *v2)
    {
      int v7 = 0;
      size_t v8 = 1;
      do
        ++v7;
      while (v2[v8++]);
      *((_DWORD *)v6 + 2) = v7;
      uint64_t v10 = (char **)malloc(v8 * 8);
      *(void *)uint64_t v6 = v10;
      if (v10)
      {
        char v11 = v10;
        uint64_t v12 = *v2;
        if (*v2)
        {
          unsigned int v13 = v2 + 1;
          do
          {
            *v11++ = strdup(v12);
            int v14 = *v13++;
            uint64_t v12 = v14;
          }
          while (v14);
        }
        *char v11 = 0;
      }
    }
    else
    {
      *((_DWORD *)v5 + 2) = 0;
    }
  }
  return v6;
}

char ***sub_22B842970(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = (char ***)malloc(0x10uLL);
  int v3 = v2;
  if (v2)
  {
    *(_OWORD *)unint64_t v2 = *(_OWORD *)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 8);
    if ((int)v4 >= 1)
    {
      int v5 = *(const char ***)a1;
      uint64_t v6 = (char **)malloc(8 * v4 + 8);
      const char *v3 = v6;
      if (v6)
      {
        int v7 = v6;
        if (v5)
        {
          size_t v8 = *v5;
          if (*v5)
          {
            signed int v9 = v5 + 1;
            do
            {
              *v7++ = strdup(v8);
              uint64_t v10 = *v9++;
              size_t v8 = v10;
            }
            while (v10);
          }
        }
        _DWORD *v7 = 0;
      }
    }
  }
  return v3;
}

void sub_22B842A0C(int *a1)
{
  if (a1)
  {
    unint64_t v2 = *(void ***)a1;
    if (v2 && a1[2] >= 1)
    {
      int v3 = *v2;
      if (*v2)
      {
        uint64_t v4 = v2 + 1;
        do
        {
          free(v3);
          int v5 = *v4++;
          int v3 = v5;
        }
        while (v5);
        unint64_t v2 = *(void ***)a1;
      }
      free(v2);
    }
    free(a1);
  }
}

uint64_t sub_22B842A80(FIELD *a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 ***)a2;
  int v4 = *(unsigned __int8 *)(a2 + 12);
  int v5 = *(unsigned __int8 *)(a2 + 13);
  uint64_t v6 = (unsigned __int8 *)field_buffer(a1, 0);
  do
  {
    if (!v3) {
      return 0;
    }
    int v7 = *v3;
    if (!*v3) {
      return 0;
    }
    ++v3;
    int v8 = sub_22B842D20(v7, v6, v4 != 0);
  }
  while (!v8);
  if (v5)
  {
    if (v8 != 2)
    {
      signed int v9 = *v3;
      if (*v3)
      {
        uint64_t v10 = 1;
        do
        {
          int v11 = sub_22B842D20(v9, v6, v4 != 0);
          if (v11)
          {
            if (v11 == 2)
            {
              int v7 = v9;
              goto LABEL_16;
            }
            int v7 = 0;
          }
          signed int v9 = v3[v10++];
        }
        while (v9);
        if (v7) {
          goto LABEL_16;
        }
        return 0;
      }
    }
  }
LABEL_16:
  set_field_buffer(a1, 0, (const char *)v7);
  return 1;
}

uint64_t sub_22B842B64(FIELD *a1, uint64_t a2)
{
  int v4 = *(const char ***)a2;
  int v5 = *(unsigned __int8 *)(a2 + 12);
  int v6 = *(_DWORD *)(a2 + 8);
  int v7 = field_buffer(a1, 0);
  if (!v4) {
    return 0;
  }
  int v8 = (unsigned __int8 *)v7;
  int v9 = v6 + 1;
  do
  {
    if (!--v9)
    {
      int v4 = *(const char ***)a2;
      goto LABEL_9;
    }
    uint64_t v10 = (char *)*v4++;
  }
  while (sub_22B842D20((unsigned __int8 *)v10, v8, v5 != 0) != 2);
  if (v9 > 1) {
    goto LABEL_10;
  }
  int v4 = *(const char ***)a2;
  if (v9 == 1) {
    goto LABEL_10;
  }
LABEL_9:
  if (sub_22B842D20(byte_26840B110, v8, v5 != 0) != 2) {
    return 0;
  }
LABEL_10:
  set_field_buffer(a1, 0, *v4);
  return 1;
}

uint64_t sub_22B842C30(FIELD *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a2 + 2);
  uint64_t v5 = *a2;
  int v6 = *((unsigned __int8 *)a2 + 12);
  int v7 = field_buffer(a1, 0);
  if (!v5) {
    return 0;
  }
  int v8 = (unsigned __int8 *)v7;
  int v9 = (const char **)(v5 + 8 * (v4 - 1));
  int v10 = v4 + 1;
  do
  {
    if (!--v10)
    {
      int v9 = (const char **)(*a2 + 8 * *((int *)a2 + 2) - 8);
      goto LABEL_9;
    }
    int v11 = (char *)*v9--;
  }
  while (sub_22B842D20((unsigned __int8 *)v11, v8, v6 != 0) != 2);
  if (v10 > 1) {
    goto LABEL_10;
  }
  int v9 = (const char **)(*a2 + 8 * *((int *)a2 + 2) - 8);
  if (v10 == 1) {
    goto LABEL_10;
  }
LABEL_9:
  if (sub_22B842D20(byte_26840B110, v8, v6 != 0) != 2) {
    return 0;
  }
LABEL_10:
  set_field_buffer(a1, 0, *v9);
  return 1;
}

uint64_t sub_22B842D20(unsigned __int8 *a1, unsigned __int8 *a2, char a3)
{
  do
  {
    int v6 = *a2++;
    int v5 = v6;
  }
  while (v6 == 32);
  do
  {
    int v8 = *a1++;
    int v7 = v8;
  }
  while (v8 == 32);
  if (!v5) {
    return 2 * (v7 == 0);
  }
  if (a3)
  {
    for (uint64_t i = -1; ; ++i)
    {
      int v10 = a1[i];
      if (v10 != a2[i]) {
        break;
      }
      if (!v10) {
        return 2;
      }
    }
    int v15 = &a1[i];
    unint64_t v16 = &a2[i];
  }
  else
  {
    for (uint64_t j = -1; ; ++j)
    {
      __darwin_ct_rune_t v13 = __toupper(a1[j]);
      __darwin_ct_rune_t v14 = a2[j];
      if (v13 != __toupper(v14)) {
        break;
      }
      if (!v14) {
        return 2;
      }
    }
    int v15 = &a1[j];
    unint64_t v16 = &a2[j];
  }
  while (*v16 == 32)
    ++v16;
  if (*v16) {
    return 0;
  }
  if (*v15) {
    return 1;
  }
  return 2;
}

_DWORD *sub_22B842E20(int **a1)
{
  uint64_t v1 = *a1;
  *a1 += 2;
  int v2 = *v1;
  *a1 = v1 + 4;
  uint64_t v3 = *((void *)v1 + 1);
  *a1 = v1 + 6;
  uint64_t v4 = *((void *)v1 + 2);
  int result = malloc(0x18uLL);
  if (result)
  {
    _DWORD *result = v2;
    result[1] = 0;
    *((void *)result + 1) = v3;
    *((void *)result + 2) = v4;
  }
  return result;
}

__n128 sub_22B842E80(__n128 *a1)
{
  if (a1)
  {
    int v2 = (__n128 *)malloc(0x18uLL);
    if (v2)
    {
      __n128 result = *a1;
      *int v2 = *a1;
      v2[1].n128_u64[0] = a1[1].n128_u64[0];
    }
  }
  return result;
}

void sub_22B842EC4(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t sub_22B842ED0(FIELD *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  int v5 = *(_DWORD *)a2;
  int v6 = field_buffer(a1, 0);
  int v7 = v6;
  do
    int v8 = *v6++;
  while (v8 == 32);
  if (!*(v6 - 1)) {
    return 0;
  }
  if (v8 == 45)
  {
    if (!*v6) {
      return 0;
    }
  }
  else
  {
    --v6;
  }
  *(_DWORD *)int v20 = 0;
  uint64_t result = (uint64_t)_nc_Widen_String(v6, (unsigned int *)v20);
  if (!result) {
    return result;
  }
  if (*(int *)v20 <= 0)
  {
    free((void *)result);
    int v14 = 1;
    goto LABEL_26;
  }
  uint64_t v10 = 0;
  BOOL v11 = 0;
  char v12 = 0;
  while (1)
  {
    uint64_t v13 = *(unsigned int *)(result + 4 * v10);
    if (v12)
    {
      if (v13 != 32) {
        break;
      }
LABEL_15:
      char v12 = 1;
      goto LABEL_16;
    }
    if (v13 == 32) {
      goto LABEL_15;
    }
    if (v13 <= 0xFF && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x400) != 0)
    {
      char v12 = 0;
      goto LABEL_16;
    }
    char v12 = 0;
    if ((*(_DWORD *)(result + 4 * v10) & 0xFEu) - 48 > 9) {
      break;
    }
LABEL_16:
    BOOL v11 = ++v10 >= (unint64_t)*(unsigned int *)v20;
    if (*(unsigned int *)v20 == v10)
    {
      int v14 = 1;
      goto LABEL_25;
    }
  }
  int v14 = 0;
LABEL_25:
  free((void *)result);
  if (!v11) {
    return 0;
  }
LABEL_26:
  uint64_t v15 = atol(v7);
  uint64_t v16 = v15;
  if ((v15 > v4 || v15 < v3) && v3 < v4) {
    int v19 = 0;
  }
  else {
    int v19 = v14;
  }
  uint64_t result = v19 != 0;
  if (v19)
  {
    __sprintf_chk(v20, 0, 0x64uLL, "%.*ld", v5 & ~(v5 >> 31), v16);
    set_field_buffer(a1, 0, v20);
    return 1;
  }
  return result;
}

uint64_t sub_22B8430A0(int a1)
{
  if (a1 - 48 < 0xA) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) >> 10) & 1;
  }
  if (a1 == 45) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t sub_22B8430D0(const FIELD *a1)
{
  unsigned int v1 = field_buffer(a1, 0);
  uint64_t result = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unsigned int v6 = 0;
  if (*v1 - 48 <= 9)
  {
    if (sscanf(v1, "%u.%u.%u.%u%n", &v8, (char *)&v7 + 4, &v7, &v6, (char *)&v8 + 4) == 4)
    {
      uint64_t v3 = &v1[SHIDWORD(v8)];
      uint64_t v4 = MEMORY[0x263EF8318];
      do
      {
        uint64_t v5 = *v3;
        if (*v3 < 0) {
          uint64_t result = __maskrune(v5, 0x4000uLL);
        }
        else {
          uint64_t result = *(_DWORD *)(v4 + 4 * v5 + 60) & 0x4000;
        }
        ++v3;
      }
      while (result);
      if (!*(v3 - 1) && v8 <= 0xFF && HIDWORD(v7) <= 0xFF && v7 <= 0xFF) {
        return v6 < 0x100;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL sub_22B8431D0(int a1)
{
  return a1 == 46 || (a1 & 0xFEu) - 48 < 0xA;
}

void *sub_22B8431E8(int **a1)
{
  unsigned int v1 = *a1;
  *a1 += 2;
  int v2 = *v1;
  *a1 = v1 + 4;
  uint64_t v3 = *((void *)v1 + 1);
  *a1 = v1 + 6;
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = malloc(0x20uLL);
  unsigned int v6 = v5;
  if (v5)
  {
    *(_DWORD *)uint64_t v5 = v2;
    v5[1] = v3;
    v5[2] = v4;
    v5[3] = localeconv();
  }
  return v6;
}

__n128 sub_22B843258(uint64_t a1)
{
  if (a1)
  {
    int v2 = malloc(0x20uLL);
    if (v2)
    {
      __n128 result = *(__n128 *)a1;
      long long v4 = *(_OWORD *)(a1 + 16);
      *int v2 = *(_OWORD *)a1;
      v2[1] = v4;
    }
  }
  return result;
}

void sub_22B843294(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t sub_22B8432A0(FIELD *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v4 = *(double *)(a2 + 8);
  double v5 = *(double *)(a2 + 16);
  int v6 = *(_DWORD *)a2;
  uint64_t v7 = field_buffer(a1, 0);
  uint64_t v8 = v7;
  int v9 = *(void **)(a2 + 24);
  do
    int v10 = *v7++;
  while (v10 == 32);
  if (!*(v7 - 1)) {
    return 0;
  }
  if (v10 == 43 || v10 == 45)
  {
    if (!*v7) {
      return 0;
    }
  }
  else
  {
    --v7;
  }
  *(_DWORD *)unint64_t v23 = 0;
  uint64_t result = (uint64_t)_nc_Widen_String(v7, (unsigned int *)v23);
  if (!result) {
    return result;
  }
  if (*(int *)v23 <= 0)
  {
    free((void *)result);
    int v18 = 1;
    goto LABEL_34;
  }
  uint64_t v12 = 0;
  BOOL v13 = 0;
  int v14 = 0;
  char v15 = 0;
  while (1)
  {
    uint64_t v16 = *(unsigned int *)(result + 4 * v12);
    if (v15)
    {
      if (v16 != 32) {
        break;
      }
LABEL_16:
      char v15 = 1;
      goto LABEL_17;
    }
    if (v16 == 32) {
      goto LABEL_16;
    }
    if (v9 && *v9) {
      int v17 = *(char *)*v9;
    }
    else {
      int v17 = 46;
    }
    if (v16 == v17)
    {
      if (v14 > 0) {
        break;
      }
      char v15 = 0;
      int v14 = 1;
      goto LABEL_17;
    }
    if (v16 <= 0xFF && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v16 + 60) & 0x400) != 0)
    {
      char v15 = 0;
      goto LABEL_17;
    }
    char v15 = 0;
    if ((*(_DWORD *)(result + 4 * v12) & 0xFEu) - 48 > 9) {
      break;
    }
LABEL_17:
    BOOL v13 = ++v12 >= (unint64_t)*(unsigned int *)v23;
    if (*(unsigned int *)v23 == v12)
    {
      int v18 = 1;
      goto LABEL_33;
    }
  }
  int v18 = 0;
LABEL_33:
  free((void *)result);
  if (!v13) {
    return 0;
  }
LABEL_34:
  double v19 = atof(v8);
  if ((v19 > v5 || v19 < v4) && v4 < v5) {
    int v22 = 0;
  }
  else {
    int v22 = v18;
  }
  uint64_t result = v22 != 0;
  if (v22)
  {
    __sprintf_chk(v23, 0, 0x40uLL, "%.*f", v6 & ~(v6 >> 31), v19);
    set_field_buffer(a1, 0, v23);
    return 1;
  }
  return result;
}

BOOL sub_22B8434B8(unsigned int a1, uint64_t a2)
{
  int v2 = *(void **)(a2 + 24);
  if (a1 <= 0xFF && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x400) != 0 || (a1 & 0xFE) - 48 < 0xA) {
    return 1;
  }
  uint64_t v3 = 1;
  if (a1 != 43 && a1 != 45)
  {
    if (v2 && *v2) {
      int v5 = *(char *)*v2;
    }
    else {
      int v5 = 46;
    }
    return v5 == a1;
  }
  return v3;
}

void **sub_22B84352C(const char ***a1)
{
  unsigned int v1 = (*a1)++;
  int v2 = *v1;
  if (!*v1) {
    return 0;
  }
  uint64_t v3 = (void **)calloc(1uLL, 0x10uLL);
  if (v3)
  {
    double v4 = (regex_t *)malloc(0x20uLL);
    char *v3 = v4;
    if (!v4)
    {
LABEL_7:
      free(v3);
      return 0;
    }
    if (regcomp(v4, v2, 13))
    {
      if (*v3) {
        free(*v3);
      }
      goto LABEL_7;
    }
    int v6 = malloc(8uLL);
    v3[1] = v6;
    if (v6) {
      *int v6 = 1;
    }
  }
  return v3;
}

uint64_t sub_22B8435C8(uint64_t result)
{
  if (result) {
    ++**(void **)(result + 8);
  }
  return result;
}

void sub_22B8435E0(void *a1)
{
  if (a1)
  {
    int v2 = (void *)a1[1];
    if ((*v2)-- == 1)
    {
      if (*a1)
      {
        free(v2);
        MEMORY[0x230F4E160](*a1);
        free((void *)*a1);
      }
      free(a1);
    }
  }
}

BOOL sub_22B843654(const FIELD *a1, const regex_t **a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = *a2;
  if (!*a2) {
    return 0;
  }
  uint64_t v3 = field_buffer(a1, 0);
  return regexec(v2, v3, 0, 0, 0) == 0;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

uint64_t _nc_wcrtomb()
{
  return MEMORY[0x270F9A0B0]();
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x270ED86F0](a1);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int copywin(const WINDOW *a1, WINDOW *a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  return MEMORY[0x270F9A0B8](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8);
}

int delwin(WINDOW *a1)
{
  return MEMORY[0x270F9A0C8](a1);
}

WINDOW *__cdecl derwin(WINDOW *a1, int a2, int a3, int a4, int a5)
{
  return (WINDOW *)MEMORY[0x270F9A0D0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
}

void free(void *a1)
{
}

int getmouse(MEVENT *a1)
{
  return MEMORY[0x270F9A0D8](a1);
}

BOOL is_linetouched(WINDOW *a1, int a2)
{
  return MEMORY[0x270F9A0E0](a1, *(void *)&a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x270EDA090]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int mblen(const char *__s, size_t __n)
{
  return MEMORY[0x270EDA3F0](__s, __n);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDA448](a1, a2, a3);
}

WINDOW *__cdecl newpad(int a1, int a2)
{
  return (WINDOW *)MEMORY[0x270F9A0E8](*(void *)&a1, *(void *)&a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x270EDB1A8](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x270EDB1B8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

uint64_t setcchar()
{
  return MEMORY[0x270F9A0F8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t wadd_wch()
{
  return MEMORY[0x270F9A140]();
}

uint64_t wadd_wchnstr()
{
  return MEMORY[0x270F9A148]();
}

int waddch(WINDOW *a1, const chtype a2)
{
  return MEMORY[0x270F9A150](a1, *(void *)&a2);
}

int waddnstr(WINDOW *a1, const char *a2, int a3)
{
  return MEMORY[0x270F9A158](a1, a2, *(void *)&a3);
}

void wbkgdset(WINDOW *a1, chtype a2)
{
}

int wclear(WINDOW *a1)
{
  return MEMORY[0x270F9A168](a1);
}

int wclrtobot(WINDOW *a1)
{
  return MEMORY[0x270F9A170](a1);
}

int wclrtoeol(WINDOW *a1)
{
  return MEMORY[0x270F9A178](a1);
}

void wcursyncup(WINDOW *a1)
{
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x270EDBBE0](*(void *)&a1);
}

int wdelch(WINDOW *a1)
{
  return MEMORY[0x270F9A188](a1);
}

BOOL wenclose(const WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x270F9A190](a1, *(void *)&a2, *(void *)&a3);
}

int werase(WINDOW *a1)
{
  return MEMORY[0x270F9A198](a1);
}

uint64_t win_wch()
{
  return MEMORY[0x270F9A1A0]();
}

uint64_t win_wchnstr()
{
  return MEMORY[0x270F9A1A8]();
}

chtype winch(WINDOW *a1)
{
  return MEMORY[0x270F9A1B0](a1);
}

int winnstr(WINDOW *a1, char *a2, int a3)
{
  return MEMORY[0x270F9A1B8](a1, a2, *(void *)&a3);
}

uint64_t wins_wch()
{
  return MEMORY[0x270F9A1C0]();
}

int winsch(WINDOW *a1, chtype a2)
{
  return MEMORY[0x270F9A1C8](a1, *(void *)&a2);
}

int winsdelln(WINDOW *a1, int a2)
{
  return MEMORY[0x270F9A1D0](a1, *(void *)&a2);
}

BOOL wmouse_trafo(const WINDOW *a1, int *a2, int *a3, BOOL a4)
{
  return MEMORY[0x270F9A1D8](a1, a2, a3, a4);
}

int wmove(WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x270F9A1E0](a1, *(void *)&a2, *(void *)&a3);
}

int wresize(WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x270F9A1E8](a1, *(void *)&a2, *(void *)&a3);
}

void wsyncup(WINDOW *a1)
{
}