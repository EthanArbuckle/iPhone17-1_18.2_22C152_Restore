uint64_t HelperBase<GenericOutOfLine>::copyBlock(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = result;
  v4 = (unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 1);
  *(void *)(result + 32) = v4;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 8) = a2 + 32;
  *(void *)(result + 16) = a3 + 32;
  while (1)
  {
    v5 = *v4;
    v6 = (v5 & 0xF) + 1;
    switch(v5 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        v7 = *(void *)(v3 + 16) + v6;
        *(void *)(v3 + 8) += v6;
        *(void *)(v3 + 16) = v7;
        break;
      case 2u:
        v8 = (8 * v6);
        v9 = *(void *)(v3 + 8) + v8;
        v10 = *(void *)(v3 + 16) + v8;
        *(void *)(v3 + 8) = v9;
        *(void *)(v3 + 16) = v10;
        break;
      case 3u:
        result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)v3, v6);
        break;
      case 4u:
        result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)v3, v6);
        break;
      case 5u:
        result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(v3, v6);
        break;
      case 6u:
        result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(v3, v6);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock();
    }
    v4 = (unsigned __int8 *)(*(void *)(v3 + 32) + 1);
    *(void *)(v3 + 32) = v4;
    *(_DWORD *)(v3 + 24) = 0;
  }
}

uint64_t HelperBase<GenericOutOfLine>::destroyBlock(uint64_t result, uint64_t a2, char a3, id *a4)
{
  uint64_t v5 = result;
  if (a3)
  {
    v6 = (unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 1);
    *(void *)(result + 32) = v6;
    *(_DWORD *)(result + 24) = 0;
    *(void *)(result + 8) = a2 + 32;
  }
  else
  {
    v6 = *(unsigned __int8 **)(result + 32);
  }
  while (2)
  {
    unsigned int v7 = *v6;
    uint64_t v8 = (v7 & 0xF) + 1;
    switch(v7 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        uint64_t v9 = *(void *)(v5 + 8) + v8;
        goto LABEL_7;
      case 2u:
        uint64_t v9 = *(void *)(v5 + 8) + (8 * v8);
LABEL_7:
        *(void *)(v5 + 8) = v9;
        goto LABEL_15;
      case 3u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(v5, v8, a4);
        if (result) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 4u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(v5, v8, a4);
        if (result) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 5u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(v5, v8, (const void **)a4);
        if (result) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 6u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(v5, v8, a4);
        if ((result & 1) == 0)
        {
LABEL_15:
          v6 = (unsigned __int8 *)(*(void *)(v5 + 32) + 1);
          *(void *)(v5 + 32) = v6;
          *(_DWORD *)(v5 + 24) = 0;
          continue;
        }
LABEL_16:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock();
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock();
    }
  }
}

void HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>()
{
  __assert_rtn("copyCapture", "runtime.cpp", 306, "capcounter == 0 && \"capcounter expected to be zero\"");
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  v3 = a2;
  unsigned int v5 = a3 & 0x9F;
  if (v5 > 0x17)
  {
    if (v5 - 131 > 0x14 || ((1 << (v5 + 125)) & 0x110011) == 0)
    {
      if (v5 != 24) {
        return;
      }
      goto LABEL_12;
    }
LABEL_25:
    *(void *)a1 = v3;
    return;
  }
  switch(v5)
  {
    case 3u:
      _Block_retain_object(a2);
      goto LABEL_25;
    case 7u:
      v3 = _Block_copy(a2);
      goto LABEL_25;
    case 8u:
LABEL_12:
      uint64_t v7 = *((void *)a2 + 1);
      if ((*(_DWORD *)(v7 + 16) & 0xFFFE) != 0)
      {
        if ((*(_DWORD *)(v7 + 16) & 0x1000000) != 0)
        {
          do
          {
            int v8 = *(_DWORD *)(v7 + 16);
            if ((~v8 & 0xFFFE) == 0) {
              break;
            }
            int v9 = *(_DWORD *)(v7 + 16);
            atomic_compare_exchange_strong((atomic_uint *volatile)(v7 + 16), (unsigned int *)&v9, v8 + 2);
          }
          while (v9 != v8);
        }
      }
      else
      {
        v10 = malloc_type_malloc(*((unsigned int *)a2 + 5), 0x9B1279E0uLL);
        *(void *)v10 = 0;
        v10[4] = v3[4] | 0x1000004;
        *((void *)v10 + 1) = v10;
        *((void *)v3 + 1) = v10;
        v10[5] = v3[5];
        if ((v3[4] & 0x2000000) != 0)
        {
          *((void *)v10 + 3) = *((void *)v3 + 3);
          *((void *)v10 + 4) = *((void *)v3 + 4);
          if (v3[4] >> 28 == 1) {
            *((void *)v10 + 5) = *((void *)v3 + 5);
          }
          (*((void (**)(void))v3 + 3))();
        }
        else
        {
          _platform_memmove();
        }
      }
      v3 = (_DWORD *)*((void *)v3 + 1);
      goto LABEL_25;
  }
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(uint64_t a1, unsigned int a2, const void **a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0;
  }
  v6 = *(const void ***)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    _Block_release(*v6);
    v6 = (const void **)(*(void *)(a1 + 8) + 8);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

void _Block_release(const void *aBlock)
{
  if (aBlock)
  {
    v1 = (void *)aBlock;
    if ((*((_DWORD *)aBlock + 2) & 0x10000000) == 0 && (*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
    {
      while (1)
      {
        int v2 = *((_DWORD *)aBlock + 2);
        if ((v2 & 0xFFFE) == 0 || (*((_DWORD *)aBlock + 2) & 0xFFFE) == 65534) {
          break;
        }
        if ((unsigned __int16)*((_DWORD *)aBlock + 2) == 2) {
          int v4 = -1;
        }
        else {
          int v4 = -2;
        }
        int v5 = *((_DWORD *)aBlock + 2);
        atomic_compare_exchange_strong((atomic_uint *volatile)aBlock + 2, (unsigned int *)&v5, v4 + v2);
        if (v5 == v2)
        {
          if ((unsigned __int16)v2 == 2)
          {
            uint64_t v6 = **((void **)aBlock + 3);
            if (v6)
            {
              switch((unsigned __int16)v6 >> 14)
              {
                case 1:
                  if (hasInlineExtendedLayout((Block_layout *)aBlock)) {
                    char v8 = 1;
                  }
                  else {
                    char v8 = 5;
                  }
                  break;
                case 2:
                  char v8 = 2;
                  break;
                case 3:
                  char v8 = 3;
                  break;
                default:
                  goto LABEL_16;
              }
              char v9 = v8;
              BOOL v7 = (ExtendedInline *)&v9;
              aBlock = v1;
            }
            else
            {
LABEL_16:
              BOOL v7 = 0;
            }
            _call_dispose_helpers_excp((Block_layout *)aBlock, v7);
            _Block_destructInstance(v1);
            free(v1);
          }
          return;
        }
      }
    }
  }
}

uint64_t _call_dispose_helpers_excp(Block_layout *a1, ExtendedInline *a2)
{
  v5[1] = a1;
  v5[0] = 4;
  v5[2] = a2;
  _call_custom_dispose_helper((uint64_t)a1);
  if (a2)
  {
    LODWORD(v5[0]) = 3;
    _call_generic_destroy_helper(a1, a2);
  }
  LODWORD(v5[0]) = 0;
  return _cleanup_generic_captures(v5);
}

void sub_20D7F9EC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _cleanup_generic_captures((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _call_custom_dispose_helper(uint64_t result)
{
  if ((*(_DWORD *)(result + 8) & 0x2000000) != 0)
  {
    v1 = *(uint64_t (**)(void))(*(void *)(result + 24) + 24);
    if (v1) {
      return v1();
    }
  }
  return result;
}

void *HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(void *result, unsigned int a2)
{
  if (*((_DWORD *)result + 6)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>();
  }
  if (a2)
  {
    v3 = result;
    int v5 = (void *)*((void *)result + 1);
    int v4 = (const void **)*((void *)result + 2);
    do
    {
      result = _Block_copy(*v4);
      *int v5 = result;
      int v5 = (void *)(v3[1] + 8);
      int v4 = (const void **)(v3[2] + 8);
      v3[1] = v5;
      v3[2] = v4;
      unsigned int v6 = *((_DWORD *)v3 + 6) + 1;
      *((_DWORD *)v3 + 6) = v6;
    }
    while (v6 < a2);
  }
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  if (!aBlock) {
    return 0;
  }
  if ((*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    do
    {
      int v7 = *((_DWORD *)aBlock + 2);
      if ((~v7 & 0xFFFE) == 0) {
        break;
      }
      int v8 = *((_DWORD *)aBlock + 2);
      atomic_compare_exchange_strong((atomic_uint *volatile)aBlock + 2, (unsigned int *)&v8, v7 + 2);
    }
    while (v8 != v7);
    return (void *)aBlock;
  }
  if ((*((_DWORD *)aBlock + 2) & 0x10000000) != 0) {
    return (void *)aBlock;
  }
  int v2 = (Block_layout *)malloc_type_malloc(*(void *)(*((void *)aBlock + 3) + 8), 0x36549350uLL);
  if (v2)
  {
    if (!*((void *)aBlock + 2)) {
      _Block_copy_cold_1();
    }
    _platform_memmove();
    v2->invoke = (void (*)(void *, ...))*((void *)aBlock + 2);
    v2->flags &= 0xFFFF0000;
    v2->flags |= 0x1000002u;
    uint64_t v3 = **((void **)aBlock + 3);
    if (v3)
    {
      switch((unsigned __int16)v3 >> 14)
      {
        case 1:
          if (hasInlineExtendedLayout((Block_layout *)aBlock)) {
            char v10 = 1;
          }
          else {
            char v10 = 5;
          }
          break;
        case 2:
          char v10 = 2;
          break;
        case 3:
          char v10 = 3;
          break;
        default:
          goto LABEL_8;
      }
      char v11 = v10;
      unsigned int v6 = (GenericInline *)&v11;
      int v4 = v2;
      int v5 = aBlock;
    }
    else
    {
LABEL_8:
      int v4 = v2;
      int v5 = aBlock;
      unsigned int v6 = 0;
    }
    _call_copy_helpers_excp(v4, (uint64_t)v5, v6);
    v2->isa = OBJC_CLASS_____NSMallocBlock__;
  }
  return v2;
}

void _call_copy_helpers_excp(Block_layout *a1, uint64_t a2, GenericInline *a3)
{
  v5[0] = 0;
  v5[1] = a1;
  v5[2] = a3;
  if (a3)
  {
    LODWORD(v5[0]) = 1;
    _call_generic_copy_helper(a1, a2, a3);
  }
  _call_custom_copy_helper((uint64_t)a1, a2);
  LODWORD(v5[0]) = 0;
  _cleanup_generic_captures((uint64_t)v5);
}

void sub_20D7FA1CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _cleanup_generic_captures((uint64_t)va);
  _Unwind_Resume(a1);
}

void _cleanup_generic_captures(uint64_t a1)
{
  if (*(_DWORD *)a1)
  {
    int v2 = *(unsigned char **)(a1 + 16);
    if (v2)
    {
      switch(*v2 & 3)
      {
        case 1:
          if ((*v2 & 4) != 0) {
            HelperBase<ExtendedOutOfLine>::cleanup_captures((uint64_t)v2, a1);
          }
          else {
            HelperBase<ExtendedInline>::cleanup_captures((uint64_t)v2, a1);
          }
          break;
        case 2:
          HelperBase<GenericInline>::cleanup_captures((uint64_t)v2, a1);
          break;
        case 3:
          HelperBase<GenericOutOfLine>::cleanup_captures((uint64_t)v2, a1);
          break;
        default:
          _cleanup_generic_captures_cold_1();
      }
    }
    uint64_t v3 = *(void **)(a1 + 8);
    free(v3);
  }
}

uint64_t _call_custom_copy_helper(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x2000000) != 0)
  {
    int v2 = *(uint64_t (**)(void))(*(void *)(a2 + 24) + 16);
    if (v2) {
      return v2();
    }
  }
  return result;
}

uint64_t _call_generic_copy_helper(Block_layout *a1, uint64_t a2, GenericInline *this)
{
  if (!this) {
    _call_generic_copy_helper_cold_1();
  }
  switch(*(unsigned char *)this & 3)
  {
    case 1:
      if ((*(unsigned char *)this & 4) != 0)
      {
        uint64_t result = HelperBase<ExtendedOutOfLine>::copyBlock((uint64_t)this, (uint64_t)a1, a2);
      }
      else
      {
        uint64_t result = HelperBase<ExtendedInline>::copyBlock((uint64_t)this, a1, a2);
      }
      break;
    case 2:
      uint64_t result = HelperBase<GenericInline>::copyBlock(this, (uint64_t)a1, a2);
      break;
    case 3:
      uint64_t result = HelperBase<GenericOutOfLine>::copyBlock((uint64_t)this, (uint64_t)a1, a2);
      break;
    default:
      _call_generic_copy_helper_cold_2();
  }
  return result;
}

uint64_t _call_generic_destroy_helper(Block_layout *a1, ExtendedInline *this)
{
  if (!this) {
    _call_generic_destroy_helper_cold_1();
  }
  switch(*(unsigned char *)this & 3)
  {
    case 1:
      if ((*(unsigned char *)this & 4) != 0)
      {
        uint64_t result = HelperBase<ExtendedOutOfLine>::destroyBlock(this);
      }
      else
      {
        uint64_t result = HelperBase<ExtendedInline>::destroyBlock(this, a1, 1, 0);
      }
      break;
    case 2:
      uint64_t result = HelperBase<GenericInline>::destroyBlock(this, (uint64_t)a1, 1, 0);
      break;
    case 3:
      uint64_t result = HelperBase<GenericOutOfLine>::destroyBlock((uint64_t)this, (uint64_t)a1, 1, 0);
      break;
    default:
      _call_generic_destroy_helper_cold_2();
  }
  return result;
}

unint64_t HelperBase<GenericInline>::destroyBlock(GenericInline *this, uint64_t a2, int a3, id *a4)
{
  if (a3)
  {
    *((_DWORD *)this + 7) = *(void *)(*(void *)(a2 + 24) - 8);
    *((_DWORD *)this + 8) = 8;
    *((_DWORD *)this + 6) = 0;
    *((void *)this + 1) = a2 + 32;
  }
  while (2)
  {
    unint64_t result = GenericInline::getNextOpcodeAndCount(this);
    unint64_t v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v8 = *((void *)this + 1) + v7;
        goto LABEL_6;
      case 2:
        unint64_t v8 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v8;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(this, v7, a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) += 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock();
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock();
    }
  }
}

unint64_t HelperBase<GenericInline>::copyBlock(GenericInline *this, uint64_t a2, uint64_t a3)
{
  *((_DWORD *)this + 7) = *(void *)(*(void *)(a2 + 24) - 8);
  *((_DWORD *)this + 8) = 8;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 1) = a2 + 32;
  *((void *)this + 2) = a3 + 32;
  while (1)
  {
    unint64_t result = GenericInline::getNextOpcodeAndCount(this);
    unint64_t v5 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v6 = *((void *)this + 2) + v5;
        *((void *)this + 1) += v5;
        *((void *)this + 2) = v6;
        break;
      case 2:
        uint64_t v7 = (8 * HIDWORD(result));
        uint64_t v8 = *((void *)this + 1) + v7;
        uint64_t v9 = *((void *)this + 2) + v7;
        *((void *)this + 1) = v8;
        *((void *)this + 2) = v9;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(this, HIDWORD(result));
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(this, HIDWORD(result));
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, HIDWORD(result));
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result));
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock();
    }
    *((_DWORD *)this + 8) += 4;
    *((_DWORD *)this + 6) = 0;
  }
}

