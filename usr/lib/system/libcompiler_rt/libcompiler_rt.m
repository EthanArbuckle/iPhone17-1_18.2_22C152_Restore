unint64_t __udivti3(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  return __udivmodti4(a1, a2, a3, a4, 0);
}

unint64_t __udivmodti4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a2;
  if (__PAIR128__(a2, a1) >= __PAIR128__(a4, a3))
  {
    if (a4)
    {
      int v7 = __clz(a4);
      int v8 = __clz(a2);
      unint64_t v6 = 0;
      char v9 = v7 - v8;
      if (v7 - v8 >= 0)
      {
        unint64_t v10 = a3 << v9;
        BOOL v11 = (v9 & 0x40) == 0;
        if ((((_BYTE)v7 - (_BYTE)v8) & 0x40) != 0) {
          unint64_t v12 = a3 << v9;
        }
        else {
          unint64_t v12 = (a4 << v9) | (a3 >> 1 >> ~v9);
        }
        if (v11) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = 0;
        }
        int v14 = ~v7 + v8;
        do
        {
          uint64_t v15 = ~v5 + __CFADD__(v13, ~a1) + v12;
          *((void *)&v16 + 1) = v6;
          *(void *)&long long v16 = v15;
          unint64_t v6 = v16 >> 63;
          unint64_t v5 = (__PAIR128__(v5, a1) - __PAIR128__(v12 & (v15 >> 63), v13 & (unint64_t)(v15 >> 63))) >> 64;
          a1 -= v13 & (v15 >> 63);
          *((void *)&v16 + 1) = v12;
          *(void *)&long long v16 = v13;
          uint64_t v13 = v16 >> 1;
          v12 >>= 1;
        }
        while (!__CFADD__(v14++, 1));
      }
      if (a5)
      {
        *a5 = a1;
        a5[1] = v5;
      }
    }
    else
    {
      if (a2 >= a3)
      {
        char v19 = __clz(a3);
        unint64_t v20 = a3 << v19;
        unint64_t v31 = ((a2 % a3) << v19) | (a1 >> 1 >> ~v19);
        unint64_t v32 = a3 << v19 >> 32;
        uint64_t v33 = (a3 << v19);
        unint64_t v34 = a1 << v19 >> 32;
        uint64_t v25 = (a1 << v19);
        unint64_t v26 = v31 / v32;
        unint64_t v35 = v31 % v32;
        do
        {
          if (!HIDWORD(v26) && v26 * v33 <= (v34 | (v35 << 32))) {
            break;
          }
          --v26;
          v35 += v32;
        }
        while (!HIDWORD(v35));
        unint64_t v28 = (v34 | (v31 << 32)) - v26 * v20;
        unint64_t v29 = v28 / v32;
        unint64_t v36 = v28 % v32;
        do
        {
          if (!HIDWORD(v29) && v29 * v33 <= (v25 | (v36 << 32))) {
            break;
          }
          --v29;
          v36 += v32;
        }
        while (!HIDWORD(v36));
      }
      else
      {
        char v19 = __clz(a3);
        unint64_t v20 = a3 << v19;
        unint64_t v21 = (a2 << v19) | (a1 >> 1 >> ~v19);
        unint64_t v22 = a3 << v19 >> 32;
        uint64_t v23 = (a3 << v19);
        unint64_t v24 = a1 << v19 >> 32;
        uint64_t v25 = (a1 << v19);
        unint64_t v26 = v21 / v22;
        unint64_t v27 = v21 % v22;
        do
        {
          if (!HIDWORD(v26) && v26 * v23 <= (v24 | (v27 << 32))) {
            break;
          }
          --v26;
          v27 += v22;
        }
        while (!HIDWORD(v27));
        unint64_t v28 = (v24 | (v21 << 32)) - v26 * v20;
        unint64_t v29 = v28 / v22;
        unint64_t v30 = v28 % v22;
        do
        {
          if (!HIDWORD(v29) && v29 * v23 <= (v25 | (v30 << 32))) {
            break;
          }
          --v29;
          v30 += v22;
        }
        while (!HIDWORD(v30));
      }
      unint64_t v37 = ((v25 | (v28 << 32)) - v29 * v20) >> v19;
      unint64_t v6 = v29 + (v26 << 32);
      if (a5)
      {
        *a5 = v37;
        a5[1] = 0;
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (a5)
    {
      *a5 = a1;
      a5[1] = a2;
    }
  }
  return v6;
}

double __powidf2(int a1, double a2)
{
  if (a1) {
    double v2 = a2;
  }
  else {
    double v2 = 1.0;
  }
  if ((a1 + 1) >= 3)
  {
    int v3 = a1;
    do
    {
      if (v3 >= 0) {
        int v4 = v3;
      }
      else {
        int v4 = v3 + 1;
      }
      int v3 = v4 >> 1;
      a2 = a2 * a2;
      if ((v4 >> 1)) {
        double v5 = a2;
      }
      else {
        double v5 = 1.0;
      }
      double v2 = v2 * v5;
    }
    while ((v3 + 1) > 2);
  }
  double result = 1.0 / v2;
  if (a1 >= 0) {
    return v2;
  }
  return result;
}

uint64_t __clzti2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    a1 = 0;
  }
  return __clz(a1 | a2) + ((a2 == 0) << 6);
}

uint64_t __atomic_is_lock_free(uint64_t a1, char a2)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 1;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      if (a2) {
        goto LABEL_7;
      }
      break;
    case 3:
      if ((a2 & 3) != 0) {
        goto LABEL_7;
      }
      break;
    case 7:
      if ((a2 & 7) != 0) {
        goto LABEL_7;
      }
      break;
    default:
LABEL_7:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t __atomic_load(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6 = result;
  switch((int)result)
  {
    case 1:
      if ((a4 - 1) >= 2)
      {
        if (a4 == 5) {
          unsigned __int8 explicit = atomic_load(a2);
        }
        else {
          unsigned __int8 explicit = *a2;
        }
      }
      else
      {
        unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)a2, memory_order_acquire);
      }
      *a3 = explicit;
      break;
    case 2:
      if (a2) {
        goto LABEL_11;
      }
      if ((a4 - 1) >= 2)
      {
        if (a4 == 5) {
          unsigned __int16 v8 = atomic_load((unsigned __int16 *)a2);
        }
        else {
          unsigned __int16 v8 = *(_WORD *)a2;
        }
      }
      else
      {
        unsigned __int16 v8 = atomic_load_explicit((atomic_ushort *volatile)a2, memory_order_acquire);
      }
      *(_WORD *)a3 = v8;
      break;
    case 4:
      if ((a2 & 3) != 0) {
        goto LABEL_11;
      }
      if ((a4 - 1) >= 2)
      {
        if (a4 == 5) {
          unsigned int v9 = atomic_load((unsigned int *)a2);
        }
        else {
          unsigned int v9 = *(_DWORD *)a2;
        }
      }
      else
      {
        unsigned int v9 = atomic_load_explicit((atomic_uint *volatile)a2, memory_order_acquire);
      }
      *(_DWORD *)a3 = v9;
      break;
    case 8:
      if ((a2 & 7) != 0) {
        goto LABEL_11;
      }
      if ((a4 - 1) >= 2)
      {
        if (a4 == 5) {
          unint64_t v10 = atomic_load((unint64_t *)a2);
        }
        else {
          unint64_t v10 = *(void *)a2;
        }
      }
      else
      {
        unint64_t v10 = atomic_load_explicit((atomic_ullong *volatile)a2, memory_order_acquire);
      }
      *(void *)a3 = v10;
      break;
    default:
LABEL_11:
      _os_nospin_lock_lock();
      memcpy(a3, a2, v6);
      uint64_t result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

uint64_t __atomic_store(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6 = result;
  switch((int)result)
  {
    case 1:
      unsigned __int8 v7 = *a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v7, a2);
      }
      else {
        *a2 = v7;
      }
      break;
    case 2:
      if (a2) {
        goto LABEL_14;
      }
      unsigned __int16 v8 = *(_WORD *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v8, (unsigned __int16 *)a2);
      }
      else {
        *(_WORD *)a2 = v8;
      }
      break;
    case 4:
      if ((a2 & 3) != 0) {
        goto LABEL_14;
      }
      unsigned int v9 = *(_DWORD *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v9, (unsigned int *)a2);
      }
      else {
        *(_DWORD *)a2 = v9;
      }
      break;
    case 8:
      if ((a2 & 7) != 0) {
        goto LABEL_14;
      }
      unint64_t v10 = *(void *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v10, (unint64_t *)a2);
      }
      else {
        *(void *)a2 = v10;
      }
      break;
    default:
LABEL_14:
      _os_nospin_lock_lock();
      memcpy(a2, a3, v6);
      uint64_t result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

uint64_t __atomic_compare_exchange(int a1, atomic_uchar *a2, unsigned char *a3, unsigned __int8 *a4, int a5, int a6)
{
  switch(a1)
  {
    case 1:
      unsigned __int8 v10 = *a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) < 2 || a6 != 5) {
            goto LABEL_16;
          }
          goto LABEL_35;
        case 3:
          if ((a6 - 1) < 2 || a6 == 5) {
            goto LABEL_35;
          }
          int v15 = *a3;
          int v16 = v15;
          atomic_compare_exchange_strong_explicit(a2, (unsigned __int8 *)&v16, v10, memory_order_release, memory_order_relaxed);
          break;
        case 4:
        case 5:
          goto LABEL_35;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
LABEL_35:
              int v15 = *a3;
              int v16 = v15;
              atomic_compare_exchange_strong(a2, (unsigned __int8 *)&v16, v10);
            }
            else
            {
              int v15 = *a3;
              int v16 = v15;
              atomic_compare_exchange_strong_explicit(a2, (unsigned __int8 *)&v16, v10, memory_order_relaxed, memory_order_relaxed);
            }
          }
          else
          {
LABEL_16:
            int v15 = *a3;
            int v16 = v15;
            atomic_compare_exchange_strong_explicit(a2, (unsigned __int8 *)&v16, v10, memory_order_acquire, memory_order_acquire);
          }
          break;
      }
      if (v16 == v15) {
        goto LABEL_60;
      }
      uint64_t result = 0;
      *a3 = v16;
      break;
    case 2:
      if (a2) {
        goto LABEL_8;
      }
      unsigned __int16 v11 = *(_WORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) < 2 || a6 != 5) {
            goto LABEL_30;
          }
          goto LABEL_49;
        case 3:
          if ((a6 - 1) < 2 || a6 == 5) {
            goto LABEL_49;
          }
          int v17 = *(unsigned __int16 *)a3;
          int v18 = v17;
          atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)a2, (unsigned __int16 *)&v18, v11, memory_order_release, memory_order_relaxed);
          break;
        case 4:
        case 5:
          goto LABEL_49;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