unint64_t GenericInline::getNextOpcodeAndCount(GenericInline *this)
{
  int v1 = *((_DWORD *)this + 8);
  HIDWORD(v2) = v1;
  LODWORD(v2) = v1 - 8;
  unint64_t v3 = 0;
  uint64_t v4 = 3;
  switch((v2 >> 2))
  {
    case 0u:
      goto LABEL_5;
    case 1u:
      uint64_t v4 = 4;
      goto LABEL_5;
    case 2u:
      uint64_t v4 = 5;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = 6;
LABEL_5:
      unint64_t v3 = v4 | ((unint64_t)((*((_DWORD *)this + 7) >> v1) & 0xF) << 32);
      break;
    case 4u:
      return v3;
    default:
      GenericInline::getNextOpcodeAndCount();
  }
  return v3;
}

id HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(id result, unsigned int a2)
{
  if (*((_DWORD *)result + 6)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>();
  }
  if (a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = (id *)*((void *)result + 2);
    do
    {
      unint64_t result = *v4;
      uint64_t v4 = (id *)(v3[2] + 8);
      v3[1] += 8;
      v3[2] = v4;
      unsigned int v5 = *((_DWORD *)v3 + 6) + 1;
      *((_DWORD *)v3 + 6) = v5;
    }
    while (v5 < a2);
  }
  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 24)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>();
  }
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = *(void *)(result + 8);
    uint64_t v4 = *(id **)(v3 + 16);
    do
    {
      objc_copyWeak((id *)result, v4);
      unint64_t result = *(void *)(v3 + 8) + 8;
      uint64_t v4 = (id *)(*(void *)(v3 + 16) + 8);
      *(void *)(v3 + 8) = result;
      *(void *)(v3 + 16) = v4;
      unsigned int v5 = *(_DWORD *)(v3 + 24) + 1;
      *(_DWORD *)(v3 + 24) = v5;
    }
    while (v5 < a2);
  }
  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 24)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>();
  }
  if (a2)
  {
    uint64_t v3 = result;
    unint64_t result = *(void *)(result + 8);
    uint64_t v4 = *(const void ***)(v3 + 16);
    do
    {
      _Block_object_assign((void *)result, *v4, 8);
      unint64_t result = *(void *)(v3 + 8) + 8;
      uint64_t v4 = (const void **)(*(void *)(v3 + 16) + 8);
      *(void *)(v3 + 8) = result;
      *(void *)(v3 + 16) = v4;
      unsigned int v5 = *(_DWORD *)(v3 + 24) + 1;
      *(_DWORD *)(v3 + 24) = v5;
    }
    while (v5 < a2);
  }
  return result;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(uint64_t a1, unsigned int a2, id *a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0;
  }
  unint64_t v6 = *(id **)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }

    unint64_t v6 = (id *)(*(void *)(a1 + 8) + 8);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(uint64_t a1, unsigned int a2, id *a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0;
  }
  unint64_t v6 = *(id **)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    objc_destroyWeak(v6);
    unint64_t v6 = (id *)(*(void *)(a1 + 8) + 8);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(uint64_t a1, unsigned int a2, const void **a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0;
  }
  unint64_t v6 = *(const void ***)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    _Block_object_dispose(*v6, 8);
    unint64_t v6 = (const void **)(*(void *)(a1 + 8) + 8);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  unsigned int v2 = a2 & 0x9F;
  if (v2 > 7)
  {
    if (v2 == 24 || v2 == 8)
    {
      uint64_t v4 = *((void *)a1 + 1);
      if ((*(_DWORD *)(v4 + 16) & 0x1000000) != 0)
      {
        if ((*(_DWORD *)(v4 + 16) & 0xFFFE) == 0) {
          _Block_object_dispose_cold_1();
        }
        while (1)
        {
          int v6 = *(_DWORD *)(v4 + 16);
          if ((v6 & 0xFFFE) == 0 || (*(_DWORD *)(v4 + 16) & 0xFFFE) == 65534) {
            break;
          }
          if ((unsigned __int16)*(_DWORD *)(v4 + 16) == 2) {
            int v8 = -1;
          }
          else {
            int v8 = -2;
          }
          int v9 = *(_DWORD *)(v4 + 16);
          atomic_compare_exchange_strong((atomic_uint *volatile)(v4 + 16), (unsigned int *)&v9, v8 + v6);
          if (v9 == v6)
          {
            if ((unsigned __int16)v6 == 2)
            {
              if ((*(_DWORD *)(v4 + 16) & 0x2000000) != 0) {
                (*(void (**)(uint64_t))(v4 + 32))(v4);
              }
              free((void *)v4);
            }
            return;
          }
        }
      }
    }
  }
  else if (v2 == 3)
  {
    unsigned int v5 = _Block_release_object;
    v5(a1);
  }
  else if (v2 == 7)
  {
    _Block_release(a1);
  }
}