LABEL_49:
              int v17 = *(unsigned __int16 *)a3;
              int v18 = v17;
              atomic_compare_exchange_strong((atomic_ushort *volatile)a2, (unsigned __int16 *)&v18, v11);
            }
            else
            {
              int v17 = *(unsigned __int16 *)a3;
              int v18 = v17;
              atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)a2, (unsigned __int16 *)&v18, v11, memory_order_relaxed, memory_order_relaxed);
            }
          }
          else
          {
LABEL_30:
            int v17 = *(unsigned __int16 *)a3;
            int v18 = v17;
            atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)a2, (unsigned __int16 *)&v18, v11, memory_order_acquire, memory_order_acquire);
          }
          break;
      }
      if (v18 == v17) {
        goto LABEL_60;
      }
      uint64_t result = 0;
      *(_WORD *)a3 = v18;
      break;
    case 4:
      if ((a2 & 3) != 0) {
        goto LABEL_8;
      }
      unsigned int v12 = *(_DWORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) < 2 || a6 != 5) {
            goto LABEL_39;
          }
          goto LABEL_54;
        case 3:
          if ((a6 - 1) < 2 || a6 == 5) {
            goto LABEL_54;
          }
          int v19 = *(_DWORD *)a3;
          int v20 = *(_DWORD *)a3;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v20, v12, memory_order_release, memory_order_relaxed);
          break;
        case 4:
        case 5:
          goto LABEL_54;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
LABEL_54:
              int v19 = *(_DWORD *)a3;
              int v20 = *(_DWORD *)a3;
              atomic_compare_exchange_strong((atomic_uint *volatile)a2, (unsigned int *)&v20, v12);
            }
            else
            {
              int v19 = *(_DWORD *)a3;
              int v20 = *(_DWORD *)a3;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v20, v12, memory_order_relaxed, memory_order_relaxed);
            }
          }
          else
          {
LABEL_39:
            int v19 = *(_DWORD *)a3;
            int v20 = *(_DWORD *)a3;
            atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v20, v12, memory_order_acquire, memory_order_acquire);
          }
          break;
      }
      if (v20 == v19) {
        goto LABEL_60;
      }
      uint64_t result = 0;
      *(_DWORD *)a3 = v20;
      break;
    case 8:
      if ((a2 & 7) != 0) {
        goto LABEL_8;
      }
      unint64_t v14 = *(void *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) < 2 || a6 != 5) {
            goto LABEL_44;
          }
          goto LABEL_58;
        case 3:
          if ((a6 - 1) < 2 || a6 == 5) {
            goto LABEL_58;
          }
          uint64_t v21 = *(void *)a3;
          uint64_t v22 = *(void *)a3;
          atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a2, (unint64_t *)&v22, v14, memory_order_release, memory_order_relaxed);
          break;
        case 4:
        case 5:
          goto LABEL_58;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
LABEL_58:
              uint64_t v21 = *(void *)a3;
              uint64_t v22 = *(void *)a3;
              atomic_compare_exchange_strong((atomic_ullong *volatile)a2, (unint64_t *)&v22, v14);
            }
            else
            {
              uint64_t v21 = *(void *)a3;
              uint64_t v22 = *(void *)a3;
              atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a2, (unint64_t *)&v22, v14, memory_order_relaxed, memory_order_relaxed);
            }
          }
          else
          {
LABEL_44:
            uint64_t v21 = *(void *)a3;
            uint64_t v22 = *(void *)a3;
            atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a2, (unint64_t *)&v22, v14, memory_order_acquire, memory_order_acquire);
          }
          break;
      }
      if (v22 == v21) {
        goto LABEL_60;
      }
      uint64_t result = 0;
      *(void *)a3 = v22;
      break;
    default:
LABEL_8:
      _os_nospin_lock_lock();
      if (!memcmp(a2, a3, a1))
      {
        memcpy(a2, a4, a1);
        _os_nospin_lock_unlock();
LABEL_60:
        uint64_t result = 1;
      }
      else
      {
        memcpy(a3, a2, a1);
        _os_nospin_lock_unlock();
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

uint64_t __atomic_exchange(uint64_t result, atomic_uchar *a2, unsigned int *a3, unsigned __int8 *a4, int a5)
{
  int v8 = result;
  switch((int)result)
  {
    case 1:
      unsigned int v9 = *(unsigned __int8 *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          unsigned __int8 v10 = atomic_exchange_explicit(a2, v9, memory_order_acquire);
          break;
        case 3:
          unsigned __int8 v10 = atomic_exchange_explicit(a2, v9, memory_order_release);
          break;
        case 4:
        case 5:
          unsigned __int8 v10 = atomic_exchange(a2, v9);
          break;
        default:
          unsigned __int8 v10 = __swp(v9, (unsigned int *)a2);
          break;
      }
      *a4 = v10;
      break;
    case 2:
      if (a2) {
        goto LABEL_11;
      }
      unsigned int v11 = *(unsigned __int16 *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          unsigned __int16 v12 = atomic_exchange_explicit((atomic_ushort *volatile)a2, v11, memory_order_acquire);
          break;
        case 3:
          unsigned __int16 v12 = atomic_exchange_explicit((atomic_ushort *volatile)a2, v11, memory_order_release);
          break;
        case 4:
        case 5:
          unsigned __int16 v12 = atomic_exchange((atomic_ushort *volatile)a2, v11);
          break;
        default:
          unsigned __int16 v12 = __swp(v11, (unsigned int *)a2);
          break;
      }
      *(_WORD *)a4 = v12;
      break;
    case 4:
      if ((a2 & 3) != 0) {
        goto LABEL_11;
      }
      unsigned int v13 = *a3;
      switch(a5)
      {
        case 1:
        case 2:
          unsigned int v14 = atomic_exchange_explicit((atomic_uint *volatile)a2, v13, memory_order_acquire);
          break;
        case 3:
          unsigned int v14 = atomic_exchange_explicit((atomic_uint *volatile)a2, v13, memory_order_release);
          break;
        case 4:
        case 5:
          unsigned int v14 = atomic_exchange((atomic_uint *volatile)a2, v13);
          break;
        default:
          unsigned int v14 = __swp(v13, (unsigned int *)a2);
          break;
      }
      *(_DWORD *)a4 = v14;
      break;
    case 8:
      if ((a2 & 7) != 0) {
        goto LABEL_11;
      }
      unint64_t v15 = *(void *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          unint64_t v16 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v15, memory_order_acquire);
          break;
        case 3:
          unint64_t v16 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v15, memory_order_release);
          break;
        case 4:
        case 5:
          unint64_t v16 = atomic_exchange((atomic_ullong *volatile)a2, v15);
          break;
        default:
          unint64_t v16 = __swp(v15, (unsigned int *)a2);
          break;
      }
      *(void *)a4 = v16;
      break;
    default:
LABEL_11:
      _os_nospin_lock_lock();
      memcpy(a4, a2, v8);
      memcpy(a2, a3, v8);
      uint64_t result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

unsigned __int8 __atomic_load_1(atomic_uchar *a1, int a2)
{
  if ((a2 - 1) < 2) {
    return atomic_load_explicit(a1, memory_order_acquire);
  }
  if (a2 == 5) {
    return atomic_load((unsigned __int8 *)a1);
  }
  return *a1;
}

unsigned __int16 __atomic_load_2(atomic_ushort *a1, int a2)
{
  if ((a2 - 1) < 2) {
    return atomic_load_explicit(a1, memory_order_acquire);
  }
  if (a2 == 5) {
    return atomic_load((unsigned __int16 *)a1);
  }
  return *a1;
}

uint64_t __atomic_load_4(atomic_uint *a1, int a2)
{
  if ((a2 - 1) < 2) {
    return atomic_load_explicit(a1, memory_order_acquire);
  }
  if (a2 == 5) {
    return atomic_load((unsigned int *)a1);
  }
  return *a1;
}

unint64_t __atomic_load_8(atomic_ullong *a1, int a2)
{
  if ((a2 - 1) < 2) {
    return atomic_load_explicit(a1, memory_order_acquire);
  }
  if (a2 == 5) {
    return atomic_load((unint64_t *)a1);
  }
  return *a1;
}

unsigned __int8 *__atomic_store_1(unsigned __int8 *result, unsigned __int8 a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unsigned __int16 *__atomic_store_2(unsigned __int16 *result, unsigned __int16 a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unsigned int *__atomic_store_4(unsigned int *result, unsigned int a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unint64_t *__atomic_store_8(unint64_t *result, unint64_t a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

atomic_uchar *__atomic_exchange_1(atomic_uchar *result, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = (atomic_uchar *)atomic_exchange_explicit(result, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = (atomic_uchar *)atomic_exchange_explicit(result, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = (atomic_uchar *)atomic_exchange(result, a2);
      break;
    default:
      __swp(result, (unsigned int *)result);
      break;
  }
  return result;
}

atomic_ushort *__atomic_exchange_2(atomic_ushort *result, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = (atomic_ushort *)atomic_exchange_explicit(result, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = (atomic_ushort *)atomic_exchange_explicit(result, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = (atomic_ushort *)atomic_exchange(result, a2);
      break;
    default:
      __swp(result, (unsigned int *)result);
      break;
  }
  return result;
}

atomic_uint *__atomic_exchange_4(atomic_uint *result, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = (atomic_uint *)atomic_exchange_explicit(result, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = (atomic_uint *)atomic_exchange_explicit(result, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = (atomic_uint *)atomic_exchange(result, a2);
      break;
    default:
      __swp(result, (unsigned int *)result);
      break;
  }
  return result;
}

atomic_ullong *__atomic_exchange_8(atomic_ullong *result, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = (atomic_ullong *)atomic_exchange_explicit(result, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = (atomic_ullong *)atomic_exchange_explicit(result, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = (atomic_ullong *)atomic_exchange(result, a2);
      break;
    default:
      __swp(result, (unsigned int *)result);
      break;
  }
  return result;
}

uint64_t __atomic_compare_exchange_1(atomic_uchar *a1, unsigned char *a2, unsigned __int8 a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) < 2 || a5 != 5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if ((a5 - 1) < 2 || a5 == 5) {
        goto LABEL_11;
      }
      int v5 = *a2;
      int v6 = v5;
      atomic_compare_exchange_strong_explicit(a1, (unsigned __int8 *)&v6, a3, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      goto LABEL_11;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
LABEL_11:
          int v5 = *a2;
          int v6 = v5;
          atomic_compare_exchange_strong(a1, (unsigned __int8 *)&v6, a3);
        }
        else
        {
          int v5 = *a2;
          int v6 = v5;
          atomic_compare_exchange_strong_explicit(a1, (unsigned __int8 *)&v6, a3, memory_order_relaxed, memory_order_relaxed);
        }
      }
      else
      {
LABEL_9:
        int v5 = *a2;
        int v6 = v5;
        atomic_compare_exchange_strong_explicit(a1, (unsigned __int8 *)&v6, a3, memory_order_acquire, memory_order_acquire);
      }
      break;
  }
  if (v6 == v5) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

uint64_t __atomic_compare_exchange_2(atomic_ushort *a1, _WORD *a2, unsigned __int16 a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) < 2 || a5 != 5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if ((a5 - 1) < 2 || a5 == 5) {
        goto LABEL_11;
      }
      int v5 = (unsigned __int16)*a2;
      int v6 = v5;
      atomic_compare_exchange_strong_explicit(a1, (unsigned __int16 *)&v6, a3, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      goto LABEL_11;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
LABEL_11:
          int v5 = (unsigned __int16)*a2;
          int v6 = v5;
          atomic_compare_exchange_strong(a1, (unsigned __int16 *)&v6, a3);
        }
        else
        {
          int v5 = (unsigned __int16)*a2;
          int v6 = v5;
          atomic_compare_exchange_strong_explicit(a1, (unsigned __int16 *)&v6, a3, memory_order_relaxed, memory_order_relaxed);
        }
      }
      else
      {
LABEL_9:
        int v5 = (unsigned __int16)*a2;
        int v6 = v5;
        atomic_compare_exchange_strong_explicit(a1, (unsigned __int16 *)&v6, a3, memory_order_acquire, memory_order_acquire);
      }
      break;
  }
  if (v6 == v5) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

uint64_t __atomic_compare_exchange_4(atomic_uint *a1, int *a2, unsigned int a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) < 2 || a5 != 5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if ((a5 - 1) < 2 || a5 == 5) {
        goto LABEL_11;
      }
      int v5 = *a2;
      int v6 = *a2;
      atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v6, a3, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      goto LABEL_11;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
LABEL_11:
          int v5 = *a2;
          int v6 = *a2;
          atomic_compare_exchange_strong(a1, (unsigned int *)&v6, a3);
        }
        else
        {
          int v5 = *a2;
          int v6 = *a2;
          atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v6, a3, memory_order_relaxed, memory_order_relaxed);
        }
      }
      else
      {
LABEL_9:
        int v5 = *a2;
        int v6 = *a2;
        atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v6, a3, memory_order_acquire, memory_order_acquire);
      }
      break;
  }
  if (v6 == v5) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