const char *__cdecl _Block_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2);
}

BOOL _Block_isDeallocating(const void *aBlock)
{
  return *((_DWORD *)aBlock + 2) & 1;
}

BOOL _Block_tryRetain(const void *aBlock)
{
  while (1)
  {
    int v1 = *((_DWORD *)aBlock + 2);
    BOOL v2 = (v1 & 1) == 0;
    if (~v1 & 0xFFFE) == 0 || (v1) {
      break;
    }
    int v4 = *((_DWORD *)aBlock + 2);
    atomic_compare_exchange_strong((atomic_uint *volatile)aBlock + 2, (unsigned int *)&v4, v1 + 2);
    if (v4 == v1) {
      return 1;
    }
  }
  return v2;
}

BOOL _Block_has_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(void *)(*((void *)aBlock + 3) + v2) != 0;
}

void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  release = callbacks->release;
  _Block_retain_object = (uint64_t (*)(const void *))callbacks->retain;
  _Block_release_object = (uint64_t (*)(const void *))release;
  _Block_destructInstance = (uint64_t (*)(const void *))callbacks->destructInstance;
}

unint64_t HelperBase<ExtendedOutOfLine>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HelperBase<ExtendedOutOfLine>::initState(a1, a2);
  *(void *)(a1 + 16) = a3 + 32;
  while (1)
  {
    unint64_t result = ExtendedOutOfLine::getNextOpcodeAndCount((ExtendedOutOfLine *)a1);
    unint64_t v6 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v7 = *(void *)(a1 + 16) + v6;
        *(void *)(a1 + 8) += v6;
        *(void *)(a1 + 16) = v7;
        break;
      case 2:
        uint64_t v8 = (8 * HIDWORD(result));
        uint64_t v9 = *(void *)(a1 + 8) + v8;
        uint64_t v10 = *(void *)(a1 + 16) + v8;
        *(void *)(a1 + 8) = v9;
        *(void *)(a1 + 16) = v10;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, HIDWORD(result));
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)a1, HIDWORD(result));
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, HIDWORD(result));
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, HIDWORD(result));
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock();
    }
    ++*(void *)(a1 + 32);
    *(_DWORD *)(a1 + 24) = 0;
  }
}

unint64_t HelperBase<ExtendedInline>::copyBlock(uint64_t a1, Block_layout *a2, uint64_t a3)
{
  ExtendedInline::initState(a1, a2);
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = a2 + 1;
  *(void *)(a1 + 16) = a3 + 32;
  while (1)
  {
    unint64_t result = ExtendedInline::getNextOpcodeAndCount((ExtendedInline *)a1);
    unint64_t v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v8 = *(void *)(a1 + 16) + v7;
        *(void *)(a1 + 8) += v7;
        *(void *)(a1 + 16) = v8;
        break;
      case 2:
        uint64_t v9 = (8 * HIDWORD(result));
        uint64_t v10 = *(void *)(a1 + 8) + v9;
        uint64_t v11 = *(void *)(a1 + 16) + v9;
        *(void *)(a1 + 8) = v10;
        *(void *)(a1 + 16) = v11;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, HIDWORD(result));
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)a1, HIDWORD(result));
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, HIDWORD(result));
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, HIDWORD(result));
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock();
    }
    *(_DWORD *)(a1 + 32) -= 4;
    *(_DWORD *)(a1 + 24) = 0;
  }
}

unint64_t HelperBase<ExtendedOutOfLine>::destroyBlock(ExtendedOutOfLine *this, uint64_t a2, int a3, id *a4)
{
  if (a3) {
    HelperBase<ExtendedOutOfLine>::initState((uint64_t)this, a2);
  }
  while (2)
  {
    unint64_t result = ExtendedOutOfLine::getNextOpcodeAndCount(this);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v7 = *((void *)this + 1) + HIDWORD(result);
        goto LABEL_6;
      case 2:
        unint64_t v7 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v7;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          ++*((void *)this + 4);
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock();
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock();
    }
  }
}