uint64_t __atomic_compare_exchange_8(atomic_ullong *a1, uint64_t *a2, unint64_t a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) < 2 || a5 != 5) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if ((a5 - 1) < 2 || a5 == 5) {
        goto LABEL_11;
      }
      uint64_t v5 = *a2;
      uint64_t v6 = *a2;
      atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v6, a3, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      goto LABEL_11;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
LABEL_11:
          uint64_t v5 = *a2;
          uint64_t v6 = *a2;
          atomic_compare_exchange_strong(a1, (unint64_t *)&v6, a3);
        }
        else
        {
          uint64_t v5 = *a2;
          uint64_t v6 = *a2;
          atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v6, a3, memory_order_relaxed, memory_order_relaxed);
        }
      }
      else
      {
LABEL_9:
        uint64_t v5 = *a2;
        uint64_t v6 = *a2;
        atomic_compare_exchange_strong_explicit(a1, (unint64_t *)&v6, a3, memory_order_acquire, memory_order_acquire);
      }
      break;
  }
  if (v6 == v5) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = v6;
  return result;
}

uint64_t __atomic_fetch_add_1(atomic_uchar *a1, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_add_2(atomic_ushort *a1, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_add_4(atomic_uint *a1, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

unint64_t __atomic_fetch_add_8(atomic_ullong *a1, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      unint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      unint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t result = atomic_fetch_add(a1, a2);
      break;
    default:
      unint64_t result = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_sub_1(atomic_uchar *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, -a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_sub_2(atomic_ushort *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, -a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_sub_4(atomic_uint *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_add(a1, -a2);
      break;
    default:
      uint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_relaxed);
      break;
  }
  return result;
}

unint64_t __atomic_fetch_sub_8(atomic_ullong *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      unint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_acquire);
      break;
    case 3:
      unint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t result = atomic_fetch_add(a1, -a2);
      break;
    default:
      unint64_t result = atomic_fetch_add_explicit(a1, -a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_and_1(atomic_uchar *a1, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_and(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_and_2(atomic_ushort *a1, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_and(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_and_4(atomic_uint *a1, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_and(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

unint64_t __atomic_fetch_and_8(atomic_ullong *a1, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      unint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      unint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t result = atomic_fetch_and(a1, a2);
      break;
    default:
      unint64_t result = atomic_fetch_and_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_or_1(atomic_uchar *a1, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_or(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_or_2(atomic_ushort *a1, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_or(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_or_4(atomic_uint *a1, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_or(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

unint64_t __atomic_fetch_or_8(atomic_ullong *a1, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      unint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      unint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t result = atomic_fetch_or(a1, a2);
      break;
    default:
      unint64_t result = atomic_fetch_or_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_xor_1(atomic_uchar *a1, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_xor(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_xor_2(atomic_ushort *a1, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_xor(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

uint64_t __atomic_fetch_xor_4(atomic_uint *a1, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      uint64_t result = atomic_fetch_xor(a1, a2);
      break;
    default:
      uint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

unint64_t __atomic_fetch_xor_8(atomic_ullong *a1, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      unint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_acquire);
      break;
    case 3:
      unint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t result = atomic_fetch_xor(a1, a2);
      break;
    default:
      unint64_t result = atomic_fetch_xor_explicit(a1, a2, memory_order_relaxed);
      break;
  }
  return result;
}

void atomic_flag_clear(atomic_flag *a1)
{
}

void atomic_flag_clear_explicit(atomic_flag *a1, memory_order a2)
{
  if (a2 == memory_order_release || a2 == memory_order_seq_cst) {
    atomic_store(0, (unsigned __int8 *)a1);
  }
  else {
    a1->_Value = 0;
  }
}

BOOL atomic_flag_test_and_set(atomic_flag *a1)
{
  return atomic_exchange(&a1->_Value, 1u) & 1;
}

BOOL atomic_flag_test_and_set_explicit(atomic_flag *a1, memory_order a2)
{
  switch(a2)
  {
    case memory_order_consume:
    case memory_order_acquire:
      unsigned __int8 v2 = atomic_exchange_explicit(&a1->_Value, 1u, memory_order_acquire);
      break;
    case memory_order_release:
      unsigned __int8 v2 = atomic_exchange_explicit(&a1->_Value, 1u, memory_order_release);
      break;
    case memory_order_acq_rel:
    case memory_order_seq_cst:
      unsigned __int8 v2 = atomic_exchange(&a1->_Value, 1u);
      break;
    default:
      unsigned __int8 v2 = __swp(1u, (unsigned int *)a1);
      break;
  }
  return v2 & 1;
}

void atomic_thread_fence(memory_order a1)
{
  switch(a1)
  {
    case memory_order_consume:
    case memory_order_acquire:
      __dmb(9u);
      break;
    case memory_order_release:
    case memory_order_acq_rel:
    case memory_order_seq_cst:
      __dmb(0xBu);
      break;
    default:
      return;
  }
}

unint64_t __divti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 ^ (a2 >> 63);
  uint64_t v5 = a4 >> 63;
  unint64_t v6 = v4 + ((unint64_t)a2 >> 63);
  if (__CFADD__(v4, (unint64_t)a2 >> 63)) {
    unint64_t v7 = (a2 ^ (a2 >> 63)) + 1;
  }
  else {
    unint64_t v7 = a2 ^ (a2 >> 63);
  }
  uint64_t v8 = a3 ^ (a4 >> 63);
  unint64_t v9 = v8 + ((unint64_t)a4 >> 63);
  if (__CFADD__(v8, (unint64_t)a4 >> 63)) {
    unint64_t v10 = (a4 ^ (a4 >> 63)) + 1;
  }
  else {
    unint64_t v10 = a4 ^ (a4 >> 63);
  }
  return (__udivmodti4(v6, v7, v9, v10, 0) ^ v5 ^ (a2 >> 63)) - (v5 ^ (a2 >> 63));
}

float __extendhfsf2(__int16 a1)
{
  unsigned int v1 = a1 & 0x7FFF;
  unsigned int v2 = __clz(v1);
  int v3 = (v1 << (v2 - 8)) ^ 0x800000 | (1124073472 - (v2 << 23));
  if ((a1 & 0x7FFF) == 0) {
    int v3 = 0;
  }
  if ((unsigned __int16)(a1 & 0x7FFF) >> 10 >= 0x1Fu) {
    int v4 = (v1 << 13) | 0x7F800000;
  }
  else {
    int v4 = v3;
  }
  int v5 = (v1 << 13) + 939524096;
  if (((a1 & 0x7FFFu) - 1024) >> 11 > 0xE) {
    int v5 = v4;
  }
  LODWORD(result) = v5 | ((a1 & 0x8000) << 16);
  return result;
}

uint64_t __gcc_personality_v0(int a1, char a2, int a3, uint64_t a4, _Unwind_Context *context)
{
  if (a2) {
    return 8;
  }
  uintptr_t LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData) {
    return 8;
  }
  uint64_t v8 = (unsigned __int8 *)LanguageSpecificData;
  uintptr_t IP = _Unwind_GetIP(context);
  uintptr_t RegionStart = _Unwind_GetRegionStart(context);
  if (RegionStart)
  {
    uintptr_t v41 = RegionStart;
    uint64_t v11 = ~RegionStart;
  }
  else
  {
    uintptr_t v41 = 0;
    uint64_t v11 = -1;
  }
  unsigned int v15 = *v8;
  unsigned int v14 = (unsigned __int16 *)(v8 + 1);
  unsigned int v13 = v15;
  v42 = v14;
  if (v15 != 255)
  {
    readEncodedPointer(&v42, v13);
    unsigned int v14 = v42;
  }
  int v17 = *(unsigned __int8 *)v14;
  unint64_t v16 = (unsigned __int16 *)((char *)v14 + 1);
  v42 = v16;
  if (v17 != 255)
  {
    do
    {
      int v18 = *(char *)v16;
      unint64_t v16 = (unsigned __int16 *)((char *)v16 + 1);
    }
    while (v18 < 0);
  }
  unsigned int v19 = 0;
  int v20 = 0;
  uintptr_t v21 = v11 + IP;
  uint64_t v22 = (unsigned __int16 *)((char *)v16 + 1);
  v42 = (unsigned __int16 *)((char *)v16 + 1);
  unsigned int v23 = *(unsigned __int8 *)v16;
  do
  {
    char v24 = *(unsigned char *)v22;
    uint64_t v22 = (unsigned __int16 *)((char *)v22 + 1);
    v19 |= (v24 & 0x7F) << v20;
    v20 += 7;
  }
  while (v24 < 0);
  v40 = v22;
  if (!v19) {
    return 8;
  }
  uint64_t v25 = (unsigned __int16 *)((char *)v22 + v19);
  while (1)
  {
    unint64_t v26 = readEncodedPointer(&v40, v23);
    if (v26) {
      unint64_t v27 = v26;
    }
    else {
      unint64_t v27 = 0;
    }
    uintptr_t v39 = v27;
    unint64_t v28 = readEncodedPointer(&v40, v23);
    if (v28) {
      unint64_t v29 = v28;
    }
    else {
      unint64_t v29 = 0;
    }
    unint64_t v38 = v29;
    unint64_t v30 = readEncodedPointer(&v40, v23);
    if (v30) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = 0;
    }
    unint64_t v37 = v31;
    unint64_t v32 = v40;
    do
    {
      int v33 = *(char *)v32;
      unint64_t v32 = (unsigned __int16 *)((char *)v32 + 1);
    }
    while (v33 < 0);
    v40 = v32;
    if (!v31) {
      goto LABEL_32;
    }
    if (v39)
    {
      uintptr_t v34 = v39;
      if (v39 > v21) {
        goto LABEL_32;
      }
    }
    else
    {
      uintptr_t v34 = 0;
    }
    if (v21 < v38 + v34) {
      break;
    }
LABEL_32:
    if (v32 >= v25) {
      return 8;
    }
  }
  MEMORY[0x21055C800](context, 0, a4);
  MEMORY[0x21055C800](context, 1, 0);
  if (v41) {
    uintptr_t v35 = v41;
  }
  else {
    uintptr_t v35 = 0;
  }
  uintptr_t v36 = v37 + v35;
  _Unwind_GetGR(context, -2);
  _Unwind_SetIP(context, v36);
  return 7;
}

unint64_t readEncodedPointer(unsigned __int16 **a1, unsigned int a2)
{
  if (a2 == 255) {
    return 0;
  }
  unsigned int v2 = *a1;
  switch(a2 & 0xF)
  {
    case 0u:
    case 4u:
    case 0xCu:
      int v4 = v2 + 4;
      unint64_t v3 = *(void *)v2;
      break;
    case 1u:
      unint64_t v3 = 0;
      int v5 = 0;
      int v4 = *a1;
      do
      {
        char v6 = *(unsigned char *)v4;
        int v4 = (unsigned __int16 *)((char *)v4 + 1);
        v3 |= (v6 & 0x7F) << v5;
        v5 += 7;
      }
      while (v6 < 0);
      break;
    case 2u:
      int v4 = v2 + 1;
      unint64_t v3 = *v2;
      break;
    case 3u:
      int v4 = v2 + 2;
      unint64_t v3 = *(unsigned int *)v2;
      break;
    case 0xAu:
      int v4 = v2 + 1;
      unint64_t v3 = (__int16)*v2;
      break;
    case 0xBu:
      int v4 = v2 + 2;
      unint64_t v3 = *(int *)v2;
      break;
    default:
      __compilerrt_abort_impl("/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c", 121, "readEncodedPointer");
  }
  int v7 = (a2 >> 4) & 7;
  if (v7)
  {
    if (v7 != 1) {
      __compilerrt_abort_impl("/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c", 139, "readEncodedPointer");
    }
    v3 += (unint64_t)v2;
  }
  if ((a2 & 0x80) != 0) {
    unint64_t v3 = *(void *)v3;
  }
  *a1 = v4;
  return v3;
}

void __compilerrt_abort_impl(char *a1, int a2, char *a3)
{
}

unint64_t __modti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 ^ (a4 >> 63);
  unint64_t v6 = v5 + ((unint64_t)a4 >> 63);
  if (__CFADD__(v5, (unint64_t)a4 >> 63)) {
    unint64_t v7 = (a4 ^ (a4 >> 63)) + 1;
  }
  else {
    unint64_t v7 = a4 ^ (a4 >> 63);
  }
  uint64_t v8 = a1 ^ (a2 >> 63);
  unint64_t v9 = v8 + ((unint64_t)a2 >> 63);
  if (__CFADD__(v8, (unint64_t)a2 >> 63)) {
    unint64_t v10 = (a2 ^ (a2 >> 63)) + 1;
  }
  else {
    unint64_t v10 = a2 ^ (a2 >> 63);
  }
  v12[0] = 0;
  v12[1] = 0;
  __udivmodti4(v9, v10, v6, v7, v12);
  return (v12[0] ^ (a2 >> 63)) + ((unint64_t)a2 >> 63);
}

double __muldc3(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

float __mulsc3(float a1, float a2, float a3, float a4)
{
  return (float)(a1 * a3) - (float)(a2 * a4);
}

float __powisf2(int a1, float a2)
{
  if (a1) {
    float v2 = a2;
  }
  else {
    float v2 = 1.0;
  }
  if ((a1 + 1) >= 3)
  {
    int v3 = a1;
    do
    {
      if (v3 >= 0) {
        int v4 = v3;
      }
      else {
        int v4 = v3 + 1;
      }
      int v3 = v4 >> 1;
      a2 = a2 * a2;
      if ((v4 >> 1)) {
        float v5 = a2;
      }
      else {
        float v5 = 1.0;
      }
      float v2 = v2 * v5;
    }
    while ((v3 + 1) > 2);
  }
  float result = 1.0 / v2;
  if (a1 >= 0) {
    return v2;
  }
  return result;
}

uint64_t __truncdfhf2(double a1)
{
  unint64_t v1 = *(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 0x3F10000000000000 >= (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL)
                                                                        - 0x40F0000000000000)
  {
    if (v1 < 0x7FF0000000000001)
    {
      unint64_t v4 = v1 >> 52;
      if (v4 <= 0x40E)
      {
        if (v4 >= 0x3BD)
        {
          char v5 = -15 - v4;
          unint64_t v6 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
          BOOL v7 = v6 << (v4 + 79) != 0;
          unint64_t v8 = v6 >> v5;
          unint64_t v9 = v8 >> 42;
          unint64_t v10 = v8 & 0x3FFFFFFFFFFLL | v7;
          int v11 = ((v8 >> 42) & 1) + (v8 >> 42);
          if (v10 != 0x20000000000) {
            LOWORD(v11) = v9;
          }
          if (v10 >= 0x20000000001) {
            LOWORD(v2) = v9 + 1;
          }
          else {
            LOWORD(v2) = v11;
          }
        }
        else
        {
          LOWORD(v2) = 0;
        }
      }
      else
      {
        LOWORD(v2) = 31744;
      }
    }
    else
    {
      LODWORD(v2) = (*(void *)&a1 >> 42) & 0x1FF | 0x7E00;
    }
  }
  else
  {
    uint64_t v2 = *(void *)&a1 >> 42;
    int v3 = (*(void *)&a1 >> 42) + 0x4000;
    if ((*(void *)&a1 & 0x3FFFFFFFFFFLL) == 0x20000000000) {
      v3 += (*(void *)&a1 >> 42) & 1;
    }
    LOWORD(v2) = v2 + 16385;
    if ((*(void *)&a1 & 0x3FFFFFFFFFFuLL) < 0x20000000001) {
      LOWORD(v2) = v3;
    }
  }
  return (unsigned __int16)(v2 | HIWORD(a1) & 0x8000);
}

uint64_t __truncsfhf2(float a1)
{
  unsigned int v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) - 947912704 >= (LODWORD(a1) & 0x7FFFFFFFu) - 1199570944)
  {
    if (v1 < 0x7F800001)
    {
      unsigned int v5 = v1 >> 23;
      unsigned int v6 = HIBYTE(v1);
      unsigned int v7 = LODWORD(a1) & 0x7FFFFF | 0x800000;
      BOOL v8 = v7 << ((v1 >> 23) - 81) != 0;
      unsigned int v9 = v7 >> (113 - (v1 >> 23));
      unsigned int v10 = v9 >> 13;
      unsigned int v11 = v9 & 0x1FFF | v8;
      int v4 = ((v9 >> 13) & 1) + (v9 >> 13);
      if (v11 != 4096) {
        LOWORD(v4) = v10;
      }
      if (v11 > 0x1000) {
        LOWORD(v4) = v10 + 1;
      }
      if (v6 < 0x2D) {
        LOWORD(v4) = 0;
      }
      if (v5 > 0x8E) {
        LOWORD(v4) = 31744;
      }
    }
    else
    {
      int v4 = (LODWORD(a1) >> 13) & 0x1FF | 0x7E00;
    }
  }
  else
  {
    __int16 v2 = LODWORD(a1) >> 13;
    __int16 v3 = v2 + 0x4000;
    if ((LOWORD(a1) & 0x1FFF) == 0x1000) {
      __int16 v3 = ((LODWORD(a1) >> 13) & 1) + v2 + 0x4000;
    }
    if ((LOWORD(a1) & 0x1FFFu) > 0x1000) {
      LOWORD(v4) = v2 + 16385;
    }
    else {
      LOWORD(v4) = v3;
    }
  }
  return (unsigned __int16)(v4 | (LODWORD(a1) >> 31 << 15));
}

unint64_t __umodti3(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  v5[0] = 0;
  v5[1] = 0;
  __udivmodti4(a1, a2, a3, a4, v5);
  return v5[0];
}

uintptr_t _Unwind_GetGR(_Unwind_Context *context, int index)
{
  return MEMORY[0x270EDDD70](context, *(void *)&index);
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x270EDDD78](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x270EDDD80](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x270EDDD88](context);
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x270EDDBA0]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x270EDDBA8]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDD180](__s1, __s2, __n);
}