unint64_t HelperBase<ExtendedInline>::destroyBlock(ExtendedInline *this, Block_layout *a2, int a3, id *a4)
{
  if (a3)
  {
    ExtendedInline::initState((uint64_t)this, a2);
    *((_DWORD *)this + 6) = 0;
    *((void *)this + 1) = a2 + 1;
  }
  while (2)
  {
    unint64_t result = ExtendedInline::getNextOpcodeAndCount(this);
    unint64_t v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v9 = *((void *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        unint64_t v9 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(this, v8, a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if (result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) -= 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock();
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock();
    }
  }
}

unint64_t HelperBase<ExtendedOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v2 = *(void *)(a2 + 8);
      int v4 = *(id **)(a1 + 8);
      int v3 = 1;
      goto LABEL_6;
    case 2:
    case 4:
      uint64_t v2 = *(void *)(a2 + 8);
      int v3 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v2 = *(void *)(a2 + 8);
      int v3 = 0;
LABEL_5:
      int v4 = 0;
LABEL_6:
      return HelperBase<ExtendedOutOfLine>::destroyBlock((ExtendedOutOfLine *)a1, v2, v3, v4);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures();
  }
}

unint64_t HelperBase<ExtendedInline>::cleanup_captures(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v2 = *(Block_layout **)(a2 + 8);
      int v4 = *(id **)(a1 + 8);
      int v3 = 1;
      goto LABEL_6;
    case 2:
    case 4:
      uint64_t v2 = *(Block_layout **)(a2 + 8);
      int v3 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v2 = *(Block_layout **)(a2 + 8);
      int v3 = 0;
LABEL_5:
      int v4 = 0;
LABEL_6:
      return HelperBase<ExtendedInline>::destroyBlock((ExtendedInline *)a1, v2, v3, v4);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures();
  }
}

unint64_t HelperBase<GenericInline>::cleanup_captures(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v2 = *(void *)(a2 + 8);
      int v4 = *(id **)(a1 + 8);
      int v3 = 1;
      goto LABEL_6;
    case 2:
    case 4:
      uint64_t v2 = *(void *)(a2 + 8);
      int v3 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v2 = *(void *)(a2 + 8);
      int v3 = 0;
LABEL_5:
      int v4 = 0;
LABEL_6:
      return HelperBase<GenericInline>::destroyBlock((GenericInline *)a1, v2, v3, v4);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures();
  }
}

uint64_t HelperBase<GenericOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v2 = *(void *)(a2 + 8);
      int v4 = *(id **)(a1 + 8);
      char v3 = 1;
      goto LABEL_6;
    case 2:
    case 4:
      uint64_t v2 = *(void *)(a2 + 8);
      char v3 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v2 = *(void *)(a2 + 8);
      char v3 = 0;
LABEL_5:
      int v4 = 0;
LABEL_6:
      return HelperBase<GenericOutOfLine>::destroyBlock(a1, v2, v3, v4);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures();
  }
}

size_t Block_size(void *aBlock)
{
  return *(void *)(*((void *)aBlock + 3) + 8);
}

BOOL _Block_use_stret(void *aBlock)
{
  return (~*((_DWORD *)aBlock + 2) & 0x60000000) == 0;
}

const char *__cdecl _Block_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) != 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
}

const char *__cdecl _Block_extended_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) == 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16;
  }
  if (*(void *)(*((void *)aBlock + 3) + v2 + 8)) {
    return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
  }
  else {
    return (const char *)&unk_20D7FBBDB;
  }
}

BOOL hasInlineExtendedLayout(Block_layout *a1)
{
  if ((a1->flags & 0x80000000) == 0 || (a1->flags & 0x40000000) == 0) {
    return 1;
  }
  uint64_t v2 = 2;
  if ((a1->flags & 0x2000000) == 0) {
    uint64_t v2 = 1;
  }
  uintptr_t size = a1->descriptor[v2].size;
  if (size) {
    return size < 0x1000;
  }
  else {
    return (unint64_t)&unk_20D7FBBDB < 0x1000;
  }
}

unint64_t ExtendedOutOfLine::getNextOpcodeAndCount(ExtendedOutOfLine *this)
{
  unint64_t v1 = **((unsigned __int8 **)this + 4);
  if (v1 >= 0x70) {
    ExtendedOutOfLine::getNextOpcodeAndCount();
  }
  return *(void *)((char *)&unk_20D7FBA90 + ((v1 >> 1) & 0x78)) | ((unint64_t)((v1 & 0xF) + 1) << 32);
}

uint64_t HelperBase<ExtendedOutOfLine>::initState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0 && (*(_DWORD *)(a2 + 8) & 0x40000000) != 0)
  {
    uint64_t v3 = 32;
    if ((*(_DWORD *)(a2 + 8) & 0x2000000) == 0) {
      uint64_t v3 = 16;
    }
    uint64_t v2 = *(void **)(*(void *)(a2 + 24) + v3 + 8);
    if (!v2) {
      uint64_t v2 = &unk_20D7FBBDB;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  *(void *)(result + 32) = v2;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 8) = a2 + 32;
  return result;
}

uint64_t ExtendedInline::getNextOpcodeAndCount(ExtendedInline *this)
{
  int v2 = *((_DWORD *)this + 8);
  HIDWORD(v4) = v2;
  LODWORD(v4) = v2 + 4;
  uint64_t result = (v4 >> 2);
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 6;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 2:
      uint64_t result = 5;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 3:
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    default:
      ExtendedInline::getNextOpcodeAndCount();
  }
}

uint64_t ExtendedInline::initState(uint64_t this, Block_layout *a2)
{
  if (a2->flags < 0 && (a2->flags & 0x40000000) != 0)
  {
    uint64_t v3 = 2;
    if ((a2->flags & 0x2000000) == 0) {
      uint64_t v3 = 1;
    }
    uintptr_t size = a2->descriptor[v3].size;
    if (!size) {
      LOWORD(size) = (unsigned __int16)&unk_20D7FBBDB;
    }
  }
  else
  {
    LOWORD(size) = 0;
  }
  *(_WORD *)(this + 28) = size;
  *(_DWORD *)(this + 32) = 8;
  return this;
}

void _call_generic_copy_helper_cold_1()
{
}

void _call_generic_copy_helper_cold_2()
{
}

void HelperBase<ExtendedOutOfLine>::copyBlock()
{
}

void _call_generic_destroy_helper_cold_1()
{
}

void _call_generic_destroy_helper_cold_2()
{
}

void HelperBase<ExtendedOutOfLine>::destroyBlock()
{
}

{
  __assert_rtn("destroyBlock", "runtime.cpp", 491, "endptr && \"endptr isn't expected to be null\"");
}

void _cleanup_generic_captures_cold_1()
{
}

void HelperBase<ExtendedOutOfLine>::cleanup_captures()
{
  __assert_rtn("cleanup_captures", "runtime.cpp", 521, "info->state == EXCP_DESTROY_GENERIC");
}

void _Block_object_dispose_cold_1()
{
}

void ExtendedOutOfLine::getNextOpcodeAndCount()
{
}

void ExtendedInline::getNextOpcodeAndCount()
{
}

void GenericInline::getNextOpcodeAndCount()
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270EDCF08]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270EDCF20]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x270EDDBD8]();
}

void abort(void)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